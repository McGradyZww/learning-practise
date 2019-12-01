DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_新增指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_AddComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_AddComm(
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
    IN p_out_acco varchar(32),
    IN p_combo_code varchar(32),
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
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_batch_no int,
    IN p_comm_dir int,
    IN p_comm_limit_price decimal(16,9),
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_qty decimal(18,2),
    IN p_comm_begin_date int,
    IN p_comm_end_date int,
    IN p_comm_begin_time int,
    IN p_comm_end_time int,
    IN p_comm_appr_oper int,
    IN p_all_fee decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_impawn_ratio decimal(18,12),
    IN p_intrst_days int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_basket_id bigint,
    IN p_comm_oper_way varchar(2),
    IN p_exter_comm_flag int,
    IN p_cost_calc_type int,
    IN p_compli_trig_id bigint,
    IN p_subscription_trade_mark int,
    IN p_purchase_trade_mark int,
    IN p_rede_trade_mark int,
    IN p_first_minimum_amt decimal(18,4),
    IN p_minimum_purchase_amt decimal(18,4),
    IN p_minimum_subscription_amt decimal(18,4),
    IN p_minimum_rede_share decimal(18,2),
    IN p_minimum_holding_share decimal(18,2),
    IN p_record_count int,
    IN p_target_stock_code varchar(6),
    IN p_target_stock_code_no int,
    IN p_comm_remark_info varchar(1024),
    IN p_last_login_ip varchar(32),
    IN p_last_login_mac varchar(32),
    IN p_last_login_date int,
    IN p_last_oper_info varchar(255),
    IN p_online_status int,
    IN p_sys_config_str varchar(64),
    IN p_asset_acco_type int,
    IN p_co_busi_config_str varchar(64),
    IN p_online_opor_no_str varchar(2048),
    IN p_acco_concat_info varchar(4096),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_id bigint,
    OUT p_comm_date int,
    OUT p_comm_time int,
    OUT p_comm_status varchar(2),
    OUT p_comm_appr_status varchar(2),
    OUT p_comm_comple_date int,
    OUT p_comm_comple_time int,
    OUT p_comm_appr_date int,
    OUT p_comm_appr_time int,
    OUT p_comm_appr_remark varchar(255),
    OUT p_comm_comple_flag int,
    OUT p_comm_frozen_amt decimal(18,4),
    OUT p_comm_frozen_qty decimal(18,2),
    OUT p_strike_status varchar(2),
    OUT p_order_id bigint,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_batch_no int,
    OUT p_order_dir int,
    OUT p_order_qty decimal(18,2),
    OUT p_order_price decimal(16,9),
    OUT p_price_type int,
    OUT p_order_status varchar(2),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_order_oper_way varchar(2),
    OUT p_update_times int,
    OUT p_comm_amt decimal(18,4),
    OUT p_appr_allow_order_flag int,
    OUT p_disp_opor int,
    OUT p_disp_status int,
    OUT p_auto_comm_executor int
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
    declare v_out_acco varchar(32);
    declare v_combo_code varchar(32);
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
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_batch_no int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_appr_oper int;
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_basket_id bigint;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_cost_calc_type int;
    declare v_compli_trig_id bigint;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_record_count int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_comm_remark_info varchar(1024);
    declare v_last_login_ip varchar(32);
    declare v_last_login_mac varchar(32);
    declare v_last_login_date int;
    declare v_last_oper_info varchar(255);
    declare v_online_status int;
    declare v_sys_config_str varchar(64);
    declare v_asset_acco_type int;
    declare v_co_busi_config_str varchar(64);
    declare v_online_opor_no_str varchar(2048);
    declare v_acco_concat_info varchar(4096);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_id bigint;
    declare v_comm_date int;
    declare v_comm_time int;
    declare v_comm_status varchar(2);
    declare v_comm_appr_status varchar(2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_appr_remark varchar(255);
    declare v_comm_comple_flag int;
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_strike_status varchar(2);
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_price_type int;
    declare v_order_status varchar(2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_order_oper_way varchar(2);
    declare v_update_times int;
    declare v_comm_amt decimal(18,4);
    declare v_appr_allow_order_flag int;
    declare v_disp_opor int;
    declare v_disp_status int;
    declare v_auto_comm_executor int;
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_contra_no varchar(32);
    declare v_exist_debt_flag int;
    declare v_calc_dir int;
    declare v_tmp_comm_frozen_amt decimal(18,4);
    declare v_tmp_comm_frozen_qty decimal(18,2);
    declare v_deal_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_comm_appr_set int;
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_workflow_type int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_tmp_comm_occur_amt decimal(18,4);
    declare v_tmp_comm_occur_qty decimal(18,2);
    declare v_comm_appr_oper_no int;
    declare v_comm_cancel_qty decimal(18,2);
    declare v_tmp_oper_ip_addr varchar(32);
    declare v_tmp_oper_mac varchar(32);
    declare v_tmp_oper_info varchar(1024);
    declare v_tmp_opor_no int;
    declare v_curr_opor_no int;
    declare v_before_comm_executor int;
    declare v_mach_time int;
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_pass_status varchar(2);
    declare v_combo_posi_id bigint;
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_waste_qty decimal(18,2);
    declare v_busi_opor_no int;
    declare v_avail_cal_flag int;
    declare v_open_posi_date int;

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
    SET v_out_acco = p_out_acco;
    SET v_combo_code = p_combo_code;
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
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_dir = p_comm_dir;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_qty = p_comm_qty;
    SET v_comm_begin_date = p_comm_begin_date;
    SET v_comm_end_date = p_comm_end_date;
    SET v_comm_begin_time = p_comm_begin_time;
    SET v_comm_end_time = p_comm_end_time;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_all_fee = p_all_fee;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_intrst_days = p_intrst_days;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_basket_id = p_basket_id;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_subscription_trade_mark = p_subscription_trade_mark;
    SET v_purchase_trade_mark = p_purchase_trade_mark;
    SET v_rede_trade_mark = p_rede_trade_mark;
    SET v_first_minimum_amt = p_first_minimum_amt;
    SET v_minimum_purchase_amt = p_minimum_purchase_amt;
    SET v_minimum_subscription_amt = p_minimum_subscription_amt;
    SET v_minimum_rede_share = p_minimum_rede_share;
    SET v_minimum_holding_share = p_minimum_holding_share;
    SET v_record_count = p_record_count;
    SET v_target_stock_code = p_target_stock_code;
    SET v_target_stock_code_no = p_target_stock_code_no;
    SET v_comm_remark_info = p_comm_remark_info;
    SET v_last_login_ip = p_last_login_ip;
    SET v_last_login_mac = p_last_login_mac;
    SET v_last_login_date = p_last_login_date;
    SET v_last_oper_info = p_last_oper_info;
    SET v_online_status = p_online_status;
    SET v_sys_config_str = p_sys_config_str;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_online_opor_no_str = p_online_opor_no_str;
    SET v_acco_concat_info = p_acco_concat_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_id = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_status = "0";
    SET v_comm_appr_status = " ";
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_remark = " ";
    SET v_comm_comple_flag = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_strike_status = "0";
    SET v_order_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_batch_no = 0;
    SET v_order_dir = 0;
    SET v_order_qty = 0;
    SET v_order_price = 0;
    SET v_price_type = 0;
    SET v_order_status = "0";
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_order_oper_way = " ";
    SET v_update_times = 1;
    SET v_comm_amt = 0;
    SET v_appr_allow_order_flag = 0;
    SET v_disp_opor = 0;
    SET v_disp_status = 0;
    SET v_auto_comm_executor = 0;
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_contra_no = " ";
    SET v_exist_debt_flag = 0;
    SET v_calc_dir = 1;
    SET v_tmp_comm_frozen_amt = 0;
    SET v_tmp_comm_frozen_qty = 0;
    SET v_deal_flag = 0;
    SET v_occur_amt = 0;
    SET v_occur_qty = 0;
    SET v_comm_appr_set = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_workflow_type = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_tmp_comm_occur_amt = 0;
    SET v_tmp_comm_occur_qty = 0;
    SET v_comm_appr_oper_no = 0;
    SET v_comm_cancel_qty = 0;
    SET v_tmp_oper_ip_addr = " ";
    SET v_tmp_oper_mac = " ";
    SET v_tmp_oper_info = " ";
    SET v_tmp_opor_no = 0;
    SET v_curr_opor_no = 0;
    SET v_before_comm_executor = 0;
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_external_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;
    SET v_remark_info = " ";
    SET v_pass_status = "0";
    SET v_combo_posi_id = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_wtdraw_qty = 0;
    SET v_waste_qty = 0;
    SET v_busi_opor_no = 0;
    SET v_avail_cal_flag = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @指令日期# = @初始化日期#; */
    set v_comm_date = v_init_date;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;

    /* set @登记机构# = ""; */
    set v_registration_agency = "";

    /* set @交易账户# =""; */
    set v_trade_acco ="";

    /* set @合同编号# =""; */
    set v_contra_no ="";

    /* set @存在负债标志# = 《存在负债标志-不存在》; */
    set v_exist_debt_flag = 1;

    /* set @分发操作员# = 0 ; */
    set v_disp_opor = 0 ;

    /* if @指令执行人#<>0 then */
    if v_comm_executor<>0 then

        /* set @分发状态# = 《分发状态-分发通过》; */
        set v_disp_status = 1;
    else

        /* set @分发状态# = 《分发状态-待分发》; */
        set v_disp_status = 3;
    end if;
    #指令金额后台自己计算，不采用前台传入

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
        SET v_error_code = "tdsecuT.3.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令金额出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #计算指令冻结金额

    /* set @计算方向# = 《计算方向-加上》; */
    set v_calc_dir = 1;

    /* 调用【原子_交易证券_公用_计算指令冻结金额和数量】*/
    call db_tdsecu.pra_tdsepb_GetCommFrozenAmtAndQty(
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
        v_calc_dir,
        v_error_code,
        v_error_info,
        v_comm_frozen_amt,
        v_comm_frozen_qty);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令冻结金额和数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @临时_指令冻结金额# = @指令冻结金额#; */
    set v_tmp_comm_frozen_amt = v_comm_frozen_amt;

    /* set @临时_指令冻结数量# = @指令冻结数量#; */
    set v_tmp_comm_frozen_qty = v_comm_frozen_qty;
    #交易证券子系统检查，检查指令可用资金、可用持仓等

    /* 调用【原子_交易证券_指令_校验新增指令】*/
    call db_tdsecu.pra_tdseap_CheckAddComm(
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
        v_comm_dir,
        v_comm_qty,
        v_comm_frozen_amt,
        v_impawn_ratio,
        v_stock_type,
        v_subscription_trade_mark,
        v_purchase_trade_mark,
        v_rede_trade_mark,
        v_first_minimum_amt,
        v_minimum_purchase_amt,
        v_minimum_subscription_amt,
        v_minimum_rede_share,
        v_minimum_holding_share,
        v_record_count,
        v_combo_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_校验新增指令出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @市场编号# = 《市场编号-沪港通证券交易所》 and substring(@资产账户业务控制配置串#,15,1) <> 《沪港通交易方式-体内》 then */
    if v_exch_no = 3 and substring(v_asac_busi_config_str,15,1) <> 1 then

        /* set @体外指令标志# = 《体外指令标志-体外》; */
        set v_exter_comm_flag = 2;

    /* elseif @市场编号# = 《市场编号-深港通证券交易所》 and substring(@资产账户业务控制配置串#,16,1) <> 《深港通交易方式-体内》 then */
    elseif v_exch_no = 4 and substring(v_asac_busi_config_str,16,1) <> 1 then

        /* set @体外指令标志# = 《体外指令标志-体外》; */
        set v_exter_comm_flag = 2;
    end if;
    #风控子系统检查，检查指令端风控等

    /* set @处理标志#=《处理标志-已处理》; */
    set v_deal_flag=1;

    /* set @指令下达人#=@操作员编号#; */
    set v_comm_opor=v_opor_no;

    /* set @变动金额#=(@指令实际限价# * @指令数量#); */
    set v_occur_amt=(v_limit_actual_price * v_comm_qty);

    /* set @变动数量#=@指令数量#; */
    set v_occur_qty=v_comm_qty;

    /* set @指令审批设置# = substring(@资产账户业务控制配置串#,5,1); */
    set v_comm_appr_set = substring(v_asac_busi_config_str,5,1);
     #PB系统自动审批获取审批操作员登录信息，审批操作员不在线状态下不能自动审批

    /* if @指令审批设置#=《指令审批设置-自动审批》 and substring(@系统控制配置串#,7,1) =《系统类型-PB系统》  then */
    if v_comm_appr_set=1 and substring(v_sys_config_str,7,1) =1  then

        /* if @在线状态# <>《在线状态-在线》 then */
        if v_online_status <>1 then

             /* set @指令审批设置# = 《指令审批设置-手工审批》; */
             set v_comm_appr_set = 2;
        end if;
    end if;
    #如果自动审批，需做相应检查处理，并获取指令批号

    /* set @订单方向# = @指令方向#; */
    set v_order_dir = v_comm_dir;

    /* if (substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-自动审批》 or  substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-不设置》 ) and substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》  then */
    if (substring(v_asac_busi_config_str,5,1)=1 or  substring(v_asac_busi_config_str,5,1)=3 ) and substring(v_asac_busi_config_str,6,1)=1  then

        /* if @订单方向#=《订单方向-新股申购》 or  @订单方向#=《订单方向-配售申购》  then */
        if v_order_dir=11 or  v_order_dir=23  then

            /* 调用【原子_交易证券_交易_检查证券申购重复】*/
            call db_tdsecu.pra_tdsetd_CheckPurcDup(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_exch_group_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_检查证券申购重复出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        end if;
        #获取订单批号

        /* set @编号类型#=《编号类型-订单批号》; */
        set v_record_no_type=18;

        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_交易证券_公用_获取业务记录编号】*/
            call db_tdsecu.pra_tdsepb_GetCoBusiRecordNo(
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
                SET v_error_code = "tdsecuT.3.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


        /* [事务结束] */
        COMMIT;


        /* set @订单批号#=@当前编号#; */
        set v_order_batch_no=v_curr_no;
    end if;

    /* [事务开始] */
    START TRANSACTION;

        #新增指令记录

        /* set @指令审批状态#=《指令审批状态-未审批》; */
        set v_comm_appr_status="1";

        /* if substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-不设置》 then */
        if substring(v_asac_busi_config_str,5,1)=3 then

            /* set @指令审批状态#=《指令审批状态-不审批》; */
            set v_comm_appr_status="4";
        end if;

        /* set  @工作流模式# = substring(@资产账户业务控制配置串#,25,1); */
        set  v_workflow_type = substring(v_asac_busi_config_str,25,1);

        /* 调用【原子_交易证券_指令_新增指令】*/
        call db_tdsecu.pra_tdseap_AddComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_comm_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_crncy_type,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_opor,
            v_comm_executor,
            v_comm_batch_no,
            v_comm_dir,
            v_comm_limit_price,
            v_limit_actual_price,
            v_comm_qty,
            v_comm_amt,
            v_comm_frozen_amt,
            v_comm_frozen_qty,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_appr_status,
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_basket_id,
            v_comm_oper_way,
            v_exter_comm_flag,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_combo_code,
            v_target_stock_code,
            v_target_stock_code_no,
            v_comm_remark_info,
            v_workflow_type,
            v_contra_no,
            v_asset_acco_type,
            v_exist_debt_flag,
            v_disp_opor,
            v_disp_status,
            v_acco_concat_info,
            v_error_code,
            v_error_info,
            v_comm_id,
            v_comm_status,
            v_strike_status,
            v_comm_comple_flag);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_新增指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #处理资金持仓数据，为保证数据表修改顺序，指令资金持仓更新需放在后边处理，以先处理指令表，再处理订单表，再处理资金持仓表
        #计算指令变动金额和数量

        /* set @计算方向# = 《计算方向-加上》; */
        set v_calc_dir = 1;

        /* 调用【原子_交易证券_公用_计算指令变动金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetCommOccurAmtAndQty(
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
            v_calc_dir,
            v_error_code,
            v_error_info,
            v_comm_occur_amt,
            v_comm_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @临时_指令变动金额# = @指令变动金额#; */
        set v_tmp_comm_occur_amt = v_comm_occur_amt;

        /* set @临时_指令变动数量# = @指令变动数量#; */
        set v_tmp_comm_occur_qty = v_comm_occur_qty;

        /* if substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-自动审批》 or @指令审批状态#=《指令审批状态-不审批》 then */
        if substring(v_asac_busi_config_str,5,1)=1 or v_comm_appr_status="4" then

            /* if substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-自动审批》 then */
            if substring(v_asac_busi_config_str,5,1)=1 then
                #审批指令

                /* set @指令审批状态#=《指令审批状态-审批通过》; */
                set v_comm_appr_status="2";

                /* set @指令审批说明#="指令快速审批通过！"; */
                set v_comm_appr_remark="指令快速审批通过！";

                /* set @指令审批操作员序号#=1; */
                set v_comm_appr_oper_no=1;
            end if;

             /* set @订单数量#=0; */
             set v_order_qty=0;

             /* set @指令撤销数量#=0; */
             set v_comm_cancel_qty=0;

              /* set @临时_操作IP# = @操作IP#; */
              set v_tmp_oper_ip_addr = v_oper_ip_addr;

              /* set @临时_操作MAC# = @操作MAC#; */
              set v_tmp_oper_mac = v_oper_mac;

              /* set @临时_操作信息# = @操作信息#; */
              set v_tmp_oper_info = v_oper_info;

              /* set @临时_操作员编号# = @操作员编号#; */
              set v_tmp_opor_no = v_opor_no;

              /* set @操作IP# = @上次登录IP#; */
              set v_oper_ip_addr = v_last_login_ip;

              /* set @操作MAC# = @上次登录MAC#; */
              set v_oper_mac = v_last_login_mac;

              /* set @操作信息# = @上次操作信息#; */
              set v_oper_info = v_last_oper_info;

              /* set @操作员编号# = @指令审批操作员#; */
              set v_opor_no = v_comm_appr_oper;

              /* set @当前操作员# = @临时_操作员编号#; */
              set v_curr_opor_no = v_tmp_opor_no;

              /* set @前指令执行人# = 0; */
              set v_before_comm_executor = 0;

             /* 调用【原子_交易证券_指令_审批指令】*/
             call db_tdsecu.pra_tdseap_ApprComm(
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
                 v_stock_code,
                 v_stock_code_no,
                 v_stock_type,
                 v_asset_type,
                 v_comm_date,
                 v_comm_id,
                 v_comm_opor,
                 v_comm_executor,
                 v_comm_batch_no,
                 v_comm_appr_oper_no,
                 v_comm_appr_oper,
                 v_comm_appr_status,
                 v_comm_appr_remark,
                 v_comm_qty,
                 v_comm_dir,
                 v_comm_limit_price,
                 v_limit_actual_price,
                 v_order_qty,
                 v_comm_cancel_qty,
                 v_bond_accr_intrst,
                 v_bond_rate_type,
                 v_net_price_flag,
                 v_par_value,
                 v_comm_status,
                 v_comm_begin_date,
                 v_comm_end_date,
                 v_comm_begin_time,
                 v_comm_end_time,
                 v_exter_comm_flag,
                 v_comm_oper_way,
                 v_comm_amt,
                 v_co_busi_config_str,
                 v_online_opor_no_str,
                 v_curr_opor_no,
                 v_buy_ref_rate,
                 v_sell_ref_rate,
                 v_before_comm_executor,
                 v_error_code,
                 v_error_info,
                 v_comm_occur_amt,
                 v_comm_occur_qty,
                 v_comm_appr_date,
                 v_comm_appr_time,
                 v_disp_status,
                 v_disp_opor,
                 v_auto_comm_executor);
             if v_error_code = "1" then
                 SET v_error_code = "tdsecuT.3.1.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_审批指令出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 leave label_pro;
             end if;


             /* set @临时_指令变动金额# = @临时_指令变动金额# + @指令变动金额#; */
             set v_tmp_comm_occur_amt = v_tmp_comm_occur_amt + v_comm_occur_amt;

             /* set @临时_指令变动数量# = @临时_指令变动数量# + @指令变动数量#; */
             set v_tmp_comm_occur_qty = v_tmp_comm_occur_qty + v_comm_occur_qty;

             /* if @自动分发指令执行人# >0 and @指令执行人# = 0 then */
             if v_auto_comm_executor >0 and v_comm_executor = 0 then

                 /* set @指令执行人# = @自动分发指令执行人#; */
                 set v_comm_executor = v_auto_comm_executor;
             end if;

            /* [获取机器时间][@机器时间#] */
            select date_format(curtime(),'%H%i%s') into v_mach_time;


            /* if substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 and ((@指令结束日期# = @初始化日期# and @指令结束时间# >= @机器时间#) or (@指令结束日期# < @初始化日期#)) and @指令执行人# > 0 then */
            if substring(v_asac_busi_config_str,6,1)=1 and ((v_comm_end_date = v_init_date and v_comm_end_time >= v_mach_time) or (v_comm_end_date < v_init_date)) and v_comm_executor > 0 then
                #设置订单相关字段值

                /* set @外部编号#=0; */
                set v_external_no=0;

                /* set @申报日期# = 0; */
                set v_report_date = 0;

                /* set @申报时间# = 0; */
                set v_report_time = 0;

                /* set @申报编号# = " "; */
                set v_report_no = " ";

                /* if @指令执行人# > 0 then */
                if v_comm_executor > 0 then

                    /* set @订单日期#=@初始化日期#; */
                    set v_order_date=v_init_date;

                    /* set @价格类型#=《价格类型-限价》; */
                    set v_price_type=1;

                    /* set @订单方向#=@指令方向#; */
                    set v_order_dir=v_comm_dir;

                    /* set @订单数量#=@指令数量#; */
                    set v_order_qty=v_comm_qty;

                    /* set @订单价格#=@指令实际限价#; */
                    set v_order_price=v_limit_actual_price;

                    /* set @审批通过自动下单# = 《审批通过自动下单-是》; */
                    set v_appr_allow_order_flag = 1;
                    #先反向更新指令

                    /* set @计算方向# = 《计算方向-减去》; */
                    set v_calc_dir = -1;

                    /* 调用【原子_交易证券_公用_计算指令冻结金额和数量】*/
                    call db_tdsecu.pra_tdsepb_GetCommFrozenAmtAndQty(
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
                        v_calc_dir,
                        v_error_code,
                        v_error_info,
                        v_comm_frozen_amt,
                        v_comm_frozen_qty);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.3.1.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令冻结金额和数量出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;


                    /* set @临时_指令冻结金额# = @临时_指令冻结金额# + @指令冻结金额#; */
                    set v_tmp_comm_frozen_amt = v_tmp_comm_frozen_amt + v_comm_frozen_amt;

                    /* set @临时_指令冻结数量# = @临时_指令冻结数量# + @指令冻结数量#; */
                    set v_tmp_comm_frozen_qty = v_tmp_comm_frozen_qty + v_comm_frozen_qty;

                    /* 调用【原子_交易证券_指令_下单更新指令】*/
                    call db_tdsecu.pra_tdseap_OrderUpdateComm(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_comm_id,
                        v_comm_frozen_amt,
                        v_comm_frozen_qty,
                        v_order_qty,
                        v_error_code,
                        v_error_info,
                        v_limit_actual_price,
                        v_exter_comm_flag,
                        v_comm_comple_date,
                        v_comm_comple_time,
                        v_comm_status,
                        v_strike_status);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.3.1.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_下单更新指令出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;

                    #计算交易冻结金额

                    /* 调用【原子_交易证券_公用_计算交易冻结金额和数量】*/
                    call db_tdsecu.pra_tdsepb_GetExchFrozenAmtAndQty(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_stock_type,
                        v_order_dir,
                        v_order_price,
                        v_order_qty,
                        v_net_price_flag,
                        v_par_value,
                        v_bond_accr_intrst,
                        v_bond_rate_type,
                        v_all_fee,
                        v_error_code,
                        v_error_info,
                        v_trade_frozen_amt,
                        v_trade_frozen_qty);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.3.1.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算交易冻结金额和数量出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;


                    /* set @订单冻结金额#=@交易冻结金额#; */
                    set v_order_frozen_amt=v_trade_frozen_amt;

                    /* set @订单冻结数量#=@交易冻结数量#; */
                    set v_order_frozen_qty=v_trade_frozen_qty;

                    /* set @备注信息#="指令自动审批后自动执行！"; */
                    set v_remark_info="指令自动审批后自动执行！";
                    #根据报盘机状态，设置订单状态 如果通道是允许报送状态,则直接将订单状态设为"待报"

                    /* set @订单状态# = 《订单状态-未报》; */
                    set v_order_status = "1";

                    /* 调用【原子_交易证券_公用_获取通道状态】*/
                    call db_tdsecu.pra_tdsepb_GetChannelStatus(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_pass_no,
                        v_error_code,
                        v_error_info,
                        v_pass_status);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.3.1.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取通道状态出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;


                    /* if @通道状态# = "1" then */
                    if v_pass_status = "1" then

                        /* set @订单状态# = 《订单状态-待报》; */
                        set v_order_status = "a";
                    end if;

                    /* set @订单操作方式# = 《订单操作方式-审批后自动下单》; */
                    set v_order_oper_way = "40";

                    /* set @组合代码# = " "; */
                    set v_combo_code = " ";

                    /* set @组合持仓序号# = 0; */
                    set v_combo_posi_id = 0;

                    /* set @操作员编号# =@指令执行人#; */
                    set v_opor_no =v_comm_executor;

                    /* 调用【原子_交易证券_交易_新增订单】*/
                    call db_tdsecu.pra_tdsetd_AddOrder(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_init_date,
                        v_co_no,
                        v_comm_opor,
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
                        v_target_code_no,
                        v_trade_code_no,
                        v_stock_type,
                        v_asset_type,
                        v_external_no,
                        v_comm_id,
                        v_comm_batch_no,
                        v_order_batch_no,
                        v_order_date,
                        v_order_dir,
                        v_price_type,
                        v_order_price,
                        v_order_qty,
                        v_order_status,
                        v_report_date,
                        v_report_time,
                        v_report_no,
                        v_order_frozen_amt,
                        v_order_frozen_qty,
                        v_net_price_flag,
                        v_intrst_days,
                        v_par_value,
                        v_impawn_ratio,
                        v_bond_accr_intrst,
                        v_bond_rate_type,
                        v_compli_trig_id,
                        v_remark_info,
                        v_order_oper_way,
                        v_exter_comm_flag,
                        v_cost_calc_type,
                        v_combo_code,
                        v_combo_posi_id,
                        v_target_stock_code,
                        v_target_stock_code_no,
                        v_registration_agency,
                        v_trade_acco,
                        v_contra_no,
                        v_asset_acco_type,
                        v_exist_debt_flag,
                        v_error_code,
                        v_error_info,
                        v_order_id,
                        v_order_time,
                        v_update_times);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.3.1.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增订单出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;

                    #计算指令变动金额和数量

                    /* set @计算方向# = 《计算方向-减去》; */
                    set v_calc_dir = -1;

                    /* 调用【原子_交易证券_公用_计算指令变动金额和数量】*/
                    call db_tdsecu.pra_tdsepb_GetCommOccurAmtAndQty(
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
                        v_calc_dir,
                        v_error_code,
                        v_error_info,
                        v_comm_occur_amt,
                        v_comm_occur_qty);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.3.1.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;


                    /* set @临时_指令变动金额# = @临时_指令变动金额# + @指令变动金额#; */
                    set v_tmp_comm_occur_amt = v_tmp_comm_occur_amt + v_comm_occur_amt;

                    /* set @临时_指令变动数量# = @临时_指令变动数量# + @指令变动数量#; */
                    set v_tmp_comm_occur_qty = v_tmp_comm_occur_qty + v_comm_occur_qty;
                    #计算下单交易变动金额和数量

                    /* 调用【原子_交易证券_公用_计算下单交易变动金额和数量】*/
                    call db_tdsecu.pra_tdsepb_GetOrderTradeOccurAmtAndQty(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_stock_type,
                        v_order_dir,
                        v_order_qty,
                        v_order_price,
                        v_order_frozen_amt,
                        v_net_price_flag,
                        v_par_value,
                        v_bond_accr_intrst,
                        v_bond_rate_type,
                        v_error_code,
                        v_error_info,
                        v_trade_occur_amt,
                        v_trade_occur_qty);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.3.1.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算下单交易变动金额和数量出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;

                    #modify by wjp 20181101

                    /* if @订单批号# > 0  then */
                    if v_order_batch_no > 0  then

                        /* set @撤单数量# = 0; */
                        set v_wtdraw_qty = 0;

                        /* set @废单数量# = 0; */
                        set v_waste_qty = 0;

                       /* 调用【原子_交易证券_交易_订单处理汇总订单】*/
                       call db_tdsecu.pra_tdsetd_OrderDealSumOrder(
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
                           v_exch_crncy_type,
                           v_exch_no,
                           v_stock_code_no,
                           v_stock_code,
                           v_trade_code_no,
                           v_target_code_no,
                           v_stock_type,
                           v_asset_type,
                           v_external_no,
                           v_order_date,
                           v_order_batch_no,
                           v_order_dir,
                           v_price_type,
                           v_order_price,
                           v_order_qty,
                           v_order_status,
                           v_wtdraw_qty,
                           v_waste_qty,
                           v_net_price_flag,
                           v_intrst_days,
                           v_par_value,
                           v_bond_accr_intrst,
                           v_bond_rate_type,
                           v_impawn_ratio,
                           v_order_oper_way,
                           v_exter_comm_flag,
                           v_error_code,
                           v_error_info);
                       if v_error_code = "1" then
                           SET v_error_code = "tdsecuT.3.1.999";
                           if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_订单处理汇总订单出现错误！',v_mysql_message);
                           end if;
                           ROLLBACK;
                           leave label_pro;
                       elseif v_error_code <> "0" then
                           ROLLBACK;
                           leave label_pro;
                       end if;

                    end if;
                end if;
            end if;
        end if;
        #处理订单资金持仓数据，保护指令变动和交易的变动

        /* set @指令变动金额# = @临时_指令变动金额#; */
        set v_comm_occur_amt = v_tmp_comm_occur_amt;

        /* set @指令变动数量# = @临时_指令变动数量#; */
        set v_comm_occur_qty = v_tmp_comm_occur_qty;

        /* set @业务操作员编号# = @指令执行人#; */
        set v_busi_opor_no = v_comm_executor;

        /* set @可用计算标志# = 0; */
        set v_avail_cal_flag = 0;

        /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
        call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
            v_exch_crncy_type,
            v_comm_id,
            v_order_id,
            v_exch_no,
            v_stock_code,
            v_stock_type,
            v_asset_type,
            v_order_dir,
            v_impawn_ratio,
            v_stock_acco_no,
            v_stock_code_no,
            v_trade_code_no,
            v_target_code_no,
            v_comm_occur_amt,
            v_comm_occur_qty,
            v_trade_occur_amt,
            v_trade_occur_qty,
            v_is_record_jour,
            v_order_oper_way,
            v_busi_opor_no,
            v_open_close_permission,
            v_avail_cal_flag,
            v_combo_code,
            v_combo_posi_id,
            v_target_stock_code_no,
            v_error_code,
            v_error_info,
            v_open_posi_date);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @指令冻结金额# = @临时_指令冻结金额#; */
    set v_comm_frozen_amt = v_tmp_comm_frozen_amt;

    /* set @指令冻结数量# = @临时_指令冻结数量#; */
    set v_comm_frozen_qty = v_tmp_comm_frozen_qty;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_id = v_comm_id;
    SET p_comm_date = v_comm_date;
    SET p_comm_time = v_comm_time;
    SET p_comm_status = v_comm_status;
    SET p_comm_appr_status = v_comm_appr_status;
    SET p_comm_comple_date = v_comm_comple_date;
    SET p_comm_comple_time = v_comm_comple_time;
    SET p_comm_appr_date = v_comm_appr_date;
    SET p_comm_appr_time = v_comm_appr_time;
    SET p_comm_appr_remark = v_comm_appr_remark;
    SET p_comm_comple_flag = v_comm_comple_flag;
    SET p_comm_frozen_amt = v_comm_frozen_amt;
    SET p_comm_frozen_qty = v_comm_frozen_qty;
    SET p_strike_status = v_strike_status;
    SET p_order_id = v_order_id;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_dir = v_order_dir;
    SET p_order_qty = v_order_qty;
    SET p_order_price = v_order_price;
    SET p_price_type = v_price_type;
    SET p_order_status = v_order_status;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_order_oper_way = v_order_oper_way;
    SET p_update_times = v_update_times;
    SET p_comm_amt = v_comm_amt;
    SET p_appr_allow_order_flag = v_appr_allow_order_flag;
    SET p_disp_opor = v_disp_opor;
    SET p_disp_status = v_disp_status;
    SET p_auto_comm_executor = v_auto_comm_executor;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_撤销指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_CancelComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_CancelComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_comm_id bigint,
    IN p_cancel_info varchar(255),
    IN p_is_withdraw int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_comm_date int,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_order_id_str varchar(2048),
    OUT p_wtdraw_id_str varchar(2048),
    OUT p_target_code_no int,
    OUT p_trade_code_no int
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
    declare v_comm_id bigint;
    declare v_cancel_info varchar(255);
    declare v_is_withdraw int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_order_id_str varchar(2048);
    declare v_wtdraw_id_str varchar(2048);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_is_record_jour int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_combo_code varchar(32);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_limit_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_limit_actual_price decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_comm_dir int;
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_amt decimal(18,4);
    declare v_tmp_target_code_no int;
    declare v_tmp_trade_code_no int;
    declare v_comm_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_comm_opor int;
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_target_stock_code_no int;
    declare v_trade_acco varchar(32);
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_remark varchar(255);
    declare v_frozen_amt decimal(18,4);
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_id bigint;
    declare v_waste_qty decimal(18,2);

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
    SET v_comm_id = p_comm_id;
    SET v_cancel_info = p_cancel_info;
    SET v_is_withdraw = p_is_withdraw;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_order_id_str = " ";
    SET v_wtdraw_id_str = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_is_record_jour = 1;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_combo_code = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_limit_price = 0;
    SET v_comm_status = "0";
    SET v_limit_actual_price = 0;
    SET v_impawn_ratio = 0;
    SET v_comm_dir = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_frozen_amt = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_comm_amt = 0;
    SET v_tmp_target_code_no = 0;
    SET v_tmp_trade_code_no = 0;
    SET v_comm_qty = 0;
    SET v_calc_dir = 1;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_row_id = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_comm_opor = 0;
    SET v_external_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_batch_no = 0;
    SET v_order_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_status = "0";
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_all_fee = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_target_stock_code_no = 0;
    SET v_trade_acco = " ";
    SET v_wtdraw_batch_no = 0;
    SET v_wtdraw_remark = " ";
    SET v_frozen_amt = 0;
    SET v_wtdraw_status = "0";
    SET v_wtdraw_id = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    
    #获取指令信息，检查能否撤销
    #[原子_交易证券_指令_校验撤销指令]

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_指令_撤销指令】*/
        call db_tdsecu.pra_tdseap_CancelComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_comm_id,
            v_cancel_info,
            v_error_code,
            v_error_info,
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
            v_target_code_no,
            v_trade_code_no,
            v_combo_code,
            v_stock_type,
            v_asset_type,
            v_comm_limit_price,
            v_comm_status,
            v_limit_actual_price,
            v_impawn_ratio,
            v_comm_dir,
            v_comm_cancel_qty,
            v_comm_frozen_amt,
            v_comm_date,
            v_comm_batch_no,
            v_comm_executor,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_comm_amt);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @临时_标的代码编号# = @标的代码编号#; */
        set v_tmp_target_code_no = v_target_code_no;

        /* set @临时_交易代码编号# = @交易代码编号#; */
        set v_tmp_trade_code_no = v_trade_code_no;

        /* if @指令撤销数量#>0 then */
        if v_comm_cancel_qty>0 then

            /* set @指令数量# = @指令撤销数量#; */
            set v_comm_qty = v_comm_cancel_qty;
            #计算指令变动金额和数量

            /* set @计算方向# = 《计算方向-减去》; */
            set v_calc_dir = -1;

            /* 调用【原子_交易证券_公用_计算指令变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetCommOccurAmtAndQty(
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
                v_calc_dir,
                v_error_code,
                v_error_info,
                v_comm_occur_amt,
                v_comm_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.2.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* 调用【原子_交易证券_账户_更新指令资金持仓】*/
            call db_tdsecu.pra_tdseac_UpdateApprCashPosi(
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
                v_comm_id,
                v_comm_dir,
                v_exch_crncy_type,
                v_exch_no,
                v_stock_code,
                v_asset_type,
                v_stock_type,
                v_impawn_ratio,
                v_stock_acco_no,
                v_stock_code_no,
                v_trade_code_no,
                v_target_code_no,
                v_comm_occur_amt,
                v_comm_occur_qty,
                v_is_record_jour,
                v_combo_code,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.2.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令资金持仓出现错误！',v_mysql_message);
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


    /* set @订单序号串# = ""; */
    set v_order_id_str = "";

    /* set @撤单序号串# = ""; */
    set v_wtdraw_id_str = "";

    /* if @是否撤单#=《是否撤单-是》 then */
    if v_is_withdraw=1 then
        #采用循环更新获取订单的方式，避免加锁时间长和并发问题

        /* set @记录序号# = 0; */
        set v_row_id = 0;
        loop_label:loop

            /* [事务开始] */
            START TRANSACTION;


            /* 调用【原子_交易证券_交易_锁定获取指令订单】*/
            call db_tdsecu.pra_tdsetd_LockGetCommOrder(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_comm_id,
                v_row_id,
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
                v_target_code_no,
                v_trade_code_no,
                v_stock_type,
                v_asset_type,
                v_comm_opor,
                v_external_no,
                v_report_date,
                v_report_time,
                v_report_no,
                v_order_batch_no,
                v_order_id,
                v_order_date,
                v_order_time,
                v_order_dir,
                v_price_type,
                v_order_price,
                v_order_qty,
                v_order_status,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_all_fee,
                v_wtdraw_qty,
                v_strike_amt,
                v_strike_qty,
                v_impawn_ratio,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_order_oper_way,
                v_busi_opor_no,
                v_target_stock_code_no,
                v_trade_acco);

            /* if @错误编码#="0" then */
            if v_error_code="0" then

                /* set @记录序号# = @订单序号#; */
                set v_row_id = v_order_id;

                /* set @撤单批号# = 0; */
                set v_wtdraw_batch_no = 0;

                /* set @撤单说明# = "指令撤销撤销指令订单！"; */
                set v_wtdraw_remark = "指令撤销撤销指令订单！";

                /* 调用【原子_交易证券_指令_撤销指令订单】*/
                call db_tdsecu.pra_tdseap_CancelCommOrder(
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
                    v_out_acco,
                    v_exch_crncy_type,
                    v_exch_no,
                    v_stock_acco_no,
                    v_stock_acco,
                    v_stock_code_no,
                    v_stock_code,
                    v_target_code_no,
                    v_trade_code_no,
                    v_stock_type,
                    v_asset_type,
                    v_comm_id,
                    v_external_no,
                    v_order_batch_no,
                    v_order_date,
                    v_report_no,
                    v_order_id,
                    v_order_dir,
                    v_order_price,
                    v_order_qty,
                    v_order_status,
                    v_order_frozen_amt,
                    v_order_frozen_qty,
                    v_impawn_ratio,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_wtdraw_batch_no,
                    v_wtdraw_remark,
                    v_order_oper_way,
                    v_busi_opor_no,
                    v_is_record_jour,
                    v_target_stock_code_no,
                    v_trade_acco,
                    v_error_code,
                    v_error_info,
                    v_frozen_amt,
                    v_wtdraw_status,
                    v_wtdraw_qty,
                    v_wtdraw_id);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.2.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销指令订单出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @订单序号串# = concat(@订单序号串#,@订单序号#,";"); */
                set v_order_id_str = concat(v_order_id_str,v_order_id,";");

                /* if @撤单序号# > 0 and @撤单状态# <> 《撤单状态-成功》 then */
                if v_wtdraw_id > 0 and v_wtdraw_status <> "3" then

                  /* set @撤单序号串# = concat(@撤单序号串#,@撤单序号#,";"); */
                  set v_wtdraw_id_str = concat(v_wtdraw_id_str,v_wtdraw_id,";");
               end if;
            else

                /* set @错误编码#="0"; */
                set v_error_code="0";

                /* set @错误信息#=' '; */
                set v_error_info=' ';
                ROLLBACK;
                leave loop_label;
            end if;

            /* [事务结束] */
            COMMIT;

            #处理汇总订单

            /* [事务开始] */
            START TRANSACTION;


                /* if @撤单数量# > 0 then */
                if v_wtdraw_qty > 0 then

                    /* set @废单数量# = 0; */
                    set v_waste_qty = 0;

                    /* 调用【原子_交易证券_交易_撤单处理汇总订单】*/
                    call db_tdsecu.pra_tdsetd_CancelDealSumOrder(
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
                        v_order_date,
                        v_order_batch_no,
                        v_wtdraw_qty,
                        v_waste_qty,
                        v_order_oper_way,
                        v_error_code,
                        v_error_info);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.3.2.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤单处理汇总订单出现错误！',v_mysql_message);
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

        end loop;
    end if;

    /* set @标的代码编号# = @临时_标的代码编号#; */
    set v_target_code_no = v_tmp_target_code_no;

    /* set @交易代码编号# = @临时_交易代码编号#; */
    set v_trade_code_no = v_tmp_trade_code_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_comm_date = v_comm_date;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_order_id_str = v_order_id_str;
    SET p_wtdraw_id_str = v_wtdraw_id_str;
    SET p_target_code_no = v_target_code_no;
    SET p_trade_code_no = v_trade_code_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_修改指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_ModiComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_ModiComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
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
    IN p_stock_type int,
    IN p_comm_id bigint,
    IN p_comm_dir int,
    IN p_comm_limit_price decimal(16,9),
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_qty decimal(18,2),
    IN p_comm_amt decimal(18,4),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_comm_begin_date int,
    IN p_comm_end_date int,
    IN p_comm_begin_time int,
    IN p_comm_end_time int,
    IN p_modi_info varchar(255),
    IN p_compli_trig_id bigint,
    IN p_subscription_trade_mark int,
    IN p_purchase_trade_mark int,
    IN p_rede_trade_mark int,
    IN p_first_minimum_amt decimal(18,4),
    IN p_minimum_purchase_amt decimal(18,4),
    IN p_minimum_subscription_amt decimal(18,4),
    IN p_minimum_rede_share decimal(18,2),
    IN p_minimum_holding_share decimal(18,2),
    IN p_record_count int,
    IN p_read_flag int,
    IN p_comm_remark_info varchar(1024),
    IN p_combo_code varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_date int,
    OUT p_comm_batch_no int,
    OUT p_comm_status varchar(2),
    OUT p_comm_opor int,
    OUT p_comm_occur_amt decimal(18,4),
    OUT p_comm_occur_qty decimal(18,2),
    OUT p_order_id_str varchar(2048),
    OUT p_wtdraw_id_str varchar(2048)
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
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
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
    declare v_stock_type int;
    declare v_comm_id bigint;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_modi_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_record_count int;
    declare v_read_flag int;
    declare v_comm_remark_info varchar(1024);
    declare v_combo_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_status varchar(2);
    declare v_comm_opor int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_order_id_str varchar(2048);
    declare v_wtdraw_id_str varchar(2048);
    declare v_tmp_comm_limit_price decimal(16,9);
    declare v_tmp_limit_actual_price decimal(16,9);
    declare v_tmp_comm_qty decimal(18,2);
    declare v_tmp_comm_amt decimal(18,4);
    declare v_tmp_comm_begin_date int;
    declare v_tmp_comm_end_date int;
    declare v_tmp_comm_begin_time int;
    declare v_tmp_comm_end_time int;
    declare v_calc_dir int;
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_tmp_comm_frozen_amt decimal(18,4);
    declare v_tmp_comm_frozen_qty decimal(18,2);
    declare v_is_record_jour int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_asset_type int;
    declare v_comm_time int;
    declare v_comm_executor int;
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_strike_status varchar(2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_appr_status varchar(2);
    declare v_exter_comm_flag int;
    declare v_strategy_capt_qty decimal(18,2);
    declare v_strategy_order_qty decimal(18,2);
    declare v_comm_oper_way varchar(2);
    declare v_combo_posi_id bigint;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_contra_no varchar(32);
    declare v_disp_status int;
    declare v_exist_debt_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_trade_acco varchar(32);
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_remark varchar(255);
    declare v_frozen_amt decimal(18,4);
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_id bigint;
    declare v_waste_qty decimal(18,2);

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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
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
    SET v_stock_type = p_stock_type;
    SET v_comm_id = p_comm_id;
    SET v_comm_dir = p_comm_dir;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_qty = p_comm_qty;
    SET v_comm_amt = p_comm_amt;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_comm_begin_date = p_comm_begin_date;
    SET v_comm_end_date = p_comm_end_date;
    SET v_comm_begin_time = p_comm_begin_time;
    SET v_comm_end_time = p_comm_end_time;
    SET v_modi_info = p_modi_info;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_subscription_trade_mark = p_subscription_trade_mark;
    SET v_purchase_trade_mark = p_purchase_trade_mark;
    SET v_rede_trade_mark = p_rede_trade_mark;
    SET v_first_minimum_amt = p_first_minimum_amt;
    SET v_minimum_purchase_amt = p_minimum_purchase_amt;
    SET v_minimum_subscription_amt = p_minimum_subscription_amt;
    SET v_minimum_rede_share = p_minimum_rede_share;
    SET v_minimum_holding_share = p_minimum_holding_share;
    SET v_record_count = p_record_count;
    SET v_read_flag = p_read_flag;
    SET v_comm_remark_info = p_comm_remark_info;
    SET v_combo_code = p_combo_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_batch_no = 0;
    SET v_comm_status = "0";
    SET v_comm_opor = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_order_id_str = " ";
    SET v_wtdraw_id_str = " ";
    SET v_tmp_comm_limit_price = 0;
    SET v_tmp_limit_actual_price = 0;
    SET v_tmp_comm_qty = 0;
    SET v_tmp_comm_amt = 0;
    SET v_tmp_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_calc_dir = 1;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_tmp_comm_frozen_amt = 0;
    SET v_tmp_comm_frozen_qty = 0;
    SET v_is_record_jour = 1;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_asset_type = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_executor = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_strike_status = "0";
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_status = " ";
    SET v_exter_comm_flag = 0;
    SET v_strategy_capt_qty = 0;
    SET v_strategy_order_qty = 0;
    SET v_comm_oper_way = " ";
    SET v_combo_posi_id = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_contra_no = " ";
    SET v_disp_status = 0;
    SET v_exist_debt_flag = 0;
    SET v_occur_amt = 0;
    SET v_occur_qty = 0;
    SET v_row_id = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_external_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_batch_no = 0;
    SET v_order_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_trade_acco = " ";
    SET v_wtdraw_batch_no = 0;
    SET v_wtdraw_remark = " ";
    SET v_frozen_amt = 0;
    SET v_wtdraw_status = "0";
    SET v_wtdraw_id = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @临时_指令限价#=@指令限价#; */
    set v_tmp_comm_limit_price=v_comm_limit_price;

    /* set @临时_指令实际限价#=@指令实际限价#; */
    set v_tmp_limit_actual_price=v_limit_actual_price;

    /* set @临时_指令数量#=@指令数量#; */
    set v_tmp_comm_qty=v_comm_qty;
    #指令金额后台自己计算，不采用前台传入

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
        SET v_error_code = "tdsecuT.3.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令金额出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @临时_指令金额#=@指令金额#; */
    set v_tmp_comm_amt=v_comm_amt;

    /* set @临时_指令开始日期# = @指令开始日期#; */
    set v_tmp_comm_begin_date = v_comm_begin_date;

    /* set @临时_指令结束日期# = @指令结束日期#; */
    set v_tmp_comm_end_date = v_comm_end_date;

    /* set @临时_指令开始时间# = @指令开始时间#; */
    set v_tmp_comm_begin_time = v_comm_begin_time;

    /* set @临时_指令结束时间# = @指令结束时间#; */
    set v_tmp_comm_end_time = v_comm_end_time;

    /* set @计算方向# = 《计算方向-加上》; */
    set v_calc_dir = 1;

    /* 调用【原子_交易证券_公用_计算指令冻结金额和数量】*/
    call db_tdsecu.pra_tdsepb_GetCommFrozenAmtAndQty(
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
        v_calc_dir,
        v_error_code,
        v_error_info,
        v_comm_frozen_amt,
        v_comm_frozen_qty);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令冻结金额和数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @临时_指令冻结金额#=@指令冻结金额#; */
    set v_tmp_comm_frozen_amt=v_comm_frozen_amt;

    /* set @临时_指令冻结数量#=@指令冻结数量#; */
    set v_tmp_comm_frozen_qty=v_comm_frozen_qty;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_指令_锁定获取指令信息】*/
        call db_tdsecu.pra_tdseap_LockGetCommInfo(
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
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
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
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_strike_status,
            v_comm_status,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_comple_date,
            v_comm_comple_time,
            v_comm_appr_status,
            v_exter_comm_flag,
            v_strategy_capt_qty,
            v_strategy_order_qty,
            v_comm_oper_way,
            v_combo_code,
            v_combo_posi_id,
            v_target_stock_code,
            v_target_stock_code_no,
            v_contra_no,
            v_disp_status,
            v_exist_debt_flag);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.3.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_锁定获取指令信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

       #指令为终态时，调此接口判断为 更改 已读标志。

        /* if ((@指令状态#=《指令状态-待撤销》 or @指令状态#=《指令状态-部分撤销》 or @指令状态#=《指令状态-全部撤销》 or @成交状态#=《成交状态-已成》)  and @已读标记# = 《已读标记-已读》)  then */
        if ((v_comm_status="4" or v_comm_status="5" or v_comm_status="6" or v_strike_status="3")  and v_read_flag = 1)  then

               /* 调用【原子_交易证券_指令_更新指令已读标记】*/
               call db_tdsecu.pra_tdseap_UpdateCommReadFlag(
                   v_opor_co_no,
                   v_opor_no,
                   v_oper_mac,
                   v_oper_ip_addr,
                   v_oper_info,
                   v_oper_way,
                   v_func_code,
                   v_comm_id,
                   v_comm_date,
                   v_co_no,
                   v_comm_batch_no,
                   v_comm_executor,
                   v_read_flag,
                   v_error_code,
                   v_error_info);
               if v_error_code = "1" then
                   SET v_error_code = "tdsecuT.3.3.999";
                   if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_更新指令已读标记出现错误！',v_mysql_message);
                   end if;
                   ROLLBACK;
                   leave label_pro;
               elseif v_error_code <> "0" then
                   ROLLBACK;
                   leave label_pro;
               end if;

               leave label_pro;
               #[检查正常返回][1=1] 直接返回 提交修改已读标记，不做rollback
        end if;
        #检查原指令状态

        /* [检查报错返回][(@指令状态#=《指令状态-待撤销》 or @指令状态#=《指令状态-部分撤销》 or @指令状态#=《指令状态-全部撤销》 or @成交状态#=《成交状态-已成》) ][624][@指令状态#,@成交状态#] */
        if (v_comm_status="4" or v_comm_status="5" or v_comm_status="6" or v_strike_status="3")  then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.3.624";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令状态=",v_comm_status,",","成交状态=",v_strike_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令状态=",v_comm_status,",","成交状态=",v_strike_status);
            end if;
            leave label_pro;
        end if;

        #考虑普通订单和策略订单对指令的影响

        /* [检查报错返回][@临时_指令数量# < (@策略占用数量# + @订单数量# -@策略订单数量#)][625][@指令数量#,@策略占用数量# + @订单数量# -@策略订单数量#] */
        if v_tmp_comm_qty < (v_strategy_capt_qty + v_order_qty -v_strategy_order_qty) then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.3.625";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令数量=",v_comm_qty,",","策略占用数量 + 订单数量 -策略订单数量=",v_strategy_capt_qty + v_order_qty -v_strategy_order_qty),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令数量=",v_comm_qty,",","策略占用数量 + 订单数量 -策略订单数量=",v_strategy_capt_qty + v_order_qty -v_strategy_order_qty);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][((@指令方向#=《指令方向-质押提交》) or (@指令方向#=《指令方向-质押转回》)) and (@临时_指令限价# = 0 or @临时_指令限价# <> @指令限价#)][623][@指令限价#] */
        if ((v_comm_dir=21) or (v_comm_dir=22)) and (v_tmp_comm_limit_price = 0 or v_tmp_comm_limit_price <> v_comm_limit_price) then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.3.623";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令限价=",v_comm_limit_price),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令限价=",v_comm_limit_price);
            end if;
            leave label_pro;
        end if;


        /* set @指令冻结金额#=(@临时_指令数量# - @订单数量#)/@临时_指令数量# *@临时_指令金额# - @指令冻结金额#; */
        set v_comm_frozen_amt=(v_tmp_comm_qty - v_order_qty)/v_tmp_comm_qty *v_tmp_comm_amt - v_comm_frozen_amt;
        #计算本次修改变动的指令数量和冻结金额

        /* set @指令数量#=@临时_指令数量# - @指令数量#; */
        set v_comm_qty=v_tmp_comm_qty - v_comm_qty;
        #交易证券子系统检查，检查指令可用资金、可用持仓等

        /* 调用【原子_交易证券_指令_校验新增指令】*/
        call db_tdsecu.pra_tdseap_CheckAddComm(
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
            v_comm_dir,
            v_comm_qty,
            v_comm_frozen_amt,
            v_impawn_ratio,
            v_stock_type,
            v_subscription_trade_mark,
            v_purchase_trade_mark,
            v_rede_trade_mark,
            v_first_minimum_amt,
            v_minimum_purchase_amt,
            v_minimum_subscription_amt,
            v_minimum_rede_share,
            v_minimum_holding_share,
            v_record_count,
            v_combo_code,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.3.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_校验新增指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #风控子系统检查，检查指令端风控等

        /* set @变动金额#=@指令冻结金额#; */
        set v_occur_amt=v_comm_frozen_amt;

        /* set @变动数量#=@指令数量#; */
        set v_occur_qty=v_comm_qty;
        #指令修改

        /* set @指令数量#=@临时_指令数量#; */
        set v_comm_qty=v_tmp_comm_qty;

        /* set @指令限价#=@临时_指令限价#; */
        set v_comm_limit_price=v_tmp_comm_limit_price;

        /* set @指令金额#=@临时_指令金额#; */
        set v_comm_amt=v_tmp_comm_amt;

        /* set @指令实际限价#=@临时_指令实际限价#; */
        set v_limit_actual_price=v_tmp_limit_actual_price;

        /* set @指令开始日期# = @临时_指令开始日期#; */
        set v_comm_begin_date = v_tmp_comm_begin_date;

        /* set @指令结束日期# = @临时_指令结束日期#; */
        set v_comm_end_date = v_tmp_comm_end_date;

        /* set @指令开始时间# = @临时_指令开始时间#; */
        set v_comm_begin_time = v_tmp_comm_begin_time;

        /* set @指令结束时间# = @临时_指令结束时间#; */
        set v_comm_end_time = v_tmp_comm_end_time;

        /* 调用【原子_交易证券_指令_修改指令】*/
        call db_tdsecu.pra_tdseap_ModiComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_stock_type,
            v_comm_id,
            v_comm_limit_price,
            v_limit_actual_price,
            v_comm_qty,
            v_comm_amt,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_par_value,
            v_impawn_ratio,
            v_net_price_flag,
            v_bond_accr_intrst,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_modi_info,
            v_read_flag,
            v_comm_remark_info,
            v_error_code,
            v_error_info,
            v_comm_occur_amt,
            v_comm_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.3.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_修改指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @指令变动金额# <> 0 or @指令变动数量# <> 0 then */
        if v_comm_occur_amt <> 0 or v_comm_occur_qty <> 0 then
            #处理资金持仓数据

            /* 调用【原子_交易证券_账户_更新指令资金持仓】*/
            call db_tdsecu.pra_tdseac_UpdateApprCashPosi(
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
                v_comm_id,
                v_comm_dir,
                v_exch_crncy_type,
                v_exch_no,
                v_stock_code,
                v_asset_type,
                v_stock_type,
                v_impawn_ratio,
                v_stock_acco_no,
                v_stock_code_no,
                v_trade_code_no,
                v_target_code_no,
                v_comm_occur_amt,
                v_comm_occur_qty,
                v_is_record_jour,
                v_combo_code,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.3.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令资金持仓出现错误！',v_mysql_message);
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

    #指令价格为0时不限价不应该撤订单

    /* [检查正常返回][@指令限价# = 0] */
    if v_comm_limit_price = 0 then
        leave label_pro;
    end if;

    #采用循环更新获取订单的方式，避免加锁时间长和并发问题

    /* set @订单序号串# = ""; */
    set v_order_id_str = "";

    /* set @撤单序号串# = ""; */
    set v_wtdraw_id_str = "";

    /* set @记录序号# = 0; */
    set v_row_id = 0;
    loop_label:loop

        /* [事务开始] */
        START TRANSACTION;


        /* 调用【原子_交易证券_交易_锁定获取指令修改订单】*/
        call db_tdsecu.pra_tdsetd_LockGetCommModiOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_comm_id,
            v_limit_actual_price,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_row_id,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_trade_code_no,
            v_target_code_no,
            v_asset_type,
            v_stock_type,
            v_comm_opor,
            v_external_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_batch_no,
            v_order_id,
            v_order_date,
            v_order_time,
            v_order_dir,
            v_price_type,
            v_order_price,
            v_order_qty,
            v_order_status,
            v_wtdraw_qty,
            v_strike_amt,
            v_strike_qty,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_order_oper_way,
            v_busi_opor_no,
            v_trade_acco);

        /* if @错误编码#="0" then */
        if v_error_code="0" then

            /* set @记录序号# = @订单序号#; */
            set v_row_id = v_order_id;

            /* set @撤单批号# = 0; */
            set v_wtdraw_batch_no = 0;

            /* set @撤单说明# = "指令修改撤销指令订单！"; */
            set v_wtdraw_remark = "指令修改撤销指令订单！";

            /* 调用【原子_交易证券_指令_撤销指令订单】*/
            call db_tdsecu.pra_tdseap_CancelCommOrder(
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
                v_out_acco,
                v_exch_crncy_type,
                v_exch_no,
                v_stock_acco_no,
                v_stock_acco,
                v_stock_code_no,
                v_stock_code,
                v_target_code_no,
                v_trade_code_no,
                v_stock_type,
                v_asset_type,
                v_comm_id,
                v_external_no,
                v_order_batch_no,
                v_order_date,
                v_report_no,
                v_order_id,
                v_order_dir,
                v_order_price,
                v_order_qty,
                v_order_status,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_impawn_ratio,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_wtdraw_batch_no,
                v_wtdraw_remark,
                v_order_oper_way,
                v_busi_opor_no,
                v_is_record_jour,
                v_target_stock_code_no,
                v_trade_acco,
                v_error_code,
                v_error_info,
                v_frozen_amt,
                v_wtdraw_status,
                v_wtdraw_qty,
                v_wtdraw_id);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.3.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销指令订单出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @订单序号串# = concat(@订单序号串#,@订单序号#,";"); */
            set v_order_id_str = concat(v_order_id_str,v_order_id,";");

            /* if @撤单序号# > 0 and @撤单状态# <> 《撤单状态-成功》 then */
            if v_wtdraw_id > 0 and v_wtdraw_status <> "3" then

                /* set @撤单序号串# = concat(@撤单序号串#,@撤单序号#,";"); */
                set v_wtdraw_id_str = concat(v_wtdraw_id_str,v_wtdraw_id,";");
            end if;
        else

            /* set @错误编码#="0"; */
            set v_error_code="0";

            /* set @错误信息#=' '; */
            set v_error_info=' ';
            ROLLBACK;
            leave loop_label;
        end if;

        /* [事务结束] */
        COMMIT;

         #处理汇总订单

         /* [事务开始] */
         START TRANSACTION;


             /* if @撤单数量# > 0 then */
             if v_wtdraw_qty > 0 then

                  /* set @废单数量# = 0; */
                  set v_waste_qty = 0;

                 /* 调用【原子_交易证券_交易_撤单处理汇总订单】*/
                 call db_tdsecu.pra_tdsetd_CancelDealSumOrder(
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
                     v_order_date,
                     v_order_batch_no,
                     v_wtdraw_qty,
                     v_waste_qty,
                     v_order_oper_way,
                     v_error_code,
                     v_error_info);
                 if v_error_code = "1" then
                     SET v_error_code = "tdsecuT.3.3.999";
                     if v_mysql_message <> "" then
                          SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤单处理汇总订单出现错误！',v_mysql_message);
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

    end loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_date = v_comm_date;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_status = v_comm_status;
    SET p_comm_opor = v_comm_opor;
    SET p_comm_occur_amt = v_comm_occur_amt;
    SET p_comm_occur_qty = v_comm_occur_qty;
    SET p_order_id_str = v_order_id_str;
    SET p_wtdraw_id_str = v_wtdraw_id_str;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_审批指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_ApprComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_ApprComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_asset_type int,
    IN p_comm_id bigint,
    IN p_stock_acco varchar(16),
    IN p_comm_date int,
    IN p_comm_appr_oper int,
    IN p_comm_appr_status varchar(2),
    IN p_comm_appr_remark varchar(255),
    IN p_asac_busi_config_str varchar(64),
    IN p_all_fee decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_cost_calc_type int,
    IN p_compli_trig_id bigint,
    IN p_asset_acco_type int,
    IN p_co_busi_config_str varchar(64),
    IN p_online_opor_no_str varchar(2048),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_order_id bigint,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_stock_type int,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_batch_no int,
    OUT p_order_dir int,
    OUT p_external_no bigint,
    OUT p_price_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_net_price_flag int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_order_oper_way varchar(2),
    OUT p_update_times int,
    OUT p_appr_allow_order_flag int,
    OUT p_comm_oper_way varchar(2),
    OUT p_before_comm_executor int,
    OUT p_auto_comm_executor int
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_asset_type int;
    declare v_comm_id bigint;
    declare v_stock_acco varchar(16);
    declare v_comm_date int;
    declare v_comm_appr_oper int;
    declare v_comm_appr_status varchar(2);
    declare v_comm_appr_remark varchar(255);
    declare v_asac_busi_config_str varchar(64);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_cost_calc_type int;
    declare v_compli_trig_id bigint;
    declare v_asset_acco_type int;
    declare v_co_busi_config_str varchar(64);
    declare v_online_opor_no_str varchar(2048);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_order_id bigint;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_external_no bigint;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_order_oper_way varchar(2);
    declare v_update_times int;
    declare v_appr_allow_order_flag int;
    declare v_comm_oper_way varchar(2);
    declare v_before_comm_executor int;
    declare v_auto_comm_executor int;
    declare v_tmp_comm_appr_status varchar(2);
    declare v_tmp_comm_appr_oper int;
    declare v_tmp_comm_appr_remark varchar(255);
    declare v_tmp_stock_acco varchar(16);
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_exch_crncy_type varchar(3);
    declare v_comm_time int;
    declare v_comm_opor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_intrst_days int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_strike_status varchar(2);
    declare v_comm_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_exter_comm_flag int;
    declare v_strategy_capt_qty decimal(18,2);
    declare v_strategy_order_qty decimal(18,2);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_contra_no varchar(32);
    declare v_disp_status int;
    declare v_exist_debt_flag int;
    declare v_comm_appr_oper_no int;
    declare v_curr_opor_no int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_disp_opor int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_calc_dir int;
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_pass_status varchar(2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_busi_opor_no int;
    declare v_avail_cal_flag int;
    declare v_open_posi_date int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_waste_qty decimal(18,2);

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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_asset_type = p_asset_type;
    SET v_comm_id = p_comm_id;
    SET v_stock_acco = p_stock_acco;
    SET v_comm_date = p_comm_date;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_comm_appr_status = p_comm_appr_status;
    SET v_comm_appr_remark = p_comm_appr_remark;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_all_fee = p_all_fee;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_online_opor_no_str = p_online_opor_no_str;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_order_id = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_batch_no = 0;
    SET v_order_dir = 0;
    SET v_external_no = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_status = "0";
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_net_price_flag = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_order_oper_way = " ";
    SET v_update_times = 1;
    SET v_appr_allow_order_flag = 0;
    SET v_comm_oper_way = " ";
    SET v_before_comm_executor = 0;
    SET v_auto_comm_executor = 0;
    SET v_tmp_comm_appr_status = " ";
    SET v_tmp_comm_appr_oper = 0;
    SET v_tmp_comm_appr_remark = " ";
    SET v_tmp_stock_acco = " ";
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_opor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_intrst_days = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_strike_status = "0";
    SET v_comm_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_exter_comm_flag = 0;
    SET v_strategy_capt_qty = 0;
    SET v_strategy_order_qty = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_contra_no = " ";
    SET v_disp_status = 0;
    SET v_exist_debt_flag = 0;
    SET v_comm_appr_oper_no = 0;
    SET v_curr_opor_no = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_disp_opor = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_calc_dir = 1;
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;
    SET v_remark_info = " ";
    SET v_pass_status = "0";
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_busi_opor_no = 0;
    SET v_avail_cal_flag = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_wtdraw_qty = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @临时_指令审批状态#=@指令审批状态#; */
    set v_tmp_comm_appr_status=v_comm_appr_status;

    /* set @临时_指令审批操作员#=@操作员编号#; */
    set v_tmp_comm_appr_oper=v_opor_no;

    /* set @临时_指令审批说明#=@指令审批说明#; */
    set v_tmp_comm_appr_remark=v_comm_appr_remark;
    #股东代码在指令表没有是获取不到的，订单表中的用传进来的股东代码

    /* set @临时_股东代码#=@股东代码#; */
    set v_tmp_stock_acco=v_stock_acco;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;

    /* set @登记机构# =""; */
    set v_registration_agency ="";

    /* set @交易账户# =""; */
    set v_trade_acco ="";

    /* if substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 then */
    if substring(v_asac_busi_config_str,6,1)=1 then
        #获取订单批号

        /* set @编号类型#=《编号类型-订单批号》; */
        set v_record_no_type=18;

        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_交易证券_公用_获取业务记录编号】*/
            call db_tdsecu.pra_tdsepb_GetCoBusiRecordNo(
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
                SET v_error_code = "tdsecuT.3.4.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


        /* [事务结束] */
        COMMIT;


        /* set @订单批号#=@当前编号#; */
        set v_order_batch_no=v_curr_no;
    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_指令_锁定获取指令信息】*/
        call db_tdsecu.pra_tdseap_LockGetCommInfo(
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
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
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
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_strike_status,
            v_comm_status,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_comple_date,
            v_comm_comple_time,
            v_comm_appr_status,
            v_exter_comm_flag,
            v_strategy_capt_qty,
            v_strategy_order_qty,
            v_comm_oper_way,
            v_combo_code,
            v_combo_posi_id,
            v_target_stock_code,
            v_target_stock_code_no,
            v_contra_no,
            v_disp_status,
            v_exist_debt_flag);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.4.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_锁定获取指令信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @前指令执行人# = @指令执行人#; */
        set v_before_comm_executor = v_comm_executor;

        /* set @股东代码#=@临时_股东代码#; */
        set v_stock_acco=v_tmp_stock_acco;

        /* [检查报错返回][@指令下达人#=@操作员编号#][726][@指令下达人#,@操作员编号#] */
        if v_comm_opor=v_opor_no then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.4.726";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令下达人=",v_comm_opor,",","操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令下达人=",v_comm_opor,",","操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@指令审批状态#=《指令审批状态-不审批》 ][727][@指令审批状态#] */
        if v_comm_appr_status="4"  then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.4.727";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令审批状态=",v_comm_appr_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令审批状态=",v_comm_appr_status);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@指令审批状态#=《指令审批状态-审批通过》 or @指令审批状态#=《指令审批状态-审批拒绝》 ][728][@指令审批状态#] */
        if v_comm_appr_status="2" or v_comm_appr_status="3"  then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.4.728";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令审批状态=",v_comm_appr_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令审批状态=",v_comm_appr_status);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@指令状态# <>《指令状态-未执行》and @指令状态# <>《指令状态-暂停执行》  ][763][@指令状态#] */
        if v_comm_status <>"1"and v_comm_status <>"7"   then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.4.763";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令状态=",v_comm_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令状态=",v_comm_status);
            end if;
            leave label_pro;
        end if;


        /* set @指令审批状态#=@临时_指令审批状态#; */
        set v_comm_appr_status=v_tmp_comm_appr_status;
        #获取指令审批操作员序号

        /* set @指令审批操作员序号# = 0; */
        set v_comm_appr_oper_no = 0;
        #[原子_交易证券_公用_获取指令审批操作员序号]
        #如果审批通过，需做相应检查处理，并获取指令批号

        /* if @指令审批状态#=《指令审批状态-审批通过》 then */
        if v_comm_appr_status="2" then

            /* if substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 then */
            if substring(v_asac_busi_config_str,6,1)=1 then

                /* if @指令方向#=《指令方向-新股申购》 or  @指令方向#=《指令方向-配售申购》 then */
                if v_comm_dir=11 or  v_comm_dir=23 then

                    /* 调用【原子_交易证券_交易_检查证券申购重复】*/
                    call db_tdsecu.pra_tdsetd_CheckPurcDup(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_init_date,
                        v_exch_group_no,
                        v_asset_acco_no,
                        v_exch_no,
                        v_stock_acco_no,
                        v_stock_code_no,
                        v_error_code,
                        v_error_info);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.3.4.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_检查证券申购重复出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;

                end if;
            end if;
        end if;

        /* set @指令审批操作员#=@临时_指令审批操作员#; */
        set v_comm_appr_oper=v_tmp_comm_appr_oper;

        /* set @指令审批说明#=@临时_指令审批说明#; */
        set v_comm_appr_remark=v_tmp_comm_appr_remark;

        /* set @当前操作员# = @指令下达人#; */
        set v_curr_opor_no = v_comm_opor;

        /* 调用【原子_交易证券_指令_审批指令】*/
        call db_tdsecu.pra_tdseap_ApprComm(
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
            v_stock_code,
            v_stock_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_date,
            v_comm_id,
            v_comm_opor,
            v_comm_executor,
            v_comm_batch_no,
            v_comm_appr_oper_no,
            v_comm_appr_oper,
            v_comm_appr_status,
            v_comm_appr_remark,
            v_comm_qty,
            v_comm_dir,
            v_comm_limit_price,
            v_limit_actual_price,
            v_order_qty,
            v_comm_cancel_qty,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_net_price_flag,
            v_par_value,
            v_comm_status,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_exter_comm_flag,
            v_comm_oper_way,
            v_comm_amt,
            v_co_busi_config_str,
            v_online_opor_no_str,
            v_curr_opor_no,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_before_comm_executor,
            v_error_code,
            v_error_info,
            v_comm_occur_amt,
            v_comm_occur_qty,
            v_comm_appr_date,
            v_comm_appr_time,
            v_disp_status,
            v_disp_opor,
            v_auto_comm_executor);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.4.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_审批指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @自动分发指令执行人# >0 and @指令执行人# = 0 then */
        if v_auto_comm_executor >0 and v_comm_executor = 0 then

            /* set @指令执行人# = @自动分发指令执行人#; */
            set v_comm_executor = v_auto_comm_executor;
        end if;

        /* if @指令审批状态#=《指令审批状态-审批拒绝》 and (@指令变动金额# <> 0 or @指令变动数量# <> 0) then */
        if v_comm_appr_status="3" and (v_comm_occur_amt <> 0 or v_comm_occur_qty <> 0) then
            #处理资金持仓数据

            /* 调用【原子_交易证券_账户_更新指令资金持仓】*/
            call db_tdsecu.pra_tdseac_UpdateApprCashPosi(
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
                v_comm_id,
                v_comm_dir,
                v_exch_crncy_type,
                v_exch_no,
                v_stock_code,
                v_asset_type,
                v_stock_type,
                v_impawn_ratio,
                v_stock_acco_no,
                v_stock_code_no,
                v_trade_code_no,
                v_target_code_no,
                v_comm_occur_amt,
                v_comm_occur_qty,
                v_is_record_jour,
                v_combo_code,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.4.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令资金持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        else
    #手工审批  暂停的指令时 需拦截自动下单 modify by wjp 20181106

            /* if (substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 and @指令执行人# > 0  and @指令状态# <>《指令状态-暂停执行》) then */
            if (substring(v_asac_busi_config_str,6,1)=1 and v_comm_executor > 0  and v_comm_status <>"7") then

                /* 调用【原子_交易证券_交易_交易端证券业务合规判断】*/
                call db_tdsecu.pra_tdsetd_CheckExchSecuRisk(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_error_code,
                    v_error_info,
                    v_compli_trig_id);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.4.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_交易端证券业务合规判断出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #设置订单值

                /* set @外部编号#=0; */
                set v_external_no=0;

                /* set @申报日期# = 0; */
                set v_report_date = 0;

                /* set @申报时间# = 0; */
                set v_report_time = 0;

                /* set @申报编号# = " "; */
                set v_report_no = " ";

                /* set @操作员编号# = @指令执行人#; */
                set v_opor_no = v_comm_executor;

                /* set @订单日期#=@初始化日期#; */
                set v_order_date=v_init_date;

                /* set @价格类型#=《价格类型-限价》; */
                set v_price_type=1;

                /* set @订单方向#=@指令方向#; */
                set v_order_dir=v_comm_dir;

                /* set @订单数量#=@指令数量#; */
                set v_order_qty=v_comm_qty;

                /* set @订单价格#=@指令实际限价#; */
                set v_order_price=v_limit_actual_price;

                /* set @审批通过自动下单# = 《审批通过自动下单-是》; */
                set v_appr_allow_order_flag = 1;

                /* set @计算方向# = 《计算方向-减去》; */
                set v_calc_dir = -1;

                /* 调用【原子_交易证券_公用_计算指令冻结金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetCommFrozenAmtAndQty(
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
                    v_calc_dir,
                    v_error_code,
                    v_error_info,
                    v_comm_frozen_amt,
                    v_comm_frozen_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.4.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令冻结金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* 调用【原子_交易证券_指令_下单更新指令】*/
                call db_tdsecu.pra_tdseap_OrderUpdateComm(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_comm_id,
                    v_comm_frozen_amt,
                    v_comm_frozen_qty,
                    v_order_qty,
                    v_error_code,
                    v_error_info,
                    v_limit_actual_price,
                    v_exter_comm_flag,
                    v_comm_comple_date,
                    v_comm_comple_time,
                    v_comm_status,
                    v_strike_status);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.4.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_下单更新指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #计算交易冻结金额

                /* 调用【原子_交易证券_公用_计算交易冻结金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetExchFrozenAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_order_dir,
                    v_order_price,
                    v_order_qty,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_all_fee,
                    v_error_code,
                    v_error_info,
                    v_trade_frozen_amt,
                    v_trade_frozen_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.4.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算交易冻结金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @订单冻结金额#=@交易冻结金额#; */
                set v_order_frozen_amt=v_trade_frozen_amt;

                /* set @订单冻结数量#=@交易冻结数量#; */
                set v_order_frozen_qty=v_trade_frozen_qty;

                /* set @备注信息#="指令审批后自动执行下单！"; */
                set v_remark_info="指令审批后自动执行下单！";
                #根据报盘机状态，设置订单状态 如果通道是允许报送状态,则直接将订单状态设为"待报"

                /* set @订单状态# = 《订单状态-未报》; */
                set v_order_status = "1";

                /* 调用【原子_交易证券_公用_获取通道状态】*/
                call db_tdsecu.pra_tdsepb_GetChannelStatus(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_pass_no,
                    v_error_code,
                    v_error_info,
                    v_pass_status);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.4.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取通道状态出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* if @通道状态# = 《通道状态-正常》 then */
                if v_pass_status = "1" then

                    /* set @订单状态# = 《订单状态-待报》; */
                    set v_order_status = "a";
                end if;

                /* set @订单操作方式# = 《订单操作方式-审批后自动下单》; */
                set v_order_oper_way = "40";

                /* set @组合代码# = " "; */
                set v_combo_code = " ";

                /* set @组合持仓序号# = 0; */
                set v_combo_posi_id = 0;

                /* set @存在负债标志# = 《存在负债标志-不存在》; */
                set v_exist_debt_flag = 1;

                /* 调用【原子_交易证券_交易_新增订单】*/
                call db_tdsecu.pra_tdsetd_AddOrder(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_init_date,
                    v_co_no,
                    v_comm_opor,
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
                    v_target_code_no,
                    v_trade_code_no,
                    v_stock_type,
                    v_asset_type,
                    v_external_no,
                    v_comm_id,
                    v_comm_batch_no,
                    v_order_batch_no,
                    v_order_date,
                    v_order_dir,
                    v_price_type,
                    v_order_price,
                    v_order_qty,
                    v_order_status,
                    v_report_date,
                    v_report_time,
                    v_report_no,
                    v_order_frozen_amt,
                    v_order_frozen_qty,
                    v_net_price_flag,
                    v_intrst_days,
                    v_par_value,
                    v_impawn_ratio,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_compli_trig_id,
                    v_remark_info,
                    v_order_oper_way,
                    v_exter_comm_flag,
                    v_cost_calc_type,
                    v_combo_code,
                    v_combo_posi_id,
                    v_target_stock_code,
                    v_target_stock_code_no,
                    v_registration_agency,
                    v_trade_acco,
                    v_contra_no,
                    v_asset_acco_type,
                    v_exist_debt_flag,
                    v_error_code,
                    v_error_info,
                    v_order_id,
                    v_order_time,
                    v_update_times);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.4.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增订单出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #处理订单资金持仓数据

                /* set @计算方向# = 《计算方向-减去》; */
                set v_calc_dir = -1;

                /* 调用【原子_交易证券_公用_计算指令变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetCommOccurAmtAndQty(
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
                    v_calc_dir,
                    v_error_code,
                    v_error_info,
                    v_comm_occur_amt,
                    v_comm_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.4.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #计算下单交易变动金额和数量

                /* 调用【原子_交易证券_公用_计算下单交易变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetOrderTradeOccurAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_order_dir,
                    v_order_qty,
                    v_order_price,
                    v_order_frozen_amt,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_error_code,
                    v_error_info,
                    v_trade_occur_amt,
                    v_trade_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.4.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算下单交易变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #处理订单资金持仓数据，保护指令变动和交易的变动

                /* set @业务操作员编号# = @指令执行人#; */
                set v_busi_opor_no = v_comm_executor;

                /* set @可用计算标志# = 0; */
                set v_avail_cal_flag = 0;

                /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
                call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
                    v_exch_crncy_type,
                    v_comm_id,
                    v_order_id,
                    v_exch_no,
                    v_stock_code,
                    v_stock_type,
                    v_asset_type,
                    v_order_dir,
                    v_impawn_ratio,
                    v_stock_acco_no,
                    v_stock_code_no,
                    v_trade_code_no,
                    v_target_code_no,
                    v_comm_occur_amt,
                    v_comm_occur_qty,
                    v_trade_occur_amt,
                    v_trade_occur_qty,
                    v_is_record_jour,
                    v_order_oper_way,
                    v_busi_opor_no,
                    v_open_close_permission,
                    v_avail_cal_flag,
                    v_combo_code,
                    v_combo_posi_id,
                    v_target_stock_code_no,
                    v_error_code,
                    v_error_info,
                    v_open_posi_date);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.4.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #modify by wjp 20181101

                /* if @订单批号# > 0  then */
                if v_order_batch_no > 0  then

                    /* set @撤单数量# = 0; */
                    set v_wtdraw_qty = 0;

                    /* set @废单数量# = 0; */
                    set v_waste_qty = 0;

                   /* 调用【原子_交易证券_交易_订单处理汇总订单】*/
                   call db_tdsecu.pra_tdsetd_OrderDealSumOrder(
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
                       v_exch_crncy_type,
                       v_exch_no,
                       v_stock_code_no,
                       v_stock_code,
                       v_trade_code_no,
                       v_target_code_no,
                       v_stock_type,
                       v_asset_type,
                       v_external_no,
                       v_order_date,
                       v_order_batch_no,
                       v_order_dir,
                       v_price_type,
                       v_order_price,
                       v_order_qty,
                       v_order_status,
                       v_wtdraw_qty,
                       v_waste_qty,
                       v_net_price_flag,
                       v_intrst_days,
                       v_par_value,
                       v_bond_accr_intrst,
                       v_bond_rate_type,
                       v_impawn_ratio,
                       v_order_oper_way,
                       v_exter_comm_flag,
                       v_error_code,
                       v_error_info);
                   if v_error_code = "1" then
                       SET v_error_code = "tdsecuT.3.4.999";
                       if v_mysql_message <> "" then
                            SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_订单处理汇总订单出现错误！',v_mysql_message);
                       end if;
                       ROLLBACK;
                       leave label_pro;
                   elseif v_error_code <> "0" then
                       ROLLBACK;
                       leave label_pro;
                   end if;

               end if;
            end if;
        end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_order_id = v_order_id;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_stock_type = v_stock_type;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_dir = v_order_dir;
    SET p_external_no = v_external_no;
    SET p_price_type = v_price_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_status = v_order_status;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_net_price_flag = v_net_price_flag;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_order_oper_way = v_order_oper_way;
    SET p_update_times = v_update_times;
    SET p_appr_allow_order_flag = v_appr_allow_order_flag;
    SET p_comm_oper_way = v_comm_oper_way;
    SET p_before_comm_executor = v_before_comm_executor;
    SET p_auto_comm_executor = v_auto_comm_executor;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_分发指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_DispComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_DispComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_comm_id bigint,
    IN p_comm_executor int,
    IN p_disp_remark varchar(255),
    IN p_is_withdraw int,
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_comm_date int,
    OUT p_comm_batch_no int,
    OUT p_comm_dir int,
    OUT p_comm_status varchar(2),
    OUT p_strike_status varchar(2),
    OUT p_comm_qty decimal(18,2),
    OUT p_order_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_comm_cancel_qty decimal(18,2),
    OUT p_before_comm_executor int,
    OUT p_order_id_str varchar(2048),
    OUT p_wtdraw_id_str varchar(2048),
    OUT p_target_code_no int,
    OUT p_trade_code_no int
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
    declare v_comm_id bigint;
    declare v_comm_executor int;
    declare v_disp_remark varchar(255);
    declare v_is_withdraw int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_dir int;
    declare v_comm_status varchar(2);
    declare v_strike_status varchar(2);
    declare v_comm_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_before_comm_executor int;
    declare v_order_id_str varchar(2048);
    declare v_wtdraw_id_str varchar(2048);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_tmp_comm_executor int;
    declare v_is_record_jour int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_time int;
    declare v_comm_opor int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_amt decimal(18,4);
    declare v_strike_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_appr_status varchar(2);
    declare v_exter_comm_flag int;
    declare v_strategy_capt_qty decimal(18,2);
    declare v_strategy_order_qty decimal(18,2);
    declare v_comm_oper_way varchar(2);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_contra_no varchar(32);
    declare v_disp_status int;
    declare v_exist_debt_flag int;
    declare v_disp_flag int;
    declare v_row_id bigint;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_status varchar(2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_trade_acco varchar(32);
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_remark varchar(255);
    declare v_frozen_amt decimal(18,4);
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_id bigint;
    declare v_waste_qty decimal(18,2);

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
    SET v_comm_id = p_comm_id;
    SET v_comm_executor = p_comm_executor;
    SET v_disp_remark = p_disp_remark;
    SET v_is_withdraw = p_is_withdraw;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_batch_no = 0;
    SET v_comm_dir = 0;
    SET v_comm_status = "0";
    SET v_strike_status = "0";
    SET v_comm_qty = 0;
    SET v_order_qty = 0;
    SET v_strike_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_before_comm_executor = 0;
    SET v_order_id_str = " ";
    SET v_wtdraw_id_str = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_tmp_comm_executor = 0;
    SET v_is_record_jour = 1;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_opor = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_amt = 0;
    SET v_strike_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_status = " ";
    SET v_exter_comm_flag = 0;
    SET v_strategy_capt_qty = 0;
    SET v_strategy_order_qty = 0;
    SET v_comm_oper_way = " ";
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_contra_no = " ";
    SET v_disp_status = 0;
    SET v_exist_debt_flag = 0;
    SET v_disp_flag = 0;
    SET v_row_id = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_external_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_batch_no = 0;
    SET v_order_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_status = "0";
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_all_fee = 0;
    SET v_wtdraw_qty = 0;
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_trade_acco = " ";
    SET v_wtdraw_batch_no = 0;
    SET v_wtdraw_remark = " ";
    SET v_frozen_amt = 0;
    SET v_wtdraw_status = "0";
    SET v_wtdraw_id = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @临时_指令执行人#=@指令执行人#; */
    set v_tmp_comm_executor=v_comm_executor;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_指令_锁定获取指令信息】*/
        call db_tdsecu.pra_tdseap_LockGetCommInfo(
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
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
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
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_strike_status,
            v_comm_status,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_comple_date,
            v_comm_comple_time,
            v_comm_appr_status,
            v_exter_comm_flag,
            v_strategy_capt_qty,
            v_strategy_order_qty,
            v_comm_oper_way,
            v_combo_code,
            v_combo_posi_id,
            v_target_stock_code,
            v_target_stock_code_no,
            v_contra_no,
            v_disp_status,
            v_exist_debt_flag);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.5.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_锁定获取指令信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* [检查报错返回][@临时_指令执行人#=@指令执行人#][721][@临时_指令执行人#, @指令执行人#] */
        if v_tmp_comm_executor=v_comm_executor then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.5.721";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("临时_指令执行人=",v_tmp_comm_executor,","," 指令执行人=", v_comm_executor),"#",v_mysql_message);
            else
                SET v_error_info = concat("临时_指令执行人=",v_tmp_comm_executor,","," 指令执行人=", v_comm_executor);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@指令状态#=《指令状态-全部撤销》][724][@指令状态#] */
        if v_comm_status="6" then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.5.724";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令状态=",v_comm_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令状态=",v_comm_status);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@成交状态#=《成交状态-已成》][725][@成交状态#] */
        if v_strike_status="3" then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.5.725";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("成交状态=",v_strike_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("成交状态=",v_strike_status);
            end if;
            leave label_pro;
        end if;


        /* set @前指令执行人#=@指令执行人#; */
        set v_before_comm_executor=v_comm_executor;

        /* set @指令执行人#=@临时_指令执行人#; */
        set v_comm_executor=v_tmp_comm_executor;

        /* set @分发方式# =《分发方式-手动分发》; */
        set v_disp_flag =2;

        /* 调用【原子_交易证券_指令_分发指令】*/
        call db_tdsecu.pra_tdseap_DispComm(
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
            v_asset_type,
            v_comm_date,
            v_comm_id,
            v_comm_batch_no,
            v_comm_dir,
            v_comm_status,
            v_comm_executor,
            v_disp_flag,
            v_disp_remark,
            v_before_comm_executor,
            v_is_withdraw,
            v_exter_comm_flag,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.5.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_分发指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @订单序号串# = ""; */
    set v_order_id_str = "";

    /* set @撤单序号串# = ""; */
    set v_wtdraw_id_str = "";

    /* if @是否撤单#=《是否撤单-是》 then */
    if v_is_withdraw=1 then
        #采用循环更新获取订单的方式，避免加锁时间长和并发问题

        /* set @记录序号# = 0; */
        set v_row_id = 0;
        loop_label:loop

            /* [事务开始] */
            START TRANSACTION;


            /* 调用【原子_交易证券_交易_锁定获取指令订单】*/
            call db_tdsecu.pra_tdsetd_LockGetCommOrder(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_comm_id,
                v_row_id,
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
                v_target_code_no,
                v_trade_code_no,
                v_stock_type,
                v_asset_type,
                v_comm_opor,
                v_external_no,
                v_report_date,
                v_report_time,
                v_report_no,
                v_order_batch_no,
                v_order_id,
                v_order_date,
                v_order_time,
                v_order_dir,
                v_price_type,
                v_order_price,
                v_order_qty,
                v_order_status,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_all_fee,
                v_wtdraw_qty,
                v_strike_amt,
                v_strike_qty,
                v_impawn_ratio,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_order_oper_way,
                v_busi_opor_no,
                v_target_stock_code_no,
                v_trade_acco);

            /* if @错误编码#="0" then */
            if v_error_code="0" then

                /* set @记录序号# = @订单序号#; */
                set v_row_id = v_order_id;

                /* set @撤单批号# = 0; */
                set v_wtdraw_batch_no = 0;

                /* set @撤单说明# = "指令分发撤销指令订单！"; */
                set v_wtdraw_remark = "指令分发撤销指令订单！";

                /* 调用【原子_交易证券_指令_撤销指令订单】*/
                call db_tdsecu.pra_tdseap_CancelCommOrder(
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
                    v_out_acco,
                    v_exch_crncy_type,
                    v_exch_no,
                    v_stock_acco_no,
                    v_stock_acco,
                    v_stock_code_no,
                    v_stock_code,
                    v_target_code_no,
                    v_trade_code_no,
                    v_stock_type,
                    v_asset_type,
                    v_comm_id,
                    v_external_no,
                    v_order_batch_no,
                    v_order_date,
                    v_report_no,
                    v_order_id,
                    v_order_dir,
                    v_order_price,
                    v_order_qty,
                    v_order_status,
                    v_order_frozen_amt,
                    v_order_frozen_qty,
                    v_impawn_ratio,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_wtdraw_batch_no,
                    v_wtdraw_remark,
                    v_order_oper_way,
                    v_busi_opor_no,
                    v_is_record_jour,
                    v_target_stock_code_no,
                    v_trade_acco,
                    v_error_code,
                    v_error_info,
                    v_frozen_amt,
                    v_wtdraw_status,
                    v_wtdraw_qty,
                    v_wtdraw_id);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.5.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销指令订单出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @订单序号串# = concat(@订单序号串#,@订单序号#,";"); */
                set v_order_id_str = concat(v_order_id_str,v_order_id,";");

                /* if @撤单序号# > 0 and @撤单状态# <> 《撤单状态-成功》 then */
                if v_wtdraw_id > 0 and v_wtdraw_status <> "3" then

                    /* set @撤单序号串# = concat(@撤单序号串#,@撤单序号#,";"); */
                    set v_wtdraw_id_str = concat(v_wtdraw_id_str,v_wtdraw_id,";");
                end if;
            else

                /* set @错误编码#="0"; */
                set v_error_code="0";

                /* set @错误信息#=' '; */
                set v_error_info=' ';
                ROLLBACK;
                leave loop_label;
            end if;

            /* [事务结束] */
            COMMIT;

            #处理汇总订单

            /* [事务开始] */
            START TRANSACTION;


                /* if @撤单数量# > 0 then */
                if v_wtdraw_qty > 0 then

                    /* set @废单数量# = 0; */
                    set v_waste_qty = 0;

                    /* 调用【原子_交易证券_交易_撤单处理汇总订单】*/
                    call db_tdsecu.pra_tdsetd_CancelDealSumOrder(
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
                        v_order_date,
                        v_order_batch_no,
                        v_wtdraw_qty,
                        v_waste_qty,
                        v_order_oper_way,
                        v_error_code,
                        v_error_info);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.3.5.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤单处理汇总订单出现错误！',v_mysql_message);
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

        end loop;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_comm_date = v_comm_date;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_dir = v_comm_dir;
    SET p_comm_status = v_comm_status;
    SET p_strike_status = v_strike_status;
    SET p_comm_qty = v_comm_qty;
    SET p_order_qty = v_order_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_comm_cancel_qty = v_comm_cancel_qty;
    SET p_before_comm_executor = v_before_comm_executor;
    SET p_order_id_str = v_order_id_str;
    SET p_wtdraw_id_str = v_wtdraw_id_str;
    SET p_target_code_no = v_target_code_no;
    SET p_trade_code_no = v_trade_code_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_新增篮子批量指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_AddBasketBatchComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_AddBasketBatchComm(
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
    IN p_out_acco varchar(32),
    IN p_crncy_type_str varchar(2048),
    IN p_exch_crncy_type_str varchar(2048),
    IN p_buy_ref_rate_str varchar(2048),
    IN p_sell_ref_rate_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no_str varchar(4096),
    IN p_stock_acco_str varchar(2048),
    IN p_stock_code_no_str varchar(4096),
    IN p_stock_code_str varchar(4096),
    IN p_target_code_no_str varchar(4096),
    IN p_trade_code_no_str varchar(4096),
    IN p_stock_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
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
    IN p_exgp_avail_qty_str varchar(4096),
    IN p_exgp_target_code_avail_qty_str varchar(4096),
    IN p_exgp_trade_code_avail_qty_str varchar(4096),
    IN p_asac_avail_qty_str varchar(4096),
    IN p_asac_target_code_avail_qty_str varchar(4096),
    IN p_asac_trade_code_avail_qty_str varchar(4096),
    IN p_exgp_busi_config_str varchar(64),
    IN p_asac_busi_config_str varchar(64),
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_batch_no int,
    IN p_comm_dir_str varchar(2048),
    IN p_limit_price_str varchar(4096),
    IN p_limit_actual_price_str varchar(4096),
    IN p_comm_qty_str varchar(4096),
    IN p_comm_amt_str varchar(4096),
    IN p_comm_begin_date int,
    IN p_comm_end_date int,
    IN p_comm_begin_time int,
    IN p_comm_end_time int,
    IN p_comm_appr_oper int,
    IN p_all_fee_str varchar(4096),
    IN p_up_limit_price_str varchar(4096),
    IN p_down_limit_price_str varchar(4096),
    IN p_last_price_str varchar(4096),
    IN p_nav_asset decimal(18,4),
    IN p_net_price_flag_str varchar(2048),
    IN p_par_value_str varchar(4096),
    IN p_impawn_ratio_str varchar(4096),
    IN p_intrst_days_str varchar(2048),
    IN p_bond_accr_intrst_str varchar(4096),
    IN p_bond_rate_type_str varchar(4096),
    IN p_capit_reback_days_str varchar(2048),
    IN p_posi_reback_days_str varchar(2048),
    IN p_basket_id bigint,
    IN p_comm_oper_way varchar(2),
    IN p_exter_comm_flag int,
    IN p_split_str varchar(4),
    IN p_cost_calc_type int,
    IN p_comm_no_limit_price_ratio decimal(18,12),
    IN p_compli_trig_id bigint,
    IN p_pre_close_price_str varchar(4096),
    IN p_subscription_trade_mark_str varchar(4096),
    IN p_purchase_trade_mark_str varchar(4096),
    IN p_rede_trade_mark_str varchar(4096),
    IN p_first_minimum_amt_str varchar(4096),
    IN p_minimum_purchase_amt_str varchar(4096),
    IN p_minimum_subscription_amt_str varchar(4096),
    IN p_minimum_rede_share_str varchar(4096),
    IN p_minimum_holding_share_str varchar(4096),
    IN p_record_count int,
    IN p_comm_remark_info varchar(1024),
    IN p_last_login_ip varchar(32),
    IN p_last_login_mac varchar(32),
    IN p_last_login_date int,
    IN p_last_oper_info varchar(255),
    IN p_online_status int,
    IN p_sys_config_str varchar(64),
    IN p_asset_acco_type int,
    IN p_co_busi_config_str varchar(64),
    IN p_online_opor_no_str varchar(2048),
    IN p_acco_concat_info varchar(4096),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_date int,
    OUT p_comm_id_str varchar(2048),
    OUT p_comm_appr_status_str varchar(2048),
    OUT p_order_id_str varchar(2048)
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
    declare v_out_acco varchar(32);
    declare v_crncy_type_str varchar(2048);
    declare v_exch_crncy_type_str varchar(2048);
    declare v_buy_ref_rate_str varchar(2048);
    declare v_sell_ref_rate_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no_str varchar(4096);
    declare v_stock_acco_str varchar(2048);
    declare v_stock_code_no_str varchar(4096);
    declare v_stock_code_str varchar(4096);
    declare v_target_code_no_str varchar(4096);
    declare v_trade_code_no_str varchar(4096);
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
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
    declare v_exgp_avail_qty_str varchar(4096);
    declare v_exgp_target_code_avail_qty_str varchar(4096);
    declare v_exgp_trade_code_avail_qty_str varchar(4096);
    declare v_asac_avail_qty_str varchar(4096);
    declare v_asac_target_code_avail_qty_str varchar(4096);
    declare v_asac_trade_code_avail_qty_str varchar(4096);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_batch_no int;
    declare v_comm_dir_str varchar(2048);
    declare v_limit_price_str varchar(4096);
    declare v_limit_actual_price_str varchar(4096);
    declare v_comm_qty_str varchar(4096);
    declare v_comm_amt_str varchar(4096);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_appr_oper int;
    declare v_all_fee_str varchar(4096);
    declare v_up_limit_price_str varchar(4096);
    declare v_down_limit_price_str varchar(4096);
    declare v_last_price_str varchar(4096);
    declare v_nav_asset decimal(18,4);
    declare v_net_price_flag_str varchar(2048);
    declare v_par_value_str varchar(4096);
    declare v_impawn_ratio_str varchar(4096);
    declare v_intrst_days_str varchar(2048);
    declare v_bond_accr_intrst_str varchar(4096);
    declare v_bond_rate_type_str varchar(4096);
    declare v_capit_reback_days_str varchar(2048);
    declare v_posi_reback_days_str varchar(2048);
    declare v_basket_id bigint;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_split_str varchar(4);
    declare v_cost_calc_type int;
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_compli_trig_id bigint;
    declare v_pre_close_price_str varchar(4096);
    declare v_subscription_trade_mark_str varchar(4096);
    declare v_purchase_trade_mark_str varchar(4096);
    declare v_rede_trade_mark_str varchar(4096);
    declare v_first_minimum_amt_str varchar(4096);
    declare v_minimum_purchase_amt_str varchar(4096);
    declare v_minimum_subscription_amt_str varchar(4096);
    declare v_minimum_rede_share_str varchar(4096);
    declare v_minimum_holding_share_str varchar(4096);
    declare v_record_count int;
    declare v_comm_remark_info varchar(1024);
    declare v_last_login_ip varchar(32);
    declare v_last_login_mac varchar(32);
    declare v_last_login_date int;
    declare v_last_oper_info varchar(255);
    declare v_online_status int;
    declare v_sys_config_str varchar(64);
    declare v_asset_acco_type int;
    declare v_co_busi_config_str varchar(64);
    declare v_online_opor_no_str varchar(2048);
    declare v_acco_concat_info varchar(4096);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_date int;
    declare v_comm_id_str varchar(2048);
    declare v_comm_appr_status_str varchar(2048);
    declare v_order_id_str varchar(2048);
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_avail_cal_flag int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_contra_no varchar(32);
    declare v_order_batch_no int;
    declare v_comm_appr_set int;
    declare v_exist_debt_flag int;
    declare v_disp_opor int;
    declare v_disp_status int;
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_order_status varchar(2);
    declare v_pass_status varchar(2);
    declare v_before_comm_executor int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_stock_acco varchar(16);
    declare v_stock_acco_no int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_net_price_flag int;
    declare v_impawn_ratio decimal(18,12);
    declare v_stock_type int;
    declare v_par_value decimal(16,9);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_bond_rate_type int;
    declare v_intrst_days int;
    declare v_all_fee decimal(18,4);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_exgp_avail_qty decimal(18,2);
    declare v_exgp_target_code_avail_qty decimal(18,2);
    declare v_exgp_trade_code_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_asac_target_code_avail_qty decimal(18,2);
    declare v_asac_trade_code_avail_qty decimal(18,2);
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_limit_actual_price decimal(16,9);
    declare v_calc_dir int;
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_combo_code varchar(32);
    declare v_deal_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_order_dir int;
    declare v_comm_appr_status varchar(2);
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_workflow_type int;
    declare v_comm_id bigint;
    declare v_comm_status varchar(2);
    declare v_strike_status varchar(2);
    declare v_comm_comple_flag int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_tmp_comm_occur_amt decimal(18,4);
    declare v_tmp_comm_occur_qty decimal(18,2);
    declare v_comm_appr_remark varchar(255);
    declare v_comm_appr_oper_no int;
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_tmp_oper_ip_addr varchar(32);
    declare v_tmp_oper_mac varchar(32);
    declare v_tmp_oper_info varchar(1024);
    declare v_tmp_opor_no int;
    declare v_curr_opor_no int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_auto_comm_executor int;
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_order_oper_way varchar(2);
    declare v_combo_posi_id bigint;
    declare v_order_id bigint;
    declare v_order_time int;
    declare v_update_times int;
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_busi_opor_no int;
    declare v_open_posi_date int;

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
    SET v_out_acco = p_out_acco;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_exch_crncy_type_str = p_exch_crncy_type_str;
    SET v_buy_ref_rate_str = p_buy_ref_rate_str;
    SET v_sell_ref_rate_str = p_sell_ref_rate_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no_str = p_stock_acco_no_str;
    SET v_stock_acco_str = p_stock_acco_str;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_stock_code_str = p_stock_code_str;
    SET v_target_code_no_str = p_target_code_no_str;
    SET v_trade_code_no_str = p_trade_code_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_asset_type_str = p_asset_type_str;
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
    SET v_exgp_avail_qty_str = p_exgp_avail_qty_str;
    SET v_exgp_target_code_avail_qty_str = p_exgp_target_code_avail_qty_str;
    SET v_exgp_trade_code_avail_qty_str = p_exgp_trade_code_avail_qty_str;
    SET v_asac_avail_qty_str = p_asac_avail_qty_str;
    SET v_asac_target_code_avail_qty_str = p_asac_target_code_avail_qty_str;
    SET v_asac_trade_code_avail_qty_str = p_asac_trade_code_avail_qty_str;
    SET v_exgp_busi_config_str = p_exgp_busi_config_str;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_limit_price_str = p_limit_price_str;
    SET v_limit_actual_price_str = p_limit_actual_price_str;
    SET v_comm_qty_str = p_comm_qty_str;
    SET v_comm_amt_str = p_comm_amt_str;
    SET v_comm_begin_date = p_comm_begin_date;
    SET v_comm_end_date = p_comm_end_date;
    SET v_comm_begin_time = p_comm_begin_time;
    SET v_comm_end_time = p_comm_end_time;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_all_fee_str = p_all_fee_str;
    SET v_up_limit_price_str = p_up_limit_price_str;
    SET v_down_limit_price_str = p_down_limit_price_str;
    SET v_last_price_str = p_last_price_str;
    SET v_nav_asset = p_nav_asset;
    SET v_net_price_flag_str = p_net_price_flag_str;
    SET v_par_value_str = p_par_value_str;
    SET v_impawn_ratio_str = p_impawn_ratio_str;
    SET v_intrst_days_str = p_intrst_days_str;
    SET v_bond_accr_intrst_str = p_bond_accr_intrst_str;
    SET v_bond_rate_type_str = p_bond_rate_type_str;
    SET v_capit_reback_days_str = p_capit_reback_days_str;
    SET v_posi_reback_days_str = p_posi_reback_days_str;
    SET v_basket_id = p_basket_id;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_split_str = p_split_str;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_comm_no_limit_price_ratio = p_comm_no_limit_price_ratio;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_pre_close_price_str = p_pre_close_price_str;
    SET v_subscription_trade_mark_str = p_subscription_trade_mark_str;
    SET v_purchase_trade_mark_str = p_purchase_trade_mark_str;
    SET v_rede_trade_mark_str = p_rede_trade_mark_str;
    SET v_first_minimum_amt_str = p_first_minimum_amt_str;
    SET v_minimum_purchase_amt_str = p_minimum_purchase_amt_str;
    SET v_minimum_subscription_amt_str = p_minimum_subscription_amt_str;
    SET v_minimum_rede_share_str = p_minimum_rede_share_str;
    SET v_minimum_holding_share_str = p_minimum_holding_share_str;
    SET v_record_count = p_record_count;
    SET v_comm_remark_info = p_comm_remark_info;
    SET v_last_login_ip = p_last_login_ip;
    SET v_last_login_mac = p_last_login_mac;
    SET v_last_login_date = p_last_login_date;
    SET v_last_oper_info = p_last_oper_info;
    SET v_online_status = p_online_status;
    SET v_sys_config_str = p_sys_config_str;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_online_opor_no_str = p_online_opor_no_str;
    SET v_acco_concat_info = p_acco_concat_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_id_str = " ";
    SET v_comm_appr_status_str = " ";
    SET v_order_id_str = " ";
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_avail_cal_flag = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_contra_no = " ";
    SET v_order_batch_no = 0;
    SET v_comm_appr_set = 0;
    SET v_exist_debt_flag = 0;
    SET v_disp_opor = 0;
    SET v_disp_status = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_order_status = "0";
    SET v_pass_status = "0";
    SET v_before_comm_executor = 0;
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_exch_no = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_stock_acco = " ";
    SET v_stock_acco_no = 0;
    SET v_bond_accr_intrst = 0;
    SET v_net_price_flag = 0;
    SET v_impawn_ratio = 0;
    SET v_stock_type = 0;
    SET v_par_value = 0;
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_bond_rate_type = 0;
    SET v_intrst_days = 0;
    SET v_all_fee = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_pre_close_price = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_exgp_avail_qty = 0;
    SET v_exgp_target_code_avail_qty = 0;
    SET v_exgp_trade_code_avail_qty = 0;
    SET v_asac_avail_qty = 0;
    SET v_asac_target_code_avail_qty = 0;
    SET v_asac_trade_code_avail_qty = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_limit_actual_price = 0;
    SET v_calc_dir = 1;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_combo_code = " ";
    SET v_deal_flag = 0;
    SET v_occur_amt = 0;
    SET v_occur_qty = 0;
    SET v_order_dir = 0;
    SET v_comm_appr_status = " ";
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_workflow_type = 0;
    SET v_comm_id = 0;
    SET v_comm_status = "0";
    SET v_strike_status = "0";
    SET v_comm_comple_flag = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_tmp_comm_occur_amt = 0;
    SET v_tmp_comm_occur_qty = 0;
    SET v_comm_appr_remark = " ";
    SET v_comm_appr_oper_no = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_tmp_oper_ip_addr = " ";
    SET v_tmp_oper_mac = " ";
    SET v_tmp_oper_info = " ";
    SET v_tmp_opor_no = 0;
    SET v_curr_opor_no = 0;
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_auto_comm_executor = 0;
    SET v_external_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_remark_info = " ";
    SET v_order_oper_way = " ";
    SET v_combo_posi_id = 0;
    SET v_order_id = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_busi_opor_no = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @指令日期# = @初始化日期#; */
    set v_comm_date = v_init_date;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;

    /* set @可用计算标志# = 0; */
    set v_avail_cal_flag = 0;

    /* set @登记机构# =""; */
    set v_registration_agency ="";

    /* set @交易账户# = ""; */
    set v_trade_acco = "";

    /* set @合同编号# = ""; */
    set v_contra_no = "";

    /* set @订单批号#=0; */
    set v_order_batch_no=0;

    /* set @指令审批设置# = substring(@资产账户业务控制配置串#,5,1); */
    set v_comm_appr_set = substring(v_asac_busi_config_str,5,1);

    /* set @存在负债标志# = 《存在负债标志-不存在》; */
    set v_exist_debt_flag = 1;

    /* set @分发操作员# = 0 ; */
    set v_disp_opor = 0 ;

    /* set @分发状态# = 《分发状态-待分发》; */
    set v_disp_status = 3;

    /* if @指令执行人#<>0 then */
    if v_comm_executor<>0 then

        /* set @分发状态# = 《分发状态-分发通过》; */
        set v_disp_status = 1;
    else

        /* set @分发状态# = 《分发状态-待分发》; */
        set v_disp_status = 3;
    end if;
     #PB系统自动审批获取审批操作员登录信息，审批操作员不在线状态下不能自动审批

    /* if   @指令审批设置#=《指令审批设置-自动审批》 and substring(@系统控制配置串#,7,1) = 《系统类型-PB系统》  then */
    if   v_comm_appr_set=1 and substring(v_sys_config_str,7,1) = 1  then

        /* if @在线状态# <>《在线状态-在线》 then */
        if v_online_status <>1 then

            /* set  @指令审批设置# = 《指令审批设置-手工审批》; */
            set  v_comm_appr_set = 2;
        end if;
    end if;

    /* if @指令审批设置#=《指令审批设置-自动审批》 and substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 then */
    if v_comm_appr_set=1 and substring(v_asac_busi_config_str,6,1)=1 then

        /* set @编号类型#=《编号类型-订单批号》; */
        set v_record_no_type=18;

        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_交易证券_公用_获取业务记录编号】*/
            call db_tdsecu.pra_tdsepb_GetCoBusiRecordNo(
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
                SET v_error_code = "tdsecuT.3.6.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


        /* [事务结束] */
        COMMIT;


        /* set @订单批号#=@当前编号#; */
        set v_order_batch_no=v_curr_no;
        #根据报盘机状态，设置订单状态 如果通道是允许报送状态,则直接将订单状态设为"待报"

        /* set @订单状态# = 《订单状态-未报》; */
        set v_order_status = "1";

        /* 调用【原子_交易证券_公用_获取通道状态】*/
        call db_tdsecu.pra_tdsepb_GetChannelStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pass_no,
            v_error_code,
            v_error_info,
            v_pass_status);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取通道状态出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* if @通道状态# = "1" then */
        if v_pass_status = "1" then

            /* set @订单状态# = 《订单状态-待报》; */
            set v_order_status = "a";
        end if;
    end if;
    #篮子指令不传批号，自己获取

    /* if @指令批号# = 0 then */
    if v_comm_batch_no = 0 then

        /* set @编号类型#=《编号类型-指令批号》; */
        set v_record_no_type=17;

        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_交易证券_公用_获取业务记录编号】*/
            call db_tdsecu.pra_tdsepb_GetCoBusiRecordNo(
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
                SET v_error_code = "tdsecuT.3.6.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


        /* [事务结束] */
        COMMIT;


        /* set @指令批号#=@当前编号#; */
        set v_comm_batch_no=v_curr_no;
    end if;

    /* set @指令序号串# = ""; */
    set v_comm_id_str = "";

    /* set @指令审批状态串# = ""; */
    set v_comm_appr_status_str = "";

    /* set @订单序号串# = ""; */
    set v_order_id_str = "";

    /* set @前指令执行人# = 0; */
    set v_before_comm_executor = 0;

    /* while LOCATE(@分隔符#,@证券代码串#)<>0   do */
    while LOCATE(v_split_str,v_stock_code_str)<>0   do

    /* [事务开始] */
    START TRANSACTION;

    #截取前面每一位

        /* set @证券代码#=substring(@证券代码串#,1,LOCATE(@分隔符#,@证券代码串#)-1); */
        set v_stock_code=substring(v_stock_code_str,1,LOCATE(v_split_str,v_stock_code_str)-1);

        /* set @证券代码编号#=cast(substring(@证券代码编号串#,1,LOCATE(@分隔符#,@证券代码编号串#)-1) as SIGNED); */
        set v_stock_code_no=cast(substring(v_stock_code_no_str,1,LOCATE(v_split_str,v_stock_code_no_str)-1) as SIGNED);

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

        /* set @指令方向#=cast(substring(@指令方向串#,1,LOCATE(@分隔符#,@指令方向串#)-1) as SIGNED); */
        set v_comm_dir=cast(substring(v_comm_dir_str,1,LOCATE(v_split_str,v_comm_dir_str)-1) as SIGNED);

        /* set @指令限价#=cast(substring(@指令限价串#,1,LOCATE(@分隔符#,@指令限价串#)-1) as decimal(16,9)); */
        set v_comm_limit_price=cast(substring(v_limit_price_str,1,LOCATE(v_split_str,v_limit_price_str)-1) as decimal(16,9));

        /* set @指令数量#=cast(substring(@指令数量串#,1,LOCATE(@分隔符#,@指令数量串#)-1) as decimal(18,2)); */
        set v_comm_qty=cast(substring(v_comm_qty_str,1,LOCATE(v_split_str,v_comm_qty_str)-1) as decimal(18,2));

        /* set @指令金额#=cast(substring(@指令金额串#,1,LOCATE(@分隔符#,@指令金额串#)-1) as decimal(32,4)); */
        set v_comm_amt=cast(substring(v_comm_amt_str,1,LOCATE(v_split_str,v_comm_amt_str)-1) as decimal(32,4));

        /* set @股东代码#=substring(@股东代码串#,1,LOCATE(@分隔符#,@股东代码串#)-1); */
        set v_stock_acco=substring(v_stock_acco_str,1,LOCATE(v_split_str,v_stock_acco_str)-1);

        /* set @股东代码编号#=cast(substring(@股东代码编号串#,1,LOCATE(@分隔符#,@股东代码编号串#)-1) as SIGNED); */
        set v_stock_acco_no=cast(substring(v_stock_acco_no_str,1,LOCATE(v_split_str,v_stock_acco_no_str)-1) as SIGNED);

        /* set @债券计提利息#=cast(substring(@债券计提利息串#,1,LOCATE(@分隔符#,@债券计提利息串#)-1) as decimal(18,12)); */
        set v_bond_accr_intrst=cast(substring(v_bond_accr_intrst_str,1,LOCATE(v_split_str,v_bond_accr_intrst_str)-1) as decimal(18,12));

        /* set @净价标志#=substring(@净价标志串#,1,LOCATE(@分隔符#,@净价标志串#)-1); */
        set v_net_price_flag=substring(v_net_price_flag_str,1,LOCATE(v_split_str,v_net_price_flag_str)-1);

        /* set @质押比例#=cast(substring(@质押比例串#,1,LOCATE(@分隔符#,@质押比例串#)-1) as decimal(18,12)); */
        set v_impawn_ratio=cast(substring(v_impawn_ratio_str,1,LOCATE(v_split_str,v_impawn_ratio_str)-1) as decimal(18,12));

        /* set @证券类型#=cast(substring(@证券类型串#,1,LOCATE(@分隔符#,@证券类型串#)-1) as SIGNED); */
        set v_stock_type=cast(substring(v_stock_type_str,1,LOCATE(v_split_str,v_stock_type_str)-1) as SIGNED);

        /* set @票面面值#=cast(substring(@票面面值串#,1,LOCATE(@分隔符#,@票面面值串#)-1) as decimal(16,9)); */
        set v_par_value=cast(substring(v_par_value_str,1,LOCATE(v_split_str,v_par_value_str)-1) as decimal(16,9));

        /* set @标的代码编号#=cast(substring(@标的代码编号串#,1,LOCATE(@分隔符#,@标的代码编号串#)-1) as SIGNED); */
        set v_target_code_no=cast(substring(v_target_code_no_str,1,LOCATE(v_split_str,v_target_code_no_str)-1) as SIGNED);

        /* set @交易代码编号#=cast(substring(@交易代码编号串#,1,LOCATE(@分隔符#,@交易代码编号串#)-1) as SIGNED); */
        set v_trade_code_no=cast(substring(v_trade_code_no_str,1,LOCATE(v_split_str,v_trade_code_no_str)-1) as SIGNED);

        /* set @资产类型#=cast(substring(@资产类型串#,1,LOCATE(@分隔符#,@资产类型串#)-1) as SIGNED); */
        set v_asset_type=cast(substring(v_asset_type_str,1,LOCATE(v_split_str,v_asset_type_str)-1) as SIGNED);

        /* set @本币币种#=substring(@本币币种串#,1,LOCATE(@分隔符#,@本币币种串#)-1); */
        set v_crncy_type=substring(v_crncy_type_str,1,LOCATE(v_split_str,v_crncy_type_str)-1);

        /* set @交易币种#=substring(@交易币种串#,1,LOCATE(@分隔符#,@交易币种串#)-1); */
        set v_exch_crncy_type=substring(v_exch_crncy_type_str,1,LOCATE(v_split_str,v_exch_crncy_type_str)-1);

        /* set @买入参考汇率#=cast(substring(@买入参考汇率串#,1,LOCATE(@分隔符#,@买入参考汇率串#)-1) as decimal(18,12)); */
        set v_buy_ref_rate=cast(substring(v_buy_ref_rate_str,1,LOCATE(v_split_str,v_buy_ref_rate_str)-1) as decimal(18,12));

        /* set @卖出参考汇率#=cast(substring(@卖出参考汇率串#,1,LOCATE(@分隔符#,@卖出参考汇率串#)-1) as decimal(18,12)); */
        set v_sell_ref_rate=cast(substring(v_sell_ref_rate_str,1,LOCATE(v_split_str,v_sell_ref_rate_str)-1) as decimal(18,12));

        /* set @债券利率类型#=cast(substring(@债券利率类型串#,1,LOCATE(@分隔符#,@债券利率类型串#)-1) as SIGNED); */
        set v_bond_rate_type=cast(substring(v_bond_rate_type_str,1,LOCATE(v_split_str,v_bond_rate_type_str)-1) as SIGNED);

        /* set @计息天数#=cast(substring(@计息天数串#,1,LOCATE(@分隔符#,@计息天数串#)-1) as SIGNED); */
        set v_intrst_days=cast(substring(v_intrst_days_str,1,LOCATE(v_split_str,v_intrst_days_str)-1) as SIGNED);

        /* set @全部费用#=cast(substring(@全部费用串#,1,LOCATE(@分隔符#,@全部费用串#)-1) as decimal(32,6)); */
        set v_all_fee=cast(substring(v_all_fee_str,1,LOCATE(v_split_str,v_all_fee_str)-1) as decimal(32,6));

        /* set @涨停价#=cast(substring(@涨停价串#,1,LOCATE(@分隔符#,@涨停价串#)-1) as decimal(16,9)); */
        set v_up_limit_price=cast(substring(v_up_limit_price_str,1,LOCATE(v_split_str,v_up_limit_price_str)-1) as decimal(16,9));

        /* set @跌停价#=cast(substring(@跌停价串#,1,LOCATE(@分隔符#,@跌停价串#)-1) as decimal(16,9)); */
        set v_down_limit_price=cast(substring(v_down_limit_price_str,1,LOCATE(v_split_str,v_down_limit_price_str)-1) as decimal(16,9));

        /* set @最新价#=cast(substring(@最新价串#,1,LOCATE(@分隔符#,@最新价串#)-1) as decimal(16,9)); */
        set v_last_price=cast(substring(v_last_price_str,1,LOCATE(v_split_str,v_last_price_str)-1) as decimal(16,9));

        /* set @昨收盘价#=cast(substring(@昨收盘价串#,1,LOCATE(@分隔符#,@昨收盘价串#)-1) as decimal(16,9)); */
        set v_pre_close_price=cast(substring(v_pre_close_price_str,1,LOCATE(v_split_str,v_pre_close_price_str)-1) as decimal(16,9));

        /* set @资金回转天数#=cast(substring(@资金回转天数串#,1,LOCATE(@分隔符#,@资金回转天数串#)-1) as SIGNED); */
        set v_capit_reback_days=cast(substring(v_capit_reback_days_str,1,LOCATE(v_split_str,v_capit_reback_days_str)-1) as SIGNED);

        /* set @持仓回转天数#=cast(substring(@持仓回转天数串#,1,LOCATE(@分隔符#,@持仓回转天数串#)-1) as SIGNED); */
        set v_posi_reback_days=cast(substring(v_posi_reback_days_str,1,LOCATE(v_split_str,v_posi_reback_days_str)-1) as SIGNED);

        /* set @交易组可用数量# = cast(substring(@交易组可用数量串#,1,LOCATE(@分隔符#,@交易组可用数量串#)-1) as decimal(18,2)); */
        set v_exgp_avail_qty = cast(substring(v_exgp_avail_qty_str,1,LOCATE(v_split_str,v_exgp_avail_qty_str)-1) as decimal(18,2));

        /* set @交易组标的代码可用数量# = cast(substring(@交易组标的代码可用数量串#,1,LOCATE(@分隔符#,@交易组标的代码可用数量串#)-1) as decimal(18,2)); */
        set v_exgp_target_code_avail_qty = cast(substring(v_exgp_target_code_avail_qty_str,1,LOCATE(v_split_str,v_exgp_target_code_avail_qty_str)-1) as decimal(18,2));

        /* set @交易组交易代码可用数量# = cast(substring(@交易组交易代码可用数量串#,1,LOCATE(@分隔符#,@交易组交易代码可用数量串#)-1) as decimal(18,2)); */
        set v_exgp_trade_code_avail_qty = cast(substring(v_exgp_trade_code_avail_qty_str,1,LOCATE(v_split_str,v_exgp_trade_code_avail_qty_str)-1) as decimal(18,2));

        /* set @资产账户可用数量# = cast(substring(@资产账户可用数量串#,1,LOCATE(@分隔符#,@资产账户可用数量串#)-1) as decimal(18,2)); */
        set v_asac_avail_qty = cast(substring(v_asac_avail_qty_str,1,LOCATE(v_split_str,v_asac_avail_qty_str)-1) as decimal(18,2));

        /* set @资产账户标的代码可用数量# = cast(substring(@资产账户标的代码可用数量串#,1,LOCATE(@分隔符#,@资产账户标的代码可用数量串#)-1) as decimal(18,2)); */
        set v_asac_target_code_avail_qty = cast(substring(v_asac_target_code_avail_qty_str,1,LOCATE(v_split_str,v_asac_target_code_avail_qty_str)-1) as decimal(18,2));

        /* set @资产账户交易代码可用数量# = cast(substring(@资产账户交易代码可用数量串#,1,LOCATE(@分隔符#,@资产账户交易代码可用数量串#)-1) as decimal(18,2)); */
        set v_asac_trade_code_avail_qty = cast(substring(v_asac_trade_code_avail_qty_str,1,LOCATE(v_split_str,v_asac_trade_code_avail_qty_str)-1) as decimal(18,2));

        /* set @认购交易标志#=cast(substring(@认购交易标志串#,1,LOCATE(@分隔符#,@认购交易标志串#)-1) as SIGNED); */
        set v_subscription_trade_mark=cast(substring(v_subscription_trade_mark_str,1,LOCATE(v_split_str,v_subscription_trade_mark_str)-1) as SIGNED);

        /* set @申购交易标志#=cast(substring(@申购交易标志串#,1,LOCATE(@分隔符#,@申购交易标志串#)-1) as SIGNED); */
        set v_purchase_trade_mark=cast(substring(v_purchase_trade_mark_str,1,LOCATE(v_split_str,v_purchase_trade_mark_str)-1) as SIGNED);

        /* set @赎回交易标志#=cast(substring(@赎回交易标志串#,1,LOCATE(@分隔符#,@赎回交易标志串#)-1) as SIGNED); */
        set v_rede_trade_mark=cast(substring(v_rede_trade_mark_str,1,LOCATE(v_split_str,v_rede_trade_mark_str)-1) as SIGNED);

        /* set @首次最低金额#=cast(substring(@首次最低金额串#,1,LOCATE(@分隔符#,@首次最低金额串#)-1) as decimal(32,4)); */
        set v_first_minimum_amt=cast(substring(v_first_minimum_amt_str,1,LOCATE(v_split_str,v_first_minimum_amt_str)-1) as decimal(32,4));

        /* set @最低申购金额#=cast(substring(@最低申购金额串#,1,LOCATE(@分隔符#,@最低申购金额串#)-1) as decimal(32,4)); */
        set v_minimum_purchase_amt=cast(substring(v_minimum_purchase_amt_str,1,LOCATE(v_split_str,v_minimum_purchase_amt_str)-1) as decimal(32,4));

        /* set @最低认购金额#=cast(substring(@最低认购金额串#,1,LOCATE(@分隔符#,@最低认购金额串#)-1) as decimal(32,4)); */
        set v_minimum_subscription_amt=cast(substring(v_minimum_subscription_amt_str,1,LOCATE(v_split_str,v_minimum_subscription_amt_str)-1) as decimal(32,4));

        /* set @最低赎回份额#=cast(substring(@最低赎回份额串#,1,LOCATE(@分隔符#,@最低赎回份额串#)-1) as decimal(18,2)); */
        set v_minimum_rede_share=cast(substring(v_minimum_rede_share_str,1,LOCATE(v_split_str,v_minimum_rede_share_str)-1) as decimal(18,2));

        /* set @最低持有份额#=cast(substring(@最低持有份额串#,1,LOCATE(@分隔符#,@最低持有份额串#)-1) as decimal(18,2)); */
        set v_minimum_holding_share=cast(substring(v_minimum_holding_share_str,1,LOCATE(v_split_str,v_minimum_holding_share_str)-1) as decimal(18,2));

        /* if @市场编号# = 《市场编号-沪港通证券交易所》 and substring(@资产账户业务控制配置串#,15,1) <> 《沪港通交易方式-体内》 then */
        if v_exch_no = 3 and substring(v_asac_busi_config_str,15,1) <> 1 then

            /* set @体外指令标志# = 《体外指令标志-体外》; */
            set v_exter_comm_flag = 2;

        /* elseif @市场编号# = 《市场编号-深港通证券交易所》 and substring(@资产账户业务控制配置串#,16,1) <> 《深港通交易方式-体内》 then */
        elseif v_exch_no = 4 and substring(v_asac_busi_config_str,16,1) <> 1 then

            /* set @体外指令标志# = 《体外指令标志-体外》; */
            set v_exter_comm_flag = 2;
        end if;

        /* set @指令实际限价#=0; */
        set v_limit_actual_price=0;

        /* if @指令实际限价串# <> " " then */
        if v_limit_actual_price_str <> " " then

            /* set @指令实际限价#=cast(substring(@指令实际限价串#,1,LOCATE(@分隔符#,@指令实际限价串#)-1) as decimal(16,9)); */
            set v_limit_actual_price=cast(substring(v_limit_actual_price_str,1,LOCATE(v_split_str,v_limit_actual_price_str)-1) as decimal(16,9));
        end if;
        #获取指令实际限价
        #set @指令实际限价#=@指令限价#;

        /* if @指令限价#=0 and @指令实际限价# = 0 then */
        if v_comm_limit_price=0 and v_limit_actual_price = 0 then

            /* if @指令方向# = 《指令方向-买入》 then */
            if v_comm_dir = 1 then

                /* if @最新价# = 0 then */
                if v_last_price = 0 then

                    /* set @指令实际限价#=@昨收盘价# * (1+@指令不限价浮动比例#); */
                    set v_limit_actual_price=v_pre_close_price * (1+v_comm_no_limit_price_ratio);
                else

                    /* set @指令实际限价#=@最新价# * (1+@指令不限价浮动比例#); */
                    set v_limit_actual_price=v_last_price * (1+v_comm_no_limit_price_ratio);
                end if;

                /* if @指令实际限价# > @涨停价# and @涨停价# > 0 then */
                if v_limit_actual_price > v_up_limit_price and v_up_limit_price > 0 then

                     /* set @指令实际限价#=@涨停价#; */
                     set v_limit_actual_price=v_up_limit_price;
                end if;

            /* elseif @指令方向# = 《指令方向-卖出》 then */
            elseif v_comm_dir = 2 then

                /* if @最新价# = 0 then */
                if v_last_price = 0 then

                    /* set @指令实际限价#=@昨收盘价# * (1-@指令不限价浮动比例#); */
                    set v_limit_actual_price=v_pre_close_price * (1-v_comm_no_limit_price_ratio);
                else

                    /* set @指令实际限价#=@最新价# * (1-@指令不限价浮动比例#); */
                    set v_limit_actual_price=v_last_price * (1-v_comm_no_limit_price_ratio);
                end if;

                /* if @指令实际限价# < @跌停价# and @跌停价# > 0 then */
                if v_limit_actual_price < v_down_limit_price and v_down_limit_price > 0 then

                     /* set @指令实际限价#=@跌停价#; */
                     set v_limit_actual_price=v_down_limit_price;
                end if;
            end if;

        /* elseif @指令实际限价# = 0 then */
        elseif v_limit_actual_price = 0 then

            /* set @指令实际限价#=@指令限价#; */
            set v_limit_actual_price=v_comm_limit_price;
        end if;

        /* set @指令金额#= @指令实际限价# * @指令数量#; */
        set v_comm_amt= v_limit_actual_price * v_comm_qty;
        #计算指令冻结金额

        /* set @计算方向# = 《计算方向-加上》; */
        set v_calc_dir = 1;

        /* 调用【原子_交易证券_公用_计算指令冻结金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetCommFrozenAmtAndQty(
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
            v_calc_dir,
            v_error_code,
            v_error_info,
            v_comm_frozen_amt,
            v_comm_frozen_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令冻结金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #交易证券子系统检查，检查指令可用资金、可用持仓等

        /* set @组合代码# = " "; */
        set v_combo_code = " ";

        /* 调用【原子_交易证券_指令_校验新增指令】*/
        call db_tdsecu.pra_tdseap_CheckAddComm(
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
            v_comm_dir,
            v_comm_qty,
            v_comm_frozen_amt,
            v_impawn_ratio,
            v_stock_type,
            v_subscription_trade_mark,
            v_purchase_trade_mark,
            v_rede_trade_mark,
            v_first_minimum_amt,
            v_minimum_purchase_amt,
            v_minimum_subscription_amt,
            v_minimum_rede_share,
            v_minimum_holding_share,
            v_record_count,
            v_combo_code,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_校验新增指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #风控子系统检查，检查指令端风控等

        /* set @处理标志#=《处理标志-已处理》; */
        set v_deal_flag=1;

        /* set @指令下达人#=@操作员编号#; */
        set v_comm_opor=v_opor_no;

        /* set @变动金额#=(@指令实际限价# * @指令数量#); */
        set v_occur_amt=(v_limit_actual_price * v_comm_qty);

        /* set @变动数量#=@指令数量#; */
        set v_occur_qty=v_comm_qty;
        #风控子系统检查，如果自动审批，则检查交易端风控等

        /* if @指令审批设置#=《指令审批设置-自动审批》 and substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 then */
        if v_comm_appr_set=1 and substring(v_asac_busi_config_str,6,1)=1 then

            /* 调用【原子_交易证券_交易_交易端证券业务合规判断】*/
            call db_tdsecu.pra_tdsetd_CheckExchSecuRisk(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_error_code,
                v_error_info,
                v_compli_trig_id);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.6.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_交易端证券业务合规判断出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;
        #如果自动审批，需做相应检查处理，并获取指令批号

        /* set @订单方向# = @指令方向#; */
        set v_order_dir = v_comm_dir;

        /* if @指令审批设置#=《指令审批设置-自动审批》 and substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 and (@订单方向#=《订单方向-新股申购》 or @订单方向#=《订单方向-配售申购》) then */
        if v_comm_appr_set=1 and substring(v_asac_busi_config_str,6,1)=1 and (v_order_dir=11 or v_order_dir=23) then

            /* 调用【原子_交易证券_交易_检查证券申购重复】*/
            call db_tdsecu.pra_tdsetd_CheckPurcDup(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_exch_group_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.6.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_检查证券申购重复出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;
        #新增指令记录

        /* set @指令审批状态#=《指令审批状态-未审批》; */
        set v_comm_appr_status="1";

        /* if substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-不设置》 then */
        if substring(v_asac_busi_config_str,5,1)=3 then

            /* set @指令审批状态#=《指令审批状态-不审批》; */
            set v_comm_appr_status="4";
        end if;

        /* set @组合代码# = " "; */
        set v_combo_code = " ";

        /* set @目标证券代码# = " "; */
        set v_target_stock_code = " ";

        /* set @目标证券代码编号# = 0; */
        set v_target_stock_code_no = 0;

        /* set  @工作流模式# = substring(@资产账户业务控制配置串#,25,1); */
        set  v_workflow_type = substring(v_asac_busi_config_str,25,1);

        /* 调用【原子_交易证券_指令_新增指令】*/
        call db_tdsecu.pra_tdseap_AddComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_comm_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_crncy_type,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_opor,
            v_comm_executor,
            v_comm_batch_no,
            v_comm_dir,
            v_comm_limit_price,
            v_limit_actual_price,
            v_comm_qty,
            v_comm_amt,
            v_comm_frozen_amt,
            v_comm_frozen_qty,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_appr_status,
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_basket_id,
            v_comm_oper_way,
            v_exter_comm_flag,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_combo_code,
            v_target_stock_code,
            v_target_stock_code_no,
            v_comm_remark_info,
            v_workflow_type,
            v_contra_no,
            v_asset_acco_type,
            v_exist_debt_flag,
            v_disp_opor,
            v_disp_status,
            v_acco_concat_info,
            v_error_code,
            v_error_info,
            v_comm_id,
            v_comm_status,
            v_strike_status,
            v_comm_comple_flag);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_新增指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @指令序号串# = concat(@指令序号串#,@指令序号#,";"); */
        set v_comm_id_str = concat(v_comm_id_str,v_comm_id,";");
        #处理资金持仓数据，为保证数据表修改顺序，指令资金持仓更新需放在后边处理，以先处理指令表，再处理订单表，再处理资金持仓表
        #计算指令变动金额和数量

        /* set @计算方向# = 《计算方向-加上》; */
        set v_calc_dir = 1;

        /* 调用【原子_交易证券_公用_计算指令变动金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetCommOccurAmtAndQty(
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
            v_calc_dir,
            v_error_code,
            v_error_info,
            v_comm_occur_amt,
            v_comm_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @临时_指令变动金额# = @指令变动金额#; */
        set v_tmp_comm_occur_amt = v_comm_occur_amt;

        /* set @临时_指令变动数量# = @指令变动数量#; */
        set v_tmp_comm_occur_qty = v_comm_occur_qty;

         /* if @指令审批设置#=《指令审批设置-自动审批》 or @指令审批状态#=《指令审批状态-不审批》 then */
         if v_comm_appr_set=1 or v_comm_appr_status="4" then

            /* if @指令审批设置#=《指令审批设置-自动审批》 then */
            if v_comm_appr_set=1 then
                #审批指令

                /* set @指令审批状态#=《指令审批状态-审批通过》; */
                set v_comm_appr_status="2";

                /* set @指令审批说明#="指令快速审批通过！"; */
                set v_comm_appr_remark="指令快速审批通过！";

                /* set @指令审批操作员序号#=1; */
                set v_comm_appr_oper_no=1;
            end if;

             /* set @订单数量#=0; */
             set v_order_qty=0;

             /* set @指令撤销数量#=0; */
             set v_comm_cancel_qty=0;
               #审批指令用审批员的登录信息

              /* set @临时_操作IP# = @操作IP#; */
              set v_tmp_oper_ip_addr = v_oper_ip_addr;

              /* set @临时_操作MAC# = @操作MAC#; */
              set v_tmp_oper_mac = v_oper_mac;

              /* set @临时_操作信息# = @操作信息#; */
              set v_tmp_oper_info = v_oper_info;

              /* set @临时_操作员编号# = @操作员编号#; */
              set v_tmp_opor_no = v_opor_no;

              /* set @操作IP# = @上次登录IP#; */
              set v_oper_ip_addr = v_last_login_ip;

              /* set @操作MAC# = @上次登录MAC#; */
              set v_oper_mac = v_last_login_mac;

              /* set @操作信息# = @上次操作信息#; */
              set v_oper_info = v_last_oper_info;

              /* set @操作员编号# = @指令审批操作员#; */
              set v_opor_no = v_comm_appr_oper;

              /* set @当前操作员# = @临时_操作员编号#; */
              set v_curr_opor_no = v_tmp_opor_no;

             /* 调用【原子_交易证券_指令_审批指令】*/
             call db_tdsecu.pra_tdseap_ApprComm(
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
                 v_stock_code,
                 v_stock_code_no,
                 v_stock_type,
                 v_asset_type,
                 v_comm_date,
                 v_comm_id,
                 v_comm_opor,
                 v_comm_executor,
                 v_comm_batch_no,
                 v_comm_appr_oper_no,
                 v_comm_appr_oper,
                 v_comm_appr_status,
                 v_comm_appr_remark,
                 v_comm_qty,
                 v_comm_dir,
                 v_comm_limit_price,
                 v_limit_actual_price,
                 v_order_qty,
                 v_comm_cancel_qty,
                 v_bond_accr_intrst,
                 v_bond_rate_type,
                 v_net_price_flag,
                 v_par_value,
                 v_comm_status,
                 v_comm_begin_date,
                 v_comm_end_date,
                 v_comm_begin_time,
                 v_comm_end_time,
                 v_exter_comm_flag,
                 v_comm_oper_way,
                 v_comm_amt,
                 v_co_busi_config_str,
                 v_online_opor_no_str,
                 v_curr_opor_no,
                 v_buy_ref_rate,
                 v_sell_ref_rate,
                 v_before_comm_executor,
                 v_error_code,
                 v_error_info,
                 v_comm_occur_amt,
                 v_comm_occur_qty,
                 v_comm_appr_date,
                 v_comm_appr_time,
                 v_disp_status,
                 v_disp_opor,
                 v_auto_comm_executor);
             if v_error_code = "1" then
                 SET v_error_code = "tdsecuT.3.6.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_审批指令出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 leave label_pro;
             end if;


             /* set @临时_指令变动金额# = @临时_指令变动金额# + @指令变动金额#; */
             set v_tmp_comm_occur_amt = v_tmp_comm_occur_amt + v_comm_occur_amt;

             /* set @临时_指令变动数量# = @临时_指令变动数量# + @指令变动数量#; */
             set v_tmp_comm_occur_qty = v_tmp_comm_occur_qty + v_comm_occur_qty;

            /* if @自动分发指令执行人# >0 and @指令执行人# = 0 then */
            if v_auto_comm_executor >0 and v_comm_executor = 0 then

                /* set @指令执行人# = @自动分发指令执行人#; */
                set v_comm_executor = v_auto_comm_executor;
            end if;

            /* if substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 and @指令执行人# >0 then */
            if substring(v_asac_busi_config_str,6,1)=1 and v_comm_executor >0 then
                #设置订单相关字段值

                /* set @外部编号#=0; */
                set v_external_no=0;

                /* set @申报日期# = 0; */
                set v_report_date = 0;

                /* set @申报时间# = 0; */
                set v_report_time = 0;

                /* set @申报编号# = " "; */
                set v_report_no = " ";

                /* set @操作员编号# = @指令执行人#; */
                set v_opor_no = v_comm_executor;

                /* set @订单日期#=@初始化日期#; */
                set v_order_date=v_init_date;

                /* set @价格类型#=《价格类型-限价》; */
                set v_price_type=1;

                /* set @订单方向#=@指令方向#; */
                set v_order_dir=v_comm_dir;

                /* set @订单数量#=@指令数量#; */
                set v_order_qty=v_comm_qty;

                /* set @订单价格#=@指令实际限价#; */
                set v_order_price=v_limit_actual_price;
                #先反向更新指令

                /* set @计算方向# = 《计算方向-减去》; */
                set v_calc_dir = -1;

                /* 调用【原子_交易证券_公用_计算指令冻结金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetCommFrozenAmtAndQty(
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
                    v_calc_dir,
                    v_error_code,
                    v_error_info,
                    v_comm_frozen_amt,
                    v_comm_frozen_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.6.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令冻结金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* 调用【原子_交易证券_指令_下单更新指令】*/
                call db_tdsecu.pra_tdseap_OrderUpdateComm(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_comm_id,
                    v_comm_frozen_amt,
                    v_comm_frozen_qty,
                    v_order_qty,
                    v_error_code,
                    v_error_info,
                    v_limit_actual_price,
                    v_exter_comm_flag,
                    v_comm_comple_date,
                    v_comm_comple_time,
                    v_comm_status,
                    v_strike_status);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.6.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_下单更新指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #计算交易冻结金额

                /* 调用【原子_交易证券_公用_计算交易冻结金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetExchFrozenAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_order_dir,
                    v_order_price,
                    v_order_qty,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_all_fee,
                    v_error_code,
                    v_error_info,
                    v_trade_frozen_amt,
                    v_trade_frozen_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.6.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算交易冻结金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @订单冻结金额#=@交易冻结金额#; */
                set v_order_frozen_amt=v_trade_frozen_amt;

                /* set @订单冻结数量#=@交易冻结数量#; */
                set v_order_frozen_qty=v_trade_frozen_qty;

                /* set @备注信息#="指令自动审批后自动执行！"; */
                set v_remark_info="指令自动审批后自动执行！";
                #根据报盘机状态，设置订单状态 如果通道是允许报送状态,则直接将订单状态设为"待报"

                /* set @订单状态# = 《订单状态-未报》; */
                set v_order_status = "1";

                /* 调用【原子_交易证券_公用_获取通道状态】*/
                call db_tdsecu.pra_tdsepb_GetChannelStatus(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_pass_no,
                    v_error_code,
                    v_error_info,
                    v_pass_status);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.6.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取通道状态出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* if @通道状态# = "1" then */
                if v_pass_status = "1" then

                    /* set @订单状态# = 《订单状态-待报》; */
                    set v_order_status = "a";
                end if;

                /* set @订单操作方式# = 《订单操作方式-审批后自动下单》; */
                set v_order_oper_way = "40";

                /* set @组合代码# = " "; */
                set v_combo_code = " ";

                /* set @组合持仓序号# = " "; */
                set v_combo_posi_id = " ";

                 /* set @操作员编号# = @指令执行人#; */
                 set v_opor_no = v_comm_executor;

                /* 调用【原子_交易证券_交易_新增订单】*/
                call db_tdsecu.pra_tdsetd_AddOrder(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_init_date,
                    v_co_no,
                    v_comm_opor,
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
                    v_target_code_no,
                    v_trade_code_no,
                    v_stock_type,
                    v_asset_type,
                    v_external_no,
                    v_comm_id,
                    v_comm_batch_no,
                    v_order_batch_no,
                    v_order_date,
                    v_order_dir,
                    v_price_type,
                    v_order_price,
                    v_order_qty,
                    v_order_status,
                    v_report_date,
                    v_report_time,
                    v_report_no,
                    v_order_frozen_amt,
                    v_order_frozen_qty,
                    v_net_price_flag,
                    v_intrst_days,
                    v_par_value,
                    v_impawn_ratio,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_compli_trig_id,
                    v_remark_info,
                    v_order_oper_way,
                    v_exter_comm_flag,
                    v_cost_calc_type,
                    v_combo_code,
                    v_combo_posi_id,
                    v_target_stock_code,
                    v_target_stock_code_no,
                    v_registration_agency,
                    v_trade_acco,
                    v_contra_no,
                    v_asset_acco_type,
                    v_exist_debt_flag,
                    v_error_code,
                    v_error_info,
                    v_order_id,
                    v_order_time,
                    v_update_times);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.6.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增订单出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @订单序号串# = concat(@订单序号串#,@订单序号#,";"); */
                set v_order_id_str = concat(v_order_id_str,v_order_id,";");
                #计算指令变动金额和数量

                /* set @计算方向# = 《计算方向-减去》; */
                set v_calc_dir = -1;

                /* 调用【原子_交易证券_公用_计算指令变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetCommOccurAmtAndQty(
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
                    v_calc_dir,
                    v_error_code,
                    v_error_info,
                    v_comm_occur_amt,
                    v_comm_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.6.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @临时_指令变动金额# = @临时_指令变动金额# + @指令变动金额#; */
                set v_tmp_comm_occur_amt = v_tmp_comm_occur_amt + v_comm_occur_amt;

                /* set @临时_指令变动数量# = @临时_指令变动数量# + @指令变动数量#; */
                set v_tmp_comm_occur_qty = v_tmp_comm_occur_qty + v_comm_occur_qty;
                #计算下单交易变动金额和数量

                /* 调用【原子_交易证券_公用_计算下单交易变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetOrderTradeOccurAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_order_dir,
                    v_order_qty,
                    v_order_price,
                    v_order_frozen_amt,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_error_code,
                    v_error_info,
                    v_trade_occur_amt,
                    v_trade_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.6.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算下单交易变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            end if;

              /* set @操作IP# = @临时_操作IP#; */
              set v_oper_ip_addr = v_tmp_oper_ip_addr;

              /* set @操作MAC# = @临时_操作MAC#; */
              set v_oper_mac = v_tmp_oper_mac;

              /* set @操作信息# = @临时_操作信息#; */
              set v_oper_info = v_tmp_oper_info;

              /* set @操作员编号# = @临时_操作员编号#; */
              set v_opor_no = v_tmp_opor_no;
        end if;
        #处理订单资金持仓数据，保护指令变动和交易的变动

        /* set @指令变动金额# = @临时_指令变动金额#; */
        set v_comm_occur_amt = v_tmp_comm_occur_amt;

        /* set @指令变动数量# = @临时_指令变动数量#; */
        set v_comm_occur_qty = v_tmp_comm_occur_qty;

        /* set @业务操作员编号# = @指令执行人#; */
        set v_busi_opor_no = v_comm_executor;

        /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
        call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
            v_exch_crncy_type,
            v_comm_id,
            v_order_id,
            v_exch_no,
            v_stock_code,
            v_stock_type,
            v_asset_type,
            v_order_dir,
            v_impawn_ratio,
            v_stock_acco_no,
            v_stock_code_no,
            v_trade_code_no,
            v_target_code_no,
            v_comm_occur_amt,
            v_comm_occur_qty,
            v_trade_occur_amt,
            v_trade_occur_qty,
            v_is_record_jour,
            v_order_oper_way,
            v_busi_opor_no,
            v_open_close_permission,
            v_avail_cal_flag,
            v_combo_code,
            v_combo_posi_id,
            v_target_stock_code_no,
            v_error_code,
            v_error_info,
            v_open_posi_date);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @指令审批状态串# = concat(@指令审批状态串#,@指令审批状态#,";"); */
        set v_comm_appr_status_str = concat(v_comm_appr_status_str,v_comm_appr_status,";");

        /* set @证券代码串#=substring(@证券代码串#,LOCATE(@分隔符#,@证券代码串#)+1); */
        set v_stock_code_str=substring(v_stock_code_str,LOCATE(v_split_str,v_stock_code_str)+1);

        /* set @证券代码编号串#=substring(@证券代码编号串#,LOCATE(@分隔符#,@证券代码编号串#)+1); */
        set v_stock_code_no_str=substring(v_stock_code_no_str,LOCATE(v_split_str,v_stock_code_no_str)+1);

        /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
        set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

        /* set @指令方向串#=substring(@指令方向串#,LOCATE(@分隔符#,@指令方向串#)+1); */
        set v_comm_dir_str=substring(v_comm_dir_str,LOCATE(v_split_str,v_comm_dir_str)+1);

        /* set @指令限价串#=substring(@指令限价串#,LOCATE(@分隔符#,@指令限价串#)+1); */
        set v_limit_price_str=substring(v_limit_price_str,LOCATE(v_split_str,v_limit_price_str)+1);

        /* set @指令数量串#=substring(@指令数量串#,LOCATE(@分隔符#,@指令数量串#)+1); */
        set v_comm_qty_str=substring(v_comm_qty_str,LOCATE(v_split_str,v_comm_qty_str)+1);

        /* set @指令金额串#=substring(@指令金额串#,LOCATE(@分隔符#,@指令金额串#)+1); */
        set v_comm_amt_str=substring(v_comm_amt_str,LOCATE(v_split_str,v_comm_amt_str)+1);

        /* set @股东代码串#=substring(@股东代码串#,LOCATE(@分隔符#,@股东代码串#)+1); */
        set v_stock_acco_str=substring(v_stock_acco_str,LOCATE(v_split_str,v_stock_acco_str)+1);

        /* set @股东代码编号串#=substring(@股东代码编号串#,LOCATE(@分隔符#,@股东代码编号串#)+1); */
        set v_stock_acco_no_str=substring(v_stock_acco_no_str,LOCATE(v_split_str,v_stock_acco_no_str)+1);

        /* set @债券计提利息串#=substring(@债券计提利息串#,LOCATE(@分隔符#,@债券计提利息串#)+1); */
        set v_bond_accr_intrst_str=substring(v_bond_accr_intrst_str,LOCATE(v_split_str,v_bond_accr_intrst_str)+1);

        /* set @净价标志串#=substring(@净价标志串#,LOCATE(@分隔符#,@净价标志串#)+1); */
        set v_net_price_flag_str=substring(v_net_price_flag_str,LOCATE(v_split_str,v_net_price_flag_str)+1);

        /* set @质押比例串#=substring(@质押比例串#,LOCATE(@分隔符#,@质押比例串#)+1); */
        set v_impawn_ratio_str=substring(v_impawn_ratio_str,LOCATE(v_split_str,v_impawn_ratio_str)+1);

        /* set @证券类型串#=substring(@证券类型串#,LOCATE(@分隔符#,@证券类型串#)+1); */
        set v_stock_type_str=substring(v_stock_type_str,LOCATE(v_split_str,v_stock_type_str)+1);

        /* set @票面面值串#=substring(@票面面值串#,LOCATE(@分隔符#,@票面面值串#)+1); */
        set v_par_value_str=substring(v_par_value_str,LOCATE(v_split_str,v_par_value_str)+1);

        /* set @标的代码编号串#=substring(@标的代码编号串#,LOCATE(@分隔符#,@标的代码编号串#)+1); */
        set v_target_code_no_str=substring(v_target_code_no_str,LOCATE(v_split_str,v_target_code_no_str)+1);

        /* set @交易代码编号串#=substring(@交易代码编号串#,LOCATE(@分隔符#,@交易代码编号串#)+1); */
        set v_trade_code_no_str=substring(v_trade_code_no_str,LOCATE(v_split_str,v_trade_code_no_str)+1);

        /* set @资产类型串#=substring(@资产类型串#,LOCATE(@分隔符#,@资产类型串#)+1); */
        set v_asset_type_str=substring(v_asset_type_str,LOCATE(v_split_str,v_asset_type_str)+1);

        /* set @本币币种串#=substring(@本币币种串#,LOCATE(@分隔符#,@本币币种串#)+1); */
        set v_crncy_type_str=substring(v_crncy_type_str,LOCATE(v_split_str,v_crncy_type_str)+1);

        /* set @交易币种串#=substring(@交易币种串#,LOCATE(@分隔符#,@交易币种串#)+1); */
        set v_exch_crncy_type_str=substring(v_exch_crncy_type_str,LOCATE(v_split_str,v_exch_crncy_type_str)+1);

        /* set @买入参考汇率串#=substring(@买入参考汇率串#,LOCATE(@分隔符#,@买入参考汇率串#)+1); */
        set v_buy_ref_rate_str=substring(v_buy_ref_rate_str,LOCATE(v_split_str,v_buy_ref_rate_str)+1);

        /* set @卖出参考汇率串#=substring(@卖出参考汇率串#,LOCATE(@分隔符#,@卖出参考汇率串#)+1); */
        set v_sell_ref_rate_str=substring(v_sell_ref_rate_str,LOCATE(v_split_str,v_sell_ref_rate_str)+1);

        /* set @债券利率类型串#=substring(@债券利率类型串#,LOCATE(@分隔符#,@债券利率类型串#)+1); */
        set v_bond_rate_type_str=substring(v_bond_rate_type_str,LOCATE(v_split_str,v_bond_rate_type_str)+1);

        /* set @计息天数串#=substring(@计息天数串#,LOCATE(@分隔符#,@计息天数串#)+1); */
        set v_intrst_days_str=substring(v_intrst_days_str,LOCATE(v_split_str,v_intrst_days_str)+1);

        /* set @全部费用串#=substring(@全部费用串#,LOCATE(@分隔符#,@全部费用串#)+1); */
        set v_all_fee_str=substring(v_all_fee_str,LOCATE(v_split_str,v_all_fee_str)+1);

        /* set @涨停价串#=substring(@涨停价串#,LOCATE(@分隔符#,@涨停价串#)+1); */
        set v_up_limit_price_str=substring(v_up_limit_price_str,LOCATE(v_split_str,v_up_limit_price_str)+1);

        /* set @跌停价串#=substring(@跌停价串#,LOCATE(@分隔符#,@跌停价串#)+1); */
        set v_down_limit_price_str=substring(v_down_limit_price_str,LOCATE(v_split_str,v_down_limit_price_str)+1);

        /* set @最新价串#=substring(@最新价串#,LOCATE(@分隔符#,@最新价串#)+1); */
        set v_last_price_str=substring(v_last_price_str,LOCATE(v_split_str,v_last_price_str)+1);

        /* set @资金回转天数串#=substring(@资金回转天数串#,LOCATE(@分隔符#,@资金回转天数串#)+1); */
        set v_capit_reback_days_str=substring(v_capit_reback_days_str,LOCATE(v_split_str,v_capit_reback_days_str)+1);

        /* set @持仓回转天数串#=substring(@持仓回转天数串#,LOCATE(@分隔符#,@持仓回转天数串#)+1); */
        set v_posi_reback_days_str=substring(v_posi_reback_days_str,LOCATE(v_split_str,v_posi_reback_days_str)+1);

        /* set @交易组可用数量串# = substring(@交易组可用数量串#,LOCATE(@分隔符#,@交易组可用数量串#)+1); */
        set v_exgp_avail_qty_str = substring(v_exgp_avail_qty_str,LOCATE(v_split_str,v_exgp_avail_qty_str)+1);

        /* set @交易组标的代码可用数量串# = substring(@交易组标的代码可用数量串#,LOCATE(@分隔符#,@交易组标的代码可用数量串#)+1); */
        set v_exgp_target_code_avail_qty_str = substring(v_exgp_target_code_avail_qty_str,LOCATE(v_split_str,v_exgp_target_code_avail_qty_str)+1);

        /* set @交易组交易代码可用数量串# = substring(@交易组交易代码可用数量串#,LOCATE(@分隔符#,@交易组交易代码可用数量串#)+1); */
        set v_exgp_trade_code_avail_qty_str = substring(v_exgp_trade_code_avail_qty_str,LOCATE(v_split_str,v_exgp_trade_code_avail_qty_str)+1);

        /* set @资产账户可用数量串# = substring(@资产账户可用数量串#,LOCATE(@分隔符#,@资产账户可用数量串#)+1); */
        set v_asac_avail_qty_str = substring(v_asac_avail_qty_str,LOCATE(v_split_str,v_asac_avail_qty_str)+1);

        /* set @资产账户标的代码可用数量串# = substring(@资产账户标的代码可用数量串#,LOCATE(@分隔符#,@资产账户标的代码可用数量串#)+1); */
        set v_asac_target_code_avail_qty_str = substring(v_asac_target_code_avail_qty_str,LOCATE(v_split_str,v_asac_target_code_avail_qty_str)+1);

        /* set @资产账户交易代码可用数量串# = substring(@资产账户交易代码可用数量串#,LOCATE(@分隔符#,@资产账户交易代码可用数量串#)+1); */
        set v_asac_trade_code_avail_qty_str = substring(v_asac_trade_code_avail_qty_str,LOCATE(v_split_str,v_asac_trade_code_avail_qty_str)+1);

        /* set @认购交易标志串#=substring(@认购交易标志串#,LOCATE(@分隔符#,@认购交易标志串#)+1); */
        set v_subscription_trade_mark_str=substring(v_subscription_trade_mark_str,LOCATE(v_split_str,v_subscription_trade_mark_str)+1);

        /* set @申购交易标志串#=substring(@申购交易标志串#,LOCATE(@分隔符#,@申购交易标志串#)+1); */
        set v_purchase_trade_mark_str=substring(v_purchase_trade_mark_str,LOCATE(v_split_str,v_purchase_trade_mark_str)+1);

        /* set @赎回交易标志串#=substring(@赎回交易标志串#,LOCATE(@分隔符#,@赎回交易标志串#)+1); */
        set v_rede_trade_mark_str=substring(v_rede_trade_mark_str,LOCATE(v_split_str,v_rede_trade_mark_str)+1);

        /* set @首次最低金额串#=substring(@首次最低金额串#,LOCATE(@分隔符#,@首次最低金额串#)+1); */
        set v_first_minimum_amt_str=substring(v_first_minimum_amt_str,LOCATE(v_split_str,v_first_minimum_amt_str)+1);

        /* set @最低申购金额串#=substring(@最低申购金额串#,LOCATE(@分隔符#,@最低申购金额串#)+1); */
        set v_minimum_purchase_amt_str=substring(v_minimum_purchase_amt_str,LOCATE(v_split_str,v_minimum_purchase_amt_str)+1);

        /* set @最低认购金额串#=substring(@最低认购金额串#,LOCATE(@分隔符#,@最低认购金额串#)+1); */
        set v_minimum_subscription_amt_str=substring(v_minimum_subscription_amt_str,LOCATE(v_split_str,v_minimum_subscription_amt_str)+1);

        /* set @最低赎回份额串#=substring(@最低赎回份额串#,LOCATE(@分隔符#,@最低赎回份额串#)+1); */
        set v_minimum_rede_share_str=substring(v_minimum_rede_share_str,LOCATE(v_split_str,v_minimum_rede_share_str)+1);

        /* set @最低持有份额串#=substring(@最低持有份额串#,LOCATE(@分隔符#,@最低持有份额串#)+1); */
        set v_minimum_holding_share_str=substring(v_minimum_holding_share_str,LOCATE(v_split_str,v_minimum_holding_share_str)+1);

        /* if @指令实际限价串# <> " " then */
        if v_limit_actual_price_str <> " " then

            /* set @指令实际限价串#=substring(@指令实际限价串#,LOCATE(@分隔符#,@指令实际限价串#)+1); */
            set v_limit_actual_price_str=substring(v_limit_actual_price_str,LOCATE(v_split_str,v_limit_actual_price_str)+1);
        end if;

    /* [事务结束] */
    COMMIT;

    end while;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_date = v_comm_date;
    SET p_comm_id_str = v_comm_id_str;
    SET p_comm_appr_status_str = v_comm_appr_status_str;
    SET p_order_id_str = v_order_id_str;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_批量分发指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_DispBatchComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_DispBatchComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_comm_date int,
    IN p_comm_batch_no int,
    IN p_comm_executor int,
    IN p_is_withdraw int,
    IN p_disp_remark varchar(255),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
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
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_is_withdraw int;
    declare v_disp_remark varchar(255);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_comm_executor int;
    declare v_is_record_jour int;
    declare v_row_id bigint;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_comm_id bigint;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_time int;
    declare v_comm_status varchar(2);
    declare v_comm_opor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_end_date int;
    declare v_comm_comple_flag int;
    declare v_exter_comm_flag int;
    declare v_before_comm_executor int;
    declare v_disp_flag int;
    declare v_stock_acco varchar(16);
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_status varchar(2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_target_stock_code_no int;
    declare v_trade_acco varchar(32);
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_remark varchar(255);
    declare v_frozen_amt decimal(18,4);
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_id bigint;
    declare v_waste_qty decimal(18,2);

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
    SET v_comm_date = p_comm_date;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_executor = p_comm_executor;
    SET v_is_withdraw = p_is_withdraw;
    SET v_disp_remark = p_disp_remark;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_comm_executor = 0;
    SET v_is_record_jour = 1;
    SET v_row_id = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_comm_id = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_status = "0";
    SET v_comm_opor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_flag = 0;
    SET v_exter_comm_flag = 0;
    SET v_before_comm_executor = 0;
    SET v_disp_flag = 0;
    SET v_stock_acco = " ";
    SET v_external_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_batch_no = 0;
    SET v_order_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_status = "0";
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_all_fee = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_target_stock_code_no = 0;
    SET v_trade_acco = " ";
    SET v_wtdraw_batch_no = 0;
    SET v_wtdraw_remark = " ";
    SET v_frozen_amt = 0;
    SET v_wtdraw_status = "0";
    SET v_wtdraw_id = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @临时_指令执行人#=@指令执行人#; */
    set v_tmp_comm_executor=v_comm_executor;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* [事务开始] */
    START TRANSACTION;

        loop_label:loop

            /* 调用【原子_交易证券_指令_指令分发循环锁定获取指令】*/
            call db_tdsecu.pra_tdseap_DispLoopLockGetComm(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_co_no,
                v_comm_date,
                v_comm_batch_no,
                v_row_id,
                v_error_code,
                v_error_info,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_pass_no,
                v_out_acco,
                v_comm_id,
                v_exch_crncy_type,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_stock_code,
                v_target_code_no,
                v_trade_code_no,
                v_stock_type,
                v_asset_type,
                v_comm_time,
                v_comm_status,
                v_comm_opor,
                v_comm_executor,
                v_comm_dir,
                v_comm_limit_price,
                v_limit_actual_price,
                v_comm_qty,
                v_order_qty,
                v_comm_cancel_qty,
                v_net_price_flag,
                v_par_value,
                v_impawn_ratio,
                v_intrst_days,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_comm_end_date,
                v_comm_comple_flag,
                v_exter_comm_flag);

            /* if @错误编码#="0" and @临时_指令执行人#<>@指令执行人# then */
            if v_error_code="0" and v_tmp_comm_executor<>v_comm_executor then

                /* set @前指令执行人#=@指令执行人#; */
                set v_before_comm_executor=v_comm_executor;

                /* set @指令执行人#=@临时_指令执行人#; */
                set v_comm_executor=v_tmp_comm_executor;

                /* set @分发方式# =《分发方式-手动分发》; */
                set v_disp_flag =2;

                /* 调用【原子_交易证券_指令_分发指令】*/
                call db_tdsecu.pra_tdseap_DispComm(
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
                    v_asset_type,
                    v_comm_date,
                    v_comm_id,
                    v_comm_batch_no,
                    v_comm_dir,
                    v_comm_status,
                    v_comm_executor,
                    v_disp_flag,
                    v_disp_remark,
                    v_before_comm_executor,
                    v_is_withdraw,
                    v_exter_comm_flag,
                    v_buy_ref_rate,
                    v_sell_ref_rate,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.7.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_分发指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            else

                /* set @错误编码#="0"; */
                set v_error_code="0";

                /* set @错误信息#=' '; */
                set v_error_info=' ';
                ROLLBACK;
                leave loop_label;
            end if;
        end loop;
        #[原子_交易证券_指令_分发更新汇总指令]

    /* [事务结束] */
    COMMIT;


    /* if @是否撤单#=《是否撤单-是》 then */
    if v_is_withdraw=1 then
        #采用循环更新获取订单的方式，避免加锁时间长和并发问题

        /* set @记录序号# = 0; */
        set v_row_id = 0;
        loop_label:loop

            /* [事务开始] */
            START TRANSACTION;


            /* 调用【原子_交易证券_交易_指令分发锁定获取指令订单】*/
            call db_tdsecu.pra_tdsetd_DispLockGetCommOrder(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_co_no,
                v_comm_date,
                v_comm_batch_no,
                v_row_id,
                v_error_code,
                v_error_info,
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
                v_target_code_no,
                v_trade_code_no,
                v_stock_type,
                v_asset_type,
                v_comm_opor,
                v_external_no,
                v_report_date,
                v_report_time,
                v_report_no,
                v_order_batch_no,
                v_order_id,
                v_order_date,
                v_order_time,
                v_order_dir,
                v_price_type,
                v_order_price,
                v_order_qty,
                v_order_status,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_all_fee,
                v_wtdraw_qty,
                v_strike_amt,
                v_strike_qty,
                v_impawn_ratio,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_order_oper_way,
                v_busi_opor_no,
                v_target_stock_code_no,
                v_trade_acco);

            /* if @错误编码#="0"  then */
            if v_error_code="0"  then

                /* set @记录序号# = @订单序号#; */
                set v_row_id = v_order_id;

                /* set @撤单批号# = 0; */
                set v_wtdraw_batch_no = 0;

                /* set @撤单说明# = "指令批量分发撤销指令订单！"; */
                set v_wtdraw_remark = "指令批量分发撤销指令订单！";

                /* 调用【原子_交易证券_指令_撤销指令订单】*/
                call db_tdsecu.pra_tdseap_CancelCommOrder(
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
                    v_out_acco,
                    v_exch_crncy_type,
                    v_exch_no,
                    v_stock_acco_no,
                    v_stock_acco,
                    v_stock_code_no,
                    v_stock_code,
                    v_target_code_no,
                    v_trade_code_no,
                    v_stock_type,
                    v_asset_type,
                    v_comm_id,
                    v_external_no,
                    v_order_batch_no,
                    v_order_date,
                    v_report_no,
                    v_order_id,
                    v_order_dir,
                    v_order_price,
                    v_order_qty,
                    v_order_status,
                    v_order_frozen_amt,
                    v_order_frozen_qty,
                    v_impawn_ratio,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_wtdraw_batch_no,
                    v_wtdraw_remark,
                    v_order_oper_way,
                    v_busi_opor_no,
                    v_is_record_jour,
                    v_target_stock_code_no,
                    v_trade_acco,
                    v_error_code,
                    v_error_info,
                    v_frozen_amt,
                    v_wtdraw_status,
                    v_wtdraw_qty,
                    v_wtdraw_id);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.7.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销指令订单出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            else

                /* set @错误编码#="0"; */
                set v_error_code="0";

                /* set @错误信息#=' '; */
                set v_error_info=' ';
                ROLLBACK;
                leave loop_label;
            end if;

            /* [事务结束] */
            COMMIT;

            #处理汇总订单

            /* [事务开始] */
            START TRANSACTION;


                /* if @撤单数量# > 0 then */
                if v_wtdraw_qty > 0 then

                    /* set @废单数量# = 0; */
                    set v_waste_qty = 0;

                    /* 调用【原子_交易证券_交易_撤单处理汇总订单】*/
                    call db_tdsecu.pra_tdsetd_CancelDealSumOrder(
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
                        v_order_date,
                        v_order_batch_no,
                        v_wtdraw_qty,
                        v_waste_qty,
                        v_order_oper_way,
                        v_error_code,
                        v_error_info);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.3.7.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤单处理汇总订单出现错误！',v_mysql_message);
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

        end loop;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_新增篮子调仓指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_AddBasketTransferComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_AddBasketTransferComm(
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
    IN p_out_acco varchar(32),
    IN p_crncy_type_str varchar(2048),
    IN p_exch_crncy_type_str varchar(2048),
    IN p_buy_ref_rate_str varchar(2048),
    IN p_sell_ref_rate_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no_str varchar(4096),
    IN p_stock_acco_str varchar(2048),
    IN p_stock_code_no_str varchar(4096),
    IN p_stock_code_str varchar(4096),
    IN p_target_code_no_str varchar(4096),
    IN p_trade_code_no_str varchar(4096),
    IN p_stock_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
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
    IN p_exgp_avail_qty_str varchar(4096),
    IN p_exgp_target_code_avail_qty_str varchar(4096),
    IN p_exgp_trade_code_avail_qty_str varchar(4096),
    IN p_asac_avail_qty_str varchar(4096),
    IN p_asac_target_code_avail_qty_str varchar(4096),
    IN p_asac_trade_code_avail_qty_str varchar(4096),
    IN p_exgp_busi_config_str varchar(64),
    IN p_asac_busi_config_str varchar(64),
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_batch_no int,
    IN p_comm_dir_str varchar(2048),
    IN p_limit_price_str varchar(4096),
    IN p_limit_actual_price_str varchar(4096),
    IN p_comm_qty_str varchar(4096),
    IN p_comm_amt_str varchar(4096),
    IN p_comm_begin_date int,
    IN p_comm_end_date int,
    IN p_comm_begin_time int,
    IN p_comm_end_time int,
    IN p_comm_appr_oper int,
    IN p_all_fee_str varchar(4096),
    IN p_up_limit_price_str varchar(4096),
    IN p_down_limit_price_str varchar(4096),
    IN p_last_price_str varchar(4096),
    IN p_nav_asset decimal(18,4),
    IN p_net_price_flag_str varchar(2048),
    IN p_par_value_str varchar(4096),
    IN p_impawn_ratio_str varchar(4096),
    IN p_intrst_days_str varchar(2048),
    IN p_bond_accr_intrst_str varchar(4096),
    IN p_bond_rate_type_str varchar(4096),
    IN p_capit_reback_days_str varchar(2048),
    IN p_posi_reback_days_str varchar(2048),
    IN p_basket_id bigint,
    IN p_comm_oper_way varchar(2),
    IN p_exter_comm_flag int,
    IN p_split_str varchar(4),
    IN p_cost_calc_type int,
    IN p_comm_no_limit_price_ratio decimal(18,12),
    IN p_compli_trig_id bigint,
    IN p_comm_frozen_amt decimal(18,4),
    IN p_pre_close_price_str varchar(4096),
    IN p_subscription_trade_mark_str varchar(4096),
    IN p_purchase_trade_mark_str varchar(4096),
    IN p_rede_trade_mark_str varchar(4096),
    IN p_first_minimum_amt_str varchar(4096),
    IN p_minimum_purchase_amt_str varchar(4096),
    IN p_minimum_subscription_amt_str varchar(4096),
    IN p_minimum_rede_share_str varchar(4096),
    IN p_minimum_holding_share_str varchar(4096),
    IN p_record_count int,
    IN p_comm_remark_info varchar(1024),
    IN p_last_login_ip varchar(32),
    IN p_last_login_mac varchar(32),
    IN p_last_login_date int,
    IN p_last_oper_info varchar(255),
    IN p_online_status int,
    IN p_sys_config_str varchar(64),
    IN p_asset_acco_type int,
    IN p_co_busi_config_str varchar(64),
    IN p_online_opor_no_str varchar(2048),
    IN p_acco_concat_info varchar(4096),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_date int,
    OUT p_comm_id_str varchar(2048),
    OUT p_comm_appr_status_str varchar(2048),
    OUT p_order_id_str varchar(2048),
    OUT p_stock_acco_no_stock_code_no_str varchar(4096)
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
    declare v_out_acco varchar(32);
    declare v_crncy_type_str varchar(2048);
    declare v_exch_crncy_type_str varchar(2048);
    declare v_buy_ref_rate_str varchar(2048);
    declare v_sell_ref_rate_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no_str varchar(4096);
    declare v_stock_acco_str varchar(2048);
    declare v_stock_code_no_str varchar(4096);
    declare v_stock_code_str varchar(4096);
    declare v_target_code_no_str varchar(4096);
    declare v_trade_code_no_str varchar(4096);
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
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
    declare v_exgp_avail_qty_str varchar(4096);
    declare v_exgp_target_code_avail_qty_str varchar(4096);
    declare v_exgp_trade_code_avail_qty_str varchar(4096);
    declare v_asac_avail_qty_str varchar(4096);
    declare v_asac_target_code_avail_qty_str varchar(4096);
    declare v_asac_trade_code_avail_qty_str varchar(4096);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_batch_no int;
    declare v_comm_dir_str varchar(2048);
    declare v_limit_price_str varchar(4096);
    declare v_limit_actual_price_str varchar(4096);
    declare v_comm_qty_str varchar(4096);
    declare v_comm_amt_str varchar(4096);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_appr_oper int;
    declare v_all_fee_str varchar(4096);
    declare v_up_limit_price_str varchar(4096);
    declare v_down_limit_price_str varchar(4096);
    declare v_last_price_str varchar(4096);
    declare v_nav_asset decimal(18,4);
    declare v_net_price_flag_str varchar(2048);
    declare v_par_value_str varchar(4096);
    declare v_impawn_ratio_str varchar(4096);
    declare v_intrst_days_str varchar(2048);
    declare v_bond_accr_intrst_str varchar(4096);
    declare v_bond_rate_type_str varchar(4096);
    declare v_capit_reback_days_str varchar(2048);
    declare v_posi_reback_days_str varchar(2048);
    declare v_basket_id bigint;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_split_str varchar(4);
    declare v_cost_calc_type int;
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_compli_trig_id bigint;
    declare v_comm_frozen_amt decimal(18,4);
    declare v_pre_close_price_str varchar(4096);
    declare v_subscription_trade_mark_str varchar(4096);
    declare v_purchase_trade_mark_str varchar(4096);
    declare v_rede_trade_mark_str varchar(4096);
    declare v_first_minimum_amt_str varchar(4096);
    declare v_minimum_purchase_amt_str varchar(4096);
    declare v_minimum_subscription_amt_str varchar(4096);
    declare v_minimum_rede_share_str varchar(4096);
    declare v_minimum_holding_share_str varchar(4096);
    declare v_record_count int;
    declare v_comm_remark_info varchar(1024);
    declare v_last_login_ip varchar(32);
    declare v_last_login_mac varchar(32);
    declare v_last_login_date int;
    declare v_last_oper_info varchar(255);
    declare v_online_status int;
    declare v_sys_config_str varchar(64);
    declare v_asset_acco_type int;
    declare v_co_busi_config_str varchar(64);
    declare v_online_opor_no_str varchar(2048);
    declare v_acco_concat_info varchar(4096);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_date int;
    declare v_comm_id_str varchar(2048);
    declare v_comm_appr_status_str varchar(2048);
    declare v_order_id_str varchar(2048);
    declare v_stock_acco_no_stock_code_no_str varchar(4096);
    declare v_is_record_jour int;
    declare v_tmp_comm_frozen_amt decimal(18,4);
    declare v_open_close_permission int;
    declare v_avail_cal_flag int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_capit_reback_days int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_contra_no varchar(32);
    declare v_exist_debt_flag int;
    declare v_disp_opor int;
    declare v_disp_status int;
    declare v_comm_appr_set int;
    declare v_order_batch_no int;
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_order_status varchar(2);
    declare v_pass_status varchar(2);
    declare v_before_comm_executor int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_stock_acco varchar(16);
    declare v_stock_acco_no int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_net_price_flag int;
    declare v_impawn_ratio decimal(18,12);
    declare v_stock_type int;
    declare v_par_value decimal(16,9);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_asset_type int;
    declare v_bond_rate_type int;
    declare v_intrst_days int;
    declare v_all_fee decimal(18,4);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_posi_reback_days int;
    declare v_exgp_avail_qty decimal(18,2);
    declare v_exgp_target_code_avail_qty decimal(18,2);
    declare v_exgp_trade_code_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_asac_target_code_avail_qty decimal(18,2);
    declare v_asac_trade_code_avail_qty decimal(18,2);
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_limit_actual_price decimal(16,9);
    declare v_calc_dir int;
    declare v_comm_frozen_qty decimal(18,2);
    declare v_combo_code varchar(32);
    declare v_deal_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_order_dir int;
    declare v_comm_appr_status varchar(2);
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_workflow_type int;
    declare v_comm_id bigint;
    declare v_comm_status varchar(2);
    declare v_strike_status varchar(2);
    declare v_comm_comple_flag int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_tmp_comm_occur_amt decimal(18,4);
    declare v_tmp_comm_occur_qty decimal(18,2);
    declare v_comm_appr_remark varchar(255);
    declare v_comm_appr_oper_no int;
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_tmp_oper_ip_addr varchar(32);
    declare v_tmp_oper_mac varchar(32);
    declare v_tmp_oper_info varchar(1024);
    declare v_tmp_opor_no int;
    declare v_curr_opor_no int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_auto_comm_executor int;
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_order_oper_way varchar(2);
    declare v_combo_posi_id bigint;
    declare v_order_id bigint;
    declare v_order_time int;
    declare v_update_times int;
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_busi_opor_no int;
    declare v_open_posi_date int;

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
    SET v_out_acco = p_out_acco;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_exch_crncy_type_str = p_exch_crncy_type_str;
    SET v_buy_ref_rate_str = p_buy_ref_rate_str;
    SET v_sell_ref_rate_str = p_sell_ref_rate_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no_str = p_stock_acco_no_str;
    SET v_stock_acco_str = p_stock_acco_str;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_stock_code_str = p_stock_code_str;
    SET v_target_code_no_str = p_target_code_no_str;
    SET v_trade_code_no_str = p_trade_code_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_asset_type_str = p_asset_type_str;
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
    SET v_exgp_avail_qty_str = p_exgp_avail_qty_str;
    SET v_exgp_target_code_avail_qty_str = p_exgp_target_code_avail_qty_str;
    SET v_exgp_trade_code_avail_qty_str = p_exgp_trade_code_avail_qty_str;
    SET v_asac_avail_qty_str = p_asac_avail_qty_str;
    SET v_asac_target_code_avail_qty_str = p_asac_target_code_avail_qty_str;
    SET v_asac_trade_code_avail_qty_str = p_asac_trade_code_avail_qty_str;
    SET v_exgp_busi_config_str = p_exgp_busi_config_str;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_limit_price_str = p_limit_price_str;
    SET v_limit_actual_price_str = p_limit_actual_price_str;
    SET v_comm_qty_str = p_comm_qty_str;
    SET v_comm_amt_str = p_comm_amt_str;
    SET v_comm_begin_date = p_comm_begin_date;
    SET v_comm_end_date = p_comm_end_date;
    SET v_comm_begin_time = p_comm_begin_time;
    SET v_comm_end_time = p_comm_end_time;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_all_fee_str = p_all_fee_str;
    SET v_up_limit_price_str = p_up_limit_price_str;
    SET v_down_limit_price_str = p_down_limit_price_str;
    SET v_last_price_str = p_last_price_str;
    SET v_nav_asset = p_nav_asset;
    SET v_net_price_flag_str = p_net_price_flag_str;
    SET v_par_value_str = p_par_value_str;
    SET v_impawn_ratio_str = p_impawn_ratio_str;
    SET v_intrst_days_str = p_intrst_days_str;
    SET v_bond_accr_intrst_str = p_bond_accr_intrst_str;
    SET v_bond_rate_type_str = p_bond_rate_type_str;
    SET v_capit_reback_days_str = p_capit_reback_days_str;
    SET v_posi_reback_days_str = p_posi_reback_days_str;
    SET v_basket_id = p_basket_id;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_split_str = p_split_str;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_comm_no_limit_price_ratio = p_comm_no_limit_price_ratio;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_comm_frozen_amt = p_comm_frozen_amt;
    SET v_pre_close_price_str = p_pre_close_price_str;
    SET v_subscription_trade_mark_str = p_subscription_trade_mark_str;
    SET v_purchase_trade_mark_str = p_purchase_trade_mark_str;
    SET v_rede_trade_mark_str = p_rede_trade_mark_str;
    SET v_first_minimum_amt_str = p_first_minimum_amt_str;
    SET v_minimum_purchase_amt_str = p_minimum_purchase_amt_str;
    SET v_minimum_subscription_amt_str = p_minimum_subscription_amt_str;
    SET v_minimum_rede_share_str = p_minimum_rede_share_str;
    SET v_minimum_holding_share_str = p_minimum_holding_share_str;
    SET v_record_count = p_record_count;
    SET v_comm_remark_info = p_comm_remark_info;
    SET v_last_login_ip = p_last_login_ip;
    SET v_last_login_mac = p_last_login_mac;
    SET v_last_login_date = p_last_login_date;
    SET v_last_oper_info = p_last_oper_info;
    SET v_online_status = p_online_status;
    SET v_sys_config_str = p_sys_config_str;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_online_opor_no_str = p_online_opor_no_str;
    SET v_acco_concat_info = p_acco_concat_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_id_str = " ";
    SET v_comm_appr_status_str = " ";
    SET v_order_id_str = " ";
    SET v_stock_acco_no_stock_code_no_str = " ";
    SET v_is_record_jour = 1;
    SET v_tmp_comm_frozen_amt = 0;
    SET v_open_close_permission = 0;
    SET v_avail_cal_flag = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_capit_reback_days = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_contra_no = " ";
    SET v_exist_debt_flag = 0;
    SET v_disp_opor = 0;
    SET v_disp_status = 0;
    SET v_comm_appr_set = 0;
    SET v_order_batch_no = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_order_status = "0";
    SET v_pass_status = "0";
    SET v_before_comm_executor = 0;
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_exch_no = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_stock_acco = " ";
    SET v_stock_acco_no = 0;
    SET v_bond_accr_intrst = 0;
    SET v_net_price_flag = 0;
    SET v_impawn_ratio = 0;
    SET v_stock_type = 0;
    SET v_par_value = 0;
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_asset_type = 0;
    SET v_bond_rate_type = 0;
    SET v_intrst_days = 0;
    SET v_all_fee = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_pre_close_price = 0;
    SET v_posi_reback_days = 0;
    SET v_exgp_avail_qty = 0;
    SET v_exgp_target_code_avail_qty = 0;
    SET v_exgp_trade_code_avail_qty = 0;
    SET v_asac_avail_qty = 0;
    SET v_asac_target_code_avail_qty = 0;
    SET v_asac_trade_code_avail_qty = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_limit_actual_price = 0;
    SET v_calc_dir = 1;
    SET v_comm_frozen_qty = 0;
    SET v_combo_code = " ";
    SET v_deal_flag = 0;
    SET v_occur_amt = 0;
    SET v_occur_qty = 0;
    SET v_order_dir = 0;
    SET v_comm_appr_status = " ";
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_workflow_type = 0;
    SET v_comm_id = 0;
    SET v_comm_status = "0";
    SET v_strike_status = "0";
    SET v_comm_comple_flag = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_tmp_comm_occur_amt = 0;
    SET v_tmp_comm_occur_qty = 0;
    SET v_comm_appr_remark = " ";
    SET v_comm_appr_oper_no = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_tmp_oper_ip_addr = " ";
    SET v_tmp_oper_mac = " ";
    SET v_tmp_oper_info = " ";
    SET v_tmp_opor_no = 0;
    SET v_curr_opor_no = 0;
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_auto_comm_executor = 0;
    SET v_external_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_remark_info = " ";
    SET v_order_oper_way = " ";
    SET v_combo_posi_id = 0;
    SET v_order_id = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_busi_opor_no = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @指令日期# = @初始化日期#; */
    set v_comm_date = v_init_date;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @临时_指令冻结金额# = @指令冻结金额#; */
    set v_tmp_comm_frozen_amt = v_comm_frozen_amt;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;

    /* set @可用计算标志# = 0; */
    set v_avail_cal_flag = 0;
    #支持人民币购买A股

    /* set @本币币种# = "CNY"; */
    set v_crncy_type = "CNY";

    /* set @交易币种# = "CNY"; */
    set v_exch_crncy_type = "CNY";

    /* set @买入参考汇率# = 1; */
    set v_buy_ref_rate = 1;

    /* set @卖出参考汇率# = 1; */
    set v_sell_ref_rate = 1;

    /* set @资金回转天数# = 1; */
    set v_capit_reback_days = 1;

    /* set @登记机构# = ""; */
    set v_registration_agency = "";

    /* set @交易账户# = ""; */
    set v_trade_acco = "";

    /* set @合同编号# = ""; */
    set v_contra_no = "";

    /* set @存在负债标志# = 《存在负债标志-不存在》; */
    set v_exist_debt_flag = 1;

    /* set @分发操作员# = 0 ; */
    set v_disp_opor = 0 ;

    /* if @指令执行人#<>0 then */
    if v_comm_executor<>0 then

        /* set @分发状态# = 《分发状态-分发通过》; */
        set v_disp_status = 1;
    else

        /* set @分发状态# = 《分发状态-待分发》; */
        set v_disp_status = 3;
    end if;

    /* 调用【原子_交易证券_指令_校验调仓指令金额】*/
    call db_tdsecu.pra_tdseap_CheckTransferCommAmt(
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
        v_exgp_avail_amt,
        v_asac_avail_amt,
        v_exgp_busi_config_str,
        v_asac_busi_config_str,
        v_capit_reback_days,
        v_comm_frozen_amt,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_校验调仓指令金额出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @指令审批设置# = substring(@资产账户业务控制配置串#,5,1); */
    set v_comm_appr_set = substring(v_asac_busi_config_str,5,1);
     #PB系统自动审批获取审批操作员登录信息，审批操作员不在线状态下不能自动审批

    /* if  @指令审批设置#=《指令审批设置-自动审批》 and substring(@系统控制配置串#,7,1) =《系统类型-PB系统》 then */
    if  v_comm_appr_set=1 and substring(v_sys_config_str,7,1) =1 then

        /* if @在线状态# <>《在线状态-在线》 then */
        if v_online_status <>1 then

            /* set  @指令审批设置# = 《指令审批设置-手工审批》; */
            set  v_comm_appr_set = 2;
        end if;
    end if;

    /* set @订单批号#=0; */
    set v_order_batch_no=0;

    /* if @指令审批设置#=《指令审批设置-自动审批》 and substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 then */
    if v_comm_appr_set=1 and substring(v_asac_busi_config_str,6,1)=1 then

        /* set @编号类型#=《编号类型-订单批号》; */
        set v_record_no_type=18;

        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_交易证券_公用_获取业务记录编号】*/
            call db_tdsecu.pra_tdsepb_GetCoBusiRecordNo(
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
                SET v_error_code = "tdsecuT.3.8.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


        /* [事务结束] */
        COMMIT;


        /* set @订单批号#=@当前编号#; */
        set v_order_batch_no=v_curr_no;
        #根据报盘机状态，设置订单状态 如果通道是允许报送状态,则直接将订单状态设为"待报"

        /* set @订单状态# = 《订单状态-未报》; */
        set v_order_status = "1";

        /* 调用【原子_交易证券_公用_获取通道状态】*/
        call db_tdsecu.pra_tdsepb_GetChannelStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pass_no,
            v_error_code,
            v_error_info,
            v_pass_status);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.8.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取通道状态出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* if @通道状态# = "1" then */
        if v_pass_status = "1" then

            /* set @订单状态# = 《订单状态-待报》; */
            set v_order_status = "a";
        end if;
    end if;
    #篮子指令不传批号，自己获取

    /* if @指令批号# = 0 then */
    if v_comm_batch_no = 0 then

        /* set @编号类型#=《编号类型-指令批号》; */
        set v_record_no_type=17;

        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_交易证券_公用_获取业务记录编号】*/
            call db_tdsecu.pra_tdsepb_GetCoBusiRecordNo(
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
                SET v_error_code = "tdsecuT.3.8.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


        /* [事务结束] */
        COMMIT;


        /* set @指令批号#=@当前编号#; */
        set v_comm_batch_no=v_curr_no;
    end if;

    /* set @指令序号串# = ""; */
    set v_comm_id_str = "";

    /* set @指令审批状态串# = ""; */
    set v_comm_appr_status_str = "";

    /* set @订单序号串# = ""; */
    set v_order_id_str = "";

    /* set @股东代码证券代码编号串# = ""; */
    set v_stock_acco_no_stock_code_no_str = "";

    /* set @前指令执行人# = 0; */
    set v_before_comm_executor = 0;

    /* while LOCATE(@分隔符#,@证券代码串#)<>0   do */
    while LOCATE(v_split_str,v_stock_code_str)<>0   do

    /* [事务开始] */
    START TRANSACTION;

    #截取前面每一位

        /* set @证券代码#=substring(@证券代码串#,1,LOCATE(@分隔符#,@证券代码串#)-1); */
        set v_stock_code=substring(v_stock_code_str,1,LOCATE(v_split_str,v_stock_code_str)-1);

        /* set @证券代码编号#=cast(substring(@证券代码编号串#,1,LOCATE(@分隔符#,@证券代码编号串#)-1) as SIGNED); */
        set v_stock_code_no=cast(substring(v_stock_code_no_str,1,LOCATE(v_split_str,v_stock_code_no_str)-1) as SIGNED);

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

        /* set @指令方向#=cast(substring(@指令方向串#,1,LOCATE(@分隔符#,@指令方向串#)-1) as SIGNED); */
        set v_comm_dir=cast(substring(v_comm_dir_str,1,LOCATE(v_split_str,v_comm_dir_str)-1) as SIGNED);

        /* set @指令限价#=cast(substring(@指令限价串#,1,LOCATE(@分隔符#,@指令限价串#)-1) as decimal(16,9)); */
        set v_comm_limit_price=cast(substring(v_limit_price_str,1,LOCATE(v_split_str,v_limit_price_str)-1) as decimal(16,9));

        /* set @指令数量#=cast(substring(@指令数量串#,1,LOCATE(@分隔符#,@指令数量串#)-1) as decimal(18,2)); */
        set v_comm_qty=cast(substring(v_comm_qty_str,1,LOCATE(v_split_str,v_comm_qty_str)-1) as decimal(18,2));

        /* set @指令金额#=cast(substring(@指令金额串#,1,LOCATE(@分隔符#,@指令金额串#)-1) as decimal(32,4)); */
        set v_comm_amt=cast(substring(v_comm_amt_str,1,LOCATE(v_split_str,v_comm_amt_str)-1) as decimal(32,4));

        /* set @股东代码#=substring(@股东代码串#,1,LOCATE(@分隔符#,@股东代码串#)-1); */
        set v_stock_acco=substring(v_stock_acco_str,1,LOCATE(v_split_str,v_stock_acco_str)-1);

        /* set @股东代码编号#=cast(substring(@股东代码编号串#,1,LOCATE(@分隔符#,@股东代码编号串#)-1) as SIGNED); */
        set v_stock_acco_no=cast(substring(v_stock_acco_no_str,1,LOCATE(v_split_str,v_stock_acco_no_str)-1) as SIGNED);

        /* set @债券计提利息#=cast(substring(@债券计提利息串#,1,LOCATE(@分隔符#,@债券计提利息串#)-1) as decimal(18,12)); */
        set v_bond_accr_intrst=cast(substring(v_bond_accr_intrst_str,1,LOCATE(v_split_str,v_bond_accr_intrst_str)-1) as decimal(18,12));

        /* set @净价标志#=substring(@净价标志串#,1,LOCATE(@分隔符#,@净价标志串#)-1); */
        set v_net_price_flag=substring(v_net_price_flag_str,1,LOCATE(v_split_str,v_net_price_flag_str)-1);

        /* set @质押比例#=cast(substring(@质押比例串#,1,LOCATE(@分隔符#,@质押比例串#)-1) as decimal(18,12)); */
        set v_impawn_ratio=cast(substring(v_impawn_ratio_str,1,LOCATE(v_split_str,v_impawn_ratio_str)-1) as decimal(18,12));

        /* set @证券类型#=cast(substring(@证券类型串#,1,LOCATE(@分隔符#,@证券类型串#)-1) as SIGNED); */
        set v_stock_type=cast(substring(v_stock_type_str,1,LOCATE(v_split_str,v_stock_type_str)-1) as SIGNED);

        /* set @票面面值#=cast(substring(@票面面值串#,1,LOCATE(@分隔符#,@票面面值串#)-1) as decimal(16,9)); */
        set v_par_value=cast(substring(v_par_value_str,1,LOCATE(v_split_str,v_par_value_str)-1) as decimal(16,9));

        /* set @标的代码编号#=cast(substring(@标的代码编号串#,1,LOCATE(@分隔符#,@标的代码编号串#)-1) as SIGNED); */
        set v_target_code_no=cast(substring(v_target_code_no_str,1,LOCATE(v_split_str,v_target_code_no_str)-1) as SIGNED);

        /* set @交易代码编号#=cast(substring(@交易代码编号串#,1,LOCATE(@分隔符#,@交易代码编号串#)-1) as SIGNED); */
        set v_trade_code_no=cast(substring(v_trade_code_no_str,1,LOCATE(v_split_str,v_trade_code_no_str)-1) as SIGNED);

        /* set @资产类型#=cast(substring(@资产类型串#,1,LOCATE(@分隔符#,@资产类型串#)-1) as SIGNED); */
        set v_asset_type=cast(substring(v_asset_type_str,1,LOCATE(v_split_str,v_asset_type_str)-1) as SIGNED);

        /* set @本币币种#=substring(@本币币种串#,1,LOCATE(@分隔符#,@本币币种串#)-1); */
        set v_crncy_type=substring(v_crncy_type_str,1,LOCATE(v_split_str,v_crncy_type_str)-1);

        /* set @交易币种#=substring(@交易币种串#,1,LOCATE(@分隔符#,@交易币种串#)-1); */
        set v_exch_crncy_type=substring(v_exch_crncy_type_str,1,LOCATE(v_split_str,v_exch_crncy_type_str)-1);

        /* set @买入参考汇率#=cast(substring(@买入参考汇率串#,1,LOCATE(@分隔符#,@买入参考汇率串#)-1) as decimal(18,12)); */
        set v_buy_ref_rate=cast(substring(v_buy_ref_rate_str,1,LOCATE(v_split_str,v_buy_ref_rate_str)-1) as decimal(18,12));

        /* set @卖出参考汇率#=cast(substring(@卖出参考汇率串#,1,LOCATE(@分隔符#,@卖出参考汇率串#)-1) as decimal(18,12)); */
        set v_sell_ref_rate=cast(substring(v_sell_ref_rate_str,1,LOCATE(v_split_str,v_sell_ref_rate_str)-1) as decimal(18,12));

        /* set @债券利率类型#=cast(substring(@债券利率类型串#,1,LOCATE(@分隔符#,@债券利率类型串#)-1) as SIGNED); */
        set v_bond_rate_type=cast(substring(v_bond_rate_type_str,1,LOCATE(v_split_str,v_bond_rate_type_str)-1) as SIGNED);

        /* set @计息天数#=cast(substring(@计息天数串#,1,LOCATE(@分隔符#,@计息天数串#)-1) as SIGNED); */
        set v_intrst_days=cast(substring(v_intrst_days_str,1,LOCATE(v_split_str,v_intrst_days_str)-1) as SIGNED);

        /* set @全部费用#=cast(substring(@全部费用串#,1,LOCATE(@分隔符#,@全部费用串#)-1) as decimal(32,6)); */
        set v_all_fee=cast(substring(v_all_fee_str,1,LOCATE(v_split_str,v_all_fee_str)-1) as decimal(32,6));

        /* set @涨停价#=cast(substring(@涨停价串#,1,LOCATE(@分隔符#,@涨停价串#)-1) as decimal(16,9)); */
        set v_up_limit_price=cast(substring(v_up_limit_price_str,1,LOCATE(v_split_str,v_up_limit_price_str)-1) as decimal(16,9));

        /* set @跌停价#=cast(substring(@跌停价串#,1,LOCATE(@分隔符#,@跌停价串#)-1) as decimal(16,9)); */
        set v_down_limit_price=cast(substring(v_down_limit_price_str,1,LOCATE(v_split_str,v_down_limit_price_str)-1) as decimal(16,9));

        /* set @最新价#=cast(substring(@最新价串#,1,LOCATE(@分隔符#,@最新价串#)-1) as decimal(16,9)); */
        set v_last_price=cast(substring(v_last_price_str,1,LOCATE(v_split_str,v_last_price_str)-1) as decimal(16,9));

        /* set @昨收盘价#=cast(substring(@昨收盘价串#,1,LOCATE(@分隔符#,@昨收盘价串#)-1) as decimal(16,9)); */
        set v_pre_close_price=cast(substring(v_pre_close_price_str,1,LOCATE(v_split_str,v_pre_close_price_str)-1) as decimal(16,9));

        /* set @资金回转天数#=cast(substring(@资金回转天数串#,1,LOCATE(@分隔符#,@资金回转天数串#)-1) as SIGNED); */
        set v_capit_reback_days=cast(substring(v_capit_reback_days_str,1,LOCATE(v_split_str,v_capit_reback_days_str)-1) as SIGNED);

        /* set @持仓回转天数#=cast(substring(@持仓回转天数串#,1,LOCATE(@分隔符#,@持仓回转天数串#)-1) as SIGNED); */
        set v_posi_reback_days=cast(substring(v_posi_reback_days_str,1,LOCATE(v_split_str,v_posi_reback_days_str)-1) as SIGNED);

        /* set @交易组可用数量# = cast(substring(@交易组可用数量串#,1,LOCATE(@分隔符#,@交易组可用数量串#)-1) as decimal(18,2)); */
        set v_exgp_avail_qty = cast(substring(v_exgp_avail_qty_str,1,LOCATE(v_split_str,v_exgp_avail_qty_str)-1) as decimal(18,2));

        /* set @交易组标的代码可用数量# = cast(substring(@交易组标的代码可用数量串#,1,LOCATE(@分隔符#,@交易组标的代码可用数量串#)-1) as decimal(18,2)); */
        set v_exgp_target_code_avail_qty = cast(substring(v_exgp_target_code_avail_qty_str,1,LOCATE(v_split_str,v_exgp_target_code_avail_qty_str)-1) as decimal(18,2));

        /* set @交易组交易代码可用数量# = cast(substring(@交易组交易代码可用数量串#,1,LOCATE(@分隔符#,@交易组交易代码可用数量串#)-1) as decimal(18,2)); */
        set v_exgp_trade_code_avail_qty = cast(substring(v_exgp_trade_code_avail_qty_str,1,LOCATE(v_split_str,v_exgp_trade_code_avail_qty_str)-1) as decimal(18,2));

        /* set @资产账户可用数量# = cast(substring(@资产账户可用数量串#,1,LOCATE(@分隔符#,@资产账户可用数量串#)-1) as decimal(18,2)); */
        set v_asac_avail_qty = cast(substring(v_asac_avail_qty_str,1,LOCATE(v_split_str,v_asac_avail_qty_str)-1) as decimal(18,2));

        /* set @资产账户标的代码可用数量# = cast(substring(@资产账户标的代码可用数量串#,1,LOCATE(@分隔符#,@资产账户标的代码可用数量串#)-1) as decimal(18,2)); */
        set v_asac_target_code_avail_qty = cast(substring(v_asac_target_code_avail_qty_str,1,LOCATE(v_split_str,v_asac_target_code_avail_qty_str)-1) as decimal(18,2));

        /* set @资产账户交易代码可用数量# = cast(substring(@资产账户交易代码可用数量串#,1,LOCATE(@分隔符#,@资产账户交易代码可用数量串#)-1) as decimal(18,2)); */
        set v_asac_trade_code_avail_qty = cast(substring(v_asac_trade_code_avail_qty_str,1,LOCATE(v_split_str,v_asac_trade_code_avail_qty_str)-1) as decimal(18,2));

        /* set @认购交易标志#=cast(substring(@认购交易标志串#,1,LOCATE(@分隔符#,@认购交易标志串#)-1) as SIGNED); */
        set v_subscription_trade_mark=cast(substring(v_subscription_trade_mark_str,1,LOCATE(v_split_str,v_subscription_trade_mark_str)-1) as SIGNED);

        /* set @申购交易标志#=cast(substring(@申购交易标志串#,1,LOCATE(@分隔符#,@申购交易标志串#)-1) as SIGNED); */
        set v_purchase_trade_mark=cast(substring(v_purchase_trade_mark_str,1,LOCATE(v_split_str,v_purchase_trade_mark_str)-1) as SIGNED);

        /* set @赎回交易标志#=cast(substring(@赎回交易标志串#,1,LOCATE(@分隔符#,@赎回交易标志串#)-1) as SIGNED); */
        set v_rede_trade_mark=cast(substring(v_rede_trade_mark_str,1,LOCATE(v_split_str,v_rede_trade_mark_str)-1) as SIGNED);

        /* set @首次最低金额#=cast(substring(@首次最低金额串#,1,LOCATE(@分隔符#,@首次最低金额串#)-1) as decimal(32,4)); */
        set v_first_minimum_amt=cast(substring(v_first_minimum_amt_str,1,LOCATE(v_split_str,v_first_minimum_amt_str)-1) as decimal(32,4));

        /* set @最低申购金额#=cast(substring(@最低申购金额串#,1,LOCATE(@分隔符#,@最低申购金额串#)-1) as decimal(32,4)); */
        set v_minimum_purchase_amt=cast(substring(v_minimum_purchase_amt_str,1,LOCATE(v_split_str,v_minimum_purchase_amt_str)-1) as decimal(32,4));

        /* set @最低认购金额#=cast(substring(@最低认购金额串#,1,LOCATE(@分隔符#,@最低认购金额串#)-1) as decimal(32,4)); */
        set v_minimum_subscription_amt=cast(substring(v_minimum_subscription_amt_str,1,LOCATE(v_split_str,v_minimum_subscription_amt_str)-1) as decimal(32,4));

        /* set @最低赎回份额#=cast(substring(@最低赎回份额串#,1,LOCATE(@分隔符#,@最低赎回份额串#)-1) as decimal(18,2)); */
        set v_minimum_rede_share=cast(substring(v_minimum_rede_share_str,1,LOCATE(v_split_str,v_minimum_rede_share_str)-1) as decimal(18,2));

        /* set @最低持有份额#=cast(substring(@最低持有份额串#,1,LOCATE(@分隔符#,@最低持有份额串#)-1) as decimal(18,2)); */
        set v_minimum_holding_share=cast(substring(v_minimum_holding_share_str,1,LOCATE(v_split_str,v_minimum_holding_share_str)-1) as decimal(18,2));

        /* if @市场编号# = 《市场编号-沪港通证券交易所》 and substring(@资产账户业务控制配置串#,15,1) <> 《沪港通交易方式-体内》 then */
        if v_exch_no = 3 and substring(v_asac_busi_config_str,15,1) <> 1 then

            /* set @体外指令标志# = 《体外指令标志-体外》; */
            set v_exter_comm_flag = 2;

        /* elseif @市场编号# = 《市场编号-深港通证券交易所》 and substring(@资产账户业务控制配置串#,16,1) <> 《深港通交易方式-体内》 then */
        elseif v_exch_no = 4 and substring(v_asac_busi_config_str,16,1) <> 1 then

            /* set @体外指令标志# = 《体外指令标志-体外》; */
            set v_exter_comm_flag = 2;
        end if;

        /* set @指令实际限价#=0; */
        set v_limit_actual_price=0;

        /* if @指令实际限价串# <> " " then */
        if v_limit_actual_price_str <> " " then

            /* set @指令实际限价#=cast(substring(@指令实际限价串#,1,LOCATE(@分隔符#,@指令实际限价串#)-1) as decimal(16,9)); */
            set v_limit_actual_price=cast(substring(v_limit_actual_price_str,1,LOCATE(v_split_str,v_limit_actual_price_str)-1) as decimal(16,9));
        end if;
        #获取指令实际限价
        #set @指令实际限价#=@指令限价#;

        /* if @指令限价#=0 and @指令实际限价# = 0 then */
        if v_comm_limit_price=0 and v_limit_actual_price = 0 then

            /* if @指令方向# = 《指令方向-买入》 then */
            if v_comm_dir = 1 then

                /* if @最新价# = 0 then */
                if v_last_price = 0 then

                    /* set @指令实际限价#=@昨收盘价# * (1+@指令不限价浮动比例#); */
                    set v_limit_actual_price=v_pre_close_price * (1+v_comm_no_limit_price_ratio);
                else

                    /* set @指令实际限价#=@最新价# * (1+@指令不限价浮动比例#); */
                    set v_limit_actual_price=v_last_price * (1+v_comm_no_limit_price_ratio);
                end if;

                /* if @指令实际限价# > @涨停价# and @涨停价# > 0 then */
                if v_limit_actual_price > v_up_limit_price and v_up_limit_price > 0 then

                     /* set @指令实际限价#=@涨停价#; */
                     set v_limit_actual_price=v_up_limit_price;
                end if;

            /* elseif @指令方向# = 《指令方向-卖出》 then */
            elseif v_comm_dir = 2 then

                /* if @最新价# = 0 then */
                if v_last_price = 0 then

                    /* set @指令实际限价#=@昨收盘价# * (1-@指令不限价浮动比例#); */
                    set v_limit_actual_price=v_pre_close_price * (1-v_comm_no_limit_price_ratio);
                else

                    /* set @指令实际限价#=@最新价# * (1-@指令不限价浮动比例#); */
                    set v_limit_actual_price=v_last_price * (1-v_comm_no_limit_price_ratio);
                end if;

                /* if @指令实际限价# < @跌停价# and @跌停价# > 0 then */
                if v_limit_actual_price < v_down_limit_price and v_down_limit_price > 0 then

                     /* set @指令实际限价#=@跌停价#; */
                     set v_limit_actual_price=v_down_limit_price;
                end if;
            end if;

        /* elseif @指令实际限价#=0 then */
        elseif v_limit_actual_price=0 then

            /* set @指令实际限价#=@指令限价#; */
            set v_limit_actual_price=v_comm_limit_price;
        end if;

        /* set @指令金额#= @指令实际限价# * @指令数量#; */
        set v_comm_amt= v_limit_actual_price * v_comm_qty;
        #计算指令冻结金额

        /* set @计算方向# = 《计算方向-加上》; */
        set v_calc_dir = 1;

        /* 调用【原子_交易证券_公用_计算指令冻结金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetCommFrozenAmtAndQty(
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
            v_calc_dir,
            v_error_code,
            v_error_info,
            v_comm_frozen_amt,
            v_comm_frozen_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.8.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令冻结金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #交易证券子系统检查，检查指令可用资金、可用持仓等

        /* if @指令方向# <> 《指令方向-买入》 then */
        if v_comm_dir <> 1 then

             /* set @组合代码# = " "; */
             set v_combo_code = " ";

            /* 调用【原子_交易证券_指令_校验新增指令】*/
            call db_tdsecu.pra_tdseap_CheckAddComm(
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
                v_comm_dir,
                v_comm_qty,
                v_comm_frozen_amt,
                v_impawn_ratio,
                v_stock_type,
                v_subscription_trade_mark,
                v_purchase_trade_mark,
                v_rede_trade_mark,
                v_first_minimum_amt,
                v_minimum_purchase_amt,
                v_minimum_subscription_amt,
                v_minimum_rede_share,
                v_minimum_holding_share,
                v_record_count,
                v_combo_code,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.8.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_校验新增指令出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;
        #风控子系统检查，检查指令端风控等

        /* set @处理标志#=《处理标志-已处理》; */
        set v_deal_flag=1;

        /* set @指令下达人#=@操作员编号#; */
        set v_comm_opor=v_opor_no;

        /* set @变动金额#=(@指令实际限价# * @指令数量#); */
        set v_occur_amt=(v_limit_actual_price * v_comm_qty);

        /* set @变动数量#=@指令数量#; */
        set v_occur_qty=v_comm_qty;
        #风控子系统检查，如果自动审批，则检查交易端风控等
        #if @指令审批设置#=《指令审批设置-自动审批》 and substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 then
        #    [原子_交易证券_交易_交易端证券业务合规判断]
        #end if;
        #如果自动审批，需做相应检查处理，并获取指令批号

        /* set @订单方向# = @指令方向#; */
        set v_order_dir = v_comm_dir;

        /* if @指令审批设置#=《指令审批设置-自动审批》 and substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 and (@订单方向#=《订单方向-新股申购》 or @订单方向#=《订单方向-配售申购》) then */
        if v_comm_appr_set=1 and substring(v_asac_busi_config_str,6,1)=1 and (v_order_dir=11 or v_order_dir=23) then

            /* 调用【原子_交易证券_交易_检查证券申购重复】*/
            call db_tdsecu.pra_tdsetd_CheckPurcDup(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_exch_group_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.8.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_检查证券申购重复出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;
        #新增指令记录

        /* set @指令审批状态#=《指令审批状态-未审批》; */
        set v_comm_appr_status="1";

        /* if @指令审批设置#=《指令审批设置-不设置》 then */
        if v_comm_appr_set=3 then

            /* set @指令审批状态#=《指令审批状态-不审批》; */
            set v_comm_appr_status="4";
        end if;

        /* set @组合代码# = " "; */
        set v_combo_code = " ";

        /* set @目标证券代码# = " "; */
        set v_target_stock_code = " ";

        /* set @目标证券代码编号# = 0; */
        set v_target_stock_code_no = 0;

        /* set  @工作流模式# = substring(@资产账户业务控制配置串#,25,1); */
        set  v_workflow_type = substring(v_asac_busi_config_str,25,1);

        /* 调用【原子_交易证券_指令_新增指令】*/
        call db_tdsecu.pra_tdseap_AddComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_comm_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_crncy_type,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_opor,
            v_comm_executor,
            v_comm_batch_no,
            v_comm_dir,
            v_comm_limit_price,
            v_limit_actual_price,
            v_comm_qty,
            v_comm_amt,
            v_comm_frozen_amt,
            v_comm_frozen_qty,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_appr_status,
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_basket_id,
            v_comm_oper_way,
            v_exter_comm_flag,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_combo_code,
            v_target_stock_code,
            v_target_stock_code_no,
            v_comm_remark_info,
            v_workflow_type,
            v_contra_no,
            v_asset_acco_type,
            v_exist_debt_flag,
            v_disp_opor,
            v_disp_status,
            v_acco_concat_info,
            v_error_code,
            v_error_info,
            v_comm_id,
            v_comm_status,
            v_strike_status,
            v_comm_comple_flag);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.8.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_新增指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @指令序号串# = concat(@指令序号串#,@指令序号#,";"); */
        set v_comm_id_str = concat(v_comm_id_str,v_comm_id,";");

        /* set @股东代码证券代码编号串# = concat(@股东代码证券代码编号串#,@股东代码编号#,"|",@证券代码编号#,";"); */
        set v_stock_acco_no_stock_code_no_str = concat(v_stock_acco_no_stock_code_no_str,v_stock_acco_no,"|",v_stock_code_no,";");
        #处理资金持仓数据，为保证数据表修改顺序，指令资金持仓更新需放在后边处理，以先处理指令表，再处理订单表，再处理资金持仓表
        #计算指令变动金额和数量

        /* set @计算方向# = 《计算方向-加上》; */
        set v_calc_dir = 1;

        /* 调用【原子_交易证券_公用_计算指令变动金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetCommOccurAmtAndQty(
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
            v_calc_dir,
            v_error_code,
            v_error_info,
            v_comm_occur_amt,
            v_comm_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.8.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @临时_指令变动金额# = @指令变动金额#; */
        set v_tmp_comm_occur_amt = v_comm_occur_amt;

        /* set @临时_指令变动数量# = @指令变动数量#; */
        set v_tmp_comm_occur_qty = v_comm_occur_qty;

        /* if @指令审批设置#=《指令审批设置-自动审批》 or @指令审批状态#=《指令审批状态-不审批》 then */
        if v_comm_appr_set=1 or v_comm_appr_status="4" then

            /* if @指令审批设置#=《指令审批设置-自动审批》 then */
            if v_comm_appr_set=1 then
                #审批指令

                /* set @指令审批状态#=《指令审批状态-审批通过》; */
                set v_comm_appr_status="2";

                /* set @指令审批说明#="指令自动审批通过！"; */
                set v_comm_appr_remark="指令自动审批通过！";

                /* set @指令审批操作员序号#=1; */
                set v_comm_appr_oper_no=1;
            end if;

             /* set @订单数量#=0; */
             set v_order_qty=0;

             /* set @指令撤销数量#=0; */
             set v_comm_cancel_qty=0;
               #审批指令用审批员的登录信息

              /* set @临时_操作IP# = @操作IP#; */
              set v_tmp_oper_ip_addr = v_oper_ip_addr;

              /* set @临时_操作MAC# = @操作MAC#; */
              set v_tmp_oper_mac = v_oper_mac;

              /* set @临时_操作信息# = @操作信息#; */
              set v_tmp_oper_info = v_oper_info;

              /* set @临时_操作员编号# = @操作员编号#; */
              set v_tmp_opor_no = v_opor_no;

              /* set @操作IP# = @上次登录IP#; */
              set v_oper_ip_addr = v_last_login_ip;

              /* set @操作MAC# = @上次登录MAC#; */
              set v_oper_mac = v_last_login_mac;

              /* set @操作信息# = @上次操作信息#; */
              set v_oper_info = v_last_oper_info;

              /* set @操作员编号# = @指令审批操作员#; */
              set v_opor_no = v_comm_appr_oper;

              /* set @当前操作员# = @临时_操作员编号#; */
              set v_curr_opor_no = v_tmp_opor_no;

             /* 调用【原子_交易证券_指令_审批指令】*/
             call db_tdsecu.pra_tdseap_ApprComm(
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
                 v_stock_code,
                 v_stock_code_no,
                 v_stock_type,
                 v_asset_type,
                 v_comm_date,
                 v_comm_id,
                 v_comm_opor,
                 v_comm_executor,
                 v_comm_batch_no,
                 v_comm_appr_oper_no,
                 v_comm_appr_oper,
                 v_comm_appr_status,
                 v_comm_appr_remark,
                 v_comm_qty,
                 v_comm_dir,
                 v_comm_limit_price,
                 v_limit_actual_price,
                 v_order_qty,
                 v_comm_cancel_qty,
                 v_bond_accr_intrst,
                 v_bond_rate_type,
                 v_net_price_flag,
                 v_par_value,
                 v_comm_status,
                 v_comm_begin_date,
                 v_comm_end_date,
                 v_comm_begin_time,
                 v_comm_end_time,
                 v_exter_comm_flag,
                 v_comm_oper_way,
                 v_comm_amt,
                 v_co_busi_config_str,
                 v_online_opor_no_str,
                 v_curr_opor_no,
                 v_buy_ref_rate,
                 v_sell_ref_rate,
                 v_before_comm_executor,
                 v_error_code,
                 v_error_info,
                 v_comm_occur_amt,
                 v_comm_occur_qty,
                 v_comm_appr_date,
                 v_comm_appr_time,
                 v_disp_status,
                 v_disp_opor,
                 v_auto_comm_executor);
             if v_error_code = "1" then
                 SET v_error_code = "tdsecuT.3.8.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_审批指令出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 leave label_pro;
             end if;


             /* set @临时_指令变动金额# = @临时_指令变动金额# + @指令变动金额#; */
             set v_tmp_comm_occur_amt = v_tmp_comm_occur_amt + v_comm_occur_amt;

             /* set @临时_指令变动数量# = @临时_指令变动数量# + @指令变动数量#; */
             set v_tmp_comm_occur_qty = v_tmp_comm_occur_qty + v_comm_occur_qty;

            /* if @自动分发指令执行人# >0 and @指令执行人# = 0 then */
            if v_auto_comm_executor >0 and v_comm_executor = 0 then

                /* set @指令执行人# = @自动分发指令执行人#; */
                set v_comm_executor = v_auto_comm_executor;
            end if;

            /* if substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 and @指令执行人#>0 then */
            if substring(v_asac_busi_config_str,6,1)=1 and v_comm_executor>0 then
                #设置订单相关字段值

                /* set @外部编号#=0; */
                set v_external_no=0;

                /* set @申报日期# = 0; */
                set v_report_date = 0;

                /* set @申报时间# = 0; */
                set v_report_time = 0;

                /* set @申报编号# = " "; */
                set v_report_no = " ";

                /* set @操作员编号# = @指令执行人#; */
                set v_opor_no = v_comm_executor;

                /* set @订单日期#=@初始化日期#; */
                set v_order_date=v_init_date;

                /* set @价格类型#=《价格类型-限价》; */
                set v_price_type=1;

                /* set @订单方向#=@指令方向#; */
                set v_order_dir=v_comm_dir;

                /* set @订单数量#=@指令数量#; */
                set v_order_qty=v_comm_qty;

                /* set @订单价格#=@指令实际限价#; */
                set v_order_price=v_limit_actual_price;
                #先反向更新指令

                /* set @计算方向# = 《计算方向-减去》; */
                set v_calc_dir = -1;

                /* 调用【原子_交易证券_公用_计算指令冻结金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetCommFrozenAmtAndQty(
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
                    v_calc_dir,
                    v_error_code,
                    v_error_info,
                    v_comm_frozen_amt,
                    v_comm_frozen_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.8.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令冻结金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* 调用【原子_交易证券_指令_下单更新指令】*/
                call db_tdsecu.pra_tdseap_OrderUpdateComm(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_comm_id,
                    v_comm_frozen_amt,
                    v_comm_frozen_qty,
                    v_order_qty,
                    v_error_code,
                    v_error_info,
                    v_limit_actual_price,
                    v_exter_comm_flag,
                    v_comm_comple_date,
                    v_comm_comple_time,
                    v_comm_status,
                    v_strike_status);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.8.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_下单更新指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #计算交易冻结金额

                /* 调用【原子_交易证券_公用_计算交易冻结金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetExchFrozenAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_order_dir,
                    v_order_price,
                    v_order_qty,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_all_fee,
                    v_error_code,
                    v_error_info,
                    v_trade_frozen_amt,
                    v_trade_frozen_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.8.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算交易冻结金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @订单冻结金额#=@交易冻结金额#; */
                set v_order_frozen_amt=v_trade_frozen_amt;

                /* set @订单冻结数量#=@交易冻结数量#; */
                set v_order_frozen_qty=v_trade_frozen_qty;

                /* set @备注信息#="指令自动审批后自动执行！"; */
                set v_remark_info="指令自动审批后自动执行！";
                #根据报盘机状态，设置订单状态 如果通道是允许报送状态,则直接将订单状态设为"待报"

                /* set @订单状态# = 《订单状态-未报》; */
                set v_order_status = "1";

                /* 调用【原子_交易证券_公用_获取通道状态】*/
                call db_tdsecu.pra_tdsepb_GetChannelStatus(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_pass_no,
                    v_error_code,
                    v_error_info,
                    v_pass_status);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.8.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取通道状态出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* if @通道状态# = "1" then */
                if v_pass_status = "1" then

                    /* set @订单状态# = 《订单状态-待报》; */
                    set v_order_status = "a";
                end if;

                /* set @订单操作方式# = 《订单操作方式-审批后自动下单》; */
                set v_order_oper_way = "40";

                /* set @组合代码# = " "; */
                set v_combo_code = " ";

                /* set @组合持仓序号# =0; */
                set v_combo_posi_id =0;

                /* 调用【原子_交易证券_交易_新增订单】*/
                call db_tdsecu.pra_tdsetd_AddOrder(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_init_date,
                    v_co_no,
                    v_comm_opor,
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
                    v_target_code_no,
                    v_trade_code_no,
                    v_stock_type,
                    v_asset_type,
                    v_external_no,
                    v_comm_id,
                    v_comm_batch_no,
                    v_order_batch_no,
                    v_order_date,
                    v_order_dir,
                    v_price_type,
                    v_order_price,
                    v_order_qty,
                    v_order_status,
                    v_report_date,
                    v_report_time,
                    v_report_no,
                    v_order_frozen_amt,
                    v_order_frozen_qty,
                    v_net_price_flag,
                    v_intrst_days,
                    v_par_value,
                    v_impawn_ratio,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_compli_trig_id,
                    v_remark_info,
                    v_order_oper_way,
                    v_exter_comm_flag,
                    v_cost_calc_type,
                    v_combo_code,
                    v_combo_posi_id,
                    v_target_stock_code,
                    v_target_stock_code_no,
                    v_registration_agency,
                    v_trade_acco,
                    v_contra_no,
                    v_asset_acco_type,
                    v_exist_debt_flag,
                    v_error_code,
                    v_error_info,
                    v_order_id,
                    v_order_time,
                    v_update_times);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.8.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增订单出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @订单序号串# = concat(@订单序号串#,@订单序号#,";"); */
                set v_order_id_str = concat(v_order_id_str,v_order_id,";");
                #计算指令变动金额和数量

                /* set @计算方向# = 《计算方向-减去》; */
                set v_calc_dir = -1;

                /* 调用【原子_交易证券_公用_计算指令变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetCommOccurAmtAndQty(
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
                    v_calc_dir,
                    v_error_code,
                    v_error_info,
                    v_comm_occur_amt,
                    v_comm_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.8.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @临时_指令变动金额# = @临时_指令变动金额# + @指令变动金额#; */
                set v_tmp_comm_occur_amt = v_tmp_comm_occur_amt + v_comm_occur_amt;

                /* set @临时_指令变动数量# = @临时_指令变动数量# + @指令变动数量#; */
                set v_tmp_comm_occur_qty = v_tmp_comm_occur_qty + v_comm_occur_qty;
                #计算下单交易变动金额和数量

                /* 调用【原子_交易证券_公用_计算下单交易变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetOrderTradeOccurAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_order_dir,
                    v_order_qty,
                    v_order_price,
                    v_order_frozen_amt,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_error_code,
                    v_error_info,
                    v_trade_occur_amt,
                    v_trade_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.8.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算下单交易变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            end if;

              /* set @操作IP# = @临时_操作IP#; */
              set v_oper_ip_addr = v_tmp_oper_ip_addr;

              /* set @操作MAC# = @临时_操作MAC#; */
              set v_oper_mac = v_tmp_oper_mac;

              /* set @操作信息# = @临时_操作信息#; */
              set v_oper_info = v_tmp_oper_info;

              /* set @操作员编号# = @临时_操作员编号#; */
              set v_opor_no = v_tmp_opor_no;
        end if;
        #处理订单资金持仓数据，保护指令变动和交易的变动

        /* set @指令变动金额# = @临时_指令变动金额#; */
        set v_comm_occur_amt = v_tmp_comm_occur_amt;

        /* set @指令变动数量# = @临时_指令变动数量#; */
        set v_comm_occur_qty = v_tmp_comm_occur_qty;

        /* set @业务操作员编号# = @指令执行人#; */
        set v_busi_opor_no = v_comm_executor;

        /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
        call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
            v_exch_crncy_type,
            v_comm_id,
            v_order_id,
            v_exch_no,
            v_stock_code,
            v_stock_type,
            v_asset_type,
            v_order_dir,
            v_impawn_ratio,
            v_stock_acco_no,
            v_stock_code_no,
            v_trade_code_no,
            v_target_code_no,
            v_comm_occur_amt,
            v_comm_occur_qty,
            v_trade_occur_amt,
            v_trade_occur_qty,
            v_is_record_jour,
            v_order_oper_way,
            v_busi_opor_no,
            v_open_close_permission,
            v_avail_cal_flag,
            v_combo_code,
            v_combo_posi_id,
            v_target_stock_code_no,
            v_error_code,
            v_error_info,
            v_open_posi_date);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.8.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @指令审批状态串# = concat(@指令审批状态串#,@指令审批状态#,";"); */
        set v_comm_appr_status_str = concat(v_comm_appr_status_str,v_comm_appr_status,";");

        /* set @证券代码串#=substring(@证券代码串#,LOCATE(@分隔符#,@证券代码串#)+1); */
        set v_stock_code_str=substring(v_stock_code_str,LOCATE(v_split_str,v_stock_code_str)+1);

        /* set @证券代码编号串#=substring(@证券代码编号串#,LOCATE(@分隔符#,@证券代码编号串#)+1); */
        set v_stock_code_no_str=substring(v_stock_code_no_str,LOCATE(v_split_str,v_stock_code_no_str)+1);

        /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
        set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

        /* set @指令方向串#=substring(@指令方向串#,LOCATE(@分隔符#,@指令方向串#)+1); */
        set v_comm_dir_str=substring(v_comm_dir_str,LOCATE(v_split_str,v_comm_dir_str)+1);

        /* set @指令限价串#=substring(@指令限价串#,LOCATE(@分隔符#,@指令限价串#)+1); */
        set v_limit_price_str=substring(v_limit_price_str,LOCATE(v_split_str,v_limit_price_str)+1);

        /* set @指令数量串#=substring(@指令数量串#,LOCATE(@分隔符#,@指令数量串#)+1); */
        set v_comm_qty_str=substring(v_comm_qty_str,LOCATE(v_split_str,v_comm_qty_str)+1);

        /* set @指令金额串#=substring(@指令金额串#,LOCATE(@分隔符#,@指令金额串#)+1); */
        set v_comm_amt_str=substring(v_comm_amt_str,LOCATE(v_split_str,v_comm_amt_str)+1);

        /* set @股东代码串#=substring(@股东代码串#,LOCATE(@分隔符#,@股东代码串#)+1); */
        set v_stock_acco_str=substring(v_stock_acco_str,LOCATE(v_split_str,v_stock_acco_str)+1);

        /* set @股东代码编号串#=substring(@股东代码编号串#,LOCATE(@分隔符#,@股东代码编号串#)+1); */
        set v_stock_acco_no_str=substring(v_stock_acco_no_str,LOCATE(v_split_str,v_stock_acco_no_str)+1);

        /* set @债券计提利息串#=substring(@债券计提利息串#,LOCATE(@分隔符#,@债券计提利息串#)+1); */
        set v_bond_accr_intrst_str=substring(v_bond_accr_intrst_str,LOCATE(v_split_str,v_bond_accr_intrst_str)+1);

        /* set @净价标志串#=substring(@净价标志串#,LOCATE(@分隔符#,@净价标志串#)+1); */
        set v_net_price_flag_str=substring(v_net_price_flag_str,LOCATE(v_split_str,v_net_price_flag_str)+1);

        /* set @质押比例串#=substring(@质押比例串#,LOCATE(@分隔符#,@质押比例串#)+1); */
        set v_impawn_ratio_str=substring(v_impawn_ratio_str,LOCATE(v_split_str,v_impawn_ratio_str)+1);

        /* set @证券类型串#=substring(@证券类型串#,LOCATE(@分隔符#,@证券类型串#)+1); */
        set v_stock_type_str=substring(v_stock_type_str,LOCATE(v_split_str,v_stock_type_str)+1);

        /* set @票面面值串#=substring(@票面面值串#,LOCATE(@分隔符#,@票面面值串#)+1); */
        set v_par_value_str=substring(v_par_value_str,LOCATE(v_split_str,v_par_value_str)+1);

        /* set @标的代码编号串#=substring(@标的代码编号串#,LOCATE(@分隔符#,@标的代码编号串#)+1); */
        set v_target_code_no_str=substring(v_target_code_no_str,LOCATE(v_split_str,v_target_code_no_str)+1);

        /* set @交易代码编号串#=substring(@交易代码编号串#,LOCATE(@分隔符#,@交易代码编号串#)+1); */
        set v_trade_code_no_str=substring(v_trade_code_no_str,LOCATE(v_split_str,v_trade_code_no_str)+1);

        /* set @资产类型串#=substring(@资产类型串#,LOCATE(@分隔符#,@资产类型串#)+1); */
        set v_asset_type_str=substring(v_asset_type_str,LOCATE(v_split_str,v_asset_type_str)+1);

        /* set @本币币种串#=substring(@本币币种串#,LOCATE(@分隔符#,@本币币种串#)+1); */
        set v_crncy_type_str=substring(v_crncy_type_str,LOCATE(v_split_str,v_crncy_type_str)+1);

        /* set @交易币种串#=substring(@交易币种串#,LOCATE(@分隔符#,@交易币种串#)+1); */
        set v_exch_crncy_type_str=substring(v_exch_crncy_type_str,LOCATE(v_split_str,v_exch_crncy_type_str)+1);

        /* set @买入参考汇率串#=substring(@买入参考汇率串#,LOCATE(@分隔符#,@买入参考汇率串#)+1); */
        set v_buy_ref_rate_str=substring(v_buy_ref_rate_str,LOCATE(v_split_str,v_buy_ref_rate_str)+1);

        /* set @卖出参考汇率串#=substring(@卖出参考汇率串#,LOCATE(@分隔符#,@卖出参考汇率串#)+1); */
        set v_sell_ref_rate_str=substring(v_sell_ref_rate_str,LOCATE(v_split_str,v_sell_ref_rate_str)+1);

        /* set @债券利率类型串#=substring(@债券利率类型串#,LOCATE(@分隔符#,@债券利率类型串#)+1); */
        set v_bond_rate_type_str=substring(v_bond_rate_type_str,LOCATE(v_split_str,v_bond_rate_type_str)+1);

        /* set @计息天数串#=substring(@计息天数串#,LOCATE(@分隔符#,@计息天数串#)+1); */
        set v_intrst_days_str=substring(v_intrst_days_str,LOCATE(v_split_str,v_intrst_days_str)+1);

        /* set @全部费用串#=substring(@全部费用串#,LOCATE(@分隔符#,@全部费用串#)+1); */
        set v_all_fee_str=substring(v_all_fee_str,LOCATE(v_split_str,v_all_fee_str)+1);

        /* set @涨停价串#=substring(@涨停价串#,LOCATE(@分隔符#,@涨停价串#)+1); */
        set v_up_limit_price_str=substring(v_up_limit_price_str,LOCATE(v_split_str,v_up_limit_price_str)+1);

        /* set @跌停价串#=substring(@跌停价串#,LOCATE(@分隔符#,@跌停价串#)+1); */
        set v_down_limit_price_str=substring(v_down_limit_price_str,LOCATE(v_split_str,v_down_limit_price_str)+1);

        /* set @最新价串#=substring(@最新价串#,LOCATE(@分隔符#,@最新价串#)+1); */
        set v_last_price_str=substring(v_last_price_str,LOCATE(v_split_str,v_last_price_str)+1);

        /* set @资金回转天数串#=substring(@资金回转天数串#,LOCATE(@分隔符#,@资金回转天数串#)+1); */
        set v_capit_reback_days_str=substring(v_capit_reback_days_str,LOCATE(v_split_str,v_capit_reback_days_str)+1);

        /* set @持仓回转天数串#=substring(@持仓回转天数串#,LOCATE(@分隔符#,@持仓回转天数串#)+1); */
        set v_posi_reback_days_str=substring(v_posi_reback_days_str,LOCATE(v_split_str,v_posi_reback_days_str)+1);

        /* set @交易组可用数量串# = substring(@交易组可用数量串#,LOCATE(@分隔符#,@交易组可用数量串#)+1); */
        set v_exgp_avail_qty_str = substring(v_exgp_avail_qty_str,LOCATE(v_split_str,v_exgp_avail_qty_str)+1);

        /* set @交易组标的代码可用数量串# = substring(@交易组标的代码可用数量串#,LOCATE(@分隔符#,@交易组标的代码可用数量串#)+1); */
        set v_exgp_target_code_avail_qty_str = substring(v_exgp_target_code_avail_qty_str,LOCATE(v_split_str,v_exgp_target_code_avail_qty_str)+1);

        /* set @交易组交易代码可用数量串# = substring(@交易组交易代码可用数量串#,LOCATE(@分隔符#,@交易组交易代码可用数量串#)+1); */
        set v_exgp_trade_code_avail_qty_str = substring(v_exgp_trade_code_avail_qty_str,LOCATE(v_split_str,v_exgp_trade_code_avail_qty_str)+1);

        /* set @资产账户可用数量串# = substring(@资产账户可用数量串#,LOCATE(@分隔符#,@资产账户可用数量串#)+1); */
        set v_asac_avail_qty_str = substring(v_asac_avail_qty_str,LOCATE(v_split_str,v_asac_avail_qty_str)+1);

        /* set @资产账户标的代码可用数量串# = substring(@资产账户标的代码可用数量串#,LOCATE(@分隔符#,@资产账户标的代码可用数量串#)+1); */
        set v_asac_target_code_avail_qty_str = substring(v_asac_target_code_avail_qty_str,LOCATE(v_split_str,v_asac_target_code_avail_qty_str)+1);

        /* set @资产账户交易代码可用数量串# = substring(@资产账户交易代码可用数量串#,LOCATE(@分隔符#,@资产账户交易代码可用数量串#)+1); */
        set v_asac_trade_code_avail_qty_str = substring(v_asac_trade_code_avail_qty_str,LOCATE(v_split_str,v_asac_trade_code_avail_qty_str)+1);

        /* set @认购交易标志串#=substring(@认购交易标志串#,LOCATE(@分隔符#,@认购交易标志串#)+1); */
        set v_subscription_trade_mark_str=substring(v_subscription_trade_mark_str,LOCATE(v_split_str,v_subscription_trade_mark_str)+1);

        /* set @申购交易标志串#=substring(@申购交易标志串#,LOCATE(@分隔符#,@申购交易标志串#)+1); */
        set v_purchase_trade_mark_str=substring(v_purchase_trade_mark_str,LOCATE(v_split_str,v_purchase_trade_mark_str)+1);

        /* set @赎回交易标志串#=substring(@赎回交易标志串#,LOCATE(@分隔符#,@赎回交易标志串#)+1); */
        set v_rede_trade_mark_str=substring(v_rede_trade_mark_str,LOCATE(v_split_str,v_rede_trade_mark_str)+1);

        /* set @首次最低金额串#=substring(@首次最低金额串#,LOCATE(@分隔符#,@首次最低金额串#)+1); */
        set v_first_minimum_amt_str=substring(v_first_minimum_amt_str,LOCATE(v_split_str,v_first_minimum_amt_str)+1);

        /* set @最低申购金额串#=substring(@最低申购金额串#,LOCATE(@分隔符#,@最低申购金额串#)+1); */
        set v_minimum_purchase_amt_str=substring(v_minimum_purchase_amt_str,LOCATE(v_split_str,v_minimum_purchase_amt_str)+1);

        /* set @最低认购金额串#=substring(@最低认购金额串#,LOCATE(@分隔符#,@最低认购金额串#)+1); */
        set v_minimum_subscription_amt_str=substring(v_minimum_subscription_amt_str,LOCATE(v_split_str,v_minimum_subscription_amt_str)+1);

        /* set @最低赎回份额串#=substring(@最低赎回份额串#,LOCATE(@分隔符#,@最低赎回份额串#)+1); */
        set v_minimum_rede_share_str=substring(v_minimum_rede_share_str,LOCATE(v_split_str,v_minimum_rede_share_str)+1);

        /* set @最低持有份额串#=substring(@最低持有份额串#,LOCATE(@分隔符#,@最低持有份额串#)+1); */
        set v_minimum_holding_share_str=substring(v_minimum_holding_share_str,LOCATE(v_split_str,v_minimum_holding_share_str)+1);

        /* if @指令实际限价串# <> " " then */
        if v_limit_actual_price_str <> " " then

            /* set @指令实际限价串#=substring(@指令实际限价串#,LOCATE(@分隔符#,@指令实际限价串#)+1); */
            set v_limit_actual_price_str=substring(v_limit_actual_price_str,LOCATE(v_split_str,v_limit_actual_price_str)+1);
        end if;

    /* [事务结束] */
    COMMIT;

    end while;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_date = v_comm_date;
    SET p_comm_id_str = v_comm_id_str;
    SET p_comm_appr_status_str = v_comm_appr_status_str;
    SET p_order_id_str = v_order_id_str;
    SET p_stock_acco_no_stock_code_no_str = v_stock_acco_no_stock_code_no_str;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_新增组合指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_AddComboComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_AddComboComm(
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
    IN p_out_acco varchar(32),
    IN p_crncy_type_str varchar(2048),
    IN p_exch_crncy_type_str varchar(2048),
    IN p_buy_ref_rate_str varchar(2048),
    IN p_sell_ref_rate_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no_str varchar(4096),
    IN p_stock_acco_str varchar(2048),
    IN p_stock_code_no_str varchar(4096),
    IN p_stock_code_str varchar(4096),
    IN p_target_stock_code_str varchar(4096),
    IN p_target_stock_code_no_str varchar(4096),
    IN p_target_code_no_str varchar(4096),
    IN p_trade_code_no_str varchar(4096),
    IN p_stock_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
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
    IN p_exgp_avail_qty_str varchar(4096),
    IN p_exgp_target_code_avail_qty_str varchar(4096),
    IN p_exgp_trade_code_avail_qty_str varchar(4096),
    IN p_asac_avail_qty_str varchar(4096),
    IN p_asac_target_code_avail_qty_str varchar(4096),
    IN p_asac_trade_code_avail_qty_str varchar(4096),
    IN p_exgp_busi_config_str varchar(64),
    IN p_asac_busi_config_str varchar(64),
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_batch_no int,
    IN p_comm_dir_str varchar(2048),
    IN p_limit_price_str varchar(4096),
    IN p_limit_actual_price_str varchar(4096),
    IN p_comm_qty_str varchar(4096),
    IN p_comm_amt_str varchar(4096),
    IN p_comm_begin_date int,
    IN p_comm_end_date int,
    IN p_comm_begin_time int,
    IN p_comm_end_time int,
    IN p_comm_appr_oper int,
    IN p_all_fee_str varchar(4096),
    IN p_up_limit_price_str varchar(4096),
    IN p_down_limit_price_str varchar(4096),
    IN p_last_price_str varchar(4096),
    IN p_nav_asset decimal(18,4),
    IN p_net_price_flag_str varchar(2048),
    IN p_par_value_str varchar(4096),
    IN p_impawn_ratio_str varchar(4096),
    IN p_intrst_days_str varchar(2048),
    IN p_bond_accr_intrst_str varchar(4096),
    IN p_bond_rate_type_str varchar(4096),
    IN p_capit_reback_days_str varchar(2048),
    IN p_posi_reback_days_str varchar(2048),
    IN p_basket_id bigint,
    IN p_comm_oper_way varchar(2),
    IN p_exter_comm_flag int,
    IN p_split_str varchar(4),
    IN p_cost_calc_type int,
    IN p_comm_no_limit_price_ratio decimal(18,12),
    IN p_pre_close_price_str varchar(4096),
    IN p_subscription_trade_mark_str varchar(4096),
    IN p_target_subscrip_trade_mark_str varchar(4096),
    IN p_purchase_trade_mark_str varchar(4096),
    IN p_target_purchase_trade_mark_str varchar(4096),
    IN p_rede_trade_mark_str varchar(4096),
    IN p_target_rede_trade_mark_str varchar(4096),
    IN p_first_minimum_amt_str varchar(4096),
    IN p_target_first_minimum_amt_str varchar(4096),
    IN p_minimum_purchase_amt_str varchar(4096),
    IN p_target_min_purchase_amt_str varchar(4096),
    IN p_minimum_subscription_amt_str varchar(4096),
    IN p_target_min_subscrip_amt_str varchar(4096),
    IN p_minimum_rede_share_str varchar(4096),
    IN p_target_min_rede_share_str varchar(4096),
    IN p_minimum_holding_share_str varchar(4096),
    IN p_target_min_holding_share_str varchar(4096),
    IN p_charging_method_str varchar(4096),
    IN p_target_charging_method_str varchar(4096),
    IN p_fund_manager_str varchar(4096),
    IN p_target_fund_manager_str varchar(4096),
    IN p_record_count int,
    IN p_combo_code varchar(32),
    IN p_combo_copies decimal(18,2),
    IN p_combo_posi_id_str varchar(2048),
    IN p_registration_agency_str varchar(4096),
    IN p_trade_acco varchar(32),
    IN p_last_login_ip varchar(32),
    IN p_last_login_mac varchar(32),
    IN p_last_login_date int,
    IN p_last_oper_info varchar(255),
    IN p_online_status int,
    IN p_sys_config_str varchar(64),
    IN p_asset_acco_type int,
    IN p_co_busi_config_str varchar(64),
    IN p_online_opor_no_str varchar(2048),
    IN p_acco_concat_info varchar(4096),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_date int,
    OUT p_comm_id_str varchar(2048),
    OUT p_comm_appr_status_str varchar(2048),
    OUT p_order_id_str varchar(2048)
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
    declare v_out_acco varchar(32);
    declare v_crncy_type_str varchar(2048);
    declare v_exch_crncy_type_str varchar(2048);
    declare v_buy_ref_rate_str varchar(2048);
    declare v_sell_ref_rate_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no_str varchar(4096);
    declare v_stock_acco_str varchar(2048);
    declare v_stock_code_no_str varchar(4096);
    declare v_stock_code_str varchar(4096);
    declare v_target_stock_code_str varchar(4096);
    declare v_target_stock_code_no_str varchar(4096);
    declare v_target_code_no_str varchar(4096);
    declare v_trade_code_no_str varchar(4096);
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
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
    declare v_exgp_avail_qty_str varchar(4096);
    declare v_exgp_target_code_avail_qty_str varchar(4096);
    declare v_exgp_trade_code_avail_qty_str varchar(4096);
    declare v_asac_avail_qty_str varchar(4096);
    declare v_asac_target_code_avail_qty_str varchar(4096);
    declare v_asac_trade_code_avail_qty_str varchar(4096);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_batch_no int;
    declare v_comm_dir_str varchar(2048);
    declare v_limit_price_str varchar(4096);
    declare v_limit_actual_price_str varchar(4096);
    declare v_comm_qty_str varchar(4096);
    declare v_comm_amt_str varchar(4096);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_appr_oper int;
    declare v_all_fee_str varchar(4096);
    declare v_up_limit_price_str varchar(4096);
    declare v_down_limit_price_str varchar(4096);
    declare v_last_price_str varchar(4096);
    declare v_nav_asset decimal(18,4);
    declare v_net_price_flag_str varchar(2048);
    declare v_par_value_str varchar(4096);
    declare v_impawn_ratio_str varchar(4096);
    declare v_intrst_days_str varchar(2048);
    declare v_bond_accr_intrst_str varchar(4096);
    declare v_bond_rate_type_str varchar(4096);
    declare v_capit_reback_days_str varchar(2048);
    declare v_posi_reback_days_str varchar(2048);
    declare v_basket_id bigint;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_split_str varchar(4);
    declare v_cost_calc_type int;
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_pre_close_price_str varchar(4096);
    declare v_subscription_trade_mark_str varchar(4096);
    declare v_target_subscrip_trade_mark_str varchar(4096);
    declare v_purchase_trade_mark_str varchar(4096);
    declare v_target_purchase_trade_mark_str varchar(4096);
    declare v_rede_trade_mark_str varchar(4096);
    declare v_target_rede_trade_mark_str varchar(4096);
    declare v_first_minimum_amt_str varchar(4096);
    declare v_target_first_minimum_amt_str varchar(4096);
    declare v_minimum_purchase_amt_str varchar(4096);
    declare v_target_min_purchase_amt_str varchar(4096);
    declare v_minimum_subscription_amt_str varchar(4096);
    declare v_target_min_subscrip_amt_str varchar(4096);
    declare v_minimum_rede_share_str varchar(4096);
    declare v_target_min_rede_share_str varchar(4096);
    declare v_minimum_holding_share_str varchar(4096);
    declare v_target_min_holding_share_str varchar(4096);
    declare v_charging_method_str varchar(4096);
    declare v_target_charging_method_str varchar(4096);
    declare v_fund_manager_str varchar(4096);
    declare v_target_fund_manager_str varchar(4096);
    declare v_record_count int;
    declare v_combo_code varchar(32);
    declare v_combo_copies decimal(18,2);
    declare v_combo_posi_id_str varchar(2048);
    declare v_registration_agency_str varchar(4096);
    declare v_trade_acco varchar(32);
    declare v_last_login_ip varchar(32);
    declare v_last_login_mac varchar(32);
    declare v_last_login_date int;
    declare v_last_oper_info varchar(255);
    declare v_online_status int;
    declare v_sys_config_str varchar(64);
    declare v_asset_acco_type int;
    declare v_co_busi_config_str varchar(64);
    declare v_online_opor_no_str varchar(2048);
    declare v_acco_concat_info varchar(4096);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_date int;
    declare v_comm_id_str varchar(2048);
    declare v_comm_appr_status_str varchar(2048);
    declare v_order_id_str varchar(2048);
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_avail_cal_flag int;
    declare v_compli_trig_id bigint;
    declare v_comm_remark_info varchar(1024);
    declare v_contra_no varchar(32);
    declare v_exist_debt_flag int;
    declare v_order_batch_no int;
    declare v_comm_appr_set int;
    declare v_disp_opor int;
    declare v_disp_status int;
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_order_status varchar(2);
    declare v_pass_status varchar(2);
    declare v_before_comm_executor int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_exch_no int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_stock_acco varchar(16);
    declare v_stock_acco_no int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_net_price_flag int;
    declare v_impawn_ratio decimal(18,12);
    declare v_stock_type int;
    declare v_par_value decimal(16,9);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_bond_rate_type int;
    declare v_intrst_days int;
    declare v_all_fee decimal(18,4);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_exgp_avail_qty decimal(18,2);
    declare v_exgp_target_code_avail_qty decimal(18,2);
    declare v_exgp_trade_code_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_asac_target_code_avail_qty decimal(18,2);
    declare v_asac_trade_code_avail_qty decimal(18,2);
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_target_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_combo_posi_id bigint;
    declare v_fund_manager varchar(64);
    declare v_target_fund_manager varchar(64);
    declare v_charging_method int;
    declare v_target_charging_method int;
    declare v_registration_agency varchar(32);
    declare v_calc_dir int;
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_deal_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_comm_appr_status varchar(2);
    declare v_workflow_type int;
    declare v_comm_id bigint;
    declare v_comm_status varchar(2);
    declare v_strike_status varchar(2);
    declare v_comm_comple_flag int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_tmp_comm_occur_amt decimal(18,4);
    declare v_tmp_comm_occur_qty decimal(18,2);
    declare v_comm_appr_remark varchar(255);
    declare v_comm_appr_oper_no int;
    declare v_comm_cancel_qty decimal(18,2);
    declare v_tmp_oper_ip_addr varchar(32);
    declare v_tmp_oper_mac varchar(32);
    declare v_tmp_oper_info varchar(1024);
    declare v_tmp_opor_no int;
    declare v_curr_opor_no int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_auto_comm_executor int;
    declare v_appr_allow_order_flag int;
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_order_oper_way varchar(2);
    declare v_order_id bigint;
    declare v_order_time int;
    declare v_update_times int;
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_waste_qty decimal(18,2);
    declare v_busi_opor_no int;
    declare v_open_posi_date int;
    declare v_combo_status varchar(2);
    declare v_combo_cost decimal(18,4);
    declare v_combo_market_value decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);

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
    SET v_out_acco = p_out_acco;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_exch_crncy_type_str = p_exch_crncy_type_str;
    SET v_buy_ref_rate_str = p_buy_ref_rate_str;
    SET v_sell_ref_rate_str = p_sell_ref_rate_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no_str = p_stock_acco_no_str;
    SET v_stock_acco_str = p_stock_acco_str;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_stock_code_str = p_stock_code_str;
    SET v_target_stock_code_str = p_target_stock_code_str;
    SET v_target_stock_code_no_str = p_target_stock_code_no_str;
    SET v_target_code_no_str = p_target_code_no_str;
    SET v_trade_code_no_str = p_trade_code_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_asset_type_str = p_asset_type_str;
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
    SET v_exgp_avail_qty_str = p_exgp_avail_qty_str;
    SET v_exgp_target_code_avail_qty_str = p_exgp_target_code_avail_qty_str;
    SET v_exgp_trade_code_avail_qty_str = p_exgp_trade_code_avail_qty_str;
    SET v_asac_avail_qty_str = p_asac_avail_qty_str;
    SET v_asac_target_code_avail_qty_str = p_asac_target_code_avail_qty_str;
    SET v_asac_trade_code_avail_qty_str = p_asac_trade_code_avail_qty_str;
    SET v_exgp_busi_config_str = p_exgp_busi_config_str;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_limit_price_str = p_limit_price_str;
    SET v_limit_actual_price_str = p_limit_actual_price_str;
    SET v_comm_qty_str = p_comm_qty_str;
    SET v_comm_amt_str = p_comm_amt_str;
    SET v_comm_begin_date = p_comm_begin_date;
    SET v_comm_end_date = p_comm_end_date;
    SET v_comm_begin_time = p_comm_begin_time;
    SET v_comm_end_time = p_comm_end_time;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_all_fee_str = p_all_fee_str;
    SET v_up_limit_price_str = p_up_limit_price_str;
    SET v_down_limit_price_str = p_down_limit_price_str;
    SET v_last_price_str = p_last_price_str;
    SET v_nav_asset = p_nav_asset;
    SET v_net_price_flag_str = p_net_price_flag_str;
    SET v_par_value_str = p_par_value_str;
    SET v_impawn_ratio_str = p_impawn_ratio_str;
    SET v_intrst_days_str = p_intrst_days_str;
    SET v_bond_accr_intrst_str = p_bond_accr_intrst_str;
    SET v_bond_rate_type_str = p_bond_rate_type_str;
    SET v_capit_reback_days_str = p_capit_reback_days_str;
    SET v_posi_reback_days_str = p_posi_reback_days_str;
    SET v_basket_id = p_basket_id;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_split_str = p_split_str;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_comm_no_limit_price_ratio = p_comm_no_limit_price_ratio;
    SET v_pre_close_price_str = p_pre_close_price_str;
    SET v_subscription_trade_mark_str = p_subscription_trade_mark_str;
    SET v_target_subscrip_trade_mark_str = p_target_subscrip_trade_mark_str;
    SET v_purchase_trade_mark_str = p_purchase_trade_mark_str;
    SET v_target_purchase_trade_mark_str = p_target_purchase_trade_mark_str;
    SET v_rede_trade_mark_str = p_rede_trade_mark_str;
    SET v_target_rede_trade_mark_str = p_target_rede_trade_mark_str;
    SET v_first_minimum_amt_str = p_first_minimum_amt_str;
    SET v_target_first_minimum_amt_str = p_target_first_minimum_amt_str;
    SET v_minimum_purchase_amt_str = p_minimum_purchase_amt_str;
    SET v_target_min_purchase_amt_str = p_target_min_purchase_amt_str;
    SET v_minimum_subscription_amt_str = p_minimum_subscription_amt_str;
    SET v_target_min_subscrip_amt_str = p_target_min_subscrip_amt_str;
    SET v_minimum_rede_share_str = p_minimum_rede_share_str;
    SET v_target_min_rede_share_str = p_target_min_rede_share_str;
    SET v_minimum_holding_share_str = p_minimum_holding_share_str;
    SET v_target_min_holding_share_str = p_target_min_holding_share_str;
    SET v_charging_method_str = p_charging_method_str;
    SET v_target_charging_method_str = p_target_charging_method_str;
    SET v_fund_manager_str = p_fund_manager_str;
    SET v_target_fund_manager_str = p_target_fund_manager_str;
    SET v_record_count = p_record_count;
    SET v_combo_code = p_combo_code;
    SET v_combo_copies = p_combo_copies;
    SET v_combo_posi_id_str = p_combo_posi_id_str;
    SET v_registration_agency_str = p_registration_agency_str;
    SET v_trade_acco = p_trade_acco;
    SET v_last_login_ip = p_last_login_ip;
    SET v_last_login_mac = p_last_login_mac;
    SET v_last_login_date = p_last_login_date;
    SET v_last_oper_info = p_last_oper_info;
    SET v_online_status = p_online_status;
    SET v_sys_config_str = p_sys_config_str;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_online_opor_no_str = p_online_opor_no_str;
    SET v_acco_concat_info = p_acco_concat_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_id_str = " ";
    SET v_comm_appr_status_str = " ";
    SET v_order_id_str = " ";
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_avail_cal_flag = 0;
    SET v_compli_trig_id = 0;
    SET v_comm_remark_info = " ";
    SET v_contra_no = " ";
    SET v_exist_debt_flag = 0;
    SET v_order_batch_no = 0;
    SET v_comm_appr_set = 0;
    SET v_disp_opor = 0;
    SET v_disp_status = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_order_status = "0";
    SET v_pass_status = "0";
    SET v_before_comm_executor = 0;
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_exch_no = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_stock_acco = " ";
    SET v_stock_acco_no = 0;
    SET v_bond_accr_intrst = 0;
    SET v_net_price_flag = 0;
    SET v_impawn_ratio = 0;
    SET v_stock_type = 0;
    SET v_par_value = 0;
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_bond_rate_type = 0;
    SET v_intrst_days = 0;
    SET v_all_fee = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_pre_close_price = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_exgp_avail_qty = 0;
    SET v_exgp_target_code_avail_qty = 0;
    SET v_exgp_trade_code_avail_qty = 0;
    SET v_asac_avail_qty = 0;
    SET v_asac_target_code_avail_qty = 0;
    SET v_asac_trade_code_avail_qty = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_target_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_combo_posi_id = 0;
    SET v_fund_manager = " ";
    SET v_target_fund_manager = " ";
    SET v_charging_method = 0;
    SET v_target_charging_method = 0;
    SET v_registration_agency = " ";
    SET v_calc_dir = 1;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_order_dir = 0;
    SET v_order_qty = 0;
    SET v_deal_flag = 0;
    SET v_occur_amt = 0;
    SET v_occur_qty = 0;
    SET v_comm_appr_status = " ";
    SET v_workflow_type = 0;
    SET v_comm_id = 0;
    SET v_comm_status = "0";
    SET v_strike_status = "0";
    SET v_comm_comple_flag = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_tmp_comm_occur_amt = 0;
    SET v_tmp_comm_occur_qty = 0;
    SET v_comm_appr_remark = " ";
    SET v_comm_appr_oper_no = 0;
    SET v_comm_cancel_qty = 0;
    SET v_tmp_oper_ip_addr = " ";
    SET v_tmp_oper_mac = " ";
    SET v_tmp_oper_info = " ";
    SET v_tmp_opor_no = 0;
    SET v_curr_opor_no = 0;
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_auto_comm_executor = 0;
    SET v_appr_allow_order_flag = 0;
    SET v_external_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_remark_info = " ";
    SET v_order_oper_way = " ";
    SET v_order_id = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_wtdraw_qty = 0;
    SET v_waste_qty = 0;
    SET v_busi_opor_no = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_combo_status = "0";
    SET v_combo_cost = 0;
    SET v_combo_market_value = 0;
    SET v_realize_pandl = 0;
    SET v_sum_realize_pandl = 0;

    
    label_pro:BEGIN
    

    /* set @指令日期# = @初始化日期#; */
    set v_comm_date = v_init_date;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;

    /* set @可用计算标志# = 0; */
    set v_avail_cal_flag = 0;

    /* set @合规触警序号# = 0; */
    set v_compli_trig_id = 0;

    /* set @指令备注信息#=" "; */
    set v_comm_remark_info=" ";

    /* set @合同编号#=" "; */
    set v_contra_no=" ";

    /* set @存在负债标志# = 《存在负债标志-不存在》; */
    set v_exist_debt_flag = 1;

    /* set @订单批号#=0; */
    set v_order_batch_no=0;

    /* set @指令审批设置# = substring(@资产账户业务控制配置串#,5,1); */
    set v_comm_appr_set = substring(v_asac_busi_config_str,5,1);

    /* set @分发操作员# = 0 ; */
    set v_disp_opor = 0 ;

    /* set @分发状态# = 《分发状态-待分发》; */
    set v_disp_status = 3;
     #PB系统自动审批获取审批操作员登录信息，审批操作员不在线状态下不能自动审批

    /* if   @指令审批设置#=《指令审批设置-自动审批》 and substring(@系统控制配置串#,7,1) =《系统类型-PB系统》  then */
    if   v_comm_appr_set=1 and substring(v_sys_config_str,7,1) =1  then

        /* if @在线状态# <>《在线状态-在线》 then */
        if v_online_status <>1 then

            /* set  @指令审批设置# = 《指令审批设置-手工审批》; */
            set  v_comm_appr_set = 2;
        end if;
    end if;

    /* if @指令审批设置#=《指令审批设置-自动审批》 and substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 then */
    if v_comm_appr_set=1 and substring(v_asac_busi_config_str,6,1)=1 then

        /* set @编号类型#=《编号类型-订单批号》; */
        set v_record_no_type=18;

        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_交易证券_公用_获取业务记录编号】*/
            call db_tdsecu.pra_tdsepb_GetCoBusiRecordNo(
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
                SET v_error_code = "tdsecuT.3.9.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


        /* [事务结束] */
        COMMIT;


        /* set @订单批号#=@当前编号#; */
        set v_order_batch_no=v_curr_no;
        #根据报盘机状态，设置订单状态 如果通道是允许报送状态,则直接将订单状态设为"待报"

        /* set @订单状态# = 《订单状态-未报》; */
        set v_order_status = "1";

        /* 调用【原子_交易证券_公用_获取通道状态】*/
        call db_tdsecu.pra_tdsepb_GetChannelStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pass_no,
            v_error_code,
            v_error_info,
            v_pass_status);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取通道状态出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* if @通道状态# = "1" then */
        if v_pass_status = "1" then

            /* set @订单状态# = 《订单状态-待报》; */
            set v_order_status = "a";
        end if;
    end if;
    #篮子指令不传批号，自己获取

    /* if @指令批号# = 0 then */
    if v_comm_batch_no = 0 then

        /* set @编号类型#=《编号类型-指令批号》; */
        set v_record_no_type=17;

        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_交易证券_公用_获取业务记录编号】*/
            call db_tdsecu.pra_tdsepb_GetCoBusiRecordNo(
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
                SET v_error_code = "tdsecuT.3.9.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


        /* [事务结束] */
        COMMIT;


        /* set @指令批号#=@当前编号#; */
        set v_comm_batch_no=v_curr_no;
    end if;

    /* set @指令序号串# = ""; */
    set v_comm_id_str = "";

    /* set @指令审批状态串# = ""; */
    set v_comm_appr_status_str = "";

    /* set @订单序号串# = ""; */
    set v_order_id_str = "";

    /* set @前指令执行人# = 0; */
    set v_before_comm_executor = 0;

    /* while LOCATE(@分隔符#,@证券代码串#)<>0   do */
    while LOCATE(v_split_str,v_stock_code_str)<>0   do

    /* [事务开始] */
    START TRANSACTION;

    #截取前面每一位

        /* set @证券代码#=substring(@证券代码串#,1,LOCATE(@分隔符#,@证券代码串#)-1); */
        set v_stock_code=substring(v_stock_code_str,1,LOCATE(v_split_str,v_stock_code_str)-1);

        /* set @证券代码编号#=cast(substring(@证券代码编号串#,1,LOCATE(@分隔符#,@证券代码编号串#)-1) as SIGNED); */
        set v_stock_code_no=cast(substring(v_stock_code_no_str,1,LOCATE(v_split_str,v_stock_code_no_str)-1) as SIGNED);

        /* set @目标证券代码#=substring(@目标证券代码串#,1,LOCATE(@分隔符#,@目标证券代码串#)-1); */
        set v_target_stock_code=substring(v_target_stock_code_str,1,LOCATE(v_split_str,v_target_stock_code_str)-1);

        /* set @目标证券代码编号#=cast(substring(@目标证券代码编号串#,1,LOCATE(@分隔符#,@目标证券代码编号串#)-1) as SIGNED); */
        set v_target_stock_code_no=cast(substring(v_target_stock_code_no_str,1,LOCATE(v_split_str,v_target_stock_code_no_str)-1) as SIGNED);

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

        /* set @指令方向#=cast(substring(@指令方向串#,1,LOCATE(@分隔符#,@指令方向串#)-1) as SIGNED); */
        set v_comm_dir=cast(substring(v_comm_dir_str,1,LOCATE(v_split_str,v_comm_dir_str)-1) as SIGNED);

        /* [检查报错返回][@指令方向# <> 《指令方向-基金申购》 and @指令方向# <> 《指令方向-基金赎回》 and @指令方向# <> 《指令方向-买入》 and @指令方向# <> 《指令方向-卖出》 and @指令方向# <> 《指令方向-基金转换》][639][@指令方向#] */
        if v_comm_dir <> 9 and v_comm_dir <> 10 and v_comm_dir <> 1 and v_comm_dir <> 2 and v_comm_dir <> 12 then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.9.639";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令方向=",v_comm_dir),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令方向=",v_comm_dir);
            end if;
            leave label_pro;
        end if;


        /* set @指令限价#=cast(substring(@指令限价串#,1,LOCATE(@分隔符#,@指令限价串#)-1) as decimal(16,9)); */
        set v_comm_limit_price=cast(substring(v_limit_price_str,1,LOCATE(v_split_str,v_limit_price_str)-1) as decimal(16,9));

        /* set @指令实际限价#=cast(substring(@指令实际限价串#,1,LOCATE(@分隔符#,@指令实际限价串#)-1) as decimal(16,9)); */
        set v_limit_actual_price=cast(substring(v_limit_actual_price_str,1,LOCATE(v_split_str,v_limit_actual_price_str)-1) as decimal(16,9));

        /* set @指令数量#=cast(substring(@指令数量串#,1,LOCATE(@分隔符#,@指令数量串#)-1) as decimal(18,2)); */
        set v_comm_qty=cast(substring(v_comm_qty_str,1,LOCATE(v_split_str,v_comm_qty_str)-1) as decimal(18,2));

        /* set @指令金额#=cast(substring(@指令金额串#,1,LOCATE(@分隔符#,@指令金额串#)-1) as decimal(32,4)); */
        set v_comm_amt=cast(substring(v_comm_amt_str,1,LOCATE(v_split_str,v_comm_amt_str)-1) as decimal(32,4));

        /* set @股东代码#=substring(@股东代码串#,1,LOCATE(@分隔符#,@股东代码串#)-1); */
        set v_stock_acco=substring(v_stock_acco_str,1,LOCATE(v_split_str,v_stock_acco_str)-1);

        /* set @股东代码编号#=cast(substring(@股东代码编号串#,1,LOCATE(@分隔符#,@股东代码编号串#)-1) as SIGNED); */
        set v_stock_acco_no=cast(substring(v_stock_acco_no_str,1,LOCATE(v_split_str,v_stock_acco_no_str)-1) as SIGNED);

        /* set @债券计提利息#=cast(substring(@债券计提利息串#,1,LOCATE(@分隔符#,@债券计提利息串#)-1) as decimal(18,12)); */
        set v_bond_accr_intrst=cast(substring(v_bond_accr_intrst_str,1,LOCATE(v_split_str,v_bond_accr_intrst_str)-1) as decimal(18,12));

        /* set @净价标志#=substring(@净价标志串#,1,LOCATE(@分隔符#,@净价标志串#)-1); */
        set v_net_price_flag=substring(v_net_price_flag_str,1,LOCATE(v_split_str,v_net_price_flag_str)-1);

        /* set @质押比例#=cast(substring(@质押比例串#,1,LOCATE(@分隔符#,@质押比例串#)-1) as decimal(18,12)); */
        set v_impawn_ratio=cast(substring(v_impawn_ratio_str,1,LOCATE(v_split_str,v_impawn_ratio_str)-1) as decimal(18,12));

        /* set @证券类型#=cast(substring(@证券类型串#,1,LOCATE(@分隔符#,@证券类型串#)-1) as SIGNED); */
        set v_stock_type=cast(substring(v_stock_type_str,1,LOCATE(v_split_str,v_stock_type_str)-1) as SIGNED);

        /* set @票面面值#=cast(substring(@票面面值串#,1,LOCATE(@分隔符#,@票面面值串#)-1) as decimal(16,9)); */
        set v_par_value=cast(substring(v_par_value_str,1,LOCATE(v_split_str,v_par_value_str)-1) as decimal(16,9));

        /* set @标的代码编号#=cast(substring(@标的代码编号串#,1,LOCATE(@分隔符#,@标的代码编号串#)-1) as SIGNED); */
        set v_target_code_no=cast(substring(v_target_code_no_str,1,LOCATE(v_split_str,v_target_code_no_str)-1) as SIGNED);

        /* set @交易代码编号#=cast(substring(@交易代码编号串#,1,LOCATE(@分隔符#,@交易代码编号串#)-1) as SIGNED); */
        set v_trade_code_no=cast(substring(v_trade_code_no_str,1,LOCATE(v_split_str,v_trade_code_no_str)-1) as SIGNED);

        /* set @资产类型#=cast(substring(@资产类型串#,1,LOCATE(@分隔符#,@资产类型串#)-1) as SIGNED); */
        set v_asset_type=cast(substring(v_asset_type_str,1,LOCATE(v_split_str,v_asset_type_str)-1) as SIGNED);

        /* set @本币币种#=substring(@本币币种串#,1,LOCATE(@分隔符#,@本币币种串#)-1); */
        set v_crncy_type=substring(v_crncy_type_str,1,LOCATE(v_split_str,v_crncy_type_str)-1);

        /* set @交易币种#=substring(@交易币种串#,1,LOCATE(@分隔符#,@交易币种串#)-1); */
        set v_exch_crncy_type=substring(v_exch_crncy_type_str,1,LOCATE(v_split_str,v_exch_crncy_type_str)-1);

        /* set @买入参考汇率#=cast(substring(@买入参考汇率串#,1,LOCATE(@分隔符#,@买入参考汇率串#)-1) as decimal(18,12)); */
        set v_buy_ref_rate=cast(substring(v_buy_ref_rate_str,1,LOCATE(v_split_str,v_buy_ref_rate_str)-1) as decimal(18,12));

        /* set @卖出参考汇率#=cast(substring(@卖出参考汇率串#,1,LOCATE(@分隔符#,@卖出参考汇率串#)-1) as decimal(18,12)); */
        set v_sell_ref_rate=cast(substring(v_sell_ref_rate_str,1,LOCATE(v_split_str,v_sell_ref_rate_str)-1) as decimal(18,12));

        /* set @债券利率类型#=cast(substring(@债券利率类型串#,1,LOCATE(@分隔符#,@债券利率类型串#)-1) as SIGNED); */
        set v_bond_rate_type=cast(substring(v_bond_rate_type_str,1,LOCATE(v_split_str,v_bond_rate_type_str)-1) as SIGNED);

        /* set @计息天数#=cast(substring(@计息天数串#,1,LOCATE(@分隔符#,@计息天数串#)-1) as SIGNED); */
        set v_intrst_days=cast(substring(v_intrst_days_str,1,LOCATE(v_split_str,v_intrst_days_str)-1) as SIGNED);

        /* set @全部费用#=cast(substring(@全部费用串#,1,LOCATE(@分隔符#,@全部费用串#)-1) as decimal(32,6)); */
        set v_all_fee=cast(substring(v_all_fee_str,1,LOCATE(v_split_str,v_all_fee_str)-1) as decimal(32,6));

        /* set @涨停价#=cast(substring(@涨停价串#,1,LOCATE(@分隔符#,@涨停价串#)-1) as decimal(16,9)); */
        set v_up_limit_price=cast(substring(v_up_limit_price_str,1,LOCATE(v_split_str,v_up_limit_price_str)-1) as decimal(16,9));

        /* set @跌停价#=cast(substring(@跌停价串#,1,LOCATE(@分隔符#,@跌停价串#)-1) as decimal(16,9)); */
        set v_down_limit_price=cast(substring(v_down_limit_price_str,1,LOCATE(v_split_str,v_down_limit_price_str)-1) as decimal(16,9));

        /* set @最新价#=cast(substring(@最新价串#,1,LOCATE(@分隔符#,@最新价串#)-1) as decimal(16,9)); */
        set v_last_price=cast(substring(v_last_price_str,1,LOCATE(v_split_str,v_last_price_str)-1) as decimal(16,9));

        /* set @昨收盘价#=cast(substring(@昨收盘价串#,1,LOCATE(@分隔符#,@昨收盘价串#)-1) as decimal(16,9)); */
        set v_pre_close_price=cast(substring(v_pre_close_price_str,1,LOCATE(v_split_str,v_pre_close_price_str)-1) as decimal(16,9));

        /* set @资金回转天数#=cast(substring(@资金回转天数串#,1,LOCATE(@分隔符#,@资金回转天数串#)-1) as SIGNED); */
        set v_capit_reback_days=cast(substring(v_capit_reback_days_str,1,LOCATE(v_split_str,v_capit_reback_days_str)-1) as SIGNED);

        /* set @持仓回转天数#=cast(substring(@持仓回转天数串#,1,LOCATE(@分隔符#,@持仓回转天数串#)-1) as SIGNED); */
        set v_posi_reback_days=cast(substring(v_posi_reback_days_str,1,LOCATE(v_split_str,v_posi_reback_days_str)-1) as SIGNED);

        /* set @交易组可用数量# = cast(substring(@交易组可用数量串#,1,LOCATE(@分隔符#,@交易组可用数量串#)-1) as decimal(18,2)); */
        set v_exgp_avail_qty = cast(substring(v_exgp_avail_qty_str,1,LOCATE(v_split_str,v_exgp_avail_qty_str)-1) as decimal(18,2));

        /* set @交易组标的代码可用数量# = cast(substring(@交易组标的代码可用数量串#,1,LOCATE(@分隔符#,@交易组标的代码可用数量串#)-1) as decimal(18,2)); */
        set v_exgp_target_code_avail_qty = cast(substring(v_exgp_target_code_avail_qty_str,1,LOCATE(v_split_str,v_exgp_target_code_avail_qty_str)-1) as decimal(18,2));

        /* set @交易组交易代码可用数量# = cast(substring(@交易组交易代码可用数量串#,1,LOCATE(@分隔符#,@交易组交易代码可用数量串#)-1) as decimal(18,2)); */
        set v_exgp_trade_code_avail_qty = cast(substring(v_exgp_trade_code_avail_qty_str,1,LOCATE(v_split_str,v_exgp_trade_code_avail_qty_str)-1) as decimal(18,2));

        /* set @资产账户可用数量# = cast(substring(@资产账户可用数量串#,1,LOCATE(@分隔符#,@资产账户可用数量串#)-1) as decimal(18,2)); */
        set v_asac_avail_qty = cast(substring(v_asac_avail_qty_str,1,LOCATE(v_split_str,v_asac_avail_qty_str)-1) as decimal(18,2));

        /* set @资产账户标的代码可用数量# = cast(substring(@资产账户标的代码可用数量串#,1,LOCATE(@分隔符#,@资产账户标的代码可用数量串#)-1) as decimal(18,2)); */
        set v_asac_target_code_avail_qty = cast(substring(v_asac_target_code_avail_qty_str,1,LOCATE(v_split_str,v_asac_target_code_avail_qty_str)-1) as decimal(18,2));

        /* set @资产账户交易代码可用数量# = cast(substring(@资产账户交易代码可用数量串#,1,LOCATE(@分隔符#,@资产账户交易代码可用数量串#)-1) as decimal(18,2)); */
        set v_asac_trade_code_avail_qty = cast(substring(v_asac_trade_code_avail_qty_str,1,LOCATE(v_split_str,v_asac_trade_code_avail_qty_str)-1) as decimal(18,2));

        /* set @认购交易标志#=cast(substring(@认购交易标志串#,1,LOCATE(@分隔符#,@认购交易标志串#)-1) as SIGNED); */
        set v_subscription_trade_mark=cast(substring(v_subscription_trade_mark_str,1,LOCATE(v_split_str,v_subscription_trade_mark_str)-1) as SIGNED);

        /* set @申购交易标志#=cast(substring(@申购交易标志串#,1,LOCATE(@分隔符#,@申购交易标志串#)-1) as SIGNED); */
        set v_purchase_trade_mark=cast(substring(v_purchase_trade_mark_str,1,LOCATE(v_split_str,v_purchase_trade_mark_str)-1) as SIGNED);

        /* set @目标申购交易标志#=cast(substring(@目标申购交易标志串#,1,LOCATE(@分隔符#,@目标申购交易标志串#)-1) as SIGNED); */
        set v_target_purchase_trade_mark=cast(substring(v_target_purchase_trade_mark_str,1,LOCATE(v_split_str,v_target_purchase_trade_mark_str)-1) as SIGNED);

        /* set @赎回交易标志#=cast(substring(@赎回交易标志串#,1,LOCATE(@分隔符#,@赎回交易标志串#)-1) as SIGNED); */
        set v_rede_trade_mark=cast(substring(v_rede_trade_mark_str,1,LOCATE(v_split_str,v_rede_trade_mark_str)-1) as SIGNED);

        /* set @首次最低金额#=cast(substring(@首次最低金额串#,1,LOCATE(@分隔符#,@首次最低金额串#)-1) as decimal(32,4)); */
        set v_first_minimum_amt=cast(substring(v_first_minimum_amt_str,1,LOCATE(v_split_str,v_first_minimum_amt_str)-1) as decimal(32,4));

        /* set @最低申购金额#=cast(substring(@最低申购金额串#,1,LOCATE(@分隔符#,@最低申购金额串#)-1) as decimal(32,4)); */
        set v_minimum_purchase_amt=cast(substring(v_minimum_purchase_amt_str,1,LOCATE(v_split_str,v_minimum_purchase_amt_str)-1) as decimal(32,4));

        /* set @最低认购金额#=cast(substring(@最低认购金额串#,1,LOCATE(@分隔符#,@最低认购金额串#)-1) as decimal(32,4)); */
        set v_minimum_subscription_amt=cast(substring(v_minimum_subscription_amt_str,1,LOCATE(v_split_str,v_minimum_subscription_amt_str)-1) as decimal(32,4));

        /* set @最低赎回份额#=cast(substring(@最低赎回份额串#,1,LOCATE(@分隔符#,@最低赎回份额串#)-1) as decimal(18,2)); */
        set v_minimum_rede_share=cast(substring(v_minimum_rede_share_str,1,LOCATE(v_split_str,v_minimum_rede_share_str)-1) as decimal(18,2));

        /* set @最低持有份额#=cast(substring(@最低持有份额串#,1,LOCATE(@分隔符#,@最低持有份额串#)-1) as decimal(18,2)); */
        set v_minimum_holding_share=cast(substring(v_minimum_holding_share_str,1,LOCATE(v_split_str,v_minimum_holding_share_str)-1) as decimal(18,2));

        /* set @组合持仓序号#=cast(substring(@组合持仓序号串#,1,LOCATE(@分隔符#,@组合持仓序号串#)-1) as SIGNED); */
        set v_combo_posi_id=cast(substring(v_combo_posi_id_str,1,LOCATE(v_split_str,v_combo_posi_id_str)-1) as SIGNED);

        /* set @基金管理人#=substring(@基金管理人串#,1,LOCATE(@分隔符#,@基金管理人串#)-1); */
        set v_fund_manager=substring(v_fund_manager_str,1,LOCATE(v_split_str,v_fund_manager_str)-1);

        /* set @目标基金管理人#=substring(@目标基金管理人串#,1,LOCATE(@分隔符#,@目标基金管理人串#)-1); */
        set v_target_fund_manager=substring(v_target_fund_manager_str,1,LOCATE(v_split_str,v_target_fund_manager_str)-1);

        /* set @收费方式#=cast(substring(@收费方式串#,1,LOCATE(@分隔符#,@收费方式串#)-1) as SIGNED); */
        set v_charging_method=cast(substring(v_charging_method_str,1,LOCATE(v_split_str,v_charging_method_str)-1) as SIGNED);

        /* set @目标收费方式#=cast(substring(@目标收费方式串#,1,LOCATE(@分隔符#,@目标收费方式串#)-1) as SIGNED); */
        set v_target_charging_method=cast(substring(v_target_charging_method_str,1,LOCATE(v_split_str,v_target_charging_method_str)-1) as SIGNED);

        /* set @登记机构#=substring(@登记机构串#,1,LOCATE(@分隔符#,@登记机构串#)-1); */
        set v_registration_agency=substring(v_registration_agency_str,1,LOCATE(v_split_str,v_registration_agency_str)-1);
        #场外基金只能存在一批在途的指令

        /* 调用【原子_交易证券_指令_校验组合在途指令】*/
        call db_tdsecu.pra_tdseap_CheckComboWayComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_combo_code,
            v_comm_batch_no,
            v_co_no,
            v_stock_code_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_校验组合在途指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @市场编号# = 《市场编号-沪港通证券交易所》 and substring(@资产账户业务控制配置串#,15,1) <> 《沪港通交易方式-体内》 then */
        if v_exch_no = 3 and substring(v_asac_busi_config_str,15,1) <> 1 then

            /* set @体外指令标志# = 《体外指令标志-体外》; */
            set v_exter_comm_flag = 2;

        /* elseif @市场编号# = 《市场编号-深港通证券交易所》 and substring(@资产账户业务控制配置串#,16,1) <> 《深港通交易方式-体内》 then */
        elseif v_exch_no = 4 and substring(v_asac_busi_config_str,16,1) <> 1 then

            /* set @体外指令标志# = 《体外指令标志-体外》; */
            set v_exter_comm_flag = 2;
        end if;

        /* if @指令方向# = 《指令方向-基金申购》 then */
        if v_comm_dir = 9 then

            /* set @指令数量# = @指令金额#; */
            set v_comm_qty = v_comm_amt;

            /* set @指令实际限价# = 1; */
            set v_limit_actual_price = 1;

        /* elseif @指令方向# = 《指令方向-基金赎回》 then */
        elseif v_comm_dir = 10 then

            /* set @指令实际限价# = 0; */
            set v_limit_actual_price = 0;
        end if;
        #计算指令冻结金额

        /* set @计算方向# = 《计算方向-加上》; */
        set v_calc_dir = 1;

        /* 调用【原子_交易证券_公用_计算指令冻结金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetCommFrozenAmtAndQty(
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
            v_calc_dir,
            v_error_code,
            v_error_info,
            v_comm_frozen_amt,
            v_comm_frozen_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令冻结金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @订单方向# = @指令方向#; */
        set v_order_dir = v_comm_dir;

        /* set @订单数量# = @指令数量#; */
        set v_order_qty = v_comm_qty;

        /* 调用【原子_交易证券_指令_检查指令业务合法性】*/
        call db_tdsecu.pra_tdseap_CheckCommBusi(
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
            v_comm_dir,
            v_comm_qty,
            v_comm_limit_price,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_up_limit_price,
            v_down_limit_price,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_subscription_trade_mark,
            v_purchase_trade_mark,
            v_target_purchase_trade_mark,
            v_rede_trade_mark,
            v_first_minimum_amt,
            v_minimum_purchase_amt,
            v_minimum_subscription_amt,
            v_minimum_rede_share,
            v_minimum_holding_share,
            v_fund_manager,
            v_target_fund_manager,
            v_charging_method,
            v_target_charging_method,
            v_comm_frozen_amt,
            v_record_count,
            v_exgp_avail_qty,
            v_posi_reback_days,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_检查指令业务合法性出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #交易证券子系统检查，检查指令可用资金、可用持仓等

         /* set @组合代码# = " "; */
         set v_combo_code = " ";

        /* 调用【原子_交易证券_指令_校验新增指令】*/
        call db_tdsecu.pra_tdseap_CheckAddComm(
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
            v_comm_dir,
            v_comm_qty,
            v_comm_frozen_amt,
            v_impawn_ratio,
            v_stock_type,
            v_subscription_trade_mark,
            v_purchase_trade_mark,
            v_rede_trade_mark,
            v_first_minimum_amt,
            v_minimum_purchase_amt,
            v_minimum_subscription_amt,
            v_minimum_rede_share,
            v_minimum_holding_share,
            v_record_count,
            v_combo_code,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_校验新增指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #风控子系统检查，检查指令端风控等

        /* set @处理标志#=《处理标志-已处理》; */
        set v_deal_flag=1;

        /* set @指令下达人#=@操作员编号#; */
        set v_comm_opor=v_opor_no;

        /* set @变动金额#=(@指令实际限价# * @指令数量#); */
        set v_occur_amt=(v_limit_actual_price * v_comm_qty);

        /* set @变动数量#=@指令数量#; */
        set v_occur_qty=v_comm_qty;
        #如果自动审批，需做相应检查处理，并获取指令批号

        /* set @订单方向# = @指令方向#; */
        set v_order_dir = v_comm_dir;

        /* if @指令审批设置#=《指令审批设置-自动审批》 and substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 and (@订单方向#=《订单方向-新股申购》 or @订单方向#=《订单方向-配售申购》) then */
        if v_comm_appr_set=1 and substring(v_asac_busi_config_str,6,1)=1 and (v_order_dir=11 or v_order_dir=23) then

            /* 调用【原子_交易证券_交易_检查证券申购重复】*/
            call db_tdsecu.pra_tdsetd_CheckPurcDup(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_exch_group_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.9.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_检查证券申购重复出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;
        #新增指令记录

        /* set @指令审批状态#=《指令审批状态-未审批》; */
        set v_comm_appr_status="1";

        /* if @指令审批设置#=《指令审批设置-不设置》 then */
        if v_comm_appr_set=3 then

            /* set @指令审批状态#=《指令审批状态-不审批》; */
            set v_comm_appr_status="4";
        end if;

        /* set  @工作流模式# = substring(@资产账户业务控制配置串#,25,1); */
        set  v_workflow_type = substring(v_asac_busi_config_str,25,1);

        /* 调用【原子_交易证券_指令_新增指令】*/
        call db_tdsecu.pra_tdseap_AddComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_comm_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_crncy_type,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_opor,
            v_comm_executor,
            v_comm_batch_no,
            v_comm_dir,
            v_comm_limit_price,
            v_limit_actual_price,
            v_comm_qty,
            v_comm_amt,
            v_comm_frozen_amt,
            v_comm_frozen_qty,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_appr_status,
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_basket_id,
            v_comm_oper_way,
            v_exter_comm_flag,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_combo_code,
            v_target_stock_code,
            v_target_stock_code_no,
            v_comm_remark_info,
            v_workflow_type,
            v_contra_no,
            v_asset_acco_type,
            v_exist_debt_flag,
            v_disp_opor,
            v_disp_status,
            v_acco_concat_info,
            v_error_code,
            v_error_info,
            v_comm_id,
            v_comm_status,
            v_strike_status,
            v_comm_comple_flag);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_新增指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @指令序号串# = concat(@指令序号串#,@指令序号#,";"); */
        set v_comm_id_str = concat(v_comm_id_str,v_comm_id,";");
        #处理资金持仓数据，为保证数据表修改顺序，指令资金持仓更新需放在后边处理，以先处理指令表，再处理订单表，再处理资金持仓表
        #计算指令变动金额和数量

        /* set @计算方向# = 《计算方向-加上》; */
        set v_calc_dir = 1;

        /* 调用【原子_交易证券_公用_计算指令变动金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetCommOccurAmtAndQty(
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
            v_calc_dir,
            v_error_code,
            v_error_info,
            v_comm_occur_amt,
            v_comm_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @临时_指令变动金额# = @指令变动金额#; */
        set v_tmp_comm_occur_amt = v_comm_occur_amt;

        /* set @临时_指令变动数量# = @指令变动数量#; */
        set v_tmp_comm_occur_qty = v_comm_occur_qty;

        /* if @指令审批设置#=《指令审批设置-自动审批》 or @指令审批状态#=《指令审批状态-不审批》 then */
        if v_comm_appr_set=1 or v_comm_appr_status="4" then

            /* if @指令审批设置#=《指令审批设置-自动审批》 then */
            if v_comm_appr_set=1 then
                #审批指令

                /* set @指令审批状态#=《指令审批状态-审批通过》; */
                set v_comm_appr_status="2";

                /* set @指令审批说明#="指令快速审批通过！"; */
                set v_comm_appr_remark="指令快速审批通过！";

                /* set @指令审批操作员序号#=1; */
                set v_comm_appr_oper_no=1;
            end if;

             /* set @订单数量#=0; */
             set v_order_qty=0;

             /* set @指令撤销数量#=0; */
             set v_comm_cancel_qty=0;
               #审批指令用审批员的登录信息

              /* set @临时_操作IP# = @操作IP#; */
              set v_tmp_oper_ip_addr = v_oper_ip_addr;

              /* set @临时_操作MAC# = @操作MAC#; */
              set v_tmp_oper_mac = v_oper_mac;

              /* set @临时_操作信息# = @操作信息#; */
              set v_tmp_oper_info = v_oper_info;

              /* set @临时_操作员编号# = @操作员编号#; */
              set v_tmp_opor_no = v_opor_no;

              /* set @操作IP# = @上次登录IP#; */
              set v_oper_ip_addr = v_last_login_ip;

              /* set @操作MAC# = @上次登录MAC#; */
              set v_oper_mac = v_last_login_mac;

              /* set @操作信息# = @上次操作信息#; */
              set v_oper_info = v_last_oper_info;

              /* set @操作员编号# = @指令审批操作员#; */
              set v_opor_no = v_comm_appr_oper;

              /* set @当前操作员# = @临时_操作员编号#; */
              set v_curr_opor_no = v_tmp_opor_no;

             /* 调用【原子_交易证券_指令_审批指令】*/
             call db_tdsecu.pra_tdseap_ApprComm(
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
                 v_stock_code,
                 v_stock_code_no,
                 v_stock_type,
                 v_asset_type,
                 v_comm_date,
                 v_comm_id,
                 v_comm_opor,
                 v_comm_executor,
                 v_comm_batch_no,
                 v_comm_appr_oper_no,
                 v_comm_appr_oper,
                 v_comm_appr_status,
                 v_comm_appr_remark,
                 v_comm_qty,
                 v_comm_dir,
                 v_comm_limit_price,
                 v_limit_actual_price,
                 v_order_qty,
                 v_comm_cancel_qty,
                 v_bond_accr_intrst,
                 v_bond_rate_type,
                 v_net_price_flag,
                 v_par_value,
                 v_comm_status,
                 v_comm_begin_date,
                 v_comm_end_date,
                 v_comm_begin_time,
                 v_comm_end_time,
                 v_exter_comm_flag,
                 v_comm_oper_way,
                 v_comm_amt,
                 v_co_busi_config_str,
                 v_online_opor_no_str,
                 v_curr_opor_no,
                 v_buy_ref_rate,
                 v_sell_ref_rate,
                 v_before_comm_executor,
                 v_error_code,
                 v_error_info,
                 v_comm_occur_amt,
                 v_comm_occur_qty,
                 v_comm_appr_date,
                 v_comm_appr_time,
                 v_disp_status,
                 v_disp_opor,
                 v_auto_comm_executor);
             if v_error_code = "1" then
                 SET v_error_code = "tdsecuT.3.9.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_审批指令出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 leave label_pro;
             end if;


             /* set @临时_指令变动金额# = @临时_指令变动金额# + @指令变动金额#; */
             set v_tmp_comm_occur_amt = v_tmp_comm_occur_amt + v_comm_occur_amt;

             /* set @临时_指令变动数量# = @临时_指令变动数量# + @指令变动数量#; */
             set v_tmp_comm_occur_qty = v_tmp_comm_occur_qty + v_comm_occur_qty;

            /* if @自动分发指令执行人# >0 and @指令执行人# = 0 then */
            if v_auto_comm_executor >0 and v_comm_executor = 0 then

                /* set @指令执行人# = @自动分发指令执行人#; */
                set v_comm_executor = v_auto_comm_executor;
            end if;

            /* if substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 and (@指令操作方式# = 《指令操作方式-中泰手机APP》 or @指令操作方式# = 《指令操作方式-中泰组合补指令》 or @指令操作方式# = 《指令操作方式-中泰组合再平衡》) and @指令执行人#>0 then */
            if substring(v_asac_busi_config_str,6,1)=1 and (v_comm_oper_way = "31" or v_comm_oper_way = "33" or v_comm_oper_way = "34") and v_comm_executor>0 then

                /* set  @审批通过自动下单# = 《审批通过自动下单-是》; */
                set  v_appr_allow_order_flag = 1;
                #设置订单相关字段值

                /* set @外部编号#=0; */
                set v_external_no=0;

                /* set @申报日期# = 0; */
                set v_report_date = 0;

                /* set @申报时间# = 0; */
                set v_report_time = 0;

                /* set @申报编号# = " "; */
                set v_report_no = " ";

                /* set @操作员编号# = @指令执行人#; */
                set v_opor_no = v_comm_executor;

                /* set @订单日期#=@初始化日期#; */
                set v_order_date=v_init_date;

                /* set @价格类型#=《价格类型-限价》; */
                set v_price_type=1;

                /* set @订单方向#=@指令方向#; */
                set v_order_dir=v_comm_dir;

                /* set @订单数量#=@指令数量#; */
                set v_order_qty=v_comm_qty;

                /* set @订单价格#=@指令实际限价#; */
                set v_order_price=v_limit_actual_price;
                #先反向更新指令

                /* set @计算方向# = 《计算方向-减去》; */
                set v_calc_dir = -1;

                /* 调用【原子_交易证券_公用_计算指令冻结金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetCommFrozenAmtAndQty(
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
                    v_calc_dir,
                    v_error_code,
                    v_error_info,
                    v_comm_frozen_amt,
                    v_comm_frozen_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.9.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令冻结金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* 调用【原子_交易证券_指令_下单更新指令】*/
                call db_tdsecu.pra_tdseap_OrderUpdateComm(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_comm_id,
                    v_comm_frozen_amt,
                    v_comm_frozen_qty,
                    v_order_qty,
                    v_error_code,
                    v_error_info,
                    v_limit_actual_price,
                    v_exter_comm_flag,
                    v_comm_comple_date,
                    v_comm_comple_time,
                    v_comm_status,
                    v_strike_status);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.9.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_下单更新指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #计算交易冻结金额

                /* 调用【原子_交易证券_公用_计算交易冻结金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetExchFrozenAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_order_dir,
                    v_order_price,
                    v_order_qty,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_all_fee,
                    v_error_code,
                    v_error_info,
                    v_trade_frozen_amt,
                    v_trade_frozen_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.9.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算交易冻结金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @订单冻结金额#=@交易冻结金额#; */
                set v_order_frozen_amt=v_trade_frozen_amt;

                /* set @订单冻结数量#=@交易冻结数量#; */
                set v_order_frozen_qty=v_trade_frozen_qty;

                /* set @备注信息#="指令自动审批后自动执行！"; */
                set v_remark_info="指令自动审批后自动执行！";
                #根据报盘机状态，设置订单状态 如果通道是允许报送状态,则直接将订单状态设为"待报"

                /* set @订单状态# = 《订单状态-未报》; */
                set v_order_status = "1";

                /* 调用【原子_交易证券_公用_获取通道状态】*/
                call db_tdsecu.pra_tdsepb_GetChannelStatus(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_pass_no,
                    v_error_code,
                    v_error_info,
                    v_pass_status);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.9.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取通道状态出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* if @通道状态# = "1" then */
                if v_pass_status = "1" then

                    /* set @订单状态# = 《订单状态-待报》; */
                    set v_order_status = "a";
                end if;

                /* if @订单方向# = 《订单方向-基金申购》 then */
                if v_order_dir = 9 then

                    /* set @订单操作方式# = 《订单操作方式-组合买入》; */
                    set v_order_oper_way = "26";

                /* elseif @订单方向# = 《订单方向-基金赎回》 then */
                elseif v_order_dir = 10 then

                    /* set @订单操作方式# = 《订单操作方式-组合卖出》; */
                    set v_order_oper_way = "27";
                else

                    /* set @订单操作方式#=《订单操作方式-其他》; */
                    set v_order_oper_way="1";
                end if;

                /* 调用【原子_交易证券_交易_新增订单】*/
                call db_tdsecu.pra_tdsetd_AddOrder(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_init_date,
                    v_co_no,
                    v_comm_opor,
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
                    v_target_code_no,
                    v_trade_code_no,
                    v_stock_type,
                    v_asset_type,
                    v_external_no,
                    v_comm_id,
                    v_comm_batch_no,
                    v_order_batch_no,
                    v_order_date,
                    v_order_dir,
                    v_price_type,
                    v_order_price,
                    v_order_qty,
                    v_order_status,
                    v_report_date,
                    v_report_time,
                    v_report_no,
                    v_order_frozen_amt,
                    v_order_frozen_qty,
                    v_net_price_flag,
                    v_intrst_days,
                    v_par_value,
                    v_impawn_ratio,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_compli_trig_id,
                    v_remark_info,
                    v_order_oper_way,
                    v_exter_comm_flag,
                    v_cost_calc_type,
                    v_combo_code,
                    v_combo_posi_id,
                    v_target_stock_code,
                    v_target_stock_code_no,
                    v_registration_agency,
                    v_trade_acco,
                    v_contra_no,
                    v_asset_acco_type,
                    v_exist_debt_flag,
                    v_error_code,
                    v_error_info,
                    v_order_id,
                    v_order_time,
                    v_update_times);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.9.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增订单出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @订单序号串# = concat(@订单序号串#,@订单序号#,";"); */
                set v_order_id_str = concat(v_order_id_str,v_order_id,";");
                #计算指令变动金额和数量

                /* set @计算方向# = 《计算方向-减去》; */
                set v_calc_dir = -1;

                /* 调用【原子_交易证券_公用_计算指令变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetCommOccurAmtAndQty(
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
                    v_calc_dir,
                    v_error_code,
                    v_error_info,
                    v_comm_occur_amt,
                    v_comm_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.9.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @临时_指令变动金额# = @临时_指令变动金额# + @指令变动金额#; */
                set v_tmp_comm_occur_amt = v_tmp_comm_occur_amt + v_comm_occur_amt;

                /* set @临时_指令变动数量# = @临时_指令变动数量# + @指令变动数量#; */
                set v_tmp_comm_occur_qty = v_tmp_comm_occur_qty + v_comm_occur_qty;
                #计算下单交易变动金额和数量

                /* 调用【原子_交易证券_公用_计算下单交易变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetOrderTradeOccurAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_order_dir,
                    v_order_qty,
                    v_order_price,
                    v_order_frozen_amt,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_error_code,
                    v_error_info,
                    v_trade_occur_amt,
                    v_trade_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.9.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算下单交易变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* if @订单批号# > 0  then */
                if v_order_batch_no > 0  then

                    /* set @撤单数量# = 0; */
                    set v_wtdraw_qty = 0;

                    /* set @废单数量# = 0; */
                    set v_waste_qty = 0;

                   /* 调用【原子_交易证券_交易_订单处理汇总订单】*/
                   call db_tdsecu.pra_tdsetd_OrderDealSumOrder(
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
                       v_exch_crncy_type,
                       v_exch_no,
                       v_stock_code_no,
                       v_stock_code,
                       v_trade_code_no,
                       v_target_code_no,
                       v_stock_type,
                       v_asset_type,
                       v_external_no,
                       v_order_date,
                       v_order_batch_no,
                       v_order_dir,
                       v_price_type,
                       v_order_price,
                       v_order_qty,
                       v_order_status,
                       v_wtdraw_qty,
                       v_waste_qty,
                       v_net_price_flag,
                       v_intrst_days,
                       v_par_value,
                       v_bond_accr_intrst,
                       v_bond_rate_type,
                       v_impawn_ratio,
                       v_order_oper_way,
                       v_exter_comm_flag,
                       v_error_code,
                       v_error_info);
                   if v_error_code = "1" then
                       SET v_error_code = "tdsecuT.3.9.999";
                       if v_mysql_message <> "" then
                            SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_订单处理汇总订单出现错误！',v_mysql_message);
                       end if;
                       ROLLBACK;
                       leave label_pro;
                   elseif v_error_code <> "0" then
                       ROLLBACK;
                       leave label_pro;
                   end if;

               end if;
            end if;

              /* set @操作IP# = @临时_操作IP#; */
              set v_oper_ip_addr = v_tmp_oper_ip_addr;

              /* set @操作MAC# = @临时_操作MAC#; */
              set v_oper_mac = v_tmp_oper_mac;

              /* set @操作信息# = @临时_操作信息#; */
              set v_oper_info = v_tmp_oper_info;

              /* set @操作员编号# = @临时_操作员编号#; */
              set v_opor_no = v_tmp_opor_no;
        end if;
        #处理订单资金持仓数据，保护指令变动和交易的变动

        /* set @指令变动金额# = @临时_指令变动金额#; */
        set v_comm_occur_amt = v_tmp_comm_occur_amt;

        /* set @指令变动数量# = @临时_指令变动数量#; */
        set v_comm_occur_qty = v_tmp_comm_occur_qty;

        /* set @业务操作员编号# = @指令执行人#; */
        set v_busi_opor_no = v_comm_executor;

        /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
        call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
            v_exch_crncy_type,
            v_comm_id,
            v_order_id,
            v_exch_no,
            v_stock_code,
            v_stock_type,
            v_asset_type,
            v_order_dir,
            v_impawn_ratio,
            v_stock_acco_no,
            v_stock_code_no,
            v_trade_code_no,
            v_target_code_no,
            v_comm_occur_amt,
            v_comm_occur_qty,
            v_trade_occur_amt,
            v_trade_occur_qty,
            v_is_record_jour,
            v_order_oper_way,
            v_busi_opor_no,
            v_open_close_permission,
            v_avail_cal_flag,
            v_combo_code,
            v_combo_posi_id,
            v_target_stock_code_no,
            v_error_code,
            v_error_info,
            v_open_posi_date);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @指令审批状态串# = concat(@指令审批状态串#,@指令审批状态#,";"); */
        set v_comm_appr_status_str = concat(v_comm_appr_status_str,v_comm_appr_status,";");

        /* set @证券代码串#=substring(@证券代码串#,LOCATE(@分隔符#,@证券代码串#)+1); */
        set v_stock_code_str=substring(v_stock_code_str,LOCATE(v_split_str,v_stock_code_str)+1);

        /* set @证券代码编号串#=substring(@证券代码编号串#,LOCATE(@分隔符#,@证券代码编号串#)+1); */
        set v_stock_code_no_str=substring(v_stock_code_no_str,LOCATE(v_split_str,v_stock_code_no_str)+1);

        /* set @目标证券代码串#=substring(@目标证券代码串#,LOCATE(@分隔符#,@目标证券代码串#)+1); */
        set v_target_stock_code_str=substring(v_target_stock_code_str,LOCATE(v_split_str,v_target_stock_code_str)+1);

        /* set @目标证券代码编号串#=substring(@目标证券代码编号串#,LOCATE(@分隔符#,@目标证券代码编号串#)+1); */
        set v_target_stock_code_no_str=substring(v_target_stock_code_no_str,LOCATE(v_split_str,v_target_stock_code_no_str)+1);

        /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
        set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

        /* set @指令方向串#=substring(@指令方向串#,LOCATE(@分隔符#,@指令方向串#)+1); */
        set v_comm_dir_str=substring(v_comm_dir_str,LOCATE(v_split_str,v_comm_dir_str)+1);

        /* set @指令限价串#=substring(@指令限价串#,LOCATE(@分隔符#,@指令限价串#)+1); */
        set v_limit_price_str=substring(v_limit_price_str,LOCATE(v_split_str,v_limit_price_str)+1);

        /* set @指令数量串#=substring(@指令数量串#,LOCATE(@分隔符#,@指令数量串#)+1); */
        set v_comm_qty_str=substring(v_comm_qty_str,LOCATE(v_split_str,v_comm_qty_str)+1);

        /* set @指令金额串#=substring(@指令金额串#,LOCATE(@分隔符#,@指令金额串#)+1); */
        set v_comm_amt_str=substring(v_comm_amt_str,LOCATE(v_split_str,v_comm_amt_str)+1);

        /* set @股东代码串#=substring(@股东代码串#,LOCATE(@分隔符#,@股东代码串#)+1); */
        set v_stock_acco_str=substring(v_stock_acco_str,LOCATE(v_split_str,v_stock_acco_str)+1);

        /* set @股东代码编号串#=substring(@股东代码编号串#,LOCATE(@分隔符#,@股东代码编号串#)+1); */
        set v_stock_acco_no_str=substring(v_stock_acco_no_str,LOCATE(v_split_str,v_stock_acco_no_str)+1);

        /* set @债券计提利息串#=substring(@债券计提利息串#,LOCATE(@分隔符#,@债券计提利息串#)+1); */
        set v_bond_accr_intrst_str=substring(v_bond_accr_intrst_str,LOCATE(v_split_str,v_bond_accr_intrst_str)+1);

        /* set @净价标志串#=substring(@净价标志串#,LOCATE(@分隔符#,@净价标志串#)+1); */
        set v_net_price_flag_str=substring(v_net_price_flag_str,LOCATE(v_split_str,v_net_price_flag_str)+1);

        /* set @质押比例串#=substring(@质押比例串#,LOCATE(@分隔符#,@质押比例串#)+1); */
        set v_impawn_ratio_str=substring(v_impawn_ratio_str,LOCATE(v_split_str,v_impawn_ratio_str)+1);

        /* set @证券类型串#=substring(@证券类型串#,LOCATE(@分隔符#,@证券类型串#)+1); */
        set v_stock_type_str=substring(v_stock_type_str,LOCATE(v_split_str,v_stock_type_str)+1);

        /* set @票面面值串#=substring(@票面面值串#,LOCATE(@分隔符#,@票面面值串#)+1); */
        set v_par_value_str=substring(v_par_value_str,LOCATE(v_split_str,v_par_value_str)+1);

        /* set @标的代码编号串#=substring(@标的代码编号串#,LOCATE(@分隔符#,@标的代码编号串#)+1); */
        set v_target_code_no_str=substring(v_target_code_no_str,LOCATE(v_split_str,v_target_code_no_str)+1);

        /* set @交易代码编号串#=substring(@交易代码编号串#,LOCATE(@分隔符#,@交易代码编号串#)+1); */
        set v_trade_code_no_str=substring(v_trade_code_no_str,LOCATE(v_split_str,v_trade_code_no_str)+1);

        /* set @资产类型串#=substring(@资产类型串#,LOCATE(@分隔符#,@资产类型串#)+1); */
        set v_asset_type_str=substring(v_asset_type_str,LOCATE(v_split_str,v_asset_type_str)+1);

        /* set @本币币种串#=substring(@本币币种串#,LOCATE(@分隔符#,@本币币种串#)+1); */
        set v_crncy_type_str=substring(v_crncy_type_str,LOCATE(v_split_str,v_crncy_type_str)+1);

        /* set @交易币种串#=substring(@交易币种串#,LOCATE(@分隔符#,@交易币种串#)+1); */
        set v_exch_crncy_type_str=substring(v_exch_crncy_type_str,LOCATE(v_split_str,v_exch_crncy_type_str)+1);

        /* set @买入参考汇率串#=substring(@买入参考汇率串#,LOCATE(@分隔符#,@买入参考汇率串#)+1); */
        set v_buy_ref_rate_str=substring(v_buy_ref_rate_str,LOCATE(v_split_str,v_buy_ref_rate_str)+1);

        /* set @卖出参考汇率串#=substring(@卖出参考汇率串#,LOCATE(@分隔符#,@卖出参考汇率串#)+1); */
        set v_sell_ref_rate_str=substring(v_sell_ref_rate_str,LOCATE(v_split_str,v_sell_ref_rate_str)+1);

        /* set @债券利率类型串#=substring(@债券利率类型串#,LOCATE(@分隔符#,@债券利率类型串#)+1); */
        set v_bond_rate_type_str=substring(v_bond_rate_type_str,LOCATE(v_split_str,v_bond_rate_type_str)+1);

        /* set @计息天数串#=substring(@计息天数串#,LOCATE(@分隔符#,@计息天数串#)+1); */
        set v_intrst_days_str=substring(v_intrst_days_str,LOCATE(v_split_str,v_intrst_days_str)+1);

        /* set @全部费用串#=substring(@全部费用串#,LOCATE(@分隔符#,@全部费用串#)+1); */
        set v_all_fee_str=substring(v_all_fee_str,LOCATE(v_split_str,v_all_fee_str)+1);

        /* set @涨停价串#=substring(@涨停价串#,LOCATE(@分隔符#,@涨停价串#)+1); */
        set v_up_limit_price_str=substring(v_up_limit_price_str,LOCATE(v_split_str,v_up_limit_price_str)+1);

        /* set @跌停价串#=substring(@跌停价串#,LOCATE(@分隔符#,@跌停价串#)+1); */
        set v_down_limit_price_str=substring(v_down_limit_price_str,LOCATE(v_split_str,v_down_limit_price_str)+1);

        /* set @最新价串#=substring(@最新价串#,LOCATE(@分隔符#,@最新价串#)+1); */
        set v_last_price_str=substring(v_last_price_str,LOCATE(v_split_str,v_last_price_str)+1);

        /* set @资金回转天数串#=substring(@资金回转天数串#,LOCATE(@分隔符#,@资金回转天数串#)+1); */
        set v_capit_reback_days_str=substring(v_capit_reback_days_str,LOCATE(v_split_str,v_capit_reback_days_str)+1);

        /* set @持仓回转天数串#=substring(@持仓回转天数串#,LOCATE(@分隔符#,@持仓回转天数串#)+1); */
        set v_posi_reback_days_str=substring(v_posi_reback_days_str,LOCATE(v_split_str,v_posi_reback_days_str)+1);

        /* set @交易组可用数量串# = substring(@交易组可用数量串#,LOCATE(@分隔符#,@交易组可用数量串#)+1); */
        set v_exgp_avail_qty_str = substring(v_exgp_avail_qty_str,LOCATE(v_split_str,v_exgp_avail_qty_str)+1);

        /* set @交易组标的代码可用数量串# = substring(@交易组标的代码可用数量串#,LOCATE(@分隔符#,@交易组标的代码可用数量串#)+1); */
        set v_exgp_target_code_avail_qty_str = substring(v_exgp_target_code_avail_qty_str,LOCATE(v_split_str,v_exgp_target_code_avail_qty_str)+1);

        /* set @交易组交易代码可用数量串# = substring(@交易组交易代码可用数量串#,LOCATE(@分隔符#,@交易组交易代码可用数量串#)+1); */
        set v_exgp_trade_code_avail_qty_str = substring(v_exgp_trade_code_avail_qty_str,LOCATE(v_split_str,v_exgp_trade_code_avail_qty_str)+1);

        /* set @资产账户可用数量串# = substring(@资产账户可用数量串#,LOCATE(@分隔符#,@资产账户可用数量串#)+1); */
        set v_asac_avail_qty_str = substring(v_asac_avail_qty_str,LOCATE(v_split_str,v_asac_avail_qty_str)+1);

        /* set @资产账户标的代码可用数量串# = substring(@资产账户标的代码可用数量串#,LOCATE(@分隔符#,@资产账户标的代码可用数量串#)+1); */
        set v_asac_target_code_avail_qty_str = substring(v_asac_target_code_avail_qty_str,LOCATE(v_split_str,v_asac_target_code_avail_qty_str)+1);

        /* set @资产账户交易代码可用数量串# = substring(@资产账户交易代码可用数量串#,LOCATE(@分隔符#,@资产账户交易代码可用数量串#)+1); */
        set v_asac_trade_code_avail_qty_str = substring(v_asac_trade_code_avail_qty_str,LOCATE(v_split_str,v_asac_trade_code_avail_qty_str)+1);

        /* set @认购交易标志串#=substring(@认购交易标志串#,LOCATE(@分隔符#,@认购交易标志串#)+1); */
        set v_subscription_trade_mark_str=substring(v_subscription_trade_mark_str,LOCATE(v_split_str,v_subscription_trade_mark_str)+1);

        /* set @申购交易标志串#=substring(@申购交易标志串#,LOCATE(@分隔符#,@申购交易标志串#)+1); */
        set v_purchase_trade_mark_str=substring(v_purchase_trade_mark_str,LOCATE(v_split_str,v_purchase_trade_mark_str)+1);

        /* set @目标申购交易标志串#=substring(@目标申购交易标志串#,LOCATE(@分隔符#,@目标申购交易标志串#)+1); */
        set v_target_purchase_trade_mark_str=substring(v_target_purchase_trade_mark_str,LOCATE(v_split_str,v_target_purchase_trade_mark_str)+1);

        /* set @赎回交易标志串#=substring(@赎回交易标志串#,LOCATE(@分隔符#,@赎回交易标志串#)+1); */
        set v_rede_trade_mark_str=substring(v_rede_trade_mark_str,LOCATE(v_split_str,v_rede_trade_mark_str)+1);

        /* set @首次最低金额串#=substring(@首次最低金额串#,LOCATE(@分隔符#,@首次最低金额串#)+1); */
        set v_first_minimum_amt_str=substring(v_first_minimum_amt_str,LOCATE(v_split_str,v_first_minimum_amt_str)+1);

        /* set @最低申购金额串#=substring(@最低申购金额串#,LOCATE(@分隔符#,@最低申购金额串#)+1); */
        set v_minimum_purchase_amt_str=substring(v_minimum_purchase_amt_str,LOCATE(v_split_str,v_minimum_purchase_amt_str)+1);

        /* set @最低认购金额串#=substring(@最低认购金额串#,LOCATE(@分隔符#,@最低认购金额串#)+1); */
        set v_minimum_subscription_amt_str=substring(v_minimum_subscription_amt_str,LOCATE(v_split_str,v_minimum_subscription_amt_str)+1);

        /* set @最低赎回份额串#=substring(@最低赎回份额串#,LOCATE(@分隔符#,@最低赎回份额串#)+1); */
        set v_minimum_rede_share_str=substring(v_minimum_rede_share_str,LOCATE(v_split_str,v_minimum_rede_share_str)+1);

        /* set @最低持有份额串#=substring(@最低持有份额串#,LOCATE(@分隔符#,@最低持有份额串#)+1); */
        set v_minimum_holding_share_str=substring(v_minimum_holding_share_str,LOCATE(v_split_str,v_minimum_holding_share_str)+1);

        /* set @组合持仓序号串#=substring(@组合持仓序号串#,LOCATE(@分隔符#,@组合持仓序号串#)+1); */
        set v_combo_posi_id_str=substring(v_combo_posi_id_str,LOCATE(v_split_str,v_combo_posi_id_str)+1);

        /* set @基金管理人串#=substring(@基金管理人串#,LOCATE(@分隔符#,@基金管理人串#)+1); */
        set v_fund_manager_str=substring(v_fund_manager_str,LOCATE(v_split_str,v_fund_manager_str)+1);

        /* set @目标基金管理人串#=substring(@目标基金管理人串#,LOCATE(@分隔符#,@目标基金管理人串#)+1); */
        set v_target_fund_manager_str=substring(v_target_fund_manager_str,LOCATE(v_split_str,v_target_fund_manager_str)+1);

        /* set @收费方式串#=substring(@收费方式串#,LOCATE(@分隔符#,@收费方式串#)+1); */
        set v_charging_method_str=substring(v_charging_method_str,LOCATE(v_split_str,v_charging_method_str)+1);

        /* set @目标收费方式串#=substring(@目标收费方式串#,LOCATE(@分隔符#,@目标收费方式串#)+1); */
        set v_target_charging_method_str=substring(v_target_charging_method_str,LOCATE(v_split_str,v_target_charging_method_str)+1);

        /* set @登记机构串#=substring(@登记机构串#,LOCATE(@分隔符#,@登记机构串#)+1); */
        set v_registration_agency_str=substring(v_registration_agency_str,LOCATE(v_split_str,v_registration_agency_str)+1);

        /* if @指令实际限价串# <> " " then */
        if v_limit_actual_price_str <> " " then

            /* set @指令实际限价串#=substring(@指令实际限价串#,LOCATE(@分隔符#,@指令实际限价串#)+1); */
            set v_limit_actual_price_str=substring(v_limit_actual_price_str,LOCATE(v_split_str,v_limit_actual_price_str)+1);
        end if;
        #自动下单，并且指令方式是中泰app

        /* if @审批通过自动下单# = 《审批通过自动下单-是》 then */
        if v_appr_allow_order_flag = 1 then
            #记录组合下单流水

            /* 调用【原子_交易证券_交易_新增组合交易记录】*/
            call db_tdsecu.pra_tdsetd_AddComboTradeLog(
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
                v_order_batch_no,
                v_combo_code,
                v_combo_copies,
                v_order_dir,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.9.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增组合交易记录出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #要考虑别的订单方向

            /* if @订单方向# =《订单方向-基金申购》 or  @订单方向# =《订单方向-买入》 then */
            if v_order_dir =9 or  v_order_dir =1 then

                /* set @组合份数#  = @组合份数#; */
                set v_combo_copies  = v_combo_copies;

            /* elseif @订单方向# =《订单方向-基金申购》 or @订单方向# =《订单方向-卖出》  then */
            elseif v_order_dir =9 or v_order_dir =2  then

                /* set @组合份数#  = -@组合份数#; */
                set v_combo_copies  = -v_combo_copies;
            end if;

            /* if @订单方向# <> 《订单方向-基金转换》 then */
            if v_order_dir <> 12 then

                /* 调用【原子_交易证券_账户_获取组合创建状态】*/
                call db_tdsecu.pra_tdseac_GetComboCreateStatus(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_comm_oper_way,
                    v_comm_dir,
                    v_error_code,
                    v_error_info,
                    v_combo_status);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.9.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_获取组合创建状态出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @组合成本# = 0; */
                set v_combo_cost = 0;

                /* set @组合市值# = 0; */
                set v_combo_market_value = 0;

                /* set @实现盈亏# = 0; */
                set v_realize_pandl = 0;

                /* set @累计实现盈亏# = 0; */
                set v_sum_realize_pandl = 0;

                /* 调用【原子_交易证券_账户_更新组合收益】*/
                call db_tdsecu.pra_tdseac_UpdateComboIncome(
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
                    v_open_posi_date,
                    v_combo_code,
                    v_combo_copies,
                    v_combo_status,
                    v_combo_cost,
                    v_combo_market_value,
                    v_realize_pandl,
                    v_sum_realize_pandl,
                    v_comm_batch_no,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.9.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新组合收益出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            end if;
        end if;

    /* [事务结束] */
    COMMIT;

    end while;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_date = v_comm_date;
    SET p_comm_id_str = v_comm_id_str;
    SET p_comm_appr_status_str = v_comm_appr_status_str;
    SET p_order_id_str = v_order_id_str;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_获取指令信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_CheckCommInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_CheckCommInfo(
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
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_target_code_no int,
    OUT p_trade_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
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
    OUT p_all_fee decimal(18,4),
    OUT p_net_price_flag int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_comm_begin_date int,
    OUT p_comm_end_date int,
    OUT p_comm_begin_time int,
    OUT p_comm_end_time int,
    OUT p_combo_code varchar(32),
    OUT p_combo_posi_id bigint,
    OUT p_comm_status varchar(2),
    OUT p_asset_acco_type int,
    OUT p_exist_debt_flag int
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
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
    declare v_all_fee decimal(18,4);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_comm_status varchar(2);
    declare v_asset_acco_type int;
    declare v_exist_debt_flag int;
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_strike_status varchar(2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_appr_status varchar(2);
    declare v_exter_comm_flag int;
    declare v_comm_oper_way varchar(2);

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
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
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
    SET v_all_fee = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_comm_status = "0";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_strike_status = "0";
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_status = " ";
    SET v_exter_comm_flag = 0;
    SET v_comm_oper_way = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_指令_获取指令信息】*/
    call db_tdsecu.pra_tdseap_CheckCommInfo(
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
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_crncy_type,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_stock_code,
        v_target_code_no,
        v_trade_code_no,
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
        v_all_fee,
        v_net_price_flag,
        v_par_value,
        v_bond_accr_intrst,
        v_bond_rate_type,
        v_strike_status,
        v_comm_status,
        v_comm_begin_date,
        v_comm_end_date,
        v_comm_begin_time,
        v_comm_end_time,
        v_comm_comple_date,
        v_comm_comple_time,
        v_comm_appr_status,
        v_exter_comm_flag,
        v_comm_oper_way,
        v_combo_posi_id,
        v_combo_code,
        v_asset_acco_type,
        v_exist_debt_flag);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_获取指令信息出现错误！',v_mysql_message);
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
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_target_code_no = v_target_code_no;
    SET p_trade_code_no = v_trade_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
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
    SET p_all_fee = v_all_fee;
    SET p_net_price_flag = v_net_price_flag;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_comm_begin_date = v_comm_begin_date;
    SET p_comm_end_date = v_comm_end_date;
    SET p_comm_begin_time = v_comm_begin_time;
    SET p_comm_end_time = v_comm_end_time;
    SET p_combo_code = v_combo_code;
    SET p_combo_posi_id = v_combo_posi_id;
    SET p_comm_status = v_comm_status;
    SET p_asset_acco_type = v_asset_acco_type;
    SET p_exist_debt_flag = v_exist_debt_flag;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_校验订单指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_CheckOrderComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_CheckOrderComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_id bigint,
    IN p_order_date int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_opor int
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
    declare v_order_date int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_opor int;
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_batch_no int;
    declare v_exter_comm_flag int;
    declare v_comm_date int;
    declare v_comm_executor int;
    declare v_comm_oper_way varchar(2);
    declare v_comm_amt decimal(18,4);

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
    SET v_order_date = p_order_date;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_opor = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_batch_no = 0;
    SET v_exter_comm_flag = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_executor = 0;
    SET v_comm_oper_way = " ";
    SET v_comm_amt = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_指令_校验订单指令】*/
    call db_tdsecu.pra_tdseap_CheckOrderComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_id,
        v_order_date,
        v_order_dir,
        v_order_price,
        v_order_qty,
        v_price_type,
        v_error_code,
        v_error_info,
        v_limit_actual_price,
        v_comm_batch_no,
        v_exter_comm_flag,
        v_comm_date,
        v_comm_executor,
        v_comm_opor,
        v_comm_oper_way,
        v_comm_amt);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_校验订单指令出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_opor = v_comm_opor;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_校验组合在途指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_CheckComboWayComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_CheckComboWayComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_combo_code varchar(32),
    IN p_comm_batch_no int,
    IN p_co_no int,
    IN p_stock_code_no int,
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
    declare v_combo_code varchar(32);
    declare v_comm_batch_no int;
    declare v_co_no int;
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_time int;
    declare v_record_count int;

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
    SET v_combo_code = p_combo_code;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_co_no = p_co_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_time = date_format(curtime(),'%H%i%s');
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* select  date_format(CURRENT_TIME(),'%H%i%s') into @操作时间#; */
    select  date_format(CURRENT_TIME(),'%H%i%s') into v_oper_time;

    /* select count(1) into @记录个数# from ~交易证券_指令_指令表^  where {机构编号} = @机构编号# and {组合代码}=@组合代码# and {指令批号} <>@指令批号# and {证券代码编号} = @证券代码编号# and {指令完成标志} = 《指令完成标志-未完成》 and {指令状态} <> 《指令状态-全部撤销》  and (@操作时间# between {指令开始时间} and {指令结束时间}); */
    select count(1) into v_record_count from db_tdsecu.tb_tdseap_command  where co_no = v_co_no and combo_code=v_combo_code and comm_batch_no <>v_comm_batch_no and stock_code_no = v_stock_code_no and comm_comple_flag = 1 and comm_status <> "6"  and (v_oper_time between comm_begin_time and comm_end_time);

    /* [检查报错返回][@记录个数#>0][778][@记录个数#] */
    if v_record_count>0 then
        
        SET v_error_code = "tdsecuT.3.13.778";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录个数=",v_record_count),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录个数=",v_record_count);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_循环获取指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_LoopGetComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_LoopGetComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_comm_id bigint,
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_target_code_no int,
    OUT p_trade_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_comm_date int,
    OUT p_comm_time int,
    OUT p_comm_batch_no int,
    OUT p_comm_status varchar(2),
    OUT p_comm_opor int,
    OUT p_comm_executor int,
    OUT p_comm_dir int,
    OUT p_comm_limit_price decimal(16,9),
    OUT p_limit_actual_price decimal(16,9),
    OUT p_comm_qty decimal(18,2),
    OUT p_order_qty decimal(18,2),
    OUT p_comm_cancel_qty decimal(18,2),
    OUT p_net_price_flag int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_intrst_days int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_comm_end_date int,
    OUT p_comm_comple_flag int,
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
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_comm_id bigint;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_date int;
    declare v_comm_time int;
    declare v_comm_batch_no int;
    declare v_comm_status varchar(2);
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_end_date int;
    declare v_comm_comple_flag int;
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
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_comm_id = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_batch_no = 0;
    SET v_comm_status = "0";
    SET v_comm_opor = 0;
    SET v_comm_executor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_flag = 0;
    SET v_combo_code = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_指令_循环获取指令】*/
    call db_tdsecu.pra_tdseap_LoopGetComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_error_code,
        v_error_info,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_pass_no,
        v_out_acco,
        v_comm_id,
        v_exch_crncy_type,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_stock_code,
        v_target_code_no,
        v_trade_code_no,
        v_stock_type,
        v_asset_type,
        v_comm_date,
        v_comm_time,
        v_comm_batch_no,
        v_comm_status,
        v_comm_opor,
        v_comm_executor,
        v_comm_dir,
        v_comm_limit_price,
        v_limit_actual_price,
        v_comm_qty,
        v_order_qty,
        v_comm_cancel_qty,
        v_net_price_flag,
        v_par_value,
        v_impawn_ratio,
        v_intrst_days,
        v_bond_accr_intrst,
        v_bond_rate_type,
        v_comm_end_date,
        v_comm_comple_flag);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.30.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_循环获取指令出现错误！',v_mysql_message);
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
    SET p_comm_id = v_comm_id;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_target_code_no = v_target_code_no;
    SET p_trade_code_no = v_trade_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_comm_date = v_comm_date;
    SET p_comm_time = v_comm_time;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_status = v_comm_status;
    SET p_comm_opor = v_comm_opor;
    SET p_comm_executor = v_comm_executor;
    SET p_comm_dir = v_comm_dir;
    SET p_comm_limit_price = v_comm_limit_price;
    SET p_limit_actual_price = v_limit_actual_price;
    SET p_comm_qty = v_comm_qty;
    SET p_order_qty = v_order_qty;
    SET p_comm_cancel_qty = v_comm_cancel_qty;
    SET p_net_price_flag = v_net_price_flag;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_comm_end_date = v_comm_end_date;
    SET p_comm_comple_flag = v_comm_comple_flag;
    SET p_combo_code = v_combo_code;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_多日指令重算
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_ReCalcuMultiComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_ReCalcuMultiComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_comm_date int,
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_par_value decimal(16,9),
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
    declare v_comm_date int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_par_value decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_is_record_jour int;

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
    SET v_comm_date = p_comm_date;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_par_value = p_par_value;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_is_record_jour = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* 调用【原子_交易证券_指令_多日指令重算】*/
    call db_tdsecu.pra_tdseap_ReCalcuMultiComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_comm_date,
        v_comm_id,
        v_bond_accr_intrst,
        v_par_value,
        v_is_record_jour,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.31.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_多日指令重算出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_指令_查询指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_QueryComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_QueryComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_appr_oper int,
    IN p_comm_appr_status_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
    IN p_comm_dir_str varchar(2048),
    IN p_comm_status_str varchar(64),
    IN p_strike_status_str varchar(64),
    IN p_basket_id bigint,
    IN p_comm_oper_way varchar(2),
    IN p_exter_comm_flag int,
    IN p_comm_comple_flag int,
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
    declare v_comm_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_appr_oper int;
    declare v_comm_appr_status_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
    declare v_comm_dir_str varchar(2048);
    declare v_comm_status_str varchar(64);
    declare v_strike_status_str varchar(64);
    declare v_basket_id bigint;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_comm_comple_flag int;
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
    SET v_comm_id = p_comm_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_comm_appr_status_str = p_comm_appr_status_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_asset_type_str = p_asset_type_str;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_comm_status_str = p_comm_status_str;
    SET v_strike_status_str = p_strike_status_str;
    SET v_basket_id = p_basket_id;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_comm_comple_flag = p_comm_comple_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #if @指定行数#>500 or @指定行数# <1 then
     # set @指定行数#=500;
    #end if;

    /* if @指令审批状态串# <> " " then */
    if v_comm_appr_status_str <> " " then

        /* set @指令审批状态串#=concat(";", @指令审批状态串#, ";"); */
        set v_comm_appr_status_str=concat(";", v_comm_appr_status_str, ";");
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串#=concat(";", @证券类型串#, ";"); */
        set v_stock_type_str=concat(";", v_stock_type_str, ";");
    end if;

    /* if @资产类型串# <> " " then */
    if v_asset_type_str <> " " then

        /* set @资产类型串#=concat(";", @资产类型串#, ";"); */
        set v_asset_type_str=concat(";", v_asset_type_str, ";");
    end if;

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* if @指令状态串# <> " " then */
    if v_comm_status_str <> " " then

        /* set @指令状态串#=concat(";", @指令状态串#, ";"); */
        set v_comm_status_str=concat(";", v_comm_status_str, ";");
    end if;

    /* if @成交状态串# <> " " then */
    if v_strike_status_str <> " " then

        /* set @成交状态串#=concat(";", @成交状态串#, ";"); */
        set v_strike_status_str=concat(";", v_strike_status_str, ";");
    end if;

    /* if @操作员机构编号# = 9999 then */
    if v_opor_co_no = 9999 then

        /* set @机构编号权限串# = " "; */
        set v_co_no_rights_str = " ";

        /* set @产品编号权限串# = " "; */
        set v_pd_no_rights_str = " ";

        /* set @交易组编号权限串# = " "; */
        set v_exch_group_no_rights_str = " ";
    end if;

    /* 调用【原子_交易证券_指令_查询指令】*/
    call db_tdsecu.pra_tdseap_QueryComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_id,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_comm_opor,
        v_comm_executor,
        v_comm_appr_oper,
        v_comm_appr_status_str,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_asset_type_str,
        v_comm_dir_str,
        v_comm_status_str,
        v_strike_status_str,
        v_basket_id,
        v_comm_oper_way,
        v_exter_comm_flag,
        v_comm_comple_flag,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.51.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_查询指令出现错误！',v_mysql_message);
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

# 事务_交易证券_指令_查询指令历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_QueryComm_His;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_QueryComm_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_comm_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_appr_oper int,
    IN p_comm_appr_status_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
    IN p_comm_dir_str varchar(2048),
    IN p_comm_status_str varchar(64),
    IN p_strike_status_str varchar(64),
    IN p_basket_id bigint,
    IN p_comm_oper_way varchar(2),
    IN p_exter_comm_flag int,
    IN p_comm_comple_flag int,
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_comm_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_appr_oper int;
    declare v_comm_appr_status_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
    declare v_comm_dir_str varchar(2048);
    declare v_comm_status_str varchar(64);
    declare v_strike_status_str varchar(64);
    declare v_basket_id bigint;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_comm_comple_flag int;
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_comm_id = p_comm_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_comm_appr_status_str = p_comm_appr_status_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_asset_type_str = p_asset_type_str;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_comm_status_str = p_comm_status_str;
    SET v_strike_status_str = p_strike_status_str;
    SET v_basket_id = p_basket_id;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_comm_comple_flag = p_comm_comple_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdsecuT.3.52.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdsecuT.3.52.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>93 then
        
        SET v_error_code = "tdsecuT.3.52.255";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @指令审批状态串# <> " " then */
    if v_comm_appr_status_str <> " " then

        /* set @指令审批状态串#=concat(";", @指令审批状态串#, ";"); */
        set v_comm_appr_status_str=concat(";", v_comm_appr_status_str, ";");
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串#=concat(";", @证券类型串#, ";"); */
        set v_stock_type_str=concat(";", v_stock_type_str, ";");
    end if;

    /* if @资产类型串# <> " " then */
    if v_asset_type_str <> " " then

        /* set @资产类型串#=concat(";", @资产类型串#, ";"); */
        set v_asset_type_str=concat(";", v_asset_type_str, ";");
    end if;

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* if @指令状态串# <> " " then */
    if v_comm_status_str <> " " then

        /* set @指令状态串#=concat(";", @指令状态串#, ";"); */
        set v_comm_status_str=concat(";", v_comm_status_str, ";");
    end if;

    /* if @成交状态串# <> " " then */
    if v_strike_status_str <> " " then

        /* set @成交状态串#=concat(";", @成交状态串#, ";"); */
        set v_strike_status_str=concat(";", v_strike_status_str, ";");
    end if;

    /* if @操作员机构编号# = 9999 then */
    if v_opor_co_no = 9999 then

        /* set @机构编号权限串# = " "; */
        set v_co_no_rights_str = " ";

        /* set @产品编号权限串# = " "; */
        set v_pd_no_rights_str = " ";

        /* set @交易组编号权限串# = " "; */
        set v_exch_group_no_rights_str = " ";
    end if;

    /* 调用【原子_交易证券_指令_查询指令历史】*/
    call db_tdsecu.pra_tdseap_QueryComm_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_comm_id,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_comm_opor,
        v_comm_executor,
        v_comm_appr_oper,
        v_comm_appr_status_str,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_asset_type_str,
        v_comm_dir_str,
        v_comm_status_str,
        v_strike_status_str,
        v_basket_id,
        v_comm_oper_way,
        v_exter_comm_flag,
        v_comm_comple_flag,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.52.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_查询指令历史出现错误！',v_mysql_message);
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

# 事务_交易证券_指令_查询指令分发
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_QueryCommDispJour;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_QueryCommDispJour(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_disp_opor int,
    IN p_before_comm_executor int,
    IN p_comm_executor int,
    IN p_comm_id bigint,
    IN p_comm_dir_str varchar(2048),
    IN p_exter_comm_flag int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_disp_opor int;
    declare v_before_comm_executor int;
    declare v_comm_executor int;
    declare v_comm_id bigint;
    declare v_comm_dir_str varchar(2048);
    declare v_exter_comm_flag int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_disp_opor = p_disp_opor;
    SET v_before_comm_executor = p_before_comm_executor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_id = p_comm_id;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
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

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串#=concat(";", @证券类型串#, ";"); */
        set v_stock_type_str=concat(";", v_stock_type_str, ";");
    end if;

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* 调用【原子_交易证券_指令_查询指令分发】*/
    call db_tdsecu.pra_tdseap_QueryCommDispJour(
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
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_disp_opor,
        v_before_comm_executor,
        v_comm_executor,
        v_comm_id,
        v_comm_dir_str,
        v_exter_comm_flag,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.53.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_查询指令分发出现错误！',v_mysql_message);
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

# 事务_交易证券_指令_查询指令分发历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_QueryCommDispJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_QueryCommDispJour_His(
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
    IN p_exch_group_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_disp_opor int,
    IN p_before_comm_executor int,
    IN p_comm_executor int,
    IN p_comm_id bigint,
    IN p_comm_dir_str varchar(2048),
    IN p_exter_comm_flag int,
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_disp_opor int;
    declare v_before_comm_executor int;
    declare v_comm_executor int;
    declare v_comm_id bigint;
    declare v_comm_dir_str varchar(2048);
    declare v_exter_comm_flag int;
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_disp_opor = p_disp_opor;
    SET v_before_comm_executor = p_before_comm_executor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_id = p_comm_id;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdsecuT.3.54.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdsecuT.3.54.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>93 then
        
        SET v_error_code = "tdsecuT.3.54.255";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串#=concat(";", @证券类型串#, ";"); */
        set v_stock_type_str=concat(";", v_stock_type_str, ";");
    end if;

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* 调用【原子_交易证券_指令_查询指令分发历史】*/
    call db_tdsecu.pra_tdseap_QueryCommDispJour_His(
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
        v_exch_group_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_disp_opor,
        v_before_comm_executor,
        v_comm_executor,
        v_comm_id,
        v_comm_dir_str,
        v_exter_comm_flag,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.54.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_查询指令分发历史出现错误！',v_mysql_message);
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

# 事务_交易证券_指令_查询指令审批
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_QueryCommApprJour;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_QueryCommApprJour(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_opor int,
    IN p_comm_dir_str varchar(2048),
    IN p_comm_appr_oper int,
    IN p_exter_comm_flag int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_opor int;
    declare v_comm_dir_str varchar(2048);
    declare v_comm_appr_oper int;
    declare v_exter_comm_flag int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_exter_comm_flag = p_exter_comm_flag;
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

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串#=concat(";", @证券类型串#, ";"); */
        set v_stock_type_str=concat(";", v_stock_type_str, ";");
    end if;

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* 调用【原子_交易证券_指令_查询指令审批】*/
    call db_tdsecu.pra_tdseap_QueryCommApprJour(
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
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_comm_id,
        v_comm_opor,
        v_comm_dir_str,
        v_comm_appr_oper,
        v_exter_comm_flag,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.55.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_查询指令审批出现错误！',v_mysql_message);
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

# 事务_交易证券_指令_查询指令审批历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_QueryCommApprJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_QueryCommApprJour_His(
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
    IN p_exch_group_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_opor int,
    IN p_comm_dir_str varchar(2048),
    IN p_comm_appr_oper int,
    IN p_exter_comm_flag int,
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_opor int;
    declare v_comm_dir_str varchar(2048);
    declare v_comm_appr_oper int;
    declare v_exter_comm_flag int;
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdsecuT.3.56.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdsecuT.3.56.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>93 then
        
        SET v_error_code = "tdsecuT.3.56.255";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串#=concat(";", @证券类型串#, ";"); */
        set v_stock_type_str=concat(";", v_stock_type_str, ";");
    end if;

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* 调用【原子_交易证券_指令_查询指令审批历史】*/
    call db_tdsecu.pra_tdseap_QueryCommApprJour_His(
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
        v_exch_group_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_comm_id,
        v_comm_opor,
        v_comm_dir_str,
        v_comm_appr_oper,
        v_exter_comm_flag,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.56.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_查询指令审批历史出现错误！',v_mysql_message);
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

# 事务_交易证券_指令_查询汇总指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_QuerySumComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_QuerySumComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_date int,
    IN p_comm_batch_no int,
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_sum_appr_status_str varchar(64),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
    IN p_comm_dir_str varchar(2048),
    IN p_comm_sum_status_str varchar(64),
    IN p_strike_status_str varchar(64),
    IN p_basket_id bigint,
    IN p_comm_oper_way varchar(2),
    IN p_exter_comm_flag int,
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
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_sum_appr_status_str varchar(64);
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
    declare v_comm_dir_str varchar(2048);
    declare v_comm_sum_status_str varchar(64);
    declare v_strike_status_str varchar(64);
    declare v_basket_id bigint;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
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
    SET v_comm_date = p_comm_date;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_sum_appr_status_str = p_comm_sum_appr_status_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_asset_type_str = p_asset_type_str;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_comm_sum_status_str = p_comm_sum_status_str;
    SET v_strike_status_str = p_strike_status_str;
    SET v_basket_id = p_basket_id;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
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

    /* if @指令汇总审批状态串# <> " " then */
    if v_comm_sum_appr_status_str <> " " then

        /* set @指令汇总审批状态串#=concat(";", @指令汇总审批状态串#, ";"); */
        set v_comm_sum_appr_status_str=concat(";", v_comm_sum_appr_status_str, ";");
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串#=concat(";", @证券类型串#, ";"); */
        set v_stock_type_str=concat(";", v_stock_type_str, ";");
    end if;

    /* if @资产类型串# <> " " then */
    if v_asset_type_str <> " " then

        /* set @资产类型串#=concat(";", @资产类型串#, ";"); */
        set v_asset_type_str=concat(";", v_asset_type_str, ";");
    end if;

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* if @指令汇总状态串# <> " " then */
    if v_comm_sum_status_str <> " " then

        /* set @指令汇总状态串#=concat(";", @指令汇总状态串#, ";"); */
        set v_comm_sum_status_str=concat(";", v_comm_sum_status_str, ";");
    end if;

    /* if @成交状态串# <> " " then */
    if v_strike_status_str <> " " then

        /* set @成交状态串#=concat(";", @成交状态串#, ";"); */
        set v_strike_status_str=concat(";", v_strike_status_str, ";");
    end if;

    /* 调用【原子_交易证券_指令_查询汇总指令】*/
    call db_tdsecu.pra_tdseap_QuerySumComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_date,
        v_comm_batch_no,
        v_comm_opor,
        v_comm_executor,
        v_comm_sum_appr_status_str,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_asset_type_str,
        v_comm_dir_str,
        v_comm_sum_status_str,
        v_strike_status_str,
        v_basket_id,
        v_comm_oper_way,
        v_exter_comm_flag,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.57.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_查询汇总指令出现错误！',v_mysql_message);
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

# 事务_交易证券_指令_查询汇总指令历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_QuerySumComm_His;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_QuerySumComm_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_comm_date int,
    IN p_comm_batch_no int,
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_sum_appr_status_str varchar(64),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
    IN p_comm_dir_str varchar(2048),
    IN p_comm_sum_status_str varchar(64),
    IN p_strike_status_str varchar(64),
    IN p_basket_id bigint,
    IN p_comm_oper_way varchar(2),
    IN p_exter_comm_flag int,
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_sum_appr_status_str varchar(64);
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
    declare v_comm_dir_str varchar(2048);
    declare v_comm_sum_status_str varchar(64);
    declare v_strike_status_str varchar(64);
    declare v_basket_id bigint;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_comm_date = p_comm_date;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_sum_appr_status_str = p_comm_sum_appr_status_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_asset_type_str = p_asset_type_str;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_comm_sum_status_str = p_comm_sum_status_str;
    SET v_strike_status_str = p_strike_status_str;
    SET v_basket_id = p_basket_id;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdsecuT.3.58.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdsecuT.3.58.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>93 then
        
        SET v_error_code = "tdsecuT.3.58.255";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @指令汇总审批状态串# <> " " then */
    if v_comm_sum_appr_status_str <> " " then

        /* set @指令汇总审批状态串#=concat(";", @指令汇总审批状态串#, ";"); */
        set v_comm_sum_appr_status_str=concat(";", v_comm_sum_appr_status_str, ";");
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串#=concat(";", @证券类型串#, ";"); */
        set v_stock_type_str=concat(";", v_stock_type_str, ";");
    end if;

    /* if @资产类型串# <> " " then */
    if v_asset_type_str <> " " then

        /* set @资产类型串#=concat(";", @资产类型串#, ";"); */
        set v_asset_type_str=concat(";", v_asset_type_str, ";");
    end if;

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* if @指令汇总状态串# <> " " then */
    if v_comm_sum_status_str <> " " then

        /* set @指令汇总状态串#=concat(";", @指令汇总状态串#, ";"); */
        set v_comm_sum_status_str=concat(";", v_comm_sum_status_str, ";");
    end if;

    /* if @成交状态串# <> " " then */
    if v_strike_status_str <> " " then

        /* set @成交状态串#=concat(";", @成交状态串#, ";"); */
        set v_strike_status_str=concat(";", v_strike_status_str, ";");
    end if;

    /* 调用【原子_交易证券_指令_查询汇总指令历史】*/
    call db_tdsecu.pra_tdseap_QuerySumComm_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_comm_date,
        v_comm_batch_no,
        v_comm_opor,
        v_comm_executor,
        v_comm_sum_appr_status_str,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_asset_type_str,
        v_comm_dir_str,
        v_comm_sum_status_str,
        v_strike_status_str,
        v_basket_id,
        v_comm_oper_way,
        v_exter_comm_flag,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.58.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_查询汇总指令历史出现错误！',v_mysql_message);
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

# 事务_交易证券_指令_获取主推指令信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_GetPushCommInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_GetPushCommInfo(
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
    OUT p_comm_date int,
    OUT p_comm_time int,
    OUT p_comm_batch_no int,
    OUT p_comm_opor int,
    OUT p_comm_executor int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_comm_date int;
    declare v_comm_time int;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
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
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_comm_executor = 0;
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
    

    /* 调用【原子_交易证券_指令_获取主推指令信息】*/
    call db_tdsecu.pra_tdseap_GetPushCommInfo(
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
        v_comm_date,
        v_comm_time,
        v_comm_batch_no,
        v_comm_opor,
        v_comm_executor,
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
        SET v_error_code = "tdsecuT.3.80.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_获取主推指令信息出现错误！',v_mysql_message);
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
    SET p_comm_date = v_comm_date;
    SET p_comm_time = v_comm_time;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_opor = v_comm_opor;
    SET p_comm_executor = v_comm_executor;
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

# 事务_交易证券_指令_获取主推汇总指令信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_GetPushSumCommInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_GetPushSumCommInfo(
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
    OUT p_row_id bigint,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_crncy_type varchar(3),
    OUT p_stock_code_no int,
    OUT p_comm_time int,
    OUT p_comm_opor int,
    OUT p_comm_dir int,
    OUT p_comm_limit_price decimal(16,9),
    OUT p_comm_qty decimal(18,2),
    OUT p_comm_amt decimal(18,4),
    OUT p_order_qty decimal(18,2),
    OUT p_comm_cancel_qty decimal(18,2),
    OUT p_comm_await_cancel_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_status varchar(2),
    OUT p_comm_sum_status varchar(2),
    OUT p_comm_begin_date int,
    OUT p_comm_end_date int,
    OUT p_comm_begin_time int,
    OUT p_comm_end_time int,
    OUT p_comm_comple_date int,
    OUT p_comm_comple_time int,
    OUT p_max_comm_comple_date int,
    OUT p_max_comm_comple_time int,
    OUT p_comm_appr_date int,
    OUT p_comm_appr_time int,
    OUT p_comm_appr_qty decimal(18,2),
    OUT p_comm_sum_approve_status varchar(2),
    OUT p_basket_id bigint,
    OUT p_net_price_flag int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_comm_oper_way varchar(2),
    OUT p_exter_comm_flag int,
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
    declare v_comm_date int;
    declare v_co_no int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_stock_code_no int;
    declare v_comm_time int;
    declare v_comm_opor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_await_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_status varchar(2);
    declare v_comm_sum_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_max_comm_comple_date int;
    declare v_max_comm_comple_time int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_appr_qty decimal(18,2);
    declare v_comm_sum_approve_status varchar(2);
    declare v_basket_id bigint;
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
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
    SET v_comm_date = p_comm_date;
    SET v_co_no = p_co_no;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_executor = p_comm_executor;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_stock_code_no = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_opor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_await_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_status = "0";
    SET v_comm_sum_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_max_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_max_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_qty = 0;
    SET v_comm_sum_approve_status = "0";
    SET v_basket_id = 0;
    SET v_net_price_flag = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_comm_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_指令_获取主推汇总指令信息】*/
    call db_tdsecu.pra_tdseap_GetPushSumCommInfo(
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
        v_row_id,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_pass_no,
        v_out_acco,
        v_exch_crncy_type,
        v_stock_code_no,
        v_comm_time,
        v_comm_opor,
        v_comm_dir,
        v_comm_limit_price,
        v_comm_qty,
        v_comm_amt,
        v_order_qty,
        v_comm_cancel_qty,
        v_comm_await_cancel_qty,
        v_strike_amt,
        v_strike_qty,
        v_strike_status,
        v_comm_sum_status,
        v_comm_begin_date,
        v_comm_end_date,
        v_comm_begin_time,
        v_comm_end_time,
        v_comm_comple_date,
        v_comm_comple_time,
        v_max_comm_comple_date,
        v_max_comm_comple_time,
        v_comm_appr_date,
        v_comm_appr_time,
        v_comm_appr_qty,
        v_comm_sum_approve_status,
        v_basket_id,
        v_net_price_flag,
        v_bond_accr_intrst,
        v_bond_rate_type,
        v_comm_oper_way,
        v_exter_comm_flag,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.81.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_获取主推汇总指令信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_stock_code_no = v_stock_code_no;
    SET p_comm_time = v_comm_time;
    SET p_comm_opor = v_comm_opor;
    SET p_comm_dir = v_comm_dir;
    SET p_comm_limit_price = v_comm_limit_price;
    SET p_comm_qty = v_comm_qty;
    SET p_comm_amt = v_comm_amt;
    SET p_order_qty = v_order_qty;
    SET p_comm_cancel_qty = v_comm_cancel_qty;
    SET p_comm_await_cancel_qty = v_comm_await_cancel_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_status = v_strike_status;
    SET p_comm_sum_status = v_comm_sum_status;
    SET p_comm_begin_date = v_comm_begin_date;
    SET p_comm_end_date = v_comm_end_date;
    SET p_comm_begin_time = v_comm_begin_time;
    SET p_comm_end_time = v_comm_end_time;
    SET p_comm_comple_date = v_comm_comple_date;
    SET p_comm_comple_time = v_comm_comple_time;
    SET p_max_comm_comple_date = v_max_comm_comple_date;
    SET p_max_comm_comple_time = v_max_comm_comple_time;
    SET p_comm_appr_date = v_comm_appr_date;
    SET p_comm_appr_time = v_comm_appr_time;
    SET p_comm_appr_qty = v_comm_appr_qty;
    SET p_comm_sum_approve_status = v_comm_sum_approve_status;
    SET p_basket_id = v_basket_id;
    SET p_net_price_flag = v_net_price_flag;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_comm_oper_way = v_comm_oper_way;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_获取指令实际限价
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_GetCommLimitActualPrice;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_GetCommLimitActualPrice(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_limit_price decimal(16,9),
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_dir int,
    IN p_last_price decimal(16,9),
    IN p_pre_close_price decimal(16,9),
    IN p_comm_no_limit_price_ratio decimal(18,12),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pre_limit_actual_price decimal(16,9)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_dir int;
    declare v_last_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pre_limit_actual_price decimal(16,9);

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
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_dir = p_comm_dir;
    SET v_last_price = p_last_price;
    SET v_pre_close_price = p_pre_close_price;
    SET v_comm_no_limit_price_ratio = p_comm_no_limit_price_ratio;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pre_limit_actual_price = 0;

    
    label_pro:BEGIN
    

    /* if @指令限价#=0 and @指令实际限价# = 0 then */
    if v_comm_limit_price=0 and v_limit_actual_price = 0 then

        /* if @指令方向# = 《指令方向-买入》 then */
        if v_comm_dir = 1 then

            /* if @最新价# = 0 then */
            if v_last_price = 0 then

                /* set @指令实际限价#=@昨收盘价# * (1+@指令不限价浮动比例#); */
                set v_limit_actual_price=v_pre_close_price * (1+v_comm_no_limit_price_ratio);
            else

                /* set @指令实际限价#=@最新价# * (1+@指令不限价浮动比例#); */
                set v_limit_actual_price=v_last_price * (1+v_comm_no_limit_price_ratio);
            end if;

            /* if @指令实际限价# > @涨停价# and @涨停价# > 0 then */
            if v_limit_actual_price > v_up_limit_price and v_up_limit_price > 0 then

                 /* set @指令实际限价#=@涨停价#; */
                 set v_limit_actual_price=v_up_limit_price;
            end if;

        /* elseif @指令方向# = 《指令方向-卖出》 then */
        elseif v_comm_dir = 2 then

            /* if @最新价# = 0 then */
            if v_last_price = 0 then

                /* set @指令实际限价#=@昨收盘价# * (1-@指令不限价浮动比例#); */
                set v_limit_actual_price=v_pre_close_price * (1-v_comm_no_limit_price_ratio);
            else

                /* set @指令实际限价#=@最新价# * (1-@指令不限价浮动比例#); */
                set v_limit_actual_price=v_last_price * (1-v_comm_no_limit_price_ratio);
            end if;

            /* if @指令实际限价# < @跌停价# and @跌停价# > 0 then */
            if v_limit_actual_price < v_down_limit_price and v_down_limit_price > 0 then

                 /* set @指令实际限价#=@跌停价#; */
                 set v_limit_actual_price=v_down_limit_price;
            end if;
        end if;

    /* elseif @指令实际限价# = 0 then */
    elseif v_limit_actual_price = 0 then

      /* set @指令实际限价#=@指令限价#; */
      set v_limit_actual_price=v_comm_limit_price;
    end if;

    /* if @指令方向# = 《指令方向-基金申购》 then */
    if v_comm_dir = 9 then

        /* set @指令实际限价# = 1; */
        set v_limit_actual_price = 1;

    /* elseif @指令方向# = 《指令方向-基金赎回》 then */
    elseif v_comm_dir = 10 then

        /* set @指令实际限价# = 0; */
        set v_limit_actual_price = 0;
    else

        /* set @指令实际限价# = @指令实际限价#; */
        set v_limit_actual_price = v_limit_actual_price;
    end if;

    /* set @前指令实际限价# = @指令实际限价#; */
    set v_pre_limit_actual_price = v_limit_actual_price;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pre_limit_actual_price = v_pre_limit_actual_price;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_获取去重指令批号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_GetCommBatchNo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_GetCommBatchNo(
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
    

    /* 调用【原子_交易证券_指令_获取去重指令批号】*/
    call db_tdsecu.pra_tdseap_GetCommBatchNo(
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
        SET v_error_code = "tdsecuT.3.83.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_获取去重指令批号出现错误！',v_mysql_message);
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

# 事务_交易证券_指令_锁定获取同批可暂停指令个数
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_LockGetBatchPauseCommCount;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_LockGetBatchPauseCommCount(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_batch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_comm_batch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;

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
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_指令_锁定获取同批可暂停指令个数】*/
    call db_tdsecu.pra_tdseap_LockGetBatchPauseCommCount(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_batch_no,
        v_error_code,
        v_error_info,
        v_record_count);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.84.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_锁定获取同批可暂停指令个数出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_暂停明细指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_PauseDetailComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_PauseDetailComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_comm_id_str varchar(2048),
    IN p_comm_batch_no int,
    IN p_comm_date int,
    IN p_comm_executor int,
    IN p_co_no int,
    IN p_is_withdraw int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_id bigint,
    OUT p_order_id_str varchar(2048),
    OUT p_wtdraw_id_str varchar(2048)
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
    declare v_comm_id_str varchar(2048);
    declare v_comm_batch_no int;
    declare v_comm_date int;
    declare v_comm_executor int;
    declare v_co_no int;
    declare v_is_withdraw int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_id bigint;
    declare v_order_id_str varchar(2048);
    declare v_wtdraw_id_str varchar(2048);
    declare v_record_count int;
    declare v_comm_status varchar(2);
    declare v_strike_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_stock_code_no int;
    declare v_comm_time int;
    declare v_comm_opor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_await_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_comm_sum_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_max_comm_comple_date int;
    declare v_max_comm_comple_time int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_appr_qty decimal(18,2);
    declare v_comm_sum_approve_status varchar(2);
    declare v_basket_id bigint;
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_update_times int;
    declare v_split_str varchar(4);
    declare v_is_record_jour int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_status varchar(2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_impawn_ratio decimal(18,12);
    declare v_par_value decimal(16,9);
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_target_stock_code_no int;
    declare v_trade_acco varchar(32);
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_remark varchar(255);
    declare v_frozen_amt decimal(18,4);
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_id bigint;
    declare v_waste_qty decimal(18,2);

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
    SET v_comm_id_str = p_comm_id_str;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_date = p_comm_date;
    SET v_comm_executor = p_comm_executor;
    SET v_co_no = p_co_no;
    SET v_is_withdraw = p_is_withdraw;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_id = 0;
    SET v_order_id_str = " ";
    SET v_wtdraw_id_str = " ";
    SET v_record_count = 0;
    SET v_comm_status = "0";
    SET v_strike_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_stock_code_no = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_opor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_await_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_comm_sum_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_max_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_max_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_qty = 0;
    SET v_comm_sum_approve_status = "0";
    SET v_basket_id = 0;
    SET v_net_price_flag = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_comm_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_update_times = 1;
    SET v_split_str = " ";
    SET v_is_record_jour = 1;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_external_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_batch_no = 0;
    SET v_order_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_status = "0";
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_all_fee = 0;
    SET v_wtdraw_qty = 0;
    SET v_impawn_ratio = 0;
    SET v_par_value = 0;
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_target_stock_code_no = 0;
    SET v_trade_acco = " ";
    SET v_wtdraw_batch_no = 0;
    SET v_wtdraw_remark = " ";
    SET v_frozen_amt = 0;
    SET v_wtdraw_status = "0";
    SET v_wtdraw_id = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;

        #检查原指令状态

        /* set @记录个数# = 0 ; */
        set v_record_count = 0 ;

        /* [获取表记录数量][交易证券_指令_指令表][@记录个数#][@指令状态#=《指令状态-暂停执行》 or  @指令状态#=《指令状态-待撤销》 or @指令状态#=《指令状态-部分撤销》 or @指令状态#=《指令状态-全部撤销》 or @成交状态#=《成交状态-已成》 and instr(@指令序号串#, concat(";",{记录序号},";"))>0 and {指令批号} = @指令批号# for update] */
        select count(1) into v_record_count from db_tdsecu.tb_tdseap_command where v_comm_status="7" or  v_comm_status="4" or v_comm_status="5" or v_comm_status="6" or v_strike_status="3" and instr(v_comm_id_str, concat(";",row_id,";"))>0 and comm_batch_no = v_comm_batch_no for update;


        /* [检查报错返回][@记录个数# <>0][805][@指令序号串#] */
        if v_record_count <>0 then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.85.805";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令序号串=",v_comm_id_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令序号串=",v_comm_id_str);
            end if;
            leave label_pro;
        end if;


        /* [更新表记录][交易证券_指令_指令表][{指令状态} = 《指令状态-暂停执行》][instr(@指令序号串#, concat(";",{记录序号},";"))>0 and  {指令批号} = @指令批号#][2][@指令序号串#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdseap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, comm_status = "7" where instr(v_comm_id_str, concat(";",row_id,";"))>0 and  comm_batch_no = v_comm_batch_no;
        if v_error_code = "1" then
            ROLLBACK;        
            SET v_error_code = "tdsecuT.3.85.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令序号串=",v_comm_id_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令序号串=",v_comm_id_str);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录数量][交易证券_指令_指令表][@记录个数#][{指令批号}=@指令批号# and {机构编号}=@操作员机构编号# and  ({指令状态}=《指令状态-未执行》 or {指令状态}=《指令状态-部分执行》 or ({指令状态}=《指令状态-全部执行》 and {成交状态}=《成交状态-未成》) or ({指令状态}=《指令状态-全部执行》 and {成交状态}=《成交状态-部成》))] */
        select count(1) into v_record_count from db_tdsecu.tb_tdseap_command where comm_batch_no=v_comm_batch_no and co_no=v_opor_co_no and  (comm_status="1" or comm_status="2" or (comm_status="3" and strike_status="1") or (comm_status="3" and strike_status="2"));


        /* if @指令批号# > 0 and @记录个数# =0  then */
        if v_comm_batch_no > 0 and v_record_count =0  then

            /* 调用【原子_交易证券_指令_获取主推汇总指令信息】*/
            call db_tdsecu.pra_tdseap_GetPushSumCommInfo(
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
                v_row_id,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_pass_no,
                v_out_acco,
                v_exch_crncy_type,
                v_stock_code_no,
                v_comm_time,
                v_comm_opor,
                v_comm_dir,
                v_comm_limit_price,
                v_comm_qty,
                v_comm_amt,
                v_order_qty,
                v_comm_cancel_qty,
                v_comm_await_cancel_qty,
                v_strike_amt,
                v_strike_qty,
                v_strike_status,
                v_comm_sum_status,
                v_comm_begin_date,
                v_comm_end_date,
                v_comm_begin_time,
                v_comm_end_time,
                v_comm_comple_date,
                v_comm_comple_time,
                v_max_comm_comple_date,
                v_max_comm_comple_time,
                v_comm_appr_date,
                v_comm_appr_time,
                v_comm_appr_qty,
                v_comm_sum_approve_status,
                v_basket_id,
                v_net_price_flag,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_comm_oper_way,
                v_exter_comm_flag,
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.85.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_获取主推汇总指令信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @订单数量# =@指令数量#-@成交数量#-@指令撤销数量#; */
            set v_order_qty =v_comm_qty-v_strike_qty-v_comm_cancel_qty;

            /* if (@指令汇总状态#=《指令汇总状态-未执行》 or @指令汇总状态#=《指令汇总状态-部分执行》 or (@指令汇总状态#=《指令汇总状态-全部执行》 and @成交状态#<>《成交状态-已成》)or  (@指令汇总状态#=《指令汇总状态-部分撤销》 and @订单数量#>0))then */
            if (v_comm_sum_status="1" or v_comm_sum_status="2" or (v_comm_sum_status="3" and v_strike_status<>"3")or  (v_comm_sum_status="5" and v_order_qty>0))then

                /* set @指令汇总状态#=《指令汇总状态-暂停执行》; */
                set v_comm_sum_status="7";

                /* 调用【原子_交易证券_指令_修改汇总指令状态】*/
                call db_tdsecu.pra_tdseap_ModiTotalComm(
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
                    v_comm_sum_status,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.85.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_修改汇总指令状态出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            end if;
    #明细指令无汇总的 返回指令序号供 主推

        /* elseif @指令批号#=0  then */
        elseif v_comm_batch_no=0  then

            /* set @指令序号#=cast(substring(@指令序号串#,1,LOCATE(@分隔符#,@指令序号串#)-1) as SIGNED); */
            set v_comm_id=cast(substring(v_comm_id_str,1,LOCATE(v_split_str,v_comm_id_str)-1) as SIGNED);
        end if;
    #暂停指令的同时，撤掉其挂单

    /* set @订单序号串# = ""; */
    set v_order_id_str = "";

    /* set @撤单序号串# = ""; */
    set v_wtdraw_id_str = "";

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @分隔符#=";"; */
    set v_split_str=";";

    /* if @是否撤单#=《是否撤单-是》 then */
    if v_is_withdraw=1 then

       /* set @指令序号串#=substring(@指令序号串#,LOCATE(@分隔符#,@指令序号串#)+1); */
       set v_comm_id_str=substring(v_comm_id_str,LOCATE(v_split_str,v_comm_id_str)+1);

      /* while LOCATE(@分隔符#,@指令序号串#)<>0   do */
      while LOCATE(v_split_str,v_comm_id_str)<>0   do
        #采用循环更新获取订单的方式，避免加锁时间长和并发问题

        /* set @指令序号#=cast(substring(@指令序号串#,1,LOCATE(@分隔符#,@指令序号串#)-1) as SIGNED); */
        set v_comm_id=cast(substring(v_comm_id_str,1,LOCATE(v_split_str,v_comm_id_str)-1) as SIGNED);

        /* set @记录序号# = 0; */
        set v_row_id = 0;
        loop_label:loop

            /* [事务开始] */
            START TRANSACTION;


            /* 调用【原子_交易证券_交易_锁定获取指令订单】*/
            call db_tdsecu.pra_tdsetd_LockGetCommOrder(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_comm_id,
                v_row_id,
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
                v_target_code_no,
                v_trade_code_no,
                v_stock_type,
                v_asset_type,
                v_comm_opor,
                v_external_no,
                v_report_date,
                v_report_time,
                v_report_no,
                v_order_batch_no,
                v_order_id,
                v_order_date,
                v_order_time,
                v_order_dir,
                v_price_type,
                v_order_price,
                v_order_qty,
                v_order_status,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_all_fee,
                v_wtdraw_qty,
                v_strike_amt,
                v_strike_qty,
                v_impawn_ratio,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_order_oper_way,
                v_busi_opor_no,
                v_target_stock_code_no,
                v_trade_acco);

            /* if @错误编码#="0" then */
            if v_error_code="0" then

                /* set @记录序号# = @订单序号#; */
                set v_row_id = v_order_id;

                /* set @撤单批号# = 0; */
                set v_wtdraw_batch_no = 0;

                /* set @撤单说明# = "指令暂停同时撤销指令订单！"; */
                set v_wtdraw_remark = "指令暂停同时撤销指令订单！";

                /* 调用【原子_交易证券_指令_撤销指令订单】*/
                call db_tdsecu.pra_tdseap_CancelCommOrder(
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
                    v_out_acco,
                    v_exch_crncy_type,
                    v_exch_no,
                    v_stock_acco_no,
                    v_stock_acco,
                    v_stock_code_no,
                    v_stock_code,
                    v_target_code_no,
                    v_trade_code_no,
                    v_stock_type,
                    v_asset_type,
                    v_comm_id,
                    v_external_no,
                    v_order_batch_no,
                    v_order_date,
                    v_report_no,
                    v_order_id,
                    v_order_dir,
                    v_order_price,
                    v_order_qty,
                    v_order_status,
                    v_order_frozen_amt,
                    v_order_frozen_qty,
                    v_impawn_ratio,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_wtdraw_batch_no,
                    v_wtdraw_remark,
                    v_order_oper_way,
                    v_busi_opor_no,
                    v_is_record_jour,
                    v_target_stock_code_no,
                    v_trade_acco,
                    v_error_code,
                    v_error_info,
                    v_frozen_amt,
                    v_wtdraw_status,
                    v_wtdraw_qty,
                    v_wtdraw_id);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.85.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销指令订单出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @订单序号串# = concat(@订单序号串#,@订单序号#,";"); */
                set v_order_id_str = concat(v_order_id_str,v_order_id,";");

                /* if @撤单序号# > 0 and @撤单状态# <> 《撤单状态-成功》 then */
                if v_wtdraw_id > 0 and v_wtdraw_status <> "3" then

                  /* set @撤单序号串# = concat(@撤单序号串#,@撤单序号#,";"); */
                  set v_wtdraw_id_str = concat(v_wtdraw_id_str,v_wtdraw_id,";");
               end if;
            else

                /* set @错误编码#="0"; */
                set v_error_code="0";

                /* set @错误信息#=' '; */
                set v_error_info=' ';
                ROLLBACK;
                leave loop_label;
            end if;

            /* [事务结束] */
            COMMIT;

            #处理汇总订单

            /* [事务开始] */
            START TRANSACTION;


                /* if @撤单数量# > 0 then */
                if v_wtdraw_qty > 0 then

                    /* set @废单数量# = 0; */
                    set v_waste_qty = 0;

                    /* 调用【原子_交易证券_交易_撤单处理汇总订单】*/
                    call db_tdsecu.pra_tdsetd_CancelDealSumOrder(
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
                        v_order_date,
                        v_order_batch_no,
                        v_wtdraw_qty,
                        v_waste_qty,
                        v_order_oper_way,
                        v_error_code,
                        v_error_info);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.3.85.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤单处理汇总订单出现错误！',v_mysql_message);
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

        end loop;

       /* set @指令序号串#=substring(@指令序号串#,LOCATE(@分隔符#,@指令序号串#)+1); */
       set v_comm_id_str=substring(v_comm_id_str,LOCATE(v_split_str,v_comm_id_str)+1);
      end while;
    end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_id = v_comm_id;
    SET p_order_id_str = v_order_id_str;
    SET p_wtdraw_id_str = v_wtdraw_id_str;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_暂停汇总和同批明细指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_PauseTotalAndBatchDetailComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_PauseTotalAndBatchDetailComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_comm_date int,
    IN p_co_no int,
    IN p_comm_batch_no int,
    IN p_comm_executor int,
    IN p_is_withdraw int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_id_str varchar(2048),
    OUT p_wtdraw_id_str varchar(2048)
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
    declare v_comm_date int;
    declare v_co_no int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_is_withdraw int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_id_str varchar(2048);
    declare v_wtdraw_id_str varchar(2048);
    declare v_row_id bigint;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_stock_code_no int;
    declare v_comm_time int;
    declare v_comm_opor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_await_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_status varchar(2);
    declare v_comm_sum_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_max_comm_comple_date int;
    declare v_max_comm_comple_time int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_appr_qty decimal(18,2);
    declare v_comm_sum_approve_status varchar(2);
    declare v_basket_id bigint;
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_update_times int;
    declare v_tmp_order_qty decimal(18,2);
    declare v_tmp_co_no int;
    declare v_comm_id_str varchar(2048);
    declare v_is_record_jour int;
    declare v_split_str varchar(4);
    declare v_comm_id bigint;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_status varchar(2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_impawn_ratio decimal(18,12);
    declare v_par_value decimal(16,9);
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_target_stock_code_no int;
    declare v_trade_acco varchar(32);
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_remark varchar(255);
    declare v_frozen_amt decimal(18,4);
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_id bigint;
    declare v_waste_qty decimal(18,2);

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
    SET v_comm_date = p_comm_date;
    SET v_co_no = p_co_no;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_executor = p_comm_executor;
    SET v_is_withdraw = p_is_withdraw;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_id_str = " ";
    SET v_wtdraw_id_str = " ";
    SET v_row_id = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_stock_code_no = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_opor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_await_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_status = "0";
    SET v_comm_sum_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_max_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_max_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_qty = 0;
    SET v_comm_sum_approve_status = "0";
    SET v_basket_id = 0;
    SET v_net_price_flag = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_comm_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_update_times = 1;
    SET v_tmp_order_qty = 0;
    SET v_tmp_co_no = 0;
    SET v_comm_id_str = " ";
    SET v_is_record_jour = 1;
    SET v_split_str = " ";
    SET v_comm_id = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_external_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_batch_no = 0;
    SET v_order_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_status = "0";
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_all_fee = 0;
    SET v_wtdraw_qty = 0;
    SET v_impawn_ratio = 0;
    SET v_par_value = 0;
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_target_stock_code_no = 0;
    SET v_trade_acco = " ";
    SET v_wtdraw_batch_no = 0;
    SET v_wtdraw_remark = " ";
    SET v_frozen_amt = 0;
    SET v_wtdraw_status = "0";
    SET v_wtdraw_id = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_指令_获取主推汇总指令信息】*/
        call db_tdsecu.pra_tdseap_GetPushSumCommInfo(
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
            v_row_id,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_crncy_type,
            v_stock_code_no,
            v_comm_time,
            v_comm_opor,
            v_comm_dir,
            v_comm_limit_price,
            v_comm_qty,
            v_comm_amt,
            v_order_qty,
            v_comm_cancel_qty,
            v_comm_await_cancel_qty,
            v_strike_amt,
            v_strike_qty,
            v_strike_status,
            v_comm_sum_status,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_comple_date,
            v_comm_comple_time,
            v_max_comm_comple_date,
            v_max_comm_comple_time,
            v_comm_appr_date,
            v_comm_appr_time,
            v_comm_appr_qty,
            v_comm_sum_approve_status,
            v_basket_id,
            v_net_price_flag,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_comm_oper_way,
            v_exter_comm_flag,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.86.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_获取主推汇总指令信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

    #订单数量>0 时,支持 部撤状态暂停

        /* set @临时_订单数量# =@指令数量#-@成交数量#-@指令撤销数量#; */
        set v_tmp_order_qty =v_comm_qty-v_strike_qty-v_comm_cancel_qty;

        /* set @临时_机构编号# =@机构编号#; */
        set v_tmp_co_no =v_co_no;
        #检查原汇总指令状态

        /* [检查报错返回][@指令汇总状态#=《指令汇总状态-暂停执行》][804][@指令日期#,@机构编号#,@指令批号#,@指令汇总状态#] */
        if v_comm_sum_status="7" then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.86.804";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,",","机构编号=",v_co_no,",","指令批号=",v_comm_batch_no,",","指令汇总状态=",v_comm_sum_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令日期=",v_comm_date,",","机构编号=",v_co_no,",","指令批号=",v_comm_batch_no,",","指令汇总状态=",v_comm_sum_status);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@指令汇总状态#=《指令汇总状态-待撤销》 or @指令汇总状态#=《指令汇总状态-全部撤销》 or @成交状态#=《成交状态-已成》 or (@指令汇总状态#=《指令汇总状态-部分撤销》 and @临时_订单数量#=0)  ][805][@指令日期#,@机构编号#,@指令批号#,@指令汇总状态#] */
        if v_comm_sum_status="4" or v_comm_sum_status="6" or v_strike_status="3" or (v_comm_sum_status="5" and v_tmp_order_qty=0)   then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.86.805";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,",","机构编号=",v_co_no,",","指令批号=",v_comm_batch_no,",","指令汇总状态=",v_comm_sum_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令日期=",v_comm_date,",","机构编号=",v_co_no,",","指令批号=",v_comm_batch_no,",","指令汇总状态=",v_comm_sum_status);
            end if;
            leave label_pro;
        end if;

         #if (@指令汇总状态#=《指令汇总状态-未执行》 or @指令汇总状态#=《指令汇总状态-部分执行》 or (@指令汇总状态#=《指令汇总状态-全部执行》 and @成交状态#<>《成交状态-已成》)or  (@指令汇总状态#=《指令汇总状态-部分撤销》 and @订单数量#>0))then
          #      set @指令汇总状态#=《指令汇总状态-暂停执行》;
          #      [原子_交易证券_指令_修改汇总指令状态]
       #  end if;
        #更新同批非终态指令状态 ，先记录不为暂停并可撤销 的指令明细，然后再全部暂停。Modify by wjp20181011

         /* 调用【原子_交易证券_指令_获取同批指令序号串】*/
         call db_tdsecu.pra_tdseap_GetBatchCommIdStr(
             v_opor_co_no,
             v_opor_no,
             v_oper_mac,
             v_oper_ip_addr,
             v_oper_info,
             v_oper_way,
             v_func_code,
             v_comm_batch_no,
             v_co_no,
             v_error_code,
             v_error_info,
             v_comm_id_str);
         if v_error_code = "1" then
             SET v_error_code = "tdsecuT.3.86.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_获取同批指令序号串出现错误！',v_mysql_message);
             end if;
             ROLLBACK;
             leave label_pro;
         elseif v_error_code <> "0" then
             ROLLBACK;
             leave label_pro;
         end if;

        #[原子_交易证券_指令_暂停同批明细指令]
    #暂停指令的同时，撤掉其挂单

    /* set @订单序号串# = ""; */
    set v_order_id_str = "";

    /* set @撤单序号串# = ""; */
    set v_wtdraw_id_str = "";

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @分隔符#=";"; */
    set v_split_str=";";

    /* if @是否撤单#=《是否撤单-是》 then */
    if v_is_withdraw=1 then
    #暂停的指令明细 不进行撤单

      /* while LOCATE(@分隔符#,@指令序号串#)<>0   do */
      while LOCATE(v_split_str,v_comm_id_str)<>0   do
        #采用循环更新获取订单的方式，避免加锁时间长和并发问题

        /* set @指令序号#=cast(substring(@指令序号串#,1,LOCATE(@分隔符#,@指令序号串#)-1) as SIGNED); */
        set v_comm_id=cast(substring(v_comm_id_str,1,LOCATE(v_split_str,v_comm_id_str)-1) as SIGNED);

        /* set @记录序号# = 0; */
        set v_row_id = 0;
        loop_label:loop

            /* [事务开始] */
            START TRANSACTION;


            /* 调用【原子_交易证券_交易_锁定获取指令订单】*/
            call db_tdsecu.pra_tdsetd_LockGetCommOrder(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_comm_id,
                v_row_id,
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
                v_target_code_no,
                v_trade_code_no,
                v_stock_type,
                v_asset_type,
                v_comm_opor,
                v_external_no,
                v_report_date,
                v_report_time,
                v_report_no,
                v_order_batch_no,
                v_order_id,
                v_order_date,
                v_order_time,
                v_order_dir,
                v_price_type,
                v_order_price,
                v_order_qty,
                v_order_status,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_all_fee,
                v_wtdraw_qty,
                v_strike_amt,
                v_strike_qty,
                v_impawn_ratio,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_order_oper_way,
                v_busi_opor_no,
                v_target_stock_code_no,
                v_trade_acco);

            /* if @错误编码#="0" then */
            if v_error_code="0" then

                /* set @记录序号# = @订单序号#; */
                set v_row_id = v_order_id;

                /* set @撤单批号# = 0; */
                set v_wtdraw_batch_no = 0;

                /* set @撤单说明# = "指令暂停同时撤销指令订单！"; */
                set v_wtdraw_remark = "指令暂停同时撤销指令订单！";

                /* 调用【原子_交易证券_指令_撤销指令订单】*/
                call db_tdsecu.pra_tdseap_CancelCommOrder(
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
                    v_out_acco,
                    v_exch_crncy_type,
                    v_exch_no,
                    v_stock_acco_no,
                    v_stock_acco,
                    v_stock_code_no,
                    v_stock_code,
                    v_target_code_no,
                    v_trade_code_no,
                    v_stock_type,
                    v_asset_type,
                    v_comm_id,
                    v_external_no,
                    v_order_batch_no,
                    v_order_date,
                    v_report_no,
                    v_order_id,
                    v_order_dir,
                    v_order_price,
                    v_order_qty,
                    v_order_status,
                    v_order_frozen_amt,
                    v_order_frozen_qty,
                    v_impawn_ratio,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_wtdraw_batch_no,
                    v_wtdraw_remark,
                    v_order_oper_way,
                    v_busi_opor_no,
                    v_is_record_jour,
                    v_target_stock_code_no,
                    v_trade_acco,
                    v_error_code,
                    v_error_info,
                    v_frozen_amt,
                    v_wtdraw_status,
                    v_wtdraw_qty,
                    v_wtdraw_id);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.86.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销指令订单出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @订单序号串# = concat(@订单序号串#,@订单序号#,";"); */
                set v_order_id_str = concat(v_order_id_str,v_order_id,";");

                /* if @撤单序号# > 0 and @撤单状态# <> 《撤单状态-成功》 then */
                if v_wtdraw_id > 0 and v_wtdraw_status <> "3" then

                  /* set @撤单序号串# = concat(@撤单序号串#,@撤单序号#,";"); */
                  set v_wtdraw_id_str = concat(v_wtdraw_id_str,v_wtdraw_id,";");
               end if;
            else

                /* set @错误编码#="0"; */
                set v_error_code="0";

                /* set @错误信息#=' '; */
                set v_error_info=' ';
                ROLLBACK;
                leave loop_label;
            end if;

            /* [事务结束] */
            COMMIT;

            #处理汇总订单

            /* [事务开始] */
            START TRANSACTION;


                /* if @撤单数量# > 0 then */
                if v_wtdraw_qty > 0 then

                    /* set @废单数量# = 0; */
                    set v_waste_qty = 0;

                    /* 调用【原子_交易证券_交易_撤单处理汇总订单】*/
                    call db_tdsecu.pra_tdsetd_CancelDealSumOrder(
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
                        v_order_date,
                        v_order_batch_no,
                        v_wtdraw_qty,
                        v_waste_qty,
                        v_order_oper_way,
                        v_error_code,
                        v_error_info);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.3.86.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤单处理汇总订单出现错误！',v_mysql_message);
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

        end loop;

       /* set @指令序号串#=substring(@指令序号串#,LOCATE(@分隔符#,@指令序号串#)+1); */
       set v_comm_id_str=substring(v_comm_id_str,LOCATE(v_split_str,v_comm_id_str)+1);
      end while;
    end if;

        /* set @机构编号# =@临时_机构编号#; */
        set v_co_no =v_tmp_co_no;
        #更新同批非终态指令状态 ，先撤掉不为暂停的明细，然后再全部暂停。Modify by wjp20181011

         /* [事务开始] */
         START TRANSACTION;


        /* 调用【原子_交易证券_指令_暂停同批明细指令】*/
        call db_tdsecu.pra_tdseap_PauseBatchDetailComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_comm_batch_no,
            v_co_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.86.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_暂停同批明细指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


         /* if (@指令汇总状态#=《指令汇总状态-未执行》 or @指令汇总状态#=《指令汇总状态-部分执行》 or (@指令汇总状态#=《指令汇总状态-全部执行》 and @成交状态#<>《成交状态-已成》)or  (@指令汇总状态#=《指令汇总状态-部分撤销》 and @临时_订单数量#>0))then */
         if (v_comm_sum_status="1" or v_comm_sum_status="2" or (v_comm_sum_status="3" and v_strike_status<>"3")or  (v_comm_sum_status="5" and v_tmp_order_qty>0))then

                /* set @指令汇总状态#=《指令汇总状态-暂停执行》; */
                set v_comm_sum_status="7";

                /* 调用【原子_交易证券_指令_修改汇总指令状态】*/
                call db_tdsecu.pra_tdseap_ModiTotalComm(
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
                    v_comm_sum_status,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.86.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_修改汇总指令状态出现错误！',v_mysql_message);
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


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_id_str = v_order_id_str;
    SET p_wtdraw_id_str = v_wtdraw_id_str;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_获取同批指令信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_GetBatchCommInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_GetBatchCommInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_batch_no int,
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
    declare v_comm_batch_no int;
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
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_指令_获取同批指令信息】*/
    call db_tdsecu.pra_tdseap_GetBatchCommInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_batch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.87.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_获取同批指令信息出现错误！',v_mysql_message);
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

# 事务_交易证券_指令_启动明细指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_StartDetailComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_StartDetailComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_id_str varchar(2048),
    IN p_comm_batch_no int,
    IN p_comm_date int,
    IN p_comm_executor int,
    IN p_co_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_comm_id_str varchar(2048);
    declare v_comm_batch_no int;
    declare v_comm_date int;
    declare v_comm_executor int;
    declare v_co_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_id bigint;
    declare v_record_count int;
    declare v_comm_status varchar(2);
    declare v_strike_status varchar(2);
    declare v_row_id bigint;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_stock_code_no int;
    declare v_comm_time int;
    declare v_comm_opor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_await_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_comm_sum_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_max_comm_comple_date int;
    declare v_max_comm_comple_time int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_appr_qty decimal(18,2);
    declare v_comm_sum_approve_status varchar(2);
    declare v_basket_id bigint;
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_update_times int;
    declare v_split_str varchar(4);

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
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_date = p_comm_date;
    SET v_comm_executor = p_comm_executor;
    SET v_co_no = p_co_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_id = 0;
    SET v_record_count = 0;
    SET v_comm_status = "0";
    SET v_strike_status = "0";
    SET v_row_id = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_stock_code_no = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_opor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_await_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_comm_sum_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_max_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_max_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_qty = 0;
    SET v_comm_sum_approve_status = "0";
    SET v_basket_id = 0;
    SET v_net_price_flag = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_comm_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_update_times = 1;
    SET v_split_str = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;

        #检查原指令状态

        /* set @记录个数# = 0 ; */
        set v_record_count = 0 ;

        /* [获取表记录数量][交易证券_指令_指令表][@记录个数#][@指令状态#=《指令状态-待撤销》 or @指令状态#=《指令状态-部分撤销》 or @指令状态#=《指令状态-全部撤销》 or @成交状态#=《成交状态-已成》 and instr(@指令序号串#, concat(";",{记录序号},";"))>0 and {指令批号} = @指令批号# and {机构编号}=@机构编号# for update] */
        select count(1) into v_record_count from db_tdsecu.tb_tdseap_command where v_comm_status="4" or v_comm_status="5" or v_comm_status="6" or v_strike_status="3" and instr(v_comm_id_str, concat(";",row_id,";"))>0 and comm_batch_no = v_comm_batch_no and co_no=v_co_no for update;


        /* [检查报错返回][@记录个数# <>0][805][@指令序号串#] */
        if v_record_count <>0 then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.88.805";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令序号串=",v_comm_id_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令序号串=",v_comm_id_str);
            end if;
            leave label_pro;
        end if;

    #明细指令恢复原状态

         /* update   ~交易证券_指令_指令表^  set {指令状态} = (case  when {订单数量}=0 then 《指令状态-未执行》 when {订单数量}<{指令数量} then 《指令状态-部分执行》 when {订单数量} = {指令数量} and {成交数量} <{指令数量} then 《指令状态-全部执行》 end) where {指令状态}=《指令状态-暂停执行》 and instr(@指令序号串#, concat(";",{记录序号},";"))>0 and {指令批号} = @指令批号# and {机构编号}=@机构编号#; */
         update   db_tdsecu.tb_tdseap_command  set comm_status = (case  when order_qty=0 then "1" when order_qty<comm_qty then "2" when order_qty = comm_qty and strike_qty <comm_qty then "3" end) where comm_status="7" and instr(v_comm_id_str, concat(";",row_id,";"))>0 and comm_batch_no = v_comm_batch_no and co_no=v_co_no;

        /* [获取表记录数量][交易证券_指令_指令表][@记录个数#][{指令批号}=@指令批号# and {机构编号}=@操作员机构编号# and  ({指令状态}=《指令状态-未执行》 or {指令状态}=《指令状态-部分执行》 or ({指令状态}=《指令状态-全部执行》 and {成交状态}=《成交状态-未成》) or ({指令状态}=《指令状态-全部执行》 and {成交状态}=《成交状态-部成》))] */
        select count(1) into v_record_count from db_tdsecu.tb_tdseap_command where comm_batch_no=v_comm_batch_no and co_no=v_opor_co_no and  (comm_status="1" or comm_status="2" or (comm_status="3" and strike_status="1") or (comm_status="3" and strike_status="2"));


        /* if @指令批号# > 0 and @记录个数# >0  then */
        if v_comm_batch_no > 0 and v_record_count >0  then

            /* 调用【原子_交易证券_指令_获取主推汇总指令信息】*/
            call db_tdsecu.pra_tdseap_GetPushSumCommInfo(
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
                v_row_id,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_pass_no,
                v_out_acco,
                v_exch_crncy_type,
                v_stock_code_no,
                v_comm_time,
                v_comm_opor,
                v_comm_dir,
                v_comm_limit_price,
                v_comm_qty,
                v_comm_amt,
                v_order_qty,
                v_comm_cancel_qty,
                v_comm_await_cancel_qty,
                v_strike_amt,
                v_strike_qty,
                v_strike_status,
                v_comm_sum_status,
                v_comm_begin_date,
                v_comm_end_date,
                v_comm_begin_time,
                v_comm_end_time,
                v_comm_comple_date,
                v_comm_comple_time,
                v_max_comm_comple_date,
                v_max_comm_comple_time,
                v_comm_appr_date,
                v_comm_appr_time,
                v_comm_appr_qty,
                v_comm_sum_approve_status,
                v_basket_id,
                v_net_price_flag,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_comm_oper_way,
                v_exter_comm_flag,
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.88.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_获取主推汇总指令信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


             /* if @指令汇总状态#=《指令汇总状态-暂停执行》 then */
             if v_comm_sum_status="7" then

                   /* 调用【原子_交易证券_公用_计算指令汇总状态】*/
                   call db_tdsecu.pra_tdsepb_CaclCommSumStatus(
                       v_opor_co_no,
                       v_opor_no,
                       v_oper_mac,
                       v_oper_ip_addr,
                       v_oper_info,
                       v_oper_way,
                       v_func_code,
                       v_comm_qty,
                       v_order_qty,
                       v_comm_cancel_qty,
                       v_comm_await_cancel_qty,
                       v_strike_qty,
                       v_error_code,
                       v_error_info,
                       v_comm_sum_status);
                   if v_error_code = "1" then
                       SET v_error_code = "tdsecuT.3.88.999";
                       if v_mysql_message <> "" then
                            SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令汇总状态出现错误！',v_mysql_message);
                       end if;
                       ROLLBACK;
                       leave label_pro;
                   elseif v_error_code <> "0" then
                       ROLLBACK;
                       leave label_pro;
                   end if;


                   /* 调用【原子_交易证券_指令_修改汇总指令状态】*/
                   call db_tdsecu.pra_tdseap_ModiTotalComm(
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
                       v_comm_sum_status,
                       v_error_code,
                       v_error_info);
                   if v_error_code = "1" then
                       SET v_error_code = "tdsecuT.3.88.999";
                       if v_mysql_message <> "" then
                            SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_修改汇总指令状态出现错误！',v_mysql_message);
                       end if;
                       ROLLBACK;
                       leave label_pro;
                   elseif v_error_code <> "0" then
                       ROLLBACK;
                       leave label_pro;
                   end if;

            end if;
    #明细指令无汇总的 返回指令序号供 主推

        /* elseif @指令批号#=0  then */
        elseif v_comm_batch_no=0  then

            /* set @指令序号#=cast(substring(@指令序号串#,1,LOCATE(@分隔符#,@指令序号串#)-1) as SIGNED); */
            set v_comm_id=cast(substring(v_comm_id_str,1,LOCATE(v_split_str,v_comm_id_str)-1) as SIGNED);
        end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_id = v_comm_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_启动汇总和同批明细指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_StartTotalAndBatchDetailComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_StartTotalAndBatchDetailComm(
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
    declare v_comm_date int;
    declare v_co_no int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_stock_code_no int;
    declare v_comm_time int;
    declare v_comm_opor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_await_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_status varchar(2);
    declare v_comm_sum_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_max_comm_comple_date int;
    declare v_max_comm_comple_time int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_appr_qty decimal(18,2);
    declare v_comm_sum_approve_status varchar(2);
    declare v_basket_id bigint;
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_update_times int;
    declare v_tmp_order_qty decimal(18,2);
    declare v_record_count int;
    declare v_comm_id_str varchar(2048);

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
    SET v_row_id = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_stock_code_no = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_opor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_await_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_status = "0";
    SET v_comm_sum_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_max_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_max_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_qty = 0;
    SET v_comm_sum_approve_status = "0";
    SET v_basket_id = 0;
    SET v_net_price_flag = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_comm_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_update_times = 1;
    SET v_tmp_order_qty = 0;
    SET v_record_count = 0;
    SET v_comm_id_str = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


          /* 调用【原子_交易证券_指令_获取主推汇总指令信息】*/
          call db_tdsecu.pra_tdseap_GetPushSumCommInfo(
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
              v_row_id,
              v_pd_no,
              v_exch_group_no,
              v_asset_acco_no,
              v_pass_no,
              v_out_acco,
              v_exch_crncy_type,
              v_stock_code_no,
              v_comm_time,
              v_comm_opor,
              v_comm_dir,
              v_comm_limit_price,
              v_comm_qty,
              v_comm_amt,
              v_order_qty,
              v_comm_cancel_qty,
              v_comm_await_cancel_qty,
              v_strike_amt,
              v_strike_qty,
              v_strike_status,
              v_comm_sum_status,
              v_comm_begin_date,
              v_comm_end_date,
              v_comm_begin_time,
              v_comm_end_time,
              v_comm_comple_date,
              v_comm_comple_time,
              v_max_comm_comple_date,
              v_max_comm_comple_time,
              v_comm_appr_date,
              v_comm_appr_time,
              v_comm_appr_qty,
              v_comm_sum_approve_status,
              v_basket_id,
              v_net_price_flag,
              v_bond_accr_intrst,
              v_bond_rate_type,
              v_comm_oper_way,
              v_exter_comm_flag,
              v_update_times);
          if v_error_code = "1" then
              SET v_error_code = "tdsecuT.3.89.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_获取主推汇总指令信息出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;

    #临时_订单数量=0 时,  部撤状态 为终态

           /* set @临时_订单数量# =@指令数量#-@成交数量#-@指令撤销数量#; */
           set v_tmp_order_qty =v_comm_qty-v_strike_qty-v_comm_cancel_qty;

           /* set @记录个数#=0; */
           set v_record_count=0;

           /* [检查报错返回][@指令汇总状态#=《指令汇总状态-待撤销》 or @指令汇总状态#=《指令汇总状态-全部撤销》 or @成交状态#=《成交状态-已成》or (@指令汇总状态#=《指令汇总状态-部分撤销》 and @临时_订单数量#=0) ][806][@指令日期#,@机构编号#,@指令批号#,@指令汇总状态#] */
           if v_comm_sum_status="4" or v_comm_sum_status="6" or v_strike_status="3"or (v_comm_sum_status="5" and v_tmp_order_qty=0)  then
               ROLLBACK;
               SET v_error_code = "tdsecuT.3.89.806";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,",","机构编号=",v_co_no,",","指令批号=",v_comm_batch_no,",","指令汇总状态=",v_comm_sum_status),"#",v_mysql_message);
               else
                   SET v_error_info = concat("指令日期=",v_comm_date,",","机构编号=",v_co_no,",","指令批号=",v_comm_batch_no,",","指令汇总状态=",v_comm_sum_status);
               end if;
               leave label_pro;
           end if;

           #[检查报错返回][@指令汇总状态#<>《指令汇总状态-暂停执行》][806][@指令日期#,@机构编号#,@指令批号#,@指令汇总状态#]

           /* [获取表记录数量][交易证券_指令_指令表][@记录个数#][{指令状态}=《指令状态-暂停执行》 and {指令批号} = @指令批号# and {机构编号}=@机构编号# for update] */
           select count(1) into v_record_count from db_tdsecu.tb_tdseap_command where comm_status="7" and comm_batch_no = v_comm_batch_no and co_no=v_co_no for update;


           /* [检查报错返回][@记录个数#= 0][806][concat(@指令序号串#,"不存在暂停的指令明细!")] */
           if v_record_count= 0 then
               ROLLBACK;
               SET v_error_code = "tdsecuT.3.89.806";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat(v_comm_id_str,"不存在暂停的指令明细!"),"#",v_mysql_message);
               else
                   SET v_error_info = concat(v_comm_id_str,"不存在暂停的指令明细!");
               end if;
               leave label_pro;
           end if;


            /* if @指令汇总状态#=《指令汇总状态-暂停执行》 then */
            if v_comm_sum_status="7" then

                   /* 调用【原子_交易证券_公用_计算指令汇总状态】*/
                   call db_tdsecu.pra_tdsepb_CaclCommSumStatus(
                       v_opor_co_no,
                       v_opor_no,
                       v_oper_mac,
                       v_oper_ip_addr,
                       v_oper_info,
                       v_oper_way,
                       v_func_code,
                       v_comm_qty,
                       v_order_qty,
                       v_comm_cancel_qty,
                       v_comm_await_cancel_qty,
                       v_strike_qty,
                       v_error_code,
                       v_error_info,
                       v_comm_sum_status);
                   if v_error_code = "1" then
                       SET v_error_code = "tdsecuT.3.89.999";
                       if v_mysql_message <> "" then
                            SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令汇总状态出现错误！',v_mysql_message);
                       end if;
                       ROLLBACK;
                       leave label_pro;
                   elseif v_error_code <> "0" then
                       ROLLBACK;
                       leave label_pro;
                   end if;


                   /* 调用【原子_交易证券_指令_修改汇总指令状态】*/
                   call db_tdsecu.pra_tdseap_ModiTotalComm(
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
                       v_comm_sum_status,
                       v_error_code,
                       v_error_info);
                   if v_error_code = "1" then
                       SET v_error_code = "tdsecuT.3.89.999";
                       if v_mysql_message <> "" then
                            SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_修改汇总指令状态出现错误！',v_mysql_message);
                       end if;
                       ROLLBACK;
                       leave label_pro;
                   elseif v_error_code <> "0" then
                       ROLLBACK;
                       leave label_pro;
                   end if;

            end if;

           /* 调用【原子_交易证券_指令_启动同批明细指令】*/
           call db_tdsecu.pra_tdseap_StartBatchDetailComm(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_comm_batch_no,
               v_co_no,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "tdsecuT.3.89.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_启动同批明细指令出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_指令_分发待审批指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_DispApprPendComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_DispApprPendComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_comm_id bigint,
    IN p_comm_executor int,
    IN p_disp_remark varchar(255),
    IN p_is_withdraw int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_comm_date int,
    OUT p_before_comm_executor int,
    OUT p_comm_dispense_appr_status varchar(2),
    OUT p_comm_dispense_appr_opor int,
    OUT p_comm_dispense_appr_date int,
    OUT p_comm_dispense_appr_time int,
    OUT p_comm_dispense_appr_remark varchar(255),
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
    declare v_exch_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_comm_id bigint;
    declare v_comm_executor int;
    declare v_disp_remark varchar(255);
    declare v_is_withdraw int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_comm_date int;
    declare v_before_comm_executor int;
    declare v_comm_dispense_appr_status varchar(2);
    declare v_comm_dispense_appr_opor int;
    declare v_comm_dispense_appr_date int;
    declare v_comm_dispense_appr_time int;
    declare v_comm_dispense_appr_remark varchar(255);
    declare v_update_times int;
    declare v_tmp_comm_executor int;
    declare v_is_record_jour int;
    declare v_exch_crncy_type varchar(3);
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_time int;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
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
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_strike_status varchar(2);
    declare v_comm_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_appr_status varchar(2);
    declare v_exter_comm_flag int;
    declare v_strategy_capt_qty decimal(18,2);
    declare v_strategy_order_qty decimal(18,2);
    declare v_comm_oper_way varchar(2);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_contra_no varchar(32);
    declare v_disp_status int;
    declare v_exist_debt_flag int;
    declare v_disp_flag int;

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
    SET v_exch_no = p_exch_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_comm_id = p_comm_id;
    SET v_comm_executor = p_comm_executor;
    SET v_disp_remark = p_disp_remark;
    SET v_is_withdraw = p_is_withdraw;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_before_comm_executor = 0;
    SET v_comm_dispense_appr_status = "0";
    SET v_comm_dispense_appr_opor = 0;
    SET v_comm_dispense_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_dispense_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_dispense_appr_remark = " ";
    SET v_update_times = 1;
    SET v_tmp_comm_executor = 0;
    SET v_is_record_jour = 1;
    SET v_exch_crncy_type = "CNY";
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
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
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_strike_status = "0";
    SET v_comm_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_status = " ";
    SET v_exter_comm_flag = 0;
    SET v_strategy_capt_qty = 0;
    SET v_strategy_order_qty = 0;
    SET v_comm_oper_way = " ";
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_contra_no = " ";
    SET v_disp_status = 0;
    SET v_exist_debt_flag = 0;
    SET v_disp_flag = 0;

    
    label_pro:BEGIN
    

    /* set @临时_指令执行人#=@指令执行人#; */
    set v_tmp_comm_executor=v_comm_executor;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_指令_锁定获取指令信息】*/
        call db_tdsecu.pra_tdseap_LockGetCommInfo(
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
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
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
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_strike_status,
            v_comm_status,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_comple_date,
            v_comm_comple_time,
            v_comm_appr_status,
            v_exter_comm_flag,
            v_strategy_capt_qty,
            v_strategy_order_qty,
            v_comm_oper_way,
            v_combo_code,
            v_combo_posi_id,
            v_target_stock_code,
            v_target_stock_code_no,
            v_contra_no,
            v_disp_status,
            v_exist_debt_flag);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.90.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_锁定获取指令信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* [检查报错返回][@临时_指令执行人#=@指令执行人#][721][@临时_指令执行人#, @指令执行人#] */
        if v_tmp_comm_executor=v_comm_executor then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.90.721";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("临时_指令执行人=",v_tmp_comm_executor,","," 指令执行人=", v_comm_executor),"#",v_mysql_message);
            else
                SET v_error_info = concat("临时_指令执行人=",v_tmp_comm_executor,","," 指令执行人=", v_comm_executor);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@指令状态#=《指令状态-全部撤销》][724][@指令状态#] */
        if v_comm_status="6" then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.90.724";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令状态=",v_comm_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令状态=",v_comm_status);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@成交状态#=《成交状态-已成》][725][@成交状态#] */
        if v_strike_status="3" then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.90.725";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("成交状态=",v_strike_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("成交状态=",v_strike_status);
            end if;
            leave label_pro;
        end if;


        /* set @前指令执行人#=@指令执行人#; */
        set v_before_comm_executor=v_comm_executor;

        /* set @指令执行人#=@临时_指令执行人#; */
        set v_comm_executor=v_tmp_comm_executor;

        /* set @分发方式# =《分发方式-手动分发》; */
        set v_disp_flag =2;

        /* 调用【原子_交易证券_指令_分发待审批指令】*/
        call db_tdsecu.pra_tdseap_DispApprPendComm(
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
            v_asset_type,
            v_comm_date,
            v_comm_id,
            v_comm_batch_no,
            v_comm_dir,
            v_comm_status,
            v_comm_opor,
            v_comm_executor,
            v_disp_flag,
            v_disp_remark,
            v_before_comm_executor,
            v_is_withdraw,
            v_exter_comm_flag,
            v_error_code,
            v_error_info,
            v_row_id,
            v_comm_dispense_appr_status,
            v_comm_dispense_appr_opor,
            v_comm_dispense_appr_date,
            v_comm_dispense_appr_time,
            v_comm_dispense_appr_remark,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.90.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_分发待审批指令出现错误！',v_mysql_message);
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
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_comm_date = v_comm_date;
    SET p_before_comm_executor = v_before_comm_executor;
    SET p_comm_dispense_appr_status = v_comm_dispense_appr_status;
    SET p_comm_dispense_appr_opor = v_comm_dispense_appr_opor;
    SET p_comm_dispense_appr_date = v_comm_dispense_appr_date;
    SET p_comm_dispense_appr_time = v_comm_dispense_appr_time;
    SET p_comm_dispense_appr_remark = v_comm_dispense_appr_remark;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_审批转发指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_ApprDispComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_ApprDispComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_row_id bigint,
    IN p_exch_no int,
    IN p_comm_id bigint,
    IN p_comm_date int,
    IN p_comm_dispense_appr_status varchar(2),
    IN p_comm_dispense_appr_remark varchar(255),
    IN p_comm_dispense_appr_opor int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_comm_executor int,
    OUT p_before_comm_executor int,
    OUT p_comm_dispense_appr_date int,
    OUT p_comm_dispense_appr_time int,
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
    declare v_row_id bigint;
    declare v_exch_no int;
    declare v_comm_id bigint;
    declare v_comm_date int;
    declare v_comm_dispense_appr_status varchar(2);
    declare v_comm_dispense_appr_remark varchar(255);
    declare v_comm_dispense_appr_opor int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_comm_executor int;
    declare v_before_comm_executor int;
    declare v_comm_dispense_appr_date int;
    declare v_comm_dispense_appr_time int;
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
    SET v_row_id = p_row_id;
    SET v_exch_no = p_exch_no;
    SET v_comm_id = p_comm_id;
    SET v_comm_date = p_comm_date;
    SET v_comm_dispense_appr_status = p_comm_dispense_appr_status;
    SET v_comm_dispense_appr_remark = p_comm_dispense_appr_remark;
    SET v_comm_dispense_appr_opor = p_comm_dispense_appr_opor;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_comm_executor = 0;
    SET v_before_comm_executor = 0;
    SET v_comm_dispense_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_dispense_appr_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #审批转发指令

    /* 调用【原子_交易证券_指令_审批转发指令】*/
    call db_tdsecu.pra_tdseap_ApprDispComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_row_id,
        v_exch_no,
        v_comm_id,
        v_comm_date,
        v_comm_dispense_appr_status,
        v_comm_dispense_appr_remark,
        v_comm_dispense_appr_opor,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_comm_executor,
        v_before_comm_executor,
        v_comm_dispense_appr_date,
        v_comm_dispense_appr_time,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.91.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_审批转发指令出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_comm_executor = v_comm_executor;
    SET p_before_comm_executor = v_before_comm_executor;
    SET p_comm_dispense_appr_date = v_comm_dispense_appr_date;
    SET p_comm_dispense_appr_time = v_comm_dispense_appr_time;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_查询转发审批指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_QueryDispApprComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_QueryDispApprComm(
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
    IN p_comm_id bigint,
    IN p_comm_disp_appr_remark_str varchar(64),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_comm_dir_str varchar(2048),
    IN p_comm_status_str varchar(64),
    IN p_strike_status_str varchar(64),
    IN p_comm_oper_way varchar(2),
    IN p_exter_comm_flag int,
    IN p_comm_comple_flag int,
    IN p_row_id bigint,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_comm_id bigint;
    declare v_comm_disp_appr_remark_str varchar(64);
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_comm_dir_str varchar(2048);
    declare v_comm_status_str varchar(64);
    declare v_strike_status_str varchar(64);
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_comm_comple_flag int;
    declare v_row_id bigint;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_appr_status_str varchar(2048);

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
    SET v_comm_id = p_comm_id;
    SET v_comm_disp_appr_remark_str = p_comm_disp_appr_remark_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_comm_status_str = p_comm_status_str;
    SET v_strike_status_str = p_strike_status_str;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_comm_comple_flag = p_comm_comple_flag;
    SET v_row_id = p_row_id;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_appr_status_str = " ";

    
    label_pro:BEGIN
    

    /* if @指令审批状态串# <> " " then */
    if v_comm_appr_status_str <> " " then

        /* set @指令审批状态串#=concat(";", @指令审批状态串#, ";"); */
        set v_comm_appr_status_str=concat(";", v_comm_appr_status_str, ";");
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* if @指令状态串# <> " " then */
    if v_comm_status_str <> " " then

        /* set @指令状态串#=concat(";", @指令状态串#, ";"); */
        set v_comm_status_str=concat(";", v_comm_status_str, ";");
    end if;

    /* if @成交状态串# <> " " then */
    if v_strike_status_str <> " " then

        /* set @成交状态串#=concat(";", @成交状态串#, ";"); */
        set v_strike_status_str=concat(";", v_strike_status_str, ";");
    end if;

    /* 调用【原子_交易证券_指令_查询转发审批指令】*/
    call db_tdsecu.pra_tdseap_QueryDispApprComm(
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
        v_comm_id,
        v_comm_disp_appr_remark_str,
        v_exch_no_str,
        v_stock_code_no,
        v_comm_dir_str,
        v_comm_status_str,
        v_strike_status_str,
        v_comm_oper_way,
        v_exter_comm_flag,
        v_comm_comple_flag,
        v_row_id,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.92.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_查询转发审批指令出现错误！',v_mysql_message);
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

# 事务_交易证券_指令_新增融资融券指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_AddFinaLoanComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_AddFinaLoanComm(
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
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_batch_no int,
    IN p_comm_dir int,
    IN p_comm_limit_price decimal(16,9),
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_qty decimal(18,2),
    IN p_comm_begin_date int,
    IN p_comm_end_date int,
    IN p_comm_begin_time int,
    IN p_comm_end_time int,
    IN p_comm_appr_oper int,
    IN p_all_fee decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_impawn_ratio decimal(18,12),
    IN p_intrst_days int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_basket_id bigint,
    IN p_comm_oper_way varchar(2),
    IN p_exter_comm_flag int,
    IN p_cost_calc_type int,
    IN p_compli_trig_id bigint,
    IN p_subscription_trade_mark int,
    IN p_purchase_trade_mark int,
    IN p_rede_trade_mark int,
    IN p_first_minimum_amt decimal(18,4),
    IN p_minimum_purchase_amt decimal(18,4),
    IN p_minimum_subscription_amt decimal(18,4),
    IN p_minimum_rede_share decimal(18,2),
    IN p_minimum_holding_share decimal(18,2),
    IN p_record_count int,
    IN p_target_stock_code varchar(6),
    IN p_target_stock_code_no int,
    IN p_comm_remark_info varchar(1024),
    IN p_last_login_ip varchar(32),
    IN p_last_login_mac varchar(32),
    IN p_last_login_date int,
    IN p_last_oper_info varchar(255),
    IN p_online_status int,
    IN p_sys_config_str varchar(64),
    IN p_fina_marg_ratio decimal(18,12),
    IN p_secu_loan_marg_ratio decimal(18,12),
    IN p_fina_limit_max decimal(18,4),
    IN p_loan_limit_max decimal(18,4),
    IN p_contra_no varchar(32),
    IN p_asset_acco_type int,
    IN p_exgp_loan_sell_amt decimal(18,4),
    IN p_asac_loan_sell_amt decimal(18,4),
    IN p_asac_converted_margin decimal(18,4),
    IN p_asac_fina_converted_pandl decimal(18,4),
    IN p_asac_loan_converted_pandl decimal(18,4),
    IN p_asac_fina_capt_margin decimal(18,4),
    IN p_asac_loan_capt_margin decimal(18,4),
    IN p_asac_keep_guarantee_ratio decimal(18,12),
    IN p_exgp_converted_margin decimal(18,4),
    IN p_exgp_fina_converted_pandl decimal(18,4),
    IN p_exgp_loan_converted_pandl decimal(18,4),
    IN p_exgp_fina_capt_margin decimal(18,4),
    IN p_exgp_loan_capt_margin decimal(18,4),
    IN p_exgp_keep_guarantee_ratio decimal(18,12),
    IN p_exgp_debt_loan_sell_strike_qty decimal(18,2),
    IN p_exgp_debt_fina_buy_strike_amt decimal(18,4),
    IN p_pre_comm_amt decimal(18,4),
    IN p_asac_cmmd_converted_margin decimal(18,4),
    IN p_asac_order_converted_margin decimal(18,4),
    IN p_asac_curr_converted_margin decimal(18,4),
    IN p_exgp_cmmd_converted_margin decimal(18,4),
    IN p_exgp_order_converted_margin decimal(18,4),
    IN p_exgp_curr_converted_margin decimal(18,4),
    IN p_exist_debt_flag int,
    IN p_exgp_fina_comm_capt_margin decimal(18,4),
    IN p_exgp_loan_comm_capt_margin decimal(18,4),
    IN p_exgp_fina_order_capt_margin decimal(18,4),
    IN p_exgp_loan_order_capt_margin decimal(18,4),
    IN p_asac_fina_comm_capt_margin decimal(18,4),
    IN p_asac_loan_comm_capt_margin decimal(18,4),
    IN p_asac_fina_order_capt_margin decimal(18,4),
    IN p_asac_loan_order_capt_margin decimal(18,4),
    IN p_asac_fina_interest decimal(18,4),
    IN p_asac_loan_interest decimal(18,4),
    IN p_exgp_fina_interest decimal(18,4),
    IN p_exgp_loan_interest decimal(18,4),
    IN p_co_busi_config_str varchar(64),
    IN p_online_opor_no_str varchar(2048),
    IN p_acco_concat_info varchar(4096),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_id bigint,
    OUT p_comm_date int,
    OUT p_comm_time int,
    OUT p_comm_status varchar(2),
    OUT p_comm_appr_status varchar(2),
    OUT p_comm_comple_date int,
    OUT p_comm_comple_time int,
    OUT p_comm_appr_date int,
    OUT p_comm_appr_time int,
    OUT p_comm_appr_remark varchar(255),
    OUT p_comm_comple_flag int,
    OUT p_comm_frozen_amt decimal(18,4),
    OUT p_comm_frozen_qty decimal(18,2),
    OUT p_strike_status varchar(2),
    OUT p_order_id bigint,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_batch_no int,
    OUT p_order_dir int,
    OUT p_order_qty decimal(18,2),
    OUT p_order_price decimal(16,9),
    OUT p_price_type int,
    OUT p_order_status varchar(2),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_order_oper_way varchar(2),
    OUT p_update_times int,
    OUT p_appr_allow_order_flag int,
    OUT p_debt_type int,
    OUT p_comm_amt decimal(18,4),
    OUT p_disp_opor int,
    OUT p_disp_status int,
    OUT p_auto_comm_executor int
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
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_batch_no int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_appr_oper int;
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_basket_id bigint;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_cost_calc_type int;
    declare v_compli_trig_id bigint;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_record_count int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_comm_remark_info varchar(1024);
    declare v_last_login_ip varchar(32);
    declare v_last_login_mac varchar(32);
    declare v_last_login_date int;
    declare v_last_oper_info varchar(255);
    declare v_online_status int;
    declare v_sys_config_str varchar(64);
    declare v_fina_marg_ratio decimal(18,12);
    declare v_secu_loan_marg_ratio decimal(18,12);
    declare v_fina_limit_max decimal(18,4);
    declare v_loan_limit_max decimal(18,4);
    declare v_contra_no varchar(32);
    declare v_asset_acco_type int;
    declare v_exgp_loan_sell_amt decimal(18,4);
    declare v_asac_loan_sell_amt decimal(18,4);
    declare v_asac_converted_margin decimal(18,4);
    declare v_asac_fina_converted_pandl decimal(18,4);
    declare v_asac_loan_converted_pandl decimal(18,4);
    declare v_asac_fina_capt_margin decimal(18,4);
    declare v_asac_loan_capt_margin decimal(18,4);
    declare v_asac_keep_guarantee_ratio decimal(18,12);
    declare v_exgp_converted_margin decimal(18,4);
    declare v_exgp_fina_converted_pandl decimal(18,4);
    declare v_exgp_loan_converted_pandl decimal(18,4);
    declare v_exgp_fina_capt_margin decimal(18,4);
    declare v_exgp_loan_capt_margin decimal(18,4);
    declare v_exgp_keep_guarantee_ratio decimal(18,12);
    declare v_exgp_debt_loan_sell_strike_qty decimal(18,2);
    declare v_exgp_debt_fina_buy_strike_amt decimal(18,4);
    declare v_pre_comm_amt decimal(18,4);
    declare v_asac_cmmd_converted_margin decimal(18,4);
    declare v_asac_order_converted_margin decimal(18,4);
    declare v_asac_curr_converted_margin decimal(18,4);
    declare v_exgp_cmmd_converted_margin decimal(18,4);
    declare v_exgp_order_converted_margin decimal(18,4);
    declare v_exgp_curr_converted_margin decimal(18,4);
    declare v_exist_debt_flag int;
    declare v_exgp_fina_comm_capt_margin decimal(18,4);
    declare v_exgp_loan_comm_capt_margin decimal(18,4);
    declare v_exgp_fina_order_capt_margin decimal(18,4);
    declare v_exgp_loan_order_capt_margin decimal(18,4);
    declare v_asac_fina_comm_capt_margin decimal(18,4);
    declare v_asac_loan_comm_capt_margin decimal(18,4);
    declare v_asac_fina_order_capt_margin decimal(18,4);
    declare v_asac_loan_order_capt_margin decimal(18,4);
    declare v_asac_fina_interest decimal(18,4);
    declare v_asac_loan_interest decimal(18,4);
    declare v_exgp_fina_interest decimal(18,4);
    declare v_exgp_loan_interest decimal(18,4);
    declare v_co_busi_config_str varchar(64);
    declare v_online_opor_no_str varchar(2048);
    declare v_acco_concat_info varchar(4096);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_id bigint;
    declare v_comm_date int;
    declare v_comm_time int;
    declare v_comm_status varchar(2);
    declare v_comm_appr_status varchar(2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_appr_remark varchar(255);
    declare v_comm_comple_flag int;
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_strike_status varchar(2);
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_price_type int;
    declare v_order_status varchar(2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_order_oper_way varchar(2);
    declare v_update_times int;
    declare v_appr_allow_order_flag int;
    declare v_debt_type int;
    declare v_comm_amt decimal(18,4);
    declare v_disp_opor int;
    declare v_disp_status int;
    declare v_auto_comm_executor int;
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_invest_type int;
    declare v_calc_dir int;
    declare v_tmp_comm_frozen_amt decimal(18,4);
    declare v_tmp_comm_frozen_qty decimal(18,2);
    declare v_debt_qty decimal(18,2);
    declare v_deal_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_comm_appr_set int;
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_combo_code varchar(32);
    declare v_workflow_type int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_tmp_comm_occur_amt decimal(18,4);
    declare v_tmp_comm_occur_qty decimal(18,2);
    declare v_comm_appr_oper_no int;
    declare v_comm_cancel_qty decimal(18,2);
    declare v_tmp_oper_ip_addr varchar(32);
    declare v_tmp_oper_mac varchar(32);
    declare v_tmp_oper_info varchar(1024);
    declare v_tmp_opor_no int;
    declare v_curr_opor_no int;
    declare v_before_comm_executor int;
    declare v_mach_time int;
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_amt decimal(18,4);
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_pass_status varchar(2);
    declare v_combo_posi_id bigint;
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_waste_qty decimal(18,2);
    declare v_busi_opor_no int;
    declare v_avail_cal_flag int;
    declare v_open_posi_date int;

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
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_dir = p_comm_dir;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_qty = p_comm_qty;
    SET v_comm_begin_date = p_comm_begin_date;
    SET v_comm_end_date = p_comm_end_date;
    SET v_comm_begin_time = p_comm_begin_time;
    SET v_comm_end_time = p_comm_end_time;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_all_fee = p_all_fee;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_intrst_days = p_intrst_days;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_basket_id = p_basket_id;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_subscription_trade_mark = p_subscription_trade_mark;
    SET v_purchase_trade_mark = p_purchase_trade_mark;
    SET v_rede_trade_mark = p_rede_trade_mark;
    SET v_first_minimum_amt = p_first_minimum_amt;
    SET v_minimum_purchase_amt = p_minimum_purchase_amt;
    SET v_minimum_subscription_amt = p_minimum_subscription_amt;
    SET v_minimum_rede_share = p_minimum_rede_share;
    SET v_minimum_holding_share = p_minimum_holding_share;
    SET v_record_count = p_record_count;
    SET v_target_stock_code = p_target_stock_code;
    SET v_target_stock_code_no = p_target_stock_code_no;
    SET v_comm_remark_info = p_comm_remark_info;
    SET v_last_login_ip = p_last_login_ip;
    SET v_last_login_mac = p_last_login_mac;
    SET v_last_login_date = p_last_login_date;
    SET v_last_oper_info = p_last_oper_info;
    SET v_online_status = p_online_status;
    SET v_sys_config_str = p_sys_config_str;
    SET v_fina_marg_ratio = p_fina_marg_ratio;
    SET v_secu_loan_marg_ratio = p_secu_loan_marg_ratio;
    SET v_fina_limit_max = p_fina_limit_max;
    SET v_loan_limit_max = p_loan_limit_max;
    SET v_contra_no = p_contra_no;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_exgp_loan_sell_amt = p_exgp_loan_sell_amt;
    SET v_asac_loan_sell_amt = p_asac_loan_sell_amt;
    SET v_asac_converted_margin = p_asac_converted_margin;
    SET v_asac_fina_converted_pandl = p_asac_fina_converted_pandl;
    SET v_asac_loan_converted_pandl = p_asac_loan_converted_pandl;
    SET v_asac_fina_capt_margin = p_asac_fina_capt_margin;
    SET v_asac_loan_capt_margin = p_asac_loan_capt_margin;
    SET v_asac_keep_guarantee_ratio = p_asac_keep_guarantee_ratio;
    SET v_exgp_converted_margin = p_exgp_converted_margin;
    SET v_exgp_fina_converted_pandl = p_exgp_fina_converted_pandl;
    SET v_exgp_loan_converted_pandl = p_exgp_loan_converted_pandl;
    SET v_exgp_fina_capt_margin = p_exgp_fina_capt_margin;
    SET v_exgp_loan_capt_margin = p_exgp_loan_capt_margin;
    SET v_exgp_keep_guarantee_ratio = p_exgp_keep_guarantee_ratio;
    SET v_exgp_debt_loan_sell_strike_qty = p_exgp_debt_loan_sell_strike_qty;
    SET v_exgp_debt_fina_buy_strike_amt = p_exgp_debt_fina_buy_strike_amt;
    SET v_pre_comm_amt = p_pre_comm_amt;
    SET v_asac_cmmd_converted_margin = p_asac_cmmd_converted_margin;
    SET v_asac_order_converted_margin = p_asac_order_converted_margin;
    SET v_asac_curr_converted_margin = p_asac_curr_converted_margin;
    SET v_exgp_cmmd_converted_margin = p_exgp_cmmd_converted_margin;
    SET v_exgp_order_converted_margin = p_exgp_order_converted_margin;
    SET v_exgp_curr_converted_margin = p_exgp_curr_converted_margin;
    SET v_exist_debt_flag = p_exist_debt_flag;
    SET v_exgp_fina_comm_capt_margin = p_exgp_fina_comm_capt_margin;
    SET v_exgp_loan_comm_capt_margin = p_exgp_loan_comm_capt_margin;
    SET v_exgp_fina_order_capt_margin = p_exgp_fina_order_capt_margin;
    SET v_exgp_loan_order_capt_margin = p_exgp_loan_order_capt_margin;
    SET v_asac_fina_comm_capt_margin = p_asac_fina_comm_capt_margin;
    SET v_asac_loan_comm_capt_margin = p_asac_loan_comm_capt_margin;
    SET v_asac_fina_order_capt_margin = p_asac_fina_order_capt_margin;
    SET v_asac_loan_order_capt_margin = p_asac_loan_order_capt_margin;
    SET v_asac_fina_interest = p_asac_fina_interest;
    SET v_asac_loan_interest = p_asac_loan_interest;
    SET v_exgp_fina_interest = p_exgp_fina_interest;
    SET v_exgp_loan_interest = p_exgp_loan_interest;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_online_opor_no_str = p_online_opor_no_str;
    SET v_acco_concat_info = p_acco_concat_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_id = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_status = "0";
    SET v_comm_appr_status = " ";
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_remark = " ";
    SET v_comm_comple_flag = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_strike_status = "0";
    SET v_order_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_batch_no = 0;
    SET v_order_dir = 0;
    SET v_order_qty = 0;
    SET v_order_price = 0;
    SET v_price_type = 0;
    SET v_order_status = "0";
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_order_oper_way = " ";
    SET v_update_times = 1;
    SET v_appr_allow_order_flag = 0;
    SET v_debt_type = 0;
    SET v_comm_amt = 0;
    SET v_disp_opor = 0;
    SET v_disp_status = 0;
    SET v_auto_comm_executor = 0;
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_invest_type = 0;
    SET v_calc_dir = 1;
    SET v_tmp_comm_frozen_amt = 0;
    SET v_tmp_comm_frozen_qty = 0;
    SET v_debt_qty = 0;
    SET v_deal_flag = 0;
    SET v_occur_amt = 0;
    SET v_occur_qty = 0;
    SET v_comm_appr_set = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_combo_code = " ";
    SET v_workflow_type = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_tmp_comm_occur_amt = 0;
    SET v_tmp_comm_occur_qty = 0;
    SET v_comm_appr_oper_no = 0;
    SET v_comm_cancel_qty = 0;
    SET v_tmp_oper_ip_addr = " ";
    SET v_tmp_oper_mac = " ";
    SET v_tmp_oper_info = " ";
    SET v_tmp_opor_no = 0;
    SET v_curr_opor_no = 0;
    SET v_before_comm_executor = 0;
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_external_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_amt = 0;
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;
    SET v_remark_info = " ";
    SET v_pass_status = "0";
    SET v_combo_posi_id = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_wtdraw_qty = 0;
    SET v_waste_qty = 0;
    SET v_busi_opor_no = 0;
    SET v_avail_cal_flag = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @指令日期# = @初始化日期#; */
    set v_comm_date = v_init_date;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;

    /* set @登记机构# = ""; */
    set v_registration_agency = "";

    /* set @交易账户# =""; */
    set v_trade_acco ="";

    /* set @投资类型#=《投资类型-二级市场交易性金融资产》 ; */
    set v_invest_type=1 ;

    /* set @分发操作员# = 0 ; */
    set v_disp_opor = 0 ;

    /* if @指令执行人#<>0 then */
    if v_comm_executor<>0 then

        /* set @分发状态# = 《分发状态-分发通过》; */
        set v_disp_status = 1;
    else

        /* set @分发状态# = 《分发状态-待分发》; */
        set v_disp_status = 3;
    end if;
    #指令金额后台自己计算，不采用前台传入

    /* if @指令方向# <> 《指令方向-直接还款》 then */
    if v_comm_dir <> 14 then

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
            SET v_error_code = "tdsecuT.3.93.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令金额出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    else

        /* set @指令金额# = @前指令金额#; */
        set v_comm_amt = v_pre_comm_amt;
    end if;
    #计算指令冻结金额

    /* set @计算方向# = 《计算方向-加上》; */
    set v_calc_dir = 1;

    /* 调用【原子_交易证券_公用_计算融资融券指令冻结金额和数量】*/
    call db_tdsecu.pra_tdsepb_GetFinaLoanCommFrozenAmtAndQty(
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
        v_calc_dir,
        v_comm_amt,
        v_error_code,
        v_error_info,
        v_comm_frozen_amt,
        v_comm_frozen_qty);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.93.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券指令冻结金额和数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @临时_指令冻结金额# = @指令冻结金额#; */
    set v_tmp_comm_frozen_amt = v_comm_frozen_amt;

    /* set @临时_指令冻结数量# = @指令冻结数量#; */
    set v_tmp_comm_frozen_qty = v_comm_frozen_qty;
    #交易证券子系统检查，检查指令可用资金、可用持仓等

    /* 调用【原子_交易证券_指令_校验融资融券新增指令】*/
    call db_tdsecu.pra_tdseap_CheckFinaLoanAddComm(
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
        v_asac_avail_amt,
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
        v_comm_dir,
        v_comm_qty,
        v_comm_frozen_amt,
        v_impawn_ratio,
        v_stock_type,
        v_fina_limit_max,
        v_loan_limit_max,
        v_fina_marg_ratio,
        v_secu_loan_marg_ratio,
        v_comm_amt,
        v_init_date,
        v_exgp_loan_sell_amt,
        v_asac_loan_sell_amt,
        v_asac_converted_margin,
        v_asac_fina_converted_pandl,
        v_asac_loan_converted_pandl,
        v_asac_fina_capt_margin,
        v_asac_loan_capt_margin,
        v_asac_keep_guarantee_ratio,
        v_exgp_converted_margin,
        v_exgp_fina_converted_pandl,
        v_exgp_loan_converted_pandl,
        v_exgp_fina_capt_margin,
        v_exgp_loan_capt_margin,
        v_exgp_keep_guarantee_ratio,
        v_exgp_debt_loan_sell_strike_qty,
        v_exgp_debt_fina_buy_strike_amt,
        v_asac_cmmd_converted_margin,
        v_asac_order_converted_margin,
        v_asac_curr_converted_margin,
        v_exgp_cmmd_converted_margin,
        v_exgp_order_converted_margin,
        v_exgp_curr_converted_margin,
        v_exgp_fina_comm_capt_margin,
        v_exgp_loan_comm_capt_margin,
        v_exgp_fina_order_capt_margin,
        v_exgp_loan_order_capt_margin,
        v_asac_fina_comm_capt_margin,
        v_asac_loan_comm_capt_margin,
        v_asac_fina_order_capt_margin,
        v_asac_loan_order_capt_margin,
        v_asac_fina_interest,
        v_asac_loan_interest,
        v_exgp_fina_interest,
        v_exgp_loan_interest,
        v_error_code,
        v_error_info,
        v_exist_debt_flag,
        v_debt_qty);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.93.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_校验融资融券新增指令出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @市场编号# = 《市场编号-沪港通证券交易所》 and substring(@资产账户业务控制配置串#,15,1) <> 《沪港通交易方式-体内》 then */
    if v_exch_no = 3 and substring(v_asac_busi_config_str,15,1) <> 1 then

        /* set @体外指令标志# = 《体外指令标志-体外》; */
        set v_exter_comm_flag = 2;

    /* elseif @市场编号# = 《市场编号-深港通证券交易所》 and substring(@资产账户业务控制配置串#,16,1) <> 《深港通交易方式-体内》 then */
    elseif v_exch_no = 4 and substring(v_asac_busi_config_str,16,1) <> 1 then

        /* set @体外指令标志# = 《体外指令标志-体外》; */
        set v_exter_comm_flag = 2;
    end if;
    #风控子系统检查，检查指令端风控等

    /* set @处理标志#=《处理标志-已处理》; */
    set v_deal_flag=1;

    /* set @指令下达人#=@操作员编号#; */
    set v_comm_opor=v_opor_no;

    /* set @变动金额#=(@指令实际限价# * @指令数量#); */
    set v_occur_amt=(v_limit_actual_price * v_comm_qty);

    /* set @变动数量#=@指令数量#; */
    set v_occur_qty=v_comm_qty;

    /* set @指令审批设置# = substring(@资产账户业务控制配置串#,5,1); */
    set v_comm_appr_set = substring(v_asac_busi_config_str,5,1);
     #PB系统自动审批获取审批操作员登录信息，审批操作员不在线状态下不能自动审批

    /* if @指令审批设置#=《指令审批设置-自动审批》 and substring(@系统控制配置串#,7,1) =《系统类型-PB系统》  then */
    if v_comm_appr_set=1 and substring(v_sys_config_str,7,1) =1  then

        /* if @在线状态# <>《在线状态-在线》 then */
        if v_online_status <>1 then

             /* set @指令审批设置# = 《指令审批设置-手工审批》; */
             set v_comm_appr_set = 2;
        end if;
    end if;
    #如果自动审批，需做相应检查处理，并获取指令批号

    /* set @订单方向# = @指令方向#; */
    set v_order_dir = v_comm_dir;

    /* if (substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-自动审批》 or  substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-不设置》 ) and substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》  then */
    if (substring(v_asac_busi_config_str,5,1)=1 or  substring(v_asac_busi_config_str,5,1)=3 ) and substring(v_asac_busi_config_str,6,1)=1  then
        #获取订单批号

        /* set @编号类型#=《编号类型-订单批号》; */
        set v_record_no_type=18;

        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_交易证券_公用_获取业务记录编号】*/
            call db_tdsecu.pra_tdsepb_GetCoBusiRecordNo(
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
                SET v_error_code = "tdsecuT.3.93.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


        /* [事务结束] */
        COMMIT;


        /* set @订单批号#=@当前编号#; */
        set v_order_batch_no=v_curr_no;
    end if;

    /* [事务开始] */
    START TRANSACTION;

        #新增指令记录

        /* set @指令审批状态#=《指令审批状态-未审批》; */
        set v_comm_appr_status="1";

        /* if substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-不设置》 then */
        if substring(v_asac_busi_config_str,5,1)=3 then

            /* set @指令审批状态#=《指令审批状态-不审批》; */
            set v_comm_appr_status="4";
        end if;

        /* set @组合代码# = " "; */
        set v_combo_code = " ";

        /* set  @工作流模式# = substring(@资产账户业务控制配置串#,25,1); */
        set  v_workflow_type = substring(v_asac_busi_config_str,25,1);

        /* 调用【原子_交易证券_指令_新增指令】*/
        call db_tdsecu.pra_tdseap_AddComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_comm_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_crncy_type,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_opor,
            v_comm_executor,
            v_comm_batch_no,
            v_comm_dir,
            v_comm_limit_price,
            v_limit_actual_price,
            v_comm_qty,
            v_comm_amt,
            v_comm_frozen_amt,
            v_comm_frozen_qty,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_appr_status,
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_basket_id,
            v_comm_oper_way,
            v_exter_comm_flag,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_combo_code,
            v_target_stock_code,
            v_target_stock_code_no,
            v_comm_remark_info,
            v_workflow_type,
            v_contra_no,
            v_asset_acco_type,
            v_exist_debt_flag,
            v_disp_opor,
            v_disp_status,
            v_acco_concat_info,
            v_error_code,
            v_error_info,
            v_comm_id,
            v_comm_status,
            v_strike_status,
            v_comm_comple_flag);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.93.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_新增指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #处理资金持仓数据，为保证数据表修改顺序，指令资金持仓更新需放在后边处理，以先处理指令表，再处理订单表，再处理资金持仓表
        #计算指令变动金额和数量

        /* set @计算方向# = 《计算方向-加上》; */
        set v_calc_dir = 1;

        /* 调用【原子_交易证券_公用_计算融资融券指令变动金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetFinaLoanCommOccurAmtAndQty(
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
            v_calc_dir,
            v_comm_amt,
            v_error_code,
            v_error_info,
            v_comm_occur_amt,
            v_comm_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.93.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券指令变动金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @临时_指令变动金额# = @指令变动金额#; */
        set v_tmp_comm_occur_amt = v_comm_occur_amt;

        /* set @临时_指令变动数量# = @指令变动数量#; */
        set v_tmp_comm_occur_qty = v_comm_occur_qty;

        /* if substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-自动审批》 or @指令审批状态#=《指令审批状态-不审批》 then */
        if substring(v_asac_busi_config_str,5,1)=1 or v_comm_appr_status="4" then

            /* if substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-自动审批》 then */
            if substring(v_asac_busi_config_str,5,1)=1 then
                #审批指令

                /* set @指令审批状态#=《指令审批状态-审批通过》; */
                set v_comm_appr_status="2";

                /* set @指令审批说明#="指令快速审批通过！"; */
                set v_comm_appr_remark="指令快速审批通过！";

                /* set @指令审批操作员序号#=1; */
                set v_comm_appr_oper_no=1;
            end if;

             /* set @订单数量#=0; */
             set v_order_qty=0;

             /* set @指令撤销数量#=0; */
             set v_comm_cancel_qty=0;

              /* set @临时_操作IP# = @操作IP#; */
              set v_tmp_oper_ip_addr = v_oper_ip_addr;

              /* set @临时_操作MAC# = @操作MAC#; */
              set v_tmp_oper_mac = v_oper_mac;

              /* set @临时_操作信息# = @操作信息#; */
              set v_tmp_oper_info = v_oper_info;

              /* set @临时_操作员编号# = @操作员编号#; */
              set v_tmp_opor_no = v_opor_no;

              /* set @操作IP# = @上次登录IP#; */
              set v_oper_ip_addr = v_last_login_ip;

              /* set @操作MAC# = @上次登录MAC#; */
              set v_oper_mac = v_last_login_mac;

              /* set @操作信息# = @上次操作信息#; */
              set v_oper_info = v_last_oper_info;

              /* set @操作员编号# = @指令审批操作员#; */
              set v_opor_no = v_comm_appr_oper;

              /* set @当前操作员# = @临时_操作员编号#; */
              set v_curr_opor_no = v_tmp_opor_no;

              /* set @前指令执行人# = 0; */
              set v_before_comm_executor = 0;

             /* 调用【原子_交易证券_指令_审批指令】*/
             call db_tdsecu.pra_tdseap_ApprComm(
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
                 v_stock_code,
                 v_stock_code_no,
                 v_stock_type,
                 v_asset_type,
                 v_comm_date,
                 v_comm_id,
                 v_comm_opor,
                 v_comm_executor,
                 v_comm_batch_no,
                 v_comm_appr_oper_no,
                 v_comm_appr_oper,
                 v_comm_appr_status,
                 v_comm_appr_remark,
                 v_comm_qty,
                 v_comm_dir,
                 v_comm_limit_price,
                 v_limit_actual_price,
                 v_order_qty,
                 v_comm_cancel_qty,
                 v_bond_accr_intrst,
                 v_bond_rate_type,
                 v_net_price_flag,
                 v_par_value,
                 v_comm_status,
                 v_comm_begin_date,
                 v_comm_end_date,
                 v_comm_begin_time,
                 v_comm_end_time,
                 v_exter_comm_flag,
                 v_comm_oper_way,
                 v_comm_amt,
                 v_co_busi_config_str,
                 v_online_opor_no_str,
                 v_curr_opor_no,
                 v_buy_ref_rate,
                 v_sell_ref_rate,
                 v_before_comm_executor,
                 v_error_code,
                 v_error_info,
                 v_comm_occur_amt,
                 v_comm_occur_qty,
                 v_comm_appr_date,
                 v_comm_appr_time,
                 v_disp_status,
                 v_disp_opor,
                 v_auto_comm_executor);
             if v_error_code = "1" then
                 SET v_error_code = "tdsecuT.3.93.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_审批指令出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 leave label_pro;
             end if;


             /* set @临时_指令变动金额# = @临时_指令变动金额# + @指令变动金额#; */
             set v_tmp_comm_occur_amt = v_tmp_comm_occur_amt + v_comm_occur_amt;

             /* set @临时_指令变动数量# = @临时_指令变动数量# + @指令变动数量#; */
             set v_tmp_comm_occur_qty = v_tmp_comm_occur_qty + v_comm_occur_qty;

             /* if @自动分发指令执行人# >0 and @指令执行人# = 0 then */
             if v_auto_comm_executor >0 and v_comm_executor = 0 then

                 /* set @指令执行人# = @自动分发指令执行人#; */
                 set v_comm_executor = v_auto_comm_executor;
             end if;

            /* [获取机器时间][@机器时间#] */
            select date_format(curtime(),'%H%i%s') into v_mach_time;


            /* if substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 and ((@指令结束日期# = @初始化日期# and @指令结束时间# >= @机器时间#) or (@指令结束日期# < @初始化日期#)) and @指令执行人# > 0 then */
            if substring(v_asac_busi_config_str,6,1)=1 and ((v_comm_end_date = v_init_date and v_comm_end_time >= v_mach_time) or (v_comm_end_date < v_init_date)) and v_comm_executor > 0 then
                #设置订单相关字段值

                /* set @外部编号#=0; */
                set v_external_no=0;

                /* set @申报日期# = 0; */
                set v_report_date = 0;

                /* set @申报时间# = 0; */
                set v_report_time = 0;

                /* set @申报编号# = " "; */
                set v_report_no = " ";

                /* set @订单日期#=@初始化日期#; */
                set v_order_date=v_init_date;

                /* set @价格类型#=《价格类型-限价》; */
                set v_price_type=1;

                /* set @订单方向#=@指令方向#; */
                set v_order_dir=v_comm_dir;

                /* set @订单数量#=@指令数量#; */
                set v_order_qty=v_comm_qty;

                /* set @订单价格#=@指令实际限价#; */
                set v_order_price=v_limit_actual_price;

                /* set @审批通过自动下单# = 《审批通过自动下单-是》; */
                set v_appr_allow_order_flag = 1;
                #先反向更新指令

                /* set @计算方向# = 《计算方向-减去》; */
                set v_calc_dir = -1;

                /* 调用【原子_交易证券_公用_计算融资融券指令冻结金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetFinaLoanCommFrozenAmtAndQty(
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
                    v_calc_dir,
                    v_comm_amt,
                    v_error_code,
                    v_error_info,
                    v_comm_frozen_amt,
                    v_comm_frozen_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.93.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券指令冻结金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @临时_指令冻结金额# = @临时_指令冻结金额# + @指令冻结金额#; */
                set v_tmp_comm_frozen_amt = v_tmp_comm_frozen_amt + v_comm_frozen_amt;

                /* set @临时_指令冻结数量# = @临时_指令冻结数量# + @指令冻结数量#; */
                set v_tmp_comm_frozen_qty = v_tmp_comm_frozen_qty + v_comm_frozen_qty;

                /* 调用【原子_交易证券_指令_下单更新指令】*/
                call db_tdsecu.pra_tdseap_OrderUpdateComm(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_comm_id,
                    v_comm_frozen_amt,
                    v_comm_frozen_qty,
                    v_order_qty,
                    v_error_code,
                    v_error_info,
                    v_limit_actual_price,
                    v_exter_comm_flag,
                    v_comm_comple_date,
                    v_comm_comple_time,
                    v_comm_status,
                    v_strike_status);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.93.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_下单更新指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #计算交易冻结金额

                /* set @订单金额# = @指令金额#; */
                set v_order_amt = v_comm_amt;

                /* 调用【原子_交易证券_公用_计算融资融券交易冻结金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetFinaLoanExchFrozenAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_order_dir,
                    v_order_price,
                    v_order_qty,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_all_fee,
                    v_order_amt,
                    v_error_code,
                    v_error_info,
                    v_trade_frozen_amt,
                    v_trade_frozen_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.93.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券交易冻结金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @订单冻结金额#=@交易冻结金额#; */
                set v_order_frozen_amt=v_trade_frozen_amt;

                /* set @订单冻结数量#=@交易冻结数量#; */
                set v_order_frozen_qty=v_trade_frozen_qty;

                /* set @备注信息#="指令自动审批后自动执行！"; */
                set v_remark_info="指令自动审批后自动执行！";
                #根据报盘机状态，设置订单状态 如果通道是允许报送状态,则直接将订单状态设为"待报"

                /* set @订单状态# = 《订单状态-未报》; */
                set v_order_status = "1";

                /* 调用【原子_交易证券_公用_获取通道状态】*/
                call db_tdsecu.pra_tdsepb_GetChannelStatus(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_pass_no,
                    v_error_code,
                    v_error_info,
                    v_pass_status);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.93.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取通道状态出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* if @通道状态# = "1" then */
                if v_pass_status = "1" then

                    /* set @订单状态# = 《订单状态-待报》; */
                    set v_order_status = "a";
                end if;

                /* set @订单操作方式# = 《订单操作方式-审批后自动下单》; */
                set v_order_oper_way = "40";

                /* set @组合代码# = " "; */
                set v_combo_code = " ";

                /* set @组合持仓序号# = 0; */
                set v_combo_posi_id = 0;

                /* 调用【原子_交易证券_交易_新增订单】*/
                call db_tdsecu.pra_tdsetd_AddOrder(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_init_date,
                    v_co_no,
                    v_comm_opor,
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
                    v_target_code_no,
                    v_trade_code_no,
                    v_stock_type,
                    v_asset_type,
                    v_external_no,
                    v_comm_id,
                    v_comm_batch_no,
                    v_order_batch_no,
                    v_order_date,
                    v_order_dir,
                    v_price_type,
                    v_order_price,
                    v_order_qty,
                    v_order_status,
                    v_report_date,
                    v_report_time,
                    v_report_no,
                    v_order_frozen_amt,
                    v_order_frozen_qty,
                    v_net_price_flag,
                    v_intrst_days,
                    v_par_value,
                    v_impawn_ratio,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_compli_trig_id,
                    v_remark_info,
                    v_order_oper_way,
                    v_exter_comm_flag,
                    v_cost_calc_type,
                    v_combo_code,
                    v_combo_posi_id,
                    v_target_stock_code,
                    v_target_stock_code_no,
                    v_registration_agency,
                    v_trade_acco,
                    v_contra_no,
                    v_asset_acco_type,
                    v_exist_debt_flag,
                    v_error_code,
                    v_error_info,
                    v_order_id,
                    v_order_time,
                    v_update_times);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.93.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增订单出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #计算指令变动金额和数量

                /* set @计算方向# = 《计算方向-减去》; */
                set v_calc_dir = -1;

                /* 调用【原子_交易证券_公用_计算融资融券指令变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetFinaLoanCommOccurAmtAndQty(
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
                    v_calc_dir,
                    v_comm_amt,
                    v_error_code,
                    v_error_info,
                    v_comm_occur_amt,
                    v_comm_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.93.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券指令变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @临时_指令变动金额# = @临时_指令变动金额# + @指令变动金额#; */
                set v_tmp_comm_occur_amt = v_tmp_comm_occur_amt + v_comm_occur_amt;

                /* set @临时_指令变动数量# = @临时_指令变动数量# + @指令变动数量#; */
                set v_tmp_comm_occur_qty = v_tmp_comm_occur_qty + v_comm_occur_qty;
                #计算下单交易变动金额和数量

                /* 调用【原子_交易证券_公用_计算融资融券交易变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetFinaLoanTradeOccurAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_order_dir,
                    v_order_qty,
                    v_order_price,
                    v_order_frozen_amt,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_error_code,
                    v_error_info,
                    v_trade_occur_amt,
                    v_trade_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.93.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券交易变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #modify by wjp 20181101

                /* if @订单批号# > 0  then */
                if v_order_batch_no > 0  then

                    /* set @撤单数量# = 0; */
                    set v_wtdraw_qty = 0;

                    /* set @废单数量# = 0; */
                    set v_waste_qty = 0;

                   /* 调用【原子_交易证券_交易_订单处理汇总订单】*/
                   call db_tdsecu.pra_tdsetd_OrderDealSumOrder(
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
                       v_exch_crncy_type,
                       v_exch_no,
                       v_stock_code_no,
                       v_stock_code,
                       v_trade_code_no,
                       v_target_code_no,
                       v_stock_type,
                       v_asset_type,
                       v_external_no,
                       v_order_date,
                       v_order_batch_no,
                       v_order_dir,
                       v_price_type,
                       v_order_price,
                       v_order_qty,
                       v_order_status,
                       v_wtdraw_qty,
                       v_waste_qty,
                       v_net_price_flag,
                       v_intrst_days,
                       v_par_value,
                       v_bond_accr_intrst,
                       v_bond_rate_type,
                       v_impawn_ratio,
                       v_order_oper_way,
                       v_exter_comm_flag,
                       v_error_code,
                       v_error_info);
                   if v_error_code = "1" then
                       SET v_error_code = "tdsecuT.3.93.999";
                       if v_mysql_message <> "" then
                            SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_订单处理汇总订单出现错误！',v_mysql_message);
                       end if;
                       ROLLBACK;
                       leave label_pro;
                   elseif v_error_code <> "0" then
                       ROLLBACK;
                       leave label_pro;
                   end if;

               end if;
            end if;
        end if;
        #处理订单资金持仓数据，保护指令变动和交易的变动

        /* set @指令变动金额# = @临时_指令变动金额#; */
        set v_comm_occur_amt = v_tmp_comm_occur_amt;

        /* set @指令变动数量# = @临时_指令变动数量#; */
        set v_comm_occur_qty = v_tmp_comm_occur_qty;

        /* set @业务操作员编号# = @指令执行人#; */
        set v_busi_opor_no = v_comm_executor;

        /* set @可用计算标志# = 0; */
        set v_avail_cal_flag = 0;

        /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
        call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
            v_exch_crncy_type,
            v_comm_id,
            v_order_id,
            v_exch_no,
            v_stock_code,
            v_stock_type,
            v_asset_type,
            v_order_dir,
            v_impawn_ratio,
            v_stock_acco_no,
            v_stock_code_no,
            v_trade_code_no,
            v_target_code_no,
            v_comm_occur_amt,
            v_comm_occur_qty,
            v_trade_occur_amt,
            v_trade_occur_qty,
            v_is_record_jour,
            v_order_oper_way,
            v_busi_opor_no,
            v_open_close_permission,
            v_avail_cal_flag,
            v_combo_code,
            v_combo_posi_id,
            v_target_stock_code_no,
            v_error_code,
            v_error_info,
            v_open_posi_date);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.93.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_交易证券_账户_更新融资融券指令交易资金持仓负债】*/
        call db_tdsecu.pra_tdseac_UpdateFinaLoanApprDebt(
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
            v_exch_crncy_type,
            v_comm_id,
            v_exch_no,
            v_stock_code,
            v_stock_type,
            v_asset_type,
            v_invest_type,
            v_order_dir,
            v_stock_acco_no,
            v_stock_code_no,
            v_trade_code_no,
            v_comm_occur_amt,
            v_comm_occur_qty,
            v_trade_occur_amt,
            v_trade_occur_qty,
            v_is_record_jour,
            v_debt_qty,
            v_error_code,
            v_error_info,
            v_debt_type);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.93.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新融资融券指令交易资金持仓负债出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @指令冻结金额# = @临时_指令冻结金额#; */
    set v_comm_frozen_amt = v_tmp_comm_frozen_amt;

    /* set @指令冻结数量# = @临时_指令冻结数量#; */
    set v_comm_frozen_qty = v_tmp_comm_frozen_qty;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_id = v_comm_id;
    SET p_comm_date = v_comm_date;
    SET p_comm_time = v_comm_time;
    SET p_comm_status = v_comm_status;
    SET p_comm_appr_status = v_comm_appr_status;
    SET p_comm_comple_date = v_comm_comple_date;
    SET p_comm_comple_time = v_comm_comple_time;
    SET p_comm_appr_date = v_comm_appr_date;
    SET p_comm_appr_time = v_comm_appr_time;
    SET p_comm_appr_remark = v_comm_appr_remark;
    SET p_comm_comple_flag = v_comm_comple_flag;
    SET p_comm_frozen_amt = v_comm_frozen_amt;
    SET p_comm_frozen_qty = v_comm_frozen_qty;
    SET p_strike_status = v_strike_status;
    SET p_order_id = v_order_id;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_dir = v_order_dir;
    SET p_order_qty = v_order_qty;
    SET p_order_price = v_order_price;
    SET p_price_type = v_price_type;
    SET p_order_status = v_order_status;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_order_oper_way = v_order_oper_way;
    SET p_update_times = v_update_times;
    SET p_appr_allow_order_flag = v_appr_allow_order_flag;
    SET p_debt_type = v_debt_type;
    SET p_comm_amt = v_comm_amt;
    SET p_disp_opor = v_disp_opor;
    SET p_disp_status = v_disp_status;
    SET p_auto_comm_executor = v_auto_comm_executor;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_融资融券撤销指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_FinaLoanCancelComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_FinaLoanCancelComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_comm_id bigint,
    IN p_cancel_info varchar(255),
    IN p_is_withdraw int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_comm_date int,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_order_id_str varchar(2048),
    OUT p_wtdraw_id_str varchar(2048),
    OUT p_target_code_no int,
    OUT p_trade_code_no int,
    OUT p_debt_type int
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
    declare v_comm_id bigint;
    declare v_cancel_info varchar(255);
    declare v_is_withdraw int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_order_id_str varchar(2048);
    declare v_wtdraw_id_str varchar(2048);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_debt_type int;
    declare v_is_record_jour int;
    declare v_invest_type int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_combo_code varchar(32);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_limit_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_limit_actual_price decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_comm_dir int;
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_amt decimal(18,4);
    declare v_tmp_target_code_no int;
    declare v_tmp_trade_code_no int;
    declare v_comm_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_order_dir int;
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_debt_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_comm_opor int;
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_target_stock_code_no int;
    declare v_trade_acco varchar(32);
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_remark varchar(255);
    declare v_frozen_amt decimal(18,4);
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_id bigint;
    declare v_waste_qty decimal(18,2);

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
    SET v_comm_id = p_comm_id;
    SET v_cancel_info = p_cancel_info;
    SET v_is_withdraw = p_is_withdraw;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_order_id_str = " ";
    SET v_wtdraw_id_str = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_debt_type = 0;
    SET v_is_record_jour = 1;
    SET v_invest_type = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_combo_code = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_limit_price = 0;
    SET v_comm_status = "0";
    SET v_limit_actual_price = 0;
    SET v_impawn_ratio = 0;
    SET v_comm_dir = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_frozen_amt = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_comm_amt = 0;
    SET v_tmp_target_code_no = 0;
    SET v_tmp_trade_code_no = 0;
    SET v_comm_qty = 0;
    SET v_calc_dir = 1;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_order_dir = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_debt_qty = 0;
    SET v_row_id = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_comm_opor = 0;
    SET v_external_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_batch_no = 0;
    SET v_order_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_status = "0";
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_all_fee = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_target_stock_code_no = 0;
    SET v_trade_acco = " ";
    SET v_wtdraw_batch_no = 0;
    SET v_wtdraw_remark = " ";
    SET v_frozen_amt = 0;
    SET v_wtdraw_status = "0";
    SET v_wtdraw_id = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    
    #获取指令信息，检查能否撤销

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @投资类型#=《投资类型-二级市场交易性金融资产》 ; */
    set v_invest_type=1 ;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_指令_撤销指令】*/
        call db_tdsecu.pra_tdseap_CancelComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_comm_id,
            v_cancel_info,
            v_error_code,
            v_error_info,
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
            v_target_code_no,
            v_trade_code_no,
            v_combo_code,
            v_stock_type,
            v_asset_type,
            v_comm_limit_price,
            v_comm_status,
            v_limit_actual_price,
            v_impawn_ratio,
            v_comm_dir,
            v_comm_cancel_qty,
            v_comm_frozen_amt,
            v_comm_date,
            v_comm_batch_no,
            v_comm_executor,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_comm_amt);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.94.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @临时_标的代码编号# = @标的代码编号#; */
        set v_tmp_target_code_no = v_target_code_no;

        /* set @临时_交易代码编号# = @交易代码编号#; */
        set v_tmp_trade_code_no = v_trade_code_no;

        /* if @指令撤销数量#>0 then */
        if v_comm_cancel_qty>0 then

            /* set @指令数量# = @指令撤销数量#; */
            set v_comm_qty = v_comm_cancel_qty;
            #计算指令变动金额和数量

            /* set @计算方向# = 《计算方向-减去》; */
            set v_calc_dir = -1;

            /* 调用【原子_交易证券_公用_计算融资融券指令变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetFinaLoanCommOccurAmtAndQty(
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
                v_calc_dir,
                v_comm_amt,
                v_error_code,
                v_error_info,
                v_comm_occur_amt,
                v_comm_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.94.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券指令变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* 调用【原子_交易证券_账户_更新指令资金持仓】*/
            call db_tdsecu.pra_tdseac_UpdateApprCashPosi(
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
                v_comm_id,
                v_comm_dir,
                v_exch_crncy_type,
                v_exch_no,
                v_stock_code,
                v_asset_type,
                v_stock_type,
                v_impawn_ratio,
                v_stock_acco_no,
                v_stock_code_no,
                v_trade_code_no,
                v_target_code_no,
                v_comm_occur_amt,
                v_comm_occur_qty,
                v_is_record_jour,
                v_combo_code,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.94.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令资金持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @订单方向# = @指令方向#; */
            set v_order_dir = v_comm_dir;

            /* set @交易变动金额# = 0; */
            set v_trade_occur_amt = 0;

            /* set @交易变动数量# = 0; */
            set v_trade_occur_qty = 0;

            /* set @负债数量# = 0; */
            set v_debt_qty = 0;

            /* 调用【原子_交易证券_账户_更新融资融券指令交易资金持仓负债】*/
            call db_tdsecu.pra_tdseac_UpdateFinaLoanApprDebt(
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
                v_exch_crncy_type,
                v_comm_id,
                v_exch_no,
                v_stock_code,
                v_stock_type,
                v_asset_type,
                v_invest_type,
                v_order_dir,
                v_stock_acco_no,
                v_stock_code_no,
                v_trade_code_no,
                v_comm_occur_amt,
                v_comm_occur_qty,
                v_trade_occur_amt,
                v_trade_occur_qty,
                v_is_record_jour,
                v_debt_qty,
                v_error_code,
                v_error_info,
                v_debt_type);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.94.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新融资融券指令交易资金持仓负债出现错误！',v_mysql_message);
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


    /* set @订单序号串# = ""; */
    set v_order_id_str = "";

    /* set @撤单序号串# = ""; */
    set v_wtdraw_id_str = "";

    /* if @是否撤单#=《是否撤单-是》 then */
    if v_is_withdraw=1 then
        #采用循环更新获取订单的方式，避免加锁时间长和并发问题

        /* set @记录序号# = 0; */
        set v_row_id = 0;
        loop_label:loop

            /* [事务开始] */
            START TRANSACTION;


            /* 调用【原子_交易证券_交易_锁定获取指令订单】*/
            call db_tdsecu.pra_tdsetd_LockGetCommOrder(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_comm_id,
                v_row_id,
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
                v_target_code_no,
                v_trade_code_no,
                v_stock_type,
                v_asset_type,
                v_comm_opor,
                v_external_no,
                v_report_date,
                v_report_time,
                v_report_no,
                v_order_batch_no,
                v_order_id,
                v_order_date,
                v_order_time,
                v_order_dir,
                v_price_type,
                v_order_price,
                v_order_qty,
                v_order_status,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_all_fee,
                v_wtdraw_qty,
                v_strike_amt,
                v_strike_qty,
                v_impawn_ratio,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_order_oper_way,
                v_busi_opor_no,
                v_target_stock_code_no,
                v_trade_acco);

            /* if @错误编码#="0" then */
            if v_error_code="0" then

                /* set @记录序号# = @订单序号#; */
                set v_row_id = v_order_id;

                /* set @撤单批号# = 0; */
                set v_wtdraw_batch_no = 0;

                /* set @撤单说明# = "指令撤销撤销指令订单！"; */
                set v_wtdraw_remark = "指令撤销撤销指令订单！";

                /* 调用【原子_交易证券_指令_撤销融资融券指令订单】*/
                call db_tdsecu.pra_tdseap_CancelFinaLoanCommOrder(
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
                    v_out_acco,
                    v_exch_crncy_type,
                    v_exch_no,
                    v_stock_acco_no,
                    v_stock_acco,
                    v_stock_code_no,
                    v_stock_code,
                    v_target_code_no,
                    v_trade_code_no,
                    v_stock_type,
                    v_asset_type,
                    v_comm_id,
                    v_external_no,
                    v_order_batch_no,
                    v_order_date,
                    v_report_no,
                    v_order_id,
                    v_order_dir,
                    v_order_price,
                    v_order_qty,
                    v_order_status,
                    v_order_frozen_amt,
                    v_order_frozen_qty,
                    v_impawn_ratio,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_wtdraw_batch_no,
                    v_wtdraw_remark,
                    v_order_oper_way,
                    v_busi_opor_no,
                    v_is_record_jour,
                    v_target_stock_code_no,
                    v_trade_acco,
                    v_error_code,
                    v_error_info,
                    v_frozen_amt,
                    v_wtdraw_status,
                    v_wtdraw_qty,
                    v_wtdraw_id);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.94.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销融资融券指令订单出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @订单序号串# = concat(@订单序号串#,@订单序号#,";"); */
                set v_order_id_str = concat(v_order_id_str,v_order_id,";");

                /* if @撤单序号# > 0 and @撤单状态# <> 《撤单状态-成功》 then */
                if v_wtdraw_id > 0 and v_wtdraw_status <> "3" then

                  /* set @撤单序号串# = concat(@撤单序号串#,@撤单序号#,";"); */
                  set v_wtdraw_id_str = concat(v_wtdraw_id_str,v_wtdraw_id,";");
               end if;
            else

                /* set @错误编码#="0"; */
                set v_error_code="0";

                /* set @错误信息#=' '; */
                set v_error_info=' ';
                ROLLBACK;
                leave loop_label;
            end if;

            /* [事务结束] */
            COMMIT;

            #处理汇总订单

            /* [事务开始] */
            START TRANSACTION;


                /* if @撤单数量# > 0 then */
                if v_wtdraw_qty > 0 then

                    /* set @废单数量# = 0; */
                    set v_waste_qty = 0;

                    /* 调用【原子_交易证券_交易_撤单处理汇总订单】*/
                    call db_tdsecu.pra_tdsetd_CancelDealSumOrder(
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
                        v_order_date,
                        v_order_batch_no,
                        v_wtdraw_qty,
                        v_waste_qty,
                        v_order_oper_way,
                        v_error_code,
                        v_error_info);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.3.94.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤单处理汇总订单出现错误！',v_mysql_message);
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

        end loop;
    end if;

    /* set @标的代码编号# = @临时_标的代码编号#; */
    set v_target_code_no = v_tmp_target_code_no;

    /* set @交易代码编号# = @临时_交易代码编号#; */
    set v_trade_code_no = v_tmp_trade_code_no;

    /* if @指令方向# = 《指令方向-融资买入》 or @指令方向# = 《指令方向-卖券还款》 or @指令方向# = 《指令方向-直接还款》 then */
    if v_comm_dir = 5 or v_comm_dir = 7 or v_comm_dir = 14 then

        /* set @负债类型# = 《负债类型-融资》; */
        set v_debt_type = 1;
    else

        /* set @负债类型# = 《负债类型-融券》; */
        set v_debt_type = 2;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_comm_date = v_comm_date;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_order_id_str = v_order_id_str;
    SET p_wtdraw_id_str = v_wtdraw_id_str;
    SET p_target_code_no = v_target_code_no;
    SET p_trade_code_no = v_trade_code_no;
    SET p_debt_type = v_debt_type;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_融资融券审批指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_FinaLoanApprComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_FinaLoanApprComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_asset_type int,
    IN p_comm_id bigint,
    IN p_stock_acco varchar(16),
    IN p_comm_date int,
    IN p_comm_appr_oper int,
    IN p_comm_appr_status varchar(2),
    IN p_comm_appr_remark varchar(255),
    IN p_asac_busi_config_str varchar(64),
    IN p_all_fee decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_cost_calc_type int,
    IN p_compli_trig_id bigint,
    IN p_asset_acco_type int,
    IN p_co_busi_config_str varchar(64),
    IN p_online_opor_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_order_id bigint,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_stock_type int,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_batch_no int,
    OUT p_order_dir int,
    OUT p_external_no bigint,
    OUT p_price_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_net_price_flag int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_order_oper_way varchar(2),
    OUT p_update_times int,
    OUT p_appr_allow_order_flag int,
    OUT p_comm_oper_way varchar(2),
    OUT p_debt_type int,
    OUT p_auto_comm_executor int
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_asset_type int;
    declare v_comm_id bigint;
    declare v_stock_acco varchar(16);
    declare v_comm_date int;
    declare v_comm_appr_oper int;
    declare v_comm_appr_status varchar(2);
    declare v_comm_appr_remark varchar(255);
    declare v_asac_busi_config_str varchar(64);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_cost_calc_type int;
    declare v_compli_trig_id bigint;
    declare v_asset_acco_type int;
    declare v_co_busi_config_str varchar(64);
    declare v_online_opor_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_order_id bigint;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_external_no bigint;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_order_oper_way varchar(2);
    declare v_update_times int;
    declare v_appr_allow_order_flag int;
    declare v_comm_oper_way varchar(2);
    declare v_debt_type int;
    declare v_auto_comm_executor int;
    declare v_tmp_comm_appr_status varchar(2);
    declare v_tmp_comm_appr_oper int;
    declare v_tmp_comm_appr_remark varchar(255);
    declare v_tmp_stock_acco varchar(16);
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_invest_type int;
    declare v_exist_debt_flag int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_exch_crncy_type varchar(3);
    declare v_comm_time int;
    declare v_comm_opor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_intrst_days int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_strike_status varchar(2);
    declare v_comm_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_exter_comm_flag int;
    declare v_strategy_capt_qty decimal(18,2);
    declare v_strategy_order_qty decimal(18,2);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_contra_no varchar(32);
    declare v_disp_status int;
    declare v_before_comm_executor int;
    declare v_comm_appr_oper_no int;
    declare v_curr_opor_no int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_disp_opor int;
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_debt_qty decimal(18,2);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_calc_dir int;
    declare v_order_amt decimal(18,4);
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_pass_status varchar(2);
    declare v_busi_opor_no int;
    declare v_avail_cal_flag int;
    declare v_open_posi_date int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_waste_qty decimal(18,2);

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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_asset_type = p_asset_type;
    SET v_comm_id = p_comm_id;
    SET v_stock_acco = p_stock_acco;
    SET v_comm_date = p_comm_date;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_comm_appr_status = p_comm_appr_status;
    SET v_comm_appr_remark = p_comm_appr_remark;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_all_fee = p_all_fee;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_online_opor_no_str = p_online_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_order_id = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_batch_no = 0;
    SET v_order_dir = 0;
    SET v_external_no = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_status = "0";
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_net_price_flag = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_order_oper_way = " ";
    SET v_update_times = 1;
    SET v_appr_allow_order_flag = 0;
    SET v_comm_oper_way = " ";
    SET v_debt_type = 0;
    SET v_auto_comm_executor = 0;
    SET v_tmp_comm_appr_status = " ";
    SET v_tmp_comm_appr_oper = 0;
    SET v_tmp_comm_appr_remark = " ";
    SET v_tmp_stock_acco = " ";
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_invest_type = 0;
    SET v_exist_debt_flag = 0;
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_opor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_intrst_days = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_strike_status = "0";
    SET v_comm_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_exter_comm_flag = 0;
    SET v_strategy_capt_qty = 0;
    SET v_strategy_order_qty = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_contra_no = " ";
    SET v_disp_status = 0;
    SET v_before_comm_executor = 0;
    SET v_comm_appr_oper_no = 0;
    SET v_curr_opor_no = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_disp_opor = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_debt_qty = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_calc_dir = 1;
    SET v_order_amt = 0;
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;
    SET v_remark_info = " ";
    SET v_pass_status = "0";
    SET v_busi_opor_no = 0;
    SET v_avail_cal_flag = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_wtdraw_qty = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @临时_指令审批状态#=@指令审批状态#; */
    set v_tmp_comm_appr_status=v_comm_appr_status;

    /* set @临时_指令审批操作员#=@操作员编号#; */
    set v_tmp_comm_appr_oper=v_opor_no;

    /* set @临时_指令审批说明#=@指令审批说明#; */
    set v_tmp_comm_appr_remark=v_comm_appr_remark;
    #股东代码在指令表没有是获取不到的，订单表中的用传进来的股东代码

    /* set @临时_股东代码#=@股东代码#; */
    set v_tmp_stock_acco=v_stock_acco;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;

    /* set @登记机构# =""; */
    set v_registration_agency ="";

    /* set @交易账户# =""; */
    set v_trade_acco ="";

    /* set @投资类型# = 《投资类型-二级市场交易性金融资产》; */
    set v_invest_type = 1;

    /* set @存在负债标志# = 《存在负债标志-存在》; */
    set v_exist_debt_flag = 2;

    /* set @买入参考汇率# = 0; */
    set v_buy_ref_rate = 0;

    /* set @卖出参考汇率# = 0; */
    set v_sell_ref_rate = 0;

    /* if substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 then */
    if substring(v_asac_busi_config_str,6,1)=1 then
        #获取订单批号

        /* set @编号类型#=《编号类型-订单批号》; */
        set v_record_no_type=18;

        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_交易证券_公用_获取业务记录编号】*/
            call db_tdsecu.pra_tdsepb_GetCoBusiRecordNo(
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
                SET v_error_code = "tdsecuT.3.95.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


        /* [事务结束] */
        COMMIT;


        /* set @订单批号#=@当前编号#; */
        set v_order_batch_no=v_curr_no;
    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_指令_锁定获取指令信息】*/
        call db_tdsecu.pra_tdseap_LockGetCommInfo(
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
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
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
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_strike_status,
            v_comm_status,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_comple_date,
            v_comm_comple_time,
            v_comm_appr_status,
            v_exter_comm_flag,
            v_strategy_capt_qty,
            v_strategy_order_qty,
            v_comm_oper_way,
            v_combo_code,
            v_combo_posi_id,
            v_target_stock_code,
            v_target_stock_code_no,
            v_contra_no,
            v_disp_status,
            v_exist_debt_flag);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.95.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_锁定获取指令信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @股东代码#=@临时_股东代码#; */
        set v_stock_acco=v_tmp_stock_acco;

        /* set @订单方向#=@指令方向#; */
        set v_order_dir=v_comm_dir;

        /* set @前指令执行人#=@指令执行人#; */
        set v_before_comm_executor=v_comm_executor;

        /* [检查报错返回][@指令下达人#=@操作员编号#][726][@指令下达人#,@操作员编号#] */
        if v_comm_opor=v_opor_no then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.95.726";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令下达人=",v_comm_opor,",","操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令下达人=",v_comm_opor,",","操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@指令审批状态#=《指令审批状态-不审批》 ][727][@指令审批状态#] */
        if v_comm_appr_status="4"  then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.95.727";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令审批状态=",v_comm_appr_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令审批状态=",v_comm_appr_status);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@指令审批状态#=《指令审批状态-审批通过》 or @指令审批状态#=《指令审批状态-审批拒绝》 ][728][@指令审批状态#] */
        if v_comm_appr_status="2" or v_comm_appr_status="3"  then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.95.728";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令审批状态=",v_comm_appr_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令审批状态=",v_comm_appr_status);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@指令状态# <>《指令状态-未执行》and @指令状态# <>《指令状态-暂停执行》  ][763][@指令状态#] */
        if v_comm_status <>"1"and v_comm_status <>"7"   then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.95.763";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令状态=",v_comm_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令状态=",v_comm_status);
            end if;
            leave label_pro;
        end if;


        /* set @指令审批状态#=@临时_指令审批状态#; */
        set v_comm_appr_status=v_tmp_comm_appr_status;
        #获取指令审批操作员序号

        /* set @指令审批操作员序号# = 0; */
        set v_comm_appr_oper_no = 0;
        #[原子_交易证券_公用_获取指令审批操作员序号]
        #如果审批通过，需做相应检查处理，并获取指令批号

        /* if @指令审批状态#=《指令审批状态-审批通过》 then */
        if v_comm_appr_status="2" then

            /* if substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 then */
            if substring(v_asac_busi_config_str,6,1)=1 then

                /* if @指令方向#=《指令方向-新股申购》 or  @指令方向#=《指令方向-配售申购》 then */
                if v_comm_dir=11 or  v_comm_dir=23 then

                    /* 调用【原子_交易证券_交易_检查证券申购重复】*/
                    call db_tdsecu.pra_tdsetd_CheckPurcDup(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_init_date,
                        v_exch_group_no,
                        v_asset_acco_no,
                        v_exch_no,
                        v_stock_acco_no,
                        v_stock_code_no,
                        v_error_code,
                        v_error_info);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.3.95.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_检查证券申购重复出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;

                end if;
            end if;
        end if;

        /* set @指令审批操作员#=@临时_指令审批操作员#; */
        set v_comm_appr_oper=v_tmp_comm_appr_oper;

        /* set @指令审批说明#=@临时_指令审批说明#; */
        set v_comm_appr_remark=v_tmp_comm_appr_remark;

        /* set @当前操作员#=@操作员编号#; */
        set v_curr_opor_no=v_opor_no;

        /* 调用【原子_交易证券_指令_审批指令】*/
        call db_tdsecu.pra_tdseap_ApprComm(
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
            v_stock_code,
            v_stock_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_date,
            v_comm_id,
            v_comm_opor,
            v_comm_executor,
            v_comm_batch_no,
            v_comm_appr_oper_no,
            v_comm_appr_oper,
            v_comm_appr_status,
            v_comm_appr_remark,
            v_comm_qty,
            v_comm_dir,
            v_comm_limit_price,
            v_limit_actual_price,
            v_order_qty,
            v_comm_cancel_qty,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_net_price_flag,
            v_par_value,
            v_comm_status,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_exter_comm_flag,
            v_comm_oper_way,
            v_comm_amt,
            v_co_busi_config_str,
            v_online_opor_no_str,
            v_curr_opor_no,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_before_comm_executor,
            v_error_code,
            v_error_info,
            v_comm_occur_amt,
            v_comm_occur_qty,
            v_comm_appr_date,
            v_comm_appr_time,
            v_disp_status,
            v_disp_opor,
            v_auto_comm_executor);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.95.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_审批指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @指令审批状态#=《指令审批状态-审批拒绝》 and (@指令变动金额# <> 0 or @指令变动数量# <> 0) then */
        if v_comm_appr_status="3" and (v_comm_occur_amt <> 0 or v_comm_occur_qty <> 0) then
            #处理资金持仓数据

            /* 调用【原子_交易证券_账户_更新指令资金持仓】*/
            call db_tdsecu.pra_tdseac_UpdateApprCashPosi(
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
                v_comm_id,
                v_comm_dir,
                v_exch_crncy_type,
                v_exch_no,
                v_stock_code,
                v_asset_type,
                v_stock_type,
                v_impawn_ratio,
                v_stock_acco_no,
                v_stock_code_no,
                v_trade_code_no,
                v_target_code_no,
                v_comm_occur_amt,
                v_comm_occur_qty,
                v_is_record_jour,
                v_combo_code,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.95.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令资金持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @交易变动金额#=0; */
            set v_trade_occur_amt=0;

            /* set @交易变动数量#=0; */
            set v_trade_occur_qty=0;

            /* set @负债数量#=0; */
            set v_debt_qty=0;

            /* 调用【原子_交易证券_账户_更新融资融券指令交易资金持仓负债】*/
            call db_tdsecu.pra_tdseac_UpdateFinaLoanApprDebt(
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
                v_exch_crncy_type,
                v_comm_id,
                v_exch_no,
                v_stock_code,
                v_stock_type,
                v_asset_type,
                v_invest_type,
                v_order_dir,
                v_stock_acco_no,
                v_stock_code_no,
                v_trade_code_no,
                v_comm_occur_amt,
                v_comm_occur_qty,
                v_trade_occur_amt,
                v_trade_occur_qty,
                v_is_record_jour,
                v_debt_qty,
                v_error_code,
                v_error_info,
                v_debt_type);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.95.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新融资融券指令交易资金持仓负债出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        else
    #手工审批  暂停的指令时 需拦截自动下单 modify by wjp 20181106

            /* if (substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》  and @指令状态# <>《指令状态-暂停执行》) then */
            if (substring(v_asac_busi_config_str,6,1)=1  and v_comm_status <>"7") then
                #设置订单值

                /* set @外部编号#=0; */
                set v_external_no=0;

                /* set @申报日期# = 0; */
                set v_report_date = 0;

                /* set @申报时间# = 0; */
                set v_report_time = 0;

                /* set @申报编号# = " "; */
                set v_report_no = " ";

                /* set @操作员编号#=@指令执行人#; */
                set v_opor_no=v_comm_executor;

                /* set @订单日期#=@初始化日期#; */
                set v_order_date=v_init_date;

                /* set @价格类型#=《价格类型-限价》; */
                set v_price_type=1;

                /* set @订单方向#=@指令方向#; */
                set v_order_dir=v_comm_dir;

                /* set @订单数量#=@指令数量#; */
                set v_order_qty=v_comm_qty;

                /* set @订单价格#=@指令实际限价#; */
                set v_order_price=v_limit_actual_price;

                /* set @审批通过自动下单# = 《审批通过自动下单-是》; */
                set v_appr_allow_order_flag = 1;

                /* set @计算方向# = 《计算方向-减去》; */
                set v_calc_dir = -1;

                /* 调用【原子_交易证券_公用_计算融资融券指令冻结金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetFinaLoanCommFrozenAmtAndQty(
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
                    v_calc_dir,
                    v_comm_amt,
                    v_error_code,
                    v_error_info,
                    v_comm_frozen_amt,
                    v_comm_frozen_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.95.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券指令冻结金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* 调用【原子_交易证券_指令_下单更新指令】*/
                call db_tdsecu.pra_tdseap_OrderUpdateComm(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_comm_id,
                    v_comm_frozen_amt,
                    v_comm_frozen_qty,
                    v_order_qty,
                    v_error_code,
                    v_error_info,
                    v_limit_actual_price,
                    v_exter_comm_flag,
                    v_comm_comple_date,
                    v_comm_comple_time,
                    v_comm_status,
                    v_strike_status);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.95.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_下单更新指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #计算交易冻结金额

                /* set @订单金额# = @指令金额#; */
                set v_order_amt = v_comm_amt;

                /* 调用【原子_交易证券_公用_计算融资融券交易冻结金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetFinaLoanExchFrozenAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_order_dir,
                    v_order_price,
                    v_order_qty,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_all_fee,
                    v_order_amt,
                    v_error_code,
                    v_error_info,
                    v_trade_frozen_amt,
                    v_trade_frozen_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.95.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券交易冻结金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @订单冻结金额#=@交易冻结金额#; */
                set v_order_frozen_amt=v_trade_frozen_amt;

                /* set @订单冻结数量#=@交易冻结数量#; */
                set v_order_frozen_qty=v_trade_frozen_qty;

                /* set @备注信息#="指令审批后自动执行下单！"; */
                set v_remark_info="指令审批后自动执行下单！";
                #根据报盘机状态，设置订单状态 如果通道是允许报送状态,则直接将订单状态设为"待报"

                /* set @订单状态# = 《订单状态-未报》; */
                set v_order_status = "1";

                /* 调用【原子_交易证券_公用_获取通道状态】*/
                call db_tdsecu.pra_tdsepb_GetChannelStatus(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_pass_no,
                    v_error_code,
                    v_error_info,
                    v_pass_status);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.95.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取通道状态出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* if @通道状态# = 《通道状态-正常》 then */
                if v_pass_status = "1" then

                    /* set @订单状态# = 《订单状态-待报》; */
                    set v_order_status = "a";
                end if;

                /* set @订单操作方式# = 《订单操作方式-审批后自动下单》; */
                set v_order_oper_way = "40";

                /* set @组合代码# = " "; */
                set v_combo_code = " ";

                /* set @组合持仓序号# = 0; */
                set v_combo_posi_id = 0;

                /* 调用【原子_交易证券_交易_新增订单】*/
                call db_tdsecu.pra_tdsetd_AddOrder(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_init_date,
                    v_co_no,
                    v_comm_opor,
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
                    v_target_code_no,
                    v_trade_code_no,
                    v_stock_type,
                    v_asset_type,
                    v_external_no,
                    v_comm_id,
                    v_comm_batch_no,
                    v_order_batch_no,
                    v_order_date,
                    v_order_dir,
                    v_price_type,
                    v_order_price,
                    v_order_qty,
                    v_order_status,
                    v_report_date,
                    v_report_time,
                    v_report_no,
                    v_order_frozen_amt,
                    v_order_frozen_qty,
                    v_net_price_flag,
                    v_intrst_days,
                    v_par_value,
                    v_impawn_ratio,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_compli_trig_id,
                    v_remark_info,
                    v_order_oper_way,
                    v_exter_comm_flag,
                    v_cost_calc_type,
                    v_combo_code,
                    v_combo_posi_id,
                    v_target_stock_code,
                    v_target_stock_code_no,
                    v_registration_agency,
                    v_trade_acco,
                    v_contra_no,
                    v_asset_acco_type,
                    v_exist_debt_flag,
                    v_error_code,
                    v_error_info,
                    v_order_id,
                    v_order_time,
                    v_update_times);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.95.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增订单出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #处理订单资金持仓数据

                /* set @计算方向# = 《计算方向-减去》; */
                set v_calc_dir = -1;

                /* 调用【原子_交易证券_公用_计算融资融券指令变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetFinaLoanCommOccurAmtAndQty(
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
                    v_calc_dir,
                    v_comm_amt,
                    v_error_code,
                    v_error_info,
                    v_comm_occur_amt,
                    v_comm_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.95.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券指令变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #计算下单交易变动金额和数量

                /* 调用【原子_交易证券_公用_计算融资融券交易变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetFinaLoanTradeOccurAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_order_dir,
                    v_order_qty,
                    v_order_price,
                    v_order_frozen_amt,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_error_code,
                    v_error_info,
                    v_trade_occur_amt,
                    v_trade_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.95.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券交易变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #处理订单资金持仓数据，保护指令变动和交易的变动

                /* set @业务操作员编号# = @指令执行人#; */
                set v_busi_opor_no = v_comm_executor;

                /* set @可用计算标志# = 0; */
                set v_avail_cal_flag = 0;

                /* set @负债数量# = 0; */
                set v_debt_qty = 0;

                /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
                call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
                    v_exch_crncy_type,
                    v_comm_id,
                    v_order_id,
                    v_exch_no,
                    v_stock_code,
                    v_stock_type,
                    v_asset_type,
                    v_order_dir,
                    v_impawn_ratio,
                    v_stock_acco_no,
                    v_stock_code_no,
                    v_trade_code_no,
                    v_target_code_no,
                    v_comm_occur_amt,
                    v_comm_occur_qty,
                    v_trade_occur_amt,
                    v_trade_occur_qty,
                    v_is_record_jour,
                    v_order_oper_way,
                    v_busi_opor_no,
                    v_open_close_permission,
                    v_avail_cal_flag,
                    v_combo_code,
                    v_combo_posi_id,
                    v_target_stock_code_no,
                    v_error_code,
                    v_error_info,
                    v_open_posi_date);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.95.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* 调用【原子_交易证券_账户_更新融资融券指令交易资金持仓负债】*/
                call db_tdsecu.pra_tdseac_UpdateFinaLoanApprDebt(
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
                    v_exch_crncy_type,
                    v_comm_id,
                    v_exch_no,
                    v_stock_code,
                    v_stock_type,
                    v_asset_type,
                    v_invest_type,
                    v_order_dir,
                    v_stock_acco_no,
                    v_stock_code_no,
                    v_trade_code_no,
                    v_comm_occur_amt,
                    v_comm_occur_qty,
                    v_trade_occur_amt,
                    v_trade_occur_qty,
                    v_is_record_jour,
                    v_debt_qty,
                    v_error_code,
                    v_error_info,
                    v_debt_type);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.95.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新融资融券指令交易资金持仓负债出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #modify by wjp 20181101

                /* if @订单批号# > 0  then */
                if v_order_batch_no > 0  then

                    /* set @撤单数量# = 0; */
                    set v_wtdraw_qty = 0;

                    /* set @废单数量# = 0; */
                    set v_waste_qty = 0;

                   /* 调用【原子_交易证券_交易_订单处理汇总订单】*/
                   call db_tdsecu.pra_tdsetd_OrderDealSumOrder(
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
                       v_exch_crncy_type,
                       v_exch_no,
                       v_stock_code_no,
                       v_stock_code,
                       v_trade_code_no,
                       v_target_code_no,
                       v_stock_type,
                       v_asset_type,
                       v_external_no,
                       v_order_date,
                       v_order_batch_no,
                       v_order_dir,
                       v_price_type,
                       v_order_price,
                       v_order_qty,
                       v_order_status,
                       v_wtdraw_qty,
                       v_waste_qty,
                       v_net_price_flag,
                       v_intrst_days,
                       v_par_value,
                       v_bond_accr_intrst,
                       v_bond_rate_type,
                       v_impawn_ratio,
                       v_order_oper_way,
                       v_exter_comm_flag,
                       v_error_code,
                       v_error_info);
                   if v_error_code = "1" then
                       SET v_error_code = "tdsecuT.3.95.999";
                       if v_mysql_message <> "" then
                            SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_订单处理汇总订单出现错误！',v_mysql_message);
                       end if;
                       ROLLBACK;
                       leave label_pro;
                   elseif v_error_code <> "0" then
                       ROLLBACK;
                       leave label_pro;
                   end if;

               end if;
            end if;
        end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_order_id = v_order_id;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_stock_type = v_stock_type;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_dir = v_order_dir;
    SET p_external_no = v_external_no;
    SET p_price_type = v_price_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_status = v_order_status;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_net_price_flag = v_net_price_flag;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_order_oper_way = v_order_oper_way;
    SET p_update_times = v_update_times;
    SET p_appr_allow_order_flag = v_appr_allow_order_flag;
    SET p_comm_oper_way = v_comm_oper_way;
    SET p_debt_type = v_debt_type;
    SET p_auto_comm_executor = v_auto_comm_executor;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_融资融券修改指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_FinaLoanModiComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_FinaLoanModiComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
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
    IN p_stock_type int,
    IN p_comm_id bigint,
    IN p_comm_dir int,
    IN p_comm_limit_price decimal(16,9),
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_qty decimal(18,2),
    IN p_comm_amt decimal(18,4),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_comm_begin_date int,
    IN p_comm_end_date int,
    IN p_comm_begin_time int,
    IN p_comm_end_time int,
    IN p_modi_info varchar(255),
    IN p_compli_trig_id bigint,
    IN p_subscription_trade_mark int,
    IN p_purchase_trade_mark int,
    IN p_rede_trade_mark int,
    IN p_first_minimum_amt decimal(18,4),
    IN p_minimum_purchase_amt decimal(18,4),
    IN p_minimum_subscription_amt decimal(18,4),
    IN p_minimum_rede_share decimal(18,2),
    IN p_minimum_holding_share decimal(18,2),
    IN p_record_count int,
    IN p_comm_remark_info varchar(1024),
    IN p_fina_limit_max decimal(18,4),
    IN p_loan_limit_max decimal(18,4),
    IN p_fina_marg_ratio decimal(18,12),
    IN p_secu_loan_marg_ratio decimal(18,12),
    IN p_exgp_loan_sell_amt decimal(18,4),
    IN p_asac_loan_sell_amt decimal(18,4),
    IN p_asac_converted_margin decimal(18,4),
    IN p_asac_fina_converted_pandl decimal(18,4),
    IN p_asac_loan_converted_pandl decimal(18,4),
    IN p_asac_fina_capt_margin decimal(18,4),
    IN p_asac_loan_capt_margin decimal(18,4),
    IN p_asac_keep_guarantee_ratio decimal(18,12),
    IN p_exgp_converted_margin decimal(18,4),
    IN p_exgp_fina_converted_pandl decimal(18,4),
    IN p_exgp_loan_converted_pandl decimal(18,4),
    IN p_exgp_fina_capt_margin decimal(18,4),
    IN p_exgp_loan_capt_margin decimal(18,4),
    IN p_exgp_keep_guarantee_ratio decimal(18,12),
    IN p_exgp_debt_loan_sell_strike_qty decimal(18,2),
    IN p_exgp_debt_fina_buy_strike_amt decimal(18,4),
    IN p_pre_comm_amt decimal(18,4),
    IN p_asac_cmmd_converted_margin decimal(18,4),
    IN p_asac_order_converted_margin decimal(18,4),
    IN p_asac_curr_converted_margin decimal(18,4),
    IN p_exgp_cmmd_converted_margin decimal(18,4),
    IN p_exgp_order_converted_margin decimal(18,4),
    IN p_exgp_curr_converted_margin decimal(18,4),
    IN p_exgp_fina_comm_capt_margin decimal(18,4),
    IN p_exgp_loan_comm_capt_margin decimal(18,4),
    IN p_exgp_fina_order_capt_margin decimal(18,4),
    IN p_exgp_loan_order_capt_margin decimal(18,4),
    IN p_asac_fina_comm_capt_margin decimal(18,4),
    IN p_asac_loan_comm_capt_margin decimal(18,4),
    IN p_asac_fina_order_capt_margin decimal(18,4),
    IN p_asac_loan_order_capt_margin decimal(18,4),
    IN p_asac_fina_interest decimal(18,4),
    IN p_asac_loan_interest decimal(18,4),
    IN p_exgp_fina_interest decimal(18,4),
    IN p_exgp_loan_interest decimal(18,4),
    IN p_read_flag int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_date int,
    OUT p_comm_batch_no int,
    OUT p_comm_status varchar(2),
    OUT p_comm_opor int,
    OUT p_comm_occur_amt decimal(18,4),
    OUT p_comm_occur_qty decimal(18,2),
    OUT p_order_id_str varchar(2048),
    OUT p_wtdraw_id_str varchar(2048),
    OUT p_debt_type int
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
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
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
    declare v_stock_type int;
    declare v_comm_id bigint;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_modi_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_record_count int;
    declare v_comm_remark_info varchar(1024);
    declare v_fina_limit_max decimal(18,4);
    declare v_loan_limit_max decimal(18,4);
    declare v_fina_marg_ratio decimal(18,12);
    declare v_secu_loan_marg_ratio decimal(18,12);
    declare v_exgp_loan_sell_amt decimal(18,4);
    declare v_asac_loan_sell_amt decimal(18,4);
    declare v_asac_converted_margin decimal(18,4);
    declare v_asac_fina_converted_pandl decimal(18,4);
    declare v_asac_loan_converted_pandl decimal(18,4);
    declare v_asac_fina_capt_margin decimal(18,4);
    declare v_asac_loan_capt_margin decimal(18,4);
    declare v_asac_keep_guarantee_ratio decimal(18,12);
    declare v_exgp_converted_margin decimal(18,4);
    declare v_exgp_fina_converted_pandl decimal(18,4);
    declare v_exgp_loan_converted_pandl decimal(18,4);
    declare v_exgp_fina_capt_margin decimal(18,4);
    declare v_exgp_loan_capt_margin decimal(18,4);
    declare v_exgp_keep_guarantee_ratio decimal(18,12);
    declare v_exgp_debt_loan_sell_strike_qty decimal(18,2);
    declare v_exgp_debt_fina_buy_strike_amt decimal(18,4);
    declare v_pre_comm_amt decimal(18,4);
    declare v_asac_cmmd_converted_margin decimal(18,4);
    declare v_asac_order_converted_margin decimal(18,4);
    declare v_asac_curr_converted_margin decimal(18,4);
    declare v_exgp_cmmd_converted_margin decimal(18,4);
    declare v_exgp_order_converted_margin decimal(18,4);
    declare v_exgp_curr_converted_margin decimal(18,4);
    declare v_exgp_fina_comm_capt_margin decimal(18,4);
    declare v_exgp_loan_comm_capt_margin decimal(18,4);
    declare v_exgp_fina_order_capt_margin decimal(18,4);
    declare v_exgp_loan_order_capt_margin decimal(18,4);
    declare v_asac_fina_comm_capt_margin decimal(18,4);
    declare v_asac_loan_comm_capt_margin decimal(18,4);
    declare v_asac_fina_order_capt_margin decimal(18,4);
    declare v_asac_loan_order_capt_margin decimal(18,4);
    declare v_asac_fina_interest decimal(18,4);
    declare v_asac_loan_interest decimal(18,4);
    declare v_exgp_fina_interest decimal(18,4);
    declare v_exgp_loan_interest decimal(18,4);
    declare v_read_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_status varchar(2);
    declare v_comm_opor int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_order_id_str varchar(2048);
    declare v_wtdraw_id_str varchar(2048);
    declare v_debt_type int;
    declare v_tmp_comm_limit_price decimal(16,9);
    declare v_tmp_limit_actual_price decimal(16,9);
    declare v_tmp_comm_qty decimal(18,2);
    declare v_invest_type int;
    declare v_order_dir int;
    declare v_tmp_comm_amt decimal(18,4);
    declare v_tmp_comm_begin_date int;
    declare v_tmp_comm_end_date int;
    declare v_tmp_comm_begin_time int;
    declare v_tmp_comm_end_time int;
    declare v_calc_dir int;
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_tmp_comm_frozen_amt decimal(18,4);
    declare v_tmp_comm_frozen_qty decimal(18,2);
    declare v_is_record_jour int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_asset_type int;
    declare v_comm_time int;
    declare v_comm_executor int;
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_strike_status varchar(2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_appr_status varchar(2);
    declare v_exter_comm_flag int;
    declare v_strategy_capt_qty decimal(18,2);
    declare v_strategy_order_qty decimal(18,2);
    declare v_comm_oper_way varchar(2);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_contra_no varchar(32);
    declare v_disp_status int;
    declare v_exist_debt_flag int;
    declare v_debt_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_trade_acco varchar(32);
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_remark varchar(255);
    declare v_frozen_amt decimal(18,4);
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_id bigint;
    declare v_waste_qty decimal(18,2);

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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
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
    SET v_stock_type = p_stock_type;
    SET v_comm_id = p_comm_id;
    SET v_comm_dir = p_comm_dir;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_qty = p_comm_qty;
    SET v_comm_amt = p_comm_amt;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_comm_begin_date = p_comm_begin_date;
    SET v_comm_end_date = p_comm_end_date;
    SET v_comm_begin_time = p_comm_begin_time;
    SET v_comm_end_time = p_comm_end_time;
    SET v_modi_info = p_modi_info;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_subscription_trade_mark = p_subscription_trade_mark;
    SET v_purchase_trade_mark = p_purchase_trade_mark;
    SET v_rede_trade_mark = p_rede_trade_mark;
    SET v_first_minimum_amt = p_first_minimum_amt;
    SET v_minimum_purchase_amt = p_minimum_purchase_amt;
    SET v_minimum_subscription_amt = p_minimum_subscription_amt;
    SET v_minimum_rede_share = p_minimum_rede_share;
    SET v_minimum_holding_share = p_minimum_holding_share;
    SET v_record_count = p_record_count;
    SET v_comm_remark_info = p_comm_remark_info;
    SET v_fina_limit_max = p_fina_limit_max;
    SET v_loan_limit_max = p_loan_limit_max;
    SET v_fina_marg_ratio = p_fina_marg_ratio;
    SET v_secu_loan_marg_ratio = p_secu_loan_marg_ratio;
    SET v_exgp_loan_sell_amt = p_exgp_loan_sell_amt;
    SET v_asac_loan_sell_amt = p_asac_loan_sell_amt;
    SET v_asac_converted_margin = p_asac_converted_margin;
    SET v_asac_fina_converted_pandl = p_asac_fina_converted_pandl;
    SET v_asac_loan_converted_pandl = p_asac_loan_converted_pandl;
    SET v_asac_fina_capt_margin = p_asac_fina_capt_margin;
    SET v_asac_loan_capt_margin = p_asac_loan_capt_margin;
    SET v_asac_keep_guarantee_ratio = p_asac_keep_guarantee_ratio;
    SET v_exgp_converted_margin = p_exgp_converted_margin;
    SET v_exgp_fina_converted_pandl = p_exgp_fina_converted_pandl;
    SET v_exgp_loan_converted_pandl = p_exgp_loan_converted_pandl;
    SET v_exgp_fina_capt_margin = p_exgp_fina_capt_margin;
    SET v_exgp_loan_capt_margin = p_exgp_loan_capt_margin;
    SET v_exgp_keep_guarantee_ratio = p_exgp_keep_guarantee_ratio;
    SET v_exgp_debt_loan_sell_strike_qty = p_exgp_debt_loan_sell_strike_qty;
    SET v_exgp_debt_fina_buy_strike_amt = p_exgp_debt_fina_buy_strike_amt;
    SET v_pre_comm_amt = p_pre_comm_amt;
    SET v_asac_cmmd_converted_margin = p_asac_cmmd_converted_margin;
    SET v_asac_order_converted_margin = p_asac_order_converted_margin;
    SET v_asac_curr_converted_margin = p_asac_curr_converted_margin;
    SET v_exgp_cmmd_converted_margin = p_exgp_cmmd_converted_margin;
    SET v_exgp_order_converted_margin = p_exgp_order_converted_margin;
    SET v_exgp_curr_converted_margin = p_exgp_curr_converted_margin;
    SET v_exgp_fina_comm_capt_margin = p_exgp_fina_comm_capt_margin;
    SET v_exgp_loan_comm_capt_margin = p_exgp_loan_comm_capt_margin;
    SET v_exgp_fina_order_capt_margin = p_exgp_fina_order_capt_margin;
    SET v_exgp_loan_order_capt_margin = p_exgp_loan_order_capt_margin;
    SET v_asac_fina_comm_capt_margin = p_asac_fina_comm_capt_margin;
    SET v_asac_loan_comm_capt_margin = p_asac_loan_comm_capt_margin;
    SET v_asac_fina_order_capt_margin = p_asac_fina_order_capt_margin;
    SET v_asac_loan_order_capt_margin = p_asac_loan_order_capt_margin;
    SET v_asac_fina_interest = p_asac_fina_interest;
    SET v_asac_loan_interest = p_asac_loan_interest;
    SET v_exgp_fina_interest = p_exgp_fina_interest;
    SET v_exgp_loan_interest = p_exgp_loan_interest;
    SET v_read_flag = p_read_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_batch_no = 0;
    SET v_comm_status = "0";
    SET v_comm_opor = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_order_id_str = " ";
    SET v_wtdraw_id_str = " ";
    SET v_debt_type = 0;
    SET v_tmp_comm_limit_price = 0;
    SET v_tmp_limit_actual_price = 0;
    SET v_tmp_comm_qty = 0;
    SET v_invest_type = 0;
    SET v_order_dir = 0;
    SET v_tmp_comm_amt = 0;
    SET v_tmp_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_calc_dir = 1;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_tmp_comm_frozen_amt = 0;
    SET v_tmp_comm_frozen_qty = 0;
    SET v_is_record_jour = 1;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_asset_type = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_executor = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_strike_status = "0";
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_status = " ";
    SET v_exter_comm_flag = 0;
    SET v_strategy_capt_qty = 0;
    SET v_strategy_order_qty = 0;
    SET v_comm_oper_way = " ";
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_contra_no = " ";
    SET v_disp_status = 0;
    SET v_exist_debt_flag = 0;
    SET v_debt_qty = 0;
    SET v_occur_amt = 0;
    SET v_occur_qty = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_row_id = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_external_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_batch_no = 0;
    SET v_order_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_trade_acco = " ";
    SET v_wtdraw_batch_no = 0;
    SET v_wtdraw_remark = " ";
    SET v_frozen_amt = 0;
    SET v_wtdraw_status = "0";
    SET v_wtdraw_id = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @临时_指令限价#=@指令限价#; */
    set v_tmp_comm_limit_price=v_comm_limit_price;

    /* set @临时_指令实际限价#=@指令实际限价#; */
    set v_tmp_limit_actual_price=v_limit_actual_price;

    /* set @临时_指令数量#=@指令数量#; */
    set v_tmp_comm_qty=v_comm_qty;

    /* set @投资类型#=《投资类型-二级市场交易性金融资产》 ; */
    set v_invest_type=1 ;

    /* set @订单方向# = @指令方向#; */
    set v_order_dir = v_comm_dir;
    #指令金额后台自己计算，不采用前台传入

    /* if @指令方向# <> 《指令方向-直接还款》 then */
    if v_comm_dir <> 14 then

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
            SET v_error_code = "tdsecuT.3.96.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令金额出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    else

        /* set @指令金额# = @前指令金额#; */
        set v_comm_amt = v_pre_comm_amt;
    end if;

    /* set @临时_指令金额#=@指令金额#; */
    set v_tmp_comm_amt=v_comm_amt;

    /* set @临时_指令开始日期# = @指令开始日期#; */
    set v_tmp_comm_begin_date = v_comm_begin_date;

    /* set @临时_指令结束日期# = @指令结束日期#; */
    set v_tmp_comm_end_date = v_comm_end_date;

    /* set @临时_指令开始时间# = @指令开始时间#; */
    set v_tmp_comm_begin_time = v_comm_begin_time;

    /* set @临时_指令结束时间# = @指令结束时间#; */
    set v_tmp_comm_end_time = v_comm_end_time;

    /* set @计算方向# = 《计算方向-加上》; */
    set v_calc_dir = 1;

    /* 调用【原子_交易证券_公用_计算融资融券指令冻结金额和数量】*/
    call db_tdsecu.pra_tdsepb_GetFinaLoanCommFrozenAmtAndQty(
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
        v_calc_dir,
        v_comm_amt,
        v_error_code,
        v_error_info,
        v_comm_frozen_amt,
        v_comm_frozen_qty);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.3.96.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券指令冻结金额和数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @临时_指令冻结金额#=@指令冻结金额#; */
    set v_tmp_comm_frozen_amt=v_comm_frozen_amt;

    /* set @临时_指令冻结数量#=@指令冻结数量#; */
    set v_tmp_comm_frozen_qty=v_comm_frozen_qty;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_指令_锁定获取指令信息】*/
        call db_tdsecu.pra_tdseap_LockGetCommInfo(
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
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
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
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_strike_status,
            v_comm_status,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_comple_date,
            v_comm_comple_time,
            v_comm_appr_status,
            v_exter_comm_flag,
            v_strategy_capt_qty,
            v_strategy_order_qty,
            v_comm_oper_way,
            v_combo_code,
            v_combo_posi_id,
            v_target_stock_code,
            v_target_stock_code_no,
            v_contra_no,
            v_disp_status,
            v_exist_debt_flag);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.96.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_锁定获取指令信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #检查原指令状态

        /* [检查报错返回][@指令状态#=《指令状态-待撤销》 or @指令状态#=《指令状态-部分撤销》 or @指令状态#=《指令状态-全部撤销》 or @成交状态#=《成交状态-已成》 ][624][@指令状态#,@成交状态#] */
        if v_comm_status="4" or v_comm_status="5" or v_comm_status="6" or v_strike_status="3"  then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.96.624";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令状态=",v_comm_status,",","成交状态=",v_strike_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令状态=",v_comm_status,",","成交状态=",v_strike_status);
            end if;
            leave label_pro;
        end if;

        #考虑普通订单和策略订单对指令的影响

        /* [检查报错返回][@临时_指令数量# < (@策略占用数量# + @订单数量# -@策略订单数量#)][625][@指令数量#,@策略占用数量# + @订单数量# -@策略订单数量#] */
        if v_tmp_comm_qty < (v_strategy_capt_qty + v_order_qty -v_strategy_order_qty) then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.96.625";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令数量=",v_comm_qty,",","策略占用数量 + 订单数量 -策略订单数量=",v_strategy_capt_qty + v_order_qty -v_strategy_order_qty),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令数量=",v_comm_qty,",","策略占用数量 + 订单数量 -策略订单数量=",v_strategy_capt_qty + v_order_qty -v_strategy_order_qty);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][((@指令方向#=《指令方向-质押提交》) or (@指令方向#=《指令方向-质押转回》)) and (@临时_指令限价# = 0 or @临时_指令限价# <> @指令限价#)][623][@指令限价#] */
        if ((v_comm_dir=21) or (v_comm_dir=22)) and (v_tmp_comm_limit_price = 0 or v_tmp_comm_limit_price <> v_comm_limit_price) then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.96.623";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令限价=",v_comm_limit_price),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令限价=",v_comm_limit_price);
            end if;
            leave label_pro;
        end if;


        /* set @指令冻结金额#=(@临时_指令数量# - @订单数量#)/@临时_指令数量# *@临时_指令金额# - @指令冻结金额#; */
        set v_comm_frozen_amt=(v_tmp_comm_qty - v_order_qty)/v_tmp_comm_qty *v_tmp_comm_amt - v_comm_frozen_amt;
        #计算本次修改变动的指令数量和冻结金额

        /* set @指令数量#=@临时_指令数量# - @指令数量#; */
        set v_comm_qty=v_tmp_comm_qty - v_comm_qty;
        #交易证券子系统检查，检查指令可用资金、可用持仓等

        /* 调用【原子_交易证券_指令_校验融资融券新增指令】*/
        call db_tdsecu.pra_tdseap_CheckFinaLoanAddComm(
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
            v_asac_avail_amt,
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
            v_comm_dir,
            v_comm_qty,
            v_comm_frozen_amt,
            v_impawn_ratio,
            v_stock_type,
            v_fina_limit_max,
            v_loan_limit_max,
            v_fina_marg_ratio,
            v_secu_loan_marg_ratio,
            v_comm_amt,
            v_init_date,
            v_exgp_loan_sell_amt,
            v_asac_loan_sell_amt,
            v_asac_converted_margin,
            v_asac_fina_converted_pandl,
            v_asac_loan_converted_pandl,
            v_asac_fina_capt_margin,
            v_asac_loan_capt_margin,
            v_asac_keep_guarantee_ratio,
            v_exgp_converted_margin,
            v_exgp_fina_converted_pandl,
            v_exgp_loan_converted_pandl,
            v_exgp_fina_capt_margin,
            v_exgp_loan_capt_margin,
            v_exgp_keep_guarantee_ratio,
            v_exgp_debt_loan_sell_strike_qty,
            v_exgp_debt_fina_buy_strike_amt,
            v_asac_cmmd_converted_margin,
            v_asac_order_converted_margin,
            v_asac_curr_converted_margin,
            v_exgp_cmmd_converted_margin,
            v_exgp_order_converted_margin,
            v_exgp_curr_converted_margin,
            v_exgp_fina_comm_capt_margin,
            v_exgp_loan_comm_capt_margin,
            v_exgp_fina_order_capt_margin,
            v_exgp_loan_order_capt_margin,
            v_asac_fina_comm_capt_margin,
            v_asac_loan_comm_capt_margin,
            v_asac_fina_order_capt_margin,
            v_asac_loan_order_capt_margin,
            v_asac_fina_interest,
            v_asac_loan_interest,
            v_exgp_fina_interest,
            v_exgp_loan_interest,
            v_error_code,
            v_error_info,
            v_exist_debt_flag,
            v_debt_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.96.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_校验融资融券新增指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #风控子系统检查，检查指令端风控等

        /* set @变动金额#=@指令冻结金额#; */
        set v_occur_amt=v_comm_frozen_amt;

        /* set @变动数量#=@指令数量#; */
        set v_occur_qty=v_comm_qty;
        #指令修改

        /* set @指令数量#=@临时_指令数量#; */
        set v_comm_qty=v_tmp_comm_qty;

        /* set @指令限价#=@临时_指令限价#; */
        set v_comm_limit_price=v_tmp_comm_limit_price;

        /* set @指令金额#=@临时_指令金额#; */
        set v_comm_amt=v_tmp_comm_amt;

        /* set @指令实际限价#=@临时_指令实际限价#; */
        set v_limit_actual_price=v_tmp_limit_actual_price;

        /* set @指令开始日期# = @临时_指令开始日期#; */
        set v_comm_begin_date = v_tmp_comm_begin_date;

        /* set @指令结束日期# = @临时_指令结束日期#; */
        set v_comm_end_date = v_tmp_comm_end_date;

        /* set @指令开始时间# = @临时_指令开始时间#; */
        set v_comm_begin_time = v_tmp_comm_begin_time;

        /* set @指令结束时间# = @临时_指令结束时间#; */
        set v_comm_end_time = v_tmp_comm_end_time;

        /* 调用【原子_交易证券_指令_修改指令】*/
        call db_tdsecu.pra_tdseap_ModiComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_stock_type,
            v_comm_id,
            v_comm_limit_price,
            v_limit_actual_price,
            v_comm_qty,
            v_comm_amt,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_par_value,
            v_impawn_ratio,
            v_net_price_flag,
            v_bond_accr_intrst,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_modi_info,
            v_read_flag,
            v_comm_remark_info,
            v_error_code,
            v_error_info,
            v_comm_occur_amt,
            v_comm_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.96.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_修改指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @指令变动金额# <> 0 or @指令变动数量# <> 0 then */
        if v_comm_occur_amt <> 0 or v_comm_occur_qty <> 0 then
            #处理资金持仓数据

            /* 调用【原子_交易证券_账户_更新指令资金持仓】*/
            call db_tdsecu.pra_tdseac_UpdateApprCashPosi(
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
                v_comm_id,
                v_comm_dir,
                v_exch_crncy_type,
                v_exch_no,
                v_stock_code,
                v_asset_type,
                v_stock_type,
                v_impawn_ratio,
                v_stock_acco_no,
                v_stock_code_no,
                v_trade_code_no,
                v_target_code_no,
                v_comm_occur_amt,
                v_comm_occur_qty,
                v_is_record_jour,
                v_combo_code,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.96.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令资金持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @交易变动金额# = 0; */
            set v_trade_occur_amt = 0;

            /* set @交易变动数量# = 0; */
            set v_trade_occur_qty = 0;

            /* 调用【原子_交易证券_账户_更新融资融券指令交易资金持仓负债】*/
            call db_tdsecu.pra_tdseac_UpdateFinaLoanApprDebt(
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
                v_exch_crncy_type,
                v_comm_id,
                v_exch_no,
                v_stock_code,
                v_stock_type,
                v_asset_type,
                v_invest_type,
                v_order_dir,
                v_stock_acco_no,
                v_stock_code_no,
                v_trade_code_no,
                v_comm_occur_amt,
                v_comm_occur_qty,
                v_trade_occur_amt,
                v_trade_occur_qty,
                v_is_record_jour,
                v_debt_qty,
                v_error_code,
                v_error_info,
                v_debt_type);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.96.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新融资融券指令交易资金持仓负债出现错误！',v_mysql_message);
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

    #指令价格为0时不限价不应该撤订单

    /* [检查正常返回][@指令限价# = 0] */
    if v_comm_limit_price = 0 then
        leave label_pro;
    end if;

    #采用循环更新获取订单的方式，避免加锁时间长和并发问题

    /* set @订单序号串# = ""; */
    set v_order_id_str = "";

    /* set @撤单序号串# = ""; */
    set v_wtdraw_id_str = "";

    /* set @记录序号# = 0; */
    set v_row_id = 0;
    loop_label:loop

        /* [事务开始] */
        START TRANSACTION;


        /* 调用【原子_交易证券_交易_锁定获取指令修改订单】*/
        call db_tdsecu.pra_tdsetd_LockGetCommModiOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_comm_id,
            v_limit_actual_price,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_row_id,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_trade_code_no,
            v_target_code_no,
            v_asset_type,
            v_stock_type,
            v_comm_opor,
            v_external_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_batch_no,
            v_order_id,
            v_order_date,
            v_order_time,
            v_order_dir,
            v_price_type,
            v_order_price,
            v_order_qty,
            v_order_status,
            v_wtdraw_qty,
            v_strike_amt,
            v_strike_qty,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_order_oper_way,
            v_busi_opor_no,
            v_trade_acco);

        /* if @错误编码#="0" then */
        if v_error_code="0" then

            /* set @记录序号# = @订单序号#; */
            set v_row_id = v_order_id;

            /* set @撤单批号# = 0; */
            set v_wtdraw_batch_no = 0;

            /* set @撤单说明# = "指令修改撤销指令订单！"; */
            set v_wtdraw_remark = "指令修改撤销指令订单！";

            /* 调用【原子_交易证券_指令_撤销融资融券指令订单】*/
            call db_tdsecu.pra_tdseap_CancelFinaLoanCommOrder(
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
                v_out_acco,
                v_exch_crncy_type,
                v_exch_no,
                v_stock_acco_no,
                v_stock_acco,
                v_stock_code_no,
                v_stock_code,
                v_target_code_no,
                v_trade_code_no,
                v_stock_type,
                v_asset_type,
                v_comm_id,
                v_external_no,
                v_order_batch_no,
                v_order_date,
                v_report_no,
                v_order_id,
                v_order_dir,
                v_order_price,
                v_order_qty,
                v_order_status,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_impawn_ratio,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_wtdraw_batch_no,
                v_wtdraw_remark,
                v_order_oper_way,
                v_busi_opor_no,
                v_is_record_jour,
                v_target_stock_code_no,
                v_trade_acco,
                v_error_code,
                v_error_info,
                v_frozen_amt,
                v_wtdraw_status,
                v_wtdraw_qty,
                v_wtdraw_id);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.96.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销融资融券指令订单出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @订单序号串# = concat(@订单序号串#,@订单序号#,";"); */
            set v_order_id_str = concat(v_order_id_str,v_order_id,";");

            /* if @撤单序号# > 0 and @撤单状态# <> 《撤单状态-成功》 then */
            if v_wtdraw_id > 0 and v_wtdraw_status <> "3" then

                /* set @撤单序号串# = concat(@撤单序号串#,@撤单序号#,";"); */
                set v_wtdraw_id_str = concat(v_wtdraw_id_str,v_wtdraw_id,";");
            end if;
        else

            /* set @错误编码#="0"; */
            set v_error_code="0";

            /* set @错误信息#=' '; */
            set v_error_info=' ';
            ROLLBACK;
            leave loop_label;
        end if;

        /* [事务结束] */
        COMMIT;

         #处理汇总订单

         /* [事务开始] */
         START TRANSACTION;


             /* if @撤单数量# > 0 then */
             if v_wtdraw_qty > 0 then

                  /* set @废单数量# = 0; */
                  set v_waste_qty = 0;

                 /* 调用【原子_交易证券_交易_撤单处理汇总订单】*/
                 call db_tdsecu.pra_tdsetd_CancelDealSumOrder(
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
                     v_order_date,
                     v_order_batch_no,
                     v_wtdraw_qty,
                     v_waste_qty,
                     v_order_oper_way,
                     v_error_code,
                     v_error_info);
                 if v_error_code = "1" then
                     SET v_error_code = "tdsecuT.3.96.999";
                     if v_mysql_message <> "" then
                          SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤单处理汇总订单出现错误！',v_mysql_message);
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

    end loop;

    /* if @指令方向# = 《指令方向-融资买入》 or @指令方向# = 《指令方向-卖券还款》 or @指令方向# = 《指令方向-直接还款》 then */
    if v_comm_dir = 5 or v_comm_dir = 7 or v_comm_dir = 14 then

        /* set @负债类型# = 《负债类型-融资》; */
        set v_debt_type = 1;
    else

        /* set @负债类型# = 《负债类型-融券》; */
        set v_debt_type = 2;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_date = v_comm_date;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_status = v_comm_status;
    SET p_comm_opor = v_comm_opor;
    SET p_comm_occur_amt = v_comm_occur_amt;
    SET p_comm_occur_qty = v_comm_occur_qty;
    SET p_order_id_str = v_order_id_str;
    SET p_wtdraw_id_str = v_wtdraw_id_str;
    SET p_debt_type = v_debt_type;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_指令_新分发指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseap_NewDispComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseap_NewDispComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_comm_id bigint,
    IN p_comm_executor int,
    IN p_disp_remark varchar(255),
    IN p_is_withdraw int,
    IN p_disp_status int,
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_pass_no int,
    IN p_asset_acco_type int,
    IN p_out_acco varchar(32),
    IN p_cost_calc_type int,
    IN p_asac_busi_config_str varchar(64),
    IN p_compli_trig_id bigint,
    IN p_all_fee decimal(18,4),
    IN p_comm_dir int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_co_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_no int,
    OUT p_comm_date int,
    OUT p_comm_batch_no int,
    OUT p_comm_status varchar(2),
    OUT p_strike_status varchar(2),
    OUT p_comm_qty decimal(18,2),
    OUT p_order_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_comm_cancel_qty decimal(18,2),
    OUT p_before_comm_executor int,
    OUT p_order_id_str varchar(2048),
    OUT p_wtdraw_id_str varchar(2048),
    OUT p_target_code_no int,
    OUT p_trade_code_no int,
    OUT p_order_id bigint,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_price_type int,
    OUT p_order_oper_way varchar(2),
    OUT p_order_batch_no int,
    OUT p_order_status varchar(2),
    OUT p_order_frozen_qty decimal(18,2)
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
    declare v_comm_id bigint;
    declare v_comm_executor int;
    declare v_disp_remark varchar(255);
    declare v_is_withdraw int;
    declare v_disp_status int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_pass_no int;
    declare v_asset_acco_type int;
    declare v_out_acco varchar(32);
    declare v_cost_calc_type int;
    declare v_asac_busi_config_str varchar(64);
    declare v_compli_trig_id bigint;
    declare v_all_fee decimal(18,4);
    declare v_comm_dir int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_co_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_status varchar(2);
    declare v_strike_status varchar(2);
    declare v_comm_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_before_comm_executor int;
    declare v_order_id_str varchar(2048);
    declare v_wtdraw_id_str varchar(2048);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_price_type int;
    declare v_order_oper_way varchar(2);
    declare v_order_batch_no int;
    declare v_order_status varchar(2);
    declare v_order_frozen_qty decimal(18,2);
    declare v_tmp_comm_executor int;
    declare v_is_record_jour int;
    declare v_tmp_disp_status int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_tmp_comm_frozen_amt decimal(18,4);
    declare v_tmp_comm_frozen_qty decimal(18,2);
    declare v_tmp_comm_occur_amt decimal(18,4);
    declare v_tmp_comm_occur_qty decimal(18,2);
    declare v_open_close_permission int;
    declare v_order_dir int;
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_exch_crncy_type varchar(3);
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_time int;
    declare v_comm_opor int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_amt decimal(18,4);
    declare v_strike_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_appr_status varchar(2);
    declare v_exter_comm_flag int;
    declare v_strategy_capt_qty decimal(18,2);
    declare v_strategy_order_qty decimal(18,2);
    declare v_comm_oper_way varchar(2);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_contra_no varchar(32);
    declare v_exist_debt_flag int;
    declare v_disp_flag int;
    declare v_comm_occur_qty decimal(18,2);
    declare v_comm_occur_amt decimal(18,4);
    declare v_mach_time int;
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_price decimal(16,9);
    declare v_appr_allow_order_flag int;
    declare v_calc_dir int;
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_pass_status varchar(2);
    declare v_update_times int;
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_waste_qty decimal(18,2);
    declare v_busi_opor_no int;
    declare v_avail_cal_flag int;
    declare v_open_posi_date int;
    declare v_row_id bigint;
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_remark varchar(255);
    declare v_frozen_amt decimal(18,4);
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
    SET v_init_date = p_init_date;
    SET v_comm_id = p_comm_id;
    SET v_comm_executor = p_comm_executor;
    SET v_disp_remark = p_disp_remark;
    SET v_is_withdraw = p_is_withdraw;
    SET v_disp_status = p_disp_status;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_pass_no = p_pass_no;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_out_acco = p_out_acco;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_all_fee = p_all_fee;
    SET v_comm_dir = p_comm_dir;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_co_no = p_co_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_batch_no = 0;
    SET v_comm_status = "0";
    SET v_strike_status = "0";
    SET v_comm_qty = 0;
    SET v_order_qty = 0;
    SET v_strike_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_before_comm_executor = 0;
    SET v_order_id_str = " ";
    SET v_wtdraw_id_str = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_order_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_price_type = 0;
    SET v_order_oper_way = " ";
    SET v_order_batch_no = 0;
    SET v_order_status = "0";
    SET v_order_frozen_qty = 0;
    SET v_tmp_comm_executor = 0;
    SET v_is_record_jour = 1;
    SET v_tmp_disp_status = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_tmp_comm_frozen_amt = 0;
    SET v_tmp_comm_frozen_qty = 0;
    SET v_tmp_comm_occur_amt = 0;
    SET v_tmp_comm_occur_qty = 0;
    SET v_open_close_permission = 0;
    SET v_order_dir = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_opor = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_amt = 0;
    SET v_strike_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_status = " ";
    SET v_exter_comm_flag = 0;
    SET v_strategy_capt_qty = 0;
    SET v_strategy_order_qty = 0;
    SET v_comm_oper_way = " ";
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_contra_no = " ";
    SET v_exist_debt_flag = 0;
    SET v_disp_flag = 0;
    SET v_comm_occur_qty = 0;
    SET v_comm_occur_amt = 0;
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_external_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_price = 0;
    SET v_appr_allow_order_flag = 0;
    SET v_calc_dir = 1;
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;
    SET v_order_frozen_amt = 0;
    SET v_remark_info = " ";
    SET v_pass_status = "0";
    SET v_update_times = 1;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_wtdraw_qty = 0;
    SET v_waste_qty = 0;
    SET v_busi_opor_no = 0;
    SET v_avail_cal_flag = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_row_id = 0;
    SET v_wtdraw_batch_no = 0;
    SET v_wtdraw_remark = " ";
    SET v_frozen_amt = 0;
    SET v_wtdraw_status = "0";
    SET v_wtdraw_id = 0;

    
    label_pro:BEGIN
    

    /* set @临时_指令执行人#=@指令执行人#; */
    set v_tmp_comm_executor=v_comm_executor;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @临时_分发状态# = @分发状态#; */
    set v_tmp_disp_status = v_disp_status;

    /* set @登记机构# = " "; */
    set v_registration_agency = " ";

    /* set @交易账户# = " "; */
    set v_trade_acco = " ";

    /* set @临时_指令冻结金额#=0; */
    set v_tmp_comm_frozen_amt=0;

    /* set @临时_指令冻结数量#=0; */
    set v_tmp_comm_frozen_qty=0;

    /* set @临时_指令变动金额#=0; */
    set v_tmp_comm_occur_amt=0;

    /* set @临时_指令变动数量#=0; */
    set v_tmp_comm_occur_qty=0;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;
    #如果自动审批，需做相应检查处理，并获取指令批号

    /* set @订单方向# = @指令方向#; */
    set v_order_dir = v_comm_dir;

    /* if (substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-自动审批》 or  substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-不设置》 ) and substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》  then */
    if (substring(v_asac_busi_config_str,5,1)=1 or  substring(v_asac_busi_config_str,5,1)=3 ) and substring(v_asac_busi_config_str,6,1)=1  then

        /* if @订单方向#=《订单方向-新股申购》 or  @订单方向#=《订单方向-配售申购》  then */
        if v_order_dir=11 or  v_order_dir=23  then

            /* 调用【原子_交易证券_交易_检查证券申购重复】*/
            call db_tdsecu.pra_tdsetd_CheckPurcDup(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_exch_group_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.3.97.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_检查证券申购重复出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        end if;
        #获取订单批号

        /* set @编号类型#=《编号类型-订单批号》; */
        set v_record_no_type=18;

        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_交易证券_公用_获取业务记录编号】*/
            call db_tdsecu.pra_tdsepb_GetCoBusiRecordNo(
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
                SET v_error_code = "tdsecuT.3.97.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


        /* [事务结束] */
        COMMIT;


        /* set @订单批号#=@当前编号#; */
        set v_order_batch_no=v_curr_no;
    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_指令_锁定获取指令信息】*/
        call db_tdsecu.pra_tdseap_LockGetCommInfo(
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
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
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
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_strike_status,
            v_comm_status,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_comple_date,
            v_comm_comple_time,
            v_comm_appr_status,
            v_exter_comm_flag,
            v_strategy_capt_qty,
            v_strategy_order_qty,
            v_comm_oper_way,
            v_combo_code,
            v_combo_posi_id,
            v_target_stock_code,
            v_target_stock_code_no,
            v_contra_no,
            v_disp_status,
            v_exist_debt_flag);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.97.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_锁定获取指令信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* [检查报错返回][@临时_指令执行人#=@指令执行人# and @临时_指令执行人# <> 0][721][@临时_指令执行人#, @指令执行人#] */
        if v_tmp_comm_executor=v_comm_executor and v_tmp_comm_executor <> 0 then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.97.721";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("临时_指令执行人=",v_tmp_comm_executor,","," 指令执行人=", v_comm_executor),"#",v_mysql_message);
            else
                SET v_error_info = concat("临时_指令执行人=",v_tmp_comm_executor,","," 指令执行人=", v_comm_executor);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@指令状态#=《指令状态-全部撤销》 or @指令状态#=《指令状态-全部执行》 or  @指令状态#=《指令状态-待撤销》 or @指令状态#=《指令状态-暂停执行》][724][@指令状态#] */
        if v_comm_status="6" or v_comm_status="3" or  v_comm_status="4" or v_comm_status="7" then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.97.724";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令状态=",v_comm_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令状态=",v_comm_status);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@成交状态#=《成交状态-已成》][725][@成交状态#] */
        if v_strike_status="3" then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.97.725";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("成交状态=",v_strike_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("成交状态=",v_strike_status);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@分发状态# =《分发状态-分发拒绝》 or (@分发状态# = 《分发状态-分发通过》 and @临时_分发状态# = 《分发状态-分发拒绝》)][724][@分发状态#] */
        if v_disp_status =2 or (v_disp_status = 1 and v_tmp_disp_status = 2) then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.97.724";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("分发状态=",v_disp_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("分发状态=",v_disp_status);
            end if;
            leave label_pro;
        end if;

        #控制先审批后，才能转发

        /* [检查报错返回][@指令审批状态#=《指令审批状态-未审批》 or  @指令审批状态#=《指令审批状态-审批拒绝》][626][@指令审批状态#] */
        if v_comm_appr_status="1" or  v_comm_appr_status="3" then
            ROLLBACK;
            SET v_error_code = "tdsecuT.3.97.626";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令审批状态=",v_comm_appr_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令审批状态=",v_comm_appr_status);
            end if;
            leave label_pro;
        end if;


        /* set @前指令执行人#=@指令执行人#; */
        set v_before_comm_executor=v_comm_executor;

        /* set @指令执行人#=@临时_指令执行人#; */
        set v_comm_executor=v_tmp_comm_executor;

        /* set @分发方式# =《分发方式-手动分发》; */
        set v_disp_flag =2;

        /* set @分发状态# = @临时_分发状态#; */
        set v_disp_status = v_tmp_disp_status;

        /* 调用【原子_交易证券_指令_新分发指令】*/
        call db_tdsecu.pra_tdseap_NewDispComm(
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
            v_asset_type,
            v_comm_date,
            v_comm_id,
            v_comm_qty,
            v_comm_amt,
            v_comm_limit_price,
            v_limit_actual_price,
            v_order_qty,
            v_comm_cancel_qty,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_net_price_flag,
            v_par_value,
            v_comm_batch_no,
            v_comm_dir,
            v_comm_status,
            v_comm_executor,
            v_disp_flag,
            v_disp_remark,
            v_before_comm_executor,
            v_is_withdraw,
            v_exter_comm_flag,
            v_disp_status,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_error_code,
            v_error_info,
            v_comm_occur_qty,
            v_comm_occur_amt);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.97.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_新分发指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @临时_指令变动金额# =  @临时_指令变动金额#+@指令变动金额#; */
        set v_tmp_comm_occur_amt =  v_tmp_comm_occur_amt+v_comm_occur_amt;

        /* set @临时_指令变动数量# =  @临时_指令变动数量#+@指令变动数量#; */
        set v_tmp_comm_occur_qty =  v_tmp_comm_occur_qty+v_comm_occur_qty;

        /* [获取机器时间][@机器时间#] */
        select date_format(curtime(),'%H%i%s') into v_mach_time;


        /* if substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 and ((@指令结束日期# = @初始化日期# and @指令结束时间# >= @机器时间#) or (@指令结束日期# < @初始化日期#)) and @指令执行人# > 0 then */
        if substring(v_asac_busi_config_str,6,1)=1 and ((v_comm_end_date = v_init_date and v_comm_end_time >= v_mach_time) or (v_comm_end_date < v_init_date)) and v_comm_executor > 0 then
            #设置订单相关字段值

            /* set @外部编号#=0; */
            set v_external_no=0;

            /* set @申报日期# = 0; */
            set v_report_date = 0;

            /* set @申报时间# = 0; */
            set v_report_time = 0;

            /* set @申报编号# = " "; */
            set v_report_no = " ";

            /* if @指令执行人# > 0 then */
            if v_comm_executor > 0 then

                /* set @订单日期#=@初始化日期#; */
                set v_order_date=v_init_date;

                /* set @价格类型#=《价格类型-限价》; */
                set v_price_type=1;

                /* set @订单方向#=@指令方向#; */
                set v_order_dir=v_comm_dir;

                /* set @订单数量#=@指令数量#; */
                set v_order_qty=v_comm_qty;

                /* set @订单价格#=@指令实际限价#; */
                set v_order_price=v_limit_actual_price;

                /* set @审批通过自动下单# = 《审批通过自动下单-是》; */
                set v_appr_allow_order_flag = 1;
                #先反向更新指令

                /* set @计算方向# = 《计算方向-减去》; */
                set v_calc_dir = -1;

                /* 调用【原子_交易证券_公用_计算指令冻结金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetCommFrozenAmtAndQty(
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
                    v_calc_dir,
                    v_error_code,
                    v_error_info,
                    v_comm_frozen_amt,
                    v_comm_frozen_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.97.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令冻结金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @临时_指令冻结金额# = @临时_指令冻结金额# + @指令冻结金额#; */
                set v_tmp_comm_frozen_amt = v_tmp_comm_frozen_amt + v_comm_frozen_amt;

                /* set @临时_指令冻结数量# = @临时_指令冻结数量# + @指令冻结数量#; */
                set v_tmp_comm_frozen_qty = v_tmp_comm_frozen_qty + v_comm_frozen_qty;

                /* 调用【原子_交易证券_指令_下单更新指令】*/
                call db_tdsecu.pra_tdseap_OrderUpdateComm(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_comm_id,
                    v_comm_frozen_amt,
                    v_comm_frozen_qty,
                    v_order_qty,
                    v_error_code,
                    v_error_info,
                    v_limit_actual_price,
                    v_exter_comm_flag,
                    v_comm_comple_date,
                    v_comm_comple_time,
                    v_comm_status,
                    v_strike_status);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.97.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_下单更新指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #计算交易冻结金额

                /* 调用【原子_交易证券_公用_计算交易冻结金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetExchFrozenAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_order_dir,
                    v_order_price,
                    v_order_qty,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_all_fee,
                    v_error_code,
                    v_error_info,
                    v_trade_frozen_amt,
                    v_trade_frozen_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.97.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算交易冻结金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @订单冻结金额#=@交易冻结金额#; */
                set v_order_frozen_amt=v_trade_frozen_amt;

                /* set @订单冻结数量#=@交易冻结数量#; */
                set v_order_frozen_qty=v_trade_frozen_qty;

                /* set @备注信息#="指令自动审批后自动执行！"; */
                set v_remark_info="指令自动审批后自动执行！";
                #根据报盘机状态，设置订单状态 如果通道是允许报送状态,则直接将订单状态设为"待报"

                /* set @订单状态# = 《订单状态-未报》; */
                set v_order_status = "1";

                /* 调用【原子_交易证券_公用_获取通道状态】*/
                call db_tdsecu.pra_tdsepb_GetChannelStatus(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_pass_no,
                    v_error_code,
                    v_error_info,
                    v_pass_status);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.97.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取通道状态出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* if @通道状态# = "1" then */
                if v_pass_status = "1" then

                    /* set @订单状态# = 《订单状态-待报》; */
                    set v_order_status = "a";
                end if;

                /* set @订单操作方式# = 《订单操作方式-审批后自动下单》; */
                set v_order_oper_way = "40";

                /* set @组合代码# = " "; */
                set v_combo_code = " ";

                /* set @组合持仓序号# = 0; */
                set v_combo_posi_id = 0;

                /* set @操作员编号# =@指令执行人#; */
                set v_opor_no =v_comm_executor;

                /* 调用【原子_交易证券_交易_新增订单】*/
                call db_tdsecu.pra_tdsetd_AddOrder(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_init_date,
                    v_co_no,
                    v_comm_opor,
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
                    v_target_code_no,
                    v_trade_code_no,
                    v_stock_type,
                    v_asset_type,
                    v_external_no,
                    v_comm_id,
                    v_comm_batch_no,
                    v_order_batch_no,
                    v_order_date,
                    v_order_dir,
                    v_price_type,
                    v_order_price,
                    v_order_qty,
                    v_order_status,
                    v_report_date,
                    v_report_time,
                    v_report_no,
                    v_order_frozen_amt,
                    v_order_frozen_qty,
                    v_net_price_flag,
                    v_intrst_days,
                    v_par_value,
                    v_impawn_ratio,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_compli_trig_id,
                    v_remark_info,
                    v_order_oper_way,
                    v_exter_comm_flag,
                    v_cost_calc_type,
                    v_combo_code,
                    v_combo_posi_id,
                    v_target_stock_code,
                    v_target_stock_code_no,
                    v_registration_agency,
                    v_trade_acco,
                    v_contra_no,
                    v_asset_acco_type,
                    v_exist_debt_flag,
                    v_error_code,
                    v_error_info,
                    v_order_id,
                    v_order_time,
                    v_update_times);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.97.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增订单出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #计算指令变动金额和数量

                /* set @计算方向# = 《计算方向-减去》; */
                set v_calc_dir = -1;

                /* 调用【原子_交易证券_公用_计算指令变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetCommOccurAmtAndQty(
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
                    v_calc_dir,
                    v_error_code,
                    v_error_info,
                    v_comm_occur_amt,
                    v_comm_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.97.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @临时_指令变动金额# = @临时_指令变动金额# + @指令变动金额#; */
                set v_tmp_comm_occur_amt = v_tmp_comm_occur_amt + v_comm_occur_amt;

                /* set @临时_指令变动数量# = @临时_指令变动数量# + @指令变动数量#; */
                set v_tmp_comm_occur_qty = v_tmp_comm_occur_qty + v_comm_occur_qty;
                #计算下单交易变动金额和数量

                /* 调用【原子_交易证券_公用_计算下单交易变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetOrderTradeOccurAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_order_dir,
                    v_order_qty,
                    v_order_price,
                    v_order_frozen_amt,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_error_code,
                    v_error_info,
                    v_trade_occur_amt,
                    v_trade_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.97.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算下单交易变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #modify by wjp 20181101

                /* if @订单批号# > 0  then */
                if v_order_batch_no > 0  then

                    /* set @撤单数量# = 0; */
                    set v_wtdraw_qty = 0;

                    /* set @废单数量# = 0; */
                    set v_waste_qty = 0;

                   /* 调用【原子_交易证券_交易_订单处理汇总订单】*/
                   call db_tdsecu.pra_tdsetd_OrderDealSumOrder(
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
                       v_exch_crncy_type,
                       v_exch_no,
                       v_stock_code_no,
                       v_stock_code,
                       v_trade_code_no,
                       v_target_code_no,
                       v_stock_type,
                       v_asset_type,
                       v_external_no,
                       v_order_date,
                       v_order_batch_no,
                       v_order_dir,
                       v_price_type,
                       v_order_price,
                       v_order_qty,
                       v_order_status,
                       v_wtdraw_qty,
                       v_waste_qty,
                       v_net_price_flag,
                       v_intrst_days,
                       v_par_value,
                       v_bond_accr_intrst,
                       v_bond_rate_type,
                       v_impawn_ratio,
                       v_order_oper_way,
                       v_exter_comm_flag,
                       v_error_code,
                       v_error_info);
                   if v_error_code = "1" then
                       SET v_error_code = "tdsecuT.3.97.999";
                       if v_mysql_message <> "" then
                            SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_订单处理汇总订单出现错误！',v_mysql_message);
                       end if;
                       ROLLBACK;
                       leave label_pro;
                   elseif v_error_code <> "0" then
                       ROLLBACK;
                       leave label_pro;
                   end if;

                end if;
            end if;
        end if;
        #处理订单资金持仓数据，保护指令变动和交易的变动

        /* set @指令变动金额# = @临时_指令变动金额#; */
        set v_comm_occur_amt = v_tmp_comm_occur_amt;

        /* set @指令变动数量# = @临时_指令变动数量#; */
        set v_comm_occur_qty = v_tmp_comm_occur_qty;

        /* set @业务操作员编号# = @指令执行人#; */
        set v_busi_opor_no = v_comm_executor;

        /* set @可用计算标志# = 0; */
        set v_avail_cal_flag = 0;

        /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
        call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
            v_exch_crncy_type,
            v_comm_id,
            v_order_id,
            v_exch_no,
            v_stock_code,
            v_stock_type,
            v_asset_type,
            v_order_dir,
            v_impawn_ratio,
            v_stock_acco_no,
            v_stock_code_no,
            v_trade_code_no,
            v_target_code_no,
            v_comm_occur_amt,
            v_comm_occur_qty,
            v_trade_occur_amt,
            v_trade_occur_qty,
            v_is_record_jour,
            v_order_oper_way,
            v_busi_opor_no,
            v_open_close_permission,
            v_avail_cal_flag,
            v_combo_code,
            v_combo_posi_id,
            v_target_stock_code_no,
            v_error_code,
            v_error_info,
            v_open_posi_date);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.3.97.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @订单序号串# = ""; */
    set v_order_id_str = "";

    /* set @撤单序号串# = ""; */
    set v_wtdraw_id_str = "";

    /* if @是否撤单#=《是否撤单-是》 then */
    if v_is_withdraw=1 then
        #采用循环更新获取订单的方式，避免加锁时间长和并发问题

        /* set @记录序号# = 0; */
        set v_row_id = 0;
        loop_label:loop

            /* [事务开始] */
            START TRANSACTION;


            /* 调用【原子_交易证券_交易_锁定获取指令订单】*/
            call db_tdsecu.pra_tdsetd_LockGetCommOrder(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_comm_id,
                v_row_id,
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
                v_target_code_no,
                v_trade_code_no,
                v_stock_type,
                v_asset_type,
                v_comm_opor,
                v_external_no,
                v_report_date,
                v_report_time,
                v_report_no,
                v_order_batch_no,
                v_order_id,
                v_order_date,
                v_order_time,
                v_order_dir,
                v_price_type,
                v_order_price,
                v_order_qty,
                v_order_status,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_all_fee,
                v_wtdraw_qty,
                v_strike_amt,
                v_strike_qty,
                v_impawn_ratio,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_order_oper_way,
                v_busi_opor_no,
                v_target_stock_code_no,
                v_trade_acco);

            /* if @错误编码#="0" then */
            if v_error_code="0" then

                /* set @记录序号# = @订单序号#; */
                set v_row_id = v_order_id;

                /* set @撤单批号# = 0; */
                set v_wtdraw_batch_no = 0;

                /* set @撤单说明# = "指令分发撤销指令订单！"; */
                set v_wtdraw_remark = "指令分发撤销指令订单！";

                /* 调用【原子_交易证券_指令_撤销指令订单】*/
                call db_tdsecu.pra_tdseap_CancelCommOrder(
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
                    v_out_acco,
                    v_exch_crncy_type,
                    v_exch_no,
                    v_stock_acco_no,
                    v_stock_acco,
                    v_stock_code_no,
                    v_stock_code,
                    v_target_code_no,
                    v_trade_code_no,
                    v_stock_type,
                    v_asset_type,
                    v_comm_id,
                    v_external_no,
                    v_order_batch_no,
                    v_order_date,
                    v_report_no,
                    v_order_id,
                    v_order_dir,
                    v_order_price,
                    v_order_qty,
                    v_order_status,
                    v_order_frozen_amt,
                    v_order_frozen_qty,
                    v_impawn_ratio,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_wtdraw_batch_no,
                    v_wtdraw_remark,
                    v_order_oper_way,
                    v_busi_opor_no,
                    v_is_record_jour,
                    v_target_stock_code_no,
                    v_trade_acco,
                    v_error_code,
                    v_error_info,
                    v_frozen_amt,
                    v_wtdraw_status,
                    v_wtdraw_qty,
                    v_wtdraw_id);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.3.97.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销指令订单出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @订单序号串# = concat(@订单序号串#,@订单序号#,";"); */
                set v_order_id_str = concat(v_order_id_str,v_order_id,";");

                /* if @撤单序号# > 0 and @撤单状态# <> 《撤单状态-成功》 then */
                if v_wtdraw_id > 0 and v_wtdraw_status <> "3" then

                    /* set @撤单序号串# = concat(@撤单序号串#,@撤单序号#,";"); */
                    set v_wtdraw_id_str = concat(v_wtdraw_id_str,v_wtdraw_id,";");
                end if;
            else

                /* set @错误编码#="0"; */
                set v_error_code="0";

                /* set @错误信息#=' '; */
                set v_error_info=' ';
                ROLLBACK;
                leave loop_label;
            end if;

            /* [事务结束] */
            COMMIT;

            #处理汇总订单

            /* [事务开始] */
            START TRANSACTION;


                /* if @撤单数量# > 0 then */
                if v_wtdraw_qty > 0 then

                    /* set @废单数量# = 0; */
                    set v_waste_qty = 0;

                    /* 调用【原子_交易证券_交易_撤单处理汇总订单】*/
                    call db_tdsecu.pra_tdsetd_CancelDealSumOrder(
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
                        v_order_date,
                        v_order_batch_no,
                        v_wtdraw_qty,
                        v_waste_qty,
                        v_order_oper_way,
                        v_error_code,
                        v_error_info);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.3.97.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤单处理汇总订单出现错误！',v_mysql_message);
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

        end loop;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_no = v_pd_no;
    SET p_comm_date = v_comm_date;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_status = v_comm_status;
    SET p_strike_status = v_strike_status;
    SET p_comm_qty = v_comm_qty;
    SET p_order_qty = v_order_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_comm_cancel_qty = v_comm_cancel_qty;
    SET p_before_comm_executor = v_before_comm_executor;
    SET p_order_id_str = v_order_id_str;
    SET p_wtdraw_id_str = v_wtdraw_id_str;
    SET p_target_code_no = v_target_code_no;
    SET p_trade_code_no = v_trade_code_no;
    SET p_order_id = v_order_id;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_price_type = v_price_type;
    SET p_order_oper_way = v_order_oper_way;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_status = v_order_status;
    SET p_order_frozen_qty = v_order_frozen_qty;

END;;


