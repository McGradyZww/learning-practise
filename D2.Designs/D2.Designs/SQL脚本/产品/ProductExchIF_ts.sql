DELIMITER ;;
use db_prod;;

# 事务_产品_交易接口_检查指令产品账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdexif_CheckApprProdAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdexif_CheckApprProdAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_comm_dir int,
    IN p_co_busi_config_str varchar(64),
    IN p_co_comm_appr_oper int,
    IN p_busi_config_str varchar(64),
    IN p_sys_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_asac_busi_config_str varchar(64),
    OUT p_split_fee_typr_str varchar(64),
    OUT p_busi_limit_str varchar(2048),
    OUT p_comm_appr_oper int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exter_comm_flag int,
    OUT p_market_price_ratio decimal(18,12),
    OUT p_comm_no_limit_price_ratio decimal(18,12),
    OUT p_cost_calc_type int,
    OUT p_comm_appr_set int,
    OUT p_appr_allow_order_flag int,
    OUT p_opor_no_str1 varchar(2048),
    OUT p_opor_no_str2 varchar(2048),
    OUT p_opor_no_str3 varchar(2048),
    OUT p_fina_limit_max decimal(18,4),
    OUT p_loan_limit_max decimal(18,4),
    OUT p_sys_type int,
    OUT p_asset_acco_type int,
    OUT p_sell_auto_back_debt int
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_comm_dir int;
    declare v_co_busi_config_str varchar(64);
    declare v_co_comm_appr_oper int;
    declare v_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_split_fee_typr_str varchar(64);
    declare v_busi_limit_str varchar(2048);
    declare v_comm_appr_oper int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exter_comm_flag int;
    declare v_market_price_ratio decimal(18,12);
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_cost_calc_type int;
    declare v_comm_appr_set int;
    declare v_appr_allow_order_flag int;
    declare v_opor_no_str1 varchar(2048);
    declare v_opor_no_str2 varchar(2048);
    declare v_opor_no_str3 varchar(2048);
    declare v_fina_limit_max decimal(18,4);
    declare v_loan_limit_max decimal(18,4);
    declare v_sys_type int;
    declare v_asset_acco_type int;
    declare v_sell_auto_back_debt int;
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);

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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_comm_dir = p_comm_dir;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_co_comm_appr_oper = p_co_comm_appr_oper;
    SET v_busi_config_str = p_busi_config_str;
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_asac_busi_config_str = " ";
    SET v_split_fee_typr_str = " ";
    SET v_busi_limit_str = " ";
    SET v_comm_appr_oper = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exter_comm_flag = 0;
    SET v_market_price_ratio = 0;
    SET v_comm_no_limit_price_ratio = 0;
    SET v_cost_calc_type = 0;
    SET v_comm_appr_set = 0;
    SET v_appr_allow_order_flag = 0;
    SET v_opor_no_str1 = " ";
    SET v_opor_no_str2 = " ";
    SET v_opor_no_str3 = " ";
    SET v_fina_limit_max = 0;
    SET v_loan_limit_max = 0;
    SET v_sys_type = 0;
    SET v_asset_acco_type = 0;
    SET v_sell_auto_back_debt = 0;
    SET v_exgp_avail_amt = 0;
    SET v_asac_avail_amt = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_交易接口_检查指令产品账户信息】*/
    call db_prod.pra_pdexif_CheckApprProdAccoInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_crncy_type,
        v_exch_no,
        v_stock_type,
        v_comm_dir,
        v_co_busi_config_str,
        v_co_comm_appr_oper,
        v_busi_config_str,
        v_sys_config_str,
        v_error_code,
        v_error_info,
        v_exgp_busi_config_str,
        v_asac_busi_config_str,
        v_split_fee_typr_str,
        v_comm_appr_oper,
        v_exgp_avail_amt,
        v_asac_avail_amt,
        v_pass_no,
        v_out_acco,
        v_exter_comm_flag,
        v_market_price_ratio,
        v_comm_no_limit_price_ratio,
        v_cost_calc_type,
        v_opor_no_str1,
        v_opor_no_str2,
        v_opor_no_str3,
        v_fina_limit_max,
        v_loan_limit_max,
        v_asset_acco_type,
        v_sell_auto_back_debt);
    if v_error_code = "1" then
        SET v_error_code = "prodT.8.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_交易接口_检查指令产品账户信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @指令审批设置# = substring(@资产账户业务控制配置串#,5,1); */
    set v_comm_appr_set = substring(v_asac_busi_config_str,5,1);

    /* set @审批通过自动下单# = substring(@资产账户业务控制配置串#,6,1); */
    set v_appr_allow_order_flag = substring(v_asac_busi_config_str,6,1);

    /* set @系统类型# =  substring(@系统控制配置串#, 7, 1); */
    set v_sys_type =  substring(v_sys_config_str, 7, 1);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_asac_busi_config_str = v_asac_busi_config_str;
    SET p_split_fee_typr_str = v_split_fee_typr_str;
    SET p_busi_limit_str = v_busi_limit_str;
    SET p_comm_appr_oper = v_comm_appr_oper;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_market_price_ratio = v_market_price_ratio;
    SET p_comm_no_limit_price_ratio = v_comm_no_limit_price_ratio;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_comm_appr_set = v_comm_appr_set;
    SET p_appr_allow_order_flag = v_appr_allow_order_flag;
    SET p_opor_no_str1 = v_opor_no_str1;
    SET p_opor_no_str2 = v_opor_no_str2;
    SET p_opor_no_str3 = v_opor_no_str3;
    SET p_fina_limit_max = v_fina_limit_max;
    SET p_loan_limit_max = v_loan_limit_max;
    SET p_sys_type = v_sys_type;
    SET p_asset_acco_type = v_asset_acco_type;
    SET p_sell_auto_back_debt = v_sell_auto_back_debt;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_交易接口_检查指令产品账户批量信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdexif_CheckApprProdAccoBatchInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdexif_CheckApprProdAccoBatchInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_crncy_type_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_comm_dir_str varchar(2048),
    IN p_co_busi_config_str varchar(64),
    IN p_co_comm_appr_oper int,
    IN p_busi_config_str varchar(64),
    IN p_sys_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_asac_busi_config_str varchar(64),
    OUT p_split_fee_typr_str varchar(64),
    OUT p_busi_limit_str varchar(2048),
    OUT p_comm_appr_oper int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exter_comm_flag int,
    OUT p_market_price_ratio decimal(18,12),
    OUT p_comm_no_limit_price_ratio decimal(18,12),
    OUT p_cost_calc_type int,
    OUT p_comm_appr_set int,
    OUT p_appr_allow_order_flag int,
    OUT p_sys_type int,
    OUT p_opor_no_str1 varchar(2048),
    OUT p_opor_no_str2 varchar(2048),
    OUT p_opor_no_str3 varchar(2048),
    OUT p_asset_acco_type int
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_comm_dir_str varchar(2048);
    declare v_co_busi_config_str varchar(64);
    declare v_co_comm_appr_oper int;
    declare v_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_split_fee_typr_str varchar(64);
    declare v_busi_limit_str varchar(2048);
    declare v_comm_appr_oper int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exter_comm_flag int;
    declare v_market_price_ratio decimal(18,12);
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_cost_calc_type int;
    declare v_comm_appr_set int;
    declare v_appr_allow_order_flag int;
    declare v_sys_type int;
    declare v_opor_no_str1 varchar(2048);
    declare v_opor_no_str2 varchar(2048);
    declare v_opor_no_str3 varchar(2048);
    declare v_asset_acco_type int;
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);

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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_co_comm_appr_oper = p_co_comm_appr_oper;
    SET v_busi_config_str = p_busi_config_str;
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_asac_busi_config_str = " ";
    SET v_split_fee_typr_str = " ";
    SET v_busi_limit_str = " ";
    SET v_comm_appr_oper = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exter_comm_flag = 0;
    SET v_market_price_ratio = 0;
    SET v_comm_no_limit_price_ratio = 0;
    SET v_cost_calc_type = 0;
    SET v_comm_appr_set = 0;
    SET v_appr_allow_order_flag = 0;
    SET v_sys_type = 0;
    SET v_opor_no_str1 = " ";
    SET v_opor_no_str2 = " ";
    SET v_opor_no_str3 = " ";
    SET v_asset_acco_type = 0;
    SET v_exgp_avail_amt = 0;
    SET v_asac_avail_amt = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_交易接口_检查指令产品账户批量信息】*/
    call db_prod.pra_pdexif_CheckApprProdAccoBatchInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_crncy_type_str,
        v_exch_no_str,
        v_stock_type_str,
        v_comm_dir_str,
        v_co_busi_config_str,
        v_co_comm_appr_oper,
        v_busi_config_str,
        v_sys_config_str,
        v_error_code,
        v_error_info,
        v_exgp_busi_config_str,
        v_asac_busi_config_str,
        v_split_fee_typr_str,
        v_comm_appr_oper,
        v_exgp_avail_amt,
        v_asac_avail_amt,
        v_pass_no,
        v_out_acco,
        v_exter_comm_flag,
        v_market_price_ratio,
        v_comm_no_limit_price_ratio,
        v_cost_calc_type,
        v_opor_no_str1,
        v_opor_no_str2,
        v_opor_no_str3,
        v_asset_acco_type);
    if v_error_code = "1" then
        SET v_error_code = "prodT.8.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_交易接口_检查指令产品账户批量信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @指令审批设置# = substring(@资产账户业务控制配置串#,5,1); */
    set v_comm_appr_set = substring(v_asac_busi_config_str,5,1);

    /* set @审批通过自动下单# = substring(@资产账户业务控制配置串#,6,1); */
    set v_appr_allow_order_flag = substring(v_asac_busi_config_str,6,1);

    /* set @系统类型# =  substring(@系统控制配置串#, 7, 1); */
    set v_sys_type =  substring(v_sys_config_str, 7, 1);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_asac_busi_config_str = v_asac_busi_config_str;
    SET p_split_fee_typr_str = v_split_fee_typr_str;
    SET p_busi_limit_str = v_busi_limit_str;
    SET p_comm_appr_oper = v_comm_appr_oper;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_market_price_ratio = v_market_price_ratio;
    SET p_comm_no_limit_price_ratio = v_comm_no_limit_price_ratio;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_comm_appr_set = v_comm_appr_set;
    SET p_appr_allow_order_flag = v_appr_allow_order_flag;
    SET p_sys_type = v_sys_type;
    SET p_opor_no_str1 = v_opor_no_str1;
    SET p_opor_no_str2 = v_opor_no_str2;
    SET p_opor_no_str3 = v_opor_no_str3;
    SET p_asset_acco_type = v_asset_acco_type;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_交易接口_检查指令审批产品账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdexif_CheckCommApprProdAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdexif_CheckCommApprProdAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_comm_dir int,
    IN p_co_busi_config_str varchar(64),
    IN p_co_comm_appr_oper int,
    IN p_busi_config_str varchar(64),
    IN p_sys_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_asac_busi_config_str varchar(64),
    OUT p_split_fee_typr_str varchar(64),
    OUT p_busi_limit_str varchar(2048),
    OUT p_comm_appr_oper int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exter_comm_flag int,
    OUT p_market_price_ratio decimal(18,12),
    OUT p_comm_no_limit_price_ratio decimal(18,12),
    OUT p_cost_calc_type int,
    OUT p_comm_appr_set int,
    OUT p_appr_allow_order_flag int,
    OUT p_opor_no_str1 varchar(2048),
    OUT p_opor_no_str2 varchar(2048),
    OUT p_opor_no_str3 varchar(2048),
    OUT p_sys_type int,
    OUT p_asset_acco_type int
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_comm_dir int;
    declare v_co_busi_config_str varchar(64);
    declare v_co_comm_appr_oper int;
    declare v_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_split_fee_typr_str varchar(64);
    declare v_busi_limit_str varchar(2048);
    declare v_comm_appr_oper int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exter_comm_flag int;
    declare v_market_price_ratio decimal(18,12);
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_cost_calc_type int;
    declare v_comm_appr_set int;
    declare v_appr_allow_order_flag int;
    declare v_opor_no_str1 varchar(2048);
    declare v_opor_no_str2 varchar(2048);
    declare v_opor_no_str3 varchar(2048);
    declare v_sys_type int;
    declare v_asset_acco_type int;
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);

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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_comm_dir = p_comm_dir;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_co_comm_appr_oper = p_co_comm_appr_oper;
    SET v_busi_config_str = p_busi_config_str;
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_asac_busi_config_str = " ";
    SET v_split_fee_typr_str = " ";
    SET v_busi_limit_str = " ";
    SET v_comm_appr_oper = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exter_comm_flag = 0;
    SET v_market_price_ratio = 0;
    SET v_comm_no_limit_price_ratio = 0;
    SET v_cost_calc_type = 0;
    SET v_comm_appr_set = 0;
    SET v_appr_allow_order_flag = 0;
    SET v_opor_no_str1 = " ";
    SET v_opor_no_str2 = " ";
    SET v_opor_no_str3 = " ";
    SET v_sys_type = 0;
    SET v_asset_acco_type = 0;
    SET v_exgp_avail_amt = 0;
    SET v_asac_avail_amt = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_交易接口_检查指令审批产品账户信息】*/
    call db_prod.pra_pdexif_CheckCommApprProdAccoInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_crncy_type,
        v_exch_no,
        v_stock_type,
        v_comm_dir,
        v_co_busi_config_str,
        v_co_comm_appr_oper,
        v_busi_config_str,
        v_sys_config_str,
        v_error_code,
        v_error_info,
        v_exgp_busi_config_str,
        v_asac_busi_config_str,
        v_split_fee_typr_str,
        v_comm_appr_oper,
        v_exgp_avail_amt,
        v_asac_avail_amt,
        v_pass_no,
        v_out_acco,
        v_exter_comm_flag,
        v_market_price_ratio,
        v_comm_no_limit_price_ratio,
        v_cost_calc_type,
        v_opor_no_str1,
        v_opor_no_str2,
        v_opor_no_str3,
        v_asset_acco_type);
    if v_error_code = "1" then
        SET v_error_code = "prodT.8.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_交易接口_检查指令审批产品账户信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @指令审批设置# = substring(@资产账户业务控制配置串#,5,1); */
    set v_comm_appr_set = substring(v_asac_busi_config_str,5,1);

    /* set @审批通过自动下单# = substring(@资产账户业务控制配置串#,6,1); */
    set v_appr_allow_order_flag = substring(v_asac_busi_config_str,6,1);

    /* set @系统类型# =  substring(@系统控制配置串#, 7, 1); */
    set v_sys_type =  substring(v_sys_config_str, 7, 1);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_asac_busi_config_str = v_asac_busi_config_str;
    SET p_split_fee_typr_str = v_split_fee_typr_str;
    SET p_busi_limit_str = v_busi_limit_str;
    SET p_comm_appr_oper = v_comm_appr_oper;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_market_price_ratio = v_market_price_ratio;
    SET p_comm_no_limit_price_ratio = v_comm_no_limit_price_ratio;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_comm_appr_set = v_comm_appr_set;
    SET p_appr_allow_order_flag = v_appr_allow_order_flag;
    SET p_opor_no_str1 = v_opor_no_str1;
    SET p_opor_no_str2 = v_opor_no_str2;
    SET p_opor_no_str3 = v_opor_no_str3;
    SET p_sys_type = v_sys_type;
    SET p_asset_acco_type = v_asset_acco_type;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_交易接口_检查交易产品账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdexif_CheckExchProdAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdexif_CheckExchProdAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_code varchar(6),
    IN p_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_price_type int,
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_last_price decimal(16,9),
    IN p_co_busi_config_str varchar(64),
    IN p_busi_config_str varchar(64),
    IN p_sys_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_asac_busi_config_str varchar(64),
    OUT p_split_fee_typr_str varchar(64),
    OUT p_busi_limit_str varchar(2048),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_nav_asset decimal(18,4),
    OUT p_exter_comm_flag int,
    OUT p_market_price_ratio decimal(18,12),
    OUT p_market_price_type int,
    OUT p_cost_calc_type int,
    OUT p_order_market_price decimal(16,9),
    OUT p_sys_type int,
    OUT p_opor_no_str1 varchar(2048),
    OUT p_opor_no_str2 varchar(2048),
    OUT p_opor_no_str3 varchar(2048),
    OUT p_fina_limit_max decimal(18,4),
    OUT p_loan_limit_max decimal(18,4),
    OUT p_asset_acco_type int,
    OUT p_sell_auto_back_debt int
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_code varchar(6);
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_price_type int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_co_busi_config_str varchar(64);
    declare v_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_split_fee_typr_str varchar(64);
    declare v_busi_limit_str varchar(2048);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_nav_asset decimal(18,4);
    declare v_exter_comm_flag int;
    declare v_market_price_ratio decimal(18,12);
    declare v_market_price_type int;
    declare v_cost_calc_type int;
    declare v_order_market_price decimal(16,9);
    declare v_sys_type int;
    declare v_opor_no_str1 varchar(2048);
    declare v_opor_no_str2 varchar(2048);
    declare v_opor_no_str3 varchar(2048);
    declare v_fina_limit_max decimal(18,4);
    declare v_loan_limit_max decimal(18,4);
    declare v_asset_acco_type int;
    declare v_sell_auto_back_debt int;

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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_price_type = p_price_type;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_last_price = p_last_price;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_busi_config_str = p_busi_config_str;
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_asac_busi_config_str = " ";
    SET v_split_fee_typr_str = " ";
    SET v_busi_limit_str = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_nav_asset = 0;
    SET v_exter_comm_flag = 0;
    SET v_market_price_ratio = 0;
    SET v_market_price_type = 0;
    SET v_cost_calc_type = 0;
    SET v_order_market_price = 0;
    SET v_sys_type = 0;
    SET v_opor_no_str1 = " ";
    SET v_opor_no_str2 = " ";
    SET v_opor_no_str3 = " ";
    SET v_fina_limit_max = 0;
    SET v_loan_limit_max = 0;
    SET v_asset_acco_type = 0;
    SET v_sell_auto_back_debt = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_交易接口_检查交易产品账户信息】*/
    call db_prod.pra_pdexif_CheckExchProdAccoInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_stock_code,
        v_crncy_type,
        v_exch_no,
        v_stock_type,
        v_order_dir,
        v_co_busi_config_str,
        v_busi_config_str,
        v_sys_config_str,
        v_error_code,
        v_error_info,
        v_exgp_busi_config_str,
        v_asac_busi_config_str,
        v_pass_no,
        v_out_acco,
        v_split_fee_typr_str,
        v_nav_asset,
        v_exter_comm_flag,
        v_market_price_ratio,
        v_cost_calc_type,
        v_opor_no_str1,
        v_opor_no_str2,
        v_opor_no_str3,
        v_fina_limit_max,
        v_loan_limit_max,
        v_asset_acco_type,
        v_sell_auto_back_debt);
    if v_error_code = "1" then
        SET v_error_code = "prodT.8.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_交易接口_检查交易产品账户信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @系统类型# =  substring(@系统控制配置串#, 7, 1); */
    set v_sys_type =  substring(v_sys_config_str, 7, 1);

    /* set @订单市价价格# = @订单价格#; */
    set v_order_market_price = v_order_price;

    /* set @市价冻结方式# = substring(@资产账户业务控制配置串#,7,1); */
    set v_market_price_type = substring(v_asac_busi_config_str,7,1);

    /* if (@价格类型# <> 《价格类型-限价》 or (@价格类型# = 《价格类型-限价》 and  (@市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号# = 《市场编号-深港通证券交易所》))) and @价格类型# <> 《价格类型-增强限价盘》 and @价格类型# <> 《价格类型-竞价限价盘》 and @价格类型# <> 《价格类型-限价盘》 and @价格类型#<> 《价格类型-盘后固定价格》  then */
    if (v_price_type <> 1 or (v_price_type = 1 and  (v_exch_no = 3 or v_exch_no = 4))) and v_price_type <> 9 and v_price_type <> 10 and v_price_type <> 8 and v_price_type<> 12  then

        /* if @市价冻结方式# = 《市价冻结方式-涨跌停价》 then */
        if v_market_price_type = 1 then

            /* if @订单方向# = 《订单方向-买入》 then */
            if v_order_dir = 1 then

                /* set @订单市价价格# = @涨停价#; */
                set v_order_market_price = v_up_limit_price;
            else

                /* set @订单市价价格# = @跌停价#; */
                set v_order_market_price = v_down_limit_price;
            end if;

        /* elseif @市价冻结方式# = 《市价冻结方式-浮动比例》 then */
        elseif v_market_price_type = 3 then

            /* if @订单方向# = 《订单方向-买入》 then */
            if v_order_dir = 1 then

                /* set @订单市价价格# = @最新价# * (1+@市价冻结浮动比例#); */
                set v_order_market_price = v_last_price * (1+v_market_price_ratio);
            else

                /* set @订单市价价格# = @最新价# * (1-@市价冻结浮动比例#); */
                set v_order_market_price = v_last_price * (1-v_market_price_ratio);
            end if;
        else

            /* set @订单市价价格# = @最新价#; */
            set v_order_market_price = v_last_price;
        end if;

        /* set @订单市价价格# = Round(@订单市价价格#,2); */
        set v_order_market_price = Round(v_order_market_price,2);
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_asac_busi_config_str = v_asac_busi_config_str;
    SET p_split_fee_typr_str = v_split_fee_typr_str;
    SET p_busi_limit_str = v_busi_limit_str;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_nav_asset = v_nav_asset;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_market_price_ratio = v_market_price_ratio;
    SET p_market_price_type = v_market_price_type;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_order_market_price = v_order_market_price;
    SET p_sys_type = v_sys_type;
    SET p_opor_no_str1 = v_opor_no_str1;
    SET p_opor_no_str2 = v_opor_no_str2;
    SET p_opor_no_str3 = v_opor_no_str3;
    SET p_fina_limit_max = v_fina_limit_max;
    SET p_loan_limit_max = v_loan_limit_max;
    SET p_asset_acco_type = v_asset_acco_type;
    SET p_sell_auto_back_debt = v_sell_auto_back_debt;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_交易接口_检查交易产品账户批量信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdexif_CheckExchProdAccoBatchInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdexif_CheckExchProdAccoBatchInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_crncy_type_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_order_dir_str varchar(1024),
    IN p_order_price_str varchar(4096),
    IN p_price_type_str varchar(2048),
    IN p_up_limit_price_str varchar(4096),
    IN p_down_limit_price_str varchar(4096),
    IN p_last_price_str varchar(4096),
    IN p_co_busi_config_str varchar(64),
    IN p_busi_config_str varchar(64),
    IN p_split_str varchar(4),
    IN p_sys_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_asac_busi_config_str varchar(64),
    OUT p_split_fee_typr_str varchar(64),
    OUT p_busi_limit_str varchar(2048),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_nav_asset decimal(18,4),
    OUT p_exter_comm_flag int,
    OUT p_market_price_ratio decimal(18,12),
    OUT p_market_price_type int,
    OUT p_cost_calc_type int,
    OUT p_order_market_price_str varchar(4096),
    OUT p_sys_type int,
    OUT p_opor_no_str1 varchar(2048),
    OUT p_opor_no_str2 varchar(2048),
    OUT p_opor_no_str3 varchar(2048),
    OUT p_asset_acco_type int
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_order_dir_str varchar(1024);
    declare v_order_price_str varchar(4096);
    declare v_price_type_str varchar(2048);
    declare v_up_limit_price_str varchar(4096);
    declare v_down_limit_price_str varchar(4096);
    declare v_last_price_str varchar(4096);
    declare v_co_busi_config_str varchar(64);
    declare v_busi_config_str varchar(64);
    declare v_split_str varchar(4);
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_split_fee_typr_str varchar(64);
    declare v_busi_limit_str varchar(2048);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_nav_asset decimal(18,4);
    declare v_exter_comm_flag int;
    declare v_market_price_ratio decimal(18,12);
    declare v_market_price_type int;
    declare v_cost_calc_type int;
    declare v_order_market_price_str varchar(4096);
    declare v_sys_type int;
    declare v_opor_no_str1 varchar(2048);
    declare v_opor_no_str2 varchar(2048);
    declare v_opor_no_str3 varchar(2048);
    declare v_asset_acco_type int;
    declare v_tmp_order_price_str varchar(4096);
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_order_dir int;
    declare v_exch_no int;

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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_price_str = p_order_price_str;
    SET v_price_type_str = p_price_type_str;
    SET v_up_limit_price_str = p_up_limit_price_str;
    SET v_down_limit_price_str = p_down_limit_price_str;
    SET v_last_price_str = p_last_price_str;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_busi_config_str = p_busi_config_str;
    SET v_split_str = p_split_str;
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_asac_busi_config_str = " ";
    SET v_split_fee_typr_str = " ";
    SET v_busi_limit_str = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_nav_asset = 0;
    SET v_exter_comm_flag = 0;
    SET v_market_price_ratio = 0;
    SET v_market_price_type = 0;
    SET v_cost_calc_type = 0;
    SET v_order_market_price_str = " ";
    SET v_sys_type = 0;
    SET v_opor_no_str1 = " ";
    SET v_opor_no_str2 = " ";
    SET v_opor_no_str3 = " ";
    SET v_asset_acco_type = 0;
    SET v_tmp_order_price_str = " ";
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_order_dir = 0;
    SET v_exch_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_交易接口_检查交易产品账户批量信息】*/
    call db_prod.pra_pdexif_CheckExchProdAccoBatchInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_crncy_type_str,
        v_exch_no_str,
        v_stock_type_str,
        v_order_dir_str,
        v_co_busi_config_str,
        v_busi_config_str,
        v_split_str,
        v_sys_config_str,
        v_error_code,
        v_error_info,
        v_exgp_busi_config_str,
        v_asac_busi_config_str,
        v_pass_no,
        v_out_acco,
        v_split_fee_typr_str,
        v_nav_asset,
        v_exter_comm_flag,
        v_market_price_ratio,
        v_cost_calc_type,
        v_opor_no_str1,
        v_opor_no_str2,
        v_opor_no_str3,
        v_asset_acco_type);
    if v_error_code = "1" then
        SET v_error_code = "prodT.8.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_交易接口_检查交易产品账户批量信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @系统类型# =  substring(@系统控制配置串#, 7, 1); */
    set v_sys_type =  substring(v_sys_config_str, 7, 1);

    /* set @市价冻结方式# = substring(@资产账户业务控制配置串#,7,1); */
    set v_market_price_type = substring(v_asac_busi_config_str,7,1);

    /* set @订单市价价格串# = ""; */
    set v_order_market_price_str = "";

    /* set @临时_订单价格串# = ""; */
    set v_tmp_order_price_str = "";
    #重新计算订单价格，主要是费用计算需要使用

    /* while LOCATE(@分隔符#,@价格类型串#)<>0   do */
    while LOCATE(v_split_str,v_price_type_str)<>0   do
        #截取前面每一位

        /* set @价格类型#=cast(substring(@价格类型串#,1,LOCATE(@分隔符#,@价格类型串#)-1)  as SIGNED); */
        set v_price_type=cast(substring(v_price_type_str,1,LOCATE(v_split_str,v_price_type_str)-1)  as SIGNED);

        /* set @订单价格#=cast(substring(@订单价格串#,1,LOCATE(@分隔符#,@订单价格串#)-1) as decimal(16,9)); */
        set v_order_price=cast(substring(v_order_price_str,1,LOCATE(v_split_str,v_order_price_str)-1) as decimal(16,9));

        /* set @涨停价#=cast(substring(@涨停价串#,1,LOCATE(@分隔符#,@涨停价串#)-1) as decimal(16,9)); */
        set v_up_limit_price=cast(substring(v_up_limit_price_str,1,LOCATE(v_split_str,v_up_limit_price_str)-1) as decimal(16,9));

        /* set @跌停价#=cast(substring(@跌停价串#,1,LOCATE(@分隔符#,@跌停价串#)-1) as decimal(16,9)); */
        set v_down_limit_price=cast(substring(v_down_limit_price_str,1,LOCATE(v_split_str,v_down_limit_price_str)-1) as decimal(16,9));

        /* set @最新价#=cast(substring(@最新价串#,1,LOCATE(@分隔符#,@最新价串#)-1) as decimal(16,9)); */
        set v_last_price=cast(substring(v_last_price_str,1,LOCATE(v_split_str,v_last_price_str)-1) as decimal(16,9));

        /* set @订单方向#=cast(substring(@订单方向串#,1,LOCATE(@分隔符#,@订单方向串#)-1)  as SIGNED); */
        set v_order_dir=cast(substring(v_order_dir_str,1,LOCATE(v_split_str,v_order_dir_str)-1)  as SIGNED);
        #计算市价的价格

        /* if (@价格类型# <> 《价格类型-限价》 or (@价格类型# = 《价格类型-限价》 and  (@市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号# = 《市场编号-深港通证券交易所》))) and @价格类型# <> 《价格类型-增强限价盘》 and @价格类型# <> 《价格类型-竞价限价盘》 and @价格类型# <> 《价格类型-限价盘》 then */
        if (v_price_type <> 1 or (v_price_type = 1 and  (v_exch_no = 3 or v_exch_no = 4))) and v_price_type <> 9 and v_price_type <> 10 and v_price_type <> 8 then

            /* if @市价冻结方式# = 《市价冻结方式-涨跌停价》 then */
            if v_market_price_type = 1 then

                /* if @订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-基金申购》 then */
                if v_order_dir = 1 or v_order_dir = 9 then

                    /* set @订单价格# = @涨停价#; */
                    set v_order_price = v_up_limit_price;
                else

                    /* set @订单价格# = @跌停价#; */
                    set v_order_price = v_down_limit_price;
                end if;

            /* elseif @市价冻结方式# = 《市价冻结方式-浮动比例》 then */
            elseif v_market_price_type = 3 then

                /* if @订单方向# = 《订单方向-买入》 then */
                if v_order_dir = 1 then

                    /* set @订单价格# = @最新价# * (1+@市价冻结浮动比例#); */
                    set v_order_price = v_last_price * (1+v_market_price_ratio);
                else

                    /* set @订单价格# = @最新价# * (1-@市价冻结浮动比例#); */
                    set v_order_price = v_last_price * (1-v_market_price_ratio);
                end if;
            else

                /* set @订单价格# = @最新价#; */
                set v_order_price = v_last_price;
            end if;
        end if;

        /* set @临时_订单价格串# = concat(@临时_订单价格串#,@订单价格#,";"); */
        set v_tmp_order_price_str = concat(v_tmp_order_price_str,v_order_price,";");

        /* set @价格类型串#=substring(@价格类型串#,LOCATE(@分隔符#,@价格类型串#)+1); */
        set v_price_type_str=substring(v_price_type_str,LOCATE(v_split_str,v_price_type_str)+1);

        /* set @订单价格串#=substring(@订单价格串#,LOCATE(@分隔符#,@订单价格串#)+1); */
        set v_order_price_str=substring(v_order_price_str,LOCATE(v_split_str,v_order_price_str)+1);

        /* set @涨停价串#=substring(@涨停价串#,LOCATE(@分隔符#,@涨停价串#)+1); */
        set v_up_limit_price_str=substring(v_up_limit_price_str,LOCATE(v_split_str,v_up_limit_price_str)+1);

        /* set @跌停价串#=substring(@跌停价串#,LOCATE(@分隔符#,@跌停价串#)+1); */
        set v_down_limit_price_str=substring(v_down_limit_price_str,LOCATE(v_split_str,v_down_limit_price_str)+1);

        /* set @最新价串#=substring(@最新价串#,LOCATE(@分隔符#,@最新价串#)+1); */
        set v_last_price_str=substring(v_last_price_str,LOCATE(v_split_str,v_last_price_str)+1);
    end while;

    /* set @订单市价价格串# = @临时_订单价格串#; */
    set v_order_market_price_str = v_tmp_order_price_str;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_asac_busi_config_str = v_asac_busi_config_str;
    SET p_split_fee_typr_str = v_split_fee_typr_str;
    SET p_busi_limit_str = v_busi_limit_str;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_nav_asset = v_nav_asset;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_market_price_ratio = v_market_price_ratio;
    SET p_market_price_type = v_market_price_type;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_order_market_price_str = v_order_market_price_str;
    SET p_sys_type = v_sys_type;
    SET p_opor_no_str1 = v_opor_no_str1;
    SET p_opor_no_str2 = v_opor_no_str2;
    SET p_opor_no_str3 = v_opor_no_str3;
    SET p_asset_acco_type = v_asset_acco_type;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_交易接口_检查期货交易产品账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdexif_CheckFutuExchProdAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdexif_CheckFutuExchProdAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_contrc_type int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_co_busi_config_str varchar(64),
    IN p_busi_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_asac_busi_config_str varchar(64),
    OUT p_split_fee_typr_str varchar(64),
    OUT p_busi_limit_str varchar(2048),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_contrc_type int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_co_busi_config_str varchar(64);
    declare v_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_split_fee_typr_str varchar(64);
    declare v_busi_limit_str varchar(2048);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_contrc_type = p_contrc_type;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_busi_config_str = p_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_asac_busi_config_str = " ";
    SET v_split_fee_typr_str = " ";
    SET v_busi_limit_str = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_nav_asset = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_交易接口_检查期货交易产品账户信息】*/
    call db_prod.pra_pdexif_CheckFutuExchProdAccoInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_crncy_type,
        v_exch_no,
        v_contrc_type,
        v_order_dir,
        v_contrc_dir,
        v_co_busi_config_str,
        v_busi_config_str,
        v_error_code,
        v_error_info,
        v_exgp_busi_config_str,
        v_asac_busi_config_str,
        v_pass_no,
        v_out_acco,
        v_split_fee_typr_str,
        v_nav_asset);
    if v_error_code = "1" then
        SET v_error_code = "prodT.8.108.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_交易接口_检查期货交易产品账户信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_asac_busi_config_str = v_asac_busi_config_str;
    SET p_split_fee_typr_str = v_split_fee_typr_str;
    SET p_busi_limit_str = v_busi_limit_str;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_nav_asset = v_nav_asset;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_交易接口_检查期货指令产品账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdexif_CheckFutuCommProdAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdexif_CheckFutuCommProdAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_contrc_type int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_co_busi_config_str varchar(64),
    IN p_busi_config_str varchar(64),
    IN p_co_comm_appr_oper int,
    IN p_sys_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_asac_busi_config_str varchar(64),
    OUT p_split_fee_typr_str varchar(64),
    OUT p_busi_limit_str varchar(2048),
    OUT p_comm_appr_oper int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exter_comm_flag int,
    OUT p_market_price_ratio decimal(18,12),
    OUT p_comm_no_limit_price_ratio decimal(18,12),
    OUT p_cost_calc_type int,
    OUT p_comm_appr_set int,
    OUT p_appr_allow_order_flag int,
    OUT p_opor_no_str1 varchar(2048),
    OUT p_opor_no_str2 varchar(2048),
    OUT p_opor_no_str3 varchar(2048),
    OUT p_sys_type int
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_contrc_type int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_co_busi_config_str varchar(64);
    declare v_busi_config_str varchar(64);
    declare v_co_comm_appr_oper int;
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_split_fee_typr_str varchar(64);
    declare v_busi_limit_str varchar(2048);
    declare v_comm_appr_oper int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exter_comm_flag int;
    declare v_market_price_ratio decimal(18,12);
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_cost_calc_type int;
    declare v_comm_appr_set int;
    declare v_appr_allow_order_flag int;
    declare v_opor_no_str1 varchar(2048);
    declare v_opor_no_str2 varchar(2048);
    declare v_opor_no_str3 varchar(2048);
    declare v_sys_type int;

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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_contrc_type = p_contrc_type;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_busi_config_str = p_busi_config_str;
    SET v_co_comm_appr_oper = p_co_comm_appr_oper;
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_asac_busi_config_str = " ";
    SET v_split_fee_typr_str = " ";
    SET v_busi_limit_str = " ";
    SET v_comm_appr_oper = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exter_comm_flag = 0;
    SET v_market_price_ratio = 0;
    SET v_comm_no_limit_price_ratio = 0;
    SET v_cost_calc_type = 0;
    SET v_comm_appr_set = 0;
    SET v_appr_allow_order_flag = 0;
    SET v_opor_no_str1 = " ";
    SET v_opor_no_str2 = " ";
    SET v_opor_no_str3 = " ";
    SET v_sys_type = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_交易接口_检查期货指令产品账户信息】*/
    call db_prod.pra_pdexif_CheckFutuCommProdAccoInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_crncy_type,
        v_exch_no,
        v_contrc_type,
        v_order_dir,
        v_contrc_dir,
        v_co_busi_config_str,
        v_busi_config_str,
        v_co_comm_appr_oper,
        v_sys_config_str,
        v_error_code,
        v_error_info,
        v_exgp_busi_config_str,
        v_asac_busi_config_str,
        v_split_fee_typr_str,
        v_busi_limit_str,
        v_comm_appr_oper,
        v_pass_no,
        v_out_acco,
        v_exter_comm_flag,
        v_market_price_ratio,
        v_comm_no_limit_price_ratio,
        v_cost_calc_type,
        v_comm_appr_set,
        v_opor_no_str1,
        v_opor_no_str2,
        v_opor_no_str3);
    if v_error_code = "1" then
        SET v_error_code = "prodT.8.109.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_交易接口_检查期货指令产品账户信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @指令审批设置# = substring(@资产账户业务控制配置串#,5,1); */
    set v_comm_appr_set = substring(v_asac_busi_config_str,5,1);

    /* set @审批通过自动下单# = substring(@资产账户业务控制配置串#,6,1); */
    set v_appr_allow_order_flag = substring(v_asac_busi_config_str,6,1);

    /* set @系统类型# =  substring(@系统控制配置串#, 7, 1); */
    set v_sys_type =  substring(v_sys_config_str, 7, 1);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_asac_busi_config_str = v_asac_busi_config_str;
    SET p_split_fee_typr_str = v_split_fee_typr_str;
    SET p_busi_limit_str = v_busi_limit_str;
    SET p_comm_appr_oper = v_comm_appr_oper;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_market_price_ratio = v_market_price_ratio;
    SET p_comm_no_limit_price_ratio = v_comm_no_limit_price_ratio;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_comm_appr_set = v_comm_appr_set;
    SET p_appr_allow_order_flag = v_appr_allow_order_flag;
    SET p_opor_no_str1 = v_opor_no_str1;
    SET p_opor_no_str2 = v_opor_no_str2;
    SET p_opor_no_str3 = v_opor_no_str3;
    SET p_sys_type = v_sys_type;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_交易接口_检查期货审批产品账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdexif_CheckFutuApprProdAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdexif_CheckFutuApprProdAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_contrc_type int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_co_busi_config_str varchar(64),
    IN p_busi_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_asac_busi_config_str varchar(64),
    OUT p_split_fee_typr_str varchar(64),
    OUT p_busi_limit_str varchar(2048),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_contrc_type int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_co_busi_config_str varchar(64);
    declare v_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_split_fee_typr_str varchar(64);
    declare v_busi_limit_str varchar(2048);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_contrc_type = p_contrc_type;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_busi_config_str = p_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_asac_busi_config_str = " ";
    SET v_split_fee_typr_str = " ";
    SET v_busi_limit_str = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_nav_asset = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_交易接口_检查期货审批产品账户信息】*/
    call db_prod.pra_pdexif_CheckFutuApprProdAccoInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_crncy_type,
        v_exch_no,
        v_contrc_type,
        v_order_dir,
        v_contrc_dir,
        v_co_busi_config_str,
        v_busi_config_str,
        v_error_code,
        v_error_info,
        v_exgp_busi_config_str,
        v_asac_busi_config_str,
        v_pass_no,
        v_out_acco,
        v_split_fee_typr_str,
        v_nav_asset);
    if v_error_code = "1" then
        SET v_error_code = "prodT.8.110.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_交易接口_检查期货审批产品账户信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_asac_busi_config_str = v_asac_busi_config_str;
    SET p_split_fee_typr_str = v_split_fee_typr_str;
    SET p_busi_limit_str = v_busi_limit_str;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_nav_asset = v_nav_asset;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_交易接口_获取资产账户默认交易组编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdexif_GetAccoDefaultExgp;;
DELIMITER ;;
CREATE PROCEDURE prt_pdexif_GetAccoDefaultExgp(
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
    OUT p_exch_group_no int
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
    declare v_exch_group_no int;

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
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_交易接口_获取资产账户默认交易组编号】*/
    call db_prod.pra_pdexif_GetAccoDefaultExgp(
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
        v_exch_group_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.8.111.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_交易接口_获取资产账户默认交易组编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no = v_exch_group_no;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_交易接口_获取融资融券卖券还款方式
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdexif_GetFinaLoanRepaymentWay;;
DELIMITER ;;
CREATE PROCEDURE prt_pdexif_GetFinaLoanRepaymentWay(
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
    IN p_order_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_fina_return_type int,
    OUT p_sell_auto_back_debt int
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
    declare v_order_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_fina_return_type int;
    declare v_sell_auto_back_debt int;

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
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_fina_return_type = 0;
    SET v_sell_auto_back_debt = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_交易接口_获取融资融券卖券还款方式】*/
    call db_prod.pra_pdexif_GetFinaLoanRepaymentWay(
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
        v_order_dir,
        v_error_code,
        v_error_info,
        v_fina_return_type,
        v_sell_auto_back_debt);
    if v_error_code = "1" then
        SET v_error_code = "prodT.8.112.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_交易接口_获取融资融券卖券还款方式出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_fina_return_type = v_fina_return_type;
    SET p_sell_auto_back_debt = v_sell_auto_back_debt;

END;;


