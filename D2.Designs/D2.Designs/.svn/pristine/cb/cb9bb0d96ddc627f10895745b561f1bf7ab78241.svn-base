DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取指令信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetCommInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetCommInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_crncy_type varchar(3),
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_comm_date int,
    OUT p_comm_time int,
    OUT p_comm_batch_no int,
    OUT p_comm_opor int,
    OUT p_comm_executor int,
    OUT p_comm_dir int,
    OUT p_comm_limit_price decimal(16,9),
    OUT p_limit_actual_price decimal(16,9),
    OUT p_comm_qty decimal(18,2),
    OUT p_comm_amt decimal(18,4),
    OUT p_order_qty decimal(18,2),
    OUT p_comm_cancel_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_comm_frozen_amt decimal(18,4),
    OUT p_comm_frozen_qty decimal(18,2),
    OUT p_strike_status varchar(2),
    OUT p_comm_status varchar(2),
    OUT p_comm_begin_date int,
    OUT p_comm_end_date int,
    OUT p_comm_begin_time int,
    OUT p_comm_end_time int,
    OUT p_comm_comple_date int,
    OUT p_comm_comple_time int,
    OUT p_comm_appr_date int,
    OUT p_comm_appr_time int,
    OUT p_comm_appr_status varchar(2),
    OUT p_comm_appr_oper int,
    OUT p_comm_appr_remark varchar(255),
    OUT p_basket_id bigint,
    OUT p_net_price_flag int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_comm_oper_way varchar(2),
    OUT p_exter_comm_flag int,
    OUT p_comm_comple_flag int,
    OUT p_strategy_capt_qty decimal(18,2),
    OUT p_strategy_order_qty decimal(18,2),
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
    declare v_comm_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_comm_date int;
    declare v_comm_time int;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_strike_status varchar(2);
    declare v_comm_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_appr_status varchar(2);
    declare v_comm_appr_oper int;
    declare v_comm_appr_remark varchar(255);
    declare v_basket_id bigint;
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_comm_comple_flag int;
    declare v_strategy_capt_qty decimal(18,2);
    declare v_strategy_order_qty decimal(18,2);
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
    SET v_comm_id = p_comm_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_comm_executor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_strike_status = "0";
    SET v_comm_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_status = " ";
    SET v_comm_appr_oper = 0;
    SET v_comm_appr_remark = " ";
    SET v_basket_id = 0;
    SET v_net_price_flag = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_comm_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_comm_comple_flag = 0;
    SET v_strategy_capt_qty = 0;
    SET v_strategy_order_qty = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取指令信息】*/
    call db_tdsecu.pra_tdsephif_GetCommInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_id,
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
        v_stock_acco_no,
        v_stock_code_no,
        v_stock_type,
        v_comm_date,
        v_comm_time,
        v_comm_batch_no,
        v_comm_opor,
        v_comm_executor,
        v_comm_dir,
        v_comm_limit_price,
        v_limit_actual_price,
        v_comm_qty,
        v_comm_amt,
        v_order_qty,
        v_comm_cancel_qty,
        v_strike_amt,
        v_strike_qty,
        v_comm_frozen_amt,
        v_comm_frozen_qty,
        v_strike_status,
        v_comm_status,
        v_comm_begin_date,
        v_comm_end_date,
        v_comm_begin_time,
        v_comm_end_time,
        v_comm_comple_date,
        v_comm_comple_time,
        v_comm_appr_date,
        v_comm_appr_time,
        v_comm_appr_status,
        v_comm_appr_oper,
        v_comm_appr_remark,
        v_basket_id,
        v_net_price_flag,
        v_bond_accr_intrst,
        v_bond_rate_type,
        v_comm_oper_way,
        v_exter_comm_flag,
        v_comm_comple_flag,
        v_strategy_capt_qty,
        v_strategy_order_qty,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取指令信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_comm_date = v_comm_date;
    SET p_comm_time = v_comm_time;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_opor = v_comm_opor;
    SET p_comm_executor = v_comm_executor;
    SET p_comm_dir = v_comm_dir;
    SET p_comm_limit_price = v_comm_limit_price;
    SET p_limit_actual_price = v_limit_actual_price;
    SET p_comm_qty = v_comm_qty;
    SET p_comm_amt = v_comm_amt;
    SET p_order_qty = v_order_qty;
    SET p_comm_cancel_qty = v_comm_cancel_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_comm_frozen_amt = v_comm_frozen_amt;
    SET p_comm_frozen_qty = v_comm_frozen_qty;
    SET p_strike_status = v_strike_status;
    SET p_comm_status = v_comm_status;
    SET p_comm_begin_date = v_comm_begin_date;
    SET p_comm_end_date = v_comm_end_date;
    SET p_comm_begin_time = v_comm_begin_time;
    SET p_comm_end_time = v_comm_end_time;
    SET p_comm_comple_date = v_comm_comple_date;
    SET p_comm_comple_time = v_comm_comple_time;
    SET p_comm_appr_date = v_comm_appr_date;
    SET p_comm_appr_time = v_comm_appr_time;
    SET p_comm_appr_status = v_comm_appr_status;
    SET p_comm_appr_oper = v_comm_appr_oper;
    SET p_comm_appr_remark = v_comm_appr_remark;
    SET p_basket_id = v_basket_id;
    SET p_net_price_flag = v_net_price_flag;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_comm_oper_way = v_comm_oper_way;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_comm_comple_flag = v_comm_comple_flag;
    SET p_strategy_capt_qty = v_strategy_capt_qty;
    SET p_strategy_order_qty = v_strategy_order_qty;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取汇总指令信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetSumCommInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetSumCommInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_date int,
    IN p_co_no int,
    IN p_comm_batch_no int,
    IN p_comm_executor int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_sum_comm_row_id bigint,
    OUT p_sum_comm_co_no int,
    OUT p_sum_comm_pd_no int,
    OUT p_sum_comm_exch_group_no int,
    OUT p_sum_comm_asset_acco_no int,
    OUT p_sum_comm_pass_no int,
    OUT p_sum_comm_out_acco varchar(32),
    OUT p_sum_comm_exch_crncy_type varchar(3),
    OUT p_sum_comm_stock_code_no int,
    OUT p_sum_comm_date int,
    OUT p_sum_comm_time int,
    OUT p_sum_comm_batch_no int,
    OUT p_sum_comm_opor int,
    OUT p_sum_comm_executor int,
    OUT p_sum_comm_dir int,
    OUT p_sum_comm_limit_price decimal(16,9),
    OUT p_sum_comm_qty decimal(18,2),
    OUT p_sum_comm_amt decimal(18,4),
    OUT p_sum_comm_order_qty decimal(18,2),
    OUT p_sum_comm_cancel_qty decimal(18,2),
    OUT p_sum_comm_await_cancel_qty decimal(18,2),
    OUT p_sum_comm_strike_amt decimal(18,4),
    OUT p_sum_comm_strike_qty decimal(18,2),
    OUT p_sum_comm_strike_status varchar(2),
    OUT p_comm_sum_status varchar(2),
    OUT p_sum_comm_begin_date int,
    OUT p_sum_comm_end_date int,
    OUT p_sum_comm_begin_time int,
    OUT p_sum_comm_end_time int,
    OUT p_sum_comm_comple_date int,
    OUT p_sum_comm_comple_time int,
    OUT p_sum_comm_max_comm_comple_date int,
    OUT p_sum_comm_max_comm_comple_time int,
    OUT p_sum_comm_appr_date int,
    OUT p_sum_comm_appr_time int,
    OUT p_sum_comm_appr_qty decimal(18,2),
    OUT p_comm_sum_approve_status varchar(2),
    OUT p_sum_comm_basket_id bigint,
    OUT p_sum_comm_net_price_flag int,
    OUT p_sum_comm_bond_accr_intrst decimal(18,12),
    OUT p_sum_comm_bond_rate_type int,
    OUT p_sum_comm_oper_way varchar(2),
    OUT p_sum_comm_exter_comm_flag int,
    OUT p_sum_buy_order_qty decimal(18,2),
    OUT p_sum_sell_order_qty decimal(18,2),
    OUT p_sum_buy_comm_qty decimal(18,2),
    OUT p_sum_sell_comm_qty decimal(18,2),
    OUT p_sum_buy_strike_qty decimal(18,2),
    OUT p_sum_sell_strike_qty decimal(18,2),
    OUT p_sum_buy_strike_amt decimal(18,4),
    OUT p_sum_sell_strike_amt decimal(18,4),
    OUT p_sum_buy_comm_amt decimal(18,4),
    OUT p_sum_sell_comm_amt decimal(18,4),
    OUT p_comm_remark_info varchar(1024),
    OUT p_sum_comm_update_times int,
    OUT p_acco_concat_info varchar(4096)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_comm_date int;
    declare v_co_no int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sum_comm_row_id bigint;
    declare v_sum_comm_co_no int;
    declare v_sum_comm_pd_no int;
    declare v_sum_comm_exch_group_no int;
    declare v_sum_comm_asset_acco_no int;
    declare v_sum_comm_pass_no int;
    declare v_sum_comm_out_acco varchar(32);
    declare v_sum_comm_exch_crncy_type varchar(3);
    declare v_sum_comm_stock_code_no int;
    declare v_sum_comm_date int;
    declare v_sum_comm_time int;
    declare v_sum_comm_batch_no int;
    declare v_sum_comm_opor int;
    declare v_sum_comm_executor int;
    declare v_sum_comm_dir int;
    declare v_sum_comm_limit_price decimal(16,9);
    declare v_sum_comm_qty decimal(18,2);
    declare v_sum_comm_amt decimal(18,4);
    declare v_sum_comm_order_qty decimal(18,2);
    declare v_sum_comm_cancel_qty decimal(18,2);
    declare v_sum_comm_await_cancel_qty decimal(18,2);
    declare v_sum_comm_strike_amt decimal(18,4);
    declare v_sum_comm_strike_qty decimal(18,2);
    declare v_sum_comm_strike_status varchar(2);
    declare v_comm_sum_status varchar(2);
    declare v_sum_comm_begin_date int;
    declare v_sum_comm_end_date int;
    declare v_sum_comm_begin_time int;
    declare v_sum_comm_end_time int;
    declare v_sum_comm_comple_date int;
    declare v_sum_comm_comple_time int;
    declare v_sum_comm_max_comm_comple_date int;
    declare v_sum_comm_max_comm_comple_time int;
    declare v_sum_comm_appr_date int;
    declare v_sum_comm_appr_time int;
    declare v_sum_comm_appr_qty decimal(18,2);
    declare v_comm_sum_approve_status varchar(2);
    declare v_sum_comm_basket_id bigint;
    declare v_sum_comm_net_price_flag int;
    declare v_sum_comm_bond_accr_intrst decimal(18,12);
    declare v_sum_comm_bond_rate_type int;
    declare v_sum_comm_oper_way varchar(2);
    declare v_sum_comm_exter_comm_flag int;
    declare v_sum_buy_order_qty decimal(18,2);
    declare v_sum_sell_order_qty decimal(18,2);
    declare v_sum_buy_comm_qty decimal(18,2);
    declare v_sum_sell_comm_qty decimal(18,2);
    declare v_sum_buy_strike_qty decimal(18,2);
    declare v_sum_sell_strike_qty decimal(18,2);
    declare v_sum_buy_strike_amt decimal(18,4);
    declare v_sum_sell_strike_amt decimal(18,4);
    declare v_sum_buy_comm_amt decimal(18,4);
    declare v_sum_sell_comm_amt decimal(18,4);
    declare v_comm_remark_info varchar(1024);
    declare v_sum_comm_update_times int;
    declare v_acco_concat_info varchar(4096);

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
    SET v_comm_date = p_comm_date;
    SET v_co_no = p_co_no;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_executor = p_comm_executor;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sum_comm_row_id = 0;
    SET v_sum_comm_co_no = 0;
    SET v_sum_comm_pd_no = 0;
    SET v_sum_comm_exch_group_no = 0;
    SET v_sum_comm_asset_acco_no = 0;
    SET v_sum_comm_pass_no = 0;
    SET v_sum_comm_out_acco = " ";
    SET v_sum_comm_exch_crncy_type = "CNY";
    SET v_sum_comm_stock_code_no = 0;
    SET v_sum_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_sum_comm_time = date_format(curtime(),'%H%i%s');
    SET v_sum_comm_batch_no = 0;
    SET v_sum_comm_opor = 0;
    SET v_sum_comm_executor = 0;
    SET v_sum_comm_dir = 0;
    SET v_sum_comm_limit_price = 0;
    SET v_sum_comm_qty = 0;
    SET v_sum_comm_amt = 0;
    SET v_sum_comm_order_qty = 0;
    SET v_sum_comm_cancel_qty = 0;
    SET v_sum_comm_await_cancel_qty = 0;
    SET v_sum_comm_strike_amt = 0;
    SET v_sum_comm_strike_qty = 0;
    SET v_sum_comm_strike_status = "0";
    SET v_comm_sum_status = "0";
    SET v_sum_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_sum_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_sum_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_sum_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_sum_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_sum_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_sum_comm_max_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_sum_comm_max_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_sum_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_sum_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_sum_comm_appr_qty = 0;
    SET v_comm_sum_approve_status = "0";
    SET v_sum_comm_basket_id = 0;
    SET v_sum_comm_net_price_flag = 0;
    SET v_sum_comm_bond_accr_intrst = 0;
    SET v_sum_comm_bond_rate_type = 0;
    SET v_sum_comm_oper_way = " ";
    SET v_sum_comm_exter_comm_flag = 0;
    SET v_sum_buy_order_qty = 0;
    SET v_sum_sell_order_qty = 0;
    SET v_sum_buy_comm_qty = 0;
    SET v_sum_sell_comm_qty = 0;
    SET v_sum_buy_strike_qty = 0;
    SET v_sum_sell_strike_qty = 0;
    SET v_sum_buy_strike_amt = 0;
    SET v_sum_sell_strike_amt = 0;
    SET v_sum_buy_comm_amt = 0;
    SET v_sum_sell_comm_amt = 0;
    SET v_comm_remark_info = " ";
    SET v_sum_comm_update_times = 1;
    SET v_acco_concat_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取汇总指令信息】*/
    call db_tdsecu.pra_tdsephif_GetSumCommInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_date,
        v_co_no,
        v_comm_batch_no,
        v_comm_executor,
        v_error_code,
        v_error_info,
        v_sum_comm_row_id,
        v_sum_comm_co_no,
        v_sum_comm_pd_no,
        v_sum_comm_exch_group_no,
        v_sum_comm_asset_acco_no,
        v_sum_comm_pass_no,
        v_sum_comm_out_acco,
        v_sum_comm_exch_crncy_type,
        v_sum_comm_stock_code_no,
        v_sum_comm_date,
        v_sum_comm_time,
        v_sum_comm_batch_no,
        v_sum_comm_opor,
        v_sum_comm_executor,
        v_sum_comm_dir,
        v_sum_comm_limit_price,
        v_sum_comm_qty,
        v_sum_comm_amt,
        v_sum_comm_order_qty,
        v_sum_comm_cancel_qty,
        v_sum_comm_await_cancel_qty,
        v_sum_comm_strike_amt,
        v_sum_comm_strike_qty,
        v_sum_comm_strike_status,
        v_comm_sum_status,
        v_sum_comm_begin_date,
        v_sum_comm_end_date,
        v_sum_comm_begin_time,
        v_sum_comm_end_time,
        v_sum_comm_comple_date,
        v_sum_comm_comple_time,
        v_sum_comm_max_comm_comple_date,
        v_sum_comm_max_comm_comple_time,
        v_sum_comm_appr_date,
        v_sum_comm_appr_time,
        v_sum_comm_appr_qty,
        v_comm_sum_approve_status,
        v_sum_comm_basket_id,
        v_sum_comm_net_price_flag,
        v_sum_comm_bond_accr_intrst,
        v_sum_comm_bond_rate_type,
        v_sum_comm_oper_way,
        v_sum_comm_exter_comm_flag,
        v_sum_buy_order_qty,
        v_sum_sell_order_qty,
        v_sum_buy_comm_qty,
        v_sum_sell_comm_qty,
        v_sum_buy_strike_qty,
        v_sum_sell_strike_qty,
        v_sum_buy_strike_amt,
        v_sum_sell_strike_amt,
        v_sum_buy_comm_amt,
        v_sum_sell_comm_amt,
        v_comm_remark_info,
        v_sum_comm_update_times,
        v_acco_concat_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取汇总指令信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_sum_comm_row_id = v_sum_comm_row_id;
    SET p_sum_comm_co_no = v_sum_comm_co_no;
    SET p_sum_comm_pd_no = v_sum_comm_pd_no;
    SET p_sum_comm_exch_group_no = v_sum_comm_exch_group_no;
    SET p_sum_comm_asset_acco_no = v_sum_comm_asset_acco_no;
    SET p_sum_comm_pass_no = v_sum_comm_pass_no;
    SET p_sum_comm_out_acco = v_sum_comm_out_acco;
    SET p_sum_comm_exch_crncy_type = v_sum_comm_exch_crncy_type;
    SET p_sum_comm_stock_code_no = v_sum_comm_stock_code_no;
    SET p_sum_comm_date = v_sum_comm_date;
    SET p_sum_comm_time = v_sum_comm_time;
    SET p_sum_comm_batch_no = v_sum_comm_batch_no;
    SET p_sum_comm_opor = v_sum_comm_opor;
    SET p_sum_comm_executor = v_sum_comm_executor;
    SET p_sum_comm_dir = v_sum_comm_dir;
    SET p_sum_comm_limit_price = v_sum_comm_limit_price;
    SET p_sum_comm_qty = v_sum_comm_qty;
    SET p_sum_comm_amt = v_sum_comm_amt;
    SET p_sum_comm_order_qty = v_sum_comm_order_qty;
    SET p_sum_comm_cancel_qty = v_sum_comm_cancel_qty;
    SET p_sum_comm_await_cancel_qty = v_sum_comm_await_cancel_qty;
    SET p_sum_comm_strike_amt = v_sum_comm_strike_amt;
    SET p_sum_comm_strike_qty = v_sum_comm_strike_qty;
    SET p_sum_comm_strike_status = v_sum_comm_strike_status;
    SET p_comm_sum_status = v_comm_sum_status;
    SET p_sum_comm_begin_date = v_sum_comm_begin_date;
    SET p_sum_comm_end_date = v_sum_comm_end_date;
    SET p_sum_comm_begin_time = v_sum_comm_begin_time;
    SET p_sum_comm_end_time = v_sum_comm_end_time;
    SET p_sum_comm_comple_date = v_sum_comm_comple_date;
    SET p_sum_comm_comple_time = v_sum_comm_comple_time;
    SET p_sum_comm_max_comm_comple_date = v_sum_comm_max_comm_comple_date;
    SET p_sum_comm_max_comm_comple_time = v_sum_comm_max_comm_comple_time;
    SET p_sum_comm_appr_date = v_sum_comm_appr_date;
    SET p_sum_comm_appr_time = v_sum_comm_appr_time;
    SET p_sum_comm_appr_qty = v_sum_comm_appr_qty;
    SET p_comm_sum_approve_status = v_comm_sum_approve_status;
    SET p_sum_comm_basket_id = v_sum_comm_basket_id;
    SET p_sum_comm_net_price_flag = v_sum_comm_net_price_flag;
    SET p_sum_comm_bond_accr_intrst = v_sum_comm_bond_accr_intrst;
    SET p_sum_comm_bond_rate_type = v_sum_comm_bond_rate_type;
    SET p_sum_comm_oper_way = v_sum_comm_oper_way;
    SET p_sum_comm_exter_comm_flag = v_sum_comm_exter_comm_flag;
    SET p_sum_buy_order_qty = v_sum_buy_order_qty;
    SET p_sum_sell_order_qty = v_sum_sell_order_qty;
    SET p_sum_buy_comm_qty = v_sum_buy_comm_qty;
    SET p_sum_sell_comm_qty = v_sum_sell_comm_qty;
    SET p_sum_buy_strike_qty = v_sum_buy_strike_qty;
    SET p_sum_sell_strike_qty = v_sum_sell_strike_qty;
    SET p_sum_buy_strike_amt = v_sum_buy_strike_amt;
    SET p_sum_sell_strike_amt = v_sum_sell_strike_amt;
    SET p_sum_buy_comm_amt = v_sum_buy_comm_amt;
    SET p_sum_sell_comm_amt = v_sum_sell_comm_amt;
    SET p_comm_remark_info = v_comm_remark_info;
    SET p_sum_comm_update_times = v_sum_comm_update_times;
    SET p_acco_concat_info = v_acco_concat_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取指令混合信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetTotalCommInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetTotalCommInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_crncy_type varchar(3),
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_comm_date int,
    OUT p_comm_time int,
    OUT p_comm_batch_no int,
    OUT p_comm_opor int,
    OUT p_comm_executor int,
    OUT p_comm_dir int,
    OUT p_comm_limit_price decimal(16,9),
    OUT p_limit_actual_price decimal(16,9),
    OUT p_comm_qty decimal(18,2),
    OUT p_comm_amt decimal(18,4),
    OUT p_order_qty decimal(18,2),
    OUT p_comm_cancel_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_comm_frozen_amt decimal(18,4),
    OUT p_comm_frozen_qty decimal(18,2),
    OUT p_strike_status varchar(2),
    OUT p_comm_status varchar(2),
    OUT p_comm_begin_date int,
    OUT p_comm_end_date int,
    OUT p_comm_begin_time int,
    OUT p_comm_end_time int,
    OUT p_comm_comple_date int,
    OUT p_comm_comple_time int,
    OUT p_comm_appr_date int,
    OUT p_comm_appr_time int,
    OUT p_comm_appr_status varchar(2),
    OUT p_comm_appr_oper int,
    OUT p_comm_appr_remark varchar(255),
    OUT p_basket_id bigint,
    OUT p_net_price_flag int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_comm_oper_way varchar(2),
    OUT p_exter_comm_flag int,
    OUT p_comm_comple_flag int,
    OUT p_strategy_capt_qty decimal(18,2),
    OUT p_strategy_order_qty decimal(18,2),
    OUT p_contra_no varchar(32),
    OUT p_comm_remark_info varchar(1024),
    OUT p_disp_opor int,
    OUT p_disp_status int,
    OUT p_read_flag int,
    OUT p_update_times int,
    OUT p_sum_comm_row_id bigint,
    OUT p_sum_comm_co_no int,
    OUT p_sum_comm_pd_no int,
    OUT p_sum_comm_exch_group_no int,
    OUT p_sum_comm_asset_acco_no int,
    OUT p_sum_comm_pass_no int,
    OUT p_sum_comm_out_acco varchar(32),
    OUT p_sum_comm_exch_crncy_type varchar(3),
    OUT p_sum_comm_stock_code_no int,
    OUT p_sum_comm_date int,
    OUT p_sum_comm_time int,
    OUT p_sum_comm_batch_no int,
    OUT p_sum_comm_opor int,
    OUT p_sum_comm_executor int,
    OUT p_sum_comm_dir int,
    OUT p_sum_comm_limit_price decimal(16,9),
    OUT p_sum_comm_qty decimal(18,2),
    OUT p_sum_comm_amt decimal(18,4),
    OUT p_sum_comm_order_qty decimal(18,2),
    OUT p_sum_comm_cancel_qty decimal(18,2),
    OUT p_sum_comm_await_cancel_qty decimal(18,2),
    OUT p_sum_comm_strike_amt decimal(18,4),
    OUT p_sum_comm_strike_qty decimal(18,2),
    OUT p_sum_comm_strike_status varchar(2),
    OUT p_comm_sum_status varchar(2),
    OUT p_sum_comm_begin_date int,
    OUT p_sum_comm_end_date int,
    OUT p_sum_comm_begin_time int,
    OUT p_sum_comm_end_time int,
    OUT p_sum_comm_comple_date int,
    OUT p_sum_comm_comple_time int,
    OUT p_sum_comm_max_comm_comple_date int,
    OUT p_sum_comm_max_comm_comple_time int,
    OUT p_sum_comm_appr_date int,
    OUT p_sum_comm_appr_time int,
    OUT p_sum_comm_appr_qty decimal(18,2),
    OUT p_comm_sum_approve_status varchar(2),
    OUT p_sum_comm_basket_id bigint,
    OUT p_sum_comm_net_price_flag int,
    OUT p_sum_comm_bond_accr_intrst decimal(18,12),
    OUT p_sum_comm_bond_rate_type int,
    OUT p_sum_comm_oper_way varchar(2),
    OUT p_sum_comm_exter_comm_flag int,
    OUT p_sum_buy_order_qty decimal(18,2),
    OUT p_sum_sell_order_qty decimal(18,2),
    OUT p_sum_buy_comm_qty decimal(18,2),
    OUT p_sum_sell_comm_qty decimal(18,2),
    OUT p_sum_buy_strike_qty decimal(18,2),
    OUT p_sum_sell_strike_qty decimal(18,2),
    OUT p_sum_buy_strike_amt decimal(18,4),
    OUT p_sum_sell_strike_amt decimal(18,4),
    OUT p_sum_buy_comm_amt decimal(18,4),
    OUT p_sum_sell_comm_amt decimal(18,4),
    OUT p_sum_comm_remark_info varchar(255),
    OUT p_sum_comm_update_times int,
    OUT p_acco_concat_info varchar(4096),
    OUT p_combo_code varchar(32)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_comm_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_comm_date int;
    declare v_comm_time int;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_strike_status varchar(2);
    declare v_comm_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_appr_status varchar(2);
    declare v_comm_appr_oper int;
    declare v_comm_appr_remark varchar(255);
    declare v_basket_id bigint;
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_comm_comple_flag int;
    declare v_strategy_capt_qty decimal(18,2);
    declare v_strategy_order_qty decimal(18,2);
    declare v_contra_no varchar(32);
    declare v_comm_remark_info varchar(1024);
    declare v_disp_opor int;
    declare v_disp_status int;
    declare v_read_flag int;
    declare v_update_times int;
    declare v_sum_comm_row_id bigint;
    declare v_sum_comm_co_no int;
    declare v_sum_comm_pd_no int;
    declare v_sum_comm_exch_group_no int;
    declare v_sum_comm_asset_acco_no int;
    declare v_sum_comm_pass_no int;
    declare v_sum_comm_out_acco varchar(32);
    declare v_sum_comm_exch_crncy_type varchar(3);
    declare v_sum_comm_stock_code_no int;
    declare v_sum_comm_date int;
    declare v_sum_comm_time int;
    declare v_sum_comm_batch_no int;
    declare v_sum_comm_opor int;
    declare v_sum_comm_executor int;
    declare v_sum_comm_dir int;
    declare v_sum_comm_limit_price decimal(16,9);
    declare v_sum_comm_qty decimal(18,2);
    declare v_sum_comm_amt decimal(18,4);
    declare v_sum_comm_order_qty decimal(18,2);
    declare v_sum_comm_cancel_qty decimal(18,2);
    declare v_sum_comm_await_cancel_qty decimal(18,2);
    declare v_sum_comm_strike_amt decimal(18,4);
    declare v_sum_comm_strike_qty decimal(18,2);
    declare v_sum_comm_strike_status varchar(2);
    declare v_comm_sum_status varchar(2);
    declare v_sum_comm_begin_date int;
    declare v_sum_comm_end_date int;
    declare v_sum_comm_begin_time int;
    declare v_sum_comm_end_time int;
    declare v_sum_comm_comple_date int;
    declare v_sum_comm_comple_time int;
    declare v_sum_comm_max_comm_comple_date int;
    declare v_sum_comm_max_comm_comple_time int;
    declare v_sum_comm_appr_date int;
    declare v_sum_comm_appr_time int;
    declare v_sum_comm_appr_qty decimal(18,2);
    declare v_comm_sum_approve_status varchar(2);
    declare v_sum_comm_basket_id bigint;
    declare v_sum_comm_net_price_flag int;
    declare v_sum_comm_bond_accr_intrst decimal(18,12);
    declare v_sum_comm_bond_rate_type int;
    declare v_sum_comm_oper_way varchar(2);
    declare v_sum_comm_exter_comm_flag int;
    declare v_sum_buy_order_qty decimal(18,2);
    declare v_sum_sell_order_qty decimal(18,2);
    declare v_sum_buy_comm_qty decimal(18,2);
    declare v_sum_sell_comm_qty decimal(18,2);
    declare v_sum_buy_strike_qty decimal(18,2);
    declare v_sum_sell_strike_qty decimal(18,2);
    declare v_sum_buy_strike_amt decimal(18,4);
    declare v_sum_sell_strike_amt decimal(18,4);
    declare v_sum_buy_comm_amt decimal(18,4);
    declare v_sum_sell_comm_amt decimal(18,4);
    declare v_sum_comm_remark_info varchar(255);
    declare v_sum_comm_update_times int;
    declare v_acco_concat_info varchar(4096);
    declare v_combo_code varchar(32);

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
    SET v_comm_id = p_comm_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_comm_executor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_strike_status = "0";
    SET v_comm_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_status = " ";
    SET v_comm_appr_oper = 0;
    SET v_comm_appr_remark = " ";
    SET v_basket_id = 0;
    SET v_net_price_flag = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_comm_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_comm_comple_flag = 0;
    SET v_strategy_capt_qty = 0;
    SET v_strategy_order_qty = 0;
    SET v_contra_no = " ";
    SET v_comm_remark_info = " ";
    SET v_disp_opor = 0;
    SET v_disp_status = 0;
    SET v_read_flag = 0;
    SET v_update_times = 1;
    SET v_sum_comm_row_id = 0;
    SET v_sum_comm_co_no = 0;
    SET v_sum_comm_pd_no = 0;
    SET v_sum_comm_exch_group_no = 0;
    SET v_sum_comm_asset_acco_no = 0;
    SET v_sum_comm_pass_no = 0;
    SET v_sum_comm_out_acco = " ";
    SET v_sum_comm_exch_crncy_type = "CNY";
    SET v_sum_comm_stock_code_no = 0;
    SET v_sum_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_sum_comm_time = date_format(curtime(),'%H%i%s');
    SET v_sum_comm_batch_no = 0;
    SET v_sum_comm_opor = 0;
    SET v_sum_comm_executor = 0;
    SET v_sum_comm_dir = 0;
    SET v_sum_comm_limit_price = 0;
    SET v_sum_comm_qty = 0;
    SET v_sum_comm_amt = 0;
    SET v_sum_comm_order_qty = 0;
    SET v_sum_comm_cancel_qty = 0;
    SET v_sum_comm_await_cancel_qty = 0;
    SET v_sum_comm_strike_amt = 0;
    SET v_sum_comm_strike_qty = 0;
    SET v_sum_comm_strike_status = "0";
    SET v_comm_sum_status = "0";
    SET v_sum_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_sum_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_sum_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_sum_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_sum_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_sum_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_sum_comm_max_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_sum_comm_max_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_sum_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_sum_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_sum_comm_appr_qty = 0;
    SET v_comm_sum_approve_status = "0";
    SET v_sum_comm_basket_id = 0;
    SET v_sum_comm_net_price_flag = 0;
    SET v_sum_comm_bond_accr_intrst = 0;
    SET v_sum_comm_bond_rate_type = 0;
    SET v_sum_comm_oper_way = " ";
    SET v_sum_comm_exter_comm_flag = 0;
    SET v_sum_buy_order_qty = 0;
    SET v_sum_sell_order_qty = 0;
    SET v_sum_buy_comm_qty = 0;
    SET v_sum_sell_comm_qty = 0;
    SET v_sum_buy_strike_qty = 0;
    SET v_sum_sell_strike_qty = 0;
    SET v_sum_buy_strike_amt = 0;
    SET v_sum_sell_strike_amt = 0;
    SET v_sum_buy_comm_amt = 0;
    SET v_sum_sell_comm_amt = 0;
    SET v_sum_comm_remark_info = " ";
    SET v_sum_comm_update_times = 1;
    SET v_acco_concat_info = " ";
    SET v_combo_code = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取指令混合信息】*/
    call db_tdsecu.pra_tdsephif_GetTotalCommInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_id,
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
        v_stock_acco_no,
        v_stock_code_no,
        v_stock_type,
        v_comm_date,
        v_comm_time,
        v_comm_batch_no,
        v_comm_opor,
        v_comm_executor,
        v_comm_dir,
        v_comm_limit_price,
        v_limit_actual_price,
        v_comm_qty,
        v_comm_amt,
        v_order_qty,
        v_comm_cancel_qty,
        v_strike_amt,
        v_strike_qty,
        v_comm_frozen_amt,
        v_comm_frozen_qty,
        v_strike_status,
        v_comm_status,
        v_comm_begin_date,
        v_comm_end_date,
        v_comm_begin_time,
        v_comm_end_time,
        v_comm_comple_date,
        v_comm_comple_time,
        v_comm_appr_date,
        v_comm_appr_time,
        v_comm_appr_status,
        v_comm_appr_oper,
        v_comm_appr_remark,
        v_basket_id,
        v_net_price_flag,
        v_bond_accr_intrst,
        v_bond_rate_type,
        v_comm_oper_way,
        v_exter_comm_flag,
        v_comm_comple_flag,
        v_strategy_capt_qty,
        v_strategy_order_qty,
        v_contra_no,
        v_comm_remark_info,
        v_disp_opor,
        v_disp_status,
        v_read_flag,
        v_update_times,
        v_sum_comm_row_id,
        v_sum_comm_co_no,
        v_sum_comm_pd_no,
        v_sum_comm_exch_group_no,
        v_sum_comm_asset_acco_no,
        v_sum_comm_pass_no,
        v_sum_comm_out_acco,
        v_sum_comm_exch_crncy_type,
        v_sum_comm_stock_code_no,
        v_sum_comm_date,
        v_sum_comm_time,
        v_sum_comm_batch_no,
        v_sum_comm_opor,
        v_sum_comm_executor,
        v_sum_comm_dir,
        v_sum_comm_limit_price,
        v_sum_comm_qty,
        v_sum_comm_amt,
        v_sum_comm_order_qty,
        v_sum_comm_cancel_qty,
        v_sum_comm_await_cancel_qty,
        v_sum_comm_strike_amt,
        v_sum_comm_strike_qty,
        v_sum_comm_strike_status,
        v_comm_sum_status,
        v_sum_comm_begin_date,
        v_sum_comm_end_date,
        v_sum_comm_begin_time,
        v_sum_comm_end_time,
        v_sum_comm_comple_date,
        v_sum_comm_comple_time,
        v_sum_comm_max_comm_comple_date,
        v_sum_comm_max_comm_comple_time,
        v_sum_comm_appr_date,
        v_sum_comm_appr_time,
        v_sum_comm_appr_qty,
        v_comm_sum_approve_status,
        v_sum_comm_basket_id,
        v_sum_comm_net_price_flag,
        v_sum_comm_bond_accr_intrst,
        v_sum_comm_bond_rate_type,
        v_sum_comm_oper_way,
        v_sum_comm_exter_comm_flag,
        v_sum_buy_order_qty,
        v_sum_sell_order_qty,
        v_sum_buy_comm_qty,
        v_sum_sell_comm_qty,
        v_sum_buy_strike_qty,
        v_sum_sell_strike_qty,
        v_sum_buy_strike_amt,
        v_sum_sell_strike_amt,
        v_sum_buy_comm_amt,
        v_sum_sell_comm_amt,
        v_sum_comm_remark_info,
        v_sum_comm_update_times,
        v_acco_concat_info,
        v_combo_code);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取指令混合信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_comm_date = v_comm_date;
    SET p_comm_time = v_comm_time;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_opor = v_comm_opor;
    SET p_comm_executor = v_comm_executor;
    SET p_comm_dir = v_comm_dir;
    SET p_comm_limit_price = v_comm_limit_price;
    SET p_limit_actual_price = v_limit_actual_price;
    SET p_comm_qty = v_comm_qty;
    SET p_comm_amt = v_comm_amt;
    SET p_order_qty = v_order_qty;
    SET p_comm_cancel_qty = v_comm_cancel_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_comm_frozen_amt = v_comm_frozen_amt;
    SET p_comm_frozen_qty = v_comm_frozen_qty;
    SET p_strike_status = v_strike_status;
    SET p_comm_status = v_comm_status;
    SET p_comm_begin_date = v_comm_begin_date;
    SET p_comm_end_date = v_comm_end_date;
    SET p_comm_begin_time = v_comm_begin_time;
    SET p_comm_end_time = v_comm_end_time;
    SET p_comm_comple_date = v_comm_comple_date;
    SET p_comm_comple_time = v_comm_comple_time;
    SET p_comm_appr_date = v_comm_appr_date;
    SET p_comm_appr_time = v_comm_appr_time;
    SET p_comm_appr_status = v_comm_appr_status;
    SET p_comm_appr_oper = v_comm_appr_oper;
    SET p_comm_appr_remark = v_comm_appr_remark;
    SET p_basket_id = v_basket_id;
    SET p_net_price_flag = v_net_price_flag;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_comm_oper_way = v_comm_oper_way;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_comm_comple_flag = v_comm_comple_flag;
    SET p_strategy_capt_qty = v_strategy_capt_qty;
    SET p_strategy_order_qty = v_strategy_order_qty;
    SET p_contra_no = v_contra_no;
    SET p_comm_remark_info = v_comm_remark_info;
    SET p_disp_opor = v_disp_opor;
    SET p_disp_status = v_disp_status;
    SET p_read_flag = v_read_flag;
    SET p_update_times = v_update_times;
    SET p_sum_comm_row_id = v_sum_comm_row_id;
    SET p_sum_comm_co_no = v_sum_comm_co_no;
    SET p_sum_comm_pd_no = v_sum_comm_pd_no;
    SET p_sum_comm_exch_group_no = v_sum_comm_exch_group_no;
    SET p_sum_comm_asset_acco_no = v_sum_comm_asset_acco_no;
    SET p_sum_comm_pass_no = v_sum_comm_pass_no;
    SET p_sum_comm_out_acco = v_sum_comm_out_acco;
    SET p_sum_comm_exch_crncy_type = v_sum_comm_exch_crncy_type;
    SET p_sum_comm_stock_code_no = v_sum_comm_stock_code_no;
    SET p_sum_comm_date = v_sum_comm_date;
    SET p_sum_comm_time = v_sum_comm_time;
    SET p_sum_comm_batch_no = v_sum_comm_batch_no;
    SET p_sum_comm_opor = v_sum_comm_opor;
    SET p_sum_comm_executor = v_sum_comm_executor;
    SET p_sum_comm_dir = v_sum_comm_dir;
    SET p_sum_comm_limit_price = v_sum_comm_limit_price;
    SET p_sum_comm_qty = v_sum_comm_qty;
    SET p_sum_comm_amt = v_sum_comm_amt;
    SET p_sum_comm_order_qty = v_sum_comm_order_qty;
    SET p_sum_comm_cancel_qty = v_sum_comm_cancel_qty;
    SET p_sum_comm_await_cancel_qty = v_sum_comm_await_cancel_qty;
    SET p_sum_comm_strike_amt = v_sum_comm_strike_amt;
    SET p_sum_comm_strike_qty = v_sum_comm_strike_qty;
    SET p_sum_comm_strike_status = v_sum_comm_strike_status;
    SET p_comm_sum_status = v_comm_sum_status;
    SET p_sum_comm_begin_date = v_sum_comm_begin_date;
    SET p_sum_comm_end_date = v_sum_comm_end_date;
    SET p_sum_comm_begin_time = v_sum_comm_begin_time;
    SET p_sum_comm_end_time = v_sum_comm_end_time;
    SET p_sum_comm_comple_date = v_sum_comm_comple_date;
    SET p_sum_comm_comple_time = v_sum_comm_comple_time;
    SET p_sum_comm_max_comm_comple_date = v_sum_comm_max_comm_comple_date;
    SET p_sum_comm_max_comm_comple_time = v_sum_comm_max_comm_comple_time;
    SET p_sum_comm_appr_date = v_sum_comm_appr_date;
    SET p_sum_comm_appr_time = v_sum_comm_appr_time;
    SET p_sum_comm_appr_qty = v_sum_comm_appr_qty;
    SET p_comm_sum_approve_status = v_comm_sum_approve_status;
    SET p_sum_comm_basket_id = v_sum_comm_basket_id;
    SET p_sum_comm_net_price_flag = v_sum_comm_net_price_flag;
    SET p_sum_comm_bond_accr_intrst = v_sum_comm_bond_accr_intrst;
    SET p_sum_comm_bond_rate_type = v_sum_comm_bond_rate_type;
    SET p_sum_comm_oper_way = v_sum_comm_oper_way;
    SET p_sum_comm_exter_comm_flag = v_sum_comm_exter_comm_flag;
    SET p_sum_buy_order_qty = v_sum_buy_order_qty;
    SET p_sum_sell_order_qty = v_sum_sell_order_qty;
    SET p_sum_buy_comm_qty = v_sum_buy_comm_qty;
    SET p_sum_sell_comm_qty = v_sum_sell_comm_qty;
    SET p_sum_buy_strike_qty = v_sum_buy_strike_qty;
    SET p_sum_sell_strike_qty = v_sum_sell_strike_qty;
    SET p_sum_buy_strike_amt = v_sum_buy_strike_amt;
    SET p_sum_sell_strike_amt = v_sum_sell_strike_amt;
    SET p_sum_buy_comm_amt = v_sum_buy_comm_amt;
    SET p_sum_sell_comm_amt = v_sum_sell_comm_amt;
    SET p_sum_comm_remark_info = v_sum_comm_remark_info;
    SET p_sum_comm_update_times = v_sum_comm_update_times;
    SET p_acco_concat_info = v_acco_concat_info;
    SET p_combo_code = v_combo_code;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取交易组资金持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetExgpCashPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetExgpCashPosi(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_exch_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_frozen_amt decimal(18,4),
    OUT p_unfroz_amt decimal(18,4),
    OUT p_comm_frozen_amt decimal(18,4),
    OUT p_comm_unfroz_amt decimal(18,4),
    OUT p_comm_capt_amt decimal(18,4),
    OUT p_comm_releas_amt decimal(18,4),
    OUT p_trade_frozen_amt decimal(18,4),
    OUT p_trade_unfroz_amt decimal(18,4),
    OUT p_trade_capt_amt decimal(18,4),
    OUT p_trade_releas_amt decimal(18,4),
    OUT p_strike_capt_amt decimal(18,4),
    OUT p_strike_releas_amt decimal(18,4),
    OUT p_exgp_cash_update_times int,
    OUT p_frozen_qty decimal(18,2),
    OUT p_unfroz_qty decimal(18,2),
    OUT p_comm_frozen_qty decimal(18,2),
    OUT p_comm_unfroz_qty decimal(18,2),
    OUT p_comm_capt_qty decimal(18,2),
    OUT p_comm_releas_qty decimal(18,2),
    OUT p_trade_frozen_qty decimal(18,2),
    OUT p_trade_unfroz_qty decimal(18,2),
    OUT p_trade_capt_qty decimal(18,2),
    OUT p_trade_releas_qty decimal(18,2),
    OUT p_strike_capt_qty decimal(18,2),
    OUT p_strike_releas_qty decimal(18,2),
    OUT p_strike_frozen_qty decimal(18,2),
    OUT p_strike_unfroz_qty decimal(18,2),
    OUT p_realize_pandl decimal(18,4),
    OUT p_cost_amt decimal(18,4),
    OUT p_intrst_cost_amt decimal(18,4),
    OUT p_intrst_pandl decimal(18,4),
    OUT p_exgp_posi_update_times int
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_unfroz_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_comm_releas_amt decimal(18,4);
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_unfroz_amt decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_exgp_cash_update_times int;
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_comm_unfroz_qty decimal(18,2);
    declare v_comm_capt_qty decimal(18,2);
    declare v_comm_releas_qty decimal(18,2);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_trade_unfroz_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_strike_frozen_qty decimal(18,2);
    declare v_strike_unfroz_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_exgp_posi_update_times int;

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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_unfroz_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_comm_releas_amt = 0;
    SET v_trade_frozen_amt = 0;
    SET v_trade_unfroz_amt = 0;
    SET v_trade_capt_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_capt_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_exgp_cash_update_times = 1;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_comm_frozen_qty = 0;
    SET v_comm_unfroz_qty = 0;
    SET v_comm_capt_qty = 0;
    SET v_comm_releas_qty = 0;
    SET v_trade_frozen_qty = 0;
    SET v_trade_unfroz_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_strike_frozen_qty = 0;
    SET v_strike_unfroz_qty = 0;
    SET v_realize_pandl = 0;
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_exgp_posi_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取交易组资金持仓信息】*/
    call db_tdsecu.pra_tdsephif_GetExgpCashPosi(
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
        v_stock_acco_no,
        v_stock_code_no,
        v_exch_crncy_type,
        v_error_code,
        v_error_info,
        v_frozen_amt,
        v_unfroz_amt,
        v_comm_frozen_amt,
        v_comm_unfroz_amt,
        v_comm_capt_amt,
        v_comm_releas_amt,
        v_trade_frozen_amt,
        v_trade_unfroz_amt,
        v_trade_capt_amt,
        v_trade_releas_amt,
        v_strike_capt_amt,
        v_strike_releas_amt,
        v_exgp_cash_update_times,
        v_frozen_qty,
        v_unfroz_qty,
        v_comm_frozen_qty,
        v_comm_unfroz_qty,
        v_comm_capt_qty,
        v_comm_releas_qty,
        v_trade_frozen_qty,
        v_trade_unfroz_qty,
        v_trade_capt_qty,
        v_trade_releas_qty,
        v_strike_capt_qty,
        v_strike_releas_qty,
        v_strike_frozen_qty,
        v_strike_unfroz_qty,
        v_realize_pandl,
        v_cost_amt,
        v_intrst_cost_amt,
        v_intrst_pandl,
        v_exgp_posi_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取交易组资金持仓信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_frozen_amt = v_frozen_amt;
    SET p_unfroz_amt = v_unfroz_amt;
    SET p_comm_frozen_amt = v_comm_frozen_amt;
    SET p_comm_unfroz_amt = v_comm_unfroz_amt;
    SET p_comm_capt_amt = v_comm_capt_amt;
    SET p_comm_releas_amt = v_comm_releas_amt;
    SET p_trade_frozen_amt = v_trade_frozen_amt;
    SET p_trade_unfroz_amt = v_trade_unfroz_amt;
    SET p_trade_capt_amt = v_trade_capt_amt;
    SET p_trade_releas_amt = v_trade_releas_amt;
    SET p_strike_capt_amt = v_strike_capt_amt;
    SET p_strike_releas_amt = v_strike_releas_amt;
    SET p_exgp_cash_update_times = v_exgp_cash_update_times;
    SET p_frozen_qty = v_frozen_qty;
    SET p_unfroz_qty = v_unfroz_qty;
    SET p_comm_frozen_qty = v_comm_frozen_qty;
    SET p_comm_unfroz_qty = v_comm_unfroz_qty;
    SET p_comm_capt_qty = v_comm_capt_qty;
    SET p_comm_releas_qty = v_comm_releas_qty;
    SET p_trade_frozen_qty = v_trade_frozen_qty;
    SET p_trade_unfroz_qty = v_trade_unfroz_qty;
    SET p_trade_capt_qty = v_trade_capt_qty;
    SET p_trade_releas_qty = v_trade_releas_qty;
    SET p_strike_capt_qty = v_strike_capt_qty;
    SET p_strike_releas_qty = v_strike_releas_qty;
    SET p_strike_frozen_qty = v_strike_frozen_qty;
    SET p_strike_unfroz_qty = v_strike_unfroz_qty;
    SET p_realize_pandl = v_realize_pandl;
    SET p_cost_amt = v_cost_amt;
    SET p_intrst_cost_amt = v_intrst_cost_amt;
    SET p_intrst_pandl = v_intrst_pandl;
    SET p_exgp_posi_update_times = v_exgp_posi_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取资产账户资金持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetAsacCashPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetAsacCashPosi(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_exch_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_frozen_amt decimal(18,4),
    OUT p_unfroz_amt decimal(18,4),
    OUT p_comm_frozen_amt decimal(18,4),
    OUT p_comm_unfroz_amt decimal(18,4),
    OUT p_comm_capt_amt decimal(18,4),
    OUT p_comm_releas_amt decimal(18,4),
    OUT p_trade_frozen_amt decimal(18,4),
    OUT p_trade_unfroz_amt decimal(18,4),
    OUT p_trade_capt_amt decimal(18,4),
    OUT p_trade_releas_amt decimal(18,4),
    OUT p_strike_capt_amt decimal(18,4),
    OUT p_strike_releas_amt decimal(18,4),
    OUT p_asac_cash_update_times int,
    OUT p_frozen_qty decimal(18,2),
    OUT p_unfroz_qty decimal(18,2),
    OUT p_comm_frozen_qty decimal(18,2),
    OUT p_comm_unfroz_qty decimal(18,2),
    OUT p_comm_capt_qty decimal(18,2),
    OUT p_comm_releas_qty decimal(18,2),
    OUT p_trade_frozen_qty decimal(18,2),
    OUT p_trade_unfroz_qty decimal(18,2),
    OUT p_trade_capt_qty decimal(18,2),
    OUT p_trade_releas_qty decimal(18,2),
    OUT p_strike_capt_qty decimal(18,2),
    OUT p_strike_releas_qty decimal(18,2),
    OUT p_strike_frozen_qty decimal(18,2),
    OUT p_strike_unfroz_qty decimal(18,2),
    OUT p_realize_pandl decimal(18,4),
    OUT p_cost_amt decimal(18,4),
    OUT p_intrst_cost_amt decimal(18,4),
    OUT p_intrst_pandl decimal(18,4),
    OUT p_asac_posi_update_times int
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_unfroz_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_comm_releas_amt decimal(18,4);
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_unfroz_amt decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_asac_cash_update_times int;
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_comm_unfroz_qty decimal(18,2);
    declare v_comm_capt_qty decimal(18,2);
    declare v_comm_releas_qty decimal(18,2);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_trade_unfroz_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_strike_frozen_qty decimal(18,2);
    declare v_strike_unfroz_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_asac_posi_update_times int;

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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_unfroz_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_comm_releas_amt = 0;
    SET v_trade_frozen_amt = 0;
    SET v_trade_unfroz_amt = 0;
    SET v_trade_capt_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_capt_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_asac_cash_update_times = 1;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_comm_frozen_qty = 0;
    SET v_comm_unfroz_qty = 0;
    SET v_comm_capt_qty = 0;
    SET v_comm_releas_qty = 0;
    SET v_trade_frozen_qty = 0;
    SET v_trade_unfroz_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_strike_frozen_qty = 0;
    SET v_strike_unfroz_qty = 0;
    SET v_realize_pandl = 0;
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_asac_posi_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取资产账户资金持仓信息】*/
    call db_tdsecu.pra_tdsephif_GetAsacCashPosi(
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
        v_stock_acco_no,
        v_stock_code_no,
        v_exch_crncy_type,
        v_error_code,
        v_error_info,
        v_frozen_amt,
        v_unfroz_amt,
        v_comm_frozen_amt,
        v_comm_unfroz_amt,
        v_comm_capt_amt,
        v_comm_releas_amt,
        v_trade_frozen_amt,
        v_trade_unfroz_amt,
        v_trade_capt_amt,
        v_trade_releas_amt,
        v_strike_capt_amt,
        v_strike_releas_amt,
        v_asac_cash_update_times,
        v_frozen_qty,
        v_unfroz_qty,
        v_comm_frozen_qty,
        v_comm_unfroz_qty,
        v_comm_capt_qty,
        v_comm_releas_qty,
        v_trade_frozen_qty,
        v_trade_unfroz_qty,
        v_trade_capt_qty,
        v_trade_releas_qty,
        v_strike_capt_qty,
        v_strike_releas_qty,
        v_strike_frozen_qty,
        v_strike_unfroz_qty,
        v_realize_pandl,
        v_cost_amt,
        v_intrst_cost_amt,
        v_intrst_pandl,
        v_asac_posi_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取资产账户资金持仓信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_frozen_amt = v_frozen_amt;
    SET p_unfroz_amt = v_unfroz_amt;
    SET p_comm_frozen_amt = v_comm_frozen_amt;
    SET p_comm_unfroz_amt = v_comm_unfroz_amt;
    SET p_comm_capt_amt = v_comm_capt_amt;
    SET p_comm_releas_amt = v_comm_releas_amt;
    SET p_trade_frozen_amt = v_trade_frozen_amt;
    SET p_trade_unfroz_amt = v_trade_unfroz_amt;
    SET p_trade_capt_amt = v_trade_capt_amt;
    SET p_trade_releas_amt = v_trade_releas_amt;
    SET p_strike_capt_amt = v_strike_capt_amt;
    SET p_strike_releas_amt = v_strike_releas_amt;
    SET p_asac_cash_update_times = v_asac_cash_update_times;
    SET p_frozen_qty = v_frozen_qty;
    SET p_unfroz_qty = v_unfroz_qty;
    SET p_comm_frozen_qty = v_comm_frozen_qty;
    SET p_comm_unfroz_qty = v_comm_unfroz_qty;
    SET p_comm_capt_qty = v_comm_capt_qty;
    SET p_comm_releas_qty = v_comm_releas_qty;
    SET p_trade_frozen_qty = v_trade_frozen_qty;
    SET p_trade_unfroz_qty = v_trade_unfroz_qty;
    SET p_trade_capt_qty = v_trade_capt_qty;
    SET p_trade_releas_qty = v_trade_releas_qty;
    SET p_strike_capt_qty = v_strike_capt_qty;
    SET p_strike_releas_qty = v_strike_releas_qty;
    SET p_strike_frozen_qty = v_strike_frozen_qty;
    SET p_strike_unfroz_qty = v_strike_unfroz_qty;
    SET p_realize_pandl = v_realize_pandl;
    SET p_cost_amt = v_cost_amt;
    SET p_intrst_cost_amt = v_intrst_cost_amt;
    SET p_intrst_pandl = v_intrst_pandl;
    SET p_asac_posi_update_times = v_asac_posi_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取资金持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetCashPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetCashPosi(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_exch_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_cash_id bigint,
    OUT p_exgp_frozen_amt decimal(18,4),
    OUT p_exgp_unfroz_amt decimal(18,4),
    OUT p_exgp_comm_frozen_amt decimal(18,4),
    OUT p_exgp_comm_unfroz_amt decimal(18,4),
    OUT p_exgp_comm_capt_amt decimal(18,4),
    OUT p_exgp_comm_releas_amt decimal(18,4),
    OUT p_exgp_trade_frozen_amt decimal(18,4),
    OUT p_exgp_trade_unfroz_amt decimal(18,4),
    OUT p_exgp_trade_capt_amt decimal(18,4),
    OUT p_exgp_trade_releas_amt decimal(18,4),
    OUT p_exgp_strike_capt_amt decimal(18,4),
    OUT p_exgp_strike_releas_amt decimal(18,4),
    OUT p_exgp_cash_update_times int,
    OUT p_exgp_posi_id bigint,
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_comm_frozen_qty decimal(18,2),
    OUT p_exgp_comm_unfroz_qty decimal(18,2),
    OUT p_exgp_comm_capt_qty decimal(18,2),
    OUT p_exgp_comm_releas_qty decimal(18,2),
    OUT p_exgp_trade_frozen_qty decimal(18,2),
    OUT p_exgp_trade_unfroz_qty decimal(18,2),
    OUT p_exgp_trade_capt_qty decimal(18,2),
    OUT p_exgp_trade_releas_qty decimal(18,2),
    OUT p_exgp_strike_capt_qty decimal(18,2),
    OUT p_exgp_strike_releas_qty decimal(18,2),
    OUT p_exgp_strike_frozen_qty decimal(18,2),
    OUT p_exgp_strike_unfroz_qty decimal(18,2),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_intrst_pandl decimal(18,4),
    OUT p_exgp_posi_update_times int,
    OUT p_asac_cash_id bigint,
    OUT p_asac_frozen_amt decimal(18,4),
    OUT p_asac_unfroz_amt decimal(18,4),
    OUT p_asac_comm_frozen_amt decimal(18,4),
    OUT p_asac_comm_unfroz_amt decimal(18,4),
    OUT p_asac_comm_capt_amt decimal(18,4),
    OUT p_asac_comm_releas_amt decimal(18,4),
    OUT p_asac_trade_frozen_amt decimal(18,4),
    OUT p_asac_trade_unfroz_amt decimal(18,4),
    OUT p_asac_trade_capt_amt decimal(18,4),
    OUT p_asac_trade_releas_amt decimal(18,4),
    OUT p_asac_strike_capt_amt decimal(18,4),
    OUT p_asac_strike_releas_amt decimal(18,4),
    OUT p_asac_cash_update_times int,
    OUT p_asac_posi_id bigint,
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_comm_frozen_qty decimal(18,2),
    OUT p_asac_comm_unfroz_qty decimal(18,2),
    OUT p_asac_comm_capt_qty decimal(18,2),
    OUT p_asac_comm_releas_qty decimal(18,2),
    OUT p_asac_trade_frozen_qty decimal(18,2),
    OUT p_asac_trade_unfroz_qty decimal(18,2),
    OUT p_asac_trade_capt_qty decimal(18,2),
    OUT p_asac_trade_releas_qty decimal(18,2),
    OUT p_asac_strike_capt_qty decimal(18,2),
    OUT p_asac_strike_releas_qty decimal(18,2),
    OUT p_asac_strike_frozen_qty decimal(18,2),
    OUT p_asac_strike_unfroz_qty decimal(18,2),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_intrst_pandl decimal(18,4),
    OUT p_asac_posi_update_times int
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_cash_id bigint;
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exgp_comm_frozen_amt decimal(18,4);
    declare v_exgp_comm_unfroz_amt decimal(18,4);
    declare v_exgp_comm_capt_amt decimal(18,4);
    declare v_exgp_comm_releas_amt decimal(18,4);
    declare v_exgp_trade_frozen_amt decimal(18,4);
    declare v_exgp_trade_unfroz_amt decimal(18,4);
    declare v_exgp_trade_capt_amt decimal(18,4);
    declare v_exgp_trade_releas_amt decimal(18,4);
    declare v_exgp_strike_capt_amt decimal(18,4);
    declare v_exgp_strike_releas_amt decimal(18,4);
    declare v_exgp_cash_update_times int;
    declare v_exgp_posi_id bigint;
    declare v_exgp_frozen_qty decimal(18,2);
    declare v_exgp_unfroz_qty decimal(18,2);
    declare v_exgp_comm_frozen_qty decimal(18,2);
    declare v_exgp_comm_unfroz_qty decimal(18,2);
    declare v_exgp_comm_capt_qty decimal(18,2);
    declare v_exgp_comm_releas_qty decimal(18,2);
    declare v_exgp_trade_frozen_qty decimal(18,2);
    declare v_exgp_trade_unfroz_qty decimal(18,2);
    declare v_exgp_trade_capt_qty decimal(18,2);
    declare v_exgp_trade_releas_qty decimal(18,2);
    declare v_exgp_strike_capt_qty decimal(18,2);
    declare v_exgp_strike_releas_qty decimal(18,2);
    declare v_exgp_strike_frozen_qty decimal(18,2);
    declare v_exgp_strike_unfroz_qty decimal(18,2);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_intrst_pandl decimal(18,4);
    declare v_exgp_posi_update_times int;
    declare v_asac_cash_id bigint;
    declare v_asac_frozen_amt decimal(18,4);
    declare v_asac_unfroz_amt decimal(18,4);
    declare v_asac_comm_frozen_amt decimal(18,4);
    declare v_asac_comm_unfroz_amt decimal(18,4);
    declare v_asac_comm_capt_amt decimal(18,4);
    declare v_asac_comm_releas_amt decimal(18,4);
    declare v_asac_trade_frozen_amt decimal(18,4);
    declare v_asac_trade_unfroz_amt decimal(18,4);
    declare v_asac_trade_capt_amt decimal(18,4);
    declare v_asac_trade_releas_amt decimal(18,4);
    declare v_asac_strike_capt_amt decimal(18,4);
    declare v_asac_strike_releas_amt decimal(18,4);
    declare v_asac_cash_update_times int;
    declare v_asac_posi_id bigint;
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_comm_frozen_qty decimal(18,2);
    declare v_asac_comm_unfroz_qty decimal(18,2);
    declare v_asac_comm_capt_qty decimal(18,2);
    declare v_asac_comm_releas_qty decimal(18,2);
    declare v_asac_trade_frozen_qty decimal(18,2);
    declare v_asac_trade_unfroz_qty decimal(18,2);
    declare v_asac_trade_capt_qty decimal(18,2);
    declare v_asac_trade_releas_qty decimal(18,2);
    declare v_asac_strike_capt_qty decimal(18,2);
    declare v_asac_strike_releas_qty decimal(18,2);
    declare v_asac_strike_frozen_qty decimal(18,2);
    declare v_asac_strike_unfroz_qty decimal(18,2);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_asac_posi_update_times int;

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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_cash_id = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exgp_comm_frozen_amt = 0;
    SET v_exgp_comm_unfroz_amt = 0;
    SET v_exgp_comm_capt_amt = 0;
    SET v_exgp_comm_releas_amt = 0;
    SET v_exgp_trade_frozen_amt = 0;
    SET v_exgp_trade_unfroz_amt = 0;
    SET v_exgp_trade_capt_amt = 0;
    SET v_exgp_trade_releas_amt = 0;
    SET v_exgp_strike_capt_amt = 0;
    SET v_exgp_strike_releas_amt = 0;
    SET v_exgp_cash_update_times = 1;
    SET v_exgp_posi_id = 0;
    SET v_exgp_frozen_qty = 0;
    SET v_exgp_unfroz_qty = 0;
    SET v_exgp_comm_frozen_qty = 0;
    SET v_exgp_comm_unfroz_qty = 0;
    SET v_exgp_comm_capt_qty = 0;
    SET v_exgp_comm_releas_qty = 0;
    SET v_exgp_trade_frozen_qty = 0;
    SET v_exgp_trade_unfroz_qty = 0;
    SET v_exgp_trade_capt_qty = 0;
    SET v_exgp_trade_releas_qty = 0;
    SET v_exgp_strike_capt_qty = 0;
    SET v_exgp_strike_releas_qty = 0;
    SET v_exgp_strike_frozen_qty = 0;
    SET v_exgp_strike_unfroz_qty = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exgp_cost_amt = 0;
    SET v_exgp_intrst_cost_amt = 0;
    SET v_exgp_intrst_pandl = 0;
    SET v_exgp_posi_update_times = 1;
    SET v_asac_cash_id = 0;
    SET v_asac_frozen_amt = 0;
    SET v_asac_unfroz_amt = 0;
    SET v_asac_comm_frozen_amt = 0;
    SET v_asac_comm_unfroz_amt = 0;
    SET v_asac_comm_capt_amt = 0;
    SET v_asac_comm_releas_amt = 0;
    SET v_asac_trade_frozen_amt = 0;
    SET v_asac_trade_unfroz_amt = 0;
    SET v_asac_trade_capt_amt = 0;
    SET v_asac_trade_releas_amt = 0;
    SET v_asac_strike_capt_amt = 0;
    SET v_asac_strike_releas_amt = 0;
    SET v_asac_cash_update_times = 1;
    SET v_asac_posi_id = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_comm_frozen_qty = 0;
    SET v_asac_comm_unfroz_qty = 0;
    SET v_asac_comm_capt_qty = 0;
    SET v_asac_comm_releas_qty = 0;
    SET v_asac_trade_frozen_qty = 0;
    SET v_asac_trade_unfroz_qty = 0;
    SET v_asac_trade_capt_qty = 0;
    SET v_asac_trade_releas_qty = 0;
    SET v_asac_strike_capt_qty = 0;
    SET v_asac_strike_releas_qty = 0;
    SET v_asac_strike_frozen_qty = 0;
    SET v_asac_strike_unfroz_qty = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_asac_posi_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取资金持仓信息】*/
    call db_tdsecu.pra_tdsephif_GetCashPosi(
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
        v_stock_acco_no,
        v_stock_code_no,
        v_exch_crncy_type,
        v_error_code,
        v_error_info,
        v_exgp_cash_id,
        v_exgp_frozen_amt,
        v_exgp_unfroz_amt,
        v_exgp_comm_frozen_amt,
        v_exgp_comm_unfroz_amt,
        v_exgp_comm_capt_amt,
        v_exgp_comm_releas_amt,
        v_exgp_trade_frozen_amt,
        v_exgp_trade_unfroz_amt,
        v_exgp_trade_capt_amt,
        v_exgp_trade_releas_amt,
        v_exgp_strike_capt_amt,
        v_exgp_strike_releas_amt,
        v_exgp_cash_update_times,
        v_exgp_posi_id,
        v_exgp_frozen_qty,
        v_exgp_unfroz_qty,
        v_exgp_comm_frozen_qty,
        v_exgp_comm_unfroz_qty,
        v_exgp_comm_capt_qty,
        v_exgp_comm_releas_qty,
        v_exgp_trade_frozen_qty,
        v_exgp_trade_unfroz_qty,
        v_exgp_trade_capt_qty,
        v_exgp_trade_releas_qty,
        v_exgp_strike_capt_qty,
        v_exgp_strike_releas_qty,
        v_exgp_strike_frozen_qty,
        v_exgp_strike_unfroz_qty,
        v_exgp_realize_pandl,
        v_exgp_cost_amt,
        v_exgp_intrst_cost_amt,
        v_exgp_intrst_pandl,
        v_exgp_posi_update_times,
        v_asac_cash_id,
        v_asac_frozen_amt,
        v_asac_unfroz_amt,
        v_asac_comm_frozen_amt,
        v_asac_comm_unfroz_amt,
        v_asac_comm_capt_amt,
        v_asac_comm_releas_amt,
        v_asac_trade_frozen_amt,
        v_asac_trade_unfroz_amt,
        v_asac_trade_capt_amt,
        v_asac_trade_releas_amt,
        v_asac_strike_capt_amt,
        v_asac_strike_releas_amt,
        v_asac_cash_update_times,
        v_asac_posi_id,
        v_asac_frozen_qty,
        v_asac_unfroz_qty,
        v_asac_comm_frozen_qty,
        v_asac_comm_unfroz_qty,
        v_asac_comm_capt_qty,
        v_asac_comm_releas_qty,
        v_asac_trade_frozen_qty,
        v_asac_trade_unfroz_qty,
        v_asac_trade_capt_qty,
        v_asac_trade_releas_qty,
        v_asac_strike_capt_qty,
        v_asac_strike_releas_qty,
        v_asac_strike_frozen_qty,
        v_asac_strike_unfroz_qty,
        v_asac_realize_pandl,
        v_asac_cost_amt,
        v_asac_intrst_cost_amt,
        v_asac_intrst_pandl,
        v_asac_posi_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取资金持仓信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_cash_id = v_exgp_cash_id;
    SET p_exgp_frozen_amt = v_exgp_frozen_amt;
    SET p_exgp_unfroz_amt = v_exgp_unfroz_amt;
    SET p_exgp_comm_frozen_amt = v_exgp_comm_frozen_amt;
    SET p_exgp_comm_unfroz_amt = v_exgp_comm_unfroz_amt;
    SET p_exgp_comm_capt_amt = v_exgp_comm_capt_amt;
    SET p_exgp_comm_releas_amt = v_exgp_comm_releas_amt;
    SET p_exgp_trade_frozen_amt = v_exgp_trade_frozen_amt;
    SET p_exgp_trade_unfroz_amt = v_exgp_trade_unfroz_amt;
    SET p_exgp_trade_capt_amt = v_exgp_trade_capt_amt;
    SET p_exgp_trade_releas_amt = v_exgp_trade_releas_amt;
    SET p_exgp_strike_capt_amt = v_exgp_strike_capt_amt;
    SET p_exgp_strike_releas_amt = v_exgp_strike_releas_amt;
    SET p_exgp_cash_update_times = v_exgp_cash_update_times;
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_comm_frozen_qty = v_exgp_comm_frozen_qty;
    SET p_exgp_comm_unfroz_qty = v_exgp_comm_unfroz_qty;
    SET p_exgp_comm_capt_qty = v_exgp_comm_capt_qty;
    SET p_exgp_comm_releas_qty = v_exgp_comm_releas_qty;
    SET p_exgp_trade_frozen_qty = v_exgp_trade_frozen_qty;
    SET p_exgp_trade_unfroz_qty = v_exgp_trade_unfroz_qty;
    SET p_exgp_trade_capt_qty = v_exgp_trade_capt_qty;
    SET p_exgp_trade_releas_qty = v_exgp_trade_releas_qty;
    SET p_exgp_strike_capt_qty = v_exgp_strike_capt_qty;
    SET p_exgp_strike_releas_qty = v_exgp_strike_releas_qty;
    SET p_exgp_strike_frozen_qty = v_exgp_strike_frozen_qty;
    SET p_exgp_strike_unfroz_qty = v_exgp_strike_unfroz_qty;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_intrst_pandl = v_exgp_intrst_pandl;
    SET p_exgp_posi_update_times = v_exgp_posi_update_times;
    SET p_asac_cash_id = v_asac_cash_id;
    SET p_asac_frozen_amt = v_asac_frozen_amt;
    SET p_asac_unfroz_amt = v_asac_unfroz_amt;
    SET p_asac_comm_frozen_amt = v_asac_comm_frozen_amt;
    SET p_asac_comm_unfroz_amt = v_asac_comm_unfroz_amt;
    SET p_asac_comm_capt_amt = v_asac_comm_capt_amt;
    SET p_asac_comm_releas_amt = v_asac_comm_releas_amt;
    SET p_asac_trade_frozen_amt = v_asac_trade_frozen_amt;
    SET p_asac_trade_unfroz_amt = v_asac_trade_unfroz_amt;
    SET p_asac_trade_capt_amt = v_asac_trade_capt_amt;
    SET p_asac_trade_releas_amt = v_asac_trade_releas_amt;
    SET p_asac_strike_capt_amt = v_asac_strike_capt_amt;
    SET p_asac_strike_releas_amt = v_asac_strike_releas_amt;
    SET p_asac_cash_update_times = v_asac_cash_update_times;
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_comm_frozen_qty = v_asac_comm_frozen_qty;
    SET p_asac_comm_unfroz_qty = v_asac_comm_unfroz_qty;
    SET p_asac_comm_capt_qty = v_asac_comm_capt_qty;
    SET p_asac_comm_releas_qty = v_asac_comm_releas_qty;
    SET p_asac_trade_frozen_qty = v_asac_trade_frozen_qty;
    SET p_asac_trade_unfroz_qty = v_asac_trade_unfroz_qty;
    SET p_asac_trade_capt_qty = v_asac_trade_capt_qty;
    SET p_asac_trade_releas_qty = v_asac_trade_releas_qty;
    SET p_asac_strike_capt_qty = v_asac_strike_capt_qty;
    SET p_asac_strike_releas_qty = v_asac_strike_releas_qty;
    SET p_asac_strike_frozen_qty = v_asac_strike_frozen_qty;
    SET p_asac_strike_unfroz_qty = v_asac_strike_unfroz_qty;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_intrst_pandl = v_asac_intrst_pandl;
    SET p_asac_posi_update_times = v_asac_posi_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取汇总订单成交信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetSumOrderStrike;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetSumOrderStrike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_order_batch_no int,
    IN p_strike_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_sum_order_row_id bigint,
    OUT p_sum_order_opor_no int,
    OUT p_sum_order_co_no int,
    OUT p_sum_order_pd_no int,
    OUT p_sum_order_exch_group_no int,
    OUT p_sum_order_asset_acco_no int,
    OUT p_sum_order_pass_no int,
    OUT p_sum_order_exch_crncy_type varchar(3),
    OUT p_sum_order_stock_code_no int,
    OUT p_sum_order_trade_code_no int,
    OUT p_sum_order_target_code_no int,
    OUT p_sum_order_external_no bigint,
    OUT p_sum_order_date int,
    OUT p_sum_order_batch_no int,
    OUT p_sum_order_dir int,
    OUT p_sum_order_price_type int,
    OUT p_sum_order_price decimal(16,9),
    OUT p_sum_order_qty decimal(18,2),
    OUT p_order_sum_status varchar(2),
    OUT p_sum_order_wtdraw_qty decimal(18,2),
    OUT p_sum_order_waste_qty decimal(18,2),
    OUT p_sum_order_strike_amt decimal(18,4),
    OUT p_sum_order_strike_qty decimal(18,2),
    OUT p_sum_order_strike_aver_price decimal(16,9),
    OUT p_sum_order_net_price_flag int,
    OUT p_sum_order_bond_accr_intrst decimal(18,12),
    OUT p_sum_order_bond_rate_type int,
    OUT p_sum_order_par_value decimal(16,9),
    OUT p_sum_order_impawn_ratio decimal(18,12),
    OUT p_sum_order_oper_way varchar(2),
    OUT p_sum_order_update_times int,
    OUT p_sum_strike_row_id bigint,
    OUT p_sum_strike_opor_no int,
    OUT p_sum_strike_co_no int,
    OUT p_sum_strike_pd_no int,
    OUT p_sum_strike_exch_group_no int,
    OUT p_sum_strike_asset_acco_no int,
    OUT p_sum_strike_pass_no int,
    OUT p_sum_strike_out_acco varchar(32),
    OUT p_sum_strike_stock_acco_no int,
    OUT p_sum_strike_stock_code_no int,
    OUT p_sum_strike_comm_id bigint,
    OUT p_sum_strike_report_date int,
    OUT p_sum_strike_report_no varchar(32),
    OUT p_sum_strike_order_date int,
    OUT p_sum_strike_order_id bigint,
    OUT p_sum_strike_order_dir int,
    OUT p_sum_strike_order_price decimal(16,9),
    OUT p_sum_strike_order_qty decimal(18,2),
    OUT p_sum_strike_strike_qty decimal(18,2),
    OUT p_sum_strike_strike_amt decimal(18,4),
    OUT p_sum_strike_all_fee decimal(18,4),
    OUT p_sum_strike_stamp_tax decimal(18,4),
    OUT p_sum_strike_trans_fee decimal(18,4),
    OUT p_sum_strike_brkage_fee decimal(18,4),
    OUT p_sum_strike_SEC_charges decimal(18,4),
    OUT p_sum_strike_other_fee decimal(18,4),
    OUT p_sum_strike_trade_commis decimal(18,4),
    OUT p_sum_strike_other_commis decimal(18,4),
    OUT p_sum_trade_tax decimal(18,4),
    OUT p_sum_trade_cost_fee decimal(18,4),
    OUT p_sum_trade_system_use_fee decimal(18,4),
    OUT p_sum_stock_settle_fee decimal(18,4),
    OUT p_sum_strike_net_price_flag int,
    OUT p_sum_strike_bond_accr_intrst decimal(18,4),
    OUT p_sum_strike_bond_rate_type int,
    OUT p_sum_strike_order_oper_way varchar(2),
    OUT p_sum_strike_exter_comm_flag int,
    OUT p_sum_strike_update_times int,
    OUT p_sum_strike_order_batch_no int,
    OUT p_sum_external_no bigint
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
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_order_batch_no int;
    declare v_strike_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sum_order_row_id bigint;
    declare v_sum_order_opor_no int;
    declare v_sum_order_co_no int;
    declare v_sum_order_pd_no int;
    declare v_sum_order_exch_group_no int;
    declare v_sum_order_asset_acco_no int;
    declare v_sum_order_pass_no int;
    declare v_sum_order_exch_crncy_type varchar(3);
    declare v_sum_order_stock_code_no int;
    declare v_sum_order_trade_code_no int;
    declare v_sum_order_target_code_no int;
    declare v_sum_order_external_no bigint;
    declare v_sum_order_date int;
    declare v_sum_order_batch_no int;
    declare v_sum_order_dir int;
    declare v_sum_order_price_type int;
    declare v_sum_order_price decimal(16,9);
    declare v_sum_order_qty decimal(18,2);
    declare v_order_sum_status varchar(2);
    declare v_sum_order_wtdraw_qty decimal(18,2);
    declare v_sum_order_waste_qty decimal(18,2);
    declare v_sum_order_strike_amt decimal(18,4);
    declare v_sum_order_strike_qty decimal(18,2);
    declare v_sum_order_strike_aver_price decimal(16,9);
    declare v_sum_order_net_price_flag int;
    declare v_sum_order_bond_accr_intrst decimal(18,12);
    declare v_sum_order_bond_rate_type int;
    declare v_sum_order_par_value decimal(16,9);
    declare v_sum_order_impawn_ratio decimal(18,12);
    declare v_sum_order_oper_way varchar(2);
    declare v_sum_order_update_times int;
    declare v_sum_strike_row_id bigint;
    declare v_sum_strike_opor_no int;
    declare v_sum_strike_co_no int;
    declare v_sum_strike_pd_no int;
    declare v_sum_strike_exch_group_no int;
    declare v_sum_strike_asset_acco_no int;
    declare v_sum_strike_pass_no int;
    declare v_sum_strike_out_acco varchar(32);
    declare v_sum_strike_stock_acco_no int;
    declare v_sum_strike_stock_code_no int;
    declare v_sum_strike_comm_id bigint;
    declare v_sum_strike_report_date int;
    declare v_sum_strike_report_no varchar(32);
    declare v_sum_strike_order_date int;
    declare v_sum_strike_order_id bigint;
    declare v_sum_strike_order_dir int;
    declare v_sum_strike_order_price decimal(16,9);
    declare v_sum_strike_order_qty decimal(18,2);
    declare v_sum_strike_strike_qty decimal(18,2);
    declare v_sum_strike_strike_amt decimal(18,4);
    declare v_sum_strike_all_fee decimal(18,4);
    declare v_sum_strike_stamp_tax decimal(18,4);
    declare v_sum_strike_trans_fee decimal(18,4);
    declare v_sum_strike_brkage_fee decimal(18,4);
    declare v_sum_strike_SEC_charges decimal(18,4);
    declare v_sum_strike_other_fee decimal(18,4);
    declare v_sum_strike_trade_commis decimal(18,4);
    declare v_sum_strike_other_commis decimal(18,4);
    declare v_sum_trade_tax decimal(18,4);
    declare v_sum_trade_cost_fee decimal(18,4);
    declare v_sum_trade_system_use_fee decimal(18,4);
    declare v_sum_stock_settle_fee decimal(18,4);
    declare v_sum_strike_net_price_flag int;
    declare v_sum_strike_bond_accr_intrst decimal(18,4);
    declare v_sum_strike_bond_rate_type int;
    declare v_sum_strike_order_oper_way varchar(2);
    declare v_sum_strike_exter_comm_flag int;
    declare v_sum_strike_update_times int;
    declare v_sum_strike_order_batch_no int;
    declare v_sum_external_no bigint;

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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_order_batch_no = p_order_batch_no;
    SET v_strike_id = p_strike_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sum_order_row_id = 0;
    SET v_sum_order_opor_no = 0;
    SET v_sum_order_co_no = 0;
    SET v_sum_order_pd_no = 0;
    SET v_sum_order_exch_group_no = 0;
    SET v_sum_order_asset_acco_no = 0;
    SET v_sum_order_pass_no = 0;
    SET v_sum_order_exch_crncy_type = "CNY";
    SET v_sum_order_stock_code_no = 0;
    SET v_sum_order_trade_code_no = 0;
    SET v_sum_order_target_code_no = 0;
    SET v_sum_order_external_no = 0;
    SET v_sum_order_date = date_format(curdate(),'%Y%m%d');
    SET v_sum_order_batch_no = 0;
    SET v_sum_order_dir = 0;
    SET v_sum_order_price_type = 0;
    SET v_sum_order_price = 0;
    SET v_sum_order_qty = 0;
    SET v_order_sum_status = "0";
    SET v_sum_order_wtdraw_qty = 0;
    SET v_sum_order_waste_qty = 0;
    SET v_sum_order_strike_amt = 0;
    SET v_sum_order_strike_qty = 0;
    SET v_sum_order_strike_aver_price = 0;
    SET v_sum_order_net_price_flag = 0;
    SET v_sum_order_bond_accr_intrst = 0;
    SET v_sum_order_bond_rate_type = 0;
    SET v_sum_order_par_value = 0;
    SET v_sum_order_impawn_ratio = 0;
    SET v_sum_order_oper_way = " ";
    SET v_sum_order_update_times = 1;
    SET v_sum_strike_row_id = 0;
    SET v_sum_strike_opor_no = 0;
    SET v_sum_strike_co_no = 0;
    SET v_sum_strike_pd_no = 0;
    SET v_sum_strike_exch_group_no = 0;
    SET v_sum_strike_asset_acco_no = 0;
    SET v_sum_strike_pass_no = 0;
    SET v_sum_strike_out_acco = " ";
    SET v_sum_strike_stock_acco_no = 0;
    SET v_sum_strike_stock_code_no = 0;
    SET v_sum_strike_comm_id = 0;
    SET v_sum_strike_report_date = date_format(curdate(),'%Y%m%d');
    SET v_sum_strike_report_no = " ";
    SET v_sum_strike_order_date = date_format(curdate(),'%Y%m%d');
    SET v_sum_strike_order_id = 0;
    SET v_sum_strike_order_dir = 0;
    SET v_sum_strike_order_price = 0;
    SET v_sum_strike_order_qty = 0;
    SET v_sum_strike_strike_qty = 0;
    SET v_sum_strike_strike_amt = 0;
    SET v_sum_strike_all_fee = 0;
    SET v_sum_strike_stamp_tax = 0;
    SET v_sum_strike_trans_fee = 0;
    SET v_sum_strike_brkage_fee = 0;
    SET v_sum_strike_SEC_charges = 0;
    SET v_sum_strike_other_fee = 0;
    SET v_sum_strike_trade_commis = 0;
    SET v_sum_strike_other_commis = 0;
    SET v_sum_trade_tax = 0;
    SET v_sum_trade_cost_fee = 0;
    SET v_sum_trade_system_use_fee = 0;
    SET v_sum_stock_settle_fee = 0;
    SET v_sum_strike_net_price_flag = 0;
    SET v_sum_strike_bond_accr_intrst = 0;
    SET v_sum_strike_bond_rate_type = 0;
    SET v_sum_strike_order_oper_way = " ";
    SET v_sum_strike_exter_comm_flag = 0;
    SET v_sum_strike_update_times = 1;
    SET v_sum_strike_order_batch_no = 0;
    SET v_sum_external_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取汇总订单成交信息】*/
    call db_tdsecu.pra_tdsephif_GetSumOrderStrike(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_order_date,
        v_order_id,
        v_order_batch_no,
        v_strike_id,
        v_error_code,
        v_error_info,
        v_sum_order_row_id,
        v_sum_order_opor_no,
        v_sum_order_co_no,
        v_sum_order_pd_no,
        v_sum_order_exch_group_no,
        v_sum_order_asset_acco_no,
        v_sum_order_pass_no,
        v_sum_order_exch_crncy_type,
        v_sum_order_stock_code_no,
        v_sum_order_trade_code_no,
        v_sum_order_target_code_no,
        v_sum_order_external_no,
        v_sum_order_date,
        v_sum_order_batch_no,
        v_sum_order_dir,
        v_sum_order_price_type,
        v_sum_order_price,
        v_sum_order_qty,
        v_order_sum_status,
        v_sum_order_wtdraw_qty,
        v_sum_order_waste_qty,
        v_sum_order_strike_amt,
        v_sum_order_strike_qty,
        v_sum_order_strike_aver_price,
        v_sum_order_net_price_flag,
        v_sum_order_bond_accr_intrst,
        v_sum_order_bond_rate_type,
        v_sum_order_par_value,
        v_sum_order_impawn_ratio,
        v_sum_order_oper_way,
        v_sum_order_update_times,
        v_sum_strike_row_id,
        v_sum_strike_opor_no,
        v_sum_strike_co_no,
        v_sum_strike_pd_no,
        v_sum_strike_exch_group_no,
        v_sum_strike_asset_acco_no,
        v_sum_strike_pass_no,
        v_sum_strike_out_acco,
        v_sum_strike_stock_acco_no,
        v_sum_strike_stock_code_no,
        v_sum_strike_comm_id,
        v_sum_strike_report_date,
        v_sum_strike_report_no,
        v_sum_strike_order_date,
        v_sum_strike_order_id,
        v_sum_strike_order_dir,
        v_sum_strike_order_price,
        v_sum_strike_order_qty,
        v_sum_strike_strike_qty,
        v_sum_strike_strike_amt,
        v_sum_strike_all_fee,
        v_sum_strike_stamp_tax,
        v_sum_strike_trans_fee,
        v_sum_strike_brkage_fee,
        v_sum_strike_SEC_charges,
        v_sum_strike_other_fee,
        v_sum_strike_trade_commis,
        v_sum_strike_other_commis,
        v_sum_trade_tax,
        v_sum_trade_cost_fee,
        v_sum_trade_system_use_fee,
        v_sum_stock_settle_fee,
        v_sum_strike_net_price_flag,
        v_sum_strike_bond_accr_intrst,
        v_sum_strike_bond_rate_type,
        v_sum_strike_order_oper_way,
        v_sum_strike_exter_comm_flag,
        v_sum_strike_update_times,
        v_sum_strike_order_batch_no,
        v_sum_external_no);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取汇总订单成交信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_sum_order_row_id = v_sum_order_row_id;
    SET p_sum_order_opor_no = v_sum_order_opor_no;
    SET p_sum_order_co_no = v_sum_order_co_no;
    SET p_sum_order_pd_no = v_sum_order_pd_no;
    SET p_sum_order_exch_group_no = v_sum_order_exch_group_no;
    SET p_sum_order_asset_acco_no = v_sum_order_asset_acco_no;
    SET p_sum_order_pass_no = v_sum_order_pass_no;
    SET p_sum_order_exch_crncy_type = v_sum_order_exch_crncy_type;
    SET p_sum_order_stock_code_no = v_sum_order_stock_code_no;
    SET p_sum_order_trade_code_no = v_sum_order_trade_code_no;
    SET p_sum_order_target_code_no = v_sum_order_target_code_no;
    SET p_sum_order_external_no = v_sum_order_external_no;
    SET p_sum_order_date = v_sum_order_date;
    SET p_sum_order_batch_no = v_sum_order_batch_no;
    SET p_sum_order_dir = v_sum_order_dir;
    SET p_sum_order_price_type = v_sum_order_price_type;
    SET p_sum_order_price = v_sum_order_price;
    SET p_sum_order_qty = v_sum_order_qty;
    SET p_order_sum_status = v_order_sum_status;
    SET p_sum_order_wtdraw_qty = v_sum_order_wtdraw_qty;
    SET p_sum_order_waste_qty = v_sum_order_waste_qty;
    SET p_sum_order_strike_amt = v_sum_order_strike_amt;
    SET p_sum_order_strike_qty = v_sum_order_strike_qty;
    SET p_sum_order_strike_aver_price = v_sum_order_strike_aver_price;
    SET p_sum_order_net_price_flag = v_sum_order_net_price_flag;
    SET p_sum_order_bond_accr_intrst = v_sum_order_bond_accr_intrst;
    SET p_sum_order_bond_rate_type = v_sum_order_bond_rate_type;
    SET p_sum_order_par_value = v_sum_order_par_value;
    SET p_sum_order_impawn_ratio = v_sum_order_impawn_ratio;
    SET p_sum_order_oper_way = v_sum_order_oper_way;
    SET p_sum_order_update_times = v_sum_order_update_times;
    SET p_sum_strike_row_id = v_sum_strike_row_id;
    SET p_sum_strike_opor_no = v_sum_strike_opor_no;
    SET p_sum_strike_co_no = v_sum_strike_co_no;
    SET p_sum_strike_pd_no = v_sum_strike_pd_no;
    SET p_sum_strike_exch_group_no = v_sum_strike_exch_group_no;
    SET p_sum_strike_asset_acco_no = v_sum_strike_asset_acco_no;
    SET p_sum_strike_pass_no = v_sum_strike_pass_no;
    SET p_sum_strike_out_acco = v_sum_strike_out_acco;
    SET p_sum_strike_stock_acco_no = v_sum_strike_stock_acco_no;
    SET p_sum_strike_stock_code_no = v_sum_strike_stock_code_no;
    SET p_sum_strike_comm_id = v_sum_strike_comm_id;
    SET p_sum_strike_report_date = v_sum_strike_report_date;
    SET p_sum_strike_report_no = v_sum_strike_report_no;
    SET p_sum_strike_order_date = v_sum_strike_order_date;
    SET p_sum_strike_order_id = v_sum_strike_order_id;
    SET p_sum_strike_order_dir = v_sum_strike_order_dir;
    SET p_sum_strike_order_price = v_sum_strike_order_price;
    SET p_sum_strike_order_qty = v_sum_strike_order_qty;
    SET p_sum_strike_strike_qty = v_sum_strike_strike_qty;
    SET p_sum_strike_strike_amt = v_sum_strike_strike_amt;
    SET p_sum_strike_all_fee = v_sum_strike_all_fee;
    SET p_sum_strike_stamp_tax = v_sum_strike_stamp_tax;
    SET p_sum_strike_trans_fee = v_sum_strike_trans_fee;
    SET p_sum_strike_brkage_fee = v_sum_strike_brkage_fee;
    SET p_sum_strike_SEC_charges = v_sum_strike_SEC_charges;
    SET p_sum_strike_other_fee = v_sum_strike_other_fee;
    SET p_sum_strike_trade_commis = v_sum_strike_trade_commis;
    SET p_sum_strike_other_commis = v_sum_strike_other_commis;
    SET p_sum_trade_tax = v_sum_trade_tax;
    SET p_sum_trade_cost_fee = v_sum_trade_cost_fee;
    SET p_sum_trade_system_use_fee = v_sum_trade_system_use_fee;
    SET p_sum_stock_settle_fee = v_sum_stock_settle_fee;
    SET p_sum_strike_net_price_flag = v_sum_strike_net_price_flag;
    SET p_sum_strike_bond_accr_intrst = v_sum_strike_bond_accr_intrst;
    SET p_sum_strike_bond_rate_type = v_sum_strike_bond_rate_type;
    SET p_sum_strike_order_oper_way = v_sum_strike_order_oper_way;
    SET p_sum_strike_exter_comm_flag = v_sum_strike_exter_comm_flag;
    SET p_sum_strike_update_times = v_sum_strike_update_times;
    SET p_sum_strike_order_batch_no = v_sum_strike_order_batch_no;
    SET p_sum_external_no = v_sum_external_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_循环获取订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_LoopGetOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_LoopGetOrderInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_date int,
    IN p_order_id_str varchar(2048),
    IN p_record_count int,
    IN p_split_str varchar(4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_id bigint,
    OUT p_busi_opor_no int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_pass_no int,
    OUT p_external_no bigint,
    OUT p_out_acco varchar(32),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_stock_code varchar(6),
    OUT p_stock_acco varchar(16),
    OUT p_comm_date int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_order_batch_no int,
    OUT p_order_dir int,
    OUT p_order_qty decimal(18,2),
    OUT p_order_price decimal(16,9),
    OUT p_order_time int,
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_rsp_info varchar(255),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_price_type int,
    OUT p_order_oper_way varchar(2),
    OUT p_order_status varchar(2),
    OUT p_comm_opor int,
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_net_price_flag int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
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
    declare v_order_date int;
    declare v_order_id_str varchar(2048);
    declare v_record_count int;
    declare v_split_str varchar(4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_id bigint;
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_pass_no int;
    declare v_external_no bigint;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_acco varchar(16);
    declare v_comm_date int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_order_time int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_rsp_info varchar(255);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_price_type int;
    declare v_order_oper_way varchar(2);
    declare v_order_status varchar(2);
    declare v_comm_opor int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
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
    SET v_order_date = p_order_date;
    SET v_order_id_str = p_order_id_str;
    SET v_record_count = p_record_count;
    SET v_split_str = p_split_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_id = 0;
    SET v_busi_opor_no = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_pass_no = 0;
    SET v_external_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_stock_acco = " ";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_order_batch_no = 0;
    SET v_order_dir = 0;
    SET v_order_qty = 0;
    SET v_order_price = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_wtdraw_qty = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_rsp_info = " ";
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_price_type = 0;
    SET v_order_oper_way = " ";
    SET v_order_status = "0";
    SET v_comm_opor = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_net_price_flag = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @订单序号# = cast(SUBSTRING_INDEX(substring_index(@订单序号串#, @分隔符#, @记录个数#),@分隔符#,-1) as SIGNED); */
    set v_order_id = cast(SUBSTRING_INDEX(substring_index(v_order_id_str, v_split_str, v_record_count),v_split_str,-1) as SIGNED);
    #[检查报错返回][@订单序号# = 0][4][@订单序号#]

    /* 调用【原子_交易证券_主推接口_循环获取订单信息】*/
    call db_tdsecu.pra_tdsephif_LoopGetOrderInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_date,
        v_order_id,
        v_error_code,
        v_error_info,
        v_busi_opor_no,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_pass_no,
        v_external_no,
        v_out_acco,
        v_exch_crncy_type,
        v_exch_no,
        v_stock_code,
        v_stock_acco,
        v_comm_date,
        v_comm_id,
        v_comm_batch_no,
        v_comm_executor,
        v_order_batch_no,
        v_order_dir,
        v_order_qty,
        v_order_price,
        v_order_time,
        v_wtdraw_qty,
        v_report_date,
        v_report_time,
        v_report_no,
        v_par_value,
        v_impawn_ratio,
        v_rsp_info,
        v_strike_amt,
        v_strike_qty,
        v_strike_bond_accr_intrst,
        v_price_type,
        v_order_oper_way,
        v_order_status,
        v_comm_opor,
        v_order_frozen_amt,
        v_order_frozen_qty,
        v_net_price_flag,
        v_bond_accr_intrst,
        v_bond_rate_type,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_循环获取订单信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_id = v_order_id;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_pass_no = v_pass_no;
    SET p_external_no = v_external_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_acco = v_stock_acco;
    SET p_comm_date = v_comm_date;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_dir = v_order_dir;
    SET p_order_qty = v_order_qty;
    SET p_order_price = v_order_price;
    SET p_order_time = v_order_time;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_rsp_info = v_rsp_info;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_price_type = v_price_type;
    SET p_order_oper_way = v_order_oper_way;
    SET p_order_status = v_order_status;
    SET p_comm_opor = v_comm_opor;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_net_price_flag = v_net_price_flag;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_循环获取撤单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_LoopGetCancelInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_LoopGetCancelInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_wtdraw_id_str varchar(2048),
    IN p_record_count int,
    IN p_split_str varchar(4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_code varchar(6),
    OUT p_wtdraw_date int,
    OUT p_wtdraw_time int,
    OUT p_order_date int,
    OUT p_order_id bigint,
    OUT p_report_no varchar(32),
    OUT p_wtdraw_status varchar(2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_wtdraw_id_str varchar(2048);
    declare v_record_count int;
    declare v_split_str varchar(4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_wtdraw_date int;
    declare v_wtdraw_time int;
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_report_no varchar(32);
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_id bigint;

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
    SET v_wtdraw_id_str = p_wtdraw_id_str;
    SET v_record_count = p_record_count;
    SET v_split_str = p_split_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_wtdraw_date = date_format(curdate(),'%Y%m%d');
    SET v_wtdraw_time = date_format(curtime(),'%H%i%s');
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_id = 0;
    SET v_report_no = " ";
    SET v_wtdraw_status = "0";
    SET v_wtdraw_id = 0;

    
    label_pro:BEGIN
    

    /* set @撤单序号# = cast(SUBSTRING_INDEX(substring_index(@撤单序号串#, @分隔符#, @记录个数#),@分隔符#,-1) as SIGNED); */
    set v_wtdraw_id = cast(SUBSTRING_INDEX(substring_index(v_wtdraw_id_str, v_split_str, v_record_count),v_split_str,-1) as SIGNED);
    #[检查报错返回][@撤单序号# = 0][4][@撤单序号#]

    /* 调用【原子_交易证券_主推接口_循环获取撤单信息】*/
    call db_tdsecu.pra_tdsephif_LoopGetCancelInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_wtdraw_id,
        v_error_code,
        v_error_info,
        v_init_date,
        v_asset_acco_no,
        v_pass_no,
        v_out_acco,
        v_exch_no,
        v_stock_acco,
        v_stock_code,
        v_wtdraw_date,
        v_wtdraw_time,
        v_order_date,
        v_order_id,
        v_report_no,
        v_wtdraw_status);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.23.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_循环获取撤单信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_code = v_stock_code;
    SET p_wtdraw_date = v_wtdraw_date;
    SET p_wtdraw_time = v_wtdraw_time;
    SET p_order_date = v_order_date;
    SET p_order_id = v_order_id;
    SET p_report_no = v_report_no;
    SET p_wtdraw_status = v_wtdraw_status;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_循环获取指令信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_LoopGetCommInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_LoopGetCommInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_id_str varchar(2048),
    IN p_record_count int,
    IN p_split_str varchar(4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_crncy_type varchar(3),
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_comm_id bigint,
    OUT p_comm_time int,
    OUT p_comm_opor int,
    OUT p_comm_dir int,
    OUT p_comm_limit_price decimal(16,9),
    OUT p_comm_qty decimal(18,2),
    OUT p_comm_amt decimal(18,4),
    OUT p_order_qty decimal(18,2),
    OUT p_comm_cancel_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_comm_frozen_amt decimal(18,4),
    OUT p_comm_frozen_qty decimal(18,2),
    OUT p_strike_status varchar(2),
    OUT p_comm_status varchar(2),
    OUT p_comm_begin_date int,
    OUT p_comm_end_date int,
    OUT p_comm_begin_time int,
    OUT p_comm_end_time int,
    OUT p_comm_comple_date int,
    OUT p_comm_comple_time int,
    OUT p_comm_appr_date int,
    OUT p_comm_appr_time int,
    OUT p_comm_appr_status varchar(2),
    OUT p_comm_appr_oper int,
    OUT p_comm_appr_remark varchar(255),
    OUT p_basket_id bigint,
    OUT p_net_price_flag int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_comm_oper_way varchar(2),
    OUT p_exter_comm_flag int,
    OUT p_comm_comple_flag int,
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
    declare v_comm_id_str varchar(2048);
    declare v_record_count int;
    declare v_split_str varchar(4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_comm_id bigint;
    declare v_comm_time int;
    declare v_comm_opor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_strike_status varchar(2);
    declare v_comm_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_appr_status varchar(2);
    declare v_comm_appr_oper int;
    declare v_comm_appr_remark varchar(255);
    declare v_basket_id bigint;
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_comm_comple_flag int;
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
    SET v_comm_id_str = p_comm_id_str;
    SET v_record_count = p_record_count;
    SET v_split_str = p_split_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_comm_id = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_opor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_strike_status = "0";
    SET v_comm_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_status = " ";
    SET v_comm_appr_oper = 0;
    SET v_comm_appr_remark = " ";
    SET v_basket_id = 0;
    SET v_net_price_flag = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_comm_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_comm_comple_flag = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @指令序号# = cast(SUBSTRING_INDEX(substring_index(@指令序号串#, @分隔符#, @记录个数#),@分隔符#,-1) as SIGNED); */
    set v_comm_id = cast(SUBSTRING_INDEX(substring_index(v_comm_id_str, v_split_str, v_record_count),v_split_str,-1) as SIGNED);
    #[检查报错返回][@指令序号# = 0][4][@指令序号#]

    /* 调用【原子_交易证券_主推接口_循环获取指令信息】*/
    call db_tdsecu.pra_tdsephif_LoopGetCommInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_id,
        v_error_code,
        v_error_info,
        v_init_date,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_pass_no,
        v_out_acco,
        v_exch_crncy_type,
        v_stock_acco_no,
        v_stock_code_no,
        v_comm_time,
        v_comm_opor,
        v_comm_dir,
        v_comm_limit_price,
        v_comm_qty,
        v_comm_amt,
        v_order_qty,
        v_comm_cancel_qty,
        v_strike_amt,
        v_strike_qty,
        v_comm_frozen_amt,
        v_comm_frozen_qty,
        v_strike_status,
        v_comm_status,
        v_comm_begin_date,
        v_comm_end_date,
        v_comm_begin_time,
        v_comm_end_time,
        v_comm_comple_date,
        v_comm_comple_time,
        v_comm_appr_date,
        v_comm_appr_time,
        v_comm_appr_status,
        v_comm_appr_oper,
        v_comm_appr_remark,
        v_basket_id,
        v_net_price_flag,
        v_bond_accr_intrst,
        v_bond_rate_type,
        v_comm_oper_way,
        v_exter_comm_flag,
        v_comm_comple_flag,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.24.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_循环获取指令信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_comm_id = v_comm_id;
    SET p_comm_time = v_comm_time;
    SET p_comm_opor = v_comm_opor;
    SET p_comm_dir = v_comm_dir;
    SET p_comm_limit_price = v_comm_limit_price;
    SET p_comm_qty = v_comm_qty;
    SET p_comm_amt = v_comm_amt;
    SET p_order_qty = v_order_qty;
    SET p_comm_cancel_qty = v_comm_cancel_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_comm_frozen_amt = v_comm_frozen_amt;
    SET p_comm_frozen_qty = v_comm_frozen_qty;
    SET p_strike_status = v_strike_status;
    SET p_comm_status = v_comm_status;
    SET p_comm_begin_date = v_comm_begin_date;
    SET p_comm_end_date = v_comm_end_date;
    SET p_comm_begin_time = v_comm_begin_time;
    SET p_comm_end_time = v_comm_end_time;
    SET p_comm_comple_date = v_comm_comple_date;
    SET p_comm_comple_time = v_comm_comple_time;
    SET p_comm_appr_date = v_comm_appr_date;
    SET p_comm_appr_time = v_comm_appr_time;
    SET p_comm_appr_status = v_comm_appr_status;
    SET p_comm_appr_oper = v_comm_appr_oper;
    SET p_comm_appr_remark = v_comm_appr_remark;
    SET p_basket_id = v_basket_id;
    SET p_net_price_flag = v_net_price_flag;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_comm_oper_way = v_comm_oper_way;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_comm_comple_flag = v_comm_comple_flag;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取批量订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetBatchOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetBatchOrderInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_id_str varchar(2048),
    IN p_split_str varchar(4),
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
    declare v_order_id_str varchar(2048);
    declare v_split_str varchar(4);
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
    SET v_order_id_str = p_order_id_str;
    SET v_split_str = p_split_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取批量订单信息】*/
    call db_tdsecu.pra_tdsephif_GetBatchOrderInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_id_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.25.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取批量订单信息出现错误！',v_mysql_message);
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

# 事务_交易证券_主推接口_获取批量指令信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetBatchCommandInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetBatchCommandInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_id_str varchar(2048),
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
    declare v_comm_id_str varchar(2048);
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
    SET v_comm_id_str = p_comm_id_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取批量指令信息】*/
    call db_tdsecu.pra_tdsephif_GetBatchCommandInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_id_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.26.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取批量指令信息出现错误！',v_mysql_message);
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

# 事务_交易证券_主推接口_获取批量撤单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetBatchCancelInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetBatchCancelInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_wtdraw_id_str varchar(2048),
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
    declare v_wtdraw_id_str varchar(2048);
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
    SET v_wtdraw_id_str = p_wtdraw_id_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取批量撤单信息】*/
    call db_tdsecu.pra_tdsephif_GetBatchCancelInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_wtdraw_id_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.27.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取批量撤单信息出现错误！',v_mysql_message);
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

# 事务_交易证券_主推接口_获取资金和质押持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetCashImpawnPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetCashImpawnPosi(
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
    IN p_stock_acco_no int,
    IN p_trade_code_no int,
    IN p_exch_crncy_type varchar(3),
    IN p_target_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_cash_id bigint,
    OUT p_exgp_frozen_amt decimal(18,4),
    OUT p_exgp_unfroz_amt decimal(18,4),
    OUT p_exgp_comm_frozen_amt decimal(18,4),
    OUT p_exgp_comm_unfroz_amt decimal(18,4),
    OUT p_exgp_comm_capt_amt decimal(18,4),
    OUT p_exgp_comm_releas_amt decimal(18,4),
    OUT p_exgp_trade_frozen_amt decimal(18,4),
    OUT p_exgp_trade_unfroz_amt decimal(18,4),
    OUT p_exgp_trade_capt_amt decimal(18,4),
    OUT p_exgp_trade_releas_amt decimal(18,4),
    OUT p_exgp_strike_capt_amt decimal(18,4),
    OUT p_exgp_strike_releas_amt decimal(18,4),
    OUT p_exgp_cash_update_times int,
    OUT p_exgp_posi_id bigint,
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_comm_frozen_qty decimal(18,2),
    OUT p_exgp_comm_unfroz_qty decimal(18,2),
    OUT p_exgp_comm_capt_qty decimal(18,2),
    OUT p_exgp_comm_releas_qty decimal(18,2),
    OUT p_exgp_trade_frozen_qty decimal(18,2),
    OUT p_exgp_trade_unfroz_qty decimal(18,2),
    OUT p_exgp_trade_capt_qty decimal(18,2),
    OUT p_exgp_trade_releas_qty decimal(18,2),
    OUT p_exgp_strike_capt_qty decimal(18,2),
    OUT p_exgp_strike_releas_qty decimal(18,2),
    OUT p_exgp_strike_frozen_qty decimal(18,2),
    OUT p_exgp_strike_unfroz_qty decimal(18,2),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_intrst_pandl decimal(18,4),
    OUT p_exgp_posi_update_times int,
    OUT p_asac_cash_id bigint,
    OUT p_asac_frozen_amt decimal(18,4),
    OUT p_asac_unfroz_amt decimal(18,4),
    OUT p_asac_comm_frozen_amt decimal(18,4),
    OUT p_asac_comm_unfroz_amt decimal(18,4),
    OUT p_asac_comm_capt_amt decimal(18,4),
    OUT p_asac_comm_releas_amt decimal(18,4),
    OUT p_asac_trade_frozen_amt decimal(18,4),
    OUT p_asac_trade_unfroz_amt decimal(18,4),
    OUT p_asac_trade_capt_amt decimal(18,4),
    OUT p_asac_trade_releas_amt decimal(18,4),
    OUT p_asac_strike_capt_amt decimal(18,4),
    OUT p_asac_strike_releas_amt decimal(18,4),
    OUT p_asac_cash_update_times int,
    OUT p_asac_posi_id bigint,
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_comm_frozen_qty decimal(18,2),
    OUT p_asac_comm_unfroz_qty decimal(18,2),
    OUT p_asac_comm_capt_qty decimal(18,2),
    OUT p_asac_comm_releas_qty decimal(18,2),
    OUT p_asac_trade_frozen_qty decimal(18,2),
    OUT p_asac_trade_unfroz_qty decimal(18,2),
    OUT p_asac_trade_capt_qty decimal(18,2),
    OUT p_asac_trade_releas_qty decimal(18,2),
    OUT p_asac_strike_capt_qty decimal(18,2),
    OUT p_asac_strike_releas_qty decimal(18,2),
    OUT p_asac_strike_frozen_qty decimal(18,2),
    OUT p_asac_strike_unfroz_qty decimal(18,2),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_intrst_pandl decimal(18,4),
    OUT p_asac_posi_update_times int,
    OUT p_exgp_target_posi_id bigint,
    OUT p_exgp_target_frozen_qty decimal(18,2),
    OUT p_exgp_target_unfroz_qty decimal(18,2),
    OUT p_exgp_target_comm_frozen_qty decimal(18,2),
    OUT p_exgp_target_comm_unfroz_qty decimal(18,2),
    OUT p_exgp_target_comm_capt_qty decimal(18,2),
    OUT p_exgp_target_comm_releas_qty decimal(18,2),
    OUT p_exgp_target_trade_frozen_qty decimal(18,2),
    OUT p_exgp_target_trade_unfroz_qty decimal(18,2),
    OUT p_exgp_target_trade_capt_qty decimal(18,2),
    OUT p_exgp_target_trade_releas_qty decimal(18,2),
    OUT p_exgp_target_strike_capt_qty decimal(18,2),
    OUT p_exgp_target_strike_releas_qty decimal(18,2),
    OUT p_exgp_target_strike_frozen_qty decimal(18,2),
    OUT p_exgp_target_strike_unfroz_qty decimal(18,2),
    OUT p_exgp_target_realize_pandl decimal(18,4),
    OUT p_exgp_target_cost_amt decimal(18,4),
    OUT p_exgp_target_intrst_cost_amt decimal(18,4),
    OUT p_exgp_target_intrst_pandl decimal(18,4),
    OUT p_exgp_target_posi_update_times int,
    OUT p_asac_target_posi_id bigint,
    OUT p_asac_target_frozen_qty decimal(18,2),
    OUT p_asac_target_unfroz_qty decimal(18,2),
    OUT p_asac_target_comm_frozen_qty decimal(18,2),
    OUT p_asac_target_comm_unfroz_qty decimal(18,2),
    OUT p_asac_target_comm_capt_qty decimal(18,2),
    OUT p_asac_target_comm_releas_qty decimal(18,2),
    OUT p_asac_target_trade_frozen_qty decimal(18,2),
    OUT p_asac_target_trade_unfroz_qty decimal(18,2),
    OUT p_asac_target_trade_capt_qty decimal(18,2),
    OUT p_asac_target_trade_releas_qty decimal(18,2),
    OUT p_asac_target_strike_capt_qty decimal(18,2),
    OUT p_asac_target_strike_releas_qty decimal(18,2),
    OUT p_asac_target_strike_frozen_qty decimal(18,2),
    OUT p_asac_target_strike_unfroz_qty decimal(18,2),
    OUT p_asac_target_realize_pandl decimal(18,4),
    OUT p_asac_target_cost_amt decimal(18,4),
    OUT p_asac_target_intrst_cost_amt decimal(18,4),
    OUT p_asac_target_intrst_pandl decimal(18,4),
    OUT p_asac_target_posi_update_times int,
    OUT p_exgp_put_impawn_qty decimal(18,2),
    OUT p_asac_put_impawn_qty decimal(18,2)
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
    declare v_stock_acco_no int;
    declare v_trade_code_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_target_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_cash_id bigint;
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exgp_comm_frozen_amt decimal(18,4);
    declare v_exgp_comm_unfroz_amt decimal(18,4);
    declare v_exgp_comm_capt_amt decimal(18,4);
    declare v_exgp_comm_releas_amt decimal(18,4);
    declare v_exgp_trade_frozen_amt decimal(18,4);
    declare v_exgp_trade_unfroz_amt decimal(18,4);
    declare v_exgp_trade_capt_amt decimal(18,4);
    declare v_exgp_trade_releas_amt decimal(18,4);
    declare v_exgp_strike_capt_amt decimal(18,4);
    declare v_exgp_strike_releas_amt decimal(18,4);
    declare v_exgp_cash_update_times int;
    declare v_exgp_posi_id bigint;
    declare v_exgp_frozen_qty decimal(18,2);
    declare v_exgp_unfroz_qty decimal(18,2);
    declare v_exgp_comm_frozen_qty decimal(18,2);
    declare v_exgp_comm_unfroz_qty decimal(18,2);
    declare v_exgp_comm_capt_qty decimal(18,2);
    declare v_exgp_comm_releas_qty decimal(18,2);
    declare v_exgp_trade_frozen_qty decimal(18,2);
    declare v_exgp_trade_unfroz_qty decimal(18,2);
    declare v_exgp_trade_capt_qty decimal(18,2);
    declare v_exgp_trade_releas_qty decimal(18,2);
    declare v_exgp_strike_capt_qty decimal(18,2);
    declare v_exgp_strike_releas_qty decimal(18,2);
    declare v_exgp_strike_frozen_qty decimal(18,2);
    declare v_exgp_strike_unfroz_qty decimal(18,2);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_intrst_pandl decimal(18,4);
    declare v_exgp_posi_update_times int;
    declare v_asac_cash_id bigint;
    declare v_asac_frozen_amt decimal(18,4);
    declare v_asac_unfroz_amt decimal(18,4);
    declare v_asac_comm_frozen_amt decimal(18,4);
    declare v_asac_comm_unfroz_amt decimal(18,4);
    declare v_asac_comm_capt_amt decimal(18,4);
    declare v_asac_comm_releas_amt decimal(18,4);
    declare v_asac_trade_frozen_amt decimal(18,4);
    declare v_asac_trade_unfroz_amt decimal(18,4);
    declare v_asac_trade_capt_amt decimal(18,4);
    declare v_asac_trade_releas_amt decimal(18,4);
    declare v_asac_strike_capt_amt decimal(18,4);
    declare v_asac_strike_releas_amt decimal(18,4);
    declare v_asac_cash_update_times int;
    declare v_asac_posi_id bigint;
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_comm_frozen_qty decimal(18,2);
    declare v_asac_comm_unfroz_qty decimal(18,2);
    declare v_asac_comm_capt_qty decimal(18,2);
    declare v_asac_comm_releas_qty decimal(18,2);
    declare v_asac_trade_frozen_qty decimal(18,2);
    declare v_asac_trade_unfroz_qty decimal(18,2);
    declare v_asac_trade_capt_qty decimal(18,2);
    declare v_asac_trade_releas_qty decimal(18,2);
    declare v_asac_strike_capt_qty decimal(18,2);
    declare v_asac_strike_releas_qty decimal(18,2);
    declare v_asac_strike_frozen_qty decimal(18,2);
    declare v_asac_strike_unfroz_qty decimal(18,2);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_asac_posi_update_times int;
    declare v_exgp_target_posi_id bigint;
    declare v_exgp_target_frozen_qty decimal(18,2);
    declare v_exgp_target_unfroz_qty decimal(18,2);
    declare v_exgp_target_comm_frozen_qty decimal(18,2);
    declare v_exgp_target_comm_unfroz_qty decimal(18,2);
    declare v_exgp_target_comm_capt_qty decimal(18,2);
    declare v_exgp_target_comm_releas_qty decimal(18,2);
    declare v_exgp_target_trade_frozen_qty decimal(18,2);
    declare v_exgp_target_trade_unfroz_qty decimal(18,2);
    declare v_exgp_target_trade_capt_qty decimal(18,2);
    declare v_exgp_target_trade_releas_qty decimal(18,2);
    declare v_exgp_target_strike_capt_qty decimal(18,2);
    declare v_exgp_target_strike_releas_qty decimal(18,2);
    declare v_exgp_target_strike_frozen_qty decimal(18,2);
    declare v_exgp_target_strike_unfroz_qty decimal(18,2);
    declare v_exgp_target_realize_pandl decimal(18,4);
    declare v_exgp_target_cost_amt decimal(18,4);
    declare v_exgp_target_intrst_cost_amt decimal(18,4);
    declare v_exgp_target_intrst_pandl decimal(18,4);
    declare v_exgp_target_posi_update_times int;
    declare v_asac_target_posi_id bigint;
    declare v_asac_target_frozen_qty decimal(18,2);
    declare v_asac_target_unfroz_qty decimal(18,2);
    declare v_asac_target_comm_frozen_qty decimal(18,2);
    declare v_asac_target_comm_unfroz_qty decimal(18,2);
    declare v_asac_target_comm_capt_qty decimal(18,2);
    declare v_asac_target_comm_releas_qty decimal(18,2);
    declare v_asac_target_trade_frozen_qty decimal(18,2);
    declare v_asac_target_trade_unfroz_qty decimal(18,2);
    declare v_asac_target_trade_capt_qty decimal(18,2);
    declare v_asac_target_trade_releas_qty decimal(18,2);
    declare v_asac_target_strike_capt_qty decimal(18,2);
    declare v_asac_target_strike_releas_qty decimal(18,2);
    declare v_asac_target_strike_frozen_qty decimal(18,2);
    declare v_asac_target_strike_unfroz_qty decimal(18,2);
    declare v_asac_target_realize_pandl decimal(18,4);
    declare v_asac_target_cost_amt decimal(18,4);
    declare v_asac_target_intrst_cost_amt decimal(18,4);
    declare v_asac_target_intrst_pandl decimal(18,4);
    declare v_asac_target_posi_update_times int;
    declare v_exgp_put_impawn_qty decimal(18,2);
    declare v_asac_put_impawn_qty decimal(18,2);

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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_target_code_no = p_target_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_cash_id = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exgp_comm_frozen_amt = 0;
    SET v_exgp_comm_unfroz_amt = 0;
    SET v_exgp_comm_capt_amt = 0;
    SET v_exgp_comm_releas_amt = 0;
    SET v_exgp_trade_frozen_amt = 0;
    SET v_exgp_trade_unfroz_amt = 0;
    SET v_exgp_trade_capt_amt = 0;
    SET v_exgp_trade_releas_amt = 0;
    SET v_exgp_strike_capt_amt = 0;
    SET v_exgp_strike_releas_amt = 0;
    SET v_exgp_cash_update_times = 1;
    SET v_exgp_posi_id = 0;
    SET v_exgp_frozen_qty = 0;
    SET v_exgp_unfroz_qty = 0;
    SET v_exgp_comm_frozen_qty = 0;
    SET v_exgp_comm_unfroz_qty = 0;
    SET v_exgp_comm_capt_qty = 0;
    SET v_exgp_comm_releas_qty = 0;
    SET v_exgp_trade_frozen_qty = 0;
    SET v_exgp_trade_unfroz_qty = 0;
    SET v_exgp_trade_capt_qty = 0;
    SET v_exgp_trade_releas_qty = 0;
    SET v_exgp_strike_capt_qty = 0;
    SET v_exgp_strike_releas_qty = 0;
    SET v_exgp_strike_frozen_qty = 0;
    SET v_exgp_strike_unfroz_qty = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exgp_cost_amt = 0;
    SET v_exgp_intrst_cost_amt = 0;
    SET v_exgp_intrst_pandl = 0;
    SET v_exgp_posi_update_times = 1;
    SET v_asac_cash_id = 0;
    SET v_asac_frozen_amt = 0;
    SET v_asac_unfroz_amt = 0;
    SET v_asac_comm_frozen_amt = 0;
    SET v_asac_comm_unfroz_amt = 0;
    SET v_asac_comm_capt_amt = 0;
    SET v_asac_comm_releas_amt = 0;
    SET v_asac_trade_frozen_amt = 0;
    SET v_asac_trade_unfroz_amt = 0;
    SET v_asac_trade_capt_amt = 0;
    SET v_asac_trade_releas_amt = 0;
    SET v_asac_strike_capt_amt = 0;
    SET v_asac_strike_releas_amt = 0;
    SET v_asac_cash_update_times = 1;
    SET v_asac_posi_id = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_comm_frozen_qty = 0;
    SET v_asac_comm_unfroz_qty = 0;
    SET v_asac_comm_capt_qty = 0;
    SET v_asac_comm_releas_qty = 0;
    SET v_asac_trade_frozen_qty = 0;
    SET v_asac_trade_unfroz_qty = 0;
    SET v_asac_trade_capt_qty = 0;
    SET v_asac_trade_releas_qty = 0;
    SET v_asac_strike_capt_qty = 0;
    SET v_asac_strike_releas_qty = 0;
    SET v_asac_strike_frozen_qty = 0;
    SET v_asac_strike_unfroz_qty = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_asac_posi_update_times = 1;
    SET v_exgp_target_posi_id = 0;
    SET v_exgp_target_frozen_qty = 0;
    SET v_exgp_target_unfroz_qty = 0;
    SET v_exgp_target_comm_frozen_qty = 0;
    SET v_exgp_target_comm_unfroz_qty = 0;
    SET v_exgp_target_comm_capt_qty = 0;
    SET v_exgp_target_comm_releas_qty = 0;
    SET v_exgp_target_trade_frozen_qty = 0;
    SET v_exgp_target_trade_unfroz_qty = 0;
    SET v_exgp_target_trade_capt_qty = 0;
    SET v_exgp_target_trade_releas_qty = 0;
    SET v_exgp_target_strike_capt_qty = 0;
    SET v_exgp_target_strike_releas_qty = 0;
    SET v_exgp_target_strike_frozen_qty = 0;
    SET v_exgp_target_strike_unfroz_qty = 0;
    SET v_exgp_target_realize_pandl = 0;
    SET v_exgp_target_cost_amt = 0;
    SET v_exgp_target_intrst_cost_amt = 0;
    SET v_exgp_target_intrst_pandl = 0;
    SET v_exgp_target_posi_update_times = 0;
    SET v_asac_target_posi_id = 0;
    SET v_asac_target_frozen_qty = 0;
    SET v_asac_target_unfroz_qty = 0;
    SET v_asac_target_comm_frozen_qty = 0;
    SET v_asac_target_comm_unfroz_qty = 0;
    SET v_asac_target_comm_capt_qty = 0;
    SET v_asac_target_comm_releas_qty = 0;
    SET v_asac_target_trade_frozen_qty = 0;
    SET v_asac_target_trade_unfroz_qty = 0;
    SET v_asac_target_trade_capt_qty = 0;
    SET v_asac_target_trade_releas_qty = 0;
    SET v_asac_target_strike_capt_qty = 0;
    SET v_asac_target_strike_releas_qty = 0;
    SET v_asac_target_strike_frozen_qty = 0;
    SET v_asac_target_strike_unfroz_qty = 0;
    SET v_asac_target_realize_pandl = 0;
    SET v_asac_target_cost_amt = 0;
    SET v_asac_target_intrst_cost_amt = 0;
    SET v_asac_target_intrst_pandl = 0;
    SET v_asac_target_posi_update_times = 0;
    SET v_exgp_put_impawn_qty = 0;
    SET v_asac_put_impawn_qty = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取资金和质押持仓信息】*/
    call db_tdsecu.pra_tdsephif_GetCashImpawnPosi(
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
        v_stock_acco_no,
        v_trade_code_no,
        v_exch_crncy_type,
        v_target_code_no,
        v_error_code,
        v_error_info,
        v_exgp_cash_id,
        v_exgp_frozen_amt,
        v_exgp_unfroz_amt,
        v_exgp_comm_frozen_amt,
        v_exgp_comm_unfroz_amt,
        v_exgp_comm_capt_amt,
        v_exgp_comm_releas_amt,
        v_exgp_trade_frozen_amt,
        v_exgp_trade_unfroz_amt,
        v_exgp_trade_capt_amt,
        v_exgp_trade_releas_amt,
        v_exgp_strike_capt_amt,
        v_exgp_strike_releas_amt,
        v_exgp_cash_update_times,
        v_exgp_posi_id,
        v_exgp_frozen_qty,
        v_exgp_unfroz_qty,
        v_exgp_comm_frozen_qty,
        v_exgp_comm_unfroz_qty,
        v_exgp_comm_capt_qty,
        v_exgp_comm_releas_qty,
        v_exgp_trade_frozen_qty,
        v_exgp_trade_unfroz_qty,
        v_exgp_trade_capt_qty,
        v_exgp_trade_releas_qty,
        v_exgp_strike_capt_qty,
        v_exgp_strike_releas_qty,
        v_exgp_strike_frozen_qty,
        v_exgp_strike_unfroz_qty,
        v_exgp_realize_pandl,
        v_exgp_cost_amt,
        v_exgp_intrst_cost_amt,
        v_exgp_intrst_pandl,
        v_exgp_posi_update_times,
        v_asac_cash_id,
        v_asac_frozen_amt,
        v_asac_unfroz_amt,
        v_asac_comm_frozen_amt,
        v_asac_comm_unfroz_amt,
        v_asac_comm_capt_amt,
        v_asac_comm_releas_amt,
        v_asac_trade_frozen_amt,
        v_asac_trade_unfroz_amt,
        v_asac_trade_capt_amt,
        v_asac_trade_releas_amt,
        v_asac_strike_capt_amt,
        v_asac_strike_releas_amt,
        v_asac_cash_update_times,
        v_asac_posi_id,
        v_asac_frozen_qty,
        v_asac_unfroz_qty,
        v_asac_comm_frozen_qty,
        v_asac_comm_unfroz_qty,
        v_asac_comm_capt_qty,
        v_asac_comm_releas_qty,
        v_asac_trade_frozen_qty,
        v_asac_trade_unfroz_qty,
        v_asac_trade_capt_qty,
        v_asac_trade_releas_qty,
        v_asac_strike_capt_qty,
        v_asac_strike_releas_qty,
        v_asac_strike_frozen_qty,
        v_asac_strike_unfroz_qty,
        v_asac_realize_pandl,
        v_asac_cost_amt,
        v_asac_intrst_cost_amt,
        v_asac_intrst_pandl,
        v_asac_posi_update_times,
        v_exgp_target_posi_id,
        v_exgp_target_frozen_qty,
        v_exgp_target_unfroz_qty,
        v_exgp_target_comm_frozen_qty,
        v_exgp_target_comm_unfroz_qty,
        v_exgp_target_comm_capt_qty,
        v_exgp_target_comm_releas_qty,
        v_exgp_target_trade_frozen_qty,
        v_exgp_target_trade_unfroz_qty,
        v_exgp_target_trade_capt_qty,
        v_exgp_target_trade_releas_qty,
        v_exgp_target_strike_capt_qty,
        v_exgp_target_strike_releas_qty,
        v_exgp_target_strike_frozen_qty,
        v_exgp_target_strike_unfroz_qty,
        v_exgp_target_realize_pandl,
        v_exgp_target_cost_amt,
        v_exgp_target_intrst_cost_amt,
        v_exgp_target_intrst_pandl,
        v_exgp_target_posi_update_times,
        v_asac_target_posi_id,
        v_asac_target_frozen_qty,
        v_asac_target_unfroz_qty,
        v_asac_target_comm_frozen_qty,
        v_asac_target_comm_unfroz_qty,
        v_asac_target_comm_capt_qty,
        v_asac_target_comm_releas_qty,
        v_asac_target_trade_frozen_qty,
        v_asac_target_trade_unfroz_qty,
        v_asac_target_trade_capt_qty,
        v_asac_target_trade_releas_qty,
        v_asac_target_strike_capt_qty,
        v_asac_target_strike_releas_qty,
        v_asac_target_strike_frozen_qty,
        v_asac_target_strike_unfroz_qty,
        v_asac_target_realize_pandl,
        v_asac_target_cost_amt,
        v_asac_target_intrst_cost_amt,
        v_asac_target_intrst_pandl,
        v_asac_target_posi_update_times,
        v_exgp_put_impawn_qty,
        v_asac_put_impawn_qty);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.28.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取资金和质押持仓信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_cash_id = v_exgp_cash_id;
    SET p_exgp_frozen_amt = v_exgp_frozen_amt;
    SET p_exgp_unfroz_amt = v_exgp_unfroz_amt;
    SET p_exgp_comm_frozen_amt = v_exgp_comm_frozen_amt;
    SET p_exgp_comm_unfroz_amt = v_exgp_comm_unfroz_amt;
    SET p_exgp_comm_capt_amt = v_exgp_comm_capt_amt;
    SET p_exgp_comm_releas_amt = v_exgp_comm_releas_amt;
    SET p_exgp_trade_frozen_amt = v_exgp_trade_frozen_amt;
    SET p_exgp_trade_unfroz_amt = v_exgp_trade_unfroz_amt;
    SET p_exgp_trade_capt_amt = v_exgp_trade_capt_amt;
    SET p_exgp_trade_releas_amt = v_exgp_trade_releas_amt;
    SET p_exgp_strike_capt_amt = v_exgp_strike_capt_amt;
    SET p_exgp_strike_releas_amt = v_exgp_strike_releas_amt;
    SET p_exgp_cash_update_times = v_exgp_cash_update_times;
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_comm_frozen_qty = v_exgp_comm_frozen_qty;
    SET p_exgp_comm_unfroz_qty = v_exgp_comm_unfroz_qty;
    SET p_exgp_comm_capt_qty = v_exgp_comm_capt_qty;
    SET p_exgp_comm_releas_qty = v_exgp_comm_releas_qty;
    SET p_exgp_trade_frozen_qty = v_exgp_trade_frozen_qty;
    SET p_exgp_trade_unfroz_qty = v_exgp_trade_unfroz_qty;
    SET p_exgp_trade_capt_qty = v_exgp_trade_capt_qty;
    SET p_exgp_trade_releas_qty = v_exgp_trade_releas_qty;
    SET p_exgp_strike_capt_qty = v_exgp_strike_capt_qty;
    SET p_exgp_strike_releas_qty = v_exgp_strike_releas_qty;
    SET p_exgp_strike_frozen_qty = v_exgp_strike_frozen_qty;
    SET p_exgp_strike_unfroz_qty = v_exgp_strike_unfroz_qty;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_intrst_pandl = v_exgp_intrst_pandl;
    SET p_exgp_posi_update_times = v_exgp_posi_update_times;
    SET p_asac_cash_id = v_asac_cash_id;
    SET p_asac_frozen_amt = v_asac_frozen_amt;
    SET p_asac_unfroz_amt = v_asac_unfroz_amt;
    SET p_asac_comm_frozen_amt = v_asac_comm_frozen_amt;
    SET p_asac_comm_unfroz_amt = v_asac_comm_unfroz_amt;
    SET p_asac_comm_capt_amt = v_asac_comm_capt_amt;
    SET p_asac_comm_releas_amt = v_asac_comm_releas_amt;
    SET p_asac_trade_frozen_amt = v_asac_trade_frozen_amt;
    SET p_asac_trade_unfroz_amt = v_asac_trade_unfroz_amt;
    SET p_asac_trade_capt_amt = v_asac_trade_capt_amt;
    SET p_asac_trade_releas_amt = v_asac_trade_releas_amt;
    SET p_asac_strike_capt_amt = v_asac_strike_capt_amt;
    SET p_asac_strike_releas_amt = v_asac_strike_releas_amt;
    SET p_asac_cash_update_times = v_asac_cash_update_times;
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_comm_frozen_qty = v_asac_comm_frozen_qty;
    SET p_asac_comm_unfroz_qty = v_asac_comm_unfroz_qty;
    SET p_asac_comm_capt_qty = v_asac_comm_capt_qty;
    SET p_asac_comm_releas_qty = v_asac_comm_releas_qty;
    SET p_asac_trade_frozen_qty = v_asac_trade_frozen_qty;
    SET p_asac_trade_unfroz_qty = v_asac_trade_unfroz_qty;
    SET p_asac_trade_capt_qty = v_asac_trade_capt_qty;
    SET p_asac_trade_releas_qty = v_asac_trade_releas_qty;
    SET p_asac_strike_capt_qty = v_asac_strike_capt_qty;
    SET p_asac_strike_releas_qty = v_asac_strike_releas_qty;
    SET p_asac_strike_frozen_qty = v_asac_strike_frozen_qty;
    SET p_asac_strike_unfroz_qty = v_asac_strike_unfroz_qty;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_intrst_pandl = v_asac_intrst_pandl;
    SET p_asac_posi_update_times = v_asac_posi_update_times;
    SET p_exgp_target_posi_id = v_exgp_target_posi_id;
    SET p_exgp_target_frozen_qty = v_exgp_target_frozen_qty;
    SET p_exgp_target_unfroz_qty = v_exgp_target_unfroz_qty;
    SET p_exgp_target_comm_frozen_qty = v_exgp_target_comm_frozen_qty;
    SET p_exgp_target_comm_unfroz_qty = v_exgp_target_comm_unfroz_qty;
    SET p_exgp_target_comm_capt_qty = v_exgp_target_comm_capt_qty;
    SET p_exgp_target_comm_releas_qty = v_exgp_target_comm_releas_qty;
    SET p_exgp_target_trade_frozen_qty = v_exgp_target_trade_frozen_qty;
    SET p_exgp_target_trade_unfroz_qty = v_exgp_target_trade_unfroz_qty;
    SET p_exgp_target_trade_capt_qty = v_exgp_target_trade_capt_qty;
    SET p_exgp_target_trade_releas_qty = v_exgp_target_trade_releas_qty;
    SET p_exgp_target_strike_capt_qty = v_exgp_target_strike_capt_qty;
    SET p_exgp_target_strike_releas_qty = v_exgp_target_strike_releas_qty;
    SET p_exgp_target_strike_frozen_qty = v_exgp_target_strike_frozen_qty;
    SET p_exgp_target_strike_unfroz_qty = v_exgp_target_strike_unfroz_qty;
    SET p_exgp_target_realize_pandl = v_exgp_target_realize_pandl;
    SET p_exgp_target_cost_amt = v_exgp_target_cost_amt;
    SET p_exgp_target_intrst_cost_amt = v_exgp_target_intrst_cost_amt;
    SET p_exgp_target_intrst_pandl = v_exgp_target_intrst_pandl;
    SET p_exgp_target_posi_update_times = v_exgp_target_posi_update_times;
    SET p_asac_target_posi_id = v_asac_target_posi_id;
    SET p_asac_target_frozen_qty = v_asac_target_frozen_qty;
    SET p_asac_target_unfroz_qty = v_asac_target_unfroz_qty;
    SET p_asac_target_comm_frozen_qty = v_asac_target_comm_frozen_qty;
    SET p_asac_target_comm_unfroz_qty = v_asac_target_comm_unfroz_qty;
    SET p_asac_target_comm_capt_qty = v_asac_target_comm_capt_qty;
    SET p_asac_target_comm_releas_qty = v_asac_target_comm_releas_qty;
    SET p_asac_target_trade_frozen_qty = v_asac_target_trade_frozen_qty;
    SET p_asac_target_trade_unfroz_qty = v_asac_target_trade_unfroz_qty;
    SET p_asac_target_trade_capt_qty = v_asac_target_trade_capt_qty;
    SET p_asac_target_trade_releas_qty = v_asac_target_trade_releas_qty;
    SET p_asac_target_strike_capt_qty = v_asac_target_strike_capt_qty;
    SET p_asac_target_strike_releas_qty = v_asac_target_strike_releas_qty;
    SET p_asac_target_strike_frozen_qty = v_asac_target_strike_frozen_qty;
    SET p_asac_target_strike_unfroz_qty = v_asac_target_strike_unfroz_qty;
    SET p_asac_target_realize_pandl = v_asac_target_realize_pandl;
    SET p_asac_target_cost_amt = v_asac_target_cost_amt;
    SET p_asac_target_intrst_cost_amt = v_asac_target_intrst_cost_amt;
    SET p_asac_target_intrst_pandl = v_asac_target_intrst_pandl;
    SET p_asac_target_posi_update_times = v_asac_target_posi_update_times;
    SET p_exgp_put_impawn_qty = v_exgp_put_impawn_qty;
    SET p_asac_put_impawn_qty = v_asac_put_impawn_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取债券回购信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetBondRepoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetBondRepoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_repo_strike_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_target_code_no int,
    OUT p_comm_id bigint,
    OUT p_order_dir int,
    OUT p_repo_qty decimal(18,2),
    OUT p_repo_amt decimal(18,4),
    OUT p_repo_rate decimal(18,12),
    OUT p_repo_trade_date int,
    OUT p_repo_order_id bigint,
    OUT p_repo_days int,
    OUT p_repo_cale_days int,
    OUT p_repo_back_date int,
    OUT p_repo_back_amt decimal(18,4),
    OUT p_repo_back_intrst decimal(18,4),
    OUT p_repo_back_trade_date int,
    OUT p_repo_status varchar(2),
    OUT p_bond_repo_id bigint,
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
    declare v_repo_strike_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_comm_id bigint;
    declare v_order_dir int;
    declare v_repo_qty decimal(18,2);
    declare v_repo_amt decimal(18,4);
    declare v_repo_rate decimal(18,12);
    declare v_repo_trade_date int;
    declare v_repo_order_id bigint;
    declare v_repo_days int;
    declare v_repo_cale_days int;
    declare v_repo_back_date int;
    declare v_repo_back_amt decimal(18,4);
    declare v_repo_back_intrst decimal(18,4);
    declare v_repo_back_trade_date int;
    declare v_repo_status varchar(2);
    declare v_bond_repo_id bigint;
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
    SET v_repo_strike_id = p_repo_strike_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_target_code_no = 0;
    SET v_comm_id = 0;
    SET v_order_dir = 0;
    SET v_repo_qty = 0;
    SET v_repo_amt = 0;
    SET v_repo_rate = 0;
    SET v_repo_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_repo_order_id = 0;
    SET v_repo_days = 0;
    SET v_repo_cale_days = 0;
    SET v_repo_back_date = 0;
    SET v_repo_back_amt = 0;
    SET v_repo_back_intrst = 0;
    SET v_repo_back_trade_date = 0;
    SET v_repo_status = "0";
    SET v_bond_repo_id = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取债券回购信息】*/
    call db_tdsecu.pra_tdsephif_GetBondRepoInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_repo_strike_id,
        v_error_code,
        v_error_info,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_crncy_type,
        v_exch_crncy_type,
        v_exch_rate,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_target_code_no,
        v_comm_id,
        v_order_dir,
        v_repo_qty,
        v_repo_amt,
        v_repo_rate,
        v_repo_trade_date,
        v_repo_order_id,
        v_repo_days,
        v_repo_cale_days,
        v_repo_back_date,
        v_repo_back_amt,
        v_repo_back_intrst,
        v_repo_back_trade_date,
        v_repo_status,
        v_bond_repo_id,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.30.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取债券回购信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_comm_id = v_comm_id;
    SET p_order_dir = v_order_dir;
    SET p_repo_qty = v_repo_qty;
    SET p_repo_amt = v_repo_amt;
    SET p_repo_rate = v_repo_rate;
    SET p_repo_trade_date = v_repo_trade_date;
    SET p_repo_order_id = v_repo_order_id;
    SET p_repo_days = v_repo_days;
    SET p_repo_cale_days = v_repo_cale_days;
    SET p_repo_back_date = v_repo_back_date;
    SET p_repo_back_amt = v_repo_back_amt;
    SET p_repo_back_intrst = v_repo_back_intrst;
    SET p_repo_back_trade_date = v_repo_back_trade_date;
    SET p_repo_status = v_repo_status;
    SET p_bond_repo_id = v_bond_repo_id;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取资金信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetCash;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetCash(
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
    IN p_exch_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_cash_id bigint,
    OUT p_exgp_frozen_amt decimal(18,4),
    OUT p_exgp_unfroz_amt decimal(18,4),
    OUT p_exgp_comm_frozen_amt decimal(18,4),
    OUT p_exgp_comm_unfroz_amt decimal(18,4),
    OUT p_exgp_comm_capt_amt decimal(18,4),
    OUT p_exgp_comm_releas_amt decimal(18,4),
    OUT p_exgp_trade_frozen_amt decimal(18,4),
    OUT p_exgp_trade_unfroz_amt decimal(18,4),
    OUT p_exgp_trade_capt_amt decimal(18,4),
    OUT p_exgp_trade_releas_amt decimal(18,4),
    OUT p_exgp_strike_capt_amt decimal(18,4),
    OUT p_exgp_strike_releas_amt decimal(18,4),
    OUT p_exgp_cash_update_times int,
    OUT p_asac_cash_id bigint,
    OUT p_asac_frozen_amt decimal(18,4),
    OUT p_asac_unfroz_amt decimal(18,4),
    OUT p_asac_comm_frozen_amt decimal(18,4),
    OUT p_asac_comm_unfroz_amt decimal(18,4),
    OUT p_asac_comm_capt_amt decimal(18,4),
    OUT p_asac_comm_releas_amt decimal(18,4),
    OUT p_asac_trade_frozen_amt decimal(18,4),
    OUT p_asac_trade_unfroz_amt decimal(18,4),
    OUT p_asac_trade_capt_amt decimal(18,4),
    OUT p_asac_trade_releas_amt decimal(18,4),
    OUT p_asac_strike_capt_amt decimal(18,4),
    OUT p_asac_strike_releas_amt decimal(18,4),
    OUT p_asac_cash_update_times int
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
    declare v_exch_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_cash_id bigint;
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exgp_comm_frozen_amt decimal(18,4);
    declare v_exgp_comm_unfroz_amt decimal(18,4);
    declare v_exgp_comm_capt_amt decimal(18,4);
    declare v_exgp_comm_releas_amt decimal(18,4);
    declare v_exgp_trade_frozen_amt decimal(18,4);
    declare v_exgp_trade_unfroz_amt decimal(18,4);
    declare v_exgp_trade_capt_amt decimal(18,4);
    declare v_exgp_trade_releas_amt decimal(18,4);
    declare v_exgp_strike_capt_amt decimal(18,4);
    declare v_exgp_strike_releas_amt decimal(18,4);
    declare v_exgp_cash_update_times int;
    declare v_asac_cash_id bigint;
    declare v_asac_frozen_amt decimal(18,4);
    declare v_asac_unfroz_amt decimal(18,4);
    declare v_asac_comm_frozen_amt decimal(18,4);
    declare v_asac_comm_unfroz_amt decimal(18,4);
    declare v_asac_comm_capt_amt decimal(18,4);
    declare v_asac_comm_releas_amt decimal(18,4);
    declare v_asac_trade_frozen_amt decimal(18,4);
    declare v_asac_trade_unfroz_amt decimal(18,4);
    declare v_asac_trade_capt_amt decimal(18,4);
    declare v_asac_trade_releas_amt decimal(18,4);
    declare v_asac_strike_capt_amt decimal(18,4);
    declare v_asac_strike_releas_amt decimal(18,4);
    declare v_asac_cash_update_times int;

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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_cash_id = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exgp_comm_frozen_amt = 0;
    SET v_exgp_comm_unfroz_amt = 0;
    SET v_exgp_comm_capt_amt = 0;
    SET v_exgp_comm_releas_amt = 0;
    SET v_exgp_trade_frozen_amt = 0;
    SET v_exgp_trade_unfroz_amt = 0;
    SET v_exgp_trade_capt_amt = 0;
    SET v_exgp_trade_releas_amt = 0;
    SET v_exgp_strike_capt_amt = 0;
    SET v_exgp_strike_releas_amt = 0;
    SET v_exgp_cash_update_times = 1;
    SET v_asac_cash_id = 0;
    SET v_asac_frozen_amt = 0;
    SET v_asac_unfroz_amt = 0;
    SET v_asac_comm_frozen_amt = 0;
    SET v_asac_comm_unfroz_amt = 0;
    SET v_asac_comm_capt_amt = 0;
    SET v_asac_comm_releas_amt = 0;
    SET v_asac_trade_frozen_amt = 0;
    SET v_asac_trade_unfroz_amt = 0;
    SET v_asac_trade_capt_amt = 0;
    SET v_asac_trade_releas_amt = 0;
    SET v_asac_strike_capt_amt = 0;
    SET v_asac_strike_releas_amt = 0;
    SET v_asac_cash_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取资金信息】*/
    call db_tdsecu.pra_tdsephif_GetCash(
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
        v_exch_crncy_type,
        v_error_code,
        v_error_info,
        v_exgp_cash_id,
        v_exgp_frozen_amt,
        v_exgp_unfroz_amt,
        v_exgp_comm_frozen_amt,
        v_exgp_comm_unfroz_amt,
        v_exgp_comm_capt_amt,
        v_exgp_comm_releas_amt,
        v_exgp_trade_frozen_amt,
        v_exgp_trade_unfroz_amt,
        v_exgp_trade_capt_amt,
        v_exgp_trade_releas_amt,
        v_exgp_strike_capt_amt,
        v_exgp_strike_releas_amt,
        v_exgp_cash_update_times,
        v_asac_cash_id,
        v_asac_frozen_amt,
        v_asac_unfroz_amt,
        v_asac_comm_frozen_amt,
        v_asac_comm_unfroz_amt,
        v_asac_comm_capt_amt,
        v_asac_comm_releas_amt,
        v_asac_trade_frozen_amt,
        v_asac_trade_unfroz_amt,
        v_asac_trade_capt_amt,
        v_asac_trade_releas_amt,
        v_asac_strike_capt_amt,
        v_asac_strike_releas_amt,
        v_asac_cash_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.31.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取资金信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_cash_id = v_exgp_cash_id;
    SET p_exgp_frozen_amt = v_exgp_frozen_amt;
    SET p_exgp_unfroz_amt = v_exgp_unfroz_amt;
    SET p_exgp_comm_frozen_amt = v_exgp_comm_frozen_amt;
    SET p_exgp_comm_unfroz_amt = v_exgp_comm_unfroz_amt;
    SET p_exgp_comm_capt_amt = v_exgp_comm_capt_amt;
    SET p_exgp_comm_releas_amt = v_exgp_comm_releas_amt;
    SET p_exgp_trade_frozen_amt = v_exgp_trade_frozen_amt;
    SET p_exgp_trade_unfroz_amt = v_exgp_trade_unfroz_amt;
    SET p_exgp_trade_capt_amt = v_exgp_trade_capt_amt;
    SET p_exgp_trade_releas_amt = v_exgp_trade_releas_amt;
    SET p_exgp_strike_capt_amt = v_exgp_strike_capt_amt;
    SET p_exgp_strike_releas_amt = v_exgp_strike_releas_amt;
    SET p_exgp_cash_update_times = v_exgp_cash_update_times;
    SET p_asac_cash_id = v_asac_cash_id;
    SET p_asac_frozen_amt = v_asac_frozen_amt;
    SET p_asac_unfroz_amt = v_asac_unfroz_amt;
    SET p_asac_comm_frozen_amt = v_asac_comm_frozen_amt;
    SET p_asac_comm_unfroz_amt = v_asac_comm_unfroz_amt;
    SET p_asac_comm_capt_amt = v_asac_comm_capt_amt;
    SET p_asac_comm_releas_amt = v_asac_comm_releas_amt;
    SET p_asac_trade_frozen_amt = v_asac_trade_frozen_amt;
    SET p_asac_trade_unfroz_amt = v_asac_trade_unfroz_amt;
    SET p_asac_trade_capt_amt = v_asac_trade_capt_amt;
    SET p_asac_trade_releas_amt = v_asac_trade_releas_amt;
    SET p_asac_strike_capt_amt = v_asac_strike_capt_amt;
    SET p_asac_strike_releas_amt = v_asac_strike_releas_amt;
    SET p_asac_cash_update_times = v_asac_cash_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_批量获取资产账户持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetBatchAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetBatchAsacPosi(
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
    IN p_stock_acco_no_stock_code_no_str varchar(4096),
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
    declare v_stock_acco_no_stock_code_no_str varchar(4096);
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
    SET v_stock_acco_no_stock_code_no_str = p_stock_acco_no_stock_code_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_批量获取资产账户持仓信息】*/
    call db_tdsecu.pra_tdsephif_GetBatchAsacPosi(
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
        v_stock_acco_no_stock_code_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.32.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_批量获取资产账户持仓信息出现错误！',v_mysql_message);
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

# 事务_交易证券_主推接口_批量获取交易组持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetBatchExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetBatchExgpPosi(
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
    IN p_exch_group_no int,
    IN p_stock_acco_no_stock_code_no_str varchar(4096),
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
    declare v_exch_group_no int;
    declare v_stock_acco_no_stock_code_no_str varchar(4096);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_acco_no_stock_code_no_str = p_stock_acco_no_stock_code_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_批量获取交易组持仓信息】*/
    call db_tdsecu.pra_tdsephif_GetBatchExgpPosi(
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
        v_exch_group_no,
        v_stock_acco_no_stock_code_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.33.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_批量获取交易组持仓信息出现错误！',v_mysql_message);
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

# 事务_交易证券_主推接口_获取待执行订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetPendOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetPendOrderInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pend_order_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_batch_no int,
    OUT p_order_dir int,
    OUT p_price_type int,
    OUT p_exec_price_type int,
    OUT p_price_offset decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_impawn_ratio decimal(18,12),
    OUT p_order_oper_way varchar(2),
    OUT p_external_no bigint,
    OUT p_pend_order_status varchar(2),
    OUT p_remark_info varchar(255),
    OUT p_create_date int,
    OUT p_create_time int,
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
    declare v_pend_order_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_exec_price_type int;
    declare v_price_offset decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_order_oper_way varchar(2);
    declare v_external_no bigint;
    declare v_pend_order_status varchar(2);
    declare v_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_pend_order_id = p_pend_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_batch_no = 0;
    SET v_order_dir = 0;
    SET v_price_type = 0;
    SET v_exec_price_type = 0;
    SET v_price_offset = 0;
    SET v_order_qty = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_order_oper_way = " ";
    SET v_external_no = 0;
    SET v_pend_order_status = "0";
    SET v_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取待执行订单信息】*/
    call db_tdsecu.pra_tdsephif_GetPendOrderInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pend_order_id,
        v_error_code,
        v_error_info,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_pass_no,
        v_out_acco,
        v_exch_crncy_type,
        v_exch_no,
        v_stock_acco_no,
        v_stock_acco,
        v_stock_code_no,
        v_stock_code,
        v_trade_code_no,
        v_target_code_no,
        v_stock_type,
        v_asset_type,
        v_comm_id,
        v_comm_batch_no,
        v_order_date,
        v_order_time,
        v_order_batch_no,
        v_order_dir,
        v_price_type,
        v_exec_price_type,
        v_price_offset,
        v_order_qty,
        v_net_price_flag,
        v_intrst_days,
        v_par_value,
        v_bond_accr_intrst,
        v_bond_rate_type,
        v_impawn_ratio,
        v_order_oper_way,
        v_external_no,
        v_pend_order_status,
        v_remark_info,
        v_create_date,
        v_create_time,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.34.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取待执行订单信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_dir = v_order_dir;
    SET p_price_type = v_price_type;
    SET p_exec_price_type = v_exec_price_type;
    SET p_price_offset = v_price_offset;
    SET p_order_qty = v_order_qty;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_order_oper_way = v_order_oper_way;
    SET p_external_no = v_external_no;
    SET p_pend_order_status = v_pend_order_status;
    SET p_remark_info = v_remark_info;
    SET p_create_date = v_create_date;
    SET p_create_time = v_create_time;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取券源信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetStockSourceInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetStockSourceInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_acco_no int,
    IN p_co_busi_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_stock_code varchar(6),
    OUT p_exch_no int,
    OUT p_source_stock_qty decimal(18,2),
    OUT p_single_limit_qty decimal(18,2),
    OUT p_assigned_qty decimal(18,2),
    OUT p_trade_releas_qty decimal(18,2),
    OUT p_trade_capt_qty decimal(18,2),
    OUT p_strike_releas_qty decimal(18,2),
    OUT p_strike_capt_qty decimal(18,2),
    OUT p_over_night_pandl decimal(18,4),
    OUT p_sum_realize_pandl decimal(18,4),
    OUT p_total_open_posi_fee decimal(18,4),
    OUT p_total_close_posi_fee decimal(18,4),
    OUT p_out_order_releas_qty decimal(18,2),
    OUT p_out_order_capt_qty decimal(18,2),
    OUT p_out_strike_releas_qty decimal(18,2),
    OUT p_out_strike_capt_qty decimal(18,2),
    OUT p_remark_info varchar(255),
    OUT p_buy_avail_qty decimal(18,2),
    OUT p_sell_avail_qty decimal(18,2),
    OUT p_posi_qty decimal(18,2),
    OUT p_today_trade_fee decimal(18,4),
    OUT p_today_pandl decimal(18,4),
    OUT p_diff_qty decimal(18,2),
    OUT p_t0_buy_type int,
    OUT p_over_night_trade_buy_qty decimal(18,2),
    OUT p_over_night_trade_sell_qty decimal(18,2),
    OUT p_over_night_strike_sell_qty decimal(18,2),
    OUT p_over_night_sumtrd_sell_qty decimal(18,2),
    OUT p_over_night_sumstk_sell_qty decimal(18,2),
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
    declare v_busi_opor_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_acco_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_source_stock_qty decimal(18,2);
    declare v_single_limit_qty decimal(18,2);
    declare v_assigned_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_over_night_pandl decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
    declare v_total_open_posi_fee decimal(18,4);
    declare v_total_close_posi_fee decimal(18,4);
    declare v_out_order_releas_qty decimal(18,2);
    declare v_out_order_capt_qty decimal(18,2);
    declare v_out_strike_releas_qty decimal(18,2);
    declare v_out_strike_capt_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_buy_avail_qty decimal(18,2);
    declare v_sell_avail_qty decimal(18,2);
    declare v_posi_qty decimal(18,2);
    declare v_today_trade_fee decimal(18,4);
    declare v_today_pandl decimal(18,4);
    declare v_diff_qty decimal(18,2);
    declare v_t0_buy_type int;
    declare v_over_night_trade_buy_qty decimal(18,2);
    declare v_over_night_trade_sell_qty decimal(18,2);
    declare v_over_night_strike_sell_qty decimal(18,2);
    declare v_over_night_sumtrd_sell_qty decimal(18,2);
    declare v_over_night_sumstk_sell_qty decimal(18,2);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_stock_code = " ";
    SET v_exch_no = 0;
    SET v_source_stock_qty = 0;
    SET v_single_limit_qty = 0;
    SET v_assigned_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_over_night_pandl = 0;
    SET v_sum_realize_pandl = 0;
    SET v_total_open_posi_fee = 0;
    SET v_total_close_posi_fee = 0;
    SET v_out_order_releas_qty = 0;
    SET v_out_order_capt_qty = 0;
    SET v_out_strike_releas_qty = 0;
    SET v_out_strike_capt_qty = 0;
    SET v_remark_info = " ";
    SET v_buy_avail_qty = 0;
    SET v_sell_avail_qty = 0;
    SET v_posi_qty = 0;
    SET v_today_trade_fee = 0;
    SET v_today_pandl = 0;
    SET v_diff_qty = 0;
    SET v_t0_buy_type = 0;
    SET v_over_night_trade_buy_qty = 0;
    SET v_over_night_trade_sell_qty = 0;
    SET v_over_night_strike_sell_qty = 0;
    SET v_over_night_sumtrd_sell_qty = 0;
    SET v_over_night_sumstk_sell_qty = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取券源信息】*/
    call db_tdsecu.pra_tdsephif_GetStockSourceInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_opor_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_stock_code_no,
        v_stock_acco_no,
        v_co_busi_config_str,
        v_error_code,
        v_error_info,
        v_row_id,
        v_co_no,
        v_pd_no,
        v_stock_code,
        v_exch_no,
        v_source_stock_qty,
        v_single_limit_qty,
        v_assigned_qty,
        v_trade_releas_qty,
        v_trade_capt_qty,
        v_strike_releas_qty,
        v_strike_capt_qty,
        v_over_night_pandl,
        v_sum_realize_pandl,
        v_total_open_posi_fee,
        v_total_close_posi_fee,
        v_out_order_releas_qty,
        v_out_order_capt_qty,
        v_out_strike_releas_qty,
        v_out_strike_capt_qty,
        v_remark_info,
        v_buy_avail_qty,
        v_sell_avail_qty,
        v_posi_qty,
        v_today_trade_fee,
        v_today_pandl,
        v_diff_qty,
        v_t0_buy_type,
        v_over_night_trade_buy_qty,
        v_over_night_trade_sell_qty,
        v_over_night_strike_sell_qty,
        v_over_night_sumtrd_sell_qty,
        v_over_night_sumstk_sell_qty,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.35.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取券源信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_stock_code = v_stock_code;
    SET p_exch_no = v_exch_no;
    SET p_source_stock_qty = v_source_stock_qty;
    SET p_single_limit_qty = v_single_limit_qty;
    SET p_assigned_qty = v_assigned_qty;
    SET p_trade_releas_qty = v_trade_releas_qty;
    SET p_trade_capt_qty = v_trade_capt_qty;
    SET p_strike_releas_qty = v_strike_releas_qty;
    SET p_strike_capt_qty = v_strike_capt_qty;
    SET p_over_night_pandl = v_over_night_pandl;
    SET p_sum_realize_pandl = v_sum_realize_pandl;
    SET p_total_open_posi_fee = v_total_open_posi_fee;
    SET p_total_close_posi_fee = v_total_close_posi_fee;
    SET p_out_order_releas_qty = v_out_order_releas_qty;
    SET p_out_order_capt_qty = v_out_order_capt_qty;
    SET p_out_strike_releas_qty = v_out_strike_releas_qty;
    SET p_out_strike_capt_qty = v_out_strike_capt_qty;
    SET p_remark_info = v_remark_info;
    SET p_buy_avail_qty = v_buy_avail_qty;
    SET p_sell_avail_qty = v_sell_avail_qty;
    SET p_posi_qty = v_posi_qty;
    SET p_today_trade_fee = v_today_trade_fee;
    SET p_today_pandl = v_today_pandl;
    SET p_diff_qty = v_diff_qty;
    SET p_t0_buy_type = v_t0_buy_type;
    SET p_over_night_trade_buy_qty = v_over_night_trade_buy_qty;
    SET p_over_night_trade_sell_qty = v_over_night_trade_sell_qty;
    SET p_over_night_strike_sell_qty = v_over_night_strike_sell_qty;
    SET p_over_night_sumtrd_sell_qty = v_over_night_sumtrd_sell_qty;
    SET p_over_night_sumstk_sell_qty = v_over_night_sumstk_sell_qty;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取t0持仓明细信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetT0PosiDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetT0PosiDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_acco_no int,
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_lngsht_type int;
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_date int;
    declare v_open_posi_time int;
    declare v_open_posi_price decimal(16,9);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_close_posi_qty decimal(18,2);
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_strike_no varchar(64);
    declare v_realize_pandl decimal(18,4);
    declare v_over_night_pandl decimal(18,4);
    declare v_posi_status varchar(2);
    declare v_remark_info varchar(255);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_lngsht_type = 0;
    SET v_curr_qty = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_open_posi_time = date_format(curtime(),'%H%i%s');
    SET v_open_posi_price = 0;
    SET v_open_posi_value = 0;
    SET v_open_posi_fee = 0;
    SET v_close_posi_qty = 0;
    SET v_close_posi_market_value = 0;
    SET v_close_posi_fee = 0;
    SET v_strike_no = " ";
    SET v_realize_pandl = 0;
    SET v_over_night_pandl = 0;
    SET v_posi_status = "0";
    SET v_remark_info = " ";
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取t0持仓明细信息】*/
    call db_tdsecu.pra_tdsephif_GetT0PosiDetail(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_asset_acco_no,
        v_stock_code_no,
        v_stock_acco_no,
        v_error_code,
        v_error_info,
        v_row_id,
        v_co_no,
        v_pd_no,
        v_exch_no,
        v_stock_code,
        v_lngsht_type,
        v_curr_qty,
        v_open_posi_date,
        v_open_posi_time,
        v_open_posi_price,
        v_open_posi_value,
        v_open_posi_fee,
        v_close_posi_qty,
        v_close_posi_market_value,
        v_close_posi_fee,
        v_strike_no,
        v_realize_pandl,
        v_over_night_pandl,
        v_posi_status,
        v_remark_info,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.36.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取t0持仓明细信息出现错误！',v_mysql_message);
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

# 事务_交易证券_主推接口_获取账户汇总信息查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetAccTotalInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetAccTotalInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_amt decimal(18,4),
    OUT p_trade_qty decimal(18,2),
    OUT p_realize_pandl decimal(18,4),
    OUT p_yield_rate decimal(18,12),
    OUT p_all_fee decimal(18,4),
    OUT p_over_night_pandl decimal(18,4),
    OUT p_sum_realize_pandl decimal(18,4),
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
    declare v_co_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_amt decimal(18,4);
    declare v_trade_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_yield_rate decimal(18,12);
    declare v_all_fee decimal(18,4);
    declare v_over_night_pandl decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_amt = 0;
    SET v_trade_qty = 0;
    SET v_realize_pandl = 0;
    SET v_yield_rate = 0;
    SET v_all_fee = 0;
    SET v_over_night_pandl = 0;
    SET v_sum_realize_pandl = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取账户汇总信息查询】*/
    call db_tdsecu.pra_tdset0if_GetAccTotalInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_error_code,
        v_error_info,
        v_trade_amt,
        v_trade_qty,
        v_realize_pandl,
        v_yield_rate,
        v_all_fee,
        v_over_night_pandl,
        v_sum_realize_pandl,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.37.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取账户汇总信息查询出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_amt = v_trade_amt;
    SET p_trade_qty = v_trade_qty;
    SET p_realize_pandl = v_realize_pandl;
    SET p_yield_rate = v_yield_rate;
    SET p_all_fee = v_all_fee;
    SET p_over_night_pandl = v_over_night_pandl;
    SET p_sum_realize_pandl = v_sum_realize_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取t0操作员可用金额
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetOpeatorAvailCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetOpeatorAvailCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_co_busi_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_avail_amt decimal(18,4),
    OUT p_sum_realize_pandl decimal(18,4),
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
    declare v_co_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_avail_amt decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_avail_amt = 0;
    SET v_sum_realize_pandl = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取t0操作员可用金额】*/
    call db_tdsecu.pra_tdset0_GetOpeatorAvailCapital(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_busi_config_str,
        v_error_code,
        v_error_info,
        v_avail_amt,
        v_sum_realize_pandl,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.38.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取t0操作员可用金额出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_avail_amt = v_avail_amt;
    SET p_sum_realize_pandl = v_sum_realize_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取操作员阀值设置信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetOporTsholdSet;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetOporTsholdSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_curr_amt decimal(18,4),
    OUT p_frozen_amt decimal(18,4),
    OUT p_opor_warn_tshold decimal(18,4),
    OUT p_opor_stop_tshold decimal(18,4),
    OUT p_order_limit_time int,
    OUT p_per_secu_posi_ratio decimal(18,12),
    OUT p_posi_limit_time int,
    OUT p_order_ctrl_qty decimal(18,2),
    OUT p_order_ctrl_amt decimal(18,4),
    OUT p_stock_warn_ratio decimal(18,12),
    OUT p_stock_stop_ratio decimal(18,12),
    OUT p_stock_warn_amt decimal(18,4),
    OUT p_stock_stop_amt decimal(18,4),
    OUT p_trig_oper_type int,
    OUT p_open_close_permission int,
    OUT p_risk_oper int,
    OUT p_fee_calc_type int,
    OUT p_permit_margin_trade int,
    OUT p_buy_fee_ratio decimal(18,12),
    OUT p_sell_fee_ratio decimal(18,12),
    OUT p_buy_min_fee decimal(18,4),
    OUT p_sell_min_fee decimal(18,4),
    OUT p_trade_capt_amt decimal(18,4),
    OUT p_trade_releas_amt decimal(18,4),
    OUT p_strike_capt_amt decimal(18,4),
    OUT p_strike_releas_amt decimal(18,4),
    OUT p_sum_realize_pandl decimal(18,4),
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
    declare v_query_opor_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_order_limit_time int;
    declare v_per_secu_posi_ratio decimal(18,12);
    declare v_posi_limit_time int;
    declare v_order_ctrl_qty decimal(18,2);
    declare v_order_ctrl_amt decimal(18,4);
    declare v_stock_warn_ratio decimal(18,12);
    declare v_stock_stop_ratio decimal(18,12);
    declare v_stock_warn_amt decimal(18,4);
    declare v_stock_stop_amt decimal(18,4);
    declare v_trig_oper_type int;
    declare v_open_close_permission int;
    declare v_risk_oper int;
    declare v_fee_calc_type int;
    declare v_permit_margin_trade int;
    declare v_buy_fee_ratio decimal(18,12);
    declare v_sell_fee_ratio decimal(18,12);
    declare v_buy_min_fee decimal(18,4);
    declare v_sell_min_fee decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_opor_warn_tshold = 0;
    SET v_opor_stop_tshold = 0;
    SET v_order_limit_time = 0;
    SET v_per_secu_posi_ratio = 0;
    SET v_posi_limit_time = 5;
    SET v_order_ctrl_qty = 0;
    SET v_order_ctrl_amt = 0;
    SET v_stock_warn_ratio = 0;
    SET v_stock_stop_ratio = 0;
    SET v_stock_warn_amt = 0;
    SET v_stock_stop_amt = 0;
    SET v_trig_oper_type = 0;
    SET v_open_close_permission = 0;
    SET v_risk_oper = 0;
    SET v_fee_calc_type = 0;
    SET v_permit_margin_trade = 0;
    SET v_buy_fee_ratio = 0;
    SET v_sell_fee_ratio = 0;
    SET v_buy_min_fee = 0;
    SET v_sell_min_fee = 0;
    SET v_trade_capt_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_capt_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_sum_realize_pandl = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取操作员阀值设置信息】*/
    call db_tdsecu.pra_tdsephif_GetOporTsholdSet(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_opor_no,
        v_error_code,
        v_error_info,
        v_co_no,
        v_curr_amt,
        v_frozen_amt,
        v_opor_warn_tshold,
        v_opor_stop_tshold,
        v_order_limit_time,
        v_per_secu_posi_ratio,
        v_posi_limit_time,
        v_order_ctrl_qty,
        v_order_ctrl_amt,
        v_stock_warn_ratio,
        v_stock_stop_ratio,
        v_stock_warn_amt,
        v_stock_stop_amt,
        v_trig_oper_type,
        v_open_close_permission,
        v_risk_oper,
        v_fee_calc_type,
        v_permit_margin_trade,
        v_buy_fee_ratio,
        v_sell_fee_ratio,
        v_buy_min_fee,
        v_sell_min_fee,
        v_trade_capt_amt,
        v_trade_releas_amt,
        v_strike_capt_amt,
        v_strike_releas_amt,
        v_sum_realize_pandl,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.39.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取操作员阀值设置信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_curr_amt = v_curr_amt;
    SET p_frozen_amt = v_frozen_amt;
    SET p_opor_warn_tshold = v_opor_warn_tshold;
    SET p_opor_stop_tshold = v_opor_stop_tshold;
    SET p_order_limit_time = v_order_limit_time;
    SET p_per_secu_posi_ratio = v_per_secu_posi_ratio;
    SET p_posi_limit_time = v_posi_limit_time;
    SET p_order_ctrl_qty = v_order_ctrl_qty;
    SET p_order_ctrl_amt = v_order_ctrl_amt;
    SET p_stock_warn_ratio = v_stock_warn_ratio;
    SET p_stock_stop_ratio = v_stock_stop_ratio;
    SET p_stock_warn_amt = v_stock_warn_amt;
    SET p_stock_stop_amt = v_stock_stop_amt;
    SET p_trig_oper_type = v_trig_oper_type;
    SET p_open_close_permission = v_open_close_permission;
    SET p_risk_oper = v_risk_oper;
    SET p_fee_calc_type = v_fee_calc_type;
    SET p_permit_margin_trade = v_permit_margin_trade;
    SET p_buy_fee_ratio = v_buy_fee_ratio;
    SET p_sell_fee_ratio = v_sell_fee_ratio;
    SET p_buy_min_fee = v_buy_min_fee;
    SET p_sell_min_fee = v_sell_min_fee;
    SET p_trade_capt_amt = v_trade_capt_amt;
    SET p_trade_releas_amt = v_trade_releas_amt;
    SET p_strike_capt_amt = v_strike_capt_amt;
    SET p_strike_releas_amt = v_strike_releas_amt;
    SET p_sum_realize_pandl = v_sum_realize_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取t0持仓汇总信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetT0SumPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetT0SumPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_no int,
    OUT p_stock_code varchar(6),
    OUT p_total_long_curr_qty decimal(18,2),
    OUT p_total_short_curr_qty decimal(18,2),
    OUT p_total_long_open_posi_value decimal(18,4),
    OUT p_total_short_open_posi_value decimal(18,4),
    OUT p_total_long_open_posi_fee decimal(18,4),
    OUT p_total_short_open_posi_fee decimal(18,4),
    OUT p_total_long_close_posi_value decimal(18,4),
    OUT p_total_short_close_posi_value decimal(18,4),
    OUT p_total_long_close_posi_qty decimal(18,2),
    OUT p_total_short_close_posi_qty decimal(18,2),
    OUT p_total_long_close_posi_fee decimal(18,4),
    OUT p_total_short_close_posi_fee decimal(18,4),
    OUT p_total_realize_pandl decimal(18,4),
    OUT p_long_curr_qty decimal(18,2),
    OUT p_short_curr_qty decimal(18,2),
    OUT p_long_open_posi_value decimal(18,4),
    OUT p_short_open_posi_value decimal(18,4),
    OUT p_long_open_posi_fee decimal(18,4),
    OUT p_short_open_posi_fee decimal(18,4),
    OUT p_long_close_posi_qty decimal(18,2),
    OUT p_short_close_posi_qty decimal(18,2),
    OUT p_long_close_posi_value decimal(18,4),
    OUT p_short_close_posi_value decimal(18,4),
    OUT p_long_close_posi_fee decimal(18,4),
    OUT p_short_close_posi_fee decimal(18,4),
    OUT p_realize_pandl decimal(18,4),
    OUT p_over_night_pandl decimal(18,4),
    OUT p_open_posi_date int,
    OUT p_open_posi_time int,
    OUT p_posi_qty decimal(18,2),
    OUT p_curr_qty decimal(18,2),
    OUT p_open_posi_value decimal(18,4),
    OUT p_open_posi_fee decimal(18,4),
    OUT p_cost_price decimal(16,9),
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_total_long_curr_qty decimal(18,2);
    declare v_total_short_curr_qty decimal(18,2);
    declare v_total_long_open_posi_value decimal(18,4);
    declare v_total_short_open_posi_value decimal(18,4);
    declare v_total_long_open_posi_fee decimal(18,4);
    declare v_total_short_open_posi_fee decimal(18,4);
    declare v_total_long_close_posi_value decimal(18,4);
    declare v_total_short_close_posi_value decimal(18,4);
    declare v_total_long_close_posi_qty decimal(18,2);
    declare v_total_short_close_posi_qty decimal(18,2);
    declare v_total_long_close_posi_fee decimal(18,4);
    declare v_total_short_close_posi_fee decimal(18,4);
    declare v_total_realize_pandl decimal(18,4);
    declare v_long_curr_qty decimal(18,2);
    declare v_short_curr_qty decimal(18,2);
    declare v_long_open_posi_value decimal(18,4);
    declare v_short_open_posi_value decimal(18,4);
    declare v_long_open_posi_fee decimal(18,4);
    declare v_short_open_posi_fee decimal(18,4);
    declare v_long_close_posi_qty decimal(18,2);
    declare v_short_close_posi_qty decimal(18,2);
    declare v_long_close_posi_value decimal(18,4);
    declare v_short_close_posi_value decimal(18,4);
    declare v_long_close_posi_fee decimal(18,4);
    declare v_short_close_posi_fee decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_over_night_pandl decimal(18,4);
    declare v_open_posi_date int;
    declare v_open_posi_time int;
    declare v_posi_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_cost_price decimal(16,9);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_total_long_curr_qty = 0;
    SET v_total_short_curr_qty = 0;
    SET v_total_long_open_posi_value = 0;
    SET v_total_short_open_posi_value = 0;
    SET v_total_long_open_posi_fee = 0;
    SET v_total_short_open_posi_fee = 0;
    SET v_total_long_close_posi_value = 0;
    SET v_total_short_close_posi_value = 0;
    SET v_total_long_close_posi_qty = 0;
    SET v_total_short_close_posi_qty = 0;
    SET v_total_long_close_posi_fee = 0;
    SET v_total_short_close_posi_fee = 0;
    SET v_total_realize_pandl = 0;
    SET v_long_curr_qty = 0;
    SET v_short_curr_qty = 0;
    SET v_long_open_posi_value = 0;
    SET v_short_open_posi_value = 0;
    SET v_long_open_posi_fee = 0;
    SET v_short_open_posi_fee = 0;
    SET v_long_close_posi_qty = 0;
    SET v_short_close_posi_qty = 0;
    SET v_long_close_posi_value = 0;
    SET v_short_close_posi_value = 0;
    SET v_long_close_posi_fee = 0;
    SET v_short_close_posi_fee = 0;
    SET v_realize_pandl = 0;
    SET v_over_night_pandl = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_open_posi_time = date_format(curtime(),'%H%i%s');
    SET v_posi_qty = 0;
    SET v_curr_qty = 0;
    SET v_open_posi_value = 0;
    SET v_open_posi_fee = 0;
    SET v_cost_price = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取t0持仓汇总信息】*/
    call db_tdsecu.pra_tdsephif_GetT0SumPosi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_asset_acco_no,
        v_stock_code_no,
        v_stock_acco_no,
        v_error_code,
        v_error_info,
        v_row_id,
        v_co_no,
        v_pd_no,
        v_exch_no,
        v_stock_code,
        v_total_long_curr_qty,
        v_total_short_curr_qty,
        v_total_long_open_posi_value,
        v_total_short_open_posi_value,
        v_total_long_open_posi_fee,
        v_total_short_open_posi_fee,
        v_total_long_close_posi_value,
        v_total_short_close_posi_value,
        v_total_long_close_posi_qty,
        v_total_short_close_posi_qty,
        v_total_long_close_posi_fee,
        v_total_short_close_posi_fee,
        v_total_realize_pandl,
        v_long_curr_qty,
        v_short_curr_qty,
        v_long_open_posi_value,
        v_short_open_posi_value,
        v_long_open_posi_fee,
        v_short_open_posi_fee,
        v_long_close_posi_qty,
        v_short_close_posi_qty,
        v_long_close_posi_value,
        v_short_close_posi_value,
        v_long_close_posi_fee,
        v_short_close_posi_fee,
        v_realize_pandl,
        v_over_night_pandl,
        v_open_posi_date,
        v_open_posi_time,
        v_posi_qty,
        v_curr_qty,
        v_open_posi_value,
        v_open_posi_fee,
        v_cost_price,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.40.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取t0持仓汇总信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_code = v_stock_code;
    SET p_total_long_curr_qty = v_total_long_curr_qty;
    SET p_total_short_curr_qty = v_total_short_curr_qty;
    SET p_total_long_open_posi_value = v_total_long_open_posi_value;
    SET p_total_short_open_posi_value = v_total_short_open_posi_value;
    SET p_total_long_open_posi_fee = v_total_long_open_posi_fee;
    SET p_total_short_open_posi_fee = v_total_short_open_posi_fee;
    SET p_total_long_close_posi_value = v_total_long_close_posi_value;
    SET p_total_short_close_posi_value = v_total_short_close_posi_value;
    SET p_total_long_close_posi_qty = v_total_long_close_posi_qty;
    SET p_total_short_close_posi_qty = v_total_short_close_posi_qty;
    SET p_total_long_close_posi_fee = v_total_long_close_posi_fee;
    SET p_total_short_close_posi_fee = v_total_short_close_posi_fee;
    SET p_total_realize_pandl = v_total_realize_pandl;
    SET p_long_curr_qty = v_long_curr_qty;
    SET p_short_curr_qty = v_short_curr_qty;
    SET p_long_open_posi_value = v_long_open_posi_value;
    SET p_short_open_posi_value = v_short_open_posi_value;
    SET p_long_open_posi_fee = v_long_open_posi_fee;
    SET p_short_open_posi_fee = v_short_open_posi_fee;
    SET p_long_close_posi_qty = v_long_close_posi_qty;
    SET p_short_close_posi_qty = v_short_close_posi_qty;
    SET p_long_close_posi_value = v_long_close_posi_value;
    SET p_short_close_posi_value = v_short_close_posi_value;
    SET p_long_close_posi_fee = v_long_close_posi_fee;
    SET p_short_close_posi_fee = v_short_close_posi_fee;
    SET p_realize_pandl = v_realize_pandl;
    SET p_over_night_pandl = v_over_night_pandl;
    SET p_open_posi_date = v_open_posi_date;
    SET p_open_posi_time = v_open_posi_time;
    SET p_posi_qty = v_posi_qty;
    SET p_curr_qty = v_curr_qty;
    SET p_open_posi_value = v_open_posi_value;
    SET p_open_posi_fee = v_open_posi_fee;
    SET p_cost_price = v_cost_price;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取预埋单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetPreOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetPreOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pre_order_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_oper_func_code varchar(16),
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_stock_type int,
    OUT p_pre_order_date int,
    OUT p_pre_order_time int,
    OUT p_pre_order_dir int,
    OUT p_pre_order_type int,
    OUT p_pre_order_price decimal(16,9),
    OUT p_pre_order_qty decimal(18,2),
    OUT p_pre_order_status varchar(2),
    OUT p_pre_price_type int,
    OUT p_price_offset decimal(16,9),
    OUT p_pre_begin_date int,
    OUT p_pre_end_date int,
    OUT p_pre_begin_time int,
    OUT p_pre_end_time int,
    OUT p_trig_type int,
    OUT p_trig_price decimal(16,9),
    OUT p_trig_date int,
    OUT p_trig_time int,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_id bigint,
    OUT p_is_trace int,
    OUT p_price_up decimal(16,9),
    OUT p_keep_trace int,
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
    declare v_pre_order_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_pre_order_date int;
    declare v_pre_order_time int;
    declare v_pre_order_dir int;
    declare v_pre_order_type int;
    declare v_pre_order_price decimal(16,9);
    declare v_pre_order_qty decimal(18,2);
    declare v_pre_order_status varchar(2);
    declare v_pre_price_type int;
    declare v_price_offset decimal(16,9);
    declare v_pre_begin_date int;
    declare v_pre_end_date int;
    declare v_pre_begin_time int;
    declare v_pre_end_time int;
    declare v_trig_type int;
    declare v_trig_price decimal(16,9);
    declare v_trig_date int;
    declare v_trig_time int;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_id bigint;
    declare v_is_trace int;
    declare v_price_up decimal(16,9);
    declare v_keep_trace int;
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
    SET v_pre_order_id = p_pre_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_stock_type = 0;
    SET v_pre_order_date = date_format(curdate(),'%Y%m%d');
    SET v_pre_order_time = date_format(curtime(),'%H%i%s');
    SET v_pre_order_dir = 0;
    SET v_pre_order_type = 0;
    SET v_pre_order_price = 0;
    SET v_pre_order_qty = 0;
    SET v_pre_order_status = "0";
    SET v_pre_price_type = 0;
    SET v_price_offset = 0;
    SET v_pre_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_pre_end_date = date_format(curdate(),'%Y%m%d');
    SET v_pre_begin_time = date_format(curtime(),'%H%i%s');
    SET v_pre_end_time = date_format(curtime(),'%H%i%s');
    SET v_trig_type = 0;
    SET v_trig_price = 0;
    SET v_trig_date = date_format(curdate(),'%Y%m%d');
    SET v_trig_time = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_id = 0;
    SET v_is_trace = 0;
    SET v_price_up = 0;
    SET v_keep_trace = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

        /* 调用【原子_交易证券_主推接口_获取预埋单信息】*/
        call db_tdsecu.pra_tdsephif_GetPreOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pre_order_id,
            v_error_code,
            v_error_info,
            v_row_id,
            v_oper_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_crncy_type,
            v_exch_no,
            v_stock_acco_no,
            v_stock_acco,
            v_stock_code_no,
            v_stock_code,
            v_stock_type,
            v_pre_order_date,
            v_pre_order_time,
            v_pre_order_dir,
            v_pre_order_type,
            v_pre_order_price,
            v_pre_order_qty,
            v_pre_order_status,
            v_pre_price_type,
            v_price_offset,
            v_pre_begin_date,
            v_pre_end_date,
            v_pre_begin_time,
            v_pre_end_time,
            v_trig_type,
            v_trig_price,
            v_trig_date,
            v_trig_time,
            v_order_date,
            v_order_time,
            v_order_id,
            v_is_trace,
            v_price_up,
            v_keep_trace,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.9.41.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取预埋单信息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_oper_func_code = v_oper_func_code;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_type = v_stock_type;
    SET p_pre_order_date = v_pre_order_date;
    SET p_pre_order_time = v_pre_order_time;
    SET p_pre_order_dir = v_pre_order_dir;
    SET p_pre_order_type = v_pre_order_type;
    SET p_pre_order_price = v_pre_order_price;
    SET p_pre_order_qty = v_pre_order_qty;
    SET p_pre_order_status = v_pre_order_status;
    SET p_pre_price_type = v_pre_price_type;
    SET p_price_offset = v_price_offset;
    SET p_pre_begin_date = v_pre_begin_date;
    SET p_pre_end_date = v_pre_end_date;
    SET p_pre_begin_time = v_pre_begin_time;
    SET p_pre_end_time = v_pre_end_time;
    SET p_trig_type = v_trig_type;
    SET p_trig_price = v_trig_price;
    SET p_trig_date = v_trig_date;
    SET p_trig_time = v_trig_time;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_id = v_order_id;
    SET p_is_trace = v_is_trace;
    SET p_price_up = v_price_up;
    SET p_keep_trace = v_keep_trace;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取组合交易流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetComboTradeLog;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetComboTradeLog(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_batch_no int,
    IN p_combo_code varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_order_dir int,
    OUT p_combo_copies decimal(18,2),
    OUT p_combo_date int,
    OUT p_combo_time int,
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
    declare v_order_batch_no int;
    declare v_combo_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_order_dir int;
    declare v_combo_copies decimal(18,2);
    declare v_combo_date int;
    declare v_combo_time int;
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
    SET v_order_batch_no = p_order_batch_no;
    SET v_combo_code = p_combo_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_order_dir = 0;
    SET v_combo_copies = 0;
    SET v_combo_date = date_format(curdate(),'%Y%m%d');
    SET v_combo_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取组合交易流水记录】*/
    call db_tdsecu.pra_tdsephif_GetComboTradeLog(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_batch_no,
        v_combo_code,
        v_error_code,
        v_error_info,
        v_row_id,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_order_dir,
        v_combo_copies,
        v_combo_date,
        v_combo_time,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.42.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取组合交易流水记录出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_order_dir = v_order_dir;
    SET p_combo_copies = v_combo_copies;
    SET p_combo_date = v_combo_date;
    SET p_combo_time = v_combo_time;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取组合持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetComboPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetComboPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_combo_code varchar(32),
    IN p_stock_code_no int,
    IN p_open_posi_date int,
    IN p_combo_posi_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_stock_code varchar(6),
    OUT p_exch_no int,
    OUT p_curr_qty decimal(18,2),
    OUT p_posi_qty decimal(18,2),
    OUT p_frozen_qty decimal(18,2),
    OUT p_unfroz_qty decimal(18,2),
    OUT p_pre_settle_qty decimal(18,2),
    OUT p_trade_frozen_qty decimal(18,2),
    OUT p_trade_unfroz_qty decimal(18,2),
    OUT p_trade_capt_qty decimal(18,2),
    OUT p_trade_releas_qty decimal(18,2),
    OUT p_strike_capt_qty decimal(18,2),
    OUT p_strike_releas_qty decimal(18,2),
    OUT p_strike_frozen_qty decimal(18,2),
    OUT p_strike_unfroz_qty decimal(18,2),
    OUT p_realize_pandl decimal(18,4),
    OUT p_cost_amt decimal(18,4),
    OUT p_intrst_cost_amt decimal(18,4),
    OUT p_intrst_pandl decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_combo_code varchar(32);
    declare v_stock_code_no int;
    declare v_open_posi_date int;
    declare v_combo_posi_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_curr_qty decimal(18,2);
    declare v_posi_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_trade_unfroz_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_strike_frozen_qty decimal(18,2);
    declare v_strike_unfroz_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_combo_code = p_combo_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_open_posi_date = p_open_posi_date;
    SET v_combo_posi_id = p_combo_posi_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_stock_code = " ";
    SET v_exch_no = 0;
    SET v_curr_qty = 0;
    SET v_posi_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_trade_frozen_qty = 0;
    SET v_trade_unfroz_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_strike_frozen_qty = 0;
    SET v_strike_unfroz_qty = 0;
    SET v_realize_pandl = 0;
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取组合持仓】*/
    call db_tdsecu.pra_tdsephif_GetComboPosi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_asset_acco_no,
        v_stock_acco_no,
        v_combo_code,
        v_stock_code_no,
        v_open_posi_date,
        v_combo_posi_id,
        v_error_code,
        v_error_info,
        v_row_id,
        v_co_no,
        v_pd_no,
        v_stock_code,
        v_exch_no,
        v_curr_qty,
        v_posi_qty,
        v_frozen_qty,
        v_unfroz_qty,
        v_pre_settle_qty,
        v_trade_frozen_qty,
        v_trade_unfroz_qty,
        v_trade_capt_qty,
        v_trade_releas_qty,
        v_strike_capt_qty,
        v_strike_releas_qty,
        v_strike_frozen_qty,
        v_strike_unfroz_qty,
        v_realize_pandl,
        v_cost_amt,
        v_intrst_cost_amt,
        v_intrst_pandl,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.43.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取组合持仓出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_stock_code = v_stock_code;
    SET p_exch_no = v_exch_no;
    SET p_curr_qty = v_curr_qty;
    SET p_posi_qty = v_posi_qty;
    SET p_frozen_qty = v_frozen_qty;
    SET p_unfroz_qty = v_unfroz_qty;
    SET p_pre_settle_qty = v_pre_settle_qty;
    SET p_trade_frozen_qty = v_trade_frozen_qty;
    SET p_trade_unfroz_qty = v_trade_unfroz_qty;
    SET p_trade_capt_qty = v_trade_capt_qty;
    SET p_trade_releas_qty = v_trade_releas_qty;
    SET p_strike_capt_qty = v_strike_capt_qty;
    SET p_strike_releas_qty = v_strike_releas_qty;
    SET p_strike_frozen_qty = v_strike_frozen_qty;
    SET p_strike_unfroz_qty = v_strike_unfroz_qty;
    SET p_realize_pandl = v_realize_pandl;
    SET p_cost_amt = v_cost_amt;
    SET p_intrst_cost_amt = v_intrst_cost_amt;
    SET p_intrst_pandl = v_intrst_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取组合收益
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetComboIncome;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetComboIncome(
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
    IN p_combo_code varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_open_posi_date int,
    OUT p_combo_copies decimal(18,2),
    OUT p_combo_status varchar(2),
    OUT p_combo_cost decimal(18,4),
    OUT p_combo_market_value decimal(18,4),
    OUT p_realize_pandl decimal(18,4),
    OUT p_sum_realize_pandl decimal(18,4),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_combo_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_open_posi_date int;
    declare v_combo_copies decimal(18,2);
    declare v_combo_status varchar(2);
    declare v_combo_cost decimal(18,4);
    declare v_combo_market_value decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_combo_code = p_combo_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_combo_copies = 0;
    SET v_combo_status = "0";
    SET v_combo_cost = 0;
    SET v_combo_market_value = 0;
    SET v_realize_pandl = 0;
    SET v_sum_realize_pandl = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取组合收益】*/
    call db_tdsecu.pra_tdsephif_GetComboIncome(
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
        v_combo_code,
        v_error_code,
        v_error_info,
        v_row_id,
        v_open_posi_date,
        v_combo_copies,
        v_combo_status,
        v_combo_cost,
        v_combo_market_value,
        v_realize_pandl,
        v_sum_realize_pandl,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.44.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取组合收益出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_open_posi_date = v_open_posi_date;
    SET p_combo_copies = v_combo_copies;
    SET p_combo_status = v_combo_status;
    SET p_combo_cost = v_combo_cost;
    SET p_combo_market_value = v_combo_market_value;
    SET p_realize_pandl = v_realize_pandl;
    SET p_sum_realize_pandl = v_sum_realize_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetOrderInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_busi_opor_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_external_no bigint,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_opor int,
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_batch_no int,
    OUT p_order_dir int,
    OUT p_price_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_all_fee decimal(18,4),
    OUT p_stamp_tax decimal(18,4),
    OUT p_trans_fee decimal(18,4),
    OUT p_brkage_fee decimal(18,4),
    OUT p_SEC_charges decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_trade_tax decimal(18,4),
    OUT p_trade_cost_fee decimal(18,4),
    OUT p_trade_system_use_fee decimal(18,4),
    OUT p_stock_settle_fee decimal(18,4),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_rsp_info varchar(255),
    OUT p_compli_trig_id bigint,
    OUT p_remark_info varchar(255),
    OUT p_cost_calc_type int,
    OUT p_order_oper_way varchar(2),
    OUT p_exter_comm_flag int,
    OUT p_record_valid_flag int,
    OUT p_combo_code varchar(32),
    OUT p_combo_posi_id bigint,
    OUT p_strategy_id bigint,
    OUT p_asset_acco_type int,
    OUT p_contra_no varchar(32),
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
    declare v_order_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_busi_opor_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
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
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_cost_calc_type int;
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_strategy_id bigint;
    declare v_asset_acco_type int;
    declare v_contra_no varchar(32);
    declare v_update_times int;
    declare v_init_date int;

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
    SET v_order_id = p_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_busi_opor_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_batch_no = 0;
    SET v_order_dir = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_impawn_ratio = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_cost_calc_type = 0;
    SET v_order_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_record_valid_flag = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_strategy_id = 0;
    SET v_asset_acco_type = 0;
    SET v_contra_no = " ";
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取订单信息】*/
    call db_tdsecu.pra_tdsephif_GetOrderInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_id,
        v_error_code,
        v_error_info,
        v_init_date,
        v_busi_opor_no,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_pass_no,
        v_out_acco,
        v_exch_crncy_type,
        v_exch_no,
        v_stock_acco_no,
        v_stock_acco,
        v_stock_code_no,
        v_stock_code,
        v_trade_code_no,
        v_target_code_no,
        v_stock_type,
        v_asset_type,
        v_external_no,
        v_comm_id,
        v_comm_batch_no,
        v_comm_opor,
        v_report_date,
        v_report_time,
        v_report_no,
        v_order_date,
        v_order_time,
        v_order_batch_no,
        v_order_dir,
        v_price_type,
        v_order_price,
        v_order_qty,
        v_order_status,
        v_wtdraw_qty,
        v_strike_amt,
        v_strike_qty,
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
        v_net_price_flag,
        v_intrst_days,
        v_par_value,
        v_bond_accr_intrst,
        v_bond_rate_type,
        v_strike_bond_accr_intrst,
        v_impawn_ratio,
        v_order_frozen_amt,
        v_order_frozen_qty,
        v_rsp_info,
        v_compli_trig_id,
        v_remark_info,
        v_cost_calc_type,
        v_order_oper_way,
        v_exter_comm_flag,
        v_record_valid_flag,
        v_combo_code,
        v_combo_posi_id,
        v_strategy_id,
        v_asset_acco_type,
        v_contra_no,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.45.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取订单信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_external_no = v_external_no;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_opor = v_comm_opor;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_dir = v_order_dir;
    SET p_price_type = v_price_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_status = v_order_status;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_all_fee = v_all_fee;
    SET p_stamp_tax = v_stamp_tax;
    SET p_trans_fee = v_trans_fee;
    SET p_brkage_fee = v_brkage_fee;
    SET p_SEC_charges = v_SEC_charges;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_trade_tax = v_trade_tax;
    SET p_trade_cost_fee = v_trade_cost_fee;
    SET p_trade_system_use_fee = v_trade_system_use_fee;
    SET p_stock_settle_fee = v_stock_settle_fee;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_rsp_info = v_rsp_info;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_remark_info = v_remark_info;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_order_oper_way = v_order_oper_way;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_record_valid_flag = v_record_valid_flag;
    SET p_combo_code = v_combo_code;
    SET p_combo_posi_id = v_combo_posi_id;
    SET p_strategy_id = v_strategy_id;
    SET p_asset_acco_type = v_asset_acco_type;
    SET p_contra_no = v_contra_no;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取操作员可用交易组资金信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetOporAllowExchGroupCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetOporAllowExchGroupCapital(
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
    IN p_busi_opor_no int,
    IN p_exch_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_begin_amt decimal(18,4),
    OUT p_curr_amt decimal(18,4),
    OUT p_frozen_amt decimal(18,4),
    OUT p_unfroz_amt decimal(18,4),
    OUT p_comm_frozen_amt decimal(18,4),
    OUT p_comm_unfroz_amt decimal(18,4),
    OUT p_comm_capt_amt decimal(18,4),
    OUT p_comm_releas_amt decimal(18,4),
    OUT p_trade_frozen_amt decimal(18,4),
    OUT p_trade_unfroz_amt decimal(18,4),
    OUT p_trade_capt_amt decimal(18,4),
    OUT p_trade_releas_amt decimal(18,4),
    OUT p_strike_capt_amt decimal(18,4),
    OUT p_strike_releas_amt decimal(18,4),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_busi_opor_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_unfroz_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_comm_releas_amt decimal(18,4);
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_unfroz_amt decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_unfroz_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_comm_releas_amt = 0;
    SET v_trade_frozen_amt = 0;
    SET v_trade_unfroz_amt = 0;
    SET v_trade_capt_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_capt_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取操作员可用交易组资金信息】*/
    call db_tdsecu.pra_tdsephif_GetOporAllowExchGroupCapital(
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
        v_busi_opor_no,
        v_exch_crncy_type,
        v_error_code,
        v_error_info,
        v_row_id,
        v_begin_amt,
        v_curr_amt,
        v_frozen_amt,
        v_unfroz_amt,
        v_comm_frozen_amt,
        v_comm_unfroz_amt,
        v_comm_capt_amt,
        v_comm_releas_amt,
        v_trade_frozen_amt,
        v_trade_unfroz_amt,
        v_trade_capt_amt,
        v_trade_releas_amt,
        v_strike_capt_amt,
        v_strike_releas_amt,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.46.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取操作员可用交易组资金信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_begin_amt = v_begin_amt;
    SET p_curr_amt = v_curr_amt;
    SET p_frozen_amt = v_frozen_amt;
    SET p_unfroz_amt = v_unfroz_amt;
    SET p_comm_frozen_amt = v_comm_frozen_amt;
    SET p_comm_unfroz_amt = v_comm_unfroz_amt;
    SET p_comm_capt_amt = v_comm_capt_amt;
    SET p_comm_releas_amt = v_comm_releas_amt;
    SET p_trade_frozen_amt = v_trade_frozen_amt;
    SET p_trade_unfroz_amt = v_trade_unfroz_amt;
    SET p_trade_capt_amt = v_trade_capt_amt;
    SET p_trade_releas_amt = v_trade_releas_amt;
    SET p_strike_capt_amt = v_strike_capt_amt;
    SET p_strike_releas_amt = v_strike_releas_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取订单汇总信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetOrderTotalInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetOrderTotalInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_order_date int,
    IN p_order_batch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_sum_order_row_id bigint,
    OUT p_sum_order_opor_no int,
    OUT p_sum_order_co_no int,
    OUT p_sum_order_pd_no int,
    OUT p_sum_order_exch_group_no int,
    OUT p_sum_order_asset_acco_no int,
    OUT p_sum_order_pass_no int,
    OUT p_sum_order_exch_crncy_type varchar(3),
    OUT p_sum_order_stock_code_no int,
    OUT p_sum_order_trade_code_no int,
    OUT p_sum_order_target_code_no int,
    OUT p_sum_order_external_no bigint,
    OUT p_sum_order_date int,
    OUT p_sum_order_batch_no int,
    OUT p_sum_order_dir int,
    OUT p_sum_order_price_type int,
    OUT p_sum_order_price decimal(16,9),
    OUT p_sum_order_qty decimal(18,2),
    OUT p_order_sum_status varchar(2),
    OUT p_sum_order_wtdraw_qty decimal(18,2),
    OUT p_sum_order_waste_qty decimal(18,2),
    OUT p_sum_order_strike_amt decimal(18,4),
    OUT p_sum_order_strike_qty decimal(18,2),
    OUT p_sum_order_strike_aver_price decimal(16,9),
    OUT p_sum_order_net_price_flag int,
    OUT p_sum_order_bond_accr_intrst decimal(18,12),
    OUT p_sum_order_bond_rate_type int,
    OUT p_sum_order_par_value decimal(16,9),
    OUT p_sum_order_impawn_ratio decimal(18,12),
    OUT p_sum_order_oper_way varchar(2),
    OUT p_sum_order_update_times int
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
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sum_order_row_id bigint;
    declare v_sum_order_opor_no int;
    declare v_sum_order_co_no int;
    declare v_sum_order_pd_no int;
    declare v_sum_order_exch_group_no int;
    declare v_sum_order_asset_acco_no int;
    declare v_sum_order_pass_no int;
    declare v_sum_order_exch_crncy_type varchar(3);
    declare v_sum_order_stock_code_no int;
    declare v_sum_order_trade_code_no int;
    declare v_sum_order_target_code_no int;
    declare v_sum_order_external_no bigint;
    declare v_sum_order_date int;
    declare v_sum_order_batch_no int;
    declare v_sum_order_dir int;
    declare v_sum_order_price_type int;
    declare v_sum_order_price decimal(16,9);
    declare v_sum_order_qty decimal(18,2);
    declare v_order_sum_status varchar(2);
    declare v_sum_order_wtdraw_qty decimal(18,2);
    declare v_sum_order_waste_qty decimal(18,2);
    declare v_sum_order_strike_amt decimal(18,4);
    declare v_sum_order_strike_qty decimal(18,2);
    declare v_sum_order_strike_aver_price decimal(16,9);
    declare v_sum_order_net_price_flag int;
    declare v_sum_order_bond_accr_intrst decimal(18,12);
    declare v_sum_order_bond_rate_type int;
    declare v_sum_order_par_value decimal(16,9);
    declare v_sum_order_impawn_ratio decimal(18,12);
    declare v_sum_order_oper_way varchar(2);
    declare v_sum_order_update_times int;

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
    SET v_order_date = p_order_date;
    SET v_order_batch_no = p_order_batch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sum_order_row_id = 0;
    SET v_sum_order_opor_no = 0;
    SET v_sum_order_co_no = 0;
    SET v_sum_order_pd_no = 0;
    SET v_sum_order_exch_group_no = 0;
    SET v_sum_order_asset_acco_no = 0;
    SET v_sum_order_pass_no = 0;
    SET v_sum_order_exch_crncy_type = "CNY";
    SET v_sum_order_stock_code_no = 0;
    SET v_sum_order_trade_code_no = 0;
    SET v_sum_order_target_code_no = 0;
    SET v_sum_order_external_no = 0;
    SET v_sum_order_date = date_format(curdate(),'%Y%m%d');
    SET v_sum_order_batch_no = 0;
    SET v_sum_order_dir = 0;
    SET v_sum_order_price_type = 0;
    SET v_sum_order_price = 0;
    SET v_sum_order_qty = 0;
    SET v_order_sum_status = "0";
    SET v_sum_order_wtdraw_qty = 0;
    SET v_sum_order_waste_qty = 0;
    SET v_sum_order_strike_amt = 0;
    SET v_sum_order_strike_qty = 0;
    SET v_sum_order_strike_aver_price = 0;
    SET v_sum_order_net_price_flag = 0;
    SET v_sum_order_bond_accr_intrst = 0;
    SET v_sum_order_bond_rate_type = 0;
    SET v_sum_order_par_value = 0;
    SET v_sum_order_impawn_ratio = 0;
    SET v_sum_order_oper_way = " ";
    SET v_sum_order_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取订单汇总信息】*/
    call db_tdsecu.pra_tdsephif_GetOrderTotalInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_order_date,
        v_order_batch_no,
        v_error_code,
        v_error_info,
        v_sum_order_row_id,
        v_sum_order_opor_no,
        v_sum_order_co_no,
        v_sum_order_pd_no,
        v_sum_order_exch_group_no,
        v_sum_order_asset_acco_no,
        v_sum_order_pass_no,
        v_sum_order_exch_crncy_type,
        v_sum_order_stock_code_no,
        v_sum_order_trade_code_no,
        v_sum_order_target_code_no,
        v_sum_order_external_no,
        v_sum_order_date,
        v_sum_order_batch_no,
        v_sum_order_dir,
        v_sum_order_price_type,
        v_sum_order_price,
        v_sum_order_qty,
        v_order_sum_status,
        v_sum_order_wtdraw_qty,
        v_sum_order_waste_qty,
        v_sum_order_strike_amt,
        v_sum_order_strike_qty,
        v_sum_order_strike_aver_price,
        v_sum_order_net_price_flag,
        v_sum_order_bond_accr_intrst,
        v_sum_order_bond_rate_type,
        v_sum_order_par_value,
        v_sum_order_impawn_ratio,
        v_sum_order_oper_way,
        v_sum_order_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.47.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取订单汇总信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_sum_order_row_id = v_sum_order_row_id;
    SET p_sum_order_opor_no = v_sum_order_opor_no;
    SET p_sum_order_co_no = v_sum_order_co_no;
    SET p_sum_order_pd_no = v_sum_order_pd_no;
    SET p_sum_order_exch_group_no = v_sum_order_exch_group_no;
    SET p_sum_order_asset_acco_no = v_sum_order_asset_acco_no;
    SET p_sum_order_pass_no = v_sum_order_pass_no;
    SET p_sum_order_exch_crncy_type = v_sum_order_exch_crncy_type;
    SET p_sum_order_stock_code_no = v_sum_order_stock_code_no;
    SET p_sum_order_trade_code_no = v_sum_order_trade_code_no;
    SET p_sum_order_target_code_no = v_sum_order_target_code_no;
    SET p_sum_order_external_no = v_sum_order_external_no;
    SET p_sum_order_date = v_sum_order_date;
    SET p_sum_order_batch_no = v_sum_order_batch_no;
    SET p_sum_order_dir = v_sum_order_dir;
    SET p_sum_order_price_type = v_sum_order_price_type;
    SET p_sum_order_price = v_sum_order_price;
    SET p_sum_order_qty = v_sum_order_qty;
    SET p_order_sum_status = v_order_sum_status;
    SET p_sum_order_wtdraw_qty = v_sum_order_wtdraw_qty;
    SET p_sum_order_waste_qty = v_sum_order_waste_qty;
    SET p_sum_order_strike_amt = v_sum_order_strike_amt;
    SET p_sum_order_strike_qty = v_sum_order_strike_qty;
    SET p_sum_order_strike_aver_price = v_sum_order_strike_aver_price;
    SET p_sum_order_net_price_flag = v_sum_order_net_price_flag;
    SET p_sum_order_bond_accr_intrst = v_sum_order_bond_accr_intrst;
    SET p_sum_order_bond_rate_type = v_sum_order_bond_rate_type;
    SET p_sum_order_par_value = v_sum_order_par_value;
    SET p_sum_order_impawn_ratio = v_sum_order_impawn_ratio;
    SET p_sum_order_oper_way = v_sum_order_oper_way;
    SET p_sum_order_update_times = v_sum_order_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_主推接口_获取撤单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsephif_GetCancelInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsephif_GetCancelInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_wtdraw_id bigint,
    OUT p_busi_opor_no int,
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_external_no bigint,
    OUT p_wtdraw_batch_no int,
    OUT p_wtdraw_date int,
    OUT p_wtdraw_time int,
    OUT p_order_date int,
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_wtdraw_status varchar(2),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_wtdraw_remark varchar(255),
    OUT p_order_price decimal(16,9),
    OUT p_trade_acco varchar(32),
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
    declare v_order_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_wtdraw_id bigint;
    declare v_busi_opor_no int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_external_no bigint;
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_date int;
    declare v_wtdraw_time int;
    declare v_order_date int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_wtdraw_remark varchar(255);
    declare v_order_price decimal(16,9);
    declare v_trade_acco varchar(32);
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
    SET v_order_id = p_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_wtdraw_id = 0;
    SET v_busi_opor_no = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_external_no = 0;
    SET v_wtdraw_batch_no = 0;
    SET v_wtdraw_date = date_format(curdate(),'%Y%m%d');
    SET v_wtdraw_time = date_format(curtime(),'%H%i%s');
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_wtdraw_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_wtdraw_remark = " ";
    SET v_order_price = 0;
    SET v_trade_acco = " ";
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_主推接口_获取撤单信息】*/
    call db_tdsecu.pra_tdsephif_GetCancelInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_id,
        v_error_code,
        v_error_info,
        v_wtdraw_id,
        v_busi_opor_no,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_pass_no,
        v_out_acco,
        v_exch_crncy_type,
        v_exch_no,
        v_stock_acco_no,
        v_stock_acco,
        v_stock_code_no,
        v_stock_code,
        v_external_no,
        v_wtdraw_batch_no,
        v_wtdraw_date,
        v_wtdraw_time,
        v_order_date,
        v_report_date,
        v_report_time,
        v_report_no,
        v_wtdraw_status,
        v_wtdraw_qty,
        v_wtdraw_remark,
        v_order_price,
        v_trade_acco,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.9.48.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_主推接口_获取撤单信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_wtdraw_id = v_wtdraw_id;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_external_no = v_external_no;
    SET p_wtdraw_batch_no = v_wtdraw_batch_no;
    SET p_wtdraw_date = v_wtdraw_date;
    SET p_wtdraw_time = v_wtdraw_time;
    SET p_order_date = v_order_date;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_wtdraw_status = v_wtdraw_status;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_wtdraw_remark = v_wtdraw_remark;
    SET p_order_price = v_order_price;
    SET p_trade_acco = v_trade_acco;
    SET p_update_times = v_update_times;

END;;


