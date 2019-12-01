DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_风控接口_查询交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfurkif_QueryExgpCash;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfurkif_QueryExgpCash(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易期货_账户_交易组业务资金表][字段][{记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        comm_frozen_amt, comm_unfroz_amt, comm_capt_amt, comm_releas_amt, 
        trade_capt_amt, trade_releas_amt, strike_capt_amt, strike_releas_amt, 
        capt_margin, trade_fee, strike_fee, close_pandl, 
        marked_pandl from db_tdfutu.tb_tdfuac_exgp_busi_capit where row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        comm_frozen_amt, comm_unfroz_amt, comm_capt_amt, comm_releas_amt, 
        trade_capt_amt, trade_releas_amt, strike_capt_amt, strike_releas_amt, 
        capt_margin, trade_fee, strike_fee, close_pandl, 
        marked_pandl from db_tdfutu.tb_tdfuac_exgp_busi_capit where row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_风控接口_查询资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfurkif_QueryAsacCash;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfurkif_QueryAsacCash(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易期货_账户_资产账户业务资金表][字段][{记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
        comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_capt_amt, 
        trade_releas_amt, strike_capt_amt, strike_releas_amt, capt_margin, 
        trade_fee, strike_fee, close_pandl, marked_pandl from db_tdfutu.tb_tdfuac_asac_busi_capit where row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
        comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_capt_amt, 
        trade_releas_amt, strike_capt_amt, strike_releas_amt, capt_margin, 
        trade_fee, strike_fee, close_pandl, marked_pandl from db_tdfutu.tb_tdfuac_asac_busi_capit where row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_风控接口_查询交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfurkif_QueryExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfurkif_QueryExgpPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易期货_账户_交易组业务持仓表][字段][{记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
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
        pre_settle_price, realize_pandl, close_pandl, open_amount from db_tdfutu.tb_tdfuac_exgp_busi_posi where row_id>v_row_id order by row_id;
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
        pre_settle_price, realize_pandl, close_pandl, open_amount from db_tdfutu.tb_tdfuac_exgp_busi_posi where row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_风控接口_查询资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfurkif_QueryAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfurkif_QueryAsacPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易期货_账户_资产账户业务持仓表][字段][{记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
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
        realize_pandl, close_pandl, open_amount from db_tdfutu.tb_tdfuac_asac_busi_posi where row_id>v_row_id order by row_id;
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
        realize_pandl, close_pandl, open_amount from db_tdfutu.tb_tdfuac_asac_busi_posi where row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_风控接口_查询保证金优惠信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfurkif_QueryMarginCtrlInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfurkif_QueryMarginCtrlInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易期货_账户_期货保证金优惠控制表][字段][{记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, hedge_type, comb_code, long_comm_margin, 
        short_comm_margin, long_order_margin, short_order_margin, long_strike_margin, 
        short_strike_margin, long_hold_margin, short_hold_margin, trade_capt_amt, 
        posi_capt_amt, comm_capt_amt from db_tdfutu.tb_tdfuac_margin_ctrl where row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, hedge_type, comb_code, long_comm_margin, 
        short_comm_margin, long_order_margin, short_order_margin, long_strike_margin, 
        short_strike_margin, long_hold_margin, short_hold_margin, trade_capt_amt, 
        posi_capt_amt, comm_capt_amt from db_tdfutu.tb_tdfuac_margin_ctrl where row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_风控接口_查询交易组持仓明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfurkif_QueryExgpPosiDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfurkif_QueryExgpPosiDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易期货_账户_交易组持仓明细表][字段][{记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        exch_crncy_type, futu_acco_no, contrc_code_no, contrc_unit, 
        contrc_type, curr_qty, invest_type, lngsht_type, 
        hedge_type, open_posi_date, open_posi_time, open_posi_price, 
        open_posi_qty, open_amount, open_posi_fee, close_posi_fee, 
        trade_capt_qty, strike_capt_qty, marked_sett_price, strike_no, 
        detail_posi_id, rece_margin, close_pandl, marked_pandl from db_tdfutu.tb_tdfuac_exgp_posi_detail where row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        exch_crncy_type, futu_acco_no, contrc_code_no, contrc_unit, 
        contrc_type, curr_qty, invest_type, lngsht_type, 
        hedge_type, open_posi_date, open_posi_time, open_posi_price, 
        open_posi_qty, open_amount, open_posi_fee, close_posi_fee, 
        trade_capt_qty, strike_capt_qty, marked_sett_price, strike_no, 
        detail_posi_id, rece_margin, close_pandl, marked_pandl from db_tdfutu.tb_tdfuac_exgp_posi_detail where row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


