DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_策略_策略插件上线
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsest_StrategePluginOnline;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsest_StrategePluginOnline(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strategy_plugin_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strategy_plugin_status varchar(2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_strategy_plugin_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strategy_plugin_status varchar(2);

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
    SET v_strategy_plugin_type = p_strategy_plugin_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strategy_plugin_status = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_策略_策略插件上线】*/
        call db_tdsecu.pra_tdsest_StrategePluginOnline(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_strategy_plugin_type,
            v_error_code,
            v_error_info,
            v_strategy_plugin_status);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_策略插件上线出现错误！',v_mysql_message);
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
    SET p_strategy_plugin_status = v_strategy_plugin_status;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_策略_策略插件下线
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsest_StrategePluginOffline;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsest_StrategePluginOffline(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strategy_plugin_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strategy_plugin_status varchar(2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_strategy_plugin_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strategy_plugin_status varchar(2);

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
    SET v_strategy_plugin_type = p_strategy_plugin_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strategy_plugin_status = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_策略_策略插件下线】*/
        call db_tdsecu.pra_tdsest_StrategePluginOffline(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_strategy_plugin_type,
            v_error_code,
            v_error_info,
            v_strategy_plugin_status);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_策略插件下线出现错误！',v_mysql_message);
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
    SET p_strategy_plugin_status = v_strategy_plugin_status;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_策略_获取策略信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsest_GetStrategyOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsest_GetStrategyOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strategy_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_opor int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_strategy_batch_no int,
    OUT p_orig_strategy_id bigint,
    OUT p_strategy_exec_broker varchar(16),
    OUT p_strategy_exec_kind int,
    OUT p_strategy_exec_comm_str varchar(2048),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_stock_code varchar(6),
    OUT p_stock_code_no int,
    OUT p_strategy_dir int,
    OUT p_strategy_qty decimal(18,2),
    OUT p_cash_strategy_qty decimal(18,2),
    OUT p_strategy_price decimal(16,9),
    OUT p_price_type int,
    OUT p_strategy_amt decimal(18,4),
    OUT p_strategy_valid_type int,
    OUT p_strategy_rule_way varchar(4),
    OUT p_exch_crncy_type varchar(3),
    OUT p_remark_info varchar(255),
    OUT p_strategy_date int,
    OUT p_strategy_time int,
    OUT p_margin_trade_type int,
    OUT p_target_strategy_type varchar(16),
    OUT p_target_strategy_param varchar(2048),
    OUT p_strategy_contr_comm varchar(2048),
    OUT p_strategy_status varchar(2),
    OUT p_strategy_deal_status varchar(2),
    OUT p_strategy_deal_kind int,
    OUT p_order_qty decimal(18,2),
    OUT p_order_amt decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_external_no bigint,
    OUT p_order_batch_no int,
    OUT p_strategy_oper_way varchar(2),
    OUT p_busi_opor_no int,
    OUT p_strategy_price_type int,
    OUT p_comm_batch_no int,
    OUT p_comm_id bigint
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_strategy_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_opor int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_strategy_batch_no int;
    declare v_orig_strategy_id bigint;
    declare v_strategy_exec_broker varchar(16);
    declare v_strategy_exec_kind int;
    declare v_strategy_exec_comm_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_strategy_dir int;
    declare v_strategy_qty decimal(18,2);
    declare v_cash_strategy_qty decimal(18,2);
    declare v_strategy_price decimal(16,9);
    declare v_price_type int;
    declare v_strategy_amt decimal(18,4);
    declare v_strategy_valid_type int;
    declare v_strategy_rule_way varchar(4);
    declare v_exch_crncy_type varchar(3);
    declare v_remark_info varchar(255);
    declare v_strategy_date int;
    declare v_strategy_time int;
    declare v_margin_trade_type int;
    declare v_target_strategy_type varchar(16);
    declare v_target_strategy_param varchar(2048);
    declare v_strategy_contr_comm varchar(2048);
    declare v_strategy_status varchar(2);
    declare v_strategy_deal_status varchar(2);
    declare v_strategy_deal_kind int;
    declare v_order_qty decimal(18,2);
    declare v_order_amt decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_strategy_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_strategy_price_type int;
    declare v_comm_batch_no int;
    declare v_comm_id bigint;
    declare v_init_date int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;

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
    SET v_strategy_id = p_strategy_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_opor = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_strategy_batch_no = 0;
    SET v_orig_strategy_id = 0;
    SET v_strategy_exec_broker = " ";
    SET v_strategy_exec_kind = 0;
    SET v_strategy_exec_comm_str = " ";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_strategy_dir = 0;
    SET v_strategy_qty = 0;
    SET v_cash_strategy_qty = 0;
    SET v_strategy_price = 0;
    SET v_price_type = 0;
    SET v_strategy_amt = 0;
    SET v_strategy_valid_type = 0;
    SET v_strategy_rule_way = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_remark_info = " ";
    SET v_strategy_date = date_format(curdate(),'%Y%m%d');
    SET v_strategy_time = date_format(curtime(),'%H%i%s');
    SET v_margin_trade_type = 0;
    SET v_target_strategy_type = " ";
    SET v_target_strategy_param = " ";
    SET v_strategy_contr_comm = " ";
    SET v_strategy_status = " ";
    SET v_strategy_deal_status = " ";
    SET v_strategy_deal_kind = 0;
    SET v_order_qty = 0;
    SET v_order_amt = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_external_no = 0;
    SET v_order_batch_no = 0;
    SET v_strategy_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_strategy_price_type = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_策略_获取策略信息】*/
    call db_tdsecu.pra_tdsest_GetStrategyOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_strategy_id,
        v_error_code,
        v_error_info,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_pass_no,
        v_out_acco,
        v_exch_crncy_type,
        v_exch_no,
        v_comm_opor,
        v_stock_acco,
        v_stock_acco_no,
        v_stock_code_no,
        v_stock_code,
        v_target_code_no,
        v_trade_code_no,
        v_stock_type,
        v_asset_type,
        v_strategy_batch_no,
        v_strategy_dir,
        v_strategy_price,
        v_strategy_qty,
        v_cash_strategy_qty,
        v_strategy_amt,
        v_strategy_exec_broker,
        v_strategy_exec_kind,
        v_strategy_exec_comm_str,
        v_price_type,
        v_strategy_valid_type,
        v_strategy_rule_way,
        v_net_price_flag,
        v_par_value,
        v_impawn_ratio,
        v_intrst_days,
        v_bond_accr_intrst,
        v_bond_rate_type,
        v_capit_reback_days,
        v_posi_reback_days,
        v_remark_info,
        v_strategy_date,
        v_strategy_time,
        v_strategy_status,
        v_margin_trade_type,
        v_strategy_deal_kind,
        v_target_strategy_type,
        v_target_strategy_param,
        v_order_qty,
        v_order_amt,
        v_wtdraw_qty,
        v_strike_qty,
        v_strike_amt,
        v_strategy_deal_status,
        v_external_no,
        v_order_batch_no,
        v_strategy_oper_way,
        v_busi_opor_no,
        v_strategy_price_type,
        v_comm_batch_no,
        v_comm_id);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.11.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_获取策略信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_opor = v_comm_opor;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_strategy_batch_no = v_strategy_batch_no;
    SET p_orig_strategy_id = v_orig_strategy_id;
    SET p_strategy_exec_broker = v_strategy_exec_broker;
    SET p_strategy_exec_kind = v_strategy_exec_kind;
    SET p_strategy_exec_comm_str = v_strategy_exec_comm_str;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_stock_code = v_stock_code;
    SET p_stock_code_no = v_stock_code_no;
    SET p_strategy_dir = v_strategy_dir;
    SET p_strategy_qty = v_strategy_qty;
    SET p_cash_strategy_qty = v_cash_strategy_qty;
    SET p_strategy_price = v_strategy_price;
    SET p_price_type = v_price_type;
    SET p_strategy_amt = v_strategy_amt;
    SET p_strategy_valid_type = v_strategy_valid_type;
    SET p_strategy_rule_way = v_strategy_rule_way;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_remark_info = v_remark_info;
    SET p_strategy_date = v_strategy_date;
    SET p_strategy_time = v_strategy_time;
    SET p_margin_trade_type = v_margin_trade_type;
    SET p_target_strategy_type = v_target_strategy_type;
    SET p_target_strategy_param = v_target_strategy_param;
    SET p_strategy_contr_comm = v_strategy_contr_comm;
    SET p_strategy_status = v_strategy_status;
    SET p_strategy_deal_status = v_strategy_deal_status;
    SET p_strategy_deal_kind = v_strategy_deal_kind;
    SET p_order_qty = v_order_qty;
    SET p_order_amt = v_order_amt;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_external_no = v_external_no;
    SET p_order_batch_no = v_order_batch_no;
    SET p_strategy_oper_way = v_strategy_oper_way;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_strategy_price_type = v_strategy_price_type;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_id = v_comm_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_策略_新增策略
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsest_AddStrategyOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsest_AddStrategyOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_comm_opor int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_target_code_no int,
    IN p_trade_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_exgp_avail_amt decimal(18,4),
    IN p_exgp_T_hk_buy_total_amt decimal(18,4),
    IN p_exgp_T_hk_sell_total_amt decimal(18,4),
    IN p_exgp_T1_hk_buy_total_amt decimal(18,4),
    IN p_exgp_T1_hk_sell_total_amt decimal(18,4),
    IN p_asac_avail_amt decimal(18,4),
    IN p_asac_T_hk_buy_total_amt decimal(18,4),
    IN p_asac_T_hk_sell_total_amt decimal(18,4),
    IN p_asac_T1_hk_buy_total_amt decimal(18,4),
    IN p_asac_T1_hk_sell_total_amt decimal(18,4),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_exgp_target_code_avail_qty decimal(18,2),
    IN p_exgp_trade_code_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    IN p_asac_target_code_avail_qty decimal(18,2),
    IN p_asac_trade_code_avail_qty decimal(18,2),
    IN p_exgp_busi_config_str varchar(64),
    IN p_asac_busi_config_str varchar(64),
    IN p_limit_actual_price decimal(16,9),
    IN p_strategy_batch_no int,
    IN p_strategy_exec_broker varchar(16),
    IN p_strategy_exec_comm_str varchar(2048),
    IN p_strategy_exec_kind int,
    IN p_strategy_dir int,
    IN p_strategy_price decimal(16,9),
    IN p_price_type int,
    IN p_strategy_qty decimal(18,2),
    IN p_cash_strategy_qty decimal(18,2),
    IN p_strategy_amt decimal(18,4),
    IN p_strategy_valid_type int,
    IN p_strategy_rule_way varchar(4),
    IN p_remark_info varchar(255),
    IN p_margin_trade_type int,
    IN p_target_strategy_type varchar(16),
    IN p_target_strategy_param varchar(2048),
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_impawn_ratio decimal(18,12),
    IN p_intrst_days int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_strategy_oper_way varchar(2),
    IN p_cost_calc_type int,
    IN p_compli_trig_id bigint,
    IN p_strategy_price_type int,
    IN p_comm_batch_no int,
    IN p_comm_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strategy_id bigint,
    OUT p_strategy_date int,
    OUT p_strategy_time int,
    OUT p_strategy_status varchar(2),
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
    declare v_comm_opor int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_exgp_avail_amt decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);
    declare v_asac_T_hk_buy_total_amt decimal(18,4);
    declare v_asac_T_hk_sell_total_amt decimal(18,4);
    declare v_asac_T1_hk_buy_total_amt decimal(18,4);
    declare v_asac_T1_hk_sell_total_amt decimal(18,4);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_exgp_target_code_avail_qty decimal(18,2);
    declare v_exgp_trade_code_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_asac_target_code_avail_qty decimal(18,2);
    declare v_asac_trade_code_avail_qty decimal(18,2);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_limit_actual_price decimal(16,9);
    declare v_strategy_batch_no int;
    declare v_strategy_exec_broker varchar(16);
    declare v_strategy_exec_comm_str varchar(2048);
    declare v_strategy_exec_kind int;
    declare v_strategy_dir int;
    declare v_strategy_price decimal(16,9);
    declare v_price_type int;
    declare v_strategy_qty decimal(18,2);
    declare v_cash_strategy_qty decimal(18,2);
    declare v_strategy_amt decimal(18,4);
    declare v_strategy_valid_type int;
    declare v_strategy_rule_way varchar(4);
    declare v_remark_info varchar(255);
    declare v_margin_trade_type int;
    declare v_target_strategy_type varchar(16);
    declare v_target_strategy_param varchar(2048);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_strategy_oper_way varchar(2);
    declare v_cost_calc_type int;
    declare v_compli_trig_id bigint;
    declare v_strategy_price_type int;
    declare v_comm_batch_no int;
    declare v_comm_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strategy_id bigint;
    declare v_strategy_date int;
    declare v_strategy_time int;
    declare v_strategy_status varchar(2);
    declare v_update_times int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_strategy_deal_kind int;
    declare v_orig_strategy_id bigint;
    declare v_cancel_qty decimal(18,2);
    declare v_valid_wtdraw_qty decimal(18,2);
    declare v_valid_order_qty decimal(18,2);
    declare v_strategy_deal_status varchar(2);
    declare v_strategy_contr_comm varchar(2048);
    declare v_oper_func_code varchar(16);
    declare v_strategy_order_qty decimal(18,2);
    declare v_strategy_capt_qty decimal(18,2);

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
    SET v_comm_opor = p_comm_opor;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_target_code_no = p_target_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_exgp_avail_amt = p_exgp_avail_amt;
    SET v_exgp_T_hk_buy_total_amt = p_exgp_T_hk_buy_total_amt;
    SET v_exgp_T_hk_sell_total_amt = p_exgp_T_hk_sell_total_amt;
    SET v_exgp_T1_hk_buy_total_amt = p_exgp_T1_hk_buy_total_amt;
    SET v_exgp_T1_hk_sell_total_amt = p_exgp_T1_hk_sell_total_amt;
    SET v_asac_avail_amt = p_asac_avail_amt;
    SET v_asac_T_hk_buy_total_amt = p_asac_T_hk_buy_total_amt;
    SET v_asac_T_hk_sell_total_amt = p_asac_T_hk_sell_total_amt;
    SET v_asac_T1_hk_buy_total_amt = p_asac_T1_hk_buy_total_amt;
    SET v_asac_T1_hk_sell_total_amt = p_asac_T1_hk_sell_total_amt;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_exgp_target_code_avail_qty = p_exgp_target_code_avail_qty;
    SET v_exgp_trade_code_avail_qty = p_exgp_trade_code_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_asac_target_code_avail_qty = p_asac_target_code_avail_qty;
    SET v_asac_trade_code_avail_qty = p_asac_trade_code_avail_qty;
    SET v_exgp_busi_config_str = p_exgp_busi_config_str;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_strategy_batch_no = p_strategy_batch_no;
    SET v_strategy_exec_broker = p_strategy_exec_broker;
    SET v_strategy_exec_comm_str = p_strategy_exec_comm_str;
    SET v_strategy_exec_kind = p_strategy_exec_kind;
    SET v_strategy_dir = p_strategy_dir;
    SET v_strategy_price = p_strategy_price;
    SET v_price_type = p_price_type;
    SET v_strategy_qty = p_strategy_qty;
    SET v_cash_strategy_qty = p_cash_strategy_qty;
    SET v_strategy_amt = p_strategy_amt;
    SET v_strategy_valid_type = p_strategy_valid_type;
    SET v_strategy_rule_way = p_strategy_rule_way;
    SET v_remark_info = p_remark_info;
    SET v_margin_trade_type = p_margin_trade_type;
    SET v_target_strategy_type = p_target_strategy_type;
    SET v_target_strategy_param = p_target_strategy_param;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_intrst_days = p_intrst_days;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_strategy_oper_way = p_strategy_oper_way;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_strategy_price_type = p_strategy_price_type;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_id = p_comm_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strategy_id = 0;
    SET v_strategy_date = date_format(curdate(),'%Y%m%d');
    SET v_strategy_time = date_format(curtime(),'%H%i%s');
    SET v_strategy_status = " ";
    SET v_update_times = 1;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_strategy_deal_kind = 0;
    SET v_orig_strategy_id = 0;
    SET v_cancel_qty = 0;
    SET v_valid_wtdraw_qty = 0;
    SET v_valid_order_qty = 0;
    SET v_strategy_deal_status = " ";
    SET v_strategy_contr_comm = " ";
    SET v_oper_func_code = " ";
    SET v_strategy_order_qty = 0;
    SET v_strategy_capt_qty = 0;

    
    label_pro:BEGIN
    

    /* set @策略日期# = @初始化日期#; */
    set v_strategy_date = v_init_date;

    /* set @指令方向# = @策略方向#; */
    set v_comm_dir = v_strategy_dir;

    /* set @指令限价# = @策略价格#; */
    set v_comm_limit_price = v_strategy_price;

    /* set @指令数量# = @策略数量#; */
    set v_comm_qty = v_strategy_qty;

    /* if @策略金额# = 0 then */
    if v_strategy_amt = 0 then
    #指令金额后台自己计算，不采用前台传入

        /* set @指令方向# = @策略方向#; */
        set v_comm_dir = v_strategy_dir;

        /* set @指令实际限价# = @策略价格#; */
        set v_limit_actual_price = v_strategy_price;

        /* set @指令数量# = @策略数量#; */
        set v_comm_qty = v_strategy_qty;

        /* 调用【原子_交易证券_公用_计算指令金额】*/
        call db_tdsecu.pra_tdsepb_GetCommAmt(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_stock_type,
            v_comm_dir,
            v_limit_actual_price,
            v_comm_qty,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_error_code,
            v_error_info,
            v_comm_amt);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令金额出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @策略金额# = @指令金额#; */
        set v_strategy_amt = v_comm_amt;
    end if;
    #交易证券子系统检查，检查指令可用资金、可用持仓等

    /* if @指令序号# = 0 then */
    if v_comm_id = 0 then

        /* 调用【原子_交易证券_策略_校验新增策略】*/
        call db_tdsecu.pra_tdsest_CheckAddStrategyOrder(
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
            v_exch_crncy_type,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_code_no,
            v_trade_code_no,
            v_exgp_avail_amt,
            v_exgp_T_hk_buy_total_amt,
            v_exgp_T_hk_sell_total_amt,
            v_exgp_T1_hk_buy_total_amt,
            v_exgp_T1_hk_sell_total_amt,
            v_asac_avail_amt,
            v_asac_T_hk_buy_total_amt,
            v_asac_T_hk_sell_total_amt,
            v_asac_T1_hk_buy_total_amt,
            v_asac_T1_hk_sell_total_amt,
            v_exgp_avail_qty,
            v_exgp_target_code_avail_qty,
            v_exgp_trade_code_avail_qty,
            v_asac_avail_qty,
            v_asac_target_code_avail_qty,
            v_asac_trade_code_avail_qty,
            v_exgp_busi_config_str,
            v_asac_busi_config_str,
            v_capit_reback_days,
            v_posi_reback_days,
            v_strategy_dir,
            v_strategy_qty,
            v_strategy_amt,
            v_impawn_ratio,
            v_stock_type,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_校验新增策略出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;

    /* set @策略处理方式#=《策略处理方式-新增》; */
    set v_strategy_deal_kind=1;

    /* set @原策略序号#=0; */
    set v_orig_strategy_id=0;

    /* set @撤销数量# = 0; */
    set v_cancel_qty = 0;

    /* set @有效撤单数量# = 0; */
    set v_valid_wtdraw_qty = 0;

    /* set @有效订单数量# = 0; */
    set v_valid_order_qty = 0;

    /* [事务开始] */
    START TRANSACTION;


        /* set @策略处理状态# = 《策略处理状态-未处理》; */
        set v_strategy_deal_status = "1";

        /* set @策略控制指令#=" "; */
        set v_strategy_contr_comm=" ";

        /* set @操作功能#=@功能编码#; */
        set v_oper_func_code=v_func_code;

        /* set @策略订单数量# = 0; */
        set v_strategy_order_qty = 0;

        /* set @策略占用数量# = @策略数量#; */
        set v_strategy_capt_qty = v_strategy_qty;

        /* 调用【原子_交易证券_策略_新增策略】*/
        call db_tdsecu.pra_tdsest_AddStrategyOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_orig_strategy_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_crncy_type,
            v_exch_no,
            v_comm_opor,
            v_stock_acco,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_strategy_batch_no,
            v_strategy_dir,
            v_strategy_price,
            v_strategy_qty,
            v_cash_strategy_qty,
            v_strategy_amt,
            v_strategy_exec_broker,
            v_strategy_exec_kind,
            v_strategy_exec_comm_str,
            v_price_type,
            v_strategy_valid_type,
            v_strategy_rule_way,
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_remark_info,
            v_strategy_date,
            v_margin_trade_type,
            v_strategy_deal_kind,
            v_target_strategy_type,
            v_target_strategy_param,
            v_external_no,
            v_order_batch_no,
            v_strategy_oper_way,
            v_cancel_qty,
            v_valid_wtdraw_qty,
            v_valid_order_qty,
            v_strategy_price_type,
            v_comm_batch_no,
            v_comm_id,
            v_strategy_capt_qty,
            v_strategy_order_qty,
            v_error_code,
            v_error_info,
            v_strategy_id,
            v_strategy_status,
            v_strategy_time);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_新增策略出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_交易证券_策略_更新汇总策略】*/
        call db_tdsecu.pra_tdsest_UpdateStrategySumOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_oper_func_code,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_crncy_type,
            v_exch_no,
            v_comm_opor,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_strategy_batch_no,
            v_strategy_dir,
            v_strategy_price,
            v_strategy_qty,
            v_cash_strategy_qty,
            v_strategy_amt,
            v_strategy_exec_broker,
            v_strategy_exec_kind,
            v_strategy_exec_comm_str,
            v_price_type,
            v_strategy_valid_type,
            v_strategy_rule_way,
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_remark_info,
            v_strategy_date,
            v_margin_trade_type,
            v_strategy_deal_kind,
            v_target_strategy_type,
            v_target_strategy_param,
            v_external_no,
            v_order_batch_no,
            v_comm_batch_no,
            v_strategy_oper_way,
            v_strategy_status,
            v_strategy_deal_status,
            v_strategy_contr_comm,
            v_cancel_qty,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_更新汇总策略出现错误！',v_mysql_message);
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
    SET p_strategy_id = v_strategy_id;
    SET p_strategy_date = v_strategy_date;
    SET p_strategy_time = v_strategy_time;
    SET p_strategy_status = v_strategy_status;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_策略_暂停策略
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsest_PauseStrategyOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsest_PauseStrategyOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strategy_id bigint,
    IN p_target_strategy_type varchar(16),
    IN p_target_strategy_param varchar(2048),
    IN p_strategy_contr_comm varchar(2048),
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_opor int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_strategy_batch_no int,
    OUT p_orig_strategy_id bigint,
    OUT p_strategy_exec_broker varchar(16),
    OUT p_strategy_exec_kind int,
    OUT p_strategy_exec_comm_str varchar(2048),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_stock_code varchar(6),
    OUT p_stock_code_no int,
    OUT p_strategy_dir int,
    OUT p_strategy_qty decimal(18,2),
    OUT p_cash_strategy_qty decimal(18,2),
    OUT p_strategy_price decimal(16,9),
    OUT p_price_type int,
    OUT p_strategy_amt decimal(18,4),
    OUT p_strategy_valid_type int,
    OUT p_strategy_rule_way varchar(4),
    OUT p_exch_crncy_type varchar(3),
    OUT p_strategy_date int,
    OUT p_strategy_time int,
    OUT p_margin_trade_type int,
    OUT p_strategy_status varchar(2),
    OUT p_strategy_deal_status varchar(2),
    OUT p_strategy_deal_kind int,
    OUT p_order_qty decimal(18,2),
    OUT p_order_amt decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_external_no bigint,
    OUT p_order_batch_no int,
    OUT p_strategy_oper_way varchar(2),
    OUT p_busi_opor_no int,
    OUT p_new_strategy_id bigint,
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
    declare v_strategy_id bigint;
    declare v_target_strategy_type varchar(16);
    declare v_target_strategy_param varchar(2048);
    declare v_strategy_contr_comm varchar(2048);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_opor int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_strategy_batch_no int;
    declare v_orig_strategy_id bigint;
    declare v_strategy_exec_broker varchar(16);
    declare v_strategy_exec_kind int;
    declare v_strategy_exec_comm_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_strategy_dir int;
    declare v_strategy_qty decimal(18,2);
    declare v_cash_strategy_qty decimal(18,2);
    declare v_strategy_price decimal(16,9);
    declare v_price_type int;
    declare v_strategy_amt decimal(18,4);
    declare v_strategy_valid_type int;
    declare v_strategy_rule_way varchar(4);
    declare v_exch_crncy_type varchar(3);
    declare v_strategy_date int;
    declare v_strategy_time int;
    declare v_margin_trade_type int;
    declare v_strategy_status varchar(2);
    declare v_strategy_deal_status varchar(2);
    declare v_strategy_deal_kind int;
    declare v_order_qty decimal(18,2);
    declare v_order_amt decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_strategy_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_new_strategy_id bigint;
    declare v_update_times int;
    declare v_tmp_target_strategy_type varchar(16);
    declare v_tmp_target_strategy_param varchar(2048);
    declare v_tmp_strategy_contr_comm varchar(2048);
    declare v_tmp_remark_info varchar(255);
    declare v_init_date int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_valid_order_qty decimal(18,2);
    declare v_valid_wtdraw_qty decimal(18,2);
    declare v_strategy_price_type int;
    declare v_comm_batch_no int;
    declare v_comm_id bigint;
    declare v_tmp_valid_wtdraw_qty decimal(18,2);
    declare v_tmp_valid_order_qty decimal(18,2);
    declare v_tmp_strategy_status varchar(2);
    declare v_cancel_qty decimal(18,2);
    declare v_faild_qty decimal(18,2);
    declare v_strategy_capt_qty decimal(18,2);
    declare v_strategy_order_qty decimal(18,2);
    declare v_order_id bigint;
    declare v_strike_id bigint;

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
    SET v_strategy_id = p_strategy_id;
    SET v_target_strategy_type = p_target_strategy_type;
    SET v_target_strategy_param = p_target_strategy_param;
    SET v_strategy_contr_comm = p_strategy_contr_comm;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_opor = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_strategy_batch_no = 0;
    SET v_orig_strategy_id = 0;
    SET v_strategy_exec_broker = " ";
    SET v_strategy_exec_kind = 0;
    SET v_strategy_exec_comm_str = " ";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_strategy_dir = 0;
    SET v_strategy_qty = 0;
    SET v_cash_strategy_qty = 0;
    SET v_strategy_price = 0;
    SET v_price_type = 0;
    SET v_strategy_amt = 0;
    SET v_strategy_valid_type = 0;
    SET v_strategy_rule_way = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_strategy_date = date_format(curdate(),'%Y%m%d');
    SET v_strategy_time = date_format(curtime(),'%H%i%s');
    SET v_margin_trade_type = 0;
    SET v_strategy_status = " ";
    SET v_strategy_deal_status = " ";
    SET v_strategy_deal_kind = 0;
    SET v_order_qty = 0;
    SET v_order_amt = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_external_no = 0;
    SET v_order_batch_no = 0;
    SET v_strategy_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_new_strategy_id = 0;
    SET v_update_times = 1;
    SET v_tmp_target_strategy_type = " ";
    SET v_tmp_target_strategy_param = " ";
    SET v_tmp_strategy_contr_comm = " ";
    SET v_tmp_remark_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_valid_order_qty = 0;
    SET v_valid_wtdraw_qty = 0;
    SET v_strategy_price_type = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_id = 0;
    SET v_tmp_valid_wtdraw_qty = 0;
    SET v_tmp_valid_order_qty = 0;
    SET v_tmp_strategy_status = " ";
    SET v_cancel_qty = 0;
    SET v_faild_qty = 0;
    SET v_strategy_capt_qty = 0;
    SET v_strategy_order_qty = 0;
    SET v_order_id = 0;
    SET v_strike_id = 0;

    
    label_pro:BEGIN
    

    /* set @临时_目标策略类型# = @目标策略类型#; */
    set v_tmp_target_strategy_type = v_target_strategy_type;

    /* set @临时_目标策略参数# = @目标策略参数#; */
    set v_tmp_target_strategy_param = v_target_strategy_param;

    /* set @临时_策略控制指令# = @策略控制指令#; */
    set v_tmp_strategy_contr_comm = v_strategy_contr_comm;

    /* set @临时_备注信息# = @备注信息#; */
    set v_tmp_remark_info = v_remark_info;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_策略_锁定获取策略信息】*/
        call db_tdsecu.pra_tdsest_LockGetStrategyOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_strategy_id,
            v_error_code,
            v_error_info,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_crncy_type,
            v_exch_no,
            v_comm_opor,
            v_stock_acco,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_strategy_batch_no,
            v_strategy_dir,
            v_strategy_price,
            v_strategy_qty,
            v_cash_strategy_qty,
            v_strategy_amt,
            v_strategy_exec_broker,
            v_strategy_exec_kind,
            v_strategy_exec_comm_str,
            v_price_type,
            v_strategy_valid_type,
            v_strategy_rule_way,
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_remark_info,
            v_strategy_date,
            v_strategy_time,
            v_strategy_status,
            v_margin_trade_type,
            v_strategy_deal_kind,
            v_target_strategy_type,
            v_target_strategy_param,
            v_order_qty,
            v_valid_order_qty,
            v_order_amt,
            v_wtdraw_qty,
            v_valid_wtdraw_qty,
            v_strike_qty,
            v_strike_amt,
            v_strategy_deal_status,
            v_external_no,
            v_order_batch_no,
            v_strategy_oper_way,
            v_busi_opor_no,
            v_update_times,
            v_strategy_price_type,
            v_comm_batch_no,
            v_comm_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_锁定获取策略信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* [检查报错返回][@策略状态# <> 《策略状态-执行中》][800][@策略序号#,@策略状态#] */
        if v_strategy_status <> "3" then
            ROLLBACK;
            SET v_error_code = "tdsecuT.11.12.800";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("策略序号=",v_strategy_id,",","策略状态=",v_strategy_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("策略序号=",v_strategy_id,",","策略状态=",v_strategy_status);
            end if;
            leave label_pro;
        end if;


        /* set @临时_有效撤单数量# = @有效撤单数量#; */
        set v_tmp_valid_wtdraw_qty = v_valid_wtdraw_qty;

        /* set @临时_有效订单数量# = @有效订单数量#; */
        set v_tmp_valid_order_qty = v_valid_order_qty;

        /* set @策略状态# = 《策略状态-暂停中》; */
        set v_strategy_status = "4";

        /* set @临时_策略状态# = @策略状态#; */
        set v_tmp_strategy_status = v_strategy_status;

        /* set @有效撤单数量# = 0; */
        set v_valid_wtdraw_qty = 0;

        /* set @有效订单数量# = 0; */
        set v_valid_order_qty = 0;

        /* set @撤销数量# = 0; */
        set v_cancel_qty = 0;

        /* set @失败数量# = 0; */
        set v_faild_qty = 0;

        /* set @订单数量# = 0; */
        set v_order_qty = 0;

        /* set @订单金额# = 0; */
        set v_order_amt = 0;

        /* set @撤单数量# = 0; */
        set v_wtdraw_qty = 0;

        /* set @成交数量# = 0; */
        set v_strike_qty = 0;

        /* set @成交金额# = 0; */
        set v_strike_amt = 0;

        /* set @策略占用数量# = 0; */
        set v_strategy_capt_qty = 0;

        /* set @策略订单数量# = 0; */
        set v_strategy_order_qty = 0;

        /* 调用【原子_交易证券_策略_更新策略执行情况】*/
        call db_tdsecu.pra_tdsest_UpdateStrategyOrderExecution(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_strategy_id,
            v_order_qty,
            v_order_amt,
            v_wtdraw_qty,
            v_strike_qty,
            v_strike_amt,
            v_strategy_status,
            v_strategy_batch_no,
            v_valid_order_qty,
            v_valid_wtdraw_qty,
            v_faild_qty,
            v_cancel_qty,
            v_strategy_dir,
            v_comm_id,
            v_strategy_order_qty,
            v_strategy_capt_qty,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_更新策略执行情况出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @策略处理方式# = 《策略处理方式-暂停》; */
        set v_strategy_deal_kind = 2;

        /* set @原策略序号# = @策略序号#; */
        set v_orig_strategy_id = v_strategy_id;

        /* set @目标策略类型# = @临时_目标策略类型#; */
        set v_target_strategy_type = v_tmp_target_strategy_type;

        /* set @目标策略参数# = @临时_目标策略参数#; */
        set v_target_strategy_param = v_tmp_target_strategy_param;

        /* set @策略控制指令# = @临时_策略控制指令#; */
        set v_strategy_contr_comm = v_tmp_strategy_contr_comm;

        /* set @备注信息# = @临时_备注信息#; */
        set v_remark_info = v_tmp_remark_info;

        /* set @有效撤单数量# = @临时_有效撤单数量#; */
        set v_valid_wtdraw_qty = v_tmp_valid_wtdraw_qty;

        /* set @有效订单数量# = @临时_有效订单数量#; */
        set v_valid_order_qty = v_tmp_valid_order_qty;

        /* 调用【原子_交易证券_策略_新增策略】*/
        call db_tdsecu.pra_tdsest_AddStrategyOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_orig_strategy_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_crncy_type,
            v_exch_no,
            v_comm_opor,
            v_stock_acco,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_strategy_batch_no,
            v_strategy_dir,
            v_strategy_price,
            v_strategy_qty,
            v_cash_strategy_qty,
            v_strategy_amt,
            v_strategy_exec_broker,
            v_strategy_exec_kind,
            v_strategy_exec_comm_str,
            v_price_type,
            v_strategy_valid_type,
            v_strategy_rule_way,
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_remark_info,
            v_strategy_date,
            v_margin_trade_type,
            v_strategy_deal_kind,
            v_target_strategy_type,
            v_target_strategy_param,
            v_external_no,
            v_order_batch_no,
            v_strategy_oper_way,
            v_cancel_qty,
            v_valid_wtdraw_qty,
            v_valid_order_qty,
            v_strategy_price_type,
            v_comm_batch_no,
            v_comm_id,
            v_strategy_capt_qty,
            v_strategy_order_qty,
            v_error_code,
            v_error_info,
            v_strategy_id,
            v_strategy_status,
            v_strategy_time);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_新增策略出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @新策略序号# = @策略序号#; */
        set v_new_strategy_id = v_strategy_id;

        /* set @订单序号# = 0; */
        set v_order_id = 0;

        /* set @成交序号# = 0; */
        set v_strike_id = 0;

        /* set @备注信息# = concat("暂停策略：",@备注信息#); */
        set v_remark_info = concat("暂停策略：",v_remark_info);

        /* 调用【原子_交易证券_策略_新增策略流水】*/
        call db_tdsecu.pra_tdsest_AddStrategyOrderJour(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_comm_opor,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_strategy_batch_no,
            v_strategy_id,
            v_orig_strategy_id,
            v_exch_no,
            v_stock_acco_no,
            v_stock_acco,
            v_stock_type,
            v_asset_type,
            v_stock_code,
            v_stock_code_no,
            v_strategy_dir,
            v_strategy_qty,
            v_cash_strategy_qty,
            v_strategy_price,
            v_price_type,
            v_exch_crncy_type,
            v_strategy_date,
            v_strategy_time,
            v_strategy_status,
            v_strategy_deal_status,
            v_strategy_deal_kind,
            v_order_id,
            v_order_qty,
            v_order_amt,
            v_wtdraw_qty,
            v_strike_id,
            v_strike_qty,
            v_strike_amt,
            v_order_batch_no,
            v_strategy_oper_way,
            v_remark_info,
            v_comm_batch_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_新增策略流水出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @策略状态# = @临时_策略状态#; */
    set v_strategy_status = v_tmp_strategy_status;

    /* set @更新次数# = @更新次数# + 1; */
    set v_update_times = v_update_times + 1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_opor = v_comm_opor;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_strategy_batch_no = v_strategy_batch_no;
    SET p_orig_strategy_id = v_orig_strategy_id;
    SET p_strategy_exec_broker = v_strategy_exec_broker;
    SET p_strategy_exec_kind = v_strategy_exec_kind;
    SET p_strategy_exec_comm_str = v_strategy_exec_comm_str;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_stock_code = v_stock_code;
    SET p_stock_code_no = v_stock_code_no;
    SET p_strategy_dir = v_strategy_dir;
    SET p_strategy_qty = v_strategy_qty;
    SET p_cash_strategy_qty = v_cash_strategy_qty;
    SET p_strategy_price = v_strategy_price;
    SET p_price_type = v_price_type;
    SET p_strategy_amt = v_strategy_amt;
    SET p_strategy_valid_type = v_strategy_valid_type;
    SET p_strategy_rule_way = v_strategy_rule_way;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_strategy_date = v_strategy_date;
    SET p_strategy_time = v_strategy_time;
    SET p_margin_trade_type = v_margin_trade_type;
    SET p_strategy_status = v_strategy_status;
    SET p_strategy_deal_status = v_strategy_deal_status;
    SET p_strategy_deal_kind = v_strategy_deal_kind;
    SET p_order_qty = v_order_qty;
    SET p_order_amt = v_order_amt;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_external_no = v_external_no;
    SET p_order_batch_no = v_order_batch_no;
    SET p_strategy_oper_way = v_strategy_oper_way;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_new_strategy_id = v_new_strategy_id;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_策略_重启策略
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsest_ResumeStrategyOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsest_ResumeStrategyOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strategy_id bigint,
    IN p_target_strategy_type varchar(16),
    IN p_target_strategy_param varchar(2048),
    IN p_strategy_contr_comm varchar(2048),
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_opor int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_strategy_batch_no int,
    OUT p_orig_strategy_id bigint,
    OUT p_strategy_exec_broker varchar(16),
    OUT p_strategy_exec_kind int,
    OUT p_strategy_exec_comm_str varchar(2048),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_stock_code varchar(6),
    OUT p_stock_code_no int,
    OUT p_strategy_dir int,
    OUT p_strategy_qty decimal(18,2),
    OUT p_cash_strategy_qty decimal(18,2),
    OUT p_strategy_price decimal(16,9),
    OUT p_price_type int,
    OUT p_strategy_amt decimal(18,4),
    OUT p_strategy_valid_type int,
    OUT p_strategy_rule_way varchar(4),
    OUT p_exch_crncy_type varchar(3),
    OUT p_strategy_date int,
    OUT p_strategy_time int,
    OUT p_margin_trade_type int,
    OUT p_strategy_status varchar(2),
    OUT p_strategy_deal_status varchar(2),
    OUT p_strategy_deal_kind int,
    OUT p_order_qty decimal(18,2),
    OUT p_order_amt decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_external_no bigint,
    OUT p_order_batch_no int,
    OUT p_strategy_oper_way varchar(2),
    OUT p_busi_opor_no int,
    OUT p_new_strategy_id bigint,
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
    declare v_strategy_id bigint;
    declare v_target_strategy_type varchar(16);
    declare v_target_strategy_param varchar(2048);
    declare v_strategy_contr_comm varchar(2048);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_opor int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_strategy_batch_no int;
    declare v_orig_strategy_id bigint;
    declare v_strategy_exec_broker varchar(16);
    declare v_strategy_exec_kind int;
    declare v_strategy_exec_comm_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_strategy_dir int;
    declare v_strategy_qty decimal(18,2);
    declare v_cash_strategy_qty decimal(18,2);
    declare v_strategy_price decimal(16,9);
    declare v_price_type int;
    declare v_strategy_amt decimal(18,4);
    declare v_strategy_valid_type int;
    declare v_strategy_rule_way varchar(4);
    declare v_exch_crncy_type varchar(3);
    declare v_strategy_date int;
    declare v_strategy_time int;
    declare v_margin_trade_type int;
    declare v_strategy_status varchar(2);
    declare v_strategy_deal_status varchar(2);
    declare v_strategy_deal_kind int;
    declare v_order_qty decimal(18,2);
    declare v_order_amt decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_strategy_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_new_strategy_id bigint;
    declare v_update_times int;
    declare v_tmp_target_strategy_type varchar(16);
    declare v_tmp_target_strategy_param varchar(2048);
    declare v_tmp_strategy_contr_comm varchar(2048);
    declare v_tmp_remark_info varchar(255);
    declare v_init_date int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_valid_order_qty decimal(18,2);
    declare v_valid_wtdraw_qty decimal(18,2);
    declare v_strategy_price_type int;
    declare v_comm_batch_no int;
    declare v_comm_id bigint;
    declare v_tmp_valid_wtdraw_qty decimal(18,2);
    declare v_tmp_valid_order_qty decimal(18,2);
    declare v_tmp_strategy_status varchar(2);
    declare v_cancel_qty decimal(18,2);
    declare v_faild_qty decimal(18,2);
    declare v_strategy_capt_qty decimal(18,2);
    declare v_strategy_order_qty decimal(18,2);
    declare v_order_id bigint;
    declare v_strike_id bigint;

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
    SET v_strategy_id = p_strategy_id;
    SET v_target_strategy_type = p_target_strategy_type;
    SET v_target_strategy_param = p_target_strategy_param;
    SET v_strategy_contr_comm = p_strategy_contr_comm;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_opor = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_strategy_batch_no = 0;
    SET v_orig_strategy_id = 0;
    SET v_strategy_exec_broker = " ";
    SET v_strategy_exec_kind = 0;
    SET v_strategy_exec_comm_str = " ";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_strategy_dir = 0;
    SET v_strategy_qty = 0;
    SET v_cash_strategy_qty = 0;
    SET v_strategy_price = 0;
    SET v_price_type = 0;
    SET v_strategy_amt = 0;
    SET v_strategy_valid_type = 0;
    SET v_strategy_rule_way = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_strategy_date = date_format(curdate(),'%Y%m%d');
    SET v_strategy_time = date_format(curtime(),'%H%i%s');
    SET v_margin_trade_type = 0;
    SET v_strategy_status = " ";
    SET v_strategy_deal_status = " ";
    SET v_strategy_deal_kind = 0;
    SET v_order_qty = 0;
    SET v_order_amt = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_external_no = 0;
    SET v_order_batch_no = 0;
    SET v_strategy_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_new_strategy_id = 0;
    SET v_update_times = 1;
    SET v_tmp_target_strategy_type = " ";
    SET v_tmp_target_strategy_param = " ";
    SET v_tmp_strategy_contr_comm = " ";
    SET v_tmp_remark_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_valid_order_qty = 0;
    SET v_valid_wtdraw_qty = 0;
    SET v_strategy_price_type = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_id = 0;
    SET v_tmp_valid_wtdraw_qty = 0;
    SET v_tmp_valid_order_qty = 0;
    SET v_tmp_strategy_status = " ";
    SET v_cancel_qty = 0;
    SET v_faild_qty = 0;
    SET v_strategy_capt_qty = 0;
    SET v_strategy_order_qty = 0;
    SET v_order_id = 0;
    SET v_strike_id = 0;

    
    label_pro:BEGIN
    

    /* set @临时_目标策略类型# = @目标策略类型#; */
    set v_tmp_target_strategy_type = v_target_strategy_type;

    /* set @临时_目标策略参数# = @目标策略参数#; */
    set v_tmp_target_strategy_param = v_target_strategy_param;

    /* set @临时_策略控制指令# = @策略控制指令#; */
    set v_tmp_strategy_contr_comm = v_strategy_contr_comm;

    /* set @临时_备注信息# = @备注信息#; */
    set v_tmp_remark_info = v_remark_info;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_策略_锁定获取策略信息】*/
        call db_tdsecu.pra_tdsest_LockGetStrategyOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_strategy_id,
            v_error_code,
            v_error_info,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_crncy_type,
            v_exch_no,
            v_comm_opor,
            v_stock_acco,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_strategy_batch_no,
            v_strategy_dir,
            v_strategy_price,
            v_strategy_qty,
            v_cash_strategy_qty,
            v_strategy_amt,
            v_strategy_exec_broker,
            v_strategy_exec_kind,
            v_strategy_exec_comm_str,
            v_price_type,
            v_strategy_valid_type,
            v_strategy_rule_way,
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_remark_info,
            v_strategy_date,
            v_strategy_time,
            v_strategy_status,
            v_margin_trade_type,
            v_strategy_deal_kind,
            v_target_strategy_type,
            v_target_strategy_param,
            v_order_qty,
            v_valid_order_qty,
            v_order_amt,
            v_wtdraw_qty,
            v_valid_wtdraw_qty,
            v_strike_qty,
            v_strike_amt,
            v_strategy_deal_status,
            v_external_no,
            v_order_batch_no,
            v_strategy_oper_way,
            v_busi_opor_no,
            v_update_times,
            v_strategy_price_type,
            v_comm_batch_no,
            v_comm_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_锁定获取策略信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* [检查报错返回][@策略状态# <> 《策略状态-已暂停》][801][@策略序号#,@策略状态#] */
        if v_strategy_status <> "5" then
            ROLLBACK;
            SET v_error_code = "tdsecuT.11.13.801";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("策略序号=",v_strategy_id,",","策略状态=",v_strategy_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("策略序号=",v_strategy_id,",","策略状态=",v_strategy_status);
            end if;
            leave label_pro;
        end if;


        /* set @临时_有效撤单数量# = @有效撤单数量#; */
        set v_tmp_valid_wtdraw_qty = v_valid_wtdraw_qty;

        /* set @临时_有效订单数量# = @有效订单数量#; */
        set v_tmp_valid_order_qty = v_valid_order_qty;

        /* set @策略状态# = 《策略状态-重启中》; */
        set v_strategy_status = "6";

        /* set @临时_策略状态# = @策略状态#; */
        set v_tmp_strategy_status = v_strategy_status;

        /* set @有效撤单数量# = 0; */
        set v_valid_wtdraw_qty = 0;

        /* set @有效订单数量# = 0; */
        set v_valid_order_qty = 0;

        /* set @撤销数量# = 0; */
        set v_cancel_qty = 0;

        /* set @失败数量# = 0; */
        set v_faild_qty = 0;

        /* set @订单数量# = 0; */
        set v_order_qty = 0;

        /* set @订单金额# = 0; */
        set v_order_amt = 0;

        /* set @撤单数量# = 0; */
        set v_wtdraw_qty = 0;

        /* set @成交数量# = 0; */
        set v_strike_qty = 0;

        /* set @成交金额# = 0; */
        set v_strike_amt = 0;

        /* set @策略占用数量# = 0; */
        set v_strategy_capt_qty = 0;

        /* set @策略订单数量# = 0; */
        set v_strategy_order_qty = 0;

        /* 调用【原子_交易证券_策略_更新策略执行情况】*/
        call db_tdsecu.pra_tdsest_UpdateStrategyOrderExecution(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_strategy_id,
            v_order_qty,
            v_order_amt,
            v_wtdraw_qty,
            v_strike_qty,
            v_strike_amt,
            v_strategy_status,
            v_strategy_batch_no,
            v_valid_order_qty,
            v_valid_wtdraw_qty,
            v_faild_qty,
            v_cancel_qty,
            v_strategy_dir,
            v_comm_id,
            v_strategy_order_qty,
            v_strategy_capt_qty,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_更新策略执行情况出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @策略处理方式# = 《策略处理方式-重启》; */
        set v_strategy_deal_kind = 2;

        /* set @原策略序号# = @策略序号#; */
        set v_orig_strategy_id = v_strategy_id;

        /* set @目标策略类型# = @临时_目标策略类型#; */
        set v_target_strategy_type = v_tmp_target_strategy_type;

        /* set @目标策略参数# = @临时_目标策略参数#; */
        set v_target_strategy_param = v_tmp_target_strategy_param;

        /* set @策略控制指令# = @临时_策略控制指令#; */
        set v_strategy_contr_comm = v_tmp_strategy_contr_comm;

        /* set @备注信息# = @临时_备注信息#; */
        set v_remark_info = v_tmp_remark_info;

        /* set @撤销数量# = 0; */
        set v_cancel_qty = 0;

        /* set @有效撤单数量# = @临时_有效撤单数量#; */
        set v_valid_wtdraw_qty = v_tmp_valid_wtdraw_qty;

        /* set @有效订单数量# = @临时_有效订单数量#; */
        set v_valid_order_qty = v_tmp_valid_order_qty;

        /* 调用【原子_交易证券_策略_新增策略】*/
        call db_tdsecu.pra_tdsest_AddStrategyOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_orig_strategy_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_crncy_type,
            v_exch_no,
            v_comm_opor,
            v_stock_acco,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_strategy_batch_no,
            v_strategy_dir,
            v_strategy_price,
            v_strategy_qty,
            v_cash_strategy_qty,
            v_strategy_amt,
            v_strategy_exec_broker,
            v_strategy_exec_kind,
            v_strategy_exec_comm_str,
            v_price_type,
            v_strategy_valid_type,
            v_strategy_rule_way,
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_remark_info,
            v_strategy_date,
            v_margin_trade_type,
            v_strategy_deal_kind,
            v_target_strategy_type,
            v_target_strategy_param,
            v_external_no,
            v_order_batch_no,
            v_strategy_oper_way,
            v_cancel_qty,
            v_valid_wtdraw_qty,
            v_valid_order_qty,
            v_strategy_price_type,
            v_comm_batch_no,
            v_comm_id,
            v_strategy_capt_qty,
            v_strategy_order_qty,
            v_error_code,
            v_error_info,
            v_strategy_id,
            v_strategy_status,
            v_strategy_time);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_新增策略出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @新策略序号# = @策略序号#; */
        set v_new_strategy_id = v_strategy_id;

        /* set @订单序号# = 0; */
        set v_order_id = 0;

        /* set @成交序号# = 0; */
        set v_strike_id = 0;

        /* set @备注信息# = concat("重启策略：",@备注信息#); */
        set v_remark_info = concat("重启策略：",v_remark_info);

        /* 调用【原子_交易证券_策略_新增策略流水】*/
        call db_tdsecu.pra_tdsest_AddStrategyOrderJour(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_comm_opor,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_strategy_batch_no,
            v_strategy_id,
            v_orig_strategy_id,
            v_exch_no,
            v_stock_acco_no,
            v_stock_acco,
            v_stock_type,
            v_asset_type,
            v_stock_code,
            v_stock_code_no,
            v_strategy_dir,
            v_strategy_qty,
            v_cash_strategy_qty,
            v_strategy_price,
            v_price_type,
            v_exch_crncy_type,
            v_strategy_date,
            v_strategy_time,
            v_strategy_status,
            v_strategy_deal_status,
            v_strategy_deal_kind,
            v_order_id,
            v_order_qty,
            v_order_amt,
            v_wtdraw_qty,
            v_strike_id,
            v_strike_qty,
            v_strike_amt,
            v_order_batch_no,
            v_strategy_oper_way,
            v_remark_info,
            v_comm_batch_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_新增策略流水出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @策略状态# = @临时_策略状态#; */
    set v_strategy_status = v_tmp_strategy_status;

    /* set @更新次数# = @更新次数# + 1; */
    set v_update_times = v_update_times + 1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_opor = v_comm_opor;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_strategy_batch_no = v_strategy_batch_no;
    SET p_orig_strategy_id = v_orig_strategy_id;
    SET p_strategy_exec_broker = v_strategy_exec_broker;
    SET p_strategy_exec_kind = v_strategy_exec_kind;
    SET p_strategy_exec_comm_str = v_strategy_exec_comm_str;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_stock_code = v_stock_code;
    SET p_stock_code_no = v_stock_code_no;
    SET p_strategy_dir = v_strategy_dir;
    SET p_strategy_qty = v_strategy_qty;
    SET p_cash_strategy_qty = v_cash_strategy_qty;
    SET p_strategy_price = v_strategy_price;
    SET p_price_type = v_price_type;
    SET p_strategy_amt = v_strategy_amt;
    SET p_strategy_valid_type = v_strategy_valid_type;
    SET p_strategy_rule_way = v_strategy_rule_way;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_strategy_date = v_strategy_date;
    SET p_strategy_time = v_strategy_time;
    SET p_margin_trade_type = v_margin_trade_type;
    SET p_strategy_status = v_strategy_status;
    SET p_strategy_deal_status = v_strategy_deal_status;
    SET p_strategy_deal_kind = v_strategy_deal_kind;
    SET p_order_qty = v_order_qty;
    SET p_order_amt = v_order_amt;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_external_no = v_external_no;
    SET p_order_batch_no = v_order_batch_no;
    SET p_strategy_oper_way = v_strategy_oper_way;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_new_strategy_id = v_new_strategy_id;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_策略_撤销策略
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsest_CancelStrategyOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsest_CancelStrategyOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strategy_id bigint,
    IN p_target_strategy_type varchar(16),
    IN p_target_strategy_param varchar(2048),
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_opor int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_strategy_batch_no int,
    OUT p_orig_strategy_id bigint,
    OUT p_strategy_exec_broker varchar(16),
    OUT p_strategy_exec_kind int,
    OUT p_strategy_exec_comm_str varchar(2048),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_stock_code varchar(6),
    OUT p_stock_code_no int,
    OUT p_strategy_dir int,
    OUT p_strategy_qty decimal(18,2),
    OUT p_cash_strategy_qty decimal(18,2),
    OUT p_strategy_price decimal(16,9),
    OUT p_price_type int,
    OUT p_strategy_amt decimal(18,4),
    OUT p_strategy_valid_type int,
    OUT p_strategy_rule_way varchar(4),
    OUT p_exch_crncy_type varchar(3),
    OUT p_strategy_date int,
    OUT p_strategy_time int,
    OUT p_margin_trade_type int,
    OUT p_strategy_status varchar(2),
    OUT p_strategy_deal_status varchar(2),
    OUT p_strategy_deal_kind int,
    OUT p_order_qty decimal(18,2),
    OUT p_order_amt decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_external_no bigint,
    OUT p_order_batch_no int,
    OUT p_strategy_oper_way varchar(2),
    OUT p_busi_opor_no int,
    OUT p_new_strategy_id bigint,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
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
    declare v_strategy_id bigint;
    declare v_target_strategy_type varchar(16);
    declare v_target_strategy_param varchar(2048);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_opor int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_strategy_batch_no int;
    declare v_orig_strategy_id bigint;
    declare v_strategy_exec_broker varchar(16);
    declare v_strategy_exec_kind int;
    declare v_strategy_exec_comm_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_strategy_dir int;
    declare v_strategy_qty decimal(18,2);
    declare v_cash_strategy_qty decimal(18,2);
    declare v_strategy_price decimal(16,9);
    declare v_price_type int;
    declare v_strategy_amt decimal(18,4);
    declare v_strategy_valid_type int;
    declare v_strategy_rule_way varchar(4);
    declare v_exch_crncy_type varchar(3);
    declare v_strategy_date int;
    declare v_strategy_time int;
    declare v_margin_trade_type int;
    declare v_strategy_status varchar(2);
    declare v_strategy_deal_status varchar(2);
    declare v_strategy_deal_kind int;
    declare v_order_qty decimal(18,2);
    declare v_order_amt decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_strategy_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_new_strategy_id bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_update_times int;
    declare v_tmp_target_strategy_type varchar(16);
    declare v_tmp_target_strategy_param varchar(2048);
    declare v_tmp_remark_info varchar(255);
    declare v_init_date int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_valid_order_qty decimal(18,2);
    declare v_valid_wtdraw_qty decimal(18,2);
    declare v_strategy_price_type int;
    declare v_cancel_qty decimal(18,2);
    declare v_faild_qty decimal(18,2);
    declare v_tmp_strategy_status varchar(2);
    declare v_tmp_valid_wtdraw_qty decimal(18,2);
    declare v_tmp_valid_order_qty decimal(18,2);
    declare v_strategy_capt_qty decimal(18,2);
    declare v_strategy_order_qty decimal(18,2);
    declare v_order_id bigint;
    declare v_strike_id bigint;

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
    SET v_strategy_id = p_strategy_id;
    SET v_target_strategy_type = p_target_strategy_type;
    SET v_target_strategy_param = p_target_strategy_param;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_opor = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_strategy_batch_no = 0;
    SET v_orig_strategy_id = 0;
    SET v_strategy_exec_broker = " ";
    SET v_strategy_exec_kind = 0;
    SET v_strategy_exec_comm_str = " ";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_strategy_dir = 0;
    SET v_strategy_qty = 0;
    SET v_cash_strategy_qty = 0;
    SET v_strategy_price = 0;
    SET v_price_type = 0;
    SET v_strategy_amt = 0;
    SET v_strategy_valid_type = 0;
    SET v_strategy_rule_way = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_strategy_date = date_format(curdate(),'%Y%m%d');
    SET v_strategy_time = date_format(curtime(),'%H%i%s');
    SET v_margin_trade_type = 0;
    SET v_strategy_status = " ";
    SET v_strategy_deal_status = " ";
    SET v_strategy_deal_kind = 0;
    SET v_order_qty = 0;
    SET v_order_amt = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_external_no = 0;
    SET v_order_batch_no = 0;
    SET v_strategy_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_new_strategy_id = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_update_times = 1;
    SET v_tmp_target_strategy_type = " ";
    SET v_tmp_target_strategy_param = " ";
    SET v_tmp_remark_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_valid_order_qty = 0;
    SET v_valid_wtdraw_qty = 0;
    SET v_strategy_price_type = 0;
    SET v_cancel_qty = 0;
    SET v_faild_qty = 0;
    SET v_tmp_strategy_status = " ";
    SET v_tmp_valid_wtdraw_qty = 0;
    SET v_tmp_valid_order_qty = 0;
    SET v_strategy_capt_qty = 0;
    SET v_strategy_order_qty = 0;
    SET v_order_id = 0;
    SET v_strike_id = 0;

    
    label_pro:BEGIN
    

    /* set @临时_目标策略类型# = @目标策略类型#; */
    set v_tmp_target_strategy_type = v_target_strategy_type;

    /* set @临时_目标策略参数# = @目标策略参数#; */
    set v_tmp_target_strategy_param = v_target_strategy_param;

    /* set @临时_备注信息# = @备注信息#; */
    set v_tmp_remark_info = v_remark_info;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_策略_锁定获取策略信息】*/
        call db_tdsecu.pra_tdsest_LockGetStrategyOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_strategy_id,
            v_error_code,
            v_error_info,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_crncy_type,
            v_exch_no,
            v_comm_opor,
            v_stock_acco,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_strategy_batch_no,
            v_strategy_dir,
            v_strategy_price,
            v_strategy_qty,
            v_cash_strategy_qty,
            v_strategy_amt,
            v_strategy_exec_broker,
            v_strategy_exec_kind,
            v_strategy_exec_comm_str,
            v_price_type,
            v_strategy_valid_type,
            v_strategy_rule_way,
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_remark_info,
            v_strategy_date,
            v_strategy_time,
            v_strategy_status,
            v_margin_trade_type,
            v_strategy_deal_kind,
            v_target_strategy_type,
            v_target_strategy_param,
            v_order_qty,
            v_valid_order_qty,
            v_order_amt,
            v_wtdraw_qty,
            v_valid_wtdraw_qty,
            v_strike_qty,
            v_strike_amt,
            v_strategy_deal_status,
            v_external_no,
            v_order_batch_no,
            v_strategy_oper_way,
            v_busi_opor_no,
            v_update_times,
            v_strategy_price_type,
            v_comm_batch_no,
            v_comm_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.14.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_锁定获取策略信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* [检查报错返回][@策略状态# <> 《策略状态-新建》 and @策略状态# <> 《策略状态-执行中》 and @策略状态# <> 《策略状态-已暂停》][802][@策略序号#,@策略状态#] */
        if v_strategy_status <> "1" and v_strategy_status <> "3" and v_strategy_status <> "5" then
            ROLLBACK;
            SET v_error_code = "tdsecuT.11.14.802";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("策略序号=",v_strategy_id,",","策略状态=",v_strategy_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("策略序号=",v_strategy_id,",","策略状态=",v_strategy_status);
            end if;
            leave label_pro;
        end if;


        /* if @策略状态# = 《策略状态-新建》then */
        if v_strategy_status = "1"then

            /* set @策略状态# = 《策略状态-已撤销》; */
            set v_strategy_status = "b";

            /* set @撤销数量# = @策略数量# - @成交数量#-@失败数量#; */
            set v_cancel_qty = v_strategy_qty - v_strike_qty-v_faild_qty;
        else

            /* set @策略状态# = 《策略状态-撤销中》; */
            set v_strategy_status = "a";
        end if;

        /* set @临时_策略状态# = @策略状态#; */
        set v_tmp_strategy_status = v_strategy_status;

        /* set @临时_有效撤单数量# = @有效撤单数量#; */
        set v_tmp_valid_wtdraw_qty = v_valid_wtdraw_qty;

        /* set @临时_有效订单数量# = @有效订单数量#; */
        set v_tmp_valid_order_qty = v_valid_order_qty;

        /* set @有效撤单数量# = 0; */
        set v_valid_wtdraw_qty = 0;

        /* set @有效订单数量# = 0; */
        set v_valid_order_qty = 0;

        /* set @失败数量# = 0; */
        set v_faild_qty = 0;

        /* set @订单数量# = 0; */
        set v_order_qty = 0;

        /* set @订单金额# = 0; */
        set v_order_amt = 0;

        /* set @撤单数量# = 0; */
        set v_wtdraw_qty = 0;

        /* set @成交数量# = 0; */
        set v_strike_qty = 0;

        /* set @成交金额# = 0; */
        set v_strike_amt = 0;

        /* set @策略占用数量# = 0; */
        set v_strategy_capt_qty = 0;

        /* set @策略订单数量# = 0; */
        set v_strategy_order_qty = 0;

        /* 调用【原子_交易证券_策略_更新策略执行情况】*/
        call db_tdsecu.pra_tdsest_UpdateStrategyOrderExecution(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_strategy_id,
            v_order_qty,
            v_order_amt,
            v_wtdraw_qty,
            v_strike_qty,
            v_strike_amt,
            v_strategy_status,
            v_strategy_batch_no,
            v_valid_order_qty,
            v_valid_wtdraw_qty,
            v_faild_qty,
            v_cancel_qty,
            v_strategy_dir,
            v_comm_id,
            v_strategy_order_qty,
            v_strategy_capt_qty,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.14.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_更新策略执行情况出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @策略处理方式# = 《策略处理方式-撤销》; */
        set v_strategy_deal_kind = 2;

        /* set @原策略序号# = @策略序号#; */
        set v_orig_strategy_id = v_strategy_id;

        /* set @目标策略类型# = @临时_目标策略类型#; */
        set v_target_strategy_type = v_tmp_target_strategy_type;

        /* set @目标策略参数# = @临时_目标策略参数#; */
        set v_target_strategy_param = v_tmp_target_strategy_param;

        /* set @备注信息# = @临时_备注信息#; */
        set v_remark_info = v_tmp_remark_info;

        /* set @有效撤单数量# = @临时_有效撤单数量#; */
        set v_valid_wtdraw_qty = v_tmp_valid_wtdraw_qty;

        /* set @有效订单数量# = @临时_有效订单数量#; */
        set v_valid_order_qty = v_tmp_valid_order_qty;

        /* set @策略占用数量# = -@撤销数量#; */
        set v_strategy_capt_qty = -v_cancel_qty;

        /* 调用【原子_交易证券_策略_新增策略】*/
        call db_tdsecu.pra_tdsest_AddStrategyOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_orig_strategy_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_crncy_type,
            v_exch_no,
            v_comm_opor,
            v_stock_acco,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_strategy_batch_no,
            v_strategy_dir,
            v_strategy_price,
            v_strategy_qty,
            v_cash_strategy_qty,
            v_strategy_amt,
            v_strategy_exec_broker,
            v_strategy_exec_kind,
            v_strategy_exec_comm_str,
            v_price_type,
            v_strategy_valid_type,
            v_strategy_rule_way,
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_remark_info,
            v_strategy_date,
            v_margin_trade_type,
            v_strategy_deal_kind,
            v_target_strategy_type,
            v_target_strategy_param,
            v_external_no,
            v_order_batch_no,
            v_strategy_oper_way,
            v_cancel_qty,
            v_valid_wtdraw_qty,
            v_valid_order_qty,
            v_strategy_price_type,
            v_comm_batch_no,
            v_comm_id,
            v_strategy_capt_qty,
            v_strategy_order_qty,
            v_error_code,
            v_error_info,
            v_strategy_id,
            v_strategy_status,
            v_strategy_time);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.14.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_新增策略出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @新策略序号# = @策略序号#; */
        set v_new_strategy_id = v_strategy_id;

        /* set @订单序号# = 0; */
        set v_order_id = 0;

        /* set @成交序号# = 0; */
        set v_strike_id = 0;

        /* set @备注信息# = concat("撤销策略：",@备注信息#); */
        set v_remark_info = concat("撤销策略：",v_remark_info);

        /* 调用【原子_交易证券_策略_新增策略流水】*/
        call db_tdsecu.pra_tdsest_AddStrategyOrderJour(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_comm_opor,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_strategy_batch_no,
            v_strategy_id,
            v_orig_strategy_id,
            v_exch_no,
            v_stock_acco_no,
            v_stock_acco,
            v_stock_type,
            v_asset_type,
            v_stock_code,
            v_stock_code_no,
            v_strategy_dir,
            v_strategy_qty,
            v_cash_strategy_qty,
            v_strategy_price,
            v_price_type,
            v_exch_crncy_type,
            v_strategy_date,
            v_strategy_time,
            v_strategy_status,
            v_strategy_deal_status,
            v_strategy_deal_kind,
            v_order_id,
            v_order_qty,
            v_order_amt,
            v_wtdraw_qty,
            v_strike_id,
            v_strike_qty,
            v_strike_amt,
            v_order_batch_no,
            v_strategy_oper_way,
            v_remark_info,
            v_comm_batch_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.14.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_新增策略流水出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @策略状态# = @临时_策略状态#; */
    set v_strategy_status = v_tmp_strategy_status;

    /* set @更新次数# = @更新次数# + 1; */
    set v_update_times = v_update_times + 1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_opor = v_comm_opor;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_strategy_batch_no = v_strategy_batch_no;
    SET p_orig_strategy_id = v_orig_strategy_id;
    SET p_strategy_exec_broker = v_strategy_exec_broker;
    SET p_strategy_exec_kind = v_strategy_exec_kind;
    SET p_strategy_exec_comm_str = v_strategy_exec_comm_str;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_stock_code = v_stock_code;
    SET p_stock_code_no = v_stock_code_no;
    SET p_strategy_dir = v_strategy_dir;
    SET p_strategy_qty = v_strategy_qty;
    SET p_cash_strategy_qty = v_cash_strategy_qty;
    SET p_strategy_price = v_strategy_price;
    SET p_price_type = v_price_type;
    SET p_strategy_amt = v_strategy_amt;
    SET p_strategy_valid_type = v_strategy_valid_type;
    SET p_strategy_rule_way = v_strategy_rule_way;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_strategy_date = v_strategy_date;
    SET p_strategy_time = v_strategy_time;
    SET p_margin_trade_type = v_margin_trade_type;
    SET p_strategy_status = v_strategy_status;
    SET p_strategy_deal_status = v_strategy_deal_status;
    SET p_strategy_deal_kind = v_strategy_deal_kind;
    SET p_order_qty = v_order_qty;
    SET p_order_amt = v_order_amt;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_external_no = v_external_no;
    SET p_order_batch_no = v_order_batch_no;
    SET p_strategy_oper_way = v_strategy_oper_way;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_new_strategy_id = v_new_strategy_id;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_策略_更新策略执行情况
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsest_UpdateStrategyOrderExecution;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsest_UpdateStrategyOrderExecution(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strategy_id bigint,
    IN p_order_id bigint,
    IN p_order_qty decimal(18,2),
    IN p_order_amt decimal(18,4),
    IN p_wtdraw_qty decimal(18,2),
    IN p_strike_id bigint,
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_busi_opor_no int,
    OUT p_comm_opor int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_strategy_exec_broker varchar(16),
    OUT p_strategy_exec_kind int,
    OUT p_strategy_exec_comm_str varchar(2048),
    OUT p_exch_no int,
    OUT p_stock_type int,
    OUT p_stock_code varchar(6),
    OUT p_stock_code_no int,
    OUT p_strategy_dir int,
    OUT p_strategy_qty decimal(18,2),
    OUT p_cash_strategy_qty decimal(18,2),
    OUT p_strategy_price decimal(16,9),
    OUT p_strategy_amt decimal(18,4),
    OUT p_price_type int,
    OUT p_strategy_valid_type int,
    OUT p_strategy_rule_way varchar(4),
    OUT p_exch_crncy_type varchar(3),
    OUT p_remark_info varchar(255),
    OUT p_strategy_date int,
    OUT p_strategy_time int,
    OUT p_margin_trade_type int,
    OUT p_target_strategy_type varchar(16),
    OUT p_target_strategy_param varchar(2048),
    OUT p_external_no bigint,
    OUT p_order_batch_no int,
    OUT p_strategy_status varchar(2),
    OUT p_total_order_qty decimal(18,2),
    OUT p_total_order_amt decimal(18,4),
    OUT p_all_wtdraw_qty decimal(18,2),
    OUT p_total_strike_qty decimal(18,2),
    OUT p_total_strike_amt decimal(18,4),
    OUT p_strategy_oper_way varchar(2),
    OUT p_strategy_batch_no int,
    OUT p_comm_batch_no int,
    OUT p_update_times int,
    OUT p_is_auto_push varchar(2),
    OUT p_comm_id bigint
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_strategy_id bigint;
    declare v_order_id bigint;
    declare v_order_qty decimal(18,2);
    declare v_order_amt decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_id bigint;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_opor_no int;
    declare v_comm_opor int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_strategy_exec_broker varchar(16);
    declare v_strategy_exec_kind int;
    declare v_strategy_exec_comm_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_strategy_dir int;
    declare v_strategy_qty decimal(18,2);
    declare v_cash_strategy_qty decimal(18,2);
    declare v_strategy_price decimal(16,9);
    declare v_strategy_amt decimal(18,4);
    declare v_price_type int;
    declare v_strategy_valid_type int;
    declare v_strategy_rule_way varchar(4);
    declare v_exch_crncy_type varchar(3);
    declare v_remark_info varchar(255);
    declare v_strategy_date int;
    declare v_strategy_time int;
    declare v_margin_trade_type int;
    declare v_target_strategy_type varchar(16);
    declare v_target_strategy_param varchar(2048);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_strategy_status varchar(2);
    declare v_total_order_qty decimal(18,2);
    declare v_total_order_amt decimal(18,4);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_total_strike_qty decimal(18,2);
    declare v_total_strike_amt decimal(18,4);
    declare v_strategy_oper_way varchar(2);
    declare v_strategy_batch_no int;
    declare v_comm_batch_no int;
    declare v_update_times int;
    declare v_is_auto_push varchar(2);
    declare v_comm_id bigint;
    declare v_tmp_order_qty decimal(18,2);
    declare v_tmp_order_amt decimal(18,4);
    declare v_tmp_wtdraw_qty decimal(18,2);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_init_date int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_stock_acco varchar(16);
    declare v_stock_acco_no int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_asset_type int;
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_strategy_deal_kind int;
    declare v_valid_order_qty decimal(18,2);
    declare v_valid_wtdraw_qty decimal(18,2);
    declare v_strategy_deal_status varchar(2);
    declare v_strategy_price_type int;
    declare v_faild_qty decimal(18,2);
    declare v_cancel_qty decimal(18,2);
    declare v_strategy_order_qty decimal(18,2);
    declare v_strategy_capt_qty decimal(18,2);
    declare v_orig_strategy_id bigint;
    declare v_tmp_strategy_id bigint;
    declare v_update_date int;
    declare v_update_time int;

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
    SET v_strategy_id = p_strategy_id;
    SET v_order_id = p_order_id;
    SET v_order_qty = p_order_qty;
    SET v_order_amt = p_order_amt;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_strike_id = p_strike_id;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_opor_no = 0;
    SET v_comm_opor = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_strategy_exec_broker = " ";
    SET v_strategy_exec_kind = 0;
    SET v_strategy_exec_comm_str = " ";
    SET v_exch_no = 0;
    SET v_stock_type = 0;
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_strategy_dir = 0;
    SET v_strategy_qty = 0;
    SET v_cash_strategy_qty = 0;
    SET v_strategy_price = 0;
    SET v_strategy_amt = 0;
    SET v_price_type = 0;
    SET v_strategy_valid_type = 0;
    SET v_strategy_rule_way = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_remark_info = " ";
    SET v_strategy_date = date_format(curdate(),'%Y%m%d');
    SET v_strategy_time = date_format(curtime(),'%H%i%s');
    SET v_margin_trade_type = 0;
    SET v_target_strategy_type = " ";
    SET v_target_strategy_param = " ";
    SET v_external_no = 0;
    SET v_order_batch_no = 0;
    SET v_strategy_status = " ";
    SET v_total_order_qty = 0;
    SET v_total_order_amt = 0;
    SET v_all_wtdraw_qty = 0;
    SET v_total_strike_qty = 0;
    SET v_total_strike_amt = 0;
    SET v_strategy_oper_way = " ";
    SET v_strategy_batch_no = 0;
    SET v_comm_batch_no = 0;
    SET v_update_times = 1;
    SET v_is_auto_push = "0";
    SET v_comm_id = 0;
    SET v_tmp_order_qty = 0;
    SET v_tmp_order_amt = 0;
    SET v_tmp_wtdraw_qty = 0;
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_amt = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_stock_acco = " ";
    SET v_stock_acco_no = 0;
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_asset_type = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_strategy_deal_kind = 0;
    SET v_valid_order_qty = 0;
    SET v_valid_wtdraw_qty = 0;
    SET v_strategy_deal_status = " ";
    SET v_strategy_price_type = 0;
    SET v_faild_qty = 0;
    SET v_cancel_qty = 0;
    SET v_strategy_order_qty = 0;
    SET v_strategy_capt_qty = 0;
    SET v_orig_strategy_id = 0;
    SET v_tmp_strategy_id = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @临时_订单数量# = @订单数量#; */
    set v_tmp_order_qty = v_order_qty;

    /* set @临时_订单金额# = @订单金额#; */
    set v_tmp_order_amt = v_order_amt;

    /* set @临时_撤单数量# = @撤单数量#; */
    set v_tmp_wtdraw_qty = v_wtdraw_qty;

    /* set @临时_成交数量# = @成交数量#; */
    set v_tmp_strike_qty = v_strike_qty;

    /* set @临时_成交金额# = @成交金额#; */
    set v_tmp_strike_amt = v_strike_amt;

    /* set @是否支持主推# = 《是否支持主推-否》; */
    set v_is_auto_push = "2";

    /* if @临时_成交数量# > 0 then */
    if v_tmp_strike_qty > 0 then

        /* set @临时_订单数量# = 0; */
        set v_tmp_order_qty = 0;

        /* set @临时_订单金额# = 0; */
        set v_tmp_order_amt = 0;

        /* set @临时_撤单数量# = 0 ; */
        set v_tmp_wtdraw_qty = 0 ;

    /* elseif @临时_撤单数量# > 0 then */
    elseif v_tmp_wtdraw_qty > 0 then

        /* set @临时_订单数量# = 0; */
        set v_tmp_order_qty = 0;

        /* set @临时_订单金额# = 0; */
        set v_tmp_order_amt = 0;

        /* set @临时_成交数量# = 0; */
        set v_tmp_strike_qty = 0;

        /* set @临时_成交金额# = 0; */
        set v_tmp_strike_amt = 0;
    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_策略_锁定获取策略信息】*/
        call db_tdsecu.pra_tdsest_LockGetStrategyOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_strategy_id,
            v_error_code,
            v_error_info,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_crncy_type,
            v_exch_no,
            v_comm_opor,
            v_stock_acco,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_strategy_batch_no,
            v_strategy_dir,
            v_strategy_price,
            v_strategy_qty,
            v_cash_strategy_qty,
            v_strategy_amt,
            v_strategy_exec_broker,
            v_strategy_exec_kind,
            v_strategy_exec_comm_str,
            v_price_type,
            v_strategy_valid_type,
            v_strategy_rule_way,
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_remark_info,
            v_strategy_date,
            v_strategy_time,
            v_strategy_status,
            v_margin_trade_type,
            v_strategy_deal_kind,
            v_target_strategy_type,
            v_target_strategy_param,
            v_order_qty,
            v_valid_order_qty,
            v_order_amt,
            v_wtdraw_qty,
            v_valid_wtdraw_qty,
            v_strike_qty,
            v_strike_amt,
            v_strategy_deal_status,
            v_external_no,
            v_order_batch_no,
            v_strategy_oper_way,
            v_busi_opor_no,
            v_update_times,
            v_strategy_price_type,
            v_comm_batch_no,
            v_comm_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.15.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_锁定获取策略信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @订单数量# = @临时_订单数量# + @订单数量#; */
        set v_order_qty = v_tmp_order_qty + v_order_qty;

        /* set @订单金额# = @临时_订单金额# + @订单金额#; */
        set v_order_amt = v_tmp_order_amt + v_order_amt;

        /* set @撤单数量# = @临时_撤单数量# + @撤单数量#; */
        set v_wtdraw_qty = v_tmp_wtdraw_qty + v_wtdraw_qty;

        /* set @成交数量# = @临时_成交数量# + @成交数量#; */
        set v_strike_qty = v_tmp_strike_qty + v_strike_qty;

        /* set @成交金额# = @临时_成交金额# + @成交金额#; */
        set v_strike_amt = v_tmp_strike_amt + v_strike_amt;

        /* set @总订单数量# = @订单数量#; */
        set v_total_order_qty = v_order_qty;

        /* set @总订单金额# = @订单金额#; */
        set v_total_order_amt = v_order_amt;

        /* set @总撤单数量# = @撤单数量#; */
        set v_all_wtdraw_qty = v_wtdraw_qty;

        /* set @总成交数量# = @成交数量#; */
        set v_total_strike_qty = v_strike_qty;

        /* set @总成交金额# = @成交金额#; */
        set v_total_strike_amt = v_strike_amt;
        #set @有效订单数量# = @有效订单数量# + @临时_订单数量#;
        #set @有效撤单数量# = @有效撤单数量# + @临时_撤单数量#;

        /* set @失败数量# = 0; */
        set v_faild_qty = 0;

        /* set @撤销数量# = 0; */
        set v_cancel_qty = 0;

        /* if (@有效订单数量# + @临时_订单数量#) = (@有效撤单数量# + @临时_撤单数量#) then */
        if (v_valid_order_qty + v_tmp_order_qty) = (v_valid_wtdraw_qty + v_tmp_wtdraw_qty) then

            /* set @策略订单数量# = -(@有效订单数量# - @有效撤单数量#); */
            set v_strategy_order_qty = -(v_valid_order_qty - v_valid_wtdraw_qty);

            /* set @有效订单数量# = -@有效订单数量#; */
            set v_valid_order_qty = -v_valid_order_qty;

            /* set @有效撤单数量# = -@有效撤单数量#; */
            set v_valid_wtdraw_qty = -v_valid_wtdraw_qty;
        else

            /* set @有效订单数量# = @临时_订单数量#; */
            set v_valid_order_qty = v_tmp_order_qty;

            /* set @有效撤单数量# = @临时_撤单数量#; */
            set v_valid_wtdraw_qty = v_tmp_wtdraw_qty;

            /* if @临时_订单数量# >0 or @临时_撤单数量#>0 then */
            if v_tmp_order_qty >0 or v_tmp_wtdraw_qty>0 then

                /* set @策略订单数量# =@临时_订单数量# - @临时_撤单数量#; */
                set v_strategy_order_qty =v_tmp_order_qty - v_tmp_wtdraw_qty;
            end if;
        end if;

        /* if @策略数量# = @成交数量# then */
        if v_strategy_qty = v_strike_qty then

            /* set @策略状态# = 《策略状态-已完成》; */
            set v_strategy_status = "7";
        end if;

        /* set @订单数量# = @临时_订单数量#; */
        set v_order_qty = v_tmp_order_qty;

        /* set @订单金额# = @临时_订单金额#; */
        set v_order_amt = v_tmp_order_amt;

        /* set @撤单数量# = @临时_撤单数量#; */
        set v_wtdraw_qty = v_tmp_wtdraw_qty;

        /* set @成交数量# = @临时_成交数量#; */
        set v_strike_qty = v_tmp_strike_qty;

        /* set @成交金额# = @临时_成交金额#; */
        set v_strike_amt = v_tmp_strike_amt;

        /* set @策略占用数量# = 0; */
        set v_strategy_capt_qty = 0;

        /* set @原策略序号# = 0; */
        set v_orig_strategy_id = 0;
        #set @备注信息# = concat("更新策略执行情况：",@备注信息#);

        /* 调用【原子_交易证券_策略_新增策略流水】*/
        call db_tdsecu.pra_tdsest_AddStrategyOrderJour(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_comm_opor,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_strategy_batch_no,
            v_strategy_id,
            v_orig_strategy_id,
            v_exch_no,
            v_stock_acco_no,
            v_stock_acco,
            v_stock_type,
            v_asset_type,
            v_stock_code,
            v_stock_code_no,
            v_strategy_dir,
            v_strategy_qty,
            v_cash_strategy_qty,
            v_strategy_price,
            v_price_type,
            v_exch_crncy_type,
            v_strategy_date,
            v_strategy_time,
            v_strategy_status,
            v_strategy_deal_status,
            v_strategy_deal_kind,
            v_order_id,
            v_order_qty,
            v_order_amt,
            v_wtdraw_qty,
            v_strike_id,
            v_strike_qty,
            v_strike_amt,
            v_order_batch_no,
            v_strategy_oper_way,
            v_remark_info,
            v_comm_batch_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.15.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_新增策略流水出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @临时_策略序号# = @策略序号#; */
        set v_tmp_strategy_id = v_strategy_id;

        /* set @更新次数# = @更新次数# + 1; */
        set v_update_times = v_update_times + 1;

        /* [获取表记录变量][交易证券_交易_订单表][{策略序号}][@策略序号#][{记录序号} = @订单序号#][4][@订单序号#] */
        select strategy_id into v_strategy_id from db_tdsecu.tb_tdsetd_order where row_id = v_order_id limit 1;
        if FOUND_ROWS() = 0 then
            ROLLBACK;        
            SET v_error_code = "tdsecuT.11.15.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单序号=",v_order_id);
            end if;
            leave label_pro;
        end if;


        /* if @策略序号# =0 then */
        if v_strategy_id =0 then

            /* [更新表记录][交易证券_交易_订单表][{策略序号} = @临时_策略序号#][{记录序号}=@订单序号#][2][@订单序号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strategy_id = v_tmp_strategy_id where row_id=v_order_id;
            if v_error_code = "1" then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.11.15.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单序号=",v_order_id);
                end if;
                leave label_pro;
            end if;


            /* set @是否支持主推# = 《是否支持主推-是》; */
            set v_is_auto_push = "1";
        else

            /* set @订单数量# =0; */
            set v_order_qty =0;

            /* set @订单金额# = 0; */
            set v_order_amt = 0;

            /* if @策略订单数量# >0 then */
            if v_strategy_order_qty >0 then

               /* set @策略订单数量# =0; */
               set v_strategy_order_qty =0;
             end if;
        end if;

        /* set  @策略序号# = @临时_策略序号# ; */
        set  v_strategy_id = v_tmp_strategy_id ;

        /* 调用【原子_交易证券_策略_更新策略执行情况】*/
        call db_tdsecu.pra_tdsest_UpdateStrategyOrderExecution(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_strategy_id,
            v_order_qty,
            v_order_amt,
            v_wtdraw_qty,
            v_strike_qty,
            v_strike_amt,
            v_strategy_status,
            v_strategy_batch_no,
            v_valid_order_qty,
            v_valid_wtdraw_qty,
            v_faild_qty,
            v_cancel_qty,
            v_strategy_dir,
            v_comm_id,
            v_strategy_order_qty,
            v_strategy_capt_qty,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.15.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_更新策略执行情况出现错误！',v_mysql_message);
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
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_comm_opor = v_comm_opor;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_strategy_exec_broker = v_strategy_exec_broker;
    SET p_strategy_exec_kind = v_strategy_exec_kind;
    SET p_strategy_exec_comm_str = v_strategy_exec_comm_str;
    SET p_exch_no = v_exch_no;
    SET p_stock_type = v_stock_type;
    SET p_stock_code = v_stock_code;
    SET p_stock_code_no = v_stock_code_no;
    SET p_strategy_dir = v_strategy_dir;
    SET p_strategy_qty = v_strategy_qty;
    SET p_cash_strategy_qty = v_cash_strategy_qty;
    SET p_strategy_price = v_strategy_price;
    SET p_strategy_amt = v_strategy_amt;
    SET p_price_type = v_price_type;
    SET p_strategy_valid_type = v_strategy_valid_type;
    SET p_strategy_rule_way = v_strategy_rule_way;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_remark_info = v_remark_info;
    SET p_strategy_date = v_strategy_date;
    SET p_strategy_time = v_strategy_time;
    SET p_margin_trade_type = v_margin_trade_type;
    SET p_target_strategy_type = v_target_strategy_type;
    SET p_target_strategy_param = v_target_strategy_param;
    SET p_external_no = v_external_no;
    SET p_order_batch_no = v_order_batch_no;
    SET p_strategy_status = v_strategy_status;
    SET p_total_order_qty = v_total_order_qty;
    SET p_total_order_amt = v_total_order_amt;
    SET p_all_wtdraw_qty = v_all_wtdraw_qty;
    SET p_total_strike_qty = v_total_strike_qty;
    SET p_total_strike_amt = v_total_strike_amt;
    SET p_strategy_oper_way = v_strategy_oper_way;
    SET p_strategy_batch_no = v_strategy_batch_no;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_update_times = v_update_times;
    SET p_is_auto_push = v_is_auto_push;
    SET p_comm_id = v_comm_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_策略_更新策略状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsest_UpdateStrategyOrderStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsest_UpdateStrategyOrderStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_orig_strategy_id bigint,
    IN p_strategy_id bigint,
    IN p_strategy_deal_status varchar(2),
    IN p_strategy_status varchar(2),
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_opor int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_strategy_batch_no int,
    OUT p_strategy_exec_broker varchar(16),
    OUT p_strategy_exec_kind int,
    OUT p_strategy_exec_comm_str varchar(2048),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_stock_code varchar(6),
    OUT p_stock_code_no int,
    OUT p_strategy_dir int,
    OUT p_strategy_qty decimal(18,2),
    OUT p_cash_strategy_qty decimal(18,2),
    OUT p_strategy_price decimal(16,9),
    OUT p_price_type int,
    OUT p_strategy_amt decimal(18,4),
    OUT p_strategy_valid_type int,
    OUT p_strategy_rule_way varchar(4),
    OUT p_exch_crncy_type varchar(3),
    OUT p_strategy_date int,
    OUT p_strategy_time int,
    OUT p_margin_trade_type int,
    OUT p_strategy_deal_kind int,
    OUT p_order_qty decimal(18,2),
    OUT p_order_amt decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_external_no bigint,
    OUT p_order_batch_no int,
    OUT p_strategy_oper_way varchar(2),
    OUT p_busi_opor_no int,
    OUT p_new_strategy_id bigint,
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
    declare v_orig_strategy_id bigint;
    declare v_strategy_id bigint;
    declare v_strategy_deal_status varchar(2);
    declare v_strategy_status varchar(2);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_opor int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_strategy_batch_no int;
    declare v_strategy_exec_broker varchar(16);
    declare v_strategy_exec_kind int;
    declare v_strategy_exec_comm_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_strategy_dir int;
    declare v_strategy_qty decimal(18,2);
    declare v_cash_strategy_qty decimal(18,2);
    declare v_strategy_price decimal(16,9);
    declare v_price_type int;
    declare v_strategy_amt decimal(18,4);
    declare v_strategy_valid_type int;
    declare v_strategy_rule_way varchar(4);
    declare v_exch_crncy_type varchar(3);
    declare v_strategy_date int;
    declare v_strategy_time int;
    declare v_margin_trade_type int;
    declare v_strategy_deal_kind int;
    declare v_order_qty decimal(18,2);
    declare v_order_amt decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_strategy_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_new_strategy_id bigint;
    declare v_update_times int;
    declare v_tmp_orig_strategy_id bigint;
    declare v_tmp_strategy_id bigint;
    declare v_tmp_strategy_deal_status varchar(2);
    declare v_tmp_strategy_status varchar(2);
    declare v_tmp_remark_info varchar(255);
    declare v_init_date int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_target_strategy_type varchar(16);
    declare v_target_strategy_param varchar(2048);
    declare v_valid_order_qty decimal(18,2);
    declare v_valid_wtdraw_qty decimal(18,2);
    declare v_strategy_price_type int;
    declare v_comm_batch_no int;
    declare v_comm_id bigint;
    declare v_faild_qty decimal(18,2);
    declare v_cancel_qty decimal(18,2);
    declare v_strategy_capt_qty decimal(18,2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_order_id bigint;
    declare v_strike_id bigint;

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
    SET v_orig_strategy_id = p_orig_strategy_id;
    SET v_strategy_id = p_strategy_id;
    SET v_strategy_deal_status = p_strategy_deal_status;
    SET v_strategy_status = p_strategy_status;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_opor = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_strategy_batch_no = 0;
    SET v_strategy_exec_broker = " ";
    SET v_strategy_exec_kind = 0;
    SET v_strategy_exec_comm_str = " ";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_strategy_dir = 0;
    SET v_strategy_qty = 0;
    SET v_cash_strategy_qty = 0;
    SET v_strategy_price = 0;
    SET v_price_type = 0;
    SET v_strategy_amt = 0;
    SET v_strategy_valid_type = 0;
    SET v_strategy_rule_way = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_strategy_date = date_format(curdate(),'%Y%m%d');
    SET v_strategy_time = date_format(curtime(),'%H%i%s');
    SET v_margin_trade_type = 0;
    SET v_strategy_deal_kind = 0;
    SET v_order_qty = 0;
    SET v_order_amt = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_external_no = 0;
    SET v_order_batch_no = 0;
    SET v_strategy_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_new_strategy_id = 0;
    SET v_update_times = 1;
    SET v_tmp_orig_strategy_id = 0;
    SET v_tmp_strategy_id = 0;
    SET v_tmp_strategy_deal_status = " ";
    SET v_tmp_strategy_status = " ";
    SET v_tmp_remark_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_target_strategy_type = " ";
    SET v_target_strategy_param = " ";
    SET v_valid_order_qty = 0;
    SET v_valid_wtdraw_qty = 0;
    SET v_strategy_price_type = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_id = 0;
    SET v_faild_qty = 0;
    SET v_cancel_qty = 0;
    SET v_strategy_capt_qty = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_order_id = 0;
    SET v_strike_id = 0;

    
    label_pro:BEGIN
    

    /* set @临时_原策略序号# = @原策略序号#; */
    set v_tmp_orig_strategy_id = v_orig_strategy_id;

    /* set @临时_策略序号# = @策略序号#; */
    set v_tmp_strategy_id = v_strategy_id;

    /* set @临时_策略处理状态# = @策略处理状态#; */
    set v_tmp_strategy_deal_status = v_strategy_deal_status;

    /* set @临时_策略状态# = @策略状态#; */
    set v_tmp_strategy_status = v_strategy_status;

    /* set @临时_备注信息# = @备注信息#; */
    set v_tmp_remark_info = v_remark_info;

    /* [事务开始] */
    START TRANSACTION;


        /* set @策略序号# = @原策略序号#; */
        set v_strategy_id = v_orig_strategy_id;

        /* 调用【原子_交易证券_策略_锁定获取策略信息】*/
        call db_tdsecu.pra_tdsest_LockGetStrategyOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_strategy_id,
            v_error_code,
            v_error_info,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_crncy_type,
            v_exch_no,
            v_comm_opor,
            v_stock_acco,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_strategy_batch_no,
            v_strategy_dir,
            v_strategy_price,
            v_strategy_qty,
            v_cash_strategy_qty,
            v_strategy_amt,
            v_strategy_exec_broker,
            v_strategy_exec_kind,
            v_strategy_exec_comm_str,
            v_price_type,
            v_strategy_valid_type,
            v_strategy_rule_way,
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_remark_info,
            v_strategy_date,
            v_strategy_time,
            v_strategy_status,
            v_margin_trade_type,
            v_strategy_deal_kind,
            v_target_strategy_type,
            v_target_strategy_param,
            v_order_qty,
            v_valid_order_qty,
            v_order_amt,
            v_wtdraw_qty,
            v_valid_wtdraw_qty,
            v_strike_qty,
            v_strike_amt,
            v_strategy_deal_status,
            v_external_no,
            v_order_batch_no,
            v_strategy_oper_way,
            v_busi_opor_no,
            v_update_times,
            v_strategy_price_type,
            v_comm_batch_no,
            v_comm_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_锁定获取策略信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @临时_策略状态# = 《策略状态-已拒绝》 or @临时_策略状态# = 《策略状态-发送失败》 then */
        if v_tmp_strategy_status = "8" or v_tmp_strategy_status = "c" then

            /* set @失败数量# = @策略数量#; */
            set v_faild_qty = v_strategy_qty;

        /* elseif @临时_策略状态# = 《策略状态-已过期》 then */
        elseif v_tmp_strategy_status = "9" then

            /* set @失败数量# = @策略数量#-@成交数量#; */
            set v_faild_qty = v_strategy_qty-v_strike_qty;

        /* elseif @临时_策略状态# = 《策略状态-已撤销》 then */
        elseif v_tmp_strategy_status = "b" then

            /* set @撤销数量# = @策略数量#-@成交数量#; */
            set v_cancel_qty = v_strategy_qty-v_strike_qty;
        end if;

        /* if @策略状态# = 《策略状态-已撤销》 and @临时_策略状态# <> 《策略状态-已撤销》 then */
        if v_strategy_status = "b" and v_tmp_strategy_status <> "b" then

            /* set @临时_策略状态# = @策略状态#; */
            set v_tmp_strategy_status = v_strategy_status;
        end if;

        /* set @策略处理状态# = @临时_策略处理状态#; */
        set v_strategy_deal_status = v_tmp_strategy_deal_status;

        /* set @策略状态# = @临时_策略状态#; */
        set v_strategy_status = v_tmp_strategy_status;

        /* set @备注信息# = @临时_备注信息#; */
        set v_remark_info = v_tmp_remark_info;

        /* 调用【原子_交易证券_策略_更新策略状态】*/
        call db_tdsecu.pra_tdsest_UpdateStrategyOrderStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_strategy_id,
            v_strategy_deal_status,
            v_strategy_status,
            v_remark_info,
            v_strategy_batch_no,
            v_faild_qty,
            v_cancel_qty,
            v_strategy_dir,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_更新策略状态出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @更新次数# = @更新次数# +1; */
        set v_update_times = v_update_times +1;

        /* if @指令序号# >0 then */
        if v_comm_id >0 then

            /* set @策略占用数量# = -@失败数量#-@撤销数量#; */
            set v_strategy_capt_qty = -v_faild_qty-v_cancel_qty;

            /* [更新表记录][交易证券_指令_指令表][{策略占用数量} = {策略占用数量}+@策略占用数量#][{记录序号}=@指令序号#][2][@指令序号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdseap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strategy_capt_qty = strategy_capt_qty+v_strategy_capt_qty where row_id=v_comm_id;
            if v_error_code = "1" then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.11.16.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("指令序号=",v_comm_id);
                end if;
                leave label_pro;
            end if;

        end if;

        /* set @撤销数量# = 0; */
        set v_cancel_qty = 0;

        /* set @失败数量# = 0; */
        set v_faild_qty = 0;

        /* set @策略序号# = @临时_策略序号#; */
        set v_strategy_id = v_tmp_strategy_id;

        /* set @临时_策略状态# = @策略状态#; */
        set v_tmp_strategy_status = v_strategy_status;

        /* if @策略序号# > 0 and @临时_策略序号# <> @临时_原策略序号# then */
        if v_strategy_id > 0 and v_tmp_strategy_id <> v_tmp_orig_strategy_id then

            /* 调用【原子_交易证券_策略_更新策略状态】*/
            call db_tdsecu.pra_tdsest_UpdateStrategyOrderStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_co_no,
                v_strategy_id,
                v_strategy_deal_status,
                v_strategy_status,
                v_remark_info,
                v_strategy_batch_no,
                v_faild_qty,
                v_cancel_qty,
                v_strategy_dir,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.11.16.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_更新策略状态出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

        /* set @备注信息# = concat("更新策略状态：",@备注信息#); */
        set v_remark_info = concat("更新策略状态：",v_remark_info);

        /* set @订单序号# = 0; */
        set v_order_id = 0;

        /* set @成交序号# = 0; */
        set v_strike_id = 0;

        /* 调用【原子_交易证券_策略_新增策略流水】*/
        call db_tdsecu.pra_tdsest_AddStrategyOrderJour(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_comm_opor,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_strategy_batch_no,
            v_strategy_id,
            v_orig_strategy_id,
            v_exch_no,
            v_stock_acco_no,
            v_stock_acco,
            v_stock_type,
            v_asset_type,
            v_stock_code,
            v_stock_code_no,
            v_strategy_dir,
            v_strategy_qty,
            v_cash_strategy_qty,
            v_strategy_price,
            v_price_type,
            v_exch_crncy_type,
            v_strategy_date,
            v_strategy_time,
            v_strategy_status,
            v_strategy_deal_status,
            v_strategy_deal_kind,
            v_order_id,
            v_order_qty,
            v_order_amt,
            v_wtdraw_qty,
            v_strike_id,
            v_strike_qty,
            v_strike_amt,
            v_order_batch_no,
            v_strategy_oper_way,
            v_remark_info,
            v_comm_batch_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_新增策略流水出现错误！',v_mysql_message);
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
    SET p_comm_opor = v_comm_opor;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_strategy_batch_no = v_strategy_batch_no;
    SET p_strategy_exec_broker = v_strategy_exec_broker;
    SET p_strategy_exec_kind = v_strategy_exec_kind;
    SET p_strategy_exec_comm_str = v_strategy_exec_comm_str;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_stock_code = v_stock_code;
    SET p_stock_code_no = v_stock_code_no;
    SET p_strategy_dir = v_strategy_dir;
    SET p_strategy_qty = v_strategy_qty;
    SET p_cash_strategy_qty = v_cash_strategy_qty;
    SET p_strategy_price = v_strategy_price;
    SET p_price_type = v_price_type;
    SET p_strategy_amt = v_strategy_amt;
    SET p_strategy_valid_type = v_strategy_valid_type;
    SET p_strategy_rule_way = v_strategy_rule_way;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_strategy_date = v_strategy_date;
    SET p_strategy_time = v_strategy_time;
    SET p_margin_trade_type = v_margin_trade_type;
    SET p_strategy_deal_kind = v_strategy_deal_kind;
    SET p_order_qty = v_order_qty;
    SET p_order_amt = v_order_amt;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_external_no = v_external_no;
    SET p_order_batch_no = v_order_batch_no;
    SET p_strategy_oper_way = v_strategy_oper_way;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_new_strategy_id = v_new_strategy_id;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_策略_查询策略
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsest_QueryStrategyOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsest_QueryStrategyOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_opor int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_strategy_id bigint,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_strategy_dir int,
    IN p_busi_opor_no int,
    IN p_margin_trade_type int,
    IN p_target_strategy_type varchar(16),
    IN p_strategy_status varchar(2),
    IN p_strategy_deal_status varchar(2),
    IN p_strategy_deal_kind int,
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_strategy_oper_way varchar(2),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_comm_opor int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_strategy_id bigint;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_strategy_dir int;
    declare v_busi_opor_no int;
    declare v_margin_trade_type int;
    declare v_target_strategy_type varchar(16);
    declare v_strategy_status varchar(2);
    declare v_strategy_deal_status varchar(2);
    declare v_strategy_deal_kind int;
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_strategy_oper_way varchar(2);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
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
    SET v_comm_opor = p_comm_opor;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_strategy_id = p_strategy_id;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_strategy_dir = p_strategy_dir;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_margin_trade_type = p_margin_trade_type;
    SET v_target_strategy_type = p_target_strategy_type;
    SET v_strategy_status = p_strategy_status;
    SET v_strategy_deal_status = p_strategy_deal_status;
    SET v_strategy_deal_kind = p_strategy_deal_kind;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_strategy_oper_way = p_strategy_oper_way;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* 调用【原子_交易证券_策略_查询策略】*/
    call db_tdsecu.pra_tdsest_QueryStrategyOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_opor,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_strategy_id,
        v_exch_no,
        v_stock_code,
        v_strategy_dir,
        v_busi_opor_no,
        v_margin_trade_type,
        v_target_strategy_type,
        v_strategy_status,
        v_strategy_deal_status,
        v_strategy_deal_kind,
        v_external_no,
        v_order_batch_no,
        v_strategy_oper_way,
        v_comm_id,
        v_comm_batch_no,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.11.101.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_查询策略出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_策略_插件查询策略
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsest_PluginQueryStrategyOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsest_PluginQueryStrategyOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_opor int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_strategy_id bigint,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_strategy_dir int,
    IN p_busi_opor_no int,
    IN p_margin_trade_type int,
    IN p_target_strategy_type varchar(16),
    IN p_strategy_status varchar(2),
    IN p_strategy_deal_status varchar(2),
    IN p_strategy_deal_kind int,
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_strategy_oper_way varchar(2),
    IN p_comm_batch_no int,
    IN p_comm_id bigint,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
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
    declare v_comm_opor int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_strategy_id bigint;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_strategy_dir int;
    declare v_busi_opor_no int;
    declare v_margin_trade_type int;
    declare v_target_strategy_type varchar(16);
    declare v_strategy_status varchar(2);
    declare v_strategy_deal_status varchar(2);
    declare v_strategy_deal_kind int;
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_strategy_oper_way varchar(2);
    declare v_comm_batch_no int;
    declare v_comm_id bigint;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
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
    SET v_comm_opor = p_comm_opor;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_strategy_id = p_strategy_id;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_strategy_dir = p_strategy_dir;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_margin_trade_type = p_margin_trade_type;
    SET v_target_strategy_type = p_target_strategy_type;
    SET v_strategy_status = p_strategy_status;
    SET v_strategy_deal_status = p_strategy_deal_status;
    SET v_strategy_deal_kind = p_strategy_deal_kind;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_strategy_oper_way = p_strategy_oper_way;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_id = p_comm_id;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* 调用【原子_交易证券_策略_插件查询策略】*/
    call db_tdsecu.pra_tdsest_PluginQueryStrategyOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_opor,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_strategy_id,
        v_exch_no,
        v_stock_code,
        v_strategy_dir,
        v_busi_opor_no,
        v_margin_trade_type,
        v_target_strategy_type,
        v_strategy_status,
        v_strategy_deal_status,
        v_strategy_deal_kind,
        v_external_no,
        v_order_batch_no,
        v_strategy_oper_way,
        v_comm_id,
        v_comm_batch_no,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.11.102.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_插件查询策略出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_策略_查询策略汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsest_QueryStrategyOrderSum;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsest_QueryStrategyOrderSum(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_opor int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_strategy_sum_id bigint,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_strategy_dir int,
    IN p_busi_opor_no int,
    IN p_margin_trade_type int,
    IN p_target_strategy_type varchar(16),
    IN p_strategy_status varchar(2),
    IN p_strategy_deal_status varchar(2),
    IN p_strategy_deal_kind int,
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_comm_batch_no int,
    IN p_strategy_oper_way varchar(2),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_comm_opor int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_strategy_sum_id bigint;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_strategy_dir int;
    declare v_busi_opor_no int;
    declare v_margin_trade_type int;
    declare v_target_strategy_type varchar(16);
    declare v_strategy_status varchar(2);
    declare v_strategy_deal_status varchar(2);
    declare v_strategy_deal_kind int;
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_comm_batch_no int;
    declare v_strategy_oper_way varchar(2);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
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
    SET v_comm_opor = p_comm_opor;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_strategy_sum_id = p_strategy_sum_id;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_strategy_dir = p_strategy_dir;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_margin_trade_type = p_margin_trade_type;
    SET v_target_strategy_type = p_target_strategy_type;
    SET v_strategy_status = p_strategy_status;
    SET v_strategy_deal_status = p_strategy_deal_status;
    SET v_strategy_deal_kind = p_strategy_deal_kind;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_strategy_oper_way = p_strategy_oper_way;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* 调用【原子_交易证券_策略_查询策略汇总】*/
    call db_tdsecu.pra_tdsest_QueryStrategyOrderSum(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_opor,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_strategy_sum_id,
        v_exch_no,
        v_stock_code,
        v_strategy_dir,
        v_busi_opor_no,
        v_margin_trade_type,
        v_target_strategy_type,
        v_strategy_status,
        v_strategy_deal_status,
        v_strategy_deal_kind,
        v_external_no,
        v_order_batch_no,
        v_comm_batch_no,
        v_strategy_oper_way,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.11.103.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_查询策略汇总出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_策略_查询单条策略汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsest_QuerySingleStrategyOrderSum;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsest_QuerySingleStrategyOrderSum(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strategy_batch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_busi_opor_no int,
    OUT p_comm_opor int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_strategy_exec_broker varchar(16),
    OUT p_strategy_exec_kind int,
    OUT p_strategy_exec_comm_str varchar(2048),
    OUT p_exch_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_stock_code varchar(6),
    OUT p_stock_code_no int,
    OUT p_strategy_dir int,
    OUT p_strategy_qty decimal(18,2),
    OUT p_cash_strategy_qty decimal(18,2),
    OUT p_strategy_price decimal(16,9),
    OUT p_price_type int,
    OUT p_strategy_amt decimal(18,4),
    OUT p_strategy_valid_type int,
    OUT p_strategy_rule_way varchar(4),
    OUT p_exch_crncy_type varchar(3),
    OUT p_remark_info varchar(255),
    OUT p_strategy_date int,
    OUT p_margin_trade_type int,
    OUT p_target_strategy_type varchar(16),
    OUT p_target_strategy_param varchar(2048),
    OUT p_strategy_contr_comm varchar(2048),
    OUT p_strategy_sum_status varchar(2),
    OUT p_strategy_deal_status varchar(2),
    OUT p_strategy_deal_kind int,
    OUT p_order_qty decimal(18,2),
    OUT p_valid_order_qty decimal(18,2),
    OUT p_order_amt decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_valid_wtdraw_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_cancel_qty decimal(18,2),
    OUT p_faild_qty decimal(18,2),
    OUT p_external_no bigint,
    OUT p_order_batch_no int,
    OUT p_comm_batch_no int,
    OUT p_strategy_oper_way varchar(2),
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
    declare v_strategy_batch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_busi_opor_no int;
    declare v_comm_opor int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_strategy_exec_broker varchar(16);
    declare v_strategy_exec_kind int;
    declare v_strategy_exec_comm_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_strategy_dir int;
    declare v_strategy_qty decimal(18,2);
    declare v_cash_strategy_qty decimal(18,2);
    declare v_strategy_price decimal(16,9);
    declare v_price_type int;
    declare v_strategy_amt decimal(18,4);
    declare v_strategy_valid_type int;
    declare v_strategy_rule_way varchar(4);
    declare v_exch_crncy_type varchar(3);
    declare v_remark_info varchar(255);
    declare v_strategy_date int;
    declare v_margin_trade_type int;
    declare v_target_strategy_type varchar(16);
    declare v_target_strategy_param varchar(2048);
    declare v_strategy_contr_comm varchar(2048);
    declare v_strategy_sum_status varchar(2);
    declare v_strategy_deal_status varchar(2);
    declare v_strategy_deal_kind int;
    declare v_order_qty decimal(18,2);
    declare v_valid_order_qty decimal(18,2);
    declare v_order_amt decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_valid_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_cancel_qty decimal(18,2);
    declare v_faild_qty decimal(18,2);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_comm_batch_no int;
    declare v_strategy_oper_way varchar(2);
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
    SET v_strategy_batch_no = p_strategy_batch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_busi_opor_no = 0;
    SET v_comm_opor = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_strategy_exec_broker = " ";
    SET v_strategy_exec_kind = 0;
    SET v_strategy_exec_comm_str = " ";
    SET v_exch_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_strategy_dir = 0;
    SET v_strategy_qty = 0;
    SET v_cash_strategy_qty = 0;
    SET v_strategy_price = 0;
    SET v_price_type = 0;
    SET v_strategy_amt = 0;
    SET v_strategy_valid_type = 0;
    SET v_strategy_rule_way = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_remark_info = " ";
    SET v_strategy_date = date_format(curdate(),'%Y%m%d');
    SET v_margin_trade_type = 0;
    SET v_target_strategy_type = " ";
    SET v_target_strategy_param = " ";
    SET v_strategy_contr_comm = " ";
    SET v_strategy_sum_status = " ";
    SET v_strategy_deal_status = " ";
    SET v_strategy_deal_kind = 0;
    SET v_order_qty = 0;
    SET v_valid_order_qty = 0;
    SET v_order_amt = 0;
    SET v_wtdraw_qty = 0;
    SET v_valid_wtdraw_qty = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_cancel_qty = 0;
    SET v_faild_qty = 0;
    SET v_external_no = 0;
    SET v_order_batch_no = 0;
    SET v_comm_batch_no = 0;
    SET v_strategy_oper_way = " ";
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_策略_查询单条策略汇总】*/
    call db_tdsecu.pra_tdsest_QuerySingleStrategyOrderSum(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_strategy_batch_no,
        v_error_code,
        v_error_info,
        v_row_id,
        v_busi_opor_no,
        v_comm_opor,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_pass_no,
        v_strategy_exec_broker,
        v_strategy_exec_kind,
        v_strategy_exec_comm_str,
        v_exch_no,
        v_stock_type,
        v_asset_type,
        v_stock_code,
        v_stock_code_no,
        v_strategy_dir,
        v_strategy_qty,
        v_cash_strategy_qty,
        v_strategy_price,
        v_price_type,
        v_strategy_amt,
        v_strategy_valid_type,
        v_strategy_rule_way,
        v_exch_crncy_type,
        v_remark_info,
        v_strategy_date,
        v_margin_trade_type,
        v_target_strategy_type,
        v_target_strategy_param,
        v_strategy_contr_comm,
        v_strategy_sum_status,
        v_strategy_deal_status,
        v_strategy_deal_kind,
        v_order_qty,
        v_valid_order_qty,
        v_order_amt,
        v_wtdraw_qty,
        v_valid_wtdraw_qty,
        v_strike_qty,
        v_strike_amt,
        v_cancel_qty,
        v_faild_qty,
        v_external_no,
        v_order_batch_no,
        v_comm_batch_no,
        v_strategy_oper_way,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.11.104.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_查询单条策略汇总出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_comm_opor = v_comm_opor;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_strategy_exec_broker = v_strategy_exec_broker;
    SET p_strategy_exec_kind = v_strategy_exec_kind;
    SET p_strategy_exec_comm_str = v_strategy_exec_comm_str;
    SET p_exch_no = v_exch_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_stock_code = v_stock_code;
    SET p_stock_code_no = v_stock_code_no;
    SET p_strategy_dir = v_strategy_dir;
    SET p_strategy_qty = v_strategy_qty;
    SET p_cash_strategy_qty = v_cash_strategy_qty;
    SET p_strategy_price = v_strategy_price;
    SET p_price_type = v_price_type;
    SET p_strategy_amt = v_strategy_amt;
    SET p_strategy_valid_type = v_strategy_valid_type;
    SET p_strategy_rule_way = v_strategy_rule_way;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_remark_info = v_remark_info;
    SET p_strategy_date = v_strategy_date;
    SET p_margin_trade_type = v_margin_trade_type;
    SET p_target_strategy_type = v_target_strategy_type;
    SET p_target_strategy_param = v_target_strategy_param;
    SET p_strategy_contr_comm = v_strategy_contr_comm;
    SET p_strategy_sum_status = v_strategy_sum_status;
    SET p_strategy_deal_status = v_strategy_deal_status;
    SET p_strategy_deal_kind = v_strategy_deal_kind;
    SET p_order_qty = v_order_qty;
    SET p_valid_order_qty = v_valid_order_qty;
    SET p_order_amt = v_order_amt;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_valid_wtdraw_qty = v_valid_wtdraw_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_cancel_qty = v_cancel_qty;
    SET p_faild_qty = v_faild_qty;
    SET p_external_no = v_external_no;
    SET p_order_batch_no = v_order_batch_no;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_strategy_oper_way = v_strategy_oper_way;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_策略_重置指令策略数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsest_ResetCommStrategyQty;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsest_ResetCommStrategyQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_comm_id bigint,
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
    declare v_comm_id bigint;
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
    SET v_comm_id = p_comm_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_策略_重置指令策略数量】*/
        call db_tdsecu.pra_tdsest_ResetCommStrategyQty(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_comm_id,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.11.105.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_重置指令策略数量出现错误！',v_mysql_message);
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


