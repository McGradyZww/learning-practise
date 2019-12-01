DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_新增订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_AddOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_AddOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_opor int,
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
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_asset_type int,
    IN p_stock_type int,
    IN p_busi_limit_str varchar(2048),
    IN p_exgp_busi_config_str varchar(64),
    IN p_exgp_avail_amt decimal(18,4),
    IN p_exgp_T_hk_buy_total_amt decimal(18,4),
    IN p_exgp_T_hk_sell_total_amt decimal(18,4),
    IN p_exgp_T1_hk_buy_total_amt decimal(18,4),
    IN p_exgp_T1_hk_sell_total_amt decimal(18,4),
    IN p_asac_busi_config_str varchar(64),
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
    IN p_market_price_ratio decimal(18,12),
    IN p_comm_id bigint,
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    IN p_all_fee decimal(18,4),
    IN p_par_value decimal(16,9),
    IN p_intrst_days int,
    IN p_impawn_ratio decimal(18,12),
    IN p_net_price_flag int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_min_unit int,
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_last_price decimal(16,9),
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_order_oper_way varchar(2),
    IN p_cost_calc_type int,
    IN p_compli_trig_id bigint,
    IN p_order_limit_time int,
    IN p_order_ctrl_qty decimal(18,2),
    IN p_order_ctrl_amt decimal(18,4),
    IN p_open_close_permission int,
    IN p_per_secu_posi_ratio decimal(18,12),
    IN p_combo_code varchar(32),
    IN p_combo_posi_id bigint,
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
    IN p_co_busi_config_str varchar(64),
    IN p_asset_acco_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_id bigint,
    OUT p_order_status varchar(2),
    OUT p_order_date int,
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_comm_batch_no int,
    OUT p_order_time int,
    OUT p_comm_date int,
    OUT p_comm_executor int,
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
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
    declare v_comm_opor int;
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
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_busi_limit_str varchar(2048);
    declare v_exgp_busi_config_str varchar(64);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_asac_busi_config_str varchar(64);
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
    declare v_market_price_ratio decimal(18,12);
    declare v_comm_id bigint;
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_all_fee decimal(18,4);
    declare v_par_value decimal(16,9);
    declare v_intrst_days int;
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_order_oper_way varchar(2);
    declare v_cost_calc_type int;
    declare v_compli_trig_id bigint;
    declare v_order_limit_time int;
    declare v_order_ctrl_qty decimal(18,2);
    declare v_order_ctrl_amt decimal(18,4);
    declare v_open_close_permission int;
    declare v_per_secu_posi_ratio decimal(18,12);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
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
    declare v_co_busi_config_str varchar(64);
    declare v_asset_acco_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_id bigint;
    declare v_order_status varchar(2);
    declare v_order_date int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_comm_batch_no int;
    declare v_order_time int;
    declare v_comm_date int;
    declare v_comm_executor int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_update_times int;
    declare v_exter_comm_flag int;
    declare v_is_record_jour int;
    declare v_exist_debt_flag int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_contra_no varchar(32);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_oper_way varchar(2);
    declare v_comm_amt decimal(18,4);
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_frozen_amt decimal(18,4);
    declare v_frozen_qty decimal(18,2);
    declare v_comm_dir int;
    declare v_comm_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_status varchar(2);
    declare v_strike_status varchar(2);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_pass_status varchar(2);
    declare v_nav_asset decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_remark_info varchar(255);
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
    SET v_comm_opor = p_comm_opor;
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
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_asset_type = p_asset_type;
    SET v_stock_type = p_stock_type;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_exgp_busi_config_str = p_exgp_busi_config_str;
    SET v_exgp_avail_amt = p_exgp_avail_amt;
    SET v_exgp_T_hk_buy_total_amt = p_exgp_T_hk_buy_total_amt;
    SET v_exgp_T_hk_sell_total_amt = p_exgp_T_hk_sell_total_amt;
    SET v_exgp_T1_hk_buy_total_amt = p_exgp_T1_hk_buy_total_amt;
    SET v_exgp_T1_hk_sell_total_amt = p_exgp_T1_hk_sell_total_amt;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
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
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_comm_id = p_comm_id;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_all_fee = p_all_fee;
    SET v_par_value = p_par_value;
    SET v_intrst_days = p_intrst_days;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_min_unit = p_min_unit;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_last_price = p_last_price;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_order_oper_way = p_order_oper_way;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_order_limit_time = p_order_limit_time;
    SET v_order_ctrl_qty = p_order_ctrl_qty;
    SET v_order_ctrl_amt = p_order_ctrl_amt;
    SET v_open_close_permission = p_open_close_permission;
    SET v_per_secu_posi_ratio = p_per_secu_posi_ratio;
    SET v_combo_code = p_combo_code;
    SET v_combo_posi_id = p_combo_posi_id;
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
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_id = 0;
    SET v_order_status = "0";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_comm_batch_no = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_executor = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_update_times = 1;
    SET v_exter_comm_flag = 0;
    SET v_is_record_jour = 1;
    SET v_exist_debt_flag = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_contra_no = " ";
    SET v_limit_actual_price = 0;
    SET v_comm_oper_way = " ";
    SET v_comm_amt = 0;
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;
    SET v_frozen_amt = 0;
    SET v_frozen_qty = 0;
    SET v_comm_dir = 0;
    SET v_comm_qty = 0;
    SET v_calc_dir = 1;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_status = "0";
    SET v_strike_status = "0";
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_pass_status = "0";
    SET v_nav_asset = 0;
    SET v_trade_commis = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_remark_info = " ";
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_busi_opor_no = 0;
    SET v_avail_cal_flag = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_wtdraw_qty = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @体外指令标志# = 《体外指令标志-体内》; */
    set v_exter_comm_flag = 1;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @存在负债标志# = 《存在负债标志-不存在》; */
    set v_exist_debt_flag = 1;

    /* set @订单日期# = @初始化日期#; */
    set v_order_date = v_init_date;

    /* set @登记机构# = ""; */
    set v_registration_agency = "";

    /* set @交易账户# = ""; */
    set v_trade_acco = "";

    /* set @合同编号# = ""; */
    set v_contra_no = "";
    #如果是指令下单，校验指令信息

    /* if @指令序号# <> 0 then */
    if v_comm_id <> 0 then

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
            SET v_error_code = "tdsecuT.4.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_校验订单指令出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

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
        SET v_error_code = "tdsecuT.4.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算交易冻结金额和数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @订单冻结金额# = @交易冻结金额#; */
    set v_order_frozen_amt = v_trade_frozen_amt;

    /* set @订单冻结数量# = @交易冻结数量#; */
    set v_order_frozen_qty = v_trade_frozen_qty;
    #检查业务合法性。应放在事务层第一个处理

    /* 调用【原子_交易证券_交易_检查交易业务合法性】*/
    call db_tdsecu.pra_tdsetd_CheckExchData(
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
        v_order_dir,
        v_order_qty,
        v_order_price,
        v_order_frozen_amt,
        v_up_limit_price,
        v_down_limit_price,
        v_net_price_flag,
        v_par_value,
        v_bond_accr_intrst,
        v_bond_rate_type,
        v_busi_limit_str,
        v_record_count,
        v_error_code,
        v_error_info,
        v_frozen_amt,
        v_frozen_qty);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_检查交易业务合法性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #交易证券子系统检查，检查交易可用资金、可用持仓等

    /* 调用【原子_交易证券_交易_校验新增订单】*/
    call db_tdsecu.pra_tdsetd_CheckAddOrder(
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
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_target_code_no,
        v_trade_code_no,
        v_combo_code,
        v_crncy_type,
        v_exch_crncy_type,
        v_buy_ref_rate,
        v_sell_ref_rate,
        v_exgp_busi_config_str,
        v_exgp_avail_amt,
        v_exgp_T_hk_buy_total_amt,
        v_exgp_T_hk_sell_total_amt,
        v_exgp_T1_hk_buy_total_amt,
        v_exgp_T1_hk_sell_total_amt,
        v_asac_busi_config_str,
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
        v_capit_reback_days,
        v_posi_reback_days,
        v_order_dir,
        v_order_qty,
        v_price_type,
        v_order_price,
        v_order_frozen_amt,
        v_impawn_ratio,
        v_stock_type,
        v_min_unit,
        v_up_limit_price,
        v_down_limit_price,
        v_last_price,
        v_order_oper_way,
        v_order_limit_time,
        v_order_ctrl_qty,
        v_order_ctrl_amt,
        v_per_secu_posi_ratio,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_校验新增订单出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;

        #如果是指令订单，需要检查订单数量是否超过指令数量，需考虑并发问题

        /* if @指令序号# > 0 then */
        if v_comm_id > 0 then

            /* set @指令方向# = @订单方向#; */
            set v_comm_dir = v_order_dir;

            /* set @指令数量# = @订单数量#; */
            set v_comm_qty = v_order_qty;

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
                SET v_error_code = "tdsecuT.4.11.999";
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
                SET v_error_code = "tdsecuT.4.11.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_下单更新指令出现错误！',v_mysql_message);
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
                SET v_error_code = "tdsecuT.4.11.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;
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
            SET v_error_code = "tdsecuT.4.11.999";
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
        #获取客户净资产
        #[原子_交易证券_交易_获取客户净资产]

        /* set @净资产# = 0; */
        set v_nav_asset = 0;
        #新增订单记录

        /* set @申报日期# = 0; */
        set v_report_date = 0;

        /* set @申报时间# = 0; */
        set v_report_time = 0;

        /* set @申报编号# = " "; */
        set v_report_no = " ";
        #订单表费用相关字段修改用来存取成交相关费用，订单下达时，费用全部填零；要求订单冻结金额包含费用；

        /* set @全部费用# = 0; */
        set v_all_fee = 0;

        /* set @交易佣金# = 0; */
        set v_trade_commis = 0;

        /* set @印花税# = 0; */
        set v_stamp_tax = 0;

        /* set @过户费# = 0; */
        set v_trans_fee = 0;

        /* set @经手费# = 0; */
        set v_brkage_fee = 0;

        /* set @证管费# = 0; */
        set v_SEC_charges = 0;

        /* set @其他费用# = 0; */
        set v_other_fee = 0;

        /* set @其他佣金# = 0; */
        set v_other_commis = 0;

        /* set @交易征费# = 0; */
        set v_trade_tax = 0;

        /* set @交易费# = 0; */
        set v_trade_cost_fee = 0;

        /* set @交易系统使用费# = 0; */
        set v_trade_system_use_fee = 0;

        /* set @股份交收费# = 0; */
        set v_stock_settle_fee = 0;

        /* set @备注信息#="新增订单！"; */
        set v_remark_info="新增订单！";

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
            SET v_error_code = "tdsecuT.4.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增订单出现错误！',v_mysql_message);
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
            SET v_error_code = "tdsecuT.4.11.999";
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

        /* set @业务操作员编号# = @操作员编号#; */
        set v_busi_opor_no = v_opor_no;

        /* set @可用计算标志# = 1; */
        set v_avail_cal_flag = 1;

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
            SET v_error_code = "tdsecuT.4.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @订单操作方式# = 《订单操作方式-增强交易》 or @订单操作方式# = 《订单操作方式-增强交易平仓》 then */
        if v_order_oper_way = "14" or v_order_oper_way = "51" then

            /* if @可用计算标志# = 1 then */
            if v_avail_cal_flag = 1 then
                #资金持仓变化完后，再判断可用，防止多并发

               /* 调用【原子_交易证券_T0_计算T0券源持仓资金可用】*/
               call db_tdsecu.pra_tdset0_CalcT0SourcePosiCapitalAvail(
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
                   v_exch_no,
                   v_stock_acco_no,
                   v_stock_code_no,
                   v_order_dir,
                   v_co_busi_config_str,
                   v_error_code,
                   v_error_info);
               if v_error_code = "1" then
                   SET v_error_code = "tdsecuT.4.11.999";
                   if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_计算T0券源持仓资金可用出现错误！',v_mysql_message);
                   end if;
                   ROLLBACK;
                   leave label_pro;
               elseif v_error_code <> "0" then
                   ROLLBACK;
                   leave label_pro;
               end if;

            end if;
        end if;

        /* if @订单操作方式# <> 《订单操作方式-组合买入》 and @订单操作方式# <> 《订单操作方式-组合卖出》 then */
        if v_order_oper_way <> "26" and v_order_oper_way <> "27" then

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
                SET v_error_code = "tdsecuT.4.11.999";
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

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_id = v_order_id;
    SET p_order_status = v_order_status;
    SET p_order_date = v_order_date;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_order_time = v_order_time;
    SET p_comm_date = v_comm_date;
    SET p_comm_executor = v_comm_executor;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_撤销订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_CancelOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_CancelOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_order_date int,
    IN p_order_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_code varchar(6),
    OUT p_comm_date int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_report_no varchar(32),
    OUT p_external_no bigint,
    OUT p_order_status varchar(2),
    OUT p_wtdraw_date int,
    OUT p_wtdraw_id bigint,
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_wtdraw_status varchar(2),
    OUT p_order_batch_no int,
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_rsp_info varchar(255),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_order_oper_way varchar(2),
    OUT p_order_price decimal(16,9),
    OUT p_combo_code varchar(32),
    OUT p_combo_posi_id bigint,
    OUT p_open_posi_date int,
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
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_comm_date int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_report_no varchar(32);
    declare v_external_no bigint;
    declare v_order_status varchar(2);
    declare v_wtdraw_date int;
    declare v_wtdraw_id bigint;
    declare v_wtdraw_qty decimal(18,2);
    declare v_wtdraw_status varchar(2);
    declare v_order_batch_no int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_report_date int;
    declare v_report_time int;
    declare v_rsp_info varchar(255);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_order_price decimal(16,9);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_open_posi_date int;
    declare v_update_times int;
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_all_fee decimal(18,4);
    declare v_wtdraw_time int;
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_exter_comm_flag int;
    declare v_target_stock_code_no int;
    declare v_trade_acco varchar(32);
    declare v_tmp_order_frozen_amt decimal(18,4);
    declare v_tmp_order_frozen_qty decimal(18,2);
    declare v_pass_status varchar(2);
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_remark varchar(255);
    declare v_occur_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_comm_oper_way varchar(2);
    declare v_comm_dir int;
    declare v_comm_amt decimal(18,4);
    declare v_calc_dir int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_total_strike_qty decimal(18,2);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_avail_cal_flag int;
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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_report_no = " ";
    SET v_external_no = 0;
    SET v_order_status = "0";
    SET v_wtdraw_date = date_format(curdate(),'%Y%m%d');
    SET v_wtdraw_id = 0;
    SET v_wtdraw_qty = 0;
    SET v_wtdraw_status = "0";
    SET v_order_batch_no = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_rsp_info = " ";
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_order_oper_way = " ";
    SET v_order_price = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_update_times = 1;
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_busi_opor_no = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_order_qty = 0;
    SET v_price_type = 0;
    SET v_all_fee = 0;
    SET v_wtdraw_time = date_format(curtime(),'%H%i%s');
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_exter_comm_flag = 0;
    SET v_target_stock_code_no = 0;
    SET v_trade_acco = " ";
    SET v_tmp_order_frozen_amt = 0;
    SET v_tmp_order_frozen_qty = 0;
    SET v_pass_status = "0";
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_wtdraw_batch_no = 0;
    SET v_wtdraw_remark = " ";
    SET v_occur_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_status = "0";
    SET v_comm_oper_way = " ";
    SET v_comm_dir = 0;
    SET v_comm_amt = 0;
    SET v_calc_dir = 1;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_total_strike_qty = 0;
    SET v_all_wtdraw_qty = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_avail_cal_flag = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @撤单日期# = @初始化日期#; */
    set v_wtdraw_date = v_init_date;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;

    /* [事务开始] */
    START TRANSACTION;

        #检查撤单重复，并获取订单信息

        /* 调用【原子_交易证券_交易_检查锁定获取待撤订单信息】*/
        call db_tdsecu.pra_tdsetd_CheckLockGetPreCancelOrder(
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
            v_order_oper_way,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_crncy_type,
            v_pass_no,
            v_out_acco,
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
            v_comm_batch_no,
            v_external_no,
            v_order_batch_no,
            v_order_time,
            v_report_no,
            v_report_date,
            v_report_time,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_order_status,
            v_price_type,
            v_strike_qty,
            v_strike_amt,
            v_all_fee,
            v_wtdraw_qty,
            v_wtdraw_time,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_strike_bond_accr_intrst,
            v_rsp_info,
            v_exter_comm_flag,
            v_update_times,
            v_combo_code,
            v_target_stock_code_no,
            v_trade_acco);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_检查锁定获取待撤订单信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


         /* set @临时_订单冻结金额# = @订单冻结金额#; */
         set v_tmp_order_frozen_amt = v_order_frozen_amt;

         /* set @临时_订单冻结数量# = @订单冻结数量#; */
         set v_tmp_order_frozen_qty = v_order_frozen_qty;

        /* if @订单状态# <> 《订单状态-未报》  then */
        if v_order_status <> "1"  then
            #非未报订单,只修改订单状态， 3-待撤

            /* set @订单状态# = 《订单状态-待撤》 ; */
            set v_order_status = "3" ;

            /* set @撤单状态# = 《撤单状态-未报》; */
            set v_wtdraw_status = "1";

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
                SET v_error_code = "tdsecuT.4.12.999";
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

                /* set @撤单状态# = 《撤单状态-已报》; */
                set v_wtdraw_status = "2";
            end if;
            #事务内获取撤单批号，分机构存放

            /* set @编号类型# = 《编号类型-撤单批号》; */
            set v_record_no_type = 16;

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
                SET v_error_code = "tdsecuT.4.12.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @撤单批号# = @当前编号#; */
            set v_wtdraw_batch_no = v_curr_no;

            /* set @撤单说明# = "撤消订单！"; */
            set v_wtdraw_remark = "撤消订单！";

            /* set @撤单数量# = 0; */
            set v_wtdraw_qty = 0;

            /* set @订单冻结金额# = 0; */
            set v_order_frozen_amt = 0;

            /* set @订单冻结数量# = 0; */
            set v_order_frozen_qty = 0;

            /* 调用【原子_交易证券_交易_撤销订单】*/
            call db_tdsecu.pra_tdsetd_CancelOrder(
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
                v_external_no,
                v_order_date,
                v_order_id,
                v_report_no,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_order_status,
                v_wtdraw_batch_no,
                v_wtdraw_qty,
                v_wtdraw_remark,
                v_wtdraw_status,
                v_order_price,
                v_trade_acco,
                v_error_code,
                v_error_info,
                v_wtdraw_id,
                v_wtdraw_date,
                v_wtdraw_time);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.4.12.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤销订单出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        else
            #未报撤单处理逻辑，修改订单状态 4-已撤

            /* set @订单状态# = 《订单状态-已撤》; */
            set v_order_status = "4";

            /* set @撤单状态# = 《撤单状态-成功》; */
            set v_wtdraw_status = "3";

            /* set @撤单数量# = @订单数量#; */
            set v_wtdraw_qty = v_order_qty;

            /* set @变动数量# = @订单数量#; */
            set v_occur_qty = v_order_qty;
            #更新指令表

            /* if @指令序号# > 0 then */
            if v_comm_id > 0 then

                /* set @指令撤销数量# = 0; */
                set v_comm_cancel_qty = 0;

                /* 调用【原子_交易证券_指令_撤销更新指令】*/
                call db_tdsecu.pra_tdseap_CancelUpdateComm(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_comm_id,
                    v_comm_cancel_qty,
                    v_wtdraw_qty,
                    v_error_code,
                    v_error_info,
                    v_limit_actual_price,
                    v_comm_status,
                    v_comm_date,
                    v_comm_batch_no,
                    v_comm_executor,
                    v_comm_oper_way,
                    v_comm_dir,
                    v_comm_amt);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.4.12.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销更新指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #计算指令变动金额和数量

                /* set @指令方向# = @订单方向#; */
                set v_comm_dir = v_order_dir;

                /* set @计算方向# = 《计算方向-加上》; */
                set v_calc_dir = 1;

                /* 调用【原子_交易证券_公用_计算撤单指令变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetCancelCommOccurAmtAndQty(
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
                    v_wtdraw_qty,
                    v_comm_status,
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
                    SET v_error_code = "tdsecuT.4.12.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算撤单指令变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            end if;

            /* set @总成交数量# = 0; */
            set v_total_strike_qty = 0;

            /* set @总撤单数量# = @撤单数量#; */
            set v_all_wtdraw_qty = v_wtdraw_qty;

            /* 调用【原子_交易证券_公用_计算撤单交易变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetCancelExchChangeAmtAndQty(
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
                v_wtdraw_qty,
                v_total_strike_qty,
                v_all_wtdraw_qty,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_error_code,
                v_error_info,
                v_trade_occur_amt,
                v_trade_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.4.12.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算撤单交易变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #事务内获取撤单批号，分机构存放

            /* set @编号类型# = 《编号类型-撤单批号》; */
            set v_record_no_type = 16;

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
                SET v_error_code = "tdsecuT.4.12.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @撤单批号# = @当前编号#; */
            set v_wtdraw_batch_no = v_curr_no;
            #更新订单表

            /* set @订单冻结金额# = -1 * @订单冻结金额#; */
            set v_order_frozen_amt = -1 * v_order_frozen_amt;

            /* set @订单冻结数量# = -1 * @订单冻结数量#; */
            set v_order_frozen_qty = -1 * v_order_frozen_qty;

            /* set @撤单说明# = "撤消订单！"; */
            set v_wtdraw_remark = "撤消订单！";

            /* 调用【原子_交易证券_交易_撤销订单】*/
            call db_tdsecu.pra_tdsetd_CancelOrder(
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
                v_external_no,
                v_order_date,
                v_order_id,
                v_report_no,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_order_status,
                v_wtdraw_batch_no,
                v_wtdraw_qty,
                v_wtdraw_remark,
                v_wtdraw_status,
                v_order_price,
                v_trade_acco,
                v_error_code,
                v_error_info,
                v_wtdraw_id,
                v_wtdraw_date,
                v_wtdraw_time);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.4.12.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤销订单出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @可用计算标志# = 0; */
            set v_avail_cal_flag = 0;

            /* set @组合持仓序号# = 0; */
            set v_combo_posi_id = 0;
            #处理订单资金持仓数据，保护指令变动和交易的变动

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
                SET v_error_code = "tdsecuT.4.12.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

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
                SET v_error_code = "tdsecuT.4.12.999";
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

    #主推处理

    /* set @订单冻结金额# = @订单冻结金额# + @临时_订单冻结金额#; */
    set v_order_frozen_amt = v_order_frozen_amt + v_tmp_order_frozen_amt;

    /* set @订单冻结数量# = @订单冻结数量# + @临时_订单冻结数量#; */
    set v_order_frozen_qty = v_order_frozen_qty + v_tmp_order_frozen_qty;

    /* set @更新次数# = @更新次数# + 1; */
    set v_update_times = v_update_times + 1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_code = v_stock_code;
    SET p_comm_date = v_comm_date;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_report_no = v_report_no;
    SET p_external_no = v_external_no;
    SET p_order_status = v_order_status;
    SET p_wtdraw_date = v_wtdraw_date;
    SET p_wtdraw_id = v_wtdraw_id;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_wtdraw_status = v_wtdraw_status;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_rsp_info = v_rsp_info;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_order_oper_way = v_order_oper_way;
    SET p_order_price = v_order_price;
    SET p_combo_code = v_combo_code;
    SET p_combo_posi_id = v_combo_posi_id;
    SET p_open_posi_date = v_open_posi_date;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_新增改单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_AddModiOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_AddModiOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_modi_batch_no int,
    IN p_modi_order_price decimal(16,9),
    IN p_modi_order_qty decimal(18,2),
    IN p_modi_price_type int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_par_value decimal(16,9),
    IN p_target_code_no int,
    IN p_trade_code_no int,
    IN p_impawn_ratio decimal(18,12),
    IN p_net_price_flag int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_combo_code varchar(32),
    IN p_strategy_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_asset_acco varchar(16),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_code varchar(6),
    OUT p_report_no varchar(32),
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_comm_id bigint,
    OUT p_modi_order_id bigint,
    OUT p_new_order_id bigint,
    OUT p_order_dir int,
    OUT p_order_qty decimal(18,2),
    OUT p_order_price decimal(16,9),
    OUT p_order_batch_no int,
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_comm_date int,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_wtdraw_id bigint,
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_wtdraw_status varchar(2),
    OUT p_wtdraw_date int,
    OUT p_wtdraw_time int,
    OUT p_rsp_info varchar(255),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_compli_trig_id bigint,
    OUT p_old_order_status varchar(2),
    OUT p_new_order_status varchar(2),
    OUT p_order_status varchar(2),
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
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_modi_batch_no int;
    declare v_modi_order_price decimal(16,9);
    declare v_modi_order_qty decimal(18,2);
    declare v_modi_price_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_par_value decimal(16,9);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_combo_code varchar(32);
    declare v_strategy_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_asset_acco varchar(16);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_report_no varchar(32);
    declare v_report_date int;
    declare v_report_time int;
    declare v_comm_id bigint;
    declare v_modi_order_id bigint;
    declare v_new_order_id bigint;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_order_batch_no int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_wtdraw_id bigint;
    declare v_wtdraw_qty decimal(18,2);
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_date int;
    declare v_wtdraw_time int;
    declare v_rsp_info varchar(255);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_compli_trig_id bigint;
    declare v_old_order_status varchar(2);
    declare v_new_order_status varchar(2);
    declare v_order_status varchar(2);
    declare v_update_times int;
    declare v_deal_flag int;
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_stock_code_no int;
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_comm_opor int;
    declare v_external_no bigint;
    declare v_order_time int;
    declare v_price_type int;
    declare v_intrst_days int;
    declare v_all_fee decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_busi_opor_no int;
    declare v_target_stock_code_no int;
    declare v_trade_acco varchar(32);
    declare v_tmp_order_frozen_amt decimal(18,4);
    declare v_tmp_order_frozen_qty decimal(18,2);
    declare v_tmp_stock_code_no int;
    declare v_tmp_order_qty decimal(18,2);
    declare v_pass_status varchar(2);
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_remark varchar(255);
    declare v_occur_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_comm_oper_way varchar(2);
    declare v_comm_dir int;
    declare v_comm_amt decimal(18,4);
    declare v_calc_dir int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_total_strike_qty decimal(18,2);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_avail_cal_flag int;
    declare v_combo_posi_id bigint;
    declare v_open_posi_date int;
    declare v_modi_order_date int;
    declare v_modi_order_status varchar(2);
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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_modi_batch_no = p_modi_batch_no;
    SET v_modi_order_price = p_modi_order_price;
    SET v_modi_order_qty = p_modi_order_qty;
    SET v_modi_price_type = p_modi_price_type;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_par_value = p_par_value;
    SET v_target_code_no = p_target_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_combo_code = p_combo_code;
    SET v_strategy_id = p_strategy_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_asset_acco = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_report_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_comm_id = 0;
    SET v_modi_order_id = 0;
    SET v_new_order_id = 0;
    SET v_order_dir = 0;
    SET v_order_qty = 0;
    SET v_order_price = 0;
    SET v_order_batch_no = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_wtdraw_id = 0;
    SET v_wtdraw_qty = 0;
    SET v_wtdraw_status = "0";
    SET v_wtdraw_date = date_format(curdate(),'%Y%m%d');
    SET v_wtdraw_time = date_format(curtime(),'%H%i%s');
    SET v_rsp_info = " ";
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_compli_trig_id = 0;
    SET v_old_order_status = "0";
    SET v_new_order_status = "0";
    SET v_order_status = "0";
    SET v_update_times = 1;
    SET v_deal_flag = 0;
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_stock_code_no = 0;
    SET v_asset_type = 0;
    SET v_stock_type = 0;
    SET v_comm_opor = 0;
    SET v_external_no = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_price_type = 0;
    SET v_intrst_days = 0;
    SET v_all_fee = 0;
    SET v_order_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_busi_opor_no = 0;
    SET v_target_stock_code_no = 0;
    SET v_trade_acco = " ";
    SET v_tmp_order_frozen_amt = 0;
    SET v_tmp_order_frozen_qty = 0;
    SET v_tmp_stock_code_no = 0;
    SET v_tmp_order_qty = 0;
    SET v_pass_status = "0";
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_wtdraw_batch_no = 0;
    SET v_wtdraw_remark = " ";
    SET v_occur_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_status = "0";
    SET v_comm_oper_way = " ";
    SET v_comm_dir = 0;
    SET v_comm_amt = 0;
    SET v_calc_dir = 1;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_total_strike_qty = 0;
    SET v_all_wtdraw_qty = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_avail_cal_flag = 0;
    SET v_combo_posi_id = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_modi_order_date = date_format(curdate(),'%Y%m%d');
    SET v_modi_order_status = " ";
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @处理标志# = 0; */
    set v_deal_flag = 0;

    /* SET @撤单日期# = @初始化日期#; */
    SET v_wtdraw_date = v_init_date;

    /* SET @申报日期# = @订单日期#; */
    SET v_report_date = v_order_date;

    /* if @改单价格类型# = 0 then */
    if v_modi_price_type = 0 then

      /* set @改单价格类型# = 《价格类型-限价》; */
      set v_modi_price_type = 1;
    end if;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;
    #检查是否有重复的有效记录

    /* 调用【原子_交易证券_交易_检查重复改单】*/
    call db_tdsecu.pra_tdsetd_CheckDupliModiOrder(
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
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_检查重复改单出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #修改后是否符合指令要求，不符合直接报错提示

    /* if @指令序号# <> 0 then */
    if v_comm_id <> 0 then

      /* 调用【原子_交易证券_指令_检查改单指令业务】*/
      call db_tdsecu.pra_tdseap_CheckModiOrderComm(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_init_date,
          v_comm_id,
          v_order_date,
          v_order_id,
          v_modi_batch_no,
          v_modi_order_price,
          v_modi_order_qty,
          v_modi_price_type,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "tdsecuT.4.14.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_检查改单指令业务出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

    end if;

    /* [事务开始] */
    START TRANSACTION;

        #取原委托信息

        /* 调用【原子_交易证券_交易_检查锁定获取改单订单信息】*/
        call db_tdsecu.pra_tdsetd_CheckLockGetModiOrderInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_id,
            v_modi_order_price,
            v_modi_order_qty,
            v_modi_price_type,
            v_error_code,
            v_error_info,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_no,
            v_stock_acco_no,
            v_stock_acco,
            v_stock_code_no,
            v_stock_code,
            v_asset_type,
            v_stock_type,
            v_comm_opor,
            v_external_no,
            v_comm_id,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_batch_no,
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
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_all_fee,
            v_order_oper_way,
            v_exter_comm_flag,
            v_busi_opor_no,
            v_update_times,
            v_combo_code,
            v_target_stock_code_no,
            v_trade_acco);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.14.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_检查锁定获取改单订单信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @临时_订单冻结金额# = @订单冻结金额#; */
        set v_tmp_order_frozen_amt = v_order_frozen_amt;

        /* set @临时_订单冻结数量# = @订单冻结数量#; */
        set v_tmp_order_frozen_qty = v_order_frozen_qty;

        /* set @临时_证券代码编号# = @证券代码编号#; */
        set v_tmp_stock_code_no = v_stock_code_no;

        /* set @临时_订单数量# = @订单数量#; */
        set v_tmp_order_qty = v_order_qty;
        #判断原委托状态,非允许撤单状态及不可改单则报错返回, 1-未报 2-已报 5-部成

        /* if @订单状态# <> 《订单状态-未报》 then */
        if v_order_status <> "1" then
            #非未报订单,只修改订单状态， 3-待撤

            /* set @订单状态# = 《订单状态-待撤》; */
            set v_order_status = "3";

            /* set @撤单状态# = 《撤单状态-未报》; */
            set v_wtdraw_status = "1";

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
                SET v_error_code = "tdsecuT.4.14.999";
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

                /* set @撤单状态# = 《撤单状态-已报》; */
                set v_wtdraw_status = "2";
            end if;
            #事务内获取撤单批号，分机构存放

            /* set @编号类型# = 《编号类型-撤单批号》; */
            set v_record_no_type = 16;

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
                SET v_error_code = "tdsecuT.4.14.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @撤单批号# = @当前编号#; */
            set v_wtdraw_batch_no = v_curr_no;

            /* set @撤单说明# = "新增改单自动撤消！"; */
            set v_wtdraw_remark = "新增改单自动撤消！";

            /* set @撤单数量# = 0; */
            set v_wtdraw_qty = 0;

            /* set @订单冻结金额# = 0; */
            set v_order_frozen_amt = 0;

            /* set @订单冻结数量# = 0; */
            set v_order_frozen_qty = 0;

            /* 调用【原子_交易证券_交易_撤销订单】*/
            call db_tdsecu.pra_tdsetd_CancelOrder(
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
                v_external_no,
                v_order_date,
                v_order_id,
                v_report_no,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_order_status,
                v_wtdraw_batch_no,
                v_wtdraw_qty,
                v_wtdraw_remark,
                v_wtdraw_status,
                v_order_price,
                v_trade_acco,
                v_error_code,
                v_error_info,
                v_wtdraw_id,
                v_wtdraw_date,
                v_wtdraw_time);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.4.14.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤销订单出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        else
            #未报撤单处理逻辑，修改订单状态 4-已撤

            /* set @订单状态# = 《订单状态-已撤》; */
            set v_order_status = "4";

            /* set @撤单状态# = 《撤单状态-成功》; */
            set v_wtdraw_status = "3";

            /* set @撤单数量# = @订单数量#; */
            set v_wtdraw_qty = v_order_qty;

            /* set @变动数量# = @订单数量#; */
            set v_occur_qty = v_order_qty;
            #更新指令表

            /* if @指令序号# > 0 then */
            if v_comm_id > 0 then

                /* set @指令撤销数量# = 0; */
                set v_comm_cancel_qty = 0;

                /* 调用【原子_交易证券_指令_撤销更新指令】*/
                call db_tdsecu.pra_tdseap_CancelUpdateComm(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_comm_id,
                    v_comm_cancel_qty,
                    v_wtdraw_qty,
                    v_error_code,
                    v_error_info,
                    v_limit_actual_price,
                    v_comm_status,
                    v_comm_date,
                    v_comm_batch_no,
                    v_comm_executor,
                    v_comm_oper_way,
                    v_comm_dir,
                    v_comm_amt);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.4.14.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销更新指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #计算指令变动金额

                /* set @指令方向# = @订单方向#; */
                set v_comm_dir = v_order_dir;

                /* set @计算方向# = 《计算方向-加上》; */
                set v_calc_dir = 1;

                /* 调用【原子_交易证券_公用_计算撤单指令变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetCancelCommOccurAmtAndQty(
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
                    v_wtdraw_qty,
                    v_comm_status,
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
                    SET v_error_code = "tdsecuT.4.14.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算撤单指令变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* if @策略序号# >0 then */
                if v_strategy_id >0 then

                    /* [更新表记录][交易证券_指令_指令表][{策略订单数量} = {策略订单数量}-@订单数量#][{记录序号}=@指令序号#][2][@指令序号#] */
                    set v_update_date = date_format(curdate(),'%Y%m%d');
                    set v_update_time = date_format(curtime(),'%H%i%s');
                    update db_tdsecu.tb_tdseap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strategy_order_qty = strategy_order_qty-v_order_qty where row_id=v_comm_id;
                    if v_error_code = "1" then
                        ROLLBACK;        
                        SET v_error_code = "tdsecuT.4.14.2";
                        if v_mysql_message <> "" then
                            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
                        else
                            SET v_error_info = concat("指令序号=",v_comm_id);
                        end if;
                        leave label_pro;
                    end if;

                end if;
            end if;
            #事务内获取撤单批号，分机构存放

            /* set @编号类型# = 《编号类型-撤单批号》; */
            set v_record_no_type = 16;

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
                SET v_error_code = "tdsecuT.4.14.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @撤单批号# = @当前编号#; */
            set v_wtdraw_batch_no = v_curr_no;

            /* set @总成交数量# = @成交数量#; */
            set v_total_strike_qty = v_strike_qty;

            /* set @总撤单数量# = @订单数量#; */
            set v_all_wtdraw_qty = v_order_qty;

            /* 调用【原子_交易证券_公用_计算撤单交易变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetCancelExchChangeAmtAndQty(
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
                v_wtdraw_qty,
                v_total_strike_qty,
                v_all_wtdraw_qty,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_error_code,
                v_error_info,
                v_trade_occur_amt,
                v_trade_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.4.14.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算撤单交易变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #更新订单表

            /* set @订单冻结金额# = -1 * @订单冻结金额#; */
            set v_order_frozen_amt = -1 * v_order_frozen_amt;

            /* set @订单冻结数量# = -1 * @订单冻结数量#; */
            set v_order_frozen_qty = -1 * v_order_frozen_qty;

            /* set @撤单说明# = "新增改单自动撤消！"; */
            set v_wtdraw_remark = "新增改单自动撤消！";

            /* 调用【原子_交易证券_交易_撤销订单】*/
            call db_tdsecu.pra_tdsetd_CancelOrder(
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
                v_external_no,
                v_order_date,
                v_order_id,
                v_report_no,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_order_status,
                v_wtdraw_batch_no,
                v_wtdraw_qty,
                v_wtdraw_remark,
                v_wtdraw_status,
                v_order_price,
                v_trade_acco,
                v_error_code,
                v_error_info,
                v_wtdraw_id,
                v_wtdraw_date,
                v_wtdraw_time);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.4.14.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤销订单出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @可用计算标志# = 0; */
            set v_avail_cal_flag = 0;
            #处理订单资金持仓数据，保护指令变动和交易的变动

            /* set @组合持仓序号# = 0; */
            set v_combo_posi_id = 0;

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
                SET v_error_code = "tdsecuT.4.14.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;
        #改单处理

        /* set @改单日期# = @订单日期#; */
        set v_modi_order_date = v_order_date;

        /* set @改单状态# = 《改单状态-新建》; */
        set v_modi_order_status = "1";

        /* set @证券代码编号# = @临时_证券代码编号#; */
        set v_stock_code_no = v_tmp_stock_code_no;
        #set @价格类型# = @改单价格类型#;

        /* 调用【原子_交易证券_交易_新增改单】*/
        call db_tdsecu.pra_tdsetd_AddModiOrder(
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
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_stock_type,
            v_asset_type,
            v_modi_order_date,
            v_modi_batch_no,
            v_order_id,
            v_comm_id,
            v_order_price,
            v_order_qty,
            v_order_dir,
            v_order_date,
            v_order_time,
            v_price_type,
            v_modi_order_status,
            v_modi_order_price,
            v_modi_order_qty,
            v_modi_price_type,
            v_crncy_type,
            v_exch_crncy_type,
            v_order_oper_way,
            v_error_code,
            v_error_info,
            v_modi_order_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.14.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增改单出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* if @订单状态# = 《订单状态-已撤》 then */
    if v_order_status = "4" then

        /* [事务开始] */
        START TRANSACTION;


            /* set @订单数量# = 0; */
            set v_order_qty = 0;

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
                SET v_error_code = "tdsecuT.4.14.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_订单处理汇总订单出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


        /* [事务结束] */
        COMMIT;

    end if;
    #输出主推数据

    /* set @订单数量# = @临时_订单数量#; */
    set v_order_qty = v_tmp_order_qty;

    /* set @订单冻结金额# = @临时_订单冻结金额# + @订单冻结金额#; */
    set v_order_frozen_amt = v_tmp_order_frozen_amt + v_order_frozen_amt;

    /* set @订单冻结数量# = @临时_订单冻结数量# + @订单冻结数量#; */
    set v_order_frozen_qty = v_tmp_order_frozen_qty + v_order_frozen_qty;

    /* set @更新次数# = @更新次数# + 1; */
    set v_update_times = v_update_times + 1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_asset_acco = v_asset_acco;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_code = v_stock_code;
    SET p_report_no = v_report_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_comm_id = v_comm_id;
    SET p_modi_order_id = v_modi_order_id;
    SET p_new_order_id = v_new_order_id;
    SET p_order_dir = v_order_dir;
    SET p_order_qty = v_order_qty;
    SET p_order_price = v_order_price;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_comm_date = v_comm_date;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_wtdraw_id = v_wtdraw_id;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_wtdraw_status = v_wtdraw_status;
    SET p_wtdraw_date = v_wtdraw_date;
    SET p_wtdraw_time = v_wtdraw_time;
    SET p_rsp_info = v_rsp_info;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_old_order_status = v_old_order_status;
    SET p_new_order_status = v_new_order_status;
    SET p_order_status = v_order_status;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_新增篮子批量订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_AddBasketBatchOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_AddBasketBatchOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_opor int,
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
    IN p_trade_code_no_str varchar(4096),
    IN p_target_code_no_str varchar(4096),
    IN p_asset_type_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_busi_limit_str varchar(2048),
    IN p_exgp_busi_config_str varchar(64),
    IN p_exgp_avail_amt decimal(18,4),
    IN p_exgp_T_hk_buy_total_amt decimal(18,4),
    IN p_exgp_T_hk_sell_total_amt decimal(18,4),
    IN p_exgp_T1_hk_buy_total_amt decimal(18,4),
    IN p_exgp_T1_hk_sell_total_amt decimal(18,4),
    IN p_asac_busi_config_str varchar(64),
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
    IN p_market_price_ratio decimal(18,12),
    IN p_comm_id_str varchar(2048),
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_order_dir_str varchar(1024),
    IN p_order_price_str varchar(4096),
    IN p_order_qty_str varchar(4096),
    IN p_price_type_str varchar(2048),
    IN p_all_fee_str varchar(4096),
    IN p_par_value_str varchar(4096),
    IN p_intrst_days_str varchar(2048),
    IN p_impawn_ratio_str varchar(4096),
    IN p_net_price_flag_str varchar(2048),
    IN p_bond_accr_intrst_str varchar(4096),
    IN p_bond_rate_type_str varchar(4096),
    IN p_min_unit_str varchar(2048),
    IN p_up_limit_price_str varchar(4096),
    IN p_down_limit_price_str varchar(4096),
    IN p_last_price_str varchar(4096),
    IN p_capit_reback_days_str varchar(2048),
    IN p_posi_reback_days_str varchar(2048),
    IN p_split_str varchar(4),
    IN p_order_oper_way varchar(2),
    IN p_cost_calc_type int,
    IN p_compli_trig_id bigint,
    IN p_subscription_trade_mark_str varchar(4096),
    IN p_purchase_trade_mark_str varchar(4096),
    IN p_rede_trade_mark_str varchar(4096),
    IN p_first_minimum_amt_str varchar(4096),
    IN p_minimum_purchase_amt_str varchar(4096),
    IN p_minimum_subscription_amt_str varchar(4096),
    IN p_minimum_rede_share_str varchar(4096),
    IN p_minimum_holding_share_str varchar(4096),
    IN p_record_count int,
    IN p_asset_acco_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_id_str varchar(2048),
    OUT p_order_status_str varchar(64),
    OUT p_order_date int
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
    declare v_trade_code_no_str varchar(4096);
    declare v_target_code_no_str varchar(4096);
    declare v_asset_type_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_busi_limit_str varchar(2048);
    declare v_exgp_busi_config_str varchar(64);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_asac_busi_config_str varchar(64);
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
    declare v_market_price_ratio decimal(18,12);
    declare v_comm_id_str varchar(2048);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_order_price_str varchar(4096);
    declare v_order_qty_str varchar(4096);
    declare v_price_type_str varchar(2048);
    declare v_all_fee_str varchar(4096);
    declare v_par_value_str varchar(4096);
    declare v_intrst_days_str varchar(2048);
    declare v_impawn_ratio_str varchar(4096);
    declare v_net_price_flag_str varchar(2048);
    declare v_bond_accr_intrst_str varchar(4096);
    declare v_bond_rate_type_str varchar(4096);
    declare v_min_unit_str varchar(2048);
    declare v_up_limit_price_str varchar(4096);
    declare v_down_limit_price_str varchar(4096);
    declare v_last_price_str varchar(4096);
    declare v_capit_reback_days_str varchar(2048);
    declare v_posi_reback_days_str varchar(2048);
    declare v_split_str varchar(4);
    declare v_order_oper_way varchar(2);
    declare v_cost_calc_type int;
    declare v_compli_trig_id bigint;
    declare v_subscription_trade_mark_str varchar(4096);
    declare v_purchase_trade_mark_str varchar(4096);
    declare v_rede_trade_mark_str varchar(4096);
    declare v_first_minimum_amt_str varchar(4096);
    declare v_minimum_purchase_amt_str varchar(4096);
    declare v_minimum_subscription_amt_str varchar(4096);
    declare v_minimum_rede_share_str varchar(4096);
    declare v_minimum_holding_share_str varchar(4096);
    declare v_record_count int;
    declare v_asset_acco_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_id_str varchar(2048);
    declare v_order_status_str varchar(64);
    declare v_order_date int;
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_is_record_jour int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_contra_no varchar(32);
    declare v_exist_debt_flag int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_stock_acco varchar(16);
    declare v_stock_acco_no int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_net_price_flag int;
    declare v_impawn_ratio decimal(18,12);
    declare v_stock_type int;
    declare v_par_value decimal(16,9);
    declare v_stock_code_no int;
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
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_exgp_avail_qty decimal(18,2);
    declare v_exgp_target_code_avail_qty decimal(18,2);
    declare v_exgp_trade_code_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_asac_target_code_avail_qty decimal(18,2);
    declare v_asac_trade_code_avail_qty decimal(18,2);
    declare v_comm_id bigint;
    declare v_price_type int;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_order_limit_time int;
    declare v_order_ctrl_qty decimal(18,2);
    declare v_order_ctrl_amt decimal(18,4);
    declare v_per_secu_posi_ratio decimal(18,12);
    declare v_open_close_permission int;
    declare v_exter_comm_flag int;
    declare v_avail_cal_flag int;
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_batch_no int;
    declare v_comm_date int;
    declare v_comm_executor int;
    declare v_comm_oper_way varchar(2);
    declare v_comm_amt decimal(18,4);
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_frozen_amt decimal(18,4);
    declare v_frozen_qty decimal(18,2);
    declare v_combo_code varchar(32);
    declare v_comm_dir int;
    declare v_comm_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_status varchar(2);
    declare v_strike_status varchar(2);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_pass_status varchar(2);
    declare v_nav_asset decimal(18,4);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_trade_commis decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_combo_posi_id bigint;
    declare v_order_id bigint;
    declare v_order_time int;
    declare v_update_times int;
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_busi_opor_no int;
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
    SET v_comm_opor = p_comm_opor;
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
    SET v_trade_code_no_str = p_trade_code_no_str;
    SET v_target_code_no_str = p_target_code_no_str;
    SET v_asset_type_str = p_asset_type_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_exgp_busi_config_str = p_exgp_busi_config_str;
    SET v_exgp_avail_amt = p_exgp_avail_amt;
    SET v_exgp_T_hk_buy_total_amt = p_exgp_T_hk_buy_total_amt;
    SET v_exgp_T_hk_sell_total_amt = p_exgp_T_hk_sell_total_amt;
    SET v_exgp_T1_hk_buy_total_amt = p_exgp_T1_hk_buy_total_amt;
    SET v_exgp_T1_hk_sell_total_amt = p_exgp_T1_hk_sell_total_amt;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
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
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_comm_id_str = p_comm_id_str;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_price_str = p_order_price_str;
    SET v_order_qty_str = p_order_qty_str;
    SET v_price_type_str = p_price_type_str;
    SET v_all_fee_str = p_all_fee_str;
    SET v_par_value_str = p_par_value_str;
    SET v_intrst_days_str = p_intrst_days_str;
    SET v_impawn_ratio_str = p_impawn_ratio_str;
    SET v_net_price_flag_str = p_net_price_flag_str;
    SET v_bond_accr_intrst_str = p_bond_accr_intrst_str;
    SET v_bond_rate_type_str = p_bond_rate_type_str;
    SET v_min_unit_str = p_min_unit_str;
    SET v_up_limit_price_str = p_up_limit_price_str;
    SET v_down_limit_price_str = p_down_limit_price_str;
    SET v_last_price_str = p_last_price_str;
    SET v_capit_reback_days_str = p_capit_reback_days_str;
    SET v_posi_reback_days_str = p_posi_reback_days_str;
    SET v_split_str = p_split_str;
    SET v_order_oper_way = p_order_oper_way;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_subscription_trade_mark_str = p_subscription_trade_mark_str;
    SET v_purchase_trade_mark_str = p_purchase_trade_mark_str;
    SET v_rede_trade_mark_str = p_rede_trade_mark_str;
    SET v_first_minimum_amt_str = p_first_minimum_amt_str;
    SET v_minimum_purchase_amt_str = p_minimum_purchase_amt_str;
    SET v_minimum_subscription_amt_str = p_minimum_subscription_amt_str;
    SET v_minimum_rede_share_str = p_minimum_rede_share_str;
    SET v_minimum_holding_share_str = p_minimum_holding_share_str;
    SET v_record_count = p_record_count;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_id_str = " ";
    SET v_order_status_str = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_is_record_jour = 1;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_contra_no = " ";
    SET v_exist_debt_flag = 0;
    SET v_stock_code = " ";
    SET v_exch_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_stock_acco = " ";
    SET v_stock_acco_no = 0;
    SET v_bond_accr_intrst = 0;
    SET v_net_price_flag = 0;
    SET v_impawn_ratio = 0;
    SET v_stock_type = 0;
    SET v_par_value = 0;
    SET v_stock_code_no = 0;
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
    SET v_min_unit = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_exgp_avail_qty = 0;
    SET v_exgp_target_code_avail_qty = 0;
    SET v_exgp_trade_code_avail_qty = 0;
    SET v_asac_avail_qty = 0;
    SET v_asac_target_code_avail_qty = 0;
    SET v_asac_trade_code_avail_qty = 0;
    SET v_comm_id = 0;
    SET v_price_type = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_order_limit_time = 0;
    SET v_order_ctrl_qty = 0;
    SET v_order_ctrl_amt = 0;
    SET v_per_secu_posi_ratio = 0;
    SET v_open_close_permission = 0;
    SET v_exter_comm_flag = 0;
    SET v_avail_cal_flag = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_executor = 0;
    SET v_comm_oper_way = " ";
    SET v_comm_amt = 0;
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_frozen_amt = 0;
    SET v_frozen_qty = 0;
    SET v_combo_code = " ";
    SET v_comm_dir = 0;
    SET v_comm_qty = 0;
    SET v_calc_dir = 1;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_status = "0";
    SET v_strike_status = "0";
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_order_status = "0";
    SET v_pass_status = "0";
    SET v_nav_asset = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_trade_commis = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_remark_info = " ";
    SET v_combo_posi_id = 0;
    SET v_order_id = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_busi_opor_no = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_wtdraw_qty = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    
    #篮子指令不传批号，自己获取

    /* if @订单批号# = 0 then */
    if v_order_batch_no = 0 then

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
                SET v_error_code = "tdsecuT.4.15.999";
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

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @订单序号串# = ""; */
    set v_order_id_str = "";

    /* set @订单状态串# = ""; */
    set v_order_status_str = "";

    /* set @目标证券代码# = ""; */
    set v_target_stock_code = "";

    /* set @目标证券代码编号# = 0; */
    set v_target_stock_code_no = 0;

    /* set @登记机构# = ""; */
    set v_registration_agency = "";

    /* set @交易账户# = ""; */
    set v_trade_acco = "";

    /* set @合同编号# = ""; */
    set v_contra_no = "";

    /* set @存在负债标志# = 《存在负债标志-不存在》; */
    set v_exist_debt_flag = 1;

    /* while LOCATE(@分隔符#,@证券代码串#)<>0   do */
    while LOCATE(v_split_str,v_stock_code_str)<>0   do

    /* [事务开始] */
    START TRANSACTION;

        #截取前面每一位

        /* set @证券代码#=substring(@证券代码串#,1,LOCATE(@分隔符#,@证券代码串#)-1); */
        set v_stock_code=substring(v_stock_code_str,1,LOCATE(v_split_str,v_stock_code_str)-1);

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

        /* set @订单方向#=cast(substring(@订单方向串#,1,LOCATE(@分隔符#,@订单方向串#)-1) as SIGNED); */
        set v_order_dir=cast(substring(v_order_dir_str,1,LOCATE(v_split_str,v_order_dir_str)-1) as SIGNED);

        /* set @订单价格#=cast(substring(@订单价格串#,1,LOCATE(@分隔符#,@订单价格串#)-1) as decimal(16,9)); */
        set v_order_price=cast(substring(v_order_price_str,1,LOCATE(v_split_str,v_order_price_str)-1) as decimal(16,9));

        /* set @订单数量#=cast(substring(@订单数量串#,1,LOCATE(@分隔符#,@订单数量串#)-1) as decimal(18,2)); */
        set v_order_qty=cast(substring(v_order_qty_str,1,LOCATE(v_split_str,v_order_qty_str)-1) as decimal(18,2));

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

        /* set @证券代码编号#=cast(substring(@证券代码编号串#,1,LOCATE(@分隔符#,@证券代码编号串#)-1) as SIGNED); */
        set v_stock_code_no=cast(substring(v_stock_code_no_str,1,LOCATE(v_split_str,v_stock_code_no_str)-1) as SIGNED);

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

        /* set @最小单位#=cast(substring(@最小单位串#,1,LOCATE(@分隔符#,@最小单位串#)-1) as SIGNED); */
        set v_min_unit=cast(substring(v_min_unit_str,1,LOCATE(v_split_str,v_min_unit_str)-1) as SIGNED);

        /* set @涨停价#=cast(substring(@涨停价串#,1,LOCATE(@分隔符#,@涨停价串#)-1) as decimal(16,9)); */
        set v_up_limit_price=cast(substring(v_up_limit_price_str,1,LOCATE(v_split_str,v_up_limit_price_str)-1) as decimal(16,9));

        /* set @跌停价#=cast(substring(@跌停价串#,1,LOCATE(@分隔符#,@跌停价串#)-1) as decimal(16,9)); */
        set v_down_limit_price=cast(substring(v_down_limit_price_str,1,LOCATE(v_split_str,v_down_limit_price_str)-1) as decimal(16,9));

        /* set @最新价#=cast(substring(@最新价串#,1,LOCATE(@分隔符#,@最新价串#)-1) as decimal(16,9)); */
        set v_last_price=cast(substring(v_last_price_str,1,LOCATE(v_split_str,v_last_price_str)-1) as decimal(16,9));

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

        /* set @指令序号#=cast(substring(@指令序号串#,1,LOCATE(@分隔符#,@指令序号串#)-1) as SIGNED); */
        set v_comm_id=cast(substring(v_comm_id_str,1,LOCATE(v_split_str,v_comm_id_str)-1) as SIGNED);

        /* set @价格类型#=cast(substring(@价格类型串#,1,LOCATE(@分隔符#,@价格类型串#)-1) as SIGNED); */
        set v_price_type=cast(substring(v_price_type_str,1,LOCATE(v_split_str,v_price_type_str)-1) as SIGNED);

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

        /* set @下单限制时间#=0; */
        set v_order_limit_time=0;

        /* set @单笔数量控制#=0; */
        set v_order_ctrl_qty=0;

        /* set @单笔金额控制#=0; */
        set v_order_ctrl_amt=0;

        /* set @单券持仓比例#=0; */
        set v_per_secu_posi_ratio=0;

        /* set @开平仓权限# =《开平仓权限-不限制》; */
        set v_open_close_permission =0;

        /* set @体外指令标志# = 《体外指令标志-体内》; */
        set v_exter_comm_flag = 1;

        /* set @可用计算标志# = 0; */
        set v_avail_cal_flag = 0;

        /* set @订单日期# = @初始化日期#; */
        set v_order_date = v_init_date;
        #如果是指令下单，校验指令信息

        /* if @指令序号# <> 0 then */
        if v_comm_id <> 0 then

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
                SET v_error_code = "tdsecuT.4.15.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_校验订单指令出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

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
            SET v_error_code = "tdsecuT.4.15.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算交易冻结金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @订单冻结金额# = @交易冻结金额#; */
        set v_order_frozen_amt = v_trade_frozen_amt;

        /* set @订单冻结数量# = @交易冻结数量#; */
        set v_order_frozen_qty = v_trade_frozen_qty;
        #检查业务合法性。应放在事务层第一个处理

        /* 调用【原子_交易证券_交易_检查交易业务合法性】*/
        call db_tdsecu.pra_tdsetd_CheckExchData(
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
            v_order_dir,
            v_order_qty,
            v_order_price,
            v_order_frozen_amt,
            v_up_limit_price,
            v_down_limit_price,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_busi_limit_str,
            v_record_count,
            v_error_code,
            v_error_info,
            v_frozen_amt,
            v_frozen_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.15.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_检查交易业务合法性出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #交易证券子系统检查，检查交易可用资金、可用持仓等

         /* set @组合代码# = " "; */
         set v_combo_code = " ";

        /* 调用【原子_交易证券_交易_校验新增订单】*/
        call db_tdsecu.pra_tdsetd_CheckAddOrder(
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
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_code_no,
            v_trade_code_no,
            v_combo_code,
            v_crncy_type,
            v_exch_crncy_type,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_exgp_busi_config_str,
            v_exgp_avail_amt,
            v_exgp_T_hk_buy_total_amt,
            v_exgp_T_hk_sell_total_amt,
            v_exgp_T1_hk_buy_total_amt,
            v_exgp_T1_hk_sell_total_amt,
            v_asac_busi_config_str,
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
            v_capit_reback_days,
            v_posi_reback_days,
            v_order_dir,
            v_order_qty,
            v_price_type,
            v_order_price,
            v_order_frozen_amt,
            v_impawn_ratio,
            v_stock_type,
            v_min_unit,
            v_up_limit_price,
            v_down_limit_price,
            v_last_price,
            v_order_oper_way,
            v_order_limit_time,
            v_order_ctrl_qty,
            v_order_ctrl_amt,
            v_per_secu_posi_ratio,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.15.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_校验新增订单出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #如果是指令订单，需要检查订单数量是否超过指令数量，需考虑并发问题

        /* if @指令序号# > 0 then */
        if v_comm_id > 0 then

            /* set @指令方向# = @订单方向#; */
            set v_comm_dir = v_order_dir;

            /* set @指令数量# = @订单数量#; */
            set v_comm_qty = v_order_qty;

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
                SET v_error_code = "tdsecuT.4.15.999";
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
                SET v_error_code = "tdsecuT.4.15.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_下单更新指令出现错误！',v_mysql_message);
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
                SET v_error_code = "tdsecuT.4.15.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;
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
            SET v_error_code = "tdsecuT.4.15.999";
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
        #获取客户净资产
        #[原子_交易证券_交易_获取客户净资产]

        /* set @净资产# = 0; */
        set v_nav_asset = 0;
        #新增订单记录

        /* set @申报日期# = 0; */
        set v_report_date = 0;

        /* set @申报时间# = 0; */
        set v_report_time = 0;

        /* set @申报编号# = " "; */
        set v_report_no = " ";
        #订单表费用相关字段修改用来存取成交相关费用，订单下达时，费用全部填零；要求订单冻结金额包含费用；

        /* set @全部费用# = 0; */
        set v_all_fee = 0;

        /* set @交易佣金# = 0; */
        set v_trade_commis = 0;

        /* set @印花税# = 0; */
        set v_stamp_tax = 0;

        /* set @过户费# = 0; */
        set v_trans_fee = 0;

        /* set @经手费# = 0; */
        set v_brkage_fee = 0;

        /* set @证管费# = 0; */
        set v_SEC_charges = 0;

        /* set @其他费用# = 0; */
        set v_other_fee = 0;

        /* set @其他佣金# = 0; */
        set v_other_commis = 0;

        /* set @交易征费# = 0; */
        set v_trade_tax = 0;

        /* set @交易费# = 0; */
        set v_trade_cost_fee = 0;

        /* set @交易系统使用费# = 0; */
        set v_trade_system_use_fee = 0;

        /* set @股份交收费# = 0; */
        set v_stock_settle_fee = 0;

        /* set @备注信息#="新增分价单订单！"; */
        set v_remark_info="新增分价单订单！";

        /* set @组合代码# = " "; */
        set v_combo_code = " ";

        /* set @组合持仓序号#=0; */
        set v_combo_posi_id=0;

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
            SET v_error_code = "tdsecuT.4.15.999";
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

        /* set @订单状态串# = concat(@订单状态串#,@订单状态#,";"); */
        set v_order_status_str = concat(v_order_status_str,v_order_status,";");
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
            SET v_error_code = "tdsecuT.4.15.999";
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

        /* set @业务操作员编号# = @操作员编号#; */
        set v_busi_opor_no = v_opor_no;

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
            SET v_error_code = "tdsecuT.4.15.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #if @操作方式# = 《操作方式-T+0》 then
        #    set @成交变动数量# = 0;
        #    [原子_交易证券_T0_交易端操作员券源限额设置持仓变化]
        #end if;

        /* if @订单操作方式# =《订单操作方式-分价单交易》  then */
        if v_order_oper_way ="74"  then

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
                SET v_error_code = "tdsecuT.4.15.999";
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

        /* set @证券代码串#=substring(@证券代码串#,LOCATE(@分隔符#,@证券代码串#)+1); */
        set v_stock_code_str=substring(v_stock_code_str,LOCATE(v_split_str,v_stock_code_str)+1);

        /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
        set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

        /* set @订单方向串#=substring(@订单方向串#,LOCATE(@分隔符#,@订单方向串#)+1); */
        set v_order_dir_str=substring(v_order_dir_str,LOCATE(v_split_str,v_order_dir_str)+1);

        /* set @订单价格串#=substring(@订单价格串#,LOCATE(@分隔符#,@订单价格串#)+1); */
        set v_order_price_str=substring(v_order_price_str,LOCATE(v_split_str,v_order_price_str)+1);

        /* set @订单数量串#=substring(@订单数量串#,LOCATE(@分隔符#,@订单数量串#)+1); */
        set v_order_qty_str=substring(v_order_qty_str,LOCATE(v_split_str,v_order_qty_str)+1);

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

        /* set @证券代码编号串#=substring(@证券代码编号串#,LOCATE(@分隔符#,@证券代码编号串#)+1); */
        set v_stock_code_no_str=substring(v_stock_code_no_str,LOCATE(v_split_str,v_stock_code_no_str)+1);

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

        /* set @最小单位串#=substring(@最小单位串#,LOCATE(@分隔符#,@最小单位串#)+1); */
        set v_min_unit_str=substring(v_min_unit_str,LOCATE(v_split_str,v_min_unit_str)+1);

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

        /* set @指令序号串#=substring(@指令序号串#,LOCATE(@分隔符#,@指令序号串#)+1); */
        set v_comm_id_str=substring(v_comm_id_str,LOCATE(v_split_str,v_comm_id_str)+1);

        /* set @价格类型串#=substring(@价格类型串#,LOCATE(@分隔符#,@价格类型串#)+1); */
        set v_price_type_str=substring(v_price_type_str,LOCATE(v_split_str,v_price_type_str)+1);

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

    /* [事务结束] */
    COMMIT;

    end while;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_id_str = v_order_id_str;
    SET p_order_status_str = v_order_status_str;
    SET p_order_date = v_order_date;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_新增待执行订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_AddPendOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_AddPendOrder(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_asset_type int,
    IN p_stock_type int,
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_batch_no int,
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    IN p_exec_price_type int,
    IN p_price_offset decimal(16,9),
    IN p_par_value decimal(16,9),
    IN p_intrst_days int,
    IN p_impawn_ratio decimal(18,12),
    IN p_net_price_flag int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_order_oper_way varchar(2),
    IN p_external_no bigint,
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pend_order_id bigint,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_pend_order_status varchar(2),
    OUT p_update_times int,
    OUT p_create_date int,
    OUT p_create_time int
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_exec_price_type int;
    declare v_price_offset decimal(16,9);
    declare v_par_value decimal(16,9);
    declare v_intrst_days int;
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_order_oper_way varchar(2);
    declare v_external_no bigint;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pend_order_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_pend_order_status varchar(2);
    declare v_update_times int;
    declare v_create_date int;
    declare v_create_time int;

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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_asset_type = p_asset_type;
    SET v_stock_type = p_stock_type;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_exec_price_type = p_exec_price_type;
    SET v_price_offset = p_price_offset;
    SET v_par_value = p_par_value;
    SET v_intrst_days = p_intrst_days;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_order_oper_way = p_order_oper_way;
    SET v_external_no = p_external_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pend_order_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_pend_order_status = "0";
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @订单日期# = @初始化日期#; */
    set v_order_date = v_init_date;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_交易_新增待执行订单】*/
        call db_tdsecu.pra_tdsetd_AddPendOrder(
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
            v_comm_batch_no,
            v_order_batch_no,
            v_order_date,
            v_order_dir,
            v_price_type,
            v_exec_price_type,
            v_price_offset,
            v_order_qty,
            v_net_price_flag,
            v_intrst_days,
            v_par_value,
            v_impawn_ratio,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_order_oper_way,
            v_external_no,
            v_remark_info,
            v_error_code,
            v_error_info,
            v_pend_order_id,
            v_order_time,
            v_pend_order_status,
            v_update_times,
            v_create_date,
            v_create_time);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增待执行订单出现错误！',v_mysql_message);
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
    SET p_pend_order_id = v_pend_order_id;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_pend_order_status = v_pend_order_status;
    SET p_update_times = v_update_times;
    SET p_create_date = v_create_date;
    SET p_create_time = v_create_time;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_修改待执行订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_UpdatePendOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_UpdatePendOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pend_order_id bigint,
    IN p_remark_info varchar(255),
    IN p_pend_order_status varchar(2),
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
    declare v_pend_order_id bigint;
    declare v_remark_info varchar(255);
    declare v_pend_order_status varchar(2);
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
    SET v_pend_order_id = p_pend_order_id;
    SET v_remark_info = p_remark_info;
    SET v_pend_order_status = p_pend_order_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_交易_修改待执行订单】*/
        call db_tdsecu.pra_tdsetd_UpdatePendOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pend_order_id,
            v_remark_info,
            v_pend_order_status,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_修改待执行订单出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询报盘订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryRptOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryRptOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
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
    declare v_pass_no int;
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
    SET v_pass_no = p_pass_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #if @指定行数# <=0 then
      #set @指定行数# = 1;
    #end if;
    #if @指定行数# > 50 then
     # set @指定行数# = 50;
    #end if;

        /* 调用【原子_交易证券_交易_查询报盘订单】*/
        call db_tdsecu.pra_tdsetd_QueryRptOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pass_no,
            v_row_id,
            v_row_count,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询报盘订单出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询报盘撤单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryRptCancelOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryRptCancelOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
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
    declare v_pass_no int;
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
    SET v_pass_no = p_pass_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #if @指定行数# <=0 then
      #set @指定行数# = 1;
    #end if;
    #if @指定行数# > 50 then
      #set @指定行数# = 50;
    #end if;

        /* 调用【原子_交易证券_交易_查询报盘撤单】*/
        call db_tdsecu.pra_tdsetd_QueryRptCancelOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pass_no,
            v_row_id,
            v_row_count,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询报盘撤单出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_更新订单状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_UpdateOrderStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_UpdateOrderStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_order_status varchar(2),
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
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_order_status varchar(2);
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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_order_status = p_order_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_交易_更新订单状态】*/
        call db_tdsecu.pra_tdsetd_UpdateOrderStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_date,
            v_order_id,
            v_order_status,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.23.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_更新订单状态出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_处理异常撤单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_DealAbnoCancelOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_DealAbnoCancelOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_exch_crncy_type varchar(3),
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_wtdraw_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_stock_code varchar(6),
    OUT p_report_no varchar(32),
    OUT p_external_no bigint,
    OUT p_order_status varchar(2),
    OUT p_wtdraw_id bigint,
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
    declare v_init_date int;
    declare v_pass_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_wtdraw_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_report_no varchar(32);
    declare v_external_no bigint;
    declare v_order_status varchar(2);
    declare v_wtdraw_id bigint;
    declare v_wtdraw_status varchar(2);
    declare v_deal_flag int;
    declare v_wtdraw_date int;
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_tmp_wtdraw_qty decimal(18,2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_comm_opor int;
    declare v_comm_id bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_order_batch_no int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
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
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_net_price_flag int;
    declare v_impawn_ratio decimal(18,12);
    declare v_bond_rate_type int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_busi_opor_no int;
    declare v_combo_code varchar(32);
    declare v_target_stock_code_no int;
    declare v_trade_acco varchar(32);
    declare v_total_strike_qty decimal(18,2);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_wtdraw_remark varchar(255);
    declare v_wtdraw_batch_no int;
    declare v_comm_cancel_qty decimal(18,2);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_comm_oper_way varchar(2);
    declare v_comm_dir int;
    declare v_comm_amt decimal(18,4);
    declare v_calc_dir int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_wtdraw_time int;
    declare v_avail_cal_flag int;
    declare v_combo_posi_id bigint;
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
    SET v_pass_no = p_pass_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_report_no = " ";
    SET v_external_no = 0;
    SET v_order_status = "0";
    SET v_wtdraw_id = 0;
    SET v_wtdraw_status = "0";
    SET v_deal_flag = 0;
    SET v_wtdraw_date = date_format(curdate(),'%Y%m%d');
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_tmp_wtdraw_qty = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code_no = 0;
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_asset_type = 0;
    SET v_stock_type = 0;
    SET v_comm_opor = 0;
    SET v_comm_id = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_order_batch_no = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
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
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_net_price_flag = 0;
    SET v_impawn_ratio = 0;
    SET v_bond_rate_type = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_order_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_busi_opor_no = 0;
    SET v_combo_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_trade_acco = " ";
    SET v_total_strike_qty = 0;
    SET v_all_wtdraw_qty = 0;
    SET v_wtdraw_remark = " ";
    SET v_wtdraw_batch_no = 0;
    SET v_comm_cancel_qty = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_status = "0";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_comm_oper_way = " ";
    SET v_comm_dir = 0;
    SET v_comm_amt = 0;
    SET v_calc_dir = 1;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_wtdraw_time = date_format(curtime(),'%H%i%s');
    SET v_avail_cal_flag = 0;
    SET v_combo_posi_id = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @处理标志# = 0; */
    set v_deal_flag = 0;

    /* SET @撤单日期# = @初始化日期#; */
    SET v_wtdraw_date = v_init_date;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;

    /* [事务开始] */
    START TRANSACTION;


        /* set @临时_撤单数量# = @撤单数量#; */
        set v_tmp_wtdraw_qty = v_wtdraw_qty;
        #取原委托信息

        /* 调用【原子_交易证券_交易_锁定获取订单信息】*/
        call db_tdsecu.pra_tdsetd_LockGetOrder(
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
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_no,
            v_stock_acco_no,
            v_stock_acco,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_asset_type,
            v_stock_type,
            v_comm_opor,
            v_external_no,
            v_comm_id,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_batch_no,
            v_order_time,
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
            v_par_value,
            v_bond_accr_intrst,
            v_net_price_flag,
            v_impawn_ratio,
            v_bond_rate_type,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_rsp_info,
            v_compli_trig_id,
            v_remark_info,
            v_order_oper_way,
            v_exter_comm_flag,
            v_busi_opor_no,
            v_combo_code,
            v_target_stock_code_no,
            v_trade_acco);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.31.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_锁定获取订单信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @总成交数量# =  @成交数量#; */
        set v_total_strike_qty =  v_strike_qty;

        /* set @总撤单数量# =  @撤单数量#; */
        set v_all_wtdraw_qty =  v_wtdraw_qty;

        /* [检查报错返回][@临时_撤单数量# > @订单数量# - @成交数量# - @撤单数量#][722][@临时_撤单数量#,@订单数量#,@成交数量#,@撤单数量#] */
        if v_tmp_wtdraw_qty > v_order_qty - v_strike_qty - v_wtdraw_qty then
            ROLLBACK;
            SET v_error_code = "tdsecuT.4.31.722";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("临时_撤单数量=",v_tmp_wtdraw_qty,",","订单数量=",v_order_qty,",","成交数量=",v_strike_qty,",","撤单数量=",v_wtdraw_qty),"#",v_mysql_message);
            else
                SET v_error_info = concat("临时_撤单数量=",v_tmp_wtdraw_qty,",","订单数量=",v_order_qty,",","成交数量=",v_strike_qty,",","撤单数量=",v_wtdraw_qty);
            end if;
            leave label_pro;
        end if;

        #不传撤单数量时，计算撤成数量

        /* if @临时_撤单数量# = 0 then */
        if v_tmp_wtdraw_qty = 0 then

            /* set @撤单数量# =  @订单数量# - @成交数量# - @撤单数量#; */
            set v_wtdraw_qty =  v_order_qty - v_strike_qty - v_wtdraw_qty;
        else

            /* set @撤单数量# =  @临时_撤单数量#; */
            set v_wtdraw_qty =  v_tmp_wtdraw_qty;
        end if;

        /* set @总撤单数量# =  @总撤单数量# + @撤单数量#; */
        set v_all_wtdraw_qty =  v_all_wtdraw_qty + v_wtdraw_qty;

        /* if @订单数量# = @撤单数量# then */
        if v_order_qty = v_wtdraw_qty then

            /* set @订单状态# = 《订单状态-已撤》; */
            set v_order_status = "4";
        else

            /* set @订单状态# = 《订单状态-部撤》; */
            set v_order_status = "7";
        end if;

        /* set @撤单状态# = 《撤单状态-成功》; */
        set v_wtdraw_status = "3";

        /* set @撤单说明# = "异常撤单"; */
        set v_wtdraw_remark = "异常撤单";

        /* set @撤单批号# = 0; */
        set v_wtdraw_batch_no = 0;
        #更新指令表

        /* if @指令序号# > 0 then */
        if v_comm_id > 0 then

            /* set @指令撤销数量# = 0; */
            set v_comm_cancel_qty = 0;

            /* 调用【原子_交易证券_指令_撤销更新指令】*/
            call db_tdsecu.pra_tdseap_CancelUpdateComm(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_comm_id,
                v_comm_cancel_qty,
                v_wtdraw_qty,
                v_error_code,
                v_error_info,
                v_limit_actual_price,
                v_comm_status,
                v_comm_date,
                v_comm_batch_no,
                v_comm_executor,
                v_comm_oper_way,
                v_comm_dir,
                v_comm_amt);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.4.31.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销更新指令出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #计算指令变动金额和数量

            /* set @指令方向# = @订单方向#; */
            set v_comm_dir = v_order_dir;

            /* set @计算方向# = 《计算方向-加上》; */
            set v_calc_dir = 1;

            /* 调用【原子_交易证券_公用_计算撤单指令变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetCancelCommOccurAmtAndQty(
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
                v_wtdraw_qty,
                v_comm_status,
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
                SET v_error_code = "tdsecuT.4.31.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算撤单指令变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;
        #计算交易冻结金额

        /* 调用【原子_交易证券_公用_计算撤单交易变动金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetCancelExchChangeAmtAndQty(
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
            v_wtdraw_qty,
            v_total_strike_qty,
            v_all_wtdraw_qty,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_error_code,
            v_error_info,
            v_trade_occur_amt,
            v_trade_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.31.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算撤单交易变动金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #更新订单表

        /* if @订单方向# = 《订单方向-卖出》 or  @订单方向# = 《订单方向-融资回购》 or @订单方向# = 《订单方向-质押提交》 or @订单方向# = 《订单方向-质押转回》 then */
        if v_order_dir = 2 or  v_order_dir = 3 or v_order_dir = 21 or v_order_dir = 22 then

            /* set @订单冻结金额# = 0; */
            set v_order_frozen_amt = 0;
        else

            /* set @订单冻结金额# = @订单冻结金额# + 交易变动金额; */
            set v_order_frozen_amt = v_order_frozen_amt + 交易变动金额;
        end if;

        /* 调用【原子_交易证券_交易_撤销订单】*/
        call db_tdsecu.pra_tdsetd_CancelOrder(
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
            v_external_no,
            v_order_date,
            v_order_id,
            v_report_no,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_order_status,
            v_wtdraw_batch_no,
            v_wtdraw_qty,
            v_wtdraw_remark,
            v_wtdraw_status,
            v_order_price,
            v_trade_acco,
            v_error_code,
            v_error_info,
            v_wtdraw_id,
            v_wtdraw_date,
            v_wtdraw_time);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.31.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤销订单出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #处理订单资金持仓数据，保护指令变动和交易的变动

        /* set @可用计算标志# = 0; */
        set v_avail_cal_flag = 0;

        /* set @组合持仓序号# = 0; */
        set v_combo_posi_id = 0;

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
            SET v_error_code = "tdsecuT.4.31.999";
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

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_out_acco = v_out_acco;
    SET p_exch_no = v_exch_no;
    SET p_stock_code = v_stock_code;
    SET p_report_no = v_report_no;
    SET p_external_no = v_external_no;
    SET p_order_status = v_order_status;
    SET p_wtdraw_id = v_wtdraw_id;
    SET p_wtdraw_status = v_wtdraw_status;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_新增补单订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_AddAppeOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_AddAppeOrder(
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
    IN p_asset_type int,
    IN p_stock_type int,
    IN p_comm_opor int,
    IN p_comm_id bigint,
    IN p_comm_limit_price decimal(16,9),
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_all_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_trade_tax decimal(18,4),
    IN p_trade_cost_fee decimal(18,4),
    IN p_trade_system_use_fee decimal(18,4),
    IN p_stock_settle_fee decimal(18,4),
    IN p_compli_trig_id bigint,
    IN p_par_value decimal(16,9),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_rsp_id bigint,
    IN p_nav_asset decimal(18,4),
    IN p_intrst_days int,
    IN p_impawn_ratio decimal(18,12),
    IN p_net_price_flag int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_price_type int,
    IN p_order_oper_way varchar(2),
    IN p_cost_calc_type int,
    IN p_asset_acco_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_id bigint,
    OUT p_order_status varchar(2),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_frozen_amt decimal(18,4),
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
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_comm_opor int;
    declare v_comm_id bigint;
    declare v_comm_limit_price decimal(16,9);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_compli_trig_id bigint;
    declare v_par_value decimal(16,9);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_rsp_id bigint;
    declare v_nav_asset decimal(18,4);
    declare v_intrst_days int;
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_price_type int;
    declare v_order_oper_way varchar(2);
    declare v_cost_calc_type int;
    declare v_asset_acco_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_id bigint;
    declare v_order_status varchar(2);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_rsp_info varchar(255);
    declare v_open_close_permission int;
    declare v_order_rsp_status varchar(2);
    declare v_is_record_jour int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_contra_no varchar(32);
    declare v_exist_debt_flag int;
    declare v_row_id bigint;
    declare v_deal_status varchar(2);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_batch_no int;
    declare v_exter_comm_flag int;
    declare v_comm_date int;
    declare v_comm_executor int;
    declare v_comm_oper_way varchar(2);
    declare v_comm_amt decimal(18,4);
    declare v_comm_dir int;
    declare v_comm_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_status varchar(2);
    declare v_strike_status varchar(2);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_update_times int;
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
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
    SET v_asset_type = p_asset_type;
    SET v_stock_type = p_stock_type;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_id = p_comm_id;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_all_fee = p_all_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_other_commis = p_other_commis;
    SET v_trade_tax = p_trade_tax;
    SET v_trade_cost_fee = p_trade_cost_fee;
    SET v_trade_system_use_fee = p_trade_system_use_fee;
    SET v_stock_settle_fee = p_stock_settle_fee;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_par_value = p_par_value;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_rsp_id = p_rsp_id;
    SET v_nav_asset = p_nav_asset;
    SET v_intrst_days = p_intrst_days;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_price_type = p_price_type;
    SET v_order_oper_way = p_order_oper_way;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_id = 0;
    SET v_order_status = "0";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_rsp_info = " ";
    SET v_open_close_permission = 0;
    SET v_order_rsp_status = "0";
    SET v_is_record_jour = 1;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_contra_no = " ";
    SET v_exist_debt_flag = 0;
    SET v_row_id = 0;
    SET v_deal_status = "0";
    SET v_limit_actual_price = 0;
    SET v_comm_batch_no = 0;
    SET v_exter_comm_flag = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_executor = 0;
    SET v_comm_oper_way = " ";
    SET v_comm_amt = 0;
    SET v_comm_dir = 0;
    SET v_comm_qty = 0;
    SET v_calc_dir = 1;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_status = "0";
    SET v_strike_status = "0";
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;
    SET v_remark_info = " ";
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_update_times = 1;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_busi_opor_no = 0;
    SET v_avail_cal_flag = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @回报信息# = "手工补单"; */
        set v_rsp_info = "手工补单";

        /* set @开平仓权限# =《开平仓权限-不限制》; */
        set v_open_close_permission =0;

        /* set @订单回报状态# = 《订单回报状态-已报》; */
        set v_order_rsp_status = "1";

        /* set @订单序号# = 0; */
        set v_order_id = 0;

        /* set @订单日期# = @申报日期#; */
        set v_order_date = v_report_date;

        /* set @是否记录流水# = 《是否记录流水-记录》; */
        set v_is_record_jour = 1;

        /* set @目标证券代码# = ""; */
        set v_target_stock_code = "";

        /* set @目标证券代码编号# = 0; */
        set v_target_stock_code_no = 0;

        /* set @登记机构# = ""; */
        set v_registration_agency = "";

        /* set @交易账户# = ""; */
        set v_trade_acco = "";

        /* set @合同编号# = ""; */
        set v_contra_no = "";

        /* set @存在负债标志# = 《存在负债标志-不存在》; */
        set v_exist_debt_flag = 1;
        #回报序号为0时，需要先补上回报表记录。

        /* if @回报序号# = 0 then */
        if v_rsp_id = 0 then

          /* 调用【原子_交易证券_报盘_检查订单重复回报】*/
          call db_tdsecu.pra_tdserp_CheckOrderRspDup(
              v_opor_co_no,
              v_opor_no,
              v_oper_mac,
              v_oper_ip_addr,
              v_oper_info,
              v_oper_way,
              v_func_code,
              v_init_date,
              v_pass_no,
              v_out_acco,
              v_exch_no,
              v_stock_acco,
              v_stock_code,
              v_report_date,
              v_report_time,
              v_report_no,
              v_rsp_info,
              v_order_rsp_status,
              v_price_type,
              v_order_id,
              v_error_code,
              v_error_info,
              v_rsp_id,
              v_row_id);
          if v_error_code = "1" then
              SET v_error_code = "tdsecuT.4.32.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_检查订单重复回报出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;

        else
          #防止处理过的补单重复补单

          /* 调用【原子_交易证券_报盘_获取订单回报状态】*/
          call db_tdsecu.pra_tdserp_GetOrderRspStatus(
              v_opor_co_no,
              v_opor_no,
              v_oper_mac,
              v_oper_ip_addr,
              v_oper_info,
              v_oper_way,
              v_func_code,
              v_rsp_id,
              v_error_code,
              v_error_info,
              v_deal_status);
          if v_error_code = "1" then
              SET v_error_code = "tdsecuT.4.32.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_获取订单回报状态出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;


          /* [检查报错返回][@处理状态# = 《处理状态-成功》or @处理状态# = 《处理状态-失败》][751][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#,@处理状态#] */
          if v_deal_status = "1"or v_deal_status = "2" then
              ROLLBACK;
              SET v_error_code = "tdsecuT.4.32.751";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no,",","处理状态=",v_deal_status),"#",v_mysql_message);
              else
                  SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no,",","处理状态=",v_deal_status);
              end if;
              leave label_pro;
          end if;

        end if;

        /* if @指令序号# <> 0 then */
        if v_comm_id <> 0 then

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
              SET v_error_code = "tdsecuT.4.32.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_校验订单指令出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;


          /* set @指令方向# = @订单方向#; */
          set v_comm_dir = v_order_dir;

          /* set @指令数量# = @订单数量#; */
          set v_comm_qty = v_order_qty;

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
              SET v_error_code = "tdsecuT.4.32.999";
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
              SET v_error_code = "tdsecuT.4.32.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_下单更新指令出现错误！',v_mysql_message);
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
              SET v_error_code = "tdsecuT.4.32.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;

        end if;

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
            SET v_error_code = "tdsecuT.4.32.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算交易冻结金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @订单冻结金额# = @交易冻结金额#; */
        set v_order_frozen_amt = v_trade_frozen_amt;

        /* set @订单冻结数量# = @交易冻结数量#; */
        set v_order_frozen_qty = v_trade_frozen_qty;

        /* set @订单状态# = 《订单状态-已报》; */
        set v_order_status = "2";

        /* set @订单日期# = @申报日期#; */
        set v_order_date = v_report_date;

        /* set @备注信息# = "新增补单订单！"; */
        set v_remark_info = "新增补单订单！";

        /* set @组合代码# = " "; */
        set v_combo_code = " ";

        /* set @组合持仓序号#=0; */
        set v_combo_posi_id=0;

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
            SET v_error_code = "tdsecuT.4.32.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增订单出现错误！',v_mysql_message);
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
            SET v_error_code = "tdsecuT.4.32.999";
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

        /* set @业务操作员编号# = @操作员编号#; */
        set v_busi_opor_no = v_opor_no;

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
            SET v_error_code = "tdsecuT.4.32.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #更新订单回报表状态

        /* 调用【原子_交易证券_报盘_更新订单回报状态】*/
        call db_tdsecu.pra_tdserp_UpdateOrderRspStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_rsp_id,
            v_order_id,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.32.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_更新订单回报状态出现错误！',v_mysql_message);
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
    SET p_order_id = v_order_id;
    SET p_order_status = v_order_status;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_新增篮子订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_AddBasketOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_AddBasketOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_basket_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_order_date int,
    IN p_order_batch_no int,
    IN p_order_dir int,
    IN p_basket_trade_type int,
    IN p_basket_trade_amt decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_id bigint
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
    declare v_basket_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_basket_trade_type int;
    declare v_basket_trade_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_id bigint;

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
    SET v_basket_id = p_basket_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_order_date = p_order_date;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir = p_order_dir;
    SET v_basket_trade_type = p_basket_trade_type;
    SET v_basket_trade_amt = p_basket_trade_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_交易_新增篮子订单】*/
        call db_tdsecu.pra_tdsetd_AddBasketOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_basket_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_order_date,
            v_order_batch_no,
            v_order_dir,
            v_basket_trade_type,
            v_basket_trade_amt,
            v_error_code,
            v_error_info,
            v_order_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.41.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增篮子订单出现错误！',v_mysql_message);
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
    SET p_order_id = v_order_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_新增预埋订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_AddPreOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_AddPreOrder(
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
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_type int,
    IN p_pre_order_dir int,
    IN p_pre_order_type int,
    IN p_pre_order_price decimal(16,9),
    IN p_trig_type int,
    IN p_trig_price decimal(16,9),
    IN p_trig_date int,
    IN p_trig_time int,
    IN p_pre_order_qty decimal(18,2),
    IN p_pre_price_type int,
    IN p_price_offset decimal(16,9),
    IN p_pre_begin_date int,
    IN p_pre_end_date int,
    IN p_pre_begin_time int,
    IN p_pre_end_time int,
    IN p_is_trace int,
    IN p_price_up decimal(16,9),
    IN p_order_no_str varchar(2048),
    IN p_keep_trace int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pre_order_id bigint,
    OUT p_pre_order_date int,
    OUT p_pre_order_time int,
    OUT p_pre_order_status varchar(2)
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
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_pre_order_dir int;
    declare v_pre_order_type int;
    declare v_pre_order_price decimal(16,9);
    declare v_trig_type int;
    declare v_trig_price decimal(16,9);
    declare v_trig_date int;
    declare v_trig_time int;
    declare v_pre_order_qty decimal(18,2);
    declare v_pre_price_type int;
    declare v_price_offset decimal(16,9);
    declare v_pre_begin_date int;
    declare v_pre_end_date int;
    declare v_pre_begin_time int;
    declare v_pre_end_time int;
    declare v_is_trace int;
    declare v_price_up decimal(16,9);
    declare v_order_no_str varchar(2048);
    declare v_keep_trace int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pre_order_id bigint;
    declare v_pre_order_date int;
    declare v_pre_order_time int;
    declare v_pre_order_status varchar(2);

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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_type = p_stock_type;
    SET v_pre_order_dir = p_pre_order_dir;
    SET v_pre_order_type = p_pre_order_type;
    SET v_pre_order_price = p_pre_order_price;
    SET v_trig_type = p_trig_type;
    SET v_trig_price = p_trig_price;
    SET v_trig_date = p_trig_date;
    SET v_trig_time = p_trig_time;
    SET v_pre_order_qty = p_pre_order_qty;
    SET v_pre_price_type = p_pre_price_type;
    SET v_price_offset = p_price_offset;
    SET v_pre_begin_date = p_pre_begin_date;
    SET v_pre_end_date = p_pre_end_date;
    SET v_pre_begin_time = p_pre_begin_time;
    SET v_pre_end_time = p_pre_end_time;
    SET v_is_trace = p_is_trace;
    SET v_price_up = p_price_up;
    SET v_order_no_str = p_order_no_str;
    SET v_keep_trace = p_keep_trace;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pre_order_id = 0;
    SET v_pre_order_date = date_format(curdate(),'%Y%m%d');
    SET v_pre_order_time = date_format(curtime(),'%H%i%s');
    SET v_pre_order_status = "0";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_交易_新增预埋订单】*/
        call db_tdsecu.pra_tdsetd_AddPreOrder(
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
            v_stock_type,
            v_pre_order_dir,
            v_pre_order_type,
            v_pre_order_price,
            v_trig_type,
            v_trig_price,
            v_trig_date,
            v_trig_time,
            v_pre_order_qty,
            v_pre_price_type,
            v_price_offset,
            v_pre_begin_date,
            v_pre_end_date,
            v_pre_begin_time,
            v_pre_end_time,
            v_is_trace,
            v_price_up,
            v_order_no_str,
            v_keep_trace,
            v_error_code,
            v_error_info,
            v_pre_order_id,
            v_pre_order_date,
            v_pre_order_time,
            v_pre_order_status);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.42.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增预埋订单出现错误！',v_mysql_message);
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
    SET p_pre_order_id = v_pre_order_id;
    SET p_pre_order_date = v_pre_order_date;
    SET p_pre_order_time = v_pre_order_time;
    SET p_pre_order_status = v_pre_order_status;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_修改预埋订单状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_ModiPreOrderStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_ModiPreOrderStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pre_order_id bigint,
    IN p_order_id bigint,
    IN p_order_date int,
    IN p_order_time int,
    IN p_pre_order_status varchar(2),
    IN p_order_no_str varchar(2048),
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
    declare v_pre_order_id bigint;
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_pre_order_status varchar(2);
    declare v_order_no_str varchar(2048);
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
    SET v_pre_order_id = p_pre_order_id;
    SET v_order_id = p_order_id;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_pre_order_status = p_pre_order_status;
    SET v_order_no_str = p_order_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_交易_修改预埋订单状态】*/
        call db_tdsecu.pra_tdsetd_ModiPreOrderStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pre_order_id,
            v_order_id,
            v_order_date,
            v_order_time,
            v_pre_order_status,
            v_order_no_str,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.43.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_修改预埋订单状态出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_获取预埋订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_GetPreOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_GetPreOrder(
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
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
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
    OUT p_trig_type int,
    OUT p_trig_price decimal(16,9),
    OUT p_trig_time int
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
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
    declare v_trig_type int;
    declare v_trig_price decimal(16,9);
    declare v_trig_time int;

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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
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
    SET v_trig_type = 0;
    SET v_trig_price = 0;
    SET v_trig_time = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_获取预埋订单信息】*/
    call db_tdsecu.pra_tdsetd_GetPreOrder(
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
        v_init_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_crncy_type,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_stock_type,
        v_pre_order_date,
        v_pre_order_time,
        v_pre_order_dir,
        v_pre_order_type,
        v_pre_order_price,
        v_pre_order_qty,
        v_pre_order_status,
        v_trig_type,
        v_trig_price,
        v_trig_time);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.44.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_获取预埋订单信息出现错误！',v_mysql_message);
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
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
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
    SET p_trig_type = v_trig_type;
    SET p_trig_price = v_trig_price;
    SET p_trig_time = v_trig_time;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_新增组合批量订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_AddComboBatchOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_AddComboBatchOrder(
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
    IN p_trade_code_no_str varchar(4096),
    IN p_target_code_no_str varchar(4096),
    IN p_asset_type_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_busi_limit_str varchar(2048),
    IN p_exgp_busi_config_str varchar(64),
    IN p_exgp_avail_amt decimal(18,4),
    IN p_exgp_T_hk_buy_total_amt decimal(18,4),
    IN p_exgp_T_hk_sell_total_amt decimal(18,4),
    IN p_exgp_T1_hk_buy_total_amt decimal(18,4),
    IN p_exgp_T1_hk_sell_total_amt decimal(18,4),
    IN p_asac_busi_config_str varchar(64),
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
    IN p_market_price_ratio decimal(18,12),
    IN p_order_batch_no int,
    IN p_order_price_str varchar(4096),
    IN p_order_qty_str varchar(4096),
    IN p_order_amt_str varchar(4096),
    IN p_price_type_str varchar(2048),
    IN p_all_fee_str varchar(4096),
    IN p_par_value_str varchar(4096),
    IN p_intrst_days_str varchar(2048),
    IN p_impawn_ratio_str varchar(4096),
    IN p_net_price_flag_str varchar(2048),
    IN p_bond_accr_intrst_str varchar(4096),
    IN p_bond_rate_type_str varchar(4096),
    IN p_min_unit_str varchar(2048),
    IN p_up_limit_price_str varchar(4096),
    IN p_down_limit_price_str varchar(4096),
    IN p_last_price_str varchar(4096),
    IN p_capit_reback_days_str varchar(2048),
    IN p_posi_reback_days_str varchar(2048),
    IN p_split_str varchar(4),
    IN p_order_oper_way varchar(2),
    IN p_cost_calc_type int,
    IN p_combo_code varchar(32),
    IN p_combo_copies decimal(18,2),
    IN p_comm_id_str varchar(2048),
    IN p_order_dir_str varchar(1024),
    IN p_combo_posi_id_str varchar(2048),
    IN p_subscription_trade_mark_str varchar(4096),
    IN p_purchase_trade_mark_str varchar(4096),
    IN p_target_purchase_trade_mark_str varchar(4096),
    IN p_rede_trade_mark_str varchar(4096),
    IN p_first_minimum_amt_str varchar(4096),
    IN p_minimum_purchase_amt_str varchar(4096),
    IN p_minimum_subscription_amt_str varchar(4096),
    IN p_minimum_rede_share_str varchar(4096),
    IN p_minimum_holding_share_str varchar(4096),
    IN p_fund_manager_str varchar(4096),
    IN p_target_fund_manager_str varchar(4096),
    IN p_charging_method_str varchar(4096),
    IN p_target_charging_method_str varchar(4096),
    IN p_record_count int,
    IN p_registration_agency_str varchar(4096),
    IN p_trade_acco varchar(32),
    IN p_asset_acco_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_id_str varchar(2048),
    OUT p_order_status_str varchar(64),
    OUT p_order_date int,
    OUT p_open_posi_date int
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
    declare v_trade_code_no_str varchar(4096);
    declare v_target_code_no_str varchar(4096);
    declare v_asset_type_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_busi_limit_str varchar(2048);
    declare v_exgp_busi_config_str varchar(64);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_asac_busi_config_str varchar(64);
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
    declare v_market_price_ratio decimal(18,12);
    declare v_order_batch_no int;
    declare v_order_price_str varchar(4096);
    declare v_order_qty_str varchar(4096);
    declare v_order_amt_str varchar(4096);
    declare v_price_type_str varchar(2048);
    declare v_all_fee_str varchar(4096);
    declare v_par_value_str varchar(4096);
    declare v_intrst_days_str varchar(2048);
    declare v_impawn_ratio_str varchar(4096);
    declare v_net_price_flag_str varchar(2048);
    declare v_bond_accr_intrst_str varchar(4096);
    declare v_bond_rate_type_str varchar(4096);
    declare v_min_unit_str varchar(2048);
    declare v_up_limit_price_str varchar(4096);
    declare v_down_limit_price_str varchar(4096);
    declare v_last_price_str varchar(4096);
    declare v_capit_reback_days_str varchar(2048);
    declare v_posi_reback_days_str varchar(2048);
    declare v_split_str varchar(4);
    declare v_order_oper_way varchar(2);
    declare v_cost_calc_type int;
    declare v_combo_code varchar(32);
    declare v_combo_copies decimal(18,2);
    declare v_comm_id_str varchar(2048);
    declare v_order_dir_str varchar(1024);
    declare v_combo_posi_id_str varchar(2048);
    declare v_subscription_trade_mark_str varchar(4096);
    declare v_purchase_trade_mark_str varchar(4096);
    declare v_target_purchase_trade_mark_str varchar(4096);
    declare v_rede_trade_mark_str varchar(4096);
    declare v_first_minimum_amt_str varchar(4096);
    declare v_minimum_purchase_amt_str varchar(4096);
    declare v_minimum_subscription_amt_str varchar(4096);
    declare v_minimum_rede_share_str varchar(4096);
    declare v_minimum_holding_share_str varchar(4096);
    declare v_fund_manager_str varchar(4096);
    declare v_target_fund_manager_str varchar(4096);
    declare v_charging_method_str varchar(4096);
    declare v_target_charging_method_str varchar(4096);
    declare v_record_count int;
    declare v_registration_agency_str varchar(4096);
    declare v_trade_acco varchar(32);
    declare v_asset_acco_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_id_str varchar(2048);
    declare v_order_status_str varchar(64);
    declare v_order_date int;
    declare v_open_posi_date int;
    declare v_is_record_jour int;
    declare v_comm_opor int;
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_compli_trig_id bigint;
    declare v_contra_no varchar(32);
    declare v_exist_debt_flag int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_exch_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_amt decimal(18,4);
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
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_exgp_avail_qty decimal(18,2);
    declare v_exgp_target_code_avail_qty decimal(18,2);
    declare v_exgp_trade_code_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_asac_target_code_avail_qty decimal(18,2);
    declare v_asac_trade_code_avail_qty decimal(18,2);
    declare v_price_type int;
    declare v_combo_posi_id bigint;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_target_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_fund_manager varchar(64);
    declare v_target_fund_manager varchar(64);
    declare v_charging_method int;
    declare v_target_charging_method int;
    declare v_registration_agency varchar(32);
    declare v_order_limit_time int;
    declare v_order_ctrl_qty decimal(18,2);
    declare v_order_ctrl_amt decimal(18,4);
    declare v_per_secu_posi_ratio decimal(18,12);
    declare v_open_close_permission int;
    declare v_exter_comm_flag int;
    declare v_avail_cal_flag int;
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_date int;
    declare v_comm_executor int;
    declare v_comm_oper_way varchar(2);
    declare v_comm_amt decimal(18,4);
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_frozen_amt decimal(18,4);
    declare v_frozen_qty decimal(18,2);
    declare v_comm_dir int;
    declare v_comm_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_status varchar(2);
    declare v_strike_status varchar(2);
    declare v_order_status varchar(2);
    declare v_pass_status varchar(2);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_trade_commis decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_order_id bigint;
    declare v_order_time int;
    declare v_update_times int;
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_busi_opor_no int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_waste_qty decimal(18,2);
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
    SET v_trade_code_no_str = p_trade_code_no_str;
    SET v_target_code_no_str = p_target_code_no_str;
    SET v_asset_type_str = p_asset_type_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_exgp_busi_config_str = p_exgp_busi_config_str;
    SET v_exgp_avail_amt = p_exgp_avail_amt;
    SET v_exgp_T_hk_buy_total_amt = p_exgp_T_hk_buy_total_amt;
    SET v_exgp_T_hk_sell_total_amt = p_exgp_T_hk_sell_total_amt;
    SET v_exgp_T1_hk_buy_total_amt = p_exgp_T1_hk_buy_total_amt;
    SET v_exgp_T1_hk_sell_total_amt = p_exgp_T1_hk_sell_total_amt;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
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
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_price_str = p_order_price_str;
    SET v_order_qty_str = p_order_qty_str;
    SET v_order_amt_str = p_order_amt_str;
    SET v_price_type_str = p_price_type_str;
    SET v_all_fee_str = p_all_fee_str;
    SET v_par_value_str = p_par_value_str;
    SET v_intrst_days_str = p_intrst_days_str;
    SET v_impawn_ratio_str = p_impawn_ratio_str;
    SET v_net_price_flag_str = p_net_price_flag_str;
    SET v_bond_accr_intrst_str = p_bond_accr_intrst_str;
    SET v_bond_rate_type_str = p_bond_rate_type_str;
    SET v_min_unit_str = p_min_unit_str;
    SET v_up_limit_price_str = p_up_limit_price_str;
    SET v_down_limit_price_str = p_down_limit_price_str;
    SET v_last_price_str = p_last_price_str;
    SET v_capit_reback_days_str = p_capit_reback_days_str;
    SET v_posi_reback_days_str = p_posi_reback_days_str;
    SET v_split_str = p_split_str;
    SET v_order_oper_way = p_order_oper_way;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_combo_code = p_combo_code;
    SET v_combo_copies = p_combo_copies;
    SET v_comm_id_str = p_comm_id_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_combo_posi_id_str = p_combo_posi_id_str;
    SET v_subscription_trade_mark_str = p_subscription_trade_mark_str;
    SET v_purchase_trade_mark_str = p_purchase_trade_mark_str;
    SET v_target_purchase_trade_mark_str = p_target_purchase_trade_mark_str;
    SET v_rede_trade_mark_str = p_rede_trade_mark_str;
    SET v_first_minimum_amt_str = p_first_minimum_amt_str;
    SET v_minimum_purchase_amt_str = p_minimum_purchase_amt_str;
    SET v_minimum_subscription_amt_str = p_minimum_subscription_amt_str;
    SET v_minimum_rede_share_str = p_minimum_rede_share_str;
    SET v_minimum_holding_share_str = p_minimum_holding_share_str;
    SET v_fund_manager_str = p_fund_manager_str;
    SET v_target_fund_manager_str = p_target_fund_manager_str;
    SET v_charging_method_str = p_charging_method_str;
    SET v_target_charging_method_str = p_target_charging_method_str;
    SET v_record_count = p_record_count;
    SET v_registration_agency_str = p_registration_agency_str;
    SET v_trade_acco = p_trade_acco;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_id_str = " ";
    SET v_order_status_str = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_is_record_jour = 1;
    SET v_comm_opor = 0;
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_compli_trig_id = 0;
    SET v_contra_no = " ";
    SET v_exist_debt_flag = 0;
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_exch_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_amt = 0;
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
    SET v_min_unit = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_exgp_avail_qty = 0;
    SET v_exgp_target_code_avail_qty = 0;
    SET v_exgp_trade_code_avail_qty = 0;
    SET v_asac_avail_qty = 0;
    SET v_asac_target_code_avail_qty = 0;
    SET v_asac_trade_code_avail_qty = 0;
    SET v_price_type = 0;
    SET v_combo_posi_id = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_target_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_fund_manager = " ";
    SET v_target_fund_manager = " ";
    SET v_charging_method = 0;
    SET v_target_charging_method = 0;
    SET v_registration_agency = " ";
    SET v_order_limit_time = 0;
    SET v_order_ctrl_qty = 0;
    SET v_order_ctrl_amt = 0;
    SET v_per_secu_posi_ratio = 0;
    SET v_open_close_permission = 0;
    SET v_exter_comm_flag = 0;
    SET v_avail_cal_flag = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_executor = 0;
    SET v_comm_oper_way = " ";
    SET v_comm_amt = 0;
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_frozen_amt = 0;
    SET v_frozen_qty = 0;
    SET v_comm_dir = 0;
    SET v_comm_qty = 0;
    SET v_calc_dir = 1;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_status = "0";
    SET v_strike_status = "0";
    SET v_order_status = "0";
    SET v_pass_status = "0";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_trade_commis = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_remark_info = " ";
    SET v_order_id = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_busi_opor_no = 0;
    SET v_wtdraw_qty = 0;
    SET v_waste_qty = 0;
    SET v_combo_status = "0";
    SET v_combo_cost = 0;
    SET v_combo_market_value = 0;
    SET v_realize_pandl = 0;
    SET v_sum_realize_pandl = 0;

    
    label_pro:BEGIN
    

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @订单序号串# = ""; */
    set v_order_id_str = "";

    /* set @订单状态串# = ""; */
    set v_order_status_str = "";

    /* set @指令下达人# = 0; */
    set v_comm_opor = 0;

    /* set @外部编号# = 0; */
    set v_external_no = 0;

    /* set @指令序号# = 0; */
    set v_comm_id = 0;

    /* set @指令批号# = 0; */
    set v_comm_batch_no = 0;

    /* set @指令变动金额# = 0; */
    set v_comm_occur_amt = 0;

    /* set @指令变动数量# = 0; */
    set v_comm_occur_qty = 0;

    /* set @合规触警序号# = 0; */
    set v_compli_trig_id = 0;

    /* set @合同编号# = ""; */
    set v_contra_no = "";

    /* set @存在负债标志# = 《存在负债标志-不存在》; */
    set v_exist_debt_flag = 1;

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

        /* set @订单方向#=cast(substring(@订单方向串#,1,LOCATE(@分隔符#,@订单方向串#)-1) as SIGNED); */
        set v_order_dir=cast(substring(v_order_dir_str,1,LOCATE(v_split_str,v_order_dir_str)-1) as SIGNED);

        /* [检查报错返回][@订单方向# <> 《订单方向-基金申购》 and @订单方向# <> 《订单方向-基金赎回》 and @订单方向# <> 《订单方向-买入》 and @订单方向# <> 《订单方向-卖出》 and @订单方向# <> 《订单方向-基金转换》][639][@订单方向#] */
        if v_order_dir <> 9 and v_order_dir <> 10 and v_order_dir <> 1 and v_order_dir <> 2 and v_order_dir <> 12 then
            ROLLBACK;
            SET v_error_code = "tdsecuT.4.45.639";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单方向=",v_order_dir),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单方向=",v_order_dir);
            end if;
            leave label_pro;
        end if;


        /* set @订单价格#=cast(substring(@订单价格串#,1,LOCATE(@分隔符#,@订单价格串#)-1) as decimal(16,9)); */
        set v_order_price=cast(substring(v_order_price_str,1,LOCATE(v_split_str,v_order_price_str)-1) as decimal(16,9));

        /* set @订单数量#=cast(substring(@订单数量串#,1,LOCATE(@分隔符#,@订单数量串#)-1) as decimal(18,2)); */
        set v_order_qty=cast(substring(v_order_qty_str,1,LOCATE(v_split_str,v_order_qty_str)-1) as decimal(18,2));

        /* set @订单金额#=cast(substring(@订单金额串#,1,LOCATE(@分隔符#,@订单金额串#)-1) as decimal(18,4)); */
        set v_order_amt=cast(substring(v_order_amt_str,1,LOCATE(v_split_str,v_order_amt_str)-1) as decimal(18,4));

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

        /* set @最小单位#=cast(substring(@最小单位串#,1,LOCATE(@分隔符#,@最小单位串#)-1) as SIGNED); */
        set v_min_unit=cast(substring(v_min_unit_str,1,LOCATE(v_split_str,v_min_unit_str)-1) as SIGNED);

        /* set @涨停价#=cast(substring(@涨停价串#,1,LOCATE(@分隔符#,@涨停价串#)-1) as decimal(16,9)); */
        set v_up_limit_price=cast(substring(v_up_limit_price_str,1,LOCATE(v_split_str,v_up_limit_price_str)-1) as decimal(16,9));

        /* set @跌停价#=cast(substring(@跌停价串#,1,LOCATE(@分隔符#,@跌停价串#)-1) as decimal(16,9)); */
        set v_down_limit_price=cast(substring(v_down_limit_price_str,1,LOCATE(v_split_str,v_down_limit_price_str)-1) as decimal(16,9));

        /* set @最新价#=cast(substring(@最新价串#,1,LOCATE(@分隔符#,@最新价串#)-1) as decimal(16,9)); */
        set v_last_price=cast(substring(v_last_price_str,1,LOCATE(v_split_str,v_last_price_str)-1) as decimal(16,9));

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

        /* set @指令序号#=cast(substring(@指令序号串#,1,LOCATE(@分隔符#,@指令序号串#)-1) as SIGNED); */
        set v_comm_id=cast(substring(v_comm_id_str,1,LOCATE(v_split_str,v_comm_id_str)-1) as SIGNED);

        /* set @价格类型#=cast(substring(@价格类型串#,1,LOCATE(@分隔符#,@价格类型串#)-1) as SIGNED); */
        set v_price_type=cast(substring(v_price_type_str,1,LOCATE(v_split_str,v_price_type_str)-1) as SIGNED);

        /* set @组合持仓序号#=cast(substring(@组合持仓序号串#,1,LOCATE(@分隔符#,@组合持仓序号串#)-1) as SIGNED); */
        set v_combo_posi_id=cast(substring(v_combo_posi_id_str,1,LOCATE(v_split_str,v_combo_posi_id_str)-1) as SIGNED);

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

        /* set @下单限制时间#=0; */
        set v_order_limit_time=0;

        /* set @单笔数量控制#=0; */
        set v_order_ctrl_qty=0;

        /* set @单笔金额控制#=0; */
        set v_order_ctrl_amt=0;

        /* set @单券持仓比例#=0; */
        set v_per_secu_posi_ratio=0;

        /* set @开平仓权限# =《开平仓权限-不限制》; */
        set v_open_close_permission =0;

        /* set @体外指令标志# = 《体外指令标志-体内》; */
        set v_exter_comm_flag = 1;

        /* set @可用计算标志# = 0; */
        set v_avail_cal_flag = 0;

        /* set @订单日期# = @初始化日期#; */
        set v_order_date = v_init_date;

        /* if @订单方向# = 《订单方向-基金申购》 then */
        if v_order_dir = 9 then

            /* set @订单数量# = @订单金额#; */
            set v_order_qty = v_order_amt;

            /* set @订单价格# = 1; */
            set v_order_price = 1;

        /* elseif @订单方向# = 《订单方向-基金赎回》 then */
        elseif v_order_dir = 10 then

            /* set @订单价格# = 0; */
            set v_order_price = 0;
        end if;
        #如果是指令下单，校验指令信息

        /* if @指令序号# <> 0 then */
        if v_comm_id <> 0 then

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
                SET v_error_code = "tdsecuT.4.45.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_校验订单指令出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

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
            SET v_error_code = "tdsecuT.4.45.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算交易冻结金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @订单冻结金额# = @交易冻结金额#; */
        set v_order_frozen_amt = v_trade_frozen_amt;

        /* set @订单冻结数量# = @交易冻结数量#; */
        set v_order_frozen_qty = v_trade_frozen_qty;
        #检查业务合法性。应放在事务层第一个处理

        /* 调用【原子_交易证券_交易_检查场外基金交易业务合法性】*/
        call db_tdsecu.pra_tdsetd_CheckOutExchData(
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
            v_order_dir,
            v_order_qty,
            v_order_price,
            v_order_frozen_amt,
            v_up_limit_price,
            v_down_limit_price,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_busi_limit_str,
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
            v_record_count,
            v_exgp_avail_qty,
            v_posi_reback_days,
            v_error_code,
            v_error_info,
            v_frozen_amt,
            v_frozen_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.45.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_检查场外基金交易业务合法性出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #交易证券子系统检查，检查交易可用资金、可用持仓等

        /* set @组合代码# = " "; */
        set v_combo_code = " ";

        /* 调用【原子_交易证券_交易_校验新增订单】*/
        call db_tdsecu.pra_tdsetd_CheckAddOrder(
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
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_code_no,
            v_trade_code_no,
            v_combo_code,
            v_crncy_type,
            v_exch_crncy_type,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_exgp_busi_config_str,
            v_exgp_avail_amt,
            v_exgp_T_hk_buy_total_amt,
            v_exgp_T_hk_sell_total_amt,
            v_exgp_T1_hk_buy_total_amt,
            v_exgp_T1_hk_sell_total_amt,
            v_asac_busi_config_str,
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
            v_capit_reback_days,
            v_posi_reback_days,
            v_order_dir,
            v_order_qty,
            v_price_type,
            v_order_price,
            v_order_frozen_amt,
            v_impawn_ratio,
            v_stock_type,
            v_min_unit,
            v_up_limit_price,
            v_down_limit_price,
            v_last_price,
            v_order_oper_way,
            v_order_limit_time,
            v_order_ctrl_qty,
            v_order_ctrl_amt,
            v_per_secu_posi_ratio,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.45.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_校验新增订单出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #如果是指令订单，需要检查订单数量是否超过指令数量，需考虑并发问题

        /* if @指令序号# > 0 then */
        if v_comm_id > 0 then

            /* set @指令方向# = @订单方向#; */
            set v_comm_dir = v_order_dir;

            /* set @指令数量# = @订单数量#; */
            set v_comm_qty = v_order_qty;

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
                SET v_error_code = "tdsecuT.4.45.999";
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
                SET v_error_code = "tdsecuT.4.45.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_下单更新指令出现错误！',v_mysql_message);
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
                SET v_error_code = "tdsecuT.4.45.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;
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
            SET v_error_code = "tdsecuT.4.45.999";
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
        #新增订单记录

        /* set @申报日期# = 0; */
        set v_report_date = 0;

        /* set @申报时间# = 0; */
        set v_report_time = 0;

        /* set @申报编号# = " "; */
        set v_report_no = " ";
        #订单表费用相关字段修改用来存取成交相关费用，订单下达时，费用全部填零；要求订单冻结金额包含费用；

        /* set @全部费用# = 0; */
        set v_all_fee = 0;

        /* set @交易佣金# = 0; */
        set v_trade_commis = 0;

        /* set @印花税# = 0; */
        set v_stamp_tax = 0;

        /* set @过户费# = 0; */
        set v_trans_fee = 0;

        /* set @经手费# = 0; */
        set v_brkage_fee = 0;

        /* set @证管费# = 0; */
        set v_SEC_charges = 0;

        /* set @其他费用# = 0; */
        set v_other_fee = 0;

        /* set @其他佣金# = 0; */
        set v_other_commis = 0;

        /* set @交易征费# = 0; */
        set v_trade_tax = 0;

        /* set @交易费# = 0; */
        set v_trade_cost_fee = 0;

        /* set @交易系统使用费# = 0; */
        set v_trade_system_use_fee = 0;

        /* set @股份交收费# = 0; */
        set v_stock_settle_fee = 0;

        /* set @备注信息#="新增组合订单！"; */
        set v_remark_info="新增组合订单！";

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
            SET v_error_code = "tdsecuT.4.45.999";
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

        /* set @订单状态串# = concat(@订单状态串#,@订单状态#,";"); */
        set v_order_status_str = concat(v_order_status_str,v_order_status,";");
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
            SET v_error_code = "tdsecuT.4.45.999";
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

        /* set @业务操作员编号# = @操作员编号#; */
        set v_busi_opor_no = v_opor_no;

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
            SET v_error_code = "tdsecuT.4.45.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @订单批号# > 0 then */
        if v_order_batch_no > 0 then

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
                SET v_error_code = "tdsecuT.4.45.999";
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

        /* set @订单方向串#=substring(@订单方向串#,LOCATE(@分隔符#,@订单方向串#)+1); */
        set v_order_dir_str=substring(v_order_dir_str,LOCATE(v_split_str,v_order_dir_str)+1);

        /* set @订单价格串#=substring(@订单价格串#,LOCATE(@分隔符#,@订单价格串#)+1); */
        set v_order_price_str=substring(v_order_price_str,LOCATE(v_split_str,v_order_price_str)+1);

        /* set @订单数量串#=substring(@订单数量串#,LOCATE(@分隔符#,@订单数量串#)+1); */
        set v_order_qty_str=substring(v_order_qty_str,LOCATE(v_split_str,v_order_qty_str)+1);

        /* set @订单金额串#=substring(@订单金额串#,LOCATE(@分隔符#,@订单金额串#)+1); */
        set v_order_amt_str=substring(v_order_amt_str,LOCATE(v_split_str,v_order_amt_str)+1);

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

        /* set @最小单位串#=substring(@最小单位串#,LOCATE(@分隔符#,@最小单位串#)+1); */
        set v_min_unit_str=substring(v_min_unit_str,LOCATE(v_split_str,v_min_unit_str)+1);

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

        /* set @指令序号串#=substring(@指令序号串#,LOCATE(@分隔符#,@指令序号串#)+1); */
        set v_comm_id_str=substring(v_comm_id_str,LOCATE(v_split_str,v_comm_id_str)+1);

        /* set @价格类型串#=substring(@价格类型串#,LOCATE(@分隔符#,@价格类型串#)+1); */
        set v_price_type_str=substring(v_price_type_str,LOCATE(v_split_str,v_price_type_str)+1);

        /* set @组合持仓序号串#=substring(@组合持仓序号串#,LOCATE(@分隔符#,@组合持仓序号串#)+1); */
        set v_combo_posi_id_str=substring(v_combo_posi_id_str,LOCATE(v_split_str,v_combo_posi_id_str)+1);

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

    /* [事务结束] */
    COMMIT;

    end while;

    /* [事务开始] */
    START TRANSACTION;

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
        SET v_error_code = "tdsecuT.4.45.999";
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
            SET v_error_code = "tdsecuT.4.45.999";
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
            SET v_error_code = "tdsecuT.4.45.999";
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

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_id_str = v_order_id_str;
    SET p_order_status_str = v_order_status_str;
    SET p_order_date = v_order_date;
    SET p_open_posi_date = v_open_posi_date;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_修改预埋订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_ModiPreOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_ModiPreOrderInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pre_order_id bigint,
    IN p_pre_order_type int,
    IN p_is_trace int,
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
    declare v_pre_order_id bigint;
    declare v_pre_order_type int;
    declare v_is_trace int;
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
    SET v_pre_order_id = p_pre_order_id;
    SET v_pre_order_type = p_pre_order_type;
    SET v_is_trace = p_is_trace;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_交易_修改预埋订单信息】*/
        call db_tdsecu.pra_tdsetd_ModiPreOrderInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pre_order_id,
            v_pre_order_type,
            v_is_trace,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.47.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_修改预埋订单信息出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_更新改单状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_UpdateModiOrderStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_UpdateModiOrderStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_modi_order_date int,
    IN p_modi_order_id bigint,
    IN p_modi_order_status varchar(2),
    IN p_remark_info varchar(255),
    IN p_new_order_id bigint,
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
    declare v_modi_order_date int;
    declare v_modi_order_id bigint;
    declare v_modi_order_status varchar(2);
    declare v_remark_info varchar(255);
    declare v_new_order_id bigint;
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
    SET v_modi_order_date = p_modi_order_date;
    SET v_modi_order_id = p_modi_order_id;
    SET v_modi_order_status = p_modi_order_status;
    SET v_remark_info = p_remark_info;
    SET v_new_order_id = p_new_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_交易_更新改单状态】*/
        call db_tdsecu.pra_tdsetd_UpdateModiOrderStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_modi_order_date,
            v_modi_order_id,
            v_modi_order_status,
            v_remark_info,
            v_new_order_id,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.61.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_更新改单状态出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_更新获取改单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_UpdateGetModiOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_UpdateGetModiOrder(
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
    OUT p_modi_order_id bigint,
    OUT p_modi_order_date int,
    OUT p_modi_order_time int,
    OUT p_modi_batch_no int,
    OUT p_modi_order_price decimal(16,9),
    OUT p_modi_order_qty decimal(18,2),
    OUT p_modi_price_type int,
    OUT p_exch_no int,
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_order_oper_way varchar(2),
    OUT p_busi_opor_no int
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
    declare v_modi_order_id bigint;
    declare v_modi_order_date int;
    declare v_modi_order_time int;
    declare v_modi_batch_no int;
    declare v_modi_order_price decimal(16,9);
    declare v_modi_order_qty decimal(18,2);
    declare v_modi_price_type int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_asset_type int;

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
    SET v_modi_order_id = 0;
    SET v_modi_order_date = date_format(curdate(),'%Y%m%d');
    SET v_modi_order_time = date_format(curtime(),'%H%i%s');
    SET v_modi_batch_no = 0;
    SET v_modi_order_price = 0;
    SET v_modi_order_qty = 0;
    SET v_modi_price_type = 0;
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_asset_type = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_交易_更新获取改单信息】*/
        call db_tdsecu.pra_tdsetd_UpdateGetModiOrder(
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
            v_init_date,
            v_modi_order_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_crncy_type,
            v_exch_crncy_type,
            v_exch_no,
            v_stock_code_no,
            v_stock_code,
            v_asset_type,
            v_modi_order_date,
            v_modi_order_time,
            v_modi_batch_no,
            v_modi_order_price,
            v_modi_order_qty,
            v_modi_price_type,
            v_order_oper_way,
            v_busi_opor_no);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.62.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_更新获取改单信息出现错误！',v_mysql_message);
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
    SET p_modi_order_id = v_modi_order_id;
    SET p_modi_order_date = v_modi_order_date;
    SET p_modi_order_time = v_modi_order_time;
    SET p_modi_batch_no = v_modi_batch_no;
    SET p_modi_order_price = v_modi_order_price;
    SET p_modi_order_qty = v_modi_order_qty;
    SET p_modi_price_type = v_modi_price_type;
    SET p_exch_no = v_exch_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_order_oper_way = v_order_oper_way;
    SET p_busi_opor_no = v_busi_opor_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_处理改单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_DealModiOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_DealModiOrder(
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
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_target_code_no int,
    IN p_trade_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_modi_order_date int,
    IN p_modi_order_id bigint,
    IN p_modi_batch_no int,
    IN p_external_no bigint,
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_comm_opor int,
    IN p_order_date int,
    IN p_order_dir int,
    IN p_price_type int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
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
    IN p_net_price_flag int,
    IN p_intrst_days int,
    IN p_par_value decimal(16,9),
    IN p_impawn_ratio decimal(18,12),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_compli_trig_id bigint,
    IN p_order_oper_way varchar(2),
    IN p_exter_comm_flag int,
    IN p_cost_calc_type int,
    IN p_asset_acco_type int,
    IN p_contra_no varchar(32),
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
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_modi_order_date int;
    declare v_modi_order_id bigint;
    declare v_modi_batch_no int;
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_order_date int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
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
    declare v_impawn_ratio decimal(18,12);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_compli_trig_id bigint;
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_cost_calc_type int;
    declare v_asset_acco_type int;
    declare v_contra_no varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_error_code varchar(32);
    declare v_tmp_error_info varchar(255);
    declare v_modi_order_status varchar(2);
    declare v_new_order_id bigint;
    declare v_remark_info varchar(255);
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_nav_asset decimal(18,4);
    declare v_order_batch_no int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_order_status varchar(2);
    declare v_pass_status varchar(2);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_exist_debt_flag int;
    declare v_order_id bigint;
    declare v_order_time int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_target_code_no = p_target_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_modi_order_date = p_modi_order_date;
    SET v_modi_order_id = p_modi_order_id;
    SET v_modi_batch_no = p_modi_batch_no;
    SET v_external_no = p_external_no;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_opor = p_comm_opor;
    SET v_order_date = p_order_date;
    SET v_order_dir = p_order_dir;
    SET v_price_type = p_price_type;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
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
    SET v_net_price_flag = p_net_price_flag;
    SET v_intrst_days = p_intrst_days;
    SET v_par_value = p_par_value;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_order_oper_way = p_order_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_contra_no = p_contra_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_error_code = "0";
    SET v_tmp_error_info = " ";
    SET v_modi_order_status = " ";
    SET v_new_order_id = 0;
    SET v_remark_info = " ";
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_nav_asset = 0;
    SET v_order_batch_no = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_order_status = "0";
    SET v_pass_status = "0";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_exist_debt_flag = 0;
    SET v_order_id = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

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

    /* if @错误编码# <> 0 then */
    if v_error_code <> 0 then

        /* set @临时_错误编码# = @错误编码#; */
        set v_tmp_error_code = v_error_code;

        /* set @临时_错误信息# = @错误信息#; */
        set v_tmp_error_info = v_error_info;

        /* set @改单状态# = 《改单状态-失败》; */
        set v_modi_order_status = "4";

        /* set @新订单序号# = 0; */
        set v_new_order_id = 0;

        /* set @备注信息# = "改单失败！未能通过合规检查！"; */
        set v_remark_info = "改单失败！未能通过合规检查！";

        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_交易证券_交易_更新改单状态】*/
            call db_tdsecu.pra_tdsetd_UpdateModiOrderStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_modi_order_date,
                v_modi_order_id,
                v_modi_order_status,
                v_remark_info,
                v_new_order_id,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.4.63.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_更新改单状态出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


        /* [事务结束] */
        COMMIT;


        /* set @错误编码# = @临时_错误编码#; */
        set v_error_code = v_tmp_error_code;

        /* set @错误信息# = @临时_错误信息#; */
        set v_error_info = v_tmp_error_info;
        leave label_pro;
    end if;

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
        SET v_error_code = "tdsecuT.4.63.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算交易冻结金额和数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @订单冻结金额# = @交易冻结金额#; */
    set v_order_frozen_amt = v_trade_frozen_amt;

    /* set @订单冻结数量# = @交易冻结数量#; */
    set v_order_frozen_qty = v_trade_frozen_qty;
    #获取客户净资产
    #[原子_交易证券_交易_获取客户净资产]

    /* set @净资产# = 0; */
    set v_nav_asset = 0;

    /* [事务开始] */
    START TRANSACTION;


        /* set @订单批号# = 0; */
        set v_order_batch_no = 0;

        /* set @目标证券代码# = ""; */
        set v_target_stock_code = "";

        /* set @目标证券代码编号# = 0; */
        set v_target_stock_code_no = 0;

        /* set @备注信息# = "改单生成订单！"; */
        set v_remark_info = "改单生成订单！";

        /* set @登记机构# = ""; */
        set v_registration_agency = "";

        /* set @交易账户# = ""; */
        set v_trade_acco = "";
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
            SET v_error_code = "tdsecuT.4.63.999";
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

        /* set @申报日期# = 0; */
        set v_report_date = 0;

        /* set @申报时间# = 0; */
        set v_report_time = 0;

        /* set @申报编号# = " "; */
        set v_report_no = " ";

        /* set @组合代码# = " "; */
        set v_combo_code = " ";

        /* set @组合持仓序号#=0; */
        set v_combo_posi_id=0;

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
            SET v_error_code = "tdsecuT.4.63.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增订单出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @改单状态# = 《改单状态-成功》; */
        set v_modi_order_status = "3";

        /* set @新订单序号# = @订单序号#; */
        set v_new_order_id = v_order_id;

        /* set @备注信息# = "改单成功！"; */
        set v_remark_info = "改单成功！";

        /* 调用【原子_交易证券_交易_更新改单状态】*/
        call db_tdsecu.pra_tdsetd_UpdateModiOrderStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_modi_order_date,
            v_modi_order_id,
            v_modi_order_status,
            v_remark_info,
            v_new_order_id,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.63.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_更新改单状态出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_获取订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_GetOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_GetOrderInfo(
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
    OUT p_order_oper_way varchar(2),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_time int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_status varchar(2),
    OUT p_price_type int,
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_wtdraw_time int,
    OUT p_exter_comm_flag int,
    OUT p_cost_calc_type int,
    OUT p_combo_code varchar(32),
    OUT p_combo_posi_id bigint,
    OUT p_strategy_id bigint,
    OUT p_order_batch_no int,
    OUT p_out_acco varchar(32),
    OUT p_asset_acco_type int,
    OUT p_contra_no varchar(32),
    OUT p_exist_debt_flag int,
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
    declare v_order_oper_way varchar(2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_time int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_frozen_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_status varchar(2);
    declare v_price_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_wtdraw_time int;
    declare v_exter_comm_flag int;
    declare v_cost_calc_type int;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_strategy_id bigint;
    declare v_order_batch_no int;
    declare v_out_acco varchar(32);
    declare v_asset_acco_type int;
    declare v_contra_no varchar(32);
    declare v_exist_debt_flag int;
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
    SET v_order_id = p_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_opor_no = 0;
    SET v_order_oper_way = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_frozen_qty = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_status = "0";
    SET v_price_type = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_all_fee = 0;
    SET v_wtdraw_qty = 0;
    SET v_wtdraw_time = date_format(curtime(),'%H%i%s');
    SET v_exter_comm_flag = 0;
    SET v_cost_calc_type = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_strategy_id = 0;
    SET v_order_batch_no = 0;
    SET v_out_acco = " ";
    SET v_asset_acco_type = 0;
    SET v_contra_no = " ";
    SET v_exist_debt_flag = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_获取订单信息】*/
    call db_tdsecu.pra_tdsetd_GetOrderInfo(
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
        v_order_oper_way,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_pass_no,
        v_exch_no,
        v_stock_acco_no,
        v_stock_acco,
        v_stock_code_no,
        v_stock_code,
        v_stock_type,
        v_asset_type,
        v_comm_id,
        v_comm_batch_no,
        v_report_date,
        v_report_time,
        v_report_no,
        v_order_time,
        v_order_dir,
        v_order_price,
        v_order_qty,
        v_order_frozen_qty,
        v_order_frozen_amt,
        v_order_status,
        v_price_type,
        v_strike_qty,
        v_strike_amt,
        v_all_fee,
        v_wtdraw_qty,
        v_wtdraw_time,
        v_exter_comm_flag,
        v_cost_calc_type,
        v_combo_code,
        v_combo_posi_id,
        v_strategy_id,
        v_order_batch_no,
        v_out_acco,
        v_asset_acco_type,
        v_contra_no,
        v_exist_debt_flag,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.71.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_获取订单信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_order_oper_way = v_order_oper_way;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_time = v_order_time;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_status = v_order_status;
    SET p_price_type = v_price_type;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_all_fee = v_all_fee;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_wtdraw_time = v_wtdraw_time;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_combo_code = v_combo_code;
    SET p_combo_posi_id = v_combo_posi_id;
    SET p_strategy_id = v_strategy_id;
    SET p_order_batch_no = v_order_batch_no;
    SET p_out_acco = v_out_acco;
    SET p_asset_acco_type = v_asset_acco_type;
    SET p_contra_no = v_contra_no;
    SET p_exist_debt_flag = v_exist_debt_flag;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_获取回报订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_GetRspOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_GetRspOrderInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_report_date int,
    IN p_report_no varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_comm_id bigint,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_id bigint,
    OUT p_order_batch_no int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_status varchar(2),
    OUT p_price_type int,
    OUT p_busi_opor_no int,
    OUT p_order_oper_way varchar(2),
    OUT p_combo_code varchar(32),
    OUT p_combo_posi_id bigint,
    OUT p_mac_addr varchar(32),
    OUT p_ip_addr varchar(32),
    OUT p_strategy_id bigint,
    OUT p_target_stock_code varchar(6),
    OUT p_target_stock_code_no int,
    OUT p_contra_no varchar(32),
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_id bigint;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_status varchar(2);
    declare v_price_type int;
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_mac_addr varchar(32);
    declare v_ip_addr varchar(32);
    declare v_strategy_id bigint;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_contra_no varchar(32);
    declare v_asset_acco_type int;
    declare v_exist_debt_flag int;
    declare v_exter_comm_flag int;
    declare v_external_no bigint;
    declare v_strike_qty decimal(18,2);

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
    SET v_exch_no = p_exch_no;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_id = 0;
    SET v_order_batch_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_status = "0";
    SET v_price_type = 0;
    SET v_busi_opor_no = 0;
    SET v_order_oper_way = " ";
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_mac_addr = " ";
    SET v_ip_addr = " ";
    SET v_strategy_id = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_contra_no = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;
    SET v_exter_comm_flag = 0;
    SET v_external_no = 0;
    SET v_strike_qty = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_获取回报订单信息】*/
    call db_tdsecu.pra_tdsetd_GetRspOrderInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_out_acco,
        v_exch_no,
        v_report_date,
        v_report_no,
        v_error_code,
        v_error_info,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_stock_acco_no,
        v_stock_acco,
        v_stock_code_no,
        v_stock_code,
        v_stock_type,
        v_asset_type,
        v_comm_id,
        v_order_date,
        v_order_time,
        v_order_id,
        v_order_batch_no,
        v_order_dir,
        v_order_price,
        v_order_qty,
        v_order_frozen_amt,
        v_order_status,
        v_price_type,
        v_busi_opor_no,
        v_order_oper_way,
        v_exter_comm_flag,
        v_external_no,
        v_combo_code,
        v_combo_posi_id,
        v_mac_addr,
        v_ip_addr,
        v_strategy_id,
        v_asset_acco_type,
        v_contra_no,
        v_exist_debt_flag,
        v_strike_qty);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.72.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_获取回报订单信息出现错误！',v_mysql_message);
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
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_comm_id = v_comm_id;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_id = v_order_id;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_status = v_order_status;
    SET p_price_type = v_price_type;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_order_oper_way = v_order_oper_way;
    SET p_combo_code = v_combo_code;
    SET p_combo_posi_id = v_combo_posi_id;
    SET p_mac_addr = v_mac_addr;
    SET p_ip_addr = v_ip_addr;
    SET p_strategy_id = v_strategy_id;
    SET p_target_stock_code = v_target_stock_code;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_contra_no = v_contra_no;
    SET p_asset_acco_type = v_asset_acco_type;
    SET p_exist_debt_flag = v_exist_debt_flag;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_检查获取撤单订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_CheckGetCancelOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_CheckGetCancelOrder(
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
    OUT p_order_oper_way varchar(2),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_order_time int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_status varchar(2),
    OUT p_price_type int,
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_wtdraw_time int,
    OUT p_net_price_flag int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_combo_code varchar(32),
    OUT p_combo_posi_id bigint,
    OUT p_strategy_id bigint,
    OUT p_contra_no varchar(32),
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
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_status varchar(2);
    declare v_price_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_wtdraw_time int;
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_strategy_id bigint;
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
    SET v_order_oper_way = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_status = "0";
    SET v_price_type = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_all_fee = 0;
    SET v_wtdraw_qty = 0;
    SET v_wtdraw_time = date_format(curtime(),'%H%i%s');
    SET v_net_price_flag = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_strategy_id = 0;
    SET v_contra_no = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_检查获取撤单订单信息】*/
    call db_tdsecu.pra_tdsetd_CheckGetCancelOrder(
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
        v_order_oper_way,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_pass_no,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_stock_code,
        v_stock_type,
        v_asset_type,
        v_comm_id,
        v_comm_batch_no,
        v_order_time,
        v_order_dir,
        v_order_price,
        v_order_qty,
        v_order_frozen_amt,
        v_order_status,
        v_price_type,
        v_strike_qty,
        v_strike_amt,
        v_all_fee,
        v_wtdraw_qty,
        v_wtdraw_time,
        v_net_price_flag,
        v_bond_accr_intrst,
        v_bond_rate_type,
        v_par_value,
        v_impawn_ratio,
        v_combo_code,
        v_combo_posi_id,
        v_strategy_id,
        v_contra_no,
        v_asset_acco_type,
        v_exist_debt_flag);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.73.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_检查获取撤单订单信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_order_oper_way = v_order_oper_way;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_order_time = v_order_time;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_status = v_order_status;
    SET p_price_type = v_price_type;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_all_fee = v_all_fee;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_wtdraw_time = v_wtdraw_time;
    SET p_net_price_flag = v_net_price_flag;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_combo_code = v_combo_code;
    SET p_combo_posi_id = v_combo_posi_id;
    SET p_strategy_id = v_strategy_id;
    SET p_contra_no = v_contra_no;
    SET p_asset_acco_type = v_asset_acco_type;
    SET p_exist_debt_flag = v_exist_debt_flag;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_查询订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_order_oper_way varchar(2),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_pass_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_comm_opor int,
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_order_id bigint,
    IN p_order_dir_str varchar(1024),
    IN p_order_status_str varchar(64),
    IN p_price_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_combo_code varchar(32),
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
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_pass_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_dir_str varchar(1024);
    declare v_order_status_str varchar(64);
    declare v_price_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_combo_code varchar(32);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_order_oper_way = p_order_oper_way;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_opor = p_comm_opor;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_id = p_order_id;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_status_str = p_order_status_str;
    SET v_price_type_str = p_price_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_combo_code = p_combo_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数# > 5000 or @指定行数# <1 then */
    if v_row_count > 5000 or v_row_count <1 then

      /* set @指定行数# = 5000; */
      set v_row_count = 5000;
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串# = concat(";", @市场编号串#, ";"); */
        set v_exch_no_str = concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串# = concat(";", @证券类型串#, ";"); */
        set v_stock_type_str = concat(";", v_stock_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串# = concat(";", @订单方向串#, ";"); */
        set v_order_dir_str = concat(";", v_order_dir_str, ";");
    end if;

    /* if @订单状态串# <> " " then */
    if v_order_status_str <> " " then

        /* set @订单状态串# = concat(";", @订单状态串#, ";"); */
        set v_order_status_str = concat(";", v_order_status_str, ";");
    end if;

    /* if @价格类型串# <> " " then */
    if v_price_type_str <> " " then

        /* set @价格类型串# = concat(";", @价格类型串#, ";"); */
        set v_price_type_str = concat(";", v_price_type_str, ";");
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

    /* 调用【原子_交易证券_交易_查询订单】*/
    call db_tdsecu.pra_tdsetd_QueryOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_opor_no,
        v_order_oper_way,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_pass_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_comm_id,
        v_comm_batch_no,
        v_comm_opor,
        v_external_no,
        v_order_batch_no,
        v_order_id,
        v_order_dir_str,
        v_order_status_str,
        v_price_type_str,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_combo_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.101.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询订单出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询订单历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryOrder_His;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryOrder_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_busi_opor_no int,
    IN p_order_oper_way varchar(2),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_pass_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_comm_opor int,
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_order_id bigint,
    IN p_order_dir_str varchar(1024),
    IN p_order_status_str varchar(64),
    IN p_price_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_combo_code varchar(32),
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
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_pass_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_dir_str varchar(1024);
    declare v_order_status_str varchar(64);
    declare v_price_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_combo_code varchar(32);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_order_oper_way = p_order_oper_way;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_opor = p_comm_opor;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_id = p_order_id;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_status_str = p_order_status_str;
    SET v_price_type_str = p_price_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_combo_code = p_combo_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数# > 50000 or @指定行数# <1 then */
    if v_row_count > 50000 or v_row_count <1 then

      /* set @指定行数# = 50000; */
      set v_row_count = 50000;
    end if;

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][259][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdsecuT.4.102.259";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;

    #[检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#]
    #[检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][@开始日期#,@结束日期#]

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串# = concat(";", @市场编号串#, ";"); */
        set v_exch_no_str = concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串# = concat(";", @证券类型串#, ";"); */
        set v_stock_type_str = concat(";", v_stock_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串# = concat(";", @订单方向串#, ";"); */
        set v_order_dir_str = concat(";", v_order_dir_str, ";");
    end if;

    /* if @订单状态串# <> " " then */
    if v_order_status_str <> " " then

        /* set @订单状态串# = concat(";", @订单状态串#, ";"); */
        set v_order_status_str = concat(";", v_order_status_str, ";");
    end if;

    /* if @价格类型串# <> " " then */
    if v_price_type_str <> " " then

        /* set @价格类型串# = concat(";", @价格类型串#, ";"); */
        set v_price_type_str = concat(";", v_price_type_str, ";");
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

    /* 调用【原子_交易证券_交易_查询订单历史】*/
    call db_tdsecu.pra_tdsetd_QueryOrder_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_busi_opor_no,
        v_order_oper_way,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_pass_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_comm_id,
        v_comm_batch_no,
        v_comm_opor,
        v_external_no,
        v_order_batch_no,
        v_order_id,
        v_order_dir_str,
        v_order_status_str,
        v_price_type_str,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_combo_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.102.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询订单历史出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询订单汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryOrderSum;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryOrderSum(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_busi_opor_no int,
    IN p_pass_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_order_dir_str varchar(1024),
    IN p_order_sum_status_str varchar(64),
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
    declare v_exch_group_no int;
    declare v_busi_opor_no int;
    declare v_pass_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_order_sum_status_str varchar(64);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_sum_status_str = p_order_sum_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数# > 500 or @指定行数# <1 then */
    if v_row_count > 500 or v_row_count <1 then

      /* set @指定行数# = 500; */
      set v_row_count = 500;
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串# = concat(";", @市场编号串#, ";"); */
        set v_exch_no_str = concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串# = concat(";", @证券类型串#, ";"); */
        set v_stock_type_str = concat(";", v_stock_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串# = concat(";", @订单方向串#, ";"); */
        set v_order_dir_str = concat(";", v_order_dir_str, ";");
    end if;

    /* if @订单汇总状态串# <> " " then */
    if v_order_sum_status_str <> " " then

        /* set @订单汇总状态串# = concat(";", @订单汇总状态串#, ";"); */
        set v_order_sum_status_str = concat(";", v_order_sum_status_str, ";");
    end if;

    /* 调用【原子_交易证券_交易_查询订单汇总】*/
    call db_tdsecu.pra_tdsetd_QueryOrderSum(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_group_no,
        v_busi_opor_no,
        v_pass_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_external_no,
        v_order_batch_no,
        v_order_dir_str,
        v_order_sum_status_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.103.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询订单汇总出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询篮子订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryBasketOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryBasketOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_查询篮子订单】*/
    call db_tdsecu.pra_tdsetd_QueryBasketOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.104.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询篮子订单出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询预埋订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryPreOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryPreOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_查询预埋订单】*/
    call db_tdsecu.pra_tdsetd_QueryPreOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.105.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询预埋订单出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询改单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryModiOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryModiOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_order_oper_way varchar(2),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_modi_batch_no int,
    IN p_order_id bigint,
    IN p_order_dir_str varchar(1024),
    IN p_comm_id bigint,
    IN p_modi_order_status varchar(2),
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
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_modi_batch_no int;
    declare v_order_id bigint;
    declare v_order_dir_str varchar(1024);
    declare v_comm_id bigint;
    declare v_modi_order_status varchar(2);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_order_oper_way = p_order_oper_way;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_modi_batch_no = p_modi_batch_no;
    SET v_order_id = p_order_id;
    SET v_order_dir_str = p_order_dir_str;
    SET v_comm_id = p_comm_id;
    SET v_modi_order_status = p_modi_order_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数# > 500 or @指定行数# <1 then */
    if v_row_count > 500 or v_row_count <1 then

      /* set @指定行数# = 500; */
      set v_row_count = 500;
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串# = concat(";", @市场编号串#, ";"); */
        set v_exch_no_str = concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串# = concat(";", @证券类型串#, ";"); */
        set v_stock_type_str = concat(";", v_stock_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串# = concat(";", @订单方向串#, ";"); */
        set v_order_dir_str = concat(";", v_order_dir_str, ";");
    end if;

    /* 调用【原子_交易证券_交易_查询改单】*/
    call db_tdsecu.pra_tdsetd_QueryModiOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_opor_no,
        v_order_oper_way,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_modi_batch_no,
        v_order_id,
        v_order_dir_str,
        v_comm_id,
        v_modi_order_status,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.106.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询改单出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询改单历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryModiOrder_His;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryModiOrder_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_busi_opor_no int,
    IN p_order_oper_way varchar(2),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_modi_batch_no int,
    IN p_order_id bigint,
    IN p_order_dir_str varchar(1024),
    IN p_comm_id bigint,
    IN p_modi_order_status varchar(2),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_modi_batch_no int;
    declare v_order_id bigint;
    declare v_order_dir_str varchar(1024);
    declare v_comm_id bigint;
    declare v_modi_order_status varchar(2);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_order_oper_way = p_order_oper_way;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_modi_batch_no = p_modi_batch_no;
    SET v_order_id = p_order_id;
    SET v_order_dir_str = p_order_dir_str;
    SET v_comm_id = p_comm_id;
    SET v_modi_order_status = p_modi_order_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数# > 500 or @指定行数# <1 then */
    if v_row_count > 500 or v_row_count <1 then

      /* set @指定行数# = 500; */
      set v_row_count = 500;
    end if;

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][259][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdsecuT.4.107.259";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdsecuT.4.107.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>93 then
        
        SET v_error_code = "tdsecuT.4.107.255";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串# = concat(";", @市场编号串#, ";"); */
        set v_exch_no_str = concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串# = concat(";", @证券类型串#, ";"); */
        set v_stock_type_str = concat(";", v_stock_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串# = concat(";", @订单方向串#, ";"); */
        set v_order_dir_str = concat(";", v_order_dir_str, ";");
    end if;

    /* 调用【原子_交易证券_交易_查询改单历史】*/
    call db_tdsecu.pra_tdsetd_QueryModiOrder_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_busi_opor_no,
        v_order_oper_way,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_modi_batch_no,
        v_order_id,
        v_order_dir_str,
        v_comm_id,
        v_modi_order_status,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.107.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询改单历史出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询未成交代码列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryUnStrikeStockList;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryUnStrikeStockList(
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
    

    /* 调用【原子_交易证券_交易_查询未成交代码列表】*/
    call db_tdsecu.pra_tdsetd_QueryUnStrikeStockList(
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
        SET v_error_code = "tdsecuT.4.108.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询未成交代码列表出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_证券行情检查账户成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QuotCheckAccoStrike;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QuotCheckAccoStrike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_last_price decimal(16,9),
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
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_last_price decimal(16,9);
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
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_last_price = p_last_price;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_证券行情检查账户成交】*/
    call db_tdsecu.pra_tdsetd_QuotCheckAccoStrike(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code,
        v_exch_no,
        v_last_price,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.109.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_证券行情检查账户成交出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询订单汇总历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryOrderSum_His;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryOrderSum_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_pass_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_order_dir_str varchar(1024),
    IN p_order_sum_status_str varchar(64),
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_pass_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_order_sum_status_str varchar(64);
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_sum_status_str = p_order_sum_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][259][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdsecuT.4.110.259";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdsecuT.4.110.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>93 then
        
        SET v_error_code = "tdsecuT.4.110.255";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* if @指定行数# > 500 or @指定行数# <1 then */
    if v_row_count > 500 or v_row_count <1 then

      /* set @指定行数# = 500; */
      set v_row_count = 500;
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串# = concat(";", @市场编号串#, ";"); */
        set v_exch_no_str = concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串# = concat(";", @证券类型串#, ";"); */
        set v_stock_type_str = concat(";", v_stock_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串# = concat(";", @订单方向串#, ";"); */
        set v_order_dir_str = concat(";", v_order_dir_str, ";");
    end if;

    /* if @订单汇总状态串# <> " " then */
    if v_order_sum_status_str <> " " then

        /* set @订单汇总状态串# = concat(";", @订单汇总状态串#, ";"); */
        set v_order_sum_status_str = concat(";", v_order_sum_status_str, ";");
    end if;

    /* 调用【原子_交易证券_交易_查询订单汇总历史】*/
    call db_tdsecu.pra_tdsetd_QueryOrderSum_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_pd_no,
        v_exch_group_no,
        v_pass_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_external_no,
        v_order_batch_no,
        v_order_dir_str,
        v_order_sum_status_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.110.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询订单汇总历史出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询待执行订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryPendOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryPendOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_order_oper_way varchar(2),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_pass_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_batch_no int,
    IN p_order_dir_str varchar(1024),
    IN p_price_type_str varchar(2048),
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
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_pass_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_price_type_str varchar(2048);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_order_oper_way = p_order_oper_way;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_price_type_str = p_price_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数# > 500 or @指定行数# <1 then */
    if v_row_count > 500 or v_row_count <1 then

      /* set @指定行数# = 500; */
      set v_row_count = 500;
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串# = concat(";", @市场编号串#, ";"); */
        set v_exch_no_str = concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串# = concat(";", @证券类型串#, ";"); */
        set v_stock_type_str = concat(";", v_stock_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串# = concat(";", @订单方向串#, ";"); */
        set v_order_dir_str = concat(";", v_order_dir_str, ";");
    end if;

    /* if @价格类型串# <> " " then */
    if v_price_type_str <> " " then

        /* set @价格类型串# = concat(";", @价格类型串#, ";"); */
        set v_price_type_str = concat(";", v_price_type_str, ";");
    end if;

    /* 调用【原子_交易证券_交易_查询待执行订单】*/
    call db_tdsecu.pra_tdsetd_QueryPendOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_opor_no,
        v_order_oper_way,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_pass_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_comm_id,
        v_comm_batch_no,
        v_order_batch_no,
        v_order_dir_str,
        v_price_type_str,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.111.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询待执行订单出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询待执行订单历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryPendOrder_His;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryPendOrder_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_order_oper_way varchar(2),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_pass_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_batch_no int,
    IN p_order_dir_str varchar(1024),
    IN p_price_type_str varchar(2048),
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
    declare v_order_oper_way varchar(2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_pass_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_price_type_str varchar(2048);
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
    SET v_order_oper_way = p_order_oper_way;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_price_type_str = p_price_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数# > 500 or @指定行数# <1 then */
    if v_row_count > 500 or v_row_count <1 then

      /* set @指定行数# = 500; */
      set v_row_count = 500;
    end if;

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][259][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdsecuT.4.112.259";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdsecuT.4.112.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>93 then
        
        SET v_error_code = "tdsecuT.4.112.255";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串# = concat(";", @市场编号串#, ";"); */
        set v_exch_no_str = concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串# = concat(";", @证券类型串#, ";"); */
        set v_stock_type_str = concat(";", v_stock_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串# = concat(";", @订单方向串#, ";"); */
        set v_order_dir_str = concat(";", v_order_dir_str, ";");
    end if;

    /* if @价格类型串# <> " " then */
    if v_price_type_str <> " " then

        /* set @价格类型串# = concat(";", @价格类型串#, ";"); */
        set v_price_type_str = concat(";", v_price_type_str, ";");
    end if;

    /* 调用【原子_交易证券_交易_查询待执行订单历史】*/
    call db_tdsecu.pra_tdsetd_QueryPendOrder_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_order_oper_way,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_pass_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_comm_id,
        v_comm_batch_no,
        v_order_batch_no,
        v_order_dir_str,
        v_price_type_str,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.112.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询待执行订单历史出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询订单记录数
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryOrderCount;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryOrderCount(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_order_oper_way varchar(2),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_order_dir_str varchar(1024),
    IN p_order_status_str varchar(64),
    IN p_init_date int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_count int
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
    declare v_order_oper_way varchar(2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_order_dir_str varchar(1024);
    declare v_order_status_str varchar(64);
    declare v_init_date int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_count int;

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
    SET v_order_oper_way = p_order_oper_way;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_status_str = p_order_status_str;
    SET v_init_date = p_init_date;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_count = 0;

    
    label_pro:BEGIN
    

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串# = concat(";", @订单方向串#, ";"); */
        set v_order_dir_str = concat(";", v_order_dir_str, ";");
    end if;

    /* if @订单状态串# <> " " then */
    if v_order_status_str <> " " then

        /* set @订单状态串# = concat(";", @订单状态串#, ";"); */
        set v_order_status_str = concat(";", v_order_status_str, ";");
    end if;

    /* 调用【原子_交易证券_交易_查询订单记录数】*/
    call db_tdsecu.pra_tdsetd_QueryOrderCount(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_opor_no,
        v_order_oper_way,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_order_dir_str,
        v_order_status_str,
        v_init_date,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info,
        v_order_count);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.113.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询订单记录数出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_count = v_order_count;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_查询交易组订单记录数
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryExgpOrderCount;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryExgpOrderCount(
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_查询交易组订单记录数】*/
    call db_tdsecu.pra_tdsetd_QueryExgpOrderCount(
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
        v_error_code,
        v_error_info,
        v_record_count);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.114.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询交易组订单记录数出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_指令端证券业务合规判断
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_CheckCommSecuRisk;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_CheckCommSecuRisk(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_compli_trig_id bigint
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
    declare v_compli_trig_id bigint;

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
    SET v_compli_trig_id = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_指令端证券业务合规判断】*/
    call db_tdsecu.pra_tdsetd_CheckCommSecuRisk(
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
        SET v_error_code = "tdsecuT.4.201.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_指令端证券业务合规判断出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_compli_trig_id = v_compli_trig_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_交易端证券业务合规判断
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_CheckExchSecuRisk;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_CheckExchSecuRisk(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_compli_trig_id bigint
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
    declare v_compli_trig_id bigint;

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
    SET v_compli_trig_id = 0;

    
    label_pro:BEGIN
    

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
        SET v_error_code = "tdsecuT.4.202.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_交易端证券业务合规判断出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_compli_trig_id = v_compli_trig_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_测试
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_Test;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_Test(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    IN p_order_qty decimal(18,2),
    IN p_wtdraw_qty decimal(18,2),
    IN p_modi_order_qty decimal(18,2),
    IN p_strike_qty decimal(18,2),
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
    declare v_query_row_id bigint;
    declare v_order_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_modi_order_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
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
    SET v_query_row_id = p_query_row_id;
    SET v_order_qty = p_order_qty;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_modi_order_qty = p_modi_order_qty;
    SET v_strike_qty = p_strike_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_测试】*/
    call db_tdsecu.pra_tdsetd_Test(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_row_id,
        v_order_qty,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.999.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_测试出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询组合交易流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryComboTradeLog;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryComboTradeLog(
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
    IN p_combo_code varchar(32),
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
    declare v_combo_code varchar(32);
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
    SET v_combo_code = p_combo_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_查询组合交易流水记录】*/
    call db_tdsecu.pra_tdsetd_QueryComboTradeLog(
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
        v_combo_code,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.119.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询组合交易流水记录出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询历史组合交易流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryHisComboTradeLog;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryHisComboTradeLog(
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
    IN p_combo_code varchar(32),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_combo_code varchar(32);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_combo_code = p_combo_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_查询历史组合交易流水记录】*/
    call db_tdsecu.pra_tdsetd_QueryHisComboTradeLog(
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
        v_combo_code,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_begin_date,
        v_end_date,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.120.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询历史组合交易流水记录出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_导入订单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_ImportAppeOrderTable;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_ImportAppeOrderTable(
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
    IN p_asset_type int,
    IN p_stock_type int,
    IN p_comm_opor int,
    IN p_comm_id bigint,
    IN p_comm_limit_price decimal(16,9),
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_all_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_trade_tax decimal(18,4),
    IN p_trade_cost_fee decimal(18,4),
    IN p_trade_system_use_fee decimal(18,4),
    IN p_stock_settle_fee decimal(18,4),
    IN p_compli_trig_id bigint,
    IN p_par_value decimal(16,9),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_rsp_id bigint,
    IN p_nav_asset decimal(18,4),
    IN p_intrst_days int,
    IN p_impawn_ratio decimal(18,12),
    IN p_net_price_flag int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_price_type int,
    IN p_order_oper_way varchar(2),
    IN p_cost_calc_type int,
    IN p_contra_no varchar(32),
    IN p_asset_acco_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_id bigint,
    OUT p_order_status varchar(2),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
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
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_comm_opor int;
    declare v_comm_id bigint;
    declare v_comm_limit_price decimal(16,9);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_compli_trig_id bigint;
    declare v_par_value decimal(16,9);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_rsp_id bigint;
    declare v_nav_asset decimal(18,4);
    declare v_intrst_days int;
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_price_type int;
    declare v_order_oper_way varchar(2);
    declare v_cost_calc_type int;
    declare v_contra_no varchar(32);
    declare v_asset_acco_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_id bigint;
    declare v_order_status varchar(2);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_update_times int;
    declare v_rsp_info varchar(255);
    declare v_open_close_permission int;
    declare v_order_rsp_status varchar(2);
    declare v_is_record_jour int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_comm_batch_no int;
    declare v_exter_comm_flag int;
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;

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
    SET v_asset_type = p_asset_type;
    SET v_stock_type = p_stock_type;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_id = p_comm_id;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_all_fee = p_all_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_other_commis = p_other_commis;
    SET v_trade_tax = p_trade_tax;
    SET v_trade_cost_fee = p_trade_cost_fee;
    SET v_trade_system_use_fee = p_trade_system_use_fee;
    SET v_stock_settle_fee = p_stock_settle_fee;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_par_value = p_par_value;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_rsp_id = p_rsp_id;
    SET v_nav_asset = p_nav_asset;
    SET v_intrst_days = p_intrst_days;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_price_type = p_price_type;
    SET v_order_oper_way = p_order_oper_way;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_contra_no = p_contra_no;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_id = 0;
    SET v_order_status = "0";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_update_times = 1;
    SET v_rsp_info = " ";
    SET v_open_close_permission = 0;
    SET v_order_rsp_status = "0";
    SET v_is_record_jour = 1;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_comm_batch_no = 0;
    SET v_exter_comm_flag = 0;
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;
    SET v_remark_info = " ";
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @回报信息# = "手工补单"; */
        set v_rsp_info = "手工补单";

        /* set @开平仓权限# =《开平仓权限-不限制》; */
        set v_open_close_permission =0;

        /* set @订单回报状态# = 《订单回报状态-已报》; */
        set v_order_rsp_status = "1";

        /* set @订单序号# = 0; */
        set v_order_id = 0;

        /* set @订单日期# = @申报日期#; */
        set v_order_date = v_report_date;

        /* set @是否记录流水# = 《是否记录流水-记录》; */
        set v_is_record_jour = 1;

        /* set @目标证券代码# = ""; */
        set v_target_stock_code = "";

        /* set @目标证券代码编号# = 0; */
        set v_target_stock_code_no = 0;

        /* set @登记机构# = ""; */
        set v_registration_agency = "";

        /* set @交易账户# = ""; */
        set v_trade_acco = "";

        /* set @指令批号# =0; */
        set v_comm_batch_no =0;

        /* set @体外指令标志#=0; */
        set v_exter_comm_flag=0;

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
            SET v_error_code = "tdsecuT.4.121.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算交易冻结金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @订单冻结金额# = @交易冻结金额#; */
        set v_order_frozen_amt = v_trade_frozen_amt;

        /* set @订单冻结数量# = @交易冻结数量#; */
        set v_order_frozen_qty = v_trade_frozen_qty;

        /* set @订单状态# = 《订单状态-已报》; */
        set v_order_status = "2";

        /* set @订单日期# = @申报日期#; */
        set v_order_date = v_report_date;

        /* set @备注信息# = "新增补单订单！"; */
        set v_remark_info = "新增补单订单！";

        /* set @组合代码# = " "; */
        set v_combo_code = " ";

        /* set @组合持仓序号#=0; */
        set v_combo_posi_id=0;

        /* 调用【原子_交易证券_交易_导入订单表】*/
        call db_tdsecu.pra_tdsetd_ImportAppeOrderTable(
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
            v_asset_acco_type,
            v_contra_no,
            v_error_code,
            v_error_info,
            v_order_id,
            v_order_time,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.121.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_导入订单表出现错误！',v_mysql_message);
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
    SET p_order_id = v_order_id;
    SET p_order_status = v_order_status;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_查询资产账户订单记录数
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryAsacOrderCount;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryAsacOrderCount(
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_查询资产账户订单记录数】*/
    call db_tdsecu.pra_tdsetd_QueryAsacOrderCount(
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
        v_error_code,
        v_error_info,
        v_record_count);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.122.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询资产账户订单记录数出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询产品订单记录数
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryProdOrderCount;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryProdOrderCount(
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
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_查询产品订单记录数】*/
    call db_tdsecu.pra_tdsetd_QueryProdOrderCount(
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
        v_record_count);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.123.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询产品订单记录数出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_根据交易时间控制报盘主推
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_CtrlPushToRpByExchTime;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_CtrlPushToRpByExchTime(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_time_flag int
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
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_time_flag int;
    declare v_mach_time int;
    declare v_record_count int;
    declare v_am_trd_begin_time int;
    declare v_am_trd_end_time int;
    declare v_pm_trd_begin_time int;
    declare v_pm_trd_end_time int;

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
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_time_flag = 0;
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_record_count = 0;
    SET v_am_trd_begin_time = date_format(curtime(),'%H%i%s');
    SET v_am_trd_end_time = date_format(curtime(),'%H%i%s');
    SET v_pm_trd_begin_time = date_format(curtime(),'%H%i%s');
    SET v_pm_trd_end_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* set @交易时间标志#=0; */
    set v_trade_time_flag=0;

    /* set @记录个数#=0; */
    set v_record_count=0;

    /* [获取表记录变量语句][交易证券_交易_交易时间配置表][count(1),{上午交易开始时间},{上午交易结束时间},{下午交易开始时间},{下午交易结束时间}][@记录个数#,@上午交易开始时间#,@上午交易结束时间#,@下午交易开始时间#,@下午交易结束时间#][{机构编号}=@机构编号# and {市场编号}=@市场编号# ] */
    select count(1),am_trd_begin_time,am_trd_end_time,pm_trd_begin_time,pm_trd_end_time into v_record_count,v_am_trd_begin_time,v_am_trd_end_time,v_pm_trd_begin_time,v_pm_trd_end_time from db_tdsecu.tb_tdsetd_trdtimeconfig where co_no=v_co_no and exch_no=v_exch_no  limit 1;


    /* if @记录个数# =0 then */
    if v_record_count =0 then

         /* set  @机构编号# = 0; */
         set  v_co_no = 0;

         /* [获取表记录变量语句][交易证券_交易_交易时间配置表][{上午交易开始时间},{上午交易结束时间},{下午交易开始时间},{下午交易结束时间}][@上午交易开始时间#,@上午交易结束时间#,@下午交易开始时间#,@下午交易结束时间#][{机构编号}=@机构编号# and {市场编号}=@市场编号# ] */
         select am_trd_begin_time,am_trd_end_time,pm_trd_begin_time,pm_trd_end_time into v_am_trd_begin_time,v_am_trd_end_time,v_pm_trd_begin_time,v_pm_trd_end_time from db_tdsecu.tb_tdsetd_trdtimeconfig where co_no=v_co_no and exch_no=v_exch_no  limit 1;

    end if;
    #判断是否在交易时间内。

    /* if  (@机器时间# between @上午交易开始时间# and @上午交易结束时间#) or (@机器时间# between @下午交易开始时间# and @下午交易结束时间#) then */
    if  (v_mach_time between v_am_trd_begin_time and v_am_trd_end_time) or (v_mach_time between v_pm_trd_begin_time and v_pm_trd_end_time) then

        /* set @交易时间标志#=1; */
        set v_trade_time_flag=1;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_time_flag = v_trade_time_flag;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_查询资产账户下交易组订单记录数
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryAsacExgpOrderCount;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryAsacExgpOrderCount(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
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
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_查询资产账户下交易组订单记录数】*/
    call db_tdsecu.pra_tdsetd_QueryAsacExgpOrderCount(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco_no,
        v_exch_group_no,
        v_error_code,
        v_error_info,
        v_record_count);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.125.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询资产账户下交易组订单记录数出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询部分订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryPartOrderInf;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryPartOrderInf(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_report_no varchar(32),
    IN p_report_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pass_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_code varchar(6),
    OUT p_row_id bigint,
    OUT p_order_dir int
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
    declare v_exch_no int;
    declare v_report_no varchar(32);
    declare v_report_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_row_id bigint;
    declare v_order_dir int;

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
    SET v_exch_no = p_exch_no;
    SET v_report_no = p_report_no;
    SET v_report_date = p_report_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_row_id = 0;
    SET v_order_dir = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_查询部分订单信息】*/
    call db_tdsecu.pra_tdsetd_QueryPartOrderInf(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_out_acco,
        v_exch_no,
        v_report_no,
        v_report_date,
        v_error_code,
        v_error_info,
        v_pass_no,
        v_stock_code,
        v_stock_acco,
        v_row_id,
        v_order_dir);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.126.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询部分订单信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pass_no = v_pass_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_code = v_stock_code;
    SET p_row_id = v_row_id;
    SET p_order_dir = v_order_dir;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_延缓功能号应答
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_SlowFuncIdReponse;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_SlowFuncIdReponse(
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* select sleep(0.01) into @记录个数#; */
    select sleep(0.01) into v_record_count;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_新增交易时间配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_AddTrdTimeConfig;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_AddTrdTimeConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_no int,
    IN p_am_trd_begin_time int,
    IN p_am_trd_end_time int,
    IN p_pm_trd_begin_time int,
    IN p_pm_trd_end_time int,
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
    declare v_exch_no int;
    declare v_am_trd_begin_time int;
    declare v_am_trd_end_time int;
    declare v_pm_trd_begin_time int;
    declare v_pm_trd_end_time int;
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
    SET v_exch_no = p_exch_no;
    SET v_am_trd_begin_time = p_am_trd_begin_time;
    SET v_am_trd_end_time = p_am_trd_end_time;
    SET v_pm_trd_begin_time = p_pm_trd_begin_time;
    SET v_pm_trd_end_time = p_pm_trd_end_time;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


       /* 调用【原子_交易证券_交易_新增交易时间配置】*/
       call db_tdsecu.pra_tdsetd_AddTrdTimeConfig(
           v_opor_co_no,
           v_opor_no,
           v_oper_mac,
           v_oper_ip_addr,
           v_oper_info,
           v_oper_way,
           v_func_code,
           v_co_no,
           v_exch_no,
           v_am_trd_begin_time,
           v_am_trd_end_time,
           v_pm_trd_begin_time,
           v_pm_trd_end_time,
           v_error_code,
           v_error_info);
       if v_error_code = "1" then
           SET v_error_code = "tdsecuT.4.128.999";
           if v_mysql_message <> "" then
                SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增交易时间配置出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_删除交易时间配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_DeleteTrdTimeConfig;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_DeleteTrdTimeConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_exch_no int,
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
    declare v_co_no int;
    declare v_exch_no int;
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
    SET v_co_no = p_co_no;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


       /* [检查报错返回][@机构编号# = 0][3]["不允许删除系统级交易时间配置！"] */
       if v_co_no = 0 then
           ROLLBACK;
           SET v_error_code = "tdsecuT.4.129.3";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT("不允许删除系统级交易时间配置！","#",v_mysql_message);
           else
               SET v_error_info = "不允许删除系统级交易时间配置！";
           end if;
           leave label_pro;
       end if;


       /* 调用【原子_交易证券_交易_删除交易时间配置】*/
       call db_tdsecu.pra_tdsetd_DeleteTrdTimeConfig(
           v_opor_co_no,
           v_opor_no,
           v_oper_mac,
           v_oper_ip_addr,
           v_oper_info,
           v_oper_way,
           v_func_code,
           v_row_id,
           v_co_no,
           v_exch_no,
           v_error_code,
           v_error_info);
       if v_error_code = "1" then
           SET v_error_code = "tdsecuT.4.129.999";
           if v_mysql_message <> "" then
                SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_删除交易时间配置出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询交易时间配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryTrdTimeConfig;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryTrdTimeConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_no int,
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
    declare v_exch_no int;
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
    SET v_exch_no = p_exch_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_查询交易时间配置】*/
    call db_tdsecu.pra_tdsetd_QueryTrdTimeConfig(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.130.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询交易时间配置出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询股东代码订单记录数
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryStockAccoOrderCount;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryStockAccoOrderCount(
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_查询股东代码订单记录数】*/
    call db_tdsecu.pra_tdsetd_QueryStockAccoOrderCount(
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
        v_error_code,
        v_error_info,
        v_record_count);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.131.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询股东代码订单记录数出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_融资融券新增订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_FinaLoanAddOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_FinaLoanAddOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_opor int,
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
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_asset_type int,
    IN p_stock_type int,
    IN p_busi_limit_str varchar(2048),
    IN p_exgp_busi_config_str varchar(64),
    IN p_exgp_avail_amt decimal(18,4),
    IN p_exgp_T_hk_buy_total_amt decimal(18,4),
    IN p_exgp_T_hk_sell_total_amt decimal(18,4),
    IN p_exgp_T1_hk_buy_total_amt decimal(18,4),
    IN p_exgp_T1_hk_sell_total_amt decimal(18,4),
    IN p_asac_busi_config_str varchar(64),
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
    IN p_market_price_ratio decimal(18,12),
    IN p_comm_id bigint,
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    IN p_all_fee decimal(18,4),
    IN p_par_value decimal(16,9),
    IN p_intrst_days int,
    IN p_impawn_ratio decimal(18,12),
    IN p_net_price_flag int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_min_unit int,
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_last_price decimal(16,9),
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_order_oper_way varchar(2),
    IN p_cost_calc_type int,
    IN p_compli_trig_id bigint,
    IN p_combo_code varchar(32),
    IN p_combo_posi_id bigint,
    IN p_record_count int,
    IN p_target_stock_code varchar(6),
    IN p_target_stock_code_no int,
    IN p_fina_marg_ratio decimal(18,12),
    IN p_secu_loan_marg_ratio decimal(18,12),
    IN p_fina_limit_max decimal(18,4),
    IN p_loan_limit_max decimal(18,4),
    IN p_asset_acco_type int,
    IN p_contra_no varchar(32),
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
    IN p_order_amt decimal(18,4),
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_id bigint,
    OUT p_order_status varchar(2),
    OUT p_order_date int,
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_comm_batch_no int,
    OUT p_order_time int,
    OUT p_comm_date int,
    OUT p_comm_executor int,
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_debt_type int,
    OUT p_deal_flag int,
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
    declare v_comm_opor int;
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
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_busi_limit_str varchar(2048);
    declare v_exgp_busi_config_str varchar(64);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_asac_busi_config_str varchar(64);
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
    declare v_market_price_ratio decimal(18,12);
    declare v_comm_id bigint;
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_all_fee decimal(18,4);
    declare v_par_value decimal(16,9);
    declare v_intrst_days int;
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_order_oper_way varchar(2);
    declare v_cost_calc_type int;
    declare v_compli_trig_id bigint;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_record_count int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_fina_marg_ratio decimal(18,12);
    declare v_secu_loan_marg_ratio decimal(18,12);
    declare v_fina_limit_max decimal(18,4);
    declare v_loan_limit_max decimal(18,4);
    declare v_asset_acco_type int;
    declare v_contra_no varchar(32);
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
    declare v_order_amt decimal(18,4);
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_id bigint;
    declare v_order_status varchar(2);
    declare v_order_date int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_comm_batch_no int;
    declare v_order_time int;
    declare v_comm_date int;
    declare v_comm_executor int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_debt_type int;
    declare v_deal_flag int;
    declare v_update_times int;
    declare v_exter_comm_flag int;
    declare v_is_record_jour int;
    declare v_invest_type int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_oper_way varchar(2);
    declare v_comm_amt decimal(18,4);
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_open_close_permission int;
    declare v_debt_qty decimal(18,2);
    declare v_comm_dir int;
    declare v_comm_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_status varchar(2);
    declare v_strike_status varchar(2);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_pass_status varchar(2);
    declare v_nav_asset decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_remark_info varchar(255);
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
    SET v_comm_opor = p_comm_opor;
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
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_asset_type = p_asset_type;
    SET v_stock_type = p_stock_type;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_exgp_busi_config_str = p_exgp_busi_config_str;
    SET v_exgp_avail_amt = p_exgp_avail_amt;
    SET v_exgp_T_hk_buy_total_amt = p_exgp_T_hk_buy_total_amt;
    SET v_exgp_T_hk_sell_total_amt = p_exgp_T_hk_sell_total_amt;
    SET v_exgp_T1_hk_buy_total_amt = p_exgp_T1_hk_buy_total_amt;
    SET v_exgp_T1_hk_sell_total_amt = p_exgp_T1_hk_sell_total_amt;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
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
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_comm_id = p_comm_id;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_all_fee = p_all_fee;
    SET v_par_value = p_par_value;
    SET v_intrst_days = p_intrst_days;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_min_unit = p_min_unit;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_last_price = p_last_price;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_order_oper_way = p_order_oper_way;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_combo_code = p_combo_code;
    SET v_combo_posi_id = p_combo_posi_id;
    SET v_record_count = p_record_count;
    SET v_target_stock_code = p_target_stock_code;
    SET v_target_stock_code_no = p_target_stock_code_no;
    SET v_fina_marg_ratio = p_fina_marg_ratio;
    SET v_secu_loan_marg_ratio = p_secu_loan_marg_ratio;
    SET v_fina_limit_max = p_fina_limit_max;
    SET v_loan_limit_max = p_loan_limit_max;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_contra_no = p_contra_no;
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
    SET v_order_amt = p_order_amt;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_id = 0;
    SET v_order_status = "0";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_comm_batch_no = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_executor = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_debt_type = 0;
    SET v_deal_flag = 0;
    SET v_update_times = 1;
    SET v_exter_comm_flag = 0;
    SET v_is_record_jour = 1;
    SET v_invest_type = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_limit_actual_price = 0;
    SET v_comm_oper_way = " ";
    SET v_comm_amt = 0;
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;
    SET v_open_close_permission = 0;
    SET v_debt_qty = 0;
    SET v_comm_dir = 0;
    SET v_comm_qty = 0;
    SET v_calc_dir = 1;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_status = "0";
    SET v_strike_status = "0";
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_pass_status = "0";
    SET v_nav_asset = 0;
    SET v_trade_commis = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_remark_info = " ";
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_busi_opor_no = 0;
    SET v_avail_cal_flag = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_wtdraw_qty = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @体外指令标志# = 《体外指令标志-体内》; */
    set v_exter_comm_flag = 1;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @投资类型#=《投资类型-二级市场交易性金融资产》 ; */
    set v_invest_type=1 ;

    /* set @订单日期# = @初始化日期#; */
    set v_order_date = v_init_date;

    /* set @登记机构# = ""; */
    set v_registration_agency = "";

    /* set @交易账户# = ""; */
    set v_trade_acco = "";
    #如果是指令下单，校验指令信息

    /* if @指令序号# <> 0 then */
    if v_comm_id <> 0 then

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
            SET v_error_code = "tdsecuT.4.132.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_校验订单指令出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    #计算交易冻结金额

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
        SET v_error_code = "tdsecuT.4.132.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券交易冻结金额和数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @订单冻结金额# = @交易冻结金额#; */
    set v_order_frozen_amt = v_trade_frozen_amt;

    /* set @订单冻结数量# = @交易冻结数量#; */
    set v_order_frozen_qty = v_trade_frozen_qty;

    /* set @开平仓权限# = 0; */
    set v_open_close_permission = 0;

    /* if @订单方向# <> 《订单方向-直接还款》 then */
    if v_order_dir <> 14 then

        /* 调用【原子_交易证券_公用_计算订单金额】*/
        call db_tdsecu.pra_tdsepb_GetOrderAmt(
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
            v_error_code,
            v_error_info,
            v_order_amt);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.132.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单金额出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    #交易证券子系统检查，检查交易可用资金、可用持仓等

    /* 调用【原子_交易证券_交易_校验融资融券新增订单】*/
    call db_tdsecu.pra_tdsetd_CheckFinaLoanAddOrder(
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
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_target_code_no,
        v_trade_code_no,
        v_crncy_type,
        v_exch_crncy_type,
        v_buy_ref_rate,
        v_sell_ref_rate,
        v_exgp_busi_config_str,
        v_exgp_avail_amt,
        v_asac_busi_config_str,
        v_asac_avail_amt,
        v_exgp_avail_qty,
        v_asac_avail_qty,
        v_capit_reback_days,
        v_posi_reback_days,
        v_order_dir,
        v_order_qty,
        v_price_type,
        v_order_price,
        v_order_frozen_amt,
        v_impawn_ratio,
        v_stock_type,
        v_min_unit,
        v_up_limit_price,
        v_down_limit_price,
        v_last_price,
        v_order_oper_way,
        v_fina_limit_max,
        v_loan_limit_max,
        v_fina_marg_ratio,
        v_secu_loan_marg_ratio,
        v_order_amt,
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
        v_deal_flag,
        v_debt_qty);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.132.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_校验融资融券新增订单出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;

        #如果是指令订单，需要检查订单数量是否超过指令数量，需考虑并发问题

        /* if @指令序号# > 0 then */
        if v_comm_id > 0 then

            /* set @指令方向# = @订单方向#; */
            set v_comm_dir = v_order_dir;

            /* set @指令数量# = @订单数量#; */
            set v_comm_qty = v_order_qty;

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
                SET v_error_code = "tdsecuT.4.132.999";
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
                SET v_error_code = "tdsecuT.4.132.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_下单更新指令出现错误！',v_mysql_message);
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
                SET v_error_code = "tdsecuT.4.132.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券指令变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;
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
            SET v_error_code = "tdsecuT.4.132.999";
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
        #获取客户净资产
        #[原子_交易证券_交易_获取客户净资产]

        /* set @净资产# = 0; */
        set v_nav_asset = 0;
        #新增订单记录

        /* set @申报日期# = 0; */
        set v_report_date = 0;

        /* set @申报时间# = 0; */
        set v_report_time = 0;

        /* set @申报编号# = " "; */
        set v_report_no = " ";
        #订单表费用相关字段修改用来存取成交相关费用，订单下达时，费用全部填零；要求订单冻结金额包含费用；

        /* set @全部费用# = 0; */
        set v_all_fee = 0;

        /* set @交易佣金# = 0; */
        set v_trade_commis = 0;

        /* set @印花税# = 0; */
        set v_stamp_tax = 0;

        /* set @过户费# = 0; */
        set v_trans_fee = 0;

        /* set @经手费# = 0; */
        set v_brkage_fee = 0;

        /* set @证管费# = 0; */
        set v_SEC_charges = 0;

        /* set @其他费用# = 0; */
        set v_other_fee = 0;

        /* set @其他佣金# = 0; */
        set v_other_commis = 0;

        /* set @交易征费# = 0; */
        set v_trade_tax = 0;

        /* set @交易费# = 0; */
        set v_trade_cost_fee = 0;

        /* set @交易系统使用费# = 0; */
        set v_trade_system_use_fee = 0;

        /* set @股份交收费# = 0; */
        set v_stock_settle_fee = 0;

        /* set @备注信息#="新增订单！"; */
        set v_remark_info="新增订单！";

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
            SET v_error_code = "tdsecuT.4.132.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增订单出现错误！',v_mysql_message);
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
            SET v_error_code = "tdsecuT.4.132.999";
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

        /* set @业务操作员编号# = @操作员编号#; */
        set v_busi_opor_no = v_opor_no;

        /* set @可用计算标志# = 1; */
        set v_avail_cal_flag = 1;

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
            SET v_error_code = "tdsecuT.4.132.999";
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
            SET v_error_code = "tdsecuT.4.132.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新融资融券指令交易资金持仓负债出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @订单操作方式# = 《订单操作方式-增强交易》 or @订单操作方式# = 《订单操作方式-增强交易平仓》 then */
        if v_order_oper_way = "14" or v_order_oper_way = "51" then

            /* if @可用计算标志# = 1 then */
            if v_avail_cal_flag = 1 then
                #资金持仓变化完后，再判断可用，防止多并发

               /* 调用【原子_交易证券_T0_计算T0券源持仓资金可用】*/
               call db_tdsecu.pra_tdset0_CalcT0SourcePosiCapitalAvail(
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
                   v_exch_no,
                   v_stock_acco_no,
                   v_stock_code_no,
                   v_order_dir,
                   v_co_busi_config_str,
                   v_error_code,
                   v_error_info);
               if v_error_code = "1" then
                   SET v_error_code = "tdsecuT.4.132.999";
                   if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_计算T0券源持仓资金可用出现错误！',v_mysql_message);
                   end if;
                   ROLLBACK;
                   leave label_pro;
               elseif v_error_code <> "0" then
                   ROLLBACK;
                   leave label_pro;
               end if;

            end if;
        end if;

        /* if @订单批号# > 0 then */
        if v_order_batch_no > 0 then

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
                SET v_error_code = "tdsecuT.4.132.999";
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

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_id = v_order_id;
    SET p_order_status = v_order_status;
    SET p_order_date = v_order_date;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_order_time = v_order_time;
    SET p_comm_date = v_comm_date;
    SET p_comm_executor = v_comm_executor;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_debt_type = v_debt_type;
    SET p_deal_flag = v_deal_flag;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_融资融券撤销订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_FinaLoanCancelOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_FinaLoanCancelOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_order_date int,
    IN p_order_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_code varchar(6),
    OUT p_comm_date int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_report_no varchar(32),
    OUT p_external_no bigint,
    OUT p_order_status varchar(2),
    OUT p_wtdraw_date int,
    OUT p_wtdraw_id bigint,
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_wtdraw_status varchar(2),
    OUT p_order_batch_no int,
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_rsp_info varchar(255),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_order_oper_way varchar(2),
    OUT p_order_price decimal(16,9),
    OUT p_combo_code varchar(32),
    OUT p_combo_posi_id bigint,
    OUT p_open_posi_date int,
    OUT p_debt_type int,
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
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_comm_date int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_report_no varchar(32);
    declare v_external_no bigint;
    declare v_order_status varchar(2);
    declare v_wtdraw_date int;
    declare v_wtdraw_id bigint;
    declare v_wtdraw_qty decimal(18,2);
    declare v_wtdraw_status varchar(2);
    declare v_order_batch_no int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_report_date int;
    declare v_report_time int;
    declare v_rsp_info varchar(255);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_order_price decimal(16,9);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_open_posi_date int;
    declare v_debt_type int;
    declare v_update_times int;
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_invest_type int;
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_all_fee decimal(18,4);
    declare v_wtdraw_time int;
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_exter_comm_flag int;
    declare v_target_stock_code_no int;
    declare v_trade_acco varchar(32);
    declare v_tmp_order_frozen_amt decimal(18,4);
    declare v_tmp_order_frozen_qty decimal(18,2);
    declare v_pass_status varchar(2);
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_remark varchar(255);
    declare v_occur_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_comm_oper_way varchar(2);
    declare v_comm_dir int;
    declare v_comm_amt decimal(18,4);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_total_strike_qty decimal(18,2);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_avail_cal_flag int;
    declare v_debt_qty decimal(18,2);
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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_report_no = " ";
    SET v_external_no = 0;
    SET v_order_status = "0";
    SET v_wtdraw_date = date_format(curdate(),'%Y%m%d');
    SET v_wtdraw_id = 0;
    SET v_wtdraw_qty = 0;
    SET v_wtdraw_status = "0";
    SET v_order_batch_no = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_rsp_info = " ";
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_order_oper_way = " ";
    SET v_order_price = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_debt_type = 0;
    SET v_update_times = 1;
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_invest_type = 0;
    SET v_busi_opor_no = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_order_qty = 0;
    SET v_price_type = 0;
    SET v_all_fee = 0;
    SET v_wtdraw_time = date_format(curtime(),'%H%i%s');
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_exter_comm_flag = 0;
    SET v_target_stock_code_no = 0;
    SET v_trade_acco = " ";
    SET v_tmp_order_frozen_amt = 0;
    SET v_tmp_order_frozen_qty = 0;
    SET v_pass_status = "0";
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_wtdraw_batch_no = 0;
    SET v_wtdraw_remark = " ";
    SET v_occur_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_status = "0";
    SET v_comm_oper_way = " ";
    SET v_comm_dir = 0;
    SET v_comm_amt = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_total_strike_qty = 0;
    SET v_all_wtdraw_qty = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_avail_cal_flag = 0;
    SET v_debt_qty = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @撤单日期# = @初始化日期#; */
    set v_wtdraw_date = v_init_date;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;

    /* set @投资类型# = 《投资类型-二级市场交易性金融资产》; */
    set v_invest_type = 1;

    /* [事务开始] */
    START TRANSACTION;

        #检查撤单重复，并获取订单信息

        /* 调用【原子_交易证券_交易_检查锁定获取待撤订单信息】*/
        call db_tdsecu.pra_tdsetd_CheckLockGetPreCancelOrder(
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
            v_order_oper_way,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_crncy_type,
            v_pass_no,
            v_out_acco,
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
            v_comm_batch_no,
            v_external_no,
            v_order_batch_no,
            v_order_time,
            v_report_no,
            v_report_date,
            v_report_time,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_order_status,
            v_price_type,
            v_strike_qty,
            v_strike_amt,
            v_all_fee,
            v_wtdraw_qty,
            v_wtdraw_time,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_strike_bond_accr_intrst,
            v_rsp_info,
            v_exter_comm_flag,
            v_update_times,
            v_combo_code,
            v_target_stock_code_no,
            v_trade_acco);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.133.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_检查锁定获取待撤订单信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


         /* set @临时_订单冻结金额# = @订单冻结金额#; */
         set v_tmp_order_frozen_amt = v_order_frozen_amt;

         /* set @临时_订单冻结数量# = @订单冻结数量#; */
         set v_tmp_order_frozen_qty = v_order_frozen_qty;

        /* if @订单状态# <> 《订单状态-未报》  then */
        if v_order_status <> "1"  then
            #非未报订单,只修改订单状态， 3-待撤

            /* set @订单状态# = 《订单状态-待撤》 ; */
            set v_order_status = "3" ;

            /* set @撤单状态# = 《撤单状态-未报》; */
            set v_wtdraw_status = "1";

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
                SET v_error_code = "tdsecuT.4.133.999";
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

                /* set @撤单状态# = 《撤单状态-已报》; */
                set v_wtdraw_status = "2";
            end if;
            #事务内获取撤单批号，分机构存放

            /* set @编号类型# = 《编号类型-撤单批号》; */
            set v_record_no_type = 16;

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
                SET v_error_code = "tdsecuT.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @撤单批号# = @当前编号#; */
            set v_wtdraw_batch_no = v_curr_no;

            /* set @撤单说明# = "撤消订单！"; */
            set v_wtdraw_remark = "撤消订单！";

            /* set @撤单数量# = 0; */
            set v_wtdraw_qty = 0;

            /* set @订单冻结金额# = 0; */
            set v_order_frozen_amt = 0;

            /* set @订单冻结数量# = 0; */
            set v_order_frozen_qty = 0;

            /* 调用【原子_交易证券_交易_撤销订单】*/
            call db_tdsecu.pra_tdsetd_CancelOrder(
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
                v_external_no,
                v_order_date,
                v_order_id,
                v_report_no,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_order_status,
                v_wtdraw_batch_no,
                v_wtdraw_qty,
                v_wtdraw_remark,
                v_wtdraw_status,
                v_order_price,
                v_trade_acco,
                v_error_code,
                v_error_info,
                v_wtdraw_id,
                v_wtdraw_date,
                v_wtdraw_time);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤销订单出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        else
            #未报撤单处理逻辑，修改订单状态 4-已撤

            /* set @订单状态# = 《订单状态-已撤》; */
            set v_order_status = "4";

            /* set @撤单状态# = 《撤单状态-成功》; */
            set v_wtdraw_status = "3";

            /* set @撤单数量# = @订单数量#; */
            set v_wtdraw_qty = v_order_qty;

            /* set @变动数量# = @订单数量#; */
            set v_occur_qty = v_order_qty;
            #更新指令表

            /* if @指令序号# > 0 then */
            if v_comm_id > 0 then

                /* set @指令撤销数量# = 0; */
                set v_comm_cancel_qty = 0;

                /* 调用【原子_交易证券_指令_撤销更新指令】*/
                call db_tdsecu.pra_tdseap_CancelUpdateComm(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_comm_id,
                    v_comm_cancel_qty,
                    v_wtdraw_qty,
                    v_error_code,
                    v_error_info,
                    v_limit_actual_price,
                    v_comm_status,
                    v_comm_date,
                    v_comm_batch_no,
                    v_comm_executor,
                    v_comm_oper_way,
                    v_comm_dir,
                    v_comm_amt);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.4.133.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销更新指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #计算指令变动金额和数量

                /* set @指令方向# = @订单方向#; */
                set v_comm_dir = v_order_dir;

                /* 调用【原子_交易证券_公用_计算融资融券撤单指令变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetFinaLoanCancelCommOccurAmtAndQty(
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
                    v_wtdraw_qty,
                    v_comm_status,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_comm_amt,
                    v_error_code,
                    v_error_info,
                    v_comm_occur_amt,
                    v_comm_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.4.133.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券撤单指令变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            end if;

            /* set @总成交数量# = 0; */
            set v_total_strike_qty = 0;

            /* set @总撤单数量# = @撤单数量#; */
            set v_all_wtdraw_qty = v_wtdraw_qty;

            /* 调用【原子_交易证券_公用_计算融资融券撤单交易变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetFinaLoanCancelExchChangeAmtAndQty(
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
                v_wtdraw_qty,
                v_total_strike_qty,
                v_all_wtdraw_qty,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_error_code,
                v_error_info,
                v_trade_occur_amt,
                v_trade_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券撤单交易变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #事务内获取撤单批号，分机构存放

            /* set @编号类型# = 《编号类型-撤单批号》; */
            set v_record_no_type = 16;

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
                SET v_error_code = "tdsecuT.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @撤单批号# = @当前编号#; */
            set v_wtdraw_batch_no = v_curr_no;
            #更新订单表

            /* set @订单冻结金额# = -1 * @订单冻结金额#; */
            set v_order_frozen_amt = -1 * v_order_frozen_amt;

            /* set @订单冻结数量# = -1 * @订单冻结数量#; */
            set v_order_frozen_qty = -1 * v_order_frozen_qty;

            /* set @撤单说明# = "撤消订单！"; */
            set v_wtdraw_remark = "撤消订单！";

            /* 调用【原子_交易证券_交易_撤销订单】*/
            call db_tdsecu.pra_tdsetd_CancelOrder(
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
                v_external_no,
                v_order_date,
                v_order_id,
                v_report_no,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_order_status,
                v_wtdraw_batch_no,
                v_wtdraw_qty,
                v_wtdraw_remark,
                v_wtdraw_status,
                v_order_price,
                v_trade_acco,
                v_error_code,
                v_error_info,
                v_wtdraw_id,
                v_wtdraw_date,
                v_wtdraw_time);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤销订单出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @可用计算标志# = 0; */
            set v_avail_cal_flag = 0;

            /* set @组合持仓序号# = 0; */
            set v_combo_posi_id = 0;

            /* set @负债数量# = 0; */
            set v_debt_qty = 0;
            #处理订单资金持仓数据，保护指令变动和交易的变动

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
                SET v_error_code = "tdsecuT.4.133.999";
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
                SET v_error_code = "tdsecuT.4.133.999";
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
                SET v_error_code = "tdsecuT.4.133.999";
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

    #主推处理

    /* set @订单冻结金额# = @订单冻结金额# + @临时_订单冻结金额#; */
    set v_order_frozen_amt = v_order_frozen_amt + v_tmp_order_frozen_amt;

    /* set @订单冻结数量# = @订单冻结数量# + @临时_订单冻结数量#; */
    set v_order_frozen_qty = v_order_frozen_qty + v_tmp_order_frozen_qty;

    /* set @更新次数# = @更新次数# + 1; */
    set v_update_times = v_update_times + 1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_code = v_stock_code;
    SET p_comm_date = v_comm_date;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_report_no = v_report_no;
    SET p_external_no = v_external_no;
    SET p_order_status = v_order_status;
    SET p_wtdraw_date = v_wtdraw_date;
    SET p_wtdraw_id = v_wtdraw_id;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_wtdraw_status = v_wtdraw_status;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_rsp_info = v_rsp_info;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_order_oper_way = v_order_oper_way;
    SET p_order_price = v_order_price;
    SET p_combo_code = v_combo_code;
    SET p_combo_posi_id = v_combo_posi_id;
    SET p_open_posi_date = v_open_posi_date;
    SET p_debt_type = v_debt_type;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_融资融券新增改单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_FinaLoanAddModiOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_FinaLoanAddModiOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_modi_batch_no int,
    IN p_modi_order_price decimal(16,9),
    IN p_modi_order_qty decimal(18,2),
    IN p_modi_price_type int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_par_value decimal(16,9),
    IN p_target_code_no int,
    IN p_trade_code_no int,
    IN p_impawn_ratio decimal(18,12),
    IN p_net_price_flag int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_combo_code varchar(32),
    IN p_strategy_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_asset_acco varchar(16),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_code varchar(6),
    OUT p_report_no varchar(32),
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_comm_id bigint,
    OUT p_modi_order_id bigint,
    OUT p_new_order_id bigint,
    OUT p_order_dir int,
    OUT p_order_qty decimal(18,2),
    OUT p_order_price decimal(16,9),
    OUT p_order_batch_no int,
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_comm_date int,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_wtdraw_id bigint,
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_wtdraw_status varchar(2),
    OUT p_wtdraw_date int,
    OUT p_wtdraw_time int,
    OUT p_rsp_info varchar(255),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_compli_trig_id bigint,
    OUT p_old_order_status varchar(2),
    OUT p_new_order_status varchar(2),
    OUT p_order_status varchar(2),
    OUT p_update_times int,
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
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_modi_batch_no int;
    declare v_modi_order_price decimal(16,9);
    declare v_modi_order_qty decimal(18,2);
    declare v_modi_price_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_par_value decimal(16,9);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_combo_code varchar(32);
    declare v_strategy_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_asset_acco varchar(16);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_report_no varchar(32);
    declare v_report_date int;
    declare v_report_time int;
    declare v_comm_id bigint;
    declare v_modi_order_id bigint;
    declare v_new_order_id bigint;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_order_batch_no int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_wtdraw_id bigint;
    declare v_wtdraw_qty decimal(18,2);
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_date int;
    declare v_wtdraw_time int;
    declare v_rsp_info varchar(255);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_compli_trig_id bigint;
    declare v_old_order_status varchar(2);
    declare v_new_order_status varchar(2);
    declare v_order_status varchar(2);
    declare v_update_times int;
    declare v_debt_type int;
    declare v_deal_flag int;
    declare v_invest_type int;
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_stock_code_no int;
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_comm_opor int;
    declare v_external_no bigint;
    declare v_order_time int;
    declare v_price_type int;
    declare v_intrst_days int;
    declare v_all_fee decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_busi_opor_no int;
    declare v_target_stock_code_no int;
    declare v_trade_acco varchar(32);
    declare v_tmp_order_frozen_amt decimal(18,4);
    declare v_tmp_order_frozen_qty decimal(18,2);
    declare v_tmp_stock_code_no int;
    declare v_tmp_order_qty decimal(18,2);
    declare v_pass_status varchar(2);
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_remark varchar(255);
    declare v_occur_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_comm_oper_way varchar(2);
    declare v_comm_dir int;
    declare v_comm_amt decimal(18,4);
    declare v_calc_dir int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_total_strike_qty decimal(18,2);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_avail_cal_flag int;
    declare v_combo_posi_id bigint;
    declare v_debt_qty decimal(18,2);
    declare v_open_posi_date int;
    declare v_modi_order_date int;
    declare v_modi_order_status varchar(2);
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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_modi_batch_no = p_modi_batch_no;
    SET v_modi_order_price = p_modi_order_price;
    SET v_modi_order_qty = p_modi_order_qty;
    SET v_modi_price_type = p_modi_price_type;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_par_value = p_par_value;
    SET v_target_code_no = p_target_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_combo_code = p_combo_code;
    SET v_strategy_id = p_strategy_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_asset_acco = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_report_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_comm_id = 0;
    SET v_modi_order_id = 0;
    SET v_new_order_id = 0;
    SET v_order_dir = 0;
    SET v_order_qty = 0;
    SET v_order_price = 0;
    SET v_order_batch_no = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_wtdraw_id = 0;
    SET v_wtdraw_qty = 0;
    SET v_wtdraw_status = "0";
    SET v_wtdraw_date = date_format(curdate(),'%Y%m%d');
    SET v_wtdraw_time = date_format(curtime(),'%H%i%s');
    SET v_rsp_info = " ";
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_compli_trig_id = 0;
    SET v_old_order_status = "0";
    SET v_new_order_status = "0";
    SET v_order_status = "0";
    SET v_update_times = 1;
    SET v_debt_type = 0;
    SET v_deal_flag = 0;
    SET v_invest_type = 0;
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_stock_code_no = 0;
    SET v_asset_type = 0;
    SET v_stock_type = 0;
    SET v_comm_opor = 0;
    SET v_external_no = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_price_type = 0;
    SET v_intrst_days = 0;
    SET v_all_fee = 0;
    SET v_order_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_busi_opor_no = 0;
    SET v_target_stock_code_no = 0;
    SET v_trade_acco = " ";
    SET v_tmp_order_frozen_amt = 0;
    SET v_tmp_order_frozen_qty = 0;
    SET v_tmp_stock_code_no = 0;
    SET v_tmp_order_qty = 0;
    SET v_pass_status = "0";
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_wtdraw_batch_no = 0;
    SET v_wtdraw_remark = " ";
    SET v_occur_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_status = "0";
    SET v_comm_oper_way = " ";
    SET v_comm_dir = 0;
    SET v_comm_amt = 0;
    SET v_calc_dir = 1;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_total_strike_qty = 0;
    SET v_all_wtdraw_qty = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_avail_cal_flag = 0;
    SET v_combo_posi_id = 0;
    SET v_debt_qty = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_modi_order_date = date_format(curdate(),'%Y%m%d');
    SET v_modi_order_status = " ";
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @处理标志# = 0; */
    set v_deal_flag = 0;

    /* SET @撤单日期# = @初始化日期#; */
    SET v_wtdraw_date = v_init_date;

    /* SET @申报日期# = @订单日期#; */
    SET v_report_date = v_order_date;

    /* set @投资类型#=《投资类型-二级市场交易性金融资产》 ; */
    set v_invest_type=1 ;

    /* if @改单价格类型# = 0 then */
    if v_modi_price_type = 0 then

      /* set @改单价格类型# = 《价格类型-限价》; */
      set v_modi_price_type = 1;
    end if;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;
    #检查是否有重复的有效记录

    /* 调用【原子_交易证券_交易_检查重复改单】*/
    call db_tdsecu.pra_tdsetd_CheckDupliModiOrder(
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
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.134.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_检查重复改单出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #修改后是否符合指令要求，不符合直接报错提示

    /* if @指令序号# <> 0 then */
    if v_comm_id <> 0 then

      /* 调用【原子_交易证券_指令_检查改单指令业务】*/
      call db_tdsecu.pra_tdseap_CheckModiOrderComm(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_init_date,
          v_comm_id,
          v_order_date,
          v_order_id,
          v_modi_batch_no,
          v_modi_order_price,
          v_modi_order_qty,
          v_modi_price_type,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "tdsecuT.4.134.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_检查改单指令业务出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

    end if;

    /* [事务开始] */
    START TRANSACTION;

        #取原委托信息

        /* 调用【原子_交易证券_交易_检查锁定获取改单订单信息】*/
        call db_tdsecu.pra_tdsetd_CheckLockGetModiOrderInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_id,
            v_modi_order_price,
            v_modi_order_qty,
            v_modi_price_type,
            v_error_code,
            v_error_info,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_no,
            v_stock_acco_no,
            v_stock_acco,
            v_stock_code_no,
            v_stock_code,
            v_asset_type,
            v_stock_type,
            v_comm_opor,
            v_external_no,
            v_comm_id,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_batch_no,
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
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_all_fee,
            v_order_oper_way,
            v_exter_comm_flag,
            v_busi_opor_no,
            v_update_times,
            v_combo_code,
            v_target_stock_code_no,
            v_trade_acco);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.134.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_检查锁定获取改单订单信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @临时_订单冻结金额# = @订单冻结金额#; */
        set v_tmp_order_frozen_amt = v_order_frozen_amt;

        /* set @临时_订单冻结数量# = @订单冻结数量#; */
        set v_tmp_order_frozen_qty = v_order_frozen_qty;

        /* set @临时_证券代码编号# = @证券代码编号#; */
        set v_tmp_stock_code_no = v_stock_code_no;

        /* set @临时_订单数量# = @订单数量#; */
        set v_tmp_order_qty = v_order_qty;
        #判断原委托状态,非允许撤单状态及不可改单则报错返回, 1-未报 2-已报 5-部成

        /* if @订单状态# <> 《订单状态-未报》 then */
        if v_order_status <> "1" then
            #非未报订单,只修改订单状态， 3-待撤

            /* set @订单状态# = 《订单状态-待撤》; */
            set v_order_status = "3";

            /* set @撤单状态# = 《撤单状态-未报》; */
            set v_wtdraw_status = "1";

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
                SET v_error_code = "tdsecuT.4.134.999";
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

                /* set @撤单状态# = 《撤单状态-已报》; */
                set v_wtdraw_status = "2";
            end if;
            #事务内获取撤单批号，分机构存放

            /* set @编号类型# = 《编号类型-撤单批号》; */
            set v_record_no_type = 16;

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
                SET v_error_code = "tdsecuT.4.134.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @撤单批号# = @当前编号#; */
            set v_wtdraw_batch_no = v_curr_no;

            /* set @撤单说明# = "新增改单自动撤消！"; */
            set v_wtdraw_remark = "新增改单自动撤消！";

            /* set @撤单数量# = 0; */
            set v_wtdraw_qty = 0;

            /* set @订单冻结金额# = 0; */
            set v_order_frozen_amt = 0;

            /* set @订单冻结数量# = 0; */
            set v_order_frozen_qty = 0;

            /* 调用【原子_交易证券_交易_撤销订单】*/
            call db_tdsecu.pra_tdsetd_CancelOrder(
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
                v_external_no,
                v_order_date,
                v_order_id,
                v_report_no,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_order_status,
                v_wtdraw_batch_no,
                v_wtdraw_qty,
                v_wtdraw_remark,
                v_wtdraw_status,
                v_order_price,
                v_trade_acco,
                v_error_code,
                v_error_info,
                v_wtdraw_id,
                v_wtdraw_date,
                v_wtdraw_time);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.4.134.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤销订单出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        else
            #未报撤单处理逻辑，修改订单状态 4-已撤

            /* set @订单状态# = 《订单状态-已撤》; */
            set v_order_status = "4";

            /* set @撤单状态# = 《撤单状态-成功》; */
            set v_wtdraw_status = "3";

            /* set @撤单数量# = @订单数量#; */
            set v_wtdraw_qty = v_order_qty;

            /* set @变动数量# = @订单数量#; */
            set v_occur_qty = v_order_qty;
            #更新指令表

            /* if @指令序号# > 0 then */
            if v_comm_id > 0 then

                /* set @指令撤销数量# = 0; */
                set v_comm_cancel_qty = 0;

                /* 调用【原子_交易证券_指令_撤销更新指令】*/
                call db_tdsecu.pra_tdseap_CancelUpdateComm(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_comm_id,
                    v_comm_cancel_qty,
                    v_wtdraw_qty,
                    v_error_code,
                    v_error_info,
                    v_limit_actual_price,
                    v_comm_status,
                    v_comm_date,
                    v_comm_batch_no,
                    v_comm_executor,
                    v_comm_oper_way,
                    v_comm_dir,
                    v_comm_amt);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.4.134.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销更新指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #计算指令变动金额

                /* set @指令方向# = @订单方向#; */
                set v_comm_dir = v_order_dir;

                /* set @计算方向# = 《计算方向-加上》; */
                set v_calc_dir = 1;

                /* 调用【原子_交易证券_公用_计算融资融券撤单指令变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetFinaLoanCancelCommOccurAmtAndQty(
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
                    v_wtdraw_qty,
                    v_comm_status,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_comm_amt,
                    v_error_code,
                    v_error_info,
                    v_comm_occur_amt,
                    v_comm_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.4.134.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券撤单指令变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* if @策略序号# >0 then */
                if v_strategy_id >0 then

                    /* [更新表记录][交易证券_指令_指令表][{策略订单数量} = {策略订单数量}-@订单数量#][{记录序号}=@指令序号#][2][@指令序号#] */
                    set v_update_date = date_format(curdate(),'%Y%m%d');
                    set v_update_time = date_format(curtime(),'%H%i%s');
                    update db_tdsecu.tb_tdseap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strategy_order_qty = strategy_order_qty-v_order_qty where row_id=v_comm_id;
                    if v_error_code = "1" then
                        ROLLBACK;        
                        SET v_error_code = "tdsecuT.4.134.2";
                        if v_mysql_message <> "" then
                            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
                        else
                            SET v_error_info = concat("指令序号=",v_comm_id);
                        end if;
                        leave label_pro;
                    end if;

                end if;
            end if;
            #事务内获取撤单批号，分机构存放

            /* set @编号类型# = 《编号类型-撤单批号》; */
            set v_record_no_type = 16;

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
                SET v_error_code = "tdsecuT.4.134.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @撤单批号# = @当前编号#; */
            set v_wtdraw_batch_no = v_curr_no;

            /* set @总成交数量# = @成交数量#; */
            set v_total_strike_qty = v_strike_qty;

            /* set @总撤单数量# = @订单数量#; */
            set v_all_wtdraw_qty = v_order_qty;

            /* 调用【原子_交易证券_公用_计算融资融券撤单交易变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetFinaLoanCancelExchChangeAmtAndQty(
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
                v_wtdraw_qty,
                v_total_strike_qty,
                v_all_wtdraw_qty,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_error_code,
                v_error_info,
                v_trade_occur_amt,
                v_trade_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.4.134.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券撤单交易变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #更新订单表

            /* set @订单冻结金额# = -1 * @订单冻结金额#; */
            set v_order_frozen_amt = -1 * v_order_frozen_amt;

            /* set @订单冻结数量# = -1 * @订单冻结数量#; */
            set v_order_frozen_qty = -1 * v_order_frozen_qty;

            /* set @撤单说明# = "新增改单自动撤消！"; */
            set v_wtdraw_remark = "新增改单自动撤消！";

            /* 调用【原子_交易证券_交易_撤销订单】*/
            call db_tdsecu.pra_tdsetd_CancelOrder(
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
                v_external_no,
                v_order_date,
                v_order_id,
                v_report_no,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_order_status,
                v_wtdraw_batch_no,
                v_wtdraw_qty,
                v_wtdraw_remark,
                v_wtdraw_status,
                v_order_price,
                v_trade_acco,
                v_error_code,
                v_error_info,
                v_wtdraw_id,
                v_wtdraw_date,
                v_wtdraw_time);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.4.134.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤销订单出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @可用计算标志# = 0; */
            set v_avail_cal_flag = 0;
            #处理订单资金持仓数据，保护指令变动和交易的变动

            /* set @组合持仓序号# = 0; */
            set v_combo_posi_id = 0;

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
                SET v_error_code = "tdsecuT.4.134.999";
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
                SET v_error_code = "tdsecuT.4.134.999";
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
        #改单处理

        /* set @改单日期# = @订单日期#; */
        set v_modi_order_date = v_order_date;

        /* set @改单状态# = 《改单状态-新建》; */
        set v_modi_order_status = "1";

        /* set @证券代码编号# = @临时_证券代码编号#; */
        set v_stock_code_no = v_tmp_stock_code_no;
        #set @价格类型# = @改单价格类型#;

        /* 调用【原子_交易证券_交易_新增改单】*/
        call db_tdsecu.pra_tdsetd_AddModiOrder(
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
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_stock_type,
            v_asset_type,
            v_modi_order_date,
            v_modi_batch_no,
            v_order_id,
            v_comm_id,
            v_order_price,
            v_order_qty,
            v_order_dir,
            v_order_date,
            v_order_time,
            v_price_type,
            v_modi_order_status,
            v_modi_order_price,
            v_modi_order_qty,
            v_modi_price_type,
            v_crncy_type,
            v_exch_crncy_type,
            v_order_oper_way,
            v_error_code,
            v_error_info,
            v_modi_order_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.4.134.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增改单出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* if @订单状态# = 《订单状态-已撤》 then */
    if v_order_status = "4" then

        /* [事务开始] */
        START TRANSACTION;


            /* set @订单数量# = 0; */
            set v_order_qty = 0;

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
                SET v_error_code = "tdsecuT.4.134.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_订单处理汇总订单出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


        /* [事务结束] */
        COMMIT;

    end if;
    #输出主推数据

    /* set @订单数量# = @临时_订单数量#; */
    set v_order_qty = v_tmp_order_qty;

    /* set @订单冻结金额# = @临时_订单冻结金额# + @订单冻结金额#; */
    set v_order_frozen_amt = v_tmp_order_frozen_amt + v_order_frozen_amt;

    /* set @订单冻结数量# = @临时_订单冻结数量# + @订单冻结数量#; */
    set v_order_frozen_qty = v_tmp_order_frozen_qty + v_order_frozen_qty;

    /* set @更新次数# = @更新次数# + 1; */
    set v_update_times = v_update_times + 1;

    /* 调用【原子_交易证券_交易_获取负债类型】*/
    call db_tdsecu.pra_tdsetd_GetDebtType(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_dir,
        v_error_code,
        v_error_info,
        v_debt_type);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.134.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_获取负债类型出现错误！',v_mysql_message);
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
    SET p_asset_acco = v_asset_acco;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_code = v_stock_code;
    SET p_report_no = v_report_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_comm_id = v_comm_id;
    SET p_modi_order_id = v_modi_order_id;
    SET p_new_order_id = v_new_order_id;
    SET p_order_dir = v_order_dir;
    SET p_order_qty = v_order_qty;
    SET p_order_price = v_order_price;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_comm_date = v_comm_date;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_wtdraw_id = v_wtdraw_id;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_wtdraw_status = v_wtdraw_status;
    SET p_wtdraw_date = v_wtdraw_date;
    SET p_wtdraw_time = v_wtdraw_time;
    SET p_rsp_info = v_rsp_info;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_old_order_status = v_old_order_status;
    SET p_new_order_status = v_new_order_status;
    SET p_order_status = v_order_status;
    SET p_update_times = v_update_times;
    SET p_debt_type = v_debt_type;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_检查是否存在融资负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_CheckExistFinaDebt;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_CheckExistFinaDebt(
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
    IN p_exgp_debt_fina_buy_strike_amt decimal(18,4),
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_exgp_debt_fina_buy_strike_amt decimal(18,4);
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exgp_debt_fina_buy_strike_amt = p_exgp_debt_fina_buy_strike_amt;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_检查是否存在融资负债】*/
    call db_tdsecu.pra_tdsetd_CheckExistFinaDebt(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exgp_debt_fina_buy_strike_amt,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_exch_group_no,
        v_stock_code_no,
        v_error_code,
        v_error_info,
        v_exist_debt_flag);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.135.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_检查是否存在融资负债出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exist_debt_flag = v_exist_debt_flag;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易_修改交易时间配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_ModifyTrdTimeConfig;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_ModifyTrdTimeConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_no int,
    IN p_am_trd_begin_time int,
    IN p_am_trd_end_time int,
    IN p_pm_trd_begin_time int,
    IN p_pm_trd_end_time int,
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
    declare v_exch_no int;
    declare v_am_trd_begin_time int;
    declare v_am_trd_end_time int;
    declare v_pm_trd_begin_time int;
    declare v_pm_trd_end_time int;
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
    SET v_exch_no = p_exch_no;
    SET v_am_trd_begin_time = p_am_trd_begin_time;
    SET v_am_trd_end_time = p_am_trd_end_time;
    SET v_pm_trd_begin_time = p_pm_trd_begin_time;
    SET v_pm_trd_end_time = p_pm_trd_end_time;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


       /* 调用【原子_交易证券_交易_修改交易时间配置】*/
       call db_tdsecu.pra_tdsetd_ModifyTrdTimeConfig(
           v_opor_co_no,
           v_opor_no,
           v_oper_mac,
           v_oper_ip_addr,
           v_oper_info,
           v_oper_way,
           v_func_code,
           v_co_no,
           v_exch_no,
           v_am_trd_begin_time,
           v_am_trd_end_time,
           v_pm_trd_begin_time,
           v_pm_trd_end_time,
           v_error_code,
           v_error_info);
       if v_error_code = "1" then
           SET v_error_code = "tdsecuT.4.136.999";
           if v_mysql_message <> "" then
                SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_修改交易时间配置出现错误！',v_mysql_message);
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

# 事务_交易证券_交易_查询交易组在途业务
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsetd_QueryExgpOrderOnWayBusiness;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsetd_QueryExgpOrderOnWayBusiness(
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_查询交易组在途业务】*/
    call db_tdsecu.pra_tdsetd_QueryExgpOrderOnWayBusiness(
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
        v_error_code,
        v_error_info,
        v_record_count);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.4.137.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_查询交易组在途业务出现错误！',v_mysql_message);
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


