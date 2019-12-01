DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_接口_处理清算成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutdif_DealClearStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutdif_DealClearStrikeRsp(
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
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
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
    OUT p_contrc_dir int,
    OUT p_hedge_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_rece_margin decimal(18,4),
    OUT p_comb_code varchar(6),
    OUT p_margin_ratio decimal(18,12)
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
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
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_margin_ratio decimal(18,12);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_rsp_info varchar(255);
    declare v_deal_status varchar(2);
    declare v_sett_flag int;
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_row_id bigint;
    declare v_oper_func_code varchar(16);
    declare v_crncy_type varchar(3);
    declare v_asset_type int;
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_order_batch_no int;
    declare v_order_status varchar(2);
    declare v_trade_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_compli_trig_id bigint;
    declare v_order_oper_way varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
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
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_all_fee = 0;
    SET v_rece_margin = 0;
    SET v_comb_code = " ";
    SET v_margin_ratio = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_futu_acco = " ";
    SET v_contrc_code = " ";
    SET v_rsp_info = " ";
    SET v_deal_status = "0";
    SET v_sett_flag = 0;
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_amt = 0;
    SET v_tmp_row_id = 0;
    SET v_oper_func_code = " ";
    SET v_crncy_type = "CNY";
    SET v_asset_type = 0;
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_order_batch_no = 0;
    SET v_order_status = "0";
    SET v_trade_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_strike_all_fee = 0;
    SET v_trade_occur_amt = 0;
    SET v_compli_trig_id = 0;
    SET v_order_oper_way = " ";

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;
    #不再考虑交易系统比清算系统提前归历史的问题，需清算的数据全在当前表

    /* [不报错锁定获取表记录变量][交易期货_报盘_成交回报表][字段][字段变量][{记录序号} = @查询序号# and {成交日期} <= @初始化日期# and {清算结算标志} <>《清算结算标志-已处理》 ] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, contrc_dir, 
        hedge_type, strike_price, strike_qty, strike_amt, 
        rsp_info, deal_status, sett_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_pass_no, v_out_acco, v_exch_no, v_futu_acco, 
        v_contrc_code, v_report_date, v_report_no, v_strike_date, 
        v_strike_time, v_strike_no, v_order_dir, v_contrc_dir, 
        v_hedge_type, v_strike_price, v_strike_qty, v_strike_amt, 
        v_rsp_info, v_deal_status, v_sett_flag from db_tdfutu.tb_tdfurp_executionrsp where row_id = v_qry_no and strike_date <= v_init_date and sett_flag <>1  limit 1 for update;

    #[不报错锁定获取表记录变量][交易期货_报盘_成交回报表][字段][字段变量][{记录序号} > @查询序号# and {成交日期} <= @初始化日期# and {清算结算标志} <>《清算结算标志-已处理》 order by {记录序号}]

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

    /* [更新表记录][交易期货_报盘_成交回报表][{清算结算标志}=《清算结算标志-已处理》][{记录序号} = @记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfurp_executionrsp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_flag=1 where row_id = v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.6.1.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][交易期货_交易_订单表][字段][字段变量][{通道编号} = @通道编号# and {外部账号} = @外部账号# and {市场编号} = @市场编号# and {申报日期} = @申报日期# and {申报编号} = @申报编号#][4][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, asset_type, 
        contrc_type, contrc_unit, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_batch_no, order_date, order_time, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_qty, 
        strike_price, strike_amt, trade_fee, trade_commis, 
        other_commis, strike_commis, strike_other_commis, report_fee, 
        wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
        comb_code, margin_ratio, rsp_info, compli_trig_id, 
        sett_flag, order_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_no, v_futu_acco_no, 
        v_futu_acco, v_contrc_code_no, v_contrc_code, v_asset_type, 
        v_contrc_type, v_contrc_unit, v_external_no, v_comm_id, 
        v_comm_batch_no, v_comm_opor, v_report_date, v_report_time, 
        v_report_no, v_order_batch_no, v_order_date, v_order_time, 
        v_order_dir, v_contrc_dir, v_hedge_type, v_order_price, 
        v_order_qty, v_order_status, v_wtdraw_qty, v_strike_qty, 
        v_strike_price, v_strike_amt, v_trade_fee, v_trade_commis, 
        v_other_commis, v_strike_commis, v_strike_other_commis, v_report_fee, 
        v_wtdraw_fee, v_strike_all_fee, v_rece_margin, v_trade_occur_amt, 
        v_comb_code, v_margin_ratio, v_rsp_info, v_compli_trig_id, 
        v_sett_flag, v_order_oper_way from db_tdfutu.tb_tdfutd_order where pass_no = v_pass_no and out_acco = v_out_acco and exch_no = v_exch_no and report_date = v_report_date and report_no = v_report_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.6.1.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no);
        end if;
        leave label_pro;
    end if;


    /* set @订单编号# = @记录序号#; */
    set v_order_no = v_row_id;

    /* set @记录序号# = @临时_记录序号#; */
    set v_row_id = v_tmp_row_id;

    /* set @成交数量# = @临时_成交数量#; */
    set v_strike_qty = v_tmp_strike_qty;

    /* set @成交金额# = @临时_成交金额#; */
    set v_strike_amt = v_tmp_strike_amt;
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
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
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
    SET p_contrc_dir = v_contrc_dir;
    SET p_hedge_type = v_hedge_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_all_fee = v_all_fee;
    SET p_rece_margin = v_rece_margin;
    SET p_comb_code = v_comb_code;
    SET p_margin_ratio = v_margin_ratio;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_接口_设置单记录成交回报记录处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutdif_UpdateOneStrikeClearFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutdif_UpdateOneStrikeClearFlag(
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
    

    /* [更新表记录][交易期货_报盘_成交回报表][{清算结算标志}=@处理标志#][{记录序号} = @记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfurp_executionrsp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_flag=v_deal_flag where row_id = v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.6.2.2";
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
use db_tdfutu;;

# 原子_交易期货_接口_设置全部成交回报记录处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutdif_UpdateAllStrikeClearFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutdif_UpdateAllStrikeClearFlag(
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
    

    /* [更新表记录][交易期货_报盘_成交回报表][{清算结算标志}=@处理标志#][{成交日期} >= @初始化日期#][2][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfurp_executionrsp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_flag=v_deal_flag where strike_date >= v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.6.3.2";
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
use db_tdfutu;;

# 原子_交易期货_接口_获取成交回报统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutdif_GetStrikeTotal;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutdif_GetStrikeTotal(
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

    /* [获取表记录数量][交易期货_报盘_成交回报表][@成交记录数#][{成交日期} = @初始化日期# and (@市场编号# = 0 or {市场编号} = @市场编号#)] */
    select count(1) into v_strike_count from db_tdfutu.tb_tdfurp_executionrsp where strike_date = v_init_date and (v_exch_no = 0 or exch_no = v_exch_no);


    /* if @成交记录数# > 0 then */
    if v_strike_count > 0 then

      /* [获取表记录数量][交易期货_报盘_成交回报表][@成功记录数#][{成交日期} = @初始化日期# and (@市场编号# = 0 or {市场编号} = @市场编号#) and {处理状态} = 《处理状态-成功》] */
      select count(1) into v_succ_count from db_tdfutu.tb_tdfurp_executionrsp where strike_date = v_init_date and (v_exch_no = 0 or exch_no = v_exch_no) and deal_status = "1";


      /* [获取表记录数量][交易期货_报盘_成交回报表][@失败记录数#][{成交日期} = @初始化日期# and (@市场编号# = 0 or {市场编号} = @市场编号#) and {处理状态} <> 《处理状态-成功》] */
      select count(1) into v_fail_count from db_tdfutu.tb_tdfurp_executionrsp where strike_date = v_init_date and (v_exch_no = 0 or exch_no = v_exch_no) and deal_status <> "1";

    else

      /* [获取历史表记录数量][交易期货_报盘_成交回报表][@成功记录数#][{成交日期} = @初始化日期# and (@市场编号# = 0 or {市场编号} = @市场编号#) and {处理状态} =《处理状态-成功》] */
      select count(1) into v_succ_count from db_tdfutu_his.tb_tdfurp_executionrsp_his where strike_date = v_init_date and (v_exch_no = 0 or exch_no = v_exch_no) and deal_status ="1";


      /* [获取历史表记录数量][交易期货_报盘_成交回报表][@失败记录数#][{成交日期} = @初始化日期# and (@市场编号# = 0 or {市场编号} = @市场编号#) and {处理状态} <> 《处理状态-成功》] */
      select count(1) into v_fail_count from db_tdfutu_his.tb_tdfurp_executionrsp_his where strike_date = v_init_date and (v_exch_no = 0 or exch_no = v_exch_no) and deal_status <> "1";


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
use db_tdfutu;;

# 原子_交易期货_接口_处理清算订单记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutdif_DealClearOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutdif_DealClearOrder(
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
    OUT p_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_futu_acco varchar(16),
    OUT p_contrc_code_no int,
    OUT p_contrc_code varchar(6),
    OUT p_asset_type int,
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_external_no bigint,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_opor int,
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_batch_no int,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_dir int,
    OUT p_contrc_dir int,
    OUT p_hedge_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_amt decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_rece_margin decimal(18,4),
    OUT p_comb_code varchar(6),
    OUT p_margin_ratio decimal(18,12),
    OUT p_rsp_info varchar(255),
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
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_asset_type int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_batch_no int;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_margin_ratio decimal(18,12);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_trade_fee decimal(18,4);
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_sett_flag int;
    declare v_order_oper_way varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_futu_acco = " ";
    SET v_contrc_code_no = 0;
    SET v_contrc_code = " ";
    SET v_asset_type = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_batch_no = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_strike_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_amt = 0;
    SET v_all_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_rece_margin = 0;
    SET v_comb_code = " ";
    SET v_margin_ratio = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_trade_fee = 0;
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_strike_all_fee = 0;
    SET v_trade_occur_amt = 0;
    SET v_sett_flag = 0;
    SET v_order_oper_way = " ";

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;
    #不再考虑交易系统比清算系统提前归历史的问题，需清算的数据全在当前表

    /* [锁定获取表记录变量][交易期货_交易_订单表][字段][字段变量][{记录序号} > @查询序号# and {订单日期} >= @初始化日期# and {清算结算标志}=《清算结算标志-未处理》 order by {记录序号}][4][@初始化日期#,@查询序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, asset_type, 
        contrc_type, contrc_unit, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_batch_no, order_date, order_time, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_qty, 
        strike_price, strike_amt, trade_fee, trade_commis, 
        other_commis, strike_commis, strike_other_commis, report_fee, 
        wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
        comb_code, margin_ratio, rsp_info, compli_trig_id, 
        sett_flag, order_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_no, v_futu_acco_no, 
        v_futu_acco, v_contrc_code_no, v_contrc_code, v_asset_type, 
        v_contrc_type, v_contrc_unit, v_external_no, v_comm_id, 
        v_comm_batch_no, v_comm_opor, v_report_date, v_report_time, 
        v_report_no, v_order_batch_no, v_order_date, v_order_time, 
        v_order_dir, v_contrc_dir, v_hedge_type, v_order_price, 
        v_order_qty, v_order_status, v_wtdraw_qty, v_strike_qty, 
        v_strike_price, v_strike_amt, v_trade_fee, v_trade_commis, 
        v_other_commis, v_strike_commis, v_strike_other_commis, v_report_fee, 
        v_wtdraw_fee, v_strike_all_fee, v_rece_margin, v_trade_occur_amt, 
        v_comb_code, v_margin_ratio, v_rsp_info, v_compli_trig_id, 
        v_sett_flag, v_order_oper_way from db_tdfutu.tb_tdfutd_order where row_id > v_qry_no and order_date >= v_init_date and sett_flag=2 order by row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.6.11.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","查询序号=",v_qry_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","查询序号=",v_qry_no);
        end if;
        leave label_pro;
    end if;


    /* set @记录个数# = 1; */
    set v_record_count = 1;
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
    SET p_crncy_type = v_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_futu_acco = v_futu_acco;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_code = v_contrc_code;
    SET p_asset_type = v_asset_type;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_external_no = v_external_no;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_opor = v_comm_opor;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_dir = v_order_dir;
    SET p_contrc_dir = v_contrc_dir;
    SET p_hedge_type = v_hedge_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_status = v_order_status;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_price = v_strike_price;
    SET p_strike_amt = v_strike_amt;
    SET p_all_fee = v_all_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_rece_margin = v_rece_margin;
    SET p_comb_code = v_comb_code;
    SET p_margin_ratio = v_margin_ratio;
    SET p_rsp_info = v_rsp_info;
    SET p_compli_trig_id = v_compli_trig_id;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_接口_设置订单记录处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutdif_UpdateOneOrderClearFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutdif_UpdateOneOrderClearFlag(
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
    

    /* [更新表记录][交易期货_交易_订单表][{清算结算标志}=@处理标志#][{记录序号} = @记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfutd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_flag=v_deal_flag where row_id = v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.6.22.2";
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
use db_tdfutu;;

# 原子_交易期货_接口_获取清算转入成交统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutdif_GetSwitchStrikeTotal;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutdif_GetSwitchStrikeTotal(
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

    /* [获取表记录数量][交易期货_报盘_成交回报表][@待转入成交数#][{成交日期} <= @初始化日期# and {清算结算标志} <>《清算结算标志-已处理》 ] */
    select count(1) into v_pre_switch_strike_qty from db_tdfutu.tb_tdfurp_executionrsp where strike_date <= v_init_date and sett_flag <>1 ;


    /* [获取表记录数量][交易期货_报盘_成交回报表][@已转入成交数#][{成交日期} <= @初始化日期# and {清算结算标志}=《清算结算标志-已处理》] */
    select count(1) into v_alr_switch_strike_qty from db_tdfutu.tb_tdfurp_executionrsp where strike_date <= v_init_date and sett_flag=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pre_switch_strike_qty = v_pre_switch_strike_qty;
    SET p_alr_switch_strike_qty = v_alr_switch_strike_qty;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_接口_查询成交回报记录序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutdif_QueryStrikeRspId;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutdif_QueryStrikeRspId(
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
    

    /* [获取表记录][交易期货_报盘_成交回报表][字段][{记录序号}>@查询序号#  and {清算结算标志} <>《清算结算标志-已处理》 order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, contrc_dir, 
        hedge_type, strike_price, strike_qty, strike_amt, 
        rsp_info, deal_status, sett_flag from db_tdfutu.tb_tdfurp_executionrsp where row_id>v_qry_no  and sett_flag <>1 order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, contrc_dir, 
        hedge_type, strike_price, strike_qty, strike_amt, 
        rsp_info, deal_status, sett_flag from db_tdfutu.tb_tdfurp_executionrsp where row_id>v_qry_no  and sett_flag <>1 order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_接口_自动处理清算成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutdif_AutoDealClearStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutdif_AutoDealClearStrikeRsp(
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
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
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
    OUT p_contrc_dir int,
    OUT p_hedge_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_rece_margin decimal(18,4),
    OUT p_comb_code varchar(6),
    OUT p_margin_ratio decimal(18,12)
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
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
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_margin_ratio decimal(18,12);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_rsp_info varchar(255);
    declare v_deal_status varchar(2);
    declare v_sett_flag int;
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_row_id bigint;
    declare v_oper_func_code varchar(16);
    declare v_crncy_type varchar(3);
    declare v_asset_type int;
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_order_batch_no int;
    declare v_order_status varchar(2);
    declare v_trade_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_compli_trig_id bigint;
    declare v_order_oper_way varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
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
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_all_fee = 0;
    SET v_rece_margin = 0;
    SET v_comb_code = " ";
    SET v_margin_ratio = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_futu_acco = " ";
    SET v_contrc_code = " ";
    SET v_rsp_info = " ";
    SET v_deal_status = "0";
    SET v_sett_flag = 0;
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_amt = 0;
    SET v_tmp_row_id = 0;
    SET v_oper_func_code = " ";
    SET v_crncy_type = "CNY";
    SET v_asset_type = 0;
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_order_batch_no = 0;
    SET v_order_status = "0";
    SET v_trade_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_strike_all_fee = 0;
    SET v_trade_occur_amt = 0;
    SET v_compli_trig_id = 0;
    SET v_order_oper_way = " ";

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;
    #不再考虑交易系统比清算系统提前归历史的问题，需清算的数据全在当前表
    #[不报错锁定获取表记录变量][交易期货_报盘_成交回报表][字段][字段变量][{记录序号} = @查询序号# and {成交日期} <= @初始化日期# and {清算结算标志} <>《清算结算标志-已处理》 ]

    /* [不报错锁定获取表记录变量][交易期货_报盘_成交回报表][字段][字段变量][{记录序号} > @查询序号# and {成交日期} <= @初始化日期# and {清算结算标志} <>《清算结算标志-已处理》 order by {记录序号}] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, contrc_dir, 
        hedge_type, strike_price, strike_qty, strike_amt, 
        rsp_info, deal_status, sett_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_pass_no, v_out_acco, v_exch_no, v_futu_acco, 
        v_contrc_code, v_report_date, v_report_no, v_strike_date, 
        v_strike_time, v_strike_no, v_order_dir, v_contrc_dir, 
        v_hedge_type, v_strike_price, v_strike_qty, v_strike_amt, 
        v_rsp_info, v_deal_status, v_sett_flag from db_tdfutu.tb_tdfurp_executionrsp where row_id > v_qry_no and strike_date <= v_init_date and sett_flag <>1 order by row_id limit 1 for update;


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

    /* [更新表记录][交易期货_报盘_成交回报表][{清算结算标志}=《清算结算标志-已处理》][{记录序号} = @记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfurp_executionrsp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_flag=1 where row_id = v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.6.25.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][交易期货_交易_订单表][字段][字段变量][{通道编号} = @通道编号# and {外部账号} = @外部账号# and {市场编号} = @市场编号# and {申报日期} = @申报日期# and {申报编号} = @申报编号#][4][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, asset_type, 
        contrc_type, contrc_unit, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_batch_no, order_date, order_time, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_qty, 
        strike_price, strike_amt, trade_fee, trade_commis, 
        other_commis, strike_commis, strike_other_commis, report_fee, 
        wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
        comb_code, margin_ratio, rsp_info, compli_trig_id, 
        sett_flag, order_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_no, v_futu_acco_no, 
        v_futu_acco, v_contrc_code_no, v_contrc_code, v_asset_type, 
        v_contrc_type, v_contrc_unit, v_external_no, v_comm_id, 
        v_comm_batch_no, v_comm_opor, v_report_date, v_report_time, 
        v_report_no, v_order_batch_no, v_order_date, v_order_time, 
        v_order_dir, v_contrc_dir, v_hedge_type, v_order_price, 
        v_order_qty, v_order_status, v_wtdraw_qty, v_strike_qty, 
        v_strike_price, v_strike_amt, v_trade_fee, v_trade_commis, 
        v_other_commis, v_strike_commis, v_strike_other_commis, v_report_fee, 
        v_wtdraw_fee, v_strike_all_fee, v_rece_margin, v_trade_occur_amt, 
        v_comb_code, v_margin_ratio, v_rsp_info, v_compli_trig_id, 
        v_sett_flag, v_order_oper_way from db_tdfutu.tb_tdfutd_order where pass_no = v_pass_no and out_acco = v_out_acco and exch_no = v_exch_no and report_date = v_report_date and report_no = v_report_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.6.25.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no);
        end if;
        leave label_pro;
    end if;


    /* set @订单编号# = @记录序号#; */
    set v_order_no = v_row_id;

    /* set @记录序号# = @临时_记录序号#; */
    set v_row_id = v_tmp_row_id;

    /* set @成交数量# = @临时_成交数量#; */
    set v_strike_qty = v_tmp_strike_qty;

    /* set @成交金额# = @临时_成交金额#; */
    set v_strike_amt = v_tmp_strike_amt;
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
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
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
    SET p_contrc_dir = v_contrc_dir;
    SET p_hedge_type = v_hedge_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_all_fee = v_all_fee;
    SET p_rece_margin = v_rece_margin;
    SET p_comb_code = v_comb_code;
    SET p_margin_ratio = v_margin_ratio;

END;;


