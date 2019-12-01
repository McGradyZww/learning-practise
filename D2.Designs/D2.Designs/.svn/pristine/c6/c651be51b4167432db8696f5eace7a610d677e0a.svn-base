DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_计算交易组资金可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_CalcExgpCashAvail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_CalcExgpCashAvail(
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
    OUT p_comm_avail_amt decimal(18,4),
    OUT p_trade_avail_amt decimal(18,4),
    OUT p_static_avail_amt decimal(18,4)
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
    declare v_comm_avail_amt decimal(18,4);
    declare v_trade_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_unfroz_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_comm_releas_amt decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_capt_margin decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_marked_pandl decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_comm_avail_amt = 0;
    SET v_trade_avail_amt = 0;
    SET v_static_avail_amt = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_unfroz_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_comm_releas_amt = 0;
    SET v_trade_capt_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_capt_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_capt_margin = 0;
    SET v_trade_fee = 0;
    SET v_strike_fee = 0;
    SET v_close_pandl = 0;
    SET v_marked_pandl = 0;

    
    label_pro:BEGIN
    
    #获取交易组当日可用金额

    /* [获取表记录变量语句][交易期货_账户_交易组业务资金表][字段][字段变量][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {交易币种}=@交易币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        comm_frozen_amt, comm_unfroz_amt, comm_capt_amt, comm_releas_amt, 
        trade_capt_amt, trade_releas_amt, strike_capt_amt, strike_releas_amt, 
        capt_margin, trade_fee, strike_fee, close_pandl, 
        marked_pandl into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, 
        v_begin_amt, v_curr_amt, v_frozen_amt, v_unfroz_amt, 
        v_comm_frozen_amt, v_comm_unfroz_amt, v_comm_capt_amt, v_comm_releas_amt, 
        v_trade_capt_amt, v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt, 
        v_capt_margin, v_trade_fee, v_strike_fee, v_close_pandl, 
        v_marked_pandl from db_tdfutu.tb_tdfuac_exgp_busi_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and exch_crncy_type=v_exch_crncy_type limit 1;


    /* set @指令端可用金额#=@成交释放金额#-@成交占用金额#-@指令占用金额#-@交易占用金额#+@平仓盈亏#-@交易费用#-@成交费用#; */
    set v_comm_avail_amt=v_strike_releas_amt-v_strike_capt_amt-v_comm_capt_amt-v_trade_capt_amt+v_close_pandl-v_trade_fee-v_strike_fee;

    /* set @交易端可用金额#=@成交释放金额#-@成交占用金额#-@交易占用金额#+@平仓盈亏#-@交易费用#-@成交费用#; */
    set v_trade_avail_amt=v_strike_releas_amt-v_strike_capt_amt-v_trade_capt_amt+v_close_pandl-v_trade_fee-v_strike_fee;

    /* set @静态可用金额#=@成交释放金额#-@成交占用金额#+@平仓盈亏#-@成交费用#; */
    set v_static_avail_amt=v_strike_releas_amt-v_strike_capt_amt+v_close_pandl-v_strike_fee;

    /* set @指令端可用金额# = Round(@指令端可用金额#,2); */
    set v_comm_avail_amt = Round(v_comm_avail_amt,2);

    /* set @交易端可用金额# = Round(@交易端可用金额#,2); */
    set v_trade_avail_amt = Round(v_trade_avail_amt,2);

    /* set @静态可用金额# = Round(@静态可用金额#,2); */
    set v_static_avail_amt = Round(v_static_avail_amt,2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_avail_amt = v_comm_avail_amt;
    SET p_trade_avail_amt = v_trade_avail_amt;
    SET p_static_avail_amt = v_static_avail_amt;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_计算资产账户资金可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_CalcAsacCashAvail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_CalcAsacCashAvail(
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
    IN p_exch_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_avail_amt decimal(18,4),
    OUT p_trade_avail_amt decimal(18,4),
    OUT p_static_avail_amt decimal(18,4)
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
    declare v_exch_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_avail_amt decimal(18,4);
    declare v_trade_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_unfroz_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_comm_releas_amt decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_capt_margin decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_marked_pandl decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_avail_amt = 0;
    SET v_trade_avail_amt = 0;
    SET v_static_avail_amt = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_unfroz_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_comm_releas_amt = 0;
    SET v_trade_capt_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_capt_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_capt_margin = 0;
    SET v_trade_fee = 0;
    SET v_strike_fee = 0;
    SET v_close_pandl = 0;
    SET v_marked_pandl = 0;

    
    label_pro:BEGIN
    
    #获取交易组当日可用金额

    /* [获取表记录变量语句][交易期货_账户_资产账户业务资金表][字段][字段变量][{资产账户编号}=@资产账户编号# and {交易币种}=@交易币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
        comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_capt_amt, 
        trade_releas_amt, strike_capt_amt, strike_releas_amt, capt_margin, 
        trade_fee, strike_fee, close_pandl, marked_pandl into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_crncy_type, v_begin_amt, 
        v_curr_amt, v_frozen_amt, v_unfroz_amt, v_comm_frozen_amt, 
        v_comm_unfroz_amt, v_comm_capt_amt, v_comm_releas_amt, v_trade_capt_amt, 
        v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt, v_capt_margin, 
        v_trade_fee, v_strike_fee, v_close_pandl, v_marked_pandl from db_tdfutu.tb_tdfuac_asac_busi_capit where asset_acco_no=v_asset_acco_no and exch_crncy_type=v_exch_crncy_type limit 1;


    /* set @指令端可用金额#=@成交释放金额#-@成交占用金额#-@指令占用金额#-@交易占用金额#+@平仓盈亏#-@交易费用#-@成交费用#; */
    set v_comm_avail_amt=v_strike_releas_amt-v_strike_capt_amt-v_comm_capt_amt-v_trade_capt_amt+v_close_pandl-v_trade_fee-v_strike_fee;

    /* set @交易端可用金额#=@成交释放金额#-@成交占用金额#-@交易占用金额#+@平仓盈亏#-@交易费用#-@成交费用#; */
    set v_trade_avail_amt=v_strike_releas_amt-v_strike_capt_amt-v_trade_capt_amt+v_close_pandl-v_trade_fee-v_strike_fee;

    /* set @静态可用金额#=@成交释放金额#-@成交占用金额#+@平仓盈亏#-@成交费用#; */
    set v_static_avail_amt=v_strike_releas_amt-v_strike_capt_amt+v_close_pandl-v_strike_fee;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_avail_amt = v_comm_avail_amt;
    SET p_trade_avail_amt = v_trade_avail_amt;
    SET p_static_avail_amt = v_static_avail_amt;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_计算交易组持仓可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_CalcExgpPosiAvail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_CalcExgpPosiAvail(
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
    IN p_lngsht_type int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_exgp_avail_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_avail_qty decimal(18,2),
    OUT p_trade_avail_qty decimal(18,2),
    OUT p_static_avail_qty decimal(18,2)
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
    declare v_lngsht_type int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_exgp_avail_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_avail_qty decimal(18,2);
    declare v_trade_avail_qty decimal(18,2);
    declare v_static_avail_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_exch_crncy_type varchar(3);
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_comb_code varchar(6);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
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
    declare v_strike_releas_qty decimal(18,2);
    declare v_pre_comm_capt_qty decimal(18,2);
    declare v_today_comm_capt_qty decimal(18,2);
    declare v_old_trade_capt_qty decimal(18,2);
    declare v_today_trade_capt_qty decimal(18,2);
    declare v_pre_strike_capt_qty decimal(18,2);
    declare v_today_strike_capt_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_pre_settle_price decimal(16,9);
    declare v_realize_pandl decimal(18,4);
    declare v_close_pandl decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_avail_qty = 0;
    SET v_trade_avail_qty = 0;
    SET v_static_avail_qty = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_exch_crncy_type = "CNY";
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_comb_code = " ";
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
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
    SET v_strike_releas_qty = 0;
    SET v_pre_comm_capt_qty = 0;
    SET v_today_comm_capt_qty = 0;
    SET v_old_trade_capt_qty = 0;
    SET v_today_trade_capt_qty = 0;
    SET v_pre_strike_capt_qty = 0;
    SET v_today_strike_capt_qty = 0;
    SET v_rece_margin = 0;
    SET v_pre_settle_price = 0;
    SET v_realize_pandl = 0;
    SET v_close_pandl = 0;
    SET v_open_amount = 0;

    
    label_pro:BEGIN
    
    #持仓可用计算的是交易和产品的累积

    /* [获取表记录变量语句][交易期货_账户_交易组业务持仓表][字段][字段变量][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {合约代码编号}=@合约代码编号# and {交易编码编号}=@交易编码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, futu_acco_no, contrc_code_no, contrc_type, 
        contrc_unit, lngsht_type, hedge_type, comb_code, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        comm_frozen_qty, comm_unfroz_qty, comm_capt_qty, comm_releas_qty, 
        trade_frozen_qty, trade_unfroz_qty, trade_capt_qty, trade_releas_qty, 
        strike_releas_qty, pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, 
        today_trade_capt_qty, pre_strike_capt_qty, today_strike_capt_qty, rece_margin, 
        pre_settle_price, realize_pandl, close_pandl, open_amount into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, 
        v_exch_no, v_futu_acco_no, v_contrc_code_no, v_contrc_type, 
        v_contrc_unit, v_lngsht_type, v_hedge_type, v_comb_code, 
        v_begin_qty, v_curr_qty, v_frozen_qty, v_unfroz_qty, 
        v_comm_frozen_qty, v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, 
        v_trade_frozen_qty, v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, 
        v_strike_releas_qty, v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, 
        v_today_trade_capt_qty, v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, 
        v_pre_settle_price, v_realize_pandl, v_close_pandl, v_open_amount from db_tdfutu.tb_tdfuac_exgp_busi_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and contrc_code_no=v_contrc_code_no and futu_acco_no=v_futu_acco_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type limit 1;

    #只有上期所分平仓和平今仓，所以单独进行处理

    /* if @市场编号# = 《市场编号-上海商品期货交易所》 then */
    if v_exch_no = 12 then

      /* if @开平方向# = 《开平方向-平仓》 then */
      if v_contrc_dir = 2 then

        /* set @指令端可用数量#=@交易组可用数量#-@老仓指令占用数量#-@老仓交易占用数量#-@老仓成交占用数量#; */
        set v_comm_avail_qty=v_exgp_avail_qty-v_pre_comm_capt_qty-v_old_trade_capt_qty-v_pre_strike_capt_qty;

        /* set @交易端可用数量#=@交易组可用数量#-@老仓交易占用数量#-@老仓成交占用数量#; */
        set v_trade_avail_qty=v_exgp_avail_qty-v_old_trade_capt_qty-v_pre_strike_capt_qty;

        /* set @静态可用数量#=@交易组可用数量#-@老仓成交占用数量#; */
        set v_static_avail_qty=v_exgp_avail_qty-v_pre_strike_capt_qty;
      else

        /* if @开平方向# = 《开平方向-平今仓》 then */
        if v_contrc_dir = 3 then

          /* set @指令端可用数量#=@成交释放数量#-@今仓指令占用数量#-@今仓交易占用数量#-@今仓成交占用数量#; */
          set v_comm_avail_qty=v_strike_releas_qty-v_today_comm_capt_qty-v_today_trade_capt_qty-v_today_strike_capt_qty;

          /* set @交易端可用数量#=@成交释放数量#-@今仓交易占用数量#-@今仓成交占用数量#; */
          set v_trade_avail_qty=v_strike_releas_qty-v_today_trade_capt_qty-v_today_strike_capt_qty;

          /* set @静态可用数量#=@成交释放数量#-@今仓成交占用数量#; */
          set v_static_avail_qty=v_strike_releas_qty-v_today_strike_capt_qty;
        end if;
      end if;
    else

      /* set @指令端可用数量#=@交易组可用数量#+@成交释放数量#-@老仓指令占用数量#-@老仓交易占用数量#-@老仓成交占用数量#-@今仓指令占用数量#-@今仓交易占用数量#-@今仓成交占用数量#; */
      set v_comm_avail_qty=v_exgp_avail_qty+v_strike_releas_qty-v_pre_comm_capt_qty-v_old_trade_capt_qty-v_pre_strike_capt_qty-v_today_comm_capt_qty-v_today_trade_capt_qty-v_today_strike_capt_qty;

      /* set @交易端可用数量#=@交易组可用数量#+@成交释放数量#-@老仓交易占用数量#-@老仓成交占用数量#-@今仓交易占用数量#-@今仓成交占用数量#; */
      set v_trade_avail_qty=v_exgp_avail_qty+v_strike_releas_qty-v_old_trade_capt_qty-v_pre_strike_capt_qty-v_today_trade_capt_qty-v_today_strike_capt_qty;

      /* set @静态可用数量#=@交易组可用数量#+@成交释放数量#-@老仓成交占用数量#-@今仓成交占用数量#; */
      set v_static_avail_qty=v_exgp_avail_qty+v_strike_releas_qty-v_pre_strike_capt_qty-v_today_strike_capt_qty;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_avail_qty = v_comm_avail_qty;
    SET p_trade_avail_qty = v_trade_avail_qty;
    SET p_static_avail_qty = v_static_avail_qty;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_计算资产账户持仓可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_CalcAsacPosiAvail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_CalcAsacPosiAvail(
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
    IN p_exch_no int,
    IN p_lngsht_type int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_asac_avail_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_avail_qty decimal(18,2),
    OUT p_trade_avail_qty decimal(18,2),
    OUT p_static_avail_qty decimal(18,2)
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
    declare v_exch_no int;
    declare v_lngsht_type int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_asac_avail_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_avail_qty decimal(18,2);
    declare v_trade_avail_qty decimal(18,2);
    declare v_static_avail_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_exch_crncy_type varchar(3);
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_comb_code varchar(6);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
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
    declare v_strike_releas_qty decimal(18,2);
    declare v_pre_comm_capt_qty decimal(18,2);
    declare v_today_comm_capt_qty decimal(18,2);
    declare v_old_trade_capt_qty decimal(18,2);
    declare v_today_trade_capt_qty decimal(18,2);
    declare v_pre_strike_capt_qty decimal(18,2);
    declare v_today_strike_capt_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_pre_settle_price decimal(16,9);
    declare v_realize_pandl decimal(18,4);
    declare v_close_pandl decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_avail_qty = 0;
    SET v_trade_avail_qty = 0;
    SET v_static_avail_qty = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_exch_crncy_type = "CNY";
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_comb_code = " ";
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
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
    SET v_strike_releas_qty = 0;
    SET v_pre_comm_capt_qty = 0;
    SET v_today_comm_capt_qty = 0;
    SET v_old_trade_capt_qty = 0;
    SET v_today_trade_capt_qty = 0;
    SET v_pre_strike_capt_qty = 0;
    SET v_today_strike_capt_qty = 0;
    SET v_rece_margin = 0;
    SET v_pre_settle_price = 0;
    SET v_realize_pandl = 0;
    SET v_close_pandl = 0;
    SET v_open_amount = 0;

    
    label_pro:BEGIN
    
    #持仓可用计算的是交易和产品的累积

    /* [获取表记录变量语句][交易期货_账户_资产账户业务持仓表][字段][字段变量][{资产账户编号}=@资产账户编号# and {市场编号}=@市场编号# and {合约代码编号}=@合约代码编号# and {交易编码编号}=@交易编码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_crncy_type, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
        lngsht_type, hedge_type, comb_code, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
        comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
        trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
        pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
        pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
        realize_pandl, close_pandl, open_amount into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
        v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
        v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
        v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
        v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
        v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
        v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
        v_realize_pandl, v_close_pandl, v_open_amount from db_tdfutu.tb_tdfuac_asac_busi_posi where asset_acco_no=v_asset_acco_no and exch_no=v_exch_no and contrc_code_no=v_contrc_code_no and futu_acco_no=v_futu_acco_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type limit 1;


    /* if @市场编号# = 《市场编号-上海商品期货交易所》 then */
    if v_exch_no = 12 then

      /* if @开平方向# = 《开平方向-平仓》 then */
      if v_contrc_dir = 2 then

        /* set @指令端可用数量#=@资产账户可用数量#-@老仓指令占用数量#-@老仓交易占用数量#-@老仓成交占用数量#; */
        set v_comm_avail_qty=v_asac_avail_qty-v_pre_comm_capt_qty-v_old_trade_capt_qty-v_pre_strike_capt_qty;

        /* set @交易端可用数量#=@资产账户可用数量#-@老仓交易占用数量#-@老仓成交占用数量#; */
        set v_trade_avail_qty=v_asac_avail_qty-v_old_trade_capt_qty-v_pre_strike_capt_qty;

        /* set @静态可用数量#=@资产账户可用数量#-@老仓成交占用数量#; */
        set v_static_avail_qty=v_asac_avail_qty-v_pre_strike_capt_qty;
      else

        /* if @开平方向# = 《开平方向-平今仓》 then */
        if v_contrc_dir = 3 then

          /* set @指令端可用数量#=@成交释放数量#-@今仓指令占用数量#-@今仓交易占用数量#-@今仓成交占用数量#; */
          set v_comm_avail_qty=v_strike_releas_qty-v_today_comm_capt_qty-v_today_trade_capt_qty-v_today_strike_capt_qty;

          /* set @交易端可用数量#=@成交释放数量#-@今仓交易占用数量#-@今仓成交占用数量#; */
          set v_trade_avail_qty=v_strike_releas_qty-v_today_trade_capt_qty-v_today_strike_capt_qty;

          /* set @静态可用数量#=@成交释放数量#-@今仓成交占用数量#; */
          set v_static_avail_qty=v_strike_releas_qty-v_today_strike_capt_qty;
        end if;
      end if;
    else

      /* set @指令端可用数量#=@资产账户可用数量#+@成交释放数量#-@今仓指令占用数量#-@今仓交易占用数量#-@今仓成交占用数量#-@老仓指令占用数量#-@老仓交易占用数量#-@老仓成交占用数量#; */
      set v_comm_avail_qty=v_asac_avail_qty+v_strike_releas_qty-v_today_comm_capt_qty-v_today_trade_capt_qty-v_today_strike_capt_qty-v_pre_comm_capt_qty-v_old_trade_capt_qty-v_pre_strike_capt_qty;

      /* set @交易端可用数量#=@资产账户可用数量#+@成交释放数量#-@今仓交易占用数量#-@今仓成交占用数量#-@老仓交易占用数量#-@老仓成交占用数量#; */
      set v_trade_avail_qty=v_asac_avail_qty+v_strike_releas_qty-v_today_trade_capt_qty-v_today_strike_capt_qty-v_old_trade_capt_qty-v_pre_strike_capt_qty;

      /* set @静态可用数量#=@资产账户可用数量#+@成交释放数量#-@今仓成交占用数量#-@老仓成交占用数量#; */
      set v_static_avail_qty=v_asac_avail_qty+v_strike_releas_qty-v_today_strike_capt_qty-v_pre_strike_capt_qty;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_avail_qty = v_comm_avail_qty;
    SET p_trade_avail_qty = v_trade_avail_qty;
    SET p_static_avail_qty = v_static_avail_qty;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_查询交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_QueryExgpCash;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_QueryExgpCash(
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
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_exch_crncy_type varchar(3);
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易期货_账户_交易组业务资金表][字段][{机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and (@交易组编号权限串#="; ;" or instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0) and (@交易币种# = " " or {交易币种} = @交易币种#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        comm_frozen_amt, comm_unfroz_amt, comm_capt_amt, comm_releas_amt, 
        trade_capt_amt, trade_releas_amt, strike_capt_amt, strike_releas_amt, 
        capt_margin, trade_fee, strike_fee, close_pandl, 
        marked_pandl from db_tdfutu.tb_tdfuac_exgp_busi_capit where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_exch_group_no_rights_str="; ;" or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0) and (v_exch_crncy_type = " " or exch_crncy_type = v_exch_crncy_type) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        comm_frozen_amt, comm_unfroz_amt, comm_capt_amt, comm_releas_amt, 
        trade_capt_amt, trade_releas_amt, strike_capt_amt, strike_releas_amt, 
        capt_margin, trade_fee, strike_fee, close_pandl, 
        marked_pandl from db_tdfutu.tb_tdfuac_exgp_busi_capit where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_exch_group_no_rights_str="; ;" or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0) and (v_exch_crncy_type = " " or exch_crncy_type = v_exch_crncy_type) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_查询资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_QueryAsacCash;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_QueryAsacCash(
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
    IN p_exch_crncy_type varchar(3),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
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
    declare v_exch_crncy_type varchar(3);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易期货_账户_资产账户业务资金表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@产品编号权限串#="; ;" or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易币种# = " " or  {交易币种} = @交易币种#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
        comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_capt_amt, 
        trade_releas_amt, strike_capt_amt, strike_releas_amt, capt_margin, 
        trade_fee, strike_fee, close_pandl, marked_pandl from db_tdfutu.tb_tdfuac_asac_busi_capit where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_pd_no_rights_str="; ;" or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_crncy_type = " " or  exch_crncy_type = v_exch_crncy_type) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
        comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_capt_amt, 
        trade_releas_amt, strike_capt_amt, strike_releas_amt, capt_margin, 
        trade_fee, strike_fee, close_pandl, marked_pandl from db_tdfutu.tb_tdfuac_asac_busi_capit where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_pd_no_rights_str="; ;" or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_crncy_type = " " or  exch_crncy_type = v_exch_crncy_type) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_查询交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_QueryExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_QueryExgpPosi(
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
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_exch_no_str varchar(2048);
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易期货_账户_交易组业务持仓表][字段][{机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and (@交易组编号权限串# = "; ;" or  instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 ) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and ({多空类型}=@多空类型# or @多空类型#=0) and ({套保标志}=@套保标志# or @套保标志#=0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, futu_acco_no, contrc_code_no, contrc_type, 
        contrc_unit, lngsht_type, hedge_type, comb_code, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        comm_frozen_qty, comm_unfroz_qty, comm_capt_qty, comm_releas_qty, 
        trade_frozen_qty, trade_unfroz_qty, trade_capt_qty, trade_releas_qty, 
        strike_releas_qty, pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, 
        today_trade_capt_qty, pre_strike_capt_qty, today_strike_capt_qty, rece_margin, 
        pre_settle_price, realize_pandl, close_pandl, open_amount from db_tdfutu.tb_tdfuac_exgp_busi_posi where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and (v_exch_group_no_rights_str = "; ;" or  instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 ) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (lngsht_type=v_lngsht_type or v_lngsht_type=0) and (hedge_type=v_hedge_type or v_hedge_type=0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, futu_acco_no, contrc_code_no, contrc_type, 
        contrc_unit, lngsht_type, hedge_type, comb_code, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        comm_frozen_qty, comm_unfroz_qty, comm_capt_qty, comm_releas_qty, 
        trade_frozen_qty, trade_unfroz_qty, trade_capt_qty, trade_releas_qty, 
        strike_releas_qty, pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, 
        today_trade_capt_qty, pre_strike_capt_qty, today_strike_capt_qty, rece_margin, 
        pre_settle_price, realize_pandl, close_pandl, open_amount from db_tdfutu.tb_tdfuac_exgp_busi_posi where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and (v_exch_group_no_rights_str = "; ;" or  instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 ) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (lngsht_type=v_lngsht_type or v_lngsht_type=0) and (hedge_type=v_hedge_type or v_hedge_type=0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_查询资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_QueryAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_QueryAsacPosi(
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
    IN p_exch_no_str varchar(2048),
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_pd_no_rights_str varchar(2048),
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
    declare v_exch_no_str varchar(2048);
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_pd_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_count int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录][交易期货_账户_资产账户业务持仓表][字段][(@机构编号# = 0  or {机构编号} = @机构编号#)  and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@产品编号权限串# = "; ;" or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and ({多空类型}=@多空类型# or @多空类型#=0) and ({套保标志}=@套保标志# or @套保标志#=0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_crncy_type, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
        lngsht_type, hedge_type, comb_code, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
        comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
        trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
        pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
        pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
        realize_pandl, close_pandl, open_amount from db_tdfutu.tb_tdfuac_asac_busi_posi where (v_co_no = 0  or co_no = v_co_no)  and (v_pd_no = 0 or pd_no = v_pd_no) and (v_pd_no_rights_str = "; ;" or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (lngsht_type=v_lngsht_type or v_lngsht_type=0) and (hedge_type=v_hedge_type or v_hedge_type=0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_crncy_type, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
        lngsht_type, hedge_type, comb_code, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
        comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
        trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
        pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
        pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
        realize_pandl, close_pandl, open_amount from db_tdfutu.tb_tdfuac_asac_busi_posi where (v_co_no = 0  or co_no = v_co_no)  and (v_pd_no = 0 or pd_no = v_pd_no) and (v_pd_no_rights_str = "; ;" or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (lngsht_type=v_lngsht_type or v_lngsht_type=0) and (hedge_type=v_hedge_type or v_hedge_type=0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_查询交易组持仓明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_QueryExgpPosiDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_QueryExgpPosiDetail(
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
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_exch_no_str varchar(2048);
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易期货_账户_交易组持仓明细表][字段][{机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and ({交易组编号}=@交易组编号# or @交易组编号#=0) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and  ({多空类型}=@多空类型# or @多空类型#=0) and ({套保标志}=@套保标志# or @套保标志#=0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        exch_crncy_type, futu_acco_no, contrc_code_no, contrc_unit, 
        contrc_type, curr_qty, invest_type, lngsht_type, 
        hedge_type, open_posi_date, open_posi_time, open_posi_price, 
        open_posi_qty, open_amount, open_posi_fee, close_posi_fee, 
        trade_capt_qty, strike_capt_qty, marked_sett_price, strike_no, 
        detail_posi_id, rece_margin, close_pandl, marked_pandl from db_tdfutu.tb_tdfuac_exgp_posi_detail where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (exch_group_no=v_exch_group_no or v_exch_group_no=0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and  (lngsht_type=v_lngsht_type or v_lngsht_type=0) and (hedge_type=v_hedge_type or v_hedge_type=0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        exch_crncy_type, futu_acco_no, contrc_code_no, contrc_unit, 
        contrc_type, curr_qty, invest_type, lngsht_type, 
        hedge_type, open_posi_date, open_posi_time, open_posi_price, 
        open_posi_qty, open_amount, open_posi_fee, close_posi_fee, 
        trade_capt_qty, strike_capt_qty, marked_sett_price, strike_no, 
        detail_posi_id, rece_margin, close_pandl, marked_pandl from db_tdfutu.tb_tdfuac_exgp_posi_detail where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (exch_group_no=v_exch_group_no or v_exch_group_no=0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and  (lngsht_type=v_lngsht_type or v_lngsht_type=0) and (hedge_type=v_hedge_type or v_hedge_type=0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_更新交易资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_UpdateTradeCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_UpdateTradeCapit(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_dir int,
    IN p_invest_type int,
    IN p_lngsht_type int,
    IN p_strike_occur_amt decimal(18,4),
    IN p_strike_fee decimal(18,4),
    IN p_trade_occur_amt decimal(18,4),
    IN p_trade_fee decimal(18,4),
    IN p_comm_occur_amt decimal(18,4),
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_dir int;
    declare v_invest_type int;
    declare v_lngsht_type int;
    declare v_strike_occur_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_comm_occur_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_crncy_type varchar(3);
    declare v_capt_margin decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_unfroz_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_comm_releas_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_marked_pandl decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_crncy_type varchar(3);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_dir = p_contrc_dir;
    SET v_invest_type = p_invest_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_strike_occur_amt = p_strike_occur_amt;
    SET v_strike_fee = p_strike_fee;
    SET v_trade_occur_amt = p_trade_occur_amt;
    SET v_trade_fee = p_trade_fee;
    SET v_comm_occur_amt = p_comm_occur_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_capt_margin = 0;
    SET v_close_pandl = 0;
    SET v_strike_capt_amt = 0;
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_unfroz_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_comm_releas_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_marked_pandl = 0;
    SET v_trade_capt_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* set @交易币种#="CNY"; */
    set v_exch_crncy_type="CNY";

    /* set @占用保证金#=0; */
    set v_capt_margin=0;

    /* set @平仓盈亏#=0; */
    set v_close_pandl=0;

    /* set @成交占用金额#=0; */
    set v_strike_capt_amt=0;

    /* set @期初金额#=0; */
    set v_begin_amt=0;

    /* set @当前金额#=0; */
    set v_curr_amt=0;

    /* set @冻结金额#=0; */
    set v_frozen_amt=0;

    /* set @解冻金额#=0; */
    set v_unfroz_amt=0;

    /* set @指令冻结金额#=0; */
    set v_comm_frozen_amt=0;

    /* set @指令解冻金额#=0; */
    set v_comm_unfroz_amt=0;

    /* set @指令占用金额#=0; */
    set v_comm_capt_amt=0;

    /* set @指令释放金额#=0; */
    set v_comm_releas_amt=0;

    /* set @交易释放金额#=0; */
    set v_trade_releas_amt=0;

    /* set @成交释放金额#=0; */
    set v_strike_releas_amt=0;

    /* set @盯市盈亏#=0; */
    set v_marked_pandl=0;

    /* set @交易占用金额#=@交易变动金额#; */
    set v_trade_capt_amt=v_trade_occur_amt;

    /* set @指令占用金额#=@指令变动金额#; */
    set v_comm_capt_amt=v_comm_occur_amt;

    /* if @开平方向# = 《开平方向-开仓》 then */
    if v_contrc_dir = 1 then

      /* [插入重复更新][交易期货_账户_交易组业务资金表][字段][字段变量][{指令占用金额} = {指令占用金额} + @指令占用金额#,{交易占用金额}={交易占用金额}+@交易占用金额#,{交易费用}={交易费用}+@交易费用#,{成交费用}={成交费用}+@成交费用#][1][@交易组编号#,@资产账户编号#,@交易币种#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfuac_exgp_busi_capit (
          create_date, create_time, update_date, 
          update_time, update_times, co_no, pd_no, 
          exch_group_no, asset_acco_no, exch_crncy_type, begin_amt, 
          curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
          comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_capt_amt, 
          trade_releas_amt, strike_capt_amt, strike_releas_amt, capt_margin, 
          trade_fee, strike_fee, close_pandl, marked_pandl) 
      values(
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_co_no, v_pd_no, 
          v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_begin_amt, 
          v_curr_amt, v_frozen_amt, v_unfroz_amt, v_comm_frozen_amt, 
          v_comm_unfroz_amt, v_comm_capt_amt, v_comm_releas_amt, v_trade_capt_amt, 
          v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt, v_capt_margin, 
          v_trade_fee, v_strike_fee, v_close_pandl, v_marked_pandl) 
      ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, comm_capt_amt = comm_capt_amt + v_comm_capt_amt,trade_capt_amt=trade_capt_amt+v_trade_capt_amt,trade_fee=trade_fee+v_trade_fee,strike_fee=strike_fee+v_strike_fee;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.2.11.1";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type),"#",v_mysql_message);
          else
              SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type);
          end if;
          leave label_pro;
      end if;


      /* [插入重复更新][交易期货_账户_资产账户业务资金表][字段][字段变量][{指令占用金额} = {指令占用金额} + @指令占用金额#,{交易占用金额}={交易占用金额}+@交易占用金额#,{交易费用}={交易费用}+@交易费用#,{成交费用}={成交费用}+@成交费用#][1][@资产账户编号#,@本币币种#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfuac_asac_busi_capit (
          create_date, create_time, update_date, 
          update_time, update_times, co_no, pd_no, 
          asset_acco_no, exch_crncy_type, begin_amt, curr_amt, 
          frozen_amt, unfroz_amt, comm_frozen_amt, comm_unfroz_amt, 
          comm_capt_amt, comm_releas_amt, trade_capt_amt, trade_releas_amt, 
          strike_capt_amt, strike_releas_amt, capt_margin, trade_fee, 
          strike_fee, close_pandl, marked_pandl) 
      values(
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_co_no, v_pd_no, 
          v_asset_acco_no, v_exch_crncy_type, v_begin_amt, v_curr_amt, 
          v_frozen_amt, v_unfroz_amt, v_comm_frozen_amt, v_comm_unfroz_amt, 
          v_comm_capt_amt, v_comm_releas_amt, v_trade_capt_amt, v_trade_releas_amt, 
          v_strike_capt_amt, v_strike_releas_amt, v_capt_margin, v_trade_fee, 
          v_strike_fee, v_close_pandl, v_marked_pandl) 
      ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, comm_capt_amt = comm_capt_amt + v_comm_capt_amt,trade_capt_amt=trade_capt_amt+v_trade_capt_amt,trade_fee=trade_fee+v_trade_fee,strike_fee=strike_fee+v_strike_fee;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.2.11.1";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
          else
              SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
          end if;
          leave label_pro;
      end if;

    else

      /* [插入重复更新][交易期货_账户_交易组业务资金表][字段][字段变量][{指令占用金额} = {指令占用金额} + @指令占用金额#,{交易占用金额}={交易占用金额}+@交易占用金额#,{交易费用}={交易费用}+@交易费用#,{成交费用}={成交费用}+@成交费用#][1][@交易组编号#,@资产账户编号#,@本币币种#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfuac_exgp_busi_capit (
          create_date, create_time, update_date, 
          update_time, update_times, co_no, pd_no, 
          exch_group_no, asset_acco_no, exch_crncy_type, begin_amt, 
          curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
          comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_capt_amt, 
          trade_releas_amt, strike_capt_amt, strike_releas_amt, capt_margin, 
          trade_fee, strike_fee, close_pandl, marked_pandl) 
      values(
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_co_no, v_pd_no, 
          v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_begin_amt, 
          v_curr_amt, v_frozen_amt, v_unfroz_amt, v_comm_frozen_amt, 
          v_comm_unfroz_amt, v_comm_capt_amt, v_comm_releas_amt, v_trade_capt_amt, 
          v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt, v_capt_margin, 
          v_trade_fee, v_strike_fee, v_close_pandl, v_marked_pandl) 
      ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, comm_capt_amt = comm_capt_amt + v_comm_capt_amt,trade_capt_amt=trade_capt_amt+v_trade_capt_amt,trade_fee=trade_fee+v_trade_fee,strike_fee=strike_fee+v_strike_fee;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.2.11.1";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
          else
              SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
          end if;
          leave label_pro;
      end if;


      /* [插入重复更新][交易期货_账户_资产账户业务资金表][字段][字段变量][{指令占用金额} = {指令占用金额} + @指令占用金额#,{交易占用金额}={交易占用金额}+@交易占用金额#,{交易费用}={交易费用}+@交易费用#,{成交费用}={成交费用}+@成交费用#][1][@资产账户编号#,@本币币种#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfuac_asac_busi_capit (
          create_date, create_time, update_date, 
          update_time, update_times, co_no, pd_no, 
          asset_acco_no, exch_crncy_type, begin_amt, curr_amt, 
          frozen_amt, unfroz_amt, comm_frozen_amt, comm_unfroz_amt, 
          comm_capt_amt, comm_releas_amt, trade_capt_amt, trade_releas_amt, 
          strike_capt_amt, strike_releas_amt, capt_margin, trade_fee, 
          strike_fee, close_pandl, marked_pandl) 
      values(
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_co_no, v_pd_no, 
          v_asset_acco_no, v_exch_crncy_type, v_begin_amt, v_curr_amt, 
          v_frozen_amt, v_unfroz_amt, v_comm_frozen_amt, v_comm_unfroz_amt, 
          v_comm_capt_amt, v_comm_releas_amt, v_trade_capt_amt, v_trade_releas_amt, 
          v_strike_capt_amt, v_strike_releas_amt, v_capt_margin, v_trade_fee, 
          v_strike_fee, v_close_pandl, v_marked_pandl) 
      ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, comm_capt_amt = comm_capt_amt + v_comm_capt_amt,trade_capt_amt=trade_capt_amt+v_trade_capt_amt,trade_fee=trade_fee+v_trade_fee,strike_fee=strike_fee+v_strike_fee;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.2.11.1";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
          else
              SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
          end if;
          leave label_pro;
      end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_更新交易持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_UpdateTradePosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_UpdateTradePosi(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_invest_type int,
    IN p_lngsht_type int,
    IN p_comb_code varchar(6),
    IN p_pre_settle_price decimal(16,9),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    IN p_comm_occur_qty decimal(18,2),
    IN p_trade_occur_qty decimal(18,2),
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_invest_type int;
    declare v_lngsht_type int;
    declare v_comb_code varchar(6);
    declare v_pre_settle_price decimal(16,9);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_comm_occur_qty decimal(18,2);
    declare v_trade_occur_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_crncy_type varchar(3);
    declare v_curr_qty decimal(18,2);
    declare v_begin_qty decimal(18,2);
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
    declare v_strike_releas_qty decimal(18,2);
    declare v_pre_comm_capt_qty decimal(18,2);
    declare v_today_comm_capt_qty decimal(18,2);
    declare v_old_trade_capt_qty decimal(18,2);
    declare v_today_trade_capt_qty decimal(18,2);
    declare v_pre_strike_capt_qty decimal(18,2);
    declare v_today_strike_capt_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_open_amount decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_row_id bigint;
    declare v_tmp_old_trade_capt_qty decimal(18,2);
    declare v_tmp_today_trade_capt_qty decimal(18,2);
    declare v_tmp_pre_strike_capt_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_invest_type = p_invest_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_comb_code = p_comb_code;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_comm_occur_qty = p_comm_occur_qty;
    SET v_trade_occur_qty = p_trade_occur_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_curr_qty = 0;
    SET v_begin_qty = 0;
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
    SET v_strike_releas_qty = 0;
    SET v_pre_comm_capt_qty = 0;
    SET v_today_comm_capt_qty = 0;
    SET v_old_trade_capt_qty = 0;
    SET v_today_trade_capt_qty = 0;
    SET v_pre_strike_capt_qty = 0;
    SET v_today_strike_capt_qty = 0;
    SET v_rece_margin = 0;
    SET v_realize_pandl = 0;
    SET v_close_pandl = 0;
    SET v_open_amount = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_tmp_old_trade_capt_qty = 0;
    SET v_tmp_today_trade_capt_qty = 0;
    SET v_tmp_pre_strike_capt_qty = 0;

    
    label_pro:BEGIN
    

    /* set @交易币种#="CNY"; */
    set v_exch_crncy_type="CNY";

    /* set @当前数量#=0; */
    set v_curr_qty=0;

    /* set @期初数量#=0; */
    set v_begin_qty=0;

    /* set @冻结数量#=0; */
    set v_frozen_qty=0;

    /* set @解冻数量#=0; */
    set v_unfroz_qty=0;

    /* set @指令冻结数量#=0; */
    set v_comm_frozen_qty=0;

    /* set @指令解冻数量#=0; */
    set v_comm_unfroz_qty=0;

    /* set @指令占用数量#=0; */
    set v_comm_capt_qty=0;

    /* set @指令释放数量#=0; */
    set v_comm_releas_qty=0;

    /* set @交易冻结数量#=0; */
    set v_trade_frozen_qty=0;

    /* set @交易解冻数量#=0; */
    set v_trade_unfroz_qty=0;

    /* set @交易占用数量#=0; */
    set v_trade_capt_qty=0;

    /* set @交易释放数量#=0; */
    set v_trade_releas_qty=0;

    /* set @成交释放数量#=0; */
    set v_strike_releas_qty=0;

    /* set @老仓指令占用数量#=0; */
    set v_pre_comm_capt_qty=0;

    /* set @今仓指令占用数量#=0; */
    set v_today_comm_capt_qty=0;

    /* set @老仓交易占用数量#=0; */
    set v_old_trade_capt_qty=0;

    /* set @今仓交易占用数量#=0; */
    set v_today_trade_capt_qty=0;

    /* set @老仓成交占用数量#=0; */
    set v_pre_strike_capt_qty=0;

    /* set @今仓成交占用数量#=0; */
    set v_today_strike_capt_qty=0;

    /* set @应收保证金#=0; */
    set v_rece_margin=0;

    /* set @实现盈亏#=0; */
    set v_realize_pandl=0;

    /* set @平仓盈亏#=0; */
    set v_close_pandl=0;

    /* set @开仓金额#=0; */
    set v_open_amount=0;
    #开仓处理

    /* if @开平方向# = 《开平方向-开仓》 then */
    if v_contrc_dir = 1 then

        /* set @指令释放数量#=@指令变动数量#; */
        set v_comm_releas_qty=v_comm_occur_qty;

        /* set @交易释放数量#=@交易变动数量#; */
        set v_trade_releas_qty=v_trade_occur_qty;

      /* [插入重复更新][交易期货_账户_交易组业务持仓表][字段][字段变量][{指令释放数量}={指令释放数量} + @指令释放数量#,{交易释放数量}={交易释放数量}+@交易释放数量#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#][1][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfuac_exgp_busi_posi (
          create_date, create_time, update_date, 
          update_time, update_times, co_no, pd_no, 
          exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
          futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
          lngsht_type, hedge_type, comb_code, begin_qty, 
          curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
          comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
          trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
          pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
          pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
          realize_pandl, close_pandl, open_amount) 
      values(
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_co_no, v_pd_no, 
          v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
          v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
          v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
          v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
          v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
          v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
          v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
          v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
          v_realize_pandl, v_close_pandl, v_open_amount) 
      ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, comm_releas_qty=comm_releas_qty + v_comm_releas_qty,trade_releas_qty=trade_releas_qty+v_trade_releas_qty;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.2.12.exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(1,"#",v_mysql_message);
          else
              SET v_error_info = 1;
          end if;
          leave label_pro;
      end if;


      /* [插入重复更新][交易期货_账户_资产账户业务持仓表][字段][字段变量][{指令释放数量}={指令释放数量} + @指令释放数量#,{交易释放数量}={交易释放数量}+@交易释放数量#][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#][1][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfuac_asac_busi_posi (
          create_date, create_time, update_date, 
          update_time, update_times, co_no, pd_no, 
          asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
          contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
          hedge_type, comb_code, begin_qty, curr_qty, 
          frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
          comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
          trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
          today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
          today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
          close_pandl, open_amount) 
      values(
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_co_no, v_pd_no, 
          v_asset_acco_no, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
          v_contrc_code_no, v_contrc_type, v_contrc_unit, v_lngsht_type, 
          v_hedge_type, v_comb_code, v_begin_qty, v_curr_qty, 
          v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
          v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
          v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, v_pre_comm_capt_qty, 
          v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, v_pre_strike_capt_qty, 
          v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, v_realize_pandl, 
          v_close_pandl, v_open_amount) 
      ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, comm_releas_qty=comm_releas_qty + v_comm_releas_qty,trade_releas_qty=trade_releas_qty+v_trade_releas_qty;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.2.12.asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(1,"#",v_mysql_message);
          else
              SET v_error_info = 1;
          end if;
          leave label_pro;
      end if;

    else
      #上期所分平仓和平今仓，要分开进行处理

      /* if @市场编号# = 《市场编号-上海商品期货交易所》 then */
      if v_exch_no = 12 then

        /* if @开平方向# = 《开平方向-平仓》 then */
        if v_contrc_dir = 2 then

          /* set @老仓指令占用数量#=@指令变动数量#; */
          set v_pre_comm_capt_qty=v_comm_occur_qty;

          /* set @老仓交易占用数量#=@交易变动数量#; */
          set v_old_trade_capt_qty=v_trade_occur_qty;

          /* [插入重复更新][交易期货_账户_交易组业务持仓表][字段][字段变量][{老仓指令占用数量}={老仓指令占用数量}+@老仓指令占用数量#,{老仓交易占用数量}={老仓交易占用数量}+@老仓交易占用数量#][2][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_tdfutu.tb_tdfuac_exgp_busi_posi (
              create_date, create_time, update_date, 
              update_time, update_times, co_no, pd_no, 
              exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
              futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
              lngsht_type, hedge_type, comb_code, begin_qty, 
              curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
              comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
              trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
              pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
              pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
              realize_pandl, close_pandl, open_amount) 
          values(
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_co_no, v_pd_no, 
              v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
              v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
              v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
              v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
              v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
              v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
              v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
              v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
              v_realize_pandl, v_close_pandl, v_open_amount) 
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_comm_capt_qty=pre_comm_capt_qty+v_pre_comm_capt_qty,old_trade_capt_qty=old_trade_capt_qty+v_old_trade_capt_qty;
          if v_error_code = "1" then
                      
              SET v_error_code = "tdfutuA.2.12.2";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
              end if;
              leave label_pro;
          end if;


          /* [插入重复更新][交易期货_账户_资产账户业务持仓表][字段][字段变量][{老仓指令占用数量}={老仓指令占用数量}+@老仓指令占用数量#,{老仓交易占用数量}={老仓交易占用数量}+@老仓交易占用数量#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_tdfutu.tb_tdfuac_asac_busi_posi (
              create_date, create_time, update_date, 
              update_time, update_times, co_no, pd_no, 
              asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
              contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
              hedge_type, comb_code, begin_qty, curr_qty, 
              frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
              comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
              trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
              today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
              today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
              close_pandl, open_amount) 
          values(
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_co_no, v_pd_no, 
              v_asset_acco_no, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
              v_contrc_code_no, v_contrc_type, v_contrc_unit, v_lngsht_type, 
              v_hedge_type, v_comb_code, v_begin_qty, v_curr_qty, 
              v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
              v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
              v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, v_pre_comm_capt_qty, 
              v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, v_pre_strike_capt_qty, 
              v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, v_realize_pandl, 
              v_close_pandl, v_open_amount) 
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_comm_capt_qty=pre_comm_capt_qty+v_pre_comm_capt_qty,old_trade_capt_qty=old_trade_capt_qty+v_old_trade_capt_qty;
          if v_error_code = "1" then
                      
              SET v_error_code = "tdfutuA.2.12.2";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
              end if;
              leave label_pro;
          end if;

        else

          /* set @今仓指令占用数量#=@指令变动数量#; */
          set v_today_comm_capt_qty=v_comm_occur_qty;

          /* set @今仓交易占用数量#=@交易变动数量#; */
          set v_today_trade_capt_qty=v_trade_occur_qty;

          /* [插入重复更新][交易期货_账户_交易组业务持仓表][字段][字段变量][{今仓指令占用数量}={今仓指令占用数量}+@今仓指令占用数量#,{今仓交易占用数量}={今仓交易占用数量}+@今仓交易占用数量#][2][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_tdfutu.tb_tdfuac_exgp_busi_posi (
              create_date, create_time, update_date, 
              update_time, update_times, co_no, pd_no, 
              exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
              futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
              lngsht_type, hedge_type, comb_code, begin_qty, 
              curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
              comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
              trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
              pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
              pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
              realize_pandl, close_pandl, open_amount) 
          values(
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_co_no, v_pd_no, 
              v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
              v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
              v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
              v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
              v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
              v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
              v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
              v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
              v_realize_pandl, v_close_pandl, v_open_amount) 
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, today_comm_capt_qty=today_comm_capt_qty+v_today_comm_capt_qty,today_trade_capt_qty=today_trade_capt_qty+v_today_trade_capt_qty;
          if v_error_code = "1" then
                      
              SET v_error_code = "tdfutuA.2.12.2";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
              end if;
              leave label_pro;
          end if;


          /* [插入重复更新][交易期货_账户_资产账户业务持仓表][字段][字段变量][{今仓指令占用数量}={今仓指令占用数量}+@今仓指令占用数量#,{今仓交易占用数量}={今仓交易占用数量}+@今仓交易占用数量#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_tdfutu.tb_tdfuac_asac_busi_posi (
              create_date, create_time, update_date, 
              update_time, update_times, co_no, pd_no, 
              asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
              contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
              hedge_type, comb_code, begin_qty, curr_qty, 
              frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
              comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
              trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
              today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
              today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
              close_pandl, open_amount) 
          values(
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_co_no, v_pd_no, 
              v_asset_acco_no, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
              v_contrc_code_no, v_contrc_type, v_contrc_unit, v_lngsht_type, 
              v_hedge_type, v_comb_code, v_begin_qty, v_curr_qty, 
              v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
              v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
              v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, v_pre_comm_capt_qty, 
              v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, v_pre_strike_capt_qty, 
              v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, v_realize_pandl, 
              v_close_pandl, v_open_amount) 
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, today_comm_capt_qty=today_comm_capt_qty+v_today_comm_capt_qty,today_trade_capt_qty=today_trade_capt_qty+v_today_trade_capt_qty;
          if v_error_code = "1" then
                      
              SET v_error_code = "tdfutuA.2.12.2";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
              end if;
              leave label_pro;
          end if;

        end if;
      else
        #上期所之外的商品期货交易所直接进行平仓处理

        /* [获取表记录变量语句][交易期货_账户_交易组业务持仓表][{记录序号}][@记录序号#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#] */
        select row_id into v_row_id from db_tdfutu.tb_tdfuac_exgp_busi_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type limit 1;

        #看交易库中是否含有该持仓记录,没有持仓记录则直接平老仓

        /* if @记录序号# = 0 then */
        if v_row_id = 0 then

          /* set @老仓交易占用数量#=@交易变动数量#; */
          set v_old_trade_capt_qty=v_trade_occur_qty;

          /* set @老仓指令占用数量#=@指令变动数量#; */
          set v_pre_comm_capt_qty=v_comm_occur_qty;

          /* [插入重复更新][交易期货_账户_交易组业务持仓表][字段][字段变量][{老仓指令占用数量}={老仓指令占用数量}+@老仓指令占用数量#,{老仓交易占用数量}={老仓交易占用数量}+@老仓交易占用数量#][2][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_tdfutu.tb_tdfuac_exgp_busi_posi (
              create_date, create_time, update_date, 
              update_time, update_times, co_no, pd_no, 
              exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
              futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
              lngsht_type, hedge_type, comb_code, begin_qty, 
              curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
              comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
              trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
              pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
              pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
              realize_pandl, close_pandl, open_amount) 
          values(
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_co_no, v_pd_no, 
              v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
              v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
              v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
              v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
              v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
              v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
              v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
              v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
              v_realize_pandl, v_close_pandl, v_open_amount) 
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_comm_capt_qty=pre_comm_capt_qty+v_pre_comm_capt_qty,old_trade_capt_qty=old_trade_capt_qty+v_old_trade_capt_qty;
          if v_error_code = "1" then
                      
              SET v_error_code = "tdfutuA.2.12.2";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
              end if;
              leave label_pro;
          end if;


          /* [插入重复更新][交易期货_账户_资产账户业务持仓表][字段][字段变量][{老仓指令占用数量}={老仓指令占用数量}+@老仓指令占用数量#,{老仓交易占用数量}={老仓交易占用数量}+@老仓交易占用数量#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_tdfutu.tb_tdfuac_asac_busi_posi (
              create_date, create_time, update_date, 
              update_time, update_times, co_no, pd_no, 
              asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
              contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
              hedge_type, comb_code, begin_qty, curr_qty, 
              frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
              comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
              trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
              today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
              today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
              close_pandl, open_amount) 
          values(
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_co_no, v_pd_no, 
              v_asset_acco_no, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
              v_contrc_code_no, v_contrc_type, v_contrc_unit, v_lngsht_type, 
              v_hedge_type, v_comb_code, v_begin_qty, v_curr_qty, 
              v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
              v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
              v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, v_pre_comm_capt_qty, 
              v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, v_pre_strike_capt_qty, 
              v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, v_realize_pandl, 
              v_close_pandl, v_open_amount) 
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_comm_capt_qty=pre_comm_capt_qty+v_pre_comm_capt_qty,old_trade_capt_qty=old_trade_capt_qty+v_old_trade_capt_qty;
          if v_error_code = "1" then
                      
              SET v_error_code = "tdfutuA.2.12.2";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
              end if;
              leave label_pro;
          end if;

        else

          /* [锁定获取表记录变量][交易期货_账户_交易组业务持仓表][{老仓指令占用数量},{今仓指令占用数量},{老仓交易占用数量},{今仓交易占用数量},{老仓成交占用数量},{今仓成交占用数量}][@老仓指令占用数量#,@今仓指令占用数量#,@临时_老仓交易占用数量#,@临时_今仓交易占用数量#,@临时_老仓成交占用数量#,@今仓成交占用数量#][{记录序号}=@记录序号#][4][@记录序号#] */
          select pre_comm_capt_qty,today_comm_capt_qty,old_trade_capt_qty,today_trade_capt_qty,pre_strike_capt_qty,today_strike_capt_qty into v_pre_comm_capt_qty,v_today_comm_capt_qty,v_tmp_old_trade_capt_qty,v_tmp_today_trade_capt_qty,v_tmp_pre_strike_capt_qty,v_today_strike_capt_qty from db_tdfutu.tb_tdfuac_exgp_busi_posi where row_id=v_row_id limit 1 for update;
          if FOUND_ROWS() = 0 then
                      
              SET v_error_code = "tdfutuA.2.12.4";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
              else
                  SET v_error_info = concat("记录序号=",v_row_id);
              end if;
              leave label_pro;
          end if;


          /* if @交易变动数量#>0 then */
          if v_trade_occur_qty>0 then
           #先平老仓,再平今仓

            /* if @交易变动数量#>@交易组可用数量#-@临时_老仓交易占用数量#-@临时_老仓成交占用数量# then */
            if v_trade_occur_qty>v_exgp_avail_qty-v_tmp_old_trade_capt_qty-v_tmp_pre_strike_capt_qty then

              /* set @老仓交易占用数量#=@交易组可用数量#-@临时_老仓交易占用数量#-@临时_老仓成交占用数量#; */
              set v_old_trade_capt_qty=v_exgp_avail_qty-v_tmp_old_trade_capt_qty-v_tmp_pre_strike_capt_qty;

              /* set @今仓交易占用数量#=@交易变动数量#-@老仓交易占用数量#; */
              set v_today_trade_capt_qty=v_trade_occur_qty-v_old_trade_capt_qty;

              /* [插入重复更新][交易期货_账户_交易组业务持仓表][字段][字段变量][{老仓交易占用数量}={老仓交易占用数量}+@老仓交易占用数量#,{今仓交易占用数量}={今仓交易占用数量}+@今仓交易占用数量#][2][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_tdfutu.tb_tdfuac_exgp_busi_posi (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
                  futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
                  lngsht_type, hedge_type, comb_code, begin_qty, 
                  curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
                  comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
                  trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
                  pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
                  pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
                  realize_pandl, close_pandl, open_amount) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
                  v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
                  v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
                  v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
                  v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
                  v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
                  v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
                  v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
                  v_realize_pandl, v_close_pandl, v_open_amount) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, old_trade_capt_qty=old_trade_capt_qty+v_old_trade_capt_qty,today_trade_capt_qty=today_trade_capt_qty+v_today_trade_capt_qty;
              if v_error_code = "1" then
                          
                  SET v_error_code = "tdfutuA.2.12.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
                  end if;
                  leave label_pro;
              end if;


              /* [插入重复更新][交易期货_账户_资产账户业务持仓表][字段][字段变量][{老仓交易占用数量}={老仓交易占用数量}+@老仓交易占用数量#,{今仓交易占用数量}={今仓交易占用数量}+@今仓交易占用数量#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_tdfutu.tb_tdfuac_asac_busi_posi (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
                  contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
                  hedge_type, comb_code, begin_qty, curr_qty, 
                  frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
                  comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
                  trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
                  today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
                  today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
                  close_pandl, open_amount) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_asset_acco_no, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
                  v_contrc_code_no, v_contrc_type, v_contrc_unit, v_lngsht_type, 
                  v_hedge_type, v_comb_code, v_begin_qty, v_curr_qty, 
                  v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
                  v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
                  v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, v_pre_comm_capt_qty, 
                  v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, v_pre_strike_capt_qty, 
                  v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, v_realize_pandl, 
                  v_close_pandl, v_open_amount) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, old_trade_capt_qty=old_trade_capt_qty+v_old_trade_capt_qty,today_trade_capt_qty=today_trade_capt_qty+v_today_trade_capt_qty;
              if v_error_code = "1" then
                          
                  SET v_error_code = "tdfutuA.2.12.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
                  end if;
                  leave label_pro;
              end if;

            #平老仓
            else

              /* set @老仓交易占用数量#=@交易变动数量#; */
              set v_old_trade_capt_qty=v_trade_occur_qty;

              /* [插入重复更新][交易期货_账户_交易组业务持仓表][字段][字段变量][{老仓交易占用数量}={老仓交易占用数量}+@老仓交易占用数量#][2][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_tdfutu.tb_tdfuac_exgp_busi_posi (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
                  futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
                  lngsht_type, hedge_type, comb_code, begin_qty, 
                  curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
                  comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
                  trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
                  pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
                  pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
                  realize_pandl, close_pandl, open_amount) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
                  v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
                  v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
                  v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
                  v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
                  v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
                  v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
                  v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
                  v_realize_pandl, v_close_pandl, v_open_amount) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, old_trade_capt_qty=old_trade_capt_qty+v_old_trade_capt_qty;
              if v_error_code = "1" then
                          
                  SET v_error_code = "tdfutuA.2.12.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
                  end if;
                  leave label_pro;
              end if;


              /* [插入重复更新][交易期货_账户_资产账户业务持仓表][字段][字段变量][{老仓交易占用数量}={老仓交易占用数量}+@老仓交易占用数量#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_tdfutu.tb_tdfuac_asac_busi_posi (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
                  contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
                  hedge_type, comb_code, begin_qty, curr_qty, 
                  frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
                  comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
                  trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
                  today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
                  today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
                  close_pandl, open_amount) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_asset_acco_no, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
                  v_contrc_code_no, v_contrc_type, v_contrc_unit, v_lngsht_type, 
                  v_hedge_type, v_comb_code, v_begin_qty, v_curr_qty, 
                  v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
                  v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
                  v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, v_pre_comm_capt_qty, 
                  v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, v_pre_strike_capt_qty, 
                  v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, v_realize_pandl, 
                  v_close_pandl, v_open_amount) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, old_trade_capt_qty=old_trade_capt_qty+v_old_trade_capt_qty;
              if v_error_code = "1" then
                          
                  SET v_error_code = "tdfutuA.2.12.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
                  end if;
                  leave label_pro;
              end if;

            end if;
          #交易变动数量<0的情况发生在撤单过程
          #优先撤今仓，今天的仓撤完后，再撤老仓(先撤老仓，再撤今仓，补单会存在问题：老仓占用数量为0，今仓占用数量>0)

          /* elseif @交易变动数量#<0 then */
          elseif v_trade_occur_qty<0 then

            /* if @临时_今仓交易占用数量#+@交易变动数量# < 0  then */
            if v_tmp_today_trade_capt_qty+v_trade_occur_qty < 0  then
            #这种情况  必定在下单的时候有平老仓和平今仓

              /* set @今仓交易占用数量# = -1 * @临时_今仓交易占用数量#; */
              set v_today_trade_capt_qty = -1 * v_tmp_today_trade_capt_qty;

              /* set @老仓交易占用数量# = @交易变动数量# - @今仓交易占用数量#; */
              set v_old_trade_capt_qty = v_trade_occur_qty - v_today_trade_capt_qty;

              /* [插入重复更新][交易期货_账户_交易组业务持仓表][字段][字段变量][{老仓交易占用数量}={老仓交易占用数量}+@老仓交易占用数量#,{今仓交易占用数量}={今仓交易占用数量}+@今仓交易占用数量#][2][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_tdfutu.tb_tdfuac_exgp_busi_posi (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
                  futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
                  lngsht_type, hedge_type, comb_code, begin_qty, 
                  curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
                  comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
                  trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
                  pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
                  pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
                  realize_pandl, close_pandl, open_amount) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
                  v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
                  v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
                  v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
                  v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
                  v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
                  v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
                  v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
                  v_realize_pandl, v_close_pandl, v_open_amount) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, old_trade_capt_qty=old_trade_capt_qty+v_old_trade_capt_qty,today_trade_capt_qty=today_trade_capt_qty+v_today_trade_capt_qty;
              if v_error_code = "1" then
                          
                  SET v_error_code = "tdfutuA.2.12.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
                  end if;
                  leave label_pro;
              end if;


              /* [插入重复更新][交易期货_账户_资产账户业务持仓表][字段][字段变量][{老仓交易占用数量}={老仓交易占用数量}+@老仓交易占用数量#,{今仓交易占用数量}={今仓交易占用数量}+@今仓交易占用数量#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_tdfutu.tb_tdfuac_asac_busi_posi (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
                  contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
                  hedge_type, comb_code, begin_qty, curr_qty, 
                  frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
                  comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
                  trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
                  today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
                  today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
                  close_pandl, open_amount) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_asset_acco_no, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
                  v_contrc_code_no, v_contrc_type, v_contrc_unit, v_lngsht_type, 
                  v_hedge_type, v_comb_code, v_begin_qty, v_curr_qty, 
                  v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
                  v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
                  v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, v_pre_comm_capt_qty, 
                  v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, v_pre_strike_capt_qty, 
                  v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, v_realize_pandl, 
                  v_close_pandl, v_open_amount) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, old_trade_capt_qty=old_trade_capt_qty+v_old_trade_capt_qty,today_trade_capt_qty=today_trade_capt_qty+v_today_trade_capt_qty;
              if v_error_code = "1" then
                          
                  SET v_error_code = "tdfutuA.2.12.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
                  end if;
                  leave label_pro;
              end if;

            else

              /* set @今仓交易占用数量#=@交易变动数量#; */
              set v_today_trade_capt_qty=v_trade_occur_qty;

              /* [插入重复更新][交易期货_账户_交易组业务持仓表][字段][字段变量][{今仓交易占用数量}={今仓交易占用数量}+@今仓交易占用数量#][2][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_tdfutu.tb_tdfuac_exgp_busi_posi (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
                  futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
                  lngsht_type, hedge_type, comb_code, begin_qty, 
                  curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
                  comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
                  trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
                  pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
                  pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
                  realize_pandl, close_pandl, open_amount) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
                  v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
                  v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
                  v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
                  v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
                  v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
                  v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
                  v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
                  v_realize_pandl, v_close_pandl, v_open_amount) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, today_trade_capt_qty=today_trade_capt_qty+v_today_trade_capt_qty;
              if v_error_code = "1" then
                          
                  SET v_error_code = "tdfutuA.2.12.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
                  end if;
                  leave label_pro;
              end if;


              /* [插入重复更新][交易期货_账户_资产账户业务持仓表][字段][字段变量][{今仓交易占用数量}={今仓交易占用数量}+@今仓交易占用数量#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_tdfutu.tb_tdfuac_asac_busi_posi (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
                  contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
                  hedge_type, comb_code, begin_qty, curr_qty, 
                  frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
                  comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
                  trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
                  today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
                  today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
                  close_pandl, open_amount) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_asset_acco_no, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
                  v_contrc_code_no, v_contrc_type, v_contrc_unit, v_lngsht_type, 
                  v_hedge_type, v_comb_code, v_begin_qty, v_curr_qty, 
                  v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
                  v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
                  v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, v_pre_comm_capt_qty, 
                  v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, v_pre_strike_capt_qty, 
                  v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, v_realize_pandl, 
                  v_close_pandl, v_open_amount) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, today_trade_capt_qty=today_trade_capt_qty+v_today_trade_capt_qty;
              if v_error_code = "1" then
                          
                  SET v_error_code = "tdfutuA.2.12.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
                  end if;
                  leave label_pro;
              end if;

            end if;
          end if;

          /* if @指令变动数量#>0 then */
          if v_comm_occur_qty>0 then
           #先平老仓,再平今仓

            /* if @指令变动数量#>@交易组可用数量#-@老仓指令占用数量#-@临时_老仓交易占用数量#-@临时_老仓成交占用数量# then */
            if v_comm_occur_qty>v_exgp_avail_qty-v_pre_comm_capt_qty-v_tmp_old_trade_capt_qty-v_tmp_pre_strike_capt_qty then

              /* set @老仓指令占用数量#=@交易组可用数量#-@老仓指令占用数量#-@临时_老仓交易占用数量#-@临时_老仓成交占用数量#; */
              set v_pre_comm_capt_qty=v_exgp_avail_qty-v_pre_comm_capt_qty-v_tmp_old_trade_capt_qty-v_tmp_pre_strike_capt_qty;

              /* set @今仓指令占用数量#=@指令变动数量#-@老仓指令占用数量#; */
              set v_today_comm_capt_qty=v_comm_occur_qty-v_pre_comm_capt_qty;

              /* [插入重复更新][交易期货_账户_交易组业务持仓表][字段][字段变量][{老仓指令占用数量}={老仓指令占用数量}+@老仓指令占用数量#,{今仓指令占用数量}={今仓指令占用数量}+@今仓指令占用数量#][2][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_tdfutu.tb_tdfuac_exgp_busi_posi (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
                  futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
                  lngsht_type, hedge_type, comb_code, begin_qty, 
                  curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
                  comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
                  trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
                  pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
                  pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
                  realize_pandl, close_pandl, open_amount) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
                  v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
                  v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
                  v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
                  v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
                  v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
                  v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
                  v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
                  v_realize_pandl, v_close_pandl, v_open_amount) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_comm_capt_qty=pre_comm_capt_qty+v_pre_comm_capt_qty,today_comm_capt_qty=today_comm_capt_qty+v_today_comm_capt_qty;
              if v_error_code = "1" then
                          
                  SET v_error_code = "tdfutuA.2.12.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
                  end if;
                  leave label_pro;
              end if;


              /* [插入重复更新][交易期货_账户_资产账户业务持仓表][字段][字段变量][{老仓指令占用数量}={老仓指令占用数量}+@老仓指令占用数量#,{今仓指令占用数量}={今仓指令占用数量}+@今仓指令占用数量#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_tdfutu.tb_tdfuac_asac_busi_posi (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
                  contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
                  hedge_type, comb_code, begin_qty, curr_qty, 
                  frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
                  comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
                  trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
                  today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
                  today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
                  close_pandl, open_amount) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_asset_acco_no, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
                  v_contrc_code_no, v_contrc_type, v_contrc_unit, v_lngsht_type, 
                  v_hedge_type, v_comb_code, v_begin_qty, v_curr_qty, 
                  v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
                  v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
                  v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, v_pre_comm_capt_qty, 
                  v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, v_pre_strike_capt_qty, 
                  v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, v_realize_pandl, 
                  v_close_pandl, v_open_amount) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_comm_capt_qty=pre_comm_capt_qty+v_pre_comm_capt_qty,today_comm_capt_qty=today_comm_capt_qty+v_today_comm_capt_qty;
              if v_error_code = "1" then
                          
                  SET v_error_code = "tdfutuA.2.12.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
                  end if;
                  leave label_pro;
              end if;

            #平老仓
            else

              /* set @老仓指令占用数量#=@指令变动数量#; */
              set v_pre_comm_capt_qty=v_comm_occur_qty;

              /* [插入重复更新][交易期货_账户_交易组业务持仓表][字段][字段变量][{老仓指令占用数量}={老仓指令占用数量}+@老仓指令占用数量#][2][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_tdfutu.tb_tdfuac_exgp_busi_posi (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
                  futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
                  lngsht_type, hedge_type, comb_code, begin_qty, 
                  curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
                  comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
                  trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
                  pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
                  pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
                  realize_pandl, close_pandl, open_amount) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
                  v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
                  v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
                  v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
                  v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
                  v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
                  v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
                  v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
                  v_realize_pandl, v_close_pandl, v_open_amount) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_comm_capt_qty=pre_comm_capt_qty+v_pre_comm_capt_qty;
              if v_error_code = "1" then
                          
                  SET v_error_code = "tdfutuA.2.12.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
                  end if;
                  leave label_pro;
              end if;


              /* [插入重复更新][交易期货_账户_资产账户业务持仓表][字段][字段变量][{老仓指令占用数量}={老仓指令占用数量}+@老仓指令占用数量#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_tdfutu.tb_tdfuac_asac_busi_posi (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
                  contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
                  hedge_type, comb_code, begin_qty, curr_qty, 
                  frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
                  comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
                  trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
                  today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
                  today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
                  close_pandl, open_amount) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_asset_acco_no, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
                  v_contrc_code_no, v_contrc_type, v_contrc_unit, v_lngsht_type, 
                  v_hedge_type, v_comb_code, v_begin_qty, v_curr_qty, 
                  v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
                  v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
                  v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, v_pre_comm_capt_qty, 
                  v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, v_pre_strike_capt_qty, 
                  v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, v_realize_pandl, 
                  v_close_pandl, v_open_amount) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_comm_capt_qty=pre_comm_capt_qty+v_pre_comm_capt_qty;
              if v_error_code = "1" then
                          
                  SET v_error_code = "tdfutuA.2.12.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
                  end if;
                  leave label_pro;
              end if;

            end if;
          #指令变动数量<0的情况发生在指令撤销过程

          /* elseif @指令变动数量#<0 then */
          elseif v_comm_occur_qty<0 then

            /* if @今仓指令占用数量#+@指令变动数量# < 0  then */
            if v_today_comm_capt_qty+v_comm_occur_qty < 0  then
            #这种情况  必定在下单的时候有平老仓和平今仓

              /* set @今仓指令占用数量# = -1 * @今仓指令占用数量#; */
              set v_today_comm_capt_qty = -1 * v_today_comm_capt_qty;

              /* set @老仓指令占用数量# = @指令变动数量# - @今仓指令占用数量#; */
              set v_pre_comm_capt_qty = v_comm_occur_qty - v_today_comm_capt_qty;

              /* [插入重复更新][交易期货_账户_交易组业务持仓表][字段][字段变量][{老仓指令占用数量}={老仓指令占用数量}+@老仓指令占用数量#,{今仓指令占用数量}={今仓指令占用数量}+@今仓指令占用数量#][2][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_tdfutu.tb_tdfuac_exgp_busi_posi (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
                  futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
                  lngsht_type, hedge_type, comb_code, begin_qty, 
                  curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
                  comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
                  trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
                  pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
                  pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
                  realize_pandl, close_pandl, open_amount) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
                  v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
                  v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
                  v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
                  v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
                  v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
                  v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
                  v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
                  v_realize_pandl, v_close_pandl, v_open_amount) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_comm_capt_qty=pre_comm_capt_qty+v_pre_comm_capt_qty,today_comm_capt_qty=today_comm_capt_qty+v_today_comm_capt_qty;
              if v_error_code = "1" then
                          
                  SET v_error_code = "tdfutuA.2.12.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
                  end if;
                  leave label_pro;
              end if;


              /* [插入重复更新][交易期货_账户_资产账户业务持仓表][字段][字段变量][{老仓指令占用数量}={老仓指令占用数量}+@老仓指令占用数量#,{今仓指令占用数量}={今仓指令占用数量}+@今仓指令占用数量#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_tdfutu.tb_tdfuac_asac_busi_posi (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
                  contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
                  hedge_type, comb_code, begin_qty, curr_qty, 
                  frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
                  comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
                  trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
                  today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
                  today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
                  close_pandl, open_amount) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_asset_acco_no, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
                  v_contrc_code_no, v_contrc_type, v_contrc_unit, v_lngsht_type, 
                  v_hedge_type, v_comb_code, v_begin_qty, v_curr_qty, 
                  v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
                  v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
                  v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, v_pre_comm_capt_qty, 
                  v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, v_pre_strike_capt_qty, 
                  v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, v_realize_pandl, 
                  v_close_pandl, v_open_amount) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_comm_capt_qty=pre_comm_capt_qty+v_pre_comm_capt_qty,today_comm_capt_qty=today_comm_capt_qty+v_today_comm_capt_qty;
              if v_error_code = "1" then
                          
                  SET v_error_code = "tdfutuA.2.12.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
                  end if;
                  leave label_pro;
              end if;

            else

              /* set @今仓指令占用数量#=@指令变动数量#; */
              set v_today_comm_capt_qty=v_comm_occur_qty;

              /* [插入重复更新][交易期货_账户_交易组业务持仓表][字段][字段变量][{今仓指令占用数量}={今仓指令占用数量}+@今仓指令占用数量#][2][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_tdfutu.tb_tdfuac_exgp_busi_posi (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
                  futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
                  lngsht_type, hedge_type, comb_code, begin_qty, 
                  curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
                  comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
                  trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
                  pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
                  pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
                  realize_pandl, close_pandl, open_amount) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
                  v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
                  v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
                  v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
                  v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
                  v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
                  v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
                  v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
                  v_realize_pandl, v_close_pandl, v_open_amount) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, today_comm_capt_qty=today_comm_capt_qty+v_today_comm_capt_qty;
              if v_error_code = "1" then
                          
                  SET v_error_code = "tdfutuA.2.12.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
                  end if;
                  leave label_pro;
              end if;


              /* [插入重复更新][交易期货_账户_资产账户业务持仓表][字段][字段变量][{今仓指令占用数量}={今仓指令占用数量}+@今仓指令占用数量#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_tdfutu.tb_tdfuac_asac_busi_posi (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
                  contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
                  hedge_type, comb_code, begin_qty, curr_qty, 
                  frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
                  comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
                  trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
                  today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
                  today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
                  close_pandl, open_amount) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_asset_acco_no, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
                  v_contrc_code_no, v_contrc_type, v_contrc_unit, v_lngsht_type, 
                  v_hedge_type, v_comb_code, v_begin_qty, v_curr_qty, 
                  v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
                  v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
                  v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, v_pre_comm_capt_qty, 
                  v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, v_pre_strike_capt_qty, 
                  v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, v_realize_pandl, 
                  v_close_pandl, v_open_amount) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, today_comm_capt_qty=today_comm_capt_qty+v_today_comm_capt_qty;
              if v_error_code = "1" then
                          
                  SET v_error_code = "tdfutuA.2.12.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
                  end if;
                  leave label_pro;
              end if;

            end if;
          end if;
        end if;
      end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_更新成交资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_UpdateStrikeCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_UpdateStrikeCapit(
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
    IN p_exch_crncy_type varchar(3),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_invest_type int,
    IN p_lngsht_type int,
    IN p_contrc_dir int,
    IN p_order_dir int,
    IN p_strike_occur_amt decimal(18,4),
    IN p_strike_fee decimal(18,4),
    IN p_trade_occur_amt decimal(18,4),
    IN p_trade_fee decimal(18,4),
    IN p_close_pandl decimal(18,4),
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
    declare v_exch_crncy_type varchar(3);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_invest_type int;
    declare v_lngsht_type int;
    declare v_contrc_dir int;
    declare v_order_dir int;
    declare v_strike_occur_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_unfroz_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_comm_releas_amt decimal(18,4);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_marked_pandl decimal(18,4);
    declare v_capt_margin decimal(18,4);
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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_invest_type = p_invest_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_contrc_dir = p_contrc_dir;
    SET v_order_dir = p_order_dir;
    SET v_strike_occur_amt = p_strike_occur_amt;
    SET v_strike_fee = p_strike_fee;
    SET v_trade_occur_amt = p_trade_occur_amt;
    SET v_trade_fee = p_trade_fee;
    SET v_close_pandl = p_close_pandl;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_unfroz_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_comm_releas_amt = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_trade_capt_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_capt_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_marked_pandl = 0;
    SET v_capt_margin = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @期初金额#=0; */
    set v_begin_amt=0;

    /* set @当前金额#=0; */
    set v_curr_amt=0;

    /* set @冻结金额#=0; */
    set v_frozen_amt=0;

    /* set @解冻金额#=0; */
    set v_unfroz_amt=0;

    /* set @指令冻结金额#=0; */
    set v_comm_frozen_amt=0;

    /* set @指令解冻金额#=0; */
    set v_comm_unfroz_amt=0;

    /* set @指令占用金额#=0; */
    set v_comm_capt_amt=0;

    /* set @指令释放金额#=0; */
    set v_comm_releas_amt=0;

    /* set @指令变动金额#=0; */
    set v_comm_occur_amt=0;

    /* set @指令变动数量#=0; */
    set v_comm_occur_qty=0;

    /* set @交易占用金额#=0; */
    set v_trade_capt_amt=0;

    /* set @交易释放金额#=0; */
    set v_trade_releas_amt=0;

    /* set @成交占用金额#=0; */
    set v_strike_capt_amt=0;

    /* set @成交释放金额#=0; */
    set v_strike_releas_amt=0;

    /* set @盯市盈亏#=0; */
    set v_marked_pandl=0;

    /* set @占用保证金#=0; */
    set v_capt_margin=0;

    /* if @开平方向#=《开平方向-开仓》 then */
    if v_contrc_dir=1 then

      /* set @交易占用金额#=@交易变动金额#; */
      set v_trade_capt_amt=v_trade_occur_amt;

      /* set @成交占用金额#=@成交变动金额#; */
      set v_strike_capt_amt=v_strike_occur_amt;

      /* [插入重复更新][交易期货_账户_交易组业务资金表][字段][字段变量][{交易占用金额}={交易占用金额}+@交易占用金额#,{交易费用}={交易费用}+@交易费用#,{成交占用金额}={成交占用金额}+@成交占用金额#,{成交费用}={成交费用}+@成交费用#][1][@交易组编号#,@资产账户编号#,@交易币种#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfuac_exgp_busi_capit (
          create_date, create_time, update_date, 
          update_time, update_times, co_no, pd_no, 
          exch_group_no, asset_acco_no, exch_crncy_type, begin_amt, 
          curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
          comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_capt_amt, 
          trade_releas_amt, strike_capt_amt, strike_releas_amt, capt_margin, 
          trade_fee, strike_fee, close_pandl, marked_pandl) 
      values(
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_co_no, v_pd_no, 
          v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_begin_amt, 
          v_curr_amt, v_frozen_amt, v_unfroz_amt, v_comm_frozen_amt, 
          v_comm_unfroz_amt, v_comm_capt_amt, v_comm_releas_amt, v_trade_capt_amt, 
          v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt, v_capt_margin, 
          v_trade_fee, v_strike_fee, v_close_pandl, v_marked_pandl) 
      ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, trade_capt_amt=trade_capt_amt+v_trade_capt_amt,trade_fee=trade_fee+v_trade_fee,strike_capt_amt=strike_capt_amt+v_strike_capt_amt,strike_fee=strike_fee+v_strike_fee;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.2.13.1";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type),"#",v_mysql_message);
          else
              SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type);
          end if;
          leave label_pro;
      end if;


      /* [插入重复更新][交易期货_账户_资产账户业务资金表][字段][字段变量][{交易占用金额}={交易占用金额}+@交易占用金额#,{交易费用}={交易费用}+@交易费用#,{成交占用金额}={成交占用金额}+@成交占用金额#,{成交费用}={成交费用}+@成交费用#][1][@资产账户编号#,@交易币种#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfuac_asac_busi_capit (
          create_date, create_time, update_date, 
          update_time, update_times, co_no, pd_no, 
          asset_acco_no, exch_crncy_type, begin_amt, curr_amt, 
          frozen_amt, unfroz_amt, comm_frozen_amt, comm_unfroz_amt, 
          comm_capt_amt, comm_releas_amt, trade_capt_amt, trade_releas_amt, 
          strike_capt_amt, strike_releas_amt, capt_margin, trade_fee, 
          strike_fee, close_pandl, marked_pandl) 
      values(
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_co_no, v_pd_no, 
          v_asset_acco_no, v_exch_crncy_type, v_begin_amt, v_curr_amt, 
          v_frozen_amt, v_unfroz_amt, v_comm_frozen_amt, v_comm_unfroz_amt, 
          v_comm_capt_amt, v_comm_releas_amt, v_trade_capt_amt, v_trade_releas_amt, 
          v_strike_capt_amt, v_strike_releas_amt, v_capt_margin, v_trade_fee, 
          v_strike_fee, v_close_pandl, v_marked_pandl) 
      ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, trade_capt_amt=trade_capt_amt+v_trade_capt_amt,trade_fee=trade_fee+v_trade_fee,strike_capt_amt=strike_capt_amt+v_strike_capt_amt,strike_fee=strike_fee+v_strike_fee;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.2.13.1";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type),"#",v_mysql_message);
          else
              SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type);
          end if;
          leave label_pro;
      end if;

    else
      #set @交易占用金额#=@交易变动金额#;

      /* set @成交释放金额#=@成交变动金额#; */
      set v_strike_releas_amt=v_strike_occur_amt;

      /* [插入重复更新][交易期货_账户_交易组业务资金表][字段][字段变量][{交易费用}={交易费用}+@交易费用#,{成交释放金额}={成交释放金额}+@成交释放金额#,{成交费用}={成交费用}+@成交费用#,{平仓盈亏}={平仓盈亏}+@平仓盈亏#][2][@交易组编号#,@资产账户编号#,@交易币种#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfuac_exgp_busi_capit (
          create_date, create_time, update_date, 
          update_time, update_times, co_no, pd_no, 
          exch_group_no, asset_acco_no, exch_crncy_type, begin_amt, 
          curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
          comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_capt_amt, 
          trade_releas_amt, strike_capt_amt, strike_releas_amt, capt_margin, 
          trade_fee, strike_fee, close_pandl, marked_pandl) 
      values(
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_co_no, v_pd_no, 
          v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_begin_amt, 
          v_curr_amt, v_frozen_amt, v_unfroz_amt, v_comm_frozen_amt, 
          v_comm_unfroz_amt, v_comm_capt_amt, v_comm_releas_amt, v_trade_capt_amt, 
          v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt, v_capt_margin, 
          v_trade_fee, v_strike_fee, v_close_pandl, v_marked_pandl) 
      ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, trade_fee=trade_fee+v_trade_fee,strike_releas_amt=strike_releas_amt+v_strike_releas_amt,strike_fee=strike_fee+v_strike_fee,close_pandl=close_pandl+v_close_pandl;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.2.13.2";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type),"#",v_mysql_message);
          else
              SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type);
          end if;
          leave label_pro;
      end if;


      /* [插入重复更新][交易期货_账户_资产账户业务资金表][字段][字段变量][{交易费用}={交易费用}+@交易费用#,{成交释放金额}={成交释放金额}+@成交释放金额#,{成交费用}={成交费用}+@成交费用#,{平仓盈亏}={平仓盈亏}+@平仓盈亏#][2][@资产账户编号#,@交易币种#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfuac_asac_busi_capit (
          create_date, create_time, update_date, 
          update_time, update_times, co_no, pd_no, 
          asset_acco_no, exch_crncy_type, begin_amt, curr_amt, 
          frozen_amt, unfroz_amt, comm_frozen_amt, comm_unfroz_amt, 
          comm_capt_amt, comm_releas_amt, trade_capt_amt, trade_releas_amt, 
          strike_capt_amt, strike_releas_amt, capt_margin, trade_fee, 
          strike_fee, close_pandl, marked_pandl) 
      values(
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_co_no, v_pd_no, 
          v_asset_acco_no, v_exch_crncy_type, v_begin_amt, v_curr_amt, 
          v_frozen_amt, v_unfroz_amt, v_comm_frozen_amt, v_comm_unfroz_amt, 
          v_comm_capt_amt, v_comm_releas_amt, v_trade_capt_amt, v_trade_releas_amt, 
          v_strike_capt_amt, v_strike_releas_amt, v_capt_margin, v_trade_fee, 
          v_strike_fee, v_close_pandl, v_marked_pandl) 
      ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, trade_fee=trade_fee+v_trade_fee,strike_releas_amt=strike_releas_amt+v_strike_releas_amt,strike_fee=strike_fee+v_strike_fee,close_pandl=close_pandl+v_close_pandl;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.2.13.2";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type),"#",v_mysql_message);
          else
              SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type);
          end if;
          leave label_pro;
      end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_更新成交持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_UpdateStrikePosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_UpdateStrikePosi(
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
    IN p_exch_crncy_type varchar(3),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_lngsht_type int,
    IN p_invest_type int,
    IN p_comb_code varchar(6),
    IN p_strike_no varchar(64),
    IN p_strike_price decimal(16,9),
    IN p_strike_fee decimal(18,4),
    IN p_strike_margin decimal(18,4),
    IN p_pre_settle_price decimal(16,9),
    IN p_strike_amt decimal(18,4),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    IN p_strike_occur_qty decimal(18,2),
    IN p_trade_occur_qty decimal(18,2),
    IN p_exgp_long_rece_margin decimal(18,4),
    IN p_exgp_short_rece_margin decimal(18,4),
    IN p_exgp_long_stock_rece_margin decimal(18,4),
    IN p_exgp_short_stock_rece_margin decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_rece_margin decimal(18,4),
    OUT p_close_pandl decimal(18,4),
    OUT p_detail_posi_id bigint
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
    declare v_exch_crncy_type varchar(3);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_lngsht_type int;
    declare v_invest_type int;
    declare v_comb_code varchar(6);
    declare v_strike_no varchar(64);
    declare v_strike_price decimal(16,9);
    declare v_strike_fee decimal(18,4);
    declare v_strike_margin decimal(18,4);
    declare v_pre_settle_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_strike_occur_qty decimal(18,2);
    declare v_trade_occur_qty decimal(18,2);
    declare v_exgp_long_rece_margin decimal(18,4);
    declare v_exgp_short_rece_margin decimal(18,4);
    declare v_exgp_long_stock_rece_margin decimal(18,4);
    declare v_exgp_short_stock_rece_margin decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_rece_margin decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_detail_posi_id bigint;
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_comm_occur_qty decimal(18,2);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_comm_unfroz_qty decimal(18,2);
    declare v_comm_capt_qty decimal(18,2);
    declare v_comm_releas_qty decimal(18,2);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_trade_unfroz_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_pre_comm_capt_qty decimal(18,2);
    declare v_today_comm_capt_qty decimal(18,2);
    declare v_old_trade_capt_qty decimal(18,2);
    declare v_today_trade_capt_qty decimal(18,2);
    declare v_pre_strike_capt_qty decimal(18,2);
    declare v_today_strike_capt_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_open_amount decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_open_posi_price decimal(16,9);
    declare v_open_posi_qty decimal(18,2);
    declare v_open_posi_fee decimal(18,4);
    declare v_calc_dir int;
    declare v_row_id bigint;
    declare v_tmp_strike_occur_qty decimal(18,2);
    declare v_tmp_close_pandl decimal(18,4);
    declare v_tmp_rece_margin decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_invest_type = p_invest_type;
    SET v_comb_code = p_comb_code;
    SET v_strike_no = p_strike_no;
    SET v_strike_price = p_strike_price;
    SET v_strike_fee = p_strike_fee;
    SET v_strike_margin = p_strike_margin;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_strike_amt = p_strike_amt;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_strike_occur_qty = p_strike_occur_qty;
    SET v_trade_occur_qty = p_trade_occur_qty;
    SET v_exgp_long_rece_margin = p_exgp_long_rece_margin;
    SET v_exgp_short_rece_margin = p_exgp_short_rece_margin;
    SET v_exgp_long_stock_rece_margin = p_exgp_long_stock_rece_margin;
    SET v_exgp_short_stock_rece_margin = p_exgp_short_stock_rece_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_rece_margin = 0;
    SET v_close_pandl = 0;
    SET v_detail_posi_id = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_comm_occur_qty = 0;
    SET v_comm_frozen_qty = 0;
    SET v_comm_unfroz_qty = 0;
    SET v_comm_capt_qty = 0;
    SET v_comm_releas_qty = 0;
    SET v_trade_frozen_qty = 0;
    SET v_trade_unfroz_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_pre_comm_capt_qty = 0;
    SET v_today_comm_capt_qty = 0;
    SET v_old_trade_capt_qty = 0;
    SET v_today_trade_capt_qty = 0;
    SET v_pre_strike_capt_qty = 0;
    SET v_today_strike_capt_qty = 0;
    SET v_realize_pandl = 0;
    SET v_strike_qty = 0;
    SET v_open_amount = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_open_posi_price = 0;
    SET v_open_posi_qty = 0;
    SET v_open_posi_fee = 0;
    SET v_calc_dir = 1;
    SET v_row_id = 0;
    SET v_tmp_strike_occur_qty = 0;
    SET v_tmp_close_pandl = 0;
    SET v_tmp_rece_margin = 0;

    
    label_pro:BEGIN
    

    /* set @交易币种#="CNY"; */
    set v_exch_crncy_type="CNY";

    /* set @期初数量#=0; */
    set v_begin_qty=0;

    /* set @当前数量#=0; */
    set v_curr_qty=0;

    /* set @冻结数量#=0; */
    set v_frozen_qty=0;

    /* set @解冻数量#=0; */
    set v_unfroz_qty=0;

    /* set @指令变动数量#=0; */
    set v_comm_occur_qty=0;

    /* set @指令冻结数量#=0; */
    set v_comm_frozen_qty=0;

    /* set @指令解冻数量#=0; */
    set v_comm_unfroz_qty=0;

    /* set @指令占用数量#=0; */
    set v_comm_capt_qty=0;

    /* set @指令释放数量#=0; */
    set v_comm_releas_qty=0;

    /* set @交易冻结数量#=0; */
    set v_trade_frozen_qty=0;

    /* set @交易解冻数量#=0; */
    set v_trade_unfroz_qty=0;

    /* set @交易占用数量#=0; */
    set v_trade_capt_qty=0;

    /* set @交易释放数量#=0; */
    set v_trade_releas_qty=0;

    /* set @成交释放数量#=0; */
    set v_strike_releas_qty=0;

    /* set @老仓指令占用数量#=0; */
    set v_pre_comm_capt_qty=0;

    /* set @今仓指令占用数量#=0; */
    set v_today_comm_capt_qty=0;

    /* set @老仓交易占用数量#=0; */
    set v_old_trade_capt_qty=0;

    /* set @今仓交易占用数量#=0; */
    set v_today_trade_capt_qty=0;

    /* set @老仓成交占用数量#=0; */
    set v_pre_strike_capt_qty=0;

    /* set @今仓成交占用数量#=0; */
    set v_today_strike_capt_qty=0;

    /* set @应收保证金#=0; */
    set v_rece_margin=0;

    /* set @实现盈亏#=0; */
    set v_realize_pandl=0;

    /* set @平仓盈亏#=0; */
    set v_close_pandl=0;

    /* set @成交数量#=@成交变动数量#; */
    set v_strike_qty=v_strike_occur_qty;

    /* set @开仓金额#=@成交价格#*@合约乘数#*@成交数量#; */
    set v_open_amount=v_strike_price*v_contrc_unit*v_strike_qty;

    /* if @开平方向# = 《开平方向-开仓》 then */
    if v_contrc_dir = 1 then

      /* set @成交释放数量#=@成交变动数量#; */
      set v_strike_releas_qty=v_strike_occur_qty;

      /* set @交易释放数量#=@交易变动数量#; */
      set v_trade_releas_qty=v_trade_occur_qty;

      /* set @应收保证金#=@成交保证金#; */
      set v_rece_margin=v_strike_margin;

      /* set @今仓交易占用数量#=@交易变动数量#; */
      set v_today_trade_capt_qty=v_trade_occur_qty;

      /* [插入重复更新][交易期货_账户_交易组业务持仓表][字段][字段变量][{交易释放数量}={交易释放数量}+@交易释放数量#,{成交释放数量}={成交释放数量}+@成交释放数量#,{开仓金额}={开仓金额}+@开仓金额#,{应收保证金}={应收保证金}+@应收保证金#][2][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfuac_exgp_busi_posi (
          create_date, create_time, update_date, 
          update_time, update_times, co_no, pd_no, 
          exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
          futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
          lngsht_type, hedge_type, comb_code, begin_qty, 
          curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
          comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
          trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
          pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
          pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
          realize_pandl, close_pandl, open_amount) 
      values(
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_co_no, v_pd_no, 
          v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
          v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
          v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
          v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
          v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
          v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
          v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
          v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
          v_realize_pandl, v_close_pandl, v_open_amount) 
      ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, trade_releas_qty=trade_releas_qty+v_trade_releas_qty,strike_releas_qty=strike_releas_qty+v_strike_releas_qty,open_amount=open_amount+v_open_amount,rece_margin=rece_margin+v_rece_margin;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.2.14.2";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
          else
              SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
          end if;
          leave label_pro;
      end if;


      /* [插入重复更新][交易期货_账户_资产账户业务持仓表][字段][字段变量][{交易释放数量}={交易释放数量}+@交易释放数量#,{成交释放数量}={成交释放数量}+@成交释放数量#,{开仓金额}={开仓金额}+@开仓金额#,{应收保证金}={应收保证金}+@应收保证金#][3][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfuac_asac_busi_posi (
          create_date, create_time, update_date, 
          update_time, update_times, co_no, pd_no, 
          asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
          contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
          hedge_type, comb_code, begin_qty, curr_qty, 
          frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
          comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
          trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
          today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
          today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
          close_pandl, open_amount) 
      values(
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_co_no, v_pd_no, 
          v_asset_acco_no, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
          v_contrc_code_no, v_contrc_type, v_contrc_unit, v_lngsht_type, 
          v_hedge_type, v_comb_code, v_begin_qty, v_curr_qty, 
          v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
          v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
          v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, v_pre_comm_capt_qty, 
          v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, v_pre_strike_capt_qty, 
          v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, v_realize_pandl, 
          v_close_pandl, v_open_amount) 
      ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, trade_releas_qty=trade_releas_qty+v_trade_releas_qty,strike_releas_qty=strike_releas_qty+v_strike_releas_qty,open_amount=open_amount+v_open_amount,rece_margin=rece_margin+v_rece_margin;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.2.14.3";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
          else
              SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
          end if;
          leave label_pro;
      end if;


      /* set @开仓价格#=@成交价格#; */
      set v_open_posi_price=v_strike_price;

      /* set @开仓数量#=@成交变动数量#; */
      set v_open_posi_qty=v_strike_occur_qty;

      /* set @开仓费用#=@成交费用#; */
      set v_open_posi_fee=v_strike_fee;

      /* 调用【原子_交易期货_账户_新增期货持仓明细】*/
      call db_tdfutu.pra_tdfuac_InsertFuturesPosiDetail(
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
          v_exch_crncy_type,
          v_futu_acco_no,
          v_contrc_code_no,
          v_contrc_type,
          v_contrc_unit,
          v_curr_qty,
          v_hedge_type,
          v_invest_type,
          v_lngsht_type,
          v_strike_no,
          v_open_posi_price,
          v_open_posi_qty,
          v_open_posi_fee,
          v_strike_amt,
          v_open_amount,
          v_strike_margin,
          v_error_code,
          v_error_info,
          v_detail_posi_id);
      if v_error_code = "1" then
          SET v_error_code = "tdfutuA.2.14.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_新增期货持仓明细出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

    else

      /* set @计算方向# = 《计算方向-加上》; */
      set v_calc_dir = 1;

      /* if @多空类型# <> 《多空类型-多头》 then */
      if v_lngsht_type <> 1 then

        /* set @计算方向# = 《计算方向-减去》; */
        set v_calc_dir = -1;
      end if;
      #加锁，防止并发处理出错

      /* [获取表记录变量][交易期货_账户_交易组业务持仓表][{记录序号}][@记录序号#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#][4][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
      select row_id into v_row_id from db_tdfutu.tb_tdfuac_exgp_busi_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type limit 1;
      if FOUND_ROWS() = 0 then
                  
          SET v_error_code = "tdfutuA.2.14.4";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
          else
              SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
          end if;
          leave label_pro;
      end if;


      /* [锁定获取表记录变量][交易期货_账户_交易组业务持仓表][{记录序号}][@记录序号#][{记录序号}=@记录序号#][4][@记录序号#] */
      select row_id into v_row_id from db_tdfutu.tb_tdfuac_exgp_busi_posi where row_id=v_row_id limit 1 for update;
      if FOUND_ROWS() = 0 then
                  
          SET v_error_code = "tdfutuA.2.14.4";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
          else
              SET v_error_info = concat("记录序号=",v_row_id);
          end if;
          leave label_pro;
      end if;


      /* if @市场编号# = 《市场编号-上海商品期货交易所》 then */
      if v_exch_no = 12 then

        /* set @实现盈亏#=@平仓盈亏#; */
        set v_realize_pandl=v_close_pandl;
        #平仓,直接对老仓的数量进行处理,使用产品库的应收保证金和可用数量

        /* if @开平方向# = 《开平方向-平仓》 then */
        if v_contrc_dir = 2 then
          #[获取表记录变量][交易期货_账户_交易组业务持仓表][{应收保证金}][@应收保证金#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#][4][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#]

          /* set @平仓盈亏#=@计算方向#*(@成交价格#-@昨结算价#)*@成交变动数量#*@合约乘数#; */
          set v_close_pandl=v_calc_dir*(v_strike_price-v_pre_settle_price)*v_strike_occur_qty*v_contrc_unit;

          /* if @多空类型# = 《多空类型-多头》 then */
          if v_lngsht_type = 1 then

            /* set @应收保证金#=round(ifnull(@成交变动数量#*@交易组多头单票应收保证金#/@交易组可用数量#,0),2); */
            set v_rece_margin=round(ifnull(v_strike_occur_qty*v_exgp_long_stock_rece_margin/v_exgp_avail_qty,0),2);
          else

            /* set @应收保证金#=round(ifnull(@成交变动数量#*@交易组空头单票应收保证金#/@交易组可用数量#,0),2); */
            set v_rece_margin=round(ifnull(v_strike_occur_qty*v_exgp_short_stock_rece_margin/v_exgp_avail_qty,0),2);
          end if;

          /* set @老仓成交占用数量#=@成交变动数量#; */
          set v_pre_strike_capt_qty=v_strike_occur_qty;

          /* set @老仓交易占用数量#=-1*@成交变动数量#; */
          set v_old_trade_capt_qty=-1*v_strike_occur_qty;

          /* set @实现盈亏#=@平仓盈亏#; */
          set v_realize_pandl=v_close_pandl;

          /* [插入重复更新][交易期货_账户_交易组业务持仓表][字段][字段变量][{老仓成交占用数量}={老仓成交占用数量}+@老仓成交占用数量#,{老仓交易占用数量}={老仓交易占用数量}+@老仓交易占用数量#,{实现盈亏}={实现盈亏}+@实现盈亏#,{平仓盈亏}={平仓盈亏}+@平仓盈亏#,{应收保证金}={应收保证金}-@应收保证金#][4][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_tdfutu.tb_tdfuac_exgp_busi_posi (
              create_date, create_time, update_date, 
              update_time, update_times, co_no, pd_no, 
              exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
              futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
              lngsht_type, hedge_type, comb_code, begin_qty, 
              curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
              comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
              trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
              pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
              pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
              realize_pandl, close_pandl, open_amount) 
          values(
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_co_no, v_pd_no, 
              v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
              v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
              v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
              v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
              v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
              v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
              v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
              v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
              v_realize_pandl, v_close_pandl, v_open_amount) 
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_strike_capt_qty=pre_strike_capt_qty+v_pre_strike_capt_qty,old_trade_capt_qty=old_trade_capt_qty+v_old_trade_capt_qty,realize_pandl=realize_pandl+v_realize_pandl,close_pandl=close_pandl+v_close_pandl,rece_margin=rece_margin-v_rece_margin;
          if v_error_code = "1" then
                      
              SET v_error_code = "tdfutuA.2.14.4";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
              end if;
              leave label_pro;
          end if;


          /* [插入重复更新][交易期货_账户_资产账户业务持仓表][字段][字段变量][{老仓成交占用数量}={老仓成交占用数量}+@老仓成交占用数量#,{老仓交易占用数量}={老仓交易占用数量}+@老仓交易占用数量#,{实现盈亏}={实现盈亏}+@实现盈亏#,{平仓盈亏}={平仓盈亏}+@平仓盈亏#,{应收保证金}={应收保证金}-@应收保证金#][5][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_tdfutu.tb_tdfuac_asac_busi_posi (
              create_date, create_time, update_date, 
              update_time, update_times, co_no, pd_no, 
              asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
              contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
              hedge_type, comb_code, begin_qty, curr_qty, 
              frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
              comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
              trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
              today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
              today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
              close_pandl, open_amount) 
          values(
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_co_no, v_pd_no, 
              v_asset_acco_no, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
              v_contrc_code_no, v_contrc_type, v_contrc_unit, v_lngsht_type, 
              v_hedge_type, v_comb_code, v_begin_qty, v_curr_qty, 
              v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
              v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
              v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, v_pre_comm_capt_qty, 
              v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, v_pre_strike_capt_qty, 
              v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, v_realize_pandl, 
              v_close_pandl, v_open_amount) 
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_strike_capt_qty=pre_strike_capt_qty+v_pre_strike_capt_qty,old_trade_capt_qty=old_trade_capt_qty+v_old_trade_capt_qty,realize_pandl=realize_pandl+v_realize_pandl,close_pandl=close_pandl+v_close_pandl,rece_margin=rece_margin-v_rece_margin;
          if v_error_code = "1" then
                      
              SET v_error_code = "tdfutuA.2.14.5";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
              end if;
              leave label_pro;
          end if;

        #平今仓,使用交易库的持仓明细表中的数据进行计算
        else

          /* 调用【原子_交易期货_账户_平仓成交更新期货明细持仓】*/
          call db_tdfutu.pra_tdfuac_CloseStrikePosiDetail(
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
              v_futu_acco_no,
              v_contrc_code_no,
              v_contrc_unit,
              v_hedge_type,
              v_calc_dir,
              v_invest_type,
              v_lngsht_type,
              v_strike_no,
              v_strike_price,
              v_strike_occur_qty,
              v_strike_fee,
              v_error_code,
              v_error_info,
              v_open_amount,
              v_close_pandl,
              v_rece_margin,
              v_detail_posi_id);
          if v_error_code = "1" then
              SET v_error_code = "tdfutuA.2.14.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_平仓成交更新期货明细持仓出现错误！',v_mysql_message);
              end if;
              leave label_pro;
          elseif v_error_code <> "0" then
              leave label_pro;
          end if;


          /* set @今仓成交占用数量#=@成交变动数量#; */
          set v_today_strike_capt_qty=v_strike_occur_qty;

          /* set @今仓交易占用数量#=@交易变动数量#; */
          set v_today_trade_capt_qty=v_trade_occur_qty;

          /* set @实现盈亏#=@平仓盈亏#; */
          set v_realize_pandl=v_close_pandl;

          /* set @开仓金额#=-1*@开仓金额#; */
          set v_open_amount=-1*v_open_amount;

          /* [插入重复更新][交易期货_账户_交易组业务持仓表][字段][字段变量][{今仓成交占用数量}={今仓成交占用数量}+@今仓成交占用数量#,{今仓交易占用数量}={今仓交易占用数量}+@今仓交易占用数量#,{实现盈亏}={实现盈亏}+@实现盈亏#,{平仓盈亏}={平仓盈亏}+@平仓盈亏#,{开仓金额}={开仓金额}+@开仓金额#,{应收保证金}={应收保证金}-@应收保证金#][6][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_tdfutu.tb_tdfuac_exgp_busi_posi (
              create_date, create_time, update_date, 
              update_time, update_times, co_no, pd_no, 
              exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
              futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
              lngsht_type, hedge_type, comb_code, begin_qty, 
              curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
              comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
              trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
              pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
              pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
              realize_pandl, close_pandl, open_amount) 
          values(
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_co_no, v_pd_no, 
              v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
              v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
              v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
              v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
              v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
              v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
              v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
              v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
              v_realize_pandl, v_close_pandl, v_open_amount) 
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, today_strike_capt_qty=today_strike_capt_qty+v_today_strike_capt_qty,today_trade_capt_qty=today_trade_capt_qty+v_today_trade_capt_qty,realize_pandl=realize_pandl+v_realize_pandl,close_pandl=close_pandl+v_close_pandl,open_amount=open_amount+v_open_amount,rece_margin=rece_margin-v_rece_margin;
          if v_error_code = "1" then
                      
              SET v_error_code = "tdfutuA.2.14.6";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
              end if;
              leave label_pro;
          end if;


          /* [插入重复更新][交易期货_账户_资产账户业务持仓表][字段][字段变量][{今仓成交占用数量}={今仓成交占用数量}+@今仓成交占用数量#,{今仓交易占用数量}={今仓交易占用数量}+@今仓交易占用数量#,{实现盈亏}={实现盈亏}+@实现盈亏#,{平仓盈亏}={平仓盈亏}+@平仓盈亏#,{开仓金额}={开仓金额}+@开仓金额#,{应收保证金}={应收保证金}-@应收保证金#][7][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_tdfutu.tb_tdfuac_asac_busi_posi (
              create_date, create_time, update_date, 
              update_time, update_times, co_no, pd_no, 
              asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
              contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
              hedge_type, comb_code, begin_qty, curr_qty, 
              frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
              comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
              trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
              today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
              today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
              close_pandl, open_amount) 
          values(
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_co_no, v_pd_no, 
              v_asset_acco_no, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
              v_contrc_code_no, v_contrc_type, v_contrc_unit, v_lngsht_type, 
              v_hedge_type, v_comb_code, v_begin_qty, v_curr_qty, 
              v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
              v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
              v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, v_pre_comm_capt_qty, 
              v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, v_pre_strike_capt_qty, 
              v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, v_realize_pandl, 
              v_close_pandl, v_open_amount) 
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, today_strike_capt_qty=today_strike_capt_qty+v_today_strike_capt_qty,today_trade_capt_qty=today_trade_capt_qty+v_today_trade_capt_qty,realize_pandl=realize_pandl+v_realize_pandl,close_pandl=close_pandl+v_close_pandl,open_amount=open_amount+v_open_amount,rece_margin=rece_margin-v_rece_margin;
          if v_error_code = "1" then
                      
              SET v_error_code = "tdfutuA.2.14.7";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
              end if;
              leave label_pro;
          end if;

        end if;
      else

        /* [获取表记录变量][交易期货_账户_交易组业务持仓表][{昨结算价},{应收保证金},{老仓交易占用数量},{今仓交易占用数量},{老仓成交占用数量},{今仓成交占用数量}][@昨结算价#,@应收保证金#,@老仓交易占用数量#,@今仓交易占用数量#,@老仓成交占用数量#,@今仓成交占用数量#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#][4][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
        select pre_settle_price,rece_margin,old_trade_capt_qty,today_trade_capt_qty,pre_strike_capt_qty,today_strike_capt_qty into v_pre_settle_price,v_rece_margin,v_old_trade_capt_qty,v_today_trade_capt_qty,v_pre_strike_capt_qty,v_today_strike_capt_qty from db_tdfutu.tb_tdfuac_exgp_busi_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "tdfutuA.2.14.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
            end if;
            leave label_pro;
        end if;


        /* set @临时_成交变动数量#=@成交变动数量#; */
        set v_tmp_strike_occur_qty=v_strike_occur_qty;
        #先开先平,先平老仓,再平今仓

        /* if @成交变动数量#>@老仓交易占用数量# then */
        if v_strike_occur_qty>v_old_trade_capt_qty then

          /* set @临时_平仓盈亏#=@计算方向#*@老仓交易占用数量#*(@成交价格#-@昨结算价#)*@合约乘数#; */
          set v_tmp_close_pandl=v_calc_dir*v_old_trade_capt_qty*(v_strike_price-v_pre_settle_price)*v_contrc_unit;

          /* if @多空类型# = 《多空类型-多头》 then */
          if v_lngsht_type = 1 then

            /* set @临时_应收保证金#=round(ifnull(@老仓交易占用数量#*@交易组多头单票应收保证金#/@交易组可用数量#,0),2); */
            set v_tmp_rece_margin=round(ifnull(v_old_trade_capt_qty*v_exgp_long_stock_rece_margin/v_exgp_avail_qty,0),2);
          else

            /* set @临时_应收保证金#=round(ifnull(@老仓交易占用数量#*@交易组空头单票应收保证金#/@交易组可用数量#,0),2); */
            set v_tmp_rece_margin=round(ifnull(v_old_trade_capt_qty*v_exgp_short_stock_rece_margin/v_exgp_avail_qty,0),2);
          end if;

          /* set @成交变动数量#=@成交变动数量#-@老仓交易占用数量#; */
          set v_strike_occur_qty=v_strike_occur_qty-v_old_trade_capt_qty;

          /* set @交易变动数量#=@交易变动数量#+@老仓交易占用数量#; */
          set v_trade_occur_qty=v_trade_occur_qty+v_old_trade_capt_qty;

          /* 调用【原子_交易期货_账户_平仓成交更新期货明细持仓】*/
          call db_tdfutu.pra_tdfuac_CloseStrikePosiDetail(
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
              v_futu_acco_no,
              v_contrc_code_no,
              v_contrc_unit,
              v_hedge_type,
              v_calc_dir,
              v_invest_type,
              v_lngsht_type,
              v_strike_no,
              v_strike_price,
              v_strike_occur_qty,
              v_strike_fee,
              v_error_code,
              v_error_info,
              v_open_amount,
              v_close_pandl,
              v_rece_margin,
              v_detail_posi_id);
          if v_error_code = "1" then
              SET v_error_code = "tdfutuA.2.14.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_平仓成交更新期货明细持仓出现错误！',v_mysql_message);
              end if;
              leave label_pro;
          elseif v_error_code <> "0" then
              leave label_pro;
          end if;

          #set @应收保证金#=@临时_应收保证金#;

          /* set @平仓盈亏#=@平仓盈亏#+@临时_平仓盈亏#; */
          set v_close_pandl=v_close_pandl+v_tmp_close_pandl;

          /* set @应收保证金#=@应收保证金#+@临时_应收保证金#; */
          set v_rece_margin=v_rece_margin+v_tmp_rece_margin;

          /* set @老仓成交占用数量#=@老仓交易占用数量#; */
          set v_pre_strike_capt_qty=v_old_trade_capt_qty;

          /* set @老仓交易占用数量#=-1*@老仓交易占用数量#; */
          set v_old_trade_capt_qty=-1*v_old_trade_capt_qty;

          /* set @今仓成交占用数量#=@成交变动数量#; */
          set v_today_strike_capt_qty=v_strike_occur_qty;

          /* set @今仓交易占用数量#=-1*@成交变动数量#; */
          set v_today_trade_capt_qty=-1*v_strike_occur_qty;

          /* set @实现盈亏#=@平仓盈亏#; */
          set v_realize_pandl=v_close_pandl;

          /* set @开仓金额#=-1*@开仓金额#; */
          set v_open_amount=-1*v_open_amount;

          /* [插入重复更新][交易期货_账户_交易组业务持仓表][字段][字段变量][{老仓成交占用数量}={老仓成交占用数量}+@老仓成交占用数量#,{老仓交易占用数量}={老仓交易占用数量}+@老仓交易占用数量#,{今仓交易占用数量}={今仓交易占用数量}+@今仓交易占用数量#,{今仓成交占用数量}={今仓成交占用数量}+@今仓成交占用数量#,{实现盈亏}={实现盈亏}+@实现盈亏#,{平仓盈亏}={平仓盈亏}+@平仓盈亏#,{开仓金额}={开仓金额}+@开仓金额#,{应收保证金}={应收保证金}-@应收保证金#][8][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_tdfutu.tb_tdfuac_exgp_busi_posi (
              create_date, create_time, update_date, 
              update_time, update_times, co_no, pd_no, 
              exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
              futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
              lngsht_type, hedge_type, comb_code, begin_qty, 
              curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
              comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
              trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
              pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
              pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
              realize_pandl, close_pandl, open_amount) 
          values(
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_co_no, v_pd_no, 
              v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
              v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
              v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
              v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
              v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
              v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
              v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
              v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
              v_realize_pandl, v_close_pandl, v_open_amount) 
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_strike_capt_qty=pre_strike_capt_qty+v_pre_strike_capt_qty,old_trade_capt_qty=old_trade_capt_qty+v_old_trade_capt_qty,today_trade_capt_qty=today_trade_capt_qty+v_today_trade_capt_qty,today_strike_capt_qty=today_strike_capt_qty+v_today_strike_capt_qty,realize_pandl=realize_pandl+v_realize_pandl,close_pandl=close_pandl+v_close_pandl,open_amount=open_amount+v_open_amount,rece_margin=rece_margin-v_rece_margin;
          if v_error_code = "1" then
                      
              SET v_error_code = "tdfutuA.2.14.8";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
              end if;
              leave label_pro;
          end if;


          /* [插入重复更新][交易期货_账户_资产账户业务持仓表][字段][字段变量][{老仓成交占用数量}={老仓成交占用数量}+@老仓成交占用数量#,{老仓交易占用数量}={老仓交易占用数量}+@老仓交易占用数量#,{今仓交易占用数量}={今仓交易占用数量}+@今仓交易占用数量#,{今仓成交占用数量}={今仓成交占用数量}+@今仓成交占用数量#,{实现盈亏}={实现盈亏}+@实现盈亏#,{平仓盈亏}={平仓盈亏}+@平仓盈亏#,{开仓金额}={开仓金额}+@开仓金额#,{应收保证金}={应收保证金}-@应收保证金#][9][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_tdfutu.tb_tdfuac_asac_busi_posi (
              create_date, create_time, update_date, 
              update_time, update_times, co_no, pd_no, 
              asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
              contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
              hedge_type, comb_code, begin_qty, curr_qty, 
              frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
              comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
              trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
              today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
              today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
              close_pandl, open_amount) 
          values(
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_co_no, v_pd_no, 
              v_asset_acco_no, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
              v_contrc_code_no, v_contrc_type, v_contrc_unit, v_lngsht_type, 
              v_hedge_type, v_comb_code, v_begin_qty, v_curr_qty, 
              v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
              v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
              v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, v_pre_comm_capt_qty, 
              v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, v_pre_strike_capt_qty, 
              v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, v_realize_pandl, 
              v_close_pandl, v_open_amount) 
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_strike_capt_qty=pre_strike_capt_qty+v_pre_strike_capt_qty,old_trade_capt_qty=old_trade_capt_qty+v_old_trade_capt_qty,today_trade_capt_qty=today_trade_capt_qty+v_today_trade_capt_qty,today_strike_capt_qty=today_strike_capt_qty+v_today_strike_capt_qty,realize_pandl=realize_pandl+v_realize_pandl,close_pandl=close_pandl+v_close_pandl,open_amount=open_amount+v_open_amount,rece_margin=rece_margin-v_rece_margin;
          if v_error_code = "1" then
                      
              SET v_error_code = "tdfutuA.2.14.9";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
              end if;
              leave label_pro;
          end if;

        #先开先平,平老仓即可
        else

          /* set @平仓盈亏#=@计算方向#*(@成交价格#-@昨结算价#)*@成交变动数量#*@合约乘数#; */
          set v_close_pandl=v_calc_dir*(v_strike_price-v_pre_settle_price)*v_strike_occur_qty*v_contrc_unit;

          /* if @多空类型# = 《多空类型-多头》 then */
          if v_lngsht_type = 1 then

            /* set @应收保证金#=round(ifnull(@成交变动数量#*@交易组多头单票应收保证金#/@交易组可用数量#,0),2); */
            set v_rece_margin=round(ifnull(v_strike_occur_qty*v_exgp_long_stock_rece_margin/v_exgp_avail_qty,0),2);
          else

            /* set @应收保证金#=round(ifnull(@成交变动数量#*@交易组空头单票应收保证金#/@交易组可用数量#,0),2); */
            set v_rece_margin=round(ifnull(v_strike_occur_qty*v_exgp_short_stock_rece_margin/v_exgp_avail_qty,0),2);
          end if;

          /* set @老仓成交占用数量#=@成交变动数量#; */
          set v_pre_strike_capt_qty=v_strike_occur_qty;

          /* set @老仓交易占用数量#=@交易变动数量#; */
          set v_old_trade_capt_qty=v_trade_occur_qty;

          /* set @实现盈亏#=@平仓盈亏#; */
          set v_realize_pandl=v_close_pandl;

          /* [插入重复更新][交易期货_账户_交易组业务持仓表][字段][字段变量][{老仓成交占用数量}={老仓成交占用数量}+@老仓成交占用数量#,{老仓交易占用数量}={老仓交易占用数量}+@老仓交易占用数量#,{实现盈亏}={实现盈亏}+@实现盈亏#,{平仓盈亏}={平仓盈亏}+@平仓盈亏#,{应收保证金}={应收保证金}-@应收保证金#][10][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_tdfutu.tb_tdfuac_exgp_busi_posi (
              create_date, create_time, update_date, 
              update_time, update_times, co_no, pd_no, 
              exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
              futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
              lngsht_type, hedge_type, comb_code, begin_qty, 
              curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
              comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
              trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
              pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
              pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
              realize_pandl, close_pandl, open_amount) 
          values(
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_co_no, v_pd_no, 
              v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
              v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
              v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
              v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
              v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
              v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
              v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
              v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
              v_realize_pandl, v_close_pandl, v_open_amount) 
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_strike_capt_qty=pre_strike_capt_qty+v_pre_strike_capt_qty,old_trade_capt_qty=old_trade_capt_qty+v_old_trade_capt_qty,realize_pandl=realize_pandl+v_realize_pandl,close_pandl=close_pandl+v_close_pandl,rece_margin=rece_margin-v_rece_margin;
          if v_error_code = "1" then
                      
              SET v_error_code = "tdfutuA.2.14.10";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
              end if;
              leave label_pro;
          end if;


          /* [插入重复更新][交易期货_账户_资产账户业务持仓表][字段][字段变量][{老仓成交占用数量}={老仓成交占用数量}+@老仓成交占用数量#,{老仓交易占用数量}={老仓交易占用数量}+@老仓交易占用数量#,{实现盈亏}={实现盈亏}+@实现盈亏#,{平仓盈亏}={平仓盈亏}+@平仓盈亏#,{应收保证金}={应收保证金}-@应收保证金#][11][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_tdfutu.tb_tdfuac_asac_busi_posi (
              create_date, create_time, update_date, 
              update_time, update_times, co_no, pd_no, 
              asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
              contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
              hedge_type, comb_code, begin_qty, curr_qty, 
              frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
              comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
              trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
              today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
              today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
              close_pandl, open_amount) 
          values(
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_co_no, v_pd_no, 
              v_asset_acco_no, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
              v_contrc_code_no, v_contrc_type, v_contrc_unit, v_lngsht_type, 
              v_hedge_type, v_comb_code, v_begin_qty, v_curr_qty, 
              v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
              v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
              v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, v_pre_comm_capt_qty, 
              v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, v_pre_strike_capt_qty, 
              v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, v_realize_pandl, 
              v_close_pandl, v_open_amount) 
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_strike_capt_qty=pre_strike_capt_qty+v_pre_strike_capt_qty,old_trade_capt_qty=old_trade_capt_qty+v_old_trade_capt_qty,realize_pandl=realize_pandl+v_realize_pandl,close_pandl=close_pandl+v_close_pandl,rece_margin=rece_margin-v_rece_margin;
          if v_error_code = "1" then
                      
              SET v_error_code = "tdfutuA.2.14.11";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
              end if;
              leave label_pro;
          end if;

        end if;
      end if;

      /* set @应收保证金#=round(@应收保证金#,2); */
      set v_rece_margin=round(v_rece_margin,2);
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_rece_margin = v_rece_margin;
    SET p_close_pandl = v_close_pandl;
    SET p_detail_posi_id = v_detail_posi_id;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_计算实收保证金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_CalcRealMarginByExection;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_CalcRealMarginByExection(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_lngsht_type int,
    IN p_comm_margin decimal(18,4),
    IN p_order_margin decimal(18,4),
    IN p_strike_margin decimal(18,4),
    IN p_long_comm_margin decimal(18,4),
    IN p_short_comm_margin decimal(18,4),
    IN p_long_order_margin decimal(18,4),
    IN p_short_order_margin decimal(18,4),
    IN p_long_strike_margin decimal(18,4),
    IN p_short_strike_margin decimal(18,4),
    IN p_long_hold_margin decimal(18,4),
    IN p_short_hold_margin decimal(18,4),
    IN p_trade_capt_amt decimal(18,4),
    IN p_posi_capt_amt decimal(18,4),
    IN p_comm_capt_amt decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_occur_amt decimal(18,4),
    OUT p_strike_occur_amt decimal(18,4),
    OUT p_comm_occur_amt decimal(18,4),
    OUT p_trade_capt_amt_after decimal(18,4),
    OUT p_posi_capt_amt_after decimal(18,4),
    OUT p_comm_capt_amt_after decimal(18,4)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_lngsht_type int;
    declare v_comm_margin decimal(18,4);
    declare v_order_margin decimal(18,4);
    declare v_strike_margin decimal(18,4);
    declare v_long_comm_margin decimal(18,4);
    declare v_short_comm_margin decimal(18,4);
    declare v_long_order_margin decimal(18,4);
    declare v_short_order_margin decimal(18,4);
    declare v_long_strike_margin decimal(18,4);
    declare v_short_strike_margin decimal(18,4);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_posi_capt_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_occur_amt decimal(18,4);
    declare v_strike_occur_amt decimal(18,4);
    declare v_comm_occur_amt decimal(18,4);
    declare v_trade_capt_amt_after decimal(18,4);
    declare v_posi_capt_amt_after decimal(18,4);
    declare v_comm_capt_amt_after decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_lngsht_type = p_lngsht_type;
    SET v_comm_margin = p_comm_margin;
    SET v_order_margin = p_order_margin;
    SET v_strike_margin = p_strike_margin;
    SET v_long_comm_margin = p_long_comm_margin;
    SET v_short_comm_margin = p_short_comm_margin;
    SET v_long_order_margin = p_long_order_margin;
    SET v_short_order_margin = p_short_order_margin;
    SET v_long_strike_margin = p_long_strike_margin;
    SET v_short_strike_margin = p_short_strike_margin;
    SET v_long_hold_margin = p_long_hold_margin;
    SET v_short_hold_margin = p_short_hold_margin;
    SET v_trade_capt_amt = p_trade_capt_amt;
    SET v_posi_capt_amt = p_posi_capt_amt;
    SET v_comm_capt_amt = p_comm_capt_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_occur_amt = 0;
    SET v_strike_occur_amt = 0;
    SET v_comm_occur_amt = 0;
    SET v_trade_capt_amt_after = 0;
    SET v_posi_capt_amt_after = 0;
    SET v_comm_capt_amt_after = 0;

    
    label_pro:BEGIN
    
    #多头持仓保证金为产品库中的多头应收保证金,空头持仓保证金为产品库的空头应收保证金

    /* if @多空类型# = 《多空类型-多头》 then */
    if v_lngsht_type = 1 then

      /* set @持仓占用后金额# = GREATEST((@多头成交保证金# + @多头持仓保证金# + @成交保证金#), (@空头成交保证金# + @空头持仓保证金#)); */
      set v_posi_capt_amt_after = GREATEST((v_long_strike_margin + v_long_hold_margin + v_strike_margin), (v_short_strike_margin + v_short_hold_margin));

      /* set @交易占用后金额# = GREATEST((@多头订单保证金# + @多头成交保证金# + @多头持仓保证金# + @订单保证金# + @成交保证金#), (@空头订单保证金# + @空头成交保证金# + @空头持仓保证金#)); */
      set v_trade_capt_amt_after = GREATEST((v_long_order_margin + v_long_strike_margin + v_long_hold_margin + v_order_margin + v_strike_margin), (v_short_order_margin + v_short_strike_margin + v_short_hold_margin));

      /* set @指令占用后金额# = GREATEST((@多头指令保证金#+@多头订单保证金# + @多头成交保证金# + @多头持仓保证金# +@指令保证金#+ @订单保证金# + @成交保证金#), (@空头指令保证金#+@空头订单保证金# + @空头成交保证金# + @空头持仓保证金#)); */
      set v_comm_capt_amt_after = GREATEST((v_long_comm_margin+v_long_order_margin + v_long_strike_margin + v_long_hold_margin +v_comm_margin+ v_order_margin + v_strike_margin), (v_short_comm_margin+v_short_order_margin + v_short_strike_margin + v_short_hold_margin));
    end if;

    /* if @多空类型# = 《多空类型-空头》 then */
    if v_lngsht_type = 2 then

      /* set @持仓占用后金额# = GREATEST((@多头成交保证金# + @多头持仓保证金#), (@空头成交保证金# + @空头持仓保证金# + @成交保证金#)); */
      set v_posi_capt_amt_after = GREATEST((v_long_strike_margin + v_long_hold_margin), (v_short_strike_margin + v_short_hold_margin + v_strike_margin));

      /* set @交易占用后金额# = GREATEST((@多头订单保证金# + @多头成交保证金# + @多头持仓保证金#), (@空头订单保证金# + @空头成交保证金# + @空头持仓保证金# + @订单保证金# + @成交保证金#)); */
      set v_trade_capt_amt_after = GREATEST((v_long_order_margin + v_long_strike_margin + v_long_hold_margin), (v_short_order_margin + v_short_strike_margin + v_short_hold_margin + v_order_margin + v_strike_margin));

      /* set @指令占用后金额# = GREATEST((@多头指令保证金#+@多头订单保证金# + @多头成交保证金# + @多头持仓保证金#), (@空头指令保证金#+@空头订单保证金# + @空头成交保证金# + @空头持仓保证金# +@指令保证金#+ @订单保证金# + @成交保证金#)); */
      set v_comm_capt_amt_after = GREATEST((v_long_comm_margin+v_long_order_margin + v_long_strike_margin + v_long_hold_margin), (v_short_comm_margin+v_short_order_margin + v_short_strike_margin + v_short_hold_margin +v_comm_margin+ v_order_margin + v_strike_margin));
    end if;

    /* set @成交变动金额# = @持仓占用后金额# - @持仓占用金额#; */
    set v_strike_occur_amt = v_posi_capt_amt_after - v_posi_capt_amt;

    /* set @指令占用后金额# = @指令占用后金额# - @交易占用后金额#; */
    set v_comm_capt_amt_after = v_comm_capt_amt_after - v_trade_capt_amt_after;

    /* set @交易占用后金额# = @交易占用后金额# - @持仓占用后金额#; */
    set v_trade_capt_amt_after = v_trade_capt_amt_after - v_posi_capt_amt_after;

    /* set @交易变动金额# = @交易占用后金额# - @交易占用金额#; */
    set v_trade_occur_amt = v_trade_capt_amt_after - v_trade_capt_amt;

    /* set @指令变动金额# = @指令占用后金额# - @指令占用金额#; */
    set v_comm_occur_amt = v_comm_capt_amt_after - v_comm_capt_amt;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_occur_amt = v_trade_occur_amt;
    SET p_strike_occur_amt = v_strike_occur_amt;
    SET p_comm_occur_amt = v_comm_occur_amt;
    SET p_trade_capt_amt_after = v_trade_capt_amt_after;
    SET p_posi_capt_amt_after = v_posi_capt_amt_after;
    SET p_comm_capt_amt_after = v_comm_capt_amt_after;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_更新保证金优惠信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_UpdateMargin;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_UpdateMargin(
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
    IN p_comb_code varchar(6),
    IN p_hedge_type int,
    IN p_long_comm_margin decimal(18,4),
    IN p_short_comm_margin decimal(18,4),
    IN p_long_order_margin decimal(18,4),
    IN p_short_order_margin decimal(18,4),
    IN p_long_strike_margin decimal(18,4),
    IN p_short_strike_margin decimal(18,4),
    IN p_trade_capt_amt decimal(18,4),
    IN p_posi_capt_amt decimal(18,4),
    IN p_comm_capt_amt decimal(18,4),
    IN p_row_id bigint,
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
    declare v_comb_code varchar(6);
    declare v_hedge_type int;
    declare v_long_comm_margin decimal(18,4);
    declare v_short_comm_margin decimal(18,4);
    declare v_long_order_margin decimal(18,4);
    declare v_short_order_margin decimal(18,4);
    declare v_long_strike_margin decimal(18,4);
    declare v_short_strike_margin decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_posi_capt_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_row_id bigint;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_comb_code = p_comb_code;
    SET v_hedge_type = p_hedge_type;
    SET v_long_comm_margin = p_long_comm_margin;
    SET v_short_comm_margin = p_short_comm_margin;
    SET v_long_order_margin = p_long_order_margin;
    SET v_short_order_margin = p_short_order_margin;
    SET v_long_strike_margin = p_long_strike_margin;
    SET v_short_strike_margin = p_short_strike_margin;
    SET v_trade_capt_amt = p_trade_capt_amt;
    SET v_posi_capt_amt = p_posi_capt_amt;
    SET v_comm_capt_amt = p_comm_capt_amt;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易期货_账户_期货保证金优惠控制表][{多头指令保证金} = {多头指令保证金} +@多头指令保证金#,{空头指令保证金} = {空头指令保证金} + @空头指令保证金#,{多头订单保证金} = {多头订单保证金} + @多头订单保证金#, {空头订单保证金} = {空头订单保证金} + @空头订单保证金#, {多头成交保证金} = {多头成交保证金} + @多头成交保证金#, {空头成交保证金} = {空头成交保证金} + @空头成交保证金#, {交易占用金额} = @交易占用金额#, {持仓占用金额} = @持仓占用金额#,{指令占用金额}= @指令占用金额#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfuac_margin_ctrl set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, long_comm_margin = long_comm_margin +v_long_comm_margin,short_comm_margin = short_comm_margin + v_short_comm_margin,long_order_margin = long_order_margin + v_long_order_margin, short_order_margin = short_order_margin + v_short_order_margin, long_strike_margin = long_strike_margin + v_long_strike_margin, short_strike_margin = short_strike_margin + v_short_strike_margin, trade_capt_amt = v_trade_capt_amt, posi_capt_amt = v_posi_capt_amt,comm_capt_amt= v_comm_capt_amt where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.2.21.2";
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

# 原子_交易期货_账户_获取更新产品保证金优惠信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_GetUpdateProductMargin;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_GetUpdateProductMargin(
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
    IN p_hedge_type int,
    IN p_comb_code varchar(6),
    IN p_lngsht_type int,
    IN p_comm_margin decimal(18,4),
    IN p_order_margin decimal(18,4),
    IN p_strike_margin decimal(18,4),
    IN p_asac_long_rece_margin decimal(18,4),
    IN p_asac_short_rece_margin decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_capt_amt decimal(18,4),
    OUT p_trade_capt_amt decimal(18,4),
    OUT p_comm_capt_amt decimal(18,4),
    OUT p_long_comm_margin decimal(18,4),
    OUT p_short_comm_margin decimal(18,4),
    OUT p_long_order_margin decimal(18,4),
    OUT p_short_order_margin decimal(18,4),
    OUT p_long_strike_margin decimal(18,4),
    OUT p_short_strike_margin decimal(18,4),
    OUT p_trade_occur_amt decimal(18,4),
    OUT p_strike_occur_amt decimal(18,4),
    OUT p_comm_occur_amt decimal(18,4)
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
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_lngsht_type int;
    declare v_comm_margin decimal(18,4);
    declare v_order_margin decimal(18,4);
    declare v_strike_margin decimal(18,4);
    declare v_asac_long_rece_margin decimal(18,4);
    declare v_asac_short_rece_margin decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_capt_amt decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_long_comm_margin decimal(18,4);
    declare v_short_comm_margin decimal(18,4);
    declare v_long_order_margin decimal(18,4);
    declare v_short_order_margin decimal(18,4);
    declare v_long_strike_margin decimal(18,4);
    declare v_short_strike_margin decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_strike_occur_amt decimal(18,4);
    declare v_comm_occur_amt decimal(18,4);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_group_no int;
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_row_id bigint;
    declare v_posi_capt_amt decimal(18,4);
    declare v_tmp_strike_capt_amt decimal(18,4);
    declare v_tmp_trade_capt_amt decimal(18,4);
    declare v_tmp_comm_capt_amt decimal(18,4);
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
    SET v_exch_no = p_exch_no;
    SET v_hedge_type = p_hedge_type;
    SET v_comb_code = p_comb_code;
    SET v_lngsht_type = p_lngsht_type;
    SET v_comm_margin = p_comm_margin;
    SET v_order_margin = p_order_margin;
    SET v_strike_margin = p_strike_margin;
    SET v_asac_long_rece_margin = p_asac_long_rece_margin;
    SET v_asac_short_rece_margin = p_asac_short_rece_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_capt_amt = 0;
    SET v_trade_capt_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_long_comm_margin = 0;
    SET v_short_comm_margin = 0;
    SET v_long_order_margin = 0;
    SET v_short_order_margin = 0;
    SET v_long_strike_margin = 0;
    SET v_short_strike_margin = 0;
    SET v_trade_occur_amt = 0;
    SET v_strike_occur_amt = 0;
    SET v_comm_occur_amt = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_group_no = 0;
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_row_id = 0;
    SET v_posi_capt_amt = 0;
    SET v_tmp_strike_capt_amt = 0;
    SET v_tmp_trade_capt_amt = 0;
    SET v_tmp_comm_capt_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @交易币种#="CNY"; */
    set v_exch_crncy_type="CNY";

    /* set @交易组编号#=0; */
    set v_exch_group_no=0;

    /* set @多头持仓保证金#=@资产账户多头应收保证金#; */
    set v_long_hold_margin=v_asac_long_rece_margin;

    /* set @空头持仓保证金#=@资产账户空头应收保证金#; */
    set v_short_hold_margin=v_asac_short_rece_margin;

    /* [获取表记录变量语句][交易期货_账户_期货保证金优惠控制表][{记录序号}][@记录序号#][{产品编号}=@产品编号# and {交易组编号} = 0 and {资产账户编号} = @资产账户编号# and {市场编号} = @市场编号# and {组合编码} = @组合编码# and {套保标志} = @套保标志#] */
    select row_id into v_row_id from db_tdfutu.tb_tdfuac_margin_ctrl where pd_no=v_pd_no and exch_group_no = 0 and asset_acco_no = v_asset_acco_no and exch_no = v_exch_no and comb_code = v_comb_code and hedge_type = v_hedge_type limit 1;


    /* [不报错锁定获取表记录变量][交易期货_账户_期货保证金优惠控制表][{多头指令保证金},{空头指令保证金},{多头订单保证金},{空头订单保证金},{多头成交保证金},{空头成交保证金},{持仓占用金额},{交易占用金额},{指令占用金额}][@多头指令保证金#, @空头指令保证金#, @多头订单保证金#, @空头订单保证金#, @多头成交保证金#, @空头成交保证金#,@持仓占用金额#,@交易占用金额#,@指令占用金额#][{记录序号} = @记录序号#] */
    select long_comm_margin,short_comm_margin,long_order_margin,short_order_margin,long_strike_margin,short_strike_margin,posi_capt_amt,trade_capt_amt,comm_capt_amt into v_long_comm_margin, v_short_comm_margin, v_long_order_margin, v_short_order_margin, v_long_strike_margin, v_short_strike_margin,v_posi_capt_amt,v_trade_capt_amt,v_comm_capt_amt from db_tdfutu.tb_tdfuac_margin_ctrl where row_id = v_row_id limit 1 for update;


    /* if @多空类型# = 《多空类型-多头》 then */
    if v_lngsht_type = 1 then

      /* set @临时_成交占用金额# = GREATEST((@多头成交保证金# + @多头持仓保证金# + @成交保证金#), (@空头成交保证金# + @空头持仓保证金#)); */
      set v_tmp_strike_capt_amt = GREATEST((v_long_strike_margin + v_long_hold_margin + v_strike_margin), (v_short_strike_margin + v_short_hold_margin));

      /* set @临时_交易占用金额# = GREATEST((@多头订单保证金# + @多头成交保证金# + @多头持仓保证金# + @订单保证金# + @成交保证金#), (@空头订单保证金# + @空头成交保证金# + @空头持仓保证金#)); */
      set v_tmp_trade_capt_amt = GREATEST((v_long_order_margin + v_long_strike_margin + v_long_hold_margin + v_order_margin + v_strike_margin), (v_short_order_margin + v_short_strike_margin + v_short_hold_margin));

      /* set @临时_指令占用金额# = GREATEST((@多头指令保证金#+@多头订单保证金# + @多头成交保证金# + @多头持仓保证金# + @指令保证金#+@订单保证金# + @成交保证金#), (@空头指令保证金#+@空头订单保证金# + @空头成交保证金# + @空头持仓保证金#)); */
      set v_tmp_comm_capt_amt = GREATEST((v_long_comm_margin+v_long_order_margin + v_long_strike_margin + v_long_hold_margin + v_comm_margin+v_order_margin + v_strike_margin), (v_short_comm_margin+v_short_order_margin + v_short_strike_margin + v_short_hold_margin));

      /* set @多头指令保证金# = @指令保证金# + @多头指令保证金# ; */
      set v_long_comm_margin = v_comm_margin + v_long_comm_margin ;

      /* set @多头订单保证金# = @订单保证金# + @多头订单保证金# ; */
      set v_long_order_margin = v_order_margin + v_long_order_margin ;

      /* set @多头成交保证金# = @成交保证金# + @多头成交保证金#; */
      set v_long_strike_margin = v_strike_margin + v_long_strike_margin;
    end if;

    /* if @多空类型# = 《多空类型-空头》 then */
    if v_lngsht_type = 2 then

      /* set @临时_成交占用金额# = GREATEST((@多头成交保证金# + @多头持仓保证金#), (@空头成交保证金# + @空头持仓保证金# + @成交保证金#)); */
      set v_tmp_strike_capt_amt = GREATEST((v_long_strike_margin + v_long_hold_margin), (v_short_strike_margin + v_short_hold_margin + v_strike_margin));

      /* set @临时_交易占用金额# = GREATEST((@多头订单保证金# + @多头成交保证金# + @多头持仓保证金#), (@空头订单保证金# + @空头成交保证金# + @空头持仓保证金# + @订单保证金# + @成交保证金#)); */
      set v_tmp_trade_capt_amt = GREATEST((v_long_order_margin + v_long_strike_margin + v_long_hold_margin), (v_short_order_margin + v_short_strike_margin + v_short_hold_margin + v_order_margin + v_strike_margin));

      /* set @临时_指令占用金额# = GREATEST((@多头指令保证金#+@多头订单保证金# + @多头成交保证金# + @多头持仓保证金#), (@空头指令保证金#+@空头订单保证金# + @空头成交保证金# + @空头持仓保证金# +@指令保证金#+ @订单保证金# + @成交保证金#)); */
      set v_tmp_comm_capt_amt = GREATEST((v_long_comm_margin+v_long_order_margin + v_long_strike_margin + v_long_hold_margin), (v_short_comm_margin+v_short_order_margin + v_short_strike_margin + v_short_hold_margin +v_comm_margin+ v_order_margin + v_strike_margin));

      /* set @空头指令保证金# = @指令保证金# + @空头指令保证金# ; */
      set v_short_comm_margin = v_comm_margin + v_short_comm_margin ;

      /* set @空头订单保证金# = @订单保证金# + @空头订单保证金# ; */
      set v_short_order_margin = v_order_margin + v_short_order_margin ;

      /* set @空头成交保证金# = @成交保证金# + @空头成交保证金#; */
      set v_short_strike_margin = v_strike_margin + v_short_strike_margin;
    end if;

    /* set @成交变动金额# = @临时_成交占用金额# - @持仓占用金额#; */
    set v_strike_occur_amt = v_tmp_strike_capt_amt - v_posi_capt_amt;

    /* set @交易变动金额# = @临时_交易占用金额# - @交易占用金额# - @临时_成交占用金额#; */
    set v_trade_occur_amt = v_tmp_trade_capt_amt - v_trade_capt_amt - v_tmp_strike_capt_amt;

    /* set @指令变动金额# = @临时_指令占用金额# - @指令占用金额# -@临时_交易占用金额#; */
    set v_comm_occur_amt = v_tmp_comm_capt_amt - v_comm_capt_amt -v_tmp_trade_capt_amt;

    /* set @临时_指令占用金额# = @临时_指令占用金额# - @临时_交易占用金额#; */
    set v_tmp_comm_capt_amt = v_tmp_comm_capt_amt - v_tmp_trade_capt_amt;

    /* set @临时_交易占用金额# = @临时_交易占用金额# - @临时_成交占用金额#; */
    set v_tmp_trade_capt_amt = v_tmp_trade_capt_amt - v_tmp_strike_capt_amt;

    /* set @成交占用金额# = @临时_成交占用金额#; */
    set v_strike_capt_amt = v_tmp_strike_capt_amt;

    /* set @交易占用金额# = @临时_交易占用金额#; */
    set v_trade_capt_amt = v_tmp_trade_capt_amt;

    /* set @指令占用金额# = @临时_指令占用金额#; */
    set v_comm_capt_amt = v_tmp_comm_capt_amt;

    /* set @持仓占用金额#=@成交占用金额#; */
    set v_posi_capt_amt=v_strike_capt_amt;

    /* [插入重复更新][交易期货_账户_期货保证金优惠控制表][字段][字段变量][{多头指令保证金} = @多头指令保证金#,{空头指令保证金} = @空头指令保证金#,{多头订单保证金} = @多头订单保证金#, {空头订单保证金} = @空头订单保证金#, {多头成交保证金} = @多头成交保证金#, {空头成交保证金} = @空头成交保证金#, {交易占用金额} =@交易占用金额#,{持仓占用金额} =@持仓占用金额#,{指令占用金额} = @指令占用金额#][1][@产品编号#,@交易组编号#,@资产账户编号#,@市场编号#,@组合编码#,@套保标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdfutu.tb_tdfuac_margin_ctrl (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
        hedge_type, comb_code, long_comm_margin, short_comm_margin, 
        long_order_margin, short_order_margin, long_strike_margin, short_strike_margin, 
        long_hold_margin, short_hold_margin, trade_capt_amt, posi_capt_amt, 
        comm_capt_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
        v_hedge_type, v_comb_code, v_long_comm_margin, v_short_comm_margin, 
        v_long_order_margin, v_short_order_margin, v_long_strike_margin, v_short_strike_margin, 
        v_long_hold_margin, v_short_hold_margin, v_trade_capt_amt, v_posi_capt_amt, 
        v_comm_capt_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, long_comm_margin = v_long_comm_margin,short_comm_margin = v_short_comm_margin,long_order_margin = v_long_order_margin, short_order_margin = v_short_order_margin, long_strike_margin = v_long_strike_margin, short_strike_margin = v_short_strike_margin, trade_capt_amt =v_trade_capt_amt,posi_capt_amt =v_posi_capt_amt,comm_capt_amt = v_comm_capt_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.2.22.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","组合编码=",v_comb_code,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","组合编码=",v_comb_code,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_capt_amt = v_strike_capt_amt;
    SET p_trade_capt_amt = v_trade_capt_amt;
    SET p_comm_capt_amt = v_comm_capt_amt;
    SET p_long_comm_margin = v_long_comm_margin;
    SET p_short_comm_margin = v_short_comm_margin;
    SET p_long_order_margin = v_long_order_margin;
    SET p_short_order_margin = v_short_order_margin;
    SET p_long_strike_margin = v_long_strike_margin;
    SET p_short_strike_margin = v_short_strike_margin;
    SET p_trade_occur_amt = v_trade_occur_amt;
    SET p_strike_occur_amt = v_strike_occur_amt;
    SET p_comm_occur_amt = v_comm_occur_amt;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_新增期货持仓明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_InsertFuturesPosiDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_InsertFuturesPosiDetail(
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
    IN p_exch_crncy_type varchar(3),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_curr_qty decimal(18,2),
    IN p_hedge_type int,
    IN p_invest_type int,
    IN p_lngsht_type int,
    IN p_strike_no varchar(64),
    IN p_open_posi_price decimal(16,9),
    IN p_open_posi_qty decimal(18,2),
    IN p_open_posi_fee decimal(18,4),
    IN p_strike_amt decimal(18,4),
    IN p_open_amount decimal(18,4),
    IN p_strike_margin decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_detail_posi_id bigint
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
    declare v_exch_crncy_type varchar(3);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_curr_qty decimal(18,2);
    declare v_hedge_type int;
    declare v_invest_type int;
    declare v_lngsht_type int;
    declare v_strike_no varchar(64);
    declare v_open_posi_price decimal(16,9);
    declare v_open_posi_qty decimal(18,2);
    declare v_open_posi_fee decimal(18,4);
    declare v_strike_amt decimal(18,4);
    declare v_open_amount decimal(18,4);
    declare v_strike_margin decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_detail_posi_id bigint;
    declare v_open_posi_date int;
    declare v_mach_time int;
    declare v_open_posi_time int;
    declare v_close_posi_fee decimal(18,4);
    declare v_trade_capt_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_marked_sett_price decimal(16,9);
    declare v_close_pandl decimal(18,4);
    declare v_marked_pandl decimal(18,4);
    declare v_rece_margin decimal(18,4);
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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_curr_qty = p_curr_qty;
    SET v_hedge_type = p_hedge_type;
    SET v_invest_type = p_invest_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_strike_no = p_strike_no;
    SET v_open_posi_price = p_open_posi_price;
    SET v_open_posi_qty = p_open_posi_qty;
    SET v_open_posi_fee = p_open_posi_fee;
    SET v_strike_amt = p_strike_amt;
    SET v_open_amount = p_open_amount;
    SET v_strike_margin = p_strike_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_detail_posi_id = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_open_posi_time = date_format(curtime(),'%H%i%s');
    SET v_close_posi_fee = 0;
    SET v_trade_capt_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_marked_sett_price = 0;
    SET v_close_pandl = 0;
    SET v_marked_pandl = 0;
    SET v_rece_margin = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @开仓日期#=@初始化日期#; */
    set v_open_posi_date=v_init_date;

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* set @明细持仓序号#=0; */
    set v_detail_posi_id=0;

    /* set @开仓时间#=@机器时间#; */
    set v_open_posi_time=v_mach_time;

    /* set @平仓费用#=0; */
    set v_close_posi_fee=0;

    /* set @交易占用数量#=0; */
    set v_trade_capt_qty=0;

    /* set @成交占用数量#=0; */
    set v_strike_capt_qty=0;

    /* set @盯市结算价格#=0; */
    set v_marked_sett_price=0;

    /* set @平仓盈亏#=0; */
    set v_close_pandl=0;

    /* set @盯市盈亏#=0; */
    set v_marked_pandl=0;

    /* set @应收保证金#=@成交保证金#; */
    set v_rece_margin=v_strike_margin;

    /* [插入表记录][交易期货_账户_交易组持仓明细表][字段][字段变量][1][@机构编号#,@交易组编号#,@市场编号#,@合约代码编号#,@交易编码编号#,@资产账户编号#,@投资类型#,@多空类型#,@成交编号#,@套保标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdfutu.tb_tdfuac_exgp_posi_detail(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, exch_crncy_type, 
        futu_acco_no, contrc_code_no, contrc_unit, contrc_type, 
        curr_qty, invest_type, lngsht_type, hedge_type, 
        open_posi_date, open_posi_time, open_posi_price, open_posi_qty, 
        open_amount, open_posi_fee, close_posi_fee, trade_capt_qty, 
        strike_capt_qty, marked_sett_price, strike_no, detail_posi_id, 
        rece_margin, close_pandl, marked_pandl) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_no, v_exch_crncy_type, 
        v_futu_acco_no, v_contrc_code_no, v_contrc_unit, v_contrc_type, 
        v_curr_qty, v_invest_type, v_lngsht_type, v_hedge_type, 
        v_open_posi_date, v_open_posi_time, v_open_posi_price, v_open_posi_qty, 
        v_open_amount, v_open_posi_fee, v_close_posi_fee, v_trade_capt_qty, 
        v_strike_capt_qty, v_marked_sett_price, v_strike_no, v_detail_posi_id, 
        v_rece_margin, v_close_pandl, v_marked_pandl);
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.2.24.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no,",","市场编号=",v_exch_no,",","合约代码编号=",v_contrc_code_no,",","交易编码编号=",v_futu_acco_no,",","资产账户编号=",v_asset_acco_no,",","投资类型=",v_invest_type,",","多空类型=",v_lngsht_type,",","成交编号=",v_strike_no,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@明细持仓序号#] */
    select LAST_INSERT_ID() into v_detail_posi_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_detail_posi_id = v_detail_posi_id;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_平仓成交更新期货明细持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_CloseStrikePosiDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_CloseStrikePosiDetail(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_unit int,
    IN p_hedge_type int,
    IN p_calc_dir int,
    IN p_invest_type int,
    IN p_lngsht_type int,
    IN p_strike_no varchar(64),
    IN p_strike_price decimal(16,9),
    IN p_strike_occur_qty decimal(18,2),
    IN p_strike_fee decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_open_amount decimal(18,4),
    OUT p_close_pandl decimal(18,4),
    OUT p_rece_margin decimal(18,4),
    OUT p_detail_posi_id bigint
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_unit int;
    declare v_hedge_type int;
    declare v_calc_dir int;
    declare v_invest_type int;
    declare v_lngsht_type int;
    declare v_strike_no varchar(64);
    declare v_strike_price decimal(16,9);
    declare v_strike_occur_qty decimal(18,2);
    declare v_strike_fee decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_open_amount decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_detail_posi_id bigint;
    declare v_tmp_open_amount decimal(18,4);
    declare v_tmp_strike_occur_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_open_posi_qty decimal(18,2);
    declare v_open_posi_price decimal(16,9);
    declare v_strike_capt_qty decimal(18,2);
    declare v_tmp_rece_margin decimal(18,4);
    declare v_tmp_close_pandl decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_unit = p_contrc_unit;
    SET v_hedge_type = p_hedge_type;
    SET v_calc_dir = p_calc_dir;
    SET v_invest_type = p_invest_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_strike_no = p_strike_no;
    SET v_strike_price = p_strike_price;
    SET v_strike_occur_qty = p_strike_occur_qty;
    SET v_strike_fee = p_strike_fee;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_open_amount = 0;
    SET v_close_pandl = 0;
    SET v_rece_margin = 0;
    SET v_detail_posi_id = 0;
    SET v_tmp_open_amount = 0;
    SET v_tmp_strike_occur_qty = 0;
    SET v_row_id = 0;
    SET v_open_posi_qty = 0;
    SET v_open_posi_price = 0;
    SET v_strike_capt_qty = 0;
    SET v_tmp_rece_margin = 0;
    SET v_tmp_close_pandl = 0;
    SET v_close_posi_fee = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @临时_开仓金额#=0; */
    set v_tmp_open_amount=0;

    /* set @平仓盈亏#=0; */
    set v_close_pandl=0;

    /* set @应收保证金#=0; */
    set v_rece_margin=0;

    /* set @临时_成交变动数量# = @成交变动数量#; */
    set v_tmp_strike_occur_qty = v_strike_occur_qty;

    /* select max({记录序号}) into @记录序号# from ~交易期货_账户_交易组持仓明细表^ where {机构编号}=@机构编号# and {交易组编号}=@交易组编号# and {市场编号}=@市场编号# and {合约代码编号}=@合约代码编号# and {投资类型}=@投资类型# and {资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#; */
    select max(row_id) into v_row_id from db_tdfutu.tb_tdfuac_exgp_posi_detail where co_no=v_co_no and exch_group_no=v_exch_group_no and exch_no=v_exch_no and contrc_code_no=v_contrc_code_no and invest_type=v_invest_type and asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type;
    loop_label:loop

      /* if @成交变动数量#<=0 then */
      if v_strike_occur_qty<=0 then
         leave loop_label;
      end if;

      /* [获取表记录变量][交易期货_账户_交易组持仓明细表][{记录序号},{开仓数量},{开仓价格},{成交占用数量},{应收保证金},{开仓金额}][@明细持仓序号#,@开仓数量#,@开仓价格#,@成交占用数量#,@临时_应收保证金#,@开仓金额#][{机构编号}=@机构编号# and {交易组编号}=@交易组编号# and {市场编号}=@市场编号# and {合约代码编号}=@合约代码编号# and {投资类型}=@投资类型# and {资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志# and {开仓数量}>{成交占用数量} and {记录序号}<=@记录序号#][4][@机构编号#,@交易组编号#,@市场编号#,@合约代码编号#,@交易编码编号#,@多空类型#,@套保标志#] */
      select row_id,open_posi_qty,open_posi_price,strike_capt_qty,rece_margin,open_amount into v_detail_posi_id,v_open_posi_qty,v_open_posi_price,v_strike_capt_qty,v_tmp_rece_margin,v_open_amount from db_tdfutu.tb_tdfuac_exgp_posi_detail where co_no=v_co_no and exch_group_no=v_exch_group_no and exch_no=v_exch_no and contrc_code_no=v_contrc_code_no and invest_type=v_invest_type and asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type and open_posi_qty>strike_capt_qty and row_id<=v_row_id limit 1;
      if FOUND_ROWS() = 0 then
                  
          SET v_error_code = "tdfutuA.2.25.4";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no,",","市场编号=",v_exch_no,",","合约代码编号=",v_contrc_code_no,",","交易编码编号=",v_futu_acco_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
          else
              SET v_error_info = concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no,",","市场编号=",v_exch_no,",","合约代码编号=",v_contrc_code_no,",","交易编码编号=",v_futu_acco_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
          end if;
          leave label_pro;
      end if;


      /* if @成交变动数量#>(@开仓数量#-@成交占用数量#) then */
      if v_strike_occur_qty>(v_open_posi_qty-v_strike_capt_qty) then

        /* set @临时_平仓盈亏#=@计算方向#*(@开仓数量#-@成交占用数量#)*(@成交价格#-@开仓价格#)*@合约乘数#; */
        set v_tmp_close_pandl=v_calc_dir*(v_open_posi_qty-v_strike_capt_qty)*(v_strike_price-v_open_posi_price)*v_contrc_unit;

        /* set @平仓盈亏#=@平仓盈亏#+@临时_平仓盈亏#; */
        set v_close_pandl=v_close_pandl+v_tmp_close_pandl;

        /* set @临时_开仓金额#=@临时_开仓金额#+@开仓金额#; */
        set v_tmp_open_amount=v_tmp_open_amount+v_open_amount;

        /* set @应收保证金#=ifnull(@应收保证金#+(@开仓数量#-@成交占用数量#)*@临时_应收保证金#/@开仓数量#,0); */
        set v_rece_margin=ifnull(v_rece_margin+(v_open_posi_qty-v_strike_capt_qty)*v_tmp_rece_margin/v_open_posi_qty,0);

        /* set @平仓费用#=round((@开仓数量# - @成交占用数量#) / @临时_成交变动数量# * @成交费用#,2); */
        set v_close_posi_fee=round((v_open_posi_qty - v_strike_capt_qty) / v_tmp_strike_occur_qty * v_strike_fee,2);

        /* set @成交费用# = @成交费用# - @平仓费用#; */
        set v_strike_fee = v_strike_fee - v_close_posi_fee;

        /* [更新表记录][交易期货_账户_交易组持仓明细表][{成交占用数量}=@开仓数量#,{平仓盈亏}={平仓盈亏}+@临时_平仓盈亏#,{开仓金额}={开仓金额}-@开仓金额#,{应收保证金}={应收保证金}-@应收保证金#,{平仓费用} = {平仓费用} +@平仓费用#][{记录序号}=@明细持仓序号#][2][@明细持仓序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdfutu.tb_tdfuac_exgp_posi_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_capt_qty=v_open_posi_qty,close_pandl=close_pandl+v_tmp_close_pandl,open_amount=open_amount-v_open_amount,rece_margin=rece_margin-v_rece_margin,close_posi_fee = close_posi_fee +v_close_posi_fee where row_id=v_detail_posi_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdfutuA.2.25.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
            end if;
            leave label_pro;
        end if;

        #set @应收保证金#=ifnull(@应收保证金#+(@开仓数量#-@成交占用数量#)*@临时_应收保证金#/@开仓数量#,0);

        /* set @成交变动数量#=@成交变动数量#-(@开仓数量#-@成交占用数量#); */
        set v_strike_occur_qty=v_strike_occur_qty-(v_open_posi_qty-v_strike_capt_qty);
      else

        /* set @临时_平仓盈亏#=@计算方向#*@成交变动数量#*(@成交价格#-@开仓价格#)*@合约乘数#; */
        set v_tmp_close_pandl=v_calc_dir*v_strike_occur_qty*(v_strike_price-v_open_posi_price)*v_contrc_unit;

        /* set @平仓盈亏#=@平仓盈亏#+@临时_平仓盈亏#; */
        set v_close_pandl=v_close_pandl+v_tmp_close_pandl;

        /* set @开仓金额#=ifnull(@成交变动数量#/(@开仓数量#-@成交占用数量#)*@开仓金额#,0); */
        set v_open_amount=ifnull(v_strike_occur_qty/(v_open_posi_qty-v_strike_capt_qty)*v_open_amount,0);

        /* set @临时_开仓金额#=@临时_开仓金额#+@开仓金额#; */
        set v_tmp_open_amount=v_tmp_open_amount+v_open_amount;

        /* set @应收保证金#=ifnull(@应收保证金#+@成交变动数量#*@临时_应收保证金#/(@开仓数量#-@成交占用数量#),0); */
        set v_rece_margin=ifnull(v_rece_margin+v_strike_occur_qty*v_tmp_rece_margin/(v_open_posi_qty-v_strike_capt_qty),0);

        /* set @成交费用# = round(@成交费用#,2); */
        set v_strike_fee = round(v_strike_fee,2);

        /* [更新表记录][交易期货_账户_交易组持仓明细表][{成交占用数量}={成交占用数量}+@成交变动数量#,{平仓盈亏}={平仓盈亏}+@临时_平仓盈亏#,{开仓金额}={开仓金额}-@开仓金额#,{应收保证金}={应收保证金}-@应收保证金#,{平仓费用} = {平仓费用} +@成交费用#][{记录序号}=@明细持仓序号#][2][@明细持仓序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdfutu.tb_tdfuac_exgp_posi_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_capt_qty=strike_capt_qty+v_strike_occur_qty,close_pandl=close_pandl+v_tmp_close_pandl,open_amount=open_amount-v_open_amount,rece_margin=rece_margin-v_rece_margin,close_posi_fee = close_posi_fee +v_strike_fee where row_id=v_detail_posi_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdfutuA.2.25.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
            end if;
            leave label_pro;
        end if;

        #set @应收保证金#=ifnull(@应收保证金#+@成交变动数量#*@临时_应收保证金#/@开仓数量#,0);

        /* set @成交变动数量#=0; */
        set v_strike_occur_qty=0;
      end if;
    end loop;

    /* set @开仓金额#=@临时_开仓金额#; */
    set v_open_amount=v_tmp_open_amount;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_open_amount = v_open_amount;
    SET p_close_pandl = v_close_pandl;
    SET p_rece_margin = v_rece_margin;
    SET p_detail_posi_id = v_detail_posi_id;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_锁定获取保证金优惠信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_GetMarginLocked;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_GetMarginLocked(
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
    IN p_comb_code varchar(6),
    IN p_hedge_type int,
    IN p_long_hold_margin decimal(18,4),
    IN p_short_hold_margin decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_long_comm_margin decimal(18,4),
    OUT p_short_comm_margin decimal(18,4),
    OUT p_long_order_margin decimal(18,4),
    OUT p_short_order_margin decimal(18,4),
    OUT p_long_strike_margin decimal(18,4),
    OUT p_short_strike_margin decimal(18,4),
    OUT p_trade_capt_amt decimal(18,4),
    OUT p_posi_capt_amt decimal(18,4),
    OUT p_comm_capt_amt decimal(18,4),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_comb_code varchar(6);
    declare v_hedge_type int;
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_long_comm_margin decimal(18,4);
    declare v_short_comm_margin decimal(18,4);
    declare v_long_order_margin decimal(18,4);
    declare v_short_order_margin decimal(18,4);
    declare v_long_strike_margin decimal(18,4);
    declare v_short_strike_margin decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_posi_capt_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_row_id bigint;
    declare v_exch_crncy_type varchar(3);
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
    SET v_comb_code = p_comb_code;
    SET v_hedge_type = p_hedge_type;
    SET v_long_hold_margin = p_long_hold_margin;
    SET v_short_hold_margin = p_short_hold_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_long_comm_margin = 0;
    SET v_short_comm_margin = 0;
    SET v_long_order_margin = 0;
    SET v_short_order_margin = 0;
    SET v_long_strike_margin = 0;
    SET v_short_strike_margin = 0;
    SET v_trade_capt_amt = 0;
    SET v_posi_capt_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_row_id = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易期货_账户_期货保证金优惠控制表][{记录序号}][@记录序号#][{产品编号} = @产品编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {市场编号} = @市场编号# and {组合编码} = @组合编码# and {套保标志} = @套保标志#] */
    select row_id into v_row_id from db_tdfutu.tb_tdfuac_margin_ctrl where pd_no = v_pd_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and exch_no = v_exch_no and comb_code = v_comb_code and hedge_type = v_hedge_type limit 1;


    /* if @记录序号# = 0 then */
    if v_row_id = 0 then

      /* set @交易币种#="CNY"; */
      set v_exch_crncy_type="CNY";

      /* set @多头指令保证金#=0; */
      set v_long_comm_margin=0;

      /* set @空头指令保证金#=0; */
      set v_short_comm_margin=0;

      /* set @多头订单保证金#=0; */
      set v_long_order_margin=0;

      /* set @空头订单保证金#=0; */
      set v_short_order_margin=0;

      /* set @多头成交保证金#=0; */
      set v_long_strike_margin=0;

      /* set @空头成交保证金#=0; */
      set v_short_strike_margin=0;

      /* set @交易占用金额#=0; */
      set v_trade_capt_amt=0;

      /* set @指令占用金额# = 0; */
      set v_comm_capt_amt = 0;

      /* set @持仓占用金额#=GREATEST(@多头持仓保证金#, @空头持仓保证金#); */
      set v_posi_capt_amt=GREATEST(v_long_hold_margin, v_short_hold_margin);

      /* [插入表记录][交易期货_账户_期货保证金优惠控制表][字段][字段变量][1][@产品编号#,@交易组编号#,@资产账户编号#,@市场编号#,@组合编码#,@套保标志#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfuac_margin_ctrl(
          create_date, create_time, update_date, 
          update_time, update_times, co_no, pd_no, 
          exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
          hedge_type, comb_code, long_comm_margin, short_comm_margin, 
          long_order_margin, short_order_margin, long_strike_margin, short_strike_margin, 
          long_hold_margin, short_hold_margin, trade_capt_amt, posi_capt_amt, 
          comm_capt_amt) 
      value( 
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_co_no, v_pd_no, 
          v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
          v_hedge_type, v_comb_code, v_long_comm_margin, v_short_comm_margin, 
          v_long_order_margin, v_short_order_margin, v_long_strike_margin, v_short_strike_margin, 
          v_long_hold_margin, v_short_hold_margin, v_trade_capt_amt, v_posi_capt_amt, 
          v_comm_capt_amt);
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.2.26.1";
          SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","组合编码=",v_comb_code,",","套保标志=",v_hedge_type),"#",v_mysql_message);
          leave label_pro;
      end if;


      /* [获取记录序号][@记录序号#] */
      select LAST_INSERT_ID() into v_row_id;

    else

      /* [锁定获取表记录变量][交易期货_账户_期货保证金优惠控制表][{多头指令保证金}, {空头指令保证金}, {多头订单保证金}, {空头订单保证金}, {多头成交保证金}, {空头成交保证金},{交易占用金额}, {持仓占用金额},{指令占用金额}][@多头指令保证金#, @空头指令保证金#, @多头订单保证金#, @空头订单保证金#, @多头成交保证金#, @空头成交保证金#,@交易占用金额#,@持仓占用金额#,@指令占用金额#][{记录序号}=@记录序号#][4][@记录序号#] */
      select long_comm_margin, short_comm_margin, long_order_margin, short_order_margin, long_strike_margin, short_strike_margin,trade_capt_amt, posi_capt_amt,comm_capt_amt into v_long_comm_margin, v_short_comm_margin, v_long_order_margin, v_short_order_margin, v_long_strike_margin, v_short_strike_margin,v_trade_capt_amt,v_posi_capt_amt,v_comm_capt_amt from db_tdfutu.tb_tdfuac_margin_ctrl where row_id=v_row_id limit 1 for update;
      if FOUND_ROWS() = 0 then
                  
          SET v_error_code = "tdfutuA.2.26.4";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
          else
              SET v_error_info = concat("记录序号=",v_row_id);
          end if;
          leave label_pro;
      end if;

    end if;
    #  set @交易币种#="CNY";
    #  set @多头指令保证金#=0;
    #  set @空头指令保证金#=0;
    #  set @多头订单保证金#=0;
    #  set @空头订单保证金#=0;
    #  set @多头成交保证金#=0;
    #  set @空头成交保证金#=0;
    #  set @交易占用金额#=0;
    #  set @指令占用金额# = 0;
    #  set @持仓占用金额#=GREATEST(@多头持仓保证金#, @空头持仓保证金#);
    #
    #[插入重复更新][交易期货_账户_期货保证金优惠控制表][字段][字段变量][{持仓占用金额}=@持仓占用金额#][1][@产品编号#,@交易组编号#,@资产账户编号#,@市场编号#,@组合编码#,@套保标志#]
    #
    #[获取表记录变量语句][交易期货_账户_期货保证金优惠控制表][{记录序号}][@记录序号#][{产品编号} = @产品编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {市场编号} = #@市场编号# and {组合编码} = @组合编码# and {套保标志} = @套保标志#]
    #[锁定获取表记录变量][交易期货_账户_期货保证金优惠控制表][{多头指令保证金}, {空头指令保证金}, {多头订单保证金}, {空头订单保证金}, {多头成交保证金}, {空头成交保证金},{交易占用金额}, #{持仓占用金额},{指令占用金额}][@多头指令保证金#, @空头指令保证金#, @多头订单保证金#, @空头订单保证金#, @多头成交保证金#, @空头成交保证金#,@交易占用金额#, #@持仓占用金额#,@指令占用金额#][{记录序号}=@记录序号#][4][@记录序号#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_long_comm_margin = v_long_comm_margin;
    SET p_short_comm_margin = v_short_comm_margin;
    SET p_long_order_margin = v_long_order_margin;
    SET p_short_order_margin = v_short_order_margin;
    SET p_long_strike_margin = v_long_strike_margin;
    SET p_short_strike_margin = v_short_strike_margin;
    SET p_trade_capt_amt = v_trade_capt_amt;
    SET p_posi_capt_amt = v_posi_capt_amt;
    SET p_comm_capt_amt = v_comm_capt_amt;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_获取交易组资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_GetExgpAsacCash;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_GetExgpAsacCash(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_exch_crncy_type varchar(3),
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exgp_begin_amt decimal(18,4),
    OUT p_exgp_curr_amt decimal(18,4),
    OUT p_exgp_frozen_amt decimal(18,4),
    OUT p_exgp_unfroz_amt decimal(18,4),
    OUT p_exgp_comm_frozen_amt decimal(18,4),
    OUT p_exgp_comm_unfroz_amt decimal(18,4),
    OUT p_exgp_comm_capt_amt decimal(18,4),
    OUT p_exgp_comm_releas_amt decimal(18,4),
    OUT p_exgp_trade_capt_amt decimal(18,4),
    OUT p_exgp_trade_releas_amt decimal(18,4),
    OUT p_exgp_strike_capt_amt decimal(18,4),
    OUT p_exgp_strike_releas_amt decimal(18,4),
    OUT p_exgp_capt_margin decimal(18,4),
    OUT p_exgp_trade_fee decimal(18,4),
    OUT p_exgp_strike_fee decimal(18,4),
    OUT p_exgp_close_pandl decimal(18,4),
    OUT p_exgp_marked_pandl decimal(18,4),
    OUT p_exgp_cash_update_times int,
    OUT p_asac_row_id bigint,
    OUT p_asac_begin_amt decimal(18,4),
    OUT p_asac_curr_amt decimal(18,4),
    OUT p_asac_frozen_amt decimal(18,4),
    OUT p_asac_unfroz_amt decimal(18,4),
    OUT p_asac_comm_frozen_amt decimal(18,4),
    OUT p_asac_comm_unfroz_amt decimal(18,4),
    OUT p_asac_comm_capt_amt decimal(18,4),
    OUT p_asac_comm_releas_amt decimal(18,4),
    OUT p_asac_trade_capt_amt decimal(18,4),
    OUT p_asac_trade_releas_amt decimal(18,4),
    OUT p_asac_strike_capt_amt decimal(18,4),
    OUT p_asac_strike_releas_amt decimal(18,4),
    OUT p_asac_capt_margin decimal(18,4),
    OUT p_asac_trade_fee decimal(18,4),
    OUT p_asac_strike_fee decimal(18,4),
    OUT p_asac_close_pandl decimal(18,4),
    OUT p_asac_marked_pandl decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_asset_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exgp_begin_amt decimal(18,4);
    declare v_exgp_curr_amt decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exgp_comm_frozen_amt decimal(18,4);
    declare v_exgp_comm_unfroz_amt decimal(18,4);
    declare v_exgp_comm_capt_amt decimal(18,4);
    declare v_exgp_comm_releas_amt decimal(18,4);
    declare v_exgp_trade_capt_amt decimal(18,4);
    declare v_exgp_trade_releas_amt decimal(18,4);
    declare v_exgp_strike_capt_amt decimal(18,4);
    declare v_exgp_strike_releas_amt decimal(18,4);
    declare v_exgp_capt_margin decimal(18,4);
    declare v_exgp_trade_fee decimal(18,4);
    declare v_exgp_strike_fee decimal(18,4);
    declare v_exgp_close_pandl decimal(18,4);
    declare v_exgp_marked_pandl decimal(18,4);
    declare v_exgp_cash_update_times int;
    declare v_asac_row_id bigint;
    declare v_asac_begin_amt decimal(18,4);
    declare v_asac_curr_amt decimal(18,4);
    declare v_asac_frozen_amt decimal(18,4);
    declare v_asac_unfroz_amt decimal(18,4);
    declare v_asac_comm_frozen_amt decimal(18,4);
    declare v_asac_comm_unfroz_amt decimal(18,4);
    declare v_asac_comm_capt_amt decimal(18,4);
    declare v_asac_comm_releas_amt decimal(18,4);
    declare v_asac_trade_capt_amt decimal(18,4);
    declare v_asac_trade_releas_amt decimal(18,4);
    declare v_asac_strike_capt_amt decimal(18,4);
    declare v_asac_strike_releas_amt decimal(18,4);
    declare v_asac_capt_margin decimal(18,4);
    declare v_asac_trade_fee decimal(18,4);
    declare v_asac_strike_fee decimal(18,4);
    declare v_asac_close_pandl decimal(18,4);
    declare v_asac_marked_pandl decimal(18,4);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exgp_begin_amt = 0;
    SET v_exgp_curr_amt = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exgp_comm_frozen_amt = 0;
    SET v_exgp_comm_unfroz_amt = 0;
    SET v_exgp_comm_capt_amt = 0;
    SET v_exgp_comm_releas_amt = 0;
    SET v_exgp_trade_capt_amt = 0;
    SET v_exgp_trade_releas_amt = 0;
    SET v_exgp_strike_capt_amt = 0;
    SET v_exgp_strike_releas_amt = 0;
    SET v_exgp_capt_margin = 0;
    SET v_exgp_trade_fee = 0;
    SET v_exgp_strike_fee = 0;
    SET v_exgp_close_pandl = 0;
    SET v_exgp_marked_pandl = 0;
    SET v_exgp_cash_update_times = 1;
    SET v_asac_row_id = 0;
    SET v_asac_begin_amt = 0;
    SET v_asac_curr_amt = 0;
    SET v_asac_frozen_amt = 0;
    SET v_asac_unfroz_amt = 0;
    SET v_asac_comm_frozen_amt = 0;
    SET v_asac_comm_unfroz_amt = 0;
    SET v_asac_comm_capt_amt = 0;
    SET v_asac_comm_releas_amt = 0;
    SET v_asac_trade_capt_amt = 0;
    SET v_asac_trade_releas_amt = 0;
    SET v_asac_strike_capt_amt = 0;
    SET v_asac_strike_releas_amt = 0;
    SET v_asac_capt_margin = 0;
    SET v_asac_trade_fee = 0;
    SET v_asac_strike_fee = 0;
    SET v_asac_close_pandl = 0;
    SET v_asac_marked_pandl = 0;
    SET v_asac_cash_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易期货_账户_交易组业务资金表][{记录序号},{机构编号},{产品编号},{期初金额},{当前金额},{冻结金额},{解冻金额},{指令冻结金额},{指令解冻金额},{指令占用金额},{指令释放金额},{交易占用金额},{交易释放金额},{成交占用金额},{成交释放金额},{占用保证金},{交易费用},{成交费用},{平仓盈亏},{盯市盈亏},{更新次数}][@交易组记录序号#,@机构编号#,@产品编号#,@交易组期初金额#,@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组指令冻结金额#,@交易组指令解冻金额#,@交易组指令占用金额#,@交易组指令释放金额#,@交易组交易占用金额#,@交易组交易释放金额#,@交易组成交占用金额#,@交易组成交释放金额#,@交易组占用保证金#,@交易组交易费用#,@交易组成交费用#,@交易组平仓盈亏#,@交易组盯市盈亏#,@交易组资金更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and  {交易币种} = @交易币种#][4][@交易组编号#,@资产账户编号#,@交易币种#] */
    select row_id,co_no,pd_no,begin_amt,curr_amt,frozen_amt,unfroz_amt,comm_frozen_amt,comm_unfroz_amt,comm_capt_amt,comm_releas_amt,trade_capt_amt,trade_releas_amt,strike_capt_amt,strike_releas_amt,capt_margin,trade_fee,strike_fee,close_pandl,marked_pandl,update_times into v_exgp_row_id,v_co_no,v_pd_no,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_comm_frozen_amt,v_exgp_comm_unfroz_amt,v_exgp_comm_capt_amt,v_exgp_comm_releas_amt,v_exgp_trade_capt_amt,v_exgp_trade_releas_amt,v_exgp_strike_capt_amt,v_exgp_strike_releas_amt,v_exgp_capt_margin,v_exgp_trade_fee,v_exgp_strike_fee,v_exgp_close_pandl,v_exgp_marked_pandl,v_exgp_cash_update_times from db_tdfutu.tb_tdfuac_exgp_busi_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and  exch_crncy_type = v_exch_crncy_type limit 1;


    /* [获取表记录变量语句][交易期货_账户_资产账户业务资金表][{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{指令冻结金额},{指令解冻金额},{指令占用金额},{指令释放金额},{交易占用金额},{交易释放金额},{成交占用金额},{成交释放金额},{占用保证金},{交易费用},{成交费用},{平仓盈亏},{盯市盈亏},{更新次数}][@资产账户记录序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户指令冻结金额#,@资产账户指令解冻金额#,@资产账户指令占用金额#,@资产账户指令释放金额#,@资产账户交易占用金额#,@资产账户交易释放金额#,@资产账户成交占用金额#,@资产账户成交释放金额#,@资产账户占用保证金#,@资产账户交易费用#,@资产账户成交费用#,@资产账户平仓盈亏#,@资产账户盯市盈亏#,@资产账户资金更新次数#][{资产账户编号}=@资产账户编号# and {交易币种} = @交易币种#][4][@资产账户编号#,@交易币种#] */
    select row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,comm_frozen_amt,comm_unfroz_amt,comm_capt_amt,comm_releas_amt,trade_capt_amt,trade_releas_amt,strike_capt_amt,strike_releas_amt,capt_margin,trade_fee,strike_fee,close_pandl,marked_pandl,update_times into v_asac_row_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_comm_frozen_amt,v_asac_comm_unfroz_amt,v_asac_comm_capt_amt,v_asac_comm_releas_amt,v_asac_trade_capt_amt,v_asac_trade_releas_amt,v_asac_strike_capt_amt,v_asac_strike_releas_amt,v_asac_capt_margin,v_asac_trade_fee,v_asac_strike_fee,v_asac_close_pandl,v_asac_marked_pandl,v_asac_cash_update_times from db_tdfutu.tb_tdfuac_asac_busi_capit where asset_acco_no=v_asset_acco_no and exch_crncy_type = v_exch_crncy_type limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_row_id = v_exgp_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exgp_begin_amt = v_exgp_begin_amt;
    SET p_exgp_curr_amt = v_exgp_curr_amt;
    SET p_exgp_frozen_amt = v_exgp_frozen_amt;
    SET p_exgp_unfroz_amt = v_exgp_unfroz_amt;
    SET p_exgp_comm_frozen_amt = v_exgp_comm_frozen_amt;
    SET p_exgp_comm_unfroz_amt = v_exgp_comm_unfroz_amt;
    SET p_exgp_comm_capt_amt = v_exgp_comm_capt_amt;
    SET p_exgp_comm_releas_amt = v_exgp_comm_releas_amt;
    SET p_exgp_trade_capt_amt = v_exgp_trade_capt_amt;
    SET p_exgp_trade_releas_amt = v_exgp_trade_releas_amt;
    SET p_exgp_strike_capt_amt = v_exgp_strike_capt_amt;
    SET p_exgp_strike_releas_amt = v_exgp_strike_releas_amt;
    SET p_exgp_capt_margin = v_exgp_capt_margin;
    SET p_exgp_trade_fee = v_exgp_trade_fee;
    SET p_exgp_strike_fee = v_exgp_strike_fee;
    SET p_exgp_close_pandl = v_exgp_close_pandl;
    SET p_exgp_marked_pandl = v_exgp_marked_pandl;
    SET p_exgp_cash_update_times = v_exgp_cash_update_times;
    SET p_asac_row_id = v_asac_row_id;
    SET p_asac_begin_amt = v_asac_begin_amt;
    SET p_asac_curr_amt = v_asac_curr_amt;
    SET p_asac_frozen_amt = v_asac_frozen_amt;
    SET p_asac_unfroz_amt = v_asac_unfroz_amt;
    SET p_asac_comm_frozen_amt = v_asac_comm_frozen_amt;
    SET p_asac_comm_unfroz_amt = v_asac_comm_unfroz_amt;
    SET p_asac_comm_capt_amt = v_asac_comm_capt_amt;
    SET p_asac_comm_releas_amt = v_asac_comm_releas_amt;
    SET p_asac_trade_capt_amt = v_asac_trade_capt_amt;
    SET p_asac_trade_releas_amt = v_asac_trade_releas_amt;
    SET p_asac_strike_capt_amt = v_asac_strike_capt_amt;
    SET p_asac_strike_releas_amt = v_asac_strike_releas_amt;
    SET p_asac_capt_margin = v_asac_capt_margin;
    SET p_asac_trade_fee = v_asac_trade_fee;
    SET p_asac_strike_fee = v_asac_strike_fee;
    SET p_asac_close_pandl = v_asac_close_pandl;
    SET p_asac_marked_pandl = v_asac_marked_pandl;
    SET p_asac_cash_update_times = v_asac_cash_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_获取交易组资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_GetExgpAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_GetExgpAsacPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_crncy_type varchar(3),
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_comb_code varchar(6),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_comm_releas_qty decimal(18,2),
    OUT p_exgp_trade_releas_qty decimal(18,2),
    OUT p_exgp_strike_releas_qty decimal(18,2),
    OUT p_exgp_old_comm_capt_qty decimal(18,2),
    OUT p_exgp_today_comm_capt_qty decimal(18,2),
    OUT p_exgp_old_trade_capt_qty decimal(18,2),
    OUT p_exgp_today_trade_capt_qty decimal(18,2),
    OUT p_exgp_pre_strike_capt_qty decimal(18,2),
    OUT p_exgp_today_strike_capt_qty decimal(18,2),
    OUT p_exgp_rece_margin decimal(18,4),
    OUT p_pre_settle_price decimal(16,9),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exgp_open_amount decimal(18,4),
    OUT p_exgp_posi_update_times int,
    OUT p_asac_row_id bigint,
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_comm_releas_qty decimal(18,2),
    OUT p_asac_trade_releas_qty decimal(18,2),
    OUT p_asac_strike_releas_qty decimal(18,2),
    OUT p_asac_old_comm_capt_qty decimal(18,2),
    OUT p_asac_today_comm_capt_qty decimal(18,2),
    OUT p_asac_old_trade_capt_qty decimal(18,2),
    OUT p_asac_today_trade_capt_qty decimal(18,2),
    OUT p_asac_pre_strike_capt_qty decimal(18,2),
    OUT p_asac_today_strike_capt_qty decimal(18,2),
    OUT p_asac_rece_margin decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_open_amount decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_comb_code varchar(6);
    declare v_exgp_frozen_qty decimal(18,2);
    declare v_exgp_unfroz_qty decimal(18,2);
    declare v_exgp_comm_releas_qty decimal(18,2);
    declare v_exgp_trade_releas_qty decimal(18,2);
    declare v_exgp_strike_releas_qty decimal(18,2);
    declare v_exgp_old_comm_capt_qty decimal(18,2);
    declare v_exgp_today_comm_capt_qty decimal(18,2);
    declare v_exgp_old_trade_capt_qty decimal(18,2);
    declare v_exgp_today_trade_capt_qty decimal(18,2);
    declare v_exgp_pre_strike_capt_qty decimal(18,2);
    declare v_exgp_today_strike_capt_qty decimal(18,2);
    declare v_exgp_rece_margin decimal(18,4);
    declare v_pre_settle_price decimal(16,9);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exgp_open_amount decimal(18,4);
    declare v_exgp_posi_update_times int;
    declare v_asac_row_id bigint;
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_comm_releas_qty decimal(18,2);
    declare v_asac_trade_releas_qty decimal(18,2);
    declare v_asac_strike_releas_qty decimal(18,2);
    declare v_asac_old_comm_capt_qty decimal(18,2);
    declare v_asac_today_comm_capt_qty decimal(18,2);
    declare v_asac_old_trade_capt_qty decimal(18,2);
    declare v_asac_today_trade_capt_qty decimal(18,2);
    declare v_asac_pre_strike_capt_qty decimal(18,2);
    declare v_asac_today_strike_capt_qty decimal(18,2);
    declare v_asac_rece_margin decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_open_amount decimal(18,4);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_comb_code = " ";
    SET v_exgp_frozen_qty = 0;
    SET v_exgp_unfroz_qty = 0;
    SET v_exgp_comm_releas_qty = 0;
    SET v_exgp_trade_releas_qty = 0;
    SET v_exgp_strike_releas_qty = 0;
    SET v_exgp_old_comm_capt_qty = 0;
    SET v_exgp_today_comm_capt_qty = 0;
    SET v_exgp_old_trade_capt_qty = 0;
    SET v_exgp_today_trade_capt_qty = 0;
    SET v_exgp_pre_strike_capt_qty = 0;
    SET v_exgp_today_strike_capt_qty = 0;
    SET v_exgp_rece_margin = 0;
    SET v_pre_settle_price = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exgp_open_amount = 0;
    SET v_exgp_posi_update_times = 1;
    SET v_asac_row_id = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_comm_releas_qty = 0;
    SET v_asac_trade_releas_qty = 0;
    SET v_asac_strike_releas_qty = 0;
    SET v_asac_old_comm_capt_qty = 0;
    SET v_asac_today_comm_capt_qty = 0;
    SET v_asac_old_trade_capt_qty = 0;
    SET v_asac_today_trade_capt_qty = 0;
    SET v_asac_pre_strike_capt_qty = 0;
    SET v_asac_today_strike_capt_qty = 0;
    SET v_asac_rece_margin = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_open_amount = 0;
    SET v_asac_posi_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易期货_账户_交易组业务持仓表][{记录序号},{机构编号},{产品编号},{交易币种},{合约类型},{合约乘数},{组合编码},{冻结数量},{解冻数量},{指令释放数量},{交易释放数量},{成交释放数量},{老仓指令占用数量},{今仓指令占用数量},{老仓交易占用数量},{今仓交易占用数量},{老仓成交占用数量},{今仓成交占用数量},{应收保证金},{昨结算价},{实现盈亏},{开仓金额},{更新次数}][@交易组记录序号#,@机构编号#,@产品编号#,@交易币种#,@合约类型#,@合约乘数#,@组合编码#,@交易组冻结数量#,@交易组解冻数量#,@交易组指令释放数量#,@交易组交易释放数量#,@交易组成交释放数量#,@交易组老仓指令占用数量#,@交易组今仓指令占用数量#,@交易组老仓交易占用数量#,@交易组今仓交易占用数量#,@交易组老仓成交占用数量#,@交易组今仓成交占用数量#,@交易组应收保证金#,@昨结算价#,@交易组实现盈亏#,@交易组开仓金额#,@交易组持仓更新次数#][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {合约代码编号} = @合约代码编号# and {交易编码编号} = @交易编码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#][4][@交易组编号#,@资产账户编号#,@合约代码编号#,@交易编码编号#,@多空类型#,@套保标志#] */
    select row_id,co_no,pd_no,exch_crncy_type,contrc_type,contrc_unit,comb_code,frozen_qty,unfroz_qty,comm_releas_qty,trade_releas_qty,strike_releas_qty,pre_comm_capt_qty,today_comm_capt_qty,old_trade_capt_qty,today_trade_capt_qty,pre_strike_capt_qty,today_strike_capt_qty,rece_margin,pre_settle_price,realize_pandl,open_amount,update_times into v_exgp_row_id,v_co_no,v_pd_no,v_exch_crncy_type,v_contrc_type,v_contrc_unit,v_comb_code,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_comm_releas_qty,v_exgp_trade_releas_qty,v_exgp_strike_releas_qty,v_exgp_old_comm_capt_qty,v_exgp_today_comm_capt_qty,v_exgp_old_trade_capt_qty,v_exgp_today_trade_capt_qty,v_exgp_pre_strike_capt_qty,v_exgp_today_strike_capt_qty,v_exgp_rece_margin,v_pre_settle_price,v_exgp_realize_pandl,v_exgp_open_amount,v_exgp_posi_update_times from db_tdfutu.tb_tdfuac_exgp_busi_posi where exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and contrc_code_no = v_contrc_code_no and futu_acco_no = v_futu_acco_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type limit 1;


    /* [获取表记录变量语句][交易期货_账户_资产账户业务持仓表][{记录序号},{冻结数量},{解冻数量},{指令释放数量},{交易释放数量},{成交释放数量},{老仓指令占用数量},{今仓指令占用数量},{老仓交易占用数量},{今仓交易占用数量},{老仓成交占用数量},{今仓成交占用数量},{应收保证金},{实现盈亏},{开仓金额},{更新次数}][@资产账户记录序号#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户指令释放数量#,@资产账户交易释放数量#,@资产账户成交释放数量#,@资产账户老仓指令占用数量#,@资产账户今仓指令占用数量#,@资产账户老仓交易占用数量#,@资产账户今仓交易占用数量#,@资产账户老仓成交占用数量#,@资产账户今仓成交占用数量#,@资产账户应收保证金#,@资产账户实现盈亏#,@资产账户开仓金额#,@资产账户持仓更新次数#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#][4][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    select row_id,frozen_qty,unfroz_qty,comm_releas_qty,trade_releas_qty,strike_releas_qty,pre_comm_capt_qty,today_comm_capt_qty,old_trade_capt_qty,today_trade_capt_qty,pre_strike_capt_qty,today_strike_capt_qty,rece_margin,realize_pandl,open_amount,update_times into v_asac_row_id,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_comm_releas_qty,v_asac_trade_releas_qty,v_asac_strike_releas_qty,v_asac_old_comm_capt_qty,v_asac_today_comm_capt_qty,v_asac_old_trade_capt_qty,v_asac_today_trade_capt_qty,v_asac_pre_strike_capt_qty,v_asac_today_strike_capt_qty,v_asac_rece_margin,v_asac_realize_pandl,v_asac_open_amount,v_asac_posi_update_times from db_tdfutu.tb_tdfuac_asac_busi_posi where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_row_id = v_exgp_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_comb_code = v_comb_code;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_comm_releas_qty = v_exgp_comm_releas_qty;
    SET p_exgp_trade_releas_qty = v_exgp_trade_releas_qty;
    SET p_exgp_strike_releas_qty = v_exgp_strike_releas_qty;
    SET p_exgp_old_comm_capt_qty = v_exgp_old_comm_capt_qty;
    SET p_exgp_today_comm_capt_qty = v_exgp_today_comm_capt_qty;
    SET p_exgp_old_trade_capt_qty = v_exgp_old_trade_capt_qty;
    SET p_exgp_today_trade_capt_qty = v_exgp_today_trade_capt_qty;
    SET p_exgp_pre_strike_capt_qty = v_exgp_pre_strike_capt_qty;
    SET p_exgp_today_strike_capt_qty = v_exgp_today_strike_capt_qty;
    SET p_exgp_rece_margin = v_exgp_rece_margin;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exgp_open_amount = v_exgp_open_amount;
    SET p_exgp_posi_update_times = v_exgp_posi_update_times;
    SET p_asac_row_id = v_asac_row_id;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_comm_releas_qty = v_asac_comm_releas_qty;
    SET p_asac_trade_releas_qty = v_asac_trade_releas_qty;
    SET p_asac_strike_releas_qty = v_asac_strike_releas_qty;
    SET p_asac_old_comm_capt_qty = v_asac_old_comm_capt_qty;
    SET p_asac_today_comm_capt_qty = v_asac_today_comm_capt_qty;
    SET p_asac_old_trade_capt_qty = v_asac_old_trade_capt_qty;
    SET p_asac_today_trade_capt_qty = v_asac_today_trade_capt_qty;
    SET p_asac_pre_strike_capt_qty = v_asac_pre_strike_capt_qty;
    SET p_asac_today_strike_capt_qty = v_asac_today_strike_capt_qty;
    SET p_asac_rece_margin = v_asac_rece_margin;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_open_amount = v_asac_open_amount;
    SET p_asac_posi_update_times = v_asac_posi_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_获取交易组持仓明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_GetExgpPosiDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_GetExgpPosiDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_detail_posi_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_open_posi_date int,
    OUT p_open_posi_time int,
    OUT p_open_posi_price decimal(16,9),
    OUT p_open_posi_qty decimal(18,2),
    OUT p_open_posi_fee decimal(18,4),
    OUT p_close_posi_fee decimal(18,4),
    OUT p_trade_capt_qty decimal(18,2),
    OUT p_strike_capt_qty decimal(18,2),
    OUT p_marked_sett_price decimal(16,9),
    OUT p_rece_margin decimal(18,4),
    OUT p_marked_pandl decimal(18,4),
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
    declare v_detail_posi_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_open_posi_date int;
    declare v_open_posi_time int;
    declare v_open_posi_price decimal(16,9);
    declare v_open_posi_qty decimal(18,2);
    declare v_open_posi_fee decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_trade_capt_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_marked_sett_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_marked_pandl decimal(18,4);
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
    SET v_detail_posi_id = p_detail_posi_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_open_posi_time = date_format(curtime(),'%H%i%s');
    SET v_open_posi_price = 0;
    SET v_open_posi_qty = 0;
    SET v_open_posi_fee = 0;
    SET v_close_posi_fee = 0;
    SET v_trade_capt_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_marked_sett_price = 0;
    SET v_rece_margin = 0;
    SET v_marked_pandl = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易期货_账户_交易组持仓明细表][{开仓日期},{开仓时间},{开仓价格},{开仓数量},{开仓费用},{交易占用数量},{成交占用数量},{盯市结算价格},{应收保证金},{盯市盈亏},{更新次数}][@开仓日期#,@开仓时间#,@开仓价格#,@开仓数量#,@开仓费用#,@交易占用数量#,@成交占用数量#,@盯市结算价格#,@应收保证金#,@盯市盈亏#,@更新次数#][{记录序号}=@明细持仓序号#][4][@明细持仓序号#] */
    select open_posi_date,open_posi_time,open_posi_price,open_posi_qty,open_posi_fee,trade_capt_qty,strike_capt_qty,marked_sett_price,rece_margin,marked_pandl,update_times into v_open_posi_date,v_open_posi_time,v_open_posi_price,v_open_posi_qty,v_open_posi_fee,v_trade_capt_qty,v_strike_capt_qty,v_marked_sett_price,v_rece_margin,v_marked_pandl,v_update_times from db_tdfutu.tb_tdfuac_exgp_posi_detail where row_id=v_detail_posi_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.2.29.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_open_posi_date = v_open_posi_date;
    SET p_open_posi_time = v_open_posi_time;
    SET p_open_posi_price = v_open_posi_price;
    SET p_open_posi_qty = v_open_posi_qty;
    SET p_open_posi_fee = v_open_posi_fee;
    SET p_close_posi_fee = v_close_posi_fee;
    SET p_trade_capt_qty = v_trade_capt_qty;
    SET p_strike_capt_qty = v_strike_capt_qty;
    SET p_marked_sett_price = v_marked_sett_price;
    SET p_rece_margin = v_rece_margin;
    SET p_marked_pandl = v_marked_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_获取保证金优惠信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_GetMarginInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_GetMarginInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_comb_code varchar(6),
    IN p_hedge_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_exch_crncy_type varchar(3),
    OUT p_exgp_long_order_margin decimal(18,4),
    OUT p_exgp_short_order_margin decimal(18,4),
    OUT p_exgp_long_strike_margin decimal(18,4),
    OUT p_exgp_short_strike_margin decimal(18,4),
    OUT p_exgp_long_hold_margin decimal(18,4),
    OUT p_exgp_short_hold_margin decimal(18,4),
    OUT p_exgp_trade_capt_amt decimal(18,4),
    OUT p_exgp_posi_capt_amt decimal(18,4),
    OUT p_exch_group_update_times int,
    OUT p_prod_long_order_margin decimal(18,4),
    OUT p_prod_short_order_margin decimal(18,4),
    OUT p_prod_long_strike_margin decimal(18,4),
    OUT p_prod_short_strike_margin decimal(18,4),
    OUT p_prod_long_hold_margin decimal(18,4),
    OUT p_prod_short_hold_margin decimal(18,4),
    OUT p_prod_trade_capt_amt decimal(18,4),
    OUT p_prod_posi_capt_amt decimal(18,4),
    OUT p_pd_update_times int
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
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_comb_code varchar(6);
    declare v_hedge_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_exgp_long_order_margin decimal(18,4);
    declare v_exgp_short_order_margin decimal(18,4);
    declare v_exgp_long_strike_margin decimal(18,4);
    declare v_exgp_short_strike_margin decimal(18,4);
    declare v_exgp_long_hold_margin decimal(18,4);
    declare v_exgp_short_hold_margin decimal(18,4);
    declare v_exgp_trade_capt_amt decimal(18,4);
    declare v_exgp_posi_capt_amt decimal(18,4);
    declare v_exch_group_update_times int;
    declare v_prod_long_order_margin decimal(18,4);
    declare v_prod_short_order_margin decimal(18,4);
    declare v_prod_long_strike_margin decimal(18,4);
    declare v_prod_short_strike_margin decimal(18,4);
    declare v_prod_long_hold_margin decimal(18,4);
    declare v_prod_short_hold_margin decimal(18,4);
    declare v_prod_trade_capt_amt decimal(18,4);
    declare v_prod_posi_capt_amt decimal(18,4);
    declare v_pd_update_times int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_comb_code = p_comb_code;
    SET v_hedge_type = p_hedge_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exgp_long_order_margin = 0;
    SET v_exgp_short_order_margin = 0;
    SET v_exgp_long_strike_margin = 0;
    SET v_exgp_short_strike_margin = 0;
    SET v_exgp_long_hold_margin = 0;
    SET v_exgp_short_hold_margin = 0;
    SET v_exgp_trade_capt_amt = 0;
    SET v_exgp_posi_capt_amt = 0;
    SET v_exch_group_update_times = 0;
    SET v_prod_long_order_margin = 0;
    SET v_prod_short_order_margin = 0;
    SET v_prod_long_strike_margin = 0;
    SET v_prod_short_strike_margin = 0;
    SET v_prod_long_hold_margin = 0;
    SET v_prod_short_hold_margin = 0;
    SET v_prod_trade_capt_amt = 0;
    SET v_prod_posi_capt_amt = 0;
    SET v_pd_update_times = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易期货_账户_期货保证金优惠控制表][{机构编号},{交易币种},{多头订单保证金},{空头订单保证金},{多头成交保证金},{空头成交保证金},{多头持仓保证金},{空头持仓保证金},{交易占用金额},{持仓占用金额},{更新次数}][@机构编号#,@交易币种#,@交易组多头订单保证金#,@交易组空头订单保证金#,@交易组多头成交保证金#,@交易组空头成交保证金#,@交易组多头持仓保证金#,@交易组空头持仓保证金#,@交易组交易占用金额#,@交易组持仓占用金额#,@交易组更新次数#][{产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {市场编号}=@市场编号# and {组合编码}=@组合编码# and {套保标志} = @套保标志#][4][@产品编号#,@交易组编号#,@资产账户编号#,@市场编号#,@组合编码#,@套保标志#] */
    select co_no,exch_crncy_type,long_order_margin,short_order_margin,long_strike_margin,short_strike_margin,long_hold_margin,short_hold_margin,trade_capt_amt,posi_capt_amt,update_times into v_co_no,v_exch_crncy_type,v_exgp_long_order_margin,v_exgp_short_order_margin,v_exgp_long_strike_margin,v_exgp_short_strike_margin,v_exgp_long_hold_margin,v_exgp_short_hold_margin,v_exgp_trade_capt_amt,v_exgp_posi_capt_amt,v_exch_group_update_times from db_tdfutu.tb_tdfuac_margin_ctrl where pd_no=v_pd_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and exch_no=v_exch_no and comb_code=v_comb_code and hedge_type = v_hedge_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.2.30.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","组合编码=",v_comb_code,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","组合编码=",v_comb_code,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* set @交易组编号#=0; */
    set v_exch_group_no=0;

    /* [获取表记录变量][交易期货_账户_期货保证金优惠控制表][{多头订单保证金},{空头订单保证金},{多头成交保证金},{空头成交保证金},{多头持仓保证金},{空头持仓保证金},{交易占用金额},{持仓占用金额},{更新次数}][@产品多头订单保证金#,@产品空头订单保证金#,@产品多头成交保证金#,@产品空头成交保证金#,@产品多头持仓保证金#,@产品空头持仓保证金#,@产品交易占用金额#,@产品持仓占用金额#,@产品更新次数#][{产品编号}=@产品编号# and {交易组编号}=0 and {资产账户编号}=@资产账户编号# and {市场编号}=@市场编号# and {组合编码}=@组合编码# and {套保标志} = @套保标志#][4][@产品编号#,@交易组编号#,@资产账户编号#,@市场编号#,@组合编码#,@套保标志#] */
    select long_order_margin,short_order_margin,long_strike_margin,short_strike_margin,long_hold_margin,short_hold_margin,trade_capt_amt,posi_capt_amt,update_times into v_prod_long_order_margin,v_prod_short_order_margin,v_prod_long_strike_margin,v_prod_short_strike_margin,v_prod_long_hold_margin,v_prod_short_hold_margin,v_prod_trade_capt_amt,v_prod_posi_capt_amt,v_pd_update_times from db_tdfutu.tb_tdfuac_margin_ctrl where pd_no=v_pd_no and exch_group_no=0 and asset_acco_no=v_asset_acco_no and exch_no=v_exch_no and comb_code=v_comb_code and hedge_type = v_hedge_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.2.30.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","组合编码=",v_comb_code,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","组合编码=",v_comb_code,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exgp_long_order_margin = v_exgp_long_order_margin;
    SET p_exgp_short_order_margin = v_exgp_short_order_margin;
    SET p_exgp_long_strike_margin = v_exgp_long_strike_margin;
    SET p_exgp_short_strike_margin = v_exgp_short_strike_margin;
    SET p_exgp_long_hold_margin = v_exgp_long_hold_margin;
    SET p_exgp_short_hold_margin = v_exgp_short_hold_margin;
    SET p_exgp_trade_capt_amt = v_exgp_trade_capt_amt;
    SET p_exgp_posi_capt_amt = v_exgp_posi_capt_amt;
    SET p_exch_group_update_times = v_exch_group_update_times;
    SET p_prod_long_order_margin = v_prod_long_order_margin;
    SET p_prod_short_order_margin = v_prod_short_order_margin;
    SET p_prod_long_strike_margin = v_prod_long_strike_margin;
    SET p_prod_short_strike_margin = v_prod_short_strike_margin;
    SET p_prod_long_hold_margin = v_prod_long_hold_margin;
    SET p_prod_short_hold_margin = v_prod_short_hold_margin;
    SET p_prod_trade_capt_amt = v_prod_trade_capt_amt;
    SET p_prod_posi_capt_amt = v_prod_posi_capt_amt;
    SET p_pd_update_times = v_pd_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_更新指令资金持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_UpdateApprCashPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_UpdateApprCashPosi(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_comb_code varchar(6),
    IN p_lngsht_type int,
    IN p_pre_settle_price decimal(16,9),
    IN p_comm_occur_amt decimal(18,4),
    IN p_comm_occur_qty decimal(18,2),
    IN p_is_record_jour int,
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_lngsht_type int;
    declare v_pre_settle_price decimal(16,9);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_is_record_jour int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_unfroz_amt decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_comm_unfroz_qty decimal(18,2);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_trade_unfroz_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_comm_capt_qty decimal(18,2);
    declare v_comm_releas_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_capt_margin decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_marked_pandl decimal(18,4);
    declare v_pre_comm_capt_qty decimal(18,2);
    declare v_today_comm_capt_qty decimal(18,2);
    declare v_old_trade_capt_qty decimal(18,2);
    declare v_today_trade_capt_qty decimal(18,2);
    declare v_pre_strike_capt_qty decimal(18,2);
    declare v_today_strike_capt_qty decimal(18,2);
    declare v_open_amount decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_comm_releas_amt decimal(18,4);
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_comb_code = p_comb_code;
    SET v_lngsht_type = p_lngsht_type;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_comm_occur_amt = p_comm_occur_amt;
    SET v_comm_occur_qty = p_comm_occur_qty;
    SET v_is_record_jour = p_is_record_jour;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_unfroz_amt = 0;
    SET v_trade_capt_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_capt_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_comm_frozen_qty = 0;
    SET v_comm_unfroz_qty = 0;
    SET v_trade_frozen_qty = 0;
    SET v_trade_unfroz_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_comm_capt_qty = 0;
    SET v_comm_releas_qty = 0;
    SET v_realize_pandl = 0;
    SET v_capt_margin = 0;
    SET v_trade_fee = 0;
    SET v_strike_fee = 0;
    SET v_close_pandl = 0;
    SET v_marked_pandl = 0;
    SET v_pre_comm_capt_qty = 0;
    SET v_today_comm_capt_qty = 0;
    SET v_old_trade_capt_qty = 0;
    SET v_today_trade_capt_qty = 0;
    SET v_pre_strike_capt_qty = 0;
    SET v_today_strike_capt_qty = 0;
    SET v_open_amount = 0;
    SET v_rece_margin = 0;
    SET v_comm_capt_amt = 0;
    SET v_comm_releas_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @期初金额#=0; */
    set v_begin_amt=0;

    /* set @当前金额#=0; */
    set v_curr_amt=0;

    /* set @冻结金额#=0; */
    set v_frozen_amt=0;

    /* set @解冻金额#=0; */
    set v_unfroz_amt=0;

    /* set @指令冻结金额#=0; */
    set v_comm_frozen_amt=0;

    /* set @指令解冻金额#=0; */
    set v_comm_unfroz_amt=0;

    /* set @交易占用金额#=0; */
    set v_trade_capt_amt=0;

    /* set @交易释放金额#=0; */
    set v_trade_releas_amt=0;

    /* set @成交占用金额#=0; */
    set v_strike_capt_amt=0;

    /* set @成交释放金额#=0; */
    set v_strike_releas_amt=0;

    /* set @期初数量#=0; */
    set v_begin_qty=0;

    /* set @当前数量#=0; */
    set v_curr_qty=0;

    /* set @冻结数量#=0; */
    set v_frozen_qty=0;

    /* set @解冻数量#=0; */
    set v_unfroz_qty=0;

    /* set @指令冻结数量#=0; */
    set v_comm_frozen_qty=0;

    /* set @指令解冻数量#=0; */
    set v_comm_unfroz_qty=0;

    /* set @交易冻结数量#=0; */
    set v_trade_frozen_qty=0;

    /* set @交易解冻数量#=0; */
    set v_trade_unfroz_qty=0;

    /* set @交易占用数量#=0; */
    set v_trade_capt_qty=0;

    /* set @交易释放数量#=0; */
    set v_trade_releas_qty=0;

    /* set @成交占用数量#=0; */
    set v_strike_capt_qty=0;

    /* set @成交释放数量#=0; */
    set v_strike_releas_qty=0;

    /* set @指令占用数量# = 0; */
    set v_comm_capt_qty = 0;

    /* set @指令释放数量# = 0; */
    set v_comm_releas_qty = 0;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @占用保证金# = 0; */
    set v_capt_margin = 0;

    /* set @交易费用# = 0; */
    set v_trade_fee = 0;

    /* set @成交费用# = 0; */
    set v_strike_fee = 0;

    /* set @平仓盈亏# = 0; */
    set v_close_pandl = 0;

    /* set @盯市盈亏# = 0; */
    set v_marked_pandl = 0;

    /* set @老仓指令占用数量# = 0; */
    set v_pre_comm_capt_qty = 0;

    /* set @今仓指令占用数量# = 0; */
    set v_today_comm_capt_qty = 0;

    /* set @老仓交易占用数量# = 0; */
    set v_old_trade_capt_qty = 0;

    /* set @今仓交易占用数量# = 0; */
    set v_today_trade_capt_qty = 0;

    /* set @老仓成交占用数量# = 0; */
    set v_pre_strike_capt_qty = 0;

    /* set @今仓成交占用数量# = 0; */
    set v_today_strike_capt_qty = 0;

    /* set @平仓盈亏# = 0; */
    set v_close_pandl = 0;

    /* set @开仓金额# = 0; */
    set v_open_amount = 0;

    /* set @应收保证金# = 0; */
    set v_rece_margin = 0;

    /* if @开平方向# = 《开平方向-开仓》 then */
    if v_contrc_dir = 1 then

        /* set @指令占用金额# = @指令变动金额#; */
        set v_comm_capt_amt = v_comm_occur_amt;

        /* set @指令释放数量# = @指令变动数量#; */
        set v_comm_releas_qty = v_comm_occur_qty;
    else

        /* set @指令释放金额# = @指令变动金额#; */
        set v_comm_releas_amt = v_comm_occur_amt;

        /* set @指令占用数量# = @指令变动数量#; */
        set v_comm_capt_qty = v_comm_occur_qty;
    end if;

    /* if @指令占用金额# <>0 or @指令释放金额# <>0 then */
    if v_comm_capt_amt <>0 or v_comm_releas_amt <>0 then
        #修改资产账户业务资金

        /* [插入重复更新][交易期货_账户_资产账户业务资金表][字段][字段变量][{指令释放金额}={指令释放金额}+@指令释放金额#,{指令占用金额}={指令占用金额}+@指令占用金额#][1][@资产账户编号#,@交易币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdfutu.tb_tdfuac_asac_busi_capit (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            asset_acco_no, exch_crncy_type, begin_amt, curr_amt, 
            frozen_amt, unfroz_amt, comm_frozen_amt, comm_unfroz_amt, 
            comm_capt_amt, comm_releas_amt, trade_capt_amt, trade_releas_amt, 
            strike_capt_amt, strike_releas_amt, capt_margin, trade_fee, 
            strike_fee, close_pandl, marked_pandl) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_asset_acco_no, v_exch_crncy_type, v_begin_amt, v_curr_amt, 
            v_frozen_amt, v_unfroz_amt, v_comm_frozen_amt, v_comm_unfroz_amt, 
            v_comm_capt_amt, v_comm_releas_amt, v_trade_capt_amt, v_trade_releas_amt, 
            v_strike_capt_amt, v_strike_releas_amt, v_capt_margin, v_trade_fee, 
            v_strike_fee, v_close_pandl, v_marked_pandl) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, comm_releas_amt=comm_releas_amt+v_comm_releas_amt,comm_capt_amt=comm_capt_amt+v_comm_capt_amt;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdfutuA.2.31.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type);
            end if;
            leave label_pro;
        end if;


        /* [插入重复更新][交易期货_账户_交易组业务资金表][字段][字段变量][{指令释放金额}={指令释放金额}+@指令释放金额#,{指令占用金额}={指令占用金额}+@指令占用金额#][1][@交易组编号#,@交易币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdfutu.tb_tdfuac_exgp_busi_capit (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, asset_acco_no, exch_crncy_type, begin_amt, 
            curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
            comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_capt_amt, 
            trade_releas_amt, strike_capt_amt, strike_releas_amt, capt_margin, 
            trade_fee, strike_fee, close_pandl, marked_pandl) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_begin_amt, 
            v_curr_amt, v_frozen_amt, v_unfroz_amt, v_comm_frozen_amt, 
            v_comm_unfroz_amt, v_comm_capt_amt, v_comm_releas_amt, v_trade_capt_amt, 
            v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt, v_capt_margin, 
            v_trade_fee, v_strike_fee, v_close_pandl, v_marked_pandl) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, comm_releas_amt=comm_releas_amt+v_comm_releas_amt,comm_capt_amt=comm_capt_amt+v_comm_capt_amt;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdfutuA.2.31.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","交易币种=",v_exch_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","交易币种=",v_exch_crncy_type);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @指令占用数量# <>0 or @指令释放数量# <>0 then */
    if v_comm_capt_qty <>0 or v_comm_releas_qty <>0 then
        #修改资产账户业务持仓

        /* [插入重复更新][交易期货_账户_资产账户业务持仓表][字段][字段变量][{指令占用数量}={指令占用数量}+@指令占用数量#,{指令释放数量}={指令释放数量}+@指令释放数量#][1][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdfutu.tb_tdfuac_asac_busi_posi (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
            contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
            hedge_type, comb_code, begin_qty, curr_qty, 
            frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
            comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
            trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
            today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
            today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
            close_pandl, open_amount) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_asset_acco_no, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
            v_contrc_code_no, v_contrc_type, v_contrc_unit, v_lngsht_type, 
            v_hedge_type, v_comb_code, v_begin_qty, v_curr_qty, 
            v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
            v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
            v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, v_pre_comm_capt_qty, 
            v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, v_pre_strike_capt_qty, 
            v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, v_realize_pandl, 
            v_close_pandl, v_open_amount) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, comm_capt_qty=comm_capt_qty+v_comm_capt_qty,comm_releas_qty=comm_releas_qty+v_comm_releas_qty;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdfutuA.2.31.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
            end if;
            leave label_pro;
        end if;


        /* [插入重复更新][交易期货_账户_交易组业务持仓表][字段][字段变量][{指令占用数量}={指令占用数量}+@指令占用数量#,{指令释放数量}={指令释放数量}+@指令释放数量#][1][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdfutu.tb_tdfuac_exgp_busi_posi (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
            futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
            lngsht_type, hedge_type, comb_code, begin_qty, 
            curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
            comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
            trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
            pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
            pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
            realize_pandl, close_pandl, open_amount) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
            v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
            v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
            v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
            v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
            v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
            v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
            v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
            v_realize_pandl, v_close_pandl, v_open_amount) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, comm_capt_qty=comm_capt_qty+v_comm_capt_qty,comm_releas_qty=comm_releas_qty+v_comm_releas_qty;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdfutuA.2.31.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_计算资产账户持仓数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_CalcAsacPosiQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_CalcAsacPosiQty(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_last_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_posi_qty decimal(18,2),
    OUT p_marked_pandl decimal(18,4),
    OUT p_pre_strike_capt_qty decimal(18,2),
    OUT p_rece_margin decimal(18,4)
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_last_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_posi_qty decimal(18,2);
    declare v_marked_pandl decimal(18,4);
    declare v_pre_strike_capt_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_comb_code varchar(6);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
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
    declare v_strike_releas_qty decimal(18,2);
    declare v_pre_comm_capt_qty decimal(18,2);
    declare v_today_comm_capt_qty decimal(18,2);
    declare v_old_trade_capt_qty decimal(18,2);
    declare v_today_trade_capt_qty decimal(18,2);
    declare v_today_strike_capt_qty decimal(18,2);
    declare v_pre_settle_price decimal(16,9);
    declare v_realize_pandl decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_open_amount decimal(18,4);
    declare v_pandl_dir_multi int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_last_price = p_last_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_posi_qty = 0;
    SET v_marked_pandl = 0;
    SET v_pre_strike_capt_qty = 0;
    SET v_rece_margin = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_comb_code = " ";
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
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
    SET v_strike_releas_qty = 0;
    SET v_pre_comm_capt_qty = 0;
    SET v_today_comm_capt_qty = 0;
    SET v_old_trade_capt_qty = 0;
    SET v_today_trade_capt_qty = 0;
    SET v_today_strike_capt_qty = 0;
    SET v_pre_settle_price = 0;
    SET v_realize_pandl = 0;
    SET v_close_pandl = 0;
    SET v_open_amount = 0;
    SET v_pandl_dir_multi = 0;

    
    label_pro:BEGIN
    
    #获取资产账户当日业务可用数量

    /* SET @持仓数量#=0; */
    SET v_posi_qty=0;

    /* [获取表记录变量语句][交易期货_账户_资产账户业务持仓表][字段][字段变量][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_crncy_type, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
        lngsht_type, hedge_type, comb_code, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
        comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
        trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
        pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
        pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
        realize_pandl, close_pandl, open_amount into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
        v_lngsht_type, v_hedge_type, v_comb_code, v_begin_qty, 
        v_curr_qty, v_frozen_qty, v_unfroz_qty, v_comm_frozen_qty, 
        v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
        v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_releas_qty, 
        v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, v_today_trade_capt_qty, 
        v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, v_pre_settle_price, 
        v_realize_pandl, v_close_pandl, v_open_amount from db_tdfutu.tb_tdfuac_asac_busi_posi where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type limit 1;

    if FOUND_ROWS() = 0 then
        #如果期货业务持仓表记录不存在，则当天交易产生的可用数量为0

        /* SET @持仓数量#=0; */
        SET v_posi_qty=0;

        /* SET @盯市盈亏#=0; */
        SET v_marked_pandl=0;

        /* SET @老仓成交占用数量#=0; */
        SET v_pre_strike_capt_qty=0;

        /* SET @应收保证金#=0; */
        SET v_rece_margin=0;
    else

        /* if @最新价# = 0 then */
        if v_last_price = 0 then

              /* set @最新价# = @昨结算价#; */
              set v_last_price = v_pre_settle_price;
        end if;

        /* if @多空类型# = 《多空类型-多头》  then */
        if v_lngsht_type = 1  then

             /* set @盈亏方向乘数# = 1; */
             set v_pandl_dir_multi = 1;

        /* elseif @多空类型# = 《多空类型-空头》  then */
        elseif v_lngsht_type = 2  then

             /* set @盈亏方向乘数# = -1; */
             set v_pandl_dir_multi = -1;
        end if;
    #今仓持仓数量

        /* SET @持仓数量#=@成交释放数量#-@今仓成交占用数量#; */
        SET v_posi_qty=v_strike_releas_qty-v_today_strike_capt_qty;
    #计算今仓盯市盈亏： 最新价 - 开仓价

        /* if @持仓数量# <> 0  then */
        if v_posi_qty <> 0  then

             /* SET @盯市盈亏#=(@最新价# -  @开仓金额# /(@成交释放数量# - @今仓成交占用数量#)/@合约乘数# ) *(@成交释放数量# - @今仓成交占用数量#)*@合约乘数#*@盈亏方向乘数#; */
             SET v_marked_pandl=(v_last_price -  v_open_amount /(v_strike_releas_qty - v_today_strike_capt_qty)/v_contrc_unit ) *(v_strike_releas_qty - v_today_strike_capt_qty)*v_contrc_unit*v_pandl_dir_multi;
        else

             /* set @盯市盈亏# = 0; */
             set v_marked_pandl = 0;
        end if;
    end if;
    #产品证券库算：老仓盯市盈亏 = （最新价 - 昨结算价 ）* 当前数量 - 老仓成交占用数量
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_posi_qty = v_posi_qty;
    SET p_marked_pandl = v_marked_pandl;
    SET p_pre_strike_capt_qty = v_pre_strike_capt_qty;
    SET p_rece_margin = v_rece_margin;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_计算交易组持仓数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_CalcExgpPosiQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_CalcExgpPosiQty(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_last_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_posi_qty decimal(18,2),
    OUT p_marked_pandl decimal(18,4),
    OUT p_pre_strike_capt_qty decimal(18,2),
    OUT p_rece_margin decimal(18,4)
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_last_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_posi_qty decimal(18,2);
    declare v_marked_pandl decimal(18,4);
    declare v_pre_strike_capt_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_comb_code varchar(6);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
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
    declare v_strike_releas_qty decimal(18,2);
    declare v_pre_comm_capt_qty decimal(18,2);
    declare v_today_comm_capt_qty decimal(18,2);
    declare v_old_trade_capt_qty decimal(18,2);
    declare v_today_trade_capt_qty decimal(18,2);
    declare v_today_strike_capt_qty decimal(18,2);
    declare v_pre_settle_price decimal(16,9);
    declare v_realize_pandl decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_open_amount decimal(18,4);
    declare v_pandl_dir_multi int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_last_price = p_last_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_posi_qty = 0;
    SET v_marked_pandl = 0;
    SET v_pre_strike_capt_qty = 0;
    SET v_rece_margin = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_comb_code = " ";
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
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
    SET v_strike_releas_qty = 0;
    SET v_pre_comm_capt_qty = 0;
    SET v_today_comm_capt_qty = 0;
    SET v_old_trade_capt_qty = 0;
    SET v_today_trade_capt_qty = 0;
    SET v_today_strike_capt_qty = 0;
    SET v_pre_settle_price = 0;
    SET v_realize_pandl = 0;
    SET v_close_pandl = 0;
    SET v_open_amount = 0;
    SET v_pandl_dir_multi = 0;

    
    label_pro:BEGIN
    
    #获取交易组当日业务可用数量

    /* SET @持仓数量#=0; */
    SET v_posi_qty=0;

    /* [获取表记录变量语句][交易期货_账户_交易组业务持仓表][字段][字段变量][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, futu_acco_no, contrc_code_no, contrc_type, 
        contrc_unit, lngsht_type, hedge_type, comb_code, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        comm_frozen_qty, comm_unfroz_qty, comm_capt_qty, comm_releas_qty, 
        trade_frozen_qty, trade_unfroz_qty, trade_capt_qty, trade_releas_qty, 
        strike_releas_qty, pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, 
        today_trade_capt_qty, pre_strike_capt_qty, today_strike_capt_qty, rece_margin, 
        pre_settle_price, realize_pandl, close_pandl, open_amount into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, 
        v_exch_no, v_futu_acco_no, v_contrc_code_no, v_contrc_type, 
        v_contrc_unit, v_lngsht_type, v_hedge_type, v_comb_code, 
        v_begin_qty, v_curr_qty, v_frozen_qty, v_unfroz_qty, 
        v_comm_frozen_qty, v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, 
        v_trade_frozen_qty, v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, 
        v_strike_releas_qty, v_pre_comm_capt_qty, v_today_comm_capt_qty, v_old_trade_capt_qty, 
        v_today_trade_capt_qty, v_pre_strike_capt_qty, v_today_strike_capt_qty, v_rece_margin, 
        v_pre_settle_price, v_realize_pandl, v_close_pandl, v_open_amount from db_tdfutu.tb_tdfuac_exgp_busi_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type limit 1;

    if FOUND_ROWS() = 0 then
        #如果期货业务持仓表记录不存在，则当天交易产生的可用数量为0

        /* SET @持仓数量#=0; */
        SET v_posi_qty=0;

        /* SET @盯市盈亏#=0; */
        SET v_marked_pandl=0;

        /* SET @老仓成交占用数量#=0; */
        SET v_pre_strike_capt_qty=0;

        /* SET @应收保证金#=0; */
        SET v_rece_margin=0;
    else

        /* if @最新价# = 0 then */
        if v_last_price = 0 then

              /* set @最新价# = @昨结算价#; */
              set v_last_price = v_pre_settle_price;
        end if;

        /* if @多空类型# = 《多空类型-多头》  then */
        if v_lngsht_type = 1  then

             /* set @盈亏方向乘数# = 1; */
             set v_pandl_dir_multi = 1;

        /* elseif @多空类型# = 《多空类型-空头》  then */
        elseif v_lngsht_type = 2  then

             /* set @盈亏方向乘数# = -1; */
             set v_pandl_dir_multi = -1;
        end if;

        /* SET @持仓数量#=@成交释放数量#-@今仓成交占用数量#; */
        SET v_posi_qty=v_strike_releas_qty-v_today_strike_capt_qty;
    #计算今仓盯市盈亏： 最新价 - 开盘价

        /* if @持仓数量# <> 0  then */
        if v_posi_qty <> 0  then

              /* SET @盯市盈亏#=(@最新价# -  @开仓金额# /(@成交释放数量# - @今仓成交占用数量#)/@合约乘数# ) *(@成交释放数量# - @今仓成交占用数量#)*@合约乘数#*@盈亏方向乘数#; */
              SET v_marked_pandl=(v_last_price -  v_open_amount /(v_strike_releas_qty - v_today_strike_capt_qty)/v_contrc_unit ) *(v_strike_releas_qty - v_today_strike_capt_qty)*v_contrc_unit*v_pandl_dir_multi;
        else

             /* set @盯市盈亏# = 0; */
             set v_marked_pandl = 0;
        end if;
    end if;
    #产品证券库算：老仓盯市盈亏 = （最新价 - 昨结算价 ）* 当前数量 - 老仓成交占用数量
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_posi_qty = v_posi_qty;
    SET p_marked_pandl = v_marked_pandl;
    SET p_pre_strike_capt_qty = v_pre_strike_capt_qty;
    SET p_rece_margin = v_rece_margin;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_计算资产账户资金可用同步产品库
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_CalcAsacCashAvailToPd;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_CalcAsacCashAvailToPd(
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
    IN p_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_avail_amt decimal(18,4),
    OUT p_margin_amt decimal(18,4),
    OUT p_capit_bala decimal(18,4)
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
    declare v_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_avail_amt decimal(18,4);
    declare v_margin_amt decimal(18,4);
    declare v_capit_bala decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_exch_crncy_type varchar(3);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_unfroz_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_comm_releas_amt decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_capt_margin decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_marked_pandl decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_avail_amt = 0;
    SET v_margin_amt = 0;
    SET v_capit_bala = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_exch_crncy_type = "CNY";
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_unfroz_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_comm_releas_amt = 0;
    SET v_trade_capt_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_capt_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_capt_margin = 0;
    SET v_trade_fee = 0;
    SET v_strike_fee = 0;
    SET v_close_pandl = 0;
    SET v_marked_pandl = 0;

    
    label_pro:BEGIN
    
    #获取资产账户当日业务可用金额

    /* set @可用金额# = 0; */
    set v_avail_amt = 0;

    /* set @保证金# = 0; */
    set v_margin_amt = 0;

    /* set @资金余额# = 0; */
    set v_capit_bala = 0;
    #set @临时_盯市盈亏# = @盯市盈亏#;

    /* [获取表记录变量语句][交易期货_账户_资产账户业务资金表][字段][字段变量][{资产账户编号}=@资产账户编号# and {交易币种}='CNY'] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
        comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_capt_amt, 
        trade_releas_amt, strike_capt_amt, strike_releas_amt, capt_margin, 
        trade_fee, strike_fee, close_pandl, marked_pandl into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_crncy_type, v_begin_amt, 
        v_curr_amt, v_frozen_amt, v_unfroz_amt, v_comm_frozen_amt, 
        v_comm_unfroz_amt, v_comm_capt_amt, v_comm_releas_amt, v_trade_capt_amt, 
        v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt, v_capt_margin, 
        v_trade_fee, v_strike_fee, v_close_pandl, v_marked_pandl from db_tdfutu.tb_tdfuac_asac_busi_capit where asset_acco_no=v_asset_acco_no and exch_crncy_type='CNY' limit 1;

    if FOUND_ROWS() <> 0 then
    #可用  + 盯市盈亏 |在更新产品期货库时，通过持仓计算 盯市盈亏后 累计到可用金额。

        /* SET @可用金额#= @成交释放金额# - @成交占用金额# - @交易占用金额# -@成交费用# - @交易费用# + @平仓盈亏# ; */
        SET v_avail_amt= v_strike_releas_amt - v_strike_capt_amt - v_trade_capt_amt -v_strike_fee - v_trade_fee + v_close_pandl ;

        /* SET @保证金#= @成交占用金额# - @成交释放金额#; */
        SET v_margin_amt= v_strike_capt_amt - v_strike_releas_amt;

        /* SET @资金余额#= @平仓盈亏# - @成交费用#; */
        SET v_capit_bala= v_close_pandl - v_strike_fee;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_avail_amt = v_avail_amt;
    SET p_margin_amt = v_margin_amt;
    SET p_capit_bala = v_capit_bala;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_计算交易组资金可用同步产品库
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_CalcExgpCashAvailToPd;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_CalcExgpCashAvailToPd(
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
    IN p_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_avail_amt decimal(18,4),
    OUT p_margin_amt decimal(18,4),
    OUT p_capit_bala decimal(18,4)
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
    declare v_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_avail_amt decimal(18,4);
    declare v_margin_amt decimal(18,4);
    declare v_capit_bala decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_exch_crncy_type varchar(3);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_unfroz_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_comm_releas_amt decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_capt_margin decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_marked_pandl decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_avail_amt = 0;
    SET v_margin_amt = 0;
    SET v_capit_bala = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_exch_crncy_type = "CNY";
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_unfroz_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_comm_releas_amt = 0;
    SET v_trade_capt_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_capt_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_capt_margin = 0;
    SET v_trade_fee = 0;
    SET v_strike_fee = 0;
    SET v_close_pandl = 0;
    SET v_marked_pandl = 0;

    
    label_pro:BEGIN
    
    #获取交易组当日业务可用金额

    /* set @可用金额# = 0; */
    set v_avail_amt = 0;

    /* set @保证金# = 0; */
    set v_margin_amt = 0;

    /* set @资金余额# = 0; */
    set v_capit_bala = 0;

    /* [获取表记录变量语句][交易期货_账户_交易组业务资金表][字段][字段变量][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {交易币种}='CNY'] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        comm_frozen_amt, comm_unfroz_amt, comm_capt_amt, comm_releas_amt, 
        trade_capt_amt, trade_releas_amt, strike_capt_amt, strike_releas_amt, 
        capt_margin, trade_fee, strike_fee, close_pandl, 
        marked_pandl into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, 
        v_begin_amt, v_curr_amt, v_frozen_amt, v_unfroz_amt, 
        v_comm_frozen_amt, v_comm_unfroz_amt, v_comm_capt_amt, v_comm_releas_amt, 
        v_trade_capt_amt, v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt, 
        v_capt_margin, v_trade_fee, v_strike_fee, v_close_pandl, 
        v_marked_pandl from db_tdfutu.tb_tdfuac_exgp_busi_capit where exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and exch_crncy_type='CNY' limit 1;

    if FOUND_ROWS() <> 0 then

        /* SET @可用金额#= @成交释放金额# - @成交占用金额# - @交易占用金额# -@成交费用# - @交易费用# + @平仓盈亏# ; */
        SET v_avail_amt= v_strike_releas_amt - v_strike_capt_amt - v_trade_capt_amt -v_strike_fee - v_trade_fee + v_close_pandl ;

        /* SET @保证金#= @成交占用金额# - @成交释放金额#; */
        SET v_margin_amt= v_strike_capt_amt - v_strike_releas_amt;

        /* SET @资金余额#= @平仓盈亏# - @成交费用#; */
        SET v_capit_bala= v_close_pandl - v_strike_fee;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_avail_amt = v_avail_amt;
    SET p_margin_amt = v_margin_amt;
    SET p_capit_bala = v_capit_bala;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_更新交易组成交资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_UpdateExgpStrikeCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_UpdateExgpStrikeCapit(
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
    IN p_exch_crncy_type varchar(3),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_invest_type int,
    IN p_lngsht_type int,
    IN p_contrc_dir int,
    IN p_order_dir int,
    IN p_strike_occur_amt decimal(18,4),
    IN p_strike_fee decimal(18,4),
    IN p_trade_occur_amt decimal(18,4),
    IN p_trade_fee decimal(18,4),
    IN p_close_pandl decimal(18,4),
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
    declare v_exch_crncy_type varchar(3);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_invest_type int;
    declare v_lngsht_type int;
    declare v_contrc_dir int;
    declare v_order_dir int;
    declare v_strike_occur_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_unfroz_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_comm_releas_amt decimal(18,4);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_marked_pandl decimal(18,4);
    declare v_capt_margin decimal(18,4);
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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_invest_type = p_invest_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_contrc_dir = p_contrc_dir;
    SET v_order_dir = p_order_dir;
    SET v_strike_occur_amt = p_strike_occur_amt;
    SET v_strike_fee = p_strike_fee;
    SET v_trade_occur_amt = p_trade_occur_amt;
    SET v_trade_fee = p_trade_fee;
    SET v_close_pandl = p_close_pandl;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_unfroz_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_comm_releas_amt = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_trade_capt_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_capt_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_marked_pandl = 0;
    SET v_capt_margin = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @期初金额#=0; */
    set v_begin_amt=0;

    /* set @当前金额#=0; */
    set v_curr_amt=0;

    /* set @冻结金额#=0; */
    set v_frozen_amt=0;

    /* set @解冻金额#=0; */
    set v_unfroz_amt=0;

    /* set @指令冻结金额#=0; */
    set v_comm_frozen_amt=0;

    /* set @指令解冻金额#=0; */
    set v_comm_unfroz_amt=0;

    /* set @指令占用金额#=0; */
    set v_comm_capt_amt=0;

    /* set @指令释放金额#=0; */
    set v_comm_releas_amt=0;

    /* set @指令变动金额#=0; */
    set v_comm_occur_amt=0;

    /* set @指令变动数量#=0; */
    set v_comm_occur_qty=0;

    /* set @交易占用金额#=0; */
    set v_trade_capt_amt=0;

    /* set @交易释放金额#=0; */
    set v_trade_releas_amt=0;

    /* set @成交占用金额#=0; */
    set v_strike_capt_amt=0;

    /* set @成交释放金额#=0; */
    set v_strike_releas_amt=0;

    /* set @盯市盈亏#=0; */
    set v_marked_pandl=0;

    /* set @占用保证金#=0; */
    set v_capt_margin=0;

    /* if @开平方向#=《开平方向-开仓》 then */
    if v_contrc_dir=1 then

      /* set @交易占用金额#=@交易变动金额#; */
      set v_trade_capt_amt=v_trade_occur_amt;

      /* set @成交占用金额#=@成交变动金额#; */
      set v_strike_capt_amt=v_strike_occur_amt;

      /* [插入重复更新][交易期货_账户_交易组业务资金表][字段][字段变量][{交易占用金额}={交易占用金额}+@交易占用金额#,{交易费用}={交易费用}+@交易费用#,{成交占用金额}={成交占用金额}+@成交占用金额#,{成交费用}={成交费用}+@成交费用#][1][@交易组编号#,@资产账户编号#,@交易币种#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfuac_exgp_busi_capit (
          create_date, create_time, update_date, 
          update_time, update_times, co_no, pd_no, 
          exch_group_no, asset_acco_no, exch_crncy_type, begin_amt, 
          curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
          comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_capt_amt, 
          trade_releas_amt, strike_capt_amt, strike_releas_amt, capt_margin, 
          trade_fee, strike_fee, close_pandl, marked_pandl) 
      values(
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_co_no, v_pd_no, 
          v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_begin_amt, 
          v_curr_amt, v_frozen_amt, v_unfroz_amt, v_comm_frozen_amt, 
          v_comm_unfroz_amt, v_comm_capt_amt, v_comm_releas_amt, v_trade_capt_amt, 
          v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt, v_capt_margin, 
          v_trade_fee, v_strike_fee, v_close_pandl, v_marked_pandl) 
      ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, trade_capt_amt=trade_capt_amt+v_trade_capt_amt,trade_fee=trade_fee+v_trade_fee,strike_capt_amt=strike_capt_amt+v_strike_capt_amt,strike_fee=strike_fee+v_strike_fee;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.2.44.1";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type),"#",v_mysql_message);
          else
              SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type);
          end if;
          leave label_pro;
      end if;

    else
      #set @交易占用金额#=@交易变动金额#;

      /* set @成交释放金额#=@成交变动金额#; */
      set v_strike_releas_amt=v_strike_occur_amt;

      /* [插入重复更新][交易期货_账户_交易组业务资金表][字段][字段变量][{交易费用}={交易费用}+@交易费用#,{成交释放金额}={成交释放金额}+@成交释放金额#,{成交费用}={成交费用}+@成交费用#,{平仓盈亏}={平仓盈亏}+@平仓盈亏#][2][@交易组编号#,@资产账户编号#,@交易币种#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfuac_exgp_busi_capit (
          create_date, create_time, update_date, 
          update_time, update_times, co_no, pd_no, 
          exch_group_no, asset_acco_no, exch_crncy_type, begin_amt, 
          curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
          comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_capt_amt, 
          trade_releas_amt, strike_capt_amt, strike_releas_amt, capt_margin, 
          trade_fee, strike_fee, close_pandl, marked_pandl) 
      values(
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_co_no, v_pd_no, 
          v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_begin_amt, 
          v_curr_amt, v_frozen_amt, v_unfroz_amt, v_comm_frozen_amt, 
          v_comm_unfroz_amt, v_comm_capt_amt, v_comm_releas_amt, v_trade_capt_amt, 
          v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt, v_capt_margin, 
          v_trade_fee, v_strike_fee, v_close_pandl, v_marked_pandl) 
      ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, trade_fee=trade_fee+v_trade_fee,strike_releas_amt=strike_releas_amt+v_strike_releas_amt,strike_fee=strike_fee+v_strike_fee,close_pandl=close_pandl+v_close_pandl;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.2.44.2";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type),"#",v_mysql_message);
          else
              SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type);
          end if;
          leave label_pro;
      end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_更新资产账户成交资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_UpdateAsacStrikeCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_UpdateAsacStrikeCapit(
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
    IN p_exch_crncy_type varchar(3),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_invest_type int,
    IN p_lngsht_type int,
    IN p_contrc_dir int,
    IN p_order_dir int,
    IN p_strike_occur_amt decimal(18,4),
    IN p_strike_fee decimal(18,4),
    IN p_trade_occur_amt decimal(18,4),
    IN p_trade_fee decimal(18,4),
    IN p_close_pandl decimal(18,4),
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
    declare v_exch_crncy_type varchar(3);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_invest_type int;
    declare v_lngsht_type int;
    declare v_contrc_dir int;
    declare v_order_dir int;
    declare v_strike_occur_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_unfroz_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_comm_releas_amt decimal(18,4);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_marked_pandl decimal(18,4);
    declare v_capt_margin decimal(18,4);
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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_invest_type = p_invest_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_contrc_dir = p_contrc_dir;
    SET v_order_dir = p_order_dir;
    SET v_strike_occur_amt = p_strike_occur_amt;
    SET v_strike_fee = p_strike_fee;
    SET v_trade_occur_amt = p_trade_occur_amt;
    SET v_trade_fee = p_trade_fee;
    SET v_close_pandl = p_close_pandl;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_unfroz_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_comm_releas_amt = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_trade_capt_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_capt_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_marked_pandl = 0;
    SET v_capt_margin = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @期初金额#=0; */
    set v_begin_amt=0;

    /* set @当前金额#=0; */
    set v_curr_amt=0;

    /* set @冻结金额#=0; */
    set v_frozen_amt=0;

    /* set @解冻金额#=0; */
    set v_unfroz_amt=0;

    /* set @指令冻结金额#=0; */
    set v_comm_frozen_amt=0;

    /* set @指令解冻金额#=0; */
    set v_comm_unfroz_amt=0;

    /* set @指令占用金额#=0; */
    set v_comm_capt_amt=0;

    /* set @指令释放金额#=0; */
    set v_comm_releas_amt=0;

    /* set @指令变动金额#=0; */
    set v_comm_occur_amt=0;

    /* set @指令变动数量#=0; */
    set v_comm_occur_qty=0;

    /* set @交易占用金额#=0; */
    set v_trade_capt_amt=0;

    /* set @交易释放金额#=0; */
    set v_trade_releas_amt=0;

    /* set @成交占用金额#=0; */
    set v_strike_capt_amt=0;

    /* set @成交释放金额#=0; */
    set v_strike_releas_amt=0;

    /* set @盯市盈亏#=0; */
    set v_marked_pandl=0;

    /* set @占用保证金#=0; */
    set v_capt_margin=0;

    /* if @开平方向#=《开平方向-开仓》 then */
    if v_contrc_dir=1 then

      /* set @交易占用金额#=@交易变动金额#; */
      set v_trade_capt_amt=v_trade_occur_amt;

      /* set @成交占用金额#=@成交变动金额#; */
      set v_strike_capt_amt=v_strike_occur_amt;

      /* [插入重复更新][交易期货_账户_资产账户业务资金表][字段][字段变量][{交易占用金额}={交易占用金额}+@交易占用金额#,{交易费用}={交易费用}+@交易费用#,{成交占用金额}={成交占用金额}+@成交占用金额#,{成交费用}={成交费用}+@成交费用#][1][@资产账户编号#,@交易币种#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfuac_asac_busi_capit (
          create_date, create_time, update_date, 
          update_time, update_times, co_no, pd_no, 
          asset_acco_no, exch_crncy_type, begin_amt, curr_amt, 
          frozen_amt, unfroz_amt, comm_frozen_amt, comm_unfroz_amt, 
          comm_capt_amt, comm_releas_amt, trade_capt_amt, trade_releas_amt, 
          strike_capt_amt, strike_releas_amt, capt_margin, trade_fee, 
          strike_fee, close_pandl, marked_pandl) 
      values(
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_co_no, v_pd_no, 
          v_asset_acco_no, v_exch_crncy_type, v_begin_amt, v_curr_amt, 
          v_frozen_amt, v_unfroz_amt, v_comm_frozen_amt, v_comm_unfroz_amt, 
          v_comm_capt_amt, v_comm_releas_amt, v_trade_capt_amt, v_trade_releas_amt, 
          v_strike_capt_amt, v_strike_releas_amt, v_capt_margin, v_trade_fee, 
          v_strike_fee, v_close_pandl, v_marked_pandl) 
      ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, trade_capt_amt=trade_capt_amt+v_trade_capt_amt,trade_fee=trade_fee+v_trade_fee,strike_capt_amt=strike_capt_amt+v_strike_capt_amt,strike_fee=strike_fee+v_strike_fee;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.2.45.1";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type),"#",v_mysql_message);
          else
              SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type);
          end if;
          leave label_pro;
      end if;

    else
      #set @交易占用金额#=@交易变动金额#;

      /* set @成交释放金额#=@成交变动金额#; */
      set v_strike_releas_amt=v_strike_occur_amt;

      /* [插入重复更新][交易期货_账户_资产账户业务资金表][字段][字段变量][{交易费用}={交易费用}+@交易费用#,{成交释放金额}={成交释放金额}+@成交释放金额#,{成交费用}={成交费用}+@成交费用#,{平仓盈亏}={平仓盈亏}+@平仓盈亏#][2][@资产账户编号#,@交易币种#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfuac_asac_busi_capit (
          create_date, create_time, update_date, 
          update_time, update_times, co_no, pd_no, 
          asset_acco_no, exch_crncy_type, begin_amt, curr_amt, 
          frozen_amt, unfroz_amt, comm_frozen_amt, comm_unfroz_amt, 
          comm_capt_amt, comm_releas_amt, trade_capt_amt, trade_releas_amt, 
          strike_capt_amt, strike_releas_amt, capt_margin, trade_fee, 
          strike_fee, close_pandl, marked_pandl) 
      values(
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_co_no, v_pd_no, 
          v_asset_acco_no, v_exch_crncy_type, v_begin_amt, v_curr_amt, 
          v_frozen_amt, v_unfroz_amt, v_comm_frozen_amt, v_comm_unfroz_amt, 
          v_comm_capt_amt, v_comm_releas_amt, v_trade_capt_amt, v_trade_releas_amt, 
          v_strike_capt_amt, v_strike_releas_amt, v_capt_margin, v_trade_fee, 
          v_strike_fee, v_close_pandl, v_marked_pandl) 
      ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, trade_fee=trade_fee+v_trade_fee,strike_releas_amt=strike_releas_amt+v_strike_releas_amt,strike_fee=strike_fee+v_strike_fee,close_pandl=close_pandl+v_close_pandl;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.2.45.2";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type),"#",v_mysql_message);
          else
              SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type);
          end if;
          leave label_pro;
      end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_更新交易组交易资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_UpdateExgpTradeCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_UpdateExgpTradeCapit(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_dir int,
    IN p_invest_type int,
    IN p_lngsht_type int,
    IN p_strike_occur_amt decimal(18,4),
    IN p_strike_fee decimal(18,4),
    IN p_trade_occur_amt decimal(18,4),
    IN p_trade_fee decimal(18,4),
    IN p_comm_occur_amt decimal(18,4),
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_dir int;
    declare v_invest_type int;
    declare v_lngsht_type int;
    declare v_strike_occur_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_comm_occur_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_crncy_type varchar(3);
    declare v_capt_margin decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_unfroz_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_comm_releas_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_marked_pandl decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_dir = p_contrc_dir;
    SET v_invest_type = p_invest_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_strike_occur_amt = p_strike_occur_amt;
    SET v_strike_fee = p_strike_fee;
    SET v_trade_occur_amt = p_trade_occur_amt;
    SET v_trade_fee = p_trade_fee;
    SET v_comm_occur_amt = p_comm_occur_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_capt_margin = 0;
    SET v_close_pandl = 0;
    SET v_strike_capt_amt = 0;
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_unfroz_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_comm_releas_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_marked_pandl = 0;
    SET v_trade_capt_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @交易币种#="CNY"; */
    set v_exch_crncy_type="CNY";

    /* set @占用保证金#=0; */
    set v_capt_margin=0;

    /* set @平仓盈亏#=0; */
    set v_close_pandl=0;

    /* set @成交占用金额#=0; */
    set v_strike_capt_amt=0;

    /* set @期初金额#=0; */
    set v_begin_amt=0;

    /* set @当前金额#=0; */
    set v_curr_amt=0;

    /* set @冻结金额#=0; */
    set v_frozen_amt=0;

    /* set @解冻金额#=0; */
    set v_unfroz_amt=0;

    /* set @指令冻结金额#=0; */
    set v_comm_frozen_amt=0;

    /* set @指令解冻金额#=0; */
    set v_comm_unfroz_amt=0;

    /* set @指令占用金额#=0; */
    set v_comm_capt_amt=0;

    /* set @指令释放金额#=0; */
    set v_comm_releas_amt=0;

    /* set @交易释放金额#=0; */
    set v_trade_releas_amt=0;

    /* set @成交释放金额#=0; */
    set v_strike_releas_amt=0;

    /* set @盯市盈亏#=0; */
    set v_marked_pandl=0;

    /* set @交易占用金额#=@交易变动金额#; */
    set v_trade_capt_amt=v_trade_occur_amt;

    /* set @指令占用金额#=@指令变动金额#; */
    set v_comm_capt_amt=v_comm_occur_amt;

    /* [插入重复更新][交易期货_账户_交易组业务资金表][字段][字段变量][{指令占用金额} = {指令占用金额} + @指令占用金额#,{交易占用金额}={交易占用金额}+@交易占用金额#,{交易费用}={交易费用}+@交易费用#,{成交费用}={成交费用}+@成交费用#][1][@交易组编号#,@资产账户编号#,@交易币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdfutu.tb_tdfuac_exgp_busi_capit (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
        comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_capt_amt, 
        trade_releas_amt, strike_capt_amt, strike_releas_amt, capt_margin, 
        trade_fee, strike_fee, close_pandl, marked_pandl) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_begin_amt, 
        v_curr_amt, v_frozen_amt, v_unfroz_amt, v_comm_frozen_amt, 
        v_comm_unfroz_amt, v_comm_capt_amt, v_comm_releas_amt, v_trade_capt_amt, 
        v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt, v_capt_margin, 
        v_trade_fee, v_strike_fee, v_close_pandl, v_marked_pandl) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, comm_capt_amt = comm_capt_amt + v_comm_capt_amt,trade_capt_amt=trade_capt_amt+v_trade_capt_amt,trade_fee=trade_fee+v_trade_fee,strike_fee=strike_fee+v_strike_fee;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.2.46.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_更新资产账户交易资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_UpdateAsacTradeCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_UpdateAsacTradeCapit(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_dir int,
    IN p_invest_type int,
    IN p_lngsht_type int,
    IN p_strike_occur_amt decimal(18,4),
    IN p_strike_fee decimal(18,4),
    IN p_trade_occur_amt decimal(18,4),
    IN p_trade_fee decimal(18,4),
    IN p_comm_occur_amt decimal(18,4),
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_dir int;
    declare v_invest_type int;
    declare v_lngsht_type int;
    declare v_strike_occur_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_comm_occur_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_crncy_type varchar(3);
    declare v_capt_margin decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_unfroz_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_comm_releas_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_marked_pandl decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_crncy_type varchar(3);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_dir = p_contrc_dir;
    SET v_invest_type = p_invest_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_strike_occur_amt = p_strike_occur_amt;
    SET v_strike_fee = p_strike_fee;
    SET v_trade_occur_amt = p_trade_occur_amt;
    SET v_trade_fee = p_trade_fee;
    SET v_comm_occur_amt = p_comm_occur_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_capt_margin = 0;
    SET v_close_pandl = 0;
    SET v_strike_capt_amt = 0;
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_unfroz_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_comm_releas_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_marked_pandl = 0;
    SET v_trade_capt_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* set @交易币种#="CNY"; */
    set v_exch_crncy_type="CNY";

    /* set @占用保证金#=0; */
    set v_capt_margin=0;

    /* set @平仓盈亏#=0; */
    set v_close_pandl=0;

    /* set @成交占用金额#=0; */
    set v_strike_capt_amt=0;

    /* set @期初金额#=0; */
    set v_begin_amt=0;

    /* set @当前金额#=0; */
    set v_curr_amt=0;

    /* set @冻结金额#=0; */
    set v_frozen_amt=0;

    /* set @解冻金额#=0; */
    set v_unfroz_amt=0;

    /* set @指令冻结金额#=0; */
    set v_comm_frozen_amt=0;

    /* set @指令解冻金额#=0; */
    set v_comm_unfroz_amt=0;

    /* set @指令占用金额#=0; */
    set v_comm_capt_amt=0;

    /* set @指令释放金额#=0; */
    set v_comm_releas_amt=0;

    /* set @交易释放金额#=0; */
    set v_trade_releas_amt=0;

    /* set @成交释放金额#=0; */
    set v_strike_releas_amt=0;

    /* set @盯市盈亏#=0; */
    set v_marked_pandl=0;

    /* set @交易占用金额#=@交易变动金额#; */
    set v_trade_capt_amt=v_trade_occur_amt;

    /* set @指令占用金额#=@指令变动金额#; */
    set v_comm_capt_amt=v_comm_occur_amt;

    /* [插入重复更新][交易期货_账户_资产账户业务资金表][字段][字段变量][{指令占用金额} = {指令占用金额} + @指令占用金额#,{交易占用金额}={交易占用金额}+@交易占用金额#,{交易费用}={交易费用}+@交易费用#,{成交费用}={成交费用}+@成交费用#][1][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdfutu.tb_tdfuac_asac_busi_capit (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_crncy_type, begin_amt, curr_amt, 
        frozen_amt, unfroz_amt, comm_frozen_amt, comm_unfroz_amt, 
        comm_capt_amt, comm_releas_amt, trade_capt_amt, trade_releas_amt, 
        strike_capt_amt, strike_releas_amt, capt_margin, trade_fee, 
        strike_fee, close_pandl, marked_pandl) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_crncy_type, v_begin_amt, v_curr_amt, 
        v_frozen_amt, v_unfroz_amt, v_comm_frozen_amt, v_comm_unfroz_amt, 
        v_comm_capt_amt, v_comm_releas_amt, v_trade_capt_amt, v_trade_releas_amt, 
        v_strike_capt_amt, v_strike_releas_amt, v_capt_margin, v_trade_fee, 
        v_strike_fee, v_close_pandl, v_marked_pandl) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, comm_capt_amt = comm_capt_amt + v_comm_capt_amt,trade_capt_amt=trade_capt_amt+v_trade_capt_amt,trade_fee=trade_fee+v_trade_fee,strike_fee=strike_fee+v_strike_fee;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.2.47.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_查询历史交易组业务资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_QueryExgpCashHis;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_QueryExgpCashHis(
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
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_exch_crncy_type varchar(3);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易期货_账户_历史交易组业务资金表][字段][{机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and (@交易组编号权限串#="; ;" or instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0) and (@交易币种# = " " or {交易币种} = @交易币种#) and {初始化日期} > @开始日期# and {初始化日期} < @结束日期# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_crncy_type, begin_amt, curr_amt, frozen_amt, 
        unfroz_amt, comm_frozen_amt, comm_unfroz_amt, comm_capt_amt, 
        comm_releas_amt, trade_capt_amt, trade_releas_amt, strike_capt_amt, 
        strike_releas_amt, capt_margin, trade_fee, strike_fee, 
        close_pandl, marked_pandl from db_tdfutu_his.tb_tdfuac_exgp_busi_capit_his where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_exch_group_no_rights_str="; ;" or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0) and (v_exch_crncy_type = " " or exch_crncy_type = v_exch_crncy_type) and init_date > v_begin_date and init_date < v_end_date and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_crncy_type, begin_amt, curr_amt, frozen_amt, 
        unfroz_amt, comm_frozen_amt, comm_unfroz_amt, comm_capt_amt, 
        comm_releas_amt, trade_capt_amt, trade_releas_amt, strike_capt_amt, 
        strike_releas_amt, capt_margin, trade_fee, strike_fee, 
        close_pandl, marked_pandl from db_tdfutu_his.tb_tdfuac_exgp_busi_capit_his where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_exch_group_no_rights_str="; ;" or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0) and (v_exch_crncy_type = " " or exch_crncy_type = v_exch_crncy_type) and init_date > v_begin_date and init_date < v_end_date and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_账户_新增保证金优惠信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuac_AddMargin;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuac_AddMargin(
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
    IN p_comb_code varchar(6),
    IN p_hedge_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_comb_code varchar(6);
    declare v_hedge_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_exch_crncy_type varchar(3);
    declare v_long_comm_margin decimal(18,4);
    declare v_short_comm_margin decimal(18,4);
    declare v_long_order_margin decimal(18,4);
    declare v_short_order_margin decimal(18,4);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_long_strike_margin decimal(18,4);
    declare v_short_strike_margin decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_posi_capt_amt decimal(18,4);
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
    SET v_comb_code = p_comb_code;
    SET v_hedge_type = p_hedge_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_long_comm_margin = 0;
    SET v_short_comm_margin = 0;
    SET v_long_order_margin = 0;
    SET v_short_order_margin = 0;
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_long_strike_margin = 0;
    SET v_short_strike_margin = 0;
    SET v_trade_capt_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_posi_capt_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

      /* set @交易币种#="CNY"; */
      set v_exch_crncy_type="CNY";

      /* set @多头指令保证金#=0; */
      set v_long_comm_margin=0;

      /* set @空头指令保证金#=0; */
      set v_short_comm_margin=0;

      /* set @多头订单保证金#=0; */
      set v_long_order_margin=0;

      /* set @空头订单保证金#=0; */
      set v_short_order_margin=0;

      /* set @多头持仓保证金#=0; */
      set v_long_hold_margin=0;

      /* set @空头持仓保证金#=0; */
      set v_short_hold_margin=0;

      /* set @多头成交保证金#=0; */
      set v_long_strike_margin=0;

      /* set @空头成交保证金#=0; */
      set v_short_strike_margin=0;

      /* set @交易占用金额#=0; */
      set v_trade_capt_amt=0;

      /* set @指令占用金额# = 0; */
      set v_comm_capt_amt = 0;

      /* set @持仓占用金额#=0; */
      set v_posi_capt_amt=0;

      /* [插入表记录][交易期货_账户_期货保证金优惠控制表][字段][字段变量][1][@产品编号#,@交易组编号#,@资产账户编号#,@市场编号#,@组合编码#,@套保标志#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfuac_margin_ctrl(
          create_date, create_time, update_date, 
          update_time, update_times, co_no, pd_no, 
          exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
          hedge_type, comb_code, long_comm_margin, short_comm_margin, 
          long_order_margin, short_order_margin, long_strike_margin, short_strike_margin, 
          long_hold_margin, short_hold_margin, trade_capt_amt, posi_capt_amt, 
          comm_capt_amt) 
      value( 
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_co_no, v_pd_no, 
          v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
          v_hedge_type, v_comb_code, v_long_comm_margin, v_short_comm_margin, 
          v_long_order_margin, v_short_order_margin, v_long_strike_margin, v_short_strike_margin, 
          v_long_hold_margin, v_short_hold_margin, v_trade_capt_amt, v_posi_capt_amt, 
          v_comm_capt_amt);
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.2.49.1";
          SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","组合编码=",v_comb_code,",","套保标志=",v_hedge_type),"#",v_mysql_message);
          leave label_pro;
      end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;

END;;


