DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_主推接口_获取指令信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetCommInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetCommInfo(
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
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_func_code varchar(16);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_comm_appr_oper_no int;
    declare v_combo_code varchar(32);
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_comm_remark_info varchar(1024);
    declare v_workflow_type int;
    declare v_contra_no varchar(32);
    declare v_asset_acco_type int;
    declare v_exist_debt_flag int;
    declare v_disp_opor int;
    declare v_disp_status int;
    declare v_read_flag int;

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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_comm_appr_oper_no = 0;
    SET v_combo_code = " ";
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_comm_remark_info = " ";
    SET v_workflow_type = 0;
    SET v_contra_no = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;
    SET v_disp_opor = 0;
    SET v_disp_status = 0;
    SET v_read_flag = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_指令_指令表][字段][字段变量][{记录序号}=@指令序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_code_no, stock_code, target_code_no, trade_code_no, 
        stock_type, asset_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, strike_amt, strike_qty, 
        comm_frozen_amt, comm_frozen_qty, net_price_flag, par_value, 
        impawn_ratio, intrst_days, bond_accr_intrst, bond_rate_type, 
        capit_reback_days, posi_reback_days, strike_status, comm_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, comm_appr_date, comm_appr_time, 
        comm_appr_status, comm_appr_oper_no, comm_appr_oper, comm_appr_remark, 
        basket_id, comm_oper_way, exter_comm_flag, comm_comple_flag, 
        strategy_order_qty, strategy_capt_qty, combo_code, target_stock_code, 
        target_stock_code_no, comm_remark_info, workflow_type, contra_no, 
        asset_acco_type, exist_debt_flag, disp_opor, disp_status, 
        read_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_code, v_target_code_no, v_trade_code_no, 
        v_stock_type, v_asset_type, v_comm_date, v_comm_time, 
        v_comm_batch_no, v_comm_opor, v_comm_executor, v_comm_dir, 
        v_comm_limit_price, v_limit_actual_price, v_comm_qty, v_comm_amt, 
        v_order_qty, v_comm_cancel_qty, v_strike_amt, v_strike_qty, 
        v_comm_frozen_amt, v_comm_frozen_qty, v_net_price_flag, v_par_value, 
        v_impawn_ratio, v_intrst_days, v_bond_accr_intrst, v_bond_rate_type, 
        v_capit_reback_days, v_posi_reback_days, v_strike_status, v_comm_status, 
        v_comm_begin_date, v_comm_end_date, v_comm_begin_time, v_comm_end_time, 
        v_comm_comple_date, v_comm_comple_time, v_comm_appr_date, v_comm_appr_time, 
        v_comm_appr_status, v_comm_appr_oper_no, v_comm_appr_oper, v_comm_appr_remark, 
        v_basket_id, v_comm_oper_way, v_exter_comm_flag, v_comm_comple_flag, 
        v_strategy_order_qty, v_strategy_capt_qty, v_combo_code, v_target_stock_code, 
        v_target_stock_code_no, v_comm_remark_info, v_workflow_type, v_contra_no, 
        v_asset_acco_type, v_exist_debt_flag, v_disp_opor, v_disp_status, 
        v_read_flag from db_tdsecu.tb_tdseap_command where row_id=v_comm_id limit 1;

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

# 原子_交易证券_主推接口_获取汇总指令信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetSumCommInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetSumCommInfo(
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
    

    /* [获取表记录变量语句][交易证券_指令_指令汇总表][{记录序号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{交易币种},{证券代码编号},{指令日期},{指令时间},{指令批号},{指令下达人},{指令执行人},{指令方向},{指令限价},{指令数量},{指令金额},{订单数量},{指令撤销数量},{指令待撤销数量},{成交金额},{成交数量},{成交状态},{指令汇总状态},{指令开始日期},{指令结束日期},{指令开始时间},{指令结束时间},{指令完成日期},{指令完成时间},{指令最大完成日期},{指令最大完成时间},{指令审批日期},{指令审批时间},{指令审批数量},{指令汇总审批状态},{篮子序号},{净价标志},{债券计提利息},{债券利率类型},{指令操作方式},{体外指令标志},{买入订单数量},{卖出订单数量},{买入指令数量},{卖出指令数量},{买入成交数量},{卖出成交数量},{买入成交金额},{卖出成交金额},{买入指令金额},{卖出指令金额},{指令备注信息},{更新次数},{账户拼接信息}][@汇总指令记录序号#,@汇总指令机构编号#,@汇总指令产品编号#,@汇总指令交易组编号#,@汇总指令资产账户编号#,@汇总指令通道编号#,@汇总指令外部账号#,@汇总指令交易币种#,@汇总指令证券代码编号#,@汇总指令日期#,@汇总指令时间#,@汇总指令批号#,@汇总指令下达人#,@汇总指令执行人#,@汇总指令方向#,@汇总指令限价#,@汇总指令数量#,@汇总指令金额#,@汇总指令订单数量#,@汇总指令撤销数量#,@汇总指令待撤销数量#,@汇总指令成交金额#,@汇总指令成交数量#,@汇总指令成交状态#,@指令汇总状态#,@汇总指令开始日期#,@汇总指令结束日期#,@汇总指令开始时间#,@汇总指令结束时间#,@汇总指令完成日期#,@汇总指令完成时间#,@汇总指令最大完成日期#,@汇总指令最大完成时间#,@汇总指令审批日期#,@汇总指令审批时间#,@汇总指令审批数量#,@指令汇总审批状态#,@汇总指令篮子序号#,@汇总指令净价标志#,@汇总指令债券计提利息#,@汇总指令债券利率类型#,@汇总指令操作方式#,@汇总指令体外指令标志#,@汇总买入订单数量#,@汇总卖出订单数量#,@汇总买入指令数量#,@汇总卖出指令数量#,@汇总买入成交数量#,@汇总卖出成交数量#,@汇总买入成交金额#,@汇总卖出成交金额#,@汇总买入指令金额#,@汇总卖出指令金额#,@指令备注信息#,@汇总指令更新次数#,@账户拼接信息#][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号# and {指令执行人} = @指令执行人#] */
    select row_id,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_crncy_type,stock_code_no,comm_date,comm_time,comm_batch_no,comm_opor,comm_executor,comm_dir,comm_limit_price,comm_qty,comm_amt,order_qty,comm_cancel_qty,comm_await_cancel_qty,strike_amt,strike_qty,strike_status,comm_sum_status,comm_begin_date,comm_end_date,comm_begin_time,comm_end_time,comm_comple_date,comm_comple_time,max_comm_comple_date,max_comm_comple_time,comm_appr_date,comm_appr_time,comm_appr_qty,comm_sum_approve_status,basket_id,net_price_flag,bond_accr_intrst,bond_rate_type,comm_oper_way,exter_comm_flag,buy_order_qty,sell_order_qty,buy_comm_qty,sell_comm_qty,buy_strike_qty,sell_strike_qty,buy_strike_amt,sell_strike_amt,buy_comm_amt,sell_comm_amt,comm_remark_info,update_times,acco_concat_info into v_sum_comm_row_id,v_sum_comm_co_no,v_sum_comm_pd_no,v_sum_comm_exch_group_no,v_sum_comm_asset_acco_no,v_sum_comm_pass_no,v_sum_comm_out_acco,v_sum_comm_exch_crncy_type,v_sum_comm_stock_code_no,v_sum_comm_date,v_sum_comm_time,v_sum_comm_batch_no,v_sum_comm_opor,v_sum_comm_executor,v_sum_comm_dir,v_sum_comm_limit_price,v_sum_comm_qty,v_sum_comm_amt,v_sum_comm_order_qty,v_sum_comm_cancel_qty,v_sum_comm_await_cancel_qty,v_sum_comm_strike_amt,v_sum_comm_strike_qty,v_sum_comm_strike_status,v_comm_sum_status,v_sum_comm_begin_date,v_sum_comm_end_date,v_sum_comm_begin_time,v_sum_comm_end_time,v_sum_comm_comple_date,v_sum_comm_comple_time,v_sum_comm_max_comm_comple_date,v_sum_comm_max_comm_comple_time,v_sum_comm_appr_date,v_sum_comm_appr_time,v_sum_comm_appr_qty,v_comm_sum_approve_status,v_sum_comm_basket_id,v_sum_comm_net_price_flag,v_sum_comm_bond_accr_intrst,v_sum_comm_bond_rate_type,v_sum_comm_oper_way,v_sum_comm_exter_comm_flag,v_sum_buy_order_qty,v_sum_sell_order_qty,v_sum_buy_comm_qty,v_sum_sell_comm_qty,v_sum_buy_strike_qty,v_sum_sell_strike_qty,v_sum_buy_strike_amt,v_sum_sell_strike_amt,v_sum_buy_comm_amt,v_sum_sell_comm_amt,v_comm_remark_info,v_sum_comm_update_times,v_acco_concat_info from db_tdsecu.tb_tdseap_sumcommand where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no and comm_executor = v_comm_executor limit 1;

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

# 原子_交易证券_主推接口_获取指令混合信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetTotalCommInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetTotalCommInfo(
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
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_func_code varchar(16);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_comm_appr_oper_no int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_workflow_type int;
    declare v_asset_acco_type int;
    declare v_exist_debt_flag int;

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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_comm_appr_oper_no = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_workflow_type = 0;
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_指令_指令表][字段][字段变量][{记录序号}=@指令序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_code_no, stock_code, target_code_no, trade_code_no, 
        stock_type, asset_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, strike_amt, strike_qty, 
        comm_frozen_amt, comm_frozen_qty, net_price_flag, par_value, 
        impawn_ratio, intrst_days, bond_accr_intrst, bond_rate_type, 
        capit_reback_days, posi_reback_days, strike_status, comm_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, comm_appr_date, comm_appr_time, 
        comm_appr_status, comm_appr_oper_no, comm_appr_oper, comm_appr_remark, 
        basket_id, comm_oper_way, exter_comm_flag, comm_comple_flag, 
        strategy_order_qty, strategy_capt_qty, combo_code, target_stock_code, 
        target_stock_code_no, comm_remark_info, workflow_type, contra_no, 
        asset_acco_type, exist_debt_flag, disp_opor, disp_status, 
        read_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_code, v_target_code_no, v_trade_code_no, 
        v_stock_type, v_asset_type, v_comm_date, v_comm_time, 
        v_comm_batch_no, v_comm_opor, v_comm_executor, v_comm_dir, 
        v_comm_limit_price, v_limit_actual_price, v_comm_qty, v_comm_amt, 
        v_order_qty, v_comm_cancel_qty, v_strike_amt, v_strike_qty, 
        v_comm_frozen_amt, v_comm_frozen_qty, v_net_price_flag, v_par_value, 
        v_impawn_ratio, v_intrst_days, v_bond_accr_intrst, v_bond_rate_type, 
        v_capit_reback_days, v_posi_reback_days, v_strike_status, v_comm_status, 
        v_comm_begin_date, v_comm_end_date, v_comm_begin_time, v_comm_end_time, 
        v_comm_comple_date, v_comm_comple_time, v_comm_appr_date, v_comm_appr_time, 
        v_comm_appr_status, v_comm_appr_oper_no, v_comm_appr_oper, v_comm_appr_remark, 
        v_basket_id, v_comm_oper_way, v_exter_comm_flag, v_comm_comple_flag, 
        v_strategy_order_qty, v_strategy_capt_qty, v_combo_code, v_target_stock_code, 
        v_target_stock_code_no, v_comm_remark_info, v_workflow_type, v_contra_no, 
        v_asset_acco_type, v_exist_debt_flag, v_disp_opor, v_disp_status, 
        v_read_flag from db_tdsecu.tb_tdseap_command where row_id=v_comm_id limit 1;


    /* [获取表记录变量语句][交易证券_指令_指令汇总表][{记录序号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{交易币种},{证券代码编号},{指令日期},{指令时间},{指令批号},{指令下达人},{指令执行人},{指令方向},{指令限价},{指令数量},{指令金额},{订单数量},{指令撤销数量},{指令待撤销数量},{成交金额},{成交数量},{成交状态},{指令汇总状态},{指令开始日期},{指令结束日期},{指令开始时间},{指令结束时间},{指令完成日期},{指令完成时间},{指令最大完成日期},{指令最大完成时间},{指令审批日期},{指令审批时间},{指令审批数量},{指令汇总审批状态},{篮子序号},{净价标志},{债券计提利息},{债券利率类型},{指令操作方式},{体外指令标志},{买入订单数量},{卖出订单数量},{买入指令数量},{卖出指令数量},{买入成交数量},{卖出成交数量},{买入成交金额},{卖出成交金额},{买入指令金额},{卖出指令金额},{指令备注信息},{更新次数},{已读标记},{账户拼接信息}][@汇总指令记录序号#,@汇总指令机构编号#,@汇总指令产品编号#,@汇总指令交易组编号#,@汇总指令资产账户编号#,@汇总指令通道编号#,@汇总指令外部账号#,@汇总指令交易币种#,@汇总指令证券代码编号#,@汇总指令日期#,@汇总指令时间#,@汇总指令批号#,@汇总指令下达人#,@汇总指令执行人#,@汇总指令方向#,@汇总指令限价#,@汇总指令数量#,@汇总指令金额#,@汇总指令订单数量#,@汇总指令撤销数量#,@汇总指令待撤销数量#,@汇总指令成交金额#,@汇总指令成交数量#,@汇总指令成交状态#,@指令汇总状态#,@汇总指令开始日期#,@汇总指令结束日期#,@汇总指令开始时间#,@汇总指令结束时间#,@汇总指令完成日期#,@汇总指令完成时间#,@汇总指令最大完成日期#,@汇总指令最大完成时间#,@汇总指令审批日期#,@汇总指令审批时间#,@汇总指令审批数量#,@指令汇总审批状态#,@汇总指令篮子序号#,@汇总指令净价标志#,@汇总指令债券计提利息#,@汇总指令债券利率类型#,@汇总指令操作方式#,@汇总指令体外指令标志#,@汇总买入订单数量#,@汇总卖出订单数量#,@汇总买入指令数量#,@汇总卖出指令数量#,@汇总买入成交数量#,@汇总卖出成交数量#,@汇总买入成交金额#,@汇总卖出成交金额#,@汇总买入指令金额#,@汇总卖出指令金额#,@汇总指令备注信息#,@汇总指令更新次数#,@已读标记#,@账户拼接信息#][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号# and {指令执行人} = @指令执行人#] */
    select row_id,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_crncy_type,stock_code_no,comm_date,comm_time,comm_batch_no,comm_opor,comm_executor,comm_dir,comm_limit_price,comm_qty,comm_amt,order_qty,comm_cancel_qty,comm_await_cancel_qty,strike_amt,strike_qty,strike_status,comm_sum_status,comm_begin_date,comm_end_date,comm_begin_time,comm_end_time,comm_comple_date,comm_comple_time,max_comm_comple_date,max_comm_comple_time,comm_appr_date,comm_appr_time,comm_appr_qty,comm_sum_approve_status,basket_id,net_price_flag,bond_accr_intrst,bond_rate_type,comm_oper_way,exter_comm_flag,buy_order_qty,sell_order_qty,buy_comm_qty,sell_comm_qty,buy_strike_qty,sell_strike_qty,buy_strike_amt,sell_strike_amt,buy_comm_amt,sell_comm_amt,comm_remark_info,update_times,read_flag,acco_concat_info into v_sum_comm_row_id,v_sum_comm_co_no,v_sum_comm_pd_no,v_sum_comm_exch_group_no,v_sum_comm_asset_acco_no,v_sum_comm_pass_no,v_sum_comm_out_acco,v_sum_comm_exch_crncy_type,v_sum_comm_stock_code_no,v_sum_comm_date,v_sum_comm_time,v_sum_comm_batch_no,v_sum_comm_opor,v_sum_comm_executor,v_sum_comm_dir,v_sum_comm_limit_price,v_sum_comm_qty,v_sum_comm_amt,v_sum_comm_order_qty,v_sum_comm_cancel_qty,v_sum_comm_await_cancel_qty,v_sum_comm_strike_amt,v_sum_comm_strike_qty,v_sum_comm_strike_status,v_comm_sum_status,v_sum_comm_begin_date,v_sum_comm_end_date,v_sum_comm_begin_time,v_sum_comm_end_time,v_sum_comm_comple_date,v_sum_comm_comple_time,v_sum_comm_max_comm_comple_date,v_sum_comm_max_comm_comple_time,v_sum_comm_appr_date,v_sum_comm_appr_time,v_sum_comm_appr_qty,v_comm_sum_approve_status,v_sum_comm_basket_id,v_sum_comm_net_price_flag,v_sum_comm_bond_accr_intrst,v_sum_comm_bond_rate_type,v_sum_comm_oper_way,v_sum_comm_exter_comm_flag,v_sum_buy_order_qty,v_sum_sell_order_qty,v_sum_buy_comm_qty,v_sum_sell_comm_qty,v_sum_buy_strike_qty,v_sum_sell_strike_qty,v_sum_buy_strike_amt,v_sum_sell_strike_amt,v_sum_buy_comm_amt,v_sum_sell_comm_amt,v_sum_comm_remark_info,v_sum_comm_update_times,v_read_flag,v_acco_concat_info from db_tdsecu.tb_tdseap_sumcommand where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no and comm_executor = v_comm_executor limit 1;

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

# 原子_交易证券_主推接口_获取交易组资金持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetExgpCashPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetExgpCashPosi(
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
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);

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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_exch_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_账户_交易组业务资金表][字段][字段变量][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {交易币种}=@交易币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        comm_frozen_amt, comm_unfroz_amt, comm_capt_amt, comm_releas_amt, 
        trade_frozen_amt, trade_unfroz_amt, trade_capt_amt, trade_releas_amt, 
        strike_capt_amt, strike_releas_amt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, 
        v_begin_amt, v_curr_amt, v_frozen_amt, v_unfroz_amt, 
        v_comm_frozen_amt, v_comm_unfroz_amt, v_comm_capt_amt, v_comm_releas_amt, 
        v_trade_frozen_amt, v_trade_unfroz_amt, v_trade_capt_amt, v_trade_releas_amt, 
        v_strike_capt_amt, v_strike_releas_amt from db_tdsecu.tb_tdseac_exgp_busi_capit where exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and exch_crncy_type=v_exch_crncy_type limit 1;


    /* set @交易组资金更新次数# = @更新次数#; */
    set v_exgp_cash_update_times = v_update_times;

    /* [获取表记录变量语句][交易证券_账户_交易组业务持仓表][字段][字段变量][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        comm_frozen_qty, comm_unfroz_qty, comm_capt_qty, comm_releas_qty, 
        trade_frozen_qty, trade_unfroz_qty, trade_capt_qty, trade_releas_qty, 
        strike_capt_qty, strike_releas_qty, strike_frozen_qty, strike_unfroz_qty, 
        realize_pandl, cost_amt, intrst_cost_amt, intrst_pandl into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_type, v_asset_type, 
        v_begin_qty, v_curr_qty, v_frozen_qty, v_unfroz_qty, 
        v_comm_frozen_qty, v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, 
        v_trade_frozen_qty, v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, 
        v_strike_capt_qty, v_strike_releas_qty, v_strike_frozen_qty, v_strike_unfroz_qty, 
        v_realize_pandl, v_cost_amt, v_intrst_cost_amt, v_intrst_pandl from db_tdsecu.tb_tdseac_exgp_busi_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;


    /* set @交易组持仓更新次数# = @更新次数#; */
    set v_exgp_posi_update_times = v_update_times;
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

# 原子_交易证券_主推接口_获取资产账户资金持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetAsacCashPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetAsacCashPosi(
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
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);

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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_exch_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_账户_资产账户业务资金表][字段][字段变量][{资产账户编号} = @资产账户编号# and {交易币种}=@交易币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
        comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_frozen_amt, 
        trade_unfroz_amt, trade_capt_amt, trade_releas_amt, strike_capt_amt, 
        strike_releas_amt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_crncy_type, v_begin_amt, 
        v_curr_amt, v_frozen_amt, v_unfroz_amt, v_comm_frozen_amt, 
        v_comm_unfroz_amt, v_comm_capt_amt, v_comm_releas_amt, v_trade_frozen_amt, 
        v_trade_unfroz_amt, v_trade_capt_amt, v_trade_releas_amt, v_strike_capt_amt, 
        v_strike_releas_amt from db_tdsecu.tb_tdseac_asac_busi_capit where asset_acco_no = v_asset_acco_no and exch_crncy_type=v_exch_crncy_type limit 1;


    /* set @资产账户资金更新次数# = @更新次数#; */
    set v_asac_cash_update_times = v_update_times;

    /* [获取表记录变量语句][交易证券_账户_资产账户业务持仓表][字段][字段变量][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
        comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
        trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_capt_qty, 
        strike_releas_qty, strike_frozen_qty, strike_unfroz_qty, realize_pandl, 
        cost_amt, intrst_cost_amt, intrst_pandl into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_type, v_asset_type, v_begin_qty, 
        v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
        v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
        v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_capt_qty, 
        v_strike_releas_qty, v_strike_frozen_qty, v_strike_unfroz_qty, v_realize_pandl, 
        v_cost_amt, v_intrst_cost_amt, v_intrst_pandl from db_tdsecu.tb_tdseac_asac_busi_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;


    /* set @资产账户持仓更新次数# = @更新次数#; */
    set v_asac_posi_update_times = v_update_times;
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

# 原子_交易证券_主推接口_获取资金持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetCashPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetCashPosi(
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
    

    /* [获取表记录变量语句][交易证券_账户_交易组业务资金表][{记录序号},{冻结金额},{解冻金额},{指令冻结金额},{指令解冻金额},{指令占用金额},{指令释放金额},{交易冻结金额},{交易解冻金额},{交易占用金额},{交易释放金额},{成交占用金额},{成交释放金额},{更新次数}][@交易组资金序号#,@交易组冻结金额#,@交易组解冻金额#,@交易组指令冻结金额#,@交易组指令解冻金额#,@交易组指令占用金额#,@交易组指令释放金额#,@交易组交易冻结金额#,@交易组交易解冻金额#,@交易组交易占用金额#,@交易组交易释放金额#,@交易组成交占用金额#,@交易组成交释放金额#,@交易组资金更新次数#][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {交易币种}=@交易币种#] */
    select row_id,frozen_amt,unfroz_amt,comm_frozen_amt,comm_unfroz_amt,comm_capt_amt,comm_releas_amt,trade_frozen_amt,trade_unfroz_amt,trade_capt_amt,trade_releas_amt,strike_capt_amt,strike_releas_amt,update_times into v_exgp_cash_id,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_comm_frozen_amt,v_exgp_comm_unfroz_amt,v_exgp_comm_capt_amt,v_exgp_comm_releas_amt,v_exgp_trade_frozen_amt,v_exgp_trade_unfroz_amt,v_exgp_trade_capt_amt,v_exgp_trade_releas_amt,v_exgp_strike_capt_amt,v_exgp_strike_releas_amt,v_exgp_cash_update_times from db_tdsecu.tb_tdseac_exgp_busi_capit where exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and exch_crncy_type=v_exch_crncy_type limit 1;


    /* [获取表记录变量语句][交易证券_账户_交易组业务持仓表][{记录序号},{冻结数量},{解冻数量},{指令冻结数量},{指令解冻数量},{指令占用数量},{指令释放数量},{交易冻结数量},{交易解冻数量},{交易占用数量},{交易释放数量},{成交占用数量},{成交释放数量},{成交冻结数量},{成交解冻数量},{实现盈亏},{成本金额},{利息成本金额},{利息收益},{更新次数}][@交易组持仓序号#,@交易组冻结数量#,@交易组解冻数量#,@交易组指令冻结数量#,@交易组指令解冻数量#,@交易组指令占用数量#,@交易组指令释放数量#,@交易组交易冻结数量#,@交易组交易解冻数量#,@交易组交易占用数量#,@交易组交易释放数量#,@交易组成交占用数量#,@交易组成交释放数量#,@交易组成交冻结数量#,@交易组成交解冻数量#,@交易组实现盈亏#,@交易组成本金额#,@交易组利息成本金额#,@交易组利息收益#,@交易组持仓更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
    select row_id,frozen_qty,unfroz_qty,comm_frozen_qty,comm_unfroz_qty,comm_capt_qty,comm_releas_qty,trade_frozen_qty,trade_unfroz_qty,trade_capt_qty,trade_releas_qty,strike_capt_qty,strike_releas_qty,strike_frozen_qty,strike_unfroz_qty,realize_pandl,cost_amt,intrst_cost_amt,intrst_pandl,update_times into v_exgp_posi_id,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_comm_frozen_qty,v_exgp_comm_unfroz_qty,v_exgp_comm_capt_qty,v_exgp_comm_releas_qty,v_exgp_trade_frozen_qty,v_exgp_trade_unfroz_qty,v_exgp_trade_capt_qty,v_exgp_trade_releas_qty,v_exgp_strike_capt_qty,v_exgp_strike_releas_qty,v_exgp_strike_frozen_qty,v_exgp_strike_unfroz_qty,v_exgp_realize_pandl,v_exgp_cost_amt,v_exgp_intrst_cost_amt,v_exgp_intrst_pandl,v_exgp_posi_update_times from db_tdsecu.tb_tdseac_exgp_busi_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;


    /* [获取表记录变量语句][交易证券_账户_资产账户业务资金表][{记录序号},{冻结金额},{解冻金额},{指令冻结金额},{指令解冻金额},{指令占用金额},{指令释放金额},{交易冻结金额},{交易解冻金额},{交易占用金额},{交易释放金额},{成交占用金额},{成交释放金额},{更新次数}][@资产账户持仓序号#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户指令冻结金额#,@资产账户指令解冻金额#,@资产账户指令占用金额#,@资产账户指令释放金额#,@资产账户交易冻结金额#,@资产账户交易解冻金额#,@资产账户交易占用金额#,@资产账户交易释放金额#,@资产账户成交占用金额#,@资产账户成交释放金额#,@资产账户资金更新次数#][{资产账户编号} = @资产账户编号# and {交易币种}=@交易币种#] */
    select row_id,frozen_amt,unfroz_amt,comm_frozen_amt,comm_unfroz_amt,comm_capt_amt,comm_releas_amt,trade_frozen_amt,trade_unfroz_amt,trade_capt_amt,trade_releas_amt,strike_capt_amt,strike_releas_amt,update_times into v_asac_posi_id,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_comm_frozen_amt,v_asac_comm_unfroz_amt,v_asac_comm_capt_amt,v_asac_comm_releas_amt,v_asac_trade_frozen_amt,v_asac_trade_unfroz_amt,v_asac_trade_capt_amt,v_asac_trade_releas_amt,v_asac_strike_capt_amt,v_asac_strike_releas_amt,v_asac_cash_update_times from db_tdsecu.tb_tdseac_asac_busi_capit where asset_acco_no = v_asset_acco_no and exch_crncy_type=v_exch_crncy_type limit 1;


    /* [获取表记录变量语句][交易证券_账户_资产账户业务持仓表][{记录序号},{冻结数量},{解冻数量},{指令冻结数量},{指令解冻数量},{指令占用数量},{指令释放数量},{交易冻结数量},{交易解冻数量},{交易占用数量},{交易释放数量},{成交占用数量},{成交释放数量},{成交冻结数量},{成交解冻数量},{实现盈亏},{成本金额},{利息成本金额},{利息收益},{更新次数}][@资产账户持仓序号#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户指令冻结数量#,@资产账户指令解冻数量#,@资产账户指令占用数量#,@资产账户指令释放数量#,@资产账户交易冻结数量#,@资产账户交易解冻数量#,@资产账户交易占用数量#,@资产账户交易释放数量#,@资产账户成交占用数量#,@资产账户成交释放数量#,@资产账户成交冻结数量#,@资产账户成交解冻数量#,@资产账户实现盈亏#,@资产账户成本金额#,@资产账户利息成本金额#,@资产账户利息收益#,@资产账户持仓更新次数#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
    select row_id,frozen_qty,unfroz_qty,comm_frozen_qty,comm_unfroz_qty,comm_capt_qty,comm_releas_qty,trade_frozen_qty,trade_unfroz_qty,trade_capt_qty,trade_releas_qty,strike_capt_qty,strike_releas_qty,strike_frozen_qty,strike_unfroz_qty,realize_pandl,cost_amt,intrst_cost_amt,intrst_pandl,update_times into v_asac_posi_id,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_comm_frozen_qty,v_asac_comm_unfroz_qty,v_asac_comm_capt_qty,v_asac_comm_releas_qty,v_asac_trade_frozen_qty,v_asac_trade_unfroz_qty,v_asac_trade_capt_qty,v_asac_trade_releas_qty,v_asac_strike_capt_qty,v_asac_strike_releas_qty,v_asac_strike_frozen_qty,v_asac_strike_unfroz_qty,v_asac_realize_pandl,v_asac_cost_amt,v_asac_intrst_cost_amt,v_asac_intrst_pandl,v_asac_posi_update_times from db_tdsecu.tb_tdseac_asac_busi_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;

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

# 原子_交易证券_主推接口_获取汇总订单成交信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetSumOrderStrike;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetSumOrderStrike(
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
    

    /* if @订单批号# > 0 then */
    if v_order_batch_no > 0 then

        /* [获取表记录变量语句][交易证券_交易_订单汇总表][{记录序号},{操作员编号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{交易币种},{证券代码编号},{交易代码编号},{标的代码编号},{外部编号},{订单日期},{订单批号},{订单方向},{价格类型},{订单价格},{订单数量},{订单汇总状态},{撤单数量},{废单数量},{成交金额},{成交数量},{成交均价},{净价标志},{债券计提利息},{债券利率类型},{票面面值},{质押比例},{订单操作方式},{更新次数}][@汇总订单记录序号#,@汇总订单操作员编号#,@汇总订单机构编号#,@汇总订单产品编号#,@汇总订单交易组编号#,@汇总订单资产账户编号#,@汇总订单通道编号#,@汇总订单交易币种#,@汇总订单证券代码编号#,@汇总订单交易代码编号#,@汇总订单标的代码编号#,@汇总订单外部编号#,@汇总订单日期#,@汇总订单批号#,@汇总订单方向#,@汇总订单价格类型#,@汇总订单价格#,@汇总订单数量#,@订单汇总状态#,@汇总订单撤单数量#,@汇总订单废单数量#,@汇总订单成交金额#,@汇总订单成交数量#,@汇总订单成交均价#,@汇总订单净价标志#,@汇总订单债券计提利息#,@汇总订单债券利率类型#,@汇总订单票面面值#,@汇总订单质押比例#,@汇总订单操作方式#,@汇总订单更新次数#][{订单日期}=@订单日期# and {机构编号} = @机构编号# and {订单批号}= @订单批号#] */
        select row_id,opor_no,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,exch_crncy_type,stock_code_no,trade_code_no,target_code_no,external_no,order_date,order_batch_no,order_dir,price_type,order_price,order_qty,order_sum_status,wtdraw_qty,waste_qty,strike_amt,strike_qty,strike_aver_price,net_price_flag,bond_accr_intrst,bond_rate_type,par_value,impawn_ratio,order_oper_way,update_times into v_sum_order_row_id,v_sum_order_opor_no,v_sum_order_co_no,v_sum_order_pd_no,v_sum_order_exch_group_no,v_sum_order_asset_acco_no,v_sum_order_pass_no,v_sum_order_exch_crncy_type,v_sum_order_stock_code_no,v_sum_order_trade_code_no,v_sum_order_target_code_no,v_sum_order_external_no,v_sum_order_date,v_sum_order_batch_no,v_sum_order_dir,v_sum_order_price_type,v_sum_order_price,v_sum_order_qty,v_order_sum_status,v_sum_order_wtdraw_qty,v_sum_order_waste_qty,v_sum_order_strike_amt,v_sum_order_strike_qty,v_sum_order_strike_aver_price,v_sum_order_net_price_flag,v_sum_order_bond_accr_intrst,v_sum_order_bond_rate_type,v_sum_order_par_value,v_sum_order_impawn_ratio,v_sum_order_oper_way,v_sum_order_update_times from db_tdsecu.tb_tdsetd_sumorder where order_date=v_order_date and co_no = v_co_no and order_batch_no= v_order_batch_no limit 1;

    end if;

    /* if @成交序号# > 0 then */
    if v_strike_id > 0 then

        /* [获取表记录变量语句][交易证券_报盘_成交汇总表][{记录序号},{操作员编号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{股东代码编号},{证券代码编号},{指令序号},{申报日期},{申报编号},{订单日期},{订单序号},{订单批号},{订单方向},{订单价格},{订单数量},{成交数量},{成交金额},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{交易征费},{交易费},{交易系统使用费},{股份交收费},{净价标志},{债券计提利息},{债券利率类型},{订单操作方式},{体外指令标志},{更新次数}][@汇总成交记录序号#,@汇总成交操作员编号#,@汇总成交机构编号#,@汇总成交产品编号#,@汇总成交交易组编号#,@汇总成交资产账户编号#,@汇总成交通道编号#,@汇总成交外部账号#,@汇总成交股东代码编号#,@汇总成交证券代码编号#,@汇总成交指令序号#,@汇总成交申报日期#,@汇总成交申报编号#,@汇总成交订单日期#,@汇总成交订单序号#,@汇总成交订单批号#,@汇总成交订单方向#,@汇总成交订单价格#,@汇总成交订单数量#,@汇总成交成交数量#,@汇总成交成交金额#,@汇总成交全部费用#,@汇总成交印花税#,@汇总成交过户费#,@汇总成交经手费#,@汇总成交证管费#,@汇总成交其他费用#,@汇总成交交易佣金#,@汇总成交其他佣金#,@汇总交易征费#,@汇总交易费#,@汇总交易系统使用费#,@汇总股份交收费#,@汇总成交净价标志#,@汇总成交债券计提利息#,@汇总成交债券利率类型#,@汇总成交订单操作方式#,@汇总成交体外指令标志#,@汇总成交更新次数#][{订单日期}=@订单日期# and {订单序号}=@订单序号#] */
        select row_id,opor_no,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,stock_acco_no,stock_code_no,comm_id,report_date,report_no,order_date,order_id,order_batch_no,order_dir,order_price,order_qty,strike_qty,strike_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,trade_tax,trade_cost_fee,trade_system_use_fee,stock_settle_fee,net_price_flag,bond_accr_intrst,bond_rate_type,order_oper_way,exter_comm_flag,update_times into v_sum_strike_row_id,v_sum_strike_opor_no,v_sum_strike_co_no,v_sum_strike_pd_no,v_sum_strike_exch_group_no,v_sum_strike_asset_acco_no,v_sum_strike_pass_no,v_sum_strike_out_acco,v_sum_strike_stock_acco_no,v_sum_strike_stock_code_no,v_sum_strike_comm_id,v_sum_strike_report_date,v_sum_strike_report_no,v_sum_strike_order_date,v_sum_strike_order_id,v_sum_strike_order_batch_no,v_sum_strike_order_dir,v_sum_strike_order_price,v_sum_strike_order_qty,v_sum_strike_strike_qty,v_sum_strike_strike_amt,v_sum_strike_all_fee,v_sum_strike_stamp_tax,v_sum_strike_trans_fee,v_sum_strike_brkage_fee,v_sum_strike_SEC_charges,v_sum_strike_other_fee,v_sum_strike_trade_commis,v_sum_strike_other_commis,v_sum_trade_tax,v_sum_trade_cost_fee,v_sum_trade_system_use_fee,v_sum_stock_settle_fee,v_sum_strike_net_price_flag,v_sum_strike_bond_accr_intrst,v_sum_strike_bond_rate_type,v_sum_strike_order_oper_way,v_sum_strike_exter_comm_flag,v_sum_strike_update_times from db_tdsecu.tb_tdserp_sumstrike where order_date=v_order_date and order_id=v_order_id limit 1;

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

# 原子_交易证券_主推接口_循环获取订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_LoopGetOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_LoopGetOrderInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_date int,
    IN p_order_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_order_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
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
    declare v_intrst_days int;
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_cost_calc_type int;
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_strategy_id bigint;
    declare v_sett_flag int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_contra_no varchar(32);
    declare v_asset_acco_type int;
    declare v_exist_debt_flag int;

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
    SET v_order_id = p_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
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
    SET v_intrst_days = 0;
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_cost_calc_type = 0;
    SET v_exter_comm_flag = 0;
    SET v_record_valid_flag = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_strategy_id = 0;
    SET v_sett_flag = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_contra_no = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易证券_交易_订单表][字段][字段变量][{记录序号}=@订单序号#][4][@订单序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, trade_code_no, 
        target_code_no, stock_type, asset_type, external_no, 
        comm_id, comm_batch_no, comm_opor, report_date, 
        report_time, report_no, order_date, order_time, 
        order_batch_no, order_dir, price_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_amt, 
        strike_qty, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, strike_bond_accr_intrst, impawn_ratio, 
        order_frozen_amt, order_frozen_qty, rsp_info, compli_trig_id, 
        remark_info, cost_calc_type, order_oper_way, exter_comm_flag, 
        record_valid_flag, combo_code, combo_posi_id, strategy_id, 
        sett_flag, target_stock_code, target_stock_code_no, registration_agency, 
        trade_acco, contra_no, asset_acco_type, exist_debt_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_stock_acco_no, 
        v_stock_acco, v_stock_code_no, v_stock_code, v_trade_code_no, 
        v_target_code_no, v_stock_type, v_asset_type, v_external_no, 
        v_comm_id, v_comm_batch_no, v_comm_opor, v_report_date, 
        v_report_time, v_report_no, v_order_date, v_order_time, 
        v_order_batch_no, v_order_dir, v_price_type, v_order_price, 
        v_order_qty, v_order_status, v_wtdraw_qty, v_strike_amt, 
        v_strike_qty, v_all_fee, v_stamp_tax, v_trans_fee, 
        v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
        v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
        v_stock_settle_fee, v_net_price_flag, v_intrst_days, v_par_value, 
        v_bond_accr_intrst, v_bond_rate_type, v_strike_bond_accr_intrst, v_impawn_ratio, 
        v_order_frozen_amt, v_order_frozen_qty, v_rsp_info, v_compli_trig_id, 
        v_remark_info, v_cost_calc_type, v_order_oper_way, v_exter_comm_flag, 
        v_record_valid_flag, v_combo_code, v_combo_posi_id, v_strategy_id, 
        v_sett_flag, v_target_stock_code, v_target_stock_code_no, v_registration_agency, 
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where row_id=v_order_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.9.22.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;

    /* if @指令序号# <> 0 then */
    if v_comm_id <> 0 then

        /* [获取表记录变量][交易证券_指令_指令表][{指令日期},{指令批号},{指令执行人},{指令下达人}][@指令日期#,@指令批号#,@指令执行人#,@指令下达人#][{记录序号}=@指令序号#][4][@指令序号#] */
        select comm_date,comm_batch_no,comm_executor,comm_opor into v_comm_date,v_comm_batch_no,v_comm_executor,v_comm_opor from db_tdsecu.tb_tdseap_command where row_id=v_comm_id limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "tdsecuA.9.22.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令序号=",v_comm_id);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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

# 原子_交易证券_主推接口_循环获取撤单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_LoopGetCancelInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_LoopGetCancelInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_wtdraw_id bigint,
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
    declare v_wtdraw_id bigint;
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
    SET v_wtdraw_id = p_wtdraw_id;
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

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易证券_交易_撤单表][{操作MAC},{操作IP},{操作信息},{初始化日期},{资产账户编号},{通道编号},{外部账号},{市场编号},{股东代码},{证券代码},{撤单日期},{撤单时间},{订单日期},{订单序号},{申报编号},{撤单状态}][@操作MAC#,@操作IP#,@操作信息#,@初始化日期#,@资产账户编号#,@通道编号#,@外部账号#,@市场编号#,@股东代码#,@证券代码#,@撤单日期#,@撤单时间#,@订单日期#,@订单序号#,@申报编号#,@撤单状态#][{记录序号}=@撤单序号#][4][@撤单序号#] */
    select oper_mac,oper_ip_addr,oper_info,init_date,asset_acco_no,pass_no,out_acco,exch_no,stock_acco,stock_code,wtdraw_date,wtdraw_time,order_date,order_id,report_no,wtdraw_status into v_oper_mac,v_oper_ip_addr,v_oper_info,v_init_date,v_asset_acco_no,v_pass_no,v_out_acco,v_exch_no,v_stock_acco,v_stock_code,v_wtdraw_date,v_wtdraw_time,v_order_date,v_order_id,v_report_no,v_wtdraw_status from db_tdsecu.tb_tdsetd_cancel where row_id=v_wtdraw_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.9.23.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("撤单序号=",v_wtdraw_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("撤单序号=",v_wtdraw_id);
        end if;
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

# 原子_交易证券_主推接口_循环获取指令信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_LoopGetCommInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_LoopGetCommInfo(
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
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_crncy_type varchar(3),
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
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
    declare v_comm_id bigint;
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
    SET v_comm_id = p_comm_id;
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
    

    /* [获取表记录变量][交易证券_指令_指令表][{初始化日期},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{交易币种},{股东代码编号},{证券代码编号},{指令时间},{指令下达人},{指令方向},{指令限价},{指令数量},{指令金额},{订单数量},{指令撤销数量},{成交金额},{成交数量},{指令冻结金额},{指令冻结数量},{成交状态},{指令状态},{指令开始日期},{指令结束日期},{指令开始时间},{指令结束时间},{指令完成日期},{指令完成时间},{指令审批日期},{指令审批时间},{指令审批状态},{指令审批操作员},{指令审批说明},{篮子序号},{净价标志},{债券计提利息},{债券利率类型},{指令操作方式},{体外指令标志},{指令完成标志},{更新次数}][@初始化日期#,@产品编号#,@交易组编号#,@资产账户编号#,@通道编号#,@外部账号#,@交易币种#,@股东代码编号#,@证券代码编号#,@指令时间#,@指令下达人#,@指令方向#,@指令限价#,@指令数量#,@指令金额#,@订单数量#,@指令撤销数量#,@成交金额#,@成交数量#,@指令冻结金额#,@指令冻结数量#,@成交状态#,@指令状态#,@指令开始日期#,@指令结束日期#,@指令开始时间#,@指令结束时间#,@指令完成日期#,@指令完成时间#,@指令审批日期#,@指令审批时间#,@指令审批状态#,@指令审批操作员#,@指令审批说明#,@篮子序号#,@净价标志#,@债券计提利息#,@债券利率类型#,@指令操作方式#,@体外指令标志#,@指令完成标志#,@更新次数#][{记录序号}=@指令序号#][4][@指令序号#] */
    select init_date,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_crncy_type,stock_acco_no,stock_code_no,comm_time,comm_opor,comm_dir,comm_limit_price,comm_qty,comm_amt,order_qty,comm_cancel_qty,strike_amt,strike_qty,comm_frozen_amt,comm_frozen_qty,strike_status,comm_status,comm_begin_date,comm_end_date,comm_begin_time,comm_end_time,comm_comple_date,comm_comple_time,comm_appr_date,comm_appr_time,comm_appr_status,comm_appr_oper,comm_appr_remark,basket_id,net_price_flag,bond_accr_intrst,bond_rate_type,comm_oper_way,exter_comm_flag,comm_comple_flag,update_times into v_init_date,v_pd_no,v_exch_group_no,v_asset_acco_no,v_pass_no,v_out_acco,v_exch_crncy_type,v_stock_acco_no,v_stock_code_no,v_comm_time,v_comm_opor,v_comm_dir,v_comm_limit_price,v_comm_qty,v_comm_amt,v_order_qty,v_comm_cancel_qty,v_strike_amt,v_strike_qty,v_comm_frozen_amt,v_comm_frozen_qty,v_strike_status,v_comm_status,v_comm_begin_date,v_comm_end_date,v_comm_begin_time,v_comm_end_time,v_comm_comple_date,v_comm_comple_time,v_comm_appr_date,v_comm_appr_time,v_comm_appr_status,v_comm_appr_oper,v_comm_appr_remark,v_basket_id,v_net_price_flag,v_bond_accr_intrst,v_bond_rate_type,v_comm_oper_way,v_exter_comm_flag,v_comm_comple_flag,v_update_times from db_tdsecu.tb_tdseap_command where row_id=v_comm_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.9.24.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
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

# 原子_交易证券_主推接口_获取批量订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetBatchOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetBatchOrderInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_id_str varchar(2048),
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_count int;

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @订单序号串# = concat(";",@订单序号串#); */
    set v_order_id_str = concat(";",v_order_id_str);

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][交易证券_交易_订单表][{记录序号} as {订单序号},{操作员编号} as {业务操作员编号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{股东代码编号},{证券代码编号},{证券类型},{通道编号},{外部编号},{外部账号},{交易币种},{市场编号},{证券代码},{股东代码},{指令序号},{指令批号},{订单批号},{订单方向},{订单数量},{订单价格},{订单时间},{撤单数量},{申报日期},{申报时间},{申报编号},{票面面值},{质押比例},{回报信息},{成交金额},{成交数量},{成交债券计提利息},{价格类型},{订单操作方式},{订单状态},{订单冻结金额},{订单冻结数量},{净价标志},{债券计提利息},{债券利率类型},{更新次数},{订单日期},{组合代码},{组合持仓序号},{策略序号},{登记机构},{交易账户},{合同编号},{资产账户类型}][instr(@订单序号串#, concat(";",{记录序号},";"))>0][@指定行数#] */
    if v_row_count = -1 then
        select row_id as order_id,opor_no as busi_opor_no,co_no,pd_no,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no,stock_type,pass_no,external_no,out_acco,exch_crncy_type,exch_no,stock_code,stock_acco,comm_id,comm_batch_no,order_batch_no,order_dir,order_qty,order_price,order_time,wtdraw_qty,report_date,report_time,report_no,par_value,impawn_ratio,rsp_info,strike_amt,strike_qty,strike_bond_accr_intrst,price_type,order_oper_way,order_status,order_frozen_amt,order_frozen_qty,net_price_flag,bond_accr_intrst,bond_rate_type,update_times,order_date,combo_code,combo_posi_id,strategy_id,registration_agency,trade_acco,contra_no,asset_acco_type from db_tdsecu.tb_tdsetd_order where instr(v_order_id_str, concat(";",row_id,";"))>0;
    else
        select row_id as order_id,opor_no as busi_opor_no,co_no,pd_no,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no,stock_type,pass_no,external_no,out_acco,exch_crncy_type,exch_no,stock_code,stock_acco,comm_id,comm_batch_no,order_batch_no,order_dir,order_qty,order_price,order_time,wtdraw_qty,report_date,report_time,report_no,par_value,impawn_ratio,rsp_info,strike_amt,strike_qty,strike_bond_accr_intrst,price_type,order_oper_way,order_status,order_frozen_amt,order_frozen_qty,net_price_flag,bond_accr_intrst,bond_rate_type,update_times,order_date,combo_code,combo_posi_id,strategy_id,registration_agency,trade_acco,contra_no,asset_acco_type from db_tdsecu.tb_tdsetd_order where instr(v_order_id_str, concat(";",row_id,";"))>0 limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_主推接口_获取批量指令信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetBatchCommandInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetBatchCommandInfo(
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
    declare v_row_count int;

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
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指令序号串# = concat(";",@指令序号串#); */
    set v_comm_id_str = concat(";",v_comm_id_str);

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][交易证券_指令_指令表][{记录序号} as {指令序号},{初始化日期},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{交易币种},{股东代码编号},{证券代码编号},{证券类型},{指令时间},{指令下达人},{指令方向},{指令限价},{指令实际限价},{指令数量},{指令金额},{订单数量},{指令撤销数量},{成交金额},{成交数量},{指令冻结金额},{指令冻结数量},{成交状态},{指令状态},{指令开始日期},{指令结束日期},{指令开始时间},{指令结束时间},{指令完成日期},{指令完成时间},{指令审批日期},{指令审批时间},{指令审批状态},{指令审批操作员},{指令审批说明},{篮子序号},{净价标志},{债券计提利息},{债券利率类型},{指令操作方式},{体外指令标志},{指令完成标志},{策略占用数量},{策略订单数量},{合同编号},{指令备注信息},{分发操作员},{分发状态},{组合代码},{更新次数}][instr(@指令序号串#, concat(";",{记录序号},";"))>0][@指定行数#] */
    if v_row_count = -1 then
        select row_id as comm_id,init_date,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_crncy_type,stock_acco_no,stock_code_no,stock_type,comm_time,comm_opor,comm_dir,comm_limit_price,limit_actual_price,comm_qty,comm_amt,order_qty,comm_cancel_qty,strike_amt,strike_qty,comm_frozen_amt,comm_frozen_qty,strike_status,comm_status,comm_begin_date,comm_end_date,comm_begin_time,comm_end_time,comm_comple_date,comm_comple_time,comm_appr_date,comm_appr_time,comm_appr_status,comm_appr_oper,comm_appr_remark,basket_id,net_price_flag,bond_accr_intrst,bond_rate_type,comm_oper_way,exter_comm_flag,comm_comple_flag,strategy_capt_qty,strategy_order_qty,contra_no,comm_remark_info,disp_opor,disp_status,combo_code,update_times from db_tdsecu.tb_tdseap_command where instr(v_comm_id_str, concat(";",row_id,";"))>0;
    else
        select row_id as comm_id,init_date,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_crncy_type,stock_acco_no,stock_code_no,stock_type,comm_time,comm_opor,comm_dir,comm_limit_price,limit_actual_price,comm_qty,comm_amt,order_qty,comm_cancel_qty,strike_amt,strike_qty,comm_frozen_amt,comm_frozen_qty,strike_status,comm_status,comm_begin_date,comm_end_date,comm_begin_time,comm_end_time,comm_comple_date,comm_comple_time,comm_appr_date,comm_appr_time,comm_appr_status,comm_appr_oper,comm_appr_remark,basket_id,net_price_flag,bond_accr_intrst,bond_rate_type,comm_oper_way,exter_comm_flag,comm_comple_flag,strategy_capt_qty,strategy_order_qty,contra_no,comm_remark_info,disp_opor,disp_status,combo_code,update_times from db_tdsecu.tb_tdseap_command where instr(v_comm_id_str, concat(";",row_id,";"))>0 limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_主推接口_获取批量撤单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetBatchCancelInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetBatchCancelInfo(
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
    declare v_row_count int;

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
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @撤单序号串# = concat(";",@撤单序号串#); */
    set v_wtdraw_id_str = concat(";",v_wtdraw_id_str);

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][交易证券_交易_撤单表][{操作MAC},{操作IP},{操作信息},{初始化日期},{资产账户编号},{通道编号},{外部账号},{市场编号},{股东代码},{证券代码},{撤单日期},{撤单时间},{订单日期},{订单序号},{申报编号},{撤单状态},{订单价格},{记录序号} AS {撤单序号}][instr(@撤单序号串#, concat(";",{记录序号},";"))>0][@指定行数#] */
    if v_row_count = -1 then
        select oper_mac,oper_ip_addr,oper_info,init_date,asset_acco_no,pass_no,out_acco,exch_no,stock_acco,stock_code,wtdraw_date,wtdraw_time,order_date,order_id,report_no,wtdraw_status,order_price,row_id AS wtdraw_id from db_tdsecu.tb_tdsetd_cancel where instr(v_wtdraw_id_str, concat(";",row_id,";"))>0;
    else
        select oper_mac,oper_ip_addr,oper_info,init_date,asset_acco_no,pass_no,out_acco,exch_no,stock_acco,stock_code,wtdraw_date,wtdraw_time,order_date,order_id,report_no,wtdraw_status,order_price,row_id AS wtdraw_id from db_tdsecu.tb_tdsetd_cancel where instr(v_wtdraw_id_str, concat(";",row_id,";"))>0 limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_主推接口_获取资金和质押持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetCashImpawnPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetCashImpawnPosi(
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
    

    /* [获取表记录变量语句][交易证券_账户_交易组业务资金表][{记录序号},{冻结金额},{解冻金额},{指令冻结金额},{指令解冻金额},{指令占用金额},{指令释放金额},{交易冻结金额},{交易解冻金额},{交易占用金额},{交易释放金额},{成交占用金额},{成交释放金额},{更新次数}][@交易组资金序号#,@交易组冻结金额#,@交易组解冻金额#,@交易组指令冻结金额#,@交易组指令解冻金额#,@交易组指令占用金额#,@交易组指令释放金额#,@交易组交易冻结金额#,@交易组交易解冻金额#,@交易组交易占用金额#,@交易组交易释放金额#,@交易组成交占用金额#,@交易组成交释放金额#,@交易组资金更新次数#][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {交易币种}=@交易币种#] */
    select row_id,frozen_amt,unfroz_amt,comm_frozen_amt,comm_unfroz_amt,comm_capt_amt,comm_releas_amt,trade_frozen_amt,trade_unfroz_amt,trade_capt_amt,trade_releas_amt,strike_capt_amt,strike_releas_amt,update_times into v_exgp_cash_id,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_comm_frozen_amt,v_exgp_comm_unfroz_amt,v_exgp_comm_capt_amt,v_exgp_comm_releas_amt,v_exgp_trade_frozen_amt,v_exgp_trade_unfroz_amt,v_exgp_trade_capt_amt,v_exgp_trade_releas_amt,v_exgp_strike_capt_amt,v_exgp_strike_releas_amt,v_exgp_cash_update_times from db_tdsecu.tb_tdseac_exgp_busi_capit where exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and exch_crncy_type=v_exch_crncy_type limit 1;


    /* [获取表记录变量语句][交易证券_账户_交易组业务持仓表][{记录序号},{冻结数量},{解冻数量},{指令冻结数量},{指令解冻数量},{指令占用数量},{指令释放数量},{交易冻结数量},{交易解冻数量},{交易占用数量},{交易释放数量},{成交占用数量},{成交释放数量},{成交冻结数量},{成交解冻数量},{实现盈亏},{成本金额},{利息成本金额},{利息收益},{更新次数}][@交易组持仓序号#,@交易组冻结数量#,@交易组解冻数量#,@交易组指令冻结数量#,@交易组指令解冻数量#,@交易组指令占用数量#,@交易组指令释放数量#,@交易组交易冻结数量#,@交易组交易解冻数量#,@交易组交易占用数量#,@交易组交易释放数量#,@交易组成交占用数量#,@交易组成交释放数量#,@交易组成交冻结数量#,@交易组成交解冻数量#,@交易组实现盈亏#,@交易组成本金额#,@交易组利息成本金额#,@交易组利息收益#,@交易组持仓更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@交易代码编号#] */
    select row_id,frozen_qty,unfroz_qty,comm_frozen_qty,comm_unfroz_qty,comm_capt_qty,comm_releas_qty,trade_frozen_qty,trade_unfroz_qty,trade_capt_qty,trade_releas_qty,strike_capt_qty,strike_releas_qty,strike_frozen_qty,strike_unfroz_qty,realize_pandl,cost_amt,intrst_cost_amt,intrst_pandl,update_times into v_exgp_posi_id,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_comm_frozen_qty,v_exgp_comm_unfroz_qty,v_exgp_comm_capt_qty,v_exgp_comm_releas_qty,v_exgp_trade_frozen_qty,v_exgp_trade_unfroz_qty,v_exgp_trade_capt_qty,v_exgp_trade_releas_qty,v_exgp_strike_capt_qty,v_exgp_strike_releas_qty,v_exgp_strike_frozen_qty,v_exgp_strike_unfroz_qty,v_exgp_realize_pandl,v_exgp_cost_amt,v_exgp_intrst_cost_amt,v_exgp_intrst_pandl,v_exgp_posi_update_times from db_tdsecu.tb_tdseac_exgp_busi_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_trade_code_no limit 1;


    /* [获取表记录变量语句][交易证券_账户_交易组业务持仓表][{记录序号},{冻结数量},{解冻数量},{指令冻结数量},{指令解冻数量},{指令占用数量},{指令释放数量},{交易冻结数量},{交易解冻数量},{交易占用数量},{交易释放数量},{成交占用数量},{成交释放数量},{成交冻结数量},{成交解冻数量},{实现盈亏},{成本金额},{利息成本金额},{利息收益},{更新次数}][@交易组标的持仓序号#,@交易组标的冻结数量#,@交易组标的解冻数量#,@交易组标的指令冻结数量#,@交易组标的指令解冻数量#,@交易组标的指令占用数量#,@交易组标的指令释放数量#,@交易组标的交易冻结数量#,@交易组标的交易解冻数量#,@交易组标的交易占用数量#,@交易组标的交易释放数量#,@交易组标的成交占用数量#,@交易组标的成交释放数量#,@交易组标的成交冻结数量#,@交易组标的成交解冻数量#,@交易组标的实现盈亏#,@交易组标的成本金额#,@交易组标的利息成本金额#,@交易组标的利息收益#,@交易组标的持仓更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@标的代码编号#] */
    select row_id,frozen_qty,unfroz_qty,comm_frozen_qty,comm_unfroz_qty,comm_capt_qty,comm_releas_qty,trade_frozen_qty,trade_unfroz_qty,trade_capt_qty,trade_releas_qty,strike_capt_qty,strike_releas_qty,strike_frozen_qty,strike_unfroz_qty,realize_pandl,cost_amt,intrst_cost_amt,intrst_pandl,update_times into v_exgp_target_posi_id,v_exgp_target_frozen_qty,v_exgp_target_unfroz_qty,v_exgp_target_comm_frozen_qty,v_exgp_target_comm_unfroz_qty,v_exgp_target_comm_capt_qty,v_exgp_target_comm_releas_qty,v_exgp_target_trade_frozen_qty,v_exgp_target_trade_unfroz_qty,v_exgp_target_trade_capt_qty,v_exgp_target_trade_releas_qty,v_exgp_target_strike_capt_qty,v_exgp_target_strike_releas_qty,v_exgp_target_strike_frozen_qty,v_exgp_target_strike_unfroz_qty,v_exgp_target_realize_pandl,v_exgp_target_cost_amt,v_exgp_target_intrst_cost_amt,v_exgp_target_intrst_pandl,v_exgp_target_posi_update_times from db_tdsecu.tb_tdseac_exgp_busi_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_target_code_no limit 1;


    /* [获取表记录变量语句][交易证券_账户_资产账户业务资金表][{记录序号},{冻结金额},{解冻金额},{指令冻结金额},{指令解冻金额},{指令占用金额},{指令释放金额},{交易冻结金额},{交易解冻金额},{交易占用金额},{交易释放金额},{成交占用金额},{成交释放金额},{更新次数}][@资产账户持仓序号#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户指令冻结金额#,@资产账户指令解冻金额#,@资产账户指令占用金额#,@资产账户指令释放金额#,@资产账户交易冻结金额#,@资产账户交易解冻金额#,@资产账户交易占用金额#,@资产账户交易释放金额#,@资产账户成交占用金额#,@资产账户成交释放金额#,@资产账户资金更新次数#][{资产账户编号} = @资产账户编号# and {交易币种}=@交易币种#] */
    select row_id,frozen_amt,unfroz_amt,comm_frozen_amt,comm_unfroz_amt,comm_capt_amt,comm_releas_amt,trade_frozen_amt,trade_unfroz_amt,trade_capt_amt,trade_releas_amt,strike_capt_amt,strike_releas_amt,update_times into v_asac_posi_id,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_comm_frozen_amt,v_asac_comm_unfroz_amt,v_asac_comm_capt_amt,v_asac_comm_releas_amt,v_asac_trade_frozen_amt,v_asac_trade_unfroz_amt,v_asac_trade_capt_amt,v_asac_trade_releas_amt,v_asac_strike_capt_amt,v_asac_strike_releas_amt,v_asac_cash_update_times from db_tdsecu.tb_tdseac_asac_busi_capit where asset_acco_no = v_asset_acco_no and exch_crncy_type=v_exch_crncy_type limit 1;


    /* [获取表记录变量语句][交易证券_账户_资产账户业务持仓表][{记录序号},{冻结数量},{解冻数量},{指令冻结数量},{指令解冻数量},{指令占用数量},{指令释放数量},{交易冻结数量},{交易解冻数量},{交易占用数量},{交易释放数量},{成交占用数量},{成交释放数量},{成交冻结数量},{成交解冻数量},{实现盈亏},{成本金额},{利息成本金额},{利息收益},{更新次数}][@资产账户持仓序号#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户指令冻结数量#,@资产账户指令解冻数量#,@资产账户指令占用数量#,@资产账户指令释放数量#,@资产账户交易冻结数量#,@资产账户交易解冻数量#,@资产账户交易占用数量#,@资产账户交易释放数量#,@资产账户成交占用数量#,@资产账户成交释放数量#,@资产账户成交冻结数量#,@资产账户成交解冻数量#,@资产账户实现盈亏#,@资产账户成本金额#,@资产账户利息成本金额#,@资产账户利息收益#,@资产账户持仓更新次数#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@交易代码编号#] */
    select row_id,frozen_qty,unfroz_qty,comm_frozen_qty,comm_unfroz_qty,comm_capt_qty,comm_releas_qty,trade_frozen_qty,trade_unfroz_qty,trade_capt_qty,trade_releas_qty,strike_capt_qty,strike_releas_qty,strike_frozen_qty,strike_unfroz_qty,realize_pandl,cost_amt,intrst_cost_amt,intrst_pandl,update_times into v_asac_posi_id,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_comm_frozen_qty,v_asac_comm_unfroz_qty,v_asac_comm_capt_qty,v_asac_comm_releas_qty,v_asac_trade_frozen_qty,v_asac_trade_unfroz_qty,v_asac_trade_capt_qty,v_asac_trade_releas_qty,v_asac_strike_capt_qty,v_asac_strike_releas_qty,v_asac_strike_frozen_qty,v_asac_strike_unfroz_qty,v_asac_realize_pandl,v_asac_cost_amt,v_asac_intrst_cost_amt,v_asac_intrst_pandl,v_asac_posi_update_times from db_tdsecu.tb_tdseac_asac_busi_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_trade_code_no limit 1;


    /* [获取表记录变量语句][交易证券_账户_资产账户业务持仓表][{记录序号},{冻结数量},{解冻数量},{指令冻结数量},{指令解冻数量},{指令占用数量},{指令释放数量},{交易冻结数量},{交易解冻数量},{交易占用数量},{交易释放数量},{成交占用数量},{成交释放数量},{成交冻结数量},{成交解冻数量},{实现盈亏},{成本金额},{利息成本金额},{利息收益},{更新次数}][@资产账户标的持仓序号#,@资产账户标的冻结数量#,@资产账户标的解冻数量#,@资产账户标的指令冻结数量#,@资产账户标的指令解冻数量#,@资产账户标的指令占用数量#,@资产账户标的指令释放数量#,@资产账户标的交易冻结数量#,@资产账户标的交易解冻数量#,@资产账户标的交易占用数量#,@资产账户标的交易释放数量#,@资产账户标的成交占用数量#,@资产账户标的成交释放数量#,@资产账户标的成交冻结数量#,@资产账户标的成交解冻数量#,@资产账户标的实现盈亏#,@资产账户标的成本金额#,@资产账户标的利息成本金额#,@资产账户标的利息收益#,@资产账户标的持仓更新次数#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@标的代码编号#] */
    select row_id,frozen_qty,unfroz_qty,comm_frozen_qty,comm_unfroz_qty,comm_capt_qty,comm_releas_qty,trade_frozen_qty,trade_unfroz_qty,trade_capt_qty,trade_releas_qty,strike_capt_qty,strike_releas_qty,strike_frozen_qty,strike_unfroz_qty,realize_pandl,cost_amt,intrst_cost_amt,intrst_pandl,update_times into v_asac_target_posi_id,v_asac_target_frozen_qty,v_asac_target_unfroz_qty,v_asac_target_comm_frozen_qty,v_asac_target_comm_unfroz_qty,v_asac_target_comm_capt_qty,v_asac_target_comm_releas_qty,v_asac_target_trade_frozen_qty,v_asac_target_trade_unfroz_qty,v_asac_target_trade_capt_qty,v_asac_target_trade_releas_qty,v_asac_target_strike_capt_qty,v_asac_target_strike_releas_qty,v_asac_target_strike_frozen_qty,v_asac_target_strike_unfroz_qty,v_asac_target_realize_pandl,v_asac_target_cost_amt,v_asac_target_intrst_cost_amt,v_asac_target_intrst_pandl,v_asac_target_posi_update_times from db_tdsecu.tb_tdseac_asac_busi_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_target_code_no limit 1;


    /* [获取表记录变量语句][交易证券_账户_交易组债券质押表][{当前数量}][@交易组提交质押数量#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@交易代码编号#] */
    select curr_qty into v_exgp_put_impawn_qty from db_tdsecu.tb_tdseac_exgp_bond_impawn where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_trade_code_no limit 1;


    /* [获取表记录变量语句][交易证券_账户_资产账户债券质押表][{当前数量}][@资产账户提交质押数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@交易代码编号#] */
    select curr_qty into v_asac_put_impawn_qty from db_tdsecu.tb_tdseac_asac_bond_impawn where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_trade_code_no limit 1;

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

# 原子_交易证券_主推接口_获取债券回购信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetBondRepoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetBondRepoInfo(
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
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_账户_债券回购表][字段][字段变量][{回购成交序号}=@回购成交序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, target_code_no, comm_id, 
        order_dir, repo_qty, repo_amt, repo_rate, 
        repo_trade_date, repo_order_id, repo_strike_id, repo_days, 
        repo_cale_days, repo_back_date, repo_back_amt, repo_back_intrst, 
        repo_back_trade_date, repo_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_crncy_type, v_exch_crncy_type, v_exch_rate, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_target_code_no, v_comm_id, 
        v_order_dir, v_repo_qty, v_repo_amt, v_repo_rate, 
        v_repo_trade_date, v_repo_order_id, v_repo_strike_id, v_repo_days, 
        v_repo_cale_days, v_repo_back_date, v_repo_back_amt, v_repo_back_intrst, 
        v_repo_back_trade_date, v_repo_status from db_tdsecu.tb_tdseac_bond_repo where repo_strike_id=v_repo_strike_id limit 1;


    /* set @债券回购序号# = @记录序号#; */
    set v_bond_repo_id = v_row_id;
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

# 原子_交易证券_主推接口_获取资金信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetCash;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetCash(
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
    

    /* [获取表记录变量语句][交易证券_账户_交易组业务资金表][{记录序号},{冻结金额},{解冻金额},{指令冻结金额},{指令解冻金额},{指令占用金额},{指令释放金额},{交易冻结金额},{交易解冻金额},{交易占用金额},{交易释放金额},{成交占用金额},{成交释放金额},{更新次数}][@交易组资金序号#,@交易组冻结金额#,@交易组解冻金额#,@交易组指令冻结金额#,@交易组指令解冻金额#,@交易组指令占用金额#,@交易组指令释放金额#,@交易组交易冻结金额#,@交易组交易解冻金额#,@交易组交易占用金额#,@交易组交易释放金额#,@交易组成交占用金额#,@交易组成交释放金额#,@交易组资金更新次数#][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {交易币种}=@交易币种#] */
    select row_id,frozen_amt,unfroz_amt,comm_frozen_amt,comm_unfroz_amt,comm_capt_amt,comm_releas_amt,trade_frozen_amt,trade_unfroz_amt,trade_capt_amt,trade_releas_amt,strike_capt_amt,strike_releas_amt,update_times into v_exgp_cash_id,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_comm_frozen_amt,v_exgp_comm_unfroz_amt,v_exgp_comm_capt_amt,v_exgp_comm_releas_amt,v_exgp_trade_frozen_amt,v_exgp_trade_unfroz_amt,v_exgp_trade_capt_amt,v_exgp_trade_releas_amt,v_exgp_strike_capt_amt,v_exgp_strike_releas_amt,v_exgp_cash_update_times from db_tdsecu.tb_tdseac_exgp_busi_capit where exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and exch_crncy_type=v_exch_crncy_type limit 1;


    /* [获取表记录变量语句][交易证券_账户_资产账户业务资金表][{记录序号},{冻结金额},{解冻金额},{指令冻结金额},{指令解冻金额},{指令占用金额},{指令释放金额},{交易冻结金额},{交易解冻金额},{交易占用金额},{交易释放金额},{成交占用金额},{成交释放金额},{更新次数}][@资产账户资金序号#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户指令冻结金额#,@资产账户指令解冻金额#,@资产账户指令占用金额#,@资产账户指令释放金额#,@资产账户交易冻结金额#,@资产账户交易解冻金额#,@资产账户交易占用金额#,@资产账户交易释放金额#,@资产账户成交占用金额#,@资产账户成交释放金额#,@资产账户资金更新次数#][{资产账户编号} = @资产账户编号# and {交易币种}=@交易币种#] */
    select row_id,frozen_amt,unfroz_amt,comm_frozen_amt,comm_unfroz_amt,comm_capt_amt,comm_releas_amt,trade_frozen_amt,trade_unfroz_amt,trade_capt_amt,trade_releas_amt,strike_capt_amt,strike_releas_amt,update_times into v_asac_cash_id,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_comm_frozen_amt,v_asac_comm_unfroz_amt,v_asac_comm_capt_amt,v_asac_comm_releas_amt,v_asac_trade_frozen_amt,v_asac_trade_unfroz_amt,v_asac_trade_capt_amt,v_asac_trade_releas_amt,v_asac_strike_capt_amt,v_asac_strike_releas_amt,v_asac_cash_update_times from db_tdsecu.tb_tdseac_asac_busi_capit where asset_acco_no = v_asset_acco_no and exch_crncy_type=v_exch_crncy_type limit 1;

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

# 原子_交易证券_主推接口_批量获取资产账户持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetBatchAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetBatchAsacPosi(
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
    declare v_row_count int;

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
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @股东代码证券代码编号串# = concat(";",@股东代码证券代码编号串#); */
    set v_stock_acco_no_stock_code_no_str = concat(";",v_stock_acco_no_stock_code_no_str);

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][交易证券_账户_资产账户业务持仓表][{记录序号} as {资产账户持仓序号},{股东代码编号},{市场编号},{证券代码编号},{冻结数量} as {资产账户冻结数量},{解冻数量} as {资产账户解冻数量},{指令冻结数量} as {资产账户指令冻结数量},{指令解冻数量} as {资产账户指令解冻数量},{指令占用数量} as {资产账户指令占用数量},{指令释放数量} as {资产账户指令释放数量},{交易冻结数量} as {资产账户交易冻结数量},{交易解冻数量} as {资产账户交易解冻数量},{交易占用数量} as {资产账户交易占用数量},{交易释放数量} as {资产账户交易释放数量},{成交占用数量} as {资产账户成交占用数量},{成交释放数量} as {资产账户成交释放数量},{成交冻结数量} as {资产账户成交冻结数量},{成交解冻数量} as {资产账户成交解冻数量},{实现盈亏} as {资产账户实现盈亏},{成本金额} as {资产账户成本金额},{利息成本金额} as {资产账户利息成本金额},{利息收益} as {资产账户利息收益},{更新次数} as {资产账户持仓更新次数}][instr(@股东代码证券代码编号串#, concat(";",{股东代码编号},"|",{证券代码编号},";"))>0 and {资产账户编号}=@资产账户编号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id as asac_posi_id,stock_acco_no,exch_no,stock_code_no,frozen_qty as asac_frozen_qty,unfroz_qty as asac_unfroz_qty,comm_frozen_qty as asac_comm_frozen_qty,comm_unfroz_qty as asac_comm_unfroz_qty,comm_capt_qty as asac_comm_capt_qty,comm_releas_qty as asac_comm_releas_qty,trade_frozen_qty as asac_trade_frozen_qty,trade_unfroz_qty as asac_trade_unfroz_qty,trade_capt_qty as asac_trade_capt_qty,trade_releas_qty as asac_trade_releas_qty,strike_capt_qty as asac_strike_capt_qty,strike_releas_qty as asac_strike_releas_qty,strike_frozen_qty as asac_strike_frozen_qty,strike_unfroz_qty as asac_strike_unfroz_qty,realize_pandl as asac_realize_pandl,cost_amt as asac_cost_amt,intrst_cost_amt as asac_intrst_cost_amt,intrst_pandl as asac_intrst_pandl,update_times as asac_posi_update_times from db_tdsecu.tb_tdseac_asac_busi_posi where instr(v_stock_acco_no_stock_code_no_str, concat(";",stock_acco_no,"|",stock_code_no,";"))>0 and asset_acco_no=v_asset_acco_no;
    else
        select row_id as asac_posi_id,stock_acco_no,exch_no,stock_code_no,frozen_qty as asac_frozen_qty,unfroz_qty as asac_unfroz_qty,comm_frozen_qty as asac_comm_frozen_qty,comm_unfroz_qty as asac_comm_unfroz_qty,comm_capt_qty as asac_comm_capt_qty,comm_releas_qty as asac_comm_releas_qty,trade_frozen_qty as asac_trade_frozen_qty,trade_unfroz_qty as asac_trade_unfroz_qty,trade_capt_qty as asac_trade_capt_qty,trade_releas_qty as asac_trade_releas_qty,strike_capt_qty as asac_strike_capt_qty,strike_releas_qty as asac_strike_releas_qty,strike_frozen_qty as asac_strike_frozen_qty,strike_unfroz_qty as asac_strike_unfroz_qty,realize_pandl as asac_realize_pandl,cost_amt as asac_cost_amt,intrst_cost_amt as asac_intrst_cost_amt,intrst_pandl as asac_intrst_pandl,update_times as asac_posi_update_times from db_tdsecu.tb_tdseac_asac_busi_posi where instr(v_stock_acco_no_stock_code_no_str, concat(";",stock_acco_no,"|",stock_code_no,";"))>0 and asset_acco_no=v_asset_acco_no limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_主推接口_批量获取交易组持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetBatchExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetBatchExgpPosi(
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
    declare v_row_count int;

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
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @股东代码证券代码编号串# = concat(";",@股东代码证券代码编号串#); */
    set v_stock_acco_no_stock_code_no_str = concat(";",v_stock_acco_no_stock_code_no_str);

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][交易证券_账户_交易组业务持仓表][{记录序号} as {交易组持仓序号},{股东代码编号},{市场编号},{证券代码编号},{冻结数量} as {交易组冻结数量},{解冻数量} as {交易组解冻数量},{指令冻结数量} as {交易组指令冻结数量},{指令解冻数量} as {交易组指令解冻数量},{指令占用数量} as {交易组指令占用数量},{指令释放数量} as {交易组指令释放数量},{交易冻结数量} as {交易组交易冻结数量},{交易解冻数量} as {交易组交易解冻数量},{交易占用数量} as {交易组交易占用数量},{交易释放数量} as {交易组交易释放数量},{成交占用数量} as {交易组成交占用数量},{成交释放数量} as {交易组成交释放数量},{成交冻结数量} as {交易组成交冻结数量},{成交解冻数量} as {交易组成交解冻数量},{实现盈亏} as {交易组实现盈亏},{成本金额} as {交易组成本金额},{利息成本金额} as {交易组利息成本金额},{利息收益} as {交易组利息收益},{更新次数} as {交易组持仓更新次数}][instr(@股东代码证券代码编号串#, concat(";",{股东代码编号},"|",{证券代码编号},";"))>0 and {资产账户编号}=@资产账户编号# and {交易组编号} = @交易组编号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id as exgp_posi_id,stock_acco_no,exch_no,stock_code_no,frozen_qty as exgp_frozen_qty,unfroz_qty as exgp_unfroz_qty,comm_frozen_qty as exgp_comm_frozen_qty,comm_unfroz_qty as exgp_comm_unfroz_qty,comm_capt_qty as exgp_comm_capt_qty,comm_releas_qty as exgp_comm_releas_qty,trade_frozen_qty as exgp_trade_frozen_qty,trade_unfroz_qty as exgp_trade_unfroz_qty,trade_capt_qty as exgp_trade_capt_qty,trade_releas_qty as exgp_trade_releas_qty,strike_capt_qty as exgp_strike_capt_qty,strike_releas_qty as exgp_strike_releas_qty,strike_frozen_qty as exgp_strike_frozen_qty,strike_unfroz_qty as exgp_strike_unfroz_qty,realize_pandl as exgp_realize_pandl,cost_amt as exgp_cost_amt,intrst_cost_amt as exgp_intrst_cost_amt,intrst_pandl as exgp_intrst_pandl,update_times as exgp_posi_update_times from db_tdsecu.tb_tdseac_exgp_busi_posi where instr(v_stock_acco_no_stock_code_no_str, concat(";",stock_acco_no,"|",stock_code_no,";"))>0 and asset_acco_no=v_asset_acco_no and exch_group_no = v_exch_group_no;
    else
        select row_id as exgp_posi_id,stock_acco_no,exch_no,stock_code_no,frozen_qty as exgp_frozen_qty,unfroz_qty as exgp_unfroz_qty,comm_frozen_qty as exgp_comm_frozen_qty,comm_unfroz_qty as exgp_comm_unfroz_qty,comm_capt_qty as exgp_comm_capt_qty,comm_releas_qty as exgp_comm_releas_qty,trade_frozen_qty as exgp_trade_frozen_qty,trade_unfroz_qty as exgp_trade_unfroz_qty,trade_capt_qty as exgp_trade_capt_qty,trade_releas_qty as exgp_trade_releas_qty,strike_capt_qty as exgp_strike_capt_qty,strike_releas_qty as exgp_strike_releas_qty,strike_frozen_qty as exgp_strike_frozen_qty,strike_unfroz_qty as exgp_strike_unfroz_qty,realize_pandl as exgp_realize_pandl,cost_amt as exgp_cost_amt,intrst_cost_amt as exgp_intrst_cost_amt,intrst_pandl as exgp_intrst_pandl,update_times as exgp_posi_update_times from db_tdsecu.tb_tdseac_exgp_busi_posi where instr(v_stock_acco_no_stock_code_no_str, concat(";",stock_acco_no,"|",stock_code_no,";"))>0 and asset_acco_no=v_asset_acco_no and exch_group_no = v_exch_group_no limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_主推接口_获取待执行订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetPendOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetPendOrderInfo(
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
    declare v_row_id bigint;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_func_code varchar(16);
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
    SET v_row_id = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_交易_待执行订单表][字段][字段变量][{记录序号}=@待执行订单序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, trade_code_no, 
        target_code_no, stock_type, asset_type, comm_id, 
        comm_batch_no, order_date, order_time, order_batch_no, 
        order_dir, price_type, exec_price_type, price_offset, 
        order_qty, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, order_oper_way, 
        external_no, pend_order_status, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_stock_acco_no, 
        v_stock_acco, v_stock_code_no, v_stock_code, v_trade_code_no, 
        v_target_code_no, v_stock_type, v_asset_type, v_comm_id, 
        v_comm_batch_no, v_order_date, v_order_time, v_order_batch_no, 
        v_order_dir, v_price_type, v_exec_price_type, v_price_offset, 
        v_order_qty, v_net_price_flag, v_intrst_days, v_par_value, 
        v_bond_accr_intrst, v_bond_rate_type, v_impawn_ratio, v_order_oper_way, 
        v_external_no, v_pend_order_status, v_remark_info from db_tdsecu.tb_tdsetd_pendorder where row_id=v_pend_order_id limit 1;

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

# 原子_交易证券_主推接口_获取券源信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetStockSourceInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetStockSourceInfo(
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
    declare v_T0_limit_method int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_begin_qty decimal(18,2);
    declare v_total_realize_pandl decimal(18,4);

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
    SET v_T0_limit_method = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_begin_qty = 0;
    SET v_total_realize_pandl = 0;

    
    label_pro:BEGIN
    

    /* set @T0限额方式# = substring(@机构业务控制配置串#, 23, 1); */
    set v_T0_limit_method = substring(v_co_busi_config_str, 23, 1);

    /* [获取表记录变量语句][交易证券_T0_操作员券源设置表][字段][字段变量][{操作员编号}=@业务操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, pd_no, exch_group_no, asset_acco_no, 
        stock_acco_no, stock_code_no, stock_code, exch_no, 
        begin_qty, source_stock_qty, single_limit_qty, assigned_qty, 
        trade_releas_qty, trade_capt_qty, strike_releas_qty, strike_capt_qty, 
        total_realize_pandl, over_night_pandl, sum_realize_pandl, total_open_posi_fee, 
        total_close_posi_fee, out_order_releas_qty, out_order_capt_qty, out_strike_releas_qty, 
        out_strike_capt_qty, over_night_trade_buy_qty, over_night_trade_sell_qty, over_night_strike_sell_qty, 
        diff_qty, t0_buy_type, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_opor_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_code, v_exch_no, 
        v_begin_qty, v_source_stock_qty, v_single_limit_qty, v_assigned_qty, 
        v_trade_releas_qty, v_trade_capt_qty, v_strike_releas_qty, v_strike_capt_qty, 
        v_total_realize_pandl, v_over_night_pandl, v_sum_realize_pandl, v_total_open_posi_fee, 
        v_total_close_posi_fee, v_out_order_releas_qty, v_out_order_capt_qty, v_out_strike_releas_qty, 
        v_out_strike_capt_qty, v_over_night_trade_buy_qty, v_over_night_trade_sell_qty, v_over_night_strike_sell_qty, 
        v_diff_qty, v_t0_buy_type, v_remark_info from db_tdsecu.tb_tdset0_opor_stock_source where opor_no=v_busi_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no = v_stock_acco_no limit 1;


    /* [获取表记录变量语句][交易证券_T0_操作员券源设置表][IFNULL(SUM({隔夜仓强平交易卖出数量}),0),IFNULL(SUM({隔夜仓强平成交卖出数量}),0)][@隔夜仓强平总交易卖出数量#,@隔夜仓强平总成交卖出数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#] */
    select IFNULL(SUM(over_night_trade_sell_qty),0),IFNULL(SUM(over_night_strike_sell_qty),0) into v_over_night_sumtrd_sell_qty,v_over_night_sumstk_sell_qty from db_tdsecu.tb_tdset0_opor_stock_source where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no = v_stock_acco_no limit 1;


    /* if @T0限额方式# = 《T0限额方式-限额》 then */
    if v_T0_limit_method = 1 then

        /* set @买入可用数量# = @券源数量# - @交易释放数量# - @成交释放数量#; */
        set v_buy_avail_qty = v_source_stock_qty - v_trade_releas_qty - v_strike_releas_qty;

        /* set @卖出可用数量# =  @券源数量# - @交易占用数量# - @成交占用数量#; */
        set v_sell_avail_qty =  v_source_stock_qty - v_trade_capt_qty - v_strike_capt_qty;

        /* set @持仓数量# =  @券源数量# + @成交释放数量# - @成交占用数量#; */
        set v_posi_qty =  v_source_stock_qty + v_strike_releas_qty - v_strike_capt_qty;
    else

        /* set @买入可用数量# = @券源数量# - @交易释放数量# - @成交释放数量# + @数量差额# - @隔夜仓强平交易卖出数量#; */
        set v_buy_avail_qty = v_source_stock_qty - v_trade_releas_qty - v_strike_releas_qty + v_diff_qty - v_over_night_trade_sell_qty;

        /* set @卖出可用数量# = @券源数量# - @交易占用数量# - @成交占用数量#+@数量差额# - @隔夜仓强平交易卖出数量#; */
        set v_sell_avail_qty = v_source_stock_qty - v_trade_capt_qty - v_strike_capt_qty+v_diff_qty - v_over_night_trade_sell_qty;

        /* set @持仓数量# = @券源数量# + @成交释放数量# - @成交占用数量#+@数量差额#; */
        set v_posi_qty = v_source_stock_qty + v_strike_releas_qty - v_strike_capt_qty+v_diff_qty;

        /* set @券源数量# = @券源数量# + @数量差额#  -@隔夜仓强平交易卖出数量#; */
        set v_source_stock_qty = v_source_stock_qty + v_diff_qty  -v_over_night_trade_sell_qty;
    end if;

    /* set @当日交易费# = @总开仓费用# + @总平仓费用# ; */
    set v_today_trade_fee = v_total_open_posi_fee + v_total_close_posi_fee ;

    /* set @当日盈亏# = @总实现盈亏# ; */
    set v_today_pandl = v_total_realize_pandl ;
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

# 原子_交易证券_主推接口_获取t0持仓明细信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetT0PosiDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetT0PosiDetail(
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
    OUT p_lngsht_type int,
    OUT p_curr_qty decimal(18,2),
    OUT p_open_posi_date int,
    OUT p_open_posi_time int,
    OUT p_open_posi_price decimal(16,9),
    OUT p_open_posi_value decimal(18,4),
    OUT p_open_posi_fee decimal(18,4),
    OUT p_close_posi_qty decimal(18,2),
    OUT p_close_posi_market_value decimal(18,4),
    OUT p_close_posi_fee decimal(18,4),
    OUT p_strike_no varchar(64),
    OUT p_realize_pandl decimal(18,4),
    OUT p_over_night_pandl decimal(18,4),
    OUT p_posi_status varchar(2),
    OUT p_remark_info varchar(255),
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
    declare v_row_count int;

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
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][交易证券_T0_证券持仓明细表][字段][{操作员编号}=@操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code, stock_acco_no, stock_code_no, 
        lngsht_type, curr_qty, open_posi_date, open_posi_time, 
        open_posi_price, open_posi_value, open_posi_fee, close_posi_qty, 
        close_posi_date, close_posi_time, close_posi_market_value, close_posi_fee, 
        strike_no, realize_pandl, over_night_pandl, posi_status, 
        remark_info from db_tdsecu.tb_tdset0_stock_posi_detail where opor_no=v_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no = v_stock_acco_no;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code, stock_acco_no, stock_code_no, 
        lngsht_type, curr_qty, open_posi_date, open_posi_time, 
        open_posi_price, open_posi_value, open_posi_fee, close_posi_qty, 
        close_posi_date, close_posi_time, close_posi_market_value, close_posi_fee, 
        strike_no, realize_pandl, over_night_pandl, posi_status, 
        remark_info from db_tdsecu.tb_tdset0_stock_posi_detail where opor_no=v_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no = v_stock_acco_no limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_code = v_stock_code;
    SET p_lngsht_type = v_lngsht_type;
    SET p_curr_qty = v_curr_qty;
    SET p_open_posi_date = v_open_posi_date;
    SET p_open_posi_time = v_open_posi_time;
    SET p_open_posi_price = v_open_posi_price;
    SET p_open_posi_value = v_open_posi_value;
    SET p_open_posi_fee = v_open_posi_fee;
    SET p_close_posi_qty = v_close_posi_qty;
    SET p_close_posi_market_value = v_close_posi_market_value;
    SET p_close_posi_fee = v_close_posi_fee;
    SET p_strike_no = v_strike_no;
    SET p_realize_pandl = v_realize_pandl;
    SET p_over_night_pandl = v_over_night_pandl;
    SET p_posi_status = v_posi_status;
    SET p_remark_info = v_remark_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_主推接口_获取账户汇总信息查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0if_GetAccTotalInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0if_GetAccTotalInfo(
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
    declare v_open_posi_value decimal(18,4);
    declare v_avail_amt decimal(18,4);
    declare v_close_posi_market_value decimal(18,4);

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
    SET v_open_posi_value = 0;
    SET v_avail_amt = 0;
    SET v_close_posi_market_value = 0;

    
    label_pro:BEGIN
    

    /* set @交易金额# = 0; */
    set v_trade_amt = 0;

    /* set @交易数量# = 0; */
    set v_trade_qty = 0;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @收益率# = 0; */
    set v_yield_rate = 0;

    /* set @全部费用# = 0; */
    set v_all_fee = 0;

    /* set @开仓市值# = 0; */
    set v_open_posi_value = 0;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @隔夜盈亏# = 0; */
    set v_over_night_pandl = 0;

    /* set @可用金额# = 0; */
    set v_avail_amt = 0;

    /* set @平仓市值# = 0; */
    set v_close_posi_market_value = 0;

    /* [获取表记录变量语句][交易证券_T0_证券持仓汇总表][SUM({总多头开仓市值}+{总空头开仓市值}+{总多头平仓市值}+{总空头平仓市值}) AS {交易金额},SUM({总多头当前数量} + {总空头当前数量} + {总多头平仓数量} + {总空头平仓数量}) AS {交易数量}, SUM({总实现盈亏}) as {实现盈亏},SUM({总多头开仓市值}+{总空头开仓市值}) as {开仓市值},SUM({总多头平仓市值}+{总空头平仓市值}) as {平仓市值},SUM({总多头开仓费用} + {总空头开仓费用} + {总多头平仓费用} + {总空头平仓费用}) AS  {全部费用},SUM({隔夜盈亏}) as {隔夜盈亏}][@交易金额#, @交易数量#, @实现盈亏#, @开仓市值#, @平仓市值#,@全部费用#,@隔夜盈亏#][{操作员编号} = @操作员编号#] */
    select SUM(total_long_open_posi_value+total_short_open_posi_value+total_long_close_posi_value+total_short_close_posi_value) AS trade_amt,SUM(total_long_curr_qty + total_short_curr_qty + total_long_close_posi_qty + total_short_close_posi_qty) AS trade_qty, SUM(total_realize_pandl) as realize_pandl,SUM(total_long_open_posi_value+total_short_open_posi_value) as open_posi_value,SUM(total_long_close_posi_value+total_short_close_posi_value) as close_posi_market_value,SUM(total_long_open_posi_fee + total_short_open_posi_fee + total_long_close_posi_fee + total_short_close_posi_fee) AS  all_fee,SUM(over_night_pandl) as over_night_pandl into v_trade_amt, v_trade_qty, v_realize_pandl, v_open_posi_value, v_close_posi_market_value,v_all_fee,v_over_night_pandl from db_tdsecu.tb_tdset0_stock_posi_sum where opor_no = v_opor_no limit 1;


    /* set @交易金额# = round(IFNULL(@交易金额#,0),2); */
    set v_trade_amt = round(IFNULL(v_trade_amt,0),2);

    /* set @交易数量# = IFNULL(@交易数量#,0); */
    set v_trade_qty = IFNULL(v_trade_qty,0);

    /* set @实现盈亏# = round(IFNULL(@实现盈亏#,0),2); */
    set v_realize_pandl = round(IFNULL(v_realize_pandl,0),2);

    /* set @全部费用# = round(IFNULL(@全部费用#,0),2); */
    set v_all_fee = round(IFNULL(v_all_fee,0),2);

    /* set @开仓市值# = round(IFNULL(@开仓市值#,0),2); */
    set v_open_posi_value = round(IFNULL(v_open_posi_value,0),2);

    /* set @平仓市值# = round(IFNULL(@平仓市值#,0),2); */
    set v_close_posi_market_value = round(IFNULL(v_close_posi_market_value,0),2);

    /* set @隔夜盈亏# = round(IFNULL(@隔夜盈亏#,0),2); */
    set v_over_night_pandl = round(IFNULL(v_over_night_pandl,0),2);

    /* if @平仓市值# > 0 then */
    if v_close_posi_market_value > 0 then

      /* SET @收益率# = Round(@实现盈亏#/@平仓市值#,6); */
      SET v_yield_rate = Round(v_realize_pandl/v_close_posi_market_value,6);
    end if;

    /* [获取表记录变量语句][交易证券_T0_操作员阈值设置表][{当前金额}-{冻结金额}-{交易占用金额}-{成交占用金额}+{成交释放金额},{累计实现盈亏},{更新次数}][@可用金额#,@累计实现盈亏#,@更新次数#][{操作员编号} = @操作员编号#] */
    select curr_amt-frozen_amt-trade_capt_amt-strike_capt_amt+strike_releas_amt,sum_realize_pandl,update_times into v_avail_amt,v_sum_realize_pandl,v_update_times from db_tdsecu.tb_tdset0_opor_tshold_set where opor_no = v_opor_no limit 1;

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

# 原子_交易证券_主推接口_获取t0操作员可用金额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_GetOpeatorAvailCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_GetOpeatorAvailCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    declare v_co_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_avail_amt decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
    declare v_update_times int;
    declare v_T0_limit_method int;

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
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_avail_amt = 0;
    SET v_sum_realize_pandl = 0;
    SET v_update_times = 1;
    SET v_T0_limit_method = 0;

    
    label_pro:BEGIN
    

    /* set @T0限额方式# = substring(@机构业务控制配置串#, 23, 1); */
    set v_T0_limit_method = substring(v_co_busi_config_str, 23, 1);

    /* set @可用金额# = 0; */
    set v_avail_amt = 0;

    /* if @T0限额方式# = 《T0限额方式-限额》 then */
    if v_T0_limit_method = 1 then

        /* [获取表记录变量语句][交易证券_T0_操作员阈值设置表][{当前金额}-{冻结金额}-{交易占用金额}-{成交占用金额}+{成交释放金额},{累计实现盈亏},{更新次数}][@可用金额#,@累计实现盈亏#,@更新次数#][{操作员编号} = @操作员编号#] */
        select curr_amt-frozen_amt-trade_capt_amt-strike_capt_amt+strike_releas_amt,sum_realize_pandl,update_times into v_avail_amt,v_sum_realize_pandl,v_update_times from db_tdsecu.tb_tdset0_opor_tshold_set where opor_no = v_opor_no limit 1;

    else

        /* [获取表记录变量语句][交易证券_T0_操作员阈值设置表][{当前金额}-{冻结金额}-{交易占用金额}-{成交占用金额}+{成交释放金额},{累计实现盈亏},{更新次数}][@可用金额#,@累计实现盈亏#,@更新次数#][{操作员编号} = @操作员编号#] */
        select curr_amt-frozen_amt-trade_capt_amt-strike_capt_amt+strike_releas_amt,sum_realize_pandl,update_times into v_avail_amt,v_sum_realize_pandl,v_update_times from db_tdsecu.tb_tdset0_opor_tshold_set where opor_no = v_opor_no limit 1;

    end if;

    /* set @可用金额# = round(ifnull(@可用金额#,0),2); */
    set v_avail_amt = round(ifnull(v_avail_amt,0),2);

    /* set @累计实现盈亏# = round(ifnull(@累计实现盈亏#,0),2); */
    set v_sum_realize_pandl = round(ifnull(v_sum_realize_pandl,0),2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_avail_amt = v_avail_amt;
    SET p_sum_realize_pandl = v_sum_realize_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_主推接口_获取操作员阀值设置信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetOporTsholdSet;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetOporTsholdSet(
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
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_begin_amt decimal(18,4);
    declare v_amt_diff decimal(18,4);
    declare v_remark_info varchar(255);

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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_begin_amt = 0;
    SET v_amt_diff = 0;
    SET v_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易证券_T0_操作员阈值设置表][字段][字段变量][{操作员编号} = @查询操作员编号#][4][@查询操作员编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, begin_amt, curr_amt, frozen_amt, 
        opor_warn_tshold, opor_stop_tshold, order_limit_time, per_secu_posi_ratio, 
        posi_limit_time, order_ctrl_qty, order_ctrl_amt, stock_warn_ratio, 
        stock_stop_ratio, stock_warn_amt, stock_stop_amt, trig_oper_type, 
        open_close_permission, risk_oper, fee_calc_type, permit_margin_trade, 
        buy_fee_ratio, sell_fee_ratio, buy_min_fee, sell_min_fee, 
        trade_capt_amt, trade_releas_amt, strike_capt_amt, strike_releas_amt, 
        sum_realize_pandl, amt_diff, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_opor_no, v_begin_amt, v_curr_amt, v_frozen_amt, 
        v_opor_warn_tshold, v_opor_stop_tshold, v_order_limit_time, v_per_secu_posi_ratio, 
        v_posi_limit_time, v_order_ctrl_qty, v_order_ctrl_amt, v_stock_warn_ratio, 
        v_stock_stop_ratio, v_stock_warn_amt, v_stock_stop_amt, v_trig_oper_type, 
        v_open_close_permission, v_risk_oper, v_fee_calc_type, v_permit_margin_trade, 
        v_buy_fee_ratio, v_sell_fee_ratio, v_buy_min_fee, v_sell_min_fee, 
        v_trade_capt_amt, v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt, 
        v_sum_realize_pandl, v_amt_diff, v_remark_info from db_tdsecu.tb_tdset0_opor_tshold_set where opor_no = v_query_opor_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.9.39.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询操作员编号=",v_query_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询操作员编号=",v_query_opor_no);
        end if;
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

# 原子_交易证券_主推接口_获取t0持仓汇总信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetT0SumPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetT0SumPosi(
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_tmp_open_posi_value decimal(18,4);

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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_open_posi_value = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_T0_证券持仓汇总表][字段][字段变量][{操作员编号}=@操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code, stock_acco_no, stock_code_no, 
        total_long_curr_qty, total_short_curr_qty, total_long_open_posi_value, total_short_open_posi_value, 
        total_long_open_posi_fee, total_short_open_posi_fee, total_long_close_posi_value, total_short_close_posi_value, 
        total_long_close_posi_qty, total_short_close_posi_qty, total_long_close_posi_fee, total_short_close_posi_fee, 
        total_realize_pandl, long_curr_qty, short_curr_qty, long_open_posi_value, 
        short_open_posi_value, long_open_posi_fee, short_open_posi_fee, long_close_posi_qty, 
        short_close_posi_qty, long_close_posi_value, short_close_posi_value, long_close_posi_fee, 
        short_close_posi_fee, realize_pandl, over_night_pandl, open_posi_date, 
        open_posi_time into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_no, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_stock_code, v_stock_acco_no, v_stock_code_no, 
        v_total_long_curr_qty, v_total_short_curr_qty, v_total_long_open_posi_value, v_total_short_open_posi_value, 
        v_total_long_open_posi_fee, v_total_short_open_posi_fee, v_total_long_close_posi_value, v_total_short_close_posi_value, 
        v_total_long_close_posi_qty, v_total_short_close_posi_qty, v_total_long_close_posi_fee, v_total_short_close_posi_fee, 
        v_total_realize_pandl, v_long_curr_qty, v_short_curr_qty, v_long_open_posi_value, 
        v_short_open_posi_value, v_long_open_posi_fee, v_short_open_posi_fee, v_long_close_posi_qty, 
        v_short_close_posi_qty, v_long_close_posi_value, v_short_close_posi_value, v_long_close_posi_fee, 
        v_short_close_posi_fee, v_realize_pandl, v_over_night_pandl, v_open_posi_date, 
        v_open_posi_time from db_tdsecu.tb_tdset0_stock_posi_sum where opor_no=v_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no = v_stock_acco_no limit 1;


    /* set @持仓数量# = @多头当前数量#- @多头平仓数量# + @空头平仓数量# - @空头当前数量#; */
    set v_posi_qty = v_long_curr_qty- v_long_close_posi_qty + v_short_close_posi_qty - v_short_curr_qty;

    /* set @当前数量# = @多头当前数量#+ @空头当前数量#; */
    set v_curr_qty = v_long_curr_qty+ v_short_curr_qty;

    /* set @开仓市值# = @多头开仓市值#+ @空头开仓市值#; */
    set v_open_posi_value = v_long_open_posi_value+ v_short_open_posi_value;

    /* set @开仓费用# = @多头开仓费用#+ @空头开仓费用#; */
    set v_open_posi_fee = v_long_open_posi_fee+ v_short_open_posi_fee;
    #根据 明细表计算未平仓的开仓市值

    /* [获取表记录变量语句][交易证券_T0_证券持仓明细表][SUM(({当前数量}-{平仓数量})/{当前数量}*IF({多空类型}=《多空类型-多头》,({开仓市值}+{开仓费用}),({开仓市值}-{开仓费用})))][@临时_开仓市值#][{操作员编号}=@操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#] */
    select SUM((curr_qty-close_posi_qty)/curr_qty*IF(lngsht_type=1,(open_posi_value+open_posi_fee),(open_posi_value-open_posi_fee))) into v_tmp_open_posi_value from db_tdsecu.tb_tdset0_stock_posi_detail where opor_no=v_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no = v_stock_acco_no limit 1;


    /* set @成本价# = ABS(IF(@持仓数量#=0,0,@临时_开仓市值#/@持仓数量#)); */
    set v_cost_price = ABS(IF(v_posi_qty=0,0,v_tmp_open_posi_value/v_posi_qty));
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

# 原子_交易证券_主推接口_获取预埋单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetPreOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetPreOrder(
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_order_no_str varchar(2048);

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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_order_no_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_交易_预埋订单表][字段][字段变量][{记录序号}=@预埋订单序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, stock_acco_no, stock_acco, stock_code_no, 
        stock_code, stock_type, pre_order_date, pre_order_time, 
        pre_order_dir, pre_order_type, pre_order_price, pre_order_qty, 
        pre_order_status, pre_price_type, price_offset, pre_begin_date, 
        pre_end_date, pre_begin_time, pre_end_time, trig_type, 
        trig_price, trig_date, trig_time, order_date, 
        order_time, order_id, is_trace, price_up, 
        order_no_str, keep_trace into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, 
        v_exch_no, v_stock_acco_no, v_stock_acco, v_stock_code_no, 
        v_stock_code, v_stock_type, v_pre_order_date, v_pre_order_time, 
        v_pre_order_dir, v_pre_order_type, v_pre_order_price, v_pre_order_qty, 
        v_pre_order_status, v_pre_price_type, v_price_offset, v_pre_begin_date, 
        v_pre_end_date, v_pre_begin_time, v_pre_end_time, v_trig_type, 
        v_trig_price, v_trig_date, v_trig_time, v_order_date, 
        v_order_time, v_order_id, v_is_trace, v_price_up, 
        v_order_no_str, v_keep_trace from db_tdsecu.tb_tdsetd_preorder where row_id=v_pre_order_id limit 1;

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

# 原子_交易证券_主推接口_获取组合交易流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetComboTradeLog;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetComboTradeLog(
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
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_交易_组合交易流水记录表][字段][字段变量][{组合代码}=@组合代码# and {订单批号} = @订单批号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        combo_code, order_batch_no, order_dir, combo_copies, 
        combo_date, combo_time into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_opor_no, v_co_no, v_pd_no, v_exch_group_no, 
        v_combo_code, v_order_batch_no, v_order_dir, v_combo_copies, 
        v_combo_date, v_combo_time from db_tdsecu.tb_tdsetd_combotradelog where combo_code=v_combo_code and order_batch_no = v_order_batch_no limit 1;

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

# 原子_交易证券_主推接口_获取组合持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetComboPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetComboPosi(
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_init_date int;
    declare v_posi_status varchar(2);

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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_posi_status = "0";

    
    label_pro:BEGIN
    

    /* if @组合持仓序号# = 0 then */
    if v_combo_posi_id = 0 then

        /* [获取表记录变量语句][交易证券_账户_组合持仓表][字段][字段变量][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {组合代码} = @组合代码# and {证券代码编号} = @证券代码编号# and {开仓日期} = @开仓日期#] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, pd_no, exch_group_no, asset_acco_no, 
            stock_acco_no, combo_code, stock_code, exch_no, 
            stock_code_no, open_posi_date, posi_qty, curr_qty, 
            frozen_qty, unfroz_qty, pre_settle_qty, trade_frozen_qty, 
            trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_capt_qty, 
            strike_releas_qty, strike_frozen_qty, strike_unfroz_qty, realize_pandl, 
            cost_amt, intrst_cost_amt, intrst_pandl, posi_status into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_init_date, 
            v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
            v_stock_acco_no, v_combo_code, v_stock_code, v_exch_no, 
            v_stock_code_no, v_open_posi_date, v_posi_qty, v_curr_qty, 
            v_frozen_qty, v_unfroz_qty, v_pre_settle_qty, v_trade_frozen_qty, 
            v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_capt_qty, 
            v_strike_releas_qty, v_strike_frozen_qty, v_strike_unfroz_qty, v_realize_pandl, 
            v_cost_amt, v_intrst_cost_amt, v_intrst_pandl, v_posi_status from db_tdsecu.tb_tdseac_comboposi where exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and combo_code = v_combo_code and stock_code_no = v_stock_code_no and open_posi_date = v_open_posi_date limit 1;

    else

        /* [获取表记录变量语句][交易证券_账户_组合持仓表][字段][字段变量][{记录序号}=@组合持仓序号#] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, pd_no, exch_group_no, asset_acco_no, 
            stock_acco_no, combo_code, stock_code, exch_no, 
            stock_code_no, open_posi_date, posi_qty, curr_qty, 
            frozen_qty, unfroz_qty, pre_settle_qty, trade_frozen_qty, 
            trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_capt_qty, 
            strike_releas_qty, strike_frozen_qty, strike_unfroz_qty, realize_pandl, 
            cost_amt, intrst_cost_amt, intrst_pandl, posi_status into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_init_date, 
            v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
            v_stock_acco_no, v_combo_code, v_stock_code, v_exch_no, 
            v_stock_code_no, v_open_posi_date, v_posi_qty, v_curr_qty, 
            v_frozen_qty, v_unfroz_qty, v_pre_settle_qty, v_trade_frozen_qty, 
            v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_capt_qty, 
            v_strike_releas_qty, v_strike_frozen_qty, v_strike_unfroz_qty, v_realize_pandl, 
            v_cost_amt, v_intrst_cost_amt, v_intrst_pandl, v_posi_status from db_tdsecu.tb_tdseac_comboposi where row_id=v_combo_posi_id limit 1;

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

# 原子_交易证券_主推接口_获取组合收益
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetComboIncome;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetComboIncome(
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_comm_batch_no int;
    declare v_status_update_date int;

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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_comm_batch_no = 0;
    SET v_status_update_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_账户_组合收益表][字段][字段变量][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {交易组编号}=@交易组编号# and {初始化日期} = @初始化日期# and  {组合代码} = @组合代码#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, open_posi_date, 
        comm_batch_no, combo_code, combo_copies, combo_status, 
        combo_cost, combo_market_value, realize_pandl, sum_realize_pandl, 
        status_update_date into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_open_posi_date, 
        v_comm_batch_no, v_combo_code, v_combo_copies, v_combo_status, 
        v_combo_cost, v_combo_market_value, v_realize_pandl, v_sum_realize_pandl, 
        v_status_update_date from db_tdsecu.tb_tdseac_comboincome where co_no = v_co_no and pd_no = v_pd_no and exch_group_no=v_exch_group_no and init_date = v_init_date and  combo_code = v_combo_code limit 1;

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

# 原子_交易证券_主推接口_获取订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetOrderInfo(
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
    OUT p_init_date int,
    OUT p_busi_opor_no int,
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
    declare v_init_date int;
    declare v_busi_opor_no int;
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
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_func_code varchar(16);
    declare v_sett_flag int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_exist_debt_flag int;

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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_busi_opor_no = 0;
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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_sett_flag = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_交易_订单表][字段][字段变量][{记录序号}=@订单序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, trade_code_no, 
        target_code_no, stock_type, asset_type, external_no, 
        comm_id, comm_batch_no, comm_opor, report_date, 
        report_time, report_no, order_date, order_time, 
        order_batch_no, order_dir, price_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_amt, 
        strike_qty, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, strike_bond_accr_intrst, impawn_ratio, 
        order_frozen_amt, order_frozen_qty, rsp_info, compli_trig_id, 
        remark_info, cost_calc_type, order_oper_way, exter_comm_flag, 
        record_valid_flag, combo_code, combo_posi_id, strategy_id, 
        sett_flag, target_stock_code, target_stock_code_no, registration_agency, 
        trade_acco, contra_no, asset_acco_type, exist_debt_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_stock_acco_no, 
        v_stock_acco, v_stock_code_no, v_stock_code, v_trade_code_no, 
        v_target_code_no, v_stock_type, v_asset_type, v_external_no, 
        v_comm_id, v_comm_batch_no, v_comm_opor, v_report_date, 
        v_report_time, v_report_no, v_order_date, v_order_time, 
        v_order_batch_no, v_order_dir, v_price_type, v_order_price, 
        v_order_qty, v_order_status, v_wtdraw_qty, v_strike_amt, 
        v_strike_qty, v_all_fee, v_stamp_tax, v_trans_fee, 
        v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
        v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
        v_stock_settle_fee, v_net_price_flag, v_intrst_days, v_par_value, 
        v_bond_accr_intrst, v_bond_rate_type, v_strike_bond_accr_intrst, v_impawn_ratio, 
        v_order_frozen_amt, v_order_frozen_qty, v_rsp_info, v_compli_trig_id, 
        v_remark_info, v_cost_calc_type, v_order_oper_way, v_exter_comm_flag, 
        v_record_valid_flag, v_combo_code, v_combo_posi_id, v_strategy_id, 
        v_sett_flag, v_target_stock_code, v_target_stock_code_no, v_registration_agency, 
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where row_id=v_order_id limit 1;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_busi_opor_no = v_busi_opor_no;
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

# 原子_交易证券_主推接口_获取操作员可用交易组资金信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetOporAllowExchGroupCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetOporAllowExchGroupCapital(
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
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @操作员编号# = @业务操作员编号#; */
    set v_opor_no = v_busi_opor_no;

    /* [获取表记录变量语句][交易证券_T0_交易组业务资金表][字段][字段变量][{操作员编号}=@业务操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {交易币种} = @交易币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, opor_no, 
        exch_crncy_type, begin_amt, curr_amt, frozen_amt, 
        unfroz_amt, comm_frozen_amt, comm_unfroz_amt, comm_capt_amt, 
        comm_releas_amt, trade_frozen_amt, trade_unfroz_amt, trade_capt_amt, 
        trade_releas_amt, strike_capt_amt, strike_releas_amt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_opor_no, 
        v_exch_crncy_type, v_begin_amt, v_curr_amt, v_frozen_amt, 
        v_unfroz_amt, v_comm_frozen_amt, v_comm_unfroz_amt, v_comm_capt_amt, 
        v_comm_releas_amt, v_trade_frozen_amt, v_trade_unfroz_amt, v_trade_capt_amt, 
        v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt from db_tdsecu.tb_tdset0_exgp_busi_capit where opor_no=v_busi_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and exch_crncy_type = v_exch_crncy_type limit 1;

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

# 原子_交易证券_主推接口_获取订单汇总信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetOrderTotalInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetOrderTotalInfo(
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
    

    /* [获取表记录变量语句][交易证券_交易_订单汇总表][{记录序号},{操作员编号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{交易币种},{证券代码编号},{交易代码编号},{标的代码编号},{外部编号},{订单日期},{订单批号},{订单方向},{价格类型},{订单价格},{订单数量},{订单汇总状态},{撤单数量},{废单数量},{成交金额},{成交数量},{成交均价},{净价标志},{债券计提利息},{债券利率类型},{票面面值},{质押比例},{订单操作方式},{更新次数}][@汇总订单记录序号#,@汇总订单操作员编号#,@汇总订单机构编号#,@汇总订单产品编号#,@汇总订单交易组编号#,@汇总订单资产账户编号#,@汇总订单通道编号#,@汇总订单交易币种#,@汇总订单证券代码编号#,@汇总订单交易代码编号#,@汇总订单标的代码编号#,@汇总订单外部编号#,@汇总订单日期#,@汇总订单批号#,@汇总订单方向#,@汇总订单价格类型#,@汇总订单价格#,@汇总订单数量#,@订单汇总状态#,@汇总订单撤单数量#,@汇总订单废单数量#,@汇总订单成交金额#,@汇总订单成交数量#,@汇总订单成交均价#,@汇总订单净价标志#,@汇总订单债券计提利息#,@汇总订单债券利率类型#,@汇总订单票面面值#,@汇总订单质押比例#,@汇总订单操作方式#,@汇总订单更新次数#][{订单日期}=@订单日期# and {机构编号} = @机构编号# and {订单批号}= @订单批号#] */
    select row_id,opor_no,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,exch_crncy_type,stock_code_no,trade_code_no,target_code_no,external_no,order_date,order_batch_no,order_dir,price_type,order_price,order_qty,order_sum_status,wtdraw_qty,waste_qty,strike_amt,strike_qty,strike_aver_price,net_price_flag,bond_accr_intrst,bond_rate_type,par_value,impawn_ratio,order_oper_way,update_times into v_sum_order_row_id,v_sum_order_opor_no,v_sum_order_co_no,v_sum_order_pd_no,v_sum_order_exch_group_no,v_sum_order_asset_acco_no,v_sum_order_pass_no,v_sum_order_exch_crncy_type,v_sum_order_stock_code_no,v_sum_order_trade_code_no,v_sum_order_target_code_no,v_sum_order_external_no,v_sum_order_date,v_sum_order_batch_no,v_sum_order_dir,v_sum_order_price_type,v_sum_order_price,v_sum_order_qty,v_order_sum_status,v_sum_order_wtdraw_qty,v_sum_order_waste_qty,v_sum_order_strike_amt,v_sum_order_strike_qty,v_sum_order_strike_aver_price,v_sum_order_net_price_flag,v_sum_order_bond_accr_intrst,v_sum_order_bond_rate_type,v_sum_order_par_value,v_sum_order_impawn_ratio,v_sum_order_oper_way,v_sum_order_update_times from db_tdsecu.tb_tdsetd_sumorder where order_date=v_order_date and co_no = v_co_no and order_batch_no= v_order_batch_no limit 1;

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

# 原子_交易证券_主推接口_获取撤单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsephif_GetCancelInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsephif_GetCancelInfo(
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
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_func_code varchar(16);

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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    
    #存在多笔撤单流水，取row_id大的。

    /* [获取表记录变量语句][交易证券_交易_撤单表][字段][字段变量][{订单序号}=@订单序号# order by {记录序号} DESC] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, external_no, 
        wtdraw_batch_no, wtdraw_date, wtdraw_time, order_date, 
        order_id, report_date, report_time, report_no, 
        wtdraw_status, wtdraw_qty, wtdraw_remark, order_price, 
        trade_acco into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_stock_acco_no, 
        v_stock_acco, v_stock_code_no, v_stock_code, v_external_no, 
        v_wtdraw_batch_no, v_wtdraw_date, v_wtdraw_time, v_order_date, 
        v_order_id, v_report_date, v_report_time, v_report_no, 
        v_wtdraw_status, v_wtdraw_qty, v_wtdraw_remark, v_order_price, 
        v_trade_acco from db_tdsecu.tb_tdsetd_cancel where order_id=v_order_id order by row_id DESC limit 1;


    /* set @撤单序号# = @记录序号#; */
    set v_wtdraw_id = v_row_id;

    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
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


