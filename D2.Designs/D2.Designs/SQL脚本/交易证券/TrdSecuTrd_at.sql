DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_获取订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_GetOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_GetOrderInfo(
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
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_exch_crncy_type varchar(3);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_external_no bigint;
    declare v_comm_opor int;
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
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_record_valid_flag int;
    declare v_sett_flag int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_crncy_type = "CNY";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_external_no = 0;
    SET v_comm_opor = 0;
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
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_record_valid_flag = 0;
    SET v_sett_flag = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";

    
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
                
        SET v_error_code = "tdsecuA.4.1.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
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

# 原子_交易证券_交易_获取回报订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_GetRspOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_GetRspOrderInfo(
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
    OUT p_exter_comm_flag int,
    OUT p_external_no bigint,
    OUT p_combo_code varchar(32),
    OUT p_combo_posi_id bigint,
    OUT p_mac_addr varchar(32),
    OUT p_ip_addr varchar(32),
    OUT p_strategy_id bigint,
    OUT p_asset_acco_type int,
    OUT p_contra_no varchar(32),
    OUT p_exist_debt_flag int,
    OUT p_strike_qty decimal(18,2)
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
    declare v_exter_comm_flag int;
    declare v_external_no bigint;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_mac_addr varchar(32);
    declare v_ip_addr varchar(32);
    declare v_strategy_id bigint;
    declare v_asset_acco_type int;
    declare v_contra_no varchar(32);
    declare v_exist_debt_flag int;
    declare v_strike_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_exch_crncy_type varchar(3);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_report_time int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
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
    declare v_order_frozen_qty decimal(18,2);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_cost_calc_type int;
    declare v_record_valid_flag int;
    declare v_sett_flag int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exter_comm_flag = 0;
    SET v_external_no = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_mac_addr = " ";
    SET v_ip_addr = " ";
    SET v_strategy_id = 0;
    SET v_asset_acco_type = 0;
    SET v_contra_no = " ";
    SET v_exist_debt_flag = 0;
    SET v_strike_qty = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_crncy_type = "CNY";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
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
    SET v_order_frozen_qty = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_cost_calc_type = 0;
    SET v_record_valid_flag = 0;
    SET v_sett_flag = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_交易_订单表][字段][字段变量][{通道编号} = @通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {申报日期}=@申报日期# and {申报编号}=@申报编号#] */
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
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where pass_no = v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no and report_date=v_report_date and report_no=v_report_no limit 1;


    /* if @记录序号# = 0 then */
    if v_row_id = 0 then

        /* [获取表记录变量][历史_交易证券_交易_订单表][字段][字段变量][{通道编号} = @通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {申报日期}=@申报日期# and {申报编号}=@申报编号#][4][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#] */
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
            v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu_his.tb_tdsetd_order_his where pass_no = v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no and report_date=v_report_date and report_no=v_report_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "tdsecuA.4.2.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* set @订单序号# = @记录序号#; */
    set v_order_id = v_row_id;

    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;

    /* set @MAC地址# = @操作MAC#; */
    set v_mac_addr = v_oper_mac;

    /* set @IP地址# = @操作IP#; */
    set v_ip_addr = v_oper_ip_addr;
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
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_external_no = v_external_no;
    SET p_combo_code = v_combo_code;
    SET p_combo_posi_id = v_combo_posi_id;
    SET p_mac_addr = v_mac_addr;
    SET p_ip_addr = v_ip_addr;
    SET p_strategy_id = v_strategy_id;
    SET p_asset_acco_type = v_asset_acco_type;
    SET p_contra_no = v_contra_no;
    SET p_exist_debt_flag = v_exist_debt_flag;
    SET p_strike_qty = v_strike_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_锁定获取订单回报订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_LockGetRspOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_LockGetRspOrder(
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
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_target_code_no int,
    OUT p_trade_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_external_no bigint,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_opor int,
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
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_stamp_tax decimal(18,4),
    OUT p_trans_fee decimal(18,4),
    OUT p_brkage_fee decimal(18,4),
    OUT p_SEC_charges decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_impawn_ratio decimal(18,12),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_compli_trig_id bigint,
    OUT p_remark_info varchar(255),
    OUT p_order_oper_way varchar(2),
    OUT p_exter_comm_flag int,
    OUT p_busi_opor_no int,
    OUT p_combo_code varchar(32),
    OUT p_combo_posi_id bigint,
    OUT p_strategy_id bigint,
    OUT p_target_stock_code_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
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
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_busi_opor_no int;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_strategy_id bigint;
    declare v_target_stock_code_no int;
    declare v_update_times int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_func_code varchar(16);
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_rsp_info varchar(255);
    declare v_cost_calc_type int;
    declare v_record_valid_flag int;
    declare v_sett_flag int;
    declare v_target_stock_code varchar(6);
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
    SET v_order_id = p_order_id;
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
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
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
    SET v_strike_bond_accr_intrst = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_order_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_busi_opor_no = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_strategy_id = 0;
    SET v_target_stock_code_no = 0;
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_rsp_info = " ";
    SET v_cost_calc_type = 0;
    SET v_record_valid_flag = 0;
    SET v_sett_flag = 0;
    SET v_target_stock_code = " ";
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_contra_no = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][交易证券_交易_订单表][字段][字段变量][{记录序号} = @订单序号#][4][@订单序号#] */
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
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where row_id = v_order_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.3.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
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
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_trade_code_no = v_trade_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_external_no = v_external_no;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_opor = v_comm_opor;
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
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_all_fee = v_all_fee;
    SET p_stamp_tax = v_stamp_tax;
    SET p_trans_fee = v_trans_fee;
    SET p_brkage_fee = v_brkage_fee;
    SET p_SEC_charges = v_SEC_charges;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_remark_info = v_remark_info;
    SET p_order_oper_way = v_order_oper_way;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_combo_code = v_combo_code;
    SET p_combo_posi_id = v_combo_posi_id;
    SET p_strategy_id = v_strategy_id;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_锁定获取撤单回报订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_LockGetWithdrawOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_LockGetWithdrawOrder(
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
    IN p_order_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_crncy_type varchar(3),
    OUT p_stock_acco varchar(16),
    OUT p_stock_acco_no int,
    OUT p_stock_code varchar(6),
    OUT p_stock_code_no int,
    OUT p_target_code_no int,
    OUT p_trade_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_external_no bigint,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_opor int,
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
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_impawn_ratio decimal(18,12),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_rsp_info varchar(255),
    OUT p_compli_trig_id bigint,
    OUT p_remark_info varchar(255),
    OUT p_order_oper_way varchar(2),
    OUT p_exter_comm_flag int,
    OUT p_busi_opor_no int,
    OUT p_combo_code varchar(32),
    OUT p_combo_posi_id bigint,
    OUT p_strategy_id bigint,
    OUT p_target_stock_code_no int,
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_order_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_stock_acco varchar(16);
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
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
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_busi_opor_no int;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_strategy_id bigint;
    declare v_target_stock_code_no int;
    declare v_trade_acco varchar(32);
    declare v_update_times int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_func_code varchar(16);
    declare v_report_time int;
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
    declare v_cost_calc_type int;
    declare v_record_valid_flag int;
    declare v_sett_flag int;
    declare v_target_stock_code varchar(6);
    declare v_registration_agency varchar(32);
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_order_id = p_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_stock_acco = " ";
    SET v_stock_acco_no = 0;
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
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
    SET v_strike_bond_accr_intrst = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_order_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_busi_opor_no = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_strategy_id = 0;
    SET v_target_stock_code_no = 0;
    SET v_trade_acco = " ";
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_report_time = date_format(curtime(),'%H%i%s');
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
    SET v_cost_calc_type = 0;
    SET v_record_valid_flag = 0;
    SET v_sett_flag = 0;
    SET v_target_stock_code = " ";
    SET v_registration_agency = " ";
    SET v_contra_no = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    
    #先获取记录序号，锁定时，防止死锁
    #[获取表记录变量][交易证券_交易_订单表][{记录序号}][@订单序号#][{通道编号} = @通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {申报日期}=@申报日期# and {申报编号}=@申报编号#][4][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#]
    #改用订单序号获取

    /* [锁定获取表记录变量][交易证券_交易_订单表][字段][字段变量][{记录序号}=@订单序号#][4][@订单序号#] */
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
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where row_id=v_order_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.4.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @订单序号# = @记录序号#; */
    set v_order_id = v_row_id;

    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_code_no = v_stock_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_trade_code_no = v_trade_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_external_no = v_external_no;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_opor = v_comm_opor;
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
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_rsp_info = v_rsp_info;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_remark_info = v_remark_info;
    SET p_order_oper_way = v_order_oper_way;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_combo_code = v_combo_code;
    SET p_combo_posi_id = v_combo_posi_id;
    SET p_strategy_id = v_strategy_id;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_trade_acco = v_trade_acco;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_锁定获取成交回报订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_LockGetStrikeRspOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_LockGetStrikeRspOrder(
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
    IN p_order_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_crncy_type varchar(3),
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_target_code_no int,
    OUT p_trade_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_opor int,
    OUT p_external_no bigint,
    OUT p_report_time int,
    OUT p_order_batch_no int,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_dir int,
    OUT p_price_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_impawn_ratio decimal(18,12),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_rsp_info varchar(255),
    OUT p_compli_trig_id bigint,
    OUT p_remark_info varchar(255),
    OUT p_busi_opor_no int,
    OUT p_exter_comm_flag int,
    OUT p_order_oper_way varchar(2),
    OUT p_cost_calc_type int,
    OUT p_target_stock_code_no int,
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_order_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_external_no bigint;
    declare v_report_time int;
    declare v_order_batch_no int;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_busi_opor_no int;
    declare v_exter_comm_flag int;
    declare v_order_oper_way varchar(2);
    declare v_cost_calc_type int;
    declare v_target_stock_code_no int;
    declare v_update_times int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
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
    declare v_record_valid_flag int;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_strategy_id bigint;
    declare v_sett_flag int;
    declare v_target_stock_code varchar(6);
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_order_id = p_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_external_no = 0;
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_order_batch_no = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_busi_opor_no = 0;
    SET v_exter_comm_flag = 0;
    SET v_order_oper_way = " ";
    SET v_cost_calc_type = 0;
    SET v_target_stock_code_no = 0;
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
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
    SET v_record_valid_flag = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_strategy_id = 0;
    SET v_sett_flag = 0;
    SET v_target_stock_code = " ";
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_contra_no = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    

    /* [不报错锁定获取表记录变量][交易证券_交易_订单表][字段][字段变量][{记录序号} = @订单序号#] */
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
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where row_id = v_order_id limit 1 for update;


    /* if @记录序号# = 0 then */
    if v_row_id = 0 then

        /* [锁定获取表记录变量][历史_交易证券_交易_订单表][字段][字段变量][{记录序号} = @订单序号#][4][@订单序号#] */
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
            v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu_his.tb_tdsetd_order_his where row_id = v_order_id limit 1 for update;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "tdsecuA.4.5.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单序号=",v_order_id);
            end if;
            leave label_pro;
        end if;

    end if;

    /* set @订单序号# = @记录序号#; */
    set v_order_id = v_row_id;

    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_trade_code_no = v_trade_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_opor = v_comm_opor;
    SET p_external_no = v_external_no;
    SET p_report_time = v_report_time;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_dir = v_order_dir;
    SET p_price_type = v_price_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_status = v_order_status;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_rsp_info = v_rsp_info;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_remark_info = v_remark_info;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_order_oper_way = v_order_oper_way;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_更新成交回报订单记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_UpdateStrikeRspOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_UpdateStrikeRspOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_id bigint,
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_wtdraw_qty decimal(18,2),
    IN p_order_frozen_amt decimal(18,4),
    IN p_order_frozen_qty decimal(18,2),
    IN p_order_status varchar(2),
    IN p_strike_bond_accr_intrst decimal(18,4),
    IN p_all_fee decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
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
    declare v_order_id bigint;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
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
    SET v_order_id = p_order_id;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_order_frozen_qty = p_order_frozen_qty;
    SET v_order_status = p_order_status;
    SET v_strike_bond_accr_intrst = p_strike_bond_accr_intrst;
    SET v_all_fee = p_all_fee;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [不报错锁定获取表记录变量][交易证券_交易_订单表][{记录序号}][@记录序号#][{记录序号} = @订单序号#] */
    select row_id into v_row_id from db_tdsecu.tb_tdsetd_order where row_id = v_order_id limit 1 for update;


    /* if @记录序号#<>0 then */
    if v_row_id<>0 then

        /* [更新表记录][交易证券_交易_订单表][{撤单数量} = @撤单数量#,{订单冻结金额} = @订单冻结金额#, {订单冻结数量} = @订单冻结数量#, {订单状态} = @订单状态#, {成交数量} = @成交数量#, {成交金额} = @成交金额#, {成交债券计提利息}=@成交债券计提利息#,{全部费用}={全部费用} + @全部费用#,{印花税}={印花税} + @印花税#,{过户费} ={过户费} + @过户费#,{经手费}={经手费} + @经手费#,{证管费}={证管费} + @证管费#,{其他费用}={其他费用} + @其他费用#,{交易佣金}={交易佣金} + @交易佣金#,{其他佣金}={其他佣金} + @其他佣金#][{记录序号} = @订单序号#][2][@订单序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, wtdraw_qty = v_wtdraw_qty,order_frozen_amt = v_order_frozen_amt, order_frozen_qty = v_order_frozen_qty, order_status = v_order_status, strike_qty = v_strike_qty, strike_amt = v_strike_amt, strike_bond_accr_intrst=v_strike_bond_accr_intrst,all_fee=all_fee + v_all_fee,stamp_tax=stamp_tax + v_stamp_tax,trans_fee =trans_fee + v_trans_fee,brkage_fee=brkage_fee + v_brkage_fee,SEC_charges=SEC_charges + v_SEC_charges,other_fee=other_fee + v_other_fee,trade_commis=trade_commis + v_trade_commis,other_commis=other_commis + v_other_commis where row_id = v_order_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.4.6.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单序号=",v_order_id);
            end if;
            leave label_pro;
        end if;

    else

        /* [更新表记录][历史_交易证券_交易_订单表][{撤单数量} = @撤单数量#,{订单冻结金额} = @订单冻结金额#, {订单冻结数量} = @订单冻结数量#, {订单状态} = @订单状态#, {成交数量} = @成交数量#, {成交金额} = @成交金额#, {成交债券计提利息}=@成交债券计提利息#,{全部费用}={全部费用} + @全部费用#,{印花税}={印花税} + @印花税#,{过户费} ={过户费} + @过户费#,{经手费}={经手费} + @经手费#,{证管费}={证管费} + @证管费#,{其他费用}={其他费用} + @其他费用#,{交易佣金}={交易佣金} + @交易佣金#,{其他佣金}={其他佣金} + @其他佣金#][{记录序号} = @订单序号#][2][@订单序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu_his.tb_tdsetd_order_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, wtdraw_qty = v_wtdraw_qty,order_frozen_amt = v_order_frozen_amt, order_frozen_qty = v_order_frozen_qty, order_status = v_order_status, strike_qty = v_strike_qty, strike_amt = v_strike_amt, strike_bond_accr_intrst=v_strike_bond_accr_intrst,all_fee=all_fee + v_all_fee,stamp_tax=stamp_tax + v_stamp_tax,trans_fee =trans_fee + v_trans_fee,brkage_fee=brkage_fee + v_brkage_fee,SEC_charges=SEC_charges + v_SEC_charges,other_fee=other_fee + v_other_fee,trade_commis=trade_commis + v_trade_commis,other_commis=other_commis + v_other_commis where row_id = v_order_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.4.6.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单序号=",v_order_id);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_更新订单状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_UpdateOrderStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_UpdateOrderStatus(
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
    declare v_mach_date int;
    declare v_tmp_order_status varchar(2);
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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_order_status = p_order_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_order_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器日期][@机器日期#] */
    select date_format(curdate(),'%Y%m%d') into v_mach_date;


    /* if @订单日期# = 0 then */
    if v_order_date = 0 then

        /* set @订单日期# = @机器日期#; */
        set v_order_date = v_mach_date;
    end if;

    /* set @临时_订单状态# = @订单状态#; */
    set v_tmp_order_status = v_order_status;

    /* [锁定获取表记录变量][交易证券_交易_订单表][{订单状态}][@订单状态#][{记录序号} = @订单序号#][4][@订单序号#] */
    select order_status into v_order_status from db_tdsecu.tb_tdsetd_order where row_id = v_order_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.7.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* if @临时_订单状态# = 《订单状态-正报》 then */
    if v_tmp_order_status = "b" then

        /* [检查报错返回][@订单状态# <> 《订单状态-未报》 and @订单状态# <> 《订单状态-待报》 ][773][@订单序号#,@订单状态#] */
        if v_order_status <> "1" and v_order_status <> "a"  then
            
            SET v_error_code = "tdsecuA.4.7.773";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单序号=",v_order_id,",","订单状态=",v_order_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单序号=",v_order_id,",","订单状态=",v_order_status);
            end if;
            leave label_pro;
        end if;


        /* [更新表记录][交易证券_交易_订单表][{订单状态} = @临时_订单状态#][{记录序号} = @订单序号#][2][@订单序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_status = v_tmp_order_status where row_id = v_order_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.4.7.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单序号=",v_order_id);
            end if;
            leave label_pro;
        end if;

    else

        /* [更新表记录][交易证券_交易_订单表][{订单状态} = @临时_订单状态#][{记录序号} = @订单序号#][2][@订单序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_status = v_tmp_order_status where row_id = v_order_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.4.7.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单序号=",v_order_id);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_更新撤单状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_UpdateCancelOrderStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_UpdateCancelOrderStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_wtdraw_status varchar(2),
    IN p_wtdraw_qty decimal(18,2),
    IN p_wtdraw_remark varchar(255),
    IN p_report_date int,
    IN p_report_time int,
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
    IN p_external_no bigint,
    IN p_report_no varchar(32),
    IN p_order_price decimal(16,9),
    IN p_trade_acco varchar(32),
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
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_wtdraw_remark varchar(255);
    declare v_report_date int;
    declare v_report_time int;
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
    declare v_report_no varchar(32);
    declare v_order_price decimal(16,9);
    declare v_trade_acco varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_wtdraw_date int;
    declare v_wtdraw_time int;
    declare v_oper_func_code varchar(16);
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_wtdraw_batch_no int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_wtdraw_status = p_wtdraw_status;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_wtdraw_remark = p_wtdraw_remark;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
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
    SET v_external_no = p_external_no;
    SET v_report_no = p_report_no;
    SET v_order_price = p_order_price;
    SET v_trade_acco = p_trade_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_wtdraw_date = date_format(curdate(),'%Y%m%d');
    SET v_wtdraw_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_wtdraw_batch_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #判断撤单表是否记录流水，不存在需要增加一条。

    /* [获取表记录变量语句][交易证券_交易_撤单表][ifnull({记录序号},0)][@记录序号#][{订单序号} = @订单序号# and ({撤单状态} = 《撤单状态-未报》 or {撤单状态} = 《撤单状态-已报》)] */
    select ifnull(row_id,0) into v_row_id from db_tdsecu.tb_tdsetd_cancel where order_id = v_order_id and (wtdraw_status = "1" or wtdraw_status = "2") limit 1;


    /* if  @记录序号# = 0 then */
    if  v_row_id = 0 then

         /* set @撤单日期# = @初始化日期#; */
         set v_wtdraw_date = v_init_date;

        /* [获取机器时间][@撤单时间#] */
        select date_format(curtime(),'%H%i%s') into v_wtdraw_time;


         /* set @操作功能# = @功能编码#; */
         set v_oper_func_code = v_func_code;

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
             SET v_error_code = "tdsecuA.4.8.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
             end if;
             leave label_pro;
         elseif v_error_code <> "0" then
             leave label_pro;
         end if;


         /* set @撤单批号# = @当前编号#; */
         set v_wtdraw_batch_no = v_curr_no;

        /* [插入表记录][交易证券_交易_撤单表][字段][字段变量][1][@订单序号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdsetd_cancel(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_func_code, init_date, co_no, pd_no, 
            exch_group_no, asset_acco_no, pass_no, out_acco, 
            exch_crncy_type, exch_no, stock_acco_no, stock_acco, 
            stock_code_no, stock_code, external_no, wtdraw_batch_no, 
            wtdraw_date, wtdraw_time, order_date, order_id, 
            report_date, report_time, report_no, wtdraw_status, 
            wtdraw_qty, wtdraw_remark, order_price, trade_acco) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_func_code, v_init_date, v_co_no, v_pd_no, 
            v_exch_group_no, v_asset_acco_no, v_pass_no, v_out_acco, 
            v_exch_crncy_type, v_exch_no, v_stock_acco_no, v_stock_acco, 
            v_stock_code_no, v_stock_code, v_external_no, v_wtdraw_batch_no, 
            v_wtdraw_date, v_wtdraw_time, v_order_date, v_order_id, 
            v_report_date, v_report_time, v_report_no, v_wtdraw_status, 
            v_wtdraw_qty, v_wtdraw_remark, v_order_price, v_trade_acco);
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.4.8.1";
            SET v_error_info =  CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
            leave label_pro;
        end if;

    else

        /* [更新表记录][交易证券_交易_撤单表][{撤单数量} = {撤单数量} + @撤单数量#, {撤单状态} = @撤单状态#, {撤单说明} = @撤单说明#,{申报日期}=@申报日期#,{申报时间}=@申报时间#][{订单序号} = @订单序号# and ({撤单状态} = 《撤单状态-未报》 or {撤单状态} = 《撤单状态-已报》)][2][@订单序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdsetd_cancel set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, wtdraw_qty = wtdraw_qty + v_wtdraw_qty, wtdraw_status = v_wtdraw_status, wtdraw_remark = v_wtdraw_remark,report_date=v_report_date,report_time=v_report_time where order_id = v_order_id and (wtdraw_status = "1" or wtdraw_status = "2");
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.4.8.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单序号=",v_order_id);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_更新撤单回报订单记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_UpdateCancelRspOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_UpdateCancelRspOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_wtdraw_qty decimal(18,2),
    IN p_order_frozen_amt decimal(18,4),
    IN p_order_frozen_qty decimal(18,2),
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
    declare v_wtdraw_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_order_frozen_qty = p_order_frozen_qty;
    SET v_order_status = p_order_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_交易_订单表][{撤单数量} = @撤单数量#,{订单冻结金额} = @订单冻结金额#, {订单冻结数量} = @订单冻结数量#, {订单状态} = @订单状态#][{记录序号} = @订单序号#][2][@订单序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, wtdraw_qty = v_wtdraw_qty,order_frozen_amt = v_order_frozen_amt, order_frozen_qty = v_order_frozen_qty, order_status = v_order_status where row_id = v_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.9.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_更新获取改单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_UpdateGetModiOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_UpdateGetModiOrder(
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
    OUT p_init_date int,
    OUT p_modi_order_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_asset_type int,
    OUT p_modi_order_date int,
    OUT p_modi_order_time int,
    OUT p_modi_batch_no int,
    OUT p_modi_order_price decimal(16,9),
    OUT p_modi_order_qty decimal(18,2),
    OUT p_modi_price_type int,
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
    declare v_init_date int;
    declare v_modi_order_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_asset_type int;
    declare v_modi_order_date int;
    declare v_modi_order_time int;
    declare v_modi_batch_no int;
    declare v_modi_order_price decimal(16,9);
    declare v_modi_order_qty decimal(18,2);
    declare v_modi_price_type int;
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_record_count int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_pass_no int;
    declare v_stock_acco_no int;
    declare v_stock_type int;
    declare v_comm_id bigint;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_dir int;
    declare v_order_time int;
    declare v_price_type int;
    declare v_modi_order_status varchar(2);
    declare v_new_order_id bigint;
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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_modi_order_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_asset_type = 0;
    SET v_modi_order_date = date_format(curdate(),'%Y%m%d');
    SET v_modi_order_time = date_format(curtime(),'%H%i%s');
    SET v_modi_batch_no = 0;
    SET v_modi_order_price = 0;
    SET v_modi_order_qty = 0;
    SET v_modi_price_type = 0;
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_pass_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_type = 0;
    SET v_comm_id = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_dir = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_price_type = 0;
    SET v_modi_order_status = " ";
    SET v_new_order_id = 0;
    SET v_remark_info = " ";

    
    label_pro:BEGIN
    

    /* set @改单日期# = @订单日期#; */
    set v_modi_order_date = v_order_date;

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* set @改单序号# = 0; */
    set v_modi_order_id = 0;

    /* [获取表记录数量][交易证券_交易_改单表][@记录个数#][{改单日期} = @改单日期# and {订单序号} = @订单序号# and {改单状态} =《改单状态-新建》] */
    select count(1) into v_record_count from db_tdsecu.tb_tdsetd_modifyorder where modi_order_date = v_modi_order_date and order_id = v_order_id and modi_order_status ="1";


    /* [检查正常返回][@记录个数# = 0]; */
    if v_record_count = 0 then
        leave label_pro;
    end if;

    #不获取正报的，正报是中间状态，用于防止并发问题

    /* [锁定获取表记录变量][交易证券_交易_改单表][字段][字段变量][{改单日期} = @改单日期# and {订单序号} = @订单序号# and {改单状态} =《改单状态-新建》 order by {记录序号} desc][4][@改单日期#,@订单序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        stock_type, asset_type, modi_order_date, modi_order_time, 
        modi_batch_no, order_id, comm_id, order_price, 
        order_qty, order_dir, order_date, order_time, 
        price_type, modi_order_price, modi_order_qty, modi_order_status, 
        modi_price_type, crncy_type, exch_crncy_type, new_order_id, 
        remark_info, order_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_exch_no, v_stock_acco_no, v_stock_code_no, v_stock_code, 
        v_stock_type, v_asset_type, v_modi_order_date, v_modi_order_time, 
        v_modi_batch_no, v_order_id, v_comm_id, v_order_price, 
        v_order_qty, v_order_dir, v_order_date, v_order_time, 
        v_price_type, v_modi_order_price, v_modi_order_qty, v_modi_order_status, 
        v_modi_price_type, v_crncy_type, v_exch_crncy_type, v_new_order_id, 
        v_remark_info, v_order_oper_way from db_tdsecu.tb_tdsetd_modifyorder where modi_order_date = v_modi_order_date and order_id = v_order_id and modi_order_status ="1" order by row_id desc limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.10.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("改单日期=",v_modi_order_date,",","订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("改单日期=",v_modi_order_date,",","订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @改单序号# = @记录序号#; */
    set v_modi_order_id = v_row_id;

    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    #防止并发问题，先更新状态，避免被重复获取

    /* [更新表记录][交易证券_交易_改单表][{改单状态}=《改单状态-正改》][{记录序号}=@记录序号#][4][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_modifyorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, modi_order_status="2" where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.10.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_modi_order_id = v_modi_order_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_asset_type = v_asset_type;
    SET p_modi_order_date = v_modi_order_date;
    SET p_modi_order_time = v_modi_order_time;
    SET p_modi_batch_no = v_modi_batch_no;
    SET p_modi_order_price = v_modi_order_price;
    SET p_modi_order_qty = v_modi_order_qty;
    SET p_modi_price_type = v_modi_price_type;
    SET p_order_oper_way = v_order_oper_way;
    SET p_busi_opor_no = v_busi_opor_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_更新改单状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_UpdateModiOrderStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_UpdateModiOrderStatus(
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
    SET v_modi_order_date = p_modi_order_date;
    SET v_modi_order_id = p_modi_order_id;
    SET v_modi_order_status = p_modi_order_status;
    SET v_remark_info = p_remark_info;
    SET v_new_order_id = p_new_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_交易_改单表][{改单状态} = @改单状态#, {备注信息} = @备注信息#, {新订单序号} =@新订单序号#][{记录序号} = @改单序号#][2][@改单序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_modifyorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, modi_order_status = v_modi_order_status, remark_info = v_remark_info, new_order_id =v_new_order_id where row_id = v_modi_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.11.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("改单序号=",v_modi_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("改单序号=",v_modi_order_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_检查交易业务合法性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_CheckExchData;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_CheckExchData(
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
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_order_price decimal(16,9),
    IN p_order_frozen_amt decimal(18,4),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_busi_limit_str varchar(2048),
    IN p_record_count int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_frozen_amt decimal(18,4),
    OUT p_frozen_qty decimal(18,2)
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
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_order_frozen_amt decimal(18,4);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_busi_limit_str varchar(2048);
    declare v_record_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_frozen_amt decimal(18,4);
    declare v_frozen_qty decimal(18,2);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_order_price = p_order_price;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_record_count = p_record_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_frozen_amt = 0;
    SET v_frozen_qty = 0;
    SET v_asset_acco = " ";

    
    label_pro:BEGIN
    
    #检查参数合法性
    #检查业务限制

    /* if @订单方向# = 《订单方向-新股申购》 or @订单方向# = 《订单方向-新股申购》 then */
    if v_order_dir = 11 or v_order_dir = 11 then

        /* [检查报错返回][instr(@业务限制串#, concat(";",《业务限制-限制打新》,";")) > 0][128][@资产账户#,@业务限制串#] */
        if instr(v_busi_limit_str, concat(";",1,";")) > 0 then
            
            SET v_error_code = "tdsecuA.4.12.128";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户=",v_asset_acco,",","业务限制串=",v_busi_limit_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户=",v_asset_acco,",","业务限制串=",v_busi_limit_str);
            end if;
            leave label_pro;
        end if;

        #检查重复申购
        #注意，为避免申购订单废单后需要重新申购，因此在回报处理时要注意删除不成功的申购记录，以避免插入记录失败
        #[记录已存在][交易证券_交易_新股申购表][@记录个数#][{股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#][720][@股东代码编号#,@证券代码编号#]

        /* [记录已存在][交易证券_交易_订单表][@记录个数#][{订单日期} = @初始化日期# and ({订单状态}  in (《订单状态-未报》,《订单状态-待报》,《订单状态-正报》,《订单状态-已报》)) and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#][720][@资产账户编号#,@股东代码编号#,@证券代码编号#] */
        select count(1) into v_record_count from db_tdsecu.tb_tdsetd_order where order_date = v_init_date and (order_status  in ("1","a","b","2")) and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no limit 1;
        if v_record_count > 0 then
                    
            SET v_error_code = "tdsecuA.4.12.720";
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
            leave label_pro;
        end if;

    end if;

    /* if @订单方向# = 《订单方向-融资回购》 then */
    if v_order_dir = 3 then

        /* [检查报错返回][instr(@业务限制串#, concat(";",《业务限制-限制融资回购》,";")) > 0][129][@资产账户#,@业务限制串#] */
        if instr(v_busi_limit_str, concat(";",2,";")) > 0 then
            
            SET v_error_code = "tdsecuA.4.12.129";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户=",v_asset_acco,",","业务限制串=",v_busi_limit_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户=",v_asset_acco,",","业务限制串=",v_busi_limit_str);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @订单方向# = 《订单方向-融券回购》 then */
    if v_order_dir = 4 then

        /* [检查报错返回][instr(@业务限制串#, concat(";",《业务限制-限制融券回购》,";")) > 0][130][@资产账户#,@业务限制串#] */
        if instr(v_busi_limit_str, concat(";",3,";")) > 0 then
            
            SET v_error_code = "tdsecuA.4.12.130";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户=",v_asset_acco,",","业务限制串=",v_busi_limit_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户=",v_asset_acco,",","业务限制串=",v_busi_limit_str);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_frozen_amt = v_frozen_amt;
    SET p_frozen_qty = v_frozen_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_校验新增订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_CheckAddOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_CheckAddOrder(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_target_code_no int,
    IN p_trade_code_no int,
    IN p_combo_code varchar(32),
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
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
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    IN p_order_price decimal(16,9),
    IN p_order_frozen_amt decimal(18,4),
    IN p_impawn_ratio decimal(18,12),
    IN p_stock_type int,
    IN p_min_unit int,
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_last_price decimal(16,9),
    IN p_order_oper_way varchar(2),
    IN p_order_limit_time int,
    IN p_order_ctrl_qty decimal(18,2),
    IN p_order_ctrl_amt decimal(18,4),
    IN p_per_secu_posi_ratio decimal(18,12),
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_combo_code varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
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
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_frozen_amt decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_stock_type int;
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_order_oper_way varchar(2);
    declare v_order_limit_time int;
    declare v_order_ctrl_qty decimal(18,2);
    declare v_order_ctrl_amt decimal(18,4);
    declare v_per_secu_posi_ratio decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_mach_time int;
    declare v_busi_opor_no int;
    declare v_hk_cash_avail_date_type int;
    declare v_shsz_comm_avail_amt decimal(18,4);
    declare v_hk_comm_avail_amt decimal(18,4);
    declare v_shsz_trade_avail_amt decimal(18,4);
    declare v_hk_trade_avail_amt decimal(18,4);
    declare v_comm_avail_amt decimal(18,4);
    declare v_trade_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);
    declare v_avail_amt decimal(18,4);
    declare v_tmp_sell_ref_rate decimal(18,12);
    declare v_curr_qty decimal(18,2);
    declare v_comm_avail_qty decimal(18,2);
    declare v_trade_avail_qty decimal(18,2);
    declare v_static_avail_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_comm_reback_avail_qty decimal(18,2);
    declare v_trade_reback_avail_qty decimal(18,2);
    declare v_target_code_avail_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_combo_code = p_combo_code;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
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
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_order_price = p_order_price;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_stock_type = p_stock_type;
    SET v_min_unit = p_min_unit;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_last_price = p_last_price;
    SET v_order_oper_way = p_order_oper_way;
    SET v_order_limit_time = p_order_limit_time;
    SET v_order_ctrl_qty = p_order_ctrl_qty;
    SET v_order_ctrl_amt = p_order_ctrl_amt;
    SET v_per_secu_posi_ratio = p_per_secu_posi_ratio;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_busi_opor_no = 0;
    SET v_hk_cash_avail_date_type = 0;
    SET v_shsz_comm_avail_amt = 0;
    SET v_hk_comm_avail_amt = 0;
    SET v_shsz_trade_avail_amt = 0;
    SET v_hk_trade_avail_amt = 0;
    SET v_comm_avail_amt = 0;
    SET v_trade_avail_amt = 0;
    SET v_static_avail_amt = 0;
    SET v_avail_amt = 0;
    SET v_tmp_sell_ref_rate = 0;
    SET v_curr_qty = 0;
    SET v_comm_avail_qty = 0;
    SET v_trade_avail_qty = 0;
    SET v_static_avail_qty = 0;
    SET v_avail_qty = 0;
    SET v_comm_reback_avail_qty = 0;
    SET v_trade_reback_avail_qty = 0;
    SET v_target_code_avail_qty = 0;

    
    label_pro:BEGIN
    
    #判断价格是否符合在涨跌停范围内

    /* if (@订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-卖出》  or @订单方向# = 《订单方向-融资买入》) and  (@证券类型# <= 20 or @证券类型# >= 50) and (@市场编号# <> 《市场编号-沪港通证券交易所》 and @市场编号# <> 《市场编号-深港通证券交易所》 )  then */
    if (v_order_dir = 1 or v_order_dir = 2  or v_order_dir = 5) and  (v_stock_type <= 20 or v_stock_type >= 50) and (v_exch_no <> 3 and v_exch_no <> 4 )  then

        /* [检查报错返回][@涨停价# > 0 and @订单价格# > @涨停价#][706][@证券代码编号#,@订单价格#,@涨停价#] */
        if v_up_limit_price > 0 and v_order_price > v_up_limit_price then
            
            SET v_error_code = "tdsecuA.4.13.706";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,",","订单价格=",v_order_price,",","涨停价=",v_up_limit_price),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码编号=",v_stock_code_no,",","订单价格=",v_order_price,",","涨停价=",v_up_limit_price);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@跌停价# > 0 and @订单价格# < @跌停价#][706][@证券代码编号#,@订单价格#,@跌停价#] */
        if v_down_limit_price > 0 and v_order_price < v_down_limit_price then
            
            SET v_error_code = "tdsecuA.4.13.706";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,",","订单价格=",v_order_price,",","跌停价=",v_down_limit_price),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码编号=",v_stock_code_no,",","订单价格=",v_order_price,",","跌停价=",v_down_limit_price);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [检查报错返回][@价格类型# = 《价格类型-限价》 and @订单价格# <= 0 and (@订单方向# <> 《订单方向-基金申购》 and @订单方向# <> 《订单方向-基金赎回》 and @订单方向# <> 《订单方向-基金转换》)][707][@价格类型#,@订单价格#] */
    if v_price_type = 1 and v_order_price <= 0 and (v_order_dir <> 9 and v_order_dir <> 10 and v_order_dir <> 12) then
        
        SET v_error_code = "tdsecuA.4.13.707";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("价格类型=",v_price_type,",","订单价格=",v_order_price),"#",v_mysql_message);
        else
            SET v_error_info = concat("价格类型=",v_price_type,",","订单价格=",v_order_price);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@价格类型# <> 《价格类型-限价》 and (@订单方向# = 《订单方向-融资回购》 or @订单方向# = 《订单方向-融券回购》)][708][@价格类型#,@订单方向#] */
    if v_price_type <> 1 and (v_order_dir = 3 or v_order_dir = 4) then
        
        SET v_error_code = "tdsecuA.4.13.708";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("价格类型=",v_price_type,",","订单方向=",v_order_dir),"#",v_mysql_message);
        else
            SET v_error_info = concat("价格类型=",v_price_type,",","订单方向=",v_order_dir);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@价格类型# <> 《价格类型-限价》 and (@订单方向# = 《订单方向-新股申购》 or @订单方向# = 《订单方向-配售申购》)][709][@价格类型#,@订单方向#] */
    if v_price_type <> 1 and (v_order_dir = 11 or v_order_dir = 23) then
        
        SET v_error_code = "tdsecuA.4.13.709";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("价格类型=",v_price_type,",","订单方向=",v_order_dir),"#",v_mysql_message);
        else
            SET v_error_info = concat("价格类型=",v_price_type,",","订单方向=",v_order_dir);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@价格类型# <> 《价格类型-限价》 and @证券类型# > 20 and @证券类型# < 50][710][@价格类型#,@证券类型#] */
    if v_price_type <> 1 and v_stock_type > 20 and v_stock_type < 50 then
        
        SET v_error_code = "tdsecuA.4.13.710";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("价格类型=",v_price_type,",","证券类型=",v_stock_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("价格类型=",v_price_type,",","证券类型=",v_stock_type);
        end if;
        leave label_pro;
    end if;


    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* [检查报错返回][(@订单操作方式# = 《订单操作方式-增强交易》 or @订单操作方式# = 《订单操作方式-增强交易平仓》) and @下单限制时间# <> 0 and @机器时间# > @下单限制时间#][705][@机器时间#,@下单限制时间#] */
    if (v_order_oper_way = "14" or v_order_oper_way = "51") and v_order_limit_time <> 0 and v_mach_time > v_order_limit_time then
        
        SET v_error_code = "tdsecuA.4.13.705";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机器时间=",v_mach_time,",","下单限制时间=",v_order_limit_time),"#",v_mysql_message);
        else
            SET v_error_info = concat("机器时间=",v_mach_time,",","下单限制时间=",v_order_limit_time);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    #先判T0可用，交易过程中变化的可用放到变化后再判断，防止并发造成的计算错误

    /* if @订单操作方式# = 《订单操作方式-增强交易》 and (@订单方向#=《订单方向-买入》 or @订单方向#=《订单方向-融资买入》 or @订单方向#=《订单方向-卖出》) then */
    if v_order_oper_way = "14" and (v_order_dir=1 or v_order_dir=5 or v_order_dir=2) then
        #单笔限额、单笔数量判断  卖出方向放开——modify by wjp20190116

        /* if @订单方向#=《订单方向-卖出》 then */
        if v_order_dir=2 then

             /* set  @订单冻结金额# =@订单价格#*@订单数量#; */
             set  v_order_frozen_amt =v_order_price*v_order_qty;
        end if;

        /* 调用【原子_交易证券_T0_单笔资金和数量限额校验】*/
        call db_tdsecu.pra_tdset0_SingleAmtQtyCheck(
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
            v_co_no,
            v_order_qty,
            v_order_frozen_amt,
            v_order_dir,
            v_order_ctrl_qty,
            v_order_ctrl_amt,
            v_per_secu_posi_ratio,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuA.4.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_单笔资金和数量限额校验出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;

    /* if  @订单操作方式# = 《订单操作方式-增强交易》 then */
    if  v_order_oper_way = "14" then
        #T0 操作员持仓市值校验  modify by wjp 20181217

        /* 调用【原子_交易证券_T0_增强交易持仓市值校验】*/
        call db_tdsecu.pra_tdset0_PosiMarketValueCheck(
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
            v_co_no,
            v_order_qty,
            v_order_price,
            v_order_dir,
            v_last_price,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuA.4.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_增强交易持仓市值校验出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    #if  @订单操作方式# = 《订单操作方式-增强交易平仓》 then
        #增强交易平仓可用校验，防止超平操作
      #  [原子_交易证券_T0_增强交易平仓可用校验]
    #end if;

    /* set @港股通资金可用日期# =cast(substring(@资产账户业务控制配置串#,21,1) as SIGNED); */
    set v_hk_cash_avail_date_type =cast(substring(v_asac_busi_config_str,21,1) as SIGNED);

    /* if @订单方向# = 《订单方向-买入》 or @订单方向#=《订单方向-融资买入》 or @订单方向# = 《订单方向-基金申购》 or @订单方向# = 《订单方向-融券回购》  then */
    if v_order_dir = 1 or v_order_dir=5 or v_order_dir = 9 or v_order_dir = 4  then

        /* if substring(@交易组业务控制配置串#,3,1) <> 《交易资金校验-否》 then */
        if substring(v_exgp_busi_config_str,3,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算交易组资金可用】*/
            call db_tdsecu.pra_tdseac_CalcExgpCashAvail(
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
                v_capit_reback_days,
                v_error_code,
                v_error_info,
                v_shsz_comm_avail_amt,
                v_hk_comm_avail_amt,
                v_shsz_trade_avail_amt,
                v_hk_trade_avail_amt,
                v_comm_avail_amt,
                v_trade_avail_amt,
                v_static_avail_amt);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.13.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组资金可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 then */
            if v_exch_no = 1 or v_exch_no = 2 then

                /* if @港股通资金可用日期# = 《港股通资金可用日期-T+2日日初可用》 then */
                if v_hk_cash_avail_date_type = 4 then

                    /* set @可用金额# =@交易组可用金额#+@沪深交易可用金额# + 
                @交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额# + 
                least(0,@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#)+
                least(0,greatest(0,@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#) + @港股交易可用金额#); */
                    set v_avail_amt =v_exgp_avail_amt+v_shsz_trade_avail_amt + 
                                    v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt + 
                                    least(0,v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt)+
                                    least(0,greatest(0,v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt) + v_hk_trade_avail_amt);
                else

                    /* set @可用金额# =@交易组可用金额#+@沪深交易可用金额# + 
                least(0,@交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额#) + 
                least(0,greatest(0,@交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额#)+@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#)+
                least(0,greatest(0,greatest(0,@交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额#)+@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#) + @港股交易可用金额#); */
                    set v_avail_amt =v_exgp_avail_amt+v_shsz_trade_avail_amt + 
                                    least(0,v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt) + 
                                    least(0,greatest(0,v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt)+v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt)+
                                    least(0,greatest(0,greatest(0,v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt)+v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt) + v_hk_trade_avail_amt);
                end if;

                /* set @临时_卖出参考汇率# = 1; */
                set v_tmp_sell_ref_rate = 1;
            else

                /* set @可用金额# = @交易组可用金额# + @交易端可用金额#; */
                set v_avail_amt = v_exgp_avail_amt + v_trade_avail_amt;

                /* set @临时_卖出参考汇率# = @卖出参考汇率#; */
                set v_tmp_sell_ref_rate = v_sell_ref_rate;
            end if;

             /* [检查报错返回][Round(@订单冻结金额# * @临时_卖出参考汇率#,2) > @可用金额#][609][concat("可用金额=",@可用金额#,"|订单冻结金额=", Round(@订单冻结金额# * @临时_卖出参考汇率#,2),"|证券代码编号=",@证券代码编号#)] */
             if Round(v_order_frozen_amt * v_tmp_sell_ref_rate,2) > v_avail_amt then
                 
                 SET v_error_code = "tdsecuA.4.13.609";
                 if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(concat("可用金额=",v_avail_amt,"|订单冻结金额=", Round(v_order_frozen_amt * v_tmp_sell_ref_rate,2),"|证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                 else
                     SET v_error_info = concat("可用金额=",v_avail_amt,"|订单冻结金额=", Round(v_order_frozen_amt * v_tmp_sell_ref_rate,2),"|证券代码编号=",v_stock_code_no);
                 end if;
                 leave label_pro;
             end if;

        end if;

        /* if substring(@资产账户业务控制配置串#,3,1) <> 《交易资金校验-否》 then */
        if substring(v_asac_busi_config_str,3,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算资产账户资金可用】*/
            call db_tdsecu.pra_tdseac_CalcAsacCashAvail(
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
                v_crncy_type,
                v_exch_crncy_type,
                v_buy_ref_rate,
                v_sell_ref_rate,
                v_capit_reback_days,
                v_error_code,
                v_error_info,
                v_shsz_comm_avail_amt,
                v_hk_comm_avail_amt,
                v_shsz_trade_avail_amt,
                v_hk_trade_avail_amt,
                v_comm_avail_amt,
                v_trade_avail_amt,
                v_static_avail_amt);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.13.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户资金可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 then */
            if v_exch_no = 1 or v_exch_no = 2 then

                /* if @港股通资金可用日期# = 《港股通资金可用日期-T+2日日初可用》 then */
                if v_hk_cash_avail_date_type = 4 then

                    /* set @可用金额# =@资产账户可用金额#+@沪深交易可用金额# + 
                @资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额# + 
                least(0,@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#)+
                least(0,greatest(0,@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#) + @港股交易可用金额#); */
                    set v_avail_amt =v_asac_avail_amt+v_shsz_trade_avail_amt + 
                                    v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt + 
                                    least(0,v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt)+
                                    least(0,greatest(0,v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt) + v_hk_trade_avail_amt);
                else

                    /* set @可用金额# =@资产账户可用金额#+@沪深交易可用金额# + 
                least(0,@资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额#) + 
                least(0,greatest(0,@资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额#)+@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#)+
                least(0,greatest(0,greatest(0,@资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额#)+@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#) + @港股交易可用金额#); */
                    set v_avail_amt =v_asac_avail_amt+v_shsz_trade_avail_amt + 
                                    least(0,v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt) + 
                                    least(0,greatest(0,v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt)+v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt)+
                                    least(0,greatest(0,greatest(0,v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt)+v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt) + v_hk_trade_avail_amt);
                end if;

                /* set @临时_卖出参考汇率# = 1; */
                set v_tmp_sell_ref_rate = 1;
            else

                /* set @可用金额# = @资产账户可用金额# + @交易端可用金额#; */
                set v_avail_amt = v_asac_avail_amt + v_trade_avail_amt;

                /* set @临时_卖出参考汇率# = @卖出参考汇率#; */
                set v_tmp_sell_ref_rate = v_sell_ref_rate;
            end if;
             #卖出参考汇率，A股需要为1

             /* [检查报错返回][Round(@订单冻结金额# * @临时_卖出参考汇率#,2) > @可用金额#][610][concat("可用金额=",@可用金额#,"|订单冻结金额=", Round(@订单冻结金额# * @临时_卖出参考汇率#,2),"|证券代码编号=",@证券代码编号#)] */
             if Round(v_order_frozen_amt * v_tmp_sell_ref_rate,2) > v_avail_amt then
                 
                 SET v_error_code = "tdsecuA.4.13.610";
                 if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(concat("可用金额=",v_avail_amt,"|订单冻结金额=", Round(v_order_frozen_amt * v_tmp_sell_ref_rate,2),"|证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                 else
                     SET v_error_info = concat("可用金额=",v_avail_amt,"|订单冻结金额=", Round(v_order_frozen_amt * v_tmp_sell_ref_rate,2),"|证券代码编号=",v_stock_code_no);
                 end if;
                 leave label_pro;
             end if;

        end if;
    end if;

    /* if @订单方向# = 《订单方向-卖出》 or  @订单方向# = 《订单方向-零股卖出》 or @订单方向# = 《订单方向-基金赎回》 then */
    if v_order_dir = 2 or  v_order_dir = 31 or v_order_dir = 10 then

        /* if substring(@交易组业务控制配置串#,4,1) <> 《交易持仓校验-否》 then */
        if substring(v_exgp_busi_config_str,4,1) <> 2 then

            /* if @组合代码# <> " " then */
            if v_combo_code <> " " then

               /* 调用【原子_交易证券_账户_计算交易组组合策略持仓可用】*/
               call db_tdsecu.pra_tdseac_CalcExgpCombStraPosiAvail(
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
                   v_posi_reback_days,
                   v_combo_code,
                   v_error_code,
                   v_error_info,
                   v_curr_qty,
                   v_comm_avail_qty,
                   v_trade_avail_qty,
                   v_static_avail_qty);
               if v_error_code = "1" then
                   SET v_error_code = "tdsecuA.4.13.999";
                   if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组组合策略持仓可用出现错误！',v_mysql_message);
                   end if;
                   leave label_pro;
               elseif v_error_code <> "0" then
                   leave label_pro;
               end if;


               /* set @可用数量# = @当前数量# + @交易端可用数量#; */
               set v_avail_qty = v_curr_qty + v_trade_avail_qty;

               /* [检查报错返回][@订单数量# > @可用数量#][916][@可用数量#,@订单数量#,@证券代码编号#] */
               if v_order_qty > v_avail_qty then
                   
                   SET v_error_code = "tdsecuA.4.13.916";
                   if v_mysql_message <> "" then
                       SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                   else
                       SET v_error_info = concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no);
                   end if;
                   leave label_pro;
               end if;

           end if;

           /* 调用【原子_交易证券_账户_计算交易组持仓可用】*/
           call db_tdsecu.pra_tdseac_CalcExgpPosiAvail(
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
               v_posi_reback_days,
               v_error_code,
               v_error_info,
               v_comm_avail_qty,
               v_trade_avail_qty,
               v_static_avail_qty);
           if v_error_code = "1" then
               SET v_error_code = "tdsecuA.4.13.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组持仓可用出现错误！',v_mysql_message);
               end if;
               leave label_pro;
           elseif v_error_code <> "0" then
               leave label_pro;
           end if;


           /* set @可用数量# = @交易组可用数量# + @交易端可用数量#; */
           set v_avail_qty = v_exgp_avail_qty + v_trade_avail_qty;

           /* [检查报错返回][@订单数量# > @可用数量#][611][@可用数量#,@订单数量#,@证券代码编号#] */
           if v_order_qty > v_avail_qty then
               
               SET v_error_code = "tdsecuA.4.13.611";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
               else
                   SET v_error_info = concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no);
               end if;
               leave label_pro;
           end if;

        end if;

        /* if substring(@资产账户业务控制配置串#,4,1) <> 《交易持仓校验-否》 then */
        if substring(v_asac_busi_config_str,4,1) <> 2 then

            /* if @组合代码# <> " " then */
            if v_combo_code <> " " then

               /* 调用【原子_交易证券_账户_计算资产账户组合策略持仓可用】*/
               call db_tdsecu.pra_tdseac_CalcAsacCombStraPosiAvail(
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
                   v_exch_no,
                   v_stock_acco_no,
                   v_stock_code_no,
                   v_posi_reback_days,
                   v_combo_code,
                   v_error_code,
                   v_error_info,
                   v_curr_qty,
                   v_comm_avail_qty,
                   v_trade_avail_qty,
                   v_static_avail_qty);
               if v_error_code = "1" then
                   SET v_error_code = "tdsecuA.4.13.999";
                   if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户组合策略持仓可用出现错误！',v_mysql_message);
                   end if;
                   leave label_pro;
               elseif v_error_code <> "0" then
                   leave label_pro;
               end if;


               /* set @可用数量# = @当前数量# + @交易端可用数量#; */
               set v_avail_qty = v_curr_qty + v_trade_avail_qty;

               /* [检查报错返回][@订单数量# > @可用数量#][917][@可用数量#,@订单数量#,@证券代码编号#] */
               if v_order_qty > v_avail_qty then
                   
                   SET v_error_code = "tdsecuA.4.13.917";
                   if v_mysql_message <> "" then
                       SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                   else
                       SET v_error_info = concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no);
                   end if;
                   leave label_pro;
               end if;

           end if;

          /* 调用【原子_交易证券_账户_计算资产账户持仓可用】*/
          call db_tdsecu.pra_tdseac_CalcAsacPosiAvail(
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
              v_exch_no,
              v_stock_acco_no,
              v_stock_code_no,
              v_posi_reback_days,
              v_error_code,
              v_error_info,
              v_comm_avail_qty,
              v_trade_avail_qty,
              v_static_avail_qty);
          if v_error_code = "1" then
              SET v_error_code = "tdsecuA.4.13.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户持仓可用出现错误！',v_mysql_message);
              end if;
              leave label_pro;
          elseif v_error_code <> "0" then
              leave label_pro;
          end if;


          /* set @可用数量# = @资产账户可用数量# + @交易端可用数量#; */
          set v_avail_qty = v_asac_avail_qty + v_trade_avail_qty;

          /* [检查报错返回][@订单数量# > @可用数量#][612][@可用数量#,@订单数量#,@证券代码编号#] */
          if v_order_qty > v_avail_qty then
              
              SET v_error_code = "tdsecuA.4.13.612";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
              else
                  SET v_error_info = concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no);
              end if;
              leave label_pro;
          end if;

        end if;
        #港股的最小单位跟着票走 modify by wjp20181116

        /* if (@证券类型# > (20)) and (@证券类型# < (50)) then */
        if (v_stock_type > (20)) and (v_stock_type < (50)) then

            /* set @最小单位# = 10; */
            set v_min_unit = 10;
        end if;

        /* [检查报错返回][(mod(@订单数量#,@最小单位#) > 0) and (mod(@可用数量# - @订单数量#,@最小单位#)>0)][715][@订单数量#,@证券代码编号#] */
        if (mod(v_order_qty,v_min_unit) > 0) and (mod(v_avail_qty - v_order_qty,v_min_unit)>0) then
            
            SET v_error_code = "tdsecuA.4.13.715";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @订单方向# = 《订单方向-质押提交》 then */
    if v_order_dir = 21 then

        /* set @证券代码编号# = @交易代码编号#; */
        set v_stock_code_no = v_trade_code_no;

        /* if substring(@交易组业务控制配置串#,4,1) <> 《交易持仓校验-否》 then */
        if substring(v_exgp_busi_config_str,4,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算交易组持仓可用】*/
            call db_tdsecu.pra_tdseac_CalcExgpPosiAvail(
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
                v_posi_reback_days,
                v_error_code,
                v_error_info,
                v_comm_avail_qty,
                v_trade_avail_qty,
                v_static_avail_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.13.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组持仓可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @可用数量# = @交易组交易代码可用数量# + @交易端可用数量#; */
            set v_avail_qty = v_exgp_trade_code_avail_qty + v_trade_avail_qty;

            /* [检查报错返回][@订单数量# > @可用数量#][611][@可用数量#,@订单数量#,@证券代码编号#] */
            if v_order_qty > v_avail_qty then
                
                SET v_error_code = "tdsecuA.4.13.611";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if substring(@资产账户业务控制配置串#,4,1) <> 《交易持仓校验-否》 then */
        if substring(v_asac_busi_config_str,4,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算资产账户持仓可用】*/
            call db_tdsecu.pra_tdseac_CalcAsacPosiAvail(
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
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_posi_reback_days,
                v_error_code,
                v_error_info,
                v_comm_avail_qty,
                v_trade_avail_qty,
                v_static_avail_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.13.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户持仓可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @可用数量# = @资产账户交易代码可用数量# + @交易端可用数量#; */
            set v_avail_qty = v_asac_trade_code_avail_qty + v_trade_avail_qty;

            /* [检查报错返回][@订单数量# > @可用数量#][612][@可用数量#,@订单数量#,@证券代码编号#] */
            if v_order_qty > v_avail_qty then
                
                SET v_error_code = "tdsecuA.4.13.612";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;

        end if;
    end if;
    #质押转回,判断标准券持仓可用,以及根据质押流水判断转回可用

    /* if @订单方向# = 《订单方向-质押转回》 then */
    if v_order_dir = 22 then

        /* if substring(@交易组业务控制配置串#,4,1) <> 《交易持仓校验-否》 then */
        if substring(v_exgp_busi_config_str,4,1) <> 2 then

            /* set @证券代码编号# = @交易代码编号#; */
            set v_stock_code_no = v_trade_code_no;

            /* 调用【原子_交易证券_账户_获取交易组债券质押转回可用数量】*/
            call db_tdsecu.pra_tdseac_GetExgpBondImpawnBackAvailQty(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_co_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_error_code,
                v_error_info,
                v_curr_qty,
                v_comm_reback_avail_qty,
                v_trade_reback_avail_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.13.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_获取交易组债券质押转回可用数量出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

            #这里还需要加上账户库的可用数量

            /* set @证券代码编号# = @标的代码编号#; */
            set v_stock_code_no = v_target_code_no;

            /* 调用【原子_交易证券_账户_计算交易组持仓可用】*/
            call db_tdsecu.pra_tdseac_CalcExgpPosiAvail(
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
                v_posi_reback_days,
                v_error_code,
                v_error_info,
                v_comm_avail_qty,
                v_trade_avail_qty,
                v_static_avail_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.13.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组持仓可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @交易组可用数量# = @交易组交易代码可用数量# + @交易端转回可用数量#; */
            set v_exgp_avail_qty = v_exgp_trade_code_avail_qty + v_trade_reback_avail_qty;

            /* set @标的代码可用数量# = @交易组标的代码可用数量# + @交易端可用数量#; */
            set v_target_code_avail_qty = v_exgp_target_code_avail_qty + v_trade_avail_qty;

            /* [检查报错返回][(@订单数量# > (@交易组可用数量#)) or (@订单数量# * @质押比例# > (@标的代码可用数量#))][611][@订单数量#,@交易组可用数量#,@质押比例#,@标的代码可用数量#,@证券代码编号#] */
            if (v_order_qty > (v_exgp_avail_qty)) or (v_order_qty * v_impawn_ratio > (v_target_code_avail_qty)) then
                
                SET v_error_code = "tdsecuA.4.13.611";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单数量=",v_order_qty,",","交易组可用数量=",v_exgp_avail_qty,",","质押比例=",v_impawn_ratio,",","标的代码可用数量=",v_target_code_avail_qty,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单数量=",v_order_qty,",","交易组可用数量=",v_exgp_avail_qty,",","质押比例=",v_impawn_ratio,",","标的代码可用数量=",v_target_code_avail_qty,",","证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if substring(@资产账户业务控制配置串#,4,1) <> 《交易持仓校验-否》 then */
        if substring(v_asac_busi_config_str,4,1) <> 2 then

            /* set @证券代码编号# = @交易代码编号#; */
            set v_stock_code_no = v_trade_code_no;

            /* 调用【原子_交易证券_账户_获取资产账户债券质押转回可用数量】*/
            call db_tdsecu.pra_tdseac_GetAsacBondImpawnBackAvailQty(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_co_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_error_code,
                v_error_info,
                v_curr_qty,
                v_comm_reback_avail_qty,
                v_trade_reback_avail_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.13.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_获取资产账户债券质押转回可用数量出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @证券代码编号# = @标的代码编号#; */
            set v_stock_code_no = v_target_code_no;

            /* 调用【原子_交易证券_账户_计算资产账户持仓可用】*/
            call db_tdsecu.pra_tdseac_CalcAsacPosiAvail(
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
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_posi_reback_days,
                v_error_code,
                v_error_info,
                v_comm_avail_qty,
                v_trade_avail_qty,
                v_static_avail_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.13.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户持仓可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @资产账户可用数量# = @资产账户交易代码可用数量# + @交易端转回可用数量#; */
            set v_asac_avail_qty = v_asac_trade_code_avail_qty + v_trade_reback_avail_qty;

            /* set @标的代码可用数量# = @资产账户标的代码可用数量# + @交易端可用数量#; */
            set v_target_code_avail_qty = v_asac_target_code_avail_qty + v_trade_avail_qty;

            /* [检查报错返回][(@订单数量# > (@资产账户可用数量#)) or (@订单数量# * @质押比例# > (@标的代码可用数量#))][612][@订单数量#,@资产账户可用数量#,@质押比例#,@标的代码可用数量#,@证券代码编号#] */
            if (v_order_qty > (v_asac_avail_qty)) or (v_order_qty * v_impawn_ratio > (v_target_code_avail_qty)) then
                
                SET v_error_code = "tdsecuA.4.13.612";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单数量=",v_order_qty,",","资产账户可用数量=",v_asac_avail_qty,",","质押比例=",v_impawn_ratio,",","标的代码可用数量=",v_target_code_avail_qty,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单数量=",v_order_qty,",","资产账户可用数量=",v_asac_avail_qty,",","质押比例=",v_impawn_ratio,",","标的代码可用数量=",v_target_code_avail_qty,",","证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;

        end if;
    end if;
    #融资回购,判断标准券持仓可用

    /* if @订单方向# = 《订单方向-融资回购》 then */
    if v_order_dir = 3 then

        /* set @证券代码编号# = @标的代码编号#; */
        set v_stock_code_no = v_target_code_no;

        /* if substring(@交易组业务控制配置串#,4,1) <> 《交易持仓校验-否》 then */
        if substring(v_exgp_busi_config_str,4,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算交易组持仓可用】*/
            call db_tdsecu.pra_tdseac_CalcExgpPosiAvail(
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
                v_posi_reback_days,
                v_error_code,
                v_error_info,
                v_comm_avail_qty,
                v_trade_avail_qty,
                v_static_avail_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.13.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组持仓可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @可用数量# = @交易组标的代码可用数量# + @交易端可用数量#; */
            set v_avail_qty = v_exgp_target_code_avail_qty + v_trade_avail_qty;

            /* [检查报错返回][@订单数量# > @可用数量#][611][@可用数量#,@订单数量#,@证券代码编号#] */
            if v_order_qty > v_avail_qty then
                
                SET v_error_code = "tdsecuA.4.13.611";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if substring(@资产账户业务控制配置串#,4,1) <> 《交易持仓校验-否》 then */
        if substring(v_asac_busi_config_str,4,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算资产账户持仓可用】*/
            call db_tdsecu.pra_tdseac_CalcAsacPosiAvail(
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
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_posi_reback_days,
                v_error_code,
                v_error_info,
                v_comm_avail_qty,
                v_trade_avail_qty,
                v_static_avail_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.13.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户持仓可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @可用数量# = @资产账户标的代码可用数量# + @交易端可用数量#; */
            set v_avail_qty = v_asac_target_code_avail_qty + v_trade_avail_qty;

            /* [检查报错返回][@订单数量# > @可用数量#][612][@可用数量#,@订单数量#,@证券代码编号#] */
            if v_order_qty > v_avail_qty then
                
                SET v_error_code = "tdsecuA.4.13.612";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;

        end if;
    end if;
    #融券回购,校验资金是否足够
    #if @订单方向# = 《订单方向-融券回购》 then
       # if substring(@交易组业务控制配置串#,3,1) <> 《交易资金校验-否》 then
            #[原子_交易证券_账户_计算交易组资金可用]
          #  set @可用金额# = @交易组可用金额# + @交易端可用金额#;
           # [检查报错返回][@订单冻结金额# > @可用金额#][609][@可用金额#, @订单冻结金额#,@证券代码编号#]
        #end if;
       # if substring(@资产账户业务控制配置串#,3,1) <> 《交易资金校验-否》 then
           # [原子_交易证券_账户_计算资产账户资金可用]
          #  set @可用金额# = @资产账户可用金额# + @交易端可用金额#;
           # [检查报错返回][@订单冻结金额# > @可用金额#][610][@可用金额#, @订单冻结金额#,@证券代码编号#]
        #end if;
    #end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_新增订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_AddOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_AddOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_comm_opor int,
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
    IN p_external_no bigint,
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_batch_no int,
    IN p_order_date int,
    IN p_order_dir int,
    IN p_price_type int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_order_status varchar(2),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_frozen_amt decimal(18,4),
    IN p_order_frozen_qty decimal(18,2),
    IN p_net_price_flag int,
    IN p_intrst_days int,
    IN p_par_value decimal(16,9),
    IN p_impawn_ratio decimal(18,12),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_compli_trig_id bigint,
    IN p_remark_info varchar(255),
    IN p_order_oper_way varchar(2),
    IN p_exter_comm_flag int,
    IN p_cost_calc_type int,
    IN p_combo_code varchar(32),
    IN p_combo_posi_id bigint,
    IN p_target_stock_code varchar(6),
    IN p_target_stock_code_no int,
    IN p_registration_agency varchar(32),
    IN p_trade_acco varchar(32),
    IN p_contra_no varchar(32),
    IN p_asset_acco_type int,
    IN p_exist_debt_flag int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_id bigint,
    OUT p_order_time int,
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
    declare v_comm_opor int;
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
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_batch_no int;
    declare v_order_date int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_cost_calc_type int;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_contra_no varchar(32);
    declare v_asset_acco_type int;
    declare v_exist_debt_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_id bigint;
    declare v_order_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_rsp_info varchar(255);
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
    declare v_nav_asset decimal(18,4);
    declare v_sett_flag int;
    declare v_record_valid_flag int;
    declare v_record_count int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_strategy_id bigint;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_comm_opor = p_comm_opor;
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
    SET v_external_no = p_external_no;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_date = p_order_date;
    SET v_order_dir = p_order_dir;
    SET v_price_type = p_price_type;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_order_status = p_order_status;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_order_frozen_qty = p_order_frozen_qty;
    SET v_net_price_flag = p_net_price_flag;
    SET v_intrst_days = p_intrst_days;
    SET v_par_value = p_par_value;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_remark_info = p_remark_info;
    SET v_order_oper_way = p_order_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_combo_code = p_combo_code;
    SET v_combo_posi_id = p_combo_posi_id;
    SET v_target_stock_code = p_target_stock_code;
    SET v_target_stock_code_no = p_target_stock_code_no;
    SET v_registration_agency = p_registration_agency;
    SET v_trade_acco = p_trade_acco;
    SET v_contra_no = p_contra_no;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_exist_debt_flag = p_exist_debt_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_id = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_rsp_info = " ";
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
    SET v_nav_asset = 0;
    SET v_sett_flag = 0;
    SET v_record_valid_flag = 0;
    SET v_record_count = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_strategy_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器时间][@订单时间#] */
    select date_format(curtime(),'%H%i%s') into v_order_time;


    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @回报信息# = " "; */
    set v_rsp_info = " ";

    /* set @全部费用# = 0; */
    set v_all_fee = 0;

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

    /* set @交易佣金# = 0; */
    set v_trade_commis = 0;

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

    /* set @净资产# = 0; */
    set v_nav_asset = 0;

    /* set @清算结算标志# = 《清算结算标志-未处理》; */
    set v_sett_flag = 2;

    /* set @记录有效标志# =《记录有效标志-有效》; */
    set v_record_valid_flag =1;

    /* if @体外指令标志# = 0 then */
    if v_exter_comm_flag = 0 then

        /* set @体外指令标志# = 《体外指令标志-体内》; */
        set v_exter_comm_flag = 1;
    end if;
    #如果是新股申购，需先插入新股申购表，以避免重复申购

    /* if @订单方向# = 《订单方向-新股申购》 or @订单方向# = 《订单方向-配售申购》  then */
    if v_order_dir = 11 or v_order_dir = 23  then

        /* [记录已存在][交易证券_交易_订单表][@记录个数#][{股东代码编号} = @股东代码编号# and {证券代码编号}= @证券代码编号# and {订单状态} in ('1','a','b','2')][720][@股东代码编号#,@证券代码编号#] */
        select count(1) into v_record_count from db_tdsecu.tb_tdsetd_order where stock_acco_no = v_stock_acco_no and stock_code_no= v_stock_code_no and order_status in ('1','a','b','2') limit 1;
        if v_record_count > 0 then
                    
            SET v_error_code = "tdsecuA.4.14.720";
            SET v_error_info = concat("股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
            leave label_pro;
        end if;

    end if;

    /* set @撤单数量# = 0; */
    set v_wtdraw_qty = 0;

    /* set @成交金额# = 0; */
    set v_strike_amt = 0;

    /* set @成交数量# = 0; */
    set v_strike_qty = 0;

    /* set @成交债券计提利息# = 0; */
    set v_strike_bond_accr_intrst = 0;

    /* set @策略序号# = 0; */
    set v_strategy_id = 0;

    /* set @操作MAC# = REPLACE(@操作MAC#,":",""); */
    set v_oper_mac = REPLACE(v_oper_mac,":","");

    /* [插入表记录][交易证券_交易_订单表][字段][字段变量][1][@订单日期#,@订单批号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsetd_order(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, co_no, pd_no, 
        exch_group_no, asset_acco_no, pass_no, out_acco, 
        exch_crncy_type, exch_no, stock_acco_no, stock_acco, 
        stock_code_no, stock_code, trade_code_no, target_code_no, 
        stock_type, asset_type, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_date, order_time, order_batch_no, 
        order_dir, price_type, order_price, order_qty, 
        order_status, wtdraw_qty, strike_amt, strike_qty, 
        all_fee, stamp_tax, trans_fee, brkage_fee, 
        SEC_charges, other_fee, trade_commis, other_commis, 
        trade_tax, trade_cost_fee, trade_system_use_fee, stock_settle_fee, 
        net_price_flag, intrst_days, par_value, bond_accr_intrst, 
        bond_rate_type, strike_bond_accr_intrst, impawn_ratio, order_frozen_amt, 
        order_frozen_qty, rsp_info, compli_trig_id, remark_info, 
        cost_calc_type, order_oper_way, exter_comm_flag, record_valid_flag, 
        combo_code, combo_posi_id, strategy_id, sett_flag, 
        target_stock_code, target_stock_code_no, registration_agency, trade_acco, 
        contra_no, asset_acco_type, exist_debt_flag) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_exch_crncy_type, v_exch_no, v_stock_acco_no, v_stock_acco, 
        v_stock_code_no, v_stock_code, v_trade_code_no, v_target_code_no, 
        v_stock_type, v_asset_type, v_external_no, v_comm_id, 
        v_comm_batch_no, v_comm_opor, v_report_date, v_report_time, 
        v_report_no, v_order_date, v_order_time, v_order_batch_no, 
        v_order_dir, v_price_type, v_order_price, v_order_qty, 
        v_order_status, v_wtdraw_qty, v_strike_amt, v_strike_qty, 
        v_all_fee, v_stamp_tax, v_trans_fee, v_brkage_fee, 
        v_SEC_charges, v_other_fee, v_trade_commis, v_other_commis, 
        v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, v_stock_settle_fee, 
        v_net_price_flag, v_intrst_days, v_par_value, v_bond_accr_intrst, 
        v_bond_rate_type, v_strike_bond_accr_intrst, v_impawn_ratio, v_order_frozen_amt, 
        v_order_frozen_qty, v_rsp_info, v_compli_trig_id, v_remark_info, 
        v_cost_calc_type, v_order_oper_way, v_exter_comm_flag, v_record_valid_flag, 
        v_combo_code, v_combo_posi_id, v_strategy_id, v_sett_flag, 
        v_target_stock_code, v_target_stock_code_no, v_registration_agency, v_trade_acco, 
        v_contra_no, v_asset_acco_type, v_exist_debt_flag);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.14.1";
        SET v_error_info =  CONCAT(concat("订单日期=",v_order_date,",","订单批号=",v_order_batch_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@订单序号#] */
    select LAST_INSERT_ID() into v_order_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_id = v_order_id;
    SET p_order_time = v_order_time;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_锁定获取指令订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_LockGetCommOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_LockGetCommOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_comm_id bigint,
    IN p_row_id bigint,
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
    OUT p_target_code_no int,
    OUT p_trade_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_comm_opor int,
    OUT p_external_no bigint,
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_batch_no int,
    OUT p_order_id bigint,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_dir int,
    OUT p_price_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_all_fee decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_net_price_flag int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_order_oper_way varchar(2),
    OUT p_busi_opor_no int,
    OUT p_target_stock_code_no int,
    OUT p_trade_acco varchar(32)
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
    declare v_row_id bigint;
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
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
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
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_target_stock_code_no int;
    declare v_trade_acco varchar(32);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_comm_batch_no int;
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
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_rsp_info varchar(255);
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
    declare v_registration_agency varchar(32);
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
    SET v_init_date = p_init_date;
    SET v_comm_id = p_comm_id;
    SET v_row_id = p_row_id;
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
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
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
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_target_stock_code_no = 0;
    SET v_trade_acco = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_comm_batch_no = 0;
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
    SET v_strike_bond_accr_intrst = 0;
    SET v_rsp_info = " ";
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
    SET v_registration_agency = " ";
    SET v_contra_no = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][交易证券_交易_订单表][字段][字段变量][{指令序号} = @指令序号# and {订单状态} in (《订单状态-未报》,《订单状态-已报》,《订单状态-部成》) and {记录序号} > @记录序号# order by {记录序号} asc][4][@指令序号#, @记录序号#] */
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
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where comm_id = v_comm_id and order_status in ("1","2","5") and row_id > v_row_id order by row_id asc limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.15.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id,","," 记录序号=", v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id,","," 记录序号=", v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @订单序号# = @记录序号#; */
    set v_order_id = v_row_id;

    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
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
    SET p_target_code_no = v_target_code_no;
    SET p_trade_code_no = v_trade_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_comm_opor = v_comm_opor;
    SET p_external_no = v_external_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_id = v_order_id;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_dir = v_order_dir;
    SET p_price_type = v_price_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_status = v_order_status;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_all_fee = v_all_fee;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_net_price_flag = v_net_price_flag;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_order_oper_way = v_order_oper_way;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_trade_acco = v_trade_acco;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_锁定获取指令修改订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_LockGetCommModiOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_LockGetCommModiOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_comm_id bigint,
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_begin_date int,
    IN p_comm_end_date int,
    IN p_comm_begin_time int,
    IN p_comm_end_time int,
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_asset_type int,
    OUT p_stock_type int,
    OUT p_comm_opor int,
    OUT p_external_no bigint,
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_batch_no int,
    OUT p_order_id bigint,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_dir int,
    OUT p_price_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_net_price_flag int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_order_oper_way varchar(2),
    OUT p_busi_opor_no int,
    OUT p_trade_acco varchar(32)
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
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_asset_type int;
    declare v_stock_type int;
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
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_trade_acco varchar(32);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_exch_crncy_type varchar(3);
    declare v_stock_acco varchar(16);
    declare v_comm_batch_no int;
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
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_rsp_info varchar(255);
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
    SET v_init_date = p_init_date;
    SET v_comm_id = p_comm_id;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_begin_date = p_comm_begin_date;
    SET v_comm_end_date = p_comm_end_date;
    SET v_comm_begin_time = p_comm_begin_time;
    SET v_comm_end_time = p_comm_end_time;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_asset_type = 0;
    SET v_stock_type = 0;
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
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_trade_acco = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_stock_acco = " ";
    SET v_comm_batch_no = 0;
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
    SET v_strike_bond_accr_intrst = 0;
    SET v_impawn_ratio = 0;
    SET v_rsp_info = " ";
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
    SET v_contra_no = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][交易证券_交易_订单表][字段][字段变量][{指令序号} = @指令序号# and {订单状态} in (《订单状态-未报》, 《订单状态-已报》,《订单状态-部成》) and (((({订单方向} = 《订单方向-买入》 or {订单方向} = 《订单方向-融资回购》) and {订单价格} > @指令实际限价#) or (({订单方向} = 《订单方向-卖出》 or {订单方向} = 《订单方向-融券回购》) and {订单价格} < @指令实际限价#)) or (@指令开始日期# > 0 and {订单日期} < @指令开始日期#) or (@指令结束日期# > 0 and {订单日期} > @指令结束日期#) or ({订单日期} = @指令开始日期# and @指令开始时间# > 0 and {订单时间} < @指令开始时间#) or ({订单日期} = @指令结束日期# and @指令结束时间# > 0 and {订单时间} > @指令结束时间#) )  and {记录序号} > @记录序号# order by {记录序号} asc][4][@指令序号#] */
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
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where comm_id = v_comm_id and order_status in ("1", "2","5") and ((((order_dir = 1 or order_dir = 3) and order_price > v_limit_actual_price) or ((order_dir = 2 or order_dir = 4) and order_price < v_limit_actual_price)) or (v_comm_begin_date > 0 and order_date < v_comm_begin_date) or (v_comm_end_date > 0 and order_date > v_comm_end_date) or (order_date = v_comm_begin_date and v_comm_begin_time > 0 and order_time < v_comm_begin_time) or (order_date = v_comm_end_date and v_comm_end_time > 0 and order_time > v_comm_end_time) )  and row_id > v_row_id order by row_id asc limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.16.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
        leave label_pro;
    end if;


    /* set @订单序号# = @记录序号#; */
    set v_order_id = v_row_id;

    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_asset_type = v_asset_type;
    SET p_stock_type = v_stock_type;
    SET p_comm_opor = v_comm_opor;
    SET p_external_no = v_external_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_id = v_order_id;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_dir = v_order_dir;
    SET p_price_type = v_price_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_status = v_order_status;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_net_price_flag = v_net_price_flag;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_order_oper_way = v_order_oper_way;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_trade_acco = v_trade_acco;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_更新报盘订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_UpdateRptOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_UpdateRptOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_init_date = p_init_date;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新多行表记录][交易证券_交易_订单表][{订单状态} =《订单状态-待报》][{订单状态} = 《订单状态-未报》 and {订单日期} = @初始化日期#][@指定行数#][2][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1,  order_status ="a" where order_status = "1" and order_date = v_init_date limit v_row_count;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.17.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询报盘订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryRptOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryRptOrder(
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
    declare v_mach_time int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_mach_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;

    #交易时间配置表 机构有设的取机构，没有的取默认系统级的，即 0

    /* if  @指定行数#  = -1  then */
    if  v_row_count  = -1  then

    /* select t1.*  from (select  a.{操作MAC} ,a.{操作IP} ,a.{操作信息} ,a.{机构编号} ,a.{产品编号} ,a.{交易组编号} ,a.{资产账户编号} ,a.{通道编号} ,a.{外部账号} ,a.{市场编号} ,a.{股东代码} ,a.{证券代码} ,a.{证券类型} ,a.{外部编号} ,a.{订单日期} ,a.{记录序号} as {订单序号} ,a.{订单方向} ,a.{订单数量} ,a.{订单价格} ,a.{订单状态} ,a.{价格类型},a.{交易账户},a.{登记机构},a.{初始化日期},a.{交易币种},a.{订单时间},a.{订单操作方式},a.{更新次数},ifnull(b.{机构编号},0) as default_co_no from ~交易证券_交易_订单表^ a left join ~交易证券_交易_交易时间配置表^ b on a.{机构编号} = b.{机构编号} and a.{市场编号} = b.{市场编号} where a.{订单日期} = @初始化日期# and a.{订单状态} in (《订单状态-未报》, 《订单状态-待报》) and (@通道编号# = 0 or a.{通道编号}=@通道编号#)  and a.{记录序号} > @记录序号# order by a.{记录序号}) as t1,~交易证券_交易_交易时间配置表^ t2 where t1.default_co_no = t2.{机构编号} and t1.{市场编号} = t2.{市场编号} and ((@机器时间# between t2.{上午交易开始时间} and t2.{上午交易结束时间}) or (@机器时间# between t2.{下午交易开始时间} and t2.{下午交易结束时间})); */
    select t1.*  from (select  a.oper_mac ,a.oper_ip_addr ,a.oper_info ,a.co_no ,a.pd_no ,a.exch_group_no ,a.asset_acco_no ,a.pass_no ,a.out_acco ,a.exch_no ,a.stock_acco ,a.stock_code ,a.stock_type ,a.external_no ,a.order_date ,a.row_id as order_id ,a.order_dir ,a.order_qty ,a.order_price ,a.order_status ,a.price_type,a.trade_acco,a.registration_agency,a.init_date,a.exch_crncy_type,a.order_time,a.order_oper_way,a.update_times,ifnull(b.co_no,0) as default_co_no from db_tdsecu.tb_tdsetd_order a left join db_tdsecu.tb_tdsetd_trdtimeconfig b on a.co_no = b.co_no and a.exch_no = b.exch_no where a.order_date = v_init_date and a.order_status in ("1", "a") and (v_pass_no = 0 or a.pass_no=v_pass_no)  and a.row_id > v_row_id order by a.row_id) as t1,db_tdsecu.tb_tdsetd_trdtimeconfig t2 where t1.default_co_no = t2.co_no and t1.exch_no = t2.exch_no and ((v_mach_time between t2.am_trd_begin_time and t2.am_trd_end_time) or (v_mach_time between t2.pm_trd_begin_time and t2.pm_trd_end_time));
    else

    /* select t1.*  from (select  a.{操作MAC} ,a.{操作IP} ,a.{操作信息} ,a.{机构编号} ,a.{产品编号} ,a.{交易组编号} ,a.{资产账户编号} ,a.{通道编号} ,a.{外部账号} ,a.{市场编号} ,a.{股东代码} ,a.{证券代码} ,a.{证券类型} ,a.{外部编号} ,a.{订单日期} ,a.{记录序号} as {订单序号} ,a.{订单方向} ,a.{订单数量} ,a.{订单价格} ,a.{订单状态} ,a.{价格类型},a.{交易账户},a.{登记机构},a.{初始化日期},a.{交易币种},a.{订单时间},a.{订单操作方式},a.{更新次数},ifnull(b.{机构编号},0) as default_co_no from ~交易证券_交易_订单表^ a left join ~交易证券_交易_交易时间配置表^ b on a.{机构编号} = b.{机构编号} and a.{市场编号} = b.{市场编号} where a.{订单日期} = @初始化日期# and a.{订单状态} in (《订单状态-未报》, 《订单状态-待报》) and (@通道编号# = 0 or a.{通道编号}=@通道编号#)  and a.{记录序号} > @记录序号# order by a.{记录序号}) as t1,~交易证券_交易_交易时间配置表^ t2 where t1.default_co_no = t2.{机构编号} and t1.{市场编号} = t2.{市场编号} and ((@机器时间# between t2.{上午交易开始时间} and t2.{上午交易结束时间}) or (@机器时间# between t2.{下午交易开始时间} and t2.{下午交易结束时间})) limit @指定行数#; */
    select t1.*  from (select  a.oper_mac ,a.oper_ip_addr ,a.oper_info ,a.co_no ,a.pd_no ,a.exch_group_no ,a.asset_acco_no ,a.pass_no ,a.out_acco ,a.exch_no ,a.stock_acco ,a.stock_code ,a.stock_type ,a.external_no ,a.order_date ,a.row_id as order_id ,a.order_dir ,a.order_qty ,a.order_price ,a.order_status ,a.price_type,a.trade_acco,a.registration_agency,a.init_date,a.exch_crncy_type,a.order_time,a.order_oper_way,a.update_times,ifnull(b.co_no,0) as default_co_no from db_tdsecu.tb_tdsetd_order a left join db_tdsecu.tb_tdsetd_trdtimeconfig b on a.co_no = b.co_no and a.exch_no = b.exch_no where a.order_date = v_init_date and a.order_status in ("1", "a") and (v_pass_no = 0 or a.pass_no=v_pass_no)  and a.row_id > v_row_id order by a.row_id) as t1,db_tdsecu.tb_tdsetd_trdtimeconfig t2 where t1.default_co_no = t2.co_no and t1.exch_no = t2.exch_no and ((v_mach_time between t2.am_trd_begin_time and t2.am_trd_end_time) or (v_mach_time between t2.pm_trd_begin_time and t2.pm_trd_end_time)) limit v_row_count;
    end if;
    #[获取表记录][交易证券_交易_订单表][{操作MAC} ,{操作IP} ,{操作信息} ,{机构编号} ,{产品编号} ,{交易组编号} ,{资产账户编号} ,{通道编号} ,{外部账号} ,{市场编号} ,{股东代码} ,{证券代码} ,{证券类型} ,{外部编号} ,{订单日期} ,{记录序号} as {订单序号} ,{订单方向} ,{订单数量} ,{订单价格} ,{订单状态} ,{价格类型},{交易账户},{登记机构},{初始化日期},{交易币种},{订单时间},{订单操作方式},{更新次数}][{订单日期} = @初始化日期# and {订单状态} in (《订单状态-未报》, 《订单状态-待报》) and (@通道编号# = 0 or {通道编号}=@通道编号#)  and {记录序号} > @记录序号# order by {记录序号}][@指定行数#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_检查获取撤单订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_CheckGetCancelOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_CheckGetCancelOrder(
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
    declare v_record_count int;
    declare v_init_date int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_stock_acco varchar(16);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_external_no bigint;
    declare v_comm_opor int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_batch_no int;
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
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_cost_calc_type int;
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
    declare v_sett_flag int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_record_count = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_stock_acco = " ";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_external_no = 0;
    SET v_comm_opor = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_batch_no = 0;
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
    SET v_strike_bond_accr_intrst = 0;
    SET v_order_frozen_qty = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_cost_calc_type = 0;
    SET v_exter_comm_flag = 0;
    SET v_record_valid_flag = 0;
    SET v_sett_flag = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";

    
    label_pro:BEGIN
    
    #检查是否存在已成功的撤单流水

    /* [记录已存在][交易证券_交易_撤单表][@记录个数#][{撤单日期}=@初始化日期# and {订单序号}=@订单序号# and {撤单状态}=《撤单状态-成功》][716][@订单序号#] */
    select count(1) into v_record_count from db_tdsecu.tb_tdsetd_cancel where wtdraw_date=v_init_date and order_id=v_order_id and wtdraw_status="3" limit 1;
    if v_record_count > 0 then
                
        SET v_error_code = "tdsecuA.4.19.716";
        SET v_error_info = concat("订单序号=",v_order_id);
        leave label_pro;
    end if;


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
                
        SET v_error_code = "tdsecuA.4.19.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
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

# 原子_交易证券_交易_检查锁定获取待撤订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_CheckLockGetPreCancelOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_CheckLockGetPreCancelOrder(
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
    OUT p_exch_crncy_type varchar(3),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_target_code_no int,
    OUT p_trade_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_external_no bigint,
    OUT p_order_batch_no int,
    OUT p_order_time int,
    OUT p_report_no varchar(32),
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_price_type int,
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_wtdraw_time int,
    OUT p_net_price_flag int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_impawn_ratio decimal(18,12),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_rsp_info varchar(255),
    OUT p_exter_comm_flag int,
    OUT p_update_times int,
    OUT p_combo_code varchar(32),
    OUT p_target_stock_code_no int,
    OUT p_trade_acco varchar(32)
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
    declare v_exch_crncy_type varchar(3);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_order_time int;
    declare v_report_no varchar(32);
    declare v_report_date int;
    declare v_report_time int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_price_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_wtdraw_time int;
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_rsp_info varchar(255);
    declare v_exter_comm_flag int;
    declare v_update_times int;
    declare v_combo_code varchar(32);
    declare v_target_stock_code_no int;
    declare v_trade_acco varchar(32);
    declare v_record_count int;
    declare v_init_date int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_func_code varchar(16);
    declare v_comm_opor int;
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
    declare v_record_valid_flag int;
    declare v_combo_posi_id bigint;
    declare v_strategy_id bigint;
    declare v_sett_flag int;
    declare v_target_stock_code varchar(6);
    declare v_registration_agency varchar(32);
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
    SET v_exch_crncy_type = "CNY";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_external_no = 0;
    SET v_order_batch_no = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_order_status = "0";
    SET v_price_type = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_all_fee = 0;
    SET v_wtdraw_qty = 0;
    SET v_wtdraw_time = date_format(curtime(),'%H%i%s');
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_rsp_info = " ";
    SET v_exter_comm_flag = 0;
    SET v_update_times = 1;
    SET v_combo_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_trade_acco = " ";
    SET v_record_count = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_comm_opor = 0;
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
    SET v_record_valid_flag = 0;
    SET v_combo_posi_id = 0;
    SET v_strategy_id = 0;
    SET v_sett_flag = 0;
    SET v_target_stock_code = " ";
    SET v_registration_agency = " ";
    SET v_contra_no = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    
    #检查是否存在已成功的撤单流水

    /* [记录已存在][交易证券_交易_撤单表][@记录个数#][{撤单日期}=@初始化日期# and {订单序号}=@订单序号# and {撤单状态}=《撤单状态-成功》][715][@订单序号#] */
    select count(1) into v_record_count from db_tdsecu.tb_tdsetd_cancel where wtdraw_date=v_init_date and order_id=v_order_id and wtdraw_status="3" limit 1;
    if v_record_count > 0 then
                
        SET v_error_code = "tdsecuA.4.20.715";
        SET v_error_info = concat("订单序号=",v_order_id);
        leave label_pro;
    end if;


    /* [锁定获取表记录变量][交易证券_交易_订单表][字段][字段变量][{记录序号}=@订单序号#][4][@订单序号#] */
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
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where row_id=v_order_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.20.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@订单状态# <> 《订单状态-未报》 and @订单状态# <> 《订单状态-已报》  and @订单状态# <> 《订单状态-部成》 ][717][@订单状态#] */
    if v_order_status <> "1" and v_order_status <> "2"  and v_order_status <> "5"  then
        
        SET v_error_code = "tdsecuA.4.20.717";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单状态=",v_order_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单状态=",v_order_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@订单状态# <> 《订单状态-未报》 and (@证券类型# = 《证券类型-申购》 or @订单方向# =《订单方向-新股申购》 or @订单方向# =《订单方向-配售申购》)][718][@订单方向#] */
    if v_order_status <> "1" and (v_stock_type = 2 or v_order_dir =11 or v_order_dir =23) then
        
        SET v_error_code = "tdsecuA.4.20.718";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单方向=",v_order_dir),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单方向=",v_order_dir);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@订单状态# <> 《订单状态-未报》 and (@订单方向# = 《订单方向-质押提交》 or @订单方向# = 《订单方向-质押转回》)][718][@订单状态#,@订单方向#] */
    if v_order_status <> "1" and (v_order_dir = 21 or v_order_dir = 22) then
        
        SET v_error_code = "tdsecuA.4.20.718";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单状态=",v_order_status,",","订单方向=",v_order_dir),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单状态=",v_order_status,",","订单方向=",v_order_dir);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_order_oper_way = v_order_oper_way;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_target_code_no = v_target_code_no;
    SET p_trade_code_no = v_trade_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_external_no = v_external_no;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_time = v_order_time;
    SET p_report_no = v_report_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_order_status = v_order_status;
    SET p_price_type = v_price_type;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_all_fee = v_all_fee;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_wtdraw_time = v_wtdraw_time;
    SET p_net_price_flag = v_net_price_flag;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_rsp_info = v_rsp_info;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_update_times = v_update_times;
    SET p_combo_code = v_combo_code;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_trade_acco = v_trade_acco;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_撤销订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_CancelOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_CancelOrder(
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
    IN p_external_no bigint,
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_report_no varchar(32),
    IN p_order_frozen_amt decimal(18,4),
    IN p_order_frozen_qty decimal(18,2),
    IN p_order_status varchar(2),
    IN p_wtdraw_batch_no int,
    IN p_wtdraw_qty decimal(18,2),
    IN p_wtdraw_remark varchar(255),
    IN p_wtdraw_status varchar(2),
    IN p_order_price decimal(16,9),
    IN p_trade_acco varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_wtdraw_id bigint,
    OUT p_wtdraw_date int,
    OUT p_wtdraw_time int
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
    declare v_external_no bigint;
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_report_no varchar(32);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_wtdraw_remark varchar(255);
    declare v_wtdraw_status varchar(2);
    declare v_order_price decimal(16,9);
    declare v_trade_acco varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_wtdraw_id bigint;
    declare v_wtdraw_date int;
    declare v_wtdraw_time int;
    declare v_oper_func_code varchar(16);
    declare v_update_date int;
    declare v_update_time int;
    declare v_report_date int;
    declare v_report_time int;
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
    SET v_external_no = p_external_no;
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_report_no = p_report_no;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_order_frozen_qty = p_order_frozen_qty;
    SET v_order_status = p_order_status;
    SET v_wtdraw_batch_no = p_wtdraw_batch_no;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_wtdraw_remark = p_wtdraw_remark;
    SET v_wtdraw_status = p_wtdraw_status;
    SET v_order_price = p_order_price;
    SET v_trade_acco = p_trade_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_wtdraw_id = 0;
    SET v_wtdraw_date = date_format(curdate(),'%Y%m%d');
    SET v_wtdraw_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取机器日期][@撤单日期#] */
    select date_format(curdate(),'%Y%m%d') into v_wtdraw_date;


    /* [获取机器时间][@撤单时间#] */
    select date_format(curtime(),'%H%i%s') into v_wtdraw_time;


    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;
    #先更新订单表

    /* [更新表记录][交易证券_交易_订单表][{撤单数量}={撤单数量}+@撤单数量#,{订单冻结金额}={订单冻结金额}+@订单冻结金额#, {订单冻结数量}={订单冻结数量}+@订单冻结数量#, {订单状态}=@订单状态#][{记录序号} = @订单序号#][2][@订单序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, wtdraw_qty=wtdraw_qty+v_wtdraw_qty,order_frozen_amt=order_frozen_amt+v_order_frozen_amt, order_frozen_qty=order_frozen_qty+v_order_frozen_qty, order_status=v_order_status where row_id = v_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.21.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;

    #再处理撤单表

    /* set @申报日期# = 0; */
    set v_report_date = 0;

    /* set @申报时间# = 0; */
    set v_report_time = 0;

    /* [插入表记录][交易证券_交易_撤单表][字段][字段变量][1][@订单序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsetd_cancel(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, co_no, pd_no, 
        exch_group_no, asset_acco_no, pass_no, out_acco, 
        exch_crncy_type, exch_no, stock_acco_no, stock_acco, 
        stock_code_no, stock_code, external_no, wtdraw_batch_no, 
        wtdraw_date, wtdraw_time, order_date, order_id, 
        report_date, report_time, report_no, wtdraw_status, 
        wtdraw_qty, wtdraw_remark, order_price, trade_acco) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_exch_crncy_type, v_exch_no, v_stock_acco_no, v_stock_acco, 
        v_stock_code_no, v_stock_code, v_external_no, v_wtdraw_batch_no, 
        v_wtdraw_date, v_wtdraw_time, v_order_date, v_order_id, 
        v_report_date, v_report_time, v_report_no, v_wtdraw_status, 
        v_wtdraw_qty, v_wtdraw_remark, v_order_price, v_trade_acco);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.21.1";
        SET v_error_info =  CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@撤单序号#] */
    select LAST_INSERT_ID() into v_wtdraw_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_wtdraw_id = v_wtdraw_id;
    SET p_wtdraw_date = v_wtdraw_date;
    SET p_wtdraw_time = v_wtdraw_time;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_更新报盘撤单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_UpdateRptCancelOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_UpdateRptCancelOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_init_date = p_init_date;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新多行表记录][交易证券_交易_撤单表][{撤单状态} =《撤单状态-已报》][{撤单状态} = 《撤单状态-未报》 and {订单日期} = @初始化日期#][@指定行数#][2][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_cancel set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1,  wtdraw_status ="2" where wtdraw_status = "1" and order_date = v_init_date limit v_row_count;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.22.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询报盘撤单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryRptCancelOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryRptCancelOrder(
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
    declare v_mach_time int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_mach_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;

    #交易时间配置表 机构有设的取机构，没有的取默认系统级的，即 0

    /* if  @指定行数#  = -1  then */
    if  v_row_count  = -1  then

    /* select t1.*  from (select  a.{交易组编号} ,a.{资产账户编号} ,a.{通道编号} ,a.{外部账号} ,a.{市场编号} ,a.{证券代码} ,a.{记录序号} as {撤单序号} ,a.{外部编号} ,a.{订单序号} ,a.{申报编号} ,a.{撤单状态},a.{订单价格},a.{交易账户},a.{初始化日期},a.{股东代码},a.{撤单日期},a.{撤单时间},a.{订单日期},a.{撤单数量},ifnull(b.{机构编号},0) as default_co_no from ~交易证券_交易_撤单表^ a left join ~交易证券_交易_交易时间配置表^ b on a.{机构编号} = b.{机构编号} and a.{市场编号} = b.{市场编号} where a.{订单日期} = @初始化日期# and a.{撤单状态} in (《撤单状态-未报》, 《撤单状态-已报》) and (@通道编号# = 0 or a.{通道编号}=@通道编号#)  and a.{记录序号} > @记录序号# order by a.{记录序号}) as t1,~交易证券_交易_交易时间配置表^ t2 where t1.default_co_no = t2.{机构编号} and t1.{市场编号} = t2.{市场编号} and ((@机器时间# between t2.{上午交易开始时间} and t2.{上午交易结束时间}) or (@机器时间# between t2.{下午交易开始时间} and t2.{下午交易结束时间})); */
    select t1.*  from (select  a.exch_group_no ,a.asset_acco_no ,a.pass_no ,a.out_acco ,a.exch_no ,a.stock_code ,a.row_id as wtdraw_id ,a.external_no ,a.order_id ,a.report_no ,a.wtdraw_status,a.order_price,a.trade_acco,a.init_date,a.stock_acco,a.wtdraw_date,a.wtdraw_time,a.order_date,a.wtdraw_qty,ifnull(b.co_no,0) as default_co_no from db_tdsecu.tb_tdsetd_cancel a left join db_tdsecu.tb_tdsetd_trdtimeconfig b on a.co_no = b.co_no and a.exch_no = b.exch_no where a.order_date = v_init_date and a.wtdraw_status in ("1", "2") and (v_pass_no = 0 or a.pass_no=v_pass_no)  and a.row_id > v_row_id order by a.row_id) as t1,db_tdsecu.tb_tdsetd_trdtimeconfig t2 where t1.default_co_no = t2.co_no and t1.exch_no = t2.exch_no and ((v_mach_time between t2.am_trd_begin_time and t2.am_trd_end_time) or (v_mach_time between t2.pm_trd_begin_time and t2.pm_trd_end_time));
    else

    /* select t1.*  from (select  a.{交易组编号} ,a.{资产账户编号} ,a.{通道编号} ,a.{外部账号} ,a.{市场编号} ,a.{证券代码} ,a.{记录序号} as {撤单序号} ,a.{外部编号} ,a.{订单序号} ,a.{申报编号} ,a.{撤单状态},a.{订单价格},a.{交易账户},a.{初始化日期},a.{股东代码},a.{撤单日期},a.{撤单时间},a.{订单日期},a.{撤单数量},ifnull(b.{机构编号},0) as default_co_no from ~交易证券_交易_撤单表^ a left join ~交易证券_交易_交易时间配置表^ b on a.{机构编号} = b.{机构编号} and a.{市场编号} = b.{市场编号} where a.{订单日期} = @初始化日期# and a.{撤单状态} in (《撤单状态-未报》, 《撤单状态-已报》) and (@通道编号# = 0 or a.{通道编号}=@通道编号#)  and a.{记录序号} > @记录序号# order by a.{记录序号}) as t1,~交易证券_交易_交易时间配置表^ t2 where t1.default_co_no = t2.{机构编号} and t1.{市场编号} = t2.{市场编号} and ((@机器时间# between t2.{上午交易开始时间} and t2.{上午交易结束时间}) or (@机器时间# between t2.{下午交易开始时间} and t2.{下午交易结束时间})) limit @指定行数#; */
    select t1.*  from (select  a.exch_group_no ,a.asset_acco_no ,a.pass_no ,a.out_acco ,a.exch_no ,a.stock_code ,a.row_id as wtdraw_id ,a.external_no ,a.order_id ,a.report_no ,a.wtdraw_status,a.order_price,a.trade_acco,a.init_date,a.stock_acco,a.wtdraw_date,a.wtdraw_time,a.order_date,a.wtdraw_qty,ifnull(b.co_no,0) as default_co_no from db_tdsecu.tb_tdsetd_cancel a left join db_tdsecu.tb_tdsetd_trdtimeconfig b on a.co_no = b.co_no and a.exch_no = b.exch_no where a.order_date = v_init_date and a.wtdraw_status in ("1", "2") and (v_pass_no = 0 or a.pass_no=v_pass_no)  and a.row_id > v_row_id order by a.row_id) as t1,db_tdsecu.tb_tdsetd_trdtimeconfig t2 where t1.default_co_no = t2.co_no and t1.exch_no = t2.exch_no and ((v_mach_time between t2.am_trd_begin_time and t2.am_trd_end_time) or (v_mach_time between t2.pm_trd_begin_time and t2.pm_trd_end_time)) limit v_row_count;
    end if;
    #[获取表记录][交易证券_交易_撤单表][{交易组编号} ,{资产账户编号} ,{通道编号} ,{外部账号} ,{市场编号} ,{证券代码} ,{记录序号} as {撤单序号} ,{外部编号} ,{订单序号} ,{申报编号} ,{撤单状态},{订单价格},{交易账户},{初始化日期},{股东代码},{撤单日期},{撤单时间},{订单日期},{撤单数量}][{初始化日期} = @初始化日期# and {撤单状态} in( 《撤单状态-未报》,《撤单状态-已报》)  and (@通道编号# = 0 or {通道编号}=@通道编号#) and {记录序号} > @记录序号# order by {撤单序号}][@指定行数#]
    #[获取表记录][交易证券_交易_撤单表][{交易组编号} ,{资产账户编号} ,{通道编号} ,{外部账号} ,{市场编号} ,{证券代码} ,{记录序号} as {撤单序号} ,{外部编号} ,{订单序号} ,{申报编号} ,{撤单状态},{订单价格},{交易账户},{初始化日期},{股东代码},{撤单日期},{撤单时间},{订单日期},{撤单数量}][{初始化日期} = @初始化日期# and {撤单状态} in( 《撤单状态-未报》,《撤单状态-已报》)  and (@通道编号# = 0 or {通道编号}=@通道编号#) and ((@交易时间标志#=1 and {市场编号}=《市场编号-上海证券交易所》) or (@临时_交易时间标志#=1 and {市场编号}=《市场编号-深圳证券交易所》) or (@港股交易时间标志#=1 and {市场编号}=《市场编号-沪港通证券交易所》) or (@临时_港股交易时间标志#=1 and {市场编号}=《市场编号-深港通证券交易所》) or {市场编号}=《市场编号-场外交易市场》) and {记录序号} > @记录序号# order by {撤单序号}][@指定行数#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_检查证券申购重复
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_CheckPurcDup;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_CheckPurcDup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
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
    declare v_init_date int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
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
    SET v_init_date = p_init_date;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [记录已存在][交易证券_交易_订单表][@记录个数#][{订单日期} = @初始化日期# and ({订单状态}  in (《订单状态-未报》,《订单状态-待报》,《订单状态-正报》,《订单状态-已报》)) and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# ][613][@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    select count(1) into v_record_count from db_tdsecu.tb_tdsetd_order where order_date = v_init_date and (order_status  in ("1","a","b","2")) and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no  limit 1;
    if v_record_count > 0 then
                
        SET v_error_code = "tdsecuA.4.24.613";
        SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_锁定获取订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_LockGetOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_LockGetOrder(
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
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_target_code_no int,
    OUT p_trade_code_no int,
    OUT p_asset_type int,
    OUT p_stock_type int,
    OUT p_comm_opor int,
    OUT p_external_no bigint,
    OUT p_comm_id bigint,
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_batch_no int,
    OUT p_order_time int,
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
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_net_price_flag int,
    OUT p_impawn_ratio decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_rsp_info varchar(255),
    OUT p_compli_trig_id bigint,
    OUT p_remark_info varchar(255),
    OUT p_order_oper_way varchar(2),
    OUT p_exter_comm_flag int,
    OUT p_busi_opor_no int,
    OUT p_combo_code varchar(32),
    OUT p_target_stock_code_no int,
    OUT p_trade_acco varchar(32)
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_batch_no int;
    declare v_order_time int;
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
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_exch_crncy_type varchar(3);
    declare v_comm_batch_no int;
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_intrst_days int;
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_cost_calc_type int;
    declare v_record_valid_flag int;
    declare v_combo_posi_id bigint;
    declare v_strategy_id bigint;
    declare v_sett_flag int;
    declare v_target_stock_code varchar(6);
    declare v_registration_agency varchar(32);
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
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_asset_type = 0;
    SET v_stock_type = 0;
    SET v_comm_opor = 0;
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_batch_no = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_crncy_type = "CNY";
    SET v_comm_batch_no = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_intrst_days = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_cost_calc_type = 0;
    SET v_record_valid_flag = 0;
    SET v_combo_posi_id = 0;
    SET v_strategy_id = 0;
    SET v_sett_flag = 0;
    SET v_target_stock_code = " ";
    SET v_registration_agency = " ";
    SET v_contra_no = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][交易证券_交易_订单表][字段][字段变量][{记录序号} = @订单序号#][4][@订单序号#] */
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
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where row_id = v_order_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.25.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_target_code_no = v_target_code_no;
    SET p_trade_code_no = v_trade_code_no;
    SET p_asset_type = v_asset_type;
    SET p_stock_type = v_stock_type;
    SET p_comm_opor = v_comm_opor;
    SET p_external_no = v_external_no;
    SET p_comm_id = v_comm_id;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_time = v_order_time;
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
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_net_price_flag = v_net_price_flag;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_rsp_info = v_rsp_info;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_remark_info = v_remark_info;
    SET p_order_oper_way = v_order_oper_way;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_combo_code = v_combo_code;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_trade_acco = v_trade_acco;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_检查锁定获取改单订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_CheckLockGetModiOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_CheckLockGetModiOrderInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_id bigint,
    IN p_modi_order_price decimal(16,9),
    IN p_modi_order_qty decimal(18,2),
    IN p_modi_price_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_asset_type int,
    OUT p_stock_type int,
    OUT p_comm_opor int,
    OUT p_external_no bigint,
    OUT p_comm_id bigint,
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_batch_no int,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_dir int,
    OUT p_price_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_net_price_flag int,
    OUT p_par_value decimal(16,9),
    OUT p_intrst_days int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_impawn_ratio decimal(18,12),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_all_fee decimal(18,4),
    OUT p_order_oper_way varchar(2),
    OUT p_exter_comm_flag int,
    OUT p_busi_opor_no int,
    OUT p_update_times int,
    OUT p_combo_code varchar(32),
    OUT p_target_stock_code_no int,
    OUT p_trade_acco varchar(32)
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
    declare v_modi_order_price decimal(16,9);
    declare v_modi_order_qty decimal(18,2);
    declare v_modi_price_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_comm_opor int;
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_batch_no int;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_busi_opor_no int;
    declare v_update_times int;
    declare v_combo_code varchar(32);
    declare v_target_stock_code_no int;
    declare v_trade_acco varchar(32);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_func_code varchar(16);
    declare v_exch_crncy_type varchar(3);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_comm_batch_no int;
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
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_cost_calc_type int;
    declare v_record_valid_flag int;
    declare v_combo_posi_id bigint;
    declare v_strategy_id bigint;
    declare v_sett_flag int;
    declare v_target_stock_code varchar(6);
    declare v_registration_agency varchar(32);
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
    SET v_order_id = p_order_id;
    SET v_modi_order_price = p_modi_order_price;
    SET v_modi_order_qty = p_modi_order_qty;
    SET v_modi_price_type = p_modi_price_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_asset_type = 0;
    SET v_stock_type = 0;
    SET v_comm_opor = 0;
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_batch_no = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_all_fee = 0;
    SET v_order_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_busi_opor_no = 0;
    SET v_update_times = 1;
    SET v_combo_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_trade_acco = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_comm_batch_no = 0;
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
    SET v_strike_bond_accr_intrst = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_cost_calc_type = 0;
    SET v_record_valid_flag = 0;
    SET v_combo_posi_id = 0;
    SET v_strategy_id = 0;
    SET v_sett_flag = 0;
    SET v_target_stock_code = " ";
    SET v_registration_agency = " ";
    SET v_contra_no = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][交易证券_交易_订单表][字段][字段变量][{记录序号} = @订单序号#][4][@订单序号#] */
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
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where row_id = v_order_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.26.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][(@改单价格类型# = 《价格类型-限价》  or @改单价格类型# = 《价格类型-限价盘》 or @改单价格类型# = 《价格类型-增强限价盘》 or @改单价格类型# = 《价格类型-竞价限价盘》)and (@改单价格# <=(0))][756][@改单价格类型#,@改单价格#] */
    if (v_modi_price_type = 1  or v_modi_price_type = 8 or v_modi_price_type = 9 or v_modi_price_type = 10)and (v_modi_order_price <=(0)) then
        
        SET v_error_code = "tdsecuA.4.26.756";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("改单价格类型=",v_modi_price_type,",","改单价格=",v_modi_order_price),"#",v_mysql_message);
        else
            SET v_error_info = concat("改单价格类型=",v_modi_price_type,",","改单价格=",v_modi_order_price);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@改单数量# <= @成交数量# ][757][@改单数量#,@成交数量#] */
    if v_modi_order_qty <= v_strike_qty  then
        
        SET v_error_code = "tdsecuA.4.26.757";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("改单数量=",v_modi_order_qty,",","成交数量=",v_strike_qty),"#",v_mysql_message);
        else
            SET v_error_info = concat("改单数量=",v_modi_order_qty,",","成交数量=",v_strike_qty);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@改单价格类型# <> 《价格类型-限价》 and @改单价格类型# <> 《价格类型-限价盘》 and @改单价格类型# <> 《价格类型-增强限价盘》 and @改单价格类型# <> 《价格类型-竞价限价盘》 and @改单价格类型# <> 《价格类型-盘后固定价格》 and @订单方向# <> 《订单方向-买入》 and @订单方向# <> 《订单方向-卖出》 and @订单方向# <> 《订单方向-零股卖出》][758][@订单方向#,@价格类型#] */
    if v_modi_price_type <> 1 and v_modi_price_type <> 8 and v_modi_price_type <> 9 and v_modi_price_type <> 10 and v_modi_price_type <> 12 and v_order_dir <> 1 and v_order_dir <> 2 and v_order_dir <> 31 then
        
        SET v_error_code = "tdsecuA.4.26.758";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单方向=",v_order_dir,",","价格类型=",v_price_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单方向=",v_order_dir,",","价格类型=",v_price_type);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@订单状态# <> 《订单状态-未报》 and @订单状态# <> 《订单状态-已报》  and @订单状态# <> 《订单状态-部成》 ][717][@订单状态#] */
    if v_order_status <> "1" and v_order_status <> "2"  and v_order_status <> "5"  then
        
        SET v_error_code = "tdsecuA.4.26.717";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单状态=",v_order_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单状态=",v_order_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@订单状态# <> 《订单状态-未报》 and (@证券类型# = 《证券类型-申购》 or @订单方向# =《订单方向-新股申购》 or @订单方向# =《订单方向-配售申购》)][718][@订单状态#,@订单方向#] */
    if v_order_status <> "1" and (v_stock_type = 2 or v_order_dir =11 or v_order_dir =23) then
        
        SET v_error_code = "tdsecuA.4.26.718";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单状态=",v_order_status,",","订单方向=",v_order_dir),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单状态=",v_order_status,",","订单方向=",v_order_dir);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@订单状态# <> 《订单状态-未报》 and (@订单方向# = 《订单方向-质押提交》 or @订单方向# = 《订单方向-质押转回》)][718][@订单状态#,@订单方向#] */
    if v_order_status <> "1" and (v_order_dir = 21 or v_order_dir = 22) then
        
        SET v_error_code = "tdsecuA.4.26.718";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单状态=",v_order_status,",","订单方向=",v_order_dir),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单状态=",v_order_status,",","订单方向=",v_order_dir);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
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
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_asset_type = v_asset_type;
    SET p_stock_type = v_stock_type;
    SET p_comm_opor = v_comm_opor;
    SET p_external_no = v_external_no;
    SET p_comm_id = v_comm_id;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_dir = v_order_dir;
    SET p_price_type = v_price_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_status = v_order_status;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_net_price_flag = v_net_price_flag;
    SET p_par_value = v_par_value;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_all_fee = v_all_fee;
    SET p_order_oper_way = v_order_oper_way;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_update_times = v_update_times;
    SET p_combo_code = v_combo_code;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_trade_acco = v_trade_acco;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_新增改单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_AddModiOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_AddModiOrder(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_modi_order_date int,
    IN p_modi_batch_no int,
    IN p_order_id bigint,
    IN p_comm_id bigint,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_order_dir int,
    IN p_order_date int,
    IN p_order_time int,
    IN p_price_type int,
    IN p_modi_order_status varchar(2),
    IN p_modi_order_price decimal(16,9),
    IN p_modi_order_qty decimal(18,2),
    IN p_modi_price_type int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_order_oper_way varchar(2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_modi_order_id bigint
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_modi_order_date int;
    declare v_modi_batch_no int;
    declare v_order_id bigint;
    declare v_comm_id bigint;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_dir int;
    declare v_order_date int;
    declare v_order_time int;
    declare v_price_type int;
    declare v_modi_order_status varchar(2);
    declare v_modi_order_price decimal(16,9);
    declare v_modi_order_qty decimal(18,2);
    declare v_modi_price_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_order_oper_way varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_modi_order_id bigint;
    declare v_modi_order_time int;
    declare v_oper_func_code varchar(16);
    declare v_new_order_id bigint;
    declare v_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_modi_order_date = p_modi_order_date;
    SET v_modi_batch_no = p_modi_batch_no;
    SET v_order_id = p_order_id;
    SET v_comm_id = p_comm_id;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_order_dir = p_order_dir;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_price_type = p_price_type;
    SET v_modi_order_status = p_modi_order_status;
    SET v_modi_order_price = p_modi_order_price;
    SET v_modi_order_qty = p_modi_order_qty;
    SET v_modi_price_type = p_modi_price_type;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_order_oper_way = p_order_oper_way;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_modi_order_id = 0;
    SET v_modi_order_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_new_order_id = 0;
    SET v_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取机器时间][@改单时间#] */
    select date_format(curtime(),'%H%i%s') into v_modi_order_time;


    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @新订单序号# = 0; */
    set v_new_order_id = 0;

    /* set @备注信息# = "新增改单！"; */
    set v_remark_info = "新增改单！";

    /* [插入表记录][交易证券_交易_改单表][字段][字段变量][1]["新增证券改单记录失败"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsetd_modifyorder(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, co_no, pd_no, 
        exch_group_no, asset_acco_no, pass_no, exch_no, 
        stock_acco_no, stock_code_no, stock_code, stock_type, 
        asset_type, modi_order_date, modi_order_time, modi_batch_no, 
        order_id, comm_id, order_price, order_qty, 
        order_dir, order_date, order_time, price_type, 
        modi_order_price, modi_order_qty, modi_order_status, modi_price_type, 
        crncy_type, exch_crncy_type, new_order_id, remark_info, 
        order_oper_way) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_pass_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_code, v_stock_type, 
        v_asset_type, v_modi_order_date, v_modi_order_time, v_modi_batch_no, 
        v_order_id, v_comm_id, v_order_price, v_order_qty, 
        v_order_dir, v_order_date, v_order_time, v_price_type, 
        v_modi_order_price, v_modi_order_qty, v_modi_order_status, v_modi_price_type, 
        v_crncy_type, v_exch_crncy_type, v_new_order_id, v_remark_info, 
        v_order_oper_way);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.27.1";
        SET v_error_info =  CONCAT("新增证券改单记录失败","#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@改单序号#] */
    select LAST_INSERT_ID() into v_modi_order_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_modi_order_id = v_modi_order_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_新增篮子订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_AddBasketOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_AddBasketOrder(
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
    declare v_order_time int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取机器时间][@订单时间#] */
    select date_format(curtime(),'%H%i%s') into v_order_time;


    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][交易证券_交易_篮子订单表][字段][字段变量][1][@订单批号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsetd_basketorder(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, co_no, pd_no, 
        exch_group_no, asset_acco_no, basket_id, order_date, 
        order_time, order_batch_no, order_dir, basket_trade_type, 
        basket_trade_amt) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_basket_id, v_order_date, 
        v_order_time, v_order_batch_no, v_order_dir, v_basket_trade_type, 
        v_basket_trade_amt);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.28.1";
        SET v_error_info =  CONCAT(concat("订单批号=",v_order_batch_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@订单序号#] */
    select LAST_INSERT_ID() into v_order_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_id = v_order_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_获取预埋订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_GetPreOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_GetPreOrder(
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
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_pre_price_type int;
    declare v_price_offset decimal(16,9);
    declare v_pre_begin_date int;
    declare v_pre_end_date int;
    declare v_pre_begin_time int;
    declare v_pre_end_time int;
    declare v_trig_date int;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_id bigint;
    declare v_is_trace int;
    declare v_price_up decimal(16,9);
    declare v_order_no_str varchar(2048);
    declare v_keep_trace int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_pre_price_type = 0;
    SET v_price_offset = 0;
    SET v_pre_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_pre_end_date = date_format(curdate(),'%Y%m%d');
    SET v_pre_begin_time = date_format(curtime(),'%H%i%s');
    SET v_pre_end_time = date_format(curtime(),'%H%i%s');
    SET v_trig_date = date_format(curdate(),'%Y%m%d');
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_id = 0;
    SET v_is_trace = 0;
    SET v_price_up = 0;
    SET v_order_no_str = " ";
    SET v_keep_trace = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易证券_交易_预埋订单表][字段][字段变量][{记录序号} = @预埋订单序号#][4][@预埋订单序号#] */
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
        v_order_no_str, v_keep_trace from db_tdsecu.tb_tdsetd_preorder where row_id = v_pre_order_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.29.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("预埋订单序号=",v_pre_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("预埋订单序号=",v_pre_order_id);
        end if;
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

# 原子_交易证券_交易_新增预埋订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_AddPreOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_AddPreOrder(
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
    declare v_oper_func_code varchar(16);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_oper_func_code = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @预埋订单日期# = @初始化日期#; */
    set v_pre_order_date = v_init_date;

    /* [获取机器时间][@预埋订单时间#] */
    select date_format(curtime(),'%H%i%s') into v_pre_order_time;


    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @预埋订单状态# = 《预埋订单状态-未执行》; */
    set v_pre_order_status = "1";

    /* set @订单日期# = 0; */
    set v_order_date = 0;

    /* set @订单时间# = 0; */
    set v_order_time = 0;

    /* set @订单序号# = 0; */
    set v_order_id = 0;

    /* [插入表记录][交易证券_交易_预埋订单表][字段][字段变量][1][@市场编号#,@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsetd_preorder(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
        stock_acco_no, stock_acco, stock_code_no, stock_code, 
        stock_type, pre_order_date, pre_order_time, pre_order_dir, 
        pre_order_type, pre_order_price, pre_order_qty, pre_order_status, 
        pre_price_type, price_offset, pre_begin_date, pre_end_date, 
        pre_begin_time, pre_end_time, trig_type, trig_price, 
        trig_date, trig_time, order_date, order_time, 
        order_id, is_trace, price_up, order_no_str, 
        keep_trace) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
        v_stock_acco_no, v_stock_acco, v_stock_code_no, v_stock_code, 
        v_stock_type, v_pre_order_date, v_pre_order_time, v_pre_order_dir, 
        v_pre_order_type, v_pre_order_price, v_pre_order_qty, v_pre_order_status, 
        v_pre_price_type, v_price_offset, v_pre_begin_date, v_pre_end_date, 
        v_pre_begin_time, v_pre_end_time, v_trig_type, v_trig_price, 
        v_trig_date, v_trig_time, v_order_date, v_order_time, 
        v_order_id, v_is_trace, v_price_up, v_order_no_str, 
        v_keep_trace);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.30.1";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@预埋订单序号#] */
    select LAST_INSERT_ID() into v_pre_order_id;

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

# 原子_交易证券_交易_修改预埋订单状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_ModiPreOrderStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_ModiPreOrderStatus(
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
    SET v_pre_order_id = p_pre_order_id;
    SET v_order_id = p_order_id;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_pre_order_status = p_pre_order_status;
    SET v_order_no_str = p_order_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_交易_预埋订单表][{订单序号} = @订单序号#, {订单日期} = @订单日期#, {订单时间} = @订单时间#, {订单编号串} = @订单编号串#, {预埋订单状态} = @预埋订单状态#][{记录序号} = @预埋订单序号#][2][@预埋订单序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_preorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_id = v_order_id, order_date = v_order_date, order_time = v_order_time, order_no_str = v_order_no_str, pre_order_status = v_pre_order_status where row_id = v_pre_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.31.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("预埋订单序号=",v_pre_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("预埋订单序号=",v_pre_order_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_检查重复改单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_CheckDupliModiOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_CheckDupliModiOrder(
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_modi_order_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_record_count = 0;
    SET v_modi_order_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [记录已存在][交易证券_交易_改单表][@记录个数#][{改单日期} = @改单日期# and {订单序号} = @订单序号# and {改单状态} =《改单状态-新建》][723][@改单日期#,@订单序号#] */
    select count(1) into v_record_count from db_tdsecu.tb_tdsetd_modifyorder where modi_order_date = v_modi_order_date and order_id = v_order_id and modi_order_status ="1" limit 1;
    if v_record_count > 0 then
                
        SET v_error_code = "tdsecuA.4.32.723";
        SET v_error_info = concat("改单日期=",v_modi_order_date,",","订单序号=",v_order_id);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_订单处理汇总订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_OrderDealSumOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_OrderDealSumOrder(
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
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_external_no bigint,
    IN p_order_date int,
    IN p_order_batch_no int,
    IN p_order_dir int,
    IN p_price_type int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_order_status varchar(2),
    IN p_wtdraw_qty decimal(18,2),
    IN p_waste_qty decimal(18,2),
    IN p_net_price_flag int,
    IN p_intrst_days int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_impawn_ratio decimal(18,12),
    IN p_order_oper_way varchar(2),
    IN p_exter_comm_flag int,
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
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_external_no bigint;
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_waste_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_order_status varchar(2);
    declare v_order_sum_status varchar(2);
    declare v_tmp_pd_no int;
    declare v_tmp_exch_group_no int;
    declare v_tmp_asset_acco_no int;
    declare v_tmp_pass_no int;
    declare v_tmp_exter_comm_flag int;
    declare v_tmp_external_no bigint;
    declare v_tmp_stock_code varchar(6);
    declare v_tmp_stock_code_no int;
    declare v_tmp_order_dir int;
    declare v_tmp_order_price decimal(16,9);
    declare v_tmp_stock_type int;
    declare v_tmp_asset_type int;
    declare v_tmp_trade_code_no int;
    declare v_tmp_target_code_no int;
    declare v_tmp_exch_crncy_type varchar(3);
    declare v_tmp_exch_no int;
    declare v_tmp_net_price_flag int;
    declare v_tmp_intrst_days int;
    declare v_tmp_par_value decimal(16,9);
    declare v_tmp_bond_accr_intrst decimal(18,12);
    declare v_tmp_bond_rate_type int;
    declare v_tmp_impawn_ratio decimal(18,12);
    declare v_record_valid_flag int;
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_aver_price decimal(16,9);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_oper_func_code varchar(16);
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_external_no = p_external_no;
    SET v_order_date = p_order_date;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir = p_order_dir;
    SET v_price_type = p_price_type;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_order_status = p_order_status;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_waste_qty = p_waste_qty;
    SET v_net_price_flag = p_net_price_flag;
    SET v_intrst_days = p_intrst_days;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_order_oper_way = p_order_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_order_status = "0";
    SET v_order_sum_status = "0";
    SET v_tmp_pd_no = 0;
    SET v_tmp_exch_group_no = 0;
    SET v_tmp_asset_acco_no = 0;
    SET v_tmp_pass_no = 0;
    SET v_tmp_exter_comm_flag = 0;
    SET v_tmp_external_no = 0;
    SET v_tmp_stock_code = " ";
    SET v_tmp_stock_code_no = 0;
    SET v_tmp_order_dir = 0;
    SET v_tmp_order_price = 0;
    SET v_tmp_stock_type = 0;
    SET v_tmp_asset_type = 0;
    SET v_tmp_trade_code_no = 0;
    SET v_tmp_target_code_no = 0;
    SET v_tmp_exch_crncy_type = "CNY";
    SET v_tmp_exch_no = 0;
    SET v_tmp_net_price_flag = 0;
    SET v_tmp_intrst_days = 0;
    SET v_tmp_par_value = 0;
    SET v_tmp_bond_accr_intrst = 0;
    SET v_tmp_bond_rate_type = 0;
    SET v_tmp_impawn_ratio = 0;
    SET v_record_valid_flag = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_aver_price = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_oper_func_code = " ";
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [检查正常返回][@订单批号# <=0] */
    if v_order_batch_no <=0 then
        leave label_pro;
    end if;


    /* set @临时_订单状态# = @订单状态#; */
    set v_tmp_order_status = v_order_status;

    /* set @订单汇总状态# = 《订单汇总状态-未成》; */
    set v_order_sum_status = "1";

    /* set @临时_产品编号# = @产品编号#; */
    set v_tmp_pd_no = v_pd_no;

    /* set @临时_交易组编号# = @交易组编号#; */
    set v_tmp_exch_group_no = v_exch_group_no;

    /* set @临时_资产账户编号# = @资产账户编号#; */
    set v_tmp_asset_acco_no = v_asset_acco_no;

    /* set @临时_通道编号# = @通道编号#; */
    set v_tmp_pass_no = v_pass_no;

    /* set @临时_体外指令标志# = @体外指令标志#; */
    set v_tmp_exter_comm_flag = v_exter_comm_flag;

    /* set @临时_外部编号# = @外部编号#; */
    set v_tmp_external_no = v_external_no;

    /* set @临时_证券代码# = @证券代码#; */
    set v_tmp_stock_code = v_stock_code;

    /* set @临时_证券代码编号# = @证券代码编号#; */
    set v_tmp_stock_code_no = v_stock_code_no;

    /* set @临时_订单方向# = @订单方向#; */
    set v_tmp_order_dir = v_order_dir;

    /* set @临时_订单价格# = @订单价格#; */
    set v_tmp_order_price = v_order_price;

    /* set @临时_证券类型# = @证券类型#; */
    set v_tmp_stock_type = v_stock_type;

    /* set @临时_资产类型# = @资产类型#; */
    set v_tmp_asset_type = v_asset_type;

    /* set @临时_交易代码编号# = @交易代码编号#; */
    set v_tmp_trade_code_no = v_trade_code_no;

    /* set @临时_标的代码编号# = @标的代码编号#; */
    set v_tmp_target_code_no = v_target_code_no;

    /* set @临时_交易币种# = @交易币种#; */
    set v_tmp_exch_crncy_type = v_exch_crncy_type;

    /* set @临时_市场编号# = @市场编号#; */
    set v_tmp_exch_no = v_exch_no;

    /* set @临时_净价标志# = @净价标志#; */
    set v_tmp_net_price_flag = v_net_price_flag;

    /* set @临时_计息天数# = @计息天数#; */
    set v_tmp_intrst_days = v_intrst_days;

    /* set @临时_票面面值# = @票面面值#; */
    set v_tmp_par_value = v_par_value;

    /* set @临时_债券计提利息# = @债券计提利息#; */
    set v_tmp_bond_accr_intrst = v_bond_accr_intrst;

    /* set @临时_债券利率类型# = @债券利率类型#; */
    set v_tmp_bond_rate_type = v_bond_rate_type;

    /* set @临时_质押比例# = @质押比例#; */
    set v_tmp_impawn_ratio = v_impawn_ratio;

    /* set @记录有效标志# =《记录有效标志-有效》; */
    set v_record_valid_flag =1;

    /* set @成交金额# = 0; */
    set v_strike_amt = 0;

    /* set @成交数量# = 0; */
    set v_strike_qty = 0;

    /* set @成交均价# = 0; */
    set v_strike_aver_price = 0;

    /* set @成交债券计提利息# = 0; */
    set v_strike_bond_accr_intrst = 0;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @全部费用# = 0; */
    set v_all_fee = 0;

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

    /* set @交易佣金# = 0; */
    set v_trade_commis = 0;

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

    /* [插入重复更新][交易证券_交易_订单汇总表][字段][字段变量][{订单价格}=Round(({订单价格}*{订单数量} + @订单价格# * @订单数量#)/({订单数量}+@订单数量#),3),{订单数量}={订单数量}+@订单数量#, {撤单数量}={撤单数量}+@撤单数量#,{废单数量}={废单数量}+@废单数量#][1][@订单日期#, @机构编号#, @订单批号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsetd_sumorder (
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, co_no, pd_no, 
        exch_group_no, asset_acco_no, pass_no, exch_crncy_type, 
        exch_no, stock_code_no, stock_code, trade_code_no, 
        target_code_no, stock_type, asset_type, external_no, 
        order_date, order_batch_no, order_dir, price_type, 
        order_price, order_qty, order_sum_status, wtdraw_qty, 
        waste_qty, strike_amt, strike_qty, strike_aver_price, 
        all_fee, stamp_tax, trans_fee, brkage_fee, 
        SEC_charges, other_fee, trade_commis, other_commis, 
        trade_tax, trade_cost_fee, trade_system_use_fee, stock_settle_fee, 
        net_price_flag, intrst_days, par_value, bond_accr_intrst, 
        bond_rate_type, impawn_ratio, strike_bond_accr_intrst, order_oper_way, 
        exter_comm_flag, record_valid_flag) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_pass_no, v_exch_crncy_type, 
        v_exch_no, v_stock_code_no, v_stock_code, v_trade_code_no, 
        v_target_code_no, v_stock_type, v_asset_type, v_external_no, 
        v_order_date, v_order_batch_no, v_order_dir, v_price_type, 
        v_order_price, v_order_qty, v_order_sum_status, v_wtdraw_qty, 
        v_waste_qty, v_strike_amt, v_strike_qty, v_strike_aver_price, 
        v_all_fee, v_stamp_tax, v_trans_fee, v_brkage_fee, 
        v_SEC_charges, v_other_fee, v_trade_commis, v_other_commis, 
        v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, v_stock_settle_fee, 
        v_net_price_flag, v_intrst_days, v_par_value, v_bond_accr_intrst, 
        v_bond_rate_type, v_impawn_ratio, v_strike_bond_accr_intrst, v_order_oper_way, 
        v_exter_comm_flag, v_record_valid_flag) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, order_price=Round((order_price*order_qty + v_order_price * v_order_qty)/(order_qty+v_order_qty),3),order_qty=order_qty+v_order_qty, wtdraw_qty=wtdraw_qty+v_wtdraw_qty,waste_qty=waste_qty+v_waste_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.33.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][交易证券_交易_订单汇总表][{记录序号}][@记录序号#][{订单日期}=@订单日期# and {机构编号} = @机构编号# and {订单批号}= @订单批号#][4][@订单日期#, @机构编号#, @订单批号#] */
    select row_id into v_row_id from db_tdsecu.tb_tdsetd_sumorder where order_date=v_order_date and co_no = v_co_no and order_batch_no= v_order_batch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.33.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no);
        end if;
        leave label_pro;
    end if;


    /* [锁定获取表记录变量][交易证券_交易_订单汇总表][字段][字段变量][{记录序号}=@记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_crncy_type, exch_no, stock_code_no, stock_code, 
        trade_code_no, target_code_no, stock_type, asset_type, 
        external_no, order_date, order_batch_no, order_dir, 
        price_type, order_price, order_qty, order_sum_status, 
        wtdraw_qty, waste_qty, strike_amt, strike_qty, 
        strike_aver_price, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, strike_bond_accr_intrst, 
        order_oper_way, exter_comm_flag, record_valid_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_exch_crncy_type, v_exch_no, v_stock_code_no, v_stock_code, 
        v_trade_code_no, v_target_code_no, v_stock_type, v_asset_type, 
        v_external_no, v_order_date, v_order_batch_no, v_order_dir, 
        v_price_type, v_order_price, v_order_qty, v_order_sum_status, 
        v_wtdraw_qty, v_waste_qty, v_strike_amt, v_strike_qty, 
        v_strike_aver_price, v_all_fee, v_stamp_tax, v_trans_fee, 
        v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
        v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
        v_stock_settle_fee, v_net_price_flag, v_intrst_days, v_par_value, 
        v_bond_accr_intrst, v_bond_rate_type, v_impawn_ratio, v_strike_bond_accr_intrst, 
        v_order_oper_way, v_exter_comm_flag, v_record_valid_flag from db_tdsecu.tb_tdsetd_sumorder where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.33.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* if @临时_产品编号# <> @产品编号# then */
    if v_tmp_pd_no <> v_pd_no then

      /* set @产品编号# = 0; */
      set v_pd_no = 0;
    end if;

    /* if @临时_交易组编号# <> @交易组编号# then */
    if v_tmp_exch_group_no <> v_exch_group_no then

        /* set @交易组编号# = 0; */
        set v_exch_group_no = 0;
    end if;

    /* if @临时_资产账户编号# <> @资产账户编号# then */
    if v_tmp_asset_acco_no <> v_asset_acco_no then

        /* set @资产账户编号# = 0; */
        set v_asset_acco_no = 0;
    end if;

    /* if @临时_通道编号# <> @通道编号# then */
    if v_tmp_pass_no <> v_pass_no then

        /* set @通道编号# = 0; */
        set v_pass_no = 0;
    end if;

    /* if @临时_体外指令标志# <> @体外指令标志# then */
    if v_tmp_exter_comm_flag <> v_exter_comm_flag then

        /* set @体外指令标志# = 0; */
        set v_exter_comm_flag = 0;
    end if;

    /* if @临时_外部编号# <> @外部编号# then */
    if v_tmp_external_no <> v_external_no then

        /* set @外部编号# = 0; */
        set v_external_no = 0;
    end if;

    /* if @临时_证券代码# <> @证券代码# then */
    if v_tmp_stock_code <> v_stock_code then

        /* set @证券代码# = " "; */
        set v_stock_code = " ";
    end if;

    /* if @临时_证券代码编号# <> @证券代码编号# then */
    if v_tmp_stock_code_no <> v_stock_code_no then

        /* set @证券代码编号#= 0; */
        set v_stock_code_no= 0;
    end if;

    /* if @临时_订单方向# <> @订单方向# then */
    if v_tmp_order_dir <> v_order_dir then

        /* set @订单方向# = 0; */
        set v_order_dir = 0;
    end if;

    /* if @临时_证券类型# <> @证券类型# then */
    if v_tmp_stock_type <> v_stock_type then

        /* set @证券类型# = 0; */
        set v_stock_type = 0;
    end if;

    /* if @临时_资产类型# <> @资产类型# then */
    if v_tmp_asset_type <> v_asset_type then

        /* set @资产类型# = 0; */
        set v_asset_type = 0;
    end if;

    /* if @临时_交易代码编号# <> @交易代码编号# then */
    if v_tmp_trade_code_no <> v_trade_code_no then

        /* set @交易代码编号# = 0; */
        set v_trade_code_no = 0;
    end if;

    /* if @临时_标的代码编号# <> @标的代码编号# then */
    if v_tmp_target_code_no <> v_target_code_no then

        /* set @标的代码编号# = 0; */
        set v_target_code_no = 0;
    end if;

    /* if @临时_交易币种# <> @交易币种# then */
    if v_tmp_exch_crncy_type <> v_exch_crncy_type then

        /* set @交易币种#= " "; */
        set v_exch_crncy_type= " ";
    end if;

    /* if @临时_市场编号# <> @市场编号# then */
    if v_tmp_exch_no <> v_exch_no then

        /* set @市场编号# = 0; */
        set v_exch_no = 0;
    end if;

    /* if @临时_净价标志# <> @净价标志# then */
    if v_tmp_net_price_flag <> v_net_price_flag then

        /* set @净价标志# = 0; */
        set v_net_price_flag = 0;
    end if;

    /* if @临时_计息天数# <> @计息天数# then */
    if v_tmp_intrst_days <> v_intrst_days then

        /* set @计息天数# = 0; */
        set v_intrst_days = 0;
    end if;

    /* if @临时_票面面值# <> @票面面值# then */
    if v_tmp_par_value <> v_par_value then

        /* set @票面面值# = 0; */
        set v_par_value = 0;
    end if;

    /* if @临时_债券计提利息# <> @债券计提利息# then */
    if v_tmp_bond_accr_intrst <> v_bond_accr_intrst then

        /* set @债券计提利息# = 0; */
        set v_bond_accr_intrst = 0;
    end if;

    /* if @临时_债券利率类型# <> @债券利率类型# then */
    if v_tmp_bond_rate_type <> v_bond_rate_type then

        /* set @债券利率类型# = 0; */
        set v_bond_rate_type = 0;
    end if;

    /* if @临时_质押比例# <> @质押比例# then */
    if v_tmp_impawn_ratio <> v_impawn_ratio then

        /* set @质押比例# = 0; */
        set v_impawn_ratio = 0;
    end if;

    /* 调用【原子_交易证券_公用_计算订单汇总状态】*/
    call db_tdsecu.pra_tdsepb_CaclOrderSumStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_qty,
        v_wtdraw_qty,
        v_strike_qty,
        v_waste_qty,
        v_error_code,
        v_error_info,
        v_order_sum_status);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuA.4.33.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单汇总状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_交易_订单汇总表][{订单汇总状态}=@订单汇总状态#,{产品编号} = @产品编号#,{交易组编号} = @交易组编号#, {资产账户编号}=@资产账户编号#,{通道编号}=@通道编号#,{体外指令标志}=@体外指令标志#,{外部编号}=@外部编号#,{证券代码} = @证券代码#,{证券代码编号} =@证券代码编号#,{订单方向} = @订单方向#,{证券类型} = @证券类型#,{资产类型} = @资产类型#,{交易代码编号} = @交易代码编号#,{标的代码编号} = @标的代码编号#,{交易币种} = @交易币种#,{市场编号} = @市场编号#,{净价标志} = @净价标志#,{计息天数} = @计息天数#,{票面面值} = @票面面值#,{债券计提利息} = @债券计提利息#,{债券利率类型} = @债券利率类型#,{质押比例}  = @质押比例#][{记录序号}=@记录序号#][2][@订单日期#, @机构编号#,@订单批号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_sumorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_sum_status=v_order_sum_status,pd_no = v_pd_no,exch_group_no = v_exch_group_no, asset_acco_no=v_asset_acco_no,pass_no=v_pass_no,exter_comm_flag=v_exter_comm_flag,external_no=v_external_no,stock_code = v_stock_code,stock_code_no =v_stock_code_no,order_dir = v_order_dir,stock_type = v_stock_type,asset_type = v_asset_type,trade_code_no = v_trade_code_no,target_code_no = v_target_code_no,exch_crncy_type = v_exch_crncy_type,exch_no = v_exch_no,net_price_flag = v_net_price_flag,intrst_days = v_intrst_days,par_value = v_par_value,bond_accr_intrst = v_bond_accr_intrst,bond_rate_type = v_bond_rate_type,impawn_ratio  = v_impawn_ratio where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.33.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,",","订单批号=",v_order_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,",","订单批号=",v_order_batch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_撤单处理汇总订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_CancelDealSumOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_CancelDealSumOrder(
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
    IN p_order_date int,
    IN p_order_batch_no int,
    IN p_wtdraw_qty decimal(18,2),
    IN p_waste_qty decimal(18,2),
    IN p_order_oper_way varchar(2),
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
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_waste_qty decimal(18,2);
    declare v_order_oper_way varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_pd_no int;
    declare v_tmp_exch_group_no int;
    declare v_tmp_asset_acco_no int;
    declare v_tmp_pass_no int;
    declare v_tmp_wtdraw_qty decimal(18,2);
    declare v_tmp_waste_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_external_no bigint;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_sum_status varchar(2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_aver_price decimal(16,9);
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
    declare v_impawn_ratio decimal(18,12);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_order_date = p_order_date;
    SET v_order_batch_no = p_order_batch_no;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_waste_qty = p_waste_qty;
    SET v_order_oper_way = p_order_oper_way;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_pd_no = 0;
    SET v_tmp_exch_group_no = 0;
    SET v_tmp_asset_acco_no = 0;
    SET v_tmp_pass_no = 0;
    SET v_tmp_wtdraw_qty = 0;
    SET v_tmp_waste_qty = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_external_no = 0;
    SET v_order_dir = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_sum_status = "0";
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_aver_price = 0;
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
    SET v_impawn_ratio = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_exter_comm_flag = 0;
    SET v_record_valid_flag = 0;

    
    label_pro:BEGIN
    

    /* [检查正常返回][@订单批号# <=0] */
    if v_order_batch_no <=0 then
        leave label_pro;
    end if;


    /* set @临时_产品编号# = @产品编号#; */
    set v_tmp_pd_no = v_pd_no;

    /* set @临时_交易组编号# = @交易组编号#; */
    set v_tmp_exch_group_no = v_exch_group_no;

    /* set @临时_资产账户编号# = @资产账户编号#; */
    set v_tmp_asset_acco_no = v_asset_acco_no;

    /* set @临时_通道编号# = @通道编号#; */
    set v_tmp_pass_no = v_pass_no;

    /* set @临时_撤单数量# = @撤单数量#; */
    set v_tmp_wtdraw_qty = v_wtdraw_qty;

    /* set @临时_废单数量# = @废单数量#; */
    set v_tmp_waste_qty = v_waste_qty;

    /* [获取表记录变量][交易证券_交易_订单汇总表][{记录序号}][@记录序号#][{订单日期}=@订单日期# and {机构编号} = @机构编号# and {订单批号}= @订单批号#][4][@订单日期#, @机构编号#, @订单批号#] */
    select row_id into v_row_id from db_tdsecu.tb_tdsetd_sumorder where order_date=v_order_date and co_no = v_co_no and order_batch_no= v_order_batch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.34.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no);
        end if;
        leave label_pro;
    end if;


    /* [锁定获取表记录变量][交易证券_交易_订单汇总表][字段][字段变量][{记录序号}=@记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_crncy_type, exch_no, stock_code_no, stock_code, 
        trade_code_no, target_code_no, stock_type, asset_type, 
        external_no, order_date, order_batch_no, order_dir, 
        price_type, order_price, order_qty, order_sum_status, 
        wtdraw_qty, waste_qty, strike_amt, strike_qty, 
        strike_aver_price, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, strike_bond_accr_intrst, 
        order_oper_way, exter_comm_flag, record_valid_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_exch_crncy_type, v_exch_no, v_stock_code_no, v_stock_code, 
        v_trade_code_no, v_target_code_no, v_stock_type, v_asset_type, 
        v_external_no, v_order_date, v_order_batch_no, v_order_dir, 
        v_price_type, v_order_price, v_order_qty, v_order_sum_status, 
        v_wtdraw_qty, v_waste_qty, v_strike_amt, v_strike_qty, 
        v_strike_aver_price, v_all_fee, v_stamp_tax, v_trans_fee, 
        v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
        v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
        v_stock_settle_fee, v_net_price_flag, v_intrst_days, v_par_value, 
        v_bond_accr_intrst, v_bond_rate_type, v_impawn_ratio, v_strike_bond_accr_intrst, 
        v_order_oper_way, v_exter_comm_flag, v_record_valid_flag from db_tdsecu.tb_tdsetd_sumorder where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.34.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @撤单数量# = @临时_撤单数量# + @撤单数量#; */
    set v_wtdraw_qty = v_tmp_wtdraw_qty + v_wtdraw_qty;

    /* set @废单数量# = @临时_废单数量# + @废单数量#; */
    set v_waste_qty = v_tmp_waste_qty + v_waste_qty;

    /* 调用【原子_交易证券_公用_计算订单汇总状态】*/
    call db_tdsecu.pra_tdsepb_CaclOrderSumStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_qty,
        v_wtdraw_qty,
        v_strike_qty,
        v_waste_qty,
        v_error_code,
        v_error_info,
        v_order_sum_status);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuA.4.34.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单汇总状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_交易_订单汇总表][{订单汇总状态}=@订单汇总状态#,{撤单数量}=@撤单数量#, {废单数量}=@废单数量#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_sumorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_sum_status=v_order_sum_status,wtdraw_qty=v_wtdraw_qty, waste_qty=v_waste_qty where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.34.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_成交处理汇总订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_StrikeDealSumOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_StrikeDealSumOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_stock_type int,
    IN p_order_date int,
    IN p_order_batch_no int,
    IN p_order_dir int,
    IN p_order_status varchar(2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_qty decimal(18,2),
    IN p_strike_bond_accr_intrst decimal(18,4),
    IN p_order_oper_way varchar(2),
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
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_order_status varchar(2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_bond_accr_intrst decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_asset_type int;
    declare v_external_no bigint;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_sum_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_waste_qty decimal(18,2);
    declare v_strike_aver_price decimal(16,9);
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
    declare v_impawn_ratio decimal(18,12);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_stock_type = p_stock_type;
    SET v_order_date = p_order_date;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir = p_order_dir;
    SET v_order_status = p_order_status;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_bond_accr_intrst = p_strike_bond_accr_intrst;
    SET v_order_oper_way = p_order_oper_way;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_strike_amt = 0;
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_bond_accr_intrst = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_asset_type = 0;
    SET v_external_no = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_sum_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_waste_qty = 0;
    SET v_strike_aver_price = 0;
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
    SET v_impawn_ratio = 0;
    SET v_exter_comm_flag = 0;
    SET v_record_valid_flag = 0;

    
    label_pro:BEGIN
    

    /* [检查正常返回][@订单批号# <=0] */
    if v_order_batch_no <=0 then
        leave label_pro;
    end if;


    /* set @临时_成交金额# = @成交金额#; */
    set v_tmp_strike_amt = v_strike_amt;

    /* set @临时_成交数量# = @成交数量#; */
    set v_tmp_strike_qty = v_strike_qty;

    /* set @临时_成交债券计提利息# = @成交债券计提利息#; */
    set v_tmp_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    #[更新表记录][交易证券_交易_订单汇总表][{成交数量}={成交数量}+@成交数量#, {成交金额}={成交金额}+@成交金额#,{成交债券计提利息}={成交债券计提利息}+@成交债券计提利息#][{订单日期}=@订单日期# and {机构编号} = @机构编号# and {订单批号}= @订单批号#][2][@订单日期#, @机构编号#, @订单批号#]

    /* [获取表记录变量语句][交易证券_交易_订单汇总表][{记录序号}][@记录序号#][{订单日期}=@订单日期# and {机构编号} = @机构编号# and {订单批号}= @订单批号#] */
    select row_id into v_row_id from db_tdsecu.tb_tdsetd_sumorder where order_date=v_order_date and co_no = v_co_no and order_batch_no= v_order_batch_no limit 1;


    /* if @记录序号# = 0 and (@订单方向# = 《订单方向-基金申购》 or @订单方向# = 《订单方向-基金赎回》 or @订单方向# = 《订单方向-基金转换》)  then */
    if v_row_id = 0 and (v_order_dir = 9 or v_order_dir = 10 or v_order_dir = 12)  then

        /* [获取表记录变量][历史_交易证券_交易_订单汇总表][{记录序号}][@记录序号#][{订单日期}=@订单日期# and {机构编号} = @机构编号# and {订单批号}= @订单批号#][4][@订单日期#, @机构编号#, @订单批号#] */
        select row_id into v_row_id from db_tdsecu_his.tb_tdsetd_sumorder_his where order_date=v_order_date and co_no = v_co_no and order_batch_no= v_order_batch_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "tdsecuA.4.35.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no);
            end if;
            leave label_pro;
        end if;


        /* [锁定获取表记录变量][历史_交易证券_交易_订单汇总表][字段][字段变量][{记录序号}=@记录序号#][4][@记录序号#] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            exch_crncy_type, exch_no, stock_code_no, stock_code, 
            trade_code_no, target_code_no, stock_type, asset_type, 
            external_no, order_date, order_batch_no, order_dir, 
            price_type, order_price, order_qty, order_sum_status, 
            wtdraw_qty, waste_qty, strike_amt, strike_qty, 
            strike_aver_price, all_fee, stamp_tax, trans_fee, 
            brkage_fee, SEC_charges, other_fee, trade_commis, 
            other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
            stock_settle_fee, net_price_flag, intrst_days, par_value, 
            bond_accr_intrst, bond_rate_type, impawn_ratio, strike_bond_accr_intrst, 
            order_oper_way, exter_comm_flag, record_valid_flag into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_opor_co_no, 
            v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
            v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
            v_exch_crncy_type, v_exch_no, v_stock_code_no, v_stock_code, 
            v_trade_code_no, v_target_code_no, v_stock_type, v_asset_type, 
            v_external_no, v_order_date, v_order_batch_no, v_order_dir, 
            v_price_type, v_order_price, v_order_qty, v_order_sum_status, 
            v_wtdraw_qty, v_waste_qty, v_strike_amt, v_strike_qty, 
            v_strike_aver_price, v_all_fee, v_stamp_tax, v_trans_fee, 
            v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
            v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
            v_stock_settle_fee, v_net_price_flag, v_intrst_days, v_par_value, 
            v_bond_accr_intrst, v_bond_rate_type, v_impawn_ratio, v_strike_bond_accr_intrst, 
            v_order_oper_way, v_exter_comm_flag, v_record_valid_flag from db_tdsecu_his.tb_tdsetd_sumorder_his where row_id=v_row_id limit 1 for update;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "tdsecuA.4.35.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("记录序号=",v_row_id);
            end if;
            leave label_pro;
        end if;


        /* set @成交金额# = @成交金额# + @临时_成交金额#; */
        set v_strike_amt = v_strike_amt + v_tmp_strike_amt;

        /* set @成交数量#=@成交数量#+@临时_成交数量#; */
        set v_strike_qty=v_strike_qty+v_tmp_strike_qty;

        /* set @成交债券计提利息#=@成交债券计提利息#+@临时_成交债券计提利息#; */
        set v_strike_bond_accr_intrst=v_strike_bond_accr_intrst+v_tmp_strike_bond_accr_intrst;

        /* set @成交均价# = 0; */
        set v_strike_aver_price = 0;

        /* if @成交数量# > 0 then */
        if v_strike_qty > 0 then

            /* set @成交均价# = Round(@成交金额#/@成交数量#,4); */
            set v_strike_aver_price = Round(v_strike_amt/v_strike_qty,4);
        end if;

        /* 调用【原子_交易证券_公用_计算订单汇总状态】*/
        call db_tdsecu.pra_tdsepb_CaclOrderSumStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_qty,
            v_wtdraw_qty,
            v_strike_qty,
            v_waste_qty,
            v_error_code,
            v_error_info,
            v_order_sum_status);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuA.4.35.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单汇总状态出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* [更新表记录][历史_交易证券_交易_订单汇总表][{成交数量}=@成交数量#, {成交金额}=@成交金额#,{成交债券计提利息}=@成交债券计提利息#,{订单汇总状态}=@订单汇总状态#,{成交均价}=@成交均价#][{记录序号}=@记录序号#][2][@记录序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu_his.tb_tdsetd_sumorder_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_qty=v_strike_qty, strike_amt=v_strike_amt,strike_bond_accr_intrst=v_strike_bond_accr_intrst,order_sum_status=v_order_sum_status,strike_aver_price=v_strike_aver_price where row_id=v_row_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.4.35.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("记录序号=",v_row_id);
            end if;
            leave label_pro;
        end if;

    else

        /* [锁定获取表记录变量][交易证券_交易_订单汇总表][字段][字段变量][{记录序号}=@记录序号#][4][@记录序号#] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            exch_crncy_type, exch_no, stock_code_no, stock_code, 
            trade_code_no, target_code_no, stock_type, asset_type, 
            external_no, order_date, order_batch_no, order_dir, 
            price_type, order_price, order_qty, order_sum_status, 
            wtdraw_qty, waste_qty, strike_amt, strike_qty, 
            strike_aver_price, all_fee, stamp_tax, trans_fee, 
            brkage_fee, SEC_charges, other_fee, trade_commis, 
            other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
            stock_settle_fee, net_price_flag, intrst_days, par_value, 
            bond_accr_intrst, bond_rate_type, impawn_ratio, strike_bond_accr_intrst, 
            order_oper_way, exter_comm_flag, record_valid_flag into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_opor_co_no, 
            v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
            v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
            v_exch_crncy_type, v_exch_no, v_stock_code_no, v_stock_code, 
            v_trade_code_no, v_target_code_no, v_stock_type, v_asset_type, 
            v_external_no, v_order_date, v_order_batch_no, v_order_dir, 
            v_price_type, v_order_price, v_order_qty, v_order_sum_status, 
            v_wtdraw_qty, v_waste_qty, v_strike_amt, v_strike_qty, 
            v_strike_aver_price, v_all_fee, v_stamp_tax, v_trans_fee, 
            v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
            v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
            v_stock_settle_fee, v_net_price_flag, v_intrst_days, v_par_value, 
            v_bond_accr_intrst, v_bond_rate_type, v_impawn_ratio, v_strike_bond_accr_intrst, 
            v_order_oper_way, v_exter_comm_flag, v_record_valid_flag from db_tdsecu.tb_tdsetd_sumorder where row_id=v_row_id limit 1 for update;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "tdsecuA.4.35.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("记录序号=",v_row_id);
            end if;
            leave label_pro;
        end if;


        /* set @成交金额# = @成交金额# + @临时_成交金额#; */
        set v_strike_amt = v_strike_amt + v_tmp_strike_amt;

        /* set @成交数量#=@成交数量#+@临时_成交数量#; */
        set v_strike_qty=v_strike_qty+v_tmp_strike_qty;

        /* set @成交债券计提利息#=@成交债券计提利息#+@临时_成交债券计提利息#; */
        set v_strike_bond_accr_intrst=v_strike_bond_accr_intrst+v_tmp_strike_bond_accr_intrst;

        /* set @成交均价# = 0; */
        set v_strike_aver_price = 0;

        /* if @成交数量# > 0 then */
        if v_strike_qty > 0 then

            /* set @成交均价# = Round(@成交金额#/@成交数量#,4); */
            set v_strike_aver_price = Round(v_strike_amt/v_strike_qty,4);
        end if;

        /* 调用【原子_交易证券_公用_计算订单汇总状态】*/
        call db_tdsecu.pra_tdsepb_CaclOrderSumStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_qty,
            v_wtdraw_qty,
            v_strike_qty,
            v_waste_qty,
            v_error_code,
            v_error_info,
            v_order_sum_status);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuA.4.35.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单汇总状态出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* [更新表记录][交易证券_交易_订单汇总表][{成交数量}=@成交数量#, {成交金额}=@成交金额#,{成交债券计提利息}=@成交债券计提利息#,{订单汇总状态}=@订单汇总状态#,{成交均价}=@成交均价#][{记录序号}=@记录序号#][2][@记录序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdsetd_sumorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_qty=v_strike_qty, strike_amt=v_strike_amt,strike_bond_accr_intrst=v_strike_bond_accr_intrst,order_sum_status=v_order_sum_status,strike_aver_price=v_strike_aver_price where row_id=v_row_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.4.35.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("记录序号=",v_row_id);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_成交费用处理汇总订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_StrikeFeeDealSumOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_StrikeFeeDealSumOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_order_date int,
    IN p_order_batch_no int,
    IN p_order_dir int,
    IN p_all_fee decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_trade_cost_fee decimal(18,4),
    IN p_trade_system_use_fee decimal(18,4),
    IN p_trade_tax decimal(18,4),
    IN p_stock_settle_fee decimal(18,4),
    IN p_order_oper_way varchar(2),
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
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_order_date = p_order_date;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir = p_order_dir;
    SET v_all_fee = p_all_fee;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_trade_cost_fee = p_trade_cost_fee;
    SET v_trade_system_use_fee = p_trade_system_use_fee;
    SET v_trade_tax = p_trade_tax;
    SET v_stock_settle_fee = p_stock_settle_fee;
    SET v_order_oper_way = p_order_oper_way;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [检查正常返回][@订单批号# <=0] */
    if v_order_batch_no <=0 then
        leave label_pro;
    end if;


    /* [获取表记录变量语句][交易证券_交易_订单汇总表][{记录序号}][@记录序号#][{订单日期}=@订单日期# and {机构编号} = @机构编号# and {订单批号}= @订单批号#] */
    select row_id into v_row_id from db_tdsecu.tb_tdsetd_sumorder where order_date=v_order_date and co_no = v_co_no and order_batch_no= v_order_batch_no limit 1;


    /* if @记录序号# = 0 and (@订单方向# = 《订单方向-基金申购》 or @订单方向# = 《订单方向-基金赎回》 or @订单方向# = 《订单方向-基金转换》 ) then */
    if v_row_id = 0 and (v_order_dir = 9 or v_order_dir = 10 or v_order_dir = 12 ) then

        /* [获取表记录变量语句][历史_交易证券_交易_订单汇总表][{记录序号}][@记录序号#][{订单日期}=@订单日期# and {机构编号} = @机构编号# and {订单批号}= @订单批号#] */
        select row_id into v_row_id from db_tdsecu_his.tb_tdsetd_sumorder_his where order_date=v_order_date and co_no = v_co_no and order_batch_no= v_order_batch_no limit 1;


        /* [更新表记录][历史_交易证券_交易_订单汇总表][{全部费用}={全部费用} + @全部费用#,{印花税}={印花税} + @印花税#,{过户费} ={过户费} + @过户费#,{经手费}={经手费} + @经手费#,{证管费}={证管费} + @证管费#,{其他费用}={其他费用} + @其他费用#,{交易佣金}={交易佣金} + @交易佣金#,{其他佣金}={其他佣金} + @其他佣金#,{交易费}={交易费} + @交易费#,{交易系统使用费}={交易系统使用费} + @交易系统使用费#,{交易征费}={交易征费} + @交易征费#,{股份交收费}={股份交收费} + @股份交收费#][{记录序号}=@记录序号#][2][@记录序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu_his.tb_tdsetd_sumorder_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, all_fee=all_fee + v_all_fee,stamp_tax=stamp_tax + v_stamp_tax,trans_fee =trans_fee + v_trans_fee,brkage_fee=brkage_fee + v_brkage_fee,SEC_charges=SEC_charges + v_SEC_charges,other_fee=other_fee + v_other_fee,trade_commis=trade_commis + v_trade_commis,other_commis=other_commis + v_other_commis,trade_cost_fee=trade_cost_fee + v_trade_cost_fee,trade_system_use_fee=trade_system_use_fee + v_trade_system_use_fee,trade_tax=trade_tax + v_trade_tax,stock_settle_fee=stock_settle_fee + v_stock_settle_fee where row_id=v_row_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.4.36.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("记录序号=",v_row_id);
            end if;
            leave label_pro;
        end if;

    else

        /* [更新表记录][交易证券_交易_订单汇总表][{全部费用}={全部费用} + @全部费用#,{印花税}={印花税} + @印花税#,{过户费} ={过户费} + @过户费#,{经手费}={经手费} + @经手费#,{证管费}={证管费} + @证管费#,{其他费用}={其他费用} + @其他费用#,{交易佣金}={交易佣金} + @交易佣金#,{其他佣金}={其他佣金} + @其他佣金#,{交易费}={交易费} + @交易费#,{交易系统使用费}={交易系统使用费} + @交易系统使用费#,{交易征费}={交易征费} + @交易征费#,{股份交收费}={股份交收费} + @股份交收费#][{记录序号}=@记录序号#][2][@记录序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdsetd_sumorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, all_fee=all_fee + v_all_fee,stamp_tax=stamp_tax + v_stamp_tax,trans_fee =trans_fee + v_trans_fee,brkage_fee=brkage_fee + v_brkage_fee,SEC_charges=SEC_charges + v_SEC_charges,other_fee=other_fee + v_other_fee,trade_commis=trade_commis + v_trade_commis,other_commis=other_commis + v_other_commis,trade_cost_fee=trade_cost_fee + v_trade_cost_fee,trade_system_use_fee=trade_system_use_fee + v_trade_system_use_fee,trade_tax=trade_tax + v_trade_tax,stock_settle_fee=stock_settle_fee + v_stock_settle_fee where row_id=v_row_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.4.36.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("记录序号=",v_row_id);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_回溯体外指令订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_BackExterCommOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_BackExterCommOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_date int,
    IN p_order_id bigint,
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
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_交易_订单表][{撤单数量} = {订单数量},{订单冻结金额} = 0,{订单冻结数量}=0, {订单状态} = 《订单状态-已回溯》, {成交数量} = 0, {成交金额} = 0, {成交债券计提利息}=0,{全部费用} = 0,{印花税} = 0,{过户费} = 0,{经手费} = 0,{证管费} = 0,{其他费用} = 0,{交易佣金} = 0,{其他佣金} = 0,{备注信息}=@备注信息#,{记录有效标志}=《记录有效标志-无效》][{记录序号} = @订单序号#][2][@订单日期#, @订单序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, wtdraw_qty = order_qty,order_frozen_amt = 0,order_frozen_qty=0, order_status = "9", strike_qty = 0, strike_amt = 0, strike_bond_accr_intrst=0,all_fee = 0,stamp_tax = 0,trans_fee = 0,brkage_fee = 0,SEC_charges = 0,other_fee = 0,trade_commis = 0,other_commis = 0,remark_info=v_remark_info,record_valid_flag=2 where row_id = v_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.37.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 订单序号=", v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,","," 订单序号=", v_order_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_循环锁定获取订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_LoopLockGetOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_LoopLockGetOrder(
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
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_target_code_no int,
    OUT p_asset_type int,
    OUT p_stock_type int,
    OUT p_comm_opor int,
    OUT p_external_no bigint,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_id bigint,
    OUT p_order_batch_no int,
    OUT p_order_time int,
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
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_net_price_flag int,
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_rsp_info varchar(255),
    OUT p_compli_trig_id bigint,
    OUT p_remark_info varchar(255),
    OUT p_order_oper_way varchar(2),
    OUT p_busi_opor_no int,
    OUT p_combo_code varchar(32),
    OUT p_order_date int,
    OUT p_bond_rate_type int,
    OUT p_exch_crncy_type varchar(3),
    OUT p_impawn_ratio decimal(18,12),
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
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_comm_opor int;
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_id bigint;
    declare v_order_batch_no int;
    declare v_order_time int;
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
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_net_price_flag int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_combo_code varchar(32);
    declare v_order_date int;
    declare v_bond_rate_type int;
    declare v_exch_crncy_type varchar(3);
    declare v_impawn_ratio decimal(18,12);
    declare v_trade_code_no int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_stock_acco varchar(16);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_intrst_days int;
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_cost_calc_type int;
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
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
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_asset_type = 0;
    SET v_stock_type = 0;
    SET v_comm_opor = 0;
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_id = 0;
    SET v_order_batch_no = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
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
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_net_price_flag = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_combo_code = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_bond_rate_type = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_impawn_ratio = 0;
    SET v_trade_code_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_stock_acco = " ";
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_intrst_days = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_cost_calc_type = 0;
    SET v_exter_comm_flag = 0;
    SET v_record_valid_flag = 0;
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
    

    /* [锁定获取表记录变量][交易证券_交易_订单表][字段][字段变量][{记录序号} > @记录序号# order by {记录序号}][4][@记录序号#] */
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
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where row_id > v_row_id order by row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.38.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @订单序号# = @记录序号#; */
    set v_order_id = v_row_id;

    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_target_code_no = v_target_code_no;
    SET p_asset_type = v_asset_type;
    SET p_stock_type = v_stock_type;
    SET p_comm_opor = v_comm_opor;
    SET p_external_no = v_external_no;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_id = v_order_id;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_time = v_order_time;
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
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_net_price_flag = v_net_price_flag;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_rsp_info = v_rsp_info;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_remark_info = v_remark_info;
    SET p_order_oper_way = v_order_oper_way;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_combo_code = v_combo_code;
    SET p_order_date = v_order_date;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_trade_code_no = v_trade_code_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_指令分发锁定获取指令订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_DispLockGetCommOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_DispLockGetCommOrder(
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
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    OUT p_target_code_no int,
    OUT p_trade_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_comm_opor int,
    OUT p_external_no bigint,
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_batch_no int,
    OUT p_order_id bigint,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_dir int,
    OUT p_price_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_all_fee decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_net_price_flag int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_order_oper_way varchar(2),
    OUT p_busi_opor_no int,
    OUT p_target_stock_code_no int,
    OUT p_trade_acco varchar(32)
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
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_target_stock_code_no int;
    declare v_trade_acco varchar(32);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_comm_id bigint;
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
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_rsp_info varchar(255);
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
    declare v_registration_agency varchar(32);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_comm_date = p_comm_date;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
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
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_target_stock_code_no = 0;
    SET v_trade_acco = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_comm_id = 0;
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
    SET v_strike_bond_accr_intrst = 0;
    SET v_rsp_info = " ";
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
    SET v_registration_agency = " ";
    SET v_contra_no = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][交易证券_交易_订单表][字段][字段变量][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {指令批号} = @指令批号# and {订单状态} in (《订单状态-未报》,《订单状态-已报》,《订单状态-部成》) and {记录序号} > @记录序号# order by {记录序号} asc][4][@机构编号#,@指令批号#, @记录序号#] */
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
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where init_date=v_init_date and co_no=v_co_no and comm_batch_no = v_comm_batch_no and order_status in ("1","2","5") and row_id > v_row_id order by row_id asc limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.39.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","指令批号=",v_comm_batch_no,","," 记录序号=", v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","指令批号=",v_comm_batch_no,","," 记录序号=", v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @订单序号# = @记录序号#; */
    set v_order_id = v_row_id;

    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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
    SET p_target_code_no = v_target_code_no;
    SET p_trade_code_no = v_trade_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_comm_opor = v_comm_opor;
    SET p_external_no = v_external_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_id = v_order_id;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_dir = v_order_dir;
    SET p_price_type = v_price_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_status = v_order_status;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_all_fee = v_all_fee;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_net_price_flag = v_net_price_flag;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_order_oper_way = v_order_oper_way;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_trade_acco = v_trade_acco;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_新增待执行订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_AddPendOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_AddPendOrder(
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
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_batch_no int,
    IN p_order_date int,
    IN p_order_dir int,
    IN p_price_type int,
    IN p_exec_price_type int,
    IN p_price_offset decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_net_price_flag int,
    IN p_intrst_days int,
    IN p_par_value decimal(16,9),
    IN p_impawn_ratio decimal(18,12),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_order_oper_way varchar(2),
    IN p_external_no bigint,
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pend_order_id bigint,
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
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_batch_no int;
    declare v_order_date int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_exec_price_type int;
    declare v_price_offset decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_order_oper_way varchar(2);
    declare v_external_no bigint;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pend_order_id bigint;
    declare v_order_time int;
    declare v_pend_order_status varchar(2);
    declare v_update_times int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_oper_func_code varchar(16);
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
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_date = p_order_date;
    SET v_order_dir = p_order_dir;
    SET v_price_type = p_price_type;
    SET v_exec_price_type = p_exec_price_type;
    SET v_price_offset = p_price_offset;
    SET v_order_qty = p_order_qty;
    SET v_net_price_flag = p_net_price_flag;
    SET v_intrst_days = p_intrst_days;
    SET v_par_value = p_par_value;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_order_oper_way = p_order_oper_way;
    SET v_external_no = p_external_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pend_order_id = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_pend_order_status = "0";
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器时间][@订单时间#] */
    select date_format(curtime(),'%H%i%s') into v_order_time;


    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @待执行订单状态# = 《待执行订单状态-未执行》; */
    set v_pend_order_status = "1";

    /* [插入表记录][交易证券_交易_待执行订单表][字段][字段变量][1][@订单日期#,@订单批号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsetd_pendorder(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, co_no, pd_no, 
        exch_group_no, asset_acco_no, pass_no, out_acco, 
        exch_crncy_type, exch_no, stock_acco_no, stock_acco, 
        stock_code_no, stock_code, trade_code_no, target_code_no, 
        stock_type, asset_type, comm_id, comm_batch_no, 
        order_date, order_time, order_batch_no, order_dir, 
        price_type, exec_price_type, price_offset, order_qty, 
        net_price_flag, intrst_days, par_value, bond_accr_intrst, 
        bond_rate_type, impawn_ratio, order_oper_way, external_no, 
        pend_order_status, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_exch_crncy_type, v_exch_no, v_stock_acco_no, v_stock_acco, 
        v_stock_code_no, v_stock_code, v_trade_code_no, v_target_code_no, 
        v_stock_type, v_asset_type, v_comm_id, v_comm_batch_no, 
        v_order_date, v_order_time, v_order_batch_no, v_order_dir, 
        v_price_type, v_exec_price_type, v_price_offset, v_order_qty, 
        v_net_price_flag, v_intrst_days, v_par_value, v_bond_accr_intrst, 
        v_bond_rate_type, v_impawn_ratio, v_order_oper_way, v_external_no, 
        v_pend_order_status, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.40.1";
        SET v_error_info =  CONCAT(concat("订单日期=",v_order_date,",","订单批号=",v_order_batch_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@待执行订单序号#] */
    select LAST_INSERT_ID() into v_pend_order_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pend_order_id = v_pend_order_id;
    SET p_order_time = v_order_time;
    SET p_pend_order_status = v_pend_order_status;
    SET p_update_times = v_update_times;
    SET p_create_date = v_create_date;
    SET p_create_time = v_create_time;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_修改待执行订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_UpdatePendOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_UpdatePendOrder(
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
    SET v_pend_order_id = p_pend_order_id;
    SET v_remark_info = p_remark_info;
    SET v_pend_order_status = p_pend_order_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_交易_待执行订单表][{备注信息}=@备注信息#,{待执行订单状态}=@待执行订单状态#][{记录序号}=@待执行订单序号#][2][@待执行订单序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_pendorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, remark_info=v_remark_info,pend_order_status=v_pend_order_status where row_id=v_pend_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.41.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("待执行订单序号=",v_pend_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("待执行订单序号=",v_pend_order_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_新增组合交易记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_AddComboTradeLog;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_AddComboTradeLog(
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
    IN p_order_batch_no int,
    IN p_combo_code varchar(32),
    IN p_combo_copies decimal(18,2),
    IN p_order_dir int,
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
    declare v_order_batch_no int;
    declare v_combo_code varchar(32);
    declare v_combo_copies decimal(18,2);
    declare v_order_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_combo_date int;
    declare v_combo_time int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_order_batch_no = p_order_batch_no;
    SET v_combo_code = p_combo_code;
    SET v_combo_copies = p_combo_copies;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_combo_date = date_format(curdate(),'%Y%m%d');
    SET v_combo_time = date_format(curtime(),'%H%i%s');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取机器日期][@组合日期#] */
    select date_format(curdate(),'%Y%m%d') into v_combo_date;


    /* [获取机器时间][@组合时间#] */
    select date_format(curtime(),'%H%i%s') into v_combo_time;


    /* [插入表记录][交易证券_交易_组合交易流水记录表][字段][字段变量][1][@组合代码#,@订单批号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsetd_combotradelog(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, opor_no, 
        co_no, pd_no, exch_group_no, combo_code, 
        order_batch_no, order_dir, combo_copies, combo_date, 
        combo_time) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_opor_no, 
        v_co_no, v_pd_no, v_exch_group_no, v_combo_code, 
        v_order_batch_no, v_order_dir, v_combo_copies, v_combo_date, 
        v_combo_time);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.42.1";
        SET v_error_info =  CONCAT(concat("组合代码=",v_combo_code,",","订单批号=",v_order_batch_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_检查场外基金交易业务合法性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_CheckOutExchData;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_CheckOutExchData(
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
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_order_price decimal(16,9),
    IN p_order_frozen_amt decimal(18,4),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_busi_limit_str varchar(2048),
    IN p_subscription_trade_mark int,
    IN p_purchase_trade_mark int,
    IN p_target_purchase_trade_mark int,
    IN p_rede_trade_mark int,
    IN p_first_minimum_amt decimal(18,4),
    IN p_minimum_purchase_amt decimal(18,4),
    IN p_minimum_subscription_amt decimal(18,4),
    IN p_minimum_rede_share decimal(18,2),
    IN p_minimum_holding_share decimal(18,2),
    IN p_fund_manager varchar(64),
    IN p_target_fund_manager varchar(64),
    IN p_charging_method int,
    IN p_target_charging_method int,
    IN p_record_count int,
    IN p_exgp_avail_qty decimal(18,2),
    IN p_posi_reback_days int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_frozen_amt decimal(18,4),
    OUT p_frozen_qty decimal(18,2)
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
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_order_frozen_amt decimal(18,4);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_busi_limit_str varchar(2048);
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
    declare v_record_count int;
    declare v_exgp_avail_qty decimal(18,2);
    declare v_posi_reback_days int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_frozen_amt decimal(18,4);
    declare v_frozen_qty decimal(18,2);
    declare v_asset_acco varchar(16);
    declare v_posi_record_count int;
    declare v_comm_avail_qty decimal(18,2);
    declare v_trade_avail_qty decimal(18,2);
    declare v_static_avail_qty decimal(18,2);
    declare v_occur_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_order_price = p_order_price;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_subscription_trade_mark = p_subscription_trade_mark;
    SET v_purchase_trade_mark = p_purchase_trade_mark;
    SET v_target_purchase_trade_mark = p_target_purchase_trade_mark;
    SET v_rede_trade_mark = p_rede_trade_mark;
    SET v_first_minimum_amt = p_first_minimum_amt;
    SET v_minimum_purchase_amt = p_minimum_purchase_amt;
    SET v_minimum_subscription_amt = p_minimum_subscription_amt;
    SET v_minimum_rede_share = p_minimum_rede_share;
    SET v_minimum_holding_share = p_minimum_holding_share;
    SET v_fund_manager = p_fund_manager;
    SET v_target_fund_manager = p_target_fund_manager;
    SET v_charging_method = p_charging_method;
    SET v_target_charging_method = p_target_charging_method;
    SET v_record_count = p_record_count;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_frozen_amt = 0;
    SET v_frozen_qty = 0;
    SET v_asset_acco = " ";
    SET v_posi_record_count = 0;
    SET v_comm_avail_qty = 0;
    SET v_trade_avail_qty = 0;
    SET v_static_avail_qty = 0;
    SET v_occur_qty = 0;

    
    label_pro:BEGIN
    
    #检查参数合法性
    #检查业务限制

    /* if @订单方向# = 《订单方向-新股申购》 or @订单方向# = 《订单方向-新股申购》 then */
    if v_order_dir = 11 or v_order_dir = 11 then

        /* [检查报错返回][instr(@业务限制串#, concat(";",《业务限制-限制打新》,";")) > 0][128][@资产账户#,@业务限制串#] */
        if instr(v_busi_limit_str, concat(";",1,";")) > 0 then
            
            SET v_error_code = "tdsecuA.4.43.128";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户=",v_asset_acco,",","业务限制串=",v_busi_limit_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户=",v_asset_acco,",","业务限制串=",v_busi_limit_str);
            end if;
            leave label_pro;
        end if;

        #检查重复申购
        #注意，为避免申购订单废单后需要重新申购，因此在回报处理时要注意删除不成功的申购记录，以避免插入记录失败
        #[记录已存在][交易证券_交易_新股申购表][@记录个数#][{股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#][720][@股东代码编号#,@证券代码编号#]

        /* [记录已存在][交易证券_交易_订单表][@记录个数#][{订单日期} = @初始化日期# and ({订单状态}  in (《订单状态-未报》,《订单状态-待报》,《订单状态-正报》,《订单状态-已报》)) and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#][720][@资产账户编号#,@股东代码编号#,@证券代码编号#] */
        select count(1) into v_record_count from db_tdsecu.tb_tdsetd_order where order_date = v_init_date and (order_status  in ("1","a","b","2")) and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no limit 1;
        if v_record_count > 0 then
                    
            SET v_error_code = "tdsecuA.4.43.720";
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
            leave label_pro;
        end if;

    end if;

    /* if @订单方向# = 《订单方向-融资回购》 then */
    if v_order_dir = 3 then

        /* [检查报错返回][instr(@业务限制串#, concat(";",《业务限制-限制融资回购》,";")) > 0][129][@资产账户#,@业务限制串#] */
        if instr(v_busi_limit_str, concat(";",2,";")) > 0 then
            
            SET v_error_code = "tdsecuA.4.43.129";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户=",v_asset_acco,",","业务限制串=",v_busi_limit_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户=",v_asset_acco,",","业务限制串=",v_busi_limit_str);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @订单方向# = 《订单方向-融券回购》 then */
    if v_order_dir = 4 then

        /* [检查报错返回][instr(@业务限制串#, concat(";",《业务限制-限制融券回购》,";")) > 0][130][@资产账户#,@业务限制串#] */
        if instr(v_busi_limit_str, concat(";",3,";")) > 0 then
            
            SET v_error_code = "tdsecuA.4.43.130";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户=",v_asset_acco,",","业务限制串=",v_busi_limit_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户=",v_asset_acco,",","业务限制串=",v_busi_limit_str);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @订单方向#=《订单方向-基金申购》 then */
    if v_order_dir=9 then
        #基金申购的判断:申购交易标志、最低申购金额、首次最低金额

        /* [检查报错返回][@申购交易标志#=《申购交易标志-否》][776][@申购交易标志#] */
        if v_purchase_trade_mark=0 then
            
            SET v_error_code = "tdsecuA.4.43.776";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("申购交易标志=",v_purchase_trade_mark),"#",v_mysql_message);
            else
                SET v_error_info = concat("申购交易标志=",v_purchase_trade_mark);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@订单冻结金额#<@最低申购金额# and @最低申购金额#>0][776][@订单冻结金额#,@最低申购金额#] */
        if v_order_frozen_amt<v_minimum_purchase_amt and v_minimum_purchase_amt>0 then
            
            SET v_error_code = "tdsecuA.4.43.776";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单冻结金额=",v_order_frozen_amt,",","最低申购金额=",v_minimum_purchase_amt),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单冻结金额=",v_order_frozen_amt,",","最低申购金额=",v_minimum_purchase_amt);
            end if;
            leave label_pro;
        end if;

        #如果产品库和交易库下持仓数量为0，则判断为是首次申购

        /* [获取表记录数量][交易证券_账户_资产账户业务持仓表][@持仓记录个数#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#] */
        select count(1) into v_posi_record_count from db_tdsecu.tb_tdseac_asac_busi_posi where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no;


        /* if @持仓记录个数#=0 and @记录个数#=0 then */
        if v_posi_record_count=0 and v_record_count=0 then

            /* [检查报错返回][@订单冻结金额#<@首次最低金额# and @首次最低金额#>0][776][@订单冻结金额#,@首次最低金额#] */
            if v_order_frozen_amt<v_first_minimum_amt and v_first_minimum_amt>0 then
                
                SET v_error_code = "tdsecuA.4.43.776";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单冻结金额=",v_order_frozen_amt,",","首次最低金额=",v_first_minimum_amt),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单冻结金额=",v_order_frozen_amt,",","首次最低金额=",v_first_minimum_amt);
                end if;
                leave label_pro;
            end if;

        end if;
    end if;

    /* if @订单方向#=《订单方向-基金赎回》 then */
    if v_order_dir=10 then
        #基金申购的判断:赎回交易标志、最低赎回份额、最低持有份额((赎回的时候，小于该值，必须一次性赎回。最低持有份额就是帐面上最少要有多少份额。例如：你有1200份，而最低持有份额为1000份的话，你要么全部赎回，要么一份也不赎。你不能赎回1000份，留下200份（因为200份低于最低持有份额))

        /* [检查报错返回][@赎回交易标志#=《赎回交易标志-否》][776][@赎回交易标志#] */
        if v_rede_trade_mark=0 then
            
            SET v_error_code = "tdsecuA.4.43.776";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("赎回交易标志=",v_rede_trade_mark),"#",v_mysql_message);
            else
                SET v_error_info = concat("赎回交易标志=",v_rede_trade_mark);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@订单数量#<@最低赎回份额# and @最低赎回份额#>0][776][@订单数量#,@最低赎回份额#] */
        if v_order_qty<v_minimum_rede_share and v_minimum_rede_share>0 then
            
            SET v_error_code = "tdsecuA.4.43.776";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单数量=",v_order_qty,",","最低赎回份额=",v_minimum_rede_share),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单数量=",v_order_qty,",","最低赎回份额=",v_minimum_rede_share);
            end if;
            leave label_pro;
        end if;


        /* 调用【原子_交易证券_账户_计算交易组持仓可用】*/
        call db_tdsecu.pra_tdseac_CalcExgpPosiAvail(
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
            v_posi_reback_days,
            v_error_code,
            v_error_info,
            v_comm_avail_qty,
            v_trade_avail_qty,
            v_static_avail_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuA.4.43.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组持仓可用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* [检查报错返回][@交易组可用数量#+@交易端可用数量#-@订单数量#<@最低持有份额# and @最低持有份额#>0][776][@交易组可用数量#+@交易端可用数量#,@订单数量#,@最低持有份额#] */
        if v_exgp_avail_qty+v_trade_avail_qty-v_order_qty<v_minimum_holding_share and v_minimum_holding_share>0 then
            
            SET v_error_code = "tdsecuA.4.43.776";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组可用数量+交易端可用数量=",v_exgp_avail_qty+v_trade_avail_qty,",","订单数量=",v_order_qty,",","最低持有份额=",v_minimum_holding_share),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组可用数量+交易端可用数量=",v_exgp_avail_qty+v_trade_avail_qty,",","订单数量=",v_order_qty,",","最低持有份额=",v_minimum_holding_share);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @订单方向#=《订单方向-基金转换》 then */
    if v_order_dir=12 then
        #基金转换只能在同一基金管理公司的同一基金账户下进行

        /* [检查报错返回][@基金管理人# <>@目标基金管理人#][776][@基金管理人#,@目标基金管理人#] */
        if v_fund_manager <>v_target_fund_manager then
            
            SET v_error_code = "tdsecuA.4.43.776";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("基金管理人=",v_fund_manager,",","目标基金管理人=",v_target_fund_manager),"#",v_mysql_message);
            else
                SET v_error_info = concat("基金管理人=",v_fund_manager,",","目标基金管理人=",v_target_fund_manager);
            end if;
            leave label_pro;
        end if;

        #在发生基金转换业务时，转出基金和转入基金必须在“交易”状态下，也就是说，转出基金必须为允许赎回状态，转入基金必须为允许申购状态

        /* [检查报错返回][@赎回交易标志# <>《赎回交易标志-是》 or @目标申购交易标志# <> 《申购交易标志-是》][776][@赎回交易标志#,@目标申购交易标志#] */
        if v_rede_trade_mark <>1 or v_target_purchase_trade_mark <> 1 then
            
            SET v_error_code = "tdsecuA.4.43.776";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("赎回交易标志=",v_rede_trade_mark,",","目标申购交易标志=",v_target_purchase_trade_mark),"#",v_mysql_message);
            else
                SET v_error_info = concat("赎回交易标志=",v_rede_trade_mark,",","目标申购交易标志=",v_target_purchase_trade_mark);
            end if;
            leave label_pro;
        end if;

        #基金转换通常只允许在同为前端收费或者同为后端收费的基金之间进行，不允许将前端收费基金转换为后端收费基金，或者将后端收费基金转换为前端收费基金

        /* [检查报错返回][@收费方式# <>@目标收费方式#][776][@收费方式#,@目标收费方式#] */
        if v_charging_method <>v_target_charging_method then
            
            SET v_error_code = "tdsecuA.4.43.776";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("收费方式=",v_charging_method,",","目标收费方式=",v_target_charging_method),"#",v_mysql_message);
            else
                SET v_error_info = concat("收费方式=",v_charging_method,",","目标收费方式=",v_target_charging_method);
            end if;
            leave label_pro;
        end if;

        #各基金管理公司一般设置了最低基金转出份额，大部分为1000份

        /* [检查报错返回][@最低赎回份额#  < @变动数量#][776][@最低赎回份额#] */
        if v_minimum_rede_share  < v_occur_qty then
            
            SET v_error_code = "tdsecuA.4.43.776";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("最低赎回份额=",v_minimum_rede_share),"#",v_mysql_message);
            else
                SET v_error_info = concat("最低赎回份额=",v_minimum_rede_share);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_frozen_amt = v_frozen_amt;
    SET p_frozen_qty = v_frozen_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_修改预埋订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_ModiPreOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_ModiPreOrderInfo(
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
    SET v_pre_order_id = p_pre_order_id;
    SET v_pre_order_type = p_pre_order_type;
    SET v_is_trace = p_is_trace;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_交易_预埋订单表][{预埋订单方式} = @预埋订单方式#, {是否追单} = @是否追单#][{记录序号} = @预埋订单序号#][2][@预埋订单序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_preorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pre_order_type = v_pre_order_type, is_trace = v_is_trace where row_id = v_pre_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.44.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("预埋订单序号=",v_pre_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("预埋订单序号=",v_pre_order_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryOrder(
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
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易证券_交易_订单表][{记录序号},{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{市场编号},{股东代码},{股东代码编号},{证券代码},{证券代码编号},{资产类型},{证券类型},{指令下达人},{外部编号},{指令序号},{指令批号},{申报日期},{申报时间},{申报编号},{订单批号},{记录序号} as {订单序号},{订单日期},{订单时间},{订单方向},{价格类型},{订单价格},{订单数量},{订单状态},{撤单数量},{成交金额},{成交数量},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{债券计提利息},{净价标志},{订单冻结金额},{订单冻结数量},{回报信息},{合规触警序号},{备注信息},{订单操作方式},{交易币种},{组合代码},{组合持仓序号},{策略序号},{合同编号},{更新次数}][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#)  and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#)  and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单序号#=0 or {记录序号}=@订单序号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@订单状态串#=" " or instr(@订单状态串#, concat(";",{订单状态},";"))>0) and (@价格类型串#=" " or instr(@价格类型串#, concat(";",{价格类型},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and (@组合代码# = " " or {组合代码} = @组合代码#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco,stock_acco_no,stock_code,stock_code_no,asset_type,stock_type,comm_opor,external_no,comm_id,comm_batch_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,price_type,order_price,order_qty,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,net_price_flag,order_frozen_amt,order_frozen_qty,rsp_info,compli_trig_id,remark_info,order_oper_way,exch_crncy_type,combo_code,combo_posi_id,strategy_id,contra_no,update_times from db_tdsecu.tb_tdsetd_order where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no)  and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_combo_code = " " or combo_code = v_combo_code) and row_id>v_row_id order by row_id;
        else
            select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco,stock_acco_no,stock_code,stock_code_no,asset_type,stock_type,comm_opor,external_no,comm_id,comm_batch_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,price_type,order_price,order_qty,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,net_price_flag,order_frozen_amt,order_frozen_qty,rsp_info,compli_trig_id,remark_info,order_oper_way,exch_crncy_type,combo_code,combo_posi_id,strategy_id,contra_no,update_times from db_tdsecu.tb_tdsetd_order where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no)  and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_combo_code = " " or combo_code = v_combo_code) and row_id>v_row_id order by row_id limit v_row_count;
        end if;


    /* elseif @排序方式#=2 then */
    elseif v_sort_type=2 then

        /* [获取表记录][交易证券_交易_订单表][{记录序号},{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{市场编号},{股东代码},{股东代码编号},{证券代码},{证券代码编号},{资产类型},{证券类型},{指令下达人},{外部编号},{指令序号},{指令批号},{申报日期},{申报时间},{申报编号},{订单批号},{记录序号} as {订单序号},{订单日期},{订单时间},{订单方向},{价格类型},{订单价格},{订单数量},{订单状态},{撤单数量},{成交金额},{成交数量},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{债券计提利息},{净价标志},{订单冻结金额},{订单冻结数量},{回报信息},{合规触警序号},{备注信息},{订单操作方式},{交易币种},{组合代码},{组合持仓序号},{策略序号},{合同编号},{更新次数}][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单序号#=0 or {记录序号}=@订单序号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@订单状态串#=" " or instr(@订单状态串#, concat(";",{订单状态},";"))>0) and (@价格类型串#=" " or instr(@价格类型串#, concat(";",{价格类型},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and (@组合代码# = " " or {组合代码} = @组合代码#) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco,stock_acco_no,stock_code,stock_code_no,asset_type,stock_type,comm_opor,external_no,comm_id,comm_batch_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,price_type,order_price,order_qty,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,net_price_flag,order_frozen_amt,order_frozen_qty,rsp_info,compli_trig_id,remark_info,order_oper_way,exch_crncy_type,combo_code,combo_posi_id,strategy_id,contra_no,update_times from db_tdsecu.tb_tdsetd_order where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_combo_code = " " or combo_code = v_combo_code) and row_id<v_row_id order by row_id desc;
        else
            select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco,stock_acco_no,stock_code,stock_code_no,asset_type,stock_type,comm_opor,external_no,comm_id,comm_batch_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,price_type,order_price,order_qty,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,net_price_flag,order_frozen_amt,order_frozen_qty,rsp_info,compli_trig_id,remark_info,order_oper_way,exch_crncy_type,combo_code,combo_posi_id,strategy_id,contra_no,update_times from db_tdsecu.tb_tdsetd_order where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_combo_code = " " or combo_code = v_combo_code) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;


    /* elseif @排序方式#=3 then */
    elseif v_sort_type=3 then

        /* [获取表记录][交易证券_交易_订单表][{记录序号},{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{市场编号},{股东代码},{股东代码编号},{证券代码},{证券代码编号},{资产类型},{证券类型},{指令下达人},{外部编号},{指令序号},{指令批号},{申报日期},{申报时间},{申报编号},{订单批号},{记录序号} as {订单序号},{订单日期},{订单时间},{订单方向},{价格类型},{订单价格},{订单数量},{订单状态},{撤单数量},{成交金额},{成交数量},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{债券计提利息},{净价标志},{订单冻结金额},{订单冻结数量},{回报信息},{合规触警序号},{备注信息},{订单操作方式},{交易币种},{组合代码},{组合持仓序号},{策略序号},{合同编号},{更新次数}][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#)  and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单序号#=0 or {记录序号}=@订单序号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@订单状态串#=" " or instr(@订单状态串#, concat(";",{订单状态},";"))>0) and (@价格类型串#=" " or instr(@价格类型串#, concat(";",{价格类型},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and (@组合代码# = " " or {组合代码} = @组合代码#) and {记录序号}>@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco,stock_acco_no,stock_code,stock_code_no,asset_type,stock_type,comm_opor,external_no,comm_id,comm_batch_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,price_type,order_price,order_qty,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,net_price_flag,order_frozen_amt,order_frozen_qty,rsp_info,compli_trig_id,remark_info,order_oper_way,exch_crncy_type,combo_code,combo_posi_id,strategy_id,contra_no,update_times from db_tdsecu.tb_tdsetd_order where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_combo_code = " " or combo_code = v_combo_code) and row_id>v_row_id order by row_id desc;
        else
            select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco,stock_acco_no,stock_code,stock_code_no,asset_type,stock_type,comm_opor,external_no,comm_id,comm_batch_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,price_type,order_price,order_qty,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,net_price_flag,order_frozen_amt,order_frozen_qty,rsp_info,compli_trig_id,remark_info,order_oper_way,exch_crncy_type,combo_code,combo_posi_id,strategy_id,contra_no,update_times from db_tdsecu.tb_tdsetd_order where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_combo_code = " " or combo_code = v_combo_code) and row_id>v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询订单历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryOrder_His;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryOrder_His(
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
    
    #[获取表记录][历史_交易证券_交易_订单表][{记录序号},{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{市场编号},{股东代码编号},{证券代码编号},{资产类型},{证券类型},{指令下达人},{外部编号},{指令序号},{指令批号},{申报日期},{申报时间},{申报编号},{订单批号},{记录序号} as {订单序号},{订单日期},{订单时间},{订单方向},{价格类型},{订单价格},{订单数量},{订单状态},{撤单数量},{成交金额},{成交数量},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{债券计提利息},{净价标志},{订单冻结金额},{订单冻结数量},{回报信息},{合规触警序号},{备注信息},{订单操作方式},{组合代码},{组合持仓序号},{合同编号},{更新次数}][({订单日期} between @开始日期# and @结束日期#) and (@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#)  and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单序号#=0 or {记录序号}=@订单序号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@订单状态串#=" " or instr(@订单状态串#, concat(";",{订单状态},";"))>0) and (@价格类型串#=" " or instr(@价格类型串#, concat(";",{价格类型},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and  (@组合代码# = " " or {组合代码} = @组合代码#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#]

    /* [获取表记录][历史_交易证券_交易_订单表][{记录序号},{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{市场编号},{股东代码编号},{证券代码编号},{资产类型},{证券类型},{指令下达人},{外部编号},{指令序号},{指令批号},{申报日期},{申报时间},{申报编号},{订单批号},{记录序号} as {订单序号},{订单日期},{订单时间},{订单方向},{价格类型},{订单价格},{订单数量},{订单状态},{撤单数量},{成交金额},{成交数量},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{债券计提利息},{净价标志},{订单冻结金额},{订单冻结数量},{回报信息},{合规触警序号},{备注信息},{订单操作方式},{组合代码},{组合持仓序号},{合同编号},{更新次数}][{初始化日期} = @开始日期# and (@机构编号#=0 or {机构编号}=@机构编号#)   and (@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#)  and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单序号#=0 or {记录序号}=@订单序号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@订单状态串#=" " or instr(@订单状态串#, concat(";",{订单状态},";"))>0) and (@价格类型串#=" " or instr(@价格类型串#, concat(";",{价格类型},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and  (@组合代码# = " " or {组合代码} = @组合代码#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_code_no,asset_type,stock_type,comm_opor,external_no,comm_id,comm_batch_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,price_type,order_price,order_qty,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,net_price_flag,order_frozen_amt,order_frozen_qty,rsp_info,compli_trig_id,remark_info,order_oper_way,combo_code,combo_posi_id,contra_no,update_times from db_tdsecu_his.tb_tdsetd_order_his where init_date = v_begin_date and (v_co_no=0 or co_no=v_co_no)   and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and  (v_combo_code = " " or combo_code = v_combo_code) and row_id>v_row_id order by row_id;
    else
        select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_code_no,asset_type,stock_type,comm_opor,external_no,comm_id,comm_batch_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,price_type,order_price,order_qty,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,net_price_flag,order_frozen_amt,order_frozen_qty,rsp_info,compli_trig_id,remark_info,order_oper_way,combo_code,combo_posi_id,contra_no,update_times from db_tdsecu_his.tb_tdsetd_order_his where init_date = v_begin_date and (v_co_no=0 or co_no=v_co_no)   and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and  (v_combo_code = " " or combo_code = v_combo_code) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询订单汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryOrderSum;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryOrderSum(
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
    

    /* [获取表记录][交易证券_交易_订单汇总表][{记录序号},{操作员编号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{证券代码编号},{证券类型},{外部编号},{订单批号},{订单日期},{订单方向},{订单数量},{订单价格},{订单汇总状态},{撤单数量},{废单数量},{成交金额},{成交数量},{全部费用},{交易佣金},{印花税},{过户费},{经手费},{证管费},{其他费用},{其他佣金},{净价标志},{计息天数},{票面面值},{债券计提利息},{债券利率类型},{订单操作方式},{体外指令标志},{交易币种},{更新次数}][({操作员编号}=@操作员编号# or @业务操作员编号# = 0) and ({机构编号}=@操作员机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@订单汇总状态串#=" " or instr(@订单汇总状态串#, concat(";",{订单汇总状态},";"))>0) and {记录序号}>@记录序号# order by {记录序号} asc][@指定行数#] */
    if v_row_count = -1 then
        select row_id,opor_no,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_code_no,stock_type,external_no,order_batch_no,order_date,order_dir,order_qty,order_price,order_sum_status,wtdraw_qty,waste_qty,strike_amt,strike_qty,all_fee,trade_commis,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,other_commis,net_price_flag,intrst_days,par_value,bond_accr_intrst,bond_rate_type,order_oper_way,exter_comm_flag,exch_crncy_type,update_times from db_tdsecu.tb_tdsetd_sumorder where (opor_no=v_opor_no or v_busi_opor_no = 0) and (co_no=v_opor_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_external_no=0 or external_no=v_external_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_sum_status_str=" " or instr(v_order_sum_status_str, concat(";",order_sum_status,";"))>0) and row_id>v_row_id order by row_id asc;
    else
        select row_id,opor_no,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_code_no,stock_type,external_no,order_batch_no,order_date,order_dir,order_qty,order_price,order_sum_status,wtdraw_qty,waste_qty,strike_amt,strike_qty,all_fee,trade_commis,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,other_commis,net_price_flag,intrst_days,par_value,bond_accr_intrst,bond_rate_type,order_oper_way,exter_comm_flag,exch_crncy_type,update_times from db_tdsecu.tb_tdsetd_sumorder where (opor_no=v_opor_no or v_busi_opor_no = 0) and (co_no=v_opor_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_external_no=0 or external_no=v_external_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_sum_status_str=" " or instr(v_order_sum_status_str, concat(";",order_sum_status,";"))>0) and row_id>v_row_id order by row_id asc limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询篮子订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryBasketOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryBasketOrder(
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
    

    /* [获取表记录][交易证券_交易_篮子订单表][字段][{机构编号} = @机构编号# and {记录序号}>@记录序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, basket_id, 
        order_date, order_time, order_batch_no, order_dir, 
        basket_trade_type, basket_trade_amt from db_tdsecu.tb_tdsetd_basketorder where co_no = v_co_no and row_id>v_row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, basket_id, 
        order_date, order_time, order_batch_no, order_dir, 
        basket_trade_type, basket_trade_amt from db_tdsecu.tb_tdsetd_basketorder where co_no = v_co_no and row_id>v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询预埋订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryPreOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryPreOrder(
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
    

    /* [获取表记录][交易证券_交易_预埋订单表][字段][(@机构编号# = 0 or {机构编号} = @机构编号#) and {记录序号}>@记录序号#][@指定行数#] */
    if v_row_count = -1 then
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
        order_no_str, keep_trace from db_tdsecu.tb_tdsetd_preorder where (v_co_no = 0 or co_no = v_co_no) and row_id>v_row_id;
    else
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
        order_no_str, keep_trace from db_tdsecu.tb_tdsetd_preorder where (v_co_no = 0 or co_no = v_co_no) and row_id>v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询改单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryModiOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryModiOrder(
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
    declare v_pass_no int;
    declare v_price_type_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pass_no = 0;
    SET v_price_type_str = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易证券_交易_改单表][字段][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@订单序号#=0 or {记录序号}=@订单序号#) and (@改单批号# = 0 or {改单批号}=@改单批号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@改单状态#=" " or {改单状态} = @改单状态#) and (@价格类型串#=" " or instr(@价格类型串#, concat(";",{价格类型},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            exch_no, stock_acco_no, stock_code_no, stock_code, 
            stock_type, asset_type, modi_order_date, modi_order_time, 
            modi_batch_no, order_id, comm_id, order_price, 
            order_qty, order_dir, order_date, order_time, 
            price_type, modi_order_price, modi_order_qty, modi_order_status, 
            modi_price_type, crncy_type, exch_crncy_type, new_order_id, 
            remark_info, order_oper_way from db_tdsecu.tb_tdsetd_modifyorder where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_id=0 or comm_id=v_comm_id) and (v_order_id=0 or row_id=v_order_id) and (v_modi_batch_no = 0 or modi_batch_no=v_modi_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_modi_order_status=" " or modi_order_status = v_modi_order_status) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            exch_no, stock_acco_no, stock_code_no, stock_code, 
            stock_type, asset_type, modi_order_date, modi_order_time, 
            modi_batch_no, order_id, comm_id, order_price, 
            order_qty, order_dir, order_date, order_time, 
            price_type, modi_order_price, modi_order_qty, modi_order_status, 
            modi_price_type, crncy_type, exch_crncy_type, new_order_id, 
            remark_info, order_oper_way from db_tdsecu.tb_tdsetd_modifyorder where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_id=0 or comm_id=v_comm_id) and (v_order_id=0 or row_id=v_order_id) and (v_modi_batch_no = 0 or modi_batch_no=v_modi_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_modi_order_status=" " or modi_order_status = v_modi_order_status) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易证券_交易_改单表][字段][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@订单序号#=0 or {记录序号}=@订单序号#) and (@改单批号# = 0 or {改单批号}=@改单批号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@改单状态#=" " or {改单状态} = @改单状态#) and (@价格类型串#=" " or instr(@价格类型串#, concat(";",{价格类型},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            exch_no, stock_acco_no, stock_code_no, stock_code, 
            stock_type, asset_type, modi_order_date, modi_order_time, 
            modi_batch_no, order_id, comm_id, order_price, 
            order_qty, order_dir, order_date, order_time, 
            price_type, modi_order_price, modi_order_qty, modi_order_status, 
            modi_price_type, crncy_type, exch_crncy_type, new_order_id, 
            remark_info, order_oper_way from db_tdsecu.tb_tdsetd_modifyorder where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_id=0 or comm_id=v_comm_id) and (v_order_id=0 or row_id=v_order_id) and (v_modi_batch_no = 0 or modi_batch_no=v_modi_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_modi_order_status=" " or modi_order_status = v_modi_order_status) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and row_id<v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            exch_no, stock_acco_no, stock_code_no, stock_code, 
            stock_type, asset_type, modi_order_date, modi_order_time, 
            modi_batch_no, order_id, comm_id, order_price, 
            order_qty, order_dir, order_date, order_time, 
            price_type, modi_order_price, modi_order_qty, modi_order_status, 
            modi_price_type, crncy_type, exch_crncy_type, new_order_id, 
            remark_info, order_oper_way from db_tdsecu.tb_tdsetd_modifyorder where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_id=0 or comm_id=v_comm_id) and (v_order_id=0 or row_id=v_order_id) and (v_modi_batch_no = 0 or modi_batch_no=v_modi_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_modi_order_status=" " or modi_order_status = v_modi_order_status) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询改单历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryModiOrder_His;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryModiOrder_His(
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
    declare v_pass_no int;
    declare v_price_type_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pass_no = 0;
    SET v_price_type_str = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

      /* [获取表记录][历史_交易证券_交易_改单表][字段][({订单日期} between @开始日期# and @结束日期#) and (@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@订单序号#=0 or {记录序号}=@订单序号#) and (@改单批号# = 0 or {改单批号}=@改单批号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@改单状态#=" " or {改单状态} = @改单状态#) and (@价格类型串#=" " or instr(@价格类型串#, concat(";",{价格类型},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
      if v_row_count = -1 then
          select row_id, create_date, create_time, 
          update_date, update_time, update_times, opor_co_no, 
          opor_no, oper_mac, oper_ip_addr, oper_info, 
          oper_way, oper_func_code, init_date, co_no, 
          pd_no, exch_group_no, asset_acco_no, pass_no, 
          exch_no, stock_acco_no, stock_code_no, stock_code, 
          stock_type, asset_type, modi_order_date, modi_order_time, 
          modi_batch_no, order_id, comm_id, order_price, 
          order_qty, order_dir, order_date, order_time, 
          price_type, modi_order_price, modi_order_qty, modi_order_status, 
          modi_price_type, crncy_type, exch_crncy_type, new_order_id, 
          remark_info, order_oper_way from db_tdsecu_his.tb_tdsetd_modifyorder_his where (order_date between v_begin_date and v_end_date) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_id=0 or comm_id=v_comm_id) and (v_order_id=0 or row_id=v_order_id) and (v_modi_batch_no = 0 or modi_batch_no=v_modi_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_modi_order_status=" " or modi_order_status = v_modi_order_status) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and row_id>v_row_id order by row_id;
      else
          select row_id, create_date, create_time, 
          update_date, update_time, update_times, opor_co_no, 
          opor_no, oper_mac, oper_ip_addr, oper_info, 
          oper_way, oper_func_code, init_date, co_no, 
          pd_no, exch_group_no, asset_acco_no, pass_no, 
          exch_no, stock_acco_no, stock_code_no, stock_code, 
          stock_type, asset_type, modi_order_date, modi_order_time, 
          modi_batch_no, order_id, comm_id, order_price, 
          order_qty, order_dir, order_date, order_time, 
          price_type, modi_order_price, modi_order_qty, modi_order_status, 
          modi_price_type, crncy_type, exch_crncy_type, new_order_id, 
          remark_info, order_oper_way from db_tdsecu_his.tb_tdsetd_modifyorder_his where (order_date between v_begin_date and v_end_date) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_id=0 or comm_id=v_comm_id) and (v_order_id=0 or row_id=v_order_id) and (v_modi_batch_no = 0 or modi_batch_no=v_modi_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_modi_order_status=" " or modi_order_status = v_modi_order_status) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
      end if;

    else

      /* [获取表记录][历史_交易证券_交易_改单表][字段][({订单日期} between @开始日期# and @结束日期#) and (@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@订单序号#=0 or {记录序号}=@订单序号#) and (@改单批号# = 0 or {改单批号}=@改单批号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@改单状态#=" " or {改单状态} = @改单状态#) and (@价格类型串#=" " or instr(@价格类型串#, concat(";",{价格类型},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
      if v_row_count = -1 then
          select row_id, create_date, create_time, 
          update_date, update_time, update_times, opor_co_no, 
          opor_no, oper_mac, oper_ip_addr, oper_info, 
          oper_way, oper_func_code, init_date, co_no, 
          pd_no, exch_group_no, asset_acco_no, pass_no, 
          exch_no, stock_acco_no, stock_code_no, stock_code, 
          stock_type, asset_type, modi_order_date, modi_order_time, 
          modi_batch_no, order_id, comm_id, order_price, 
          order_qty, order_dir, order_date, order_time, 
          price_type, modi_order_price, modi_order_qty, modi_order_status, 
          modi_price_type, crncy_type, exch_crncy_type, new_order_id, 
          remark_info, order_oper_way from db_tdsecu_his.tb_tdsetd_modifyorder_his where (order_date between v_begin_date and v_end_date) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_id=0 or comm_id=v_comm_id) and (v_order_id=0 or row_id=v_order_id) and (v_modi_batch_no = 0 or modi_batch_no=v_modi_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_modi_order_status=" " or modi_order_status = v_modi_order_status) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and row_id<v_row_id order by row_id desc;
      else
          select row_id, create_date, create_time, 
          update_date, update_time, update_times, opor_co_no, 
          opor_no, oper_mac, oper_ip_addr, oper_info, 
          oper_way, oper_func_code, init_date, co_no, 
          pd_no, exch_group_no, asset_acco_no, pass_no, 
          exch_no, stock_acco_no, stock_code_no, stock_code, 
          stock_type, asset_type, modi_order_date, modi_order_time, 
          modi_batch_no, order_id, comm_id, order_price, 
          order_qty, order_dir, order_date, order_time, 
          price_type, modi_order_price, modi_order_qty, modi_order_status, 
          modi_price_type, crncy_type, exch_crncy_type, new_order_id, 
          remark_info, order_oper_way from db_tdsecu_his.tb_tdsetd_modifyorder_his where (order_date between v_begin_date and v_end_date) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_id=0 or comm_id=v_comm_id) and (v_order_id=0 or row_id=v_order_id) and (v_modi_batch_no = 0 or modi_batch_no=v_modi_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_modi_order_status=" " or modi_order_status = v_modi_order_status) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and row_id<v_row_id order by row_id desc limit v_row_count;
      end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询未成交代码列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryUnStrikeStockList;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryUnStrikeStockList(
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
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][交易证券_交易_订单表][distinct {证券代码},{市场编号},{证券代码编号}][{订单日期} = @初始化日期# and {订单状态} in (《订单状态-正报》,《订单状态-已报》,《订单状态-部成》,《订单状态-待撤》)][@指定行数#] */
    if v_row_count = -1 then
        select distinct stock_code,exch_no,stock_code_no from db_tdsecu.tb_tdsetd_order where order_date = v_init_date and order_status in ("b","2","5","3");
    else
        select distinct stock_code,exch_no,stock_code_no from db_tdsecu.tb_tdsetd_order where order_date = v_init_date and order_status in ("b","2","5","3") limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_证券行情检查账户成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QuotCheckAccoStrike;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QuotCheckAccoStrike(
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
    

    /* SELECT DISTINCT {机构编号}, {通道编号},{交易组编号},{外部账号},{资产账户编号},3 AS {报盘操作方式} FROM ~交易证券_交易_订单表^ WHERE {证券代码}=@证券代码# AND {市场编号}=@市场编号# and {订单状态} IN(《订单状态-待撤》,《订单状态-已报》,《订单状态-部成》,《订单状态-待撤》) AND (({订单方向} IN(《订单方向-买入》,《订单方向-融资回购》) AND  {订单价格} >= @最新价#) OR  ({订单方向} IN(《订单方向-卖出》,《订单方向-融券回购》) AND {订单价格} <= @最新价#)); */
    SELECT DISTINCT co_no, pass_no,exch_group_no,out_acco,asset_acco_no,3 AS offer_oper_way FROM db_tdsecu.tb_tdsetd_order WHERE stock_code=v_stock_code AND exch_no=v_exch_no and order_status IN("3","2","5","3") AND ((order_dir IN(1,3) AND  order_price >= v_last_price) OR  (order_dir IN(2,4) AND order_price <= v_last_price));
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询订单汇总历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryOrderSum_His;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryOrderSum_His(
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
    

    /* [获取表记录][历史_交易证券_交易_订单汇总表][{记录序号},{操作员编号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{证券代码编号},{证券类型},{外部编号},{订单批号},{订单日期},{订单方向},{订单数量},{订单价格},{订单汇总状态},{撤单数量},{废单数量},{成交金额},{成交数量},{全部费用},{交易佣金},{印花税},{过户费},{经手费},{证管费},{其他费用},{其他佣金},{净价标志},{计息天数},{票面面值},{债券计提利息},{债券利率类型},{订单操作方式},{体外指令标志},{更新次数}][({操作员编号}=@操作员编号#) and ({机构编号}=@操作员机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@外部编号#=0 or {外部编号}=@外部编号#) and ({初始化日期} between @开始日期# and @结束日期#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@订单汇总状态串#=" " or instr(@订单汇总状态串#, concat(";",{订单汇总状态},";"))>0) and {记录序号}>@记录序号# order by {记录序号} asc][@指定行数#] */
    if v_row_count = -1 then
        select row_id,opor_no,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_code_no,stock_type,external_no,order_batch_no,order_date,order_dir,order_qty,order_price,order_sum_status,wtdraw_qty,waste_qty,strike_amt,strike_qty,all_fee,trade_commis,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,other_commis,net_price_flag,intrst_days,par_value,bond_accr_intrst,bond_rate_type,order_oper_way,exter_comm_flag,update_times from db_tdsecu_his.tb_tdsetd_sumorder_his where (opor_no=v_opor_no) and (co_no=v_opor_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_external_no=0 or external_no=v_external_no) and (init_date between v_begin_date and v_end_date) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_sum_status_str=" " or instr(v_order_sum_status_str, concat(";",order_sum_status,";"))>0) and row_id>v_row_id order by row_id asc;
    else
        select row_id,opor_no,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_code_no,stock_type,external_no,order_batch_no,order_date,order_dir,order_qty,order_price,order_sum_status,wtdraw_qty,waste_qty,strike_amt,strike_qty,all_fee,trade_commis,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,other_commis,net_price_flag,intrst_days,par_value,bond_accr_intrst,bond_rate_type,order_oper_way,exter_comm_flag,update_times from db_tdsecu_his.tb_tdsetd_sumorder_his where (opor_no=v_opor_no) and (co_no=v_opor_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_external_no=0 or external_no=v_external_no) and (init_date between v_begin_date and v_end_date) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_sum_status_str=" " or instr(v_order_sum_status_str, concat(";",order_sum_status,";"))>0) and row_id>v_row_id order by row_id asc limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询待执行订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryPendOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryPendOrder(
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
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易证券_交易_待执行订单表][{记录序号},{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{市场编号},{股东代码编号},{证券代码编号},{资产类型},{证券类型},{指令序号},{订单批号},{指令批号},{订单日期},{订单时间},{订单方向},{价格类型},{执行价格类型},{价格偏移量},{订单数量},{债券计提利息},{净价标志},{订单操作方式},{待执行订单状态},{备注信息},{创建日期},{创建时间},{更新次数},{外部编号}][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#)  and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@订单批号#=0 or {订单批号}=@订单批号#)  and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@价格类型串#=" " or instr(@价格类型串#, concat(";",{价格类型},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_code_no,asset_type,stock_type,comm_id,order_batch_no,comm_batch_no,order_date,order_time,order_dir,price_type,exec_price_type,price_offset,order_qty,bond_accr_intrst,net_price_flag,order_oper_way,pend_order_status,remark_info,create_date,create_time,update_times,external_no from db_tdsecu.tb_tdsetd_pendorder where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no)  and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no)  and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
        else
            select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_code_no,asset_type,stock_type,comm_id,order_batch_no,comm_batch_no,order_date,order_time,order_dir,price_type,exec_price_type,price_offset,order_qty,bond_accr_intrst,net_price_flag,order_oper_way,pend_order_status,remark_info,create_date,create_time,update_times,external_no from db_tdsecu.tb_tdsetd_pendorder where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no)  and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no)  and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易证券_交易_待执行订单表][{记录序号},{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{市场编号},{股东代码编号},{证券代码编号},{资产类型},{证券类型},{指令序号},{订单批号},{指令批号},{订单日期},{订单时间},{订单方向},{价格类型},{执行价格类型},{价格偏移量},{订单数量},{债券计提利息},{净价标志},{订单操作方式},{待执行订单状态},{备注信息},{创建日期},{创建时间},{更新次数},{外部编号}][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@价格类型串#=" " or instr(@价格类型串#, concat(";",{价格类型},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_code_no,asset_type,stock_type,comm_id,order_batch_no,comm_batch_no,order_date,order_time,order_dir,price_type,exec_price_type,price_offset,order_qty,bond_accr_intrst,net_price_flag,order_oper_way,pend_order_status,remark_info,create_date,create_time,update_times,external_no from db_tdsecu.tb_tdsetd_pendorder where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id<v_row_id order by row_id desc;
        else
            select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_code_no,asset_type,stock_type,comm_id,order_batch_no,comm_batch_no,order_date,order_time,order_dir,price_type,exec_price_type,price_offset,order_qty,bond_accr_intrst,net_price_flag,order_oper_way,pend_order_status,remark_info,create_date,create_time,update_times,external_no from db_tdsecu.tb_tdsetd_pendorder where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询待执行订单历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryPendOrder_His;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryPendOrder_His(
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
    declare v_busi_opor_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_busi_opor_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_交易证券_交易_待执行订单表][{记录序号},{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{市场编号},{股东代码编号},{证券代码编号},{资产类型},{证券类型},{指令序号},{指令批号},{订单批号},{订单日期},{订单时间},{订单方向},{价格类型},{执行价格类型},{价格偏移量},{订单数量},{债券计提利息},{净价标志},{订单操作方式},{待执行订单状态},{备注信息},{创建日期},{创建时间},{更新次数},{外部编号}][({订单日期} between @开始日期# and @结束日期#) and (@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#)  and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@价格类型串#=" " or instr(@价格类型串#, concat(";",{价格类型},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_code_no,asset_type,stock_type,comm_id,comm_batch_no,order_batch_no,order_date,order_time,order_dir,price_type,exec_price_type,price_offset,order_qty,bond_accr_intrst,net_price_flag,order_oper_way,pend_order_status,remark_info,create_date,create_time,update_times,external_no from db_tdsecu_his.tb_tdsetd_pendorder_his where (order_date between v_begin_date and v_end_date) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no)  and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
    else
        select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_code_no,asset_type,stock_type,comm_id,comm_batch_no,order_batch_no,order_date,order_time,order_dir,price_type,exec_price_type,price_offset,order_qty,bond_accr_intrst,net_price_flag,order_oper_way,pend_order_status,remark_info,create_date,create_time,update_times,external_no from db_tdsecu_his.tb_tdsetd_pendorder_his where (order_date between v_begin_date and v_end_date) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no)  and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询订单记录数
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryOrderCount;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryOrderCount(
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
    

    /* [获取表记录数量][交易证券_交易_订单表][@订单记录数#][(@初始化日期#=0 or {初始化日期}=@初始化日期#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#)  and (@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@订单状态串#=" " or instr(@订单状态串#, concat(";",{订单状态},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) ] */
    select count(1) into v_order_count from db_tdsecu.tb_tdsetd_order where (v_init_date=0 or init_date=v_init_date) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no)  and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) ;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_count = v_order_count;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询交易组订单记录数
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryExgpOrderCount;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryExgpOrderCount(
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
    declare v_tmp_record_count int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_tmp_record_count = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数#=0; */
    set v_record_count=0;

    /* set @临时_记录个数#=0; */
    set v_tmp_record_count=0;

    /* [获取表记录数量][交易证券_交易_订单表][@记录个数#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {交易组编号} = @交易组编号# and ({订单状态} <> 《订单状态-废单》and {订单状态} <> 《订单状态-已撤》 and {订单状态} <> 《订单状态-审批拒绝》 and {订单状态} <> 《订单状态-已回溯》)] */
    select count(1) into v_record_count from db_tdsecu.tb_tdsetd_order where co_no = v_co_no and pd_no = v_pd_no and exch_group_no = v_exch_group_no and (order_status <> "8"and order_status <> "4" and order_status <> "-2" and order_status <> "9");


     /* select count(1) into @临时_记录个数# from ~交易证券_指令_指令表^ where {机构编号} = @机构编号# and {产品编号} = @产品编号# and {交易组编号} = @交易组编号# and {指令状态} <>《指令状态-全部撤销》; */
     select count(1) into v_tmp_record_count from db_tdsecu.tb_tdseap_command where co_no = v_co_no and pd_no = v_pd_no and exch_group_no = v_exch_group_no and comm_status <>"6";
    #[获取表记录数量][交易证券_指令_指令表][@临时_记录个数#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {交易组编号} = @交易组编号# and {指令状态} <>《指令状态-全部撤销》]

    /* set @记录个数# = @记录个数# +@临时_记录个数#; */
    set v_record_count = v_record_count +v_tmp_record_count;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_指令端证券业务合规判断
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_CheckCommSecuRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_CheckCommSecuRisk(
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
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_compli_trig_id = v_compli_trig_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_交易端证券业务合规判断
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_CheckExchSecuRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_CheckExchSecuRisk(
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
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_compli_trig_id = v_compli_trig_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_测试
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_Test;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_Test(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    IN p_order_qty decimal(18,2),
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [执行语句]["insert into debug values ('测试函数',NOW(6))"] */
    set @tmp_sql = "insert into debug values ('测试函数',NOW(6))";
    PREPARE stmt from @tmp_sql;
    EXECUTE stmt;
    set @tmp_sql = '';
    DEALLOCATE PREPARE stmt;


    /* insert into debug values(@查询记录序号#,NOW(6)); */
    insert into debug values(v_query_row_id,NOW(6));

    /* insert into debug values(@订单数量#,NOW(6)); */
    insert into debug values(v_order_qty,NOW(6));
    commit;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询组合交易流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryComboTradeLog;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryComboTradeLog(
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
    declare v_busi_opor_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_busi_opor_no = 0;

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易证券_交易_组合交易流水记录表][字段][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#)  and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and  (@组合代码# = " " or {组合代码} = @组合代码#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            combo_code, order_batch_no, order_dir, combo_copies, 
            combo_date, combo_time from db_tdsecu.tb_tdsetd_combotradelog where (v_busi_opor_no=0 or opor_no=v_busi_opor_no)  and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and  (v_combo_code = " " or combo_code = v_combo_code) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            combo_code, order_batch_no, order_dir, combo_copies, 
            combo_date, combo_time from db_tdsecu.tb_tdsetd_combotradelog where (v_busi_opor_no=0 or opor_no=v_busi_opor_no)  and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and  (v_combo_code = " " or combo_code = v_combo_code) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易证券_交易_组合交易流水记录表][字段][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#)  and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and  (@组合代码# = " " or {组合代码} = @组合代码#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            combo_code, order_batch_no, order_dir, combo_copies, 
            combo_date, combo_time from db_tdsecu.tb_tdsetd_combotradelog where (v_busi_opor_no=0 or opor_no=v_busi_opor_no)  and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and  (v_combo_code = " " or combo_code = v_combo_code) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            combo_code, order_batch_no, order_dir, combo_copies, 
            combo_date, combo_time from db_tdsecu.tb_tdsetd_combotradelog where (v_busi_opor_no=0 or opor_no=v_busi_opor_no)  and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and  (v_combo_code = " " or combo_code = v_combo_code) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询历史组合交易流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryHisComboTradeLog;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryHisComboTradeLog(
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
    declare v_busi_opor_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_busi_opor_no = 0;

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][历史_交易证券_交易_组合交易流水记录表][字段][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#)  and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and  (@组合代码# = " " or {组合代码} = @组合代码#)  and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            combo_code, order_batch_no, order_dir, combo_copies, 
            combo_date, combo_time from db_tdsecu_his.tb_tdsetd_combotradelog_his where (v_busi_opor_no=0 or opor_no=v_busi_opor_no)  and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and  (v_combo_code = " " or combo_code = v_combo_code)  and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            combo_code, order_batch_no, order_dir, combo_copies, 
            combo_date, combo_time from db_tdsecu_his.tb_tdsetd_combotradelog_his where (v_busi_opor_no=0 or opor_no=v_busi_opor_no)  and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and  (v_combo_code = " " or combo_code = v_combo_code)  and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][历史_交易证券_交易_组合交易流水记录表][字段][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#)  and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and  (@组合代码# = " " or {组合代码} = @组合代码#)  and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            combo_code, order_batch_no, order_dir, combo_copies, 
            combo_date, combo_time from db_tdsecu_his.tb_tdsetd_combotradelog_his where (v_busi_opor_no=0 or opor_no=v_busi_opor_no)  and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and  (v_combo_code = " " or combo_code = v_combo_code)  and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            combo_code, order_batch_no, order_dir, combo_copies, 
            combo_date, combo_time from db_tdsecu_his.tb_tdsetd_combotradelog_his where (v_busi_opor_no=0 or opor_no=v_busi_opor_no)  and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and  (v_combo_code = " " or combo_code = v_combo_code)  and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_导入订单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_ImportAppeOrderTable;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_ImportAppeOrderTable(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_comm_opor int,
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
    IN p_external_no bigint,
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_batch_no int,
    IN p_order_date int,
    IN p_order_dir int,
    IN p_price_type int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_order_status varchar(2),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_frozen_amt decimal(18,4),
    IN p_order_frozen_qty decimal(18,2),
    IN p_net_price_flag int,
    IN p_intrst_days int,
    IN p_par_value decimal(16,9),
    IN p_impawn_ratio decimal(18,12),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_compli_trig_id bigint,
    IN p_remark_info varchar(255),
    IN p_order_oper_way varchar(2),
    IN p_exter_comm_flag int,
    IN p_cost_calc_type int,
    IN p_combo_code varchar(32),
    IN p_combo_posi_id bigint,
    IN p_target_stock_code varchar(6),
    IN p_target_stock_code_no int,
    IN p_registration_agency varchar(32),
    IN p_trade_acco varchar(32),
    IN p_asset_acco_type int,
    IN p_contra_no varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_id bigint,
    OUT p_order_time int,
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
    declare v_comm_opor int;
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
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_batch_no int;
    declare v_order_date int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_cost_calc_type int;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_asset_acco_type int;
    declare v_contra_no varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_id bigint;
    declare v_order_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_rsp_info varchar(255);
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
    declare v_nav_asset decimal(18,4);
    declare v_sett_flag int;
    declare v_record_valid_flag int;
    declare v_record_count int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_strategy_id bigint;
    declare v_exist_debt_flag int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_comm_opor = p_comm_opor;
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
    SET v_external_no = p_external_no;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_date = p_order_date;
    SET v_order_dir = p_order_dir;
    SET v_price_type = p_price_type;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_order_status = p_order_status;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_order_frozen_qty = p_order_frozen_qty;
    SET v_net_price_flag = p_net_price_flag;
    SET v_intrst_days = p_intrst_days;
    SET v_par_value = p_par_value;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_remark_info = p_remark_info;
    SET v_order_oper_way = p_order_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_combo_code = p_combo_code;
    SET v_combo_posi_id = p_combo_posi_id;
    SET v_target_stock_code = p_target_stock_code;
    SET v_target_stock_code_no = p_target_stock_code_no;
    SET v_registration_agency = p_registration_agency;
    SET v_trade_acco = p_trade_acco;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_contra_no = p_contra_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_id = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_rsp_info = " ";
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
    SET v_nav_asset = 0;
    SET v_sett_flag = 0;
    SET v_record_valid_flag = 0;
    SET v_record_count = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_strategy_id = 0;
    SET v_exist_debt_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器时间][@订单时间#] */
    select date_format(curtime(),'%H%i%s') into v_order_time;


    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @回报信息# = " "; */
    set v_rsp_info = " ";

    /* set @全部费用# = 0; */
    set v_all_fee = 0;

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

    /* set @交易佣金# = 0; */
    set v_trade_commis = 0;

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

    /* set @净资产# = 0; */
    set v_nav_asset = 0;
    #导入订单表 不影响清算 modify by wjp20181015

    /* set @清算结算标志# = 《清算结算标志-已处理》; */
    set v_sett_flag = 1;

    /* set @记录有效标志# =《记录有效标志-有效》; */
    set v_record_valid_flag =1;

    /* if @体外指令标志# = 0 then */
    if v_exter_comm_flag = 0 then

        /* set @体外指令标志# = 《体外指令标志-体内》; */
        set v_exter_comm_flag = 1;
    end if;
    #如果是新股申购，需先插入新股申购表，以避免重复申购

    /* if @订单方向# = 《订单方向-新股申购》 or @订单方向# = 《订单方向-配售申购》  then */
    if v_order_dir = 11 or v_order_dir = 23  then

        /* [记录已存在][交易证券_交易_订单表][@记录个数#][{股东代码编号} = @股东代码编号# and {证券代码编号}= @证券代码编号# and {订单状态} in ('1','a','b','2')][720][@股东代码编号#,@证券代码编号#] */
        select count(1) into v_record_count from db_tdsecu.tb_tdsetd_order where stock_acco_no = v_stock_acco_no and stock_code_no= v_stock_code_no and order_status in ('1','a','b','2') limit 1;
        if v_record_count > 0 then
                    
            SET v_error_code = "tdsecuA.4.121.720";
            SET v_error_info = concat("股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
            leave label_pro;
        end if;

    end if;

    /* [获取表记录数量][交易证券_交易_订单表][@记录个数#][{通道编号}=@通道编号# and {外部账号}=@外部账号# and {申报编号}=@申报编号#] */
    select count(1) into v_record_count from db_tdsecu.tb_tdsetd_order where pass_no=v_pass_no and out_acco=v_out_acco and report_no=v_report_no;


    /* [检查报错返回][@记录个数# <> 0][1][concat(@通道编号#,@外部账号#,@申报编号#,"导入订单数据不能重复！")] */
    if v_record_count <> 0 then
        
        SET v_error_code = "tdsecuA.4.121.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat(v_pass_no,v_out_acco,v_report_no,"导入订单数据不能重复！"),"#",v_mysql_message);
        else
            SET v_error_info = concat(v_pass_no,v_out_acco,v_report_no,"导入订单数据不能重复！");
        end if;
        leave label_pro;
    end if;


    /* set @撤单数量# = 0; */
    set v_wtdraw_qty = 0;

    /* set @成交金额# = 0; */
    set v_strike_amt = 0;

    /* set @成交数量# = 0; */
    set v_strike_qty = 0;

    /* set @成交债券计提利息# = 0; */
    set v_strike_bond_accr_intrst = 0;

    /* set @策略序号# = 0; */
    set v_strategy_id = 0;

    /* set @存在负债标志# = 《存在负债标志-不存在》; */
    set v_exist_debt_flag = 1;

    /* [插入表记录][交易证券_交易_订单表][字段][字段变量][1][@订单日期#,@订单批号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsetd_order(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, co_no, pd_no, 
        exch_group_no, asset_acco_no, pass_no, out_acco, 
        exch_crncy_type, exch_no, stock_acco_no, stock_acco, 
        stock_code_no, stock_code, trade_code_no, target_code_no, 
        stock_type, asset_type, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_date, order_time, order_batch_no, 
        order_dir, price_type, order_price, order_qty, 
        order_status, wtdraw_qty, strike_amt, strike_qty, 
        all_fee, stamp_tax, trans_fee, brkage_fee, 
        SEC_charges, other_fee, trade_commis, other_commis, 
        trade_tax, trade_cost_fee, trade_system_use_fee, stock_settle_fee, 
        net_price_flag, intrst_days, par_value, bond_accr_intrst, 
        bond_rate_type, strike_bond_accr_intrst, impawn_ratio, order_frozen_amt, 
        order_frozen_qty, rsp_info, compli_trig_id, remark_info, 
        cost_calc_type, order_oper_way, exter_comm_flag, record_valid_flag, 
        combo_code, combo_posi_id, strategy_id, sett_flag, 
        target_stock_code, target_stock_code_no, registration_agency, trade_acco, 
        contra_no, asset_acco_type, exist_debt_flag) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_exch_crncy_type, v_exch_no, v_stock_acco_no, v_stock_acco, 
        v_stock_code_no, v_stock_code, v_trade_code_no, v_target_code_no, 
        v_stock_type, v_asset_type, v_external_no, v_comm_id, 
        v_comm_batch_no, v_comm_opor, v_report_date, v_report_time, 
        v_report_no, v_order_date, v_order_time, v_order_batch_no, 
        v_order_dir, v_price_type, v_order_price, v_order_qty, 
        v_order_status, v_wtdraw_qty, v_strike_amt, v_strike_qty, 
        v_all_fee, v_stamp_tax, v_trans_fee, v_brkage_fee, 
        v_SEC_charges, v_other_fee, v_trade_commis, v_other_commis, 
        v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, v_stock_settle_fee, 
        v_net_price_flag, v_intrst_days, v_par_value, v_bond_accr_intrst, 
        v_bond_rate_type, v_strike_bond_accr_intrst, v_impawn_ratio, v_order_frozen_amt, 
        v_order_frozen_qty, v_rsp_info, v_compli_trig_id, v_remark_info, 
        v_cost_calc_type, v_order_oper_way, v_exter_comm_flag, v_record_valid_flag, 
        v_combo_code, v_combo_posi_id, v_strategy_id, v_sett_flag, 
        v_target_stock_code, v_target_stock_code_no, v_registration_agency, v_trade_acco, 
        v_contra_no, v_asset_acco_type, v_exist_debt_flag);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.121.1";
        SET v_error_info =  CONCAT(concat("订单日期=",v_order_date,",","订单批号=",v_order_batch_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@订单序号#] */
    select LAST_INSERT_ID() into v_order_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_id = v_order_id;
    SET p_order_time = v_order_time;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询资产账户订单记录数
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryAsacOrderCount;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryAsacOrderCount(
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
    declare v_tmp_record_count int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_tmp_record_count = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数#=0; */
    set v_record_count=0;

    /* set @临时_记录个数#=0; */
    set v_tmp_record_count=0;

    /* [获取表记录数量][交易证券_交易_订单表][@记录个数#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {资产账户编号} = @资产账户编号# and ({订单状态} <> 《订单状态-废单》and {订单状态} <> 《订单状态-已撤》 and {订单状态} <> 《订单状态-审批拒绝》and {订单状态} <> 《订单状态-已回溯》)] */
    select count(1) into v_record_count from db_tdsecu.tb_tdsetd_order where co_no = v_co_no and pd_no = v_pd_no and asset_acco_no = v_asset_acco_no and (order_status <> "8"and order_status <> "4" and order_status <> "-2"and order_status <> "9");


     /* select count(1) into @临时_记录个数# from ~交易证券_指令_指令表^ where {机构编号} = @机构编号# and {产品编号} = @产品编号# and {资产账户编号} = @资产账户编号# and {指令状态} <>《指令状态-全部撤销》; */
     select count(1) into v_tmp_record_count from db_tdsecu.tb_tdseap_command where co_no = v_co_no and pd_no = v_pd_no and asset_acco_no = v_asset_acco_no and comm_status <>"6";
    #[获取表记录数量][交易证券_指令_指令表][@临时_记录个数#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {资产账户编号} = @资产账户编号# and {指令状态} <>《指令状态-全部撤销》]

    /* set @记录个数# = @记录个数# +@临时_记录个数#; */
    set v_record_count = v_record_count +v_tmp_record_count;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询产品订单记录数
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryProdOrderCount;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryProdOrderCount(
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
    declare v_tmp_record_count int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_tmp_record_count = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数#=0; */
    set v_record_count=0;

    /* set @临时_记录个数#=0; */
    set v_tmp_record_count=0;

    /* [获取表记录数量][交易证券_交易_订单表][@记录个数#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and ({订单状态} <> 《订单状态-废单》and {订单状态} <> 《订单状态-已撤》 and {订单状态} <> 《订单状态-审批拒绝》and {订单状态} <> 《订单状态-已回溯》)] */
    select count(1) into v_record_count from db_tdsecu.tb_tdsetd_order where co_no = v_co_no and pd_no = v_pd_no and (order_status <> "8"and order_status <> "4" and order_status <> "-2"and order_status <> "9");


     /* select count(1) into @临时_记录个数# from ~交易证券_指令_指令表^ where {机构编号} = @机构编号# and {产品编号} = @产品编号# and {指令状态} <>《指令状态-全部撤销》; */
     select count(1) into v_tmp_record_count from db_tdsecu.tb_tdseap_command where co_no = v_co_no and pd_no = v_pd_no and comm_status <>"6";
    #[获取表记录数量][交易证券_指令_指令表][@临时_记录个数#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {指令状态} <>《指令状态-全部撤销》]

    /* set @记录个数# = @记录个数# +@临时_记录个数#; */
    set v_record_count = v_record_count +v_tmp_record_count;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询资产账户下交易组订单记录数
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryAsacExgpOrderCount;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryAsacExgpOrderCount(
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
    declare v_tmp_record_count int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_tmp_record_count = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数#=0; */
    set v_record_count=0;

    /* set @临时_记录个数#=0; */
    set v_tmp_record_count=0;
    #[获取表记录数量][交易证券_交易_订单表][@记录个数#][{资产账户编号} = @资产账户编号# and {产品编号} = @产品编号# and {交易组编号} = @交易组编号# and ({订单状态} <> 《订单状态-废单》and {订单状态} <> 《订单状态-已撤》 and {订单状态} <> 《订单状态-审批拒绝》 and {订单状态} <> 《订单状态-已回溯》)]

     /* select count(1) into @记录个数# from ~交易证券_交易_订单表^ where {资产账户编号} = @资产账户编号# and {产品编号} = @产品编号# and {交易组编号} = @交易组编号# and ({订单状态} <> 《订单状态-废单》and {订单状态} <> 《订单状态-已撤》 and {订单状态} <> 《订单状态-审批拒绝》 and {订单状态} <> 《订单状态-已回溯》); */
     select count(1) into v_record_count from db_tdsecu.tb_tdsetd_order where asset_acco_no = v_asset_acco_no and pd_no = v_pd_no and exch_group_no = v_exch_group_no and (order_status <> "8"and order_status <> "4" and order_status <> "-2" and order_status <> "9");

     /* select count(1) into @临时_记录个数# from ~交易证券_指令_指令表^ where {资产账户编号} = @资产账户编号# and {产品编号} = @产品编号# and {交易组编号} = @交易组编号# and {指令状态} <>《指令状态-全部撤销》; */
     select count(1) into v_tmp_record_count from db_tdsecu.tb_tdseap_command where asset_acco_no = v_asset_acco_no and pd_no = v_pd_no and exch_group_no = v_exch_group_no and comm_status <>"6";

    /* set @记录个数# = @记录个数# +@临时_记录个数#; */
    set v_record_count = v_record_count +v_tmp_record_count;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询部分订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryPartOrderInf;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryPartOrderInf(
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
    OUT p_stock_code varchar(6),
    OUT p_stock_acco varchar(16),
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
    declare v_stock_code varchar(6);
    declare v_stock_acco varchar(16);
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
    SET v_stock_code = " ";
    SET v_stock_acco = " ";
    SET v_row_id = 0;
    SET v_order_dir = 0;

    
    label_pro:BEGIN
    
        select pass_no,stock_code,stock_acco,order_dir,row_id into v_pass_no ,v_stock_code,v_stock_acco,v_order_dir,v_row_id from  db_tdsecu.tb_tdsetd_order where out_acco=v_out_acco and exch_no=v_exch_no and report_date=v_report_date and report_no=v_report_no limit 1;
    if v_row_id = 0 then
        select pass_no,stock_code,stock_acco,order_dir,row_id into v_pass_no ,v_stock_code,v_stock_acco,v_order_dir,v_row_id from  db_tdsecu_his.tb_tdsetd_order_his where out_acco=v_out_acco and exch_no=v_exch_no and report_date=v_report_date and report_no=v_report_no limit 1;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pass_no = v_pass_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_acco = v_stock_acco;
    SET p_row_id = v_row_id;
    SET p_order_dir = v_order_dir;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_回溯错单修改订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_BackErrorUpdateOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_BackErrorUpdateOrder(
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
    IN p_order_id bigint,
    IN p_strike_id bigint,
    IN p_strike_amt decimal(18,4),
    IN p_strike_qty decimal(18,2),
    IN p_remark_info varchar(255),
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
    IN p_sys_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_occur_amt decimal(18,4),
    OUT p_trade_occur_qty decimal(18,2),
    OUT p_order_status varchar(2),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_order_id bigint;
    declare v_strike_id bigint;
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_remark_info varchar(255);
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
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_order_dir int;
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_remark_info varchar(255);
    declare v_tmp_all_fee decimal(18,4);
    declare v_tmp_stamp_tax decimal(18,4);
    declare v_tmp_trans_fee decimal(18,4);
    declare v_tmp_brkage_fee decimal(18,4);
    declare v_tmp_SEC_charges decimal(18,4);
    declare v_tmp_other_fee decimal(18,4);
    declare v_tmp_trade_commis decimal(18,4);
    declare v_tmp_other_commis decimal(18,4);
    declare v_tmp_trade_tax decimal(18,4);
    declare v_tmp_trade_cost_fee decimal(18,4);
    declare v_tmp_trade_system_use_fee decimal(18,4);
    declare v_tmp_stock_settle_fee decimal(18,4);
    declare v_tmp_init_date int;
    declare v_tmp_co_no int;
    declare v_tmp_pd_no int;
    declare v_tmp_exch_group_no int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
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
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
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
    declare v_cost_calc_type int;
    declare v_order_oper_way varchar(2);
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
    declare v_total_strike_amt decimal(18,4);
    declare v_total_strike_qty decimal(18,2);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_tmp_order_qty decimal(18,2);
    declare v_tmp_order_frozen_amt decimal(18,4);
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_old_order_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_order_id = p_order_id;
    SET v_strike_id = p_strike_id;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_qty = p_strike_qty;
    SET v_remark_info = p_remark_info;
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
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_order_status = "0";
    SET v_order_dir = 0;
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_amt = 0;
    SET v_tmp_remark_info = " ";
    SET v_tmp_all_fee = 0;
    SET v_tmp_stamp_tax = 0;
    SET v_tmp_trans_fee = 0;
    SET v_tmp_brkage_fee = 0;
    SET v_tmp_SEC_charges = 0;
    SET v_tmp_other_fee = 0;
    SET v_tmp_trade_commis = 0;
    SET v_tmp_other_commis = 0;
    SET v_tmp_trade_tax = 0;
    SET v_tmp_trade_cost_fee = 0;
    SET v_tmp_trade_system_use_fee = 0;
    SET v_tmp_stock_settle_fee = 0;
    SET v_tmp_init_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_co_no = 0;
    SET v_tmp_pd_no = 0;
    SET v_tmp_exch_group_no = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
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
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_wtdraw_qty = 0;
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
    SET v_cost_calc_type = 0;
    SET v_order_oper_way = " ";
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
    SET v_total_strike_amt = 0;
    SET v_total_strike_qty = 0;
    SET v_all_wtdraw_qty = 0;
    SET v_tmp_order_qty = 0;
    SET v_tmp_order_frozen_amt = 0;
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;
    SET v_old_order_status = "0";

    
    label_pro:BEGIN
    

    /* set @临时_成交数量#=@成交数量#; */
    set v_tmp_strike_qty=v_strike_qty;

    /* set @临时_成交金额#=@成交金额#; */
    set v_tmp_strike_amt=v_strike_amt;

    /* set @临时_备注信息#=@备注信息#; */
    set v_tmp_remark_info=v_remark_info;

    /* set @临时_全部费用#=@全部费用#; */
    set v_tmp_all_fee=v_all_fee;

    /* set @临时_印花税#=@印花税#; */
    set v_tmp_stamp_tax=v_stamp_tax;

    /* set @临时_过户费#=@过户费#; */
    set v_tmp_trans_fee=v_trans_fee;

    /* set @临时_经手费#=@经手费#; */
    set v_tmp_brkage_fee=v_brkage_fee;

    /* set @临时_证管费#=@证管费#; */
    set v_tmp_SEC_charges=v_SEC_charges;

    /* set @临时_其他费用#=@其他费用#; */
    set v_tmp_other_fee=v_other_fee;

    /* set @临时_交易佣金#=@交易佣金#; */
    set v_tmp_trade_commis=v_trade_commis;

    /* set @临时_其他佣金#=@其他佣金#; */
    set v_tmp_other_commis=v_other_commis;

    /* set @临时_交易征费#=@交易征费#; */
    set v_tmp_trade_tax=v_trade_tax;

    /* set @临时_交易费#=@交易费#; */
    set v_tmp_trade_cost_fee=v_trade_cost_fee;

    /* set @临时_交易系统使用费#=@交易系统使用费#; */
    set v_tmp_trade_system_use_fee=v_trade_system_use_fee;

    /* set @临时_股份交收费#=@股份交收费#; */
    set v_tmp_stock_settle_fee=v_stock_settle_fee;

    /* set @临时_初始化日期#=@初始化日期#; */
    set v_tmp_init_date=v_init_date;

    /* set @临时_机构编号#=@机构编号#; */
    set v_tmp_co_no=v_co_no;

    /* set @临时_产品编号#=@产品编号#; */
    set v_tmp_pd_no=v_pd_no;

    /* set @临时_交易组编号#=@交易组编号#; */
    set v_tmp_exch_group_no=v_exch_group_no;
    #防止并发，加锁获取

    /* [锁定获取表记录变量][交易证券_交易_订单表][字段][字段变量][{记录序号}=@订单序号#][1][@订单序号#] */
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
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where row_id=v_order_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.127.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;

    #先记录总成交数量和总成交金额

    /* set @总成交金额# = @成交金额#; */
    set v_total_strike_amt = v_strike_amt;

    /* set @总成交数量# = @成交数量#; */
    set v_total_strike_qty = v_strike_qty;

    /* set @总撤单数量# = @撤单数量#; */
    set v_all_wtdraw_qty = v_wtdraw_qty;

    /* set @临时_订单数量#=@订单数量#; */
    set v_tmp_order_qty=v_order_qty;

    /* set @订单数量#=@临时_订单数量#-@成交数量#+@临时_成交数量#; */
    set v_order_qty=v_tmp_order_qty-v_strike_qty+v_tmp_strike_qty;

    /* set @临时_订单冻结金额# = @订单冻结金额#; */
    set v_tmp_order_frozen_amt = v_order_frozen_amt;
    #费用回溯

    /* set @全部费用#=@全部费用# － @临时_全部费用#; */
    set v_all_fee=v_all_fee - v_tmp_all_fee;

    /* set @印花税#=@印花税# － @临时_印花税#; */
    set v_stamp_tax=v_stamp_tax - v_tmp_stamp_tax;

    /* set @过户费#=@过户费# － @临时_过户费#; */
    set v_trans_fee=v_trans_fee - v_tmp_trans_fee;

    /* set @经手费#=@经手费# － @临时_经手费#; */
    set v_brkage_fee=v_brkage_fee - v_tmp_brkage_fee;

    /* set @证管费#=@证管费# － @临时_证管费#; */
    set v_SEC_charges=v_SEC_charges - v_tmp_SEC_charges;

    /* set @其他费用#=@其他费用# － @临时_其他费用#; */
    set v_other_fee=v_other_fee - v_tmp_other_fee;

    /* set @交易佣金#=@交易佣金# － @临时_交易佣金#; */
    set v_trade_commis=v_trade_commis - v_tmp_trade_commis;

    /* set @其他佣金#=@其他佣金# － @临时_其他佣金#; */
    set v_other_commis=v_other_commis - v_tmp_other_commis;

    /* set @交易征费#=@交易征费# － @临时_交易征费#; */
    set v_trade_tax=v_trade_tax - v_tmp_trade_tax;

    /* set @交易费#=@交易费# － @临时_交易费#; */
    set v_trade_cost_fee=v_trade_cost_fee - v_tmp_trade_cost_fee;

    /* set @交易系统使用费#=@交易系统使用费# － @临时_交易系统使用费#; */
    set v_trade_system_use_fee=v_trade_system_use_fee - v_tmp_trade_system_use_fee;

    /* set @股份交收费#=@股份交收费# － @临时_股份交收费#; */
    set v_stock_settle_fee=v_stock_settle_fee - v_tmp_stock_settle_fee;

    /* [获取表记录变量][交易证券_账户_资产账户业务资金持仓变动流水表][{交易变动金额},{交易变动数量}][@交易变动金额#,@交易变动数量#][{订单成交序号}=@成交序号# and {初始化日期}=@临时_初始化日期# and {机构编号}=@临时_机构编号# and {产品编号}=@临时_产品编号# and {交易组编号}=@临时_交易组编号# ][1][@订单序号#] */
    select trade_occur_amt,trade_occur_qty into v_trade_occur_amt,v_trade_occur_qty from db_tdsecu.tb_tdseac_asac_busi_capit_posi_jour where order_strike_id=v_strike_id and init_date=v_tmp_init_date and co_no=v_tmp_co_no and pd_no=v_tmp_pd_no and exch_group_no=v_tmp_exch_group_no  limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.127.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
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
        SET v_error_code = "tdsecuA.4.127.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算交易冻结金额和数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @交易冻结金额#<>0 then */
    if v_trade_frozen_amt<>0 then

        /* set @订单冻结金额#=@临时_订单冻结金额#-@交易变动金额#; */
        set v_order_frozen_amt=v_tmp_order_frozen_amt-v_trade_occur_amt;
    end if;

    /* set @订单冻结数量# =@交易冻结数量#; */
    set v_order_frozen_qty =v_trade_frozen_qty;

    /* set @订单数量#=@临时_订单数量#; */
    set v_order_qty=v_tmp_order_qty;
    #判断是否超过成交回溯

    /* [检查报错返回][@临时_成交数量# >@成交数量#][630][@临时_成交数量#,@成交数量#] */
    if v_tmp_strike_qty >v_strike_qty then
        
        SET v_error_code = "tdsecuA.4.127.630";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("临时_成交数量=",v_tmp_strike_qty,",","成交数量=",v_strike_qty),"#",v_mysql_message);
        else
            SET v_error_info = concat("临时_成交数量=",v_tmp_strike_qty,",","成交数量=",v_strike_qty);
        end if;
        leave label_pro;
    end if;


    /* set @成交数量#=@成交数量# － @临时_成交数量#; */
    set v_strike_qty=v_strike_qty - v_tmp_strike_qty;

    /* set @成交金额#=@成交金额# － @临时_成交金额#; */
    set v_strike_amt=v_strike_amt - v_tmp_strike_amt;

    /* if @订单状态# =《订单状态-已成》then */
    if v_order_status ="6"then

        /* set @原订单状态#=《订单状态-已报》; */
        set v_old_order_status="2";
    else

        /* set @原订单状态#=@订单状态#; */
        set v_old_order_status=v_order_status;
    end if;

    /* 调用【原子_交易证券_公用_计算订单状态】*/
    call db_tdsecu.pra_tdsepb_CaclOrderStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_qty,
        v_wtdraw_qty,
        v_strike_qty,
        v_old_order_status,
        v_error_code,
        v_error_info,
        v_order_status);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuA.4.127.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @备注信息#=@临时_备注信息#; */
    set v_remark_info=v_tmp_remark_info;

    /* [更新表记录][交易证券_交易_订单表][{订单冻结数量} = @订单冻结数量#,{订单冻结金额} = @订单冻结金额#,{成交金额} = @成交金额#,{成交数量} = @成交数量#,{订单状态} = @订单状态#,{备注信息}=@备注信息#,{全部费用} = @全部费用#,{印花税} = @印花税#,{过户费} = @过户费#,{经手费} = @经手费#,{证管费} = @证管费#,{其他费用} = @其他费用#,{交易佣金} = @交易佣金#,{其他佣金} = @其他佣金#,{交易征费} = @交易征费#,{交易费} = @交易费#,{交易系统使用费} = @交易系统使用费#,{股份交收费} = @股份交收费#][{记录序号} = @订单序号#][2][@订单日期#,@订单序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_frozen_qty = v_order_frozen_qty,order_frozen_amt = v_order_frozen_amt,strike_amt = v_strike_amt,strike_qty = v_strike_qty,order_status = v_order_status,remark_info=v_remark_info,all_fee = v_all_fee,stamp_tax = v_stamp_tax,trans_fee = v_trans_fee,brkage_fee = v_brkage_fee,SEC_charges = v_SEC_charges,other_fee = v_other_fee,trade_commis = v_trade_commis,other_commis = v_other_commis,trade_tax = v_trade_tax,trade_cost_fee = v_trade_cost_fee,trade_system_use_fee = v_trade_system_use_fee,stock_settle_fee = v_stock_settle_fee where row_id = v_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.127.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,",","订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,",","订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @成交数量# =  @临时_成交数量#; */
    set v_strike_qty =  v_tmp_strike_qty;

    /* set @成交金额# =  @临时_成交金额#; */
    set v_strike_amt =  v_tmp_strike_amt;

    /* 调用【原子_交易证券_交易_错单修改成交回溯更新汇总订单】*/
    call db_tdsecu.pra_tdsetd_BackErrorStrikeUpdateSumOrder(
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
        v_order_status,
        v_order_dir,
        v_strike_qty,
        v_strike_amt,
        v_order_oper_way,
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuA.4.127.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_错单修改成交回溯更新汇总订单出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_occur_amt = v_trade_occur_amt;
    SET p_trade_occur_qty = v_trade_occur_qty;
    SET p_order_status = v_order_status;
    SET p_order_dir = v_order_dir;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_错单修改成交回溯更新汇总订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_BackErrorStrikeUpdateSumOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_BackErrorStrikeUpdateSumOrder(
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
    IN p_order_status varchar(2),
    IN p_order_dir int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_order_oper_way varchar(2),
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
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_order_status varchar(2);
    declare v_order_dir int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_order_oper_way varchar(2);
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_order_status varchar(2);
    declare v_tmp_all_fee decimal(18,4);
    declare v_tmp_stamp_tax decimal(18,4);
    declare v_tmp_trans_fee decimal(18,4);
    declare v_tmp_brkage_fee decimal(18,4);
    declare v_tmp_SEC_charges decimal(18,4);
    declare v_tmp_other_fee decimal(18,4);
    declare v_tmp_trade_commis decimal(18,4);
    declare v_tmp_other_commis decimal(18,4);
    declare v_tmp_trade_tax decimal(18,4);
    declare v_tmp_trade_cost_fee decimal(18,4);
    declare v_tmp_trade_system_use_fee decimal(18,4);
    declare v_tmp_stock_settle_fee decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_external_no bigint;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_sum_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_waste_qty decimal(18,2);
    declare v_strike_aver_price decimal(16,9);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_order_status = p_order_status;
    SET v_order_dir = p_order_dir;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_order_oper_way = p_order_oper_way;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_amt = 0;
    SET v_tmp_order_status = "0";
    SET v_tmp_all_fee = 0;
    SET v_tmp_stamp_tax = 0;
    SET v_tmp_trans_fee = 0;
    SET v_tmp_brkage_fee = 0;
    SET v_tmp_SEC_charges = 0;
    SET v_tmp_other_fee = 0;
    SET v_tmp_trade_commis = 0;
    SET v_tmp_other_commis = 0;
    SET v_tmp_trade_tax = 0;
    SET v_tmp_trade_cost_fee = 0;
    SET v_tmp_trade_system_use_fee = 0;
    SET v_tmp_stock_settle_fee = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_external_no = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_sum_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_waste_qty = 0;
    SET v_strike_aver_price = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_exter_comm_flag = 0;
    SET v_record_valid_flag = 0;

    
    label_pro:BEGIN
    

    /* [检查正常返回][@订单批号# = 0] */
    if v_order_batch_no = 0 then
        leave label_pro;
    end if;

    #保存输入参数

    /* set @临时_成交数量#=@成交数量#; */
    set v_tmp_strike_qty=v_strike_qty;

    /* set @临时_成交金额#=@成交金额#; */
    set v_tmp_strike_amt=v_strike_amt;

    /* set @临时_订单状态# = @订单状态#; */
    set v_tmp_order_status = v_order_status;

    /* set @临时_全部费用#=@全部费用#; */
    set v_tmp_all_fee=v_all_fee;

    /* set @临时_印花税#=@印花税#; */
    set v_tmp_stamp_tax=v_stamp_tax;

    /* set @临时_过户费#=@过户费#; */
    set v_tmp_trans_fee=v_trans_fee;

    /* set @临时_经手费#=@经手费#; */
    set v_tmp_brkage_fee=v_brkage_fee;

    /* set @临时_证管费#=@证管费#; */
    set v_tmp_SEC_charges=v_SEC_charges;

    /* set @临时_其他费用#=@其他费用#; */
    set v_tmp_other_fee=v_other_fee;

    /* set @临时_交易佣金#=@交易佣金#; */
    set v_tmp_trade_commis=v_trade_commis;

    /* set @临时_其他佣金#=@其他佣金#; */
    set v_tmp_other_commis=v_other_commis;

    /* set @临时_交易征费#=@交易征费#; */
    set v_tmp_trade_tax=v_trade_tax;

    /* set @临时_交易费#=@交易费#; */
    set v_tmp_trade_cost_fee=v_trade_cost_fee;

    /* set @临时_交易系统使用费#=@交易系统使用费#; */
    set v_tmp_trade_system_use_fee=v_trade_system_use_fee;

    /* set @临时_股份交收费#=@股份交收费#; */
    set v_tmp_stock_settle_fee=v_stock_settle_fee;

    /* [锁定获取表记录变量][交易证券_交易_订单汇总表][字段][字段变量][{订单日期}=@订单日期# and {机构编号}=@机构编号# and {订单批号}=@订单批号# ][1][@订单日期#, @机构编号#, @订单批号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_crncy_type, exch_no, stock_code_no, stock_code, 
        trade_code_no, target_code_no, stock_type, asset_type, 
        external_no, order_date, order_batch_no, order_dir, 
        price_type, order_price, order_qty, order_sum_status, 
        wtdraw_qty, waste_qty, strike_amt, strike_qty, 
        strike_aver_price, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, strike_bond_accr_intrst, 
        order_oper_way, exter_comm_flag, record_valid_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_exch_crncy_type, v_exch_no, v_stock_code_no, v_stock_code, 
        v_trade_code_no, v_target_code_no, v_stock_type, v_asset_type, 
        v_external_no, v_order_date, v_order_batch_no, v_order_dir, 
        v_price_type, v_order_price, v_order_qty, v_order_sum_status, 
        v_wtdraw_qty, v_waste_qty, v_strike_amt, v_strike_qty, 
        v_strike_aver_price, v_all_fee, v_stamp_tax, v_trans_fee, 
        v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
        v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
        v_stock_settle_fee, v_net_price_flag, v_intrst_days, v_par_value, 
        v_bond_accr_intrst, v_bond_rate_type, v_impawn_ratio, v_strike_bond_accr_intrst, 
        v_order_oper_way, v_exter_comm_flag, v_record_valid_flag from db_tdsecu.tb_tdsetd_sumorder where order_date=v_order_date and co_no=v_co_no and order_batch_no=v_order_batch_no  limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.128.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no);
        end if;
        leave label_pro;
    end if;


    /* set @成交数量# = @成交数量# - @临时_成交数量#; */
    set v_strike_qty = v_strike_qty - v_tmp_strike_qty;

    /* set @成交金额# = @成交金额# - @临时_成交金额#; */
    set v_strike_amt = v_strike_amt - v_tmp_strike_amt;
    #费用回溯

    /* set @全部费用#=@全部费用# － @临时_全部费用#; */
    set v_all_fee=v_all_fee - v_tmp_all_fee;

    /* set @印花税#=@印花税# － @临时_印花税#; */
    set v_stamp_tax=v_stamp_tax - v_tmp_stamp_tax;

    /* set @过户费#=@过户费# － @临时_过户费#; */
    set v_trans_fee=v_trans_fee - v_tmp_trans_fee;

    /* set @经手费#=@经手费# － @临时_经手费#; */
    set v_brkage_fee=v_brkage_fee - v_tmp_brkage_fee;

    /* set @证管费#=@证管费# － @临时_证管费#; */
    set v_SEC_charges=v_SEC_charges - v_tmp_SEC_charges;

    /* set @其他费用#=@其他费用# － @临时_其他费用#; */
    set v_other_fee=v_other_fee - v_tmp_other_fee;

    /* set @交易佣金#=@交易佣金# － @临时_交易佣金#; */
    set v_trade_commis=v_trade_commis - v_tmp_trade_commis;

    /* set @其他佣金#=@其他佣金# － @临时_其他佣金#; */
    set v_other_commis=v_other_commis - v_tmp_other_commis;

    /* set @交易征费#=@交易征费# － @临时_交易征费#; */
    set v_trade_tax=v_trade_tax - v_tmp_trade_tax;

    /* set @交易费#=@交易费# － @临时_交易费#; */
    set v_trade_cost_fee=v_trade_cost_fee - v_tmp_trade_cost_fee;

    /* set @交易系统使用费#=@交易系统使用费# － @临时_交易系统使用费#; */
    set v_trade_system_use_fee=v_trade_system_use_fee - v_tmp_trade_system_use_fee;

    /* set @股份交收费#=@股份交收费# － @临时_股份交收费#; */
    set v_stock_settle_fee=v_stock_settle_fee - v_tmp_stock_settle_fee;

    /* if @成交数量# <>0 then */
    if v_strike_qty <>0 then

        /* set @成交均价# = @成交金额#/@成交数量#; */
        set v_strike_aver_price = v_strike_amt/v_strike_qty;
    else

        /* set @成交均价# =0; */
        set v_strike_aver_price =0;
    end if;

    /* 调用【原子_交易证券_公用_计算订单汇总状态】*/
    call db_tdsecu.pra_tdsepb_CaclOrderSumStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_qty,
        v_wtdraw_qty,
        v_strike_qty,
        v_waste_qty,
        v_error_code,
        v_error_info,
        v_order_sum_status);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuA.4.128.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单汇总状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_交易_订单汇总表][{成交数量}=@成交数量#, {成交金额}=@成交金额#,{订单汇总状态}=@订单汇总状态# ,{成交均价}=@成交均价#,{全部费用} = @全部费用#,{印花税} = @印花税#,{过户费} = @过户费#,{经手费} = @经手费#,{证管费} = @证管费#,{其他费用} = @其他费用#,{交易佣金} = @交易佣金#,{其他佣金} = @其他佣金#,{交易征费} = @交易征费#,{交易费} = @交易费#,{交易系统使用费} = @交易系统使用费#,{股份交收费} = @股份交收费#][{订单日期}=@订单日期# and {机构编号}=@机构编号# and {订单批号}=@订单批号# ][2][@订单日期#, @机构编号#, @订单批号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_sumorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_qty=v_strike_qty, strike_amt=v_strike_amt,order_sum_status=v_order_sum_status ,strike_aver_price=v_strike_aver_price,all_fee = v_all_fee,stamp_tax = v_stamp_tax,trans_fee = v_trans_fee,brkage_fee = v_brkage_fee,SEC_charges = v_SEC_charges,other_fee = v_other_fee,trade_commis = v_trade_commis,other_commis = v_other_commis,trade_tax = v_trade_tax,trade_cost_fee = v_trade_cost_fee,trade_system_use_fee = v_trade_system_use_fee,stock_settle_fee = v_stock_settle_fee where order_date=v_order_date and co_no=v_co_no and order_batch_no=v_order_batch_no ;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.128.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_新增交易时间配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_AddTrdTimeConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_AddTrdTimeConfig(
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_exch_no = p_exch_no;
    SET v_am_trd_begin_time = p_am_trd_begin_time;
    SET v_am_trd_end_time = p_am_trd_end_time;
    SET v_pm_trd_begin_time = p_pm_trd_begin_time;
    SET v_pm_trd_end_time = p_pm_trd_end_time;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][交易证券_交易_交易时间配置表][字段][字段变量][1][@机构编号#,@市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsetd_trdtimeconfig(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, exch_no, 
        am_trd_begin_time, am_trd_end_time, pm_trd_begin_time, pm_trd_end_time) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_exch_no, 
        v_am_trd_begin_time, v_am_trd_end_time, v_pm_trd_begin_time, v_pm_trd_end_time);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.129.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","市场编号=",v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_删除交易时间配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_DeleteTrdTimeConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_DeleteTrdTimeConfig(
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
    

    /* [删除表记录][交易证券_交易_交易时间配置表][{记录序号} =@记录序号#][3][@记录序号#] */
    delete from db_tdsecu.tb_tdsetd_trdtimeconfig 
        where row_id =v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.4.130.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询交易时间配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryTrdTimeConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryTrdTimeConfig(
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
    

    /* [获取表记录][交易证券_交易_交易时间配置表][字段][(@机构编号#=-1 or {机构编号}=@机构编号#)  and (@市场编号#=0 or {市场编号}=@市场编号#)  and {记录序号}>@记录序号# order by {记录序号} ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        exch_no, am_trd_begin_time, am_trd_end_time, pm_trd_begin_time, 
        pm_trd_end_time from db_tdsecu.tb_tdsetd_trdtimeconfig where (v_co_no=-1 or co_no=v_co_no)  and (v_exch_no=0 or exch_no=v_exch_no)  and row_id>v_row_id order by row_id ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        exch_no, am_trd_begin_time, am_trd_end_time, pm_trd_begin_time, 
        pm_trd_end_time from db_tdsecu.tb_tdsetd_trdtimeconfig where (v_co_no=-1 or co_no=v_co_no)  and (v_exch_no=0 or exch_no=v_exch_no)  and row_id>v_row_id order by row_id  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询股东代码订单记录数
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryStockAccoOrderCount;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryStockAccoOrderCount(
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
    declare v_tmp_record_count int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_tmp_record_count = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数#=0; */
    set v_record_count=0;

    /* set @临时_记录个数#=0; */
    set v_tmp_record_count=0;

    /* [获取表记录数量][交易证券_交易_订单表][@记录个数#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and ({订单状态} <> 《订单状态-废单》and {订单状态} <> 《订单状态-已撤》 and {订单状态} <> 《订单状态-审批拒绝》and {订单状态} <> 《订单状态-已回溯》)] */
    select count(1) into v_record_count from db_tdsecu.tb_tdsetd_order where co_no = v_co_no and pd_no = v_pd_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and (order_status <> "8"and order_status <> "4" and order_status <> "-2"and order_status <> "9");


     /* select count(1) into @临时_记录个数# from ~交易证券_指令_指令表^ where {机构编号} = @机构编号# and {产品编号} = @产品编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {指令状态} <>《指令状态-全部撤销》; */
     select count(1) into v_tmp_record_count from db_tdsecu.tb_tdseap_command where co_no = v_co_no and pd_no = v_pd_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and comm_status <>"6";

    /* set @记录个数# = @记录个数# +@临时_记录个数#; */
    set v_record_count = v_record_count +v_tmp_record_count;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_校验融资融券新增订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_CheckFinaLoanAddOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_CheckFinaLoanAddOrder(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_target_code_no int,
    IN p_trade_code_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_exgp_busi_config_str varchar(64),
    IN p_exgp_avail_amt decimal(18,4),
    IN p_asac_busi_config_str varchar(64),
    IN p_asac_avail_amt decimal(18,4),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    IN p_order_price decimal(16,9),
    IN p_order_frozen_amt decimal(18,4),
    IN p_impawn_ratio decimal(18,12),
    IN p_stock_type int,
    IN p_min_unit int,
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_last_price decimal(16,9),
    IN p_order_oper_way varchar(2),
    IN p_fina_limit_max decimal(18,4),
    IN p_loan_limit_max decimal(18,4),
    IN p_fina_marg_ratio decimal(18,12),
    IN p_secu_loan_marg_ratio decimal(18,12),
    IN p_order_amt decimal(18,4),
    IN p_init_date int,
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_deal_flag int,
    OUT p_debt_qty decimal(18,2)
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_exgp_busi_config_str varchar(64);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_busi_config_str varchar(64);
    declare v_asac_avail_amt decimal(18,4);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_frozen_amt decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_stock_type int;
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_order_oper_way varchar(2);
    declare v_fina_limit_max decimal(18,4);
    declare v_loan_limit_max decimal(18,4);
    declare v_fina_marg_ratio decimal(18,12);
    declare v_secu_loan_marg_ratio decimal(18,12);
    declare v_order_amt decimal(18,4);
    declare v_init_date int;
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_deal_flag int;
    declare v_debt_qty decimal(18,2);
    declare v_shsz_comm_avail_amt decimal(18,4);
    declare v_hk_comm_avail_amt decimal(18,4);
    declare v_shsz_trade_avail_amt decimal(18,4);
    declare v_hk_trade_avail_amt decimal(18,4);
    declare v_comm_avail_amt decimal(18,4);
    declare v_trade_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);
    declare v_row_id bigint;
    declare v_debt_loan_sell_strike_amt decimal(18,4);
    declare v_debt_strike_fee decimal(18,4);
    declare v_loan_return_strike_amt decimal(18,4);
    declare v_loan_return_order_amt decimal(18,4);
    declare v_loan_return_comm_amt decimal(18,4);
    declare v_return_strike_fee decimal(18,4);
    declare v_update_times int;
    declare v_hk_cash_avail_date_type int;
    declare v_avail_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_tmp_sell_ref_rate decimal(18,12);
    declare v_asac_T_hk_sell_total_amt decimal(18,4);
    declare v_asac_T_hk_buy_total_amt decimal(18,4);
    declare v_asac_T1_hk_sell_total_amt decimal(18,4);
    declare v_asac_T1_hk_buy_total_amt decimal(18,4);
    declare v_tmp_exgp_fina_capt_margin decimal(18,4);
    declare v_tmp_exgp_loan_capt_margin decimal(18,4);
    declare v_tmp_asac_fina_capt_margin decimal(18,4);
    declare v_tmp_asac_loan_capt_margin decimal(18,4);
    declare v_loan_sell_get_capital decimal(18,4);
    declare v_converted_margin decimal(18,4);
    declare v_fina_converted_pandl decimal(18,4);
    declare v_loan_converted_pandl decimal(18,4);
    declare v_fina_capt_margin decimal(18,4);
    declare v_loan_capt_margin decimal(18,4);
    declare v_keep_guarantee_ratio decimal(18,12);
    declare v_record_count int;
    declare v_comm_avail_qty decimal(18,2);
    declare v_trade_avail_qty decimal(18,2);
    declare v_static_avail_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_tmp_debt_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_exgp_busi_config_str = p_exgp_busi_config_str;
    SET v_exgp_avail_amt = p_exgp_avail_amt;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_asac_avail_amt = p_asac_avail_amt;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_order_price = p_order_price;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_stock_type = p_stock_type;
    SET v_min_unit = p_min_unit;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_last_price = p_last_price;
    SET v_order_oper_way = p_order_oper_way;
    SET v_fina_limit_max = p_fina_limit_max;
    SET v_loan_limit_max = p_loan_limit_max;
    SET v_fina_marg_ratio = p_fina_marg_ratio;
    SET v_secu_loan_marg_ratio = p_secu_loan_marg_ratio;
    SET v_order_amt = p_order_amt;
    SET v_init_date = p_init_date;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_deal_flag = 0;
    SET v_debt_qty = 0;
    SET v_shsz_comm_avail_amt = 0;
    SET v_hk_comm_avail_amt = 0;
    SET v_shsz_trade_avail_amt = 0;
    SET v_hk_trade_avail_amt = 0;
    SET v_comm_avail_amt = 0;
    SET v_trade_avail_amt = 0;
    SET v_static_avail_amt = 0;
    SET v_row_id = 0;
    SET v_debt_loan_sell_strike_amt = 0;
    SET v_debt_strike_fee = 0;
    SET v_loan_return_strike_amt = 0;
    SET v_loan_return_order_amt = 0;
    SET v_loan_return_comm_amt = 0;
    SET v_return_strike_fee = 0;
    SET v_update_times = 1;
    SET v_hk_cash_avail_date_type = 0;
    SET v_avail_amt = 0;
    SET v_exgp_T_hk_sell_total_amt = 0;
    SET v_exgp_T_hk_buy_total_amt = 0;
    SET v_exgp_T1_hk_sell_total_amt = 0;
    SET v_exgp_T1_hk_buy_total_amt = 0;
    SET v_tmp_sell_ref_rate = 0;
    SET v_asac_T_hk_sell_total_amt = 0;
    SET v_asac_T_hk_buy_total_amt = 0;
    SET v_asac_T1_hk_sell_total_amt = 0;
    SET v_asac_T1_hk_buy_total_amt = 0;
    SET v_tmp_exgp_fina_capt_margin = 0;
    SET v_tmp_exgp_loan_capt_margin = 0;
    SET v_tmp_asac_fina_capt_margin = 0;
    SET v_tmp_asac_loan_capt_margin = 0;
    SET v_loan_sell_get_capital = 0;
    SET v_converted_margin = 0;
    SET v_fina_converted_pandl = 0;
    SET v_loan_converted_pandl = 0;
    SET v_fina_capt_margin = 0;
    SET v_loan_capt_margin = 0;
    SET v_keep_guarantee_ratio = 0;
    SET v_record_count = 0;
    SET v_comm_avail_qty = 0;
    SET v_trade_avail_qty = 0;
    SET v_static_avail_qty = 0;
    SET v_avail_qty = 0;
    SET v_tmp_debt_qty = 0;

    
    label_pro:BEGIN
    
    #判断价格是否符合在涨跌停范围内

    /* if (@订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-卖出》  or @订单方向# = 《订单方向-融资买入》 or @订单方向# = 《订单方向-融券卖出》  or @订单方向# = 《订单方向-买券还券》  or @订单方向# = 《订单方向-卖券还款》 ) and  (@证券类型# <= 20 or @证券类型# >= 50) and (@市场编号# <> 《市场编号-沪港通证券交易所》 and @市场编号# <> 《市场编号-深港通证券交易所》 )  then */
    if (v_order_dir = 1 or v_order_dir = 2  or v_order_dir = 5 or v_order_dir = 6  or v_order_dir = 8  or v_order_dir = 7 ) and  (v_stock_type <= 20 or v_stock_type >= 50) and (v_exch_no <> 3 and v_exch_no <> 4 )  then

        /* [检查报错返回][@涨停价# > 0 and @订单价格# > @涨停价#][706][@证券代码编号#,@订单价格#,@涨停价#] */
        if v_up_limit_price > 0 and v_order_price > v_up_limit_price then
            
            SET v_error_code = "tdsecuA.4.133.706";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,",","订单价格=",v_order_price,",","涨停价=",v_up_limit_price),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码编号=",v_stock_code_no,",","订单价格=",v_order_price,",","涨停价=",v_up_limit_price);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@跌停价# > 0 and @订单价格# < @跌停价#][706][@证券代码编号#,@订单价格#,@跌停价#] */
        if v_down_limit_price > 0 and v_order_price < v_down_limit_price then
            
            SET v_error_code = "tdsecuA.4.133.706";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,",","订单价格=",v_order_price,",","跌停价=",v_down_limit_price),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码编号=",v_stock_code_no,",","订单价格=",v_order_price,",","跌停价=",v_down_limit_price);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [检查报错返回][@价格类型# = 《价格类型-限价》 and @订单价格# <= 0][707][@价格类型#,@订单价格#] */
    if v_price_type = 1 and v_order_price <= 0 then
        
        SET v_error_code = "tdsecuA.4.133.707";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("价格类型=",v_price_type,",","订单价格=",v_order_price),"#",v_mysql_message);
        else
            SET v_error_info = concat("价格类型=",v_price_type,",","订单价格=",v_order_price);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@价格类型# <> 《价格类型-限价》 and @证券类型# > 20 and @证券类型# < 50][710][@价格类型#,@证券类型#] */
    if v_price_type <> 1 and v_stock_type > 20 and v_stock_type < 50 then
        
        SET v_error_code = "tdsecuA.4.133.710";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("价格类型=",v_price_type,",","证券类型=",v_stock_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("价格类型=",v_price_type,",","证券类型=",v_stock_type);
        end if;
        leave label_pro;
    end if;


    /* if @订单方向# = 《订单方向-买入》   then */
    if v_order_dir = 1   then

        /* if substring(@交易组业务控制配置串#,3,1) <> 《交易资金校验-否》 then */
        if substring(v_exgp_busi_config_str,3,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算交易组资金可用】*/
            call db_tdsecu.pra_tdseac_CalcExgpCashAvail(
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
                v_capit_reback_days,
                v_error_code,
                v_error_info,
                v_shsz_comm_avail_amt,
                v_hk_comm_avail_amt,
                v_shsz_trade_avail_amt,
                v_hk_trade_avail_amt,
                v_comm_avail_amt,
                v_trade_avail_amt,
                v_static_avail_amt);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组资金可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* 调用【原子_交易证券_账户_查询交易组业务资金负债】*/
            call db_tdsecu.pra_tdseac_QueryExgpBusiCapitalDebt(
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
                v_exch_group_no,
                v_error_code,
                v_error_info,
                v_row_id,
                v_debt_loan_sell_strike_amt,
                v_debt_strike_fee,
                v_loan_return_strike_amt,
                v_loan_return_order_amt,
                v_loan_return_comm_amt,
                v_return_strike_fee,
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询交易组业务资金负债出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 then */
            if v_exch_no = 1 or v_exch_no = 2 then

                /* if @港股通资金可用日期# = 《港股通资金可用日期-T+2日日初可用》 then */
                if v_hk_cash_avail_date_type = 4 then

                    /* set @可用金额# =@交易组可用金额#+@沪深交易可用金额# + 
                @交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额# + 
                least(0,@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#)+
                least(0,greatest(0,@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#) + @港股交易可用金额#); */
                    set v_avail_amt =v_exgp_avail_amt+v_shsz_trade_avail_amt + 
                                    v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt + 
                                    least(0,v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt)+
                                    least(0,greatest(0,v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt) + v_hk_trade_avail_amt);
                else

                    /* set @可用金额# =@交易组可用金额#+@沪深交易可用金额# + 
                least(0,@交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额#) + 
                least(0,greatest(0,@交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额#)+@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#)+
                least(0,greatest(0,greatest(0,@交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额#)+@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#) + @港股交易可用金额#); */
                    set v_avail_amt =v_exgp_avail_amt+v_shsz_trade_avail_amt + 
                                    least(0,v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt) + 
                                    least(0,greatest(0,v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt)+v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt)+
                                    least(0,greatest(0,greatest(0,v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt)+v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt) + v_hk_trade_avail_amt);
                end if;

                /* set @临时_卖出参考汇率# = 1; */
                set v_tmp_sell_ref_rate = 1;
            else

                /* set @可用金额# = @交易组可用金额# + @交易端可用金额#; */
                set v_avail_amt = v_exgp_avail_amt + v_trade_avail_amt;

                /* set @临时_卖出参考汇率# = @卖出参考汇率#; */
                set v_tmp_sell_ref_rate = v_sell_ref_rate;
            end if;

            /* set @可用金额# = @可用金额# -GREATEST(@负债融券卖出成交金额# - @融券归还成交金额# - @融券归还订单金额#,0) ; */
            set v_avail_amt = v_avail_amt -GREATEST(v_debt_loan_sell_strike_amt - v_loan_return_strike_amt - v_loan_return_order_amt,0) ;

            /* [检查报错返回][Round(@订单冻结金额# * @临时_卖出参考汇率#,2) > @可用金额#][609][concat("可用金额=",@可用金额#,"|订单冻结金额=", Round(@订单冻结金额# * @临时_卖出参考汇率#,2),"|证券代码编号=",@证券代码编号#)] */
            if Round(v_order_frozen_amt * v_tmp_sell_ref_rate,2) > v_avail_amt then
                
                SET v_error_code = "tdsecuA.4.133.609";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用金额=",v_avail_amt,"|订单冻结金额=", Round(v_order_frozen_amt * v_tmp_sell_ref_rate,2),"|证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用金额=",v_avail_amt,"|订单冻结金额=", Round(v_order_frozen_amt * v_tmp_sell_ref_rate,2),"|证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if substring(@资产账户业务控制配置串#,3,1) <> 《交易资金校验-否》 then */
        if substring(v_asac_busi_config_str,3,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算资产账户资金可用】*/
            call db_tdsecu.pra_tdseac_CalcAsacCashAvail(
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
                v_crncy_type,
                v_exch_crncy_type,
                v_buy_ref_rate,
                v_sell_ref_rate,
                v_capit_reback_days,
                v_error_code,
                v_error_info,
                v_shsz_comm_avail_amt,
                v_hk_comm_avail_amt,
                v_shsz_trade_avail_amt,
                v_hk_trade_avail_amt,
                v_comm_avail_amt,
                v_trade_avail_amt,
                v_static_avail_amt);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户资金可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* 调用【原子_交易证券_账户_查询资产账户业务资金负债】*/
            call db_tdsecu.pra_tdseac_QueryAsacBusiCapitalDebt(
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
                v_error_code,
                v_error_info,
                v_row_id,
                v_debt_loan_sell_strike_amt,
                v_debt_strike_fee,
                v_loan_return_strike_amt,
                v_loan_return_order_amt,
                v_loan_return_comm_amt,
                v_return_strike_fee,
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询资产账户业务资金负债出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 then */
            if v_exch_no = 1 or v_exch_no = 2 then

                /* if @港股通资金可用日期# = 《港股通资金可用日期-T+2日日初可用》 then */
                if v_hk_cash_avail_date_type = 4 then

                    /* set @可用金额# =@资产账户可用金额#+@沪深交易可用金额# + 
                @资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额# + 
                least(0,@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#)+
                least(0,greatest(0,@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#) + @港股交易可用金额#); */
                    set v_avail_amt =v_asac_avail_amt+v_shsz_trade_avail_amt + 
                                    v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt + 
                                    least(0,v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt)+
                                    least(0,greatest(0,v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt) + v_hk_trade_avail_amt);
                else

                    /* set @可用金额# =@资产账户可用金额#+@沪深交易可用金额# + 
                least(0,@资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额#) + 
                least(0,greatest(0,@资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额#)+@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#)+
                least(0,greatest(0,greatest(0,@资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额#)+@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#) + @港股交易可用金额#); */
                    set v_avail_amt =v_asac_avail_amt+v_shsz_trade_avail_amt + 
                                    least(0,v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt) + 
                                    least(0,greatest(0,v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt)+v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt)+
                                    least(0,greatest(0,greatest(0,v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt)+v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt) + v_hk_trade_avail_amt);
                end if;

                /* set @临时_卖出参考汇率# = 1; */
                set v_tmp_sell_ref_rate = 1;
            else

                /* set @可用金额# = @资产账户可用金额# + @交易端可用金额#; */
                set v_avail_amt = v_asac_avail_amt + v_trade_avail_amt;

                /* set @临时_卖出参考汇率# = @卖出参考汇率#; */
                set v_tmp_sell_ref_rate = v_sell_ref_rate;
            end if;

            /* set @可用金额# = @可用金额# -GREATEST(@负债融券卖出成交金额# - @融券归还成交金额# - @融券归还订单金额#,0) ; */
            set v_avail_amt = v_avail_amt -GREATEST(v_debt_loan_sell_strike_amt - v_loan_return_strike_amt - v_loan_return_order_amt,0) ;

            /* [检查报错返回][Round(@订单冻结金额# * @临时_卖出参考汇率#,2) > @可用金额#][610][concat("可用金额=",@可用金额#,"|订单冻结金额=", Round(@订单冻结金额# * @临时_卖出参考汇率#,2),"|证券代码编号=",@证券代码编号#)] */
            if Round(v_order_frozen_amt * v_tmp_sell_ref_rate,2) > v_avail_amt then
                
                SET v_error_code = "tdsecuA.4.133.610";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用金额=",v_avail_amt,"|订单冻结金额=", Round(v_order_frozen_amt * v_tmp_sell_ref_rate,2),"|证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用金额=",v_avail_amt,"|订单冻结金额=", Round(v_order_frozen_amt * v_tmp_sell_ref_rate,2),"|证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;

        end if;

    /* elseif  @订单方向#=《订单方向-融资买入》  then */
    elseif  v_order_dir=5  then

        /* 调用【原子_交易证券_账户_计算交易组资金可用】*/
        call db_tdsecu.pra_tdseac_CalcExgpCashAvail(
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
            v_capit_reback_days,
            v_error_code,
            v_error_info,
            v_shsz_comm_avail_amt,
            v_hk_comm_avail_amt,
            v_shsz_trade_avail_amt,
            v_hk_trade_avail_amt,
            v_comm_avail_amt,
            v_trade_avail_amt,
            v_static_avail_amt);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuA.4.133.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组资金可用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* 调用【原子_交易证券_账户_查询交易组业务资金负债】*/
        call db_tdsecu.pra_tdseac_QueryExgpBusiCapitalDebt(
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
            v_exch_group_no,
            v_error_code,
            v_error_info,
            v_row_id,
            v_debt_loan_sell_strike_amt,
            v_debt_strike_fee,
            v_loan_return_strike_amt,
            v_loan_return_order_amt,
            v_loan_return_comm_amt,
            v_return_strike_fee,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuA.4.133.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询交易组业务资金负债出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @临时_交易组融资占用保证金# = @交易组融资占用保证金#+@交易组融资交易占用保证金#; */
        set v_tmp_exgp_fina_capt_margin = v_exgp_fina_capt_margin+v_exgp_fina_order_capt_margin;

        /* set @临时_交易组融券占用保证金# = @交易组融券占用保证金#+@交易组融券交易占用保证金#; */
        set v_tmp_exgp_loan_capt_margin = v_exgp_loan_capt_margin+v_exgp_loan_order_capt_margin;

        /* [检查报错返回][@融资额度上限#> 0 and Round((@订单金额#*@融资保证金比例# + @临时_交易组融资占用保证金#),2) > @融资额度上限# ][609][@订单金额#, @融资保证金比例#,@临时_交易组融资占用保证金#,@融资额度上限#,@交易组融资交易占用保证金#,@交易组融资占用保证金#] */
        if v_fina_limit_max> 0 and Round((v_order_amt*v_fina_marg_ratio + v_tmp_exgp_fina_capt_margin),2) > v_fina_limit_max  then
            
            SET v_error_code = "tdsecuA.4.133.609";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单金额=",v_order_amt,","," 融资保证金比例=", v_fina_marg_ratio,",","临时_交易组融资占用保证金=",v_tmp_exgp_fina_capt_margin,",","融资额度上限=",v_fina_limit_max,",","交易组融资交易占用保证金=",v_exgp_fina_order_capt_margin,",","交易组融资占用保证金=",v_exgp_fina_capt_margin),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单金额=",v_order_amt,","," 融资保证金比例=", v_fina_marg_ratio,",","临时_交易组融资占用保证金=",v_tmp_exgp_fina_capt_margin,",","融资额度上限=",v_fina_limit_max,",","交易组融资交易占用保证金=",v_exgp_fina_order_capt_margin,",","交易组融资占用保证金=",v_exgp_fina_capt_margin);
            end if;
            leave label_pro;
        end if;


        /* set @临时_资产账户融资占用保证金# = @资产账户融资占用保证金# +@资产账户融资交易占用保证金#; */
        set v_tmp_asac_fina_capt_margin = v_asac_fina_capt_margin +v_asac_fina_order_capt_margin;

        /* set @临时_资产账户融券占用保证金# = @资产账户融券占用保证金# +@资产账户融券交易占用保证金#; */
        set v_tmp_asac_loan_capt_margin = v_asac_loan_capt_margin +v_asac_loan_order_capt_margin;

        /* [检查报错返回][@融资额度上限#> 0 and Round((@订单金额#*@融资保证金比例# + @临时_资产账户融资占用保证金#),2) > @融资额度上限# ][609][@订单金额#, @融资保证金比例#,@临时_资产账户融资占用保证金#,@融资额度上限#,@资产账户融资交易占用保证金#,@资产账户融资占用保证金#] */
        if v_fina_limit_max> 0 and Round((v_order_amt*v_fina_marg_ratio + v_tmp_asac_fina_capt_margin),2) > v_fina_limit_max  then
            
            SET v_error_code = "tdsecuA.4.133.609";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单金额=",v_order_amt,","," 融资保证金比例=", v_fina_marg_ratio,",","临时_资产账户融资占用保证金=",v_tmp_asac_fina_capt_margin,",","融资额度上限=",v_fina_limit_max,",","资产账户融资交易占用保证金=",v_asac_fina_order_capt_margin,",","资产账户融资占用保证金=",v_asac_fina_capt_margin),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单金额=",v_order_amt,","," 融资保证金比例=", v_fina_marg_ratio,",","临时_资产账户融资占用保证金=",v_tmp_asac_fina_capt_margin,",","融资额度上限=",v_fina_limit_max,",","资产账户融资交易占用保证金=",v_asac_fina_order_capt_margin,",","资产账户融资占用保证金=",v_asac_fina_capt_margin);
            end if;
            leave label_pro;
        end if;


        /* if substring(@交易组业务控制配置串#,1,1) <> 《交易资金校验-否》 then */
        if substring(v_exgp_busi_config_str,1,1) <> 2 then
            #融券卖出所得资金、利息费用考虑

            /* set @融券卖出所得资金# = @交易组融券卖出金额#+@负债融券卖出成交金额#-@融券归还成交金额#; */
            set v_loan_sell_get_capital = v_exgp_loan_sell_amt+v_debt_loan_sell_strike_amt-v_loan_return_strike_amt;

            /* set @可用金额# = @交易组可用金额# + @交易端可用金额# +@交易组冲抵折算保证金# + @交易组融资折算盈亏# + @交易组融券折算盈亏#-@融券卖出所得资金# - @临时_交易组融资占用保证金# - @临时_交易组融券占用保证金#-@交易组融资利息# - @交易组融券利息#; */
            set v_avail_amt = v_exgp_avail_amt + v_trade_avail_amt +v_exgp_converted_margin + v_exgp_fina_converted_pandl + v_exgp_loan_converted_pandl-v_loan_sell_get_capital - v_tmp_exgp_fina_capt_margin - v_tmp_exgp_loan_capt_margin-v_exgp_fina_interest - v_exgp_loan_interest;

            /* [检查报错返回][Round(@订单金额#*@融资保证金比例#,2)>@可用金额#][605][@订单金额#,@融资保证金比例#,@可用金额#] */
            if Round(v_order_amt*v_fina_marg_ratio,2)>v_avail_amt then
                
                SET v_error_code = "tdsecuA.4.133.605";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单金额=",v_order_amt,",","融资保证金比例=",v_fina_marg_ratio,",","可用金额=",v_avail_amt),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单金额=",v_order_amt,",","融资保证金比例=",v_fina_marg_ratio,",","可用金额=",v_avail_amt);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if substring(@资产账户业务控制配置串#,3,1) <> 《交易资金校验-否》 then */
        if substring(v_asac_busi_config_str,3,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算资产账户资金可用】*/
            call db_tdsecu.pra_tdseac_CalcAsacCashAvail(
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
                v_crncy_type,
                v_exch_crncy_type,
                v_buy_ref_rate,
                v_sell_ref_rate,
                v_capit_reback_days,
                v_error_code,
                v_error_info,
                v_shsz_comm_avail_amt,
                v_hk_comm_avail_amt,
                v_shsz_trade_avail_amt,
                v_hk_trade_avail_amt,
                v_comm_avail_amt,
                v_trade_avail_amt,
                v_static_avail_amt);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户资金可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* 调用【原子_交易证券_账户_查询资产账户融资融券保证金计算】*/
            call db_tdsecu.pra_tdseac_QueryAsacFinaLoanMarginCalc(
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
                v_converted_margin,
                v_fina_converted_pandl,
                v_loan_converted_pandl,
                v_fina_capt_margin,
                v_loan_capt_margin,
                v_keep_guarantee_ratio);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询资产账户融资融券保证金计算出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* 调用【原子_交易证券_账户_查询资产账户业务资金负债】*/
            call db_tdsecu.pra_tdseac_QueryAsacBusiCapitalDebt(
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
                v_error_code,
                v_error_info,
                v_row_id,
                v_debt_loan_sell_strike_amt,
                v_debt_strike_fee,
                v_loan_return_strike_amt,
                v_loan_return_order_amt,
                v_loan_return_comm_amt,
                v_return_strike_fee,
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询资产账户业务资金负债出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

            #利息费用考虑

            /* set @融券卖出所得资金# = @资产账户融券卖出金额#+@负债融券卖出成交金额#-@融券归还成交金额#; */
            set v_loan_sell_get_capital = v_asac_loan_sell_amt+v_debt_loan_sell_strike_amt-v_loan_return_strike_amt;

            /* set @可用金额# = @资产账户可用金额# + @交易端可用金额# +@资产账户冲抵折算保证金# + @资产账户融资折算盈亏# + @资产账户融券折算盈亏#-@融券卖出所得资金# - @临时_资产账户融资占用保证金# - @临时_资产账户融券占用保证金#-@资产账户融资利息# - @资产账户融券利息#; */
            set v_avail_amt = v_asac_avail_amt + v_trade_avail_amt +v_asac_converted_margin + v_asac_fina_converted_pandl + v_asac_loan_converted_pandl-v_loan_sell_get_capital - v_tmp_asac_fina_capt_margin - v_tmp_asac_loan_capt_margin-v_asac_fina_interest - v_asac_loan_interest;

            /* [检查报错返回][Round(@订单金额#*@融资保证金比例#,2)>@可用金额#][605][@订单金额#,@融资保证金比例#,@可用金额#] */
            if Round(v_order_amt*v_fina_marg_ratio,2)>v_avail_amt then
                
                SET v_error_code = "tdsecuA.4.133.605";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单金额=",v_order_amt,",","融资保证金比例=",v_fina_marg_ratio,",","可用金额=",v_avail_amt),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单金额=",v_order_amt,",","融资保证金比例=",v_fina_marg_ratio,",","可用金额=",v_avail_amt);
                end if;
                leave label_pro;
            end if;

        end if;

    /* elseif @订单方向#=《订单方向-融券卖出》  then */
    elseif v_order_dir=6  then

        /* 调用【原子_交易证券_账户_计算交易组资金可用】*/
        call db_tdsecu.pra_tdseac_CalcExgpCashAvail(
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
            v_capit_reback_days,
            v_error_code,
            v_error_info,
            v_shsz_comm_avail_amt,
            v_hk_comm_avail_amt,
            v_shsz_trade_avail_amt,
            v_hk_trade_avail_amt,
            v_comm_avail_amt,
            v_trade_avail_amt,
            v_static_avail_amt);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuA.4.133.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组资金可用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* 调用【原子_交易证券_账户_查询交易组业务资金负债】*/
        call db_tdsecu.pra_tdseac_QueryExgpBusiCapitalDebt(
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
            v_exch_group_no,
            v_error_code,
            v_error_info,
            v_row_id,
            v_debt_loan_sell_strike_amt,
            v_debt_strike_fee,
            v_loan_return_strike_amt,
            v_loan_return_order_amt,
            v_loan_return_comm_amt,
            v_return_strike_fee,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuA.4.133.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询交易组业务资金负债出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @临时_交易组融券占用保证金# = @交易组融券占用保证金#+@交易组融券交易占用保证金#; */
        set v_tmp_exgp_loan_capt_margin = v_exgp_loan_capt_margin+v_exgp_loan_order_capt_margin;

        /* set @临时_交易组融资占用保证金# = @交易组融资占用保证金#+@交易组融资交易占用保证金#; */
        set v_tmp_exgp_fina_capt_margin = v_exgp_fina_capt_margin+v_exgp_fina_order_capt_margin;

        /* [检查报错返回][@融券额度上限#> 0 and Round((@订单金额#*@融券保证金比例# + @临时_交易组融券占用保证金#),2) > @融券额度上限# ][609][@订单金额#, @融券保证金比例#,@临时_交易组融券占用保证金#,@融券额度上限#,@交易组融券交易占用保证金#,@交易组融券占用保证金#] */
        if v_loan_limit_max> 0 and Round((v_order_amt*v_secu_loan_marg_ratio + v_tmp_exgp_loan_capt_margin),2) > v_loan_limit_max  then
            
            SET v_error_code = "tdsecuA.4.133.609";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单金额=",v_order_amt,","," 融券保证金比例=", v_secu_loan_marg_ratio,",","临时_交易组融券占用保证金=",v_tmp_exgp_loan_capt_margin,",","融券额度上限=",v_loan_limit_max,",","交易组融券交易占用保证金=",v_exgp_loan_order_capt_margin,",","交易组融券占用保证金=",v_exgp_loan_capt_margin),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单金额=",v_order_amt,","," 融券保证金比例=", v_secu_loan_marg_ratio,",","临时_交易组融券占用保证金=",v_tmp_exgp_loan_capt_margin,",","融券额度上限=",v_loan_limit_max,",","交易组融券交易占用保证金=",v_exgp_loan_order_capt_margin,",","交易组融券占用保证金=",v_exgp_loan_capt_margin);
            end if;
            leave label_pro;
        end if;


        /* set @临时_资产账户融券占用保证金# = @资产账户融券占用保证金# +@资产账户融券交易占用保证金#; */
        set v_tmp_asac_loan_capt_margin = v_asac_loan_capt_margin +v_asac_loan_order_capt_margin;

        /* set @临时_资产账户融资占用保证金# = @资产账户融资占用保证金# +@资产账户融资交易占用保证金#; */
        set v_tmp_asac_fina_capt_margin = v_asac_fina_capt_margin +v_asac_fina_order_capt_margin;

        /* [检查报错返回][@融券额度上限#> 0 and Round((@订单金额#*@融券保证金比例# + @临时_资产账户融券占用保证金#),2) > @融券额度上限# ][609][@订单金额#, @融券保证金比例#,@临时_资产账户融券占用保证金#,@融券额度上限#,@资产账户融券交易占用保证金#,@资产账户融券占用保证金#] */
        if v_loan_limit_max> 0 and Round((v_order_amt*v_secu_loan_marg_ratio + v_tmp_asac_loan_capt_margin),2) > v_loan_limit_max  then
            
            SET v_error_code = "tdsecuA.4.133.609";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单金额=",v_order_amt,","," 融券保证金比例=", v_secu_loan_marg_ratio,",","临时_资产账户融券占用保证金=",v_tmp_asac_loan_capt_margin,",","融券额度上限=",v_loan_limit_max,",","资产账户融券交易占用保证金=",v_asac_loan_order_capt_margin,",","资产账户融券占用保证金=",v_asac_loan_capt_margin),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单金额=",v_order_amt,","," 融券保证金比例=", v_secu_loan_marg_ratio,",","临时_资产账户融券占用保证金=",v_tmp_asac_loan_capt_margin,",","融券额度上限=",v_loan_limit_max,",","资产账户融券交易占用保证金=",v_asac_loan_order_capt_margin,",","资产账户融券占用保证金=",v_asac_loan_capt_margin);
            end if;
            leave label_pro;
        end if;


        /* if substring(@交易组业务控制配置串#,1,1) <> 《交易资金校验-否》 then */
        if substring(v_exgp_busi_config_str,1,1) <> 2 then
            #利息费用考虑

            /* set @融券卖出所得资金# = @交易组融券卖出金额#+@负债融券卖出成交金额#-@融券归还成交金额#; */
            set v_loan_sell_get_capital = v_exgp_loan_sell_amt+v_debt_loan_sell_strike_amt-v_loan_return_strike_amt;

            /* set @可用金额# = @交易组可用金额# + @交易端可用金额# +@交易组冲抵折算保证金# + @交易组融资折算盈亏# + @交易组融券折算盈亏#-@融券卖出所得资金# - @临时_交易组融资占用保证金# - @临时_交易组融券占用保证金#-@交易组融资利息# - @交易组融券利息#; */
            set v_avail_amt = v_exgp_avail_amt + v_trade_avail_amt +v_exgp_converted_margin + v_exgp_fina_converted_pandl + v_exgp_loan_converted_pandl-v_loan_sell_get_capital - v_tmp_exgp_fina_capt_margin - v_tmp_exgp_loan_capt_margin-v_exgp_fina_interest - v_exgp_loan_interest;

            /* [检查报错返回][Round(@订单金额#*@融券保证金比例#,2)>@可用金额#][605][@订单金额#,@融券保证金比例#,@可用金额#] */
            if Round(v_order_amt*v_secu_loan_marg_ratio,2)>v_avail_amt then
                
                SET v_error_code = "tdsecuA.4.133.605";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单金额=",v_order_amt,",","融券保证金比例=",v_secu_loan_marg_ratio,",","可用金额=",v_avail_amt),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单金额=",v_order_amt,",","融券保证金比例=",v_secu_loan_marg_ratio,",","可用金额=",v_avail_amt);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if substring(@资产账户业务控制配置串#,3,1) <> 《交易资金校验-否》 then */
        if substring(v_asac_busi_config_str,3,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算资产账户资金可用】*/
            call db_tdsecu.pra_tdseac_CalcAsacCashAvail(
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
                v_crncy_type,
                v_exch_crncy_type,
                v_buy_ref_rate,
                v_sell_ref_rate,
                v_capit_reback_days,
                v_error_code,
                v_error_info,
                v_shsz_comm_avail_amt,
                v_hk_comm_avail_amt,
                v_shsz_trade_avail_amt,
                v_hk_trade_avail_amt,
                v_comm_avail_amt,
                v_trade_avail_amt,
                v_static_avail_amt);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户资金可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* 调用【原子_交易证券_账户_查询资产账户融资融券保证金计算】*/
            call db_tdsecu.pra_tdseac_QueryAsacFinaLoanMarginCalc(
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
                v_converted_margin,
                v_fina_converted_pandl,
                v_loan_converted_pandl,
                v_fina_capt_margin,
                v_loan_capt_margin,
                v_keep_guarantee_ratio);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询资产账户融资融券保证金计算出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* 调用【原子_交易证券_账户_查询资产账户业务资金负债】*/
            call db_tdsecu.pra_tdseac_QueryAsacBusiCapitalDebt(
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
                v_error_code,
                v_error_info,
                v_row_id,
                v_debt_loan_sell_strike_amt,
                v_debt_strike_fee,
                v_loan_return_strike_amt,
                v_loan_return_order_amt,
                v_loan_return_comm_amt,
                v_return_strike_fee,
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询资产账户业务资金负债出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

            #利息费用考虑

            /* set @融券卖出所得资金# = @资产账户融券卖出金额#+@负债融券卖出成交金额#-@融券归还成交金额#; */
            set v_loan_sell_get_capital = v_asac_loan_sell_amt+v_debt_loan_sell_strike_amt-v_loan_return_strike_amt;

            /* set @可用金额# = @资产账户可用金额# + @交易端可用金额# +@资产账户冲抵折算保证金# + @资产账户融资折算盈亏# + @资产账户融券折算盈亏#-@融券卖出所得资金# - @临时_资产账户融资占用保证金# - @临时_资产账户融券占用保证金#-@资产账户融资利息# - @资产账户融券利息#; */
            set v_avail_amt = v_asac_avail_amt + v_trade_avail_amt +v_asac_converted_margin + v_asac_fina_converted_pandl + v_asac_loan_converted_pandl-v_loan_sell_get_capital - v_tmp_asac_fina_capt_margin - v_tmp_asac_loan_capt_margin-v_asac_fina_interest - v_asac_loan_interest;

            /* [检查报错返回][Round(@订单金额#*@融券保证金比例#,2)>@可用金额#][605][@订单金额#,@融券保证金比例#,@可用金额#] */
            if Round(v_order_amt*v_secu_loan_marg_ratio,2)>v_avail_amt then
                
                SET v_error_code = "tdsecuA.4.133.605";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单金额=",v_order_amt,",","融券保证金比例=",v_secu_loan_marg_ratio,",","可用金额=",v_avail_amt),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单金额=",v_order_amt,",","融券保证金比例=",v_secu_loan_marg_ratio,",","可用金额=",v_avail_amt);
                end if;
                leave label_pro;
            end if;

        end if;

    /* elseif @订单方向# = 《订单方向-卖出》 or  @订单方向# = 《订单方向-卖券还款》 then */
    elseif v_order_dir = 2 or  v_order_dir = 7 then
        #判断是否有融资负债

        /* set @记录个数# = 0; */
        set v_record_count = 0;

        /* [获取表记录数量][交易证券_账户_交易组负债明细表][@记录个数#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {负债类型} = 《负债类型-融资》  and {负债状态}=《负债状态-未归还》] */
        select count(1) into v_record_count from db_tdsecu.tb_tdseac_exgp_debtjour where co_no = v_co_no and pd_no = v_pd_no and asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and debt_type = 1  and debt_status=1;


        /* if @订单方向# = 《订单方向-卖券还款》 then */
        if v_order_dir = 7 then

            /* [检查报错返回][@交易组负债融资买入成交金额#=0 and @记录个数#=0][605][@交易组负债融资买入成交金额#,@记录个数#] */
            if v_exgp_debt_fina_buy_strike_amt=0 and v_record_count=0 then
                
                SET v_error_code = "tdsecuA.4.133.605";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组负债融资买入成交金额=",v_exgp_debt_fina_buy_strike_amt,",","记录个数=",v_record_count),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组负债融资买入成交金额=",v_exgp_debt_fina_buy_strike_amt,",","记录个数=",v_record_count);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if substring(@交易组业务控制配置串#,2,1) <> 《交易持仓校验-否》 then */
        if substring(v_exgp_busi_config_str,2,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算交易组持仓可用】*/
            call db_tdsecu.pra_tdseac_CalcExgpPosiAvail(
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
                v_posi_reback_days,
                v_error_code,
                v_error_info,
                v_comm_avail_qty,
                v_trade_avail_qty,
                v_static_avail_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组持仓可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @可用数量#=@交易组可用数量# + @交易端可用数量#; */
            set v_avail_qty=v_exgp_avail_qty + v_trade_avail_qty;

            /* [检查报错返回][@订单数量#>@可用数量#][605][@可用数量#,@订单数量#] */
            if v_order_qty>v_avail_qty then
                
                SET v_error_code = "tdsecuA.4.133.605";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if substring(@资产账户业务控制配置串#,2,1) <> 《交易持仓校验-否》 then */
        if substring(v_asac_busi_config_str,2,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算资产账户持仓可用】*/
            call db_tdsecu.pra_tdseac_CalcAsacPosiAvail(
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
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_posi_reback_days,
                v_error_code,
                v_error_info,
                v_comm_avail_qty,
                v_trade_avail_qty,
                v_static_avail_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户持仓可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @可用数量#=@资产账户可用数量# + @交易端可用数量#; */
            set v_avail_qty=v_asac_avail_qty + v_trade_avail_qty;

            /* [检查报错返回][@订单数量#>@可用数量#][606][@可用数量#,@订单数量#] */
            if v_order_qty>v_avail_qty then
                
                SET v_error_code = "tdsecuA.4.133.606";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if (@证券类型# > (20)) and (@证券类型# < (50)) then */
        if (v_stock_type > (20)) and (v_stock_type < (50)) then

            /* set @最小单位# = 10; */
            set v_min_unit = 10;

        /* elseif @市场编号#<>3  and @市场编号#<>4  then */
        elseif v_exch_no<>3  and v_exch_no<>4  then

            /* set @最小单位# = 100; */
            set v_min_unit = 100;
        end if;

        /* [检查报错返回][(mod(@订单数量#,@最小单位#) > 0) and (mod(@可用数量# - @订单数量#,@最小单位#)>0)][715][@订单数量#,@证券代码编号#] */
        if (mod(v_order_qty,v_min_unit) > 0) and (mod(v_avail_qty - v_order_qty,v_min_unit)>0) then
            
            SET v_error_code = "tdsecuA.4.133.715";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;


    /* elseif @订单方向# = 《订单方向-买券还券》 then */
    elseif v_order_dir = 8 then
        #先判断是否存在这只票的负债，例如欠350，只能还400，不能多还

        /* select sum({融券归还成交数量} - {融券归还订单数量}) into @负债数量# from ~交易证券_账户_交易组业务持仓负债表^ where {交易组编号} = @交易组编号# and {证券代码编号} = @证券代码编号# and {负债类型} = 《负债类型-融券》; */
        select sum(loan_return_strike_qty - loan_return_order_qty) into v_debt_qty from db_tdsecu.tb_tdseac_exgp_busi_posi_debt where exch_group_no = v_exch_group_no and stock_code_no = v_stock_code_no and debt_type = 2;

        /* set @负债数量# = ifnull(@负债数量#,0); */
        set v_debt_qty = ifnull(v_debt_qty,0);

        /* set @负债数量# = round( (@负债数量# + @交易组负债融券卖出成交数量#) /100)*100; */
        set v_debt_qty = round( (v_debt_qty + v_exgp_debt_loan_sell_strike_qty) /100)*100;

        /* [检查报错返回][@订单数量#>@负债数量# or @负债数量# = 0 ][611][@订单数量#,@负债数量#] */
        if v_order_qty>v_debt_qty or v_debt_qty = 0  then
            
            SET v_error_code = "tdsecuA.4.133.611";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单数量=",v_order_qty,",","负债数量=",v_debt_qty),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单数量=",v_order_qty,",","负债数量=",v_debt_qty);
            end if;
            leave label_pro;
        end if;


        /* 调用【原子_交易证券_账户_计算交易组资金可用】*/
        call db_tdsecu.pra_tdseac_CalcExgpCashAvail(
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
            v_capit_reback_days,
            v_error_code,
            v_error_info,
            v_shsz_comm_avail_amt,
            v_hk_comm_avail_amt,
            v_shsz_trade_avail_amt,
            v_hk_trade_avail_amt,
            v_comm_avail_amt,
            v_trade_avail_amt,
            v_static_avail_amt);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuA.4.133.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组资金可用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* if substring(@交易组业务控制配置串#,1,1) <> 《交易资金校验-否》 then */
        if substring(v_exgp_busi_config_str,1,1) <> 2 then

            /* set @可用金额#=@交易组可用金额# + @交易端可用金额#; */
            set v_avail_amt=v_exgp_avail_amt + v_trade_avail_amt;

            /* [检查报错返回][Round(@订单冻结金额#,2) >@可用金额#][603][@可用金额#, @订单冻结金额#] */
            if Round(v_order_frozen_amt,2) >v_avail_amt then
                
                SET v_error_code = "tdsecuA.4.133.603";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用金额=",v_avail_amt,","," 订单冻结金额=", v_order_frozen_amt),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用金额=",v_avail_amt,","," 订单冻结金额=", v_order_frozen_amt);
                end if;
                leave label_pro;
            end if;

        end if;

        /* 调用【原子_交易证券_账户_计算资产账户资金可用】*/
        call db_tdsecu.pra_tdseac_CalcAsacCashAvail(
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
            v_crncy_type,
            v_exch_crncy_type,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_capit_reback_days,
            v_error_code,
            v_error_info,
            v_shsz_comm_avail_amt,
            v_hk_comm_avail_amt,
            v_shsz_trade_avail_amt,
            v_hk_trade_avail_amt,
            v_comm_avail_amt,
            v_trade_avail_amt,
            v_static_avail_amt);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuA.4.133.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户资金可用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* if substring(@交易组业务控制配置串#,1,1) <> 《交易资金校验-否》 then */
        if substring(v_exgp_busi_config_str,1,1) <> 2 then

            /* set @可用金额#=@资产账户可用金额# + @交易端可用金额#; */
            set v_avail_amt=v_asac_avail_amt + v_trade_avail_amt;

            /* [检查报错返回][Round(@订单冻结金额#,2) >@可用金额#][603][@可用金额#, @订单冻结金额#] */
            if Round(v_order_frozen_amt,2) >v_avail_amt then
                
                SET v_error_code = "tdsecuA.4.133.603";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用金额=",v_avail_amt,","," 订单冻结金额=", v_order_frozen_amt),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用金额=",v_avail_amt,","," 订单冻结金额=", v_order_frozen_amt);
                end if;
                leave label_pro;
            end if;

        end if;

    /* elseif @订单方向# = 《订单方向-直接还款》 then */
    elseif v_order_dir = 14 then
        #判断是否有融资负债

        /* set @记录个数# = 0; */
        set v_record_count = 0;

        /* [获取表记录数量][交易证券_账户_交易组负债明细表][@记录个数#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {负债类型} = 《负债类型-融资》  and {负债状态}=《负债状态-未归还》] */
        select count(1) into v_record_count from db_tdsecu.tb_tdseac_exgp_debtjour where co_no = v_co_no and pd_no = v_pd_no and asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and debt_type = 1  and debt_status=1;


        /* if @订单方向# = 《订单方向-卖券还款》 then */
        if v_order_dir = 7 then

            /* [检查报错返回][@交易组负债融资买入成交金额#=0 and @记录个数#=0][605][@交易组负债融资买入成交金额#,@记录个数#] */
            if v_exgp_debt_fina_buy_strike_amt=0 and v_record_count=0 then
                
                SET v_error_code = "tdsecuA.4.133.605";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组负债融资买入成交金额=",v_exgp_debt_fina_buy_strike_amt,",","记录个数=",v_record_count),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组负债融资买入成交金额=",v_exgp_debt_fina_buy_strike_amt,",","记录个数=",v_record_count);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if substring(@交易组业务控制配置串#,3,1) <> 《交易资金校验-否》 then */
        if substring(v_exgp_busi_config_str,3,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算交易组资金可用】*/
            call db_tdsecu.pra_tdseac_CalcExgpCashAvail(
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
                v_capit_reback_days,
                v_error_code,
                v_error_info,
                v_shsz_comm_avail_amt,
                v_hk_comm_avail_amt,
                v_shsz_trade_avail_amt,
                v_hk_trade_avail_amt,
                v_comm_avail_amt,
                v_trade_avail_amt,
                v_static_avail_amt);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组资金可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* 调用【原子_交易证券_账户_查询交易组业务资金负债】*/
            call db_tdsecu.pra_tdseac_QueryExgpBusiCapitalDebt(
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
                v_exch_group_no,
                v_error_code,
                v_error_info,
                v_row_id,
                v_debt_loan_sell_strike_amt,
                v_debt_strike_fee,
                v_loan_return_strike_amt,
                v_loan_return_order_amt,
                v_loan_return_comm_amt,
                v_return_strike_fee,
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询交易组业务资金负债出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 then */
            if v_exch_no = 1 or v_exch_no = 2 then

                /* if @港股通资金可用日期# = 《港股通资金可用日期-T+2日日初可用》 then */
                if v_hk_cash_avail_date_type = 4 then

                    /* set @可用金额# =@交易组可用金额#+@沪深交易可用金额# + 
                @交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额# + 
                least(0,@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#)+
                least(0,greatest(0,@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#) + @港股交易可用金额#); */
                    set v_avail_amt =v_exgp_avail_amt+v_shsz_trade_avail_amt + 
                                    v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt + 
                                    least(0,v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt)+
                                    least(0,greatest(0,v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt) + v_hk_trade_avail_amt);
                else

                    /* set @可用金额# =@交易组可用金额#+@沪深交易可用金额# + 
                least(0,@交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额#) + 
                least(0,greatest(0,@交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额#)+@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#)+
                least(0,greatest(0,greatest(0,@交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额#)+@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#) + @港股交易可用金额#); */
                    set v_avail_amt =v_exgp_avail_amt+v_shsz_trade_avail_amt + 
                                    least(0,v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt) + 
                                    least(0,greatest(0,v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt)+v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt)+
                                    least(0,greatest(0,greatest(0,v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt)+v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt) + v_hk_trade_avail_amt);
                end if;

                /* set @临时_卖出参考汇率# = 1; */
                set v_tmp_sell_ref_rate = 1;
            else

                /* set @可用金额# = @交易组可用金额# + @交易端可用金额#; */
                set v_avail_amt = v_exgp_avail_amt + v_trade_avail_amt;

                /* set @临时_卖出参考汇率# = @卖出参考汇率#; */
                set v_tmp_sell_ref_rate = v_sell_ref_rate;
            end if;

            /* set @可用金额# = @可用金额# -GREATEST(@负债融券卖出成交金额# - @融券归还成交金额# - @融券归还订单金额#,0) ; */
            set v_avail_amt = v_avail_amt -GREATEST(v_debt_loan_sell_strike_amt - v_loan_return_strike_amt - v_loan_return_order_amt,0) ;

            /* [检查报错返回][Round(@订单冻结金额# * @临时_卖出参考汇率#,2) > @可用金额#][609][concat("可用金额=",@可用金额#,"|订单冻结金额=", Round(@订单冻结金额# * @临时_卖出参考汇率#,2),"|证券代码编号=",@证券代码编号#)] */
            if Round(v_order_frozen_amt * v_tmp_sell_ref_rate,2) > v_avail_amt then
                
                SET v_error_code = "tdsecuA.4.133.609";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用金额=",v_avail_amt,"|订单冻结金额=", Round(v_order_frozen_amt * v_tmp_sell_ref_rate,2),"|证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用金额=",v_avail_amt,"|订单冻结金额=", Round(v_order_frozen_amt * v_tmp_sell_ref_rate,2),"|证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if substring(@资产账户业务控制配置串#,3,1) <> 《交易资金校验-否》 then */
        if substring(v_asac_busi_config_str,3,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算资产账户资金可用】*/
            call db_tdsecu.pra_tdseac_CalcAsacCashAvail(
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
                v_crncy_type,
                v_exch_crncy_type,
                v_buy_ref_rate,
                v_sell_ref_rate,
                v_capit_reback_days,
                v_error_code,
                v_error_info,
                v_shsz_comm_avail_amt,
                v_hk_comm_avail_amt,
                v_shsz_trade_avail_amt,
                v_hk_trade_avail_amt,
                v_comm_avail_amt,
                v_trade_avail_amt,
                v_static_avail_amt);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户资金可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* 调用【原子_交易证券_账户_查询资产账户业务资金负债】*/
            call db_tdsecu.pra_tdseac_QueryAsacBusiCapitalDebt(
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
                v_error_code,
                v_error_info,
                v_row_id,
                v_debt_loan_sell_strike_amt,
                v_debt_strike_fee,
                v_loan_return_strike_amt,
                v_loan_return_order_amt,
                v_loan_return_comm_amt,
                v_return_strike_fee,
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询资产账户业务资金负债出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 then */
            if v_exch_no = 1 or v_exch_no = 2 then

                /* if @港股通资金可用日期# = 《港股通资金可用日期-T+2日日初可用》 then */
                if v_hk_cash_avail_date_type = 4 then

                    /* set @可用金额# =@资产账户可用金额#+@沪深交易可用金额# + 
                @资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额# + 
                least(0,@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#)+
                least(0,greatest(0,@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#) + @港股交易可用金额#); */
                    set v_avail_amt =v_asac_avail_amt+v_shsz_trade_avail_amt + 
                                    v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt + 
                                    least(0,v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt)+
                                    least(0,greatest(0,v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt) + v_hk_trade_avail_amt);
                else

                    /* set @可用金额# =@资产账户可用金额#+@沪深交易可用金额# + 
                least(0,@资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额#) + 
                least(0,greatest(0,@资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额#)+@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#)+
                least(0,greatest(0,greatest(0,@资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额#)+@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#) + @港股交易可用金额#); */
                    set v_avail_amt =v_asac_avail_amt+v_shsz_trade_avail_amt + 
                                    least(0,v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt) + 
                                    least(0,greatest(0,v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt)+v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt)+
                                    least(0,greatest(0,greatest(0,v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt)+v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt) + v_hk_trade_avail_amt);
                end if;

                /* set @临时_卖出参考汇率# = 1; */
                set v_tmp_sell_ref_rate = 1;
            else

                /* set @可用金额# = @资产账户可用金额# + @交易端可用金额#; */
                set v_avail_amt = v_asac_avail_amt + v_trade_avail_amt;

                /* set @临时_卖出参考汇率# = @卖出参考汇率#; */
                set v_tmp_sell_ref_rate = v_sell_ref_rate;
            end if;

            /* set @可用金额# = @可用金额# -GREATEST(@负债融券卖出成交金额# - @融券归还成交金额# - @融券归还订单金额#,0) ; */
            set v_avail_amt = v_avail_amt -GREATEST(v_debt_loan_sell_strike_amt - v_loan_return_strike_amt - v_loan_return_order_amt,0) ;

            /* [检查报错返回][Round(@订单冻结金额# * @临时_卖出参考汇率#,2) > @可用金额#][610][concat("可用金额=",@可用金额#,"|订单冻结金额=", Round(@订单冻结金额# * @临时_卖出参考汇率#,2),"|证券代码编号=",@证券代码编号#)] */
            if Round(v_order_frozen_amt * v_tmp_sell_ref_rate,2) > v_avail_amt then
                
                SET v_error_code = "tdsecuA.4.133.610";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用金额=",v_avail_amt,"|订单冻结金额=", Round(v_order_frozen_amt * v_tmp_sell_ref_rate,2),"|证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用金额=",v_avail_amt,"|订单冻结金额=", Round(v_order_frozen_amt * v_tmp_sell_ref_rate,2),"|证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;

        end if;

    /* elseif @订单方向# = 《订单方向-直接还券》 then */
    elseif v_order_dir = 15 then
        #先判断是否存在这只票的负债，例如欠350，只能还400，不能多还

        /* select sum({融券归还成交数量} - {融券归还订单数量}) into @负债数量# from ~交易证券_账户_交易组业务持仓负债表^ where {交易组编号} = @交易组编号# and {证券代码编号} = @证券代码编号# and {负债类型} = 《负债类型-融券》; */
        select sum(loan_return_strike_qty - loan_return_order_qty) into v_debt_qty from db_tdsecu.tb_tdseac_exgp_busi_posi_debt where exch_group_no = v_exch_group_no and stock_code_no = v_stock_code_no and debt_type = 2;

        /* set @负债数量# = ifnull(@负债数量#,0); */
        set v_debt_qty = ifnull(v_debt_qty,0);

        /* set @临时_负债数量# = @负债数量#; */
        set v_tmp_debt_qty = v_debt_qty;

        /* set @负债数量# = round( (@负债数量# + @交易组负债融券卖出成交数量#) /100)*100; */
        set v_debt_qty = round( (v_debt_qty + v_exgp_debt_loan_sell_strike_qty) /100)*100;

        /* [检查报错返回][@订单数量#>@负债数量# or @负债数量# = 0 ][611][@订单数量#,@负债数量#] */
        if v_order_qty>v_debt_qty or v_debt_qty = 0  then
            
            SET v_error_code = "tdsecuA.4.133.611";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单数量=",v_order_qty,",","负债数量=",v_debt_qty),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单数量=",v_order_qty,",","负债数量=",v_debt_qty);
            end if;
            leave label_pro;
        end if;


        /* set @负债数量# = @临时_负债数量#; */
        set v_debt_qty = v_tmp_debt_qty;

        /* if substring(@交易组业务控制配置串#,2,1) <> 《交易持仓校验-否》 then */
        if substring(v_exgp_busi_config_str,2,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算交易组持仓可用】*/
            call db_tdsecu.pra_tdseac_CalcExgpPosiAvail(
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
                v_posi_reback_days,
                v_error_code,
                v_error_info,
                v_comm_avail_qty,
                v_trade_avail_qty,
                v_static_avail_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组持仓可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @可用数量#=@交易组可用数量# + @交易端可用数量#; */
            set v_avail_qty=v_exgp_avail_qty + v_trade_avail_qty;

            /* [检查报错返回][@订单数量#>@可用数量#][605][@可用数量#,@订单数量#] */
            if v_order_qty>v_avail_qty then
                
                SET v_error_code = "tdsecuA.4.133.605";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if substring(@资产账户业务控制配置串#,2,1) <> 《交易持仓校验-否》 then */
        if substring(v_asac_busi_config_str,2,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算资产账户持仓可用】*/
            call db_tdsecu.pra_tdseac_CalcAsacPosiAvail(
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
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_posi_reback_days,
                v_error_code,
                v_error_info,
                v_comm_avail_qty,
                v_trade_avail_qty,
                v_static_avail_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.4.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户持仓可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @可用数量#=@资产账户可用数量# + @交易端可用数量#; */
            set v_avail_qty=v_asac_avail_qty + v_trade_avail_qty;

            /* [检查报错返回][@订单数量#>@可用数量#][606][@可用数量#,@订单数量#] */
            if v_order_qty>v_avail_qty then
                
                SET v_error_code = "tdsecuA.4.133.606";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用数量=",v_avail_qty,",","订单数量=",v_order_qty);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if (@证券类型# > (20)) and (@证券类型# < (50)) then */
        if (v_stock_type > (20)) and (v_stock_type < (50)) then

            /* set @最小单位# = 10; */
            set v_min_unit = 10;

        /* elseif @市场编号#<>3  and @市场编号#<>4  then */
        elseif v_exch_no<>3  and v_exch_no<>4  then

            /* set @最小单位# = 100; */
            set v_min_unit = 100;
        end if;

        /* [检查报错返回][(mod(@订单数量#,@最小单位#) > 0) and (mod(@可用数量# - @订单数量#,@最小单位#)>0)][715][@订单数量#,@证券代码编号#] */
        if (mod(v_order_qty,v_min_unit) > 0) and (mod(v_avail_qty - v_order_qty,v_min_unit)>0) then
            
            SET v_error_code = "tdsecuA.4.133.715";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单数量=",v_order_qty,",","证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_deal_flag = v_deal_flag;
    SET p_debt_qty = v_debt_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_获取负债类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_GetDebtType;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_GetDebtType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_order_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_debt_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_debt_type = 0;

    
    label_pro:BEGIN
    

    /* if @订单方向# = 《订单方向-融资买入》  or @订单方向# = 《订单方向-卖券还款》 or @订单方向# = 《订单方向-直接还款》  then */
    if v_order_dir = 5  or v_order_dir = 7 or v_order_dir = 14  then

        /* set @负债类型# = 《负债类型-融资》; */
        set v_debt_type = 1;
    else

        /* set @负债类型# = 《负债类型-融券》; */
        set v_debt_type = 2;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_debt_type = v_debt_type;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询回报订单个数
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_GetRspOrderCount;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_GetRspOrderCount(
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_report_date int;
    declare v_report_no varchar(32);
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录数量][交易证券_交易_订单表][@记录个数#][{通道编号} = @通道编号# and {外部账号} = @外部账号# and {市场编号} = @市场编号# and {申报日期} = @申报日期# and {申报编号} = @申报编号#] */
    select count(1) into v_record_count from db_tdsecu.tb_tdsetd_order where pass_no = v_pass_no and out_acco = v_out_acco and exch_no = v_exch_no and report_date = v_report_date and report_no = v_report_no;


    /* if @记录个数# = 0 then */
    if v_record_count = 0 then

        /* [获取历史表记录数量][交易证券_交易_订单表][@记录个数#][{通道编号} = @通道编号# and {外部账号} = @外部账号# and {市场编号} = @市场编号# and {申报日期} = @申报日期# and {申报编号} = @申报编号#] */
        select count(1) into v_record_count from db_tdsecu_his.tb_tdsetd_order_his where pass_no = v_pass_no and out_acco = v_out_acco and exch_no = v_exch_no and report_date = v_report_date and report_no = v_report_no;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_检查是否存在融资负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_CheckExistFinaDebt;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_CheckExistFinaDebt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exgp_debt_fina_buy_strike_amt decimal(18,4),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
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
    declare v_exgp_debt_fina_buy_strike_amt decimal(18,4);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exist_debt_flag int;
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
    SET v_exgp_debt_fina_buy_strike_amt = p_exgp_debt_fina_buy_strike_amt;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exist_debt_flag = 0;
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* set @存在负债标志#=《存在负债标志-不存在》; */
    set v_exist_debt_flag=1;

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* [获取表记录数量][交易证券_账户_交易组负债明细表][@记录个数#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {负债类型} = 《负债类型-融资》 and {负债状态}=《负债状态-未归还》 and {证券代码编号} = @证券代码编号# ] */
    select count(1) into v_record_count from db_tdsecu.tb_tdseac_exgp_debtjour where co_no = v_co_no and pd_no = v_pd_no and asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and debt_type = 1 and debt_status=1 and stock_code_no = v_stock_code_no ;


    /* if @交易组负债融资买入成交金额#>0 or @记录个数#>0 then */
    if v_exgp_debt_fina_buy_strike_amt>0 or v_record_count>0 then

        /* set @存在负债标志#=《存在负债标志-存在》; */
        set v_exist_debt_flag=2;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exist_debt_flag = v_exist_debt_flag;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_修改交易时间配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_ModifyTrdTimeConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_ModifyTrdTimeConfig(
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
    SET v_exch_no = p_exch_no;
    SET v_am_trd_begin_time = p_am_trd_begin_time;
    SET v_am_trd_end_time = p_am_trd_end_time;
    SET v_pm_trd_begin_time = p_pm_trd_begin_time;
    SET v_pm_trd_end_time = p_pm_trd_end_time;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_交易_交易时间配置表][{上午交易开始时间}=@上午交易开始时间#,{上午交易结束时间}=@上午交易结束时间#,{下午交易开始时间}=@下午交易开始时间#,{下午交易结束时间}=@下午交易结束时间#][{机构编号}=@机构编号# and {市场编号}=@市场编号#][2][@机构编号#,@市场编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_trdtimeconfig set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, am_trd_begin_time=v_am_trd_begin_time,am_trd_end_time=v_am_trd_end_time,pm_trd_begin_time=v_pm_trd_begin_time,pm_trd_end_time=v_pm_trd_end_time where co_no=v_co_no and exch_no=v_exch_no;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.137.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_回退撤单修改订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_BackCancelUpdateOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_BackCancelUpdateOrder(
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
    IN p_order_id bigint,
    IN p_remark_info varchar(255),
    IN p_all_fee decimal(18,4),
    IN p_sys_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_occur_amt decimal(18,4),
    OUT p_trade_occur_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_order_dir int,
    OUT p_strike_id bigint,
    OUT p_order_oper_way varchar(2),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_order_id bigint;
    declare v_remark_info varchar(255);
    declare v_all_fee decimal(18,4);
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_order_dir int;
    declare v_strike_id bigint;
    declare v_order_oper_way varchar(2);
    declare v_combo_code varchar(32);
    declare v_tmp_remark_info varchar(255);
    declare v_tmp_all_fee decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
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
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
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
    declare v_cost_calc_type int;
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
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
    declare v_busi_opor_no int;
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_tmp_order_qty decimal(18,2);
    declare v_tmp_order_frozen_amt decimal(18,4);
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_old_order_status varchar(2);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_order_id = p_order_id;
    SET v_remark_info = p_remark_info;
    SET v_all_fee = p_all_fee;
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_order_status = "0";
    SET v_order_dir = 0;
    SET v_strike_id = 0;
    SET v_order_oper_way = " ";
    SET v_combo_code = " ";
    SET v_tmp_remark_info = " ";
    SET v_tmp_all_fee = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
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
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
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
    SET v_cost_calc_type = 0;
    SET v_exter_comm_flag = 0;
    SET v_record_valid_flag = 0;
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
    SET v_busi_opor_no = 0;
    SET v_all_wtdraw_qty = 0;
    SET v_tmp_order_qty = 0;
    SET v_tmp_order_frozen_amt = 0;
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;
    SET v_old_order_status = "0";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* set @临时_备注信息#=@备注信息#; */
    set v_tmp_remark_info=v_remark_info;

    /* set @临时_全部费用#=@全部费用#; */
    set v_tmp_all_fee=v_all_fee;
    #防止并发，加锁获取

    /* [锁定获取表记录变量][交易证券_交易_订单表][字段][字段变量][{记录序号}=@订单序号#][1][@订单序号#] */
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
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where row_id=v_order_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.138.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    #先记录总撤单数量

    /* set @总撤单数量# = @撤单数量#; */
    set v_all_wtdraw_qty = v_wtdraw_qty;

    /* set @临时_订单数量#=@订单数量#; */
    set v_tmp_order_qty=v_order_qty;

    /* set @临时_订单冻结金额# = @订单冻结金额#; */
    set v_tmp_order_frozen_amt = v_order_frozen_amt;
    #算整笔订单的的全部费用。

    /* set @全部费用#=@临时_全部费用#; */
    set v_all_fee=v_tmp_all_fee;

    /* set @订单数量# =@总撤单数量#; */
    set v_order_qty =v_all_wtdraw_qty;

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
        SET v_error_code = "tdsecuA.4.138.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算交易冻结金额和数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #计算出订单的冻结金额。

    /* if @交易冻结金额#<>0 then */
    if v_trade_frozen_amt<>0 then

        /* set @订单冻结金额#=@交易冻结金额# *@总撤单数量#/@订单数量#; */
        set v_order_frozen_amt=v_trade_frozen_amt *v_all_wtdraw_qty/v_order_qty;
    end if;

    /* set @订单冻结数量# =@交易冻结数量#; */
    set v_order_frozen_qty =v_trade_frozen_qty;

    /* if @订单状态# =《订单状态-已撤》then */
    if v_order_status ="4"then

        /* set @原订单状态#=《订单状态-已报》; */
        set v_old_order_status="2";
    else

        /* set @原订单状态#=@订单状态#; */
        set v_old_order_status=v_order_status;
    end if;

    /* set @撤单数量# = 0; */
    set v_wtdraw_qty = 0;

    /* 调用【原子_交易证券_公用_计算订单状态】*/
    call db_tdsecu.pra_tdsepb_CaclOrderStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_qty,
        v_wtdraw_qty,
        v_strike_qty,
        v_old_order_status,
        v_error_code,
        v_error_info,
        v_order_status);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuA.4.138.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @订单状态# = 《订单状态-已报》  then */
    if v_order_status = "2"  then

         /* [获取表记录变量语句][交易证券_报盘_订单回报表][count(1)][@记录个数#][{通道编号} = @通道编号# and {外部账号} = @外部账号# and {市场编号} = @市场编号# and {申报日期} = @申报日期# and {申报编号} = @申报编号# and {订单回报状态}=《订单回报状态-已报》  and {记录有效标志} =《记录有效标志-有效》 ] */
         select count(1) into v_record_count from db_tdsecu.tb_tdserp_orderrsp where pass_no = v_pass_no and out_acco = v_out_acco and exch_no = v_exch_no and report_date = v_report_date and report_no = v_report_no and order_rsp_status="1"  and record_valid_flag =1  limit 1;


         /* if @记录个数# = 0  then */
         if v_record_count = 0  then

             /* set @订单状态# = 《订单状态-未报》; */
             set v_order_status = "1";
         end if;
    end if;

    /* set @备注信息#=@临时_备注信息#; */
    set v_remark_info=v_tmp_remark_info;

    /* [更新表记录][交易证券_交易_订单表][{撤单数量}=@撤单数量#,{订单冻结数量} = @订单冻结数量#,{订单冻结金额} = @订单冻结金额#,{订单状态} = @订单状态#,{备注信息}=@备注信息#][{记录序号} = @订单序号#][2][@订单日期#,@订单序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, wtdraw_qty=v_wtdraw_qty,order_frozen_qty = v_order_frozen_qty,order_frozen_amt = v_order_frozen_amt,order_status = v_order_status,remark_info=v_remark_info where row_id = v_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.138.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,",","订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,",","订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;

    #减去撤单数量，回退

    /* set @撤单数量# =  -1*@总撤单数量#; */
    set v_wtdraw_qty =  -1*v_all_wtdraw_qty;

    /* 调用【原子_交易证券_交易_撤单回退处理汇总订单】*/
    call db_tdsecu.pra_tdsetd_CancelBackDealSumOrder(
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
        v_order_oper_way,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuA.4.138.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤单回退处理汇总订单出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @订单数量# =@总撤单数量#; */
    set v_order_qty =v_all_wtdraw_qty;

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
        SET v_error_code = "tdsecuA.4.138.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算下单交易变动金额和数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_occur_amt = v_trade_occur_amt;
    SET p_trade_occur_qty = v_trade_occur_qty;
    SET p_order_status = v_order_status;
    SET p_order_dir = v_order_dir;
    SET p_strike_id = v_strike_id;
    SET p_order_oper_way = v_order_oper_way;
    SET p_combo_code = v_combo_code;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_撤单回退处理汇总订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_CancelBackDealSumOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_CancelBackDealSumOrder(
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
    IN p_order_date int,
    IN p_order_batch_no int,
    IN p_wtdraw_qty decimal(18,2),
    IN p_order_oper_way varchar(2),
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
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_order_oper_way varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_pd_no int;
    declare v_tmp_exch_group_no int;
    declare v_tmp_asset_acco_no int;
    declare v_tmp_pass_no int;
    declare v_tmp_wtdraw_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_external_no bigint;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_sum_status varchar(2);
    declare v_waste_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_aver_price decimal(16,9);
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
    declare v_impawn_ratio decimal(18,12);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_order_date = p_order_date;
    SET v_order_batch_no = p_order_batch_no;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_order_oper_way = p_order_oper_way;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_pd_no = 0;
    SET v_tmp_exch_group_no = 0;
    SET v_tmp_asset_acco_no = 0;
    SET v_tmp_pass_no = 0;
    SET v_tmp_wtdraw_qty = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_external_no = 0;
    SET v_order_dir = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_sum_status = "0";
    SET v_waste_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_aver_price = 0;
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
    SET v_impawn_ratio = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_exter_comm_flag = 0;
    SET v_record_valid_flag = 0;

    
    label_pro:BEGIN
    

    /* [检查正常返回][@订单批号# <=0] */
    if v_order_batch_no <=0 then
        leave label_pro;
    end if;


    /* set @临时_产品编号# = @产品编号#; */
    set v_tmp_pd_no = v_pd_no;

    /* set @临时_交易组编号# = @交易组编号#; */
    set v_tmp_exch_group_no = v_exch_group_no;

    /* set @临时_资产账户编号# = @资产账户编号#; */
    set v_tmp_asset_acco_no = v_asset_acco_no;

    /* set @临时_通道编号# = @通道编号#; */
    set v_tmp_pass_no = v_pass_no;

    /* set @临时_撤单数量# = @撤单数量#; */
    set v_tmp_wtdraw_qty = v_wtdraw_qty;
    #set @临时_废单数量# = @废单数量#;

    /* [获取表记录变量][交易证券_交易_订单汇总表][{记录序号}][@记录序号#][{订单日期}=@订单日期# and {机构编号} = @机构编号# and {订单批号}= @订单批号#][4][@订单日期#, @机构编号#, @订单批号#] */
    select row_id into v_row_id from db_tdsecu.tb_tdsetd_sumorder where order_date=v_order_date and co_no = v_co_no and order_batch_no= v_order_batch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.139.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no);
        end if;
        leave label_pro;
    end if;


    /* [锁定获取表记录变量][交易证券_交易_订单汇总表][字段][字段变量][{记录序号}=@记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_crncy_type, exch_no, stock_code_no, stock_code, 
        trade_code_no, target_code_no, stock_type, asset_type, 
        external_no, order_date, order_batch_no, order_dir, 
        price_type, order_price, order_qty, order_sum_status, 
        wtdraw_qty, waste_qty, strike_amt, strike_qty, 
        strike_aver_price, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, strike_bond_accr_intrst, 
        order_oper_way, exter_comm_flag, record_valid_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_exch_crncy_type, v_exch_no, v_stock_code_no, v_stock_code, 
        v_trade_code_no, v_target_code_no, v_stock_type, v_asset_type, 
        v_external_no, v_order_date, v_order_batch_no, v_order_dir, 
        v_price_type, v_order_price, v_order_qty, v_order_sum_status, 
        v_wtdraw_qty, v_waste_qty, v_strike_amt, v_strike_qty, 
        v_strike_aver_price, v_all_fee, v_stamp_tax, v_trans_fee, 
        v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
        v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
        v_stock_settle_fee, v_net_price_flag, v_intrst_days, v_par_value, 
        v_bond_accr_intrst, v_bond_rate_type, v_impawn_ratio, v_strike_bond_accr_intrst, 
        v_order_oper_way, v_exter_comm_flag, v_record_valid_flag from db_tdsecu.tb_tdsetd_sumorder where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.139.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @撤单数量# = @临时_撤单数量# + @撤单数量#; */
    set v_wtdraw_qty = v_tmp_wtdraw_qty + v_wtdraw_qty;
    #set @废单数量# = @临时_废单数量# + @废单数量#;

    /* 调用【原子_交易证券_公用_计算订单汇总状态】*/
    call db_tdsecu.pra_tdsepb_CaclOrderSumStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_qty,
        v_wtdraw_qty,
        v_strike_qty,
        v_waste_qty,
        v_error_code,
        v_error_info,
        v_order_sum_status);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuA.4.139.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单汇总状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_交易_订单汇总表][{订单汇总状态}=@订单汇总状态#,{撤单数量}=@撤单数量#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_sumorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_sum_status=v_order_sum_status,wtdraw_qty=v_wtdraw_qty where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.139.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_回退废单修改订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_BackWasteUpdateOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_BackWasteUpdateOrder(
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
    IN p_order_id bigint,
    IN p_remark_info varchar(255),
    IN p_all_fee decimal(18,4),
    IN p_sys_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_occur_amt decimal(18,4),
    OUT p_trade_occur_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_order_dir int,
    OUT p_strike_id bigint,
    OUT p_order_oper_way varchar(2),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_order_id bigint;
    declare v_remark_info varchar(255);
    declare v_all_fee decimal(18,4);
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_order_dir int;
    declare v_strike_id bigint;
    declare v_order_oper_way varchar(2);
    declare v_combo_code varchar(32);
    declare v_tmp_remark_info varchar(255);
    declare v_tmp_all_fee decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
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
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
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
    declare v_cost_calc_type int;
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
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
    declare v_busi_opor_no int;
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_tmp_order_qty decimal(18,2);
    declare v_tmp_order_frozen_amt decimal(18,4);
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_old_order_status varchar(2);
    declare v_record_count int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_order_id = p_order_id;
    SET v_remark_info = p_remark_info;
    SET v_all_fee = p_all_fee;
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_order_status = "0";
    SET v_order_dir = 0;
    SET v_strike_id = 0;
    SET v_order_oper_way = " ";
    SET v_combo_code = " ";
    SET v_tmp_remark_info = " ";
    SET v_tmp_all_fee = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
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
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
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
    SET v_cost_calc_type = 0;
    SET v_exter_comm_flag = 0;
    SET v_record_valid_flag = 0;
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
    SET v_busi_opor_no = 0;
    SET v_all_wtdraw_qty = 0;
    SET v_tmp_order_qty = 0;
    SET v_tmp_order_frozen_amt = 0;
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;
    SET v_old_order_status = "0";
    SET v_record_count = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @临时_备注信息#=@备注信息#; */
    set v_tmp_remark_info=v_remark_info;

    /* set @临时_全部费用#=@全部费用#; */
    set v_tmp_all_fee=v_all_fee;
    #防止并发，加锁获取

    /* [锁定获取表记录变量][交易证券_交易_订单表][字段][字段变量][{记录序号}=@订单序号#][1][@订单序号#] */
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
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where row_id=v_order_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.140.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    #先记录总撤单数量

    /* set @总撤单数量# = @撤单数量#; */
    set v_all_wtdraw_qty = v_wtdraw_qty;

    /* set @临时_订单数量#=@订单数量#; */
    set v_tmp_order_qty=v_order_qty;

    /* set @临时_订单冻结金额# = @订单冻结金额#; */
    set v_tmp_order_frozen_amt = v_order_frozen_amt;
    #算整笔订单的的全部费用。

    /* set @全部费用#=@临时_全部费用#; */
    set v_all_fee=v_tmp_all_fee;

    /* set @订单数量# =@总撤单数量#; */
    set v_order_qty =v_all_wtdraw_qty;

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
        SET v_error_code = "tdsecuA.4.140.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算交易冻结金额和数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #计算出订单的冻结金额。

    /* if @交易冻结金额#<>0 then */
    if v_trade_frozen_amt<>0 then

        /* set @订单冻结金额#=@交易冻结金额# *@总撤单数量#/@订单数量#; */
        set v_order_frozen_amt=v_trade_frozen_amt *v_all_wtdraw_qty/v_order_qty;
    end if;

    /* set @订单冻结数量# =@交易冻结数量#; */
    set v_order_frozen_qty =v_trade_frozen_qty;
    #if @订单状态# =《订单状态-已撤》then
    #    set @原订单状态#=《订单状态-已报》;
    #else

        /* set @原订单状态#=《订单状态-已报》; */
        set v_old_order_status="2";
    #end if;

    /* set @撤单数量# = 0; */
    set v_wtdraw_qty = 0;

    /* 调用【原子_交易证券_公用_计算订单状态】*/
    call db_tdsecu.pra_tdsepb_CaclOrderStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_qty,
        v_wtdraw_qty,
        v_strike_qty,
        v_old_order_status,
        v_error_code,
        v_error_info,
        v_order_status);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuA.4.140.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @订单状态# = 《订单状态-已报》  then */
    if v_order_status = "2"  then

         /* [获取表记录变量语句][交易证券_报盘_订单回报表][count(1)][@记录个数#][{通道编号} = @通道编号# and {外部账号} = @外部账号# and {市场编号} = @市场编号# and {申报日期} = @申报日期# and {申报编号} = @申报编号# and {订单回报状态}=《订单回报状态-已报》  and {记录有效标志} =《记录有效标志-有效》 ] */
         select count(1) into v_record_count from db_tdsecu.tb_tdserp_orderrsp where pass_no = v_pass_no and out_acco = v_out_acco and exch_no = v_exch_no and report_date = v_report_date and report_no = v_report_no and order_rsp_status="1"  and record_valid_flag =1  limit 1;


         /* if @记录个数# = 0  then */
         if v_record_count = 0  then

             /* set @订单状态# = 《订单状态-未报》; */
             set v_order_status = "1";
         end if;
    end if;

    /* set @备注信息#=@临时_备注信息#; */
    set v_remark_info=v_tmp_remark_info;

    /* [更新表记录][交易证券_交易_订单表][{撤单数量}=@撤单数量#,{订单冻结数量} = @订单冻结数量#,{订单冻结金额} = @订单冻结金额#,{订单状态} = @订单状态#,{备注信息}=@备注信息#][{记录序号} = @订单序号#][2][@订单日期#,@订单序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, wtdraw_qty=v_wtdraw_qty,order_frozen_qty = v_order_frozen_qty,order_frozen_amt = v_order_frozen_amt,order_status = v_order_status,remark_info=v_remark_info where row_id = v_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.140.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,",","订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,",","订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;

    #减去废单数量，回退

    /* set @废单数量# =  -1*@总撤单数量#; */
    set v_waste_qty =  -1*v_all_wtdraw_qty;

    /* 调用【原子_交易证券_交易_废单回退处理汇总订单】*/
    call db_tdsecu.pra_tdsetd_WasteBackDealSumOrder(
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
        v_waste_qty,
        v_order_oper_way,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuA.4.140.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_废单回退处理汇总订单出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @订单数量# =@总撤单数量#; */
    set v_order_qty =v_all_wtdraw_qty;

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
        SET v_error_code = "tdsecuA.4.140.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算下单交易变动金额和数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_occur_amt = v_trade_occur_amt;
    SET p_trade_occur_qty = v_trade_occur_qty;
    SET p_order_status = v_order_status;
    SET p_order_dir = v_order_dir;
    SET p_strike_id = v_strike_id;
    SET p_order_oper_way = v_order_oper_way;
    SET p_combo_code = v_combo_code;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_废单回退处理汇总订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_WasteBackDealSumOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_WasteBackDealSumOrder(
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
    IN p_order_date int,
    IN p_order_batch_no int,
    IN p_waste_qty decimal(18,2),
    IN p_order_oper_way varchar(2),
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
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_waste_qty decimal(18,2);
    declare v_order_oper_way varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_pd_no int;
    declare v_tmp_exch_group_no int;
    declare v_tmp_asset_acco_no int;
    declare v_tmp_pass_no int;
    declare v_tmp_waste_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_external_no bigint;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_sum_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_aver_price decimal(16,9);
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
    declare v_impawn_ratio decimal(18,12);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_order_date = p_order_date;
    SET v_order_batch_no = p_order_batch_no;
    SET v_waste_qty = p_waste_qty;
    SET v_order_oper_way = p_order_oper_way;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_pd_no = 0;
    SET v_tmp_exch_group_no = 0;
    SET v_tmp_asset_acco_no = 0;
    SET v_tmp_pass_no = 0;
    SET v_tmp_waste_qty = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_external_no = 0;
    SET v_order_dir = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_sum_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_aver_price = 0;
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
    SET v_impawn_ratio = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_exter_comm_flag = 0;
    SET v_record_valid_flag = 0;

    
    label_pro:BEGIN
    

    /* [检查正常返回][@订单批号# <=0] */
    if v_order_batch_no <=0 then
        leave label_pro;
    end if;


    /* set @临时_产品编号# = @产品编号#; */
    set v_tmp_pd_no = v_pd_no;

    /* set @临时_交易组编号# = @交易组编号#; */
    set v_tmp_exch_group_no = v_exch_group_no;

    /* set @临时_资产账户编号# = @资产账户编号#; */
    set v_tmp_asset_acco_no = v_asset_acco_no;

    /* set @临时_通道编号# = @通道编号#; */
    set v_tmp_pass_no = v_pass_no;
    #set @临时_撤单数量# = @撤单数量#;

    /* set @临时_废单数量# = @废单数量#; */
    set v_tmp_waste_qty = v_waste_qty;

    /* [获取表记录变量][交易证券_交易_订单汇总表][{记录序号}][@记录序号#][{订单日期}=@订单日期# and {机构编号} = @机构编号# and {订单批号}= @订单批号#][4][@订单日期#, @机构编号#, @订单批号#] */
    select row_id into v_row_id from db_tdsecu.tb_tdsetd_sumorder where order_date=v_order_date and co_no = v_co_no and order_batch_no= v_order_batch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.141.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no);
        end if;
        leave label_pro;
    end if;


    /* [锁定获取表记录变量][交易证券_交易_订单汇总表][字段][字段变量][{记录序号}=@记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_crncy_type, exch_no, stock_code_no, stock_code, 
        trade_code_no, target_code_no, stock_type, asset_type, 
        external_no, order_date, order_batch_no, order_dir, 
        price_type, order_price, order_qty, order_sum_status, 
        wtdraw_qty, waste_qty, strike_amt, strike_qty, 
        strike_aver_price, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, strike_bond_accr_intrst, 
        order_oper_way, exter_comm_flag, record_valid_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_exch_crncy_type, v_exch_no, v_stock_code_no, v_stock_code, 
        v_trade_code_no, v_target_code_no, v_stock_type, v_asset_type, 
        v_external_no, v_order_date, v_order_batch_no, v_order_dir, 
        v_price_type, v_order_price, v_order_qty, v_order_sum_status, 
        v_wtdraw_qty, v_waste_qty, v_strike_amt, v_strike_qty, 
        v_strike_aver_price, v_all_fee, v_stamp_tax, v_trans_fee, 
        v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
        v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
        v_stock_settle_fee, v_net_price_flag, v_intrst_days, v_par_value, 
        v_bond_accr_intrst, v_bond_rate_type, v_impawn_ratio, v_strike_bond_accr_intrst, 
        v_order_oper_way, v_exter_comm_flag, v_record_valid_flag from db_tdsecu.tb_tdsetd_sumorder where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.4.141.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    #set @撤单数量# = @临时_撤单数量# + @撤单数量#;

    /* set @废单数量# = @临时_废单数量# + @废单数量#; */
    set v_waste_qty = v_tmp_waste_qty + v_waste_qty;

    /* 调用【原子_交易证券_公用_计算订单汇总状态】*/
    call db_tdsecu.pra_tdsepb_CaclOrderSumStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_qty,
        v_wtdraw_qty,
        v_strike_qty,
        v_waste_qty,
        v_error_code,
        v_error_info,
        v_order_sum_status);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuA.4.141.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单汇总状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_交易_订单汇总表][{订单汇总状态}=@订单汇总状态#,{废单数量}=@废单数量#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_sumorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_sum_status=v_order_sum_status,waste_qty=v_waste_qty where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.4.141.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易_查询交易组在途业务
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_QueryExgpOrderOnWayBusiness;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_QueryExgpOrderOnWayBusiness(
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
    declare v_tmp_record_count int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_tmp_record_count = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数#=0; */
    set v_record_count=0;

    /* set @临时_记录个数#=0; */
    set v_tmp_record_count=0;

    /* [获取表记录数量][交易证券_交易_订单表][@记录个数#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and ({订单状态} <> 《订单状态-废单》and {订单状态} <> 《订单状态-已撤》 and {订单状态} <> 《订单状态-审批拒绝》 and {订单状态} <> 《订单状态-已回溯》)] */
    select count(1) into v_record_count from db_tdsecu.tb_tdsetd_order where co_no = v_co_no and pd_no = v_pd_no and asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and (order_status <> "8"and order_status <> "4" and order_status <> "-2" and order_status <> "9");


     /* select count(1) into @临时_记录个数# from ~交易证券_指令_指令表^ where {机构编号} = @机构编号# and {产品编号} = @产品编号#  and {资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {指令状态} <>《指令状态-全部撤销》; */
     select count(1) into v_tmp_record_count from db_tdsecu.tb_tdseap_command where co_no = v_co_no and pd_no = v_pd_no  and asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and comm_status <>"6";
    #[获取表记录数量][交易证券_指令_指令表][@临时_记录个数#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {交易组编号} = @交易组编号# and {指令状态} <>《指令状态-全部撤销》]

    /* set @记录个数# = @记录个数# +@临时_记录个数#; */
    set v_record_count = v_record_count +v_tmp_record_count;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;

END;;


