DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_处理清算成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_DealClearStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_DealClearStrikeRsp(
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
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_target_stock_code_no int,
    OUT p_target_stock_code varchar(6),
    OUT p_stock_type int,
    OUT p_asset_type int,
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
    OUT p_all_fee decimal(18,4),
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_impawn_ratio decimal(18,12),
    OUT p_strike_deal_type int,
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
    OUT p_stock_settle_fee decimal(18,4)
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_target_stock_code varchar(6);
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
    declare v_all_fee decimal(18,4);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_strike_deal_type int;
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
    declare v_stock_acco varchar(16);
    declare v_rsp_info varchar(255);
    declare v_deal_status varchar(2);
    declare v_sett_flag int;
    declare v_record_valid_flag int;
    declare v_asset_acco_type int;
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_row_id bigint;
    declare v_oper_func_code varchar(16);
    declare v_exch_crncy_type varchar(3);
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_order_batch_no int;
    declare v_price_type int;
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
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
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_contra_no varchar(32);
    declare v_exist_debt_flag int;
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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_row_id = 0;
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
    SET v_target_stock_code_no = 0;
    SET v_target_stock_code = " ";
    SET v_stock_type = 0;
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
    SET v_all_fee = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_strike_deal_type = 0;
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
    SET v_stock_acco = " ";
    SET v_rsp_info = " ";
    SET v_deal_status = "0";
    SET v_sett_flag = 0;
    SET v_record_valid_flag = 0;
    SET v_asset_acco_type = 0;
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_amt = 0;
    SET v_tmp_row_id = 0;
    SET v_oper_func_code = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_order_batch_no = 0;
    SET v_price_type = 0;
    SET v_order_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_strike_bond_accr_intrst = 0;
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
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_contra_no = " ";
    SET v_exist_debt_flag = 0;
    SET v_order_id = 0;

    
    label_pro:BEGIN
    

    /* set @全部费用#=0; */
    set v_all_fee=0;

    /* set @印花税#=0; */
    set v_stamp_tax=0;

    /* set @过户费#=0; */
    set v_trans_fee=0;

    /* set @经手费#=0; */
    set v_brkage_fee=0;

    /* set @证管费#=0; */
    set v_SEC_charges=0;

    /* set @其他费用#=0; */
    set v_other_fee=0;

    /* set @交易佣金#=0; */
    set v_trade_commis=0;

    /* set @其他佣金#=0; */
    set v_other_commis=0;

    /* set @交易征费#=0; */
    set v_trade_tax=0;

    /* set @交易费#=0; */
    set v_trade_cost_fee=0;

    /* set @交易系统使用费#=0; */
    set v_trade_system_use_fee=0;

    /* set @股份交收费#=0; */
    set v_stock_settle_fee=0;

    /* set @记录个数# = 0; */
    set v_record_count = 0;
    #不再考虑交易系统比清算系统提前归历史的问题，需清算的数据全在当前表

    /* [不报错锁定获取表记录变量][交易证券_报盘_成交回报表][字段][字段变量][{记录序号} = @查询序号# and {成交日期} = @初始化日期# and {记录有效标志} = 《记录有效标志-有效》 and {清算结算标志} <>《清算结算标志-已处理》  and  ({资产账户类型} = 《资产账户类型-A股》 or {资产账户类型} = 《资产账户类型-OTC账户》)  and {处理状态} =《处理状态-成功》 ][4][@初始化日期#,@查询记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt, strike_deal_type, rsp_info, 
        deal_status, sett_flag, record_valid_flag, asset_acco_type into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_pass_no, v_out_acco, v_exch_no, v_stock_acco, 
        v_stock_code, v_report_date, v_report_no, v_strike_date, 
        v_strike_time, v_strike_no, v_order_dir, v_strike_price, 
        v_strike_qty, v_strike_amt, v_strike_deal_type, v_rsp_info, 
        v_deal_status, v_sett_flag, v_record_valid_flag, v_asset_acco_type from db_tdsecu.tb_tdserp_strikersp where row_id = v_qry_no and strike_date = v_init_date and record_valid_flag = 1 and sett_flag <>1  and  (asset_acco_type = 1 or asset_acco_type = 4)  and deal_status ="1"  limit 1 for update;

    #[不报错锁定获取表记录变量][交易证券_报盘_成交回报表][字段][字段变量][{记录序号} > @查询序号# and {成交日期} = @初始化日期# and {记录有效标志} = 《记录有效标志-有效》 and {清算结算标志} <>《清算结算标志-已处理》  and  {资产账户类型} = 《资产账户类型-A股》  and {处理状态} =《处理状态-成功》 order by {记录序号}][4][@初始化日期#,@查询记录序号#]

    /* [检查正常返回][FOUND_ROWS() = 0] */
    if FOUND_ROWS() = 0 then
        leave label_pro;
    end if;


    /* set @记录个数# = 1; */
    set v_record_count = 1;

    /* set @临时_成交数量# = @成交数量#; */
    set v_tmp_strike_qty = v_strike_qty;

    /* set @临时_成交金额# = @成交金额#; */
    set v_tmp_strike_amt = v_strike_amt;

    /* set @临时_记录序号# = @记录序号#; */
    set v_tmp_row_id = v_row_id;

    /* [更新表记录][交易证券_报盘_成交回报表][{清算结算标志}=《清算结算标志-已处理》][{记录序号} = @记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_strikersp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_flag=1 where row_id = v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.20.1.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* if @市场编号#<>《市场编号-场外交易市场》 then */
    if v_exch_no<>5 then

        /* [获取表记录变量][交易证券_交易_订单表][字段][字段变量][{通道编号} = @通道编号# and {外部账号} = @外部账号# and {市场编号} = @市场编号# and {申报日期} = @申报日期# and {申报编号} = @申报编号#][4][@通道编号#, @外部账号#,@市场编号#, @申报日期#, @申报编号#] */
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
            v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where pass_no = v_pass_no and out_acco = v_out_acco and exch_no = v_exch_no and report_date = v_report_date and report_no = v_report_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "tdsecuA.20.1.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,","," 外部账号=", v_out_acco,",","市场编号=",v_exch_no,","," 申报日期=", v_report_date,","," 申报编号=", v_report_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("通道编号=",v_pass_no,","," 外部账号=", v_out_acco,",","市场编号=",v_exch_no,","," 申报日期=", v_report_date,","," 申报编号=", v_report_no);
            end if;
            leave label_pro;
        end if;


        /* set @订单编号# = @记录序号#; */
        set v_order_no = v_row_id;

        /* set @目标证券代码#=" "; */
        set v_target_stock_code=" ";

        /* set @目标证券代码编号#=0; */
        set v_target_stock_code_no=0;
    else

        /* [获取表记录变量][交易证券_报盘_成交表][{订单序号},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{交易征费},{交易费},{交易系统使用费},{股份交收费},{证券类型},{资产类型},{股东代码编号},{证券代码编号},{订单日期},{订单数量},{订单价格},{交易代码编号},{标的代码编号}][@订单序号#,@全部费用#,@印花税#,@过户费#,@经手费#,@证管费#,@其他费用#,@交易佣金#,@其他佣金#,@交易征费#,@交易费#,@交易系统使用费#,@股份交收费#,@证券类型#,@资产类型#,@股东代码编号#,@证券代码编号#,@订单日期#,@订单数量#,@订单价格#,@交易代码编号#,@标的代码编号#][{通道编号} = @通道编号# and {外部账号} = @外部账号# and {市场编号} = @市场编号# and {成交日期} = @成交日期# and {成交编号} = @成交编号# and {订单方向}=@订单方向#][4][@通道编号#, @外部账号#,@市场编号#, @成交日期#, @成交编号#,@订单方向#] */
        select order_id,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,trade_tax,trade_cost_fee,trade_system_use_fee,stock_settle_fee,stock_type,asset_type,stock_acco_no,stock_code_no,order_date,order_qty,order_price,trade_code_no,target_code_no into v_order_id,v_all_fee,v_stamp_tax,v_trans_fee,v_brkage_fee,v_SEC_charges,v_other_fee,v_trade_commis,v_other_commis,v_trade_tax,v_trade_cost_fee,v_trade_system_use_fee,v_stock_settle_fee,v_stock_type,v_asset_type,v_stock_acco_no,v_stock_code_no,v_order_date,v_order_qty,v_order_price,v_trade_code_no,v_target_code_no from db_tdsecu.tb_tdserp_strike where pass_no = v_pass_no and out_acco = v_out_acco and exch_no = v_exch_no and strike_date = v_strike_date and strike_no = v_strike_no and order_dir=v_order_dir limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "tdsecuA.20.1.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,","," 外部账号=", v_out_acco,",","市场编号=",v_exch_no,","," 成交日期=", v_strike_date,","," 成交编号=", v_strike_no,",","订单方向=",v_order_dir),"#",v_mysql_message);
            else
                SET v_error_info = concat("通道编号=",v_pass_no,","," 外部账号=", v_out_acco,",","市场编号=",v_exch_no,","," 成交日期=", v_strike_date,","," 成交编号=", v_strike_no,",","订单方向=",v_order_dir);
            end if;
            leave label_pro;
        end if;


        /* set @订单编号# = @订单序号#; */
        set v_order_no = v_order_id;
        #基金转换的成交数据需要关联订单表取,成交表中的数量是目标基金的成交数量,源基金的交易数量要去历史订单表中去取

        /* if @订单方向# = 《订单方向-基金转换》 then */
        if v_order_dir = 12 then

            /* [获取表记录变量][历史_交易证券_交易_订单表][{目标证券代码},{目标证券代码编号},{订单数量},{证券代码编号},{证券代码}][@目标证券代码#,@目标证券代码编号#,@订单数量#,@证券代码编号#,@证券代码#][{记录序号}=@订单序号#][4][@订单序号#] */
            select target_stock_code,target_stock_code_no,order_qty,stock_code_no,stock_code into v_target_stock_code,v_target_stock_code_no,v_order_qty,v_stock_code_no,v_stock_code from db_tdsecu_his.tb_tdsetd_order_his where row_id=v_order_id limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "tdsecuA.20.1.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单序号=",v_order_id);
                end if;
                leave label_pro;
            end if;

        end if;
    end if;

    /* set @成交数量# = @临时_成交数量#; */
    set v_strike_qty = v_tmp_strike_qty;

    /* set @成交金额# = @临时_成交金额#; */
    set v_strike_amt = v_tmp_strike_amt;

    /* set @记录序号# = @临时_记录序号#; */
    set v_row_id = v_tmp_row_id;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;
    SET p_row_id = v_row_id;
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
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_target_stock_code = v_target_stock_code;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
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
    SET p_all_fee = v_all_fee;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_strike_deal_type = v_strike_deal_type;
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

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_设置单记录成交回报记录处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_UpdateOneStrikeClearFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_UpdateOneStrikeClearFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    declare v_init_date int;
    declare v_row_id bigint;
    declare v_deal_flag int;
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
    SET v_row_id = p_row_id;
    SET v_deal_flag = p_deal_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_报盘_成交回报表][{清算结算标志}=@处理标志#][{记录序号} = @记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_strikersp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_flag=v_deal_flag where row_id = v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.20.2.2";
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

# 原子_交易证券_接口_设置全部成交回报记录处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_UpdateAllStrikeClearFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_UpdateAllStrikeClearFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    declare v_init_date int;
    declare v_deal_flag int;
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
    SET v_deal_flag = p_deal_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_报盘_成交回报表][{清算结算标志}=@处理标志#][{成交日期} >= @初始化日期#  and {记录有效标志} = 《记录有效标志-有效》][2][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_strikersp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_flag=v_deal_flag where strike_date >= v_init_date  and record_valid_flag = 1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.20.3.2";
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

# 原子_交易证券_接口_更新获取申购订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_UpdateGetNewStockOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_UpdateGetNewStockOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_no int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_all_fee decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_nav_asset decimal(18,4),
    OUT p_rsp_info varchar(255),
    OUT p_compli_trig_id bigint,
    OUT p_trade_code_no int,
    OUT p_target_code_no int
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
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_order_frozen_amt decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_exch_crncy_type varchar(3);
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_asset_type int;
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_order_batch_no int;
    declare v_price_type int;
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
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
    declare v_remark_info varchar(255);
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_all_fee = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_order_frozen_amt = 0;
    SET v_nav_asset = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_crncy_type = "CNY";
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_asset_type = 0;
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_order_batch_no = 0;
    SET v_price_type = 0;
    SET v_order_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
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
    SET v_remark_info = " ";
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

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* [获取表记录变量][交易证券_交易_订单表][字段][字段变量][{清算结算标志} = 《清算结算标志-未处理》 and ({订单方向} =《订单方向-新股申购》 or @订单方向# = 《订单方向-配售申购》) and {订单状态} = 《订单状态-已报》 and {记录有效标志} = 《记录有效标志-有效》 order by {记录序号}][4][" "] */
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
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where sett_flag = 2 and (order_dir =11 or v_order_dir = 23) and order_status = "2" and record_valid_flag = 1 order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.20.4.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* set @记录个数# = 1; */
    set v_record_count = 1;

    /* [更新表记录][交易证券_交易_订单表][{清算结算标志} = 《清算结算标志-已处理》][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_flag = 1 where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.20.4.2";
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
    SET p_record_count = v_record_count;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_no = v_order_no;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_all_fee = v_all_fee;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_nav_asset = v_nav_asset;
    SET p_rsp_info = v_rsp_info;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_获取成交回报统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_GetStrikeTotal;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_GetStrikeTotal(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_count int,
    OUT p_succ_count int,
    OUT p_fail_count int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_count int;
    declare v_succ_count int;
    declare v_fail_count int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_count = 0;
    SET v_succ_count = 0;
    SET v_fail_count = 0;

    
    label_pro:BEGIN
    

    /* set @成交记录数# = 0; */
    set v_strike_count = 0;

    /* set @成功记录数# = 0; */
    set v_succ_count = 0;

    /* set @失败记录数# = 0; */
    set v_fail_count = 0;

    /* [获取表记录数量][交易证券_报盘_成交回报表][@成交记录数#][{成交日期} = @初始化日期# and {记录有效标志} = 《记录有效标志-有效》 and ({资产账户类型} = 《资产账户类型-A股》 or {资产账户类型} = 《资产账户类型-OTC账户》) and (@市场编号# = 0 or {市场编号} = @市场编号#)] */
    select count(1) into v_strike_count from db_tdsecu.tb_tdserp_strikersp where strike_date = v_init_date and record_valid_flag = 1 and (asset_acco_type = 1 or asset_acco_type = 4) and (v_exch_no = 0 or exch_no = v_exch_no);


    /* if @成交记录数# > 0 then */
    if v_strike_count > 0 then

      /* [获取表记录数量][交易证券_报盘_成交回报表][@成功记录数#][{成交日期} = @初始化日期# and {记录有效标志} = 《记录有效标志-有效》 and ({资产账户类型} = 《资产账户类型-A股》  or {资产账户类型} = 《资产账户类型-OTC账户》) and (@市场编号# = 0 or {市场编号} = @市场编号#) and {处理状态} = 《处理状态-成功》] */
      select count(1) into v_succ_count from db_tdsecu.tb_tdserp_strikersp where strike_date = v_init_date and record_valid_flag = 1 and (asset_acco_type = 1  or asset_acco_type = 4) and (v_exch_no = 0 or exch_no = v_exch_no) and deal_status = "1";


      /* [获取表记录数量][交易证券_报盘_成交回报表][@失败记录数#][{成交日期} = @初始化日期# and {记录有效标志} = 《记录有效标志-有效》 and ({资产账户类型} = 《资产账户类型-A股》  or {资产账户类型} = 《资产账户类型-OTC账户》) and (@市场编号# = 0 or {市场编号} = @市场编号#) and {处理状态} <> 《处理状态-成功》] */
      select count(1) into v_fail_count from db_tdsecu.tb_tdserp_strikersp where strike_date = v_init_date and record_valid_flag = 1 and (asset_acco_type = 1  or asset_acco_type = 4) and (v_exch_no = 0 or exch_no = v_exch_no) and deal_status <> "1";

    else

      /* [获取历史表记录数量][交易证券_报盘_成交回报表][@成功记录数#][{成交日期} = @初始化日期# and {记录有效标志} = 《记录有效标志-有效》 and ({资产账户类型} = 《资产账户类型-A股》  or {资产账户类型} = 《资产账户类型-OTC账户》) and (@市场编号# = 0 or {市场编号} = @市场编号#) and {处理状态} =《处理状态-成功》] */
      select count(1) into v_succ_count from db_tdsecu_his.tb_tdserp_strikersp_his where strike_date = v_init_date and record_valid_flag = 1 and (asset_acco_type = 1  or asset_acco_type = 4) and (v_exch_no = 0 or exch_no = v_exch_no) and deal_status ="1";


      /* [获取历史表记录数量][交易证券_报盘_成交回报表][@失败记录数#][{成交日期} = @初始化日期# and {记录有效标志} = 《记录有效标志-有效》 and ({资产账户类型} = 《资产账户类型-A股》  or {资产账户类型} = 《资产账户类型-OTC账户》) and (@市场编号# = 0 or {市场编号} = @市场编号#) and {处理状态} <> 《处理状态-成功》] */
      select count(1) into v_fail_count from db_tdsecu_his.tb_tdserp_strikersp_his where strike_date = v_init_date and record_valid_flag = 1 and (asset_acco_type = 1  or asset_acco_type = 4) and (v_exch_no = 0 or exch_no = v_exch_no) and deal_status <> "1";


      /* set @成交记录数# = @成功记录数# + @失败记录数#; */
      set v_strike_count = v_succ_count + v_fail_count;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_count = v_strike_count;
    SET p_succ_count = v_succ_count;
    SET p_fail_count = v_fail_count;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_获取清算转入成交统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_GetSwitchStrikeTotal;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_GetSwitchStrikeTotal(
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
    OUT p_pre_switch_strike_qty decimal(18,2),
    OUT p_alr_switch_strike_qty decimal(18,2)
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
    declare v_pre_switch_strike_qty decimal(18,2);
    declare v_alr_switch_strike_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pre_switch_strike_qty = 0;
    SET v_alr_switch_strike_qty = 0;

    
    label_pro:BEGIN
    

    /* set @待转入成交数# = 0; */
    set v_pre_switch_strike_qty = 0;

    /* set @已转入成交数# = 0; */
    set v_alr_switch_strike_qty = 0;

    /* [获取表记录数量][交易证券_报盘_成交回报表][@待转入成交数#][ {成交日期} = @初始化日期# and {记录有效标志} = 《记录有效标志-有效》 and {清算结算标志} <>《清算结算标志-已处理》 and {处理状态} =《处理状态-成功》 and ({资产账户类型} = 《资产账户类型-A股》 or {资产账户类型} = 《资产账户类型-OTC账户》) ] */
    select count(1) into v_pre_switch_strike_qty from db_tdsecu.tb_tdserp_strikersp where  strike_date = v_init_date and record_valid_flag = 1 and sett_flag <>1 and deal_status ="1" and (asset_acco_type = 1 or asset_acco_type = 4) ;


    /* [获取表记录数量][交易证券_报盘_成交回报表][@已转入成交数#][ {成交日期} = @初始化日期# and  {记录有效标志} = 《记录有效标志-有效》 and {清算结算标志}=《清算结算标志-已处理》 and {处理状态} =《处理状态-成功》 and  ({资产账户类型} = 《资产账户类型-A股》 or {资产账户类型} = 《资产账户类型-OTC账户》)] */
    select count(1) into v_alr_switch_strike_qty from db_tdsecu.tb_tdserp_strikersp where  strike_date = v_init_date and  record_valid_flag = 1 and sett_flag=1 and deal_status ="1" and  (asset_acco_type = 1 or asset_acco_type = 4);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pre_switch_strike_qty = v_pre_switch_strike_qty;
    SET p_alr_switch_strike_qty = v_alr_switch_strike_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_查询转入失败成交记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_QueryErrorStrike;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_QueryErrorStrike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sett_flag int,
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
    declare v_sett_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_sett_flag = p_sett_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [右关联查询][交易证券_交易_订单表][交易证券_报盘_成交回报表][a.{记录序号}, a.{初始化日期}, t.{机构编号}, t.{产品编号}, t.{交易组编号}, a.{外部账号}, a.{股东代码}, a.{市场编号}, a.{证券代码}, a.{成交时间}, a.{成交编号}, t.{申报时间}, a.{申报编号}, a.{订单方向}, t.{订单数量}, a.{成交数量}, a.{清算结算标志}, case when t.{交易组编号} is NULL then "成交配对委托失败" else " " end as {备注信息}][t.{通道编号} = a.{通道编号} and t.{外部账号} = a.{外部账号} and t.{市场编号} = a.{市场编号}  and t.{申报编号} = a.{申报编号}][ a.{成交日期} = @初始化日期# and  a.{记录有效标志} = 《记录有效标志-有效》 and (@清算结算标志# = 0 or a.{清算结算标志} =@清算结算标志#) and (a.{资产账户类型} = 《资产账户类型-A股》 or a.{资产账户类型} = 《资产账户类型-OTC账户》) and a.{申报编号} <> " "] */
    select a.row_id, a.init_date, t.co_no, t.pd_no, t.exch_group_no, a.out_acco, a.stock_acco, a.exch_no, a.stock_code, a.strike_time, a.strike_no, t.report_time, a.report_no, a.order_dir, t.order_qty, a.strike_qty, a.sett_flag, case when t.exch_group_no is NULL then "成交配对委托失败" else " " end as remark_info from db_tdsecu.tb_tdsetd_order t right join db_tdsecu.tb_tdserp_strikersp a on t.pass_no = a.pass_no and t.out_acco = a.out_acco and t.exch_no = a.exch_no  and t.report_no = a.report_no where  a.strike_date = v_init_date and  a.record_valid_flag = 1 and (v_sett_flag = 0 or a.sett_flag =v_sett_flag) and (a.asset_acco_type = 1 or a.asset_acco_type = 4) and a.report_no <> " ";

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_获取证券代码持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_GetStockPosiInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_GetStockPosiInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_curr_qty decimal(18,2),
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
    declare v_query_row_id bigint;
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_curr_qty decimal(18,2);
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
    SET v_query_row_id = p_query_row_id;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_curr_qty = 0;
    SET v_strike_qty = 0;

    
    label_pro:BEGIN
    
    #这里处理红利红股，考虑要不要算上待交收数量，现在的处理方式：不加待交收数量，只处理交割后的数量

    /* [获取表记录变量][交易证券_账户_组合持仓表][{记录序号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{持仓数量},{成交释放数量}-{成交占用数量}][@记录序号#,@机构编号#,@产品编号#,@交易组编号#,@资产账户编号#,@市场编号#,@股东代码编号#,@当前数量#,@成交数量#][{证券代码编号}=@证券代码编号# and {记录序号}>@查询记录序号# order by {记录序号}][4][@证券代码编号#] */
    select row_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,posi_qty,strike_releas_qty-strike_capt_qty into v_row_id,v_co_no,v_pd_no,v_exch_group_no,v_asset_acco_no,v_exch_no,v_stock_acco_no,v_curr_qty,v_strike_qty from db_tdsecu.tb_tdseac_comboposi where stock_code_no=v_stock_code_no and row_id>v_query_row_id order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.20.8.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_curr_qty = v_curr_qty;
    SET p_strike_qty = v_strike_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_组合公司行为资金登记处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_ComboCoActionCapiatlRegDeal;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_ComboCoActionCapiatlRegDeal(
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
    IN p_target_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_busi_flag int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_cost_calc_type int,
    IN p_intrst_entry_type int,
    IN p_arrive_date int,
    IN p_impawn_ratio decimal(18,12),
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_exgp_posi_jour_no bigint
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
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_busi_flag int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_cost_calc_type int;
    declare v_intrst_entry_type int;
    declare v_arrive_date int;
    declare v_impawn_ratio decimal(18,12);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_status varchar(2);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_intrst_pandl decimal(18,4);
    declare v_begin_trade_date int;
    declare v_occur_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_target_code_no = p_target_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_busi_flag = p_busi_flag;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_intrst_entry_type = p_intrst_entry_type;
    SET v_arrive_date = p_arrive_date;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_status = "0";
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_exgp_cost_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exgp_intrst_cost_amt = 0;
    SET v_exgp_intrst_pandl = 0;
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_occur_qty = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;

    
    label_pro:BEGIN
    

    /* if @业务标志#=《业务标志-红利登记》  then */
    if v_busi_flag=2001013  then

        /* set @入账状态# = 《入账状态-未入账》; */
        set v_entry_status = "2";

        /* set @当前金额# = @变动金额#; */
        set v_curr_amt = v_occur_amt;

        /* set @冻结金额# = @变动金额#; */
        set v_frozen_amt = v_occur_amt;

    /* elseif @业务标志#=《业务标志-债券付息》 or @业务标志#=《业务标志-债券兑付》 then */
    elseif v_busi_flag=2002010 or v_busi_flag=2002009 then

        /* set @入账状态# = 《入账状态-已入账》; */
        set v_entry_status = "1";

        /* set @当前金额# = @变动金额#; */
        set v_curr_amt = v_occur_amt;

        /* set @冻结金额# = 0; */
        set v_frozen_amt = 0;
    else

        /* [报错返回][14][@业务标志#] */
            
            SET v_error_code = "tdsecuA.20.9.14";
            SET v_error_info = concat("业务标志=",v_busi_flag);
            leave label_pro;

    end if;

    /* set @解冻金额# = 0; */
    set v_unfroz_amt = 0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;

    /* set @交易组成本金额# = 0; */
    set v_exgp_cost_amt = 0;

    /* set @交易组实现盈亏# = 0; */
    set v_exgp_realize_pandl = 0;

    /* set @交易组利息成本金额# = 0; */
    set v_exgp_intrst_cost_amt = 0;

    /* set @交易组利息收益# = 0; */
    set v_exgp_intrst_pandl = 0;

    /* if @业务标志#=《业务标志-红利登记》  then */
    if v_busi_flag=2001013  then

        /* if @红利入账成本盈亏计算方式# = 《红利入账成本盈亏计算方式-入盈亏》 then */
        if v_intrst_entry_type = 1 then

            /* set @交易组实现盈亏# = @变动金额#; */
            set v_exgp_realize_pandl = v_occur_amt;

            /* set @交易组成本金额# = 0; */
            set v_exgp_cost_amt = 0;
        else

            /* set @交易组实现盈亏# = 0; */
            set v_exgp_realize_pandl = 0;

            /* set @交易组成本金额# = -1 * @变动金额#; */
            set v_exgp_cost_amt = -1 * v_occur_amt;
        end if;
    else
        leave label_pro;
    end if;

    /* set @入账状态# = 《入账状态-已入账》; */
    set v_entry_status = "1";

    /* set @上市日期# = @到账日期#; */
    set v_begin_trade_date = v_arrive_date;

    /* set @变动数量# = 0; */
    set v_occur_qty = 0;

    /* set @当前数量# = 0; */
    set v_curr_qty = 0;

    /* set @冻结数量# = 0; */
    set v_frozen_qty = 0;

    /* set @解冻数量# = 0; */
    set v_unfroz_qty = 0;
    #处理交易组持仓入账

    /* set @成本金额# = @交易组成本金额#; */
    set v_cost_amt = v_exgp_cost_amt;

    /* set @实现盈亏# = @交易组实现盈亏#; */
    set v_realize_pandl = v_exgp_realize_pandl;

    /* set @利息成本金额# = @交易组利息成本金额#; */
    set v_intrst_cost_amt = v_exgp_intrst_cost_amt;

    /* set @利息收益# = @交易组利息收益#; */
    set v_intrst_pandl = v_exgp_intrst_pandl;

    /* 调用【原子_交易证券_接口_组合持仓入账】*/
    call db_tdsecu.pra_tdsetdif_ComboPosiRecorded(
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
        v_target_code_no,
        v_stock_type,
        v_asset_type,
        v_occur_qty,
        v_cost_amt,
        v_realize_pandl,
        v_intrst_cost_amt,
        v_intrst_pandl,
        v_impawn_ratio,
        v_busi_flag,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuA.20.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_接口_组合持仓入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_exgp_posi_jour_no = v_entry_exgp_posi_jour_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_组合公司行为股份登记处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_ComboCoActionPosiRegDeal;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_ComboCoActionPosiRegDeal(
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
    IN p_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_occur_amt decimal(18,4),
    IN p_occur_qty decimal(18,2),
    IN p_busi_flag int,
    IN p_target_code_no int,
    IN p_impawn_ratio decimal(18,12),
    IN p_begin_trade_date int,
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_exgp_posi_jour_no bigint
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
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_busi_flag int;
    declare v_target_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_begin_trade_date int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_entry_status varchar(2);
    declare v_arrive_date int;
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_unfroz_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_occur_amt = p_occur_amt;
    SET v_occur_qty = p_occur_qty;
    SET v_busi_flag = p_busi_flag;
    SET v_target_code_no = p_target_code_no;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_entry_status = "0";
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_unfroz_qty = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;

    
    label_pro:BEGIN
    

    /* set @入账资金流水号# = 0; */
    set v_entry_money_jour_no = 0;

    /* set @入账交易组持仓流水号# = 0; */
    set v_entry_exgp_posi_jour_no = 0;

    /* if @业务标志#=《业务标志-红股登记》 then */
    if v_busi_flag=2001014 then

        /* set @当前数量# = @变动数量#; */
        set v_curr_qty = v_occur_qty;

        /* set @冻结数量# = @变动数量#; */
        set v_frozen_qty = v_occur_qty;

        /* set @入账状态# = 《入账状态-未入账》; */
        set v_entry_status = "2";

    /* elseif @业务标志#=《业务标志-债券兑付》 then */
    elseif v_busi_flag=2002009 then

        /* set @当前数量# = @变动数量#; */
        set v_curr_qty = v_occur_qty;

        /* set @冻结数量# = 0; */
        set v_frozen_qty = 0;

        /* set @入账状态# = 《入账状态-已入账》; */
        set v_entry_status = "1";
    else

        /* [报错返回][14][@业务标志#] */
            
            SET v_error_code = "tdsecuA.20.10.14";
            SET v_error_info = concat("业务标志=",v_busi_flag);
            leave label_pro;

    end if;

    /* set @到账日期# = @上市日期#; */
    set v_arrive_date = v_begin_trade_date;

    /* set @利息成本金额# = 0; */
    set v_intrst_cost_amt = 0;

    /* set @利息收益# = 0; */
    set v_intrst_pandl = 0;

    /* set @解冻数量# = 0; */
    set v_unfroz_qty = 0;

    /* set @成本金额# = 0; */
    set v_cost_amt = 0;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;
    #处理交易组持仓入账

    /* 调用【原子_交易证券_接口_组合持仓入账】*/
    call db_tdsecu.pra_tdsetdif_ComboPosiRecorded(
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
        v_target_code_no,
        v_stock_type,
        v_asset_type,
        v_occur_qty,
        v_cost_amt,
        v_realize_pandl,
        v_intrst_cost_amt,
        v_intrst_pandl,
        v_impawn_ratio,
        v_busi_flag,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuA.20.10.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_接口_组合持仓入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_exgp_posi_jour_no = v_entry_exgp_posi_jour_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_组合持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_ComboPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_ComboPosiRecorded(
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
    IN p_target_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_occur_qty decimal(18,2),
    IN p_cost_amt decimal(18,4),
    IN p_realize_pandl decimal(18,4),
    IN p_intrst_cost_amt decimal(18,4),
    IN p_intrst_pandl decimal(18,4),
    IN p_impawn_ratio decimal(18,12),
    IN p_busi_flag int,
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
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_occur_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_busi_flag int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_menu_no int;
    declare v_occur_end_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_oper_func_code varchar(16);
    declare v_posi_qty decimal(18,2);
    declare v_combo_code varchar(32);
    declare v_stock_code varchar(6);
    declare v_open_posi_date int;
    declare v_trade_frozen_qty decimal(18,2);
    declare v_trade_unfroz_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_strike_frozen_qty decimal(18,2);
    declare v_strike_unfroz_qty decimal(18,2);
    declare v_posi_status varchar(2);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_occur_qty = p_occur_qty;
    SET v_cost_amt = p_cost_amt;
    SET v_realize_pandl = p_realize_pandl;
    SET v_intrst_cost_amt = p_intrst_cost_amt;
    SET v_intrst_pandl = p_intrst_pandl;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_menu_no = 0;
    SET v_occur_end_qty = 0;
    SET v_oper_remark_info = " ";
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_curr_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_oper_func_code = " ";
    SET v_posi_qty = 0;
    SET v_combo_code = " ";
    SET v_stock_code = " ";
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_trade_frozen_qty = 0;
    SET v_trade_unfroz_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_strike_frozen_qty = 0;
    SET v_strike_unfroz_qty = 0;
    SET v_posi_status = "0";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @操作菜单# =0; */
    set v_oper_menu_no =0;

    /* set @变动后数量# = 0; */
    set v_occur_end_qty = 0;

    /* set @操作备注# = @备注信息#; */
    set v_oper_remark_info = v_remark_info;

    /* set @冻结数量# =0; */
    set v_frozen_qty =0;

    /* set @解冻数量# =0; */
    set v_unfroz_qty =0;

    /* set @持仓核对差额#=0; */
    set v_posi_qty_check_diff=0;

    /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 then */
    if v_exch_no = 1 or v_exch_no = 2 then

        /* set @当前数量# = @变动数量#; */
        set v_curr_qty = v_occur_qty;

        /* set @待交收数量# = 0; */
        set v_pre_settle_qty = 0;

        /* if @业务标志# = 《业务标志-债券融券回购》 then */
        if v_busi_flag = 2004002 then

            /* set @冻结数量# = @变动数量#; */
            set v_frozen_qty = v_occur_qty;

        /* elseif @业务标志# = 《业务标志-债券质押》  then */
        elseif v_busi_flag = 2002003  then

            /* set @当前数量# = 0; */
            set v_curr_qty = 0;

            /* set @冻结数量# = -1 * @变动数量#; */
            set v_frozen_qty = -1 * v_occur_qty;

            /* set @解冻数量# = 0; */
            set v_unfroz_qty = 0;

        /* elseif @业务标志# = 《业务标志-债券转回质押》 then */
        elseif v_busi_flag = 2002004 then

            /* set @当前数量# = 0; */
            set v_curr_qty = 0;

            /* set @冻结数量# = -1 * @变动数量#; */
            set v_frozen_qty = -1 * v_occur_qty;

            /* set @解冻数量# = 0; */
            set v_unfroz_qty = 0;

        /* elseif @业务标志#=《业务标志-红股登记》  then */
        elseif v_busi_flag=2001014  then

            /* set @冻结数量#=@变动数量#; */
            set v_frozen_qty=v_occur_qty;
        end if;
    else

        /* set @当前数量# = 0; */
        set v_curr_qty = 0;

        /* set @待交收数量# = @变动数量#; */
        set v_pre_settle_qty = v_occur_qty;
    end if;

    /* set @操作功能# =@功能编码#; */
    set v_oper_func_code =v_func_code;
    #用于插入表记录时初值，更新时无用。

    /* set @持仓数量# = 0; */
    set v_posi_qty = 0;

    /* set @组合代码# = " "; */
    set v_combo_code = " ";

    /* set @证券代码# = 0; */
    set v_stock_code = 0;

    /* set @开仓日期# = 0; */
    set v_open_posi_date = 0;

    /* set @交易冻结数量# = 0; */
    set v_trade_frozen_qty = 0;

    /* set @交易解冻数量# = 0; */
    set v_trade_unfroz_qty = 0;

    /* set @交易占用数量# = 0; */
    set v_trade_capt_qty = 0;

    /* set @交易释放数量# = 0; */
    set v_trade_releas_qty = 0;

    /* set @成交占用数量# = 0; */
    set v_strike_capt_qty = 0;

    /* set @成交释放数量# = 0; */
    set v_strike_releas_qty = 0;

    /* set @成交冻结数量# = 0; */
    set v_strike_frozen_qty = 0;

    /* set @成交解冻数量# = 0; */
    set v_strike_unfroz_qty = 0;
    #处理交易组持仓入账
    #持仓记录不存在，则插入，否则更新

    /* set @持仓状态# =《持仓状态-未平仓》; */
    set v_posi_status ="1";

    /* [插入重复更新][交易证券_账户_组合持仓表][字段][字段变量][{持仓数量} = {持仓数量} +@当前数量#,{当前数量} = {当前数量} + @当前数量#,{待交收数量} = {待交收数量} + @待交收数量#, {冻结数量} = {冻结数量} + @冻结数量#, {解冻数量} = {解冻数量} + @解冻数量#, {成本金额} = {成本金额} + @成本金额#, {实现盈亏} = {实现盈亏} + @实现盈亏#, {利息成本金额} = {利息成本金额} + @利息成本金额#, {利息收益} = {利息收益} + @利息收益#][1][@交易组编号#, @股东代码编号#, @证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdseac_comboposi (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, stock_acco_no, 
        combo_code, stock_code, exch_no, stock_code_no, 
        open_posi_date, posi_qty, curr_qty, frozen_qty, 
        unfroz_qty, pre_settle_qty, trade_frozen_qty, trade_unfroz_qty, 
        trade_capt_qty, trade_releas_qty, strike_capt_qty, strike_releas_qty, 
        strike_frozen_qty, strike_unfroz_qty, realize_pandl, cost_amt, 
        intrst_cost_amt, intrst_pandl, posi_status) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_stock_acco_no, 
        v_combo_code, v_stock_code, v_exch_no, v_stock_code_no, 
        v_open_posi_date, v_posi_qty, v_curr_qty, v_frozen_qty, 
        v_unfroz_qty, v_pre_settle_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
        v_trade_capt_qty, v_trade_releas_qty, v_strike_capt_qty, v_strike_releas_qty, 
        v_strike_frozen_qty, v_strike_unfroz_qty, v_realize_pandl, v_cost_amt, 
        v_intrst_cost_amt, v_intrst_pandl, v_posi_status) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, posi_qty = posi_qty +v_curr_qty,curr_qty = curr_qty + v_curr_qty,pre_settle_qty = pre_settle_qty + v_pre_settle_qty, frozen_qty = frozen_qty + v_frozen_qty, unfroz_qty = unfroz_qty + v_unfroz_qty, cost_amt = cost_amt + v_cost_amt, realize_pandl = realize_pandl + v_realize_pandl, intrst_cost_amt = intrst_cost_amt + v_intrst_cost_amt, intrst_pandl = intrst_pandl + v_intrst_pandl;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.20.11.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_组合处理持仓入账更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_ComboDealPosiEntryUpdate;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_ComboDealPosiEntryUpdate(
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
    IN p_occur_qty decimal(18,2),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_flag int;
    declare v_oper_remark_info varchar(255);
    declare v_tmp_pre_settle_qty decimal(18,2);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_pre_settle_qty decimal(18,2);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_flag = 0;
    SET v_oper_remark_info = " ";
    SET v_tmp_pre_settle_qty = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_pre_settle_qty = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* if @业务标志# = 《业务标志-股票买入》 then */
    if v_busi_flag = 2001001 then

        /* set @业务标志# = 《业务标志-港股买入交收》; */
        set v_busi_flag = 2001015;

        /* set @操作备注# = "港股买入到账处理"; */
        set v_oper_remark_info = "港股买入到账处理";

    /* elseif @业务标志# = 《业务标志-股票卖出》 then */
    elseif v_busi_flag = 2001002 then

        /* set @业务标志# = 《业务标志-港股卖出交收》; */
        set v_busi_flag = 2001016;

        /* set @操作备注# = "港股卖出到账处理"; */
        set v_oper_remark_info = "港股卖出到账处理";

    /* elseif @业务标志# = 《业务标志-融资回购到期》 then */
    elseif v_busi_flag = 2004003 then

        /* set @业务标志# = 《业务标志-融资回购到期入账》; */
        set v_busi_flag = 2004005;

        /* set @操作备注# = "融资回购到账处理"; */
        set v_oper_remark_info = "融资回购到账处理";

    /* elseif @业务标志# = 《业务标志-融券回购到期》 then */
    elseif v_busi_flag = 2004004 then

        /* set @业务标志# = 《业务标志-融券回购到期入账》; */
        set v_busi_flag = 2004006;

        /* set @操作备注# = "融券回购到账处理"; */
        set v_oper_remark_info = "融券回购到账处理";
    end if;

    /* set @临时_待交收数量# = -1 * @变动数量#; */
    set v_tmp_pre_settle_qty = -1 * v_occur_qty;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [获取流水变动][{待交收数量}][@待交收数量#] */
    set v_jour_occur_field = concat("待交收数量","|");
    set v_jour_occur_info = concat(v_pre_settle_qty,"|");


    /* [更新表记录][交易证券_账户_组合持仓表][{当前数量}={当前数量}+@变动数量#,{待交收数量}={待交收数量}+@临时_待交收数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#][2][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_comboposi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=curr_qty+v_occur_qty,pre_settle_qty=pre_settle_qty+v_tmp_pre_settle_qty where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.20.12.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_获取组合持仓待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_GetComboPosiPreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_GetComboPosiPreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_occur_qty decimal(18,2)
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_target_code_no int;
    declare v_old_arrive_date int;
    declare v_arrive_date int;
    declare v_entry_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_occur_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_target_code_no = 0;
    SET v_old_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_entry_status = "0";

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][交易证券_账户_组合持仓入账流水表][字段][字段变量][{记录序号}>@查询记录序号# and {到账日期}<=@初始化日期# and ((({市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》) and ({业务标志}=《业务标志-股票买入》 or {业务标志}=《业务标志-股票卖出》)) or {业务标志}=《业务标志-融资回购到期》 or {业务标志}=《业务标志-融券回购到期》) and {入账状态}=《入账状态-未入账》][4][@初始化日期#,@查询记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, target_code_no, 
        occur_qty, old_arrive_date, arrive_date, entry_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_stock_acco_no, v_stock_code_no, v_target_code_no, 
        v_occur_qty, v_old_arrive_date, v_arrive_date, v_entry_status from db_tdsecu.tb_tdseac_combo_posi_entry_jour where row_id>v_query_row_id and arrive_date<=v_init_date and (((exch_no=3 or exch_no=4) and (busi_flag=2001001 or busi_flag=2001002)) or busi_flag=2004003 or busi_flag=2004004) and entry_status="2" limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.20.13.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","查询记录序号=",v_query_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","查询记录序号=",v_query_row_id);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_组合持仓入账流水表][{入账状态}=《入账状态-已入账》][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_combo_posi_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="1" where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.20.13.2";
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
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_occur_qty = v_occur_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_新增组合持仓入账流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdseac_InsertComboPosiEntryJour;;
DELIMITER ;;
CREATE PROCEDURE pra_tdseac_InsertComboPosiEntryJour(
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
    IN p_target_code_no int,
    IN p_occur_qty decimal(18,2),
    IN p_arrive_date int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_arrive_date int;
    declare v_entry_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_old_arrive_date int;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_arrive_date = p_arrive_date;
    SET v_entry_status = p_entry_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_old_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @原到账日期# = @到账日期#; */
    set v_old_arrive_date = v_arrive_date;

    /* [插入表记录][交易证券_账户_组合持仓入账流水表][字段][字段变量][1][@机构编号#,@产品编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdseac_combo_posi_entry_jour(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, target_code_no, occur_qty, 
        old_arrive_date, arrive_date, entry_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_target_code_no, v_occur_qty, 
        v_old_arrive_date, v_arrive_date, v_entry_status);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.20.14.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_更新港股通待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdseac_UpdateHKPreEntryRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_tdseac_UpdateHKPreEntryRecord(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_T1_settle_date int,
    IN p_T2_settle_date int,
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
    declare v_T1_settle_date int;
    declare v_T2_settle_date int;
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
    SET v_T1_settle_date = p_T1_settle_date;
    SET v_T2_settle_date = p_T2_settle_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_账户_组合持仓入账流水表][{到账日期}=@T2交收日期#][{到账日期}=@T1交收日期# and {入账状态}=《入账状态-未入账》 and (({市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》) and ({业务标志}=《业务标志-股票买入》 or {业务标志}=《业务标志-股票卖出》)) and {到账日期}={原到账日期}][2][@T2交收日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_combo_posi_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, arrive_date=v_T2_settle_date where arrive_date=v_T1_settle_date and entry_status="2" and ((exch_no=3 or exch_no=4) and (busi_flag=2001001 or busi_flag=2001002)) and arrive_date=old_arrive_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.20.15.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("T2交收日期=",v_T2_settle_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("T2交收日期=",v_T2_settle_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_组合持仓入账流水表][{到账日期}=@T1交收日期#][{到账日期}=@初始化日期# and {入账状态}=《入账状态-未入账》 and (({市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》) and ({业务标志}=《业务标志-股票买入》 or {业务标志}=《业务标志-股票卖出》)) and {到账日期}={原到账日期}][2][@T2交收日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_combo_posi_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, arrive_date=v_T1_settle_date where arrive_date=v_init_date and entry_status="2" and ((exch_no=3 or exch_no=4) and (busi_flag=2001001 or busi_flag=2001002)) and arrive_date=old_arrive_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.20.15.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("T2交收日期=",v_T2_settle_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("T2交收日期=",v_T2_settle_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_处理基金交易记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_DealFundTradeRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_DealFundTradeRecord(
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
    OUT p_target_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_no int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
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
    OUT p_busi_flag int,
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_intrst_days int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_impawn_ratio decimal(18,12),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_pre_entry_qty decimal(18,2)
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
    declare v_target_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
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
    declare v_busi_flag int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_pre_entry_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_order_batch_no int;
    declare v_price_type int;
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_strike_bond_accr_intrst decimal(18,4);
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
    SET v_target_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_strike_qty = 0;
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
    SET v_busi_flag = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_pre_entry_amt = 0;
    SET v_pre_entry_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_order_batch_no = 0;
    SET v_price_type = 0;
    SET v_order_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_strike_bond_accr_intrst = 0;
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
    SET v_sett_flag = 0;
    SET v_target_stock_code = " ";
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_contra_no = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* [不报错锁定获取表记录变量][交易证券_交易_订单表][字段][字段变量][{记录序号} > @查询序号# and {初始化日期} = @初始化日期# and {市场编号}=《市场编号-场外交易市场》 and {记录有效标志} = 《记录有效标志-有效》 and {清算结算标志} <>《清算结算标志-已处理》 order by {记录序号}][4][@初始化日期#,@查询记录序号#] */
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
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where row_id > v_qry_no and init_date = v_init_date and exch_no=5 and record_valid_flag = 1 and sett_flag <>1 order by row_id limit 1 for update;


    /* [检查正常返回][FOUND_ROWS() = 0] */
    if FOUND_ROWS() = 0 then
        leave label_pro;
    end if;


    /* set @记录个数# = 1; */
    set v_record_count = 1;

    /* if @订单方向# = 《订单方向-基金申购》 then */
    if v_order_dir = 9 then

        /* set @业务标志#=《业务标志-基金申购》; */
        set v_busi_flag=2006001;

        /* set @待入账金额#=@订单冻结金额#; */
        set v_pre_entry_amt=v_order_frozen_amt;

        /* set @待入账数量#=0; */
        set v_pre_entry_qty=0;

    /* elseif @订单方向# = 《订单方向-基金赎回》 then */
    elseif v_order_dir = 10 then

        /* set @业务标志#=《业务标志-基金赎回》; */
        set v_busi_flag=2006002;

        /* set @待入账金额#=0; */
        set v_pre_entry_amt=0;

        /* set @待入账数量#=@订单数量#-@成交数量#; */
        set v_pre_entry_qty=v_order_qty-v_strike_qty;

    /* elseif @订单方向# = 《订单方向-基金转换》 then */
    elseif v_order_dir = 12 then

        /* set @业务标志#=《业务标志-基金转换》; */
        set v_busi_flag=2006003;

        /* set @待入账金额#=0; */
        set v_pre_entry_amt=0;

        /* set @待入账数量#=@订单数量#-@成交数量#; */
        set v_pre_entry_qty=v_order_qty-v_strike_qty;
    #基金转换交易冻结源证券代码的数量.目标的数量不做处理
        #set @证券代码编号#=@源代码编号#;
    end if;

    /* [更新表记录][交易证券_交易_订单表][{清算结算标志}=《清算结算标志-已处理》][{记录序号} = @记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_flag=1 where row_id = v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.20.16.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @订单编号#=@记录序号#; */
    set v_order_no=v_row_id;
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
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_no = v_order_no;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_strike_qty = v_strike_qty;
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
    SET p_busi_flag = v_busi_flag;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_pre_entry_qty = v_pre_entry_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_设置单记录订单记录处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_UpdateOneOrderClearFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_UpdateOneOrderClearFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    declare v_init_date int;
    declare v_row_id bigint;
    declare v_deal_flag int;
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
    SET v_row_id = p_row_id;
    SET v_deal_flag = p_deal_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_交易_订单表][{清算结算标志}=@处理标志#][{记录序号} = @记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_flag=v_deal_flag where row_id = v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.20.17.2";
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

# 原子_交易证券_接口_查询成交记录序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_QueryStrikeId;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_QueryStrikeId(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_no int,
    IN p_row_count int,
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
    declare v_qry_no int;
    declare v_row_count int;
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
    SET v_qry_no = p_qry_no;
    SET v_row_count = p_row_count;
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

        /* [获取表记录][交易证券_报盘_成交回报表][字段][{初始化日期} = @初始化日期# and {记录序号}>@查询序号# and {记录有效标志} = 《记录有效标志-有效》 and {清算结算标志} <>《清算结算标志-已处理》 and {处理状态} =《处理状态-成功》and ({资产账户类型} = 《资产账户类型-A股》 or {资产账户类型} = 《资产账户类型-OTC账户》)  order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, pd_no, exch_group_no, asset_acco_no, 
            pass_no, out_acco, exch_no, stock_acco, 
            stock_code, report_date, report_no, strike_date, 
            strike_time, strike_no, order_dir, strike_price, 
            strike_qty, strike_amt, strike_deal_type, rsp_info, 
            deal_status, sett_flag, record_valid_flag, asset_acco_type from db_tdsecu.tb_tdserp_strikersp where init_date = v_init_date and row_id>v_qry_no and record_valid_flag = 1 and sett_flag <>1 and deal_status ="1"and (asset_acco_type = 1 or asset_acco_type = 4)  order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, pd_no, exch_group_no, asset_acco_no, 
            pass_no, out_acco, exch_no, stock_acco, 
            stock_code, report_date, report_no, strike_date, 
            strike_time, strike_no, order_dir, strike_price, 
            strike_qty, strike_amt, strike_deal_type, rsp_info, 
            deal_status, sett_flag, record_valid_flag, asset_acco_type from db_tdsecu.tb_tdserp_strikersp where init_date = v_init_date and row_id>v_qry_no and record_valid_flag = 1 and sett_flag <>1 and deal_status ="1"and (asset_acco_type = 1 or asset_acco_type = 4)  order by row_id limit v_row_count;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_处理融资融券清算成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_DealCrdtClearStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_DealCrdtClearStrikeRsp(
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
    OUT p_busi_opor_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_target_stock_code_no int,
    OUT p_target_stock_code varchar(6),
    OUT p_stock_type int,
    OUT p_asset_type int,
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
    OUT p_all_fee decimal(18,4),
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_impawn_ratio decimal(18,12),
    OUT p_strike_deal_type int,
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
    OUT p_stock_settle_fee decimal(18,4)
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
    declare v_busi_opor_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_target_stock_code varchar(6);
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
    declare v_all_fee decimal(18,4);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_strike_deal_type int;
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
    declare v_asset_acco_type int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_stock_acco varchar(16);
    declare v_rsp_info varchar(255);
    declare v_deal_status varchar(2);
    declare v_sett_flag int;
    declare v_record_valid_flag int;
    declare v_query_row_id bigint;
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_row_id bigint;
    declare v_oper_func_code varchar(16);
    declare v_exch_crncy_type varchar(3);
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_order_batch_no int;
    declare v_price_type int;
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
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
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_contra_no varchar(32);
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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_busi_opor_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_target_stock_code = " ";
    SET v_stock_type = 0;
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
    SET v_all_fee = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_strike_deal_type = 0;
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
    SET v_asset_acco_type = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_stock_acco = " ";
    SET v_rsp_info = " ";
    SET v_deal_status = "0";
    SET v_sett_flag = 0;
    SET v_record_valid_flag = 0;
    SET v_query_row_id = 0;
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_amt = 0;
    SET v_tmp_row_id = 0;
    SET v_oper_func_code = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_order_batch_no = 0;
    SET v_price_type = 0;
    SET v_order_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_strike_bond_accr_intrst = 0;
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
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_contra_no = " ";
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    

    /* set @全部费用#=0; */
    set v_all_fee=0;

    /* set @印花税#=0; */
    set v_stamp_tax=0;

    /* set @过户费#=0; */
    set v_trans_fee=0;

    /* set @经手费#=0; */
    set v_brkage_fee=0;

    /* set @证管费#=0; */
    set v_SEC_charges=0;

    /* set @其他费用#=0; */
    set v_other_fee=0;

    /* set @交易佣金#=0; */
    set v_trade_commis=0;

    /* set @其他佣金#=0; */
    set v_other_commis=0;

    /* set @交易征费#=0; */
    set v_trade_tax=0;

    /* set @交易费#=0; */
    set v_trade_cost_fee=0;

    /* set @交易系统使用费#=0; */
    set v_trade_system_use_fee=0;

    /* set @股份交收费#=0; */
    set v_stock_settle_fee=0;

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* set @资产账户类型#=《资产账户类型-融资融券》; */
    set v_asset_acco_type=5;
    #不再考虑交易系统比清算系统提前归历史的问题，需清算的数据全在当前表

    /* [获取表记录变量][交易证券_报盘_成交回报表][字段][字段变量][ {资产账户类型} = @资产账户类型# and {记录序号} = @查询序号# and {成交日期} = @初始化日期# and {记录有效标志} = 《记录有效标志-有效》 and {清算结算标志} <>《清算结算标志-已处理》 and {处理状态} =《处理状态-成功》][4][@初始化日期#,@查询记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt, strike_deal_type, rsp_info, 
        deal_status, sett_flag, record_valid_flag, asset_acco_type into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_pass_no, v_out_acco, v_exch_no, v_stock_acco, 
        v_stock_code, v_report_date, v_report_no, v_strike_date, 
        v_strike_time, v_strike_no, v_order_dir, v_strike_price, 
        v_strike_qty, v_strike_amt, v_strike_deal_type, v_rsp_info, 
        v_deal_status, v_sett_flag, v_record_valid_flag, v_asset_acco_type from db_tdsecu.tb_tdserp_strikersp where  asset_acco_type = v_asset_acco_type and row_id = v_qry_no and strike_date = v_init_date and record_valid_flag = 1 and sett_flag <>1 and deal_status ="1" limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.20.21.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","查询记录序号=",v_query_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","查询记录序号=",v_query_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查正常返回][FOUND_ROWS() = 0] */
    if FOUND_ROWS() = 0 then
        leave label_pro;
    end if;


    /* set @记录个数# = 1; */
    set v_record_count = 1;

    /* set @临时_成交数量# = @成交数量#; */
    set v_tmp_strike_qty = v_strike_qty;

    /* set @临时_成交金额# = @成交金额#; */
    set v_tmp_strike_amt = v_strike_amt;

    /* set @临时_记录序号# = @记录序号#; */
    set v_tmp_row_id = v_row_id;

    /* [更新表记录][交易证券_报盘_成交回报表][{清算结算标志}=《清算结算标志-已处理》][{记录序号} = @记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_strikersp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_flag=1 where row_id = v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.20.21.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][交易证券_交易_订单表][字段][字段变量][{资产账户类型} = @资产账户类型#  and {通道编号} = @通道编号# and {外部账号} = @外部账号# and {市场编号} = @市场编号# and {申报日期} = @申报日期# and {申报编号} = @申报编号#][4][@通道编号#, @外部账号#,@市场编号#, @申报日期#, @申报编号#] */
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
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where asset_acco_type = v_asset_acco_type  and pass_no = v_pass_no and out_acco = v_out_acco and exch_no = v_exch_no and report_date = v_report_date and report_no = v_report_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.20.21.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,","," 外部账号=", v_out_acco,",","市场编号=",v_exch_no,","," 申报日期=", v_report_date,","," 申报编号=", v_report_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,","," 外部账号=", v_out_acco,",","市场编号=",v_exch_no,","," 申报日期=", v_report_date,","," 申报编号=", v_report_no);
        end if;
        leave label_pro;
    end if;


    /* set @订单编号# = @记录序号#; */
    set v_order_no = v_row_id;

    /* set @目标证券代码#=" "; */
    set v_target_stock_code=" ";

    /* set @目标证券代码编号#=0; */
    set v_target_stock_code_no=0;

    /* set @业务操作员编号#=@操作员编号#; */
    set v_busi_opor_no=v_opor_no;

    /* set @成交数量# = @临时_成交数量#; */
    set v_strike_qty = v_tmp_strike_qty;

    /* set @成交金额# = @临时_成交金额#; */
    set v_strike_amt = v_tmp_strike_amt;

    /* set @记录序号# = @临时_记录序号#; */
    set v_row_id = v_tmp_row_id;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_target_stock_code = v_target_stock_code;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
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
    SET p_all_fee = v_all_fee;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_strike_deal_type = v_strike_deal_type;
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

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_获取融资融券成交回报统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_GetCrdtStrikeTotal;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_GetCrdtStrikeTotal(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_count int,
    OUT p_succ_count int,
    OUT p_fail_count int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_count int;
    declare v_succ_count int;
    declare v_fail_count int;
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
    SET v_init_date = p_init_date;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_count = 0;
    SET v_succ_count = 0;
    SET v_fail_count = 0;
    SET v_asset_acco_type = 0;

    
    label_pro:BEGIN
    

    /* set @成交记录数# = 0; */
    set v_strike_count = 0;

    /* set @成功记录数# = 0; */
    set v_succ_count = 0;

    /* set @失败记录数# = 0; */
    set v_fail_count = 0;

    /* set @资产账户类型#=《资产账户类型-融资融券》; */
    set v_asset_acco_type=5;

    /* [获取表记录数量][交易证券_报盘_成交回报表][@成交记录数#][ {资产账户类型} = @资产账户类型# and  {成交日期} = @初始化日期# and {记录有效标志} = 《记录有效标志-有效》 and (@市场编号# = 0 or {市场编号} = @市场编号#)] */
    select count(1) into v_strike_count from db_tdsecu.tb_tdserp_strikersp where  asset_acco_type = v_asset_acco_type and  strike_date = v_init_date and record_valid_flag = 1 and (v_exch_no = 0 or exch_no = v_exch_no);


    /* if @成交记录数# > 0 then */
    if v_strike_count > 0 then

      /* [获取表记录数量][交易证券_报盘_成交回报表][@成功记录数#][ {资产账户类型} = @资产账户类型#  and {成交日期} = @初始化日期# and {记录有效标志} = 《记录有效标志-有效》 and (@市场编号# = 0 or {市场编号} = @市场编号#) and {处理状态} = 《处理状态-成功》] */
      select count(1) into v_succ_count from db_tdsecu.tb_tdserp_strikersp where  asset_acco_type = v_asset_acco_type  and strike_date = v_init_date and record_valid_flag = 1 and (v_exch_no = 0 or exch_no = v_exch_no) and deal_status = "1";


      /* [获取表记录数量][交易证券_报盘_成交回报表][@失败记录数#][{资产账户类型} = @资产账户类型# and {成交日期} = @初始化日期# and {记录有效标志} = 《记录有效标志-有效》 and (@市场编号# = 0 or {市场编号} = @市场编号#) and {处理状态} <> 《处理状态-成功》] */
      select count(1) into v_fail_count from db_tdsecu.tb_tdserp_strikersp where asset_acco_type = v_asset_acco_type and strike_date = v_init_date and record_valid_flag = 1 and (v_exch_no = 0 or exch_no = v_exch_no) and deal_status <> "1";

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_count = v_strike_count;
    SET p_succ_count = v_succ_count;
    SET p_fail_count = v_fail_count;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_获取融资融券清算转入成交统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_GetCrdtSwitchStrikeTotal;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_GetCrdtSwitchStrikeTotal(
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
    OUT p_pre_switch_strike_qty decimal(18,2),
    OUT p_alr_switch_strike_qty decimal(18,2)
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
    declare v_pre_switch_strike_qty decimal(18,2);
    declare v_alr_switch_strike_qty decimal(18,2);
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
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pre_switch_strike_qty = 0;
    SET v_alr_switch_strike_qty = 0;
    SET v_asset_acco_type = 0;

    
    label_pro:BEGIN
    

    /* set @待转入成交数# = 0; */
    set v_pre_switch_strike_qty = 0;

    /* set @已转入成交数# = 0; */
    set v_alr_switch_strike_qty = 0;

    /* set @资产账户类型#=《资产账户类型-融资融券》; */
    set v_asset_acco_type=5;

    /* [获取表记录数量][交易证券_报盘_成交回报表][@待转入成交数#][ {资产账户类型} = @资产账户类型# and {成交日期} = @初始化日期# and {记录有效标志} = 《记录有效标志-有效》 and {清算结算标志} <>《清算结算标志-已处理》 and {处理状态} =《处理状态-成功》 ] */
    select count(1) into v_pre_switch_strike_qty from db_tdsecu.tb_tdserp_strikersp where  asset_acco_type = v_asset_acco_type and strike_date = v_init_date and record_valid_flag = 1 and sett_flag <>1 and deal_status ="1" ;


    /* [获取表记录数量][交易证券_报盘_成交回报表][@已转入成交数#][ {资产账户类型} = @资产账户类型# and {成交日期} = @初始化日期# and  {记录有效标志} = 《记录有效标志-有效》 and {清算结算标志}=《清算结算标志-已处理》 and {处理状态} =《处理状态-成功》] */
    select count(1) into v_alr_switch_strike_qty from db_tdsecu.tb_tdserp_strikersp where  asset_acco_type = v_asset_acco_type and strike_date = v_init_date and  record_valid_flag = 1 and sett_flag=1 and deal_status ="1";

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pre_switch_strike_qty = v_pre_switch_strike_qty;
    SET p_alr_switch_strike_qty = v_alr_switch_strike_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_查询转入失败融资融券成交记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_QueryErrorCrdtStrike;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_QueryErrorCrdtStrike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sett_flag int,
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
    declare v_sett_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_sett_flag = p_sett_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco_type = 0;

    
    label_pro:BEGIN
    

    /* set @资产账户类型#=《资产账户类型-融资融券》; */
    set v_asset_acco_type=5;

    /* [右关联查询][交易证券_交易_订单表][交易证券_报盘_成交回报表][a.{记录序号}, a.{初始化日期}, t.{机构编号}, t.{产品编号}, t.{交易组编号}, a.{外部账号}, a.{股东代码}, a.{市场编号}, a.{证券代码}, a.{成交时间}, a.{成交编号}, t.{申报时间}, a.{申报编号}, a.{订单方向}, t.{订单数量}, a.{成交数量}, a.{清算结算标志}, case when t.{交易组编号} is NULL then "成交配对委托失败" else " " end as {备注信息}][t.{通道编号} = a.{通道编号} and t.{外部账号} = a.{外部账号} and t.{市场编号} = a.{市场编号}  and t.{申报编号} = a.{申报编号}][  a.{初始化日期}=a.{初始化日期} and a.{记录有效标志} = 《记录有效标志-有效》 and  a.{清算结算标志} <>《清算结算标志-已处理》  and a.{申报编号} <> " "  and a.{资产账户类型}=@资产账户类型# ] */
    select a.row_id, a.init_date, t.co_no, t.pd_no, t.exch_group_no, a.out_acco, a.stock_acco, a.exch_no, a.stock_code, a.strike_time, a.strike_no, t.report_time, a.report_no, a.order_dir, t.order_qty, a.strike_qty, a.sett_flag, case when t.exch_group_no is NULL then "成交配对委托失败" else " " end as remark_info from db_tdsecu.tb_tdsetd_order t right join db_tdsecu.tb_tdserp_strikersp a on t.pass_no = a.pass_no and t.out_acco = a.out_acco and t.exch_no = a.exch_no  and t.report_no = a.report_no where   a.init_date=a.init_date and a.record_valid_flag = 1 and  a.sett_flag <>1  and a.report_no <> " "  and a.asset_acco_type=v_asset_acco_type ;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_查询融资融券成交记录序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_QueryCrdtStrikeId;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_QueryCrdtStrikeId(
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
    SET v_qry_no = p_qry_no;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco_type = 0;

    
    label_pro:BEGIN
    

    /* set @资产账户类型#=《资产账户类型-融资融券》; */
    set v_asset_acco_type=5;

        /* [获取表记录][交易证券_报盘_成交回报表][字段][{资产账户类型}= @资产账户类型#  and {记录序号}>@查询序号# and {记录有效标志} = 《记录有效标志-有效》 and {清算结算标志} <>《清算结算标志-已处理》 and {处理状态} =《处理状态-成功》 order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, pd_no, exch_group_no, asset_acco_no, 
            pass_no, out_acco, exch_no, stock_acco, 
            stock_code, report_date, report_no, strike_date, 
            strike_time, strike_no, order_dir, strike_price, 
            strike_qty, strike_amt, strike_deal_type, rsp_info, 
            deal_status, sett_flag, record_valid_flag, asset_acco_type from db_tdsecu.tb_tdserp_strikersp where asset_acco_type= v_asset_acco_type  and row_id>v_qry_no and record_valid_flag = 1 and sett_flag <>1 and deal_status ="1" order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, pd_no, exch_group_no, asset_acco_no, 
            pass_no, out_acco, exch_no, stock_acco, 
            stock_code, report_date, report_no, strike_date, 
            strike_time, strike_no, order_dir, strike_price, 
            strike_qty, strike_amt, strike_deal_type, rsp_info, 
            deal_status, sett_flag, record_valid_flag, asset_acco_type from db_tdsecu.tb_tdserp_strikersp where asset_acco_type= v_asset_acco_type  and row_id>v_qry_no and record_valid_flag = 1 and sett_flag <>1 and deal_status ="1" order by row_id limit v_row_count;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_自动处理清算成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_AutoDealClearStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_AutoDealClearStrikeRsp(
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
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_target_stock_code_no int,
    OUT p_target_stock_code varchar(6),
    OUT p_stock_type int,
    OUT p_asset_type int,
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
    OUT p_all_fee decimal(18,4),
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_impawn_ratio decimal(18,12),
    OUT p_strike_deal_type int,
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
    OUT p_stock_settle_fee decimal(18,4)
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_target_stock_code varchar(6);
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
    declare v_all_fee decimal(18,4);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_strike_deal_type int;
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
    declare v_stock_acco varchar(16);
    declare v_rsp_info varchar(255);
    declare v_deal_status varchar(2);
    declare v_sett_flag int;
    declare v_record_valid_flag int;
    declare v_asset_acco_type int;
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_row_id bigint;
    declare v_oper_func_code varchar(16);
    declare v_exch_crncy_type varchar(3);
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_order_batch_no int;
    declare v_price_type int;
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
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
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_contra_no varchar(32);
    declare v_exist_debt_flag int;
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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_row_id = 0;
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
    SET v_target_stock_code_no = 0;
    SET v_target_stock_code = " ";
    SET v_stock_type = 0;
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
    SET v_all_fee = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_strike_deal_type = 0;
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
    SET v_stock_acco = " ";
    SET v_rsp_info = " ";
    SET v_deal_status = "0";
    SET v_sett_flag = 0;
    SET v_record_valid_flag = 0;
    SET v_asset_acco_type = 0;
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_amt = 0;
    SET v_tmp_row_id = 0;
    SET v_oper_func_code = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_order_batch_no = 0;
    SET v_price_type = 0;
    SET v_order_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_strike_bond_accr_intrst = 0;
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
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_contra_no = " ";
    SET v_exist_debt_flag = 0;
    SET v_order_id = 0;

    
    label_pro:BEGIN
    

    /* set @全部费用#=0; */
    set v_all_fee=0;

    /* set @印花税#=0; */
    set v_stamp_tax=0;

    /* set @过户费#=0; */
    set v_trans_fee=0;

    /* set @经手费#=0; */
    set v_brkage_fee=0;

    /* set @证管费#=0; */
    set v_SEC_charges=0;

    /* set @其他费用#=0; */
    set v_other_fee=0;

    /* set @交易佣金#=0; */
    set v_trade_commis=0;

    /* set @其他佣金#=0; */
    set v_other_commis=0;

    /* set @交易征费#=0; */
    set v_trade_tax=0;

    /* set @交易费#=0; */
    set v_trade_cost_fee=0;

    /* set @交易系统使用费#=0; */
    set v_trade_system_use_fee=0;

    /* set @股份交收费#=0; */
    set v_stock_settle_fee=0;

    /* set @记录个数# = 0; */
    set v_record_count = 0;
    #不再考虑交易系统比清算系统提前归历史的问题，需清算的数据全在当前表
    #[不报错锁定获取表记录变量][交易证券_报盘_成交回报表][字段][字段变量][{记录序号} = @查询序号# and {成交日期} = @初始化日期# and {记录有效标志} = 《记录有效标志-有效》 and {清算结算标志} <>《清算结算标志-已处理》  and  ({资产账户类型} = 《资产账户类型-A股》 or {资产账户类型} = 《资产账户类型-OTC账户》)  and {处理状态} =《处理状态-成功》 ][4][@初始化日期#,@查询记录序号#]

    /* [不报错锁定获取表记录变量][交易证券_报盘_成交回报表][字段][字段变量][{记录序号} > @查询序号# and {成交日期} = @初始化日期# and {记录有效标志} = 《记录有效标志-有效》 and {清算结算标志} <>《清算结算标志-已处理》  and  ({资产账户类型} = 《资产账户类型-A股》 or {资产账户类型} = 《资产账户类型-OTC账户》)  and {处理状态} =《处理状态-成功》 order by {记录序号}][4][@初始化日期#,@查询记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt, strike_deal_type, rsp_info, 
        deal_status, sett_flag, record_valid_flag, asset_acco_type into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_pass_no, v_out_acco, v_exch_no, v_stock_acco, 
        v_stock_code, v_report_date, v_report_no, v_strike_date, 
        v_strike_time, v_strike_no, v_order_dir, v_strike_price, 
        v_strike_qty, v_strike_amt, v_strike_deal_type, v_rsp_info, 
        v_deal_status, v_sett_flag, v_record_valid_flag, v_asset_acco_type from db_tdsecu.tb_tdserp_strikersp where row_id > v_qry_no and strike_date = v_init_date and record_valid_flag = 1 and sett_flag <>1  and  (asset_acco_type = 1 or asset_acco_type = 4)  and deal_status ="1" order by row_id limit 1 for update;


    /* [检查正常返回][FOUND_ROWS() = 0] */
    if FOUND_ROWS() = 0 then
        leave label_pro;
    end if;


    /* set @记录个数# = 1; */
    set v_record_count = 1;

    /* set @临时_成交数量# = @成交数量#; */
    set v_tmp_strike_qty = v_strike_qty;

    /* set @临时_成交金额# = @成交金额#; */
    set v_tmp_strike_amt = v_strike_amt;

    /* set @临时_记录序号# = @记录序号#; */
    set v_tmp_row_id = v_row_id;

    /* [更新表记录][交易证券_报盘_成交回报表][{清算结算标志}=《清算结算标志-已处理》][{记录序号} = @记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_strikersp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_flag=1 where row_id = v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.20.26.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* if @市场编号#<>《市场编号-场外交易市场》 then */
    if v_exch_no<>5 then

        /* [获取表记录变量][交易证券_交易_订单表][字段][字段变量][{通道编号} = @通道编号# and {外部账号} = @外部账号# and {市场编号} = @市场编号# and {申报日期} = @申报日期# and {申报编号} = @申报编号#][4][@通道编号#, @外部账号#,@市场编号#, @申报日期#, @申报编号#] */
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
            v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where pass_no = v_pass_no and out_acco = v_out_acco and exch_no = v_exch_no and report_date = v_report_date and report_no = v_report_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "tdsecuA.20.26.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,","," 外部账号=", v_out_acco,",","市场编号=",v_exch_no,","," 申报日期=", v_report_date,","," 申报编号=", v_report_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("通道编号=",v_pass_no,","," 外部账号=", v_out_acco,",","市场编号=",v_exch_no,","," 申报日期=", v_report_date,","," 申报编号=", v_report_no);
            end if;
            leave label_pro;
        end if;


        /* set @订单编号# = @记录序号#; */
        set v_order_no = v_row_id;

        /* set @目标证券代码#=" "; */
        set v_target_stock_code=" ";

        /* set @目标证券代码编号#=0; */
        set v_target_stock_code_no=0;
    else

        /* [获取表记录变量][交易证券_报盘_成交表][{订单序号},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{交易征费},{交易费},{交易系统使用费},{股份交收费},{证券类型},{资产类型},{股东代码编号},{证券代码编号},{订单日期},{订单数量},{订单价格},{交易代码编号},{标的代码编号}][@订单序号#,@全部费用#,@印花税#,@过户费#,@经手费#,@证管费#,@其他费用#,@交易佣金#,@其他佣金#,@交易征费#,@交易费#,@交易系统使用费#,@股份交收费#,@证券类型#,@资产类型#,@股东代码编号#,@证券代码编号#,@订单日期#,@订单数量#,@订单价格#,@交易代码编号#,@标的代码编号#][{通道编号} = @通道编号# and {外部账号} = @外部账号# and {市场编号} = @市场编号# and {成交日期} = @成交日期# and {成交编号} = @成交编号# and {订单方向}=@订单方向#][4][@通道编号#, @外部账号#,@市场编号#, @成交日期#, @成交编号#,@订单方向#] */
        select order_id,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,trade_tax,trade_cost_fee,trade_system_use_fee,stock_settle_fee,stock_type,asset_type,stock_acco_no,stock_code_no,order_date,order_qty,order_price,trade_code_no,target_code_no into v_order_id,v_all_fee,v_stamp_tax,v_trans_fee,v_brkage_fee,v_SEC_charges,v_other_fee,v_trade_commis,v_other_commis,v_trade_tax,v_trade_cost_fee,v_trade_system_use_fee,v_stock_settle_fee,v_stock_type,v_asset_type,v_stock_acco_no,v_stock_code_no,v_order_date,v_order_qty,v_order_price,v_trade_code_no,v_target_code_no from db_tdsecu.tb_tdserp_strike where pass_no = v_pass_no and out_acco = v_out_acco and exch_no = v_exch_no and strike_date = v_strike_date and strike_no = v_strike_no and order_dir=v_order_dir limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "tdsecuA.20.26.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,","," 外部账号=", v_out_acco,",","市场编号=",v_exch_no,","," 成交日期=", v_strike_date,","," 成交编号=", v_strike_no,",","订单方向=",v_order_dir),"#",v_mysql_message);
            else
                SET v_error_info = concat("通道编号=",v_pass_no,","," 外部账号=", v_out_acco,",","市场编号=",v_exch_no,","," 成交日期=", v_strike_date,","," 成交编号=", v_strike_no,",","订单方向=",v_order_dir);
            end if;
            leave label_pro;
        end if;


        /* set @订单编号# = @订单序号#; */
        set v_order_no = v_order_id;
        #基金转换的成交数据需要关联订单表取,成交表中的数量是目标基金的成交数量,源基金的交易数量要去历史订单表中去取

        /* if @订单方向# = 《订单方向-基金转换》 then */
        if v_order_dir = 12 then

            /* [获取表记录变量][历史_交易证券_交易_订单表][{目标证券代码},{目标证券代码编号},{订单数量},{证券代码编号},{证券代码}][@目标证券代码#,@目标证券代码编号#,@订单数量#,@证券代码编号#,@证券代码#][{记录序号}=@订单序号#][4][@订单序号#] */
            select target_stock_code,target_stock_code_no,order_qty,stock_code_no,stock_code into v_target_stock_code,v_target_stock_code_no,v_order_qty,v_stock_code_no,v_stock_code from db_tdsecu_his.tb_tdsetd_order_his where row_id=v_order_id limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "tdsecuA.20.26.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单序号=",v_order_id);
                end if;
                leave label_pro;
            end if;

        end if;
    end if;

    /* set @成交数量# = @临时_成交数量#; */
    set v_strike_qty = v_tmp_strike_qty;

    /* set @成交金额# = @临时_成交金额#; */
    set v_strike_amt = v_tmp_strike_amt;

    /* set @记录序号# = @临时_记录序号#; */
    set v_row_id = v_tmp_row_id;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;
    SET p_row_id = v_row_id;
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
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_target_stock_code = v_target_stock_code;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
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
    SET p_all_fee = v_all_fee;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_strike_deal_type = v_strike_deal_type;
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

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_红冲蓝补同步交易组负债明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_PatchSyncExgpDebtDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_PatchSyncExgpDebtDetail(
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
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_invest_type int,
    IN p_debt_type int,
    IN p_occur_qty decimal(18,2),
    IN p_occur_amt decimal(18,4),
    IN p_debt_fee decimal(18,4),
    IN p_debt_interest decimal(18,4),
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
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_invest_type int;
    declare v_debt_type int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_debt_fee decimal(18,4);
    declare v_debt_interest decimal(18,4);
    declare v_order_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_begin_amt decimal(18,4);
    declare v_pass_no int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_no int;
    declare v_debt_qty decimal(18,2);
    declare v_debt_amt decimal(18,4);
    declare v_debt_order_no int;
    declare v_intrst_base_amt decimal(18,4);
    declare v_debt_return_amt decimal(18,4);
    declare v_debt_return_qty decimal(18,2);
    declare v_return_interest_amt decimal(18,4);
    declare v_debt_status int;
    declare v_remark_info varchar(255);
    declare v_tmp_debt_interest decimal(18,4);
    declare v_tmp_debt_fee decimal(18,4);
    declare v_remain_strike_amt decimal(18,4);
    declare v_remain_strike_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_detail_posi_id bigint;
    declare v_update_times int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_occur_intrst_amt decimal(18,4);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_invest_type = p_invest_type;
    SET v_debt_type = p_debt_type;
    SET v_occur_qty = p_occur_qty;
    SET v_occur_amt = p_occur_amt;
    SET v_debt_fee = p_debt_fee;
    SET v_debt_interest = p_debt_interest;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_begin_amt = 0;
    SET v_pass_no = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_fee = 0;
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_no = 0;
    SET v_debt_qty = 0;
    SET v_debt_amt = 0;
    SET v_debt_order_no = 0;
    SET v_intrst_base_amt = 0;
    SET v_debt_return_amt = 0;
    SET v_debt_return_qty = 0;
    SET v_return_interest_amt = 0;
    SET v_debt_status = 0;
    SET v_remark_info = " ";
    SET v_tmp_debt_interest = 0;
    SET v_tmp_debt_fee = 0;
    SET v_remain_strike_amt = 0;
    SET v_remain_strike_qty = 0;
    SET v_row_id = 0;
    SET v_detail_posi_id = 0;
    SET v_update_times = 1;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_occur_intrst_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @通道编号# = 0; */
    set v_pass_no = 0;

    /* set @成交数量# = 0; */
    set v_strike_qty = 0;

    /* set @成交金额# = 0; */
    set v_strike_amt = 0;

    /* set @成交费用# = 0; */
    set v_strike_fee = 0;

    /* set @申报编号# = 0; */
    set v_report_no = 0;

    /* set @订单日期# = 0; */
    set v_order_date = 0;

    /* set @订单时间# = 0; */
    set v_order_time = 0;

    /* set @订单价格# = 0; */
    set v_order_price = 0;

    /* set @订单数量# = 0; */
    set v_order_qty = 0;

    /* set @订单编号# = 0; */
    set v_order_no = 0;

    /* set @负债数量# = @变动数量#; */
    set v_debt_qty = v_occur_qty;

    /* set @负债金额# = @变动金额#; */
    set v_debt_amt = v_occur_amt;

    /* set @负债订单编号# = @订单编号#; */
    set v_debt_order_no = v_order_no;

    /* set @利息积数# = 0; */
    set v_intrst_base_amt = 0;

    /* set @已归还金额# = 0; */
    set v_debt_return_amt = 0;

    /* set @已归还数量# = 0; */
    set v_debt_return_qty = 0;

    /* set @归还利息金额# = 0; */
    set v_return_interest_amt = 0;

    /* set @负债状态# = 《负债状态-未归还》; */
    set v_debt_status = 1;

    /* set @备注信息# = "红冲蓝补同步负债明细"; */
    set v_remark_info = "红冲蓝补同步负债明细";

    /* set @临时_负债利息# = @负债利息#; */
    set v_tmp_debt_interest = v_debt_interest;

    /* set @临时_负债费用# = @负债费用#; */
    set v_tmp_debt_fee = v_debt_fee;

    /* set @剩余成交金额# = -@变动金额# - @临时_负债利息#; */
    set v_remain_strike_amt = -v_occur_amt - v_tmp_debt_interest;

    /* set @剩余成交数量# = -@变动数量#; */
    set v_remain_strike_qty = -v_occur_qty;

    /* set @记录序号# = 0; */
    set v_row_id = 0;
    #3-交易组负债明细表

    /* if @剩余成交金额# > 0  or @剩余成交数量# > 0 then */
    if v_remain_strike_amt > 0  or v_remain_strike_qty > 0 then
        #遍历去反冲负债
        loop_label:loop

            /* 调用【原子_交易证券_接口_锁定获取交易组负债明细】*/
            call db_tdsecu.pra_tdsetdif_LockGetExgpDebtDetail(
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
                v_stock_code_no,
                v_debt_type,
                v_row_id,
                v_error_code,
                v_error_info,
                v_detail_posi_id,
                v_init_date,
                v_pass_no,
                v_exch_no,
                v_stock_type,
                v_asset_type,
                v_strike_qty,
                v_strike_amt,
                v_strike_fee,
                v_order_no,
                v_report_no,
                v_order_date,
                v_order_time,
                v_order_dir,
                v_order_price,
                v_order_qty,
                v_debt_amt,
                v_debt_qty,
                v_debt_fee,
                v_debt_interest,
                v_intrst_base_amt,
                v_debt_return_amt,
                v_debt_return_qty,
                v_return_interest_amt,
                v_debt_status,
                v_remark_info,
                v_update_times,
                v_stock_code,
                v_stock_acco_no);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.20.27.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_接口_锁定获取交易组负债明细出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* if @错误编码#="0" then */
            if v_error_code="0" then

                /* set @记录序号# = @明细持仓序号#; */
                set v_row_id = v_detail_posi_id;

                /* if @负债类型# = 《负债类型-融资》 then */
                if v_debt_type = 1 then
                    #只够还利息

                    /* if @负债利息# >= (@归还利息金额#+@剩余成交金额#) then */
                    if v_debt_interest >= (v_return_interest_amt+v_remain_strike_amt) then

                        /* [更新表记录][交易证券_账户_交易组负债明细表][{负债利息} = {负债利息}-@剩余成交金额#][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_tdsecu.tb_tdseac_exgp_debtjour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_interest = debt_interest-v_remain_strike_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "tdsecuA.20.27.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;

                    /* elseif (@负债金额#+@负债利息#) > (@已归还金额#+@归还利息金额#+@剩余成交金额#) then */
                    elseif (v_debt_amt+v_debt_interest) > (v_debt_return_amt+v_return_interest_amt+v_remain_strike_amt) then

                        /* [更新表记录][交易证券_账户_交易组负债明细表][{负债利息} = {归还利息金额}][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_tdsecu.tb_tdseac_exgp_debtjour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_interest = return_interest_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "tdsecuA.20.27.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;


                        /* set @剩余成交金额# = @剩余成交金额# - (@负债利息#-@归还利息金额#); */
                        set v_remain_strike_amt = v_remain_strike_amt - (v_debt_interest-v_return_interest_amt);

                        /* [更新表记录][交易证券_账户_交易组负债明细表][{负债金额} = {负债金额} -@剩余成交金额#][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_tdsecu.tb_tdseac_exgp_debtjour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_amt = debt_amt -v_remain_strike_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "tdsecuA.20.27.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;

                    /* elseif (@负债金额#+@负债利息#) = (@已归还金额#+@归还利息金额#+@剩余成交金额#) then */
                    elseif (v_debt_amt+v_debt_interest) = (v_debt_return_amt+v_return_interest_amt+v_remain_strike_amt) then

                        /* [更新表记录][交易证券_账户_交易组负债明细表][{负债利息} = {归还利息金额}][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_tdsecu.tb_tdseac_exgp_debtjour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_interest = return_interest_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "tdsecuA.20.27.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;


                        /* set @剩余成交金额# = @剩余成交金额# - (@负债利息#-@归还利息金额#); */
                        set v_remain_strike_amt = v_remain_strike_amt - (v_debt_interest-v_return_interest_amt);

                        /* [更新表记录][交易证券_账户_交易组负债明细表][{负债金额} = {负债金额} -@剩余成交金额#,{负债状态} = 《负债状态-已归还》][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_tdsecu.tb_tdseac_exgp_debtjour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_amt = debt_amt -v_remain_strike_amt,debt_status = 2 where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "tdsecuA.20.27.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;
                   else

                        /* [更新表记录][交易证券_账户_交易组负债明细表][{负债金额} = {已归还金额},{负债利息} ={归还利息金额},{负债状态} = 《负债状态-已归还》][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_tdsecu.tb_tdseac_exgp_debtjour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_amt = debt_return_amt,debt_interest =return_interest_amt,debt_status = 2 where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "tdsecuA.20.27.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;


                        /* set @剩余成交金额# = @剩余成交金额# - (@负债利息#-@归还利息金额#) - (@负债金额# - @已归还金额#); */
                        set v_remain_strike_amt = v_remain_strike_amt - (v_debt_interest-v_return_interest_amt) - (v_debt_amt - v_debt_return_amt);
                    end if;

                /* elseif @负债类型# = 《负债类型-融券》 then */
                elseif v_debt_type = 2 then

                    /* if @负债数量# > (@已归还数量# + @剩余成交数量#) then */
                    if v_debt_qty > (v_debt_return_qty + v_remain_strike_qty) then

                        /* set @变动利息金额# = round((@负债利息#-@归还利息金额#)*@剩余成交数量#/(@负债数量#-@已归还数量#),4); */
                        set v_occur_intrst_amt = round((v_debt_interest-v_return_interest_amt)*v_remain_strike_qty/(v_debt_qty-v_debt_return_qty),4);

                        /* [更新表记录][交易证券_账户_交易组负债明细表][{负债数量} = {负债数量}-@剩余成交数量#,{已归还金额} =round({已归还数量}/{负债数量}*{负债金额},4),{归还利息金额}={归还利息金额}+@变动利息金额#][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_tdsecu.tb_tdseac_exgp_debtjour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_qty = debt_qty-v_remain_strike_qty,debt_return_amt =round(debt_return_qty/debt_qty*debt_amt,4),return_interest_amt=return_interest_amt+v_occur_intrst_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "tdsecuA.20.27.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;

                   /* elseif @负债数量# = (@已归还数量# +@剩余成交数量#) then */
                   elseif v_debt_qty = (v_debt_return_qty +v_remain_strike_qty) then

                        /* [更新表记录][交易证券_账户_交易组负债明细表][{负债数量} = {已归还数量},{已归还金额} ={负债金额},{归还利息金额}={负债利息},{负债状态} = 《负债状态-已归还》][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_tdsecu.tb_tdseac_exgp_debtjour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_qty = debt_return_qty,debt_return_amt =debt_amt,return_interest_amt=debt_interest,debt_status = 2 where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "tdsecuA.20.27.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;
                   else

                        /* [更新表记录][交易证券_账户_交易组负债明细表][{负债数量} = {已归还数量},{已归还金额} ={负债金额},{归还利息金额}={负债利息},{负债状态} = 《负债状态-已归还》 ][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_tdsecu.tb_tdseac_exgp_debtjour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_qty = debt_return_qty,debt_return_amt =debt_amt,return_interest_amt=debt_interest,debt_status = 2  where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "tdsecuA.20.27.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;


                        /* set @剩余成交数量# = @剩余成交数量#-(@负债数量#-@已归还数量#); */
                        set v_remain_strike_qty = v_remain_strike_qty-(v_debt_qty-v_debt_return_qty);
                   end if;
                end if;
            else

                /* set @错误编码#="0"; */
                set v_error_code="0";

                /* set @错误信息#=' '; */
                set v_error_info=' ';
                leave loop_label;
            end if;
        end loop;
    else

        /* set @负债状态# = 《负债状态-未归还》; */
        set v_debt_status = 1;

        /* [插入表记录][交易证券_账户_交易组负债明细表][字段][字段变量][1][@初始化日期#, @订单编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdseac_exgp_debtjour(
            create_date, create_time, update_date, 
            update_time, update_times, init_date, opor_no, 
            co_no, pd_no, exch_group_no, asset_acco_no, 
            exch_no, stock_acco_no, stock_code, stock_code_no, 
            stock_type, asset_type, debt_type, strike_qty, 
            strike_amt, strike_fee, debt_order_no, report_no, 
            order_date, order_time, order_dir, order_price, 
            order_qty, debt_amt, debt_qty, debt_fee, 
            debt_interest, intrst_base_amt, debt_return_amt, debt_return_qty, 
            return_interest_amt, debt_status, remark_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_opor_no, 
            v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
            v_exch_no, v_stock_acco_no, v_stock_code, v_stock_code_no, 
            v_stock_type, v_asset_type, v_debt_type, v_strike_qty, 
            v_strike_amt, v_strike_fee, v_debt_order_no, v_report_no, 
            v_order_date, v_order_time, v_order_dir, v_order_price, 
            v_order_qty, v_debt_amt, v_debt_qty, v_debt_fee, 
            v_debt_interest, v_intrst_base_amt, v_debt_return_amt, v_debt_return_qty, 
            v_return_interest_amt, v_debt_status, v_remark_info);
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.20.27.1";
            SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,","," 订单编号=", v_order_no),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_锁定获取交易组负债明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_LockGetExgpDebtDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_LockGetExgpDebtDetail(
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
    IN p_stock_code_no int,
    IN p_debt_type int,
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_detail_posi_id bigint,
    OUT p_init_date int,
    OUT p_pass_no int,
    OUT p_exch_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_fee decimal(18,4),
    OUT p_order_no int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_debt_amt decimal(18,4),
    OUT p_debt_qty decimal(18,2),
    OUT p_debt_fee decimal(18,4),
    OUT p_debt_interest decimal(18,4),
    OUT p_intrst_base_amt decimal(18,4),
    OUT p_debt_return_amt decimal(18,4),
    OUT p_debt_return_qty decimal(18,2),
    OUT p_return_interest_amt decimal(18,4),
    OUT p_debt_status int,
    OUT p_remark_info varchar(255),
    OUT p_update_times int,
    OUT p_stock_code varchar(6),
    OUT p_stock_acco_no int
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
    declare v_stock_code_no int;
    declare v_debt_type int;
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_detail_posi_id bigint;
    declare v_init_date int;
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_order_no int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_debt_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_debt_fee decimal(18,4);
    declare v_debt_interest decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_debt_return_amt decimal(18,4);
    declare v_debt_return_qty decimal(18,2);
    declare v_return_interest_amt decimal(18,4);
    declare v_debt_status int;
    declare v_remark_info varchar(255);
    declare v_update_times int;
    declare v_stock_code varchar(6);
    declare v_stock_acco_no int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_debt_order_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_debt_type = p_debt_type;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_detail_posi_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pass_no = 0;
    SET v_exch_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_fee = 0;
    SET v_order_no = 0;
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_debt_amt = 0;
    SET v_debt_qty = 0;
    SET v_debt_fee = 0;
    SET v_debt_interest = 0;
    SET v_intrst_base_amt = 0;
    SET v_debt_return_amt = 0;
    SET v_debt_return_qty = 0;
    SET v_return_interest_amt = 0;
    SET v_debt_status = 0;
    SET v_remark_info = " ";
    SET v_update_times = 1;
    SET v_stock_code = " ";
    SET v_stock_acco_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_debt_order_no = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][交易证券_账户_交易组负债明细表][字段][字段变量][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号#  and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and {负债类型}=@负债类型# and {负债状态}<>《负债状态-已归还》   order by {负债订单编号},{更新时间}][4][@交易组编号#,@资产账户编号#,@证券代码编号#,@负债类型#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code, 
        stock_code_no, stock_type, asset_type, debt_type, 
        strike_qty, strike_amt, strike_fee, debt_order_no, 
        report_no, order_date, order_time, order_dir, 
        order_price, order_qty, debt_amt, debt_qty, 
        debt_fee, debt_interest, intrst_base_amt, debt_return_amt, 
        debt_return_qty, return_interest_amt, debt_status, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_opor_no, v_co_no, v_pd_no, v_exch_group_no, 
        v_asset_acco_no, v_exch_no, v_stock_acco_no, v_stock_code, 
        v_stock_code_no, v_stock_type, v_asset_type, v_debt_type, 
        v_strike_qty, v_strike_amt, v_strike_fee, v_debt_order_no, 
        v_report_no, v_order_date, v_order_time, v_order_dir, 
        v_order_price, v_order_qty, v_debt_amt, v_debt_qty, 
        v_debt_fee, v_debt_interest, v_intrst_base_amt, v_debt_return_amt, 
        v_debt_return_qty, v_return_interest_amt, v_debt_status, v_remark_info from db_tdsecu.tb_tdseac_exgp_debtjour where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no  and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and debt_type=v_debt_type and debt_status<>2   order by debt_order_no,update_time limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.20.28.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","负债类型=",v_debt_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","负债类型=",v_debt_type);
        end if;
        leave label_pro;
    end if;


    /* set @明细持仓序号# = @记录序号#; */
    set v_detail_posi_id = v_row_id;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_detail_posi_id = v_detail_posi_id;
    SET p_init_date = v_init_date;
    SET p_pass_no = v_pass_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_fee = v_strike_fee;
    SET p_order_no = v_order_no;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_debt_amt = v_debt_amt;
    SET p_debt_qty = v_debt_qty;
    SET p_debt_fee = v_debt_fee;
    SET p_debt_interest = v_debt_interest;
    SET p_intrst_base_amt = v_intrst_base_amt;
    SET p_debt_return_amt = v_debt_return_amt;
    SET p_debt_return_qty = v_debt_return_qty;
    SET p_return_interest_amt = v_return_interest_amt;
    SET p_debt_status = v_debt_status;
    SET p_remark_info = v_remark_info;
    SET p_update_times = v_update_times;
    SET p_stock_code = v_stock_code;
    SET p_stock_acco_no = v_stock_acco_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_锁定获取资产账户负债明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_LockGetAsacDebtDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_LockGetAsacDebtDetail(
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
    IN p_stock_code_no int,
    IN p_debt_type int,
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_detail_posi_id bigint,
    OUT p_init_date int,
    OUT p_pass_no int,
    OUT p_exch_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_fee decimal(18,4),
    OUT p_order_no int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_debt_amt decimal(18,4),
    OUT p_debt_qty decimal(18,2),
    OUT p_debt_fee decimal(18,4),
    OUT p_debt_interest decimal(18,4),
    OUT p_intrst_base_amt decimal(18,4),
    OUT p_debt_return_amt decimal(18,4),
    OUT p_debt_return_qty decimal(18,2),
    OUT p_return_interest_amt decimal(18,4),
    OUT p_debt_status int,
    OUT p_remark_info varchar(255),
    OUT p_update_times int,
    OUT p_stock_code varchar(6),
    OUT p_stock_acco_no int
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
    declare v_stock_code_no int;
    declare v_debt_type int;
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_detail_posi_id bigint;
    declare v_init_date int;
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_order_no int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_debt_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_debt_fee decimal(18,4);
    declare v_debt_interest decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_debt_return_amt decimal(18,4);
    declare v_debt_return_qty decimal(18,2);
    declare v_return_interest_amt decimal(18,4);
    declare v_debt_status int;
    declare v_remark_info varchar(255);
    declare v_update_times int;
    declare v_stock_code varchar(6);
    declare v_stock_acco_no int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_debt_order_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_debt_type = p_debt_type;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_detail_posi_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pass_no = 0;
    SET v_exch_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_fee = 0;
    SET v_order_no = 0;
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_debt_amt = 0;
    SET v_debt_qty = 0;
    SET v_debt_fee = 0;
    SET v_debt_interest = 0;
    SET v_intrst_base_amt = 0;
    SET v_debt_return_amt = 0;
    SET v_debt_return_qty = 0;
    SET v_return_interest_amt = 0;
    SET v_debt_status = 0;
    SET v_remark_info = " ";
    SET v_update_times = 1;
    SET v_stock_code = " ";
    SET v_stock_acco_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_debt_order_no = 0;
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][交易证券_账户_资产账户负债明细表][字段][字段变量][{资产账户编号}=@资产账户编号#  and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and {负债类型}=@负债类型# and {负债状态}<>《负债状态-已归还》   order by {负债订单编号},{更新时间}][4][@交易组编号#,@资产账户编号#,@证券代码编号#,@负债类型#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code, stock_code_no, 
        stock_type, asset_type, debt_type, strike_qty, 
        strike_amt, strike_fee, debt_order_no, report_no, 
        order_date, order_time, order_dir, order_price, 
        order_qty, debt_amt, debt_qty, debt_fee, 
        debt_interest, intrst_base_amt, debt_return_amt, debt_return_qty, 
        return_interest_amt, debt_status, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_opor_no, v_co_no, v_pd_no, v_asset_acco_no, 
        v_exch_no, v_stock_acco_no, v_stock_code, v_stock_code_no, 
        v_stock_type, v_asset_type, v_debt_type, v_strike_qty, 
        v_strike_amt, v_strike_fee, v_debt_order_no, v_report_no, 
        v_order_date, v_order_time, v_order_dir, v_order_price, 
        v_order_qty, v_debt_amt, v_debt_qty, v_debt_fee, 
        v_debt_interest, v_intrst_base_amt, v_debt_return_amt, v_debt_return_qty, 
        v_return_interest_amt, v_debt_status, v_remark_info from db_tdsecu.tb_tdseac_asac_debtjour where asset_acco_no=v_asset_acco_no  and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and debt_type=v_debt_type and debt_status<>2   order by debt_order_no,update_time limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.20.29.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","负债类型=",v_debt_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","负债类型=",v_debt_type);
        end if;
        leave label_pro;
    end if;


    /* set @明细持仓序号# = @记录序号#; */
    set v_detail_posi_id = v_row_id;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_detail_posi_id = v_detail_posi_id;
    SET p_init_date = v_init_date;
    SET p_pass_no = v_pass_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_fee = v_strike_fee;
    SET p_order_no = v_order_no;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_debt_amt = v_debt_amt;
    SET p_debt_qty = v_debt_qty;
    SET p_debt_fee = v_debt_fee;
    SET p_debt_interest = v_debt_interest;
    SET p_intrst_base_amt = v_intrst_base_amt;
    SET p_debt_return_amt = v_debt_return_amt;
    SET p_debt_return_qty = v_debt_return_qty;
    SET p_return_interest_amt = v_return_interest_amt;
    SET p_debt_status = v_debt_status;
    SET p_remark_info = v_remark_info;
    SET p_update_times = v_update_times;
    SET p_stock_code = v_stock_code;
    SET p_stock_acco_no = v_stock_acco_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_接口_红冲蓝补同步资产账户负债明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetdif_PatchSyncAsacDebtDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetdif_PatchSyncAsacDebtDetail(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_invest_type int,
    IN p_debt_type int,
    IN p_occur_qty decimal(18,2),
    IN p_occur_amt decimal(18,4),
    IN p_debt_fee decimal(18,4),
    IN p_debt_interest decimal(18,4),
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
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_invest_type int;
    declare v_debt_type int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_debt_fee decimal(18,4);
    declare v_debt_interest decimal(18,4);
    declare v_order_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_begin_amt decimal(18,4);
    declare v_pass_no int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_no int;
    declare v_debt_qty decimal(18,2);
    declare v_debt_amt decimal(18,4);
    declare v_debt_order_no int;
    declare v_intrst_base_amt decimal(18,4);
    declare v_debt_return_amt decimal(18,4);
    declare v_debt_return_qty decimal(18,2);
    declare v_return_interest_amt decimal(18,4);
    declare v_debt_status int;
    declare v_remark_info varchar(255);
    declare v_tmp_debt_interest decimal(18,4);
    declare v_tmp_debt_fee decimal(18,4);
    declare v_remain_strike_amt decimal(18,4);
    declare v_remain_strike_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_detail_posi_id bigint;
    declare v_update_times int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_occur_intrst_amt decimal(18,4);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_invest_type = p_invest_type;
    SET v_debt_type = p_debt_type;
    SET v_occur_qty = p_occur_qty;
    SET v_occur_amt = p_occur_amt;
    SET v_debt_fee = p_debt_fee;
    SET v_debt_interest = p_debt_interest;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_begin_amt = 0;
    SET v_pass_no = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_fee = 0;
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_no = 0;
    SET v_debt_qty = 0;
    SET v_debt_amt = 0;
    SET v_debt_order_no = 0;
    SET v_intrst_base_amt = 0;
    SET v_debt_return_amt = 0;
    SET v_debt_return_qty = 0;
    SET v_return_interest_amt = 0;
    SET v_debt_status = 0;
    SET v_remark_info = " ";
    SET v_tmp_debt_interest = 0;
    SET v_tmp_debt_fee = 0;
    SET v_remain_strike_amt = 0;
    SET v_remain_strike_qty = 0;
    SET v_row_id = 0;
    SET v_detail_posi_id = 0;
    SET v_update_times = 1;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_occur_intrst_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @通道编号# = 0; */
    set v_pass_no = 0;

    /* set @成交数量# = 0; */
    set v_strike_qty = 0;

    /* set @成交金额# = 0; */
    set v_strike_amt = 0;

    /* set @成交费用# = 0; */
    set v_strike_fee = 0;

    /* set @申报编号# = 0; */
    set v_report_no = 0;

    /* set @订单日期# = 0; */
    set v_order_date = 0;

    /* set @订单时间# = 0; */
    set v_order_time = 0;

    /* set @订单价格# = 0; */
    set v_order_price = 0;

    /* set @订单数量# = 0; */
    set v_order_qty = 0;

    /* set @订单编号# = 0; */
    set v_order_no = 0;

    /* set @负债数量# = @变动数量#; */
    set v_debt_qty = v_occur_qty;

    /* set @负债金额# = @变动金额#; */
    set v_debt_amt = v_occur_amt;

    /* set @负债订单编号# = @订单编号#; */
    set v_debt_order_no = v_order_no;

    /* set @利息积数# = 0; */
    set v_intrst_base_amt = 0;

    /* set @已归还金额# = 0; */
    set v_debt_return_amt = 0;

    /* set @已归还数量# = 0; */
    set v_debt_return_qty = 0;

    /* set @归还利息金额# = 0; */
    set v_return_interest_amt = 0;

    /* set @负债状态# = 《负债状态-未归还》; */
    set v_debt_status = 1;

    /* set @备注信息# = "红冲蓝补同步负债明细"; */
    set v_remark_info = "红冲蓝补同步负债明细";

    /* set @临时_负债利息# = @负债利息#; */
    set v_tmp_debt_interest = v_debt_interest;

    /* set @临时_负债费用# = @负债费用#; */
    set v_tmp_debt_fee = v_debt_fee;

    /* set @剩余成交金额# = -@变动金额# - @临时_负债利息#; */
    set v_remain_strike_amt = -v_occur_amt - v_tmp_debt_interest;

    /* set @剩余成交数量# = -@变动数量#; */
    set v_remain_strike_qty = -v_occur_qty;

    /* set @记录序号# = 0; */
    set v_row_id = 0;
    #3-资产账户负债明细表

    /* if @剩余成交金额# > 0  or @剩余成交数量# > 0 then */
    if v_remain_strike_amt > 0  or v_remain_strike_qty > 0 then
        #遍历去反冲负债
        loop_label:loop

            /* 调用【原子_交易证券_接口_锁定获取资产账户负债明细】*/
            call db_tdsecu.pra_tdsetdif_LockGetAsacDebtDetail(
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
                v_stock_code_no,
                v_debt_type,
                v_row_id,
                v_error_code,
                v_error_info,
                v_detail_posi_id,
                v_init_date,
                v_pass_no,
                v_exch_no,
                v_stock_type,
                v_asset_type,
                v_strike_qty,
                v_strike_amt,
                v_strike_fee,
                v_order_no,
                v_report_no,
                v_order_date,
                v_order_time,
                v_order_dir,
                v_order_price,
                v_order_qty,
                v_debt_amt,
                v_debt_qty,
                v_debt_fee,
                v_debt_interest,
                v_intrst_base_amt,
                v_debt_return_amt,
                v_debt_return_qty,
                v_return_interest_amt,
                v_debt_status,
                v_remark_info,
                v_update_times,
                v_stock_code,
                v_stock_acco_no);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.20.30.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_接口_锁定获取资产账户负债明细出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* if @错误编码#="0" then */
            if v_error_code="0" then

                /* set @记录序号# = @明细持仓序号#; */
                set v_row_id = v_detail_posi_id;

                /* if @负债类型# = 《负债类型-融资》 then */
                if v_debt_type = 1 then
                    #只够还利息

                    /* if @负债利息# >= (@归还利息金额#+@剩余成交金额#) then */
                    if v_debt_interest >= (v_return_interest_amt+v_remain_strike_amt) then

                        /* [更新表记录][交易证券_账户_资产账户负债明细表][{负债利息} = {负债利息}-@剩余成交金额#][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_tdsecu.tb_tdseac_asac_debtjour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_interest = debt_interest-v_remain_strike_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "tdsecuA.20.30.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;

                    /* elseif (@负债金额#+@负债利息#) > (@已归还金额#+@归还利息金额#+@剩余成交金额#) then */
                    elseif (v_debt_amt+v_debt_interest) > (v_debt_return_amt+v_return_interest_amt+v_remain_strike_amt) then

                        /* [更新表记录][交易证券_账户_资产账户负债明细表][{负债利息} = {归还利息金额}][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_tdsecu.tb_tdseac_asac_debtjour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_interest = return_interest_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "tdsecuA.20.30.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;


                        /* set @剩余成交金额# = @剩余成交金额# - (@负债利息#-@归还利息金额#); */
                        set v_remain_strike_amt = v_remain_strike_amt - (v_debt_interest-v_return_interest_amt);

                        /* [更新表记录][交易证券_账户_资产账户负债明细表][{负债金额} = {负债金额} -@剩余成交金额#][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_tdsecu.tb_tdseac_asac_debtjour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_amt = debt_amt -v_remain_strike_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "tdsecuA.20.30.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;

                    /* elseif (@负债金额#+@负债利息#) = (@已归还金额#+@归还利息金额#+@剩余成交金额#) then */
                    elseif (v_debt_amt+v_debt_interest) = (v_debt_return_amt+v_return_interest_amt+v_remain_strike_amt) then

                        /* [更新表记录][交易证券_账户_资产账户负债明细表][{负债利息} = {归还利息金额}][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_tdsecu.tb_tdseac_asac_debtjour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_interest = return_interest_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "tdsecuA.20.30.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;


                        /* set @剩余成交金额# = @剩余成交金额# - (@负债利息#-@归还利息金额#); */
                        set v_remain_strike_amt = v_remain_strike_amt - (v_debt_interest-v_return_interest_amt);

                        /* [更新表记录][交易证券_账户_资产账户负债明细表][{负债金额} = {负债金额} -@剩余成交金额#,{负债状态} = 《负债状态-已归还》][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_tdsecu.tb_tdseac_asac_debtjour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_amt = debt_amt -v_remain_strike_amt,debt_status = 2 where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "tdsecuA.20.30.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;
                   else

                        /* [更新表记录][交易证券_账户_资产账户负债明细表][{负债金额} = {已归还金额},{负债利息} ={归还利息金额},{负债状态} = 《负债状态-已归还》][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_tdsecu.tb_tdseac_asac_debtjour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_amt = debt_return_amt,debt_interest =return_interest_amt,debt_status = 2 where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "tdsecuA.20.30.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;


                        /* set @剩余成交金额# = @剩余成交金额# - (@负债利息#-@归还利息金额#) - (@负债金额# - @已归还金额#); */
                        set v_remain_strike_amt = v_remain_strike_amt - (v_debt_interest-v_return_interest_amt) - (v_debt_amt - v_debt_return_amt);
                    end if;

                /* elseif @负债类型# = 《负债类型-融券》 then */
                elseif v_debt_type = 2 then

                    /* if @负债数量# > (@已归还数量# + @剩余成交数量#) then */
                    if v_debt_qty > (v_debt_return_qty + v_remain_strike_qty) then

                        /* set @变动利息金额# = round((@负债利息#-@归还利息金额#)*@剩余成交数量#/(@负债数量#-@已归还数量#),4); */
                        set v_occur_intrst_amt = round((v_debt_interest-v_return_interest_amt)*v_remain_strike_qty/(v_debt_qty-v_debt_return_qty),4);

                        /* [更新表记录][交易证券_账户_资产账户负债明细表][{负债数量} = {负债数量}-@剩余成交数量#,{已归还金额} =round({已归还数量}/{负债数量}*{负债金额},4),{归还利息金额}={归还利息金额}+@变动利息金额#][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_tdsecu.tb_tdseac_asac_debtjour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_qty = debt_qty-v_remain_strike_qty,debt_return_amt =round(debt_return_qty/debt_qty*debt_amt,4),return_interest_amt=return_interest_amt+v_occur_intrst_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "tdsecuA.20.30.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;

                   /* elseif @负债数量# = (@已归还数量# +@剩余成交数量#) then */
                   elseif v_debt_qty = (v_debt_return_qty +v_remain_strike_qty) then

                        /* [更新表记录][交易证券_账户_资产账户负债明细表][{负债数量} = {已归还数量},{已归还金额} ={负债金额},{归还利息金额}={负债利息},{负债状态} = 《负债状态-已归还》][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_tdsecu.tb_tdseac_asac_debtjour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_qty = debt_return_qty,debt_return_amt =debt_amt,return_interest_amt=debt_interest,debt_status = 2 where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "tdsecuA.20.30.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;
                   else

                        /* [更新表记录][交易证券_账户_资产账户负债明细表][{负债数量} = {已归还数量},{已归还金额} ={负债金额},{归还利息金额}={负债利息},{负债状态} = 《负债状态-已归还》 ][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_tdsecu.tb_tdseac_asac_debtjour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_qty = debt_return_qty,debt_return_amt =debt_amt,return_interest_amt=debt_interest,debt_status = 2  where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "tdsecuA.20.30.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;


                        /* set @剩余成交数量# = @剩余成交数量#-(@负债数量#-@已归还数量#); */
                        set v_remain_strike_qty = v_remain_strike_qty-(v_debt_qty-v_debt_return_qty);
                   end if;
                end if;
            else

                /* set @错误编码#="0"; */
                set v_error_code="0";

                /* set @错误信息#=' '; */
                set v_error_info=' ';
                leave loop_label;
            end if;
        end loop;
    else

        /* set @负债状态# = 《负债状态-未归还》; */
        set v_debt_status = 1;

        /* [插入表记录][交易证券_账户_资产账户负债明细表][字段][字段变量][1][@初始化日期#, @订单编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdseac_asac_debtjour(
            create_date, create_time, update_date, 
            update_time, update_times, init_date, opor_no, 
            co_no, pd_no, asset_acco_no, exch_no, 
            stock_acco_no, stock_code, stock_code_no, stock_type, 
            asset_type, debt_type, strike_qty, strike_amt, 
            strike_fee, debt_order_no, report_no, order_date, 
            order_time, order_dir, order_price, order_qty, 
            debt_amt, debt_qty, debt_fee, debt_interest, 
            intrst_base_amt, debt_return_amt, debt_return_qty, return_interest_amt, 
            debt_status, remark_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_opor_no, 
            v_co_no, v_pd_no, v_asset_acco_no, v_exch_no, 
            v_stock_acco_no, v_stock_code, v_stock_code_no, v_stock_type, 
            v_asset_type, v_debt_type, v_strike_qty, v_strike_amt, 
            v_strike_fee, v_debt_order_no, v_report_no, v_order_date, 
            v_order_time, v_order_dir, v_order_price, v_order_qty, 
            v_debt_amt, v_debt_qty, v_debt_fee, v_debt_interest, 
            v_intrst_base_amt, v_debt_return_amt, v_debt_return_qty, v_return_interest_amt, 
            v_debt_status, v_remark_info);
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.20.30.1";
            SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,","," 订单编号=", v_order_no),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


