DELIMITER ;;
use db_prod;;

# 事务_产品_账户_获取机构业务记录编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_GetCoBusiRecordNo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_GetCoBusiRecordNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_record_no_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_curr_no bigint
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_record_no_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_record_no_type = p_record_no_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_no = 0;

    
    label_pro:BEGIN
    
    #为防止错误，对编号类型进行检查

    /* [检查报错返回][@编号类型# <> 《编号类型-机构编号》 and @编号类型# <> 《编号类型-产品编号》 and @编号类型# <> 《编号类型-资产账户编号》 and @编号类型# <> 《编号类型-操作员编号》 and @编号类型# <> 《编号类型-交易组编号》 and @编号类型# <> 《编号类型-交易通道编号》 and @编号类型# <> 《编号类型-银行账户编号》 and @编号类型# <> 《编号类型-交易员编号》 and @编号类型# <> 《编号类型-费用模板编号》 and @编号类型# <> 《编号类型-角色编号》][1][@编号类型#] */
    if v_record_no_type <> 1 and v_record_no_type <> 2 and v_record_no_type <> 3 and v_record_no_type <> 10 and v_record_no_type <> 12 and v_record_no_type <> 4 and v_record_no_type <> 5 and v_record_no_type <> 11 and v_record_no_type <> 13 and v_record_no_type <> 14 then
        
        SET v_error_code = "prodT.1.901.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("编号类型=",v_record_no_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("编号类型=",v_record_no_type);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_获取机构业务记录编号】*/
        call db_prod.pra_pdacco_GetCoBusiRecordNo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_record_no_type,
            v_error_code,
            v_error_info,
            v_curr_no);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.901.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取机构业务记录编号出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_curr_no = v_curr_no;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_新增产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_AddProductInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_AddProductInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_pd_name varchar(64),
    IN p_pd_flname varchar(255),
    IN p_fund_reg_code varchar(16),
    IN p_pd_manager varchar(32),
    IN p_found_date int,
    IN p_pd_type int,
    IN p_apply_currency varchar(3),
    IN p_crncy_type varchar(3),
    IN p_first_asset decimal(18,4),
    IN p_first_amt decimal(18,4),
    IN p_pd_all_share decimal(18,2),
    IN p_curr_share decimal(18,2),
    IN p_pre_share decimal(18,2),
    IN p_his_max_per_nav decimal(18,4),
    IN p_pre_nav decimal(18,4),
    IN p_coust_full_name varchar(255),
    IN p_coust_acco varchar(16),
    IN p_coust_acco_name varchar(64),
    IN p_warn_posi_value decimal(18,4),
    IN p_close_posi_value decimal(18,4),
    IN p_target_posi_ratio decimal(18,4),
    IN p_beta_coeffi decimal(18,12),
    IN p_custom_pd_class varchar(255),
    IN p_remark_info varchar(255),
    IN p_index_value int,
    IN p_cost_calc_type int,
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
    IN p_busi_config_str varchar(64),
    IN p_comm_appr_oper int,
    IN p_market_price_ratio decimal(18,12),
    IN p_forbid_order_dir varchar(64),
    IN p_comm_no_limit_price_ratio decimal(18,12),
    IN p_menu_no int,
    IN p_pd_qty_max int,
    IN p_hk_asset_calc_rate int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_no int,
    OUT p_pd_cost_calc_type int,
    OUT p_pd_status varchar(2),
    OUT p_asac_update_times int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
    declare v_pd_name varchar(64);
    declare v_pd_flname varchar(255);
    declare v_fund_reg_code varchar(16);
    declare v_pd_manager varchar(32);
    declare v_found_date int;
    declare v_pd_type int;
    declare v_apply_currency varchar(3);
    declare v_crncy_type varchar(3);
    declare v_first_asset decimal(18,4);
    declare v_first_amt decimal(18,4);
    declare v_pd_all_share decimal(18,2);
    declare v_curr_share decimal(18,2);
    declare v_pre_share decimal(18,2);
    declare v_his_max_per_nav decimal(18,4);
    declare v_pre_nav decimal(18,4);
    declare v_coust_full_name varchar(255);
    declare v_coust_acco varchar(16);
    declare v_coust_acco_name varchar(64);
    declare v_warn_posi_value decimal(18,4);
    declare v_close_posi_value decimal(18,4);
    declare v_target_posi_ratio decimal(18,4);
    declare v_beta_coeffi decimal(18,12);
    declare v_custom_pd_class varchar(255);
    declare v_remark_info varchar(255);
    declare v_index_value int;
    declare v_cost_calc_type int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_config_str varchar(64);
    declare v_comm_appr_oper int;
    declare v_market_price_ratio decimal(18,12);
    declare v_forbid_order_dir varchar(64);
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_menu_no int;
    declare v_pd_qty_max int;
    declare v_hk_asset_calc_rate int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_pd_cost_calc_type int;
    declare v_pd_status varchar(2);
    declare v_asac_update_times int;
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_pd_update_times int;
    declare v_update_times int;
    declare v_oper_remark_info varchar(255);
    declare v_pd_cash_id bigint;
    declare v_pd_first_amt decimal(18,4);
    declare v_pd_curr_amt decimal(18,4);
    declare v_pd_dist_amt decimal(18,4);
    declare v_pd_auth_amt decimal(18,4);
    declare v_pd_amt_check_diff decimal(18,4);
    declare v_pd_pre_settle_amt decimal(18,4);
    declare v_pd_total_cash_divide decimal(18,4);
    declare v_pd_total_pre_fee decimal(18,4);
    declare v_pd_total_rece_amt decimal(18,4);
    declare v_pd_total_payab_amt decimal(18,4);
    declare v_pd_intrst_cacl_amt decimal(18,4);
    declare v_pd_pre_entry_intrst_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_pd_name = p_pd_name;
    SET v_pd_flname = p_pd_flname;
    SET v_fund_reg_code = p_fund_reg_code;
    SET v_pd_manager = p_pd_manager;
    SET v_found_date = p_found_date;
    SET v_pd_type = p_pd_type;
    SET v_apply_currency = p_apply_currency;
    SET v_crncy_type = p_crncy_type;
    SET v_first_asset = p_first_asset;
    SET v_first_amt = p_first_amt;
    SET v_pd_all_share = p_pd_all_share;
    SET v_curr_share = p_curr_share;
    SET v_pre_share = p_pre_share;
    SET v_his_max_per_nav = p_his_max_per_nav;
    SET v_pre_nav = p_pre_nav;
    SET v_coust_full_name = p_coust_full_name;
    SET v_coust_acco = p_coust_acco;
    SET v_coust_acco_name = p_coust_acco_name;
    SET v_warn_posi_value = p_warn_posi_value;
    SET v_close_posi_value = p_close_posi_value;
    SET v_target_posi_ratio = p_target_posi_ratio;
    SET v_beta_coeffi = p_beta_coeffi;
    SET v_custom_pd_class = p_custom_pd_class;
    SET v_remark_info = p_remark_info;
    SET v_index_value = p_index_value;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_busi_config_str = p_busi_config_str;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_forbid_order_dir = p_forbid_order_dir;
    SET v_comm_no_limit_price_ratio = p_comm_no_limit_price_ratio;
    SET v_menu_no = p_menu_no;
    SET v_pd_qty_max = p_pd_qty_max;
    SET v_hk_asset_calc_rate = p_hk_asset_calc_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_pd_cost_calc_type = 0;
    SET v_pd_status = "0";
    SET v_asac_update_times = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_pd_update_times = 0;
    SET v_update_times = 1;
    SET v_oper_remark_info = " ";
    SET v_pd_cash_id = 0;
    SET v_pd_first_amt = 0;
    SET v_pd_curr_amt = 0;
    SET v_pd_dist_amt = 0;
    SET v_pd_auth_amt = 0;
    SET v_pd_amt_check_diff = 0;
    SET v_pd_pre_settle_amt = 0;
    SET v_pd_total_cash_divide = 0;
    SET v_pd_total_pre_fee = 0;
    SET v_pd_total_rece_amt = 0;
    SET v_pd_total_payab_amt = 0;
    SET v_pd_intrst_cacl_amt = 0;
    SET v_pd_pre_entry_intrst_amt = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_检查产品存在】*/
    call db_prod.pra_pdacco_CheckProductExists(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品存在出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @编号类型# = 《编号类型-产品编号》; */
    set v_record_no_type = 2;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_获取机构业务记录编号】*/
        call db_prod.pra_pdacco_GetCoBusiRecordNo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_record_no_type,
            v_error_code,
            v_error_info,
            v_curr_no);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取机构业务记录编号出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @产品编号# = @当前编号#; */
    set v_pd_no = v_curr_no;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_新增产品信息】*/
        call db_prod.pra_pdacco_AddProductInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pd_no,
            v_co_no,
            v_pd_code,
            v_pd_name,
            v_pd_flname,
            v_fund_reg_code,
            v_pd_manager,
            v_found_date,
            v_pd_type,
            v_apply_currency,
            v_crncy_type,
            v_first_asset,
            v_first_amt,
            v_pd_all_share,
            v_curr_share,
            v_pre_share,
            v_his_max_per_nav,
            v_pre_nav,
            v_coust_full_name,
            v_coust_acco,
            v_coust_acco_name,
            v_warn_posi_value,
            v_close_posi_value,
            v_target_posi_ratio,
            v_beta_coeffi,
            v_custom_pd_class,
            v_remark_info,
            v_index_value,
            v_menu_no,
            v_pd_qty_max,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_新增产品信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @产品更新次数# = @更新次数#; */
        set v_pd_update_times = v_update_times;

        /* 调用【原子_产品_账户_新增产品限制信息】*/
        call db_prod.pra_pdacco_AddProductLimit(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_cost_calc_type,
            v_allow_exch,
            v_allow_stock_type,
            v_busi_config_str,
            v_comm_appr_oper,
            v_market_price_ratio,
            v_forbid_order_dir,
            v_comm_no_limit_price_ratio,
            v_menu_no,
            v_hk_asset_calc_rate,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_新增产品限制信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @资产账户更新次数# = @更新次数#; */
        set v_asac_update_times = v_update_times;

        /* set @操作备注# = "新增产品"; */
        set v_oper_remark_info = "新增产品";

        /* set @原始金额# = 0; */
        set v_first_amt = 0;

        /* 调用【原子_产品_资金_新增产品资金】*/
        call db_prod.pra_pdcapit_AddPdCapital(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_crncy_type,
            v_first_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_pd_cash_id,
            v_pd_first_amt,
            v_pd_curr_amt,
            v_pd_dist_amt,
            v_pd_auth_amt,
            v_pd_amt_check_diff,
            v_pd_pre_settle_amt,
            v_pd_total_cash_divide,
            v_pd_total_pre_fee,
            v_pd_total_rece_amt,
            v_pd_total_payab_amt,
            v_pd_intrst_cacl_amt,
            v_pd_pre_entry_intrst_amt,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_新增产品资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_no = v_pd_no;
    SET p_pd_cost_calc_type = v_pd_cost_calc_type;
    SET p_pd_status = v_pd_status;
    SET p_asac_update_times = v_asac_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_修改产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_ModiProductInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_ModiProductInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_pd_code varchar(32),
    IN p_pd_name varchar(64),
    IN p_pd_flname varchar(255),
    IN p_fund_reg_code varchar(16),
    IN p_pd_manager varchar(32),
    IN p_found_date int,
    IN p_pd_type int,
    IN p_apply_currency varchar(3),
    IN p_crncy_type varchar(3),
    IN p_first_asset decimal(18,4),
    IN p_first_amt decimal(18,4),
    IN p_pd_all_share decimal(18,2),
    IN p_pre_share decimal(18,2),
    IN p_his_max_per_nav decimal(18,4),
    IN p_pre_nav decimal(18,4),
    IN p_coust_full_name varchar(255),
    IN p_coust_acco varchar(16),
    IN p_coust_acco_name varchar(64),
    IN p_warn_posi_value decimal(18,4),
    IN p_close_posi_value decimal(18,4),
    IN p_target_posi_ratio decimal(18,4),
    IN p_beta_coeffi decimal(18,12),
    IN p_custom_pd_class varchar(255),
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_update_times int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_pd_code varchar(32);
    declare v_pd_name varchar(64);
    declare v_pd_flname varchar(255);
    declare v_fund_reg_code varchar(16);
    declare v_pd_manager varchar(32);
    declare v_found_date int;
    declare v_pd_type int;
    declare v_apply_currency varchar(3);
    declare v_crncy_type varchar(3);
    declare v_first_asset decimal(18,4);
    declare v_first_amt decimal(18,4);
    declare v_pd_all_share decimal(18,2);
    declare v_pre_share decimal(18,2);
    declare v_his_max_per_nav decimal(18,4);
    declare v_pre_nav decimal(18,4);
    declare v_coust_full_name varchar(255);
    declare v_coust_acco varchar(16);
    declare v_coust_acco_name varchar(64);
    declare v_warn_posi_value decimal(18,4);
    declare v_close_posi_value decimal(18,4);
    declare v_target_posi_ratio decimal(18,4);
    declare v_beta_coeffi decimal(18,12);
    declare v_custom_pd_class varchar(255);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_update_times int;
    declare v_pd_status varchar(2);
    declare v_curr_share decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_pd_no = p_pd_no;
    SET v_pd_code = p_pd_code;
    SET v_pd_name = p_pd_name;
    SET v_pd_flname = p_pd_flname;
    SET v_fund_reg_code = p_fund_reg_code;
    SET v_pd_manager = p_pd_manager;
    SET v_found_date = p_found_date;
    SET v_pd_type = p_pd_type;
    SET v_apply_currency = p_apply_currency;
    SET v_crncy_type = p_crncy_type;
    SET v_first_asset = p_first_asset;
    SET v_first_amt = p_first_amt;
    SET v_pd_all_share = p_pd_all_share;
    SET v_pre_share = p_pre_share;
    SET v_his_max_per_nav = p_his_max_per_nav;
    SET v_pre_nav = p_pre_nav;
    SET v_coust_full_name = p_coust_full_name;
    SET v_coust_acco = p_coust_acco;
    SET v_coust_acco_name = p_coust_acco_name;
    SET v_warn_posi_value = p_warn_posi_value;
    SET v_close_posi_value = p_close_posi_value;
    SET v_target_posi_ratio = p_target_posi_ratio;
    SET v_beta_coeffi = p_beta_coeffi;
    SET v_custom_pd_class = p_custom_pd_class;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_update_times = 1;
    SET v_pd_status = "0";
    SET v_curr_share = 0;

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.1.2.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* set @当前份额# = @产品总份额#; */
    set v_curr_share = v_pd_all_share;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_修改产品信息】*/
        call db_prod.pra_pdacco_ModiProductInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pd_no,
            v_co_no,
            v_pd_code,
            v_pd_name,
            v_pd_flname,
            v_fund_reg_code,
            v_pd_manager,
            v_found_date,
            v_pd_type,
            v_apply_currency,
            v_crncy_type,
            v_first_asset,
            v_first_amt,
            v_pd_all_share,
            v_curr_share,
            v_pre_share,
            v_his_max_per_nav,
            v_pre_nav,
            v_coust_full_name,
            v_coust_acco,
            v_coust_acco_name,
            v_warn_posi_value,
            v_close_posi_value,
            v_target_posi_ratio,
            v_beta_coeffi,
            v_custom_pd_class,
            v_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_修改产品信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryProductInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryProductInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_type int,
    IN p_pd_status_str varchar(64),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_type int;
    declare v_pd_status_str varchar(64);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_type = p_pd_type;
    SET v_pd_status_str = p_pd_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @产品状态串# = concat(";", @产品状态串#, ";"); */
    set v_pd_status_str = concat(";", v_pd_status_str, ";");

    /* if @操作员编号# = 99990001 then */
    if v_opor_no = 99990001 then

        /* set @机构编号#=0; */
        set v_co_no=0;

        /* set @产品编号权限串#=' '; */
        set v_pd_no_rights_str=' ';
    end if;

    /* 调用【原子_产品_账户_查询产品信息】*/
    call db_prod.pra_pdacco_QueryProductInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_pd_type,
        v_pd_status_str,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询产品信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询历史产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryProductInfo_His;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryProductInfo_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_type int,
    IN p_pd_status_str varchar(64),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_type int;
    declare v_pd_status_str varchar(64);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_type = p_pd_type;
    SET v_pd_status_str = p_pd_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @产品状态串# = concat(";", @产品状态串#, ";"); */
    set v_pd_status_str = concat(";", v_pd_status_str, ";");

    /* 调用【原子_产品_账户_查询历史产品信息】*/
    call db_prod.pra_pdacco_QueryProductInfo_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_co_no,
        v_pd_type,
        v_pd_status_str,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询历史产品信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询产品信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryProductInfoJour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryProductInfoJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_row_id bigint,
    IN p_row_count int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_查询产品信息流水】*/
    call db_prod.pra_pdacco_QueryProductInfoJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询产品信息流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询历史产品信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryProductInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryProductInfoJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_row_id bigint,
    IN p_row_count int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_查询历史产品信息流水】*/
    call db_prod.pra_pdacco_QueryProductInfoJour_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_co_no,
        v_pd_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.7.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询历史产品信息流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_更新产品状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_UpdateProductStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_UpdateProductStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_pd_status varchar(2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_cost_calc_type int,
    OUT p_pd_market_price_ratio decimal(18,12),
    OUT p_pd_comm_no_limit_price_ratio decimal(18,12),
    OUT p_update_times int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_pd_status varchar(2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_cost_calc_type int;
    declare v_pd_market_price_ratio decimal(18,12);
    declare v_pd_comm_no_limit_price_ratio decimal(18,12);
    declare v_update_times int;
    declare v_asset_acco_no int;
    declare v_asset_acco_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_pd_no = p_pd_no;
    SET v_pd_status = p_pd_status;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_cost_calc_type = 0;
    SET v_pd_market_price_ratio = 0;
    SET v_pd_comm_no_limit_price_ratio = 0;
    SET v_update_times = 1;
    SET v_asset_acco_no = 0;
    SET v_asset_acco_status = "0";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.1.8.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #if @产品状态# = 《产品状态-注销》 then
        #[原子_产品_账户_检查产品交易信息]
    #end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_更新产品状态】*/
        call db_prod.pra_pdacco_UpdateProductStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_pd_status,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_pd_cost_calc_type,
            v_pd_market_price_ratio,
            v_pd_comm_no_limit_price_ratio,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.8.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_更新产品状态出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @产品状态# = 《产品状态-注销》 then */
        if v_pd_status = "3" then

            /* set @资产账户编号# = 0; */
            set v_asset_acco_no = 0;

            /* set @资产账户状态# = 《资产账户状态-注销》; */
            set v_asset_acco_status = "3";

            /* 调用【原子_产品_账户_更新资产账户状态】*/
            call db_prod.pra_pdacco_UpdateAssetAccoStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_co_no,
                v_pd_no,
                v_asset_acco_no,
                v_asset_acco_status,
                v_oper_remark_info,
                v_menu_no,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "prodT.1.8.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_更新资产账户状态出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #set @股东账户状态# = 《股东账户状态-注销》;
            #[原子_产品_账户_更新证券账户状态]
            #set @交易编码状态# = 《交易编码状态-注销》;
            #[原子_产品_账户_更新期货账户状态]
        #end if;

        /* elseif @产品状态# = 《产品状态-冻结》 then */
        elseif v_pd_status = "2" then

            /* set @资产账户编号# = 0; */
            set v_asset_acco_no = 0;

            /* set @资产账户状态# = 《资产账户状态-冻结》; */
            set v_asset_acco_status = "2";

            /* 调用【原子_产品_账户_更新资产账户状态】*/
            call db_prod.pra_pdacco_UpdateAssetAccoStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_co_no,
                v_pd_no,
                v_asset_acco_no,
                v_asset_acco_status,
                v_oper_remark_info,
                v_menu_no,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "prodT.1.8.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_更新资产账户状态出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        #end if;

        /* elseif @产品状态# = 《产品状态-正常》 then */
        elseif v_pd_status = "1" then

            /* set @资产账户编号# = 0; */
            set v_asset_acco_no = 0;

            /* set @资产账户状态# = 《资产账户状态-正常》; */
            set v_asset_acco_status = "1";

            /* 调用【原子_产品_账户_更新资产账户状态】*/
            call db_prod.pra_pdacco_UpdateAssetAccoStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_co_no,
                v_pd_no,
                v_asset_acco_no,
                v_asset_acco_status,
                v_oper_remark_info,
                v_menu_no,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "prodT.1.8.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_更新资产账户状态出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_cost_calc_type = v_pd_cost_calc_type;
    SET p_pd_market_price_ratio = v_pd_market_price_ratio;
    SET p_pd_comm_no_limit_price_ratio = v_pd_comm_no_limit_price_ratio;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_检查产品存在
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_CheckProductExists;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_CheckProductExists(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_code varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_pd_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_检查产品存在】*/
    call db_prod.pra_pdacco_CheckProductExists(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品存在出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询全部产品列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryAllProductList;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryAllProductList(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_查询全部产品列表】*/
    call db_prod.pra_pdacco_QueryAllProductList(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询全部产品列表出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询可见产品列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryRightsProductList;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryRightsProductList(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @产品编号权限串# = concat(";", @产品编号权限串#, ";"); */
    set v_pd_no_rights_str = concat(";", v_pd_no_rights_str, ";");

    /* 调用【原子_产品_账户_查询可见产品列表】*/
    call db_prod.pra_pdacco_QueryRightsProductList(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询可见产品列表出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询产品历史最高单位净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryProductHisHighUnitNetValue;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryProductHisHighUnitNetValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_crncy_type varchar(3),
    IN p_row_id bigint,
    IN p_row_count int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_crncy_type varchar(3);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_crncy_type = p_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_查询产品历史最高单位净值】*/
    call db_prod.pra_pdacco_QueryProductHisHighUnitNetValue(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_crncy_type,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.17.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询产品历史最高单位净值出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_修改产品限制信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_ModiProductLimit;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_ModiProductLimit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_cost_calc_type int,
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
    IN p_comm_appr_oper int,
    IN p_market_price_ratio decimal(18,12),
    IN p_forbid_order_dir varchar(64),
    IN p_comm_no_limit_price_ratio decimal(18,12),
    IN p_menu_no int,
    IN p_hk_asset_calc_rate int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_status varchar(2),
    OUT p_update_times int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_cost_calc_type int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_comm_appr_oper int;
    declare v_market_price_ratio decimal(18,12);
    declare v_forbid_order_dir varchar(64);
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_menu_no int;
    declare v_hk_asset_calc_rate int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_status varchar(2);
    declare v_update_times int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_pd_no = p_pd_no;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_forbid_order_dir = p_forbid_order_dir;
    SET v_comm_no_limit_price_ratio = p_comm_no_limit_price_ratio;
    SET v_menu_no = p_menu_no;
    SET v_hk_asset_calc_rate = p_hk_asset_calc_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_status = "0";
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.1.22.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_修改产品限制信息】*/
        call db_prod.pra_pdacco_ModiProductLimit(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_cost_calc_type,
            v_allow_exch,
            v_allow_stock_type,
            v_comm_appr_oper,
            v_market_price_ratio,
            v_forbid_order_dir,
            v_comm_no_limit_price_ratio,
            v_menu_no,
            v_hk_asset_calc_rate,
            v_error_code,
            v_error_info,
            v_pd_status,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_修改产品限制信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_status = v_pd_status;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询产品限制信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryProductLimit;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryProductLimit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @操作员编号# = 99990001 then */
    if v_opor_no = 99990001 then

        /* set @机构编号# = 0; */
        set v_co_no = 0;

        /* set @产品编号权限串# = ' '; */
        set v_pd_no_rights_str = ' ';
    end if;

    /* 调用【原子_产品_账户_查询产品限制信息】*/
    call db_prod.pra_pdacco_QueryProductLimit(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.24.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询产品限制信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询产品限制信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryProductLimitJour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryProductLimitJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_row_id bigint,
    IN p_row_count int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_查询产品限制信息流水】*/
    call db_prod.pra_pdacco_QueryProductLimitJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.25.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询产品限制信息流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询历史产品限制信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryProductLimitJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryProductLimitJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_row_id bigint,
    IN p_row_count int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_查询历史产品限制信息流水】*/
    call db_prod.pra_pdacco_QueryProductLimitJour_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_co_no,
        v_pd_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.26.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询历史产品限制信息流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_修改产品业务控制配置串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_UpdateProdBusiConfigStr;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_UpdateProdBusiConfigStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_config_index int,
    IN p_config_value varchar(2048),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_busi_config_str varchar(64),
    OUT p_update_times int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_config_index int;
    declare v_config_value varchar(2048);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_config_str varchar(64);
    declare v_update_times int;
    declare v_pd_status varchar(2);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_pd_no = p_pd_no;
    SET v_config_index = p_config_index;
    SET v_config_value = p_config_value;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_config_str = " ";
    SET v_update_times = 1;
    SET v_pd_status = "0";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* [检查报错返回][length(@配置值#) <> 1 or @配置值# = " "][14][@配置位#,@配置值#] */
    if length(v_config_value) <> 1 or v_config_value = " " then
        
        SET v_error_code = "prodT.1.27.14";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("配置位=",v_config_index,",","配置值=",v_config_value),"#",v_mysql_message);
        else
            SET v_error_info = concat("配置位=",v_config_index,",","配置值=",v_config_value);
        end if;
        leave label_pro;
    end if;


    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.27.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.1.27.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_修改产品业务控制配置串】*/
        call db_prod.pra_pdacco_UpdateProdBusiConfigStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_config_index,
            v_config_value,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_busi_config_str,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.27.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_修改产品业务控制配置串出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_config_str = v_busi_config_str;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_修改产品禁止订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_UpdatePdForbidOrderDir;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_UpdatePdForbidOrderDir(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_order_dir_str varchar(1024),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_order_dir_str varchar(1024);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_status varchar(2);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_pd_no = p_pd_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_status = "0";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.28.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.1.28.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_修改产品禁止订单方向】*/
        call db_prod.pra_pdacco_UpdatePdForbidOrderDir(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_order_dir_str,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.28.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_修改产品禁止订单方向出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_修改产品允许订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_UpdatePdAllowOrderDir;;
DELIMITER ;;
CREATE PROCEDURE prt_UpdatePdAllowOrderDir(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_order_dir_str varchar(1024),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_order_dir_str varchar(1024);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_status varchar(2);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_pd_no = p_pd_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_status = "0";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.29.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.1.29.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_修改产品允许订单方向】*/
        call db_prod.pra_UpdatePdAllowOrderDir(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_order_dir_str,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.29.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_修改产品允许订单方向出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_检查银行账户存在
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_CheckBankAccoExists;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_CheckBankAccoExists(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_bank_code varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_bank_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_bank_code = p_bank_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_检查银行账户存在】*/
    call db_prod.pra_pdacco_CheckBankAccoExists(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_bank_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.30.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查银行账户存在出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_新增银行账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_AddBankAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_AddBankAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_bank_code varchar(32),
    IN p_bank_name varchar(64),
    IN p_bank_acco varchar(16),
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_bank_acco_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_bank_code varchar(32);
    declare v_bank_name varchar(64);
    declare v_bank_acco varchar(16);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_bank_acco_no int;
    declare v_pd_status varchar(2);
    declare v_co_no int;
    declare v_record_no_type int;
    declare v_curr_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_pd_no = p_pd_no;
    SET v_bank_code = p_bank_code;
    SET v_bank_name = p_bank_name;
    SET v_bank_acco = p_bank_acco;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_bank_acco_no = 0;
    SET v_pd_status = "0";
    SET v_co_no = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.31.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.1.31.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_产品_账户_检查银行账户存在】*/
    call db_prod.pra_pdacco_CheckBankAccoExists(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_bank_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.31.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查银行账户存在出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @编号类型# = 《编号类型-银行账户编号》; */
    set v_record_no_type = 5;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_获取机构业务记录编号】*/
        call db_prod.pra_pdacco_GetCoBusiRecordNo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_record_no_type,
            v_error_code,
            v_error_info,
            v_curr_no);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.31.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取机构业务记录编号出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @银行账户编号# = @当前编号#; */
    set v_bank_acco_no = v_curr_no;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_新增银行账户信息】*/
        call db_prod.pra_pdacco_AddBankAccoInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_bank_acco_no,
            v_bank_code,
            v_bank_name,
            v_bank_acco,
            v_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.31.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_新增银行账户信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_bank_acco_no = v_bank_acco_no;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_修改银行账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_ModiBankAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_ModiBankAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_bank_acco_no int,
    IN p_bank_name varchar(64),
    IN p_bank_acco varchar(16),
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_bank_acco_no int;
    declare v_bank_name varchar(64);
    declare v_bank_acco varchar(16);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_status varchar(2);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_pd_no = p_pd_no;
    SET v_bank_acco_no = p_bank_acco_no;
    SET v_bank_name = p_bank_name;
    SET v_bank_acco = p_bank_acco;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_status = "0";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.32.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.1.32.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_修改银行账户信息】*/
        call db_prod.pra_pdacco_ModiBankAccoInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_bank_acco_no,
            v_bank_name,
            v_bank_acco,
            v_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.32.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_修改银行账户信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_删除银行账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_DeleteBankAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_DeleteBankAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_bank_acco_no int,
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_bank_acco_no int;
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_status varchar(2);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_pd_no = p_pd_no;
    SET v_bank_acco_no = p_bank_acco_no;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_status = "0";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.33.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.1.33.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_删除银行账户信息】*/
        call db_prod.pra_pdacco_DeleteBankAccoInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_bank_acco_no,
            v_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.33.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_删除银行账户信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询银行账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryBankAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryBankAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_bank_acco_no_str varchar(64),
    IN p_row_id bigint,
    IN p_row_count int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_bank_acco_no_str varchar(64);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_bank_acco_no_str = p_bank_acco_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @银行账户编号串# = concat(";", @银行账户编号串#, ";"); */
    set v_bank_acco_no_str = concat(";", v_bank_acco_no_str, ";");

    /* 调用【原子_产品_账户_查询银行账户信息】*/
    call db_prod.pra_pdacco_QueryBankAccoInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_bank_acco_no_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.34.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询银行账户信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询银行账户信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryBankAccoInfoJour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryBankAccoInfoJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_bank_acco_no_str varchar(64),
    IN p_row_id bigint,
    IN p_row_count int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_bank_acco_no_str varchar(64);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_bank_acco_no_str = p_bank_acco_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @银行账户编号串# = concat(";", @银行账户编号串#, ";"); */
    set v_bank_acco_no_str = concat(";", v_bank_acco_no_str, ";");

    /* 调用【原子_产品_账户_查询银行账户信息流水】*/
    call db_prod.pra_pdacco_QueryBankAccoInfoJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_bank_acco_no_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.35.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询银行账户信息流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询历史银行账户信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryBankAccoInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryBankAccoInfoJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_bank_acco_no_str varchar(64),
    IN p_row_id bigint,
    IN p_row_count int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_bank_acco_no_str varchar(64);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_bank_acco_no_str = p_bank_acco_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @银行账户编号串# = concat(";", @银行账户编号串#, ";"); */
    set v_bank_acco_no_str = concat(";", v_bank_acco_no_str, ";");

    /* 调用【原子_产品_账户_查询历史银行账户信息流水】*/
    call db_prod.pra_pdacco_QueryBankAccoInfoJour_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_co_no,
        v_pd_no,
        v_bank_acco_no_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.36.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询历史银行账户信息流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_检查资产账户存在
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_CheckAssetAccoExists;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_CheckAssetAccoExists(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_asset_acco varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco = p_asset_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_检查资产账户存在】*/
    call db_prod.pra_pdacco_CheckAssetAccoExists(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.40.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查资产账户存在出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_新增资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_AddAssetAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_AddAssetAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco varchar(16),
    IN p_asset_acco_name varchar(64),
    IN p_asset_acco_type int,
    IN p_out_acco varchar(32),
    IN p_trade_pwd varchar(64),
    IN p_comm_pwd varchar(64),
    IN p_market_price_ratio decimal(18,12),
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
    IN p_split_fee_typr_str varchar(64),
    IN p_busi_limit_str varchar(2048),
    IN p_exter_comm_flag int,
    IN p_sh_hk_trader_type int,
    IN p_sz_hk_trader_type int,
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    IN p_max_acco_count int,
    IN p_busi_depart varchar(255),
    IN p_syn_update_cost_amt int,
    IN p_exch_group_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asset_acco_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_asset_acco_name varchar(64);
    declare v_asset_acco_type int;
    declare v_out_acco varchar(32);
    declare v_trade_pwd varchar(64);
    declare v_comm_pwd varchar(64);
    declare v_market_price_ratio decimal(18,12);
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_split_fee_typr_str varchar(64);
    declare v_busi_limit_str varchar(2048);
    declare v_exter_comm_flag int;
    declare v_sh_hk_trader_type int;
    declare v_sz_hk_trader_type int;
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_max_acco_count int;
    declare v_busi_depart varchar(255);
    declare v_syn_update_cost_amt int;
    declare v_exch_group_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco_no int;
    declare v_pd_status varchar(2);
    declare v_record_no_type int;
    declare v_curr_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco = p_asset_acco;
    SET v_asset_acco_name = p_asset_acco_name;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_out_acco = p_out_acco;
    SET v_trade_pwd = p_trade_pwd;
    SET v_comm_pwd = p_comm_pwd;
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_split_fee_typr_str = p_split_fee_typr_str;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_sh_hk_trader_type = p_sh_hk_trader_type;
    SET v_sz_hk_trader_type = p_sz_hk_trader_type;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_max_acco_count = p_max_acco_count;
    SET v_busi_depart = p_busi_depart;
    SET v_syn_update_cost_amt = p_syn_update_cost_amt;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco_no = 0;
    SET v_pd_status = "0";
    SET v_record_no_type = 0;
    SET v_curr_no = 0;

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.41.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.1.41.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_产品_账户_检查资产账户存在】*/
    call db_prod.pra_pdacco_CheckAssetAccoExists(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.41.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查资产账户存在出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @编号类型# = 《编号类型-资产账户编号》; */
    set v_record_no_type = 3;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_获取机构业务记录编号】*/
        call db_prod.pra_pdacco_GetCoBusiRecordNo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_record_no_type,
            v_error_code,
            v_error_info,
            v_curr_no);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.41.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取机构业务记录编号出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @资产账户编号# = @当前编号#; */
    set v_asset_acco_no = v_curr_no;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_新增资产账户信息】*/
        call db_prod.pra_pdacco_AddAssetAccoInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_asset_acco_no,
            v_asset_acco,
            v_asset_acco_name,
            v_asset_acco_type,
            v_out_acco,
            v_trade_pwd,
            v_comm_pwd,
            v_market_price_ratio,
            v_allow_exch,
            v_allow_stock_type,
            v_split_fee_typr_str,
            v_busi_limit_str,
            v_exter_comm_flag,
            v_sh_hk_trader_type,
            v_sz_hk_trader_type,
            v_remark_info,
            v_menu_no,
            v_max_acco_count,
            v_busi_depart,
            v_syn_update_cost_amt,
            v_exch_group_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.41.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_新增资产账户信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asset_acco_no = v_asset_acco_no;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_修改资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_ModiAssetAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_ModiAssetAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_asset_acco varchar(16),
    IN p_asset_acco_name varchar(64),
    IN p_asset_acco_type int,
    IN p_market_price_ratio decimal(18,12),
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
    IN p_split_fee_typr_str varchar(64),
    IN p_busi_limit_str varchar(2048),
    IN p_exter_comm_flag int,
    IN p_sh_hk_trader_type int,
    IN p_sz_hk_trader_type int,
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    IN p_busi_depart varchar(255),
    IN p_syn_update_cost_amt int,
    IN p_exch_group_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_asset_acco varchar(16);
    declare v_asset_acco_name varchar(64);
    declare v_asset_acco_type int;
    declare v_market_price_ratio decimal(18,12);
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_split_fee_typr_str varchar(64);
    declare v_busi_limit_str varchar(2048);
    declare v_exter_comm_flag int;
    declare v_sh_hk_trader_type int;
    declare v_sz_hk_trader_type int;
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_busi_depart varchar(255);
    declare v_syn_update_cost_amt int;
    declare v_exch_group_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_status varchar(2);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_asset_acco = p_asset_acco;
    SET v_asset_acco_name = p_asset_acco_name;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_split_fee_typr_str = p_split_fee_typr_str;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_sh_hk_trader_type = p_sh_hk_trader_type;
    SET v_sz_hk_trader_type = p_sz_hk_trader_type;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_busi_depart = p_busi_depart;
    SET v_syn_update_cost_amt = p_syn_update_cost_amt;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_status = "0";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.42.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.1.42.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_修改资产账户信息】*/
        call db_prod.pra_pdacco_ModiAssetAccoInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_asset_acco_no,
            v_asset_acco,
            v_asset_acco_name,
            v_asset_acco_type,
            v_market_price_ratio,
            v_allow_exch,
            v_allow_stock_type,
            v_split_fee_typr_str,
            v_busi_limit_str,
            v_exter_comm_flag,
            v_sh_hk_trader_type,
            v_sz_hk_trader_type,
            v_remark_info,
            v_menu_no,
            v_busi_depart,
            v_syn_update_cost_amt,
            v_exch_group_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.42.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_修改资产账户信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_删除资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_DeleteAssetAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_DeleteAssetAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_status varchar(2);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_status = "0";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.43.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.1.43.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_删除资产账户信息】*/
        call db_prod.pra_pdacco_DeleteAssetAccoInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_asset_acco_no,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.43.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_删除资产账户信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryAssetAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryAssetAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_asset_acco_status_str varchar(64),
    IN p_asset_acco_type int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_asset_acco_status_str varchar(64);
    declare v_asset_acco_type int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_asset_acco_status_str = p_asset_acco_status_str;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @资产账户状态串# = concat(";", @资产账户状态串#, ";"); */
    set v_asset_acco_status_str = concat(";", v_asset_acco_status_str, ";");

    /* if @操作员编号# = 99990001 then */
    if v_opor_no = 99990001 then

        /* set @机构编号# = 0; */
        set v_co_no = 0;

        /* set @产品编号权限串# = " "; */
        set v_pd_no_rights_str = " ";
    end if;

    /* 调用【原子_产品_账户_查询资产账户信息】*/
    call db_prod.pra_pdacco_QueryAssetAccoInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_asset_acco_status_str,
        v_asset_acco_type,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.44.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询资产账户信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询资产账户信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryAssetAccoInfoJour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryAssetAccoInfoJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_row_id bigint,
    IN p_row_count int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_查询资产账户信息流水】*/
    call db_prod.pra_pdacco_QueryAssetAccoInfoJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.45.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询资产账户信息流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询历史资产账户信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryAssetAccoInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryAssetAccoInfoJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_row_id bigint,
    IN p_row_count int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_查询历史资产账户信息流水】*/
    call db_prod.pra_pdacco_QueryAssetAccoInfoJour_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.46.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询历史资产账户信息流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_更新资产账户状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_UpdateAssetAccoStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_UpdateAssetAccoStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_asset_acco_status varchar(2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_asset_acco_status varchar(2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_asset_acco_status = p_asset_acco_status;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_检查资产账户状态】*/
    call db_prod.pra_pdacco_CheckAssetAccoStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco_no,
        v_asset_acco_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.47.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查资产账户状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if (@操作员机构编号# <> 9999) then */
    if (v_opor_co_no <> 9999) then

        /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#] */
        if v_co_no <> v_opor_co_no then
            
            SET v_error_code = "prodT.1.47.50";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
            end if;
            leave label_pro;
        end if;

    end if;
    #if @资产账户状态# = 《资产账户状态-注销》 then
        #[原子_产品_账户_检查资产账户注销]
    #end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_更新资产账户状态】*/
        call db_prod.pra_pdacco_UpdateAssetAccoStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_asset_acco_no,
            v_asset_acco_status,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.47.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_更新资产账户状态出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_更新资产账户在线状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_UpdateAssetAccountOnlineStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_UpdateAssetAccountOnlineStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_online_status int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_online_status int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_online_status = p_online_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_更新资产账户在线状态】*/
        call db_prod.pra_pdacco_UpdateAssetAccountOnlineStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pass_no,
            v_out_acco,
            v_online_status,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.52.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_更新资产账户在线状态出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_修改资产账户密码
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_UpdateAssetAccoPwd;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_UpdateAssetAccoPwd(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_trade_pwd varchar(64),
    IN p_comm_pwd varchar(64),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_trade_pwd varchar(64);
    declare v_comm_pwd varchar(64);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco_status varchar(2);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_trade_pwd = p_trade_pwd;
    SET v_comm_pwd = p_comm_pwd;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco_status = "0";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @资产账户状态# = 0; */
    set v_asset_acco_status = 0;

    /* 调用【原子_产品_账户_检查资产账户状态】*/
    call db_prod.pra_pdacco_CheckAssetAccoStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco_no,
        v_asset_acco_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.50.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查资产账户状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.1.50.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_修改资产账户密码】*/
        call db_prod.pra_pdacco_UpdateAssetAccoPwd(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_asset_acco_no,
            v_trade_pwd,
            v_comm_pwd,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.50.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_修改资产账户密码出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询资产账户列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryAssetAccoList;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryAssetAccoList(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pd_no_str = p_pd_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @产品编号串# = concat(";", @产品编号串#, ";"); */
    set v_pd_no_str = concat(";", v_pd_no_str, ";");

    /* 调用【原子_产品_账户_查询资产账户列表】*/
    call db_prod.pra_pdacco_QueryAssetAccoList(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.51.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询资产账户列表出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询资产账户通道信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryAssetAccoChannel;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryAssetAccoChannel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_row_id bigint,
    IN p_row_count int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_查询资产账户通道信息】*/
    call db_prod.pra_pdacco_QueryAssetAccoChannel(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.74.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询资产账户通道信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_获取产品最大单位净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_GetPdMaxPerNav;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_GetPdMaxPerNav(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_part_nav decimal(18,4)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_begin_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_part_nav decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pd_no = p_pd_no;
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_part_nav = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_获取产品最大单位净值】*/
    call db_prod.pra_pdacco_GetPdMaxPerNav(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_begin_date,
        v_error_code,
        v_error_info,
        v_pd_part_nav);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.75.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取产品最大单位净值出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_part_nav = v_pd_part_nav;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_获取产品最大净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_GetPdMaxNav;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_GetPdMaxNav(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_nav_asset decimal(18,4)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_begin_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_nav_asset decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pd_no = p_pd_no;
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_nav_asset = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_获取产品最大净值】*/
    call db_prod.pra_pdacco_GetPdMaxNav(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_begin_date,
        v_error_code,
        v_error_info,
        v_nav_asset);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.76.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取产品最大净值出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_nav_asset = v_nav_asset;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_资产账户编号获取资产账户
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_AssetAccoNoGetAssetAcco;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_AssetAccoNoGetAssetAcco(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asset_acco varchar(16)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_asset_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_资产账户编号获取资产账户】*/
        call db_prod.pra_pdacco_AssetAccoNoGetAssetAcco(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_asset_acco_no,
            v_error_code,
            v_error_info,
            v_asset_acco);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.77.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_资产账户编号获取资产账户出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asset_acco = v_asset_acco;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询产品份额变动流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryProdShareOccurJour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryProdShareOccurJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_查询产品份额变动流水】*/
    call db_prod.pra_pdacco_QueryProdShareOccurJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.78.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询产品份额变动流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询产品份额变动流水历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryProdShareOccurJourHis;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryProdShareOccurJourHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_no_rights_str varchar(2048),
    IN p_begin_date int,
    IN p_end_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_no_rights_str varchar(2048);
    declare v_begin_date int;
    declare v_end_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [检查报错返回][@开始日期#>@结束日期#][254][@开始日期#,@结束日期#] */
    if v_begin_date>v_end_date then
        
        SET v_error_code = "prodT.1.79.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_产品_账户_查询产品份额变动流水历史】*/
    call db_prod.pra_pdacco_QueryProdShareOccurJourHis(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_pd_no_rights_str,
        v_begin_date,
        v_end_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.79.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询产品份额变动流水历史出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_修改产品限制信息风控版
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_ModiProductForRK;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_ModiProductForRK(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_cost_calc_type int,
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
    IN p_comm_appr_oper int,
    IN p_market_price_ratio decimal(18,12),
    IN p_forbid_order_dir varchar(64),
    IN p_comm_no_limit_price_ratio decimal(18,12),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_status varchar(2),
    OUT p_update_times int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_cost_calc_type int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_comm_appr_oper int;
    declare v_market_price_ratio decimal(18,12);
    declare v_forbid_order_dir varchar(64);
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_status varchar(2);
    declare v_update_times int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_pd_no = p_pd_no;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_forbid_order_dir = p_forbid_order_dir;
    SET v_comm_no_limit_price_ratio = p_comm_no_limit_price_ratio;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_status = "0";
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.80.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.1.80.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_修改产品限制信息风控版】*/
        call db_prod.pra_pdacco_ModiProductLimitForRK(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_cost_calc_type,
            v_allow_exch,
            v_allow_stock_type,
            v_comm_appr_oper,
            v_market_price_ratio,
            v_forbid_order_dir,
            v_comm_no_limit_price_ratio,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_pd_status,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.80.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_修改产品限制信息风控版出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_status = v_pd_status;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_修改产品工作流信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_ModiPdWorkflowInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_ModiPdWorkflowInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_workflow_type int,
    IN p_pd_no int,
    IN p_workflow_num int,
    IN p_opor_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_workflow_type int;
    declare v_pd_no int;
    declare v_workflow_num int;
    declare v_opor_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_workflow_type = p_workflow_type;
    SET v_pd_no = p_pd_no;
    SET v_workflow_num = p_workflow_num;
    SET v_opor_no_str = p_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_status = "0";

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.81.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.1.81.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


           /* 调用【原子_产品_账户_修改产品工作流信息】*/
           call db_prod.pra_pdacco_ModiPdWorkflowInfo(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_co_no,
               v_workflow_type,
               v_pd_no,
               v_workflow_num,
               v_opor_no_str,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "prodT.1.81.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_修改产品工作流信息出现错误！',v_mysql_message);
               end if;
               ROLLBACK;
               leave label_pro;
           elseif v_error_code <> "0" then
               ROLLBACK;
               leave label_pro;
           end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询产品工作流信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryPdWorkflowInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryPdWorkflowInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_查询产品工作流信息】*/
    call db_prod.pra_pdacco_QueryPdWorkflowInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.82.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询产品工作流信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询账户同步信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryAccoSyncInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryAccoSyncInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_co_no = p_co_no;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_查询账户同步信息】*/
    call db_prod.pra_pdacco_QueryAccoSyncInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_row_id,
        v_co_no,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.83.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询账户同步信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_获取资产账户密码
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_GetAssetAccoPwd;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_GetAssetAccoPwd(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_pwd varchar(64),
    OUT p_comm_pwd varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_asset_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_pwd varchar(64);
    declare v_comm_pwd varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_pwd = " ";
    SET v_comm_pwd = " ";

    
    label_pro:BEGIN
    

     /* 调用【原子_产品_账户_获取资产账户密码】*/
     call db_prod.pra_pdacco_GetAssetAccoPwd(
         v_opor_co_no,
         v_opor_no,
         v_oper_mac,
         v_oper_ip_addr,
         v_oper_info,
         v_oper_way,
         v_func_code,
         v_asset_acco_no,
         v_error_code,
         v_error_info,
         v_trade_pwd,
         v_comm_pwd);
     if v_error_code = "1" then
         SET v_error_code = "prodT.1.84.999";
         if v_mysql_message <> "" then
              SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取资产账户密码出现错误！',v_mysql_message);
         end if;
         leave label_pro;
     elseif v_error_code <> "0" then
         leave label_pro;
     end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_pwd = v_trade_pwd;
    SET p_comm_pwd = v_comm_pwd;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_获取产品工作流信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_GetPdWorkflowInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_GetPdWorkflowInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_co_no int,
    IN p_pd_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_co_no int;
    declare v_pd_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_获取产品工作流信息】*/
    call db_prod.pra_pdacco_GetPdWorkflowInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_co_no,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.85.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取产品工作流信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_更新资产账户密码验证状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_UpdateAssetAccoPwdCheckStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_UpdateAssetAccoPwdCheckStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_pwd_check_status int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_pwd_check_status int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_pwd_check_status = p_pwd_check_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


          /* 调用【原子_产品_账户_更新资产账户密码验证状态】*/
          call db_prod.pra_pdacco_UpdateAssetAccoPwdCheckStatus(
              v_opor_co_no,
              v_opor_no,
              v_oper_mac,
              v_oper_ip_addr,
              v_oper_info,
              v_oper_way,
              v_func_code,
              v_pass_no,
              v_out_acco,
              v_pwd_check_status,
              v_error_code,
              v_error_info);
          if v_error_code = "1" then
              SET v_error_code = "prodT.1.86.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_更新资产账户密码验证状态出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_删除产品工作流信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_DeletePdWorkflowInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_DeletePdWorkflowInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_co_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_co_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


            /* 调用【原子_产品_账户_删除产品工作流信息】*/
            call db_prod.pra_pdacco_DeletePdWorkflowInfo(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_pd_no,
                v_co_no,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "prodT.1.87.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_删除产品工作流信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_更新开盘检查流程
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_UpdateOpenCheckFlow;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_UpdateOpenCheckFlow(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_execute_type int,
    IN p_init_step int,
    IN p_exec_date int,
    IN p_begin_time int,
    IN p_open_execute_type int,
    IN p_open_execute_result int,
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_execute_type int;
    declare v_init_step int;
    declare v_exec_date int;
    declare v_begin_time int;
    declare v_open_execute_type int;
    declare v_open_execute_result int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_execute_type = p_execute_type;
    SET v_init_step = p_init_step;
    SET v_exec_date = p_exec_date;
    SET v_begin_time = p_begin_time;
    SET v_open_execute_type = p_open_execute_type;
    SET v_open_execute_result = p_open_execute_result;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


            /* 调用【原子_产品_账户_更新开盘检查流程】*/
            call db_prod.pra_pdacco_UpdateOpenCheckFlow(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_execute_type,
                v_init_step,
                v_exec_date,
                v_begin_time,
                v_open_execute_type,
                v_open_execute_result,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "prodT.1.88.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_更新开盘检查流程出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询开盘检查流程
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryOpenCheckFlow;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryOpenCheckFlow(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_查询开盘检查流程】*/
    call db_prod.pra_pdacco_QueryOpenCheckFlow(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.89.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询开盘检查流程出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_获取开盘检查流程
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_GetOpenCheckFlow;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_GetOpenCheckFlow(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_step int,
    IN p_exec_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_step int;
    declare v_exec_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_step = p_init_step;
    SET v_exec_date = p_exec_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_获取开盘检查流程】*/
    call db_prod.pra_pdacco_GetOpenCheckFlow(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_step,
        v_exec_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.90.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取开盘检查流程出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询收盘作业流程
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryCloseCheckFlow;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryCloseCheckFlow(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_flow_business int,
    IN p_exec_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_flow_business int;
    declare v_exec_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_flow_business = p_flow_business;
    SET v_exec_date = p_exec_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_查询收盘作业流程】*/
    call db_prod.pra_pdacco_QueryCloseCheckFlow(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_flow_business,
        v_exec_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.91.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询收盘作业流程出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_更新收盘作业流程
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_UpdateCloseCheckFlow;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_UpdateCloseCheckFlow(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_execute_type int,
    IN p_flow_business int,
    IN p_exec_date int,
    IN p_begin_time int,
    IN p_close_execute_type int,
    IN p_error_deal_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_execute_type int;
    declare v_flow_business int;
    declare v_exec_date int;
    declare v_begin_time int;
    declare v_close_execute_type int;
    declare v_error_deal_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_execute_type = p_execute_type;
    SET v_flow_business = p_flow_business;
    SET v_exec_date = p_exec_date;
    SET v_begin_time = p_begin_time;
    SET v_close_execute_type = p_close_execute_type;
    SET v_error_deal_type = p_error_deal_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


            /* 调用【原子_产品_账户_更新收盘作业流程】*/
            call db_prod.pra_pdacco_UpdateCloseCheckFlow(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_execute_type,
                v_flow_business,
                v_exec_date,
                v_begin_time,
                v_close_execute_type,
                v_error_deal_type,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "prodT.1.92.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_更新收盘作业流程出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_新增产品关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_AddProductRelation;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_AddProductRelation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_co_no int,
    IN p_mum_pd_no int,
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_co_no int;
    declare v_mum_pd_no int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_mum_pd_no = p_mum_pd_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


            /* 调用【原子_产品_账户_新增产品关系】*/
            call db_prod.pra_pdacco_AddProductRelation(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_pd_no,
                v_co_no,
                v_mum_pd_no,
                v_menu_no,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "prodT.1.101.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_新增产品关系出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_删除产品关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_DeleteProductRelation;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_DeleteProductRelation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_co_no int,
    IN p_mum_pd_no int,
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_co_no int;
    declare v_mum_pd_no int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_mum_pd_no = p_mum_pd_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


              /* 调用【原子_产品_账户_删除产品关系】*/
              call db_prod.pra_pdacco_DeleteProductRelation(
                  v_opor_co_no,
                  v_opor_no,
                  v_oper_mac,
                  v_oper_ip_addr,
                  v_oper_info,
                  v_oper_way,
                  v_func_code,
                  v_init_date,
                  v_pd_no,
                  v_co_no,
                  v_mum_pd_no,
                  v_menu_no,
                  v_error_code,
                  v_error_info);
              if v_error_code = "1" then
                  SET v_error_code = "prodT.1.102.999";
                  if v_mysql_message <> "" then
                       SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_删除产品关系出现错误！',v_mysql_message);
                  end if;
                  ROLLBACK;
                  leave label_pro;
              elseif v_error_code <> "0" then
                  ROLLBACK;
                  leave label_pro;
              end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询产品关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryProductRelation;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryProductRelation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_co_no int,
    IN p_mum_pd_no int,
    IN p_row_id bigint,
    IN p_row_count int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_co_no int;
    declare v_mum_pd_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_mum_pd_no = p_mum_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_查询产品关系】*/
    call db_prod.pra_pdacco_QueryProductRelation(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_co_no,
        v_mum_pd_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.103.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询产品关系出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_获取注销资产账户串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_GetCancelAssetAccoStr;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_GetCancelAssetAccoStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asset_acco_no_str varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco_no_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_获取注销资产账户串】*/
    call db_prod.pra_pdacco_GetCancelAssetAccoStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_asset_acco_no_str);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.104.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取注销资产账户串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asset_acco_no_str = v_asset_acco_no_str;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_外部账号获取资产账户通道信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_OutAccoGetAssetAccoChannel;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_OutAccoGetAssetAccoChannel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_out_acco varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pass_no int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_out_acco varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_out_acco = p_out_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_产品_账户_外部账号获取资产账户通道信息】*/
    call db_prod.pra_pdacco_OutAccoGetAssetAccoChannel(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_out_acco,
        v_error_code,
        v_error_info,
        v_pass_no,
        v_co_no,
        v_pd_no,
        v_asset_acco_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.105.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_外部账号获取资产账户通道信息出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pass_no = v_pass_no;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_新增融资融券配置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_AddSecuMargTradConfig;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_AddSecuMargTradConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
    IN p_pd_no int,
    IN p_fina_return_type int,
    IN p_sell_auto_back_debt int,
    IN p_fina_limit_max decimal(18,4),
    IN p_loan_limit_max decimal(18,4),
    IN p_fina_year_intrst_rate decimal(18,12),
    IN p_secu_loan_year_intrst_rate decimal(18,12),
    IN p_close_posi_keep_guarantee_ratio decimal(18,12),
    IN p_fill_posi_keep_guarantee_ratio decimal(18,12),
    IN p_extract_guarantee_ratio decimal(18,12),
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_asset_acco_no int;
    declare v_pd_no int;
    declare v_fina_return_type int;
    declare v_sell_auto_back_debt int;
    declare v_fina_limit_max decimal(18,4);
    declare v_loan_limit_max decimal(18,4);
    declare v_fina_year_intrst_rate decimal(18,12);
    declare v_secu_loan_year_intrst_rate decimal(18,12);
    declare v_close_posi_keep_guarantee_ratio decimal(18,12);
    declare v_fill_posi_keep_guarantee_ratio decimal(18,12);
    declare v_extract_guarantee_ratio decimal(18,12);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pd_no = p_pd_no;
    SET v_fina_return_type = p_fina_return_type;
    SET v_sell_auto_back_debt = p_sell_auto_back_debt;
    SET v_fina_limit_max = p_fina_limit_max;
    SET v_loan_limit_max = p_loan_limit_max;
    SET v_fina_year_intrst_rate = p_fina_year_intrst_rate;
    SET v_secu_loan_year_intrst_rate = p_secu_loan_year_intrst_rate;
    SET v_close_posi_keep_guarantee_ratio = p_close_posi_keep_guarantee_ratio;
    SET v_fill_posi_keep_guarantee_ratio = p_fill_posi_keep_guarantee_ratio;
    SET v_extract_guarantee_ratio = p_extract_guarantee_ratio;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_新增融资融券配置表】*/
        call db_prod.pra_pdacco_AddSecuMargTradConfig(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_asset_acco_no,
            v_pd_no,
            v_fina_return_type,
            v_sell_auto_back_debt,
            v_fina_limit_max,
            v_loan_limit_max,
            v_fina_year_intrst_rate,
            v_secu_loan_year_intrst_rate,
            v_close_posi_keep_guarantee_ratio,
            v_fill_posi_keep_guarantee_ratio,
            v_extract_guarantee_ratio,
            v_remark_info,
            v_error_code,
            v_error_info,
            v_row_id);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.106.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_新增融资融券配置表出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_修改融资融券配置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_ModiSecuMargTradConfig;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_ModiSecuMargTradConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
    IN p_pd_no int,
    IN p_fina_return_type int,
    IN p_sell_auto_back_debt int,
    IN p_fina_limit_max decimal(18,4),
    IN p_loan_limit_max decimal(18,4),
    IN p_fina_year_intrst_rate decimal(18,12),
    IN p_secu_loan_year_intrst_rate decimal(18,12),
    IN p_close_posi_keep_guarantee_ratio decimal(18,12),
    IN p_fill_posi_keep_guarantee_ratio decimal(18,12),
    IN p_extract_guarantee_ratio decimal(18,12),
    IN p_remark_info varchar(255),
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_asset_acco_no int;
    declare v_pd_no int;
    declare v_fina_return_type int;
    declare v_sell_auto_back_debt int;
    declare v_fina_limit_max decimal(18,4);
    declare v_loan_limit_max decimal(18,4);
    declare v_fina_year_intrst_rate decimal(18,12);
    declare v_secu_loan_year_intrst_rate decimal(18,12);
    declare v_close_posi_keep_guarantee_ratio decimal(18,12);
    declare v_fill_posi_keep_guarantee_ratio decimal(18,12);
    declare v_extract_guarantee_ratio decimal(18,12);
    declare v_remark_info varchar(255);
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pd_no = p_pd_no;
    SET v_fina_return_type = p_fina_return_type;
    SET v_sell_auto_back_debt = p_sell_auto_back_debt;
    SET v_fina_limit_max = p_fina_limit_max;
    SET v_loan_limit_max = p_loan_limit_max;
    SET v_fina_year_intrst_rate = p_fina_year_intrst_rate;
    SET v_secu_loan_year_intrst_rate = p_secu_loan_year_intrst_rate;
    SET v_close_posi_keep_guarantee_ratio = p_close_posi_keep_guarantee_ratio;
    SET v_fill_posi_keep_guarantee_ratio = p_fill_posi_keep_guarantee_ratio;
    SET v_extract_guarantee_ratio = p_extract_guarantee_ratio;
    SET v_remark_info = p_remark_info;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_修改融资融券配置表】*/
        call db_prod.pra_pdacco_ModiSecuMargTradConfig(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_asset_acco_no,
            v_pd_no,
            v_fina_return_type,
            v_sell_auto_back_debt,
            v_fina_limit_max,
            v_loan_limit_max,
            v_fina_year_intrst_rate,
            v_secu_loan_year_intrst_rate,
            v_close_posi_keep_guarantee_ratio,
            v_fill_posi_keep_guarantee_ratio,
            v_extract_guarantee_ratio,
            v_remark_info,
            v_row_id,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.107.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_修改融资融券配置表出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_删除融资融券配置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_DelSecuMargTradConfig;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_DelSecuMargTradConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_删除融资融券配置表】*/
        call db_prod.pra_pdacco_DelSecuMargTradConfig(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.108.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_删除融资融券配置表出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询融资融券配置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QuerySecuMargTradConfig;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QuerySecuMargTradConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
    IN p_pd_no int,
    IN p_sort_type int,
    IN p_row_id bigint,
    IN p_row_count int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_asset_acco_no int;
    declare v_pd_no int;
    declare v_sort_type int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pd_no = p_pd_no;
    SET v_sort_type = p_sort_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_查询融资融券配置表】*/
    call db_prod.pra_pdacco_QuerySecuMargTradConfig(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_asset_acco_no,
        v_pd_no,
        v_sort_type,
        v_row_count,
        v_row_id,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.109.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询融资融券配置表出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_查询资产账户默认交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_QueryAccoDefaultExgp;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_QueryAccoDefaultExgp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
    IN p_pd_no int,
    IN p_sort_type int,
    IN p_row_id bigint,
    IN p_row_count int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_asset_acco_no int;
    declare v_pd_no int;
    declare v_sort_type int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pd_no = p_pd_no;
    SET v_sort_type = p_sort_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_查询资产账户默认交易组信息】*/
    call db_prod.pra_pdacco_QueryAccoDefaultExgp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_asset_acco_no,
        v_pd_no,
        v_sort_type,
        v_row_count,
        v_row_id,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.110.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询资产账户默认交易组信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_设置资产账户默认交易组关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_SetAccoDefaultExgpRelation;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_SetAccoDefaultExgpRelation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_asset_acco_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_设置资产账户默认交易组关系】*/
        call db_prod.pra_pdacco_SetAccoDefaultExgpRelation(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_asset_acco_no,
            v_pd_no,
            v_exch_group_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.1.111.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_设置资产账户默认交易组关系出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_删除资产账户默认交易组关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_DeleteAccoDefaultExgpRelation;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_DeleteAccoDefaultExgpRelation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_asset_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


       /* 调用【原子_产品_账户_删除资产账户默认交易组关系】*/
       call db_prod.pra_pdacco_DeleteAccoDefaultExgpRelation(
           v_opor_co_no,
           v_opor_no,
           v_oper_mac,
           v_oper_ip_addr,
           v_oper_info,
           v_oper_way,
           v_func_code,
           v_co_no,
           v_asset_acco_no,
           v_error_code,
           v_error_info);
       if v_error_code = "1" then
           SET v_error_code = "prodT.1.112.999";
           if v_mysql_message <> "" then
                SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_删除资产账户默认交易组关系出现错误！',v_mysql_message);
           end if;
           ROLLBACK;
           leave label_pro;
       elseif v_error_code <> "0" then
           ROLLBACK;
           leave label_pro;
       end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_报盘回写通道信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_TransWriteInPassInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_TransWriteInPassInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_offer_server_name varchar(64),
    IN p_offer_server_ip varchar(64),
    IN p_mac_addr varchar(32),
    IN p_offer_name varchar(32),
    IN p_software_start_time int,
    IN p_pass_no int,
    IN p_pass_status varchar(2),
    IN p_bkup_field_1 varchar(32),
    IN p_bkup_field_2 int,
    IN p_bkup_field_3 decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_offer_server_name varchar(64);
    declare v_offer_server_ip varchar(64);
    declare v_mac_addr varchar(32);
    declare v_offer_name varchar(32);
    declare v_software_start_time int;
    declare v_pass_no int;
    declare v_pass_status varchar(2);
    declare v_bkup_field_1 varchar(32);
    declare v_bkup_field_2 int;
    declare v_bkup_field_3 decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_offer_server_name = p_offer_server_name;
    SET v_offer_server_ip = p_offer_server_ip;
    SET v_mac_addr = p_mac_addr;
    SET v_offer_name = p_offer_name;
    SET v_software_start_time = p_software_start_time;
    SET v_pass_no = p_pass_no;
    SET v_pass_status = p_pass_status;
    SET v_bkup_field_1 = p_bkup_field_1;
    SET v_bkup_field_2 = p_bkup_field_2;
    SET v_bkup_field_3 = p_bkup_field_3;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_报盘回写通道信息】*/
    call db_prod.pra_pdacco_TransWriteInPassInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_offer_server_name,
        v_offer_server_ip,
        v_mac_addr,
        v_offer_name,
        v_software_start_time,
        v_pass_no,
        v_pass_status,
        v_bkup_field_1,
        v_bkup_field_2,
        v_bkup_field_3,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.1.113.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_报盘回写通道信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_账户_修改产品索引值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdacco_ModiProductIndexValue;;
DELIMITER ;;
CREATE PROCEDURE prt_pdacco_ModiProductIndexValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_index_value_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no_str varchar(2048);
    declare v_index_value_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_split_str varchar(4);
    declare v_pd_no int;
    declare v_index_value int;
    declare v_pd_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_index_value_str = p_index_value_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_split_str = " ";
    SET v_pd_no = 0;
    SET v_index_value = 0;
    SET v_pd_status = "0";

    
    label_pro:BEGIN
    

    /* set @分隔符# = ";"; */
    set v_split_str = ";";

    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.1.114.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* while LOCATE(@分隔符#,@产品编号串#)<>0   do */
    while LOCATE(v_split_str,v_pd_no_str)<>0   do

          /* set @产品编号#=cast(substring(@产品编号串#,1,LOCATE(@分隔符#,@产品编号串#)-1) as SIGNED); */
          set v_pd_no=cast(substring(v_pd_no_str,1,LOCATE(v_split_str,v_pd_no_str)-1) as SIGNED);

          /* set @索引值#=cast(substring(@索引值串#,1,LOCATE(@分隔符#,@索引值串#)-1) as SIGNED); */
          set v_index_value=cast(substring(v_index_value_str,1,LOCATE(v_split_str,v_index_value_str)-1) as SIGNED);

          /* set @产品状态# = 0; */
          set v_pd_status = 0;

         /* 调用【原子_产品_账户_检查产品状态】*/
         call db_prod.pra_pdacco_CheckProductStatus(
             v_opor_co_no,
             v_opor_no,
             v_oper_mac,
             v_oper_ip_addr,
             v_oper_info,
             v_oper_way,
             v_func_code,
             v_pd_no,
             v_pd_status,
             v_error_code,
             v_error_info,
             v_co_no);
         if v_error_code = "1" then
             SET v_error_code = "prodT.1.114.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
             end if;
             leave label_pro;
         elseif v_error_code <> "0" then
             leave label_pro;
         end if;


          /* [事务开始] */
          START TRANSACTION;


               /* 调用【原子_产品_账户_修改产品索引值】*/
               call db_prod.pra_pdacco_ModiProductIndexValue(
                   v_opor_co_no,
                   v_opor_no,
                   v_oper_mac,
                   v_oper_ip_addr,
                   v_oper_info,
                   v_oper_way,
                   v_func_code,
                   v_init_date,
                   v_co_no,
                   v_pd_no,
                   v_index_value,
                   v_error_code,
                   v_error_info);
               if v_error_code = "1" then
                   SET v_error_code = "prodT.1.114.999";
                   if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_修改产品索引值出现错误！',v_mysql_message);
                   end if;
                   ROLLBACK;
                   leave label_pro;
               elseif v_error_code <> "0" then
                   ROLLBACK;
                   leave label_pro;
               end if;


          /* [事务结束] */
          COMMIT;


          /* set @产品编号串#=substring(@产品编号串#,LOCATE(@分隔符#,@产品编号串#)+1); */
          set v_pd_no_str=substring(v_pd_no_str,LOCATE(v_split_str,v_pd_no_str)+1);

          /* set @索引值串#=substring(@索引值串#,LOCATE(@分隔符#,@索引值串#)+1); */
          set v_index_value_str=substring(v_index_value_str,LOCATE(v_split_str,v_index_value_str)+1);
    end while;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


