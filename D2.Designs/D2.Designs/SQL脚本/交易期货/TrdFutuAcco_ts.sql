DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_账户_计算交易组资金可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuac_CalcExgpCashAvail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuac_CalcExgpCashAvail(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易期货_账户_计算交易组资金可用】*/
    call db_tdfutu.pra_tdfuac_CalcExgpCashAvail(
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
        v_exch_crncy_type,
        v_error_code,
        v_error_info,
        v_comm_avail_amt,
        v_trade_avail_amt,
        v_static_avail_amt);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.2.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_计算交易组资金可用出现错误！',v_mysql_message);
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
    SET p_comm_avail_amt = v_comm_avail_amt;
    SET p_trade_avail_amt = v_trade_avail_amt;
    SET p_static_avail_amt = v_static_avail_amt;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_账户_计算资产账户资金可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuac_CalcAsacCashAvail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuac_CalcAsacCashAvail(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易期货_账户_计算资产账户资金可用】*/
    call db_tdfutu.pra_tdfuac_CalcAsacCashAvail(
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
        v_exch_crncy_type,
        v_error_code,
        v_error_info,
        v_comm_avail_amt,
        v_trade_avail_amt,
        v_static_avail_amt);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.2.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_计算资产账户资金可用出现错误！',v_mysql_message);
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
    SET p_comm_avail_amt = v_comm_avail_amt;
    SET p_trade_avail_amt = v_trade_avail_amt;
    SET p_static_avail_amt = v_static_avail_amt;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_账户_计算交易组持仓可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuac_CalcExgpPosiAvail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuac_CalcExgpPosiAvail(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易期货_账户_计算交易组持仓可用】*/
    call db_tdfutu.pra_tdfuac_CalcExgpPosiAvail(
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
        v_lngsht_type,
        v_contrc_dir,
        v_hedge_type,
        v_futu_acco_no,
        v_contrc_code_no,
        v_exgp_avail_qty,
        v_error_code,
        v_error_info,
        v_comm_avail_qty,
        v_trade_avail_qty,
        v_static_avail_qty);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.2.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_计算交易组持仓可用出现错误！',v_mysql_message);
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
    SET p_comm_avail_qty = v_comm_avail_qty;
    SET p_trade_avail_qty = v_trade_avail_qty;
    SET p_static_avail_qty = v_static_avail_qty;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_账户_计算资产账户持仓可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuac_CalcAsacPosiAvail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuac_CalcAsacPosiAvail(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易期货_账户_计算资产账户持仓可用】*/
    call db_tdfutu.pra_tdfuac_CalcAsacPosiAvail(
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
        v_lngsht_type,
        v_contrc_dir,
        v_hedge_type,
        v_futu_acco_no,
        v_contrc_code_no,
        v_asac_avail_qty,
        v_error_code,
        v_error_info,
        v_comm_avail_qty,
        v_trade_avail_qty,
        v_static_avail_qty);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.2.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_计算资产账户持仓可用出现错误！',v_mysql_message);
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
    SET p_comm_avail_qty = v_comm_avail_qty;
    SET p_trade_avail_qty = v_trade_avail_qty;
    SET p_static_avail_qty = v_static_avail_qty;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_账户_查询交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuac_QueryExgpCash;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuac_QueryExgpCash(
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
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易期货_账户_查询交易组资金】*/
    call db_tdfutu.pra_tdfuac_QueryExgpCash(
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
        v_exch_crncy_type,
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.2.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_查询交易组资金出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_账户_查询资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuac_QueryAsacCash;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuac_QueryAsacCash(
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
    

    /* [事务开始] */
    START TRANSACTION;


    /* if @操作员编号# = 99990001 then */
    if v_opor_no = 99990001 then

        /* set @机构编号# = 0; */
        set v_co_no = 0;

        /* set @产品编号权限串# = "; ;"; */
        set v_pd_no_rights_str = "; ;";
    end if;

    /* 调用【原子_交易期货_账户_查询资产账户资金】*/
    call db_tdfutu.pra_tdfuac_QueryAsacCash(
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
        v_exch_crncy_type,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.2.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_查询资产账户资金出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_账户_查询交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuac_QueryExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuac_QueryExgpPosi(
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
    

    /* [事务开始] */
    START TRANSACTION;


    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_交易期货_账户_查询交易组持仓】*/
    call db_tdfutu.pra_tdfuac_QueryExgpPosi(
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
        v_lngsht_type,
        v_hedge_type,
        v_futu_acco_no,
        v_contrc_code_no,
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.2.7.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_查询交易组持仓出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_账户_查询资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuac_QueryAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuac_QueryAsacPosi(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* if @操作员编号# = 99990001 then */
    if v_opor_no = 99990001 then

        /* set @机构编号# = 0; */
        set v_co_no = 0;

        /* set @产品编号权限串# = "; ;"; */
        set v_pd_no_rights_str = "; ;";
    end if;

    /* 调用【原子_交易期货_账户_查询资产账户持仓】*/
    call db_tdfutu.pra_tdfuac_QueryAsacPosi(
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
        v_exch_no_str,
        v_lngsht_type,
        v_hedge_type,
        v_futu_acco_no,
        v_contrc_code_no,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.2.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_查询资产账户持仓出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_账户_查询交易组持仓明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuac_QueryExgpPosiDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuac_QueryExgpPosiDetail(
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
    

    /* [事务开始] */
    START TRANSACTION;


    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_交易期货_账户_查询交易组持仓明细】*/
    call db_tdfutu.pra_tdfuac_QueryExgpPosiDetail(
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
        v_lngsht_type,
        v_hedge_type,
        v_futu_acco_no,
        v_contrc_code_no,
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.2.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_查询交易组持仓明细出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_账户_获取交易组资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuac_GetExgpAsacCash;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuac_GetExgpAsacCash(
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
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易期货_账户_获取交易组资产账户资金】*/
    call db_tdfutu.pra_tdfuac_GetExgpAsacCash(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_crncy_type,
        v_asset_acco_no,
        v_error_code,
        v_error_info,
        v_exgp_row_id,
        v_co_no,
        v_pd_no,
        v_exgp_begin_amt,
        v_exgp_curr_amt,
        v_exgp_frozen_amt,
        v_exgp_unfroz_amt,
        v_exgp_comm_frozen_amt,
        v_exgp_comm_unfroz_amt,
        v_exgp_comm_capt_amt,
        v_exgp_comm_releas_amt,
        v_exgp_trade_capt_amt,
        v_exgp_trade_releas_amt,
        v_exgp_strike_capt_amt,
        v_exgp_strike_releas_amt,
        v_exgp_capt_margin,
        v_exgp_trade_fee,
        v_exgp_strike_fee,
        v_exgp_close_pandl,
        v_exgp_marked_pandl,
        v_exgp_cash_update_times,
        v_asac_row_id,
        v_asac_begin_amt,
        v_asac_curr_amt,
        v_asac_frozen_amt,
        v_asac_unfroz_amt,
        v_asac_comm_frozen_amt,
        v_asac_comm_unfroz_amt,
        v_asac_comm_capt_amt,
        v_asac_comm_releas_amt,
        v_asac_trade_capt_amt,
        v_asac_trade_releas_amt,
        v_asac_strike_capt_amt,
        v_asac_strike_releas_amt,
        v_asac_capt_margin,
        v_asac_trade_fee,
        v_asac_strike_fee,
        v_asac_close_pandl,
        v_asac_marked_pandl,
        v_asac_cash_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.2.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_获取交易组资产账户资金出现错误！',v_mysql_message);
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

# 事务_交易期货_账户_获取交易组资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuac_GetExgpAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuac_GetExgpAsacPosi(
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
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易期货_账户_获取交易组资产账户持仓】*/
    call db_tdfutu.pra_tdfuac_GetExgpAsacPosi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_asset_acco_no,
        v_lngsht_type,
        v_hedge_type,
        v_futu_acco_no,
        v_contrc_code_no,
        v_error_code,
        v_error_info,
        v_exgp_row_id,
        v_co_no,
        v_pd_no,
        v_exch_crncy_type,
        v_contrc_type,
        v_contrc_unit,
        v_comb_code,
        v_exgp_frozen_qty,
        v_exgp_unfroz_qty,
        v_exgp_comm_releas_qty,
        v_exgp_trade_releas_qty,
        v_exgp_strike_releas_qty,
        v_exgp_old_comm_capt_qty,
        v_exgp_today_comm_capt_qty,
        v_exgp_old_trade_capt_qty,
        v_exgp_today_trade_capt_qty,
        v_exgp_pre_strike_capt_qty,
        v_exgp_today_strike_capt_qty,
        v_exgp_rece_margin,
        v_pre_settle_price,
        v_exgp_realize_pandl,
        v_exgp_open_amount,
        v_exgp_posi_update_times,
        v_asac_row_id,
        v_asac_frozen_qty,
        v_asac_unfroz_qty,
        v_asac_comm_releas_qty,
        v_asac_trade_releas_qty,
        v_asac_strike_releas_qty,
        v_asac_old_comm_capt_qty,
        v_asac_today_comm_capt_qty,
        v_asac_old_trade_capt_qty,
        v_asac_today_trade_capt_qty,
        v_asac_pre_strike_capt_qty,
        v_asac_today_strike_capt_qty,
        v_asac_rece_margin,
        v_asac_realize_pandl,
        v_asac_open_amount,
        v_asac_posi_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.2.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_获取交易组资产账户持仓出现错误！',v_mysql_message);
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

# 事务_交易期货_账户_获取交易组持仓明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuac_GetExgpPosiDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuac_GetExgpPosiDetail(
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
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易期货_账户_获取交易组持仓明细】*/
    call db_tdfutu.pra_tdfuac_GetExgpPosiDetail(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_detail_posi_id,
        v_error_code,
        v_error_info,
        v_open_posi_date,
        v_open_posi_time,
        v_open_posi_price,
        v_open_posi_qty,
        v_open_posi_fee,
        v_close_posi_fee,
        v_trade_capt_qty,
        v_strike_capt_qty,
        v_marked_sett_price,
        v_rece_margin,
        v_marked_pandl,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.2.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_获取交易组持仓明细出现错误！',v_mysql_message);
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

# 事务_交易期货_账户_获取保证金优惠信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuac_GetMarginInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuac_GetMarginInfo(
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
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易期货_账户_获取保证金优惠信息】*/
    call db_tdfutu.pra_tdfuac_GetMarginInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_comb_code,
        v_hedge_type,
        v_error_code,
        v_error_info,
        v_co_no,
        v_exch_crncy_type,
        v_exgp_long_order_margin,
        v_exgp_short_order_margin,
        v_exgp_long_strike_margin,
        v_exgp_short_strike_margin,
        v_exgp_long_hold_margin,
        v_exgp_short_hold_margin,
        v_exgp_trade_capt_amt,
        v_exgp_posi_capt_amt,
        v_exch_group_update_times,
        v_prod_long_order_margin,
        v_prod_short_order_margin,
        v_prod_long_strike_margin,
        v_prod_short_strike_margin,
        v_prod_long_hold_margin,
        v_prod_short_hold_margin,
        v_prod_trade_capt_amt,
        v_prod_posi_capt_amt,
        v_pd_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.2.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_获取保证金优惠信息出现错误！',v_mysql_message);
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

# 事务_交易期货_账户_计算资产账户持仓数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuac_CalcAsacPosiQty;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuac_CalcAsacPosiQty(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* 调用【原子_交易期货_账户_计算资产账户持仓数量】*/
    call db_tdfutu.pra_tdfuac_CalcAsacPosiQty(
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
        v_futu_acco_no,
        v_contrc_code_no,
        v_lngsht_type,
        v_hedge_type,
        v_last_price,
        v_error_code,
        v_error_info,
        v_posi_qty,
        v_marked_pandl,
        v_pre_strike_capt_qty,
        v_rece_margin);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.2.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_计算资产账户持仓数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

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

# 事务_交易期货_账户_计算交易组持仓数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuac_CalcExgpPosiQty;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuac_CalcExgpPosiQty(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* 调用【原子_交易期货_账户_计算交易组持仓数量】*/
    call db_tdfutu.pra_tdfuac_CalcExgpPosiQty(
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
        v_futu_acco_no,
        v_contrc_code_no,
        v_lngsht_type,
        v_hedge_type,
        v_last_price,
        v_error_code,
        v_error_info,
        v_posi_qty,
        v_marked_pandl,
        v_pre_strike_capt_qty,
        v_rece_margin);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.2.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_计算交易组持仓数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

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

# 事务_交易期货_账户_计算资产账户资金可用同步产品库
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuac_CalcAsacCashAvailToPd;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuac_CalcAsacCashAvailToPd(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    
    #set @本币币种# = @交易币种#;

    /* 调用【原子_交易期货_账户_计算资产账户资金可用同步产品库】*/
    call db_tdfutu.pra_tdfuac_CalcAsacCashAvailToPd(
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
        v_error_code,
        v_error_info,
        v_avail_amt,
        v_margin_amt,
        v_capit_bala);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.2.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_计算资产账户资金可用同步产品库出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
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

# 事务_交易期货_账户_计算交易组资金可用同步产品库
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuac_CalcExgpCashAvailToPd;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuac_CalcExgpCashAvailToPd(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    
    #set @本币币种# = @交易币种#;

    /* 调用【原子_交易期货_账户_计算交易组资金可用同步产品库】*/
    call db_tdfutu.pra_tdfuac_CalcExgpCashAvailToPd(
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
        v_error_code,
        v_error_info,
        v_avail_amt,
        v_margin_amt,
        v_capit_bala);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.2.23.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_计算交易组资金可用同步产品库出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
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

# 事务_交易期货_账户_查询历史交易组业务资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuac_QueryExgpCashHis;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuac_QueryExgpCashHis(
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
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易期货_账户_查询历史交易组业务资金】*/
    call db_tdfutu.pra_tdfuac_QueryExgpCashHis(
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
        v_exch_crncy_type,
        v_row_id,
        v_row_count,
        v_begin_date,
        v_end_date,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.2.24.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_查询历史交易组业务资金出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_账户_新增保证金优惠信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_funca_tdfuac_AddMargin;;
DELIMITER ;;
CREATE PROCEDURE prt_funca_tdfuac_AddMargin(
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_exch_no = p_exch_no;
    SET v_comb_code = p_comb_code;
    SET v_hedge_type = p_hedge_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易期货_账户_新增保证金优惠信息】*/
    call db_tdfutu.pra_tdfuac_AddMargin(
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
        v_comb_code,
        v_hedge_type,
        v_error_code,
        v_error_info,
        v_row_id);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.2.49.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_新增保证金优惠信息出现错误！',v_mysql_message);
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


