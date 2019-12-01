DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_更新订单回报状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_UpdateOrderRspStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_UpdateOrderRspStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_rsp_id bigint,
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
    declare v_rsp_id bigint;
    declare v_order_id bigint;
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
    SET v_rsp_id = p_rsp_id;
    SET v_order_id = p_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #更新订单反馈表

    /* [更新表记录][交易证券_报盘_订单回报表][{处理状态}=《处理状态-成功》,{订单序号}=@订单序号#][{记录序号}=@回报序号#][2][@回报序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_orderrsp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_status="1",order_id=v_order_id where row_id=v_rsp_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.2.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("回报序号=",v_rsp_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("回报序号=",v_rsp_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_检查订单重复回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_CheckOrderRspDup;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_CheckOrderRspDup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_rsp_info varchar(255),
    IN p_order_rsp_status varchar(2),
    IN p_price_type int,
    IN p_order_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_rsp_id bigint,
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
    declare v_init_date int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_rsp_info varchar(255);
    declare v_order_rsp_status varchar(2);
    declare v_price_type int;
    declare v_order_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_rsp_id bigint;
    declare v_row_id bigint;
    declare v_tmp_report_no varchar(32);
    declare v_tmp_report_date int;
    declare v_tmp_report_time int;
    declare v_tmp_rsp_info varchar(255);
    declare v_tmp_price_type int;
    declare v_record_valid_flag int;
    declare v_deal_status varchar(2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
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
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_cost_calc_type int;
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
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
    SET v_init_date = p_init_date;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_rsp_info = p_rsp_info;
    SET v_order_rsp_status = p_order_rsp_status;
    SET v_price_type = p_price_type;
    SET v_order_id = p_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_rsp_id = 0;
    SET v_row_id = 0;
    SET v_tmp_report_no = " ";
    SET v_tmp_report_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_report_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_rsp_info = " ";
    SET v_tmp_price_type = 0;
    SET v_record_valid_flag = 0;
    SET v_deal_status = "0";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
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
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_cost_calc_type = 0;
    SET v_order_oper_way = " ";
    SET v_exter_comm_flag = 0;
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
    

    /* set @临时_申报编号# = @申报编号#; */
    set v_tmp_report_no = v_report_no;

    /* set @临时_申报日期# = @申报日期#; */
    set v_tmp_report_date = v_report_date;

    /* set @临时_申报时间# = @申报时间#; */
    set v_tmp_report_time = v_report_time;

    /* set @临时_回报信息# = @回报信息#; */
    set v_tmp_rsp_info = v_rsp_info;

    /* set @临时_价格类型# = @价格类型#; */
    set v_tmp_price_type = v_price_type;

    /* if @订单回报状态# = 《订单回报状态-已报废单》 then */
    if v_order_rsp_status = "3" then
      #已报废单，记录到回报表，需要处理申报编号，不然已报已经插入回报表了

        /* set @回报信息# = concat("原申报号：",@申报编号#,"。废单原因：",@回报信息#); */
        set v_rsp_info = concat("原申报号：",v_report_no,"。废单原因：",v_rsp_info);

        /* set @申报编号# = concat("P_", @申报编号#); */
        set v_report_no = concat("P_", v_report_no);
    end if;

    /* set @记录有效标志# = 《记录有效标志-有效》; */
    set v_record_valid_flag = 1;
    #此处不依赖插入表记录来避免重复，一方面是万一索引出现问题时不至于导致故障，另一方面也是避免插入加锁导致的性能损失

    /* [获取表记录变量语句][交易证券_报盘_订单回报表][IFNULL({记录序号},0),{处理状态}][@记录序号#,@处理状态#][{通道编号}=@通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {申报日期}=@申报日期# and {申报编号}=@申报编号#] */
    select IFNULL(row_id,0),deal_status into v_row_id,v_deal_status from db_tdsecu.tb_tdserp_orderrsp where pass_no=v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no and report_date=v_report_date and report_no=v_report_no limit 1;


    /* if @记录序号# = 0 then */
    if v_row_id = 0 then

        /* if @订单回报状态# = 《订单回报状态-已报废单》 then */
        if v_order_rsp_status = "3" then

            /* set @申报编号# = @临时_申报编号#; */
            set v_report_no = v_tmp_report_no;

            /* [获取表记录变量][交易证券_交易_订单表][字段][字段变量][{通道编号}=@通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {申报日期}=@申报日期# and {申报编号}=@申报编号#][4][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#] */
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
                v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where pass_no=v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no and report_date=v_report_date and report_no=v_report_no limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "tdsecuA.5.3.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no);
                end if;
                leave label_pro;
            end if;


            /* set @临时_申报编号# = concat("P_", @申报编号#); */
            set v_tmp_report_no = concat("P_", v_report_no);

            /* set @订单序号# = @记录序号#; */
            set v_order_id = v_row_id;
        else

            /* [获取表记录变量语句][交易证券_交易_订单表][字段][字段变量][{记录序号}=@订单序号#][4][@订单序号#] */
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

        end if;

        /* set @申报编号# = @临时_申报编号#; */
        set v_report_no = v_tmp_report_no;

        /* set @申报日期# = @临时_申报日期#; */
        set v_report_date = v_tmp_report_date;

        /* set @申报时间# = @临时_申报时间#; */
        set v_report_time = v_tmp_report_time;

        /* set @回报信息# = @临时_回报信息#; */
        set v_rsp_info = v_tmp_rsp_info;

        /* set @处理状态#=《处理状态-未处理》; */
        set v_deal_status="0";

        /* set @价格类型#=@临时_价格类型#; */
        set v_price_type=v_tmp_price_type;

        /* [插入表记录][交易证券_报盘_订单回报表][字段][字段变量][1][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdserp_orderrsp(
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_no, stock_acco, stock_code, 
            report_date, report_time, report_no, order_date, 
            order_id, order_dir, order_price, order_qty, 
            price_type, order_rsp_status, rsp_info, deal_status, 
            record_valid_flag, contra_no) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
            v_out_acco, v_exch_no, v_stock_acco, v_stock_code, 
            v_report_date, v_report_time, v_report_no, v_order_date, 
            v_order_id, v_order_dir, v_order_price, v_order_qty, 
            v_price_type, v_order_rsp_status, v_rsp_info, v_deal_status, 
            v_record_valid_flag, v_contra_no);
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.5.3.1";
            SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* [获取记录序号][@回报序号#] */
        select LAST_INSERT_ID() into v_rsp_id;

    else

        /* [检查报错返回][@处理状态# = 《处理状态-成功》][751][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#] */
        if v_deal_status = "1" then
            
            SET v_error_code = "tdsecuA.5.3.751";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_rsp_id = v_rsp_id;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_更新订单回报记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_UpdateOrderRsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_UpdateOrderRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_id bigint,
    IN p_rsp_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_all_fee decimal(18,4),
    IN p_wtdraw_qty decimal(18,2),
    IN p_order_frozen_amt decimal(18,4),
    IN p_order_frozen_qty decimal(18,2),
    IN p_order_status varchar(2),
    IN p_rsp_info varchar(255),
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
    declare v_rsp_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_all_fee decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_rsp_info varchar(255);
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
    SET v_order_id = p_order_id;
    SET v_rsp_id = p_rsp_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_all_fee = p_all_fee;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_order_frozen_qty = p_order_frozen_qty;
    SET v_order_status = p_order_status;
    SET v_rsp_info = p_rsp_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #更新订单表

    /* [更新表记录][交易证券_交易_订单表][{申报日期}=@申报日期#,{申报时间}=@申报时间#,{申报编号}=@申报编号#,{撤单数量}=@撤单数量#,{订单冻结金额}=@订单冻结金额#,{订单冻结数量}=@订单冻结数量#,{订单状态}=@订单状态#,{回报信息}=@回报信息#][{记录序号}=@订单序号#][2][@订单序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, report_date=v_report_date,report_time=v_report_time,report_no=v_report_no,wtdraw_qty=v_wtdraw_qty,order_frozen_amt=v_order_frozen_amt,order_frozen_qty=v_order_frozen_qty,order_status=v_order_status,rsp_info=v_rsp_info where row_id=v_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.4.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;

    #更新订单回报表

    /* [更新表记录][交易证券_报盘_订单回报表][{处理状态}=《处理状态-成功》][{记录序号}=@回报序号#][2][@回报序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_orderrsp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_status="1" where row_id=v_rsp_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.4.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("回报序号=",v_rsp_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("回报序号=",v_rsp_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_检查成交重复回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_CheckStrikeRspDup;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_CheckStrikeRspDup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_report_date int,
    IN p_report_no varchar(32),
    IN p_order_dir int,
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_deal_type int,
    IN p_rsp_info varchar(255),
    IN p_asset_acco_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_rsp_id bigint
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
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_deal_type int;
    declare v_rsp_info varchar(255);
    declare v_asset_acco_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_rsp_id bigint;
    declare v_row_id bigint;
    declare v_deal_status varchar(2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_sett_flag int;
    declare v_record_valid_flag int;
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_order_dir = p_order_dir;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_deal_type = p_strike_deal_type;
    SET v_rsp_info = p_rsp_info;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_rsp_id = 0;
    SET v_row_id = 0;
    SET v_deal_status = "0";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_sett_flag = 0;
    SET v_record_valid_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #此处不依赖插入表记录来避免重复，一方面是万一索引出现问题时不至于导致故障，另一方面也是避免插入加锁导致的性能损失

    /* [获取表记录变量语句][交易证券_报盘_成交回报表][IFNULL({记录序号},0),{处理状态}][@记录序号#,@处理状态#][{通道编号}=@通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {成交日期}=@成交日期# and {成交编号}=@成交编号# and {订单方向}=@订单方向#] */
    select IFNULL(row_id,0),deal_status into v_row_id,v_deal_status from db_tdsecu.tb_tdserp_strikersp where pass_no=v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no and strike_date=v_strike_date and strike_no=v_strike_no and order_dir=v_order_dir limit 1;


    /* set @回报序号# = @记录序号#; */
    set v_rsp_id = v_row_id;

    /* if @记录序号# = 0 then */
    if v_row_id = 0 then

        /* set @机构编号#=0; */
        set v_co_no=0;

        /* set @产品编号#=0; */
        set v_pd_no=0;

        /* set @交易组编号#=0; */
        set v_exch_group_no=0;

        /* set @资产账户编号#=0; */
        set v_asset_acco_no=0;

        /* set @处理状态#=《处理状态-未处理》; */
        set v_deal_status="0";

        /* set @清算结算标志#=《清算结算标志-未处理》; */
        set v_sett_flag=2;

        /* set @记录有效标志# = 《记录有效标志-有效》; */
        set v_record_valid_flag = 1;

        /* [插入表记录][交易证券_报盘_成交回报表][字段][字段变量][1][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#,@订单方向#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdserp_strikersp(
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_no, stock_acco, stock_code, 
            report_date, report_no, strike_date, strike_time, 
            strike_no, order_dir, strike_price, strike_qty, 
            strike_amt, strike_deal_type, rsp_info, deal_status, 
            sett_flag, record_valid_flag, asset_acco_type) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
            v_out_acco, v_exch_no, v_stock_acco, v_stock_code, 
            v_report_date, v_report_no, v_strike_date, v_strike_time, 
            v_strike_no, v_order_dir, v_strike_price, v_strike_qty, 
            v_strike_amt, v_strike_deal_type, v_rsp_info, v_deal_status, 
            v_sett_flag, v_record_valid_flag, v_asset_acco_type);
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.5.5.1";
            SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no,",","订单方向=",v_order_dir),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* [获取记录序号][@回报序号#] */
        select LAST_INSERT_ID() into v_rsp_id;

    else

        /* [检查报错返回][@处理状态# = 《处理状态-成功》][767][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#,@订单方向#] */
        if v_deal_status = "1" then
            
            SET v_error_code = "tdsecuA.5.5.767";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no,",","订单方向=",v_order_dir),"#",v_mysql_message);
            else
                SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no,",","订单方向=",v_order_dir);
            end if;
            leave label_pro;
        end if;


        /* [更新表记录][交易证券_报盘_成交回报表][{初始化日期}=@初始化日期#,{股东代码}=@股东代码#,{证券代码}=@证券代码#,{成交日期}=@成交日期#,{成交时间}=@成交时间#,{申报日期}=@申报日期#,{申报编号}=@申报编号#,{成交价格}=@成交价格#,{成交数量}=@成交数量#,{成交金额}=@成交金额#,{成交处理方式}=@成交处理方式#,{回报信息}=@回报信息#][{通道编号}=@通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {成交日期}=@成交日期# and {成交编号}=@成交编号# and {订单方向}=@订单方向#][2][@通道编号#,@外部账号#,@市场编号#,@成交日期#,@成交编号#,@订单方向#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdserp_strikersp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_init_date,stock_acco=v_stock_acco,stock_code=v_stock_code,strike_date=v_strike_date,strike_time=v_strike_time,report_date=v_report_date,report_no=v_report_no,strike_price=v_strike_price,strike_qty=v_strike_qty,strike_amt=v_strike_amt,strike_deal_type=v_strike_deal_type,rsp_info=v_rsp_info where pass_no=v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no and strike_date=v_strike_date and strike_no=v_strike_no and order_dir=v_order_dir;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.5.5.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","成交日期=",v_strike_date,",","成交编号=",v_strike_no,",","订单方向=",v_order_dir),"#",v_mysql_message);
            else
                SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","成交日期=",v_strike_date,",","成交编号=",v_strike_no,",","订单方向=",v_order_dir);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_rsp_id = v_rsp_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_检查补单订单重复回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_CheckMissOrderRspDup;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_CheckMissOrderRspDup(
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
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_order_dir int,
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_rsp_info varchar(255),
    IN p_order_rsp_status varchar(2),
    IN p_price_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_rsp_id bigint,
    OUT p_order_date int,
    OUT p_order_id bigint,
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_order_oper_way varchar(2),
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
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_dir int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_rsp_info varchar(255);
    declare v_order_rsp_status varchar(2);
    declare v_price_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_rsp_id bigint;
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_update_times int;
    declare v_record_valid_flag int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_deal_status varchar(2);
    declare v_contra_no varchar(32);
    declare v_oper_func_code varchar(16);
    declare v_exch_crncy_type varchar(3);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_order_time int;
    declare v_order_batch_no int;
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
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
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_cost_calc_type int;
    declare v_exter_comm_flag int;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_strategy_id bigint;
    declare v_sett_flag int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_order_dir = p_order_dir;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_rsp_info = p_rsp_info;
    SET v_order_rsp_status = p_order_rsp_status;
    SET v_price_type = p_price_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_rsp_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_id = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_order_oper_way = " ";
    SET v_update_times = 1;
    SET v_record_valid_flag = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_deal_status = "0";
    SET v_contra_no = " ";
    SET v_oper_func_code = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_batch_no = 0;
    SET v_order_status = "0";
    SET v_wtdraw_qty = 0;
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
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_cost_calc_type = 0;
    SET v_exter_comm_flag = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_strategy_id = 0;
    SET v_sett_flag = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    
    #此处不依赖插入表记录来避免重复，一方面是万一索引出现问题时不至于导致故障，另一方面也是避免插入加锁导致的性能损失

    /* set @记录有效标志# = 《记录有效标志-有效》; */
    set v_record_valid_flag = 1;

    /* set @记录序号# = 0; */
    set v_row_id = 0;

    /* [获取表记录变量语句][交易证券_报盘_订单回报表][字段][字段变量][{通道编号}=@通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {申报日期}=@申报日期# and {申报编号}=@申报编号#][751][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, order_price, 
        order_qty, price_type, order_rsp_status, rsp_info, 
        deal_status, record_valid_flag, contra_no into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_pass_no, v_out_acco, v_exch_no, v_stock_acco, 
        v_stock_code, v_report_date, v_report_time, v_report_no, 
        v_order_date, v_order_id, v_order_dir, v_order_price, 
        v_order_qty, v_price_type, v_order_rsp_status, v_rsp_info, 
        v_deal_status, v_record_valid_flag, v_contra_no from db_tdsecu.tb_tdserp_orderrsp where pass_no=v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no and report_date=v_report_date and report_no=v_report_no limit 1;


    /* set @回报序号# = @记录序号#; */
    set v_rsp_id = v_row_id;

    /* if @记录序号# = 0 then */
    if v_row_id = 0 then

        /* set @处理状态#=《处理状态-未处理》; */
        set v_deal_status="0";

        /* [插入表记录][交易证券_报盘_订单回报表][字段][字段变量][1][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdserp_orderrsp(
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_no, stock_acco, stock_code, 
            report_date, report_time, report_no, order_date, 
            order_id, order_dir, order_price, order_qty, 
            price_type, order_rsp_status, rsp_info, deal_status, 
            record_valid_flag, contra_no) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
            v_out_acco, v_exch_no, v_stock_acco, v_stock_code, 
            v_report_date, v_report_time, v_report_no, v_order_date, 
            v_order_id, v_order_dir, v_order_price, v_order_qty, 
            v_price_type, v_order_rsp_status, v_rsp_info, v_deal_status, 
            v_record_valid_flag, v_contra_no);
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.5.6.1";
            SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* [获取记录序号][@回报序号#] */
        select LAST_INSERT_ID() into v_rsp_id;


    /* elseif @处理状态#=《处理状态-未处理》 or @处理状态#=《处理状态-失败》 then */
    elseif v_deal_status="0" or v_deal_status="2" then

        /* [报错返回][751][@处理状态#, @通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#] */
            
            SET v_error_code = "tdsecuA.5.6.751";
            SET v_error_info = concat("处理状态=",v_deal_status,","," 通道编号=", v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no);
            leave label_pro;


    /* elseif @处理状态#=《处理状态-成功》 then */
    elseif v_deal_status="1" then

      /* [获取表记录变量][交易证券_交易_订单表][字段][字段变量][{通道编号}=@通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {申报日期}=@申报日期# and {申报编号}=@申报编号#][4][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#] */
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
          v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where pass_no=v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no and report_date=v_report_date and report_no=v_report_no limit 1;
      if FOUND_ROWS() = 0 then
                  
          SET v_error_code = "tdsecuA.5.6.4";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no),"#",v_mysql_message);
          else
              SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no);
          end if;
          leave label_pro;
      end if;


      /* set @订单序号# = @记录序号#; */
      set v_order_id = v_row_id;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_rsp_id = v_rsp_id;
    SET p_order_date = v_order_date;
    SET p_order_id = v_order_id;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_order_oper_way = v_order_oper_way;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_新增成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_AddStrike;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_AddStrike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_init_date int,
    IN p_rsp_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_target_code_no int,
    IN p_trade_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_report_date int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_id bigint,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_strike_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_strike_amt decimal(18,4),
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
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_impawn_ratio decimal(18,12),
    IN p_strike_bond_accr_intrst decimal(18,4),
    IN p_order_oper_way varchar(2),
    IN p_exter_comm_flag int,
    IN p_order_batch_no int,
    IN p_external_no bigint,
    IN p_combo_code varchar(32),
    IN p_asset_acco_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_id bigint
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
    declare v_init_date int;
    declare v_rsp_id bigint;
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
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_id bigint;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
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
    declare v_impawn_ratio decimal(18,12);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_order_batch_no int;
    declare v_external_no bigint;
    declare v_combo_code varchar(32);
    declare v_asset_acco_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_id bigint;
    declare v_mach_time int;
    declare v_record_valid_flag int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_rsp_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = p_init_date;
    SET v_rsp_id = p_rsp_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_target_code_no = p_target_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_id = p_order_id;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_price = p_strike_price;
    SET v_strike_amt = p_strike_amt;
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
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_strike_bond_accr_intrst = p_strike_bond_accr_intrst;
    SET v_order_oper_way = p_order_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_order_batch_no = p_order_batch_no;
    SET v_external_no = p_external_no;
    SET v_combo_code = p_combo_code;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_id = 0;
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_record_valid_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_rsp_info = " ";

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* set @操作员编号# = @业务操作员编号#; */
    set v_opor_no = v_busi_opor_no;

    /* set @记录有效标志# =《记录有效标志-有效》; */
    set v_record_valid_flag =1;

    /* if @体外指令标志# = 0 then */
    if v_exter_comm_flag = 0 then

      /* set @体外指令标志# = 《体外指令标志-体内》; */
      set v_exter_comm_flag = 1;
    end if;

    /* [插入表记录][交易证券_报盘_成交表][字段][字段变量][1][@成交日期#,@成交编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdserp_strike(
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco_no, 
        stock_code, stock_code_no, stock_type, asset_type, 
        comm_id, comm_batch_no, strike_date, strike_time, 
        strike_no, report_date, report_no, order_date, 
        order_time, order_batch_no, order_id, order_dir, 
        order_price, order_qty, strike_qty, strike_price, 
        strike_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, strike_bond_accr_intrst, 
        trade_code_no, target_code_no, order_oper_way, exter_comm_flag, 
        record_valid_flag, external_no, combo_code, asset_acco_type) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_pass_no, v_out_acco, v_exch_no, v_stock_acco_no, 
        v_stock_code, v_stock_code_no, v_stock_type, v_asset_type, 
        v_comm_id, v_comm_batch_no, v_strike_date, v_strike_time, 
        v_strike_no, v_report_date, v_report_no, v_order_date, 
        v_order_time, v_order_batch_no, v_order_id, v_order_dir, 
        v_order_price, v_order_qty, v_strike_qty, v_strike_price, 
        v_strike_amt, v_all_fee, v_stamp_tax, v_trans_fee, 
        v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
        v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
        v_stock_settle_fee, v_net_price_flag, v_intrst_days, v_par_value, 
        v_bond_accr_intrst, v_bond_rate_type, v_impawn_ratio, v_strike_bond_accr_intrst, 
        v_trade_code_no, v_target_code_no, v_order_oper_way, v_exter_comm_flag, 
        v_record_valid_flag, v_external_no, v_combo_code, v_asset_acco_type);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.7.1";
        SET v_error_info =  CONCAT(concat("成交日期=",v_strike_date,",","成交编号=",v_strike_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@成交序号#] */
    select LAST_INSERT_ID() into v_strike_id;

    #处理成交汇总报

    /* [插入重复更新][交易证券_报盘_成交汇总表][字段][字段变量][{成交数量}={成交数量}+@成交数量#, {成交金额} = {成交金额} + @成交金额#, {成交债券计提利息} = {成交债券计提利息} + @成交债券计提利息#][1][@订单日期#, @订单序号#, @成交编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdserp_sumstrike (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, opor_no, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, comm_id, 
        strike_date, report_date, report_no, order_date, 
        order_time, order_batch_no, order_id, order_dir, 
        order_price, order_qty, strike_qty, strike_amt, 
        all_fee, stamp_tax, trans_fee, brkage_fee, 
        SEC_charges, other_fee, trade_commis, other_commis, 
        trade_tax, trade_cost_fee, trade_system_use_fee, stock_settle_fee, 
        net_price_flag, intrst_days, par_value, bond_accr_intrst, 
        bond_rate_type, impawn_ratio, trade_code_no, target_code_no, 
        strike_bond_accr_intrst, order_oper_way, exter_comm_flag, record_valid_flag) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_opor_no, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_pass_no, v_out_acco, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_type, v_asset_type, v_comm_id, 
        v_strike_date, v_report_date, v_report_no, v_order_date, 
        v_order_time, v_order_batch_no, v_order_id, v_order_dir, 
        v_order_price, v_order_qty, v_strike_qty, v_strike_amt, 
        v_all_fee, v_stamp_tax, v_trans_fee, v_brkage_fee, 
        v_SEC_charges, v_other_fee, v_trade_commis, v_other_commis, 
        v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, v_stock_settle_fee, 
        v_net_price_flag, v_intrst_days, v_par_value, v_bond_accr_intrst, 
        v_bond_rate_type, v_impawn_ratio, v_trade_code_no, v_target_code_no, 
        v_strike_bond_accr_intrst, v_order_oper_way, v_exter_comm_flag, v_record_valid_flag) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, strike_qty=strike_qty+v_strike_qty, strike_amt = strike_amt + v_strike_amt, strike_bond_accr_intrst = strike_bond_accr_intrst + v_strike_bond_accr_intrst;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.7.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 订单序号=", v_order_id,","," 成交编号=", v_strike_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,","," 订单序号=", v_order_id,","," 成交编号=", v_strike_no);
        end if;
        leave label_pro;
    end if;

    #更新成交反馈表

    /* [更新表记录][交易证券_报盘_成交回报表][{初始化日期}=@初始化日期#,{机构编号} = @机构编号#, {产品编号} = @产品编号#, {交易组编号} = @交易组编号#, {资产账户编号} = @资产账户编号# ,{处理状态}=《处理状态-成功》,{回报信息}=concat(@回报信息#,",成交处理时间:",@机器时间#)][{记录序号}=@回报序号#][2][@回报序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_strikersp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_init_date,co_no = v_co_no, pd_no = v_pd_no, exch_group_no = v_exch_group_no, asset_acco_no = v_asset_acco_no ,deal_status="1",rsp_info=concat(v_rsp_info,",成交处理时间:",v_mach_time) where row_id=v_rsp_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.7.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("回报序号=",v_rsp_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("回报序号=",v_rsp_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_id = v_strike_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_更新成交回报费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_UpdateStrikeRspFee;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_UpdateStrikeRspFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strike_id bigint,
    IN p_order_id bigint,
    IN p_order_date int,
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
    declare v_strike_id bigint;
    declare v_order_id bigint;
    declare v_order_date int;
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
    SET v_strike_id = p_strike_id;
    SET v_order_id = p_order_id;
    SET v_order_date = p_order_date;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_交易_订单表][{全部费用}={全部费用} + @全部费用#,{印花税}={印花税} + @印花税#,{过户费} ={过户费} + @过户费#,{经手费}={经手费} + @经手费#,{证管费}={证管费} + @证管费#,{其他费用}={其他费用} + @其他费用#,{交易佣金}={交易佣金} + @交易佣金#,{其他佣金}={其他佣金} + @其他佣金#,{交易费}={交易费} + @交易费#,{交易系统使用费}={交易系统使用费} + @交易系统使用费#,{交易征费}={交易征费} + @交易征费#,{股份交收费}={股份交收费} + @股份交收费#][{记录序号}=@订单序号#][2][@订单序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, all_fee=all_fee + v_all_fee,stamp_tax=stamp_tax + v_stamp_tax,trans_fee =trans_fee + v_trans_fee,brkage_fee=brkage_fee + v_brkage_fee,SEC_charges=SEC_charges + v_SEC_charges,other_fee=other_fee + v_other_fee,trade_commis=trade_commis + v_trade_commis,other_commis=other_commis + v_other_commis,trade_cost_fee=trade_cost_fee + v_trade_cost_fee,trade_system_use_fee=trade_system_use_fee + v_trade_system_use_fee,trade_tax=trade_tax + v_trade_tax,stock_settle_fee=stock_settle_fee + v_stock_settle_fee where row_id=v_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.8.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_报盘_成交表][{全部费用}=@全部费用#,{印花税}=@印花税#,{过户费}=@过户费#,{经手费}=@经手费#,{证管费}=@证管费#,{其他费用}=@其他费用#,{交易佣金}=@交易佣金#,{其他佣金}=@其他佣金#,{交易费}={交易费} + @交易费#,{交易系统使用费}={交易系统使用费} + @交易系统使用费#,{交易征费}={交易征费} + @交易征费#,{股份交收费}={股份交收费} + @股份交收费#][{记录序号}=@成交序号#][2][@成交序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_strike set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, all_fee=v_all_fee,stamp_tax=v_stamp_tax,trans_fee=v_trans_fee,brkage_fee=v_brkage_fee,SEC_charges=v_SEC_charges,other_fee=v_other_fee,trade_commis=v_trade_commis,other_commis=v_other_commis,trade_cost_fee=trade_cost_fee + v_trade_cost_fee,trade_system_use_fee=trade_system_use_fee + v_trade_system_use_fee,trade_tax=trade_tax + v_trade_tax,stock_settle_fee=stock_settle_fee + v_stock_settle_fee where row_id=v_strike_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.8.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("成交序号=",v_strike_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("成交序号=",v_strike_id);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_报盘_成交汇总表][{全部费用}={全部费用} + @全部费用#,{印花税}={印花税} + @印花税#,{过户费} ={过户费} + @过户费#,{经手费}={经手费} + @经手费#,{证管费}={证管费} + @证管费#,{其他费用}={其他费用} + @其他费用#,{交易佣金}={交易佣金} + @交易佣金#,{其他佣金}={其他佣金} + @其他佣金#,{交易费}={交易费} + @交易费#,{交易系统使用费}={交易系统使用费} + @交易系统使用费#,{交易征费}={交易征费} + @交易征费#,{股份交收费}={股份交收费} + @股份交收费#][{订单日期}=@订单日期# and {订单序号} = @订单序号#][2][@订单日期#, @订单序号#, @成交序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_sumstrike set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, all_fee=all_fee + v_all_fee,stamp_tax=stamp_tax + v_stamp_tax,trans_fee =trans_fee + v_trans_fee,brkage_fee=brkage_fee + v_brkage_fee,SEC_charges=SEC_charges + v_SEC_charges,other_fee=other_fee + v_other_fee,trade_commis=trade_commis + v_trade_commis,other_commis=other_commis + v_other_commis,trade_cost_fee=trade_cost_fee + v_trade_cost_fee,trade_system_use_fee=trade_system_use_fee + v_trade_system_use_fee,trade_tax=trade_tax + v_trade_tax,stock_settle_fee=stock_settle_fee + v_stock_settle_fee where order_date=v_order_date and order_id = v_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.8.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 订单序号=", v_order_id,","," 成交序号=", v_strike_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,","," 订单序号=", v_order_id,","," 成交序号=", v_strike_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_回溯取体外指令成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_BackGetExterCommStrike;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_BackGetExterCommStrike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_id bigint,
    IN p_strike_id bigint,
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
    OUT p_stock_code varchar(6),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_comm_batch_no int,
    OUT p_strike_date int,
    OUT p_strike_time int,
    OUT p_strike_no varchar(64),
    OUT p_report_date int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_batch_no int,
    OUT p_order_id bigint,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_amt decimal(18,4),
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
    OUT p_impawn_ratio decimal(18,12),
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_order_oper_way varchar(2),
    OUT p_exter_comm_flag int,
    OUT p_record_valid_flag int,
    OUT p_busi_opor_no int,
    OUT p_external_no bigint
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
    declare v_strike_id bigint;
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
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_comm_batch_no int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
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
    declare v_impawn_ratio decimal(18,12);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
    declare v_busi_opor_no int;
    declare v_external_no bigint;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_asset_type int;
    declare v_order_time int;
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_combo_code varchar(32);
    declare v_asset_acco_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_strike_id = p_strike_id;
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
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_comm_batch_no = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_batch_no = 0;
    SET v_order_id = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_strike_qty = 0;
    SET v_strike_price = 0;
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
    SET v_impawn_ratio = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_order_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_record_valid_flag = 0;
    SET v_busi_opor_no = 0;
    SET v_external_no = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_asset_type = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_strike_bond_accr_intrst = 0;
    SET v_combo_code = " ";
    SET v_asset_acco_type = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易证券_报盘_成交表][字段][字段变量][{记录序号} = @成交序号# and {指令序号} = @指令序号#][4][@成交序号#, @指令序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, exch_no, 
        stock_acco_no, stock_code, stock_code_no, stock_type, 
        asset_type, comm_id, comm_batch_no, strike_date, 
        strike_time, strike_no, report_date, report_no, 
        order_date, order_time, order_batch_no, order_id, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_price, strike_amt, all_fee, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, trade_tax, trade_cost_fee, 
        trade_system_use_fee, stock_settle_fee, net_price_flag, intrst_days, 
        par_value, bond_accr_intrst, bond_rate_type, impawn_ratio, 
        strike_bond_accr_intrst, trade_code_no, target_code_no, order_oper_way, 
        exter_comm_flag, record_valid_flag, external_no, combo_code, 
        asset_acco_type into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_no, 
        v_init_date, v_co_no, v_pd_no, v_exch_group_no, 
        v_asset_acco_no, v_pass_no, v_out_acco, v_exch_no, 
        v_stock_acco_no, v_stock_code, v_stock_code_no, v_stock_type, 
        v_asset_type, v_comm_id, v_comm_batch_no, v_strike_date, 
        v_strike_time, v_strike_no, v_report_date, v_report_no, 
        v_order_date, v_order_time, v_order_batch_no, v_order_id, 
        v_order_dir, v_order_price, v_order_qty, v_strike_qty, 
        v_strike_price, v_strike_amt, v_all_fee, v_stamp_tax, 
        v_trans_fee, v_brkage_fee, v_SEC_charges, v_other_fee, 
        v_trade_commis, v_other_commis, v_trade_tax, v_trade_cost_fee, 
        v_trade_system_use_fee, v_stock_settle_fee, v_net_price_flag, v_intrst_days, 
        v_par_value, v_bond_accr_intrst, v_bond_rate_type, v_impawn_ratio, 
        v_strike_bond_accr_intrst, v_trade_code_no, v_target_code_no, v_order_oper_way, 
        v_exter_comm_flag, v_record_valid_flag, v_external_no, v_combo_code, 
        v_asset_acco_type from db_tdsecu.tb_tdserp_strike where row_id = v_strike_id and comm_id = v_comm_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.5.9.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("成交序号=",v_strike_id,","," 指令序号=", v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("成交序号=",v_strike_id,","," 指令序号=", v_comm_id);
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
    SET p_stock_code = v_stock_code;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_strike_date = v_strike_date;
    SET p_strike_time = v_strike_time;
    SET p_strike_no = v_strike_no;
    SET p_report_date = v_report_date;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_id = v_order_id;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_price = v_strike_price;
    SET p_strike_amt = v_strike_amt;
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
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_order_oper_way = v_order_oper_way;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_record_valid_flag = v_record_valid_flag;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_external_no = v_external_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_成交回溯更新回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_BackStrikeUpdateRspStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_BackStrikeUpdateRspStatus(
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
    IN p_strike_date int,
    IN p_strike_no varchar(64),
    IN p_order_dir int,
    IN p_rsp_info varchar(255),
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
    declare v_exch_no int;
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_rsp_info varchar(255);
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_no = p_strike_no;
    SET v_order_dir = p_order_dir;
    SET v_rsp_info = p_rsp_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #更新订单回报表

    /* [更新表记录][交易证券_报盘_订单回报表][{记录有效标志} = 《记录有效标志-无效》, {回报信息}=@回报信息#][{通道编号}=@通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {申报日期}=@申报日期# and {申报编号}=@申报编号#][2][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_orderrsp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, record_valid_flag = 2, rsp_info=v_rsp_info where pass_no=v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no and report_date=v_report_date and report_no=v_report_no;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.10.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no);
        end if;
        leave label_pro;
    end if;

    #更新成交回报表

    /* [更新表记录][交易证券_报盘_成交回报表][{记录有效标志} = 《记录有效标志-无效》, {回报信息}=@回报信息#][{通道编号}=@通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {成交日期}=@成交日期# and {成交编号}=@成交编号# and {订单方向}=@订单方向#][2][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#,@订单方向#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_strikersp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, record_valid_flag = 2, rsp_info=v_rsp_info where pass_no=v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no and strike_date=v_strike_date and strike_no=v_strike_no and order_dir=v_order_dir;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.10.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no,",","订单方向=",v_order_dir),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no,",","订单方向=",v_order_dir);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_成交回溯更新成交记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_BackStrikeUpdateStrikeFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_BackStrikeUpdateStrikeFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_strike_id bigint,
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
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_strike_id bigint;
    declare v_comm_id bigint;
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
    SET v_strike_id = p_strike_id;
    SET v_comm_id = p_comm_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_报盘_成交表][{记录有效标志} = 《记录有效标志-无效》][{记录序号}=@成交序号# and {指令序号}=@指令序号# ][2][@成交序号#,@指令序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_strike set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, record_valid_flag = 2 where row_id=v_strike_id and comm_id=v_comm_id ;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.11.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("成交序号=",v_strike_id,",","指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("成交序号=",v_strike_id,",","指令序号=",v_comm_id);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_报盘_成交汇总表][{记录有效标志} = 《记录有效标志-无效》][{订单日期}=@订单日期# and {订单序号}=@订单序号# ][2][@订单日期#, @订单序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_sumstrike set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, record_valid_flag = 2 where order_date=v_order_date and order_id=v_order_id ;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.11.2";
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

# 原子_交易证券_报盘_组合可用不足处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_ComboNotEnoughDeal;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_ComboNotEnoughDeal(
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
    IN p_exch_group_no int,
    IN p_out_acco varchar(32),
    IN p_stock_acco varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_strike_date int,
    IN p_strike_id bigint,
    IN p_order_dir int,
    IN p_occur_amt decimal(18,4),
    IN p_occur_qty decimal(18,2),
    IN p_amt_diff decimal(18,4),
    IN p_diff_qty decimal(18,2),
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
    declare v_exch_group_no int;
    declare v_out_acco varchar(32);
    declare v_stock_acco varchar(16);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_strike_date int;
    declare v_strike_id bigint;
    declare v_order_dir int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_amt_diff decimal(18,4);
    declare v_diff_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_deal_status varchar(2);
    declare v_deal_amt_diff decimal(18,4);
    declare v_deal_diff_qty decimal(18,2);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_out_acco = p_out_acco;
    SET v_stock_acco = p_stock_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_strike_date = p_strike_date;
    SET v_strike_id = p_strike_id;
    SET v_order_dir = p_order_dir;
    SET v_occur_amt = p_occur_amt;
    SET v_occur_qty = p_occur_qty;
    SET v_amt_diff = p_amt_diff;
    SET v_diff_qty = p_diff_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_deal_status = "0";
    SET v_deal_amt_diff = 0;
    SET v_deal_diff_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @处理状态# =《处理状态-未处理》; */
    set v_deal_status ="0";

    /* set @已处理金额差额# =0; */
    set v_deal_amt_diff =0;

    /* set @已处理数量差额# =0; */
    set v_deal_diff_qty =0;

    /* [插入重复更新][交易证券_报盘_体外交易差额记录表][字段][字段变量][{变动金额}={变动金额}+@变动金额#,{变动数量}={变动数量}+@变动数量#, {金额差额} = {金额差额} + @金额差额#, {数量差额} = {数量差额} + @数量差额#][1][@成交序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdserp_outtradedifflog (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, out_acco, 
        stock_acco, exch_no, stock_code, stock_code_no, 
        order_date, order_id, strike_date, strike_id, 
        order_dir, occur_amt, occur_qty, amt_diff, 
        diff_qty, deal_amt_diff, deal_diff_qty, deal_status) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_out_acco, 
        v_stock_acco, v_exch_no, v_stock_code, v_stock_code_no, 
        v_order_date, v_order_id, v_strike_date, v_strike_id, 
        v_order_dir, v_occur_amt, v_occur_qty, v_amt_diff, 
        v_diff_qty, v_deal_amt_diff, v_deal_diff_qty, v_deal_status) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, occur_amt=occur_amt+v_occur_amt,occur_qty=occur_qty+v_occur_qty, amt_diff = amt_diff + v_amt_diff, diff_qty = diff_qty + v_diff_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.12.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("成交序号=",v_strike_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("成交序号=",v_strike_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_查询订单回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_QueryOrderRsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_QueryOrderRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_order_dir_str varchar(1024),
    IN p_order_rsp_status_str varchar(64),
    IN p_deal_status_str varchar(64),
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_order_dir_str varchar(1024);
    declare v_order_rsp_status_str varchar(64);
    declare v_deal_status_str varchar(64);
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_rsp_status_str = p_order_rsp_status_str;
    SET v_deal_status_str = p_deal_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_报盘_订单回报表][字段][(@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@股东代码#=" " or {股东代码}=@股东代码#) and (@证券代码#=" " or {证券代码}=@证券代码#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@订单回报状态串#=" " or instr(@订单回报状态串#,concat(";",{订单回报状态},";"))>0) and (@处理状态串#=" " or instr(@处理状态串#,concat(";",{处理状态},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#,concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, order_price, 
        order_qty, price_type, order_rsp_status, rsp_info, 
        deal_status, record_valid_flag, contra_no from db_tdsecu.tb_tdserp_orderrsp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_acco=" " or stock_acco=v_stock_acco) and (v_stock_code=" " or stock_code=v_stock_code) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_order_rsp_status_str=" " or instr(v_order_rsp_status_str,concat(";",order_rsp_status,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, order_price, 
        order_qty, price_type, order_rsp_status, rsp_info, 
        deal_status, record_valid_flag, contra_no from db_tdsecu.tb_tdserp_orderrsp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_acco=" " or stock_acco=v_stock_acco) and (v_stock_code=" " or stock_code=v_stock_code) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_order_rsp_status_str=" " or instr(v_order_rsp_status_str,concat(";",order_rsp_status,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_查询成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_QueryStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_QueryStrikeRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_order_dir_str varchar(1024),
    IN p_deal_status_str varchar(64),
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_order_dir_str varchar(1024);
    declare v_deal_status_str varchar(64);
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_order_dir_str = p_order_dir_str;
    SET v_deal_status_str = p_deal_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_报盘_成交回报表][字段][(@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@股东代码#=" " or {股东代码}=@股东代码#) and (@证券代码#=" " or {证券代码}=@证券代码#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@处理状态串#=" " or instr(@处理状态串#,concat(";",{处理状态},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#,concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt, strike_deal_type, rsp_info, 
        deal_status, sett_flag, record_valid_flag, asset_acco_type from db_tdsecu.tb_tdserp_strikersp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_acco=" " or stock_acco=v_stock_acco) and (v_stock_code=" " or stock_code=v_stock_code) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt, strike_deal_type, rsp_info, 
        deal_status, sett_flag, record_valid_flag, asset_acco_type from db_tdsecu.tb_tdserp_strikersp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_acco=" " or stock_acco=v_stock_acco) and (v_stock_code=" " or stock_code=v_stock_code) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_查询成交明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_QueryStrikeDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_QueryStrikeDetail(
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
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_dir_str varchar(1024),
    IN p_exter_comm_flag int,
    IN p_record_valid_flag int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_order_batch_no int,
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_order_batch_no int;
    declare v_combo_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_record_valid_flag = p_record_valid_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_order_batch_no = p_order_batch_no;
    SET v_combo_code = p_combo_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no = 0;

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易证券_报盘_成交表][{记录序号},{更新次数},{操作员编号} as {查询操作员编号},
{初始化日期},
{机构编号},
{产品编号},
{交易组编号},
{资产账户编号},
{通道编号},
{外部账号},
{市场编号},
{股东代码编号},
{证券代码},
{证券代码编号},
{证券类型},
{资产类型},
{指令序号},
{指令批号},
{成交日期},
{成交时间},
{成交编号},
{申报日期},
{申报编号},
{订单日期},
{订单时间},
{订单批号},
{订单序号},
{订单方向},
{订单价格},
{订单数量},
{成交数量},
{成交价格},
{成交金额},
{全部费用},
{印花税},
{过户费},
{经手费},
{证管费},
{其他费用},
{交易佣金},
{其他佣金},
{交易征费},
{交易费},
{交易系统使用费},
{股份交收费},
{净价标志},
{计息天数},
{票面面值},
{债券计提利息},
{债券利率类型},
{质押比例},
{成交债券计提利息},
{交易代码编号},
{标的代码编号},
{订单操作方式},
{体外指令标志},
{记录有效标志},
{外部编号},
{组合代码}
][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@体外指令标志# = 0 or {体外指令标志} = @体外指令标志#) and (@记录有效标志# = 0 or {记录有效标志}=@记录有效标志#) and  (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#,concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#,concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0) and  (@组合代码# = " " or {组合代码} = @组合代码#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id,update_times,opor_no as query_opor_no,
        init_date,
        co_no,
        pd_no,
        exch_group_no,
        asset_acco_no,
        pass_no,
        out_acco,
        exch_no,
        stock_acco_no,
        stock_code,
        stock_code_no,
        stock_type,
        asset_type,
        comm_id,
        comm_batch_no,
        strike_date,
        strike_time,
        strike_no,
        report_date,
        report_no,
        order_date,
        order_time,
        order_batch_no,
        order_id,
        order_dir,
        order_price,
        order_qty,
        strike_qty,
        strike_price,
        strike_amt,
        all_fee,
        stamp_tax,
        trans_fee,
        brkage_fee,
        SEC_charges,
        other_fee,
        trade_commis,
        other_commis,
        trade_tax,
        trade_cost_fee,
        trade_system_use_fee,
        stock_settle_fee,
        net_price_flag,
        intrst_days,
        par_value,
        bond_accr_intrst,
        bond_rate_type,
        impawn_ratio,
        strike_bond_accr_intrst,
        trade_code_no,
        target_code_no,
        order_oper_way,
        exter_comm_flag,
        record_valid_flag,
        external_no,
        combo_code
         from db_tdsecu.tb_tdserp_strike where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_record_valid_flag = 0 or record_valid_flag=v_record_valid_flag) and  (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and  (v_combo_code = " " or combo_code = v_combo_code) and row_id>v_row_id order by row_id;
        else
            select row_id,update_times,opor_no as query_opor_no,
        init_date,
        co_no,
        pd_no,
        exch_group_no,
        asset_acco_no,
        pass_no,
        out_acco,
        exch_no,
        stock_acco_no,
        stock_code,
        stock_code_no,
        stock_type,
        asset_type,
        comm_id,
        comm_batch_no,
        strike_date,
        strike_time,
        strike_no,
        report_date,
        report_no,
        order_date,
        order_time,
        order_batch_no,
        order_id,
        order_dir,
        order_price,
        order_qty,
        strike_qty,
        strike_price,
        strike_amt,
        all_fee,
        stamp_tax,
        trans_fee,
        brkage_fee,
        SEC_charges,
        other_fee,
        trade_commis,
        other_commis,
        trade_tax,
        trade_cost_fee,
        trade_system_use_fee,
        stock_settle_fee,
        net_price_flag,
        intrst_days,
        par_value,
        bond_accr_intrst,
        bond_rate_type,
        impawn_ratio,
        strike_bond_accr_intrst,
        trade_code_no,
        target_code_no,
        order_oper_way,
        exter_comm_flag,
        record_valid_flag,
        external_no,
        combo_code
         from db_tdsecu.tb_tdserp_strike where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_record_valid_flag = 0 or record_valid_flag=v_record_valid_flag) and  (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and  (v_combo_code = " " or combo_code = v_combo_code) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易证券_报盘_成交表][{记录序号},{更新次数},{操作员编号} as {查询操作员编号},
{初始化日期},
{机构编号},
{产品编号},
{交易组编号},
{资产账户编号},
{通道编号},
{外部账号},
{市场编号},
{股东代码编号},
{证券代码},
{证券代码编号},
{证券类型},
{资产类型},
{指令序号},
{指令批号},
{成交日期},
{成交时间},
{成交编号},
{申报日期},
{申报编号},
{订单日期},
{订单时间},
{订单批号},
{订单序号},
{订单方向},
{订单价格},
{订单数量},
{成交数量},
{成交价格},
{成交金额},
{全部费用},
{印花税},
{过户费},
{经手费},
{证管费},
{其他费用},
{交易佣金},
{其他佣金},
{交易征费},
{交易费},
{交易系统使用费},
{股份交收费},
{净价标志},
{计息天数},
{票面面值},
{债券计提利息},
{债券利率类型},
{质押比例},
{成交债券计提利息},
{交易代码编号},
{标的代码编号},
{订单操作方式},
{体外指令标志},
{记录有效标志},
{外部编号},
{组合代码}
][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@体外指令标志# = 0 or {体外指令标志} = @体外指令标志#) and (@记录有效标志# = 0 or {记录有效标志}=@记录有效标志#) and  (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#,concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#)  and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#,concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0) and  ({组合代码} = " " or {组合代码} = @组合代码#) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id,update_times,opor_no as query_opor_no,
        init_date,
        co_no,
        pd_no,
        exch_group_no,
        asset_acco_no,
        pass_no,
        out_acco,
        exch_no,
        stock_acco_no,
        stock_code,
        stock_code_no,
        stock_type,
        asset_type,
        comm_id,
        comm_batch_no,
        strike_date,
        strike_time,
        strike_no,
        report_date,
        report_no,
        order_date,
        order_time,
        order_batch_no,
        order_id,
        order_dir,
        order_price,
        order_qty,
        strike_qty,
        strike_price,
        strike_amt,
        all_fee,
        stamp_tax,
        trans_fee,
        brkage_fee,
        SEC_charges,
        other_fee,
        trade_commis,
        other_commis,
        trade_tax,
        trade_cost_fee,
        trade_system_use_fee,
        stock_settle_fee,
        net_price_flag,
        intrst_days,
        par_value,
        bond_accr_intrst,
        bond_rate_type,
        impawn_ratio,
        strike_bond_accr_intrst,
        trade_code_no,
        target_code_no,
        order_oper_way,
        exter_comm_flag,
        record_valid_flag,
        external_no,
        combo_code
         from db_tdsecu.tb_tdserp_strike where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_record_valid_flag = 0 or record_valid_flag=v_record_valid_flag) and  (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no)  and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and  (combo_code = " " or combo_code = v_combo_code) and row_id<v_row_id order by row_id desc;
        else
            select row_id,update_times,opor_no as query_opor_no,
        init_date,
        co_no,
        pd_no,
        exch_group_no,
        asset_acco_no,
        pass_no,
        out_acco,
        exch_no,
        stock_acco_no,
        stock_code,
        stock_code_no,
        stock_type,
        asset_type,
        comm_id,
        comm_batch_no,
        strike_date,
        strike_time,
        strike_no,
        report_date,
        report_no,
        order_date,
        order_time,
        order_batch_no,
        order_id,
        order_dir,
        order_price,
        order_qty,
        strike_qty,
        strike_price,
        strike_amt,
        all_fee,
        stamp_tax,
        trans_fee,
        brkage_fee,
        SEC_charges,
        other_fee,
        trade_commis,
        other_commis,
        trade_tax,
        trade_cost_fee,
        trade_system_use_fee,
        stock_settle_fee,
        net_price_flag,
        intrst_days,
        par_value,
        bond_accr_intrst,
        bond_rate_type,
        impawn_ratio,
        strike_bond_accr_intrst,
        trade_code_no,
        target_code_no,
        order_oper_way,
        exter_comm_flag,
        record_valid_flag,
        external_no,
        combo_code
         from db_tdsecu.tb_tdserp_strike where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_record_valid_flag = 0 or record_valid_flag=v_record_valid_flag) and  (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no)  and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and  (combo_code = " " or combo_code = v_combo_code) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_查询成交明细历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_QueryStrikeDetail_His;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_QueryStrikeDetail_His(
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
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_batch_no int,
    IN p_order_dir_str varchar(1024),
    IN p_exter_comm_flag int,
    IN p_record_valid_flag int,
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
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_combo_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_record_valid_flag = p_record_valid_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_combo_code = p_combo_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no = 0;

    
    label_pro:BEGIN
    
    #思路:先根据条件查询出结果集，再进行排序和limit
    #set @指定行数#=1000;

    /* set @通道编号#=0; */
    set v_pass_no=0;
     #select {记录序号},{操作员编号} as {查询操作员编号},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{市场编号},{股东代码编号},{证券代码},{证券代码编号},{证券类型},{指令序号},{指令批号},{成交日期},{成交时间},{成交编号},{申报日期},{申报编号},{订单日期},{订单时间},{订单序号},{订单批号},{订单方向},{订单价格},{订单数量},{成交数量},{成交价格},{成交金额},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{交易征费},{交易费},{交易系统使用费},{股份交收费},{债券计提利息},{净价标志},{成交债券计提利息},{订单操作方式},{体外指令标志},{记录有效标志},{外部编号},{组合代码},{更新次数} from db_tdsecu_his.tb_tdserp_strike_his where row_id in (select row_id from db_tdsecu_his.tb_tdserp_strike_his force index(idx_tb_tdserp_strike_his_2) where  (init_date between v_begin_date and v_end_date) and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_record_valid_flag = 0 or record_valid_flag=v_record_valid_flag) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and  (v_combo_code = " " or combo_code = v_combo_code) and row_id>v_row_id) order by row_id limit v_row_count;

     /* select {记录序号},{操作员编号} as {查询操作员编号},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{市场编号},{股东代码编号},{证券代码},{证券代码编号},{证券类型},{指令序号},{指令批号},{成交日期},{成交时间},{成交编号},{申报日期},{申报编号},{订单日期},{订单时间},{订单序号},{订单批号},{订单方向},{订单价格},{订单数量},{成交数量},{成交价格},{成交金额},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{交易征费},{交易费},{交易系统使用费},{股份交收费},{债券计提利息},{净价标志},{成交债券计提利息},{订单操作方式},{体外指令标志},{记录有效标志},{外部编号},{组合代码},{更新次数} from db_tdsecu_his.tb_tdserp_strike_his force index(idx_tb_tdserp_strike_his_2) where  init_date = v_begin_date and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_record_valid_flag = 0 or record_valid_flag=v_record_valid_flag) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and  (v_combo_code = " " or combo_code = v_combo_code) and row_id>v_row_id order by row_id; */
     select row_id,opor_no as query_opor_no,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_code,stock_code_no,stock_type,comm_id,comm_batch_no,strike_date,strike_time,strike_no,report_date,report_no,order_date,order_time,order_id,order_batch_no,order_dir,order_price,order_qty,strike_qty,strike_price,strike_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,trade_tax,trade_cost_fee,trade_system_use_fee,stock_settle_fee,bond_accr_intrst,net_price_flag,strike_bond_accr_intrst,order_oper_way,exter_comm_flag,record_valid_flag,external_no,combo_code,update_times from db_tdsecu_his.tb_tdserp_strike_his force index(idx_tb_tdserp_strike_his_2) where  init_date = v_begin_date and (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_record_valid_flag = 0 or record_valid_flag=v_record_valid_flag) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and  (v_combo_code = " " or combo_code = v_combo_code) and row_id>v_row_id order by row_id;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_查询成交汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_QueryStrikeSummary;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_QueryStrikeSummary(
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
    IN p_comm_id bigint,
    IN p_order_batch_no int,
    IN p_order_dir_str varchar(1024),
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
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_order_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_exter_comm_flag int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_comm_id = p_comm_id;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no = 0;

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易证券_报盘_成交汇总表][字段][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@体外指令标志# = 0 or {体外指令标志} = @体外指令标志#) and ({记录有效标志}=《记录有效标志-有效》) and  (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and  (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#,concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#,concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, out_acco, exch_no, 
            stock_acco_no, stock_code_no, stock_type, asset_type, 
            comm_id, strike_date, report_date, report_no, 
            order_date, order_time, order_batch_no, order_id, 
            order_dir, order_price, order_qty, strike_qty, 
            strike_amt, all_fee, stamp_tax, trans_fee, 
            brkage_fee, SEC_charges, other_fee, trade_commis, 
            other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
            stock_settle_fee, net_price_flag, intrst_days, par_value, 
            bond_accr_intrst, bond_rate_type, impawn_ratio, trade_code_no, 
            target_code_no, strike_bond_accr_intrst, order_oper_way, exter_comm_flag, 
            record_valid_flag from db_tdsecu.tb_tdserp_sumstrike where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (record_valid_flag=1) and  (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and  (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, out_acco, exch_no, 
            stock_acco_no, stock_code_no, stock_type, asset_type, 
            comm_id, strike_date, report_date, report_no, 
            order_date, order_time, order_batch_no, order_id, 
            order_dir, order_price, order_qty, strike_qty, 
            strike_amt, all_fee, stamp_tax, trans_fee, 
            brkage_fee, SEC_charges, other_fee, trade_commis, 
            other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
            stock_settle_fee, net_price_flag, intrst_days, par_value, 
            bond_accr_intrst, bond_rate_type, impawn_ratio, trade_code_no, 
            target_code_no, strike_bond_accr_intrst, order_oper_way, exter_comm_flag, 
            record_valid_flag from db_tdsecu.tb_tdserp_sumstrike where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (record_valid_flag=1) and  (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and  (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易证券_报盘_成交汇总表][字段][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@体外指令标志# = 0 or {体外指令标志} = @体外指令标志#) and ({记录有效标志}=《记录有效标志-有效》) and  (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and  (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#,concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#,concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, out_acco, exch_no, 
            stock_acco_no, stock_code_no, stock_type, asset_type, 
            comm_id, strike_date, report_date, report_no, 
            order_date, order_time, order_batch_no, order_id, 
            order_dir, order_price, order_qty, strike_qty, 
            strike_amt, all_fee, stamp_tax, trans_fee, 
            brkage_fee, SEC_charges, other_fee, trade_commis, 
            other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
            stock_settle_fee, net_price_flag, intrst_days, par_value, 
            bond_accr_intrst, bond_rate_type, impawn_ratio, trade_code_no, 
            target_code_no, strike_bond_accr_intrst, order_oper_way, exter_comm_flag, 
            record_valid_flag from db_tdsecu.tb_tdserp_sumstrike where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (record_valid_flag=1) and  (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and  (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id<v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, out_acco, exch_no, 
            stock_acco_no, stock_code_no, stock_type, asset_type, 
            comm_id, strike_date, report_date, report_no, 
            order_date, order_time, order_batch_no, order_id, 
            order_dir, order_price, order_qty, strike_qty, 
            strike_amt, all_fee, stamp_tax, trans_fee, 
            brkage_fee, SEC_charges, other_fee, trade_commis, 
            other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
            stock_settle_fee, net_price_flag, intrst_days, par_value, 
            bond_accr_intrst, bond_rate_type, impawn_ratio, trade_code_no, 
            target_code_no, strike_bond_accr_intrst, order_oper_way, exter_comm_flag, 
            record_valid_flag from db_tdsecu.tb_tdserp_sumstrike where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (record_valid_flag=1) and  (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and  (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_查询成交汇总历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_QueryStrikeSummary_His;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_QueryStrikeSummary_His(
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
    IN p_comm_id bigint,
    IN p_order_batch_no int,
    IN p_order_dir_str varchar(1024),
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
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_order_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_exter_comm_flag int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_comm_id = p_comm_id;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_交易证券_报盘_成交汇总表][字段][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and  ({初始化日期} between @开始日期# and @结束日期#) and (@体外指令标志# = 0 or {体外指令标志} = @体外指令标志#) and ({记录有效标志}=《记录有效标志-有效》) and  (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and  (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#,concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#,concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_id, strike_date, report_date, report_no, 
        order_date, order_time, order_batch_no, order_id, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, trade_code_no, 
        target_code_no, strike_bond_accr_intrst, order_oper_way, exter_comm_flag, 
        record_valid_flag from db_tdsecu_his.tb_tdserp_sumstrike_his where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and  (init_date between v_begin_date and v_end_date) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (record_valid_flag=1) and  (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and  (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_id, strike_date, report_date, report_no, 
        order_date, order_time, order_batch_no, order_id, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, trade_code_no, 
        target_code_no, strike_bond_accr_intrst, order_oper_way, exter_comm_flag, 
        record_valid_flag from db_tdsecu_his.tb_tdserp_sumstrike_his where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and  (init_date between v_begin_date and v_end_date) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (record_valid_flag=1) and  (v_order_oper_way=" " or order_oper_way=v_order_oper_way) and  (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_获取订单回报状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_GetOrderRspStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_GetOrderRspStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_rsp_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_deal_status varchar(2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_rsp_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_deal_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_rsp_id = p_rsp_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_deal_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_报盘_订单回报表][{处理状态}][@处理状态#][{记录序号}=@回报序号#] */
    select deal_status into v_deal_status from db_tdsecu.tb_tdserp_orderrsp where row_id=v_rsp_id limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_deal_status = v_deal_status;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_查询体外交易差额记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_QueryOutTradeDiffRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_QueryOutTradeDiffRecord(
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
    IN p_order_dir_str varchar(1024),
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
    declare v_order_dir_str varchar(1024);
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
    SET v_order_dir_str = p_order_dir_str;
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

        /* [获取表记录][交易证券_报盘_体外交易差额记录表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#)  and  (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#,concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, pd_no, asset_acco_no, exch_group_no, 
            out_acco, stock_acco, exch_no, stock_code, 
            stock_code_no, order_date, order_id, strike_date, 
            strike_id, order_dir, occur_amt, occur_qty, 
            amt_diff, diff_qty, deal_amt_diff, deal_diff_qty, 
            deal_status from db_tdsecu.tb_tdserp_outtradedifflog where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no)  and  (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, pd_no, asset_acco_no, exch_group_no, 
            out_acco, stock_acco, exch_no, stock_code, 
            stock_code_no, order_date, order_id, strike_date, 
            strike_id, order_dir, occur_amt, occur_qty, 
            amt_diff, diff_qty, deal_amt_diff, deal_diff_qty, 
            deal_status from db_tdsecu.tb_tdserp_outtradedifflog where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no)  and  (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易证券_报盘_体外交易差额记录表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and  (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#,concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, pd_no, asset_acco_no, exch_group_no, 
            out_acco, stock_acco, exch_no, stock_code, 
            stock_code_no, order_date, order_id, strike_date, 
            strike_id, order_dir, occur_amt, occur_qty, 
            amt_diff, diff_qty, deal_amt_diff, deal_diff_qty, 
            deal_status from db_tdsecu.tb_tdserp_outtradedifflog where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and  (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id<v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, pd_no, asset_acco_no, exch_group_no, 
            out_acco, stock_acco, exch_no, stock_code, 
            stock_code_no, order_date, order_id, strike_date, 
            strike_id, order_dir, occur_amt, occur_qty, 
            amt_diff, diff_qty, deal_amt_diff, deal_diff_qty, 
            deal_status from db_tdsecu.tb_tdserp_outtradedifflog where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and  (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_查询历史体外交易差额记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_QueryOutTradeDiffRecord_His;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_QueryOutTradeDiffRecord_His(
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
    IN p_order_dir_str varchar(1024),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_order_dir_str varchar(1024);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_交易证券_报盘_体外交易差额记录表][字段][ ({初始化日期} between @开始日期# and @结束日期#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#)  and  (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#,concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        out_acco, stock_acco, exch_no, stock_code, 
        stock_code_no, order_date, order_id, strike_date, 
        strike_id, order_dir, occur_amt, occur_qty, 
        amt_diff, diff_qty, deal_amt_diff, deal_diff_qty, 
        deal_status from db_tdsecu_his.tb_tdserp_outtradedifflog_his where  (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no)  and  (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        out_acco, stock_acco, exch_no, stock_code, 
        stock_code_no, order_date, order_id, strike_date, 
        strike_id, order_dir, occur_amt, occur_qty, 
        amt_diff, diff_qty, deal_amt_diff, deal_diff_qty, 
        deal_status from db_tdsecu_his.tb_tdserp_outtradedifflog_his where  (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no)  and  (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_导入成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_ImportStrike;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_ImportStrike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_init_date int,
    IN p_rsp_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_target_code_no int,
    IN p_trade_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_report_date int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_id bigint,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_strike_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_strike_amt decimal(18,4),
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
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_impawn_ratio decimal(18,12),
    IN p_strike_bond_accr_intrst decimal(18,4),
    IN p_order_oper_way varchar(2),
    IN p_exter_comm_flag int,
    IN p_order_batch_no int,
    IN p_external_no bigint,
    IN p_combo_code varchar(32),
    IN p_asset_acco_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_id bigint
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
    declare v_init_date int;
    declare v_rsp_id bigint;
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
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_id bigint;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
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
    declare v_impawn_ratio decimal(18,12);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_order_batch_no int;
    declare v_external_no bigint;
    declare v_combo_code varchar(32);
    declare v_asset_acco_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_id bigint;
    declare v_mach_time int;
    declare v_record_valid_flag int;
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_init_date = p_init_date;
    SET v_rsp_id = p_rsp_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_target_code_no = p_target_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_id = p_order_id;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_price = p_strike_price;
    SET v_strike_amt = p_strike_amt;
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
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_strike_bond_accr_intrst = p_strike_bond_accr_intrst;
    SET v_order_oper_way = p_order_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_order_batch_no = p_order_batch_no;
    SET v_external_no = p_external_no;
    SET v_combo_code = p_combo_code;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_id = 0;
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_record_valid_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* set @操作员编号# = @业务操作员编号#; */
    set v_opor_no = v_busi_opor_no;

    /* set @记录有效标志# =《记录有效标志-有效》; */
    set v_record_valid_flag =1;

    /* if @体外指令标志# = 0 then */
    if v_exter_comm_flag = 0 then

      /* set @体外指令标志# = 《体外指令标志-体内》; */
      set v_exter_comm_flag = 1;
    end if;
    #[获取表记录数量][交易证券_报盘_成交表][@记录个数#][{通道编号}=@通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {成交日期}=@成交日期# and {成交编号}=@成交编号# and {订单方向}=@订单方向#]
    #[检查报错返回][@记录个数# <> 0][1][concat(@通道编号#,@外部账号#,@市场编号#,@成交日期#,@成交编号#,@订单方向#,"导入成交数据不能重复！")]

    /* [插入表记录][交易证券_报盘_成交表][字段][字段变量][1][@成交日期#,@成交编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdserp_strike(
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco_no, 
        stock_code, stock_code_no, stock_type, asset_type, 
        comm_id, comm_batch_no, strike_date, strike_time, 
        strike_no, report_date, report_no, order_date, 
        order_time, order_batch_no, order_id, order_dir, 
        order_price, order_qty, strike_qty, strike_price, 
        strike_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, strike_bond_accr_intrst, 
        trade_code_no, target_code_no, order_oper_way, exter_comm_flag, 
        record_valid_flag, external_no, combo_code, asset_acco_type) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_pass_no, v_out_acco, v_exch_no, v_stock_acco_no, 
        v_stock_code, v_stock_code_no, v_stock_type, v_asset_type, 
        v_comm_id, v_comm_batch_no, v_strike_date, v_strike_time, 
        v_strike_no, v_report_date, v_report_no, v_order_date, 
        v_order_time, v_order_batch_no, v_order_id, v_order_dir, 
        v_order_price, v_order_qty, v_strike_qty, v_strike_price, 
        v_strike_amt, v_all_fee, v_stamp_tax, v_trans_fee, 
        v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
        v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
        v_stock_settle_fee, v_net_price_flag, v_intrst_days, v_par_value, 
        v_bond_accr_intrst, v_bond_rate_type, v_impawn_ratio, v_strike_bond_accr_intrst, 
        v_trade_code_no, v_target_code_no, v_order_oper_way, v_exter_comm_flag, 
        v_record_valid_flag, v_external_no, v_combo_code, v_asset_acco_type);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.128.1";
        SET v_error_info =  CONCAT(concat("成交日期=",v_strike_date,",","成交编号=",v_strike_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@成交序号#] */
    select LAST_INSERT_ID() into v_strike_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_id = v_strike_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_导入更新成交回报费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_ImportUpdateStrikeRspFee;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_ImportUpdateStrikeRspFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strike_id bigint,
    IN p_order_id bigint,
    IN p_order_date int,
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
    declare v_strike_id bigint;
    declare v_order_id bigint;
    declare v_order_date int;
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
    SET v_strike_id = p_strike_id;
    SET v_order_id = p_order_id;
    SET v_order_date = p_order_date;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_交易_订单表][{全部费用}={全部费用} + @全部费用#,{印花税}={印花税} + @印花税#,{过户费} ={过户费} + @过户费#,{经手费}={经手费} + @经手费#,{证管费}={证管费} + @证管费#,{其他费用}={其他费用} + @其他费用#,{交易佣金}={交易佣金} + @交易佣金#,{其他佣金}={其他佣金} + @其他佣金#,{交易费}={交易费} + @交易费#,{交易系统使用费}={交易系统使用费} + @交易系统使用费#,{交易征费}={交易征费} + @交易征费#,{股份交收费}={股份交收费} + @股份交收费#][{记录序号}=@订单序号#][2][@订单序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, all_fee=all_fee + v_all_fee,stamp_tax=stamp_tax + v_stamp_tax,trans_fee =trans_fee + v_trans_fee,brkage_fee=brkage_fee + v_brkage_fee,SEC_charges=SEC_charges + v_SEC_charges,other_fee=other_fee + v_other_fee,trade_commis=trade_commis + v_trade_commis,other_commis=other_commis + v_other_commis,trade_cost_fee=trade_cost_fee + v_trade_cost_fee,trade_system_use_fee=trade_system_use_fee + v_trade_system_use_fee,trade_tax=trade_tax + v_trade_tax,stock_settle_fee=stock_settle_fee + v_stock_settle_fee where row_id=v_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.129.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_报盘_成交表][{全部费用}=@全部费用#,{印花税}=@印花税#,{过户费}=@过户费#,{经手费}=@经手费#,{证管费}=@证管费#,{其他费用}=@其他费用#,{交易佣金}=@交易佣金#,{其他佣金}=@其他佣金#,{交易费}={交易费} + @交易费#,{交易系统使用费}={交易系统使用费} + @交易系统使用费#,{交易征费}={交易征费} + @交易征费#,{股份交收费}={股份交收费} + @股份交收费#][{记录序号}=@成交序号#][2][@成交序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_strike set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, all_fee=v_all_fee,stamp_tax=v_stamp_tax,trans_fee=v_trans_fee,brkage_fee=v_brkage_fee,SEC_charges=v_SEC_charges,other_fee=v_other_fee,trade_commis=v_trade_commis,other_commis=v_other_commis,trade_cost_fee=trade_cost_fee + v_trade_cost_fee,trade_system_use_fee=trade_system_use_fee + v_trade_system_use_fee,trade_tax=trade_tax + v_trade_tax,stock_settle_fee=stock_settle_fee + v_stock_settle_fee where row_id=v_strike_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.129.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("成交序号=",v_strike_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("成交序号=",v_strike_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_错单修改成交回溯更新成交记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_BackErrorStrikeUpdateStrikeFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_BackErrorStrikeUpdateStrikeFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_strike_id bigint,
    IN p_comm_id bigint,
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
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
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_strike_id bigint;
    declare v_comm_id bigint;
    declare v_strike_qty decimal(18,2);
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_amt decimal(18,4);
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
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_strike_date int;
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_order_time int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_order_oper_way varchar(2);
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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_strike_id = p_strike_id;
    SET v_comm_id = p_comm_id;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
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
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_no = " ";
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_batch_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_order_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_record_valid_flag = 0;

    
    label_pro:BEGIN
    

    /* set @临时_成交数量#=@成交数量#; */
    set v_tmp_strike_qty=v_strike_qty;

    /* set @临时_成交金额#=@成交金额#; */
    set v_tmp_strike_amt=v_strike_amt;

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

    /* [更新表记录][交易证券_报盘_成交表][{记录有效标志} = 《记录有效标志-无效》][{记录序号}=@成交序号# and {指令序号}=@指令序号# ][2][@成交序号#,@指令序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_strike set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, record_valid_flag = 2 where row_id=v_strike_id and comm_id=v_comm_id ;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.130.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("成交序号=",v_strike_id,",","指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("成交序号=",v_strike_id,",","指令序号=",v_comm_id);
        end if;
        leave label_pro;
    end if;


    /* [锁定获取表记录变量][交易证券_报盘_成交汇总表][字段][字段变量][{订单日期}=@订单日期# and {订单序号}=@订单序号#][1][@订单日期#, @订单序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_id, strike_date, report_date, report_no, 
        order_date, order_time, order_batch_no, order_id, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, trade_code_no, 
        target_code_no, strike_bond_accr_intrst, order_oper_way, exter_comm_flag, 
        record_valid_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_opor_no, v_co_no, v_pd_no, v_exch_group_no, 
        v_asset_acco_no, v_pass_no, v_out_acco, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_type, v_asset_type, 
        v_comm_id, v_strike_date, v_report_date, v_report_no, 
        v_order_date, v_order_time, v_order_batch_no, v_order_id, 
        v_order_dir, v_order_price, v_order_qty, v_strike_qty, 
        v_strike_amt, v_all_fee, v_stamp_tax, v_trans_fee, 
        v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
        v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
        v_stock_settle_fee, v_net_price_flag, v_intrst_days, v_par_value, 
        v_bond_accr_intrst, v_bond_rate_type, v_impawn_ratio, v_trade_code_no, 
        v_target_code_no, v_strike_bond_accr_intrst, v_order_oper_way, v_exter_comm_flag, 
        v_record_valid_flag from db_tdsecu.tb_tdserp_sumstrike where order_date=v_order_date and order_id=v_order_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.5.130.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 订单序号=", v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,","," 订单序号=", v_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @成交数量#=@成交数量#-@临时_成交数量#; */
    set v_strike_qty=v_strike_qty-v_tmp_strike_qty;

    /* set @成交金额#=@成交金额#-@临时_成交金额#; */
    set v_strike_amt=v_strike_amt-v_tmp_strike_amt;

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

    /* [更新表记录][交易证券_报盘_成交汇总表][{成交数量} = @成交数量#,{成交金额}=@成交金额#,{全部费用} = @全部费用#,{印花税} = @印花税#,{过户费} = @过户费#,{经手费} = @经手费#,{证管费} = @证管费#,{其他费用} = @其他费用#,{交易佣金} = @交易佣金#,{其他佣金} = @其他佣金#,{交易征费} = @交易征费#,{交易费} = @交易费#,{交易系统使用费} = @交易系统使用费#,{股份交收费} = @股份交收费#][{订单日期}=@订单日期# and {订单序号}=@订单序号# ][2][@订单日期#, @订单序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_sumstrike set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_qty = v_strike_qty,strike_amt=v_strike_amt,all_fee = v_all_fee,stamp_tax = v_stamp_tax,trans_fee = v_trans_fee,brkage_fee = v_brkage_fee,SEC_charges = v_SEC_charges,other_fee = v_other_fee,trade_commis = v_trade_commis,other_commis = v_other_commis,trade_tax = v_trade_tax,trade_cost_fee = v_trade_cost_fee,trade_system_use_fee = v_trade_system_use_fee,stock_settle_fee = v_stock_settle_fee where order_date=v_order_date and order_id=v_order_id ;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.130.2";
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

# 原子_交易证券_报盘_融资融券更新订单回报记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_FinaLoanUpdateOrderRsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_FinaLoanUpdateOrderRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_id bigint,
    IN p_rsp_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_all_fee decimal(18,4),
    IN p_wtdraw_qty decimal(18,2),
    IN p_order_frozen_amt decimal(18,4),
    IN p_order_frozen_qty decimal(18,2),
    IN p_order_status varchar(2),
    IN p_rsp_info varchar(255),
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
    declare v_order_id bigint;
    declare v_rsp_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_all_fee decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_rsp_info varchar(255);
    declare v_contra_no varchar(32);
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
    SET v_order_id = p_order_id;
    SET v_rsp_id = p_rsp_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_all_fee = p_all_fee;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_order_frozen_qty = p_order_frozen_qty;
    SET v_order_status = p_order_status;
    SET v_rsp_info = p_rsp_info;
    SET v_contra_no = p_contra_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #更新订单表

    /* [更新表记录][交易证券_交易_订单表][{申报日期}=@申报日期#,{申报时间}=@申报时间#,{申报编号}=@申报编号#,{撤单数量}=@撤单数量#,{订单冻结金额}=@订单冻结金额#,{订单冻结数量}=@订单冻结数量#,{订单状态}=@订单状态#,{回报信息}=@回报信息#,{合同编号}=@合同编号#][{记录序号}=@订单序号#][2][@订单序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, report_date=v_report_date,report_time=v_report_time,report_no=v_report_no,wtdraw_qty=v_wtdraw_qty,order_frozen_amt=v_order_frozen_amt,order_frozen_qty=v_order_frozen_qty,order_status=v_order_status,rsp_info=v_rsp_info,contra_no=v_contra_no where row_id=v_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.131.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;

    #更新订单回报表

    /* [更新表记录][交易证券_报盘_订单回报表][{处理状态}=《处理状态-成功》][{记录序号}=@回报序号#][2][@回报序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_orderrsp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_status="1" where row_id=v_rsp_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.5.131.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("回报序号=",v_rsp_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("回报序号=",v_rsp_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_报盘_检查撤单回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserp_CheckCancelRsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserp_CheckCancelRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_wtdraw_qty decimal(18,2),
    IN p_rsp_status varchar(2),
    IN p_rsp_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_rsp_id bigint
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
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_wtdraw_qty decimal(18,2);
    declare v_rsp_status varchar(2);
    declare v_rsp_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_rsp_id bigint;
    declare v_row_id bigint;
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_rsp_status = p_rsp_status;
    SET v_rsp_info = p_rsp_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_rsp_id = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #此处不依赖插入表记录来避免重复，一方面是万一索引出现问题时不至于导致故障，另一方面也是避免插入加锁导致的性能损失

    /* [获取表记录变量语句][交易证券_报盘_撤单回报表][IFNULL({记录序号},0)][@记录序号#][{通道编号}=@通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {申报日期}=@申报日期# and {申报编号}=@申报编号#] */
    select IFNULL(row_id,0) into v_row_id from db_tdsecu.tb_tdserp_cancelrsp where pass_no=v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no and report_date=v_report_date and report_no=v_report_no limit 1;


    /* set @回报序号# = @记录序号#; */
    set v_rsp_id = v_row_id;

    /* if @记录序号# = 0 then */
    if v_row_id = 0 then

        /* [插入表记录][交易证券_报盘_撤单回报表][字段][字段变量][1][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdserp_cancelrsp(
            create_date, create_time, update_date, 
            update_time, update_times, init_date, pass_no, 
            out_acco, exch_no, stock_code, report_date, 
            report_time, report_no, wtdraw_qty, rsp_status, 
            rsp_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_pass_no, 
            v_out_acco, v_exch_no, v_stock_code, v_report_date, 
            v_report_time, v_report_no, v_wtdraw_qty, v_rsp_status, 
            v_rsp_info);
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.5.132.1";
            SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* [获取记录序号][@回报序号#] */
        select LAST_INSERT_ID() into v_rsp_id;

    else

        /* [更新表记录][交易证券_报盘_撤单回报表][{初始化日期}=@初始化日期#,{申报时间}=@申报时间#,{撤单数量}=@撤单数量#,{回报状态}=@回报状态#,{回报信息}=@回报信息#][{通道编号}=@通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号#  and {申报日期} = @申报日期# and {申报编号} = @申报编号#][2][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdserp_cancelrsp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_init_date,report_time=v_report_time,wtdraw_qty=v_wtdraw_qty,rsp_status=v_rsp_status,rsp_info=v_rsp_info where pass_no=v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no  and report_date = v_report_date and report_no = v_report_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.5.132.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_rsp_id = v_rsp_id;

END;;


