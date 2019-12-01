DELIMITER ;;
use db_clfutu;;

# 事务_清算期货_结算_更新获取清算持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfust_UpdateGetPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_clfust_UpdateGetPosi(
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
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_out_acco varchar(32),
    OUT p_futu_acco_no int,
    OUT p_contrc_unit int,
    OUT p_posi_amt decimal(18,4),
    OUT p_rece_margin decimal(18,4),
    OUT p_pass_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_comb_code varchar(6),
    OUT p_curr_qty decimal(18,2),
    OUT p_sett_price decimal(16,9),
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_deliv_flag int,
    OUT p_margin_pref int
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
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_out_acco varchar(32);
    declare v_futu_acco_no int;
    declare v_contrc_unit int;
    declare v_posi_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_pass_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_comb_code varchar(6);
    declare v_curr_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_deliv_flag int;
    declare v_margin_pref int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_out_acco = " ";
    SET v_futu_acco_no = 0;
    SET v_contrc_unit = 0;
    SET v_posi_amt = 0;
    SET v_rece_margin = 0;
    SET v_pass_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_comb_code = " ";
    SET v_curr_qty = 0;
    SET v_sett_price = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_deliv_flag = 0;
    SET v_margin_pref = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_结算_更新获取清算持仓】*/
        call db_clfutu.pra_clfust_UpdateGetPosi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_qry_no,
            v_error_code,
            v_error_info,
            v_row_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_out_acco,
            v_futu_acco_no,
            v_contrc_unit,
            v_posi_amt,
            v_rece_margin,
            v_pass_no,
            v_asset_acco_no,
            v_exch_no,
            v_contrc_code_no,
            v_contrc_type,
            v_comb_code,
            v_curr_qty,
            v_sett_price,
            v_lngsht_type,
            v_hedge_type,
            v_deliv_flag,
            v_margin_pref);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.3.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_结算_更新获取清算持仓出现错误！',v_mysql_message);
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
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_out_acco = v_out_acco;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_unit = v_contrc_unit;
    SET p_posi_amt = v_posi_amt;
    SET p_rece_margin = v_rece_margin;
    SET p_pass_no = v_pass_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_comb_code = v_comb_code;
    SET p_curr_qty = v_curr_qty;
    SET p_sett_price = v_sett_price;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_deliv_flag = v_deliv_flag;
    SET p_margin_pref = v_margin_pref;

END;;


DELIMITER ;;
use db_clfutu;;

# 事务_清算期货_结算_更新持仓保证金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfust_UpdateHoldMargin;;
DELIMITER ;;
CREATE PROCEDURE prt_clfust_UpdateHoldMargin(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_margin_pref int,
    IN p_comb_code varchar(6),
    IN p_sett_price decimal(16,9),
    IN p_rece_margin decimal(18,4),
    IN p_contrc_unit int,
    IN p_deliv_flag int,
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
    declare v_margin_pref int;
    declare v_comb_code varchar(6);
    declare v_sett_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_contrc_unit int;
    declare v_deliv_flag int;
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
    SET v_margin_pref = p_margin_pref;
    SET v_comb_code = p_comb_code;
    SET v_sett_price = p_sett_price;
    SET v_rece_margin = p_rece_margin;
    SET v_contrc_unit = p_contrc_unit;
    SET v_deliv_flag = p_deliv_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_结算_更新持仓保证金】*/
        call db_clfutu.pra_clfust_UpdateHoldMargin(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_margin_pref,
            v_comb_code,
            v_sett_price,
            v_rece_margin,
            v_contrc_unit,
            v_deliv_flag,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.3.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_结算_更新持仓保证金出现错误！',v_mysql_message);
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
use db_clfutu;;

# 事务_清算期货_结算_获取清算持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfust_GetPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_clfust_GetPosi(
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
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_futu_acco_no int,
    OUT p_pass_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_curr_qty decimal(18,2),
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_margin_pref int,
    OUT p_comb_code varchar(6)
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
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_futu_acco_no int;
    declare v_pass_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_curr_qty decimal(18,2);
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_margin_pref int;
    declare v_comb_code varchar(6);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_futu_acco_no = 0;
    SET v_pass_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_curr_qty = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_margin_pref = 0;
    SET v_comb_code = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_结算_获取清算持仓】*/
        call db_clfutu.pra_clfust_GetPosi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_qry_no,
            v_error_code,
            v_error_info,
            v_row_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_futu_acco_no,
            v_pass_no,
            v_asset_acco_no,
            v_exch_no,
            v_contrc_code_no,
            v_contrc_type,
            v_curr_qty,
            v_lngsht_type,
            v_hedge_type,
            v_comb_code,
            v_margin_pref);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.3.3.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_结算_获取清算持仓出现错误！',v_mysql_message);
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
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_curr_qty = v_curr_qty;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_margin_pref = v_margin_pref;
    SET p_comb_code = v_comb_code;

END;;


DELIMITER ;;
use db_clfutu;;

# 事务_清算期货_结算_结算处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfust_DealSettle;;
DELIMITER ;;
CREATE PROCEDURE prt_clfust_DealSettle(
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
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_margin_pref int,
    IN p_comb_code varchar(6),
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_pre_settle_price decimal(16,9),
    IN p_sett_price decimal(16,9),
    IN p_curr_qty decimal(18,2),
    IN p_posi_amt decimal(18,4),
    IN p_rece_margin decimal(18,4),
    IN p_comb_type int,
    IN p_deliv_flag int,
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_margin_pref int;
    declare v_comb_code varchar(6);
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_curr_qty decimal(18,2);
    declare v_posi_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comb_type int;
    declare v_deliv_flag int;
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
    SET v_row_id = p_row_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_margin_pref = p_margin_pref;
    SET v_comb_code = p_comb_code;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_sett_price = p_sett_price;
    SET v_curr_qty = p_curr_qty;
    SET v_posi_amt = p_posi_amt;
    SET v_rece_margin = p_rece_margin;
    SET v_comb_type = p_comb_type;
    SET v_deliv_flag = p_deliv_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_结算_持仓处理】*/
        call db_clfutu.pra_clfust_PosiHoldDeal(
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
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_type,
            v_contrc_unit,
            v_lngsht_type,
            v_hedge_type,
            v_pre_settle_price,
            v_sett_price,
            v_curr_qty,
            v_posi_amt,
            v_rece_margin,
            v_margin_pref,
            v_comb_code,
            v_comb_type,
            v_deliv_flag,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.3.31.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_结算_持仓处理出现错误！',v_mysql_message);
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
use db_clfutu;;

# 事务_清算期货_结算_更新待入账记录入账状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfust_UpdatePreEntryEntryStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_clfust_UpdatePreEntryEntryStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_row_id bigint,
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
    declare v_row_id bigint;
    declare v_entry_status varchar(2);
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
    SET v_row_id = p_row_id;
    SET v_entry_status = p_entry_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_结算_更新待入账记录入账状态】*/
        call db_clfutu.pra_clfust_UpdatePreEntryEntryStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_row_id,
            v_entry_status,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.3.40.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_结算_更新待入账记录入账状态出现错误！',v_mysql_message);
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
use db_clfutu;;

# 事务_清算期货_结算_更新待入账记录回滚状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfust_UpdatePreEntryUndoStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_clfust_UpdatePreEntryUndoStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_row_id bigint,
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
    declare v_undo_status varchar(2);
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
    SET v_row_id = p_row_id;
    SET v_undo_status = p_undo_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_结算_更新待入账记录回滚状态】*/
        call db_clfutu.pra_clfust_UpdatePreEntryUndoStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_row_id,
            v_undo_status,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.3.41.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_结算_更新待入账记录回滚状态出现错误！',v_mysql_message);
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
use db_clfutu;;

# 事务_清算期货_结算_更新待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfust_UpdatePreEntry;;
DELIMITER ;;
CREATE PROCEDURE prt_clfust_UpdatePreEntry(
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
    IN p_entry_posi_jour_no bigint,
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
    declare v_entry_posi_jour_no bigint;
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
    SET v_row_id = p_row_id;
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_posi_jour_no = p_entry_posi_jour_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_结算_更新待入账记录】*/
        call db_clfutu.pra_clfust_UpdatePreEntry(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_row_id,
            v_entry_money_jour_no,
            v_entry_posi_jour_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.3.42.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_结算_更新待入账记录出现错误！',v_mysql_message);
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
use db_clfutu;;

# 事务_清算期货_结算_更新获取待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfust_UpdateGetPreEntry;;
DELIMITER ;;
CREATE PROCEDURE prt_clfust_UpdateGetPreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    IN p_ctrl_flag int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_record_count int,
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
    OUT p_contrc_dir int,
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_pre_settle_price decimal(16,9),
    OUT p_sett_price decimal(16,9),
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_rece_margin decimal(18,4),
    OUT p_comb_code varchar(6),
    OUT p_sett_capt_margin decimal(18,4),
    OUT p_sett_marked_pandl decimal(18,4),
    OUT p_busi_flag int,
    OUT p_entry_status varchar(2),
    OUT p_undo_status varchar(2),
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_posi_jour_no bigint,
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
    declare v_query_row_id bigint;
    declare v_ctrl_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_record_count int;
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
    declare v_contrc_dir int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_sett_capt_margin decimal(18,4);
    declare v_sett_marked_pandl decimal(18,4);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
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
    SET v_query_row_id = p_query_row_id;
    SET v_ctrl_flag = p_ctrl_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_record_count = 0;
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
    SET v_contrc_dir = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_pre_settle_price = 0;
    SET v_sett_price = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_rece_margin = 0;
    SET v_comb_code = " ";
    SET v_sett_capt_margin = 0;
    SET v_sett_marked_pandl = 0;
    SET v_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_entry_money_jour_no = 0;
    SET v_entry_posi_jour_no = 0;
    SET v_deli_jour_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_结算_更新获取待入账记录】*/
        call db_clfutu.pra_clfust_UpdateGetPreEntry(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_query_row_id,
            v_ctrl_flag,
            v_error_code,
            v_error_info,
            v_record_count,
            v_row_id,
            v_init_date,
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
            v_lngsht_type,
            v_hedge_type,
            v_order_price,
            v_order_qty,
            v_pre_settle_price,
            v_sett_price,
            v_pre_entry_qty,
            v_pre_entry_amt,
            v_rece_margin,
            v_comb_code,
            v_sett_capt_margin,
            v_sett_marked_pandl,
            v_busi_flag,
            v_entry_status,
            v_undo_status,
            v_entry_money_jour_no,
            v_entry_posi_jour_no,
            v_deli_jour_no);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.3.43.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_结算_更新获取待入账记录出现错误！',v_mysql_message);
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
    SET p_record_count = v_record_count;
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
    SET p_contrc_dir = v_contrc_dir;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_sett_price = v_sett_price;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_rece_margin = v_rece_margin;
    SET p_comb_code = v_comb_code;
    SET p_sett_capt_margin = v_sett_capt_margin;
    SET p_sett_marked_pandl = v_sett_marked_pandl;
    SET p_busi_flag = v_busi_flag;
    SET p_entry_status = v_entry_status;
    SET p_undo_status = v_undo_status;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_posi_jour_no = v_entry_posi_jour_no;
    SET p_deli_jour_no = v_deli_jour_no;

END;;


DELIMITER ;;
use db_clfutu;;

# 事务_清算期货_结算_更新获取回滚待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfust_UpdateGetUndoPreEntry;;
DELIMITER ;;
CREATE PROCEDURE prt_clfust_UpdateGetUndoPreEntry(
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
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_结算_更新获取回滚待入账记录】*/
        call db_clfutu.pra_clfust_UpdateGetUndoPreEntry(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_qry_no,
            v_error_code,
            v_error_info,
            v_record_count,
            v_row_id,
            v_init_date,
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
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_contrc_dir,
            v_lngsht_type,
            v_hedge_type,
            v_order_price,
            v_order_qty,
            v_pre_settle_price,
            v_sett_price,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_strike_num,
            v_pre_entry_qty,
            v_pre_entry_amt,
            v_rece_margin,
            v_comb_code,
            v_long_hold_margin,
            v_short_hold_margin,
            v_sett_capt_margin,
            v_sett_close_pandl,
            v_sett_marked_pandl,
            v_sett_close_pandl_today,
            v_all_fee,
            v_report_fee,
            v_wtdraw_fee,
            v_deli_fee,
            v_service_fee,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_out_all_fee,
            v_out_report_fee,
            v_out_cancel_fee,
            v_out_deli_fee,
            v_out_service_fee,
            v_out_other_fee,
            v_out_brkage_commis,
            v_out_other_commis,
            v_busi_flag,
            v_entry_status,
            v_undo_status,
            v_entry_money_jour_no,
            v_entry_posi_jour_no,
            v_deli_jour_no);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.3.44.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_结算_更新获取回滚待入账记录出现错误！',v_mysql_message);
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

END;;


DELIMITER ;;
use db_clfutu;;

# 事务_清算期货_结算_查询待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfust_QueryPreEntry;;
DELIMITER ;;
CREATE PROCEDURE prt_clfust_QueryPreEntry(
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
    

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";",@市场编号串#,";"); */
        set v_exch_no_str=concat(";",v_exch_no_str,";");
    end if;

    /* if @本币币种串# <> " " then */
    if v_crncy_type_str <> " " then

        /* set @本币币种串#=concat(";",@本币币种串#,";"); */
        set v_crncy_type_str=concat(";",v_crncy_type_str,";");
    end if;

    /* 调用【原子_清算期货_结算_查询待入账记录】*/
    call db_clfutu.pra_clfust_QueryPreEntry(
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
        v_exch_no_str,
        v_futu_acco_no,
        v_contrc_code_no,
        v_crncy_type_str,
        v_entry_status,
        v_undo_status,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "clfutuT.3.45.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_结算_查询待入账记录出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


