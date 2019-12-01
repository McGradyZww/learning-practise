DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_转入持仓记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_AddPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_AddPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_pre_settle_price decimal(16,9),
    IN p_curr_qty decimal(18,2),
    IN p_contrc_unit int,
    IN p_comb_code varchar(6),
    IN p_open_amount decimal(18,4),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_pre_settle_price decimal(16,9);
    declare v_curr_qty decimal(18,2);
    declare v_contrc_unit int;
    declare v_comb_code varchar(6);
    declare v_open_amount decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sett_flag int;
    declare v_margin_pref int;
    declare v_sett_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_posi_amt decimal(18,4);
    declare v_deliv_flag int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_open_posi_price decimal(16,9);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_open_posi_qty decimal(18,2);
    declare v_close_posi_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_curr_qty = p_curr_qty;
    SET v_contrc_unit = p_contrc_unit;
    SET v_comb_code = p_comb_code;
    SET v_open_amount = p_open_amount;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sett_flag = 0;
    SET v_margin_pref = 0;
    SET v_sett_price = 0;
    SET v_rece_margin = 0;
    SET v_posi_amt = 0;
    SET v_deliv_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_open_posi_price = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_open_posi_qty = 0;
    SET v_close_posi_qty = 0;

    
    label_pro:BEGIN
    

    /* set @清算结算标志# = 《清算结算标志-未处理》; */
    set v_sett_flag = 2;

    /* set @保证金优惠# = 0; */
    set v_margin_pref = 0;

    /* set @结算价# = 0; */
    set v_sett_price = 0;

    /* set @应收保证金# = 0; */
    set v_rece_margin = 0;

    /* set @持仓金额# = @当前数量# * @昨结算价# * @合约乘数#; */
    set v_posi_amt = v_curr_qty * v_pre_settle_price * v_contrc_unit;

    /* set @交割标志# = 0; */
    set v_deliv_flag = 0;

    /* [插入重复更新][清算期货_清算_持仓表][字段][字段变量][{当前数量} = @当前数量#, {持仓金额} = @持仓金额#, {开仓金额} = @开仓金额#][1][@资产账户编号#,@市场编号#,@合约代码编号#,@多空类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clfutu.tb_clfucl_posi (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, crncy_type, 
        exch_no, futu_acco_no, contrc_code_no, contrc_type, 
        margin_pref, comb_code, lngsht_type, hedge_type, 
        curr_qty, contrc_unit, posi_amt, pre_settle_price, 
        sett_price, rece_margin, sett_flag, deliv_flag, 
        open_amount) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_crncy_type, 
        v_exch_no, v_futu_acco_no, v_contrc_code_no, v_contrc_type, 
        v_margin_pref, v_comb_code, v_lngsht_type, v_hedge_type, 
        v_curr_qty, v_contrc_unit, v_posi_amt, v_pre_settle_price, 
        v_sett_price, v_rece_margin, v_sett_flag, v_deliv_flag, 
        v_open_amount) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty = v_curr_qty, posi_amt = v_posi_amt, open_amount = v_open_amount;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.2.1.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type);
        end if;
        leave label_pro;
    end if;


    /* set @开仓价格# = @昨结算价#; */
    set v_open_posi_price = v_pre_settle_price;

    /* set @成交日期# = @初始化日期#; */
    set v_strike_date = v_init_date;

    /* set @成交时间# = 0; */
    set v_strike_time = 0;

    /* set @成交编号# = -1 * @记录序号#; */
    set v_strike_no = -1 * v_row_id;

    /* set @开仓数量# = @当前数量#; */
    set v_open_posi_qty = v_curr_qty;

    /* set @平仓数量# = 0; */
    set v_close_posi_qty = 0;

    /* [插入重复更新][清算期货_清算_持仓明细表][字段][字段变量][{开仓数量} = @当前数量#, {开仓金额} = @开仓金额#][2][@资产账户编号#,@市场编号#,@合约代码编号#, @多空类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clfutu.tb_clfucl_posi_detail (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, strike_date, 
        strike_time, strike_no, co_no, pd_no, 
        exch_group_no, asset_acco_no, crncy_type, exch_no, 
        futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
        contrc_unit, open_posi_price, open_posi_qty, close_posi_qty, 
        open_amount) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_strike_date, 
        v_strike_time, v_strike_no, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_crncy_type, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_lngsht_type, v_hedge_type, 
        v_contrc_unit, v_open_posi_price, v_open_posi_qty, v_close_posi_qty, 
        v_open_amount) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, open_posi_qty = v_curr_qty, open_amount = v_open_amount;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.2.1.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","合约代码编号=",v_contrc_code_no,","," 多空类型=", v_lngsht_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","合约代码编号=",v_contrc_code_no,","," 多空类型=", v_lngsht_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_清算准备
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_Prepare;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_Prepare(
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
    OUT p_deal_info varchar(255)
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
    declare v_deal_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_deal_info = " ";

    
    label_pro:BEGIN
    

    /* [清空表记录][清算期货_清算_持仓表] */
    truncate table db_clfutu.tb_clfucl_posi;


    /* [清空表记录][清算期货_清算_持仓明细表] */
    truncate table db_clfutu.tb_clfucl_posi_detail;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;
    SET p_deal_info = v_deal_info;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_转入订单记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_AddOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_AddOrder(
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
    IN p_exch_rate decimal(18,12),
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_comm_id bigint,
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_no int,
    IN p_order_batch_no int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_wtdraw_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_qty decimal(18,2),
    IN p_report_fee decimal(18,4),
    IN p_wtdraw_fee decimal(18,4),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_comm_id bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_order_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_deal_flag int;
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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_comm_id = p_comm_id;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_no = p_order_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_qty = p_strike_qty;
    SET v_report_fee = p_report_fee;
    SET v_wtdraw_fee = p_wtdraw_fee;
    SET v_order_status = p_order_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_deal_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @处理标志# = 《处理标志-未处理》; */
    set v_deal_flag = 2;

    /* [插入表记录][清算期货_清算_订单表][字段][字段变量][1][@资产账户编号#,@订单日期#,@订单编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clfutu.tb_clfucl_order(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_crncy_type, exch_rate, 
        exch_no, futu_acco_no, contrc_code_no, contrc_type, 
        contrc_unit, comm_id, order_date, order_time, 
        order_no, order_batch_no, report_date, report_time, 
        report_no, order_dir, contrc_dir, hedge_type, 
        order_price, order_qty, wtdraw_qty, strike_amt, 
        strike_qty, report_fee, wtdraw_fee, order_status, 
        deal_flag) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_crncy_type, v_exch_rate, 
        v_exch_no, v_futu_acco_no, v_contrc_code_no, v_contrc_type, 
        v_contrc_unit, v_comm_id, v_order_date, v_order_time, 
        v_order_no, v_order_batch_no, v_report_date, v_report_time, 
        v_report_no, v_order_dir, v_contrc_dir, v_hedge_type, 
        v_order_price, v_order_qty, v_wtdraw_qty, v_strike_amt, 
        v_strike_qty, v_report_fee, v_wtdraw_fee, v_order_status, 
        v_deal_flag);
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.2.6.1";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","订单日期=",v_order_date,",","订单编号=",v_order_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_查询订单记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_QueryOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_QueryOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_date int,
    IN p_order_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_order_dir_str varchar(1024),
    IN p_contrc_dir_str varchar(64),
    IN p_hedge_type int,
    IN p_order_status varchar(2),
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
    declare v_order_date int;
    declare v_order_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_order_dir_str varchar(1024);
    declare v_contrc_dir_str varchar(64);
    declare v_hedge_type int;
    declare v_order_status varchar(2);
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
    SET v_order_date = p_order_date;
    SET v_order_no = p_order_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_contrc_dir_str = p_contrc_dir_str;
    SET v_hedge_type = p_hedge_type;
    SET v_order_status = p_order_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][清算期货_清算_订单表][字段][(@通道编号#=0 or {通道编号}=@通道编号#) and (@订单日期#=0 or {订单日期}=@订单日期#) and (@订单编号#=0 or {订单编号}>@订单编号#) and (@外部账号#=" " or {外部账号}=@外部账号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@交易编码编号#=0 or {交易编码编号}=@交易编码编号#) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@订单状态#=" " or {订单状态}=@订单状态#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@开平方向串#=" " or instr(@开平方向串#, concat(";",{开平方向},";"))>0) and (@套保标志#=" " or {套保标志}=@套保标志#) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, comm_id, order_date, 
        order_time, order_no, order_batch_no, report_date, 
        report_time, report_no, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, wtdraw_qty, 
        strike_amt, strike_qty, report_fee, wtdraw_fee, 
        order_status, deal_flag from db_clfutu.tb_clfucl_order where (v_pass_no=0 or pass_no=v_pass_no) and (v_order_date=0 or order_date=v_order_date) and (v_order_no=0 or order_no>v_order_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco_no=0 or futu_acco_no=v_futu_acco_no) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_order_status=" " or order_status=v_order_status) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_contrc_dir_str=" " or instr(v_contrc_dir_str, concat(";",contrc_dir,";"))>0) and (v_hedge_type=" " or hedge_type=v_hedge_type) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, comm_id, order_date, 
        order_time, order_no, order_batch_no, report_date, 
        report_time, report_no, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, wtdraw_qty, 
        strike_amt, strike_qty, report_fee, wtdraw_fee, 
        order_status, deal_flag from db_clfutu.tb_clfucl_order where (v_pass_no=0 or pass_no=v_pass_no) and (v_order_date=0 or order_date=v_order_date) and (v_order_no=0 or order_no>v_order_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco_no=0 or futu_acco_no=v_futu_acco_no) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_order_status=" " or order_status=v_order_status) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_contrc_dir_str=" " or instr(v_contrc_dir_str, concat(";",contrc_dir,";"))>0) and (v_hedge_type=" " or hedge_type=v_hedge_type) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_更新获取订单记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_UpdateGetOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_UpdateGetOrder(
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
    OUT p_row_id bigint,
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12),
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_comm_id bigint,
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_no int,
    OUT p_order_batch_no int,
    OUT p_order_dir int,
    OUT p_contrc_dir int,
    OUT p_hedge_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_order_status varchar(2)
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
    declare v_row_id bigint;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_comm_id bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_order_status varchar(2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_deal_flag int;
    declare v_query_row_id bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_comm_id = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_batch_no = 0;
    SET v_order_dir = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_order_status = "0";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_deal_flag = 0;
    SET v_query_row_id = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* [锁定获取表记录变量][清算期货_清算_订单表][字段][字段变量][{处理标志}=《处理标志-未处理》 order by {记录序号}][4][@查询记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, comm_id, order_date, 
        order_time, order_no, order_batch_no, report_date, 
        report_time, report_no, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, wtdraw_qty, 
        strike_amt, strike_qty, report_fee, wtdraw_fee, 
        order_status, deal_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_pass_no, v_out_acco, v_crncy_type, v_exch_crncy_type, 
        v_exch_rate, v_exch_no, v_futu_acco_no, v_contrc_code_no, 
        v_contrc_type, v_contrc_unit, v_comm_id, v_order_date, 
        v_order_time, v_order_no, v_order_batch_no, v_report_date, 
        v_report_time, v_report_no, v_order_dir, v_contrc_dir, 
        v_hedge_type, v_order_price, v_order_qty, v_wtdraw_qty, 
        v_strike_amt, v_strike_qty, v_report_fee, v_wtdraw_fee, 
        v_order_status, v_deal_flag from db_clfutu.tb_clfucl_order where deal_flag=2 order by row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clfutuA.2.9.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询记录序号=",v_query_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询记录序号=",v_query_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @记录个数# = 1; */
    set v_record_count = 1;

    /* [更新表记录][清算期货_清算_成交表][{处理标志}=《处理标志-已处理》][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clfutu.tb_clfucl_out_busi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_flag=1 where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.2.9.2";
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
    SET p_row_id = v_row_id;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_comm_id = v_comm_id;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_no = v_order_no;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_dir = v_order_dir;
    SET p_contrc_dir = v_contrc_dir;
    SET p_hedge_type = v_hedge_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_order_status = v_order_status;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_设置订单记录处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_UpdateOrderClearFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_UpdateOrderClearFlag(
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
    SET v_row_id = p_row_id;
    SET v_deal_flag = p_deal_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算期货_清算_订单表][{处理标志}=@处理标志#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clfutu.tb_clfucl_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_flag=v_deal_flag where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.2.11.2";
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
use db_clfutu;;

# 原子_清算期货_清算_转入成交记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_AddOutBusi;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_AddOutBusi(
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
    IN p_exch_rate decimal(18,12),
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_type int,
    IN p_contrc_unit int,
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
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_rece_margin decimal(18,4),
    IN p_report_fee decimal(18,4),
    IN p_wtdraw_fee decimal(18,4),
    IN p_deli_fee decimal(18,4),
    IN p_service_fee decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_out_report_fee decimal(18,4),
    IN p_out_cancel_fee decimal(18,4),
    IN p_out_deli_fee decimal(18,4),
    IN p_out_service_fee decimal(18,4),
    IN p_out_other_fee decimal(18,4),
    IN p_out_brkage_commis decimal(18,4),
    IN p_out_other_commis decimal(18,4),
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_clear_entry_type int,
    IN p_comb_code varchar(6),
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
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
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
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_service_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_clear_entry_type int;
    declare v_comb_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_deal_flag int;
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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
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
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_rece_margin = p_rece_margin;
    SET v_report_fee = p_report_fee;
    SET v_wtdraw_fee = p_wtdraw_fee;
    SET v_deli_fee = p_deli_fee;
    SET v_service_fee = p_service_fee;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_out_report_fee = p_out_report_fee;
    SET v_out_cancel_fee = p_out_cancel_fee;
    SET v_out_deli_fee = p_out_deli_fee;
    SET v_out_service_fee = p_out_service_fee;
    SET v_out_other_fee = p_out_other_fee;
    SET v_out_brkage_commis = p_out_brkage_commis;
    SET v_out_other_commis = p_out_other_commis;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_clear_entry_type = p_clear_entry_type;
    SET v_comb_code = p_comb_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_deal_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @清算入账类型# = 《清算入账类型-分笔入账》; */
    set v_clear_entry_type = 1;

    /* set @处理标志# = 《处理标志-未处理》; */
    set v_deal_flag = 2;

    /* set @成交金额# = @成交价格# * @成交数量# * @合约乘数#; */
    set v_strike_amt = v_strike_price * v_strike_qty * v_contrc_unit;

    /* [插入表记录][清算期货_清算_成交表][字段][字段变量][1][@通道编号#,@外部账号#,@市场编号#,@成交日期#,@成交编号#,@订单方向#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clfutu.tb_clfucl_out_busi(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_crncy_type, exch_rate, 
        exch_no, futu_acco_no, contrc_code_no, contrc_code, 
        contrc_type, contrc_unit, strike_date, strike_time, 
        strike_no, report_date, report_time, report_no, 
        order_date, order_time, order_no, order_dir, 
        contrc_dir, hedge_type, order_price, order_qty, 
        strike_price, strike_qty, strike_amt, rece_margin, 
        report_fee, wtdraw_fee, deli_fee, service_fee, 
        other_fee, trade_commis, other_commis, out_report_fee, 
        out_cancel_fee, out_deli_fee, out_service_fee, out_other_fee, 
        out_brkage_commis, out_other_commis, capit_reback_days, posi_reback_days, 
        clear_entry_type, comb_code, deal_flag) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_crncy_type, v_exch_rate, 
        v_exch_no, v_futu_acco_no, v_contrc_code_no, v_contrc_code, 
        v_contrc_type, v_contrc_unit, v_strike_date, v_strike_time, 
        v_strike_no, v_report_date, v_report_time, v_report_no, 
        v_order_date, v_order_time, v_order_no, v_order_dir, 
        v_contrc_dir, v_hedge_type, v_order_price, v_order_qty, 
        v_strike_price, v_strike_qty, v_strike_amt, v_rece_margin, 
        v_report_fee, v_wtdraw_fee, v_deli_fee, v_service_fee, 
        v_other_fee, v_trade_commis, v_other_commis, v_out_report_fee, 
        v_out_cancel_fee, v_out_deli_fee, v_out_service_fee, v_out_other_fee, 
        v_out_brkage_commis, v_out_other_commis, v_capit_reback_days, v_posi_reback_days, 
        v_clear_entry_type, v_comb_code, v_deal_flag);
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.2.21.1";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","成交日期=",v_strike_date,",","成交编号=",v_strike_no,",","订单方向=",v_order_dir),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_查询成交记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_QueryOutBusi;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_QueryOutBusi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strike_date int,
    IN p_strike_no varchar(64),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_order_dir_str varchar(1024),
    IN p_contrc_dir_str varchar(64),
    IN p_hedge_type int,
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
    declare v_strike_no varchar(64);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_order_dir_str varchar(1024);
    declare v_contrc_dir_str varchar(64);
    declare v_hedge_type int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_strike_no = p_strike_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_order_dir_str = p_order_dir_str;
    SET v_contrc_dir_str = p_contrc_dir_str;
    SET v_hedge_type = p_hedge_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录][清算期货_清算_成交表][字段][(@通道编号#=0 or {通道编号}=@通道编号#) and (@成交日期#=0 or {成交日期}=@成交日期#) and (@成交编号#=0 or {成交编号}>@成交编号#) and (@外部账号#=" " or {外部账号}=@外部账号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@交易编码编号#=" " or {交易编码编号}=@交易编码编号#) and (@合约代码编号#=" " or {合约代码编号}=@合约代码编号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@开平方向串#=" " or instr(@开平方向串#, concat(";",{开平方向},";"))>0) and (@套保标志#=" " or {套保标志}=@套保标志#) and (@记录序号#=0 or {记录序号}>@记录序号#)  order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_code, contrc_type, contrc_unit, strike_date, 
        strike_time, strike_no, report_date, report_time, 
        report_no, order_date, order_time, order_no, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, strike_price, strike_qty, strike_amt, 
        rece_margin, report_fee, wtdraw_fee, deli_fee, 
        service_fee, other_fee, trade_commis, other_commis, 
        out_report_fee, out_cancel_fee, out_deli_fee, out_service_fee, 
        out_other_fee, out_brkage_commis, out_other_commis, capit_reback_days, 
        posi_reback_days, clear_entry_type, comb_code, deal_flag from db_clfutu.tb_clfucl_out_busi where (v_pass_no=0 or pass_no=v_pass_no) and (v_strike_date=0 or strike_date=v_strike_date) and (v_strike_no=0 or strike_no>v_strike_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco_no=" " or futu_acco_no=v_futu_acco_no) and (v_contrc_code_no=" " or contrc_code_no=v_contrc_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_contrc_dir_str=" " or instr(v_contrc_dir_str, concat(";",contrc_dir,";"))>0) and (v_hedge_type=" " or hedge_type=v_hedge_type) and (v_row_id=0 or row_id>v_row_id)  order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_code, contrc_type, contrc_unit, strike_date, 
        strike_time, strike_no, report_date, report_time, 
        report_no, order_date, order_time, order_no, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, strike_price, strike_qty, strike_amt, 
        rece_margin, report_fee, wtdraw_fee, deli_fee, 
        service_fee, other_fee, trade_commis, other_commis, 
        out_report_fee, out_cancel_fee, out_deli_fee, out_service_fee, 
        out_other_fee, out_brkage_commis, out_other_commis, capit_reback_days, 
        posi_reback_days, clear_entry_type, comb_code, deal_flag from db_clfutu.tb_clfucl_out_busi where (v_pass_no=0 or pass_no=v_pass_no) and (v_strike_date=0 or strike_date=v_strike_date) and (v_strike_no=0 or strike_no>v_strike_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco_no=" " or futu_acco_no=v_futu_acco_no) and (v_contrc_code_no=" " or contrc_code_no=v_contrc_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_contrc_dir_str=" " or instr(v_contrc_dir_str, concat(";",contrc_dir,";"))>0) and (v_hedge_type=" " or hedge_type=v_hedge_type) and (v_row_id=0 or row_id>v_row_id)  order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_更新获取成交记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_UpdateGetOutBusi;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_UpdateGetOutBusi(
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
    OUT p_out_acco varchar(32),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12),
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
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_sett_price decimal(16,9),
    OUT p_pre_settle_price decimal(16,9),
    OUT p_rece_margin decimal(18,4),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_deli_fee decimal(18,4),
    OUT p_service_fee decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_out_report_fee decimal(18,4),
    OUT p_out_cancel_fee decimal(18,4),
    OUT p_out_deli_fee decimal(18,4),
    OUT p_out_service_fee decimal(18,4),
    OUT p_out_other_fee decimal(18,4),
    OUT p_out_brkage_commis decimal(18,4),
    OUT p_out_other_commis decimal(18,4),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_clear_entry_type int,
    OUT p_comb_code varchar(6),
    OUT p_deal_flag int
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
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
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
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_sett_price decimal(16,9);
    declare v_pre_settle_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_service_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_clear_entry_type int;
    declare v_comb_code varchar(6);
    declare v_deal_flag int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_contrc_code varchar(6);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_out_acco = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
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
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_sett_price = 0;
    SET v_pre_settle_price = 0;
    SET v_rece_margin = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_deli_fee = 0;
    SET v_service_fee = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_out_report_fee = 0;
    SET v_out_cancel_fee = 0;
    SET v_out_deli_fee = 0;
    SET v_out_service_fee = 0;
    SET v_out_other_fee = 0;
    SET v_out_brkage_commis = 0;
    SET v_out_other_commis = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_clear_entry_type = 0;
    SET v_comb_code = " ";
    SET v_deal_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_contrc_code = " ";

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;
    #事务做循环，不可以一条条调。

    /* [获取表记录变量语句][清算期货_清算_成交表][字段][字段变量][{记录序号} > @查询序号# and {处理标志} <>《处理标志-已处理》 order by {成交编号}] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_code, contrc_type, contrc_unit, strike_date, 
        strike_time, strike_no, report_date, report_time, 
        report_no, order_date, order_time, order_no, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, strike_price, strike_qty, strike_amt, 
        rece_margin, report_fee, wtdraw_fee, deli_fee, 
        service_fee, other_fee, trade_commis, other_commis, 
        out_report_fee, out_cancel_fee, out_deli_fee, out_service_fee, 
        out_other_fee, out_brkage_commis, out_other_commis, capit_reback_days, 
        posi_reback_days, clear_entry_type, comb_code, deal_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_pass_no, v_out_acco, v_crncy_type, v_exch_crncy_type, 
        v_exch_rate, v_exch_no, v_futu_acco_no, v_contrc_code_no, 
        v_contrc_code, v_contrc_type, v_contrc_unit, v_strike_date, 
        v_strike_time, v_strike_no, v_report_date, v_report_time, 
        v_report_no, v_order_date, v_order_time, v_order_no, 
        v_order_dir, v_contrc_dir, v_hedge_type, v_order_price, 
        v_order_qty, v_strike_price, v_strike_qty, v_strike_amt, 
        v_rece_margin, v_report_fee, v_wtdraw_fee, v_deli_fee, 
        v_service_fee, v_other_fee, v_trade_commis, v_other_commis, 
        v_out_report_fee, v_out_cancel_fee, v_out_deli_fee, v_out_service_fee, 
        v_out_other_fee, v_out_brkage_commis, v_out_other_commis, v_capit_reback_days, 
        v_posi_reback_days, v_clear_entry_type, v_comb_code, v_deal_flag from db_clfutu.tb_clfucl_out_busi where row_id > v_qry_no and deal_flag <>1 order by strike_no limit 1;


    /* [检查正常返回][FOUND_ROWS() = 0] */
    if FOUND_ROWS() = 0 then
        leave label_pro;
    end if;

    #set @记录个数# = 1;

    /* [更新表记录][清算期货_清算_成交表][{处理标志}=《处理标志-已处理》][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clfutu.tb_clfucl_out_busi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_flag=1 where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.2.25.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
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
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;
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
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_sett_price = v_sett_price;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_rece_margin = v_rece_margin;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_deli_fee = v_deli_fee;
    SET p_service_fee = v_service_fee;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_out_report_fee = v_out_report_fee;
    SET p_out_cancel_fee = v_out_cancel_fee;
    SET p_out_deli_fee = v_out_deli_fee;
    SET p_out_service_fee = v_out_service_fee;
    SET p_out_other_fee = v_out_other_fee;
    SET p_out_brkage_commis = v_out_brkage_commis;
    SET p_out_other_commis = v_out_other_commis;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_clear_entry_type = v_clear_entry_type;
    SET p_comb_code = v_comb_code;
    SET p_deal_flag = v_deal_flag;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_设置成交记录处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_UpdateBusiClearFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_UpdateBusiClearFlag(
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
    SET v_row_id = p_row_id;
    SET v_deal_flag = p_deal_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算期货_清算_成交表][{处理标志}=@处理标志#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clfutu.tb_clfucl_out_busi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_flag=v_deal_flag where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.2.26.2";
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
use db_clfutu;;

# 原子_清算期货_清算_计算平仓盈亏
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_CaclClosePandl;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_CaclClosePandl(
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
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_exch_rate decimal(18,12),
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_strike_date int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_pre_settle_price decimal(16,9),
    IN p_hedge_type int,
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_sett_close_pandl decimal(18,4),
    OUT p_posi_amt decimal(18,4)
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_strike_date int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_pre_settle_price decimal(16,9);
    declare v_hedge_type int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sett_close_pandl decimal(18,4);
    declare v_posi_amt decimal(18,4);
    declare v_tmp_order_dir int;
    declare v_tmp_strike_price decimal(16,9);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_lngsht_type int;
    declare v_sett_marked_pandl decimal(18,4);
    declare v_sett_close_pandl_today decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_init_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_open_posi_price decimal(16,9);
    declare v_open_posi_qty decimal(18,2);
    declare v_close_posi_qty decimal(18,2);
    declare v_open_amount decimal(18,4);
    declare v_avail_closed_posi_qty decimal(18,2);
    declare v_link_row_id bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_strike_date = p_strike_date;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_hedge_type = p_hedge_type;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sett_close_pandl = 0;
    SET v_posi_amt = 0;
    SET v_tmp_order_dir = 0;
    SET v_tmp_strike_price = 0;
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_amt = 0;
    SET v_lngsht_type = 0;
    SET v_sett_marked_pandl = 0;
    SET v_sett_close_pandl_today = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_open_posi_price = 0;
    SET v_open_posi_qty = 0;
    SET v_close_posi_qty = 0;
    SET v_open_amount = 0;
    SET v_avail_closed_posi_qty = 0;
    SET v_link_row_id = 0;

    
    label_pro:BEGIN
    
    #先临时保存一下本次成交的相关数据

    /* set @临时_订单方向# = @订单方向#; */
    set v_tmp_order_dir = v_order_dir;

    /* set @临时_成交价格# = @成交价格#; */
    set v_tmp_strike_price = v_strike_price;

    /* set @临时_成交数量# = @成交数量#; */
    set v_tmp_strike_qty = v_strike_qty;

    /* set @临时_成交金额# = @成交金额#; */
    set v_tmp_strike_amt = v_strike_amt;
    #平仓处理订单方向需要转换一下

    /* if @订单方向# = 《订单方向-买入》 then */
    if v_order_dir = 1 then

        /* set @订单方向# = 《订单方向-卖出》; */
        set v_order_dir = 2;

        /* set @多空类型# = 《多空类型-空头》; */
        set v_lngsht_type = 2;
    else

        /* set @多空类型# = 《多空类型-多头》; */
        set v_lngsht_type = 1;

        /* set @订单方向# = 《订单方向-买入》; */
        set v_order_dir = 1;
    end if;

    /* set @清算盯市盈亏#=0; */
    set v_sett_marked_pandl=0;

    /* set @清算平仓盈亏#=0; */
    set v_sett_close_pandl=0;

    /* set @清算平今仓盈亏#=0; */
    set v_sett_close_pandl_today=0;

    /* set @持仓金额# = 0; */
    set v_posi_amt = 0;
    #平仓通过期货平仓明细表的今仓记录来进行处理，后续在清算完成时需要对期货平仓明细表进行数据变更处理

    /* if @开平方向#=《开平方向-平今仓》 then */
    if v_contrc_dir=3 then

        /* [声明游标][清算期货_清算_持仓明细表][字段][{成交日期}=@成交日期# and {交易组编号} = @交易组编号# and {资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志# and {成交编号} > 0 and {开仓数量} - {平仓数量} > 0 order by {成交编号}][cursor_futu_close_detail1] */
        cursor_futu_close_detail1:BEGIN
        DECLARE v_cursor_done int default false;
        DECLARE cursor_futu_close_detail1 CURSOR FOR
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            strike_date, strike_time, strike_no, co_no, 
            pd_no, exch_group_no, asset_acco_no, crncy_type, 
            exch_no, futu_acco_no, contrc_code_no, lngsht_type, 
            hedge_type, contrc_unit, open_posi_price, open_posi_qty, 
            close_posi_qty, open_amount 
            from db_clfutu.tb_clfucl_posi_detail 
            where strike_date=v_strike_date and exch_group_no = v_exch_group_no and asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type and strike_no > 0 and open_posi_qty - close_posi_qty > 0 order by strike_no;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


        /* [打开游标][字段变量][cursor_futu_close_detail1][loop_futu_close_detail1] */
        open cursor_futu_close_detail1;
        loop_futu_close_detail1: LOOP
        fetch cursor_futu_close_detail1 into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_init_date, 
            v_strike_date, v_strike_time, v_strike_no, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_crncy_type, 
            v_exch_no, v_futu_acco_no, v_contrc_code_no, v_lngsht_type, 
            v_hedge_type, v_contrc_unit, v_open_posi_price, v_open_posi_qty, 
            v_close_posi_qty, v_open_amount;
            IF v_cursor_done THEN
                LEAVE loop_futu_close_detail1;
            END IF;


            /* if @临时_成交数量# >= @开仓数量# - @平仓数量# then */
            if v_tmp_strike_qty >= v_open_posi_qty - v_close_posi_qty then

                /* set @可平数量# = @开仓数量# - @平仓数量#; */
                set v_avail_closed_posi_qty = v_open_posi_qty - v_close_posi_qty;
                #被平的是多头，订单方向使用被平仓的订单方向

                /* if @多空类型# = 《多空类型-多头》 then */
                if v_lngsht_type = 1 then

                    /* set @清算平仓盈亏#=@清算平仓盈亏#+@可平数量#*@合约乘数#*(@临时_成交价格#-@开仓价格#); */
                    set v_sett_close_pandl=v_sett_close_pandl+v_avail_closed_posi_qty*v_contrc_unit*(v_tmp_strike_price-v_open_posi_price);
                else

                    /* set @清算平仓盈亏#=@清算平仓盈亏#+@可平数量#*@合约乘数#*(@开仓价格# - @临时_成交价格#); */
                    set v_sett_close_pandl=v_sett_close_pandl+v_avail_closed_posi_qty*v_contrc_unit*(v_open_posi_price - v_tmp_strike_price);
                end if;

                /* set @持仓金额# = @持仓金额# + @可平数量#*@开仓价格#*@合约乘数#; */
                set v_posi_amt = v_posi_amt + v_avail_closed_posi_qty*v_open_posi_price*v_contrc_unit;

                /* [更新表记录][清算期货_清算_持仓明细表][{平仓数量}={开仓数量}][{记录序号}=@记录序号#][2][@记录序号#] */
                set v_update_date = date_format(curdate(),'%Y%m%d');
                set v_update_time = date_format(curtime(),'%H%i%s');
                update db_clfutu.tb_clfucl_posi_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, close_posi_qty=open_posi_qty where row_id=v_row_id;
                if v_error_code = "1" then
                            
                    SET v_error_code = "clfutuA.2.36.2";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("记录序号=",v_row_id);
                    end if;
                    close cursor_futu_close_detail1;
                    leave label_pro;
                end if;


                /* set @临时_成交数量#=@临时_成交数量#-@可平数量#; */
                set v_tmp_strike_qty=v_tmp_strike_qty-v_avail_closed_posi_qty;
            else

                /* if @临时_订单方向# = 《订单方向-卖出》 then */
                if v_tmp_order_dir = 2 then

                    /* set @清算平仓盈亏#=@清算平仓盈亏#+@临时_成交数量#*@合约乘数#*(@临时_成交价格#-@开仓价格#); */
                    set v_sett_close_pandl=v_sett_close_pandl+v_tmp_strike_qty*v_contrc_unit*(v_tmp_strike_price-v_open_posi_price);
                else

                    /* set @清算平仓盈亏#=@清算平仓盈亏#+@临时_成交数量#*@合约乘数#*(@开仓价格# - @临时_成交价格#); */
                    set v_sett_close_pandl=v_sett_close_pandl+v_tmp_strike_qty*v_contrc_unit*(v_open_posi_price - v_tmp_strike_price);
                end if;

                /* set @持仓金额# = @持仓金额# + @临时_成交数量#*@开仓价格#*@合约乘数#; */
                set v_posi_amt = v_posi_amt + v_tmp_strike_qty*v_open_posi_price*v_contrc_unit;

                /* [更新表记录][清算期货_清算_持仓明细表][{平仓数量}={平仓数量} + @临时_成交数量#][{记录序号}=@记录序号#][3][@成交日期#,@资产账户编号#,@通道编号#,@外部账号#,@交易编码编号#,@合约代码编号#,@订单方向#,@套保标志#,@关联记录序号#] */
                set v_update_date = date_format(curdate(),'%Y%m%d');
                set v_update_time = date_format(curtime(),'%H%i%s');
                update db_clfutu.tb_clfucl_posi_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, close_posi_qty=close_posi_qty + v_tmp_strike_qty where row_id=v_row_id;
                if v_error_code = "1" then
                            
                    SET v_error_code = "clfutuA.2.36.3";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("成交日期=",v_strike_date,",","资产账户编号=",v_asset_acco_no,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","订单方向=",v_order_dir,",","套保标志=",v_hedge_type,",","关联记录序号=",v_link_row_id),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("成交日期=",v_strike_date,",","资产账户编号=",v_asset_acco_no,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","订单方向=",v_order_dir,",","套保标志=",v_hedge_type,",","关联记录序号=",v_link_row_id);
                    end if;
                    close cursor_futu_close_detail1;
                    leave label_pro;
                end if;


                /* set @临时_成交数量#=0; */
                set v_tmp_strike_qty=0;

                /* [退出循环][loop_futu_close_detail1] */
                LEAVE loop_futu_close_detail1;

            end if;

        /* [关闭游标][cursor_futu_close_detail1] */
            IF v_cursor_done THEN
                set v_cursor_done = false;
            END IF;
        END LOOP;
        close cursor_futu_close_detail1;
        end cursor_futu_close_detail1;


    /* elseif @市场编号# = 《市场编号-上海商品期货交易所》 then */
    elseif v_exch_no = 12 then

        /* [声明游标][清算期货_清算_持仓明细表][字段][ {交易组编号} = @交易组编号# and {资产账户编号}=@资产账户编号#  and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志# and {成交编号} < 0 and {开仓数量} - {平仓数量} > 0 order by {成交编号}][cursor_futu_close_detail2] */
        cursor_futu_close_detail2:BEGIN
        DECLARE v_cursor_done int default false;
        DECLARE cursor_futu_close_detail2 CURSOR FOR
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            strike_date, strike_time, strike_no, co_no, 
            pd_no, exch_group_no, asset_acco_no, crncy_type, 
            exch_no, futu_acco_no, contrc_code_no, lngsht_type, 
            hedge_type, contrc_unit, open_posi_price, open_posi_qty, 
            close_posi_qty, open_amount 
            from db_clfutu.tb_clfucl_posi_detail 
            where  exch_group_no = v_exch_group_no and asset_acco_no=v_asset_acco_no  and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type and strike_no < 0 and open_posi_qty - close_posi_qty > 0 order by strike_no;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


        /* [打开游标][字段变量][cursor_futu_close_detail2][loop_futu_close_detail2] */
        open cursor_futu_close_detail2;
        loop_futu_close_detail2: LOOP
        fetch cursor_futu_close_detail2 into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_init_date, 
            v_strike_date, v_strike_time, v_strike_no, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_crncy_type, 
            v_exch_no, v_futu_acco_no, v_contrc_code_no, v_lngsht_type, 
            v_hedge_type, v_contrc_unit, v_open_posi_price, v_open_posi_qty, 
            v_close_posi_qty, v_open_amount;
            IF v_cursor_done THEN
                LEAVE loop_futu_close_detail2;
            END IF;


            /* if @临时_成交数量# >= @开仓数量# - @平仓数量# then */
            if v_tmp_strike_qty >= v_open_posi_qty - v_close_posi_qty then

                /* set @可平数量# = @开仓数量# - @平仓数量#; */
                set v_avail_closed_posi_qty = v_open_posi_qty - v_close_posi_qty;
                #被平的是多头，订单方向使用被平仓的订单方向

                /* if @多空类型# = 《多空类型-多头》 then */
                if v_lngsht_type = 1 then

                    /* set @清算平仓盈亏#=@清算平仓盈亏#+@可平数量#*@合约乘数#*(@临时_成交价格#-@开仓价格#); */
                    set v_sett_close_pandl=v_sett_close_pandl+v_avail_closed_posi_qty*v_contrc_unit*(v_tmp_strike_price-v_open_posi_price);
                else

                    /* set @清算平仓盈亏#=@清算平仓盈亏#+@可平数量#*@合约乘数#*(@开仓价格# - @临时_成交价格#); */
                    set v_sett_close_pandl=v_sett_close_pandl+v_avail_closed_posi_qty*v_contrc_unit*(v_open_posi_price - v_tmp_strike_price);
                end if;

                /* set @持仓金额# = @持仓金额# + @可平数量#*@开仓价格#*@合约乘数#; */
                set v_posi_amt = v_posi_amt + v_avail_closed_posi_qty*v_open_posi_price*v_contrc_unit;

                /* [更新表记录][清算期货_清算_持仓明细表][{平仓数量}={开仓数量}][{记录序号}=@记录序号#][2][@记录序号#] */
                set v_update_date = date_format(curdate(),'%Y%m%d');
                set v_update_time = date_format(curtime(),'%H%i%s');
                update db_clfutu.tb_clfucl_posi_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, close_posi_qty=open_posi_qty where row_id=v_row_id;
                if v_error_code = "1" then
                            
                    SET v_error_code = "clfutuA.2.36.2";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("记录序号=",v_row_id);
                    end if;
                    close cursor_futu_close_detail2;
                    leave label_pro;
                end if;


                /* set @临时_成交数量#=@临时_成交数量#-@可平数量#; */
                set v_tmp_strike_qty=v_tmp_strike_qty-v_avail_closed_posi_qty;
            else

                /* if @临时_订单方向# = 《订单方向-卖出》 then */
                if v_tmp_order_dir = 2 then

                    /* set @清算平仓盈亏#=@清算平仓盈亏#+@临时_成交数量#*@合约乘数#*(@临时_成交价格#-@开仓价格#); */
                    set v_sett_close_pandl=v_sett_close_pandl+v_tmp_strike_qty*v_contrc_unit*(v_tmp_strike_price-v_open_posi_price);
                else

                    /* set @清算平仓盈亏#=@清算平仓盈亏#+@临时_成交数量#*@合约乘数#*(@开仓价格# - @临时_成交价格#); */
                    set v_sett_close_pandl=v_sett_close_pandl+v_tmp_strike_qty*v_contrc_unit*(v_open_posi_price - v_tmp_strike_price);
                end if;

                /* set @持仓金额# = @持仓金额# + @临时_成交数量#*@开仓价格#*@合约乘数#; */
                set v_posi_amt = v_posi_amt + v_tmp_strike_qty*v_open_posi_price*v_contrc_unit;

                /* [更新表记录][清算期货_清算_持仓明细表][{平仓数量}={平仓数量} + @临时_成交数量#][{记录序号}=@记录序号#][3][@成交日期#,@资产账户编号#,@通道编号#,@外部账号#,@交易编码编号#,@合约代码编号#,@订单方向#,@套保标志#,@关联记录序号#] */
                set v_update_date = date_format(curdate(),'%Y%m%d');
                set v_update_time = date_format(curtime(),'%H%i%s');
                update db_clfutu.tb_clfucl_posi_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, close_posi_qty=close_posi_qty + v_tmp_strike_qty where row_id=v_row_id;
                if v_error_code = "1" then
                            
                    SET v_error_code = "clfutuA.2.36.3";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("成交日期=",v_strike_date,",","资产账户编号=",v_asset_acco_no,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","订单方向=",v_order_dir,",","套保标志=",v_hedge_type,",","关联记录序号=",v_link_row_id),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("成交日期=",v_strike_date,",","资产账户编号=",v_asset_acco_no,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","订单方向=",v_order_dir,",","套保标志=",v_hedge_type,",","关联记录序号=",v_link_row_id);
                    end if;
                    close cursor_futu_close_detail2;
                    leave label_pro;
                end if;


                /* set @临时_成交数量#=0; */
                set v_tmp_strike_qty=0;

                /* [退出循环][loop_futu_close_detail2] */
                LEAVE loop_futu_close_detail2;

            end if;

        /* [关闭游标][cursor_futu_close_detail2] */
            IF v_cursor_done THEN
                set v_cursor_done = false;
            END IF;
        END LOOP;
        close cursor_futu_close_detail2;
        end cursor_futu_close_detail2;

    else

        /* [声明游标][清算期货_清算_持仓明细表][字段][{交易组编号} = @交易组编号# and {资产账户编号}=@资产账户编号#  and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志# and {开仓数量} - {平仓数量} > 0 order by {成交编号}][cursor_futu_close_detail3] */
        cursor_futu_close_detail3:BEGIN
        DECLARE v_cursor_done int default false;
        DECLARE cursor_futu_close_detail3 CURSOR FOR
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            strike_date, strike_time, strike_no, co_no, 
            pd_no, exch_group_no, asset_acco_no, crncy_type, 
            exch_no, futu_acco_no, contrc_code_no, lngsht_type, 
            hedge_type, contrc_unit, open_posi_price, open_posi_qty, 
            close_posi_qty, open_amount 
            from db_clfutu.tb_clfucl_posi_detail 
            where exch_group_no = v_exch_group_no and asset_acco_no=v_asset_acco_no  and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type and open_posi_qty - close_posi_qty > 0 order by strike_no;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


        /* [打开游标][字段变量][cursor_futu_close_detail3][loop_futu_close_detail3] */
        open cursor_futu_close_detail3;
        loop_futu_close_detail3: LOOP
        fetch cursor_futu_close_detail3 into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_init_date, 
            v_strike_date, v_strike_time, v_strike_no, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_crncy_type, 
            v_exch_no, v_futu_acco_no, v_contrc_code_no, v_lngsht_type, 
            v_hedge_type, v_contrc_unit, v_open_posi_price, v_open_posi_qty, 
            v_close_posi_qty, v_open_amount;
            IF v_cursor_done THEN
                LEAVE loop_futu_close_detail3;
            END IF;


            /* if @临时_成交数量# >= @开仓数量# - @平仓数量# then */
            if v_tmp_strike_qty >= v_open_posi_qty - v_close_posi_qty then

                /* set @可平数量# = @开仓数量# - @平仓数量#; */
                set v_avail_closed_posi_qty = v_open_posi_qty - v_close_posi_qty;
                #被平的是多头，订单方向使用被平仓的订单方向

                /* if @多空类型# = 《多空类型-多头》 then */
                if v_lngsht_type = 1 then

                    /* set @清算平仓盈亏#=@清算平仓盈亏#+@可平数量#*@合约乘数#*(@临时_成交价格#-@开仓价格#); */
                    set v_sett_close_pandl=v_sett_close_pandl+v_avail_closed_posi_qty*v_contrc_unit*(v_tmp_strike_price-v_open_posi_price);
                else

                    /* set @清算平仓盈亏#=@清算平仓盈亏#+@可平数量#*@合约乘数#*(@开仓价格# - @临时_成交价格#); */
                    set v_sett_close_pandl=v_sett_close_pandl+v_avail_closed_posi_qty*v_contrc_unit*(v_open_posi_price - v_tmp_strike_price);
                end if;

                /* set @持仓金额# = @持仓金额# + @可平数量#*@开仓价格#*@合约乘数#; */
                set v_posi_amt = v_posi_amt + v_avail_closed_posi_qty*v_open_posi_price*v_contrc_unit;

                /* [更新表记录][清算期货_清算_持仓明细表][{平仓数量}={开仓数量}][{记录序号}=@记录序号#][2][@记录序号#] */
                set v_update_date = date_format(curdate(),'%Y%m%d');
                set v_update_time = date_format(curtime(),'%H%i%s');
                update db_clfutu.tb_clfucl_posi_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, close_posi_qty=open_posi_qty where row_id=v_row_id;
                if v_error_code = "1" then
                            
                    SET v_error_code = "clfutuA.2.36.2";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("记录序号=",v_row_id);
                    end if;
                    close cursor_futu_close_detail3;
                    leave label_pro;
                end if;


                /* set @临时_成交数量#=@临时_成交数量#-@可平数量#; */
                set v_tmp_strike_qty=v_tmp_strike_qty-v_avail_closed_posi_qty;
            else

                /* if @临时_订单方向# = 《订单方向-卖出》 then */
                if v_tmp_order_dir = 2 then

                    /* set @清算平仓盈亏#=@清算平仓盈亏#+@临时_成交数量#*@合约乘数#*(@临时_成交价格#-@开仓价格#); */
                    set v_sett_close_pandl=v_sett_close_pandl+v_tmp_strike_qty*v_contrc_unit*(v_tmp_strike_price-v_open_posi_price);
                else

                    /* set @清算平仓盈亏#=@清算平仓盈亏#+@临时_成交数量#*@合约乘数#*(@开仓价格# - @临时_成交价格#); */
                    set v_sett_close_pandl=v_sett_close_pandl+v_tmp_strike_qty*v_contrc_unit*(v_open_posi_price - v_tmp_strike_price);
                end if;

                /* set @持仓金额# = @持仓金额# + @临时_成交数量#*@开仓价格#*@合约乘数#; */
                set v_posi_amt = v_posi_amt + v_tmp_strike_qty*v_open_posi_price*v_contrc_unit;

                /* [更新表记录][清算期货_清算_持仓明细表][{平仓数量}={平仓数量} + @临时_成交数量#][{记录序号}=@记录序号#][3][@成交日期#,@资产账户编号#,@通道编号#,@外部账号#,@交易编码编号#,@合约代码编号#,@订单方向#,@套保标志#,@关联记录序号#] */
                set v_update_date = date_format(curdate(),'%Y%m%d');
                set v_update_time = date_format(curtime(),'%H%i%s');
                update db_clfutu.tb_clfucl_posi_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, close_posi_qty=close_posi_qty + v_tmp_strike_qty where row_id=v_row_id;
                if v_error_code = "1" then
                            
                    SET v_error_code = "clfutuA.2.36.3";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("成交日期=",v_strike_date,",","资产账户编号=",v_asset_acco_no,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","订单方向=",v_order_dir,",","套保标志=",v_hedge_type,",","关联记录序号=",v_link_row_id),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("成交日期=",v_strike_date,",","资产账户编号=",v_asset_acco_no,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","订单方向=",v_order_dir,",","套保标志=",v_hedge_type,",","关联记录序号=",v_link_row_id);
                    end if;
                    close cursor_futu_close_detail3;
                    leave label_pro;
                end if;


                /* set @临时_成交数量#=0; */
                set v_tmp_strike_qty=0;

                /* [退出循环][loop_futu_close_detail3] */
                LEAVE loop_futu_close_detail3;

            end if;

        /* [关闭游标][cursor_futu_close_detail3] */
            IF v_cursor_done THEN
                set v_cursor_done = false;
            END IF;
        END LOOP;
        close cursor_futu_close_detail3;
        end cursor_futu_close_detail3;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_sett_close_pandl = v_sett_close_pandl;
    SET p_posi_amt = v_posi_amt;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_清算处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_DealClear;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_DealClear(
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
    IN p_exch_rate decimal(18,12),
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
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
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_sett_price decimal(16,9),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_pre_entry_amt decimal(18,4),
    IN p_pre_entry_qty decimal(18,2),
    IN p_rece_margin decimal(18,4),
    IN p_report_fee decimal(18,4),
    IN p_wtdraw_fee decimal(18,4),
    IN p_deli_fee decimal(18,4),
    IN p_service_fee decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_out_report_fee decimal(18,4),
    IN p_out_cancel_fee decimal(18,4),
    IN p_out_deli_fee decimal(18,4),
    IN p_out_service_fee decimal(18,4),
    IN p_out_other_fee decimal(18,4),
    IN p_out_brkage_commis decimal(18,4),
    IN p_out_other_commis decimal(18,4),
    IN p_clear_entry_type int,
    IN p_split_strike_flag int,
    IN p_busi_flag int,
    IN p_comb_code varchar(6),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
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
    declare v_sett_price decimal(16,9);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_pre_entry_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_service_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_clear_entry_type int;
    declare v_split_strike_flag int;
    declare v_busi_flag int;
    declare v_comb_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_jour_no bigint;
    declare v_sett_flag int;
    declare v_lngsht_type int;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_sett_capt_margin decimal(18,4);
    declare v_pre_settle_price decimal(16,9);
    declare v_split_rece_margin decimal(18,4);
    declare v_split_strike_qty decimal(18,2);
    declare v_split_strike_amt decimal(18,4);
    declare v_split_report_fee decimal(18,4);
    declare v_split_cancel_fee decimal(18,4);
    declare v_split_deli_fee decimal(18,4);
    declare v_split_service_fee decimal(18,4);
    declare v_split_other_fee decimal(18,4);
    declare v_split_brkage_commis decimal(18,4);
    declare v_split_other_commis decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_strike_num int;
    declare v_strike_aver_price decimal(16,9);
    declare v_split_out_strike_qty decimal(18,2);
    declare v_split_out_strike_amt decimal(18,4);
    declare v_split_out_report_fee decimal(18,4);
    declare v_split_out_cancel_fee decimal(18,4);
    declare v_split_out_deli_fee decimal(18,4);
    declare v_split_out_service_fee decimal(18,4);
    declare v_split_out_other_fee decimal(18,4);
    declare v_split_out_brkage_commis decimal(18,4);
    declare v_split_out_other_commis decimal(18,4);
    declare v_out_all_fee decimal(18,4);
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_open_amount decimal(18,4);
    declare v_open_posi_price decimal(16,9);
    declare v_open_posi_qty decimal(18,2);
    declare v_close_posi_qty decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_posi_amt decimal(18,4);
    declare v_margin_pref int;
    declare v_curr_qty decimal(18,2);
    declare v_deliv_flag int;
    declare v_sett_close_pandl decimal(18,4);
    declare v_deal_flag int;
    declare v_entry_money_jour_no bigint;
    declare v_entry_posi_jour_no bigint;
    declare v_deli_jour_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
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
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_sett_price = p_sett_price;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_pre_entry_amt = p_pre_entry_amt;
    SET v_pre_entry_qty = p_pre_entry_qty;
    SET v_rece_margin = p_rece_margin;
    SET v_report_fee = p_report_fee;
    SET v_wtdraw_fee = p_wtdraw_fee;
    SET v_deli_fee = p_deli_fee;
    SET v_service_fee = p_service_fee;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_out_report_fee = p_out_report_fee;
    SET v_out_cancel_fee = p_out_cancel_fee;
    SET v_out_deli_fee = p_out_deli_fee;
    SET v_out_service_fee = p_out_service_fee;
    SET v_out_other_fee = p_out_other_fee;
    SET v_out_brkage_commis = p_out_brkage_commis;
    SET v_out_other_commis = p_out_other_commis;
    SET v_clear_entry_type = p_clear_entry_type;
    SET v_split_strike_flag = p_split_strike_flag;
    SET v_busi_flag = p_busi_flag;
    SET v_comb_code = p_comb_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_jour_no = 0;
    SET v_sett_flag = 0;
    SET v_lngsht_type = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_sett_capt_margin = 0;
    SET v_pre_settle_price = 0;
    SET v_split_rece_margin = 0;
    SET v_split_strike_qty = 0;
    SET v_split_strike_amt = 0;
    SET v_split_report_fee = 0;
    SET v_split_cancel_fee = 0;
    SET v_split_deli_fee = 0;
    SET v_split_service_fee = 0;
    SET v_split_other_fee = 0;
    SET v_split_brkage_commis = 0;
    SET v_split_other_commis = 0;
    SET v_all_fee = 0;
    SET v_strike_num = 0;
    SET v_strike_aver_price = 0;
    SET v_split_out_strike_qty = 0;
    SET v_split_out_strike_amt = 0;
    SET v_split_out_report_fee = 0;
    SET v_split_out_cancel_fee = 0;
    SET v_split_out_deli_fee = 0;
    SET v_split_out_service_fee = 0;
    SET v_split_out_other_fee = 0;
    SET v_split_out_brkage_commis = 0;
    SET v_split_out_other_commis = 0;
    SET v_out_all_fee = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_open_amount = 0;
    SET v_open_posi_price = 0;
    SET v_open_posi_qty = 0;
    SET v_close_posi_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_posi_amt = 0;
    SET v_margin_pref = 0;
    SET v_curr_qty = 0;
    SET v_deliv_flag = 0;
    SET v_sett_close_pandl = 0;
    SET v_deal_flag = 0;
    SET v_entry_money_jour_no = 0;
    SET v_entry_posi_jour_no = 0;
    SET v_deli_jour_no = 0;

    
    label_pro:BEGIN
    

    /* set @清算结算标志# = 《清算结算标志-未处理》; */
    set v_sett_flag = 2;

    /* if (@订单方向# = 《订单方向-买入》 and @开平方向# = 《开平方向-开仓》) or (@订单方向# = 《订单方向-卖出》 and (@开平方向# = 《开平方向-平仓》 or @开平方向# = 《开平方向-平今仓》)) then */
    if (v_order_dir = 1 and v_contrc_dir = 1) or (v_order_dir = 2 and (v_contrc_dir = 2 or v_contrc_dir = 3)) then

        /* set @多空类型# = 《多空类型-多头》; */
        set v_lngsht_type = 1;
    else

        /* set @多空类型# = 《多空类型-空头》; */
        set v_lngsht_type = 2;
    end if;

    /* set @入账交易组持仓流水号# =0; */
    set v_entry_exgp_posi_jour_no =0;

    /* set @入账资产账户持仓流水号# =0; */
    set v_entry_asac_posi_jour_no =0;

    /* set @多头持仓保证金# = 0; */
    set v_long_hold_margin = 0;

    /* set @空头持仓保证金# = 0; */
    set v_short_hold_margin = 0;

    /* set @清算占用保证金# = 0; */
    set v_sett_capt_margin = 0;

    /* set @昨结算价# = 0; */
    set v_pre_settle_price = 0;

    /* set @分笔累计应收保证金# = @应收保证金#; */
    set v_split_rece_margin = v_rece_margin;

    /* set @分笔累计成交数量# = @成交数量#; */
    set v_split_strike_qty = v_strike_qty;

    /* set @分笔累计成交金额# = @成交金额#; */
    set v_split_strike_amt = v_strike_amt;

    /* set @分笔累计申报费用# = @申报费用#; */
    set v_split_report_fee = v_report_fee;

    /* set @分笔累计撤单费用# = @撤单费用#; */
    set v_split_cancel_fee = v_wtdraw_fee;

    /* set @分笔累计交割费用# = @交割费用#; */
    set v_split_deli_fee = v_deli_fee;

    /* set @分笔累计手续费用# = @手续费用#; */
    set v_split_service_fee = v_service_fee;

    /* set @分笔累计其他费用# = @其他费用#; */
    set v_split_other_fee = v_other_fee;

    /* set @分笔累计交易佣金# = @交易佣金#; */
    set v_split_brkage_commis = v_trade_commis;

    /* set @分笔累计其他佣金# = @其他佣金#; */
    set v_split_other_commis = v_other_commis;

    /* set @全部费用#=@申报费用#+@撤单费用#+@交割费用#+@手续费用#+@其他费用#+@交易佣金#+@其他佣金#; */
    set v_all_fee=v_report_fee+v_wtdraw_fee+v_deli_fee+v_service_fee+v_other_fee+v_trade_commis+v_other_commis;

    /* set @成交笔数# = 1; */
    set v_strike_num = 1;

    /* set @成交均价# = @成交价格#; */
    set v_strike_aver_price = v_strike_price;

    /* set @分笔累计外部成交数量# = @成交数量#; */
    set v_split_out_strike_qty = v_strike_qty;

    /* set @分笔累计外部成交金额# = @成交金额#; */
    set v_split_out_strike_amt = v_strike_amt;

    /* set @分笔累计外部申报费用# = @外部申报费用#; */
    set v_split_out_report_fee = v_out_report_fee;

    /* set @分笔累计外部撤单费用# = @外部撤单费用#; */
    set v_split_out_cancel_fee = v_out_cancel_fee;

    /* set @分笔累计外部交割费用# = @外部交割费用#; */
    set v_split_out_deli_fee = v_out_deli_fee;

    /* set @分笔累计外部手续费用# = @外部手续费用#; */
    set v_split_out_service_fee = v_out_service_fee;

    /* set @分笔累计外部其他费用# = @外部其他费用#; */
    set v_split_out_other_fee = v_out_other_fee;

    /* set @分笔累计外部交易佣金# = @外部交易佣金#; */
    set v_split_out_brkage_commis = v_out_brkage_commis;

    /* set @分笔累计外部其他佣金# = @外部其他佣金#; */
    set v_split_out_other_commis = v_out_other_commis;

    /* set @外部全部费用#=@外部申报费用#+@外部撤单费用#+@外部交割费用#+@外部手续费用#+@外部其他费用#+@外部交易佣金#+@外部其他佣金#; */
    set v_out_all_fee=v_out_report_fee+v_out_cancel_fee+v_out_deli_fee+v_out_service_fee+v_out_other_fee+v_out_brkage_commis+v_out_other_commis;

    /* set @入账状态# = 《入账状态-未入账》; */
    set v_entry_status = "2";

    /* set @回滚状态# = 《回滚状态-未回滚》; */
    set v_undo_status = "2";
    #应收保证金在结算时需要重新计算，因此清算处理时，应收保证金不处理

    /* set @应收保证金# = 0; */
    set v_rece_margin = 0;

    /* set @分笔累计应收保证金# = @应收保证金#; */
    set v_split_rece_margin = v_rece_margin;
    #对资金处理取2位小数

    /* set @待入账金额# = round(@待入账金额#, 2); */
    set v_pre_entry_amt = round(v_pre_entry_amt, 2);

    /* set @成交金额# = round(@成交金额#, 2); */
    set v_strike_amt = round(v_strike_amt, 2);

    /* set @应收保证金# = round(@应收保证金#, 2); */
    set v_rece_margin = round(v_rece_margin, 2);

    /* set @全部费用# = round(@全部费用#, 2); */
    set v_all_fee = round(v_all_fee, 2);

    /* set @申报费用# = round(@申报费用#, 2); */
    set v_report_fee = round(v_report_fee, 2);

    /* set @撤单费用# = round(@撤单费用#, 2); */
    set v_wtdraw_fee = round(v_wtdraw_fee, 2);

    /* set @交割费用# = round(@交割费用#, 2); */
    set v_deli_fee = round(v_deli_fee, 2);

    /* set @手续费用# = round(@手续费用#, 2); */
    set v_service_fee = round(v_service_fee, 2);

    /* set @其他费用# = round(@其他费用#, 2); */
    set v_other_fee = round(v_other_fee, 2);

    /* set @交易佣金# = round(@交易佣金#, 2); */
    set v_trade_commis = round(v_trade_commis, 2);

    /* set @其他佣金# = round(@其他佣金#, 2); */
    set v_other_commis = round(v_other_commis, 2);

    /* set @外部全部费用# = round(@外部全部费用#, 2); */
    set v_out_all_fee = round(v_out_all_fee, 2);

    /* set @外部申报费用# = round(@外部申报费用#, 2); */
    set v_out_report_fee = round(v_out_report_fee, 2);

    /* set @外部撤单费用# = round(@外部撤单费用#, 2); */
    set v_out_cancel_fee = round(v_out_cancel_fee, 2);

    /* set @外部交割费用# = round(@外部交割费用#, 2); */
    set v_out_deli_fee = round(v_out_deli_fee, 2);

    /* set @外部手续费用# = round(@外部手续费用#, 2); */
    set v_out_service_fee = round(v_out_service_fee, 2);

    /* set @外部其他费用# = round(@外部其他费用#, 2); */
    set v_out_other_fee = round(v_out_other_fee, 2);

    /* set @外部交易佣金# = round(@外部交易佣金#, 2); */
    set v_out_brkage_commis = round(v_out_brkage_commis, 2);

    /* set @外部其他佣金# = round(@外部其他佣金#, 2); */
    set v_out_other_commis = round(v_out_other_commis, 2);

    /* set @开仓金额# = 0; */
    set v_open_amount = 0;

    /* if @开平方向# = 《开平方向-开仓》 then */
    if v_contrc_dir = 1 then
        #开仓,更新持仓明细表

        /* set @待入账数量# = @成交数量#; */
        set v_pre_entry_qty = v_strike_qty;

        /* set @多空类型# = @订单方向#; */
        set v_lngsht_type = v_order_dir;

        /* set @开仓价格# = @成交价格#; */
        set v_open_posi_price = v_strike_price;

        /* set @开仓数量# = @成交数量#; */
        set v_open_posi_qty = v_strike_qty;

        /* set @平仓数量# = 0; */
        set v_close_posi_qty = 0;

        /* set @开仓金额# = @成交金额#; */
        set v_open_amount = v_strike_amt;

        /* [插入表记录][清算期货_清算_持仓明细表][字段][字段变量][1]["新增持仓明细表失败"] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_clfutu.tb_clfucl_posi_detail(
            create_date, create_time, update_date, 
            update_time, update_times, init_date, strike_date, 
            strike_time, strike_no, co_no, pd_no, 
            exch_group_no, asset_acco_no, crncy_type, exch_no, 
            futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
            contrc_unit, open_posi_price, open_posi_qty, close_posi_qty, 
            open_amount) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_strike_date, 
            v_strike_time, v_strike_no, v_co_no, v_pd_no, 
            v_exch_group_no, v_asset_acco_no, v_crncy_type, v_exch_no, 
            v_futu_acco_no, v_contrc_code_no, v_lngsht_type, v_hedge_type, 
            v_contrc_unit, v_open_posi_price, v_open_posi_qty, v_close_posi_qty, 
            v_open_amount);
        if v_error_code = "1" then
                    
            SET v_error_code = "clfutuA.2.37.1";
            SET v_error_info =  CONCAT("新增持仓明细表失败","#",v_mysql_message);
            leave label_pro;
        end if;


        /* set @持仓金额# = @成交价格# * @成交数量# * @合约乘数#; */
        set v_posi_amt = v_strike_price * v_strike_qty * v_contrc_unit;

        /* set @保证金优惠# = 0; */
        set v_margin_pref = 0;

        /* set @当前数量# = @成交数量#; */
        set v_curr_qty = v_strike_qty;

        /* set @交割标志# = 0; */
        set v_deliv_flag = 0;

        /* [插入重复更新][清算期货_清算_持仓表][字段][字段变量][{当前数量} = {当前数量} + @成交数量#, {持仓金额} = {持仓金额} + @持仓金额#, {开仓金额} = {开仓金额} + @成交金额#][11]["开仓更新清算持仓表失败"] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_clfutu.tb_clfucl_posi (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, crncy_type, 
            exch_no, futu_acco_no, contrc_code_no, contrc_type, 
            margin_pref, comb_code, lngsht_type, hedge_type, 
            curr_qty, contrc_unit, posi_amt, pre_settle_price, 
            sett_price, rece_margin, sett_flag, deliv_flag, 
            open_amount) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_crncy_type, 
            v_exch_no, v_futu_acco_no, v_contrc_code_no, v_contrc_type, 
            v_margin_pref, v_comb_code, v_lngsht_type, v_hedge_type, 
            v_curr_qty, v_contrc_unit, v_posi_amt, v_pre_settle_price, 
            v_sett_price, v_rece_margin, v_sett_flag, v_deliv_flag, 
            v_open_amount) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty = curr_qty + v_strike_qty, posi_amt = posi_amt + v_posi_amt, open_amount = open_amount + v_strike_amt;
        if v_error_code = "1" then
                    
            SET v_error_code = "clfutuA.2.37.11";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("开仓更新清算持仓表失败","#",v_mysql_message);
            else
                SET v_error_info = "开仓更新清算持仓表失败";
            end if;
            leave label_pro;
        end if;

    else

        /* set @待入账数量# =  -1 * @成交数量#; */
        set v_pre_entry_qty =  -1 * v_strike_qty;

        /* set @开仓金额# =  -1 * @成交金额#; */
        set v_open_amount =  -1 * v_strike_amt;

        /* set @清算平仓盈亏# =0; */
        set v_sett_close_pandl =0;

        /* if @订单方向# = 《订单方向-买入》 then */
        if v_order_dir = 1 then

            /* set @多空类型# = 《多空类型-空头》; */
            set v_lngsht_type = 2;
        else

            /* set @多空类型# = 《多空类型-多头》; */
            set v_lngsht_type = 1;
        end if;

        /* 调用【原子_清算期货_清算_计算平仓盈亏】*/
        call db_clfutu.pra_clfucl_CaclClosePandl(
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
            v_pass_no,
            v_out_acco,
            v_crncy_type,
            v_exch_crncy_type,
            v_exch_rate,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_type,
            v_contrc_unit,
            v_strike_date,
            v_order_dir,
            v_contrc_dir,
            v_pre_settle_price,
            v_hedge_type,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_error_code,
            v_error_info,
            v_sett_close_pandl,
            v_posi_amt);
        if v_error_code = "1" then
            SET v_error_code = "clfutuA.2.37.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_计算平仓盈亏出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* [更新表记录][清算期货_清算_持仓表][{当前数量} = {当前数量} - @成交数量#,  {持仓金额} = {持仓金额} - @持仓金额#, {开仓金额} = {开仓金额} - @成交金额#][{交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][2]["平仓更新清算持仓表失败"] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_clfutu.tb_clfucl_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty = curr_qty - v_strike_qty,  posi_amt = posi_amt - v_posi_amt, open_amount = open_amount - v_strike_amt where exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type;
        if v_error_code = "1" then
                    
            SET v_error_code = "clfutuA.2.37.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("平仓更新清算持仓表失败","#",v_mysql_message);
            else
                SET v_error_info = "平仓更新清算持仓表失败";
            end if;
            leave label_pro;
        end if;


         /* set @待入账金额#=@待入账金额# + @清算平仓盈亏#; */
         set v_pre_entry_amt=v_pre_entry_amt + v_sett_close_pandl;
    end if;
    #先更新外部期货成交表
    #[更新表记录][清算期货_清算_成交表][{申报日期}=@申报日期#,{申报时间}=@申报时间#,{申报编号}=@申报编号#,{机构编号}=@机构编号#,{资产账户编号}=@资产账户编号#,{套保标志}=@套保标志#][{通道编号}=@通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {成交日期}=@成交日期# and {成交编号}=@成交编号#][1][@通道编号#,@外部账号#,@市场编号#,@成交日期#,@成交编号#]

    /* set @处理标志# = 《处理标志-未处理》; */
    set v_deal_flag = 2;

    /* set @入账资金流水号# = 0; */
    set v_entry_money_jour_no = 0;

    /* set @入账持仓流水号# = 0; */
    set v_entry_posi_jour_no = 0;

    /* set @对账流水号# = 0; */
    set v_deli_jour_no = 0;

    /* [插入表记录][清算期货_清算_待入账记录表][字段][字段变量][2][@通道编号#,@外部账号#,@市场编号#,@成交日期#,@成交编号#,@订单方向#,@开平方向#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clfutu.tb_clfucl_pre_entry(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_crncy_type, exch_rate, 
        exch_no, futu_acco_no, contrc_code_no, contrc_type, 
        contrc_unit, strike_date, strike_time, strike_no, 
        report_date, report_time, report_no, order_date, 
        order_time, order_no, order_dir, contrc_dir, 
        lngsht_type, hedge_type, order_price, order_qty, 
        pre_settle_price, sett_price, strike_price, strike_qty, 
        strike_amt, strike_num, pre_entry_qty, pre_entry_amt, 
        rece_margin, comb_code, sett_close_pandl, all_fee, 
        report_fee, wtdraw_fee, deli_fee, service_fee, 
        other_fee, trade_commis, other_commis, out_all_fee, 
        out_report_fee, out_cancel_fee, out_deli_fee, out_service_fee, 
        out_other_fee, out_brkage_commis, out_other_commis, busi_flag, 
        entry_status, undo_status, entry_money_jour_no, entry_exgp_posi_jour_no, 
        entry_asac_posi_jour_no, deli_jour_no, open_amount) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_crncy_type, v_exch_rate, 
        v_exch_no, v_futu_acco_no, v_contrc_code_no, v_contrc_type, 
        v_contrc_unit, v_strike_date, v_strike_time, v_strike_no, 
        v_report_date, v_report_time, v_report_no, v_order_date, 
        v_order_time, v_order_no, v_order_dir, v_contrc_dir, 
        v_lngsht_type, v_hedge_type, v_order_price, v_order_qty, 
        v_pre_settle_price, v_sett_price, v_strike_price, v_strike_qty, 
        v_strike_amt, v_strike_num, v_pre_entry_qty, v_pre_entry_amt, 
        v_rece_margin, v_comb_code, v_sett_close_pandl, v_all_fee, 
        v_report_fee, v_wtdraw_fee, v_deli_fee, v_service_fee, 
        v_other_fee, v_trade_commis, v_other_commis, v_out_all_fee, 
        v_out_report_fee, v_out_cancel_fee, v_out_deli_fee, v_out_service_fee, 
        v_out_other_fee, v_out_brkage_commis, v_out_other_commis, v_busi_flag, 
        v_entry_status, v_undo_status, v_entry_money_jour_no, v_entry_exgp_posi_jour_no, 
        v_entry_asac_posi_jour_no, v_deli_jour_no, v_open_amount);
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.2.37.2";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","成交日期=",v_strike_date,",","成交编号=",v_strike_no,",","订单方向=",v_order_dir,",","开平方向=",v_contrc_dir),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@入账流水号#] */
    select LAST_INSERT_ID() into v_entry_jour_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_jour_no = v_entry_jour_no;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_订单费用处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_DealOrderFare;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_DealOrderFare(
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
    IN p_exch_rate decimal(18,12),
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_no int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_pre_entry_amt decimal(18,4),
    IN p_pre_entry_qty decimal(18,2),
    IN p_report_fee decimal(18,4),
    IN p_wtdraw_fee decimal(18,4),
    IN p_busi_flag int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
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
    declare v_pre_entry_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_busi_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_jour_no bigint;
    declare v_lngsht_type int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_open_amount decimal(18,4);
    declare v_strike_num int;
    declare v_rece_margin decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_sett_capt_margin decimal(18,4);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_sett_marked_pandl decimal(18,4);
    declare v_sett_close_pandl decimal(18,4);
    declare v_sett_close_pandl_today decimal(18,4);
    declare v_entry_money_jour_no bigint;
    declare v_entry_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_deli_fee decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_service_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_out_all_fee decimal(18,4);
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_deal_flag int;
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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_no = p_order_no;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_pre_entry_amt = p_pre_entry_amt;
    SET v_pre_entry_qty = p_pre_entry_qty;
    SET v_report_fee = p_report_fee;
    SET v_wtdraw_fee = p_wtdraw_fee;
    SET v_busi_flag = p_busi_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_jour_no = 0;
    SET v_lngsht_type = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_open_amount = 0;
    SET v_strike_num = 0;
    SET v_rece_margin = 0;
    SET v_comb_code = " ";
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_sett_capt_margin = 0;
    SET v_pre_settle_price = 0;
    SET v_sett_price = 0;
    SET v_sett_marked_pandl = 0;
    SET v_sett_close_pandl = 0;
    SET v_sett_close_pandl_today = 0;
    SET v_entry_money_jour_no = 0;
    SET v_entry_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_deli_fee = 0;
    SET v_service_fee = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_out_report_fee = 0;
    SET v_out_cancel_fee = 0;
    SET v_out_deli_fee = 0;
    SET v_out_service_fee = 0;
    SET v_out_other_fee = 0;
    SET v_out_brkage_commis = 0;
    SET v_out_other_commis = 0;
    SET v_wtdraw_qty = 0;
    SET v_all_fee = 0;
    SET v_out_all_fee = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_deal_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* if (@订单方向# = 《订单方向-买入》 and @开平方向# = 《开平方向-开仓》) or (@订单方向# = 《订单方向-卖出》 and (@开平方向# = 《开平方向-平仓》 or @开平方向# = 《开平方向-平今仓》)) then */
    if (v_order_dir = 1 and v_contrc_dir = 1) or (v_order_dir = 2 and (v_contrc_dir = 2 or v_contrc_dir = 3)) then

        /* set @多空类型# = 《多空类型-多头》; */
        set v_lngsht_type = 1;
    else

        /* set @多空类型# = 《多空类型-空头》; */
        set v_lngsht_type = 2;
    end if;

    /* set @成交日期# = 0; */
    set v_strike_date = 0;

    /* set @成交时间# = 0; */
    set v_strike_time = 0;

    /* set @成交编号# = 0; */
    set v_strike_no = 0;

    /* set @成交价格# = 0; */
    set v_strike_price = 0;

    /* set @成交数量# = 0; */
    set v_strike_qty = 0;

    /* set @成交金额# = 0; */
    set v_strike_amt = 0;

    /* set @开仓金额# = 0; */
    set v_open_amount = 0;

    /* set @成交笔数# = 0; */
    set v_strike_num = 0;

    /* set @应收保证金# = 0; */
    set v_rece_margin = 0;

    /* set @组合编码# = " "; */
    set v_comb_code = " ";

    /* set @多头持仓保证金# = 0; */
    set v_long_hold_margin = 0;

    /* set @空头持仓保证金# = 0; */
    set v_short_hold_margin = 0;

    /* set @清算占用保证金# = 0; */
    set v_sett_capt_margin = 0;

    /* set @昨结算价# = 0; */
    set v_pre_settle_price = 0;

    /* set @结算价# = 0; */
    set v_sett_price = 0;

    /* set @清算盯市盈亏# = 0; */
    set v_sett_marked_pandl = 0;

    /* set @清算平仓盈亏# = 0; */
    set v_sett_close_pandl = 0;

    /* set @清算平今仓盈亏# = 0; */
    set v_sett_close_pandl_today = 0;

    /* set @入账资金流水号# = 0; */
    set v_entry_money_jour_no = 0;

    /* set @入账持仓流水号# = 0; */
    set v_entry_posi_jour_no = 0;

    /* set @对账流水号# = 0; */
    set v_deli_jour_no = 0;

    /* set @交割费用# =0; */
    set v_deli_fee =0;

    /* set @手续费用# = 0; */
    set v_service_fee = 0;

    /* set @其他费用# = 0; */
    set v_other_fee = 0;

    /* set @交易佣金# = 0; */
    set v_trade_commis = 0;

    /* set @其他佣金# = 0; */
    set v_other_commis = 0;

    /* set @外部申报费用# = @申报费用#; */
    set v_out_report_fee = v_report_fee;

    /* set @外部撤单费用# = @撤单费用#; */
    set v_out_cancel_fee = v_wtdraw_fee;

    /* set @外部交割费用# = 0; */
    set v_out_deli_fee = 0;

    /* set @外部手续费用# = 0; */
    set v_out_service_fee = 0;

    /* set @外部其他费用# = 0; */
    set v_out_other_fee = 0;

    /* set @外部交易佣金# = 0; */
    set v_out_brkage_commis = 0;

    /* set @外部其他佣金# = 0; */
    set v_out_other_commis = 0;
    #如果撤单数量为0，则没有撤单费用

    /* if @撤单数量# = 0 then */
    if v_wtdraw_qty = 0 then

        /* set @撤单费用# = 0.0; */
        set v_wtdraw_fee = 0.0;
    end if;

    /* set @全部费用# = @申报费用# + @撤单费用# + @交割费用# + @手续费用# + @其他费用# + @交易佣金# + @其他佣金#; */
    set v_all_fee = v_report_fee + v_wtdraw_fee + v_deli_fee + v_service_fee + v_other_fee + v_trade_commis + v_other_commis;

    /* set @外部全部费用# = @外部申报费用# + @外部撤单费用# + @外部交割费用# + @外部手续费用# + @外部其他费用# + @外部交易佣金# + @外部其他佣金#; */
    set v_out_all_fee = v_out_report_fee + v_out_cancel_fee + v_out_deli_fee + v_out_service_fee + v_out_other_fee + v_out_brkage_commis + v_out_other_commis;
    #对资金处理取2位小数

    /* set @待入账金额# = round(@待入账金额#, 2); */
    set v_pre_entry_amt = round(v_pre_entry_amt, 2);

    /* set @全部费用# = round(@全部费用#, 2); */
    set v_all_fee = round(v_all_fee, 2);

    /* set @申报费用# = round(@申报费用#, 2); */
    set v_report_fee = round(v_report_fee, 2);

    /* set @撤单费用# = round(@撤单费用#, 2); */
    set v_wtdraw_fee = round(v_wtdraw_fee, 2);

    /* set @交割费用# = round(@交割费用#, 2); */
    set v_deli_fee = round(v_deli_fee, 2);

    /* set @手续费用# = round(@手续费用#, 2); */
    set v_service_fee = round(v_service_fee, 2);

    /* set @其他费用# = round(@其他费用#, 2); */
    set v_other_fee = round(v_other_fee, 2);

    /* set @交易佣金# = round(@交易佣金#, 2); */
    set v_trade_commis = round(v_trade_commis, 2);

    /* set @其他佣金# = round(@其他佣金#, 2); */
    set v_other_commis = round(v_other_commis, 2);

    /* set @外部全部费用# = round(@外部全部费用#, 2); */
    set v_out_all_fee = round(v_out_all_fee, 2);

    /* set @外部申报费用# = round(@外部申报费用#, 2); */
    set v_out_report_fee = round(v_out_report_fee, 2);

    /* set @外部撤单费用# = round(@外部撤单费用#, 2); */
    set v_out_cancel_fee = round(v_out_cancel_fee, 2);

    /* set @外部交割费用# = round(@外部交割费用#, 2); */
    set v_out_deli_fee = round(v_out_deli_fee, 2);

    /* set @外部手续费用# = round(@外部手续费用#, 2); */
    set v_out_service_fee = round(v_out_service_fee, 2);

    /* set @外部其他费用# = round(@外部其他费用#, 2); */
    set v_out_other_fee = round(v_out_other_fee, 2);

    /* set @外部交易佣金# = round(@外部交易佣金#, 2); */
    set v_out_brkage_commis = round(v_out_brkage_commis, 2);

    /* set @外部其他佣金# = round(@外部其他佣金#, 2); */
    set v_out_other_commis = round(v_out_other_commis, 2);

    /* set @入账交易组持仓流水号# =0; */
    set v_entry_exgp_posi_jour_no =0;

    /* set @入账资产账户持仓流水号# =0; */
    set v_entry_asac_posi_jour_no =0;

    /* set @入账状态# = 《入账状态-未入账》; */
    set v_entry_status = "2";

    /* set @回滚状态# = 《回滚状态-未回滚》; */
    set v_undo_status = "2";

    /* set @处理标志# = 《处理标志-已处理》; */
    set v_deal_flag = 1;

    /* [插入表记录][清算期货_清算_待入账记录表][字段][字段变量][1][@通道编号#,@外部账号#,@市场编号#,@成交日期#,@成交编号#,@订单方向#,@开平方向#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clfutu.tb_clfucl_pre_entry(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_crncy_type, exch_rate, 
        exch_no, futu_acco_no, contrc_code_no, contrc_type, 
        contrc_unit, strike_date, strike_time, strike_no, 
        report_date, report_time, report_no, order_date, 
        order_time, order_no, order_dir, contrc_dir, 
        lngsht_type, hedge_type, order_price, order_qty, 
        pre_settle_price, sett_price, strike_price, strike_qty, 
        strike_amt, strike_num, pre_entry_qty, pre_entry_amt, 
        rece_margin, comb_code, sett_close_pandl, all_fee, 
        report_fee, wtdraw_fee, deli_fee, service_fee, 
        other_fee, trade_commis, other_commis, out_all_fee, 
        out_report_fee, out_cancel_fee, out_deli_fee, out_service_fee, 
        out_other_fee, out_brkage_commis, out_other_commis, busi_flag, 
        entry_status, undo_status, entry_money_jour_no, entry_exgp_posi_jour_no, 
        entry_asac_posi_jour_no, deli_jour_no, open_amount) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_crncy_type, v_exch_rate, 
        v_exch_no, v_futu_acco_no, v_contrc_code_no, v_contrc_type, 
        v_contrc_unit, v_strike_date, v_strike_time, v_strike_no, 
        v_report_date, v_report_time, v_report_no, v_order_date, 
        v_order_time, v_order_no, v_order_dir, v_contrc_dir, 
        v_lngsht_type, v_hedge_type, v_order_price, v_order_qty, 
        v_pre_settle_price, v_sett_price, v_strike_price, v_strike_qty, 
        v_strike_amt, v_strike_num, v_pre_entry_qty, v_pre_entry_amt, 
        v_rece_margin, v_comb_code, v_sett_close_pandl, v_all_fee, 
        v_report_fee, v_wtdraw_fee, v_deli_fee, v_service_fee, 
        v_other_fee, v_trade_commis, v_other_commis, v_out_all_fee, 
        v_out_report_fee, v_out_cancel_fee, v_out_deli_fee, v_out_service_fee, 
        v_out_other_fee, v_out_brkage_commis, v_out_other_commis, v_busi_flag, 
        v_entry_status, v_undo_status, v_entry_money_jour_no, v_entry_exgp_posi_jour_no, 
        v_entry_asac_posi_jour_no, v_deli_jour_no, v_open_amount);
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.2.38.1";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","成交日期=",v_strike_date,",","成交编号=",v_strike_no,",","订单方向=",v_order_dir,",","开平方向=",v_contrc_dir),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@入账流水号#] */
    select LAST_INSERT_ID() into v_entry_jour_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_jour_no = v_entry_jour_no;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_更新待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_UpdatePreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_UpdatePreEntry(
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
    IN p_entry_exgp_posi_jour_no bigint,
    IN p_entry_asac_posi_jour_no bigint,
    IN p_entry_status varchar(2),
    IN p_undo_status varchar(2),
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
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
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
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_exgp_posi_jour_no = p_entry_exgp_posi_jour_no;
    SET v_entry_asac_posi_jour_no = p_entry_asac_posi_jour_no;
    SET v_entry_status = p_entry_status;
    SET v_undo_status = p_undo_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算期货_清算_待入账记录表][{入账资金流水号}=@入账资金流水号#, {入账交易组持仓流水号}=@入账交易组持仓流水号#,{入账资产账户持仓流水号}=@入账资产账户持仓流水号#, {入账状态}=@入账状态#, {回滚状态}=@回滚状态#][ {记录序号}=@记录序号#][1][@初始化日期#,@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clfutu.tb_clfucl_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_money_jour_no=v_entry_money_jour_no, entry_exgp_posi_jour_no=v_entry_exgp_posi_jour_no,entry_asac_posi_jour_no=v_entry_asac_posi_jour_no, entry_status=v_entry_status, undo_status=v_undo_status where  row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.2.57.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_查询待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_QueryPreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_QueryPreEntry(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_entry_status = p_entry_status;
    SET v_undo_status = p_undo_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][清算期货_清算_待入账记录表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@交易编码编号#=0 or {交易编码编号}=@交易编码编号#) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@本币币种串#=" " or instr(@本币币种串#, concat(";",{本币币种},";"))>0) and (@记录序号#=0 or {记录序号}>@记录序号#) and (@入账状态# = " " or {入账状态}=@入账状态#) and (@回滚状态# = " " or {回滚状态}=@回滚状态#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, strike_date, strike_time, 
        strike_no, report_date, report_time, report_no, 
        order_date, order_time, order_no, order_dir, 
        contrc_dir, lngsht_type, hedge_type, order_price, 
        order_qty, pre_settle_price, sett_price, strike_price, 
        strike_qty, strike_amt, strike_num, pre_entry_qty, 
        pre_entry_amt, rece_margin, comb_code, sett_close_pandl, 
        all_fee, report_fee, wtdraw_fee, deli_fee, 
        service_fee, other_fee, trade_commis, other_commis, 
        out_all_fee, out_report_fee, out_cancel_fee, out_deli_fee, 
        out_service_fee, out_other_fee, out_brkage_commis, out_other_commis, 
        busi_flag, entry_status, undo_status, entry_money_jour_no, 
        entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no, open_amount from db_clfutu.tb_clfucl_pre_entry where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco_no=0 or futu_acco_no=v_futu_acco_no) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) and (v_entry_status = " " or entry_status=v_entry_status) and (v_undo_status = " " or undo_status=v_undo_status) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, strike_date, strike_time, 
        strike_no, report_date, report_time, report_no, 
        order_date, order_time, order_no, order_dir, 
        contrc_dir, lngsht_type, hedge_type, order_price, 
        order_qty, pre_settle_price, sett_price, strike_price, 
        strike_qty, strike_amt, strike_num, pre_entry_qty, 
        pre_entry_amt, rece_margin, comb_code, sett_close_pandl, 
        all_fee, report_fee, wtdraw_fee, deli_fee, 
        service_fee, other_fee, trade_commis, other_commis, 
        out_all_fee, out_report_fee, out_cancel_fee, out_deli_fee, 
        out_service_fee, out_other_fee, out_brkage_commis, out_other_commis, 
        busi_flag, entry_status, undo_status, entry_money_jour_no, 
        entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no, open_amount from db_clfutu.tb_clfucl_pre_entry where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco_no=0 or futu_acco_no=v_futu_acco_no) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) and (v_entry_status = " " or entry_status=v_entry_status) and (v_undo_status = " " or undo_status=v_undo_status) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_更新获取待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_UpdateGetPreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_UpdateGetPreEntry(
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
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12),
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
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_pre_settle_price decimal(16,9),
    OUT p_sett_price decimal(16,9),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_num int,
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_rece_margin decimal(18,4),
    OUT p_comb_code varchar(6),
    OUT p_long_hold_margin decimal(18,4),
    OUT p_short_hold_margin decimal(18,4),
    OUT p_sett_capt_margin decimal(18,4),
    OUT p_sett_close_pandl decimal(18,4),
    OUT p_sett_marked_pandl decimal(18,4),
    OUT p_sett_close_pandl_today decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_deli_fee decimal(18,4),
    OUT p_service_fee decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_out_all_fee decimal(18,4),
    OUT p_out_report_fee decimal(18,4),
    OUT p_out_cancel_fee decimal(18,4),
    OUT p_out_deli_fee decimal(18,4),
    OUT p_out_service_fee decimal(18,4),
    OUT p_out_other_fee decimal(18,4),
    OUT p_out_brkage_commis decimal(18,4),
    OUT p_out_other_commis decimal(18,4),
    OUT p_busi_flag int,
    OUT p_entry_status varchar(2),
    OUT p_undo_status varchar(2),
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_posi_jour_no bigint,
    OUT p_deli_jour_no bigint,
    OUT p_open_amount decimal(18,4)
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
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
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
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_sett_capt_margin decimal(18,4);
    declare v_sett_close_pandl decimal(18,4);
    declare v_sett_marked_pandl decimal(18,4);
    declare v_sett_close_pandl_today decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_all_fee decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_service_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_entry_money_jour_no bigint;
    declare v_entry_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_open_amount decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
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
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_pre_settle_price = 0;
    SET v_sett_price = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_num = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_rece_margin = 0;
    SET v_comb_code = " ";
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_sett_capt_margin = 0;
    SET v_sett_close_pandl = 0;
    SET v_sett_marked_pandl = 0;
    SET v_sett_close_pandl_today = 0;
    SET v_all_fee = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_deli_fee = 0;
    SET v_service_fee = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_out_all_fee = 0;
    SET v_out_report_fee = 0;
    SET v_out_cancel_fee = 0;
    SET v_out_deli_fee = 0;
    SET v_out_service_fee = 0;
    SET v_out_other_fee = 0;
    SET v_out_brkage_commis = 0;
    SET v_out_other_commis = 0;
    SET v_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_entry_money_jour_no = 0;
    SET v_entry_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_open_amount = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* [不报错锁定获取表记录变量][清算期货_清算_待入账记录表][字段][字段变量][{记录序号} = @查询序号# and {入账状态} <>《入账状态-已入账》 ][4][@初始化日期#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, strike_date, strike_time, 
        strike_no, report_date, report_time, report_no, 
        order_date, order_time, order_no, order_dir, 
        contrc_dir, lngsht_type, hedge_type, order_price, 
        order_qty, pre_settle_price, sett_price, strike_price, 
        strike_qty, strike_amt, strike_num, pre_entry_qty, 
        pre_entry_amt, rece_margin, comb_code, sett_close_pandl, 
        all_fee, report_fee, wtdraw_fee, deli_fee, 
        service_fee, other_fee, trade_commis, other_commis, 
        out_all_fee, out_report_fee, out_cancel_fee, out_deli_fee, 
        out_service_fee, out_other_fee, out_brkage_commis, out_other_commis, 
        busi_flag, entry_status, undo_status, entry_money_jour_no, 
        entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no, open_amount into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_pass_no, v_out_acco, v_crncy_type, v_exch_crncy_type, 
        v_exch_rate, v_exch_no, v_futu_acco_no, v_contrc_code_no, 
        v_contrc_type, v_contrc_unit, v_strike_date, v_strike_time, 
        v_strike_no, v_report_date, v_report_time, v_report_no, 
        v_order_date, v_order_time, v_order_no, v_order_dir, 
        v_contrc_dir, v_lngsht_type, v_hedge_type, v_order_price, 
        v_order_qty, v_pre_settle_price, v_sett_price, v_strike_price, 
        v_strike_qty, v_strike_amt, v_strike_num, v_pre_entry_qty, 
        v_pre_entry_amt, v_rece_margin, v_comb_code, v_sett_close_pandl, 
        v_all_fee, v_report_fee, v_wtdraw_fee, v_deli_fee, 
        v_service_fee, v_other_fee, v_trade_commis, v_other_commis, 
        v_out_all_fee, v_out_report_fee, v_out_cancel_fee, v_out_deli_fee, 
        v_out_service_fee, v_out_other_fee, v_out_brkage_commis, v_out_other_commis, 
        v_busi_flag, v_entry_status, v_undo_status, v_entry_money_jour_no, 
        v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, v_deli_jour_no, v_open_amount from db_clfutu.tb_clfucl_pre_entry where row_id = v_qry_no and entry_status <>"1"  limit 1 for update;

    #[不报错锁定获取表记录变量][清算期货_清算_待入账记录表][字段][字段变量][{记录序号} > @查询序号# and {入账状态} <>《入账状态-已入账》 order by {记录序号}][4][@初始化日期#]

    /* [检查正常返回][FOUND_ROWS() = 0] */
    if FOUND_ROWS() = 0 then
        leave label_pro;
    end if;

    #set @记录个数# = 1;

    /* [更新表记录][清算期货_清算_待入账记录表][{入账状态}=《入账状态-已入账》, {回滚状态}=《回滚状态-未回滚》][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clfutu.tb_clfucl_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="1", undo_status="2" where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.2.59.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
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
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;
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
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_sett_price = v_sett_price;
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_num = v_strike_num;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_rece_margin = v_rece_margin;
    SET p_comb_code = v_comb_code;
    SET p_long_hold_margin = v_long_hold_margin;
    SET p_short_hold_margin = v_short_hold_margin;
    SET p_sett_capt_margin = v_sett_capt_margin;
    SET p_sett_close_pandl = v_sett_close_pandl;
    SET p_sett_marked_pandl = v_sett_marked_pandl;
    SET p_sett_close_pandl_today = v_sett_close_pandl_today;
    SET p_all_fee = v_all_fee;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_deli_fee = v_deli_fee;
    SET p_service_fee = v_service_fee;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_out_all_fee = v_out_all_fee;
    SET p_out_report_fee = v_out_report_fee;
    SET p_out_cancel_fee = v_out_cancel_fee;
    SET p_out_deli_fee = v_out_deli_fee;
    SET p_out_service_fee = v_out_service_fee;
    SET p_out_other_fee = v_out_other_fee;
    SET p_out_brkage_commis = v_out_brkage_commis;
    SET p_out_other_commis = v_out_other_commis;
    SET p_busi_flag = v_busi_flag;
    SET p_entry_status = v_entry_status;
    SET p_undo_status = v_undo_status;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_posi_jour_no = v_entry_posi_jour_no;
    SET p_deli_jour_no = v_deli_jour_no;
    SET p_open_amount = v_open_amount;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_更新获取回滚待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_UpdateGetPreEntryUndo;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_UpdateGetPreEntryUndo(
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
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12),
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
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_pre_settle_price decimal(16,9),
    OUT p_sett_price decimal(16,9),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_num int,
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_rece_margin decimal(18,4),
    OUT p_comb_code varchar(6),
    OUT p_long_hold_margin decimal(18,4),
    OUT p_short_hold_margin decimal(18,4),
    OUT p_sett_capt_margin decimal(18,4),
    OUT p_sett_close_pandl decimal(18,4),
    OUT p_sett_marked_pandl decimal(18,4),
    OUT p_sett_close_pandl_today decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_deli_fee decimal(18,4),
    OUT p_service_fee decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_out_all_fee decimal(18,4),
    OUT p_out_report_fee decimal(18,4),
    OUT p_out_cancel_fee decimal(18,4),
    OUT p_out_deli_fee decimal(18,4),
    OUT p_out_service_fee decimal(18,4),
    OUT p_out_other_fee decimal(18,4),
    OUT p_out_brkage_commis decimal(18,4),
    OUT p_out_other_commis decimal(18,4),
    OUT p_busi_flag int,
    OUT p_entry_status varchar(2),
    OUT p_undo_status varchar(2),
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_exgp_posi_jour_no bigint,
    OUT p_entry_asac_posi_jour_no bigint,
    OUT p_deli_jour_no bigint
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
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
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
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_sett_capt_margin decimal(18,4);
    declare v_sett_close_pandl decimal(18,4);
    declare v_sett_marked_pandl decimal(18,4);
    declare v_sett_close_pandl_today decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_all_fee decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_service_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_open_amount decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
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
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_pre_settle_price = 0;
    SET v_sett_price = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_num = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_rece_margin = 0;
    SET v_comb_code = " ";
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_sett_capt_margin = 0;
    SET v_sett_close_pandl = 0;
    SET v_sett_marked_pandl = 0;
    SET v_sett_close_pandl_today = 0;
    SET v_all_fee = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_deli_fee = 0;
    SET v_service_fee = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_out_all_fee = 0;
    SET v_out_report_fee = 0;
    SET v_out_cancel_fee = 0;
    SET v_out_deli_fee = 0;
    SET v_out_service_fee = 0;
    SET v_out_other_fee = 0;
    SET v_out_brkage_commis = 0;
    SET v_out_other_commis = 0;
    SET v_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_open_amount = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* [锁定获取表记录变量][清算期货_清算_待入账记录表][字段][字段变量][{记录序号} = @查询序号#][4][@查询序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, strike_date, strike_time, 
        strike_no, report_date, report_time, report_no, 
        order_date, order_time, order_no, order_dir, 
        contrc_dir, lngsht_type, hedge_type, order_price, 
        order_qty, pre_settle_price, sett_price, strike_price, 
        strike_qty, strike_amt, strike_num, pre_entry_qty, 
        pre_entry_amt, rece_margin, comb_code, sett_close_pandl, 
        all_fee, report_fee, wtdraw_fee, deli_fee, 
        service_fee, other_fee, trade_commis, other_commis, 
        out_all_fee, out_report_fee, out_cancel_fee, out_deli_fee, 
        out_service_fee, out_other_fee, out_brkage_commis, out_other_commis, 
        busi_flag, entry_status, undo_status, entry_money_jour_no, 
        entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no, open_amount into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_pass_no, v_out_acco, v_crncy_type, v_exch_crncy_type, 
        v_exch_rate, v_exch_no, v_futu_acco_no, v_contrc_code_no, 
        v_contrc_type, v_contrc_unit, v_strike_date, v_strike_time, 
        v_strike_no, v_report_date, v_report_time, v_report_no, 
        v_order_date, v_order_time, v_order_no, v_order_dir, 
        v_contrc_dir, v_lngsht_type, v_hedge_type, v_order_price, 
        v_order_qty, v_pre_settle_price, v_sett_price, v_strike_price, 
        v_strike_qty, v_strike_amt, v_strike_num, v_pre_entry_qty, 
        v_pre_entry_amt, v_rece_margin, v_comb_code, v_sett_close_pandl, 
        v_all_fee, v_report_fee, v_wtdraw_fee, v_deli_fee, 
        v_service_fee, v_other_fee, v_trade_commis, v_other_commis, 
        v_out_all_fee, v_out_report_fee, v_out_cancel_fee, v_out_deli_fee, 
        v_out_service_fee, v_out_other_fee, v_out_brkage_commis, v_out_other_commis, 
        v_busi_flag, v_entry_status, v_undo_status, v_entry_money_jour_no, 
        v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, v_deli_jour_no, v_open_amount from db_clfutu.tb_clfucl_pre_entry where row_id = v_qry_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clfutuA.2.60.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询序号=",v_qry_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询序号=",v_qry_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@回滚状态# = 《回滚状态-已回滚》][1]["该待入账记录已回滚处理！"] */
    if v_undo_status = "1" then
        
        SET v_error_code = "clfutuA.2.60.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("该待入账记录已回滚处理！","#",v_mysql_message);
        else
            SET v_error_info = "该待入账记录已回滚处理！";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][清算期货_清算_待入账记录表][{入账状态} = 《入账状态-未入账》,  {回滚状态}=《回滚状态-已回滚》][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clfutu.tb_clfucl_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status = "2",  undo_status="1" where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.2.60.2";
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
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;
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
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_sett_price = v_sett_price;
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_num = v_strike_num;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_rece_margin = v_rece_margin;
    SET p_comb_code = v_comb_code;
    SET p_long_hold_margin = v_long_hold_margin;
    SET p_short_hold_margin = v_short_hold_margin;
    SET p_sett_capt_margin = v_sett_capt_margin;
    SET p_sett_close_pandl = v_sett_close_pandl;
    SET p_sett_marked_pandl = v_sett_marked_pandl;
    SET p_sett_close_pandl_today = v_sett_close_pandl_today;
    SET p_all_fee = v_all_fee;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_deli_fee = v_deli_fee;
    SET p_service_fee = v_service_fee;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_out_all_fee = v_out_all_fee;
    SET p_out_report_fee = v_out_report_fee;
    SET p_out_cancel_fee = v_out_cancel_fee;
    SET p_out_deli_fee = v_out_deli_fee;
    SET p_out_service_fee = v_out_service_fee;
    SET p_out_other_fee = v_out_other_fee;
    SET p_out_brkage_commis = v_out_brkage_commis;
    SET p_out_other_commis = v_out_other_commis;
    SET p_busi_flag = v_busi_flag;
    SET p_entry_status = v_entry_status;
    SET p_undo_status = v_undo_status;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_exgp_posi_jour_no = v_entry_exgp_posi_jour_no;
    SET p_entry_asac_posi_jour_no = v_entry_asac_posi_jour_no;
    SET p_deli_jour_no = v_deli_jour_no;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_入账异常处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_DealEntryError;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_DealEntryError(
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
    IN p_exch_rate decimal(18,12),
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
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
    IN p_contrc_dir int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_pre_settle_price decimal(16,9),
    IN p_sett_price decimal(16,9),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_num int,
    IN p_pre_entry_qty decimal(18,2),
    IN p_pre_entry_amt decimal(18,4),
    IN p_rece_margin decimal(18,4),
    IN p_comb_code varchar(6),
    IN p_comb_type int,
    IN p_comb_name varchar(64),
    IN p_long_hold_margin decimal(18,4),
    IN p_short_hold_margin decimal(18,4),
    IN p_sett_capt_margin decimal(18,4),
    IN p_sett_close_pandl decimal(18,4),
    IN p_sett_marked_pandl decimal(18,4),
    IN p_sett_close_pandl_today decimal(18,4),
    IN p_all_fee decimal(18,4),
    IN p_report_fee decimal(18,4),
    IN p_wtdraw_fee decimal(18,4),
    IN p_deli_fee decimal(18,4),
    IN p_service_fee decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_out_all_fee decimal(18,4),
    IN p_out_report_fee decimal(18,4),
    IN p_out_cancel_fee decimal(18,4),
    IN p_out_deli_fee decimal(18,4),
    IN p_out_service_fee decimal(18,4),
    IN p_out_other_fee decimal(18,4),
    IN p_out_brkage_commis decimal(18,4),
    IN p_out_other_commis decimal(18,4),
    IN p_busi_flag int,
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
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
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_comb_type int;
    declare v_comb_name varchar(64);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_sett_capt_margin decimal(18,4);
    declare v_sett_close_pandl decimal(18,4);
    declare v_sett_marked_pandl decimal(18,4);
    declare v_sett_close_pandl_today decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_all_fee decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_service_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_busi_flag int;
    declare v_undo_error_no int;
    declare v_remark_info varchar(255);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
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
    SET v_contrc_dir = p_contrc_dir;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_sett_price = p_sett_price;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_num = p_strike_num;
    SET v_pre_entry_qty = p_pre_entry_qty;
    SET v_pre_entry_amt = p_pre_entry_amt;
    SET v_rece_margin = p_rece_margin;
    SET v_comb_code = p_comb_code;
    SET v_comb_type = p_comb_type;
    SET v_comb_name = p_comb_name;
    SET v_long_hold_margin = p_long_hold_margin;
    SET v_short_hold_margin = p_short_hold_margin;
    SET v_sett_capt_margin = p_sett_capt_margin;
    SET v_sett_close_pandl = p_sett_close_pandl;
    SET v_sett_marked_pandl = p_sett_marked_pandl;
    SET v_sett_close_pandl_today = p_sett_close_pandl_today;
    SET v_all_fee = p_all_fee;
    SET v_report_fee = p_report_fee;
    SET v_wtdraw_fee = p_wtdraw_fee;
    SET v_deli_fee = p_deli_fee;
    SET v_service_fee = p_service_fee;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_out_all_fee = p_out_all_fee;
    SET v_out_report_fee = p_out_report_fee;
    SET v_out_cancel_fee = p_out_cancel_fee;
    SET v_out_deli_fee = p_out_deli_fee;
    SET v_out_service_fee = p_out_service_fee;
    SET v_out_other_fee = p_out_other_fee;
    SET v_out_brkage_commis = p_out_brkage_commis;
    SET v_out_other_commis = p_out_other_commis;
    SET v_busi_flag = p_busi_flag;
    SET v_undo_error_no = p_undo_error_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][清算期货_清算_入账异常表][字段][字段变量][1][@初始化日期#,@机构编号#,@产品编号#,@交易组编号#,@资产账户编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clfutu.tb_clfucl_entry_error(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_crncy_type, exch_rate, 
        exch_no, futu_acco_no, contrc_code_no, contrc_type, 
        contrc_unit, strike_date, strike_time, strike_no, 
        report_date, report_time, report_no, order_date, 
        order_time, order_no, order_dir, contrc_dir, 
        lngsht_type, hedge_type, order_price, order_qty, 
        pre_settle_price, sett_price, strike_price, strike_qty, 
        strike_amt, strike_num, pre_entry_qty, pre_entry_amt, 
        rece_margin, comb_code, comb_type, comb_name, 
        long_hold_margin, short_hold_margin, sett_capt_margin, sett_close_pandl, 
        sett_marked_pandl, sett_close_pandl_today, all_fee, report_fee, 
        wtdraw_fee, deli_fee, service_fee, other_fee, 
        trade_commis, other_commis, out_all_fee, out_report_fee, 
        out_cancel_fee, out_deli_fee, out_service_fee, out_other_fee, 
        out_brkage_commis, out_other_commis, busi_flag, undo_error_no, 
        remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_crncy_type, v_exch_rate, 
        v_exch_no, v_futu_acco_no, v_contrc_code_no, v_contrc_type, 
        v_contrc_unit, v_strike_date, v_strike_time, v_strike_no, 
        v_report_date, v_report_time, v_report_no, v_order_date, 
        v_order_time, v_order_no, v_order_dir, v_contrc_dir, 
        v_lngsht_type, v_hedge_type, v_order_price, v_order_qty, 
        v_pre_settle_price, v_sett_price, v_strike_price, v_strike_qty, 
        v_strike_amt, v_strike_num, v_pre_entry_qty, v_pre_entry_amt, 
        v_rece_margin, v_comb_code, v_comb_type, v_comb_name, 
        v_long_hold_margin, v_short_hold_margin, v_sett_capt_margin, v_sett_close_pandl, 
        v_sett_marked_pandl, v_sett_close_pandl_today, v_all_fee, v_report_fee, 
        v_wtdraw_fee, v_deli_fee, v_service_fee, v_other_fee, 
        v_trade_commis, v_other_commis, v_out_all_fee, v_out_report_fee, 
        v_out_cancel_fee, v_out_deli_fee, v_out_service_fee, v_out_other_fee, 
        v_out_brkage_commis, v_out_other_commis, v_busi_flag, v_undo_error_no, 
        v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.2.63.1";
        SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_获取清算处理统计值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_GetClrTotalData;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_GetClrTotalData(
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
    

    /* [获取表记录数量][清算期货_清算_成交表][@待清算成交数#][ {处理标志} <>《处理标志-已处理》 ] */
    select count(1) into v_pre_clr_strike_qty from db_clfutu.tb_clfucl_out_busi where  deal_flag <>1 ;


    /* [获取表记录数量][清算期货_清算_成交表][@已清算成交数#][ {处理标志}=《处理标志-已处理》] */
    select count(1) into v_alr_clr_strike_qty from db_clfutu.tb_clfucl_out_busi where  deal_flag=1;


    /* [获取表记录数量][清算期货_清算_待入账记录表][@待入账记录数#][{入账状态} <>《入账状态-已入账》] */
    select count(1) into v_pre_entry_record_qty from db_clfutu.tb_clfucl_pre_entry where entry_status <>"1";


    /* [获取表记录数量][清算期货_清算_待入账记录表][@已入账记录数#][{入账状态} =《入账状态-已入账》] */
    select count(1) into v_alr_entry_record_qty from db_clfutu.tb_clfucl_pre_entry where entry_status ="1";

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pre_clr_strike_qty = v_pre_clr_strike_qty;
    SET p_alr_clr_strike_qty = v_alr_clr_strike_qty;
    SET p_pre_entry_record_qty = v_pre_entry_record_qty;
    SET p_alr_entry_record_qty = v_alr_entry_record_qty;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_记录处理信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_DealException;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_DealException(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_deal_info varchar(255),
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
    declare v_deal_info varchar(255);
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
    SET v_init_date = p_init_date;
    SET v_deal_info = p_deal_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][清算期货_清算_处理异常记录表][字段][字段变量][1]["新增异常记录表失败"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clfutu.tb_clfucl_exception(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, deal_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_deal_info);
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.2.82.1";
        SET v_error_info =  CONCAT("新增异常记录表失败","#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_回写入账流水号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_UpdateEntryJour;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_UpdateEntryJour(
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
    SET v_row_id = p_row_id;
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_exgp_posi_jour_no = p_entry_exgp_posi_jour_no;
    SET v_entry_asac_posi_jour_no = p_entry_asac_posi_jour_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算期货_清算_待入账记录表][{入账资金流水号} = @入账资金流水号#, {入账交易组持仓流水号} = @入账交易组持仓流水号#, {入账资产账户持仓流水号} = @入账资产账户持仓流水号#][{记录序号} = @记录序号#][1]["回写入账流水失败"] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clfutu.tb_clfucl_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_money_jour_no = v_entry_money_jour_no, entry_exgp_posi_jour_no = v_entry_exgp_posi_jour_no, entry_asac_posi_jour_no = v_entry_asac_posi_jour_no where row_id = v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.2.83.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("回写入账流水失败","#",v_mysql_message);
        else
            SET v_error_info = "回写入账流水失败";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_查询成交序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_QueryStrikeId;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_QueryStrikeId(
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
    

    /* [获取表记录][清算期货_清算_成交表][字段][{记录序号}>@查询序号# and {处理标志} <>《处理标志-已处理》 order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_code, contrc_type, contrc_unit, strike_date, 
        strike_time, strike_no, report_date, report_time, 
        report_no, order_date, order_time, order_no, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, strike_price, strike_qty, strike_amt, 
        rece_margin, report_fee, wtdraw_fee, deli_fee, 
        service_fee, other_fee, trade_commis, other_commis, 
        out_report_fee, out_cancel_fee, out_deli_fee, out_service_fee, 
        out_other_fee, out_brkage_commis, out_other_commis, capit_reback_days, 
        posi_reback_days, clear_entry_type, comb_code, deal_flag from db_clfutu.tb_clfucl_out_busi where row_id>v_qry_no and deal_flag <>1 order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_code, contrc_type, contrc_unit, strike_date, 
        strike_time, strike_no, report_date, report_time, 
        report_no, order_date, order_time, order_no, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, strike_price, strike_qty, strike_amt, 
        rece_margin, report_fee, wtdraw_fee, deli_fee, 
        service_fee, other_fee, trade_commis, other_commis, 
        out_report_fee, out_cancel_fee, out_deli_fee, out_service_fee, 
        out_other_fee, out_brkage_commis, out_other_commis, capit_reback_days, 
        posi_reback_days, clear_entry_type, comb_code, deal_flag from db_clfutu.tb_clfucl_out_busi where row_id>v_qry_no and deal_flag <>1 order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_查询待入账记录序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_QueryPreEntryId;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_QueryPreEntryId(
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
    

    /* [获取表记录][清算期货_清算_待入账记录表][字段][{记录序号}>@查询序号# and {入账状态} <>《入账状态-已入账》 order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, strike_date, strike_time, 
        strike_no, report_date, report_time, report_no, 
        order_date, order_time, order_no, order_dir, 
        contrc_dir, lngsht_type, hedge_type, order_price, 
        order_qty, pre_settle_price, sett_price, strike_price, 
        strike_qty, strike_amt, strike_num, pre_entry_qty, 
        pre_entry_amt, rece_margin, comb_code, sett_close_pandl, 
        all_fee, report_fee, wtdraw_fee, deli_fee, 
        service_fee, other_fee, trade_commis, other_commis, 
        out_all_fee, out_report_fee, out_cancel_fee, out_deli_fee, 
        out_service_fee, out_other_fee, out_brkage_commis, out_other_commis, 
        busi_flag, entry_status, undo_status, entry_money_jour_no, 
        entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no, open_amount from db_clfutu.tb_clfucl_pre_entry where row_id>v_qry_no and entry_status <>"1" order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, strike_date, strike_time, 
        strike_no, report_date, report_time, report_no, 
        order_date, order_time, order_no, order_dir, 
        contrc_dir, lngsht_type, hedge_type, order_price, 
        order_qty, pre_settle_price, sett_price, strike_price, 
        strike_qty, strike_amt, strike_num, pre_entry_qty, 
        pre_entry_amt, rece_margin, comb_code, sett_close_pandl, 
        all_fee, report_fee, wtdraw_fee, deli_fee, 
        service_fee, other_fee, trade_commis, other_commis, 
        out_all_fee, out_report_fee, out_cancel_fee, out_deli_fee, 
        out_service_fee, out_other_fee, out_brkage_commis, out_other_commis, 
        busi_flag, entry_status, undo_status, entry_money_jour_no, 
        entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no, open_amount from db_clfutu.tb_clfucl_pre_entry where row_id>v_qry_no and entry_status <>"1" order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_清算_自动更新获取待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfucl_AutoUpdateGetPreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_clfucl_AutoUpdateGetPreEntry(
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
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12),
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
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_pre_settle_price decimal(16,9),
    OUT p_sett_price decimal(16,9),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_num int,
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_rece_margin decimal(18,4),
    OUT p_comb_code varchar(6),
    OUT p_long_hold_margin decimal(18,4),
    OUT p_short_hold_margin decimal(18,4),
    OUT p_sett_capt_margin decimal(18,4),
    OUT p_sett_close_pandl decimal(18,4),
    OUT p_sett_marked_pandl decimal(18,4),
    OUT p_sett_close_pandl_today decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_deli_fee decimal(18,4),
    OUT p_service_fee decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_out_all_fee decimal(18,4),
    OUT p_out_report_fee decimal(18,4),
    OUT p_out_cancel_fee decimal(18,4),
    OUT p_out_deli_fee decimal(18,4),
    OUT p_out_service_fee decimal(18,4),
    OUT p_out_other_fee decimal(18,4),
    OUT p_out_brkage_commis decimal(18,4),
    OUT p_out_other_commis decimal(18,4),
    OUT p_busi_flag int,
    OUT p_entry_status varchar(2),
    OUT p_undo_status varchar(2),
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_posi_jour_no bigint,
    OUT p_deli_jour_no bigint,
    OUT p_open_amount decimal(18,4)
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
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
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
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_sett_capt_margin decimal(18,4);
    declare v_sett_close_pandl decimal(18,4);
    declare v_sett_marked_pandl decimal(18,4);
    declare v_sett_close_pandl_today decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_all_fee decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_service_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_entry_money_jour_no bigint;
    declare v_entry_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_open_amount decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
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
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_pre_settle_price = 0;
    SET v_sett_price = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_num = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_rece_margin = 0;
    SET v_comb_code = " ";
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_sett_capt_margin = 0;
    SET v_sett_close_pandl = 0;
    SET v_sett_marked_pandl = 0;
    SET v_sett_close_pandl_today = 0;
    SET v_all_fee = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_deli_fee = 0;
    SET v_service_fee = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_out_all_fee = 0;
    SET v_out_report_fee = 0;
    SET v_out_cancel_fee = 0;
    SET v_out_deli_fee = 0;
    SET v_out_service_fee = 0;
    SET v_out_other_fee = 0;
    SET v_out_brkage_commis = 0;
    SET v_out_other_commis = 0;
    SET v_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_entry_money_jour_no = 0;
    SET v_entry_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_open_amount = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;
    #[不报错锁定获取表记录变量][清算期货_清算_待入账记录表][字段][字段变量][{记录序号} = @查询序号# and {入账状态} <>《入账状态-已入账》 ][4][@初始化日期#]

    /* [不报错锁定获取表记录变量][清算期货_清算_待入账记录表][字段][字段变量][{记录序号} > @查询序号# and {入账状态} <>《入账状态-已入账》 order by {记录序号}][4][@初始化日期#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, strike_date, strike_time, 
        strike_no, report_date, report_time, report_no, 
        order_date, order_time, order_no, order_dir, 
        contrc_dir, lngsht_type, hedge_type, order_price, 
        order_qty, pre_settle_price, sett_price, strike_price, 
        strike_qty, strike_amt, strike_num, pre_entry_qty, 
        pre_entry_amt, rece_margin, comb_code, sett_close_pandl, 
        all_fee, report_fee, wtdraw_fee, deli_fee, 
        service_fee, other_fee, trade_commis, other_commis, 
        out_all_fee, out_report_fee, out_cancel_fee, out_deli_fee, 
        out_service_fee, out_other_fee, out_brkage_commis, out_other_commis, 
        busi_flag, entry_status, undo_status, entry_money_jour_no, 
        entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no, open_amount into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_pass_no, v_out_acco, v_crncy_type, v_exch_crncy_type, 
        v_exch_rate, v_exch_no, v_futu_acco_no, v_contrc_code_no, 
        v_contrc_type, v_contrc_unit, v_strike_date, v_strike_time, 
        v_strike_no, v_report_date, v_report_time, v_report_no, 
        v_order_date, v_order_time, v_order_no, v_order_dir, 
        v_contrc_dir, v_lngsht_type, v_hedge_type, v_order_price, 
        v_order_qty, v_pre_settle_price, v_sett_price, v_strike_price, 
        v_strike_qty, v_strike_amt, v_strike_num, v_pre_entry_qty, 
        v_pre_entry_amt, v_rece_margin, v_comb_code, v_sett_close_pandl, 
        v_all_fee, v_report_fee, v_wtdraw_fee, v_deli_fee, 
        v_service_fee, v_other_fee, v_trade_commis, v_other_commis, 
        v_out_all_fee, v_out_report_fee, v_out_cancel_fee, v_out_deli_fee, 
        v_out_service_fee, v_out_other_fee, v_out_brkage_commis, v_out_other_commis, 
        v_busi_flag, v_entry_status, v_undo_status, v_entry_money_jour_no, 
        v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, v_deli_jour_no, v_open_amount from db_clfutu.tb_clfucl_pre_entry where row_id > v_qry_no and entry_status <>"1" order by row_id limit 1 for update;


    /* [检查正常返回][FOUND_ROWS() = 0] */
    if FOUND_ROWS() = 0 then
        leave label_pro;
    end if;

    #set @记录个数# = 1;

    /* [更新表记录][清算期货_清算_待入账记录表][{入账状态}=《入账状态-已入账》, {回滚状态}=《回滚状态-未回滚》][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clfutu.tb_clfucl_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="1", undo_status="2" where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.2.86.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
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
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;
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
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_sett_price = v_sett_price;
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_num = v_strike_num;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_rece_margin = v_rece_margin;
    SET p_comb_code = v_comb_code;
    SET p_long_hold_margin = v_long_hold_margin;
    SET p_short_hold_margin = v_short_hold_margin;
    SET p_sett_capt_margin = v_sett_capt_margin;
    SET p_sett_close_pandl = v_sett_close_pandl;
    SET p_sett_marked_pandl = v_sett_marked_pandl;
    SET p_sett_close_pandl_today = v_sett_close_pandl_today;
    SET p_all_fee = v_all_fee;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_deli_fee = v_deli_fee;
    SET p_service_fee = v_service_fee;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_out_all_fee = v_out_all_fee;
    SET p_out_report_fee = v_out_report_fee;
    SET p_out_cancel_fee = v_out_cancel_fee;
    SET p_out_deli_fee = v_out_deli_fee;
    SET p_out_service_fee = v_out_service_fee;
    SET p_out_other_fee = v_out_other_fee;
    SET p_out_brkage_commis = v_out_brkage_commis;
    SET p_out_other_commis = v_out_other_commis;
    SET p_busi_flag = v_busi_flag;
    SET p_entry_status = v_entry_status;
    SET p_undo_status = v_undo_status;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_posi_jour_no = v_entry_posi_jour_no;
    SET p_deli_jour_no = v_deli_jour_no;
    SET p_open_amount = v_open_amount;

END;;


