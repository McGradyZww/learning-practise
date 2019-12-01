DELIMITER ;;
use db_clsecu;;

# 事务_清算证券_清算_转入成交记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_AddOutBusi;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_AddOutBusi(
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
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_exch_rate decimal(18,12),
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_target_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_no int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_trade_tax decimal(18,4),
    IN p_trade_cost_fee decimal(18,4),
    IN p_trade_system_use_fee decimal(18,4),
    IN p_stock_settle_fee decimal(18,4),
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_net_price_flag int,
    IN p_arrive_date int,
    IN p_intrst_days int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_impawn_ratio decimal(18,12),
    IN p_clear_entry_type int,
    IN p_strike_deal_type int,
    IN p_busi_jour_no bigint,
    IN p_repo_pd_jour_no bigint,
    IN p_co_busi_config_str varchar(64),
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_net_price_flag int;
    declare v_arrive_date int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_clear_entry_type int;
    declare v_strike_deal_type int;
    declare v_busi_jour_no bigint;
    declare v_repo_pd_jour_no bigint;
    declare v_co_busi_config_str varchar(64);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_stock_code_no = p_target_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_no = p_order_no;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_trade_tax = p_trade_tax;
    SET v_trade_cost_fee = p_trade_cost_fee;
    SET v_trade_system_use_fee = p_trade_system_use_fee;
    SET v_stock_settle_fee = p_stock_settle_fee;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_net_price_flag = p_net_price_flag;
    SET v_arrive_date = p_arrive_date;
    SET v_intrst_days = p_intrst_days;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_clear_entry_type = p_clear_entry_type;
    SET v_strike_deal_type = p_strike_deal_type;
    SET v_busi_jour_no = p_busi_jour_no;
    SET v_repo_pd_jour_no = p_repo_pd_jour_no;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* if LENGTH(@机构业务控制配置串#) > 9 then */
        if LENGTH(v_co_busi_config_str) > 9 then

            /* set @清算入账类型#=substring(@机构业务控制配置串#, 9,1); */
            set v_clear_entry_type=substring(v_co_busi_config_str, 9,1);
        else

            /* set @清算入账类型# = 2; */
            set v_clear_entry_type = 2;
        end if;

        /* 调用【原子_清算证券_清算_转入成交记录】*/
        call db_clsecu.pra_clsecl_AddStrike(
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
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_exch_rate,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_stock_code_no,
            v_stock_type,
            v_asset_type,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_trade_tax,
            v_trade_cost_fee,
            v_trade_system_use_fee,
            v_stock_settle_fee,
            v_trade_code_no,
            v_target_code_no,
            v_capit_reback_days,
            v_posi_reback_days,
            v_net_price_flag,
            v_intrst_days,
            v_arrive_date,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_clear_entry_type,
            v_busi_jour_no,
            v_repo_pd_jour_no,
            v_strike_deal_type,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clsecuT.2.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_转入成交记录出现错误！',v_mysql_message);
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
use db_clsecu;;

# 事务_清算证券_清算_查询成交记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_QueryOutBusi;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_QueryOutBusi(
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
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_strike_date int,
    IN p_strike_no varchar(64),
    IN p_order_dir_str varchar(1024),
    IN p_deal_flag int,
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir_str varchar(1024);
    declare v_deal_flag int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_no = p_strike_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_deal_flag = p_deal_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";",@市场编号串#,";"); */
        set v_exch_no_str=concat(";",v_exch_no_str,";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";",@订单方向串#,";"); */
        set v_order_dir_str=concat(";",v_order_dir_str,";");
    end if;

    /* 调用【原子_清算证券_清算_查询成交记录】*/
    call db_clsecu.pra_clsecl_QueryOutBusi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_strike_no,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no_str,
        v_stock_acco_no,
        v_stock_code_no,
        v_order_dir_str,
        v_deal_flag,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "clsecuT.2.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_查询成交记录出现错误！',v_mysql_message);
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
use db_clsecu;;

# 事务_清算证券_清算_设置成交记录处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_UpdateBusiClearFlag;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_UpdateBusiClearFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_deal_flag int,
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
    declare v_deal_flag int;
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
    SET v_deal_flag = p_deal_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算证券_清算_设置成交记录处理标志】*/
        call db_clsecu.pra_clsecl_UpdateBusiClearFlag(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_deal_flag,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clsecuT.2.5.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_设置成交记录处理标志出现错误！',v_mysql_message);
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
use db_clsecu;;

# 事务_清算证券_清算_转入基金待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_AddFundPreEntryRecord;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_AddFundPreEntryRecord(
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
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_rate decimal(18,12),
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_target_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_no int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_num int,
    IN p_pre_entry_qty decimal(18,2),
    IN p_pre_entry_amt decimal(18,4),
    IN p_all_fee decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_trade_tax decimal(18,4),
    IN p_trade_cost_fee decimal(18,4),
    IN p_trade_system_use_fee decimal(18,4),
    IN p_stock_settle_fee decimal(18,4),
    IN p_busi_flag int,
    IN p_entry_status varchar(2),
    IN p_undo_status varchar(2),
    IN p_busi_jour_no bigint,
    IN p_entry_money_jour_no bigint,
    IN p_entry_exgp_posi_jour_no bigint,
    IN p_entry_asac_posi_jour_no bigint,
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_intrst_days int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_impawn_ratio decimal(18,12),
    IN p_arrive_date int,
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_busi_jour_no bigint;
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_arrive_date int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_stock_code_no = p_target_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_no = p_order_no;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_num = p_strike_num;
    SET v_pre_entry_qty = p_pre_entry_qty;
    SET v_pre_entry_amt = p_pre_entry_amt;
    SET v_all_fee = p_all_fee;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_trade_tax = p_trade_tax;
    SET v_trade_cost_fee = p_trade_cost_fee;
    SET v_trade_system_use_fee = p_trade_system_use_fee;
    SET v_stock_settle_fee = p_stock_settle_fee;
    SET v_busi_flag = p_busi_flag;
    SET v_entry_status = p_entry_status;
    SET v_undo_status = p_undo_status;
    SET v_busi_jour_no = p_busi_jour_no;
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_exgp_posi_jour_no = p_entry_exgp_posi_jour_no;
    SET v_entry_asac_posi_jour_no = p_entry_asac_posi_jour_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_intrst_days = p_intrst_days;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_arrive_date = p_arrive_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算证券_清算_转入基金待入账记录】*/
        call db_clsecu.pra_clsecl_AddFundPreEntryRecord(
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
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_rate,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_stock_code_no,
            v_stock_type,
            v_asset_type,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_strike_num,
            v_pre_entry_qty,
            v_pre_entry_amt,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_trade_tax,
            v_trade_cost_fee,
            v_trade_system_use_fee,
            v_stock_settle_fee,
            v_busi_flag,
            v_entry_status,
            v_undo_status,
            v_busi_jour_no,
            v_entry_money_jour_no,
            v_entry_exgp_posi_jour_no,
            v_entry_asac_posi_jour_no,
            v_trade_code_no,
            v_target_code_no,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_arrive_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clsecuT.2.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_转入基金待入账记录出现错误！',v_mysql_message);
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
use db_clsecu;;

# 事务_清算证券_清算_清算处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_DealClear;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_DealClear(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_qry_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_record_count int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_type int
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
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_record_count int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_pass_no int;
    declare v_exch_rate decimal(18,12);
    declare v_target_stock_code_no int;
    declare v_asset_type int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_chann_commis decimal(18,4);
    declare v_divi_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_arrive_date int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_repo_back_date int;
    declare v_clear_entry_type int;
    declare v_busi_jour_no bigint;
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_split_strike_flag int;
    declare v_busi_flag int;
    declare v_all_fee decimal(18,4);
    declare v_pre_entry_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);

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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_record_count = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_pass_no = 0;
    SET v_exch_rate = 0;
    SET v_target_stock_code_no = 0;
    SET v_asset_type = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_chann_commis = 0;
    SET v_divi_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_repo_back_date = 0;
    SET v_clear_entry_type = 0;
    SET v_busi_jour_no = 0;
    SET v_fee_qty = 0;
    SET v_fee_price = 0;
    SET v_split_strike_flag = 0;
    SET v_busi_flag = 0;
    SET v_all_fee = 0;
    SET v_pre_entry_amt = 0;
    SET v_pre_entry_qty = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算证券_清算_更新获取成交记录】*/
        call db_clsecu.pra_clsecl_UpdateGetStrike(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_qry_no,
            v_error_code,
            v_error_info,
            v_record_count,
            v_row_id,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_exch_rate,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_stock_code_no,
            v_stock_type,
            v_asset_type,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_chann_commis,
            v_divi_commis,
            v_trade_tax,
            v_trade_cost_fee,
            v_trade_system_use_fee,
            v_stock_settle_fee,
            v_trade_code_no,
            v_target_code_no,
            v_capit_reback_days,
            v_posi_reback_days,
            v_net_price_flag,
            v_intrst_days,
            v_par_value,
            v_arrive_date,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_repo_back_date,
            v_clear_entry_type);
        #if @记录个数# = 0 then
          #  set @错误编码# = "0";
          #  set @错误信息# = " ";
           # leave label_pro;
       # end if;

        /* set @成交流水号# = @记录序号#; */
        set v_busi_jour_no = v_row_id;

        /* set @费用数量#=@成交数量#; */
        set v_fee_qty=v_strike_qty;

        /* set @费用价格#=@成交价格#; */
        set v_fee_price=v_strike_price;
        #分笔成交标志，清算表中记录为分笔'0'，合并清算表为合笔'1'

        /* set @分笔成交标志# = 《分笔成交标志-单笔成交》; */
        set v_split_strike_flag = 1;

        /* if @订单数量#<>@成交数量# and @市场编号#<>5 then */
        if v_order_qty<>v_strike_qty and v_exch_no<>5 then

            /* set @分笔成交标志# = 《分笔成交标志-多笔成交》; */
            set v_split_strike_flag = 2;
        end if;
        #确定业务标志，业务标志由2位市场编号，1位业务类型（证券类型），3位业务编码组成

        /* set @业务标志# = 2000000; */
        set v_busi_flag = 2000000;
        #证券类型 1股票, 2债券, 3开放式基金, 4回购, 5衍生品

        /* if @证券类型# > 0 and @证券类型# < 20 then */
        if v_stock_type > 0 and v_stock_type < 20 then

            /* set @业务标志# = @业务标志# + 1000; */
            set v_busi_flag = v_busi_flag + 1000;

        /* elseif (@证券类型# > 20 and @证券类型# <= 25) or (@证券类型# > 28 and @证券类型# < 50) then */
        elseif (v_stock_type > 20 and v_stock_type <= 25) or (v_stock_type > 28 and v_stock_type < 50) then

            /* set @业务标志# = @业务标志# + 2000; */
            set v_busi_flag = v_busi_flag + 2000;

        /* elseif @证券类型# > 50 and @证券类型# < 70 then */
        elseif v_stock_type > 50 and v_stock_type < 70 then

            /* set @业务标志# = @业务标志# + 3000; */
            set v_busi_flag = v_busi_flag + 3000;

        /* elseif @证券类型# >= 26 and @证券类型# <= 27 then */
        elseif v_stock_type >= 26 and v_stock_type <= 27 then

            /* set @业务标志# = @业务标志# + 4000; */
            set v_busi_flag = v_busi_flag + 4000;

        /* elseif @证券类型# > 70 and @证券类型# < 200 then */
        elseif v_stock_type > 70 and v_stock_type < 200 then

            /* set @业务标志# = @业务标志# + 5000; */
            set v_busi_flag = v_busi_flag + 5000;
        end if;
        #订单方向

        /* if @订单方向# = 《订单方向-买入》 then */
        if v_order_dir = 1 then

            /* set @业务标志# = @业务标志# + 1; */
            set v_busi_flag = v_busi_flag + 1;

        /* elseif @订单方向# = 《订单方向-卖出》 or @订单方向# = 《订单方向-零股卖出》 then */
        elseif v_order_dir = 2 or v_order_dir = 31 then

            /* set @业务标志# = @业务标志# + 2; */
            set v_busi_flag = v_busi_flag + 2;

        /* elseif @订单方向# = 《订单方向-质押提交》 then */
        elseif v_order_dir = 21 then

            /* set @业务标志# = @业务标志# + 3; */
            set v_busi_flag = v_busi_flag + 3;

        /* elseif @订单方向# = 《订单方向-质押转回》 then */
        elseif v_order_dir = 22 then

            /* set @业务标志# = @业务标志# + 4; */
            set v_busi_flag = v_busi_flag + 4;

        /* elseif @订单方向# = 《订单方向-融资回购》 then */
        elseif v_order_dir = 3 then

            /* set @业务标志# = @业务标志# + 1; */
            set v_busi_flag = v_busi_flag + 1;

        /* elseif @订单方向# = 《订单方向-融券回购》 then */
        elseif v_order_dir = 4 then

            /* set @业务标志# = @业务标志# + 2; */
            set v_busi_flag = v_busi_flag + 2;
        end if;

        /* if @市场编号#=《市场编号-场外交易市场》 and @订单方向#=《订单方向-基金申购》 then */
        if v_exch_no=5 and v_order_dir=9 then

            /* set @业务标志#=《业务标志-基金申购》; */
            set v_busi_flag=2006001;

        /* elseif @市场编号#=《市场编号-场外交易市场》 and @订单方向#=《订单方向-基金赎回》 then */
        elseif v_exch_no=5 and v_order_dir=10 then

            /* set @业务标志#=《业务标志-基金赎回》; */
            set v_busi_flag=2006002;

        /* elseif @市场编号#=《市场编号-场外交易市场》 and @订单方向#=《订单方向-基金转换》 then */
        elseif v_exch_no=5 and v_order_dir=12 then

            /* set @业务标志#=《业务标志-基金转换》; */
            set v_busi_flag=2006003;
        end if;

        /* set @全部费用#=@印花税#+@过户费#+@经手费#+@证管费#+@其他费用#+@交易佣金#+@其他佣金#+@交易征费#+@交易费#+@交易系统使用费#+@股份交收费#; */
        set v_all_fee=v_stamp_tax+v_trans_fee+v_brkage_fee+v_SEC_charges+v_other_fee+v_trade_commis+v_other_commis+v_trade_tax+v_trade_cost_fee+v_trade_system_use_fee+v_stock_settle_fee;
        #如果买入

        /* if @订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-基金申购》 then */
        if v_order_dir = 1 or v_order_dir = 9 then
            #本次清算金额，为成交金额+全部费用

            /* set @待入账金额# = -(@成交金额# + @全部费用#); */
            set v_pre_entry_amt = -(v_strike_amt + v_all_fee);
            #本次清算数量为待入账数量，即成交数量

            /* set @待入账数量# = @成交数量#; */
            set v_pre_entry_qty = v_strike_qty;
            #如果是债券，则需要根据净价标准，计算利息成本金额和利息收益

            /* if @证券类型# > 20 and @证券类型# < 50 then */
            if v_stock_type > 20 and v_stock_type < 50 then

                /* if @净价标志#=《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
                if v_net_price_flag=1 and v_bond_rate_type <> 3 then

                    /* set @待入账金额# = @待入账金额# - @债券计提利息# * @成交数量#; */
                    set v_pre_entry_amt = v_pre_entry_amt - v_bond_accr_intrst * v_strike_qty;
                    #卖出时，净价需要把债券计提利息一起付，也即加上负值
                end if;
            end if;
        #如果卖出

        /* elseif @订单方向# = 《订单方向-卖出》 or @订单方向# = 《订单方向-零股卖出》 or @订单方向# = 《订单方向-基金赎回》 or @订单方向# = 《订单方向-基金转换》 then */
        elseif v_order_dir = 2 or v_order_dir = 31 or v_order_dir = 10 or v_order_dir = 12 then
            #本次清算金额，为成交金额-全部费用

            /* set @待入账金额# = @成交金额# - @全部费用#; */
            set v_pre_entry_amt = v_strike_amt - v_all_fee;
            #本次清算数量为待入账数量，即负的成交数量（卖出为负）

            /* set @待入账数量# = -@成交数量#; */
            set v_pre_entry_qty = -v_strike_qty;
            #基金转换的待入账数量是目标证券代码的成交数量,为正值

            /* if  @订单方向# = 《订单方向-基金转换》 then */
            if  v_order_dir = 12 then

                /* set @待入账数量#=-@成交数量#; */
                set v_pre_entry_qty=-v_strike_qty;
            end if;
            #如果是债券，则需要根据净价标准，计算利息成本金额和利息收益

            /* if @证券类型# > 20 and @证券类型# < 50 then */
            if v_stock_type > 20 and v_stock_type < 50 then

                /* if @净价标志#=《净价标志-净价》  and @债券利率类型# <> 《债券利率类型-零息》 then */
                if v_net_price_flag=1  and v_bond_rate_type <> 3 then
                    #卖出时，净价需要把债券计提利息加起来

                    /* set @待入账金额# = @待入账金额# + @债券计提利息# * @成交数量#; */
                    set v_pre_entry_amt = v_pre_entry_amt + v_bond_accr_intrst * v_strike_qty;
                end if;
            end if;
        #如果债券质押，成交数量为债券质押数量，同时标准券增加，其数量由质押比例获得，待入账金额实际费用应为0，目前暂不收费用，计算的费用为0

        /* elseif @订单方向# = 《订单方向-质押提交》 then */
        elseif v_order_dir = 21 then
            #本次清算金额，为-全部费用

            /* set @待入账金额# = - @全部费用#; */
            set v_pre_entry_amt = - v_all_fee;
            #本次清算数量为待入账数量，即冻结数量

            /* set @待入账数量# = -@成交数量#; */
            set v_pre_entry_qty = -v_strike_qty;
        #如果质押转回，成交数量为债券解押数量，同时标准券减少，其数量由质押比例获得，待入账金额实际费用应为0，目前暂不收费用，计算的费用为0

        /* elseif @订单方向# = 《订单方向-质押转回》 then */
        elseif v_order_dir = 22 then
            #本次清算金额，为-全部费用

            /* set @待入账金额# = - @全部费用#; */
            set v_pre_entry_amt = - v_all_fee;
            #本次清算数量为待入账数量，即解冻数量

            /* set @待入账数量# = @成交数量#; */
            set v_pre_entry_qty = v_strike_qty;
        #如果融资回购，待入账金额为费用之和，成交数量为标准券冻结数量

        /* elseif @订单方向# = 《订单方向-融资回购》 then */
        elseif v_order_dir = 3 then
            #本次清算金额，为融资获得的成交金额

            /* set @待入账金额# = @票面面值# * @成交数量# - @全部费用#; */
            set v_pre_entry_amt = v_par_value * v_strike_qty - v_all_fee;
            #本次清算数量为待入账数量，即冻结的标准券数量

            /* set @待入账数量# = -@成交数量#; */
            set v_pre_entry_qty = -v_strike_qty;
        #如果融券回购，待入账金额为费用之和，成交数量为0，实际是交易所代替控制了对方的标准券数量

        /* elseif @订单方向# = 《订单方向-融券回购》 then */
        elseif v_order_dir = 4 then
            #本次清算金额，为融券需要扣除的成交金额

            /* set @待入账金额# = - (@票面面值# * @成交数量# + @全部费用#); */
            set v_pre_entry_amt = - (v_par_value * v_strike_qty + v_all_fee);
            #本次清算数量为待入账数量，为0

            /* set @待入账数量# = @成交数量#; */
            set v_pre_entry_qty = v_strike_qty;
        end if;

        /* 调用【原子_清算证券_清算_清算处理】*/
        call db_clsecu.pra_clsecl_DealClear(
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
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_exch_rate,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_stock_code_no,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_pre_entry_amt,
            v_pre_entry_qty,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_trade_tax,
            v_trade_cost_fee,
            v_trade_system_use_fee,
            v_stock_settle_fee,
            v_busi_jour_no,
            v_clear_entry_type,
            v_stock_type,
            v_asset_type,
            v_trade_code_no,
            v_target_code_no,
            v_impawn_ratio,
            v_intrst_days,
            v_arrive_date,
            v_net_price_flag,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_par_value,
            v_capit_reback_days,
            v_posi_reback_days,
            v_repo_back_date,
            v_split_strike_flag,
            v_busi_flag,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clsecuT.2.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_清算处理出现错误！',v_mysql_message);
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
    SET p_record_count = v_record_count;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;

END;;


DELIMITER ;;
use db_clsecu;;

# 事务_清算证券_清算_更新获取合并清算记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_UpdateGetMergeClear;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_UpdateGetMergeClear(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_row_id bigint,
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_exch_rate decimal(18,12),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_strike_date int,
    OUT p_strike_time int,
    OUT p_strike_no varchar(64),
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_no int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_strike_num int,
    OUT p_strike_aver_price decimal(16,9),
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_split_strike_qty decimal(18,2),
    OUT p_split_strike_amt decimal(18,4),
    OUT p_split_stamp_tax decimal(18,4),
    OUT p_split_trans_fee decimal(18,4),
    OUT p_split_brkage decimal(18,4),
    OUT p_split_SEC_charges decimal(18,4),
    OUT p_split_other_fee decimal(18,4),
    OUT p_split_brkage_commis decimal(18,4),
    OUT p_split_chann_commis decimal(18,4),
    OUT p_split_divi_commis decimal(18,4),
    OUT p_split_other_commis decimal(18,4),
    OUT p_split_trade_tax decimal(18,4),
    OUT p_split_trade_cost_fee decimal(18,4),
    OUT p_split_trade_system_use_fee decimal(18,4),
    OUT p_split_stock_settle_fee decimal(18,4),
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_clear_entry_type int,
    OUT p_bond_rate_type int,
    OUT p_busi_flag int,
    OUT p_deal_flag int,
    OUT p_arrive_date int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_row_id bigint;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_num int;
    declare v_strike_aver_price decimal(16,9);
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_split_strike_qty decimal(18,2);
    declare v_split_strike_amt decimal(18,4);
    declare v_split_stamp_tax decimal(18,4);
    declare v_split_trans_fee decimal(18,4);
    declare v_split_brkage decimal(18,4);
    declare v_split_SEC_charges decimal(18,4);
    declare v_split_other_fee decimal(18,4);
    declare v_split_brkage_commis decimal(18,4);
    declare v_split_chann_commis decimal(18,4);
    declare v_split_divi_commis decimal(18,4);
    declare v_split_other_commis decimal(18,4);
    declare v_split_trade_tax decimal(18,4);
    declare v_split_trade_cost_fee decimal(18,4);
    declare v_split_trade_system_use_fee decimal(18,4);
    declare v_split_stock_settle_fee decimal(18,4);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_impawn_ratio decimal(18,12);
    declare v_clear_entry_type int;
    declare v_bond_rate_type int;
    declare v_busi_flag int;
    declare v_deal_flag int;
    declare v_arrive_date int;

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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_exch_rate = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_strike_num = 0;
    SET v_strike_aver_price = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_split_strike_qty = 0;
    SET v_split_strike_amt = 0;
    SET v_split_stamp_tax = 0;
    SET v_split_trans_fee = 0;
    SET v_split_brkage = 0;
    SET v_split_SEC_charges = 0;
    SET v_split_other_fee = 0;
    SET v_split_brkage_commis = 0;
    SET v_split_chann_commis = 0;
    SET v_split_divi_commis = 0;
    SET v_split_other_commis = 0;
    SET v_split_trade_tax = 0;
    SET v_split_trade_cost_fee = 0;
    SET v_split_trade_system_use_fee = 0;
    SET v_split_stock_settle_fee = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_impawn_ratio = 0;
    SET v_clear_entry_type = 0;
    SET v_bond_rate_type = 0;
    SET v_busi_flag = 0;
    SET v_deal_flag = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算证券_清算_更新获取合并清算记录】*/
        call db_clsecu.pra_clsecl_GetMergeClear(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_qry_no,
            v_error_code,
            v_error_info,
            v_record_count,
            v_row_id,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_exch_rate,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_strike_num,
            v_strike_aver_price,
            v_pre_entry_qty,
            v_pre_entry_amt,
            v_split_strike_qty,
            v_split_strike_amt,
            v_split_stamp_tax,
            v_split_trans_fee,
            v_split_brkage,
            v_split_SEC_charges,
            v_split_other_fee,
            v_split_brkage_commis,
            v_split_other_commis,
            v_split_trade_tax,
            v_split_trade_cost_fee,
            v_split_trade_system_use_fee,
            v_split_stock_settle_fee,
            v_stock_type,
            v_asset_type,
            v_trade_code_no,
            v_target_code_no,
            v_capit_reback_days,
            v_posi_reback_days,
            v_net_price_flag,
            v_intrst_days,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_clear_entry_type,
            v_busi_flag,
            v_deal_flag,
            v_arrive_date);
        #if @记录个数# = 0 then
          #  set @错误编码# = "0";
          # set @错误信息# = " ";
          #  leave label_pro;
        #end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;
    SET p_row_id = v_row_id;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_exch_rate = v_exch_rate;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_strike_date = v_strike_date;
    SET p_strike_time = v_strike_time;
    SET p_strike_no = v_strike_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_no = v_order_no;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_strike_num = v_strike_num;
    SET p_strike_aver_price = v_strike_aver_price;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_split_strike_qty = v_split_strike_qty;
    SET p_split_strike_amt = v_split_strike_amt;
    SET p_split_stamp_tax = v_split_stamp_tax;
    SET p_split_trans_fee = v_split_trans_fee;
    SET p_split_brkage = v_split_brkage;
    SET p_split_SEC_charges = v_split_SEC_charges;
    SET p_split_other_fee = v_split_other_fee;
    SET p_split_brkage_commis = v_split_brkage_commis;
    SET p_split_chann_commis = v_split_chann_commis;
    SET p_split_divi_commis = v_split_divi_commis;
    SET p_split_other_commis = v_split_other_commis;
    SET p_split_trade_tax = v_split_trade_tax;
    SET p_split_trade_cost_fee = v_split_trade_cost_fee;
    SET p_split_trade_system_use_fee = v_split_trade_system_use_fee;
    SET p_split_stock_settle_fee = v_split_stock_settle_fee;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_clear_entry_type = v_clear_entry_type;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_busi_flag = v_busi_flag;
    SET p_deal_flag = v_deal_flag;
    SET p_arrive_date = v_arrive_date;

END;;


DELIMITER ;;
use db_clsecu;;

# 事务_清算证券_清算_设置合并清算记录处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_UpdateMergeClearFlag;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_UpdateMergeClearFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_deal_flag int,
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
    declare v_deal_flag int;
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
    SET v_deal_flag = p_deal_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算证券_清算_设置合并清算记录处理标志】*/
        call db_clsecu.pra_clsecl_UpdateMergeClearFlag(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_deal_flag,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clsecuT.2.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_设置合并清算记录处理标志出现错误！',v_mysql_message);
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
use db_clsecu;;

# 事务_清算证券_清算_查询合并清算记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_QueryMergeClear;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_QueryMergeClear(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strike_date int,
    IN p_busi_flag int,
    IN p_deal_flag int,
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
    declare v_strike_date int;
    declare v_busi_flag int;
    declare v_deal_flag int;
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
    SET v_strike_date = p_strike_date;
    SET v_busi_flag = p_busi_flag;
    SET v_deal_flag = p_deal_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_清算证券_清算_查询合并清算记录】*/
    call db_clsecu.pra_clsecl_QueryMergeClear(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_strike_date,
        v_busi_flag,
        v_deal_flag,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "clsecuT.2.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_查询合并清算记录出现错误！',v_mysql_message);
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
use db_clsecu;;

# 事务_清算证券_清算_合并清算处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_DealMergeClear;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_DealMergeClear(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_rate decimal(18,12),
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_no int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_strike_aver_price decimal(16,9),
    IN p_strike_num int,
    IN p_split_strike_qty decimal(18,2),
    IN p_split_strike_amt decimal(18,4),
    IN p_split_stamp_tax decimal(18,4),
    IN p_split_trans_fee decimal(18,4),
    IN p_split_brkage decimal(18,4),
    IN p_split_SEC_charges decimal(18,4),
    IN p_split_other_fee decimal(18,4),
    IN p_split_brkage_commis decimal(18,4),
    IN p_split_other_commis decimal(18,4),
    IN p_split_trade_tax decimal(18,4),
    IN p_split_trade_cost_fee decimal(18,4),
    IN p_split_trade_system_use_fee decimal(18,4),
    IN p_split_stock_settle_fee decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_trade_tax decimal(18,4),
    IN p_trade_cost_fee decimal(18,4),
    IN p_trade_system_use_fee decimal(18,4),
    IN p_stock_settle_fee decimal(18,4),
    IN p_busi_flag int,
    IN p_net_price_flag int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_par_value decimal(16,9),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_impawn_ratio decimal(18,12),
    IN p_arrive_date int,
    IN p_intrst_days int,
    IN p_clear_entry_type int,
    IN p_split_fee_typr_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_jour_no bigint
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_aver_price decimal(16,9);
    declare v_strike_num int;
    declare v_split_strike_qty decimal(18,2);
    declare v_split_strike_amt decimal(18,4);
    declare v_split_stamp_tax decimal(18,4);
    declare v_split_trans_fee decimal(18,4);
    declare v_split_brkage decimal(18,4);
    declare v_split_SEC_charges decimal(18,4);
    declare v_split_other_fee decimal(18,4);
    declare v_split_brkage_commis decimal(18,4);
    declare v_split_other_commis decimal(18,4);
    declare v_split_trade_tax decimal(18,4);
    declare v_split_trade_cost_fee decimal(18,4);
    declare v_split_trade_system_use_fee decimal(18,4);
    declare v_split_stock_settle_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_busi_flag int;
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_par_value decimal(16,9);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_arrive_date int;
    declare v_intrst_days int;
    declare v_clear_entry_type int;
    declare v_split_fee_typr_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_jour_no bigint;
    declare v_split_strike_flag int;
    declare v_all_fee decimal(18,4);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_pre_entry_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);

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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_no = p_order_no;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_strike_aver_price = p_strike_aver_price;
    SET v_strike_num = p_strike_num;
    SET v_split_strike_qty = p_split_strike_qty;
    SET v_split_strike_amt = p_split_strike_amt;
    SET v_split_stamp_tax = p_split_stamp_tax;
    SET v_split_trans_fee = p_split_trans_fee;
    SET v_split_brkage = p_split_brkage;
    SET v_split_SEC_charges = p_split_SEC_charges;
    SET v_split_other_fee = p_split_other_fee;
    SET v_split_brkage_commis = p_split_brkage_commis;
    SET v_split_other_commis = p_split_other_commis;
    SET v_split_trade_tax = p_split_trade_tax;
    SET v_split_trade_cost_fee = p_split_trade_cost_fee;
    SET v_split_trade_system_use_fee = p_split_trade_system_use_fee;
    SET v_split_stock_settle_fee = p_split_stock_settle_fee;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_trade_tax = p_trade_tax;
    SET v_trade_cost_fee = p_trade_cost_fee;
    SET v_trade_system_use_fee = p_trade_system_use_fee;
    SET v_stock_settle_fee = p_stock_settle_fee;
    SET v_busi_flag = p_busi_flag;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_par_value = p_par_value;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_arrive_date = p_arrive_date;
    SET v_intrst_days = p_intrst_days;
    SET v_clear_entry_type = p_clear_entry_type;
    SET v_split_fee_typr_str = p_split_fee_typr_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_jour_no = 0;
    SET v_split_strike_flag = 0;
    SET v_all_fee = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_pre_entry_amt = 0;
    SET v_pre_entry_qty = 0;

    
    label_pro:BEGIN
    

    /* if @汇率# <> 1 and @汇率# > 0 then */
    if v_exch_rate <> 1 and v_exch_rate > 0 then

        /* set @印花税# = round(@印花税#*@汇率#, 2); */
        set v_stamp_tax = round(v_stamp_tax*v_exch_rate, 2);

        /* set @过户费# = round(@过户费#*@汇率#, 2); */
        set v_trans_fee = round(v_trans_fee*v_exch_rate, 2);

        /* set @经手费# = round(@经手费#*@汇率#, 2); */
        set v_brkage_fee = round(v_brkage_fee*v_exch_rate, 2);

        /* set @证管费# = round(@证管费#*@汇率#, 2); */
        set v_SEC_charges = round(v_SEC_charges*v_exch_rate, 2);

        /* set @其他费用# = round(@其他费用#*@汇率#, 2); */
        set v_other_fee = round(v_other_fee*v_exch_rate, 2);

        /* set @其他佣金# = round(@其他佣金#*@汇率#, 2); */
        set v_other_commis = round(v_other_commis*v_exch_rate, 2);

        /* set @交易征费# = round(@交易征费#*@汇率#, 2); */
        set v_trade_tax = round(v_trade_tax*v_exch_rate, 2);

        /* set @交易费# = round(@交易费#*@汇率#, 2); */
        set v_trade_cost_fee = round(v_trade_cost_fee*v_exch_rate, 2);

        /* set @股份交收费# = round(@股份交收费#*@汇率#, 2); */
        set v_stock_settle_fee = round(v_stock_settle_fee*v_exch_rate, 2);
    end if;
    #分笔成交标志，清算表中记录为分笔'1'，合并清算表为合笔'2'

    /* set @分笔成交标志# = 《分笔成交标志-多笔成交》; */
    set v_split_strike_flag = 2;

    /* if @清算入账类型#=《清算入账类型-分笔入账》 then */
    if v_clear_entry_type=1 then

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-印花税》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",1, ";"))>0 then

            /* set @印花税# = 0; */
            set v_stamp_tax = 0;
        else

            /* set @印花税# = @印花税# - @分笔累计印花税#; */
            set v_stamp_tax = v_stamp_tax - v_split_stamp_tax;
        end if;

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-过户费》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",2, ";"))>0 then

            /* set @过户费# = 0; */
            set v_trans_fee = 0;
        else

            /* set @过户费# = @过户费# - @分笔累计过户费#; */
            set v_trans_fee = v_trans_fee - v_split_trans_fee;
        end if;

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-经手费》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",3, ";"))>0 then

            /* set @经手费# = 0; */
            set v_brkage_fee = 0;
        else

            /* set @经手费# = @经手费# - @分笔累计经手费#; */
            set v_brkage_fee = v_brkage_fee - v_split_brkage;
        end if;

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-证管费》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",4, ";"))>0 then

            /* set @证管费# = 0; */
            set v_SEC_charges = 0;
        else

            /* set @证管费# = @证管费# - @分笔累计证管费#; */
            set v_SEC_charges = v_SEC_charges - v_split_SEC_charges;
        end if;

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-其他费用》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",5, ";"))>0 then

            /* set @其他费用# = 0; */
            set v_other_fee = 0;
        else

            /* set @其他费用# = @其他费用# - @分笔累计其他费用#; */
            set v_other_fee = v_other_fee - v_split_other_fee;
        end if;

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-交易佣金》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",7, ";"))>0 then

            /* set @交易佣金# = 0; */
            set v_trade_commis = 0;
        else

            /* set @交易佣金# = @交易佣金# - @分笔累计交易佣金#; */
            set v_trade_commis = v_trade_commis - v_split_brkage_commis;
        end if;

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-其他佣金》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",9, ";"))>0 then

            /* set @其他佣金# = 0; */
            set v_other_commis = 0;
        else

            /* set @其他佣金# = @其他佣金# - @分笔累计其他佣金#; */
            set v_other_commis = v_other_commis - v_split_other_commis;
        end if;
        #港股费用处理

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-交易征费》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",10, ";"))>0 then

            /* set @交易征费# = 0; */
            set v_trade_tax = 0;
        else

            /* set @交易征费# = @交易征费# - @分笔累计交易征费#; */
            set v_trade_tax = v_trade_tax - v_split_trade_tax;
        end if;

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-交易费》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",11, ";"))>0 then

            /* set @交易费# = 0; */
            set v_trade_cost_fee = 0;
        else

            /* set @交易费# = @交易费# - @分笔累计交易费#; */
            set v_trade_cost_fee = v_trade_cost_fee - v_split_trade_cost_fee;
        end if;

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-股份交收费》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",13, ";"))>0 then

            /* set @股份交收费# = 0; */
            set v_stock_settle_fee = 0;
        else

            /* set @股份交收费# = @股份交收费# -@分笔累计股份交收费#; */
            set v_stock_settle_fee = v_stock_settle_fee -v_split_stock_settle_fee;
        end if;

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-交易系统使用费》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",12, ";"))>0 then

            /* set @交易系统使用费# = 0; */
            set v_trade_system_use_fee = 0;
        else

            /* set @交易系统使用费# = @交易系统使用费# -@分笔累计交易系统使用费#; */
            set v_trade_system_use_fee = v_trade_system_use_fee -v_split_trade_system_use_fee;
        end if;

        /* set @全部费用#=@印花税#+@过户费#+@经手费#+@证管费#+@其他费用#+@交易佣金#+@其他佣金#+@交易征费#+@交易费#+@股份交收费#; */
        set v_all_fee=v_stamp_tax+v_trans_fee+v_brkage_fee+v_SEC_charges+v_other_fee+v_trade_commis+v_other_commis+v_trade_tax+v_trade_cost_fee+v_stock_settle_fee;
        #因为合并清算表记录的是费用差额，相关成交价格、成交数量、成交金额全部记0值

        /* set @成交价格# = 0; */
        set v_strike_price = 0;

        /* set @成交数量# = 0; */
        set v_strike_qty = 0;

        /* set @成交金额# = 0; */
        set v_strike_amt = 0;
        #本次合并清算待入账金额，无论买卖，都是费用差额

        /* set @待入账金额# = -@全部费用#; */
        set v_pre_entry_amt = -v_all_fee;
        #本次合并清算待入账数量，为0

        /* set @待入账数量# = 0; */
        set v_pre_entry_qty = 0;
    else

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-印花税》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",1, ";"))>0 then

            /* set @印花税# = @分笔累计印花税#; */
            set v_stamp_tax = v_split_stamp_tax;
        end if;

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-过户费》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",2, ";"))>0 then

            /* set @过户费# = @分笔累计过户费#; */
            set v_trans_fee = v_split_trans_fee;
        end if;

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-经手费》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",3, ";"))>0 then

            /* set @经手费# = @分笔累计经手费#; */
            set v_brkage_fee = v_split_brkage;
        end if;

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-证管费》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",4, ";"))>0 then

            /* set @证管费# = @分笔累计证管费#; */
            set v_SEC_charges = v_split_SEC_charges;
        end if;

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-其他费用》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",5, ";"))>0 then

            /* set @其他费用# = @分笔累计其他费用#; */
            set v_other_fee = v_split_other_fee;
        end if;

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-交易佣金》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",7, ";"))>0 then

            /* set @交易佣金# = @分笔累计交易佣金#; */
            set v_trade_commis = v_split_brkage_commis;
        end if;

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-其他佣金》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",9, ";"))>0 then

            /* set @其他佣金# = @分笔累计其他佣金#; */
            set v_other_commis = v_split_other_commis;
        end if;

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-交易征费》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",10, ";"))>0 then

            /* set @交易征费# = @分笔累计交易征费#; */
            set v_trade_tax = v_split_trade_tax;
        end if;

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-交易费》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",11, ";"))>0 then

            /* set @交易费# = @分笔累计交易费#; */
            set v_trade_cost_fee = v_split_trade_cost_fee;
        end if;

        /* if instr(@分笔费用类型串#, concat(";",《证券费用类型-股份交收费》, ";"))>0 then */
        if instr(v_split_fee_typr_str, concat(";",13, ";"))>0 then

            /* set @股份交收费# = @分笔累计股份交收费#; */
            set v_stock_settle_fee = v_split_stock_settle_fee;
        end if;

        /* set @交易系统使用费# = @分笔累计交易系统使用费#; */
        set v_trade_system_use_fee = v_split_trade_system_use_fee;

        /* set @全部费用#=@印花税#+@过户费#+@经手费#+@证管费#+@其他费用#+@交易佣金#+@其他佣金#+@交易征费#+@交易费#+@交易系统使用费#+@股份交收费#; */
        set v_all_fee=v_stamp_tax+v_trans_fee+v_brkage_fee+v_SEC_charges+v_other_fee+v_trade_commis+v_other_commis+v_trade_tax+v_trade_cost_fee+v_trade_system_use_fee+v_stock_settle_fee;
        #因为合并清算表记录的是费用差额，相关成交价格、成交数量、成交金额全部记0值

        /* set @成交价格# = @成交均价#; */
        set v_strike_price = v_strike_aver_price;

        /* set @成交数量# = @分笔累计成交数量#; */
        set v_strike_qty = v_split_strike_qty;

        /* set @成交金额# = @分笔累计成交金额#; */
        set v_strike_amt = v_split_strike_amt;

        /* if @汇率# <> 1 and @汇率# > 0 then */
        if v_exch_rate <> 1 and v_exch_rate > 0 then

            /* set @成交金额# = round(@成交金额#*@汇率#, 2); */
            set v_strike_amt = round(v_strike_amt*v_exch_rate, 2);
        end if;
        #如果买入

        /* if @订单方向# = 《订单方向-买入》 then */
        if v_order_dir = 1 then
            #本次清算金额，为成交金额+所有费用

            /* set @待入账金额# = -(@成交金额# + @全部费用#); */
            set v_pre_entry_amt = -(v_strike_amt + v_all_fee);
            #本次清算数量为待入账数量，即成交数量

            /* set @待入账数量# = @成交数量#; */
            set v_pre_entry_qty = v_strike_qty;
            #如果是债券，则需要根据净价标准，计算利息成本金额和利息收益

            /* if @证券类型# > 20 and @证券类型# < 50 then */
            if v_stock_type > 20 and v_stock_type < 50 then

                /* if @净价标志#=《净价标志-净价》  and @债券利率类型# <> 《债券利率类型-零息》 then */
                if v_net_price_flag=1  and v_bond_rate_type <> 3 then
                    #卖出时，净价需要把债券计提利息一起付，也即加上负值

                    /* set @待入账金额# = @待入账金额# - @债券计提利息# * @成交数量#; */
                    set v_pre_entry_amt = v_pre_entry_amt - v_bond_accr_intrst * v_strike_qty;
                end if;
            end if;
        #如果卖出

        /* elseif @订单方向# = 《订单方向-卖出》 or @订单方向# = 《订单方向-零股卖出》  then */
        elseif v_order_dir = 2 or v_order_dir = 31  then
            #本次清算金额，为成交金额-所有费用

            /* set @待入账金额# = @成交金额# - @全部费用#; */
            set v_pre_entry_amt = v_strike_amt - v_all_fee;
            #本次清算数量为待入账数量，即负的成交数量（卖出为负）

            /* set @待入账数量# = -@成交数量#; */
            set v_pre_entry_qty = -v_strike_qty;
            #如果是债券，则需要根据净价标准，计算利息成本金额和利息收益

            /* if @证券类型# > 20 and @证券类型# < 50 then */
            if v_stock_type > 20 and v_stock_type < 50 then

                /* if @净价标志#=《净价标志-净价》  and @债券利率类型# <> 《债券利率类型-零息》 then */
                if v_net_price_flag=1  and v_bond_rate_type <> 3 then
                    #卖出时，净价需要把债券计提利息加起来

                    /* set @待入账金额# = @待入账金额# + @债券计提利息# * @成交数量#; */
                    set v_pre_entry_amt = v_pre_entry_amt + v_bond_accr_intrst * v_strike_qty;
                end if;
            end if;
        #如果融资回购，待入账金额为费用之和，成交数量为标准券冻结数量

        /* elseif @订单方向# = 《订单方向-融资回购》 then */
        elseif v_order_dir = 3 then
            #本次清算金额，为融资获得的成交金额

            /* set @待入账金额# = @票面面值# * @成交数量# - @全部费用#; */
            set v_pre_entry_amt = v_par_value * v_strike_qty - v_all_fee;
            #本次清算数量为待入账数量，即冻结的标准券数量

            /* set @待入账数量# = -@成交数量#; */
            set v_pre_entry_qty = -v_strike_qty;
        #如果融券回购，待入账金额为费用之和，成交数量为0，实际是交易所代替控制了对方的标准券数量

        /* elseif @订单方向# = 《订单方向-融券回购》 then */
        elseif v_order_dir = 4 then
            #本次清算金额，为融券需要扣除的成交金额

            /* set @待入账金额# = - (@票面面值# * @成交数量# + @全部费用#); */
            set v_pre_entry_amt = - (v_par_value * v_strike_qty + v_all_fee);
            #本次清算数量为待入账数量，为0

            /* set @待入账数量# = @成交数量#; */
            set v_pre_entry_qty = v_strike_qty;
        end if;
    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算证券_清算_合并清算处理】*/
        call db_clsecu.pra_clsecl_DealMergeClear(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_rate,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_strike_aver_price,
            v_strike_qty,
            v_strike_price,
            v_strike_amt,
            v_strike_num,
            v_pre_entry_amt,
            v_pre_entry_qty,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_trade_tax,
            v_trade_cost_fee,
            v_trade_system_use_fee,
            v_stock_settle_fee,
            v_busi_flag,
            v_stock_type,
            v_asset_type,
            v_trade_code_no,
            v_target_code_no,
            v_intrst_days,
            v_arrive_date,
            v_impawn_ratio,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_clear_entry_type,
            v_error_code,
            v_error_info,
            v_entry_jour_no);
        if v_error_code = "1" then
            SET v_error_code = "clsecuT.2.15.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_合并清算处理出现错误！',v_mysql_message);
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
    SET p_entry_jour_no = v_entry_jour_no;

END;;


DELIMITER ;;
use db_clsecu;;

# 事务_清算证券_清算_更新待入账记录入账状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_UpdatePreEntryEntryStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_UpdatePreEntryEntryStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_row_id bigint,
    IN p_entry_status varchar(2),
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
    declare v_row_id bigint;
    declare v_entry_status varchar(2);
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
    SET v_row_id = p_row_id;
    SET v_entry_status = p_entry_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算证券_清算_更新待入账记录入账状态】*/
        call db_clsecu.pra_clsecl_UpdatePreEntryEntryStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_row_id,
            v_entry_status,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clsecuT.2.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_更新待入账记录入账状态出现错误！',v_mysql_message);
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
use db_clsecu;;

# 事务_清算证券_清算_更新待入账记录回滚状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_UpdatePreEntryUndoStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_UpdatePreEntryUndoStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_row_id bigint,
    IN p_undo_status varchar(2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_repo_pd_jour_no bigint
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
    declare v_row_id bigint;
    declare v_undo_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_repo_pd_jour_no bigint;

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
    SET v_row_id = p_row_id;
    SET v_undo_status = p_undo_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_repo_pd_jour_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算证券_清算_更新待入账记录回滚状态】*/
        call db_clsecu.pra_clsecl_UpdatePreEntryUndoStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_row_id,
            v_undo_status,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clsecuT.2.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_更新待入账记录回滚状态出现错误！',v_mysql_message);
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
    SET p_repo_pd_jour_no = v_repo_pd_jour_no;

END;;


DELIMITER ;;
use db_clsecu;;

# 事务_清算证券_清算_更新待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_UpdatePreEntry;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_UpdatePreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_row_id bigint,
    IN p_entry_money_jour_no bigint,
    IN p_entry_posi_jour_no bigint,
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
    declare v_row_id bigint;
    declare v_entry_money_jour_no bigint;
    declare v_entry_posi_jour_no bigint;
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
    SET v_row_id = p_row_id;
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_posi_jour_no = p_entry_posi_jour_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算证券_清算_更新待入账记录】*/
        call db_clsecu.pra_clsecl_UpdatePreEntry(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_row_id,
            v_entry_money_jour_no,
            v_entry_posi_jour_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clsecuT.2.23.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_更新待入账记录出现错误！',v_mysql_message);
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
use db_clsecu;;

# 事务_清算证券_清算_更新获取待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_UpdateGetPreEntry;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_UpdateGetPreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_qry_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_rate decimal(18,12),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_target_stock_code_no int,
    OUT p_strike_date int,
    OUT p_strike_time int,
    OUT p_strike_no varchar(64),
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_no int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_num int,
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_stamp_tax decimal(18,4),
    OUT p_trans_fee decimal(18,4),
    OUT p_brkage_fee decimal(18,4),
    OUT p_SEC_charges decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_chann_commis decimal(18,4),
    OUT p_divi_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_busi_flag int,
    OUT p_entry_status varchar(2),
    OUT p_undo_status varchar(2),
    OUT p_busi_jour_no bigint,
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_posi_jour_no bigint,
    OUT p_deli_jour_no bigint,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_intrst_days int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_impawn_ratio decimal(18,12),
    OUT p_arrive_date int,
    OUT p_repo_back_date int
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
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_stock_code_no int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_chann_commis decimal(18,4);
    declare v_divi_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_busi_jour_no bigint;
    declare v_entry_money_jour_no bigint;
    declare v_entry_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_arrive_date int;
    declare v_repo_back_date int;

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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_rate = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_target_stock_code_no = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_num = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_chann_commis = 0;
    SET v_divi_commis = 0;
    SET v_other_commis = 0;
    SET v_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_busi_jour_no = 0;
    SET v_entry_money_jour_no = 0;
    SET v_entry_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_repo_back_date = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算证券_清算_更新获取待入账记录】*/
        call db_clsecu.pra_clsecl_UpdateGetPreEntry(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_qry_no,
            v_error_code,
            v_error_info,
            v_record_count,
            v_row_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_rate,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_stock_code_no,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_strike_num,
            v_pre_entry_qty,
            v_pre_entry_amt,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_chann_commis,
            v_divi_commis,
            v_other_commis,
            v_busi_flag,
            v_entry_status,
            v_undo_status,
            v_busi_jour_no,
            v_entry_money_jour_no,
            v_entry_posi_jour_no,
            v_deli_jour_no,
            v_stock_type,
            v_asset_type,
            v_trade_code_no,
            v_target_code_no,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_arrive_date,
            v_repo_back_date);
        if v_error_code = "1" then
            SET v_error_code = "clsecuT.2.24.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_更新获取待入账记录出现错误！',v_mysql_message);
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
    SET p_record_count = v_record_count;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_rate = v_exch_rate;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_strike_date = v_strike_date;
    SET p_strike_time = v_strike_time;
    SET p_strike_no = v_strike_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_no = v_order_no;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_num = v_strike_num;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_all_fee = v_all_fee;
    SET p_stamp_tax = v_stamp_tax;
    SET p_trans_fee = v_trans_fee;
    SET p_brkage_fee = v_brkage_fee;
    SET p_SEC_charges = v_SEC_charges;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_chann_commis = v_chann_commis;
    SET p_divi_commis = v_divi_commis;
    SET p_other_commis = v_other_commis;
    SET p_busi_flag = v_busi_flag;
    SET p_entry_status = v_entry_status;
    SET p_undo_status = v_undo_status;
    SET p_busi_jour_no = v_busi_jour_no;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_posi_jour_no = v_entry_posi_jour_no;
    SET p_deli_jour_no = v_deli_jour_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_arrive_date = v_arrive_date;
    SET p_repo_back_date = v_repo_back_date;

END;;


DELIMITER ;;
use db_clsecu;;

# 事务_清算证券_清算_更新获取回滚待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_UpdateGetPreEntryUndo;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_UpdateGetPreEntryUndo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_report_date int,
    IN p_report_no varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_exch_rate decimal(18,12),
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_strike_date int,
    OUT p_strike_time int,
    OUT p_strike_no varchar(64),
    OUT p_report_time int,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_no int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_num int,
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_stamp_tax decimal(18,4),
    OUT p_trans_fee decimal(18,4),
    OUT p_brkage_fee decimal(18,4),
    OUT p_SEC_charges decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_chann_commis decimal(18,4),
    OUT p_divi_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_busi_flag int,
    OUT p_entry_status varchar(2),
    OUT p_undo_status varchar(2),
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_exgp_posi_jour_no bigint,
    OUT p_entry_asac_posi_jour_no bigint,
    OUT p_busi_jour_no bigint,
    OUT p_deli_jour_no bigint,
    OUT p_stock_type int,
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_intrst_days int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_repo_back_date int,
    OUT p_clear_entry_type int
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
    declare v_exch_no int;
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_rate decimal(18,12);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_time int;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_chann_commis decimal(18,4);
    declare v_divi_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_busi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_stock_type int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_impawn_ratio decimal(18,12);
    declare v_repo_back_date int;
    declare v_clear_entry_type int;

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
    SET v_exch_no = p_exch_no;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_exch_rate = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_num = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_chann_commis = 0;
    SET v_divi_commis = 0;
    SET v_other_commis = 0;
    SET v_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_busi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_stock_type = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_impawn_ratio = 0;
    SET v_repo_back_date = 0;
    SET v_clear_entry_type = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算证券_清算_更新获取回滚待入账记录】*/
        call db_clsecu.pra_clsecl_UpdateGetPreEntryUndo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_asset_acco_no,
            v_exch_no,
            v_report_date,
            v_report_no,
            v_error_code,
            v_error_info,
            v_row_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_exch_rate,
            v_stock_acco_no,
            v_stock_code_no,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_time,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_strike_num,
            v_pre_entry_qty,
            v_pre_entry_amt,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_chann_commis,
            v_divi_commis,
            v_other_commis,
            v_busi_flag,
            v_entry_status,
            v_undo_status,
            v_busi_jour_no,
            v_entry_money_jour_no,
            v_entry_exgp_posi_jour_no,
            v_entry_asac_posi_jour_no,
            v_deli_jour_no,
            v_stock_type,
            v_trade_code_no,
            v_target_code_no,
            v_intrst_days,
            v_bond_accr_intrst,
            v_impawn_ratio,
            v_repo_back_date,
            v_clear_entry_type);
        if v_error_code = "1" then
            SET v_error_code = "clsecuT.2.25.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_更新获取回滚待入账记录出现错误！',v_mysql_message);
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
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_exch_rate = v_exch_rate;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_strike_date = v_strike_date;
    SET p_strike_time = v_strike_time;
    SET p_strike_no = v_strike_no;
    SET p_report_time = v_report_time;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_no = v_order_no;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_num = v_strike_num;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_all_fee = v_all_fee;
    SET p_stamp_tax = v_stamp_tax;
    SET p_trans_fee = v_trans_fee;
    SET p_brkage_fee = v_brkage_fee;
    SET p_SEC_charges = v_SEC_charges;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_chann_commis = v_chann_commis;
    SET p_divi_commis = v_divi_commis;
    SET p_other_commis = v_other_commis;
    SET p_busi_flag = v_busi_flag;
    SET p_entry_status = v_entry_status;
    SET p_undo_status = v_undo_status;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_exgp_posi_jour_no = v_entry_exgp_posi_jour_no;
    SET p_entry_asac_posi_jour_no = v_entry_asac_posi_jour_no;
    SET p_busi_jour_no = v_busi_jour_no;
    SET p_deli_jour_no = v_deli_jour_no;
    SET p_stock_type = v_stock_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_repo_back_date = v_repo_back_date;
    SET p_clear_entry_type = v_clear_entry_type;

END;;


DELIMITER ;;
use db_clsecu;;

# 事务_清算证券_清算_查询待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_QueryPreEntry;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_QueryPreEntry(
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
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_crncy_type_str varchar(2048),
    IN p_entry_status varchar(2),
    IN p_undo_status varchar(2),
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_crncy_type_str varchar(2048);
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_entry_status = p_entry_status;
    SET v_undo_status = p_undo_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";",@市场编号串#,";"); */
        set v_exch_no_str=concat(";",v_exch_no_str,";");
    end if;

    /* if @本币币种串# <> " " then */
    if v_crncy_type_str <> " " then

        /* set @本币币种串#=concat(";",@本币币种串#,";"); */
        set v_crncy_type_str=concat(";",v_crncy_type_str,";");
    end if;

    /* 调用【原子_清算证券_清算_查询待入账记录】*/
    call db_clsecu.pra_clsecl_QueryPreEntry(
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
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no_str,
        v_stock_acco_no,
        v_stock_code_no,
        v_crncy_type_str,
        v_entry_status,
        v_undo_status,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "clsecuT.2.26.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_查询待入账记录出现错误！',v_mysql_message);
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
use db_clsecu;;

# 事务_清算证券_清算_入账异常处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_DealEntryError;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_DealEntryError(
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
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_undo_error_no int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_undo_error_no int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_undo_error_no = p_undo_error_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算证券_清算_入账异常处理】*/
        call db_clsecu.pra_clsecl_DealEntryError(
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
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_type,
            v_undo_error_no,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clsecuT.2.27.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_入账异常处理出现错误！',v_mysql_message);
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
use db_clsecu;;

# 事务_清算证券_清算_回写入账流水号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_UpdateEntryJour;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_UpdateEntryJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_entry_money_jour_no bigint,
    IN p_entry_exgp_posi_jour_no bigint,
    IN p_entry_asac_posi_jour_no bigint,
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
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
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
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_exgp_posi_jour_no = p_entry_exgp_posi_jour_no;
    SET v_entry_asac_posi_jour_no = p_entry_asac_posi_jour_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算证券_清算_回写入账流水号】*/
        call db_clsecu.pra_clsecl_UpdateEntryJour(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_entry_money_jour_no,
            v_entry_exgp_posi_jour_no,
            v_entry_asac_posi_jour_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clsecuT.2.28.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_回写入账流水号出现错误！',v_mysql_message);
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
use db_clsecu;;

# 事务_清算证券_清算_入账记录回滚处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_DealEntryJourUndo;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_DealEntryJourUndo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_exch_no int,
    IN p_order_date int,
    IN p_order_no int,
    IN p_clear_entry_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_busi_jour_no bigint,
    OUT p_repo_pd_jour_no bigint,
    OUT p_valid_flag int
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
    declare v_exch_no int;
    declare v_order_date int;
    declare v_order_no int;
    declare v_clear_entry_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_jour_no bigint;
    declare v_repo_pd_jour_no bigint;
    declare v_valid_flag int;

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
    SET v_exch_no = p_exch_no;
    SET v_order_date = p_order_date;
    SET v_order_no = p_order_no;
    SET v_clear_entry_type = p_clear_entry_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_jour_no = 0;
    SET v_repo_pd_jour_no = 0;
    SET v_valid_flag = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算证券_清算_入账记录回滚处理】*/
        call db_clsecu.pra_clsecl_DealEntryJourUndo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_exch_no,
            v_order_date,
            v_order_no,
            v_clear_entry_type,
            v_error_code,
            v_error_info,
            v_busi_jour_no,
            v_repo_pd_jour_no,
            v_valid_flag);
        if v_error_code = "1" then
            SET v_error_code = "clsecuT.2.29.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_入账记录回滚处理出现错误！',v_mysql_message);
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
    SET p_busi_jour_no = v_busi_jour_no;
    SET p_repo_pd_jour_no = v_repo_pd_jour_no;
    SET p_valid_flag = v_valid_flag;

END;;


DELIMITER ;;
use db_clsecu;;

# 事务_清算证券_清算_获取回滚入账信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_GetPreEntryInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_GetPreEntryInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_report_date int,
    OUT p_report_no varchar(32),
    OUT p_arrive_date int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_arrive_date int;

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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_no = " ";
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算证券_清算_获取回滚入账信息】*/
        call db_clsecu.pra_clsecl_GetPreEntryInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_query_row_id,
            v_error_code,
            v_error_info,
            v_asset_acco_no,
            v_exch_no,
            v_report_date,
            v_report_no,
            v_arrive_date);
        if v_error_code = "1" then
            SET v_error_code = "clsecuT.2.30.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_获取回滚入账信息出现错误！',v_mysql_message);
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
    SET p_exch_no = v_exch_no;
    SET p_report_date = v_report_date;
    SET p_report_no = v_report_no;
    SET p_arrive_date = v_arrive_date;

END;;


DELIMITER ;;
use db_clsecu;;

# 事务_清算证券_清算_数据统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_DataTotal;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_DataTotal(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算证券_清算_数据统计】*/
        call db_clsecu.pra_clsecl_DataTotal(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clsecuT.2.201.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_数据统计出现错误！',v_mysql_message);
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
use db_clsecu;;

# 事务_清算证券_清算_查询统计数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_QueryTotalData;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_QueryTotalData(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_清算证券_清算_查询统计数据】*/
    call db_clsecu.pra_clsecl_QueryTotalData(
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
        v_exch_no_str,
        v_stock_acco_no,
        v_stock_code_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "clsecuT.2.202.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_查询统计数据出现错误！',v_mysql_message);
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
use db_clsecu;;

# 事务_清算证券_清算_获取清算处理统计值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_GetClrTotalData;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_GetClrTotalData(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pre_clr_strike_qty decimal(18,2),
    OUT p_alr_clr_strike_qty decimal(18,2),
    OUT p_pre_entry_record_qty decimal(18,2),
    OUT p_alr_entry_record_qty decimal(18,2)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pre_clr_strike_qty decimal(18,2);
    declare v_alr_clr_strike_qty decimal(18,2);
    declare v_pre_entry_record_qty decimal(18,2);
    declare v_alr_entry_record_qty decimal(18,2);

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pre_clr_strike_qty = 0;
    SET v_alr_clr_strike_qty = 0;
    SET v_pre_entry_record_qty = 0;
    SET v_alr_entry_record_qty = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_清算证券_清算_获取清算处理统计值】*/
    call db_clsecu.pra_clsecl_GetClrTotalData(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_error_code,
        v_error_info,
        v_pre_clr_strike_qty,
        v_alr_clr_strike_qty,
        v_pre_entry_record_qty,
        v_alr_entry_record_qty);
    if v_error_code = "1" then
        SET v_error_code = "clsecuT.2.203.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_获取清算处理统计值出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pre_clr_strike_qty = v_pre_clr_strike_qty;
    SET p_alr_clr_strike_qty = v_alr_clr_strike_qty;
    SET p_pre_entry_record_qty = v_pre_entry_record_qty;
    SET p_alr_entry_record_qty = v_alr_entry_record_qty;

END;;


DELIMITER ;;
use db_clsecu;;

# 事务_清算证券_清算_查询清算成交记录序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_QueryClearStrikeId;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_QueryClearStrikeId(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_no int,
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
    declare v_qry_no int;
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
    SET v_qry_no = p_qry_no;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>60000 or @指定行数# <1 then */
    if v_row_count>60000 or v_row_count <1 then

      /* set @指定行数#=60000; */
      set v_row_count=60000;
    end if;

    /* 调用【原子_清算证券_清算_查询清算成交记录序号】*/
    call db_clsecu.pra_clsecl_QueryClearStrikeId(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_no,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "clsecuT.2.204.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_查询清算成交记录序号出现错误！',v_mysql_message);
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
use db_clsecu;;

# 事务_清算证券_清算_查询合并清算记录序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_QueryMergeClearId;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_QueryMergeClearId(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_no int,
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
    declare v_qry_no int;
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
    SET v_qry_no = p_qry_no;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>60000 or @指定行数# <1 then */
    if v_row_count>60000 or v_row_count <1 then

      /* set @指定行数#=60000; */
      set v_row_count=60000;
    end if;

    /* 调用【原子_清算证券_清算_查询合并清算记录序号】*/
    call db_clsecu.pra_clsecl_QueryMergeClearId(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_no,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "clsecuT.2.205.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_查询合并清算记录序号出现错误！',v_mysql_message);
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
use db_clsecu;;

# 事务_清算证券_清算_查询待入账记录序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_QueryPreEntryId;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_QueryPreEntryId(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_no int,
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
    declare v_qry_no int;
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
    SET v_qry_no = p_qry_no;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>60000 or @指定行数# <1 then */
    if v_row_count>60000 or v_row_count <1 then

      /* set @指定行数#=60000; */
      set v_row_count=60000;
    end if;

    /* 调用【原子_清算证券_清算_查询待入账记录序号】*/
    call db_clsecu.pra_clsecl_QueryPreEntryId(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_no,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "clsecuT.2.206.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_查询待入账记录序号出现错误！',v_mysql_message);
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
use db_clsecu;;

# 事务_清算证券_清算_自动清算处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_AutoDealClear;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_AutoDealClear(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_qry_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_record_count int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_type int
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
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_record_count int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_pass_no int;
    declare v_exch_rate decimal(18,12);
    declare v_target_stock_code_no int;
    declare v_asset_type int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_chann_commis decimal(18,4);
    declare v_divi_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_arrive_date int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_repo_back_date int;
    declare v_clear_entry_type int;
    declare v_busi_jour_no bigint;
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_split_strike_flag int;
    declare v_busi_flag int;
    declare v_all_fee decimal(18,4);
    declare v_pre_entry_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);

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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_record_count = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_pass_no = 0;
    SET v_exch_rate = 0;
    SET v_target_stock_code_no = 0;
    SET v_asset_type = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_chann_commis = 0;
    SET v_divi_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_repo_back_date = 0;
    SET v_clear_entry_type = 0;
    SET v_busi_jour_no = 0;
    SET v_fee_qty = 0;
    SET v_fee_price = 0;
    SET v_split_strike_flag = 0;
    SET v_busi_flag = 0;
    SET v_all_fee = 0;
    SET v_pre_entry_amt = 0;
    SET v_pre_entry_qty = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算证券_清算_自动更新获取成交记录】*/
        call db_clsecu.pra_clsecl_AutoUpdateGetStrike(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_qry_no,
            v_error_code,
            v_error_info,
            v_record_count,
            v_row_id,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_exch_rate,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_stock_code_no,
            v_stock_type,
            v_asset_type,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_chann_commis,
            v_divi_commis,
            v_trade_tax,
            v_trade_cost_fee,
            v_trade_system_use_fee,
            v_stock_settle_fee,
            v_trade_code_no,
            v_target_code_no,
            v_capit_reback_days,
            v_posi_reback_days,
            v_net_price_flag,
            v_intrst_days,
            v_par_value,
            v_arrive_date,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_repo_back_date,
            v_clear_entry_type);
        #if @记录个数# = 0 then
          #  set @错误编码# = "0";
          #  set @错误信息# = " ";
           # leave label_pro;
       # end if;

        /* set @成交流水号# = @记录序号#; */
        set v_busi_jour_no = v_row_id;

        /* set @费用数量#=@成交数量#; */
        set v_fee_qty=v_strike_qty;

        /* set @费用价格#=@成交价格#; */
        set v_fee_price=v_strike_price;
        #分笔成交标志，清算表中记录为分笔'0'，合并清算表为合笔'1'

        /* set @分笔成交标志# = 《分笔成交标志-单笔成交》; */
        set v_split_strike_flag = 1;

        /* if @订单数量#<>@成交数量# and @市场编号#<>5 then */
        if v_order_qty<>v_strike_qty and v_exch_no<>5 then

            /* set @分笔成交标志# = 《分笔成交标志-多笔成交》; */
            set v_split_strike_flag = 2;
        end if;
        #确定业务标志，业务标志由2位市场编号，1位业务类型（证券类型），3位业务编码组成

        /* set @业务标志# = 2000000; */
        set v_busi_flag = 2000000;
        #证券类型 1股票, 2债券, 3开放式基金, 4回购, 5衍生品

        /* if @证券类型# > 0 and @证券类型# < 20 then */
        if v_stock_type > 0 and v_stock_type < 20 then

            /* set @业务标志# = @业务标志# + 1000; */
            set v_busi_flag = v_busi_flag + 1000;

        /* elseif (@证券类型# > 20 and @证券类型# <= 25) or (@证券类型# > 28 and @证券类型# < 50) then */
        elseif (v_stock_type > 20 and v_stock_type <= 25) or (v_stock_type > 28 and v_stock_type < 50) then

            /* set @业务标志# = @业务标志# + 2000; */
            set v_busi_flag = v_busi_flag + 2000;

        /* elseif @证券类型# > 50 and @证券类型# < 70 then */
        elseif v_stock_type > 50 and v_stock_type < 70 then

            /* set @业务标志# = @业务标志# + 3000; */
            set v_busi_flag = v_busi_flag + 3000;

        /* elseif @证券类型# >= 26 and @证券类型# <= 27 then */
        elseif v_stock_type >= 26 and v_stock_type <= 27 then

            /* set @业务标志# = @业务标志# + 4000; */
            set v_busi_flag = v_busi_flag + 4000;

        /* elseif @证券类型# > 70 and @证券类型# < 200 then */
        elseif v_stock_type > 70 and v_stock_type < 200 then

            /* set @业务标志# = @业务标志# + 5000; */
            set v_busi_flag = v_busi_flag + 5000;
        end if;
        #订单方向

        /* if @订单方向# = 《订单方向-买入》 then */
        if v_order_dir = 1 then

            /* set @业务标志# = @业务标志# + 1; */
            set v_busi_flag = v_busi_flag + 1;

        /* elseif @订单方向# = 《订单方向-卖出》 or @订单方向# = 《订单方向-零股卖出》 then */
        elseif v_order_dir = 2 or v_order_dir = 31 then

            /* set @业务标志# = @业务标志# + 2; */
            set v_busi_flag = v_busi_flag + 2;

        /* elseif @订单方向# = 《订单方向-质押提交》 then */
        elseif v_order_dir = 21 then

            /* set @业务标志# = @业务标志# + 3; */
            set v_busi_flag = v_busi_flag + 3;

        /* elseif @订单方向# = 《订单方向-质押转回》 then */
        elseif v_order_dir = 22 then

            /* set @业务标志# = @业务标志# + 4; */
            set v_busi_flag = v_busi_flag + 4;

        /* elseif @订单方向# = 《订单方向-融资回购》 then */
        elseif v_order_dir = 3 then

            /* set @业务标志# = @业务标志# + 1; */
            set v_busi_flag = v_busi_flag + 1;

        /* elseif @订单方向# = 《订单方向-融券回购》 then */
        elseif v_order_dir = 4 then

            /* set @业务标志# = @业务标志# + 2; */
            set v_busi_flag = v_busi_flag + 2;
        end if;

        /* if @市场编号#=《市场编号-场外交易市场》 and @订单方向#=《订单方向-基金申购》 then */
        if v_exch_no=5 and v_order_dir=9 then

            /* set @业务标志#=《业务标志-基金申购》; */
            set v_busi_flag=2006001;

        /* elseif @市场编号#=《市场编号-场外交易市场》 and @订单方向#=《订单方向-基金赎回》 then */
        elseif v_exch_no=5 and v_order_dir=10 then

            /* set @业务标志#=《业务标志-基金赎回》; */
            set v_busi_flag=2006002;

        /* elseif @市场编号#=《市场编号-场外交易市场》 and @订单方向#=《订单方向-基金转换》 then */
        elseif v_exch_no=5 and v_order_dir=12 then

            /* set @业务标志#=《业务标志-基金转换》; */
            set v_busi_flag=2006003;
        end if;

        /* set @全部费用#=@印花税#+@过户费#+@经手费#+@证管费#+@其他费用#+@交易佣金#+@其他佣金#+@交易征费#+@交易费#+@交易系统使用费#+@股份交收费#; */
        set v_all_fee=v_stamp_tax+v_trans_fee+v_brkage_fee+v_SEC_charges+v_other_fee+v_trade_commis+v_other_commis+v_trade_tax+v_trade_cost_fee+v_trade_system_use_fee+v_stock_settle_fee;
        #如果买入

        /* if @订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-基金申购》 then */
        if v_order_dir = 1 or v_order_dir = 9 then
            #本次清算金额，为成交金额+全部费用

            /* set @待入账金额# = -(@成交金额# + @全部费用#); */
            set v_pre_entry_amt = -(v_strike_amt + v_all_fee);
            #本次清算数量为待入账数量，即成交数量

            /* set @待入账数量# = @成交数量#; */
            set v_pre_entry_qty = v_strike_qty;
            #如果是债券，则需要根据净价标准，计算利息成本金额和利息收益

            /* if @证券类型# > 20 and @证券类型# < 50 then */
            if v_stock_type > 20 and v_stock_type < 50 then

                /* if @净价标志#=《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
                if v_net_price_flag=1 and v_bond_rate_type <> 3 then

                    /* set @待入账金额# = @待入账金额# - @债券计提利息# * @成交数量#; */
                    set v_pre_entry_amt = v_pre_entry_amt - v_bond_accr_intrst * v_strike_qty;
                    #卖出时，净价需要把债券计提利息一起付，也即加上负值
                end if;
            end if;
        #如果卖出

        /* elseif @订单方向# = 《订单方向-卖出》 or @订单方向# = 《订单方向-零股卖出》 or @订单方向# = 《订单方向-基金赎回》 or @订单方向# = 《订单方向-基金转换》 then */
        elseif v_order_dir = 2 or v_order_dir = 31 or v_order_dir = 10 or v_order_dir = 12 then
            #本次清算金额，为成交金额-全部费用

            /* set @待入账金额# = @成交金额# - @全部费用#; */
            set v_pre_entry_amt = v_strike_amt - v_all_fee;
            #本次清算数量为待入账数量，即负的成交数量（卖出为负）

            /* set @待入账数量# = -@成交数量#; */
            set v_pre_entry_qty = -v_strike_qty;
            #基金转换的待入账数量是目标证券代码的成交数量,为正值

            /* if  @订单方向# = 《订单方向-基金转换》 then */
            if  v_order_dir = 12 then

                /* set @待入账数量#=-@成交数量#; */
                set v_pre_entry_qty=-v_strike_qty;
            end if;
            #如果是债券，则需要根据净价标准，计算利息成本金额和利息收益

            /* if @证券类型# > 20 and @证券类型# < 50 then */
            if v_stock_type > 20 and v_stock_type < 50 then

                /* if @净价标志#=《净价标志-净价》  and @债券利率类型# <> 《债券利率类型-零息》 then */
                if v_net_price_flag=1  and v_bond_rate_type <> 3 then
                    #卖出时，净价需要把债券计提利息加起来

                    /* set @待入账金额# = @待入账金额# + @债券计提利息# * @成交数量#; */
                    set v_pre_entry_amt = v_pre_entry_amt + v_bond_accr_intrst * v_strike_qty;
                end if;
            end if;
        #如果债券质押，成交数量为债券质押数量，同时标准券增加，其数量由质押比例获得，待入账金额实际费用应为0，目前暂不收费用，计算的费用为0

        /* elseif @订单方向# = 《订单方向-质押提交》 then */
        elseif v_order_dir = 21 then
            #本次清算金额，为-全部费用

            /* set @待入账金额# = - @全部费用#; */
            set v_pre_entry_amt = - v_all_fee;
            #本次清算数量为待入账数量，即冻结数量

            /* set @待入账数量# = -@成交数量#; */
            set v_pre_entry_qty = -v_strike_qty;
        #如果质押转回，成交数量为债券解押数量，同时标准券减少，其数量由质押比例获得，待入账金额实际费用应为0，目前暂不收费用，计算的费用为0

        /* elseif @订单方向# = 《订单方向-质押转回》 then */
        elseif v_order_dir = 22 then
            #本次清算金额，为-全部费用

            /* set @待入账金额# = - @全部费用#; */
            set v_pre_entry_amt = - v_all_fee;
            #本次清算数量为待入账数量，即解冻数量

            /* set @待入账数量# = @成交数量#; */
            set v_pre_entry_qty = v_strike_qty;
        #如果融资回购，待入账金额为费用之和，成交数量为标准券冻结数量

        /* elseif @订单方向# = 《订单方向-融资回购》 then */
        elseif v_order_dir = 3 then
            #本次清算金额，为融资获得的成交金额

            /* set @待入账金额# = @票面面值# * @成交数量# - @全部费用#; */
            set v_pre_entry_amt = v_par_value * v_strike_qty - v_all_fee;
            #本次清算数量为待入账数量，即冻结的标准券数量

            /* set @待入账数量# = -@成交数量#; */
            set v_pre_entry_qty = -v_strike_qty;
        #如果融券回购，待入账金额为费用之和，成交数量为0，实际是交易所代替控制了对方的标准券数量

        /* elseif @订单方向# = 《订单方向-融券回购》 then */
        elseif v_order_dir = 4 then
            #本次清算金额，为融券需要扣除的成交金额

            /* set @待入账金额# = - (@票面面值# * @成交数量# + @全部费用#); */
            set v_pre_entry_amt = - (v_par_value * v_strike_qty + v_all_fee);
            #本次清算数量为待入账数量，为0

            /* set @待入账数量# = @成交数量#; */
            set v_pre_entry_qty = v_strike_qty;
        end if;

        /* 调用【原子_清算证券_清算_清算处理】*/
        call db_clsecu.pra_clsecl_DealClear(
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
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_exch_rate,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_stock_code_no,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_pre_entry_amt,
            v_pre_entry_qty,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_trade_tax,
            v_trade_cost_fee,
            v_trade_system_use_fee,
            v_stock_settle_fee,
            v_busi_jour_no,
            v_clear_entry_type,
            v_stock_type,
            v_asset_type,
            v_trade_code_no,
            v_target_code_no,
            v_impawn_ratio,
            v_intrst_days,
            v_arrive_date,
            v_net_price_flag,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_par_value,
            v_capit_reback_days,
            v_posi_reback_days,
            v_repo_back_date,
            v_split_strike_flag,
            v_busi_flag,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clsecuT.2.207.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_清算处理出现错误！',v_mysql_message);
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
    SET p_record_count = v_record_count;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;

END;;


DELIMITER ;;
use db_clsecu;;

# 事务_清算证券_清算_自动更新获取合并清算记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_AutoUpdateGetMergeClear;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_AutoUpdateGetMergeClear(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_row_id bigint,
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_exch_rate decimal(18,12),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_strike_date int,
    OUT p_strike_time int,
    OUT p_strike_no varchar(64),
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_no int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_strike_num int,
    OUT p_strike_aver_price decimal(16,9),
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_split_strike_qty decimal(18,2),
    OUT p_split_strike_amt decimal(18,4),
    OUT p_split_stamp_tax decimal(18,4),
    OUT p_split_trans_fee decimal(18,4),
    OUT p_split_brkage decimal(18,4),
    OUT p_split_SEC_charges decimal(18,4),
    OUT p_split_other_fee decimal(18,4),
    OUT p_split_brkage_commis decimal(18,4),
    OUT p_split_chann_commis decimal(18,4),
    OUT p_split_divi_commis decimal(18,4),
    OUT p_split_other_commis decimal(18,4),
    OUT p_split_trade_tax decimal(18,4),
    OUT p_split_trade_cost_fee decimal(18,4),
    OUT p_split_trade_system_use_fee decimal(18,4),
    OUT p_split_stock_settle_fee decimal(18,4),
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_clear_entry_type int,
    OUT p_bond_rate_type int,
    OUT p_busi_flag int,
    OUT p_deal_flag int,
    OUT p_arrive_date int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_row_id bigint;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_num int;
    declare v_strike_aver_price decimal(16,9);
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_split_strike_qty decimal(18,2);
    declare v_split_strike_amt decimal(18,4);
    declare v_split_stamp_tax decimal(18,4);
    declare v_split_trans_fee decimal(18,4);
    declare v_split_brkage decimal(18,4);
    declare v_split_SEC_charges decimal(18,4);
    declare v_split_other_fee decimal(18,4);
    declare v_split_brkage_commis decimal(18,4);
    declare v_split_chann_commis decimal(18,4);
    declare v_split_divi_commis decimal(18,4);
    declare v_split_other_commis decimal(18,4);
    declare v_split_trade_tax decimal(18,4);
    declare v_split_trade_cost_fee decimal(18,4);
    declare v_split_trade_system_use_fee decimal(18,4);
    declare v_split_stock_settle_fee decimal(18,4);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_impawn_ratio decimal(18,12);
    declare v_clear_entry_type int;
    declare v_bond_rate_type int;
    declare v_busi_flag int;
    declare v_deal_flag int;
    declare v_arrive_date int;

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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_exch_rate = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_strike_num = 0;
    SET v_strike_aver_price = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_split_strike_qty = 0;
    SET v_split_strike_amt = 0;
    SET v_split_stamp_tax = 0;
    SET v_split_trans_fee = 0;
    SET v_split_brkage = 0;
    SET v_split_SEC_charges = 0;
    SET v_split_other_fee = 0;
    SET v_split_brkage_commis = 0;
    SET v_split_chann_commis = 0;
    SET v_split_divi_commis = 0;
    SET v_split_other_commis = 0;
    SET v_split_trade_tax = 0;
    SET v_split_trade_cost_fee = 0;
    SET v_split_trade_system_use_fee = 0;
    SET v_split_stock_settle_fee = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_impawn_ratio = 0;
    SET v_clear_entry_type = 0;
    SET v_bond_rate_type = 0;
    SET v_busi_flag = 0;
    SET v_deal_flag = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算证券_清算_自动更新获取合并清算记录】*/
        call db_clsecu.pra_clsecl_AutoGetMergeClear(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_qry_no,
            v_error_code,
            v_error_info,
            v_record_count,
            v_row_id,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_exch_rate,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_strike_num,
            v_strike_aver_price,
            v_pre_entry_qty,
            v_pre_entry_amt,
            v_split_strike_qty,
            v_split_strike_amt,
            v_split_stamp_tax,
            v_split_trans_fee,
            v_split_brkage,
            v_split_SEC_charges,
            v_split_other_fee,
            v_split_brkage_commis,
            v_split_other_commis,
            v_split_trade_tax,
            v_split_trade_cost_fee,
            v_split_trade_system_use_fee,
            v_split_stock_settle_fee,
            v_stock_type,
            v_asset_type,
            v_trade_code_no,
            v_target_code_no,
            v_capit_reback_days,
            v_posi_reback_days,
            v_net_price_flag,
            v_intrst_days,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_clear_entry_type,
            v_busi_flag,
            v_deal_flag,
            v_arrive_date);
        #if @记录个数# = 0 then
          #  set @错误编码# = "0";
          # set @错误信息# = " ";
          #  leave label_pro;
        #end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;
    SET p_row_id = v_row_id;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_exch_rate = v_exch_rate;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_strike_date = v_strike_date;
    SET p_strike_time = v_strike_time;
    SET p_strike_no = v_strike_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_no = v_order_no;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_strike_num = v_strike_num;
    SET p_strike_aver_price = v_strike_aver_price;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_split_strike_qty = v_split_strike_qty;
    SET p_split_strike_amt = v_split_strike_amt;
    SET p_split_stamp_tax = v_split_stamp_tax;
    SET p_split_trans_fee = v_split_trans_fee;
    SET p_split_brkage = v_split_brkage;
    SET p_split_SEC_charges = v_split_SEC_charges;
    SET p_split_other_fee = v_split_other_fee;
    SET p_split_brkage_commis = v_split_brkage_commis;
    SET p_split_chann_commis = v_split_chann_commis;
    SET p_split_divi_commis = v_split_divi_commis;
    SET p_split_other_commis = v_split_other_commis;
    SET p_split_trade_tax = v_split_trade_tax;
    SET p_split_trade_cost_fee = v_split_trade_cost_fee;
    SET p_split_trade_system_use_fee = v_split_trade_system_use_fee;
    SET p_split_stock_settle_fee = v_split_stock_settle_fee;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_clear_entry_type = v_clear_entry_type;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_busi_flag = v_busi_flag;
    SET p_deal_flag = v_deal_flag;
    SET p_arrive_date = v_arrive_date;

END;;


DELIMITER ;;
use db_clsecu;;

# 事务_清算证券_清算_自动更新获取待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_AutoUpdateGetPreEntry;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_AutoUpdateGetPreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_qry_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_rate decimal(18,12),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_target_stock_code_no int,
    OUT p_strike_date int,
    OUT p_strike_time int,
    OUT p_strike_no varchar(64),
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_no int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_num int,
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_stamp_tax decimal(18,4),
    OUT p_trans_fee decimal(18,4),
    OUT p_brkage_fee decimal(18,4),
    OUT p_SEC_charges decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_chann_commis decimal(18,4),
    OUT p_divi_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_busi_flag int,
    OUT p_entry_status varchar(2),
    OUT p_undo_status varchar(2),
    OUT p_busi_jour_no bigint,
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_posi_jour_no bigint,
    OUT p_deli_jour_no bigint,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_intrst_days int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_impawn_ratio decimal(18,12),
    OUT p_arrive_date int,
    OUT p_repo_back_date int
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
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_stock_code_no int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_chann_commis decimal(18,4);
    declare v_divi_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_busi_jour_no bigint;
    declare v_entry_money_jour_no bigint;
    declare v_entry_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_arrive_date int;
    declare v_repo_back_date int;

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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_rate = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_target_stock_code_no = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_num = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_chann_commis = 0;
    SET v_divi_commis = 0;
    SET v_other_commis = 0;
    SET v_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_busi_jour_no = 0;
    SET v_entry_money_jour_no = 0;
    SET v_entry_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_repo_back_date = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算证券_清算_自动更新获取待入账记录】*/
        call db_clsecu.pra_clsecl_AutoUpdateGetPreEntry(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_qry_no,
            v_error_code,
            v_error_info,
            v_record_count,
            v_row_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_rate,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_stock_code_no,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_strike_num,
            v_pre_entry_qty,
            v_pre_entry_amt,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_chann_commis,
            v_divi_commis,
            v_other_commis,
            v_busi_flag,
            v_entry_status,
            v_undo_status,
            v_busi_jour_no,
            v_entry_money_jour_no,
            v_entry_posi_jour_no,
            v_deli_jour_no,
            v_stock_type,
            v_asset_type,
            v_trade_code_no,
            v_target_code_no,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_arrive_date,
            v_repo_back_date);
        if v_error_code = "1" then
            SET v_error_code = "clsecuT.2.209.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_清算_自动更新获取待入账记录出现错误！',v_mysql_message);
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
    SET p_record_count = v_record_count;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_rate = v_exch_rate;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_strike_date = v_strike_date;
    SET p_strike_time = v_strike_time;
    SET p_strike_no = v_strike_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_no = v_order_no;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_num = v_strike_num;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_all_fee = v_all_fee;
    SET p_stamp_tax = v_stamp_tax;
    SET p_trans_fee = v_trans_fee;
    SET p_brkage_fee = v_brkage_fee;
    SET p_SEC_charges = v_SEC_charges;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_chann_commis = v_chann_commis;
    SET p_divi_commis = v_divi_commis;
    SET p_other_commis = v_other_commis;
    SET p_busi_flag = v_busi_flag;
    SET p_entry_status = v_entry_status;
    SET p_undo_status = v_undo_status;
    SET p_busi_jour_no = v_busi_jour_no;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_posi_jour_no = v_entry_posi_jour_no;
    SET p_deli_jour_no = v_deli_jour_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_arrive_date = v_arrive_date;
    SET p_repo_back_date = v_repo_back_date;

END;;


DELIMITER ;;
use db_clsecu;;

# 事务_清算证券_清算_A股入账前检查
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsecl_ASharePreEntryCheck;;
DELIMITER ;;
CREATE PROCEDURE prt_clsecl_ASharePreEntryCheck(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_sum_strike_count int,
    IN p_split_strike_count int,
    IN p_split_order_count int,
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
    declare v_sum_strike_count int;
    declare v_split_strike_count int;
    declare v_split_order_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_count int;
    declare v_tmp_strike_count int;
    declare v_total_count int;

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
    SET v_sum_strike_count = p_sum_strike_count;
    SET v_split_strike_count = p_split_strike_count;
    SET v_split_order_count = p_split_order_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_count = 0;
    SET v_tmp_strike_count = 0;
    SET v_total_count = 0;

    
    label_pro:BEGIN
    

    /* set  @成交记录数#= 0; */
    set  v_strike_count= 0;

    /* set  @临时_成交记录数#= @汇总成交记录数量# + @分笔成交记录数量#; */
    set  v_tmp_strike_count= v_sum_strike_count + v_split_strike_count;

    /* [获取表记录数量][清算证券_清算_成交表][@成交记录数#][{初始化日期} = @初始化日期#  and {处理标志}=《处理标志-已处理》 ] */
    select count(1) into v_strike_count from db_clsecu.tb_clsecl_strike where init_date = v_init_date  and deal_flag=1 ;

    #一、检查转入成交。

    /* [检查报错返回][@临时_成交记录数# <> @成交记录数#][1][concat("转入成交检查有错！交易库汇总成交订单记录数:",@汇总成交记录数量#,"|交易库分笔成交记录数:",@分笔成交记录数量#,"|清算库成交总数:",@成交记录数#)] */
    if v_tmp_strike_count <> v_strike_count then
        
        SET v_error_code = "clsecuT.2.210.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("转入成交检查有错！交易库汇总成交订单记录数:",v_sum_strike_count,"|交易库分笔成交记录数:",v_split_strike_count,"|清算库成交总数:",v_strike_count),"#",v_mysql_message);
        else
            SET v_error_info = concat("转入成交检查有错！交易库汇总成交订单记录数:",v_sum_strike_count,"|交易库分笔成交记录数:",v_split_strike_count,"|清算库成交总数:",v_strike_count);
        end if;
        leave label_pro;
    end if;


    /* set  @成交记录数#= 0; */
    set  v_strike_count= 0;

    /* set  @临时_成交记录数#= 0; */
    set  v_tmp_strike_count= 0;

    /* [获取表记录数量][清算证券_清算_合并清算表][@成交记录数#][{初始化日期} = @初始化日期#] */
    select count(1) into v_strike_count from db_clsecu.tb_clsecl_merge_clear where init_date = v_init_date;

    #二、检查清算处理 及 合并清算。   无论合并入账或 分笔入账 ，只要 多笔成交(订单数量<>成交数量) ,均汇总到合并清算表。

    /* [获取表记录变量语句][清算证券_清算_成交表][count(distinct {资产账户编号},{申报日期},{申报编号})][@临时_成交记录数#][{初始化日期} = @初始化日期#  and {处理标志}=《处理标志-已处理》  and  {订单数量}<>{成交数量}] */
    select count(distinct asset_acco_no,report_date,report_no) into v_tmp_strike_count from db_clsecu.tb_clsecl_strike where init_date = v_init_date  and deal_flag=1  and  order_qty<>strike_qty limit 1;


    /* [检查报错返回][@临时_成交记录数# <> @成交记录数#][1][concat("合并检查有错！需要合并的多笔成交-订单数:",@临时_成交记录数#,"|合并清算表总记录数:",@成交记录数#)] */
    if v_tmp_strike_count <> v_strike_count then
        
        SET v_error_code = "clsecuT.2.210.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合并检查有错！需要合并的多笔成交-订单数:",v_tmp_strike_count,"|合并清算表总记录数:",v_strike_count),"#",v_mysql_message);
        else
            SET v_error_info = concat("合并检查有错！需要合并的多笔成交-订单数:",v_tmp_strike_count,"|合并清算表总记录数:",v_strike_count);
        end if;
        leave label_pro;
    end if;

    #三、检查待入账。

    /* set  @成交记录数#= 0; */
    set  v_strike_count= 0;

    /* set  @临时_成交记录数#= 0; */
    set  v_tmp_strike_count= 0;
      #分笔成交 - 分笔入账且多笔成交 的 成交笔数。        |成交表(订单数量<>成交数量)的均是 分笔成交。

    /* [获取表记录数量][清算证券_清算_成交表][@成交记录数#][{初始化日期} = @初始化日期#  and {处理标志}=《处理标志-已处理》  and  {清算入账类型} = 《清算入账类型-分笔入账》  and  {订单数量}<>{成交数量}] */
    select count(1) into v_strike_count from db_clsecu.tb_clsecl_strike where init_date = v_init_date  and deal_flag=1  and  clear_entry_type = 1  and  order_qty<>strike_qty;

      #分笔成交 - 分笔入账 且多笔成交 的 订单数量。

    /* [获取表记录变量语句][清算证券_清算_成交表][count(distinct {资产账户编号},{申报日期},{申报编号})][@临时_成交记录数#][{初始化日期} = @初始化日期#  and {处理标志}=《处理标志-已处理》 and  {清算入账类型} = 《清算入账类型-分笔入账》  and  {订单数量}<>{成交数量}] */
    select count(distinct asset_acco_no,report_date,report_no) into v_tmp_strike_count from db_clsecu.tb_clsecl_strike where init_date = v_init_date  and deal_flag=1 and  clear_entry_type = 1  and  order_qty<>strike_qty limit 1;

      #{待入账数量} 为0 的是 分笔入账-多笔成交 的汇总， 计算时需刨除

    /* [获取表记录数量][清算证券_清算_待入账记录表][@总记录数#][{初始化日期} = @初始化日期#  and  {入账状态} <>《入账状态-已入账》 and {待入账数量} <>0 ] */
    select count(1) into v_total_count from db_clsecu.tb_clsecl_pre_entry where init_date = v_init_date  and  entry_status <>"1" and pre_entry_qty <>0 ;

    #计算公式：  待入账表 {待入账数量 }<>0  的 总记录数  = rsp的有效订单总数 + 分笔入账-多笔成交笔数  - 分笔入账-多笔成交订单数。

    /* [检查报错返回][@总记录数# <> @汇总成交记录数量# + @分笔成交订单数量# + @成交记录数# - @临时_成交记录数#][1][concat("待入账检查有错！交易库分笔成交-订单数:",@分笔成交订单数量#,"+交易库汇总成交订单数:",@汇总成交记录数量#,"+分笔入账-多笔成交记录数:",@成交记录数#," -分笔入账-多笔成交订单数:",@临时_成交记录数#,"<> 待入账清算表总记录数:",@总记录数#)] */
    if v_total_count <> v_sum_strike_count + v_split_order_count + v_strike_count - v_tmp_strike_count then
        
        SET v_error_code = "clsecuT.2.210.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("待入账检查有错！交易库分笔成交-订单数:",v_split_order_count,"+交易库汇总成交订单数:",v_sum_strike_count,"+分笔入账-多笔成交记录数:",v_strike_count," -分笔入账-多笔成交订单数:",v_tmp_strike_count,"<> 待入账清算表总记录数:",v_total_count),"#",v_mysql_message);
        else
            SET v_error_info = concat("待入账检查有错！交易库分笔成交-订单数:",v_split_order_count,"+交易库汇总成交订单数:",v_sum_strike_count,"+分笔入账-多笔成交记录数:",v_strike_count," -分笔入账-多笔成交订单数:",v_tmp_strike_count,"<> 待入账清算表总记录数:",v_total_count);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


