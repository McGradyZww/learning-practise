DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_计算交易组资金可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_CalcExgpCashAvail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_CalcExgpCashAvail(
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
    IN p_capit_reback_days int,
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
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
    declare v_capit_reback_days int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_avail_amt decimal(18,4);
    declare v_trade_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_shsz_comm_avail_amt decimal(18,4);
    declare v_hk_comm_avail_amt decimal(18,4);
    declare v_shsz_trade_avail_amt decimal(18,4);
    declare v_hk_trade_avail_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_avail_amt = 0;
    SET v_trade_avail_amt = 0;
    SET v_static_avail_amt = 0;
    SET v_crncy_type = "CNY";
    SET v_shsz_comm_avail_amt = 0;
    SET v_hk_comm_avail_amt = 0;
    SET v_shsz_trade_avail_amt = 0;
    SET v_hk_trade_avail_amt = 0;

    
    label_pro:BEGIN
    

    /* set @本币币种# = @交易币种#; */
    set v_crncy_type = v_exch_crncy_type;

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
        SET v_error_code = "tdsecuT.2.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组资金可用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_avail_amt = v_comm_avail_amt;
    SET p_trade_avail_amt = v_trade_avail_amt;
    SET p_static_avail_amt = v_static_avail_amt;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_计算资产账户资金可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_CalcAsacCashAvail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_CalcAsacCashAvail(
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
    IN p_capit_reback_days int,
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
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
    declare v_capit_reback_days int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_avail_amt decimal(18,4);
    declare v_trade_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_shsz_comm_avail_amt decimal(18,4);
    declare v_hk_comm_avail_amt decimal(18,4);
    declare v_shsz_trade_avail_amt decimal(18,4);
    declare v_hk_trade_avail_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_avail_amt = 0;
    SET v_trade_avail_amt = 0;
    SET v_static_avail_amt = 0;
    SET v_crncy_type = "CNY";
    SET v_shsz_comm_avail_amt = 0;
    SET v_hk_comm_avail_amt = 0;
    SET v_shsz_trade_avail_amt = 0;
    SET v_hk_trade_avail_amt = 0;

    
    label_pro:BEGIN
    

    /* set @本币币种# = @交易币种#; */
    set v_crncy_type = v_exch_crncy_type;

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
        SET v_error_code = "tdsecuT.2.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户资金可用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_avail_amt = v_comm_avail_amt;
    SET p_trade_avail_amt = v_trade_avail_amt;
    SET p_static_avail_amt = v_static_avail_amt;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_计算交易组持仓可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_CalcExgpPosiAvail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_CalcExgpPosiAvail(
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
    IN p_posi_reback_days int,
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_posi_reback_days int;
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_avail_qty = 0;
    SET v_trade_avail_qty = 0;
    SET v_static_avail_qty = 0;

    
    label_pro:BEGIN
    

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
        SET v_error_code = "tdsecuT.2.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组持仓可用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_avail_qty = v_comm_avail_qty;
    SET p_trade_avail_qty = v_trade_avail_qty;
    SET p_static_avail_qty = v_static_avail_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_计算资产账户持仓可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_CalcAsacPosiAvail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_CalcAsacPosiAvail(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_posi_reback_days int,
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_posi_reback_days int;
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_avail_qty = 0;
    SET v_trade_avail_qty = 0;
    SET v_static_avail_qty = 0;

    
    label_pro:BEGIN
    

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
        SET v_error_code = "tdsecuT.2.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户持仓可用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_avail_qty = v_comm_avail_qty;
    SET p_trade_avail_qty = v_trade_avail_qty;
    SET p_static_avail_qty = v_static_avail_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_查询交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryExgpCash;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryExgpCash(
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
    

    /* 调用【原子_交易证券_账户_查询交易组资金】*/
    call db_tdsecu.pra_tdseac_QueryExgpCash(
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
        SET v_error_code = "tdsecuT.2.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询交易组资金出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryAsacCash;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryAsacCash(
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
    

    /* if @操作员机构编号# = 9999 then */
    if v_opor_co_no = 9999 then

        /* set @产品编号权限串# = ' '; */
        set v_pd_no_rights_str = ' ';
    end if;

    /* 调用【原子_交易证券_账户_查询资产账户资金】*/
    call db_tdsecu.pra_tdseac_QueryAsacCash(
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
        SET v_error_code = "tdsecuT.2.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询资产账户资金出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryExgpPosi(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no_str varchar(4096),
    IN p_stock_type_str varchar(2048),
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
    declare v_stock_acco_no int;
    declare v_stock_code_no_str varchar(4096);
    declare v_stock_type_str varchar(2048);
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* [变量补分隔符][@证券代码编号串#] */
    set v_stock_code_no_str = concat(";", v_stock_code_no_str,";");


    /* [变量补分隔符][@证券类型串#] */
    set v_stock_type_str = concat(";", v_stock_type_str,";");


    /* 调用【原子_交易证券_账户_查询交易组持仓】*/
    call db_tdsecu.pra_tdseac_QueryExgpPosi(
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
        v_stock_acco_no,
        v_stock_code_no_str,
        v_stock_type_str,
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.7.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询交易组持仓出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryAsacPosi(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no_str varchar(4096),
    IN p_pd_no_rights_str varchar(2048),
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
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no_str varchar(4096);
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* [变量补分隔符][@证券代码编号串#] */
    set v_stock_code_no_str = concat(";", v_stock_code_no_str,";");


    /* if @操作员编号# = 99990001 then */
    if v_opor_no = 99990001 then

        /* set @机构编号# = 0; */
        set v_co_no = 0;

        /* set @产品编号权限串# = ' '; */
        set v_pd_no_rights_str = ' ';
    end if;

    /* 调用【原子_交易证券_账户_查询资产账户持仓】*/
    call db_tdsecu.pra_tdseac_QueryAsacPosi(
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
        v_stock_acco_no,
        v_stock_code_no_str,
        v_pd_no_rights_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询资产账户持仓出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_更新指令资金持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_UpdateApprCashPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_UpdateApprCashPosi(
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
    IN p_comm_id bigint,
    IN p_comm_dir int,
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_asset_type int,
    IN p_stock_type int,
    IN p_impawn_ratio decimal(18,12),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_trade_code_no int,
    IN p_target_code_no int,
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
    declare v_comm_id bigint;
    declare v_comm_dir int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_is_record_jour int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_combo_code varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_comm_id = p_comm_id;
    SET v_comm_dir = p_comm_dir;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_asset_type = p_asset_type;
    SET v_stock_type = p_stock_type;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_comm_occur_amt = p_comm_occur_amt;
    SET v_comm_occur_qty = p_comm_occur_qty;
    SET v_is_record_jour = p_is_record_jour;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_combo_code = " ";

    
    label_pro:BEGIN
    

    /* set @组合代码# = " "; */
    set v_combo_code = " ";

    /* 调用【原子_交易证券_账户_更新指令资金持仓】*/
    call db_tdsecu.pra_tdseac_UpdateApprCashPosi(
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
        v_comm_id,
        v_comm_dir,
        v_exch_crncy_type,
        v_exch_no,
        v_stock_code,
        v_asset_type,
        v_stock_type,
        v_impawn_ratio,
        v_stock_acco_no,
        v_stock_code_no,
        v_trade_code_no,
        v_target_code_no,
        v_comm_occur_amt,
        v_comm_occur_qty,
        v_is_record_jour,
        v_combo_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令资金持仓出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_更新交易资金持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_UpdateExchCashPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_UpdateExchCashPosi(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_comm_id bigint,
    IN p_trade_capt_amt decimal(18,4),
    IN p_trade_capt_qty decimal(18,2),
    IN p_trade_releas_amt decimal(18,4),
    IN p_trade_releas_qty decimal(18,2),
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_id bigint;
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_capt_qty decimal(18,2);
    declare v_trade_releas_amt decimal(18,4);
    declare v_trade_releas_qty decimal(18,2);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_comm_id = p_comm_id;
    SET v_trade_capt_amt = p_trade_capt_amt;
    SET v_trade_capt_qty = p_trade_capt_qty;
    SET v_trade_releas_amt = p_trade_releas_amt;
    SET v_trade_releas_qty = p_trade_releas_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_更新交易资金持仓】*/
    call db_tdsecu.pra_tdseac_UpdateExchCashPosi(
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
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_comm_id,
        v_trade_capt_amt,
        v_trade_capt_qty,
        v_trade_releas_amt,
        v_trade_releas_qty,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新交易资金持仓出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询交易组债券质押
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryExgpBondImpawn;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryExgpBondImpawn(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询交易组债券质押】*/
    call db_tdsecu.pra_tdseac_QueryExgpBondImpawn(
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
        v_stock_acco_no,
        v_stock_code_no,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.33.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询交易组债券质押出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询资产账户债券质押
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryAsacBondImpawn;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryAsacBondImpawn(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询资产账户债券质押】*/
    call db_tdsecu.pra_tdseac_QueryAsacBondImpawn(
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
        v_stock_acco_no,
        v_stock_code_no,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.34.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询资产账户债券质押出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_获取债券质押信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_GetBondImpawnInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_GetBondImpawnInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    OUT p_begin_qty decimal(18,2),
    OUT p_curr_qty decimal(18,2),
    OUT p_put_impawn_qty decimal(18,2),
    OUT p_get_impawn_qty decimal(18,2),
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
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_put_impawn_qty decimal(18,2);
    declare v_get_impawn_qty decimal(18,2);
    declare v_target_code_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_put_impawn_qty = 0;
    SET v_get_impawn_qty = 0;
    SET v_target_code_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_获取债券质押信息】*/
    call db_tdsecu.pra_tdseac_GetBondImpawnInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_row_id,
        v_error_code,
        v_error_info,
        v_row_id,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_begin_qty,
        v_curr_qty,
        v_put_impawn_qty,
        v_get_impawn_qty,
        v_target_code_no);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.35.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_获取债券质押信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
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
    SET p_begin_qty = v_begin_qty;
    SET p_curr_qty = v_curr_qty;
    SET p_put_impawn_qty = v_put_impawn_qty;
    SET p_get_impawn_qty = v_get_impawn_qty;
    SET p_target_code_no = v_target_code_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_更新债券质押标准券数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_UpdateBondImpawnQty;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_UpdateBondImpawnQty(
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
    IN p_curr_qty decimal(18,2),
    IN p_impawn_ratio decimal(18,12),
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
    declare v_curr_qty decimal(18,2);
    declare v_impawn_ratio decimal(18,12);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_curr_qty = p_curr_qty;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @当前数量# = @当前数量# * @质押比例#; */
    set v_curr_qty = v_curr_qty * v_impawn_ratio;

    /* set @证券代码编号# = @标的代码编号#; */
    set v_stock_code_no = v_target_code_no;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_账户_更新债券质押标准券数量】*/
        call db_tdsecu.pra_tdseac_UpdateBondImpawnQty(
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
            v_curr_qty,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.2.36.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新债券质押标准券数量出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询交易组债券质押转回可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryExgpBondImpawnBackAvail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryExgpBondImpawnBackAvail(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询交易组债券质押转回可用】*/
    call db_tdsecu.pra_tdseac_QueryExgpBondImpawnBackAvail(
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
        v_stock_acco_no,
        v_stock_code_no,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.37.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询交易组债券质押转回可用出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_处理日初债券回购到期
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_DealInitBondRepo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_DealInitBondRepo(
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
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_账户_处理日初债券回购到期】*/
        call db_tdsecu.pra_tdseac_DealInitBondRepo(
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
            SET v_error_code = "tdsecuT.2.41.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_处理日初债券回购到期出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_债券回购处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_DealBondRepo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_DealBondRepo(
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
    IN p_exch_crncy_type varchar(3),
    IN p_exch_rate decimal(18,12),
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_order_price decimal(16,9),
    IN p_strike_date int,
    IN p_par_value decimal(16,9),
    IN p_intrst_days int,
    IN p_repo_back_date int,
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
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
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_strike_date int;
    declare v_par_value decimal(16,9);
    declare v_intrst_days int;
    declare v_repo_back_date int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_repo_trade_date int;
    declare v_repo_order_id bigint;
    declare v_repo_strike_id bigint;
    declare v_repo_qty decimal(18,2);
    declare v_repo_back_amt decimal(18,4);
    declare v_repo_amt decimal(18,4);
    declare v_repo_rate decimal(18,12);
    declare v_repo_days int;
    declare v_repo_cale_days int;
    declare v_repo_back_intrst decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_order_price = p_order_price;
    SET v_strike_date = p_strike_date;
    SET v_par_value = p_par_value;
    SET v_intrst_days = p_intrst_days;
    SET v_repo_back_date = p_repo_back_date;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_repo_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_repo_order_id = 0;
    SET v_repo_strike_id = 0;
    SET v_repo_qty = 0;
    SET v_repo_back_amt = 0;
    SET v_repo_amt = 0;
    SET v_repo_rate = 0;
    SET v_repo_days = 0;
    SET v_repo_cale_days = 0;
    SET v_repo_back_intrst = 0;

    
    label_pro:BEGIN
    

    /* set @回购交易日期# = @成交日期#; */
    set v_repo_trade_date = v_strike_date;

    /* set @回购委托序号# = 0; */
    set v_repo_order_id = 0;

    /* set @回购成交序号# = 0; */
    set v_repo_strike_id = 0;

    /* set @回购数量# = @订单数量#; */
    set v_repo_qty = v_order_qty;

    /* set @回购购回金额# = (@票面面值# * @订单数量#); */
    set v_repo_back_amt = (v_par_value * v_order_qty);

    /* set @回购金额# =@回购购回金额#; */
    set v_repo_amt =v_repo_back_amt;

    /* set @回购利率# = @订单价格#; */
    set v_repo_rate = v_order_price;

    /* set @回购交易日期# = @初始化日期#; */
    set v_repo_trade_date = v_init_date;

    /* set @回购天数# = @计息天数#; */
    set v_repo_days = v_intrst_days;

    /* set @回购实际天数# = @计息天数#; */
    set v_repo_cale_days = v_intrst_days;

    /* set @回购购回利息#=@回购金额#*@回购利率#*@计息天数#/36500; */
    set v_repo_back_intrst=v_repo_amt*v_repo_rate*v_intrst_days/36500;

    /* set @回购实际天数#=@计息天数#; */
    set v_repo_cale_days=v_intrst_days;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_账户_债券回购处理】*/
        call db_tdsecu.pra_tdseac_DealBondRepo(
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
            v_crncy_type,
            v_exch_crncy_type,
            v_exch_rate,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_type,
            v_asset_type,
            v_order_dir,
            v_repo_qty,
            v_repo_amt,
            v_repo_rate,
            v_repo_trade_date,
            v_repo_order_id,
            v_repo_strike_id,
            v_repo_days,
            v_repo_cale_days,
            v_repo_back_date,
            v_repo_back_amt,
            v_repo_back_intrst,
            v_trade_code_no,
            v_target_code_no,
            v_capit_reback_days,
            v_posi_reback_days,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.2.42.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_债券回购处理出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询交易组债券回购
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryExgpBondRepo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryExgpBondRepo(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_comm_id bigint,
    IN p_order_id bigint,
    IN p_strike_id bigint,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_comm_id bigint;
    declare v_order_id bigint;
    declare v_strike_id bigint;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_comm_id = p_comm_id;
    SET v_order_id = p_order_id;
    SET v_strike_id = p_strike_id;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询交易组债券回购】*/
    call db_tdsecu.pra_tdseac_QueryExgpBondRepo(
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
        v_stock_acco_no,
        v_stock_code_no,
        v_comm_id,
        v_order_id,
        v_strike_id,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.43.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询交易组债券回购出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_计算交易组持仓数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_CalcExgpPosiQty;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_CalcExgpPosiQty(
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_posi_qty decimal(18,2)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_posi_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_posi_qty = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_计算交易组持仓数量】*/
    call db_tdsecu.pra_tdseac_CalcExgpPosiQty(
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
        v_error_code,
        v_error_info,
        v_posi_qty);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.44.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组持仓数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_posi_qty = v_posi_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_计算资产账户持仓数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_CalcAsacPosiQty;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_CalcAsacPosiQty(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_posi_qty decimal(18,2)
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_posi_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_posi_qty = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_计算资产账户持仓数量】*/
    call db_tdsecu.pra_tdseac_CalcAsacPosiQty(
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
        v_error_code,
        v_error_info,
        v_posi_qty);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.45.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户持仓数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_posi_qty = v_posi_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_调整组合持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_AdustComboPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_AdustComboPosi(
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
    IN p_combo_posi_id bigint,
    IN p_occur_cost_amt decimal(18,4),
    IN p_occur_qty decimal(18,2),
    IN p_combo_code varchar(32),
    IN p_open_posi_date int,
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
    declare v_combo_posi_id bigint;
    declare v_occur_cost_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_combo_code varchar(32);
    declare v_open_posi_date int;
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
    SET v_combo_posi_id = p_combo_posi_id;
    SET v_occur_cost_amt = p_occur_cost_amt;
    SET v_occur_qty = p_occur_qty;
    SET v_combo_code = p_combo_code;
    SET v_open_posi_date = p_open_posi_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_账户_调整组合持仓】*/
        call db_tdsecu.pra_tdseac_AdustComboPosi(
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
            v_combo_posi_id,
            v_occur_cost_amt,
            v_occur_qty,
            v_combo_code,
            v_open_posi_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.2.46.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_调整组合持仓出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_更新组合市值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_UpdateComboMarketValue;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_UpdateComboMarketValue(
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
    IN p_combo_market_value decimal(18,4),
    IN p_open_posi_date int,
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
    declare v_combo_market_value decimal(18,4);
    declare v_open_posi_date int;
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
    SET v_combo_market_value = p_combo_market_value;
    SET v_open_posi_date = p_open_posi_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_账户_更新组合市值】*/
        call db_tdsecu.pra_tdseac_UpdateComboMarketValue(
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
            v_combo_market_value,
            v_open_posi_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.2.47.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新组合市值出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_检查组合失效
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_CheckComboInvalid;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_CheckComboInvalid(
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_combo_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_combo_status = "0";

    
    label_pro:BEGIN
    

    /* set @组合状态# = 《组合状态-有效》; */
    set v_combo_status = "1";

    /* [获取表记录变量语句][交易证券_账户_组合收益表][{组合状态}][@组合状态#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {交易组编号} = @交易组编号# and {组合代码} = @组合代码#] */
    select combo_status into v_combo_status from db_tdsecu.tb_tdseac_comboincome where co_no = v_co_no and pd_no = v_pd_no and exch_group_no = v_exch_group_no and combo_code = v_combo_code limit 1;


    /* [检查报错返回][@组合状态# = 《组合状态-失效》][775][@交易组编号#,@组合代码#,@组合状态#] */
    if v_combo_status = "2" then
        
        SET v_error_code = "tdsecuT.2.48.775";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code,",","组合状态=",v_combo_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code,",","组合状态=",v_combo_status);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_查询组合持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryComboPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryComboPosi(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询组合持仓】*/
    call db_tdsecu.pra_tdseac_QueryComboPosi(
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
        v_exch_no_str,
        v_stock_code_no,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.49.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询组合持仓出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询历史组合持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryHisComboPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryHisComboPosi(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询历史组合持仓】*/
    call db_tdsecu.pra_tdseac_QueryHisComboPosi(
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
        v_exch_no_str,
        v_stock_code_no,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_begin_date,
        v_end_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.50.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询历史组合持仓出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询组合收益
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryComboIncome;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryComboIncome(
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
    

    /* 调用【原子_交易证券_账户_查询组合收益】*/
    call db_tdsecu.pra_tdseac_QueryComboIncome(
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
        SET v_error_code = "tdsecuT.2.51.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询组合收益出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询历史组合收益
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryHisComboIncome;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryHisComboIncome(
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
    

    /* 调用【原子_交易证券_账户_查询历史组合收益】*/
    call db_tdsecu.pra_tdseac_QueryHisComboIncome(
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
        SET v_error_code = "tdsecuT.2.52.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询历史组合收益出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询单条组合持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QuerySingleComboPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QuerySingleComboPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_combo_posi_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_stock_acco_no int,
    OUT p_combo_code varchar(32),
    OUT p_stock_code varchar(6),
    OUT p_exch_no int,
    OUT p_stock_code_no int,
    OUT p_open_posi_date int,
    OUT p_curr_qty decimal(18,2),
    OUT p_posi_qty decimal(18,2),
    OUT p_frozen_qty decimal(18,2),
    OUT p_unfroz_qty decimal(18,2),
    OUT p_pre_settle_qty decimal(18,2),
    OUT p_trade_frozen_qty decimal(18,2),
    OUT p_trade_unfroz_qty decimal(18,2),
    OUT p_trade_capt_qty decimal(18,2),
    OUT p_trade_releas_qty decimal(18,2),
    OUT p_strike_capt_qty decimal(18,2),
    OUT p_strike_releas_qty decimal(18,2),
    OUT p_strike_frozen_qty decimal(18,2),
    OUT p_strike_unfroz_qty decimal(18,2),
    OUT p_realize_pandl decimal(18,4),
    OUT p_cost_amt decimal(18,4),
    OUT p_intrst_cost_amt decimal(18,4),
    OUT p_intrst_pandl decimal(18,4),
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
    declare v_combo_posi_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_combo_code varchar(32);
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_open_posi_date int;
    declare v_curr_qty decimal(18,2);
    declare v_posi_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_trade_unfroz_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_strike_frozen_qty decimal(18,2);
    declare v_strike_unfroz_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
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
    SET v_combo_posi_id = p_combo_posi_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_combo_code = " ";
    SET v_stock_code = " ";
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_curr_qty = 0;
    SET v_posi_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_trade_frozen_qty = 0;
    SET v_trade_unfroz_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_strike_frozen_qty = 0;
    SET v_strike_unfroz_qty = 0;
    SET v_realize_pandl = 0;
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询单条组合持仓】*/
    call db_tdsecu.pra_tdseac_QuerySingleComboPosi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_combo_posi_id,
        v_error_code,
        v_error_info,
        v_row_id,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_stock_acco_no,
        v_combo_code,
        v_stock_code,
        v_exch_no,
        v_stock_code_no,
        v_open_posi_date,
        v_curr_qty,
        v_posi_qty,
        v_frozen_qty,
        v_unfroz_qty,
        v_pre_settle_qty,
        v_trade_frozen_qty,
        v_trade_unfroz_qty,
        v_trade_capt_qty,
        v_trade_releas_qty,
        v_strike_capt_qty,
        v_strike_releas_qty,
        v_strike_frozen_qty,
        v_strike_unfroz_qty,
        v_realize_pandl,
        v_cost_amt,
        v_intrst_cost_amt,
        v_intrst_pandl,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.53.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询单条组合持仓出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
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
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_combo_code = v_combo_code;
    SET p_stock_code = v_stock_code;
    SET p_exch_no = v_exch_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_open_posi_date = v_open_posi_date;
    SET p_curr_qty = v_curr_qty;
    SET p_posi_qty = v_posi_qty;
    SET p_frozen_qty = v_frozen_qty;
    SET p_unfroz_qty = v_unfroz_qty;
    SET p_pre_settle_qty = v_pre_settle_qty;
    SET p_trade_frozen_qty = v_trade_frozen_qty;
    SET p_trade_unfroz_qty = v_trade_unfroz_qty;
    SET p_trade_capt_qty = v_trade_capt_qty;
    SET p_trade_releas_qty = v_trade_releas_qty;
    SET p_strike_capt_qty = v_strike_capt_qty;
    SET p_strike_releas_qty = v_strike_releas_qty;
    SET p_strike_frozen_qty = v_strike_frozen_qty;
    SET p_strike_unfroz_qty = v_strike_unfroz_qty;
    SET p_realize_pandl = v_realize_pandl;
    SET p_cost_amt = v_cost_amt;
    SET p_intrst_cost_amt = v_intrst_cost_amt;
    SET p_intrst_pandl = v_intrst_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_组合持仓划转
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_ComboPosiTransfer;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_ComboPosiTransfer(
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
    IN p_combo_posi_id bigint,
    IN p_source_date int,
    IN p_occur_cost_amt decimal(18,4),
    IN p_occur_qty decimal(18,2),
    IN p_target_combo_posi_id bigint,
    IN p_target_date int,
    IN p_combo_code varchar(32),
    IN p_target_combo_code varchar(32),
    IN p_target_exch_group_no int,
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
    declare v_combo_posi_id bigint;
    declare v_source_date int;
    declare v_occur_cost_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_target_combo_posi_id bigint;
    declare v_target_date int;
    declare v_combo_code varchar(32);
    declare v_target_combo_code varchar(32);
    declare v_target_exch_group_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_status_update_date int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_open_posi_date int;
    declare v_init_date int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_stock_code varchar(6);
    declare v_posi_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_trade_unfroz_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_strike_frozen_qty decimal(18,2);
    declare v_strike_unfroz_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_posi_status varchar(2);
    declare v_comm_batch_no int;
    declare v_combo_copies decimal(18,2);
    declare v_combo_status varchar(2);
    declare v_combo_cost decimal(18,4);
    declare v_combo_market_value decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
    declare v_tmp_combo_posi_id bigint;
    declare v_tmp_combo_code varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_combo_posi_id = p_combo_posi_id;
    SET v_source_date = p_source_date;
    SET v_occur_cost_amt = p_occur_cost_amt;
    SET v_occur_qty = p_occur_qty;
    SET v_target_combo_posi_id = p_target_combo_posi_id;
    SET v_target_date = p_target_date;
    SET v_combo_code = p_combo_code;
    SET v_target_combo_code = p_target_combo_code;
    SET v_target_exch_group_no = p_target_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_status_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_stock_code = " ";
    SET v_posi_qty = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_trade_frozen_qty = 0;
    SET v_trade_unfroz_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_strike_frozen_qty = 0;
    SET v_strike_unfroz_qty = 0;
    SET v_realize_pandl = 0;
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_posi_status = "0";
    SET v_comm_batch_no = 0;
    SET v_combo_copies = 0;
    SET v_combo_status = "0";
    SET v_combo_cost = 0;
    SET v_combo_market_value = 0;
    SET v_sum_realize_pandl = 0;
    SET v_tmp_combo_posi_id = 0;
    SET v_tmp_combo_code = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* [获取机器日期][@状态更新日期#] */
        select date_format(curdate(),'%Y%m%d') into v_status_update_date;

        #1-持仓合并

        /* if @目标交易组编号# = @交易组编号# and @目标组合持仓序号# <> 0 then */
        if v_target_exch_group_no = v_exch_group_no and v_target_combo_posi_id <> 0 then

            /* [更新表记录][交易证券_账户_组合持仓表][{成本金额} = {成本金额} + @变动成本金额#,{持仓数量} = {持仓数量} +@变动数量#,{当前数量} = {当前数量} +@变动数量#][{记录序号} = @目标组合持仓序号#][2][@目标组合持仓序号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdseac_comboposi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cost_amt = cost_amt + v_occur_cost_amt,posi_qty = posi_qty +v_occur_qty,curr_qty = curr_qty +v_occur_qty where row_id = v_target_combo_posi_id;
            if v_error_code = "1" then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.2.54.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("目标组合持仓序号=",v_target_combo_posi_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("目标组合持仓序号=",v_target_combo_posi_id);
                end if;
                leave label_pro;
            end if;


            /* [更新表记录][交易证券_账户_组合持仓表][{成本金额} = {成本金额} - @变动成本金额#,{持仓数量} = {持仓数量} -@变动数量#,{当前数量} = {当前数量} - @变动数量#][{记录序号} = @组合持仓序号#][2][@目标组合持仓序号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdseac_comboposi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cost_amt = cost_amt - v_occur_cost_amt,posi_qty = posi_qty -v_occur_qty,curr_qty = curr_qty - v_occur_qty where row_id = v_combo_posi_id;
            if v_error_code = "1" then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.2.54.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("目标组合持仓序号=",v_target_combo_posi_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("目标组合持仓序号=",v_target_combo_posi_id);
                end if;
                leave label_pro;
            end if;


            /* [更新表记录][交易证券_账户_组合收益表][{组合成本} = {组合成本} + @变动成本金额#][{机构编号} = @机构编号# and {产品编号}=@产品编号# and {交易组编号} = @交易组编号# and {组合代码} = @目标组合代码# and {开仓日期} =@目标日期#][2][@交易组编号#,@组合代码#,@目标日期#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdseac_comboincome set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, combo_cost = combo_cost + v_occur_cost_amt where co_no = v_co_no and pd_no=v_pd_no and exch_group_no = v_exch_group_no and combo_code = v_target_combo_code and open_posi_date =v_target_date;
            if v_error_code = "1" then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.2.54.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code,",","目标日期=",v_target_date),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code,",","目标日期=",v_target_date);
                end if;
                leave label_pro;
            end if;


            /* [更新表记录][交易证券_账户_组合收益表][{组合成本} = {组合成本} - @变动成本金额#][{机构编号} = @机构编号# and {产品编号}=@产品编号# and {交易组编号} = @交易组编号# and {组合代码} = @组合代码# and {开仓日期} =@源日期#][2][@交易组编号#,@组合代码#,@开仓日期#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdseac_comboincome set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, combo_cost = combo_cost - v_occur_cost_amt where co_no = v_co_no and pd_no=v_pd_no and exch_group_no = v_exch_group_no and combo_code = v_combo_code and open_posi_date =v_source_date;
            if v_error_code = "1" then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.2.54.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code,",","开仓日期=",v_open_posi_date),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code,",","开仓日期=",v_open_posi_date);
                end if;
                leave label_pro;
            end if;


            /* [更新表记录][交易证券_账户_组合持仓汇总表][{成本金额} = {成本金额} + @变动成本金额#,{持仓数量} = {持仓数量} +@变动数量#,{当前数量} = {当前数量} + @变动数量#][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {组合代码} = @目标组合代码# and {证券代码编号} = @证券代码编号#  and {初始化日期} = @初始化日期#][2][@交易组编号#,@资产账户编号#,@股东代码编号#,@目标组合代码#,@证券代码编号#,@初始化日期#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdseac_comboposisum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cost_amt = cost_amt + v_occur_cost_amt,posi_qty = posi_qty +v_occur_qty,curr_qty = curr_qty + v_occur_qty where exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and combo_code = v_target_combo_code and stock_code_no = v_stock_code_no  and init_date = v_init_date;
            if v_error_code = "1" then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.2.54.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","目标组合代码=",v_target_combo_code,",","证券代码编号=",v_stock_code_no,",","初始化日期=",v_init_date),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","目标组合代码=",v_target_combo_code,",","证券代码编号=",v_stock_code_no,",","初始化日期=",v_init_date);
                end if;
                leave label_pro;
            end if;


            /* [更新表记录][交易证券_账户_组合持仓汇总表][{成本金额} = {成本金额} - @变动成本金额#,{持仓数量} = {持仓数量} -@变动数量#,{当前数量} = {当前数量} - @变动数量#][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {组合代码} = @组合代码# and {证券代码编号} = @证券代码编号#  and {初始化日期} = @初始化日期#][2][@交易组编号#,@资产账户编号#,@股东代码编号#,@组合代码#,@证券代码编号#,@初始化日期#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdseac_comboposisum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cost_amt = cost_amt - v_occur_cost_amt,posi_qty = posi_qty -v_occur_qty,curr_qty = curr_qty - v_occur_qty where exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and combo_code = v_combo_code and stock_code_no = v_stock_code_no  and init_date = v_init_date;
            if v_error_code = "1" then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.2.54.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","组合代码=",v_combo_code,",","证券代码编号=",v_stock_code_no,",","初始化日期=",v_init_date),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","组合代码=",v_combo_code,",","证券代码编号=",v_stock_code_no,",","初始化日期=",v_init_date);
                end if;
                leave label_pro;
            end if;


            /* [更新表记录][交易证券_账户_组合收益汇总表][{组合成本} = {组合成本} + @变动成本金额#][{机构编号} = @机构编号# and {产品编号}=@产品编号# and {交易组编号} = @交易组编号# and {组合代码} = @目标组合代码#][2][@交易组编号#,@目标组合代码#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdseac_comboincomesum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, combo_cost = combo_cost + v_occur_cost_amt where co_no = v_co_no and pd_no=v_pd_no and exch_group_no = v_exch_group_no and combo_code = v_target_combo_code;
            if v_error_code = "1" then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.2.54.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","目标组合代码=",v_target_combo_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","目标组合代码=",v_target_combo_code);
                end if;
                leave label_pro;
            end if;


            /* [更新表记录][交易证券_账户_组合收益汇总表][{组合成本} = {组合成本} - @变动成本金额#][{机构编号} = @机构编号# and {产品编号}=@产品编号# and {交易组编号} = @交易组编号# and {组合代码} = @组合代码#][2][@交易组编号#,@组合代码#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdseac_comboincomesum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, combo_cost = combo_cost - v_occur_cost_amt where co_no = v_co_no and pd_no=v_pd_no and exch_group_no = v_exch_group_no and combo_code = v_combo_code;
            if v_error_code = "1" then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.2.54.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code);
                end if;
                leave label_pro;
            end if;

        #2-从交易组A转到B，B原先没有持仓，持仓记录增加一条

        /* elseif  @目标交易组编号# <> @交易组编号# and @目标组合持仓序号# = 0 then */
        elseif  v_target_exch_group_no <> v_exch_group_no and v_target_combo_posi_id = 0 then

            /* [更新表记录][交易证券_账户_组合持仓表][{成本金额} = {成本金额} - @变动成本金额#,{持仓数量} = {持仓数量} -@变动数量#,{当前数量} = {当前数量} - @变动数量#][{记录序号} = @组合持仓序号#][2][@目标组合持仓序号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdseac_comboposi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cost_amt = cost_amt - v_occur_cost_amt,posi_qty = posi_qty -v_occur_qty,curr_qty = curr_qty - v_occur_qty where row_id = v_combo_posi_id;
            if v_error_code = "1" then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.2.54.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("目标组合持仓序号=",v_target_combo_posi_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("目标组合持仓序号=",v_target_combo_posi_id);
                end if;
                leave label_pro;
            end if;


            /* [获取表记录变量][交易证券_账户_组合持仓表][字段][字段变量][{记录序号}=@组合持仓序号#][1][@组合持仓序号#] */
            select row_id, create_date, create_time, 
                update_date, update_time, update_times, init_date, 
                co_no, pd_no, exch_group_no, asset_acco_no, 
                stock_acco_no, combo_code, stock_code, exch_no, 
                stock_code_no, open_posi_date, posi_qty, curr_qty, 
                frozen_qty, unfroz_qty, pre_settle_qty, trade_frozen_qty, 
                trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_capt_qty, 
                strike_releas_qty, strike_frozen_qty, strike_unfroz_qty, realize_pandl, 
                cost_amt, intrst_cost_amt, intrst_pandl, posi_status into v_row_id, v_create_date, v_create_time, 
                v_update_date, v_update_time, v_update_times, v_init_date, 
                v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
                v_stock_acco_no, v_combo_code, v_stock_code, v_exch_no, 
                v_stock_code_no, v_open_posi_date, v_posi_qty, v_curr_qty, 
                v_frozen_qty, v_unfroz_qty, v_pre_settle_qty, v_trade_frozen_qty, 
                v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_capt_qty, 
                v_strike_releas_qty, v_strike_frozen_qty, v_strike_unfroz_qty, v_realize_pandl, 
                v_cost_amt, v_intrst_cost_amt, v_intrst_pandl, v_posi_status from db_tdsecu.tb_tdseac_comboposi where row_id=v_combo_posi_id limit 1;
            if FOUND_ROWS() = 0 then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.2.54.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("组合持仓序号=",v_combo_posi_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("组合持仓序号=",v_combo_posi_id);
                end if;
                leave label_pro;
            end if;


            /* [检查报错返回][@持仓数量# < 0][712][@持仓数量#] */
            if v_posi_qty < 0 then
                ROLLBACK;
                SET v_error_code = "tdsecuT.2.54.712";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("持仓数量=",v_posi_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("持仓数量=",v_posi_qty);
                end if;
                leave label_pro;
            end if;


            /* [更新表记录][交易证券_账户_组合持仓汇总表][{成本金额} = {成本金额} - @变动成本金额#,{持仓数量} = {持仓数量} -@变动数量#,{当前数量} = {当前数量} - @变动数量#][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {组合代码} = @组合代码# and {证券代码编号} = @证券代码编号#  and {初始化日期} = @初始化日期#][2][@交易组编号#,@资产账户编号#,@股东代码编号#,@组合代码#,@证券代码编号#,@初始化日期#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdseac_comboposisum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cost_amt = cost_amt - v_occur_cost_amt,posi_qty = posi_qty -v_occur_qty,curr_qty = curr_qty - v_occur_qty where exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and combo_code = v_combo_code and stock_code_no = v_stock_code_no  and init_date = v_init_date;
            if v_error_code = "1" then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.2.54.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","组合代码=",v_combo_code,",","证券代码编号=",v_stock_code_no,",","初始化日期=",v_init_date),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","组合代码=",v_combo_code,",","证券代码编号=",v_stock_code_no,",","初始化日期=",v_init_date);
                end if;
                leave label_pro;
            end if;


            /* [更新表记录][交易证券_账户_组合收益表][{组合成本} = {组合成本} - @变动成本金额#][{机构编号} = @机构编号# and {产品编号}=@产品编号# and {交易组编号} = @交易组编号# and {组合代码} = @组合代码# and {开仓日期} =@源日期#][2][@交易组编号#,@组合代码#,@开仓日期#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdseac_comboincome set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, combo_cost = combo_cost - v_occur_cost_amt where co_no = v_co_no and pd_no=v_pd_no and exch_group_no = v_exch_group_no and combo_code = v_combo_code and open_posi_date =v_source_date;
            if v_error_code = "1" then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.2.54.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code,",","开仓日期=",v_open_posi_date),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code,",","开仓日期=",v_open_posi_date);
                end if;
                leave label_pro;
            end if;


            /* [更新表记录][交易证券_账户_组合收益汇总表][{组合成本} = {组合成本} - @变动成本金额#][{机构编号} = @机构编号# and {产品编号}=@产品编号# and {交易组编号} = @交易组编号# and {组合代码} = @组合代码#][2][@交易组编号#,@组合代码#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdseac_comboincomesum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, combo_cost = combo_cost - v_occur_cost_amt where co_no = v_co_no and pd_no=v_pd_no and exch_group_no = v_exch_group_no and combo_code = v_combo_code;
            if v_error_code = "1" then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.2.54.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code);
                end if;
                leave label_pro;
            end if;


            /* set @成本金额# = @变动成本金额#; */
            set v_cost_amt = v_occur_cost_amt;

            /* set @持仓数量# = @变动数量#; */
            set v_posi_qty = v_occur_qty;

            /* set @交易组编号# = @目标交易组编号#; */
            set v_exch_group_no = v_target_exch_group_no;

            /* set @当前数量# = @变动数量#; */
            set v_curr_qty = v_occur_qty;

            /* set @冻结数量# = 0; */
            set v_frozen_qty = 0;

            /* set @解冻数量# = 0; */
            set v_unfroz_qty = 0;

            /* set @待交收数量# = 0; */
            set v_pre_settle_qty = 0;

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

            /* set @实现盈亏# = 0; */
            set v_realize_pandl = 0;

            /* set @利息成本金额# = 0; */
            set v_intrst_cost_amt = 0;

            /* set @利息收益# = 0; */
            set v_intrst_pandl = 0;

            /* [插入重复更新][交易证券_账户_组合持仓表][字段][字段变量][{成本金额} = {成本金额} + @变动成本金额#,{持仓数量} = {持仓数量} + @变动数量#,{当前数量} = {当前数量} +@变动数量#][1][@交易组编号#,@成本金额#,@持仓数量#] */
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
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, cost_amt = cost_amt + v_occur_cost_amt,posi_qty = posi_qty + v_occur_qty,curr_qty = curr_qty +v_occur_qty;
            if v_error_code = "1" then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.2.54.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","成本金额=",v_cost_amt,",","持仓数量=",v_posi_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","成本金额=",v_cost_amt,",","持仓数量=",v_posi_qty);
                end if;
                leave label_pro;
            end if;


            /* [插入重复更新][交易证券_账户_组合持仓汇总表][字段][字段变量][{成本金额} = {成本金额} + @变动成本金额#,{持仓数量} = {持仓数量} + @变动数量#,{当前数量} = {当前数量} +@变动数量#][1][@交易组编号#,@成本金额#,@持仓数量#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_tdsecu.tb_tdseac_comboposisum (
                create_date, create_time, update_date, 
                update_time, update_times, init_date, co_no, 
                pd_no, exch_group_no, asset_acco_no, stock_acco_no, 
                combo_code, stock_code, exch_no, stock_code_no, 
                posi_qty, curr_qty, frozen_qty, unfroz_qty, 
                pre_settle_qty, trade_frozen_qty, trade_unfroz_qty, trade_capt_qty, 
                trade_releas_qty, strike_capt_qty, strike_releas_qty, strike_frozen_qty, 
                strike_unfroz_qty, realize_pandl, cost_amt, intrst_cost_amt, 
                intrst_pandl, posi_status) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_init_date, v_co_no, 
                v_pd_no, v_exch_group_no, v_asset_acco_no, v_stock_acco_no, 
                v_combo_code, v_stock_code, v_exch_no, v_stock_code_no, 
                v_posi_qty, v_curr_qty, v_frozen_qty, v_unfroz_qty, 
                v_pre_settle_qty, v_trade_frozen_qty, v_trade_unfroz_qty, v_trade_capt_qty, 
                v_trade_releas_qty, v_strike_capt_qty, v_strike_releas_qty, v_strike_frozen_qty, 
                v_strike_unfroz_qty, v_realize_pandl, v_cost_amt, v_intrst_cost_amt, 
                v_intrst_pandl, v_posi_status) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, cost_amt = cost_amt + v_occur_cost_amt,posi_qty = posi_qty + v_occur_qty,curr_qty = curr_qty +v_occur_qty;
            if v_error_code = "1" then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.2.54.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","成本金额=",v_cost_amt,",","持仓数量=",v_posi_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","成本金额=",v_cost_amt,",","持仓数量=",v_posi_qty);
                end if;
                leave label_pro;
            end if;


            /* set @指令批号# = 0; */
            set v_comm_batch_no = 0;

            /* set @组合份数# = 0; */
            set v_combo_copies = 0;

            /* set @组合状态# = 《组合状态-有效》; */
            set v_combo_status = "1";

            /* set @组合成本# = @变动成本金额#; */
            set v_combo_cost = v_occur_cost_amt;

            /* set @组合市值# = 0; */
            set v_combo_market_value = 0;

            /* set @累计实现盈亏# = 0; */
            set v_sum_realize_pandl = 0;

            /* [插入重复更新][交易证券_账户_组合收益表][字段][字段变量][{组合成本} = {组合成本} + @变动成本金额#][1][@交易组编号#,@组合代码#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_tdsecu.tb_tdseac_comboincome (
                create_date, create_time, update_date, 
                update_time, update_times, init_date, co_no, 
                pd_no, exch_group_no, open_posi_date, comm_batch_no, 
                combo_code, combo_copies, combo_status, combo_cost, 
                combo_market_value, realize_pandl, sum_realize_pandl, status_update_date) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_init_date, v_co_no, 
                v_pd_no, v_exch_group_no, v_open_posi_date, v_comm_batch_no, 
                v_combo_code, v_combo_copies, v_combo_status, v_combo_cost, 
                v_combo_market_value, v_realize_pandl, v_sum_realize_pandl, v_status_update_date) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, combo_cost = combo_cost + v_occur_cost_amt;
            if v_error_code = "1" then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.2.54.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code);
                end if;
                leave label_pro;
            end if;


            /* [插入重复更新][交易证券_账户_组合收益汇总表][字段][字段变量][{组合成本} = {组合成本} + @变动成本金额#][1][@交易组编号#,@组合代码#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_tdsecu.tb_tdseac_comboincomesum (
                create_date, create_time, update_date, 
                update_time, update_times, init_date, co_no, 
                pd_no, exch_group_no, comm_batch_no, combo_code, 
                combo_copies, combo_status, combo_cost, combo_market_value, 
                realize_pandl, sum_realize_pandl, status_update_date) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_init_date, v_co_no, 
                v_pd_no, v_exch_group_no, v_comm_batch_no, v_combo_code, 
                v_combo_copies, v_combo_status, v_combo_cost, v_combo_market_value, 
                v_realize_pandl, v_sum_realize_pandl, v_status_update_date) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, combo_cost = combo_cost + v_occur_cost_amt;
            if v_error_code = "1" then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.2.54.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code);
                end if;
                leave label_pro;
            end if;

        else

            /* set @临时_组合持仓序号# = @组合持仓序号#; */
            set v_tmp_combo_posi_id = v_combo_posi_id;

            /* set @临时_组合代码# = @组合代码#; */
            set v_tmp_combo_code = v_combo_code;

            /* set @组合持仓序号# = @目标组合持仓序号#; */
            set v_combo_posi_id = v_target_combo_posi_id;

            /* set @开仓日期# = @目标日期#; */
            set v_open_posi_date = v_target_date;

            /* 调用【原子_交易证券_账户_调整组合持仓】*/
            call db_tdsecu.pra_tdseac_AdustComboPosi(
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
                v_combo_posi_id,
                v_occur_cost_amt,
                v_occur_qty,
                v_combo_code,
                v_open_posi_date,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.2.54.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_调整组合持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @变动成本金额# = - @变动成本金额#; */
            set v_occur_cost_amt = - v_occur_cost_amt;

            /* set @变动数量# = - @变动数量#; */
            set v_occur_qty = - v_occur_qty;

            /* set @组合持仓序号# = @临时_组合持仓序号#; */
            set v_combo_posi_id = v_tmp_combo_posi_id;

            /* set @开仓日期# = @源日期#; */
            set v_open_posi_date = v_source_date;

            /* set @组合代码# = @目标组合代码#; */
            set v_combo_code = v_target_combo_code;

            /* 调用【原子_交易证券_账户_调整组合持仓】*/
            call db_tdsecu.pra_tdseac_AdustComboPosi(
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
                v_combo_posi_id,
                v_occur_cost_amt,
                v_occur_qty,
                v_combo_code,
                v_open_posi_date,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.2.54.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_调整组合持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

        /* 调用【原子_交易证券_账户_新增组合持仓划转流水】*/
        call db_tdsecu.pra_tdseac_AddComboPosiTransferLog(
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
            v_stock_acco_no,
            v_combo_code,
            v_stock_code,
            v_exch_no,
            v_stock_code_no,
            v_combo_posi_id,
            v_source_date,
            v_occur_cost_amt,
            v_occur_qty,
            v_target_combo_posi_id,
            v_target_date,
            v_target_combo_code,
            v_target_exch_group_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.2.54.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_新增组合持仓划转流水出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_计算交易组资金可用同步产品库
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_CalcExgpCashAvailToPd;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_CalcExgpCashAvailToPd(
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
    IN p_capit_reback_days int,
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_shsz_avail_amt decimal(18,4),
    OUT p_hk_avail_amt decimal(18,4),
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
    declare v_capit_reback_days int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_shsz_avail_amt decimal(18,4);
    declare v_hk_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_shsz_avail_amt = 0;
    SET v_hk_avail_amt = 0;
    SET v_static_avail_amt = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* set @本币币种# = @交易币种#; */
    set v_crncy_type = v_exch_crncy_type;

    /* 调用【原子_交易证券_账户_计算交易组资金可用同步产品库】*/
    call db_tdsecu.pra_tdseac_CalcExgpCashAvailToPd(
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
        v_shsz_avail_amt,
        v_hk_avail_amt,
        v_static_avail_amt);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.55.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组资金可用同步产品库出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_shsz_avail_amt = v_shsz_avail_amt;
    SET p_hk_avail_amt = v_hk_avail_amt;
    SET p_static_avail_amt = v_static_avail_amt;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_计算资产账户资金可用同步产品库
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_CalcAsacCashAvailToPd;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_CalcAsacCashAvailToPd(
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
    IN p_capit_reback_days int,
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_shsz_avail_amt decimal(18,4),
    OUT p_hk_avail_amt decimal(18,4),
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
    declare v_capit_reback_days int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_shsz_avail_amt decimal(18,4);
    declare v_hk_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_shsz_avail_amt = 0;
    SET v_hk_avail_amt = 0;
    SET v_static_avail_amt = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* set @本币币种# = @交易币种#; */
    set v_crncy_type = v_exch_crncy_type;

    /* 调用【原子_交易证券_账户_计算资产账户资金可用同步产品库】*/
    call db_tdsecu.pra_tdseac_CalcAsacCashAvailToPd(
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
        v_shsz_avail_amt,
        v_hk_avail_amt,
        v_static_avail_amt);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.56.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户资金可用同步产品库出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_shsz_avail_amt = v_shsz_avail_amt;
    SET p_hk_avail_amt = v_hk_avail_amt;
    SET p_static_avail_amt = v_static_avail_amt;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_归档处理组合失效
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_BackDealComboInvalid;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_BackDealComboInvalid(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_comm_batch_no int,
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
    declare v_co_no int;
    declare v_comm_batch_no int;
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
    SET v_co_no = p_co_no;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_归档处理组合失效】*/
    call db_tdsecu.pra_tdseac_BackDealComboInvalid(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_comm_batch_no,
        v_init_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.57.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_归档处理组合失效出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询组合持仓汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryComboPosiSum;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryComboPosiSum(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询组合持仓汇总】*/
    call db_tdsecu.pra_tdseac_QueryComboPosiSum(
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
        v_exch_no_str,
        v_stock_code_no,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.58.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询组合持仓汇总出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询历史组合持仓汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryHisComboPosiSum;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryHisComboPosiSum(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询历史组合持仓汇总】*/
    call db_tdsecu.pra_tdseac_QueryHisComboPosiSum(
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
        v_exch_no_str,
        v_stock_code_no,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_begin_date,
        v_end_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.59.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询历史组合持仓汇总出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询组合收益汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryComboIncomeSum;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryComboIncomeSum(
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
    

    /* 调用【原子_交易证券_账户_查询组合收益汇总】*/
    call db_tdsecu.pra_tdseac_QueryComboIncomeSum(
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
        SET v_error_code = "tdsecuT.2.60.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询组合收益汇总出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询历史组合收益汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryHisComboIncomeSum;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryHisComboIncomeSum(
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
    

    /* 调用【原子_交易证券_账户_查询历史组合收益汇总】*/
    call db_tdsecu.pra_tdseac_QueryHisComboIncomeSum(
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
        SET v_error_code = "tdsecuT.2.61.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询历史组合收益汇总出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询N天期内可赎回数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryRedemptionQtyNDays;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryRedemptionQtyNDays(
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
    IN p_stock_code_no int,
    IN p_stat_days int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stat_qty decimal(18,2)
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
    declare v_stock_code_no int;
    declare v_stat_days int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stat_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_stat_days = p_stat_days;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stat_qty = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询N天期内可赎回数量】*/
    call db_tdsecu.pra_tdseac_QueryRedemptionQtyNDays(
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
        v_stock_code_no,
        v_stat_days,
        v_error_code,
        v_error_info,
        v_stat_qty);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.62.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询N天期内可赎回数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stat_qty = v_stat_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_N天期内赎回费率提示
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_NdaysRedeemRateTips;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_NdaysRedeemRateTips(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_combo_code varchar(32),
    IN p_stock_code_no int,
    IN p_stat_days int,
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_combo_code varchar(32);
    declare v_stock_code_no int;
    declare v_stat_days int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_open_posi_date int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_combo_code = p_combo_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stat_days = p_stat_days;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* select min({开仓日期}) into @开仓日期# from ~交易证券_账户_组合持仓表^  where {交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {组合代码} = @组合代码# and {证券代码编号} = @证券代码编号# and {持仓状态} = 《持仓状态-未平仓》; */
    select min(open_posi_date) into v_open_posi_date from db_tdsecu.tb_tdseac_comboposi  where exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and combo_code = v_combo_code and stock_code_no = v_stock_code_no and posi_status = "1";

    /* select date_format(CURDATE(),'%Y%m%d') into @初始化日期#; */
    select date_format(CURDATE(),'%Y%m%d') into v_init_date;

    /* [检查报错返回][(to_days(@初始化日期#) - to_days(@开仓日期#)) < @统计天数#][777][@初始化日期#, @开仓日期#,@统计天数#] */
    if (to_days(v_init_date) - to_days(v_open_posi_date)) < v_stat_days then
        
        SET v_error_code = "tdsecuT.2.63.777";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,","," 开仓日期=", v_open_posi_date,",","统计天数=",v_stat_days),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,","," 开仓日期=", v_open_posi_date,",","统计天数=",v_stat_days);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_核对可取金额差异
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_CheckDesirAmtDiff;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_CheckDesirAmtDiff(
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
    IN p_default_exch_group_no int,
    IN p_exgp_curr_amt decimal(18,4),
    IN p_exgp_frozen_amt decimal(18,4),
    IN p_exgp_unfroz_amt decimal(18,4),
    IN p_exgp_shsz_avail_change_amt decimal(18,4),
    IN p_exgp_amt_check_diff decimal(18,4),
    IN p_exgp_T_hk_buy_total_amt decimal(18,4),
    IN p_exgp_T_hk_sell_total_amt decimal(18,4),
    IN p_exgp_T1_hk_buy_total_amt decimal(18,4),
    IN p_exgp_T1_hk_sell_total_amt decimal(18,4),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
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
    declare v_default_exch_group_no int;
    declare v_exgp_curr_amt decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exgp_shsz_avail_change_amt decimal(18,4);
    declare v_exgp_amt_check_diff decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_exgp_curr_amt = p_exgp_curr_amt;
    SET v_exgp_frozen_amt = p_exgp_frozen_amt;
    SET v_exgp_unfroz_amt = p_exgp_unfroz_amt;
    SET v_exgp_shsz_avail_change_amt = p_exgp_shsz_avail_change_amt;
    SET v_exgp_amt_check_diff = p_exgp_amt_check_diff;
    SET v_exgp_T_hk_buy_total_amt = p_exgp_T_hk_buy_total_amt;
    SET v_exgp_T_hk_sell_total_amt = p_exgp_T_hk_sell_total_amt;
    SET v_exgp_T1_hk_buy_total_amt = p_exgp_T1_hk_buy_total_amt;
    SET v_exgp_T1_hk_sell_total_amt = p_exgp_T1_hk_sell_total_amt;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_账户_核对可取金额差异】*/
        call db_tdsecu.pra_tdseac_CheckDesirAmtDiff(
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
            v_default_exch_group_no,
            v_exgp_curr_amt,
            v_exgp_frozen_amt,
            v_exgp_unfroz_amt,
            v_exgp_shsz_avail_change_amt,
            v_exgp_amt_check_diff,
            v_exgp_T_hk_buy_total_amt,
            v_exgp_T_hk_sell_total_amt,
            v_exgp_T1_hk_buy_total_amt,
            v_exgp_T1_hk_sell_total_amt,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.2.64.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_核对可取金额差异出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_归档处理组合状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_BackDealComboStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_BackDealComboStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_comm_batch_no int,
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
    declare v_co_no int;
    declare v_comm_batch_no int;
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
    SET v_co_no = p_co_no;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易证券_账户_归档处理组合状态】*/
    call db_tdsecu.pra_tdseac_BackDealComboStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_comm_batch_no,
        v_init_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.65.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_归档处理组合状态出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_获取交易组持仓成本
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_GetExgpPosiCost;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_GetExgpPosiCost(
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trd_cost_amt decimal(18,4),
    OUT p_trd_intrst_cost_amt decimal(18,4)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trd_cost_amt decimal(18,4);
    declare v_trd_intrst_cost_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trd_cost_amt = 0;
    SET v_trd_intrst_cost_amt = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_获取交易组持仓成本】*/
    call db_tdsecu.pra_tdseac_GetExgpPosiCost(
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
        v_error_code,
        v_error_info,
        v_trd_cost_amt,
        v_trd_intrst_cost_amt);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.66.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_获取交易组持仓成本出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trd_cost_amt = v_trd_cost_amt;
    SET p_trd_intrst_cost_amt = v_trd_intrst_cost_amt;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_查询交易组融资融券保证金计算结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryExgpFinaLoanMarginCalcList;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryExgpFinaLoanMarginCalcList(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询交易组融资融券保证金计算结果集】*/
    call db_tdsecu.pra_tdseac_QueryExgpFinaLoanMarginCalcList(
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
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.67.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询交易组融资融券保证金计算结果集出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询资产账户融资融券保证金计算结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryAsacFinaLoanMarginCalcList;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryAsacFinaLoanMarginCalcList(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询资产账户融资融券保证金计算结果集】*/
    call db_tdsecu.pra_tdseac_QueryAsacFinaLoanMarginCalcList(
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
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.68.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询资产账户融资融券保证金计算结果集出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询交易组业务资金负债结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryExgpBusiCapitalDebtList;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryExgpBusiCapitalDebtList(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询交易组业务资金负债结果集】*/
    call db_tdsecu.pra_tdseac_QueryExgpBusiCapitalDebtList(
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
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.69.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询交易组业务资金负债结果集出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询资产账户业务资金负债结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryAsacBusiCapitalDebtList;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryAsacBusiCapitalDebtList(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询资产账户业务资金负债结果集】*/
    call db_tdsecu.pra_tdseac_QueryAsacBusiCapitalDebtList(
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
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.70.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询资产账户业务资金负债结果集出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询交易组业务持仓负债结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryExgpBusiPosiDebtList;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryExgpBusiPosiDebtList(
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
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_debt_type int,
    IN p_stock_code_no_str varchar(4096),
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
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_debt_type int;
    declare v_stock_code_no_str varchar(4096);
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_debt_type = p_debt_type;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询交易组业务持仓负债结果集】*/
    call db_tdsecu.pra_tdseac_QueryExgpBusiPosiDebtList(
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
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_debt_type,
        v_stock_code_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.71.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询交易组业务持仓负债结果集出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询资产账户业务持仓负债结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryAsacBusiPosiDebtList;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryAsacBusiPosiDebtList(
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
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
    IN p_debt_type int,
    IN p_stock_code_no_str varchar(4096),
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
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
    declare v_debt_type int;
    declare v_stock_code_no_str varchar(4096);
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_debt_type = p_debt_type;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询资产账户业务持仓负债结果集】*/
    call db_tdsecu.pra_tdseac_QueryAsacBusiPosiDebtList(
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
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_debt_type,
        v_stock_code_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.72.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询资产账户业务持仓负债结果集出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询交易组负债明细结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryExgpDebtJourList;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryExgpDebtJourList(
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
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_debt_type int,
    IN p_stock_code_no int,
    IN p_order_dir int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_debt_type int;
    declare v_stock_code_no int;
    declare v_order_dir int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_debt_type = p_debt_type;
    SET v_stock_code_no = p_stock_code_no;
    SET v_order_dir = p_order_dir;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询交易组负债明细结果集】*/
    call db_tdsecu.pra_tdseac_QueryExgpDebtJourList(
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
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_debt_type,
        v_stock_code_no,
        v_order_dir,
        v_exch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.73.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询交易组负债明细结果集出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询交易组业务资金负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryExgpBusiCapitalDebt;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryExgpBusiCapitalDebt(
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_debt_loan_sell_strike_amt decimal(18,4),
    OUT p_debt_strike_fee decimal(18,4),
    OUT p_loan_return_strike_amt decimal(18,4),
    OUT p_loan_return_order_amt decimal(18,4),
    OUT p_loan_return_comm_amt decimal(18,4),
    OUT p_return_strike_fee decimal(18,4),
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
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_debt_loan_sell_strike_amt decimal(18,4);
    declare v_debt_strike_fee decimal(18,4);
    declare v_loan_return_strike_amt decimal(18,4);
    declare v_loan_return_order_amt decimal(18,4);
    declare v_loan_return_comm_amt decimal(18,4);
    declare v_return_strike_fee decimal(18,4);
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_debt_loan_sell_strike_amt = 0;
    SET v_debt_strike_fee = 0;
    SET v_loan_return_strike_amt = 0;
    SET v_loan_return_order_amt = 0;
    SET v_loan_return_comm_amt = 0;
    SET v_return_strike_fee = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

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
        SET v_error_code = "tdsecuT.2.74.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询交易组业务资金负债出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_debt_loan_sell_strike_amt = v_debt_loan_sell_strike_amt;
    SET p_debt_strike_fee = v_debt_strike_fee;
    SET p_loan_return_strike_amt = v_loan_return_strike_amt;
    SET p_loan_return_order_amt = v_loan_return_order_amt;
    SET p_loan_return_comm_amt = v_loan_return_comm_amt;
    SET p_return_strike_fee = v_return_strike_fee;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_查询资产账户业务资金负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryAsacBusiCapitalDebt;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryAsacBusiCapitalDebt(
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_debt_loan_sell_strike_amt decimal(18,4),
    OUT p_debt_strike_fee decimal(18,4),
    OUT p_loan_return_strike_amt decimal(18,4),
    OUT p_loan_return_order_amt decimal(18,4),
    OUT p_loan_return_comm_amt decimal(18,4),
    OUT p_return_strike_fee decimal(18,4),
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
    declare v_asset_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_debt_loan_sell_strike_amt decimal(18,4);
    declare v_debt_strike_fee decimal(18,4);
    declare v_loan_return_strike_amt decimal(18,4);
    declare v_loan_return_order_amt decimal(18,4);
    declare v_loan_return_comm_amt decimal(18,4);
    declare v_return_strike_fee decimal(18,4);
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_debt_loan_sell_strike_amt = 0;
    SET v_debt_strike_fee = 0;
    SET v_loan_return_strike_amt = 0;
    SET v_loan_return_order_amt = 0;
    SET v_loan_return_comm_amt = 0;
    SET v_return_strike_fee = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

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
        SET v_error_code = "tdsecuT.2.75.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询资产账户业务资金负债出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_debt_loan_sell_strike_amt = v_debt_loan_sell_strike_amt;
    SET p_debt_strike_fee = v_debt_strike_fee;
    SET p_loan_return_strike_amt = v_loan_return_strike_amt;
    SET p_loan_return_order_amt = v_loan_return_order_amt;
    SET p_loan_return_comm_amt = v_loan_return_comm_amt;
    SET p_return_strike_fee = v_return_strike_fee;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_查询交易组业务持仓负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryExgpBusiPosiDebt;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryExgpBusiPosiDebt(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_debt_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_exch_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_invest_type int,
    OUT p_debt_fina_buy_strike_qty decimal(18,2),
    OUT p_fina_return_strike_qty decimal(18,2),
    OUT p_debt_loan_sell_strike_qty decimal(18,2),
    OUT p_loan_return_strike_qty decimal(18,2),
    OUT p_debt_fina_buy_order_qty decimal(18,2),
    OUT p_fina_return_order_qty decimal(18,2),
    OUT p_debt_loan_sell_order_qty decimal(18,2),
    OUT p_loan_return_order_qty decimal(18,2),
    OUT p_debt_fina_buy_comm_qty decimal(18,2),
    OUT p_fina_return_comm_qty decimal(18,2),
    OUT p_debt_loan_sell_comm_qty decimal(18,2),
    OUT p_loan_return_comm_qty decimal(18,2),
    OUT p_debt_fina_buy_strike_amt decimal(18,4),
    OUT p_fina_return_strike_amt decimal(18,4),
    OUT p_debt_loan_sell_strike_amt decimal(18,4),
    OUT p_loan_return_strike_amt decimal(18,4),
    OUT p_debt_fina_buy_order_amt decimal(18,4),
    OUT p_fina_return_order_amt decimal(18,4),
    OUT p_debt_loan_sell_order_amt decimal(18,4),
    OUT p_loan_return_order_amt decimal(18,4),
    OUT p_debt_fina_buy_comm_amt decimal(18,4),
    OUT p_fina_return_comm_amt decimal(18,4),
    OUT p_debt_loan_sell_comm_amt decimal(18,4),
    OUT p_loan_return_comm_amt decimal(18,4),
    OUT p_debt_strike_fee decimal(18,4),
    OUT p_return_strike_fee decimal(18,4),
    OUT p_debt_interest decimal(18,4),
    OUT p_return_interest_amt decimal(18,4),
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
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_debt_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_invest_type int;
    declare v_debt_fina_buy_strike_qty decimal(18,2);
    declare v_fina_return_strike_qty decimal(18,2);
    declare v_debt_loan_sell_strike_qty decimal(18,2);
    declare v_loan_return_strike_qty decimal(18,2);
    declare v_debt_fina_buy_order_qty decimal(18,2);
    declare v_fina_return_order_qty decimal(18,2);
    declare v_debt_loan_sell_order_qty decimal(18,2);
    declare v_loan_return_order_qty decimal(18,2);
    declare v_debt_fina_buy_comm_qty decimal(18,2);
    declare v_fina_return_comm_qty decimal(18,2);
    declare v_debt_loan_sell_comm_qty decimal(18,2);
    declare v_loan_return_comm_qty decimal(18,2);
    declare v_debt_fina_buy_strike_amt decimal(18,4);
    declare v_fina_return_strike_amt decimal(18,4);
    declare v_debt_loan_sell_strike_amt decimal(18,4);
    declare v_loan_return_strike_amt decimal(18,4);
    declare v_debt_fina_buy_order_amt decimal(18,4);
    declare v_fina_return_order_amt decimal(18,4);
    declare v_debt_loan_sell_order_amt decimal(18,4);
    declare v_loan_return_order_amt decimal(18,4);
    declare v_debt_fina_buy_comm_amt decimal(18,4);
    declare v_fina_return_comm_amt decimal(18,4);
    declare v_debt_loan_sell_comm_amt decimal(18,4);
    declare v_loan_return_comm_amt decimal(18,4);
    declare v_debt_strike_fee decimal(18,4);
    declare v_return_strike_fee decimal(18,4);
    declare v_debt_interest decimal(18,4);
    declare v_return_interest_amt decimal(18,4);
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_debt_type = p_debt_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_exch_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_invest_type = 0;
    SET v_debt_fina_buy_strike_qty = 0;
    SET v_fina_return_strike_qty = 0;
    SET v_debt_loan_sell_strike_qty = 0;
    SET v_loan_return_strike_qty = 0;
    SET v_debt_fina_buy_order_qty = 0;
    SET v_fina_return_order_qty = 0;
    SET v_debt_loan_sell_order_qty = 0;
    SET v_loan_return_order_qty = 0;
    SET v_debt_fina_buy_comm_qty = 0;
    SET v_fina_return_comm_qty = 0;
    SET v_debt_loan_sell_comm_qty = 0;
    SET v_loan_return_comm_qty = 0;
    SET v_debt_fina_buy_strike_amt = 0;
    SET v_fina_return_strike_amt = 0;
    SET v_debt_loan_sell_strike_amt = 0;
    SET v_loan_return_strike_amt = 0;
    SET v_debt_fina_buy_order_amt = 0;
    SET v_fina_return_order_amt = 0;
    SET v_debt_loan_sell_order_amt = 0;
    SET v_loan_return_order_amt = 0;
    SET v_debt_fina_buy_comm_amt = 0;
    SET v_fina_return_comm_amt = 0;
    SET v_debt_loan_sell_comm_amt = 0;
    SET v_loan_return_comm_amt = 0;
    SET v_debt_strike_fee = 0;
    SET v_return_strike_fee = 0;
    SET v_debt_interest = 0;
    SET v_return_interest_amt = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询交易组业务持仓负债】*/
    call db_tdsecu.pra_tdseac_QueryExgpBusiPosiDebt(
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
        v_stock_acco_no,
        v_stock_code_no,
        v_debt_type,
        v_error_code,
        v_error_info,
        v_row_id,
        v_exch_no,
        v_stock_type,
        v_asset_type,
        v_invest_type,
        v_debt_fina_buy_strike_qty,
        v_fina_return_strike_qty,
        v_debt_loan_sell_strike_qty,
        v_loan_return_strike_qty,
        v_debt_fina_buy_order_qty,
        v_fina_return_order_qty,
        v_debt_loan_sell_order_qty,
        v_loan_return_order_qty,
        v_debt_fina_buy_comm_qty,
        v_fina_return_comm_qty,
        v_debt_loan_sell_comm_qty,
        v_loan_return_comm_qty,
        v_debt_fina_buy_strike_amt,
        v_fina_return_strike_amt,
        v_debt_loan_sell_strike_amt,
        v_loan_return_strike_amt,
        v_debt_fina_buy_order_amt,
        v_fina_return_order_amt,
        v_debt_loan_sell_order_amt,
        v_loan_return_order_amt,
        v_debt_fina_buy_comm_amt,
        v_fina_return_comm_amt,
        v_debt_loan_sell_comm_amt,
        v_loan_return_comm_amt,
        v_debt_strike_fee,
        v_return_strike_fee,
        v_debt_interest,
        v_return_interest_amt,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.76.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询交易组业务持仓负债出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_exch_no = v_exch_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_invest_type = v_invest_type;
    SET p_debt_fina_buy_strike_qty = v_debt_fina_buy_strike_qty;
    SET p_fina_return_strike_qty = v_fina_return_strike_qty;
    SET p_debt_loan_sell_strike_qty = v_debt_loan_sell_strike_qty;
    SET p_loan_return_strike_qty = v_loan_return_strike_qty;
    SET p_debt_fina_buy_order_qty = v_debt_fina_buy_order_qty;
    SET p_fina_return_order_qty = v_fina_return_order_qty;
    SET p_debt_loan_sell_order_qty = v_debt_loan_sell_order_qty;
    SET p_loan_return_order_qty = v_loan_return_order_qty;
    SET p_debt_fina_buy_comm_qty = v_debt_fina_buy_comm_qty;
    SET p_fina_return_comm_qty = v_fina_return_comm_qty;
    SET p_debt_loan_sell_comm_qty = v_debt_loan_sell_comm_qty;
    SET p_loan_return_comm_qty = v_loan_return_comm_qty;
    SET p_debt_fina_buy_strike_amt = v_debt_fina_buy_strike_amt;
    SET p_fina_return_strike_amt = v_fina_return_strike_amt;
    SET p_debt_loan_sell_strike_amt = v_debt_loan_sell_strike_amt;
    SET p_loan_return_strike_amt = v_loan_return_strike_amt;
    SET p_debt_fina_buy_order_amt = v_debt_fina_buy_order_amt;
    SET p_fina_return_order_amt = v_fina_return_order_amt;
    SET p_debt_loan_sell_order_amt = v_debt_loan_sell_order_amt;
    SET p_loan_return_order_amt = v_loan_return_order_amt;
    SET p_debt_fina_buy_comm_amt = v_debt_fina_buy_comm_amt;
    SET p_fina_return_comm_amt = v_fina_return_comm_amt;
    SET p_debt_loan_sell_comm_amt = v_debt_loan_sell_comm_amt;
    SET p_loan_return_comm_amt = v_loan_return_comm_amt;
    SET p_debt_strike_fee = v_debt_strike_fee;
    SET p_return_strike_fee = v_return_strike_fee;
    SET p_debt_interest = v_debt_interest;
    SET p_return_interest_amt = v_return_interest_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_查询资产账户业务持仓负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryAsacBusiPosiDebt;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryAsacBusiPosiDebt(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_debt_type int,
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_debt_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_invest_type int;
    declare v_debt_fina_buy_strike_qty decimal(18,2);
    declare v_fina_return_strike_qty decimal(18,2);
    declare v_debt_loan_sell_strike_qty decimal(18,2);
    declare v_loan_return_strike_qty decimal(18,2);
    declare v_debt_fina_buy_order_qty decimal(18,2);
    declare v_fina_return_order_qty decimal(18,2);
    declare v_debt_loan_sell_order_qty decimal(18,2);
    declare v_loan_return_order_qty decimal(18,2);
    declare v_debt_fina_buy_comm_qty decimal(18,2);
    declare v_fina_return_comm_qty decimal(18,2);
    declare v_debt_loan_sell_comm_qty decimal(18,2);
    declare v_loan_return_comm_qty decimal(18,2);
    declare v_debt_fina_buy_strike_amt decimal(18,4);
    declare v_fina_return_strike_amt decimal(18,4);
    declare v_debt_loan_sell_strike_amt decimal(18,4);
    declare v_loan_return_strike_amt decimal(18,4);
    declare v_debt_fina_buy_order_amt decimal(18,4);
    declare v_fina_return_order_amt decimal(18,4);
    declare v_debt_loan_sell_order_amt decimal(18,4);
    declare v_loan_return_order_amt decimal(18,4);
    declare v_debt_fina_buy_comm_amt decimal(18,4);
    declare v_fina_return_comm_amt decimal(18,4);
    declare v_debt_loan_sell_comm_amt decimal(18,4);
    declare v_loan_return_comm_amt decimal(18,4);
    declare v_debt_strike_fee decimal(18,4);
    declare v_return_strike_fee decimal(18,4);
    declare v_debt_interest decimal(18,4);
    declare v_return_interest_amt decimal(18,4);
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_debt_type = p_debt_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_exch_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_invest_type = 0;
    SET v_debt_fina_buy_strike_qty = 0;
    SET v_fina_return_strike_qty = 0;
    SET v_debt_loan_sell_strike_qty = 0;
    SET v_loan_return_strike_qty = 0;
    SET v_debt_fina_buy_order_qty = 0;
    SET v_fina_return_order_qty = 0;
    SET v_debt_loan_sell_order_qty = 0;
    SET v_loan_return_order_qty = 0;
    SET v_debt_fina_buy_comm_qty = 0;
    SET v_fina_return_comm_qty = 0;
    SET v_debt_loan_sell_comm_qty = 0;
    SET v_loan_return_comm_qty = 0;
    SET v_debt_fina_buy_strike_amt = 0;
    SET v_fina_return_strike_amt = 0;
    SET v_debt_loan_sell_strike_amt = 0;
    SET v_loan_return_strike_amt = 0;
    SET v_debt_fina_buy_order_amt = 0;
    SET v_fina_return_order_amt = 0;
    SET v_debt_loan_sell_order_amt = 0;
    SET v_loan_return_order_amt = 0;
    SET v_debt_fina_buy_comm_amt = 0;
    SET v_fina_return_comm_amt = 0;
    SET v_debt_loan_sell_comm_amt = 0;
    SET v_loan_return_comm_amt = 0;
    SET v_debt_strike_fee = 0;
    SET v_return_strike_fee = 0;
    SET v_debt_interest = 0;
    SET v_return_interest_amt = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询资产账户业务持仓负债】*/
    call db_tdsecu.pra_tdseac_QueryAsacBusiPosiDebt(
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
        v_stock_acco_no,
        v_stock_code_no,
        v_debt_type,
        v_error_code,
        v_error_info,
        v_row_id,
        v_exch_no,
        v_stock_type,
        v_asset_type,
        v_invest_type,
        v_debt_fina_buy_strike_qty,
        v_fina_return_strike_qty,
        v_debt_loan_sell_strike_qty,
        v_loan_return_strike_qty,
        v_debt_fina_buy_order_qty,
        v_fina_return_order_qty,
        v_debt_loan_sell_order_qty,
        v_loan_return_order_qty,
        v_debt_fina_buy_comm_qty,
        v_fina_return_comm_qty,
        v_debt_loan_sell_comm_qty,
        v_loan_return_comm_qty,
        v_debt_fina_buy_strike_amt,
        v_fina_return_strike_amt,
        v_debt_loan_sell_strike_amt,
        v_loan_return_strike_amt,
        v_debt_fina_buy_order_amt,
        v_fina_return_order_amt,
        v_debt_loan_sell_order_amt,
        v_loan_return_order_amt,
        v_debt_fina_buy_comm_amt,
        v_fina_return_comm_amt,
        v_debt_loan_sell_comm_amt,
        v_loan_return_comm_amt,
        v_debt_strike_fee,
        v_return_strike_fee,
        v_debt_interest,
        v_return_interest_amt,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.77.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询资产账户业务持仓负债出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_根据记录序号串查询交易组负债明细结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryExgpDebtJourListByIdStr;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryExgpDebtJourListByIdStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_detail_posi_id_str varchar(1024),
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
    declare v_detail_posi_id_str varchar(1024);
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
    SET v_detail_posi_id_str = p_detail_posi_id_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_根据记录序号串查询交易组负债明细结果集】*/
    call db_tdsecu.pra_tdseac_QueryExgpDebtJourListByIdstr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_detail_posi_id_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.78.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_根据记录序号串查询交易组负债明细结果集出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_更新交易组融资融券保证金计算表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_UpdateExgpFinaLoanMarginCalc;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_UpdateExgpFinaLoanMarginCalc(
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
    IN p_converted_margin decimal(18,4),
    IN p_fina_converted_pandl decimal(18,4),
    IN p_loan_converted_pandl decimal(18,4),
    IN p_fina_capt_margin decimal(18,4),
    IN p_loan_capt_margin decimal(18,4),
    IN p_keep_guarantee_ratio decimal(18,12),
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
    declare v_converted_margin decimal(18,4);
    declare v_fina_converted_pandl decimal(18,4);
    declare v_loan_converted_pandl decimal(18,4);
    declare v_fina_capt_margin decimal(18,4);
    declare v_loan_capt_margin decimal(18,4);
    declare v_keep_guarantee_ratio decimal(18,12);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_converted_margin = p_converted_margin;
    SET v_fina_converted_pandl = p_fina_converted_pandl;
    SET v_loan_converted_pandl = p_loan_converted_pandl;
    SET v_fina_capt_margin = p_fina_capt_margin;
    SET v_loan_capt_margin = p_loan_capt_margin;
    SET v_keep_guarantee_ratio = p_keep_guarantee_ratio;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_更新交易组融资融券保证金计算表】*/
    call db_tdsecu.pra_tdseac_UpdateExgpFinaLoanMarginCalc(
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
        v_converted_margin,
        v_fina_converted_pandl,
        v_loan_converted_pandl,
        v_fina_capt_margin,
        v_loan_capt_margin,
        v_keep_guarantee_ratio,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.79.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新交易组融资融券保证金计算表出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_更新资产账户融资融券保证金计算表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_UpdateAsacFinaLoanMarginCalc;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_UpdateAsacFinaLoanMarginCalc(
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
    IN p_converted_margin decimal(18,4),
    IN p_fina_converted_pandl decimal(18,4),
    IN p_loan_converted_pandl decimal(18,4),
    IN p_fina_capt_margin decimal(18,4),
    IN p_loan_capt_margin decimal(18,4),
    IN p_keep_guarantee_ratio decimal(18,12),
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
    declare v_converted_margin decimal(18,4);
    declare v_fina_converted_pandl decimal(18,4);
    declare v_loan_converted_pandl decimal(18,4);
    declare v_fina_capt_margin decimal(18,4);
    declare v_loan_capt_margin decimal(18,4);
    declare v_keep_guarantee_ratio decimal(18,12);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_converted_margin = p_converted_margin;
    SET v_fina_converted_pandl = p_fina_converted_pandl;
    SET v_loan_converted_pandl = p_loan_converted_pandl;
    SET v_fina_capt_margin = p_fina_capt_margin;
    SET v_loan_capt_margin = p_loan_capt_margin;
    SET v_keep_guarantee_ratio = p_keep_guarantee_ratio;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_更新资产账户融资融券保证金计算表】*/
    call db_tdsecu.pra_tdseac_UpdateAsacFinaLoanMarginCalc(
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
        v_converted_margin,
        v_fina_converted_pandl,
        v_loan_converted_pandl,
        v_fina_capt_margin,
        v_loan_capt_margin,
        v_keep_guarantee_ratio,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.80.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新资产账户融资融券保证金计算表出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_转入产品证券资产账户负债明细记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_InsertPdSecuAsacDebtDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_InsertPdSecuAsacDebtDetail(
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
    IN p_pass_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_debt_type int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_fee decimal(18,4),
    IN p_debt_order_no int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_debt_amt decimal(18,4),
    IN p_debt_qty decimal(18,2),
    IN p_debt_fee decimal(18,4),
    IN p_debt_interest decimal(18,4),
    IN p_intrst_base_amt decimal(18,4),
    IN p_debt_return_amt decimal(18,4),
    IN p_debt_return_qty decimal(18,2),
    IN p_return_interest_amt decimal(18,4),
    IN p_debt_status int,
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
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_debt_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_debt_order_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_debt_type = p_debt_type;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_fee = p_strike_fee;
    SET v_debt_order_no = p_debt_order_no;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_debt_amt = p_debt_amt;
    SET v_debt_qty = p_debt_qty;
    SET v_debt_fee = p_debt_fee;
    SET v_debt_interest = p_debt_interest;
    SET v_intrst_base_amt = p_intrst_base_amt;
    SET v_debt_return_amt = p_debt_return_amt;
    SET v_debt_return_qty = p_debt_return_qty;
    SET v_return_interest_amt = p_return_interest_amt;
    SET v_debt_status = p_debt_status;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易证券_账户_转入产品证券资产账户负债明细记录】*/
    call db_tdsecu.pra_tdseac_InsertPdSecuAsacDebtDetail(
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
        v_pass_no,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_debt_type,
        v_strike_qty,
        v_strike_amt,
        v_strike_fee,
        v_debt_order_no,
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.81.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_转入产品证券资产账户负债明细记录出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_转入产品证券交易组负债明细记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_InsertPdSecuExgpDebtDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_InsertPdSecuExgpDebtDetail(
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
    IN p_pass_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_debt_type int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_fee decimal(18,4),
    IN p_debt_order_no int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_debt_amt decimal(18,4),
    IN p_debt_qty decimal(18,2),
    IN p_debt_fee decimal(18,4),
    IN p_debt_interest decimal(18,4),
    IN p_intrst_base_amt decimal(18,4),
    IN p_debt_return_amt decimal(18,4),
    IN p_debt_return_qty decimal(18,2),
    IN p_return_interest_amt decimal(18,4),
    IN p_debt_status int,
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
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_debt_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_debt_order_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_debt_type = p_debt_type;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_fee = p_strike_fee;
    SET v_debt_order_no = p_debt_order_no;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_debt_amt = p_debt_amt;
    SET v_debt_qty = p_debt_qty;
    SET v_debt_fee = p_debt_fee;
    SET v_debt_interest = p_debt_interest;
    SET v_intrst_base_amt = p_intrst_base_amt;
    SET v_debt_return_amt = p_debt_return_amt;
    SET v_debt_return_qty = p_debt_return_qty;
    SET v_return_interest_amt = p_return_interest_amt;
    SET v_debt_status = p_debt_status;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易证券_账户_转入产品证券交易组负债明细记录】*/
    call db_tdsecu.pra_tdseac_InsertPdSecuExgpDebtDetail(
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
        v_pass_no,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_debt_type,
        v_strike_qty,
        v_strike_amt,
        v_strike_fee,
        v_debt_order_no,
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.82.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_转入产品证券交易组负债明细记录出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_超出期限处理组合状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_OutDayDealComboStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_OutDayDealComboStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_comm_batch_no int,
    IN p_comm_oper_way varchar(2),
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
    declare v_co_no int;
    declare v_comm_batch_no int;
    declare v_comm_oper_way varchar(2);
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
    SET v_co_no = p_co_no;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_账户_超出期限处理组合状态】*/
        call db_tdsecu.pra_tdseac_OutDayDealComboStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_comm_batch_no,
            v_comm_oper_way,
            v_init_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.2.83.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_超出期限处理组合状态出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_超出期限处理失败组合状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_OutDayDealDefaultComboStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_OutDayDealDefaultComboStatus(
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
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_账户_超出期限处理失败组合状态】*/
        call db_tdsecu.pra_tdseac_OutDayDealDefaultComboStatus(
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
            SET v_error_code = "tdsecuT.2.84.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_超出期限处理失败组合状态出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_根据记录序号串查询资产账户负债明细结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryAsacDebtJourListByIdStr;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryAsacDebtJourListByIdStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_detail_posi_id_str varchar(1024),
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
    declare v_detail_posi_id_str varchar(1024);
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
    SET v_detail_posi_id_str = p_detail_posi_id_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_根据记录序号串查询资产账户负债明细结果集】*/
    call db_tdsecu.pra_tdseac_QueryAsacDebtJourListByIdstr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_detail_posi_id_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.85.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_根据记录序号串查询资产账户负债明细结果集出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询资产账户负债明细结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryAsacDebtJourList;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryAsacDebtJourList(
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
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
    IN p_debt_type int,
    IN p_stock_code_no int,
    IN p_order_dir int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
    declare v_debt_type int;
    declare v_stock_code_no int;
    declare v_order_dir int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_debt_type = p_debt_type;
    SET v_stock_code_no = p_stock_code_no;
    SET v_order_dir = p_order_dir;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询资产账户负债明细结果集】*/
    call db_tdsecu.pra_tdseac_QueryAsacDebtJourList(
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
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_debt_type,
        v_stock_code_no,
        v_order_dir,
        v_exch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.86.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询资产账户负债明细结果集出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询交易组组合策略持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tb_tdseac_QueryExgpComboStrategyPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tb_tdseac_QueryExgpComboStrategyPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_combo_code varchar(32),
    IN p_stock_code varchar(6),
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
    declare v_row_count int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_combo_code varchar(32);
    declare v_stock_code varchar(6);
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
    SET v_row_count = p_row_count;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_combo_code = p_combo_code;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询交易组组合策略持仓表】*/
    call db_tdsecu.pra_tdseac_QueryExgpComboStrategyPosi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_row_count,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_exch_group_no,
        v_combo_code,
        v_stock_code,
        v_exch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.87.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询交易组组合策略持仓表出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询资产账户组合策略持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryAsacComboStrategyPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryAsacComboStrategyPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_combo_code varchar(32),
    IN p_stock_code varchar(6),
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
    declare v_row_count int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_combo_code varchar(32);
    declare v_stock_code varchar(6);
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
    SET v_row_count = p_row_count;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_combo_code = p_combo_code;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询资产账户组合策略持仓表】*/
    call db_tdsecu.pra_tdseac_QueryAsacComboStrategyPosi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_row_count,
        v_co_no,
        v_pd_no,
        v_combo_code,
        v_stock_code,
        v_exch_no,
        v_asset_acco_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.88.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询资产账户组合策略持仓表出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询交易组组合策略收益表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryExgpIncome;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryExgpIncome(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
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
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_combo_code = p_combo_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询交易组组合策略收益表】*/
    call db_tdsecu.pra_tdseac_QueryExgpIncome(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_row_count,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_exch_group_no,
        v_combo_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.89.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询交易组组合策略收益表出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_查询资产账户组合策略收益表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QueryAsacIncome;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QueryAsacIncome(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
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
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_combo_code = p_combo_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询资产账户组合策略收益表】*/
    call db_tdsecu.pra_tdseac_QueryAsacIncome(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_row_count,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_combo_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.90.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询资产账户组合策略收益表出现错误！',v_mysql_message);
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

# 事务_交易证券_账户_组合策略持仓调整
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_ComboStrategyPosiAjust;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_ComboStrategyPosiAjust(
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
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_occur_cost_amt decimal(18,4),
    IN p_occur_qty decimal(18,2),
    IN p_occur_profit decimal(18,4),
    IN p_combo_code varchar(32),
    IN p_target_combo_code varchar(32),
    IN p_init_date int,
    IN p_posi_qty decimal(18,2),
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
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_occur_cost_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_occur_profit decimal(18,4);
    declare v_combo_code varchar(32);
    declare v_target_combo_code varchar(32);
    declare v_init_date int;
    declare v_posi_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_qty decimal(18,2);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_comm_unfroz_qty decimal(18,2);
    declare v_comm_capt_qty decimal(18,2);
    declare v_comm_releas_qty decimal(18,2);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_trade_unfroz_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_strike_frozen_qty decimal(18,2);
    declare v_strike_unfroz_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_combo_cost decimal(18,4);
    declare v_assigned_qty decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_occur_cost_amt = p_occur_cost_amt;
    SET v_occur_qty = p_occur_qty;
    SET v_occur_profit = p_occur_profit;
    SET v_combo_code = p_combo_code;
    SET v_target_combo_code = p_target_combo_code;
    SET v_init_date = p_init_date;
    SET v_posi_qty = p_posi_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_qty = 0;
    SET v_comm_frozen_qty = 0;
    SET v_comm_unfroz_qty = 0;
    SET v_comm_capt_qty = 0;
    SET v_comm_releas_qty = 0;
    SET v_trade_frozen_qty = 0;
    SET v_trade_unfroz_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_strike_frozen_qty = 0;
    SET v_strike_unfroz_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_realize_pandl = 0;
    SET v_sum_realize_pandl = 0;
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_combo_cost = 0;
    SET v_assigned_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";

    
    label_pro:BEGIN
    

    /* set @当前数量# = @变动数量#; */
    set v_curr_qty = v_occur_qty;

    /* set @指令冻结数量# = 0; */
    set v_comm_frozen_qty = 0;

    /* set @指令解冻数量# = 0; */
    set v_comm_unfroz_qty = 0;

    /* set @指令占用数量# = 0; */
    set v_comm_capt_qty = 0;

    /* set @指令释放数量# = 0; */
    set v_comm_releas_qty = 0;

    /* set @交易冻结数量# = 0; */
    set v_trade_frozen_qty = 0;

    /* set @交易解冻数量# = 0; */
    set v_trade_unfroz_qty = 0;

    /* set @交易占用数量# = 0; */
    set v_trade_capt_qty = 0;

    /* set @交易释放数量# = 0; */
    set v_trade_releas_qty = 0;

    /* set @成交冻结数量# = 0; */
    set v_strike_frozen_qty = 0;

    /* set @成交解冻数量# = 0; */
    set v_strike_unfroz_qty = 0;

    /* set @成交占用数量# = 0; */
    set v_strike_capt_qty = 0;

    /* set @成交释放数量# = 0; */
    set v_strike_releas_qty = 0;

    /* set @实现盈亏# = @变动收益#; */
    set v_realize_pandl = v_occur_profit;

    /* set @累计实现盈亏# = @变动收益#; */
    set v_sum_realize_pandl = v_occur_profit;

    /* set @成本金额# = @变动成本金额#; */
    set v_cost_amt = v_occur_cost_amt;

    /* set @利息成本金额# = 0; */
    set v_intrst_cost_amt = 0;

    /* set @利息收益# = 0; */
    set v_intrst_pandl = 0;

    /* set @组合成本# = @变动成本金额#; */
    set v_combo_cost = v_occur_cost_amt;
    #1-非组合的持仓划转到组合内
    #2-组合内的持仓划出组合
    #3-组合间的划转

    /* [事务开始] */
    START TRANSACTION;


    /* if @组合代码# <> ' ' then */
    if v_combo_code <> ' ' then
        #组合间划转也不能超过组合内的数量

        /* [获取表记录变量][交易证券_账户_交易组组合策略持仓表][{当前数量}][@已分配数量#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {组合代码} = @组合代码#][4][@资产账户编号#, @股东代码编号#, @证券代码#,@市场编号#,@组合代码#] */
        select curr_qty into v_assigned_qty from db_tdsecu.tb_tdseac_exgp_combo_strategy_posi where co_no = v_co_no and pd_no = v_pd_no and asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and combo_code = v_combo_code limit 1;
        if FOUND_ROWS() = 0 then
            ROLLBACK;        
            SET v_error_code = "tdsecuT.2.91.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码=", v_stock_code,",","市场编号=",v_exch_no,",","组合代码=",v_combo_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码=", v_stock_code,",","市场编号=",v_exch_no,",","组合代码=",v_combo_code);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@变动数量#> @已分配数量#][803][@已分配数量#, @变动数量#] */
        if v_occur_qty> v_assigned_qty then
            ROLLBACK;
            SET v_error_code = "tdsecuT.2.91.803";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("已分配数量=",v_assigned_qty,","," 变动数量=", v_occur_qty),"#",v_mysql_message);
            else
                SET v_error_info = concat("已分配数量=",v_assigned_qty,","," 变动数量=", v_occur_qty);
            end if;
            leave label_pro;
        end if;


        /* [插入重复更新][交易证券_账户_交易组组合策略持仓表][字段][字段变量][{当前数量} = {当前数量} - @变动数量#,{成本金额} = {成本金额} - @变动成本金额#,{累计实现盈亏} = {累计实现盈亏} -@变动收益#,{实现盈亏} = {实现盈亏} - @变动收益#][1][@交易组编号#,@组合代码#,@变动数量#,@变动成本金额#,@变动收益#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdseac_exgp_combo_strategy_posi (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, asset_acco_no, exch_group_no, stock_acco_no, 
            combo_code, stock_code, exch_no, stock_code_no, 
            stock_type, asset_type, curr_qty, comm_frozen_qty, 
            comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
            trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_capt_qty, 
            strike_releas_qty, strike_frozen_qty, strike_unfroz_qty, realize_pandl, 
            sum_realize_pandl, cost_amt, intrst_cost_amt, intrst_pandl) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_exch_group_no, v_stock_acco_no, 
            v_combo_code, v_stock_code, v_exch_no, v_stock_code_no, 
            v_stock_type, v_asset_type, v_curr_qty, v_comm_frozen_qty, 
            v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
            v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_capt_qty, 
            v_strike_releas_qty, v_strike_frozen_qty, v_strike_unfroz_qty, v_realize_pandl, 
            v_sum_realize_pandl, v_cost_amt, v_intrst_cost_amt, v_intrst_pandl) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty = curr_qty - v_occur_qty,cost_amt = cost_amt - v_occur_cost_amt,sum_realize_pandl = sum_realize_pandl -v_occur_profit,realize_pandl = realize_pandl - v_occur_profit;
        if v_error_code = "1" then
            ROLLBACK;        
            SET v_error_code = "tdsecuT.2.91.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code,",","变动数量=",v_occur_qty,",","变动成本金额=",v_occur_cost_amt,",","变动收益=",v_occur_profit),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code,",","变动数量=",v_occur_qty,",","变动成本金额=",v_occur_cost_amt,",","变动收益=",v_occur_profit);
            end if;
            leave label_pro;
        end if;


        /* [插入重复更新][交易证券_账户_交易组组合策略收益表][字段][字段变量][{组合成本} = {组合成本} - @变动成本金额#,{累计实现盈亏} = {累计实现盈亏} -@变动收益#,{实现盈亏} = {实现盈亏} - @变动收益#][1][@交易组编号#,@组合代码#,@变动数量#,@变动成本金额#,@变动收益#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdseac_exgp_combo_strategy_income (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, asset_acco_no, exch_group_no, combo_code, 
            combo_cost, realize_pandl, sum_realize_pandl) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_exch_group_no, v_combo_code, 
            v_combo_cost, v_realize_pandl, v_sum_realize_pandl) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, combo_cost = combo_cost - v_occur_cost_amt,sum_realize_pandl = sum_realize_pandl -v_occur_profit,realize_pandl = realize_pandl - v_occur_profit;
        if v_error_code = "1" then
            ROLLBACK;        
            SET v_error_code = "tdsecuT.2.91.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code,",","变动数量=",v_occur_qty,",","变动成本金额=",v_occur_cost_amt,",","变动收益=",v_occur_profit),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code,",","变动数量=",v_occur_qty,",","变动成本金额=",v_occur_cost_amt,",","变动收益=",v_occur_profit);
            end if;
            leave label_pro;
        end if;


        /* [插入重复更新][交易证券_账户_资产账户组合策略持仓表][字段][字段变量][{当前数量} = {当前数量} - @变动数量#,{成本金额} = {成本金额} - @变动成本金额#,{累计实现盈亏} = {累计实现盈亏} -@变动收益#,{实现盈亏} = {实现盈亏} - @变动收益#][1][@交易组编号#,@资产账户编号#,@组合代码#,@变动数量#,@变动成本金额#,@变动收益#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdseac_asac_combo_strategy_posi (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, asset_acco_no, stock_acco_no, combo_code, 
            stock_code, exch_no, stock_code_no, stock_type, 
            asset_type, curr_qty, comm_frozen_qty, comm_unfroz_qty, 
            comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
            trade_capt_qty, trade_releas_qty, strike_capt_qty, strike_releas_qty, 
            strike_frozen_qty, strike_unfroz_qty, realize_pandl, sum_realize_pandl, 
            cost_amt, intrst_cost_amt, intrst_pandl) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_stock_acco_no, v_combo_code, 
            v_stock_code, v_exch_no, v_stock_code_no, v_stock_type, 
            v_asset_type, v_curr_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
            v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
            v_trade_capt_qty, v_trade_releas_qty, v_strike_capt_qty, v_strike_releas_qty, 
            v_strike_frozen_qty, v_strike_unfroz_qty, v_realize_pandl, v_sum_realize_pandl, 
            v_cost_amt, v_intrst_cost_amt, v_intrst_pandl) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty = curr_qty - v_occur_qty,cost_amt = cost_amt - v_occur_cost_amt,sum_realize_pandl = sum_realize_pandl -v_occur_profit,realize_pandl = realize_pandl - v_occur_profit;
        if v_error_code = "1" then
            ROLLBACK;        
            SET v_error_code = "tdsecuT.2.91.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","组合代码=",v_combo_code,",","变动数量=",v_occur_qty,",","变动成本金额=",v_occur_cost_amt,",","变动收益=",v_occur_profit),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","组合代码=",v_combo_code,",","变动数量=",v_occur_qty,",","变动成本金额=",v_occur_cost_amt,",","变动收益=",v_occur_profit);
            end if;
            leave label_pro;
        end if;


        /* [插入重复更新][交易证券_账户_资产账户组合策略收益表][字段][字段变量][{组合成本} = {组合成本} - @变动成本金额#,{累计实现盈亏} = {累计实现盈亏} -@变动收益#,{实现盈亏} = {实现盈亏} - @变动收益#][1][@交易组编号#,@资产账户编号#,@组合代码#,@变动数量#,@变动成本金额#,@变动收益#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdseac_asac_combo_strategy_income (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, asset_acco_no, combo_code, combo_cost, 
            realize_pandl, sum_realize_pandl) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_combo_code, v_combo_cost, 
            v_realize_pandl, v_sum_realize_pandl) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, combo_cost = combo_cost - v_occur_cost_amt,sum_realize_pandl = sum_realize_pandl -v_occur_profit,realize_pandl = realize_pandl - v_occur_profit;
        if v_error_code = "1" then
            ROLLBACK;        
            SET v_error_code = "tdsecuT.2.91.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","组合代码=",v_combo_code,",","变动数量=",v_occur_qty,",","变动成本金额=",v_occur_cost_amt,",","变动收益=",v_occur_profit),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","组合代码=",v_combo_code,",","变动数量=",v_occur_qty,",","变动成本金额=",v_occur_cost_amt,",","变动收益=",v_occur_profit);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][交易证券_账户_交易组组合策略持仓表][{当前数量},{成本金额},{累计实现盈亏},{实现盈亏}][@当前数量#,@成本金额#,@累计实现盈亏#,@实现盈亏#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {组合代码}=@组合代码#][4][@资产账户编号#, @股东代码编号#, @证券代码#,@市场编号#,@组合代码#] */
        select curr_qty,cost_amt,sum_realize_pandl,realize_pandl into v_curr_qty,v_cost_amt,v_sum_realize_pandl,v_realize_pandl from db_tdsecu.tb_tdseac_exgp_combo_strategy_posi where co_no = v_co_no and pd_no = v_pd_no and asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and combo_code=v_combo_code limit 1;
        if FOUND_ROWS() = 0 then
            ROLLBACK;        
            SET v_error_code = "tdsecuT.2.91.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码=", v_stock_code,",","市场编号=",v_exch_no,",","组合代码=",v_combo_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码=", v_stock_code,",","市场编号=",v_exch_no,",","组合代码=",v_combo_code);
            end if;
            leave label_pro;
        end if;


        /* set @流水后信息# = concat("变动值||变动数量:",-@变动数量#,",变动成本金额:",-@变动成本金额#,",变动收益:",-@变动收益#,";结果值||当前数量:",@当前数量#,",成本金额:",@成本金额#,",累计实现盈亏:",@累计实现盈亏#,",实现盈亏:",@实现盈亏#); */
        set v_jour_after_occur_info = concat("变动值||变动数量:",-v_occur_qty,",变动成本金额:",-v_occur_cost_amt,",变动收益:",-v_occur_profit,";结果值||当前数量:",v_curr_qty,",成本金额:",v_cost_amt,",累计实现盈亏:",v_sum_realize_pandl,",实现盈亏:",v_realize_pandl);

        /* [插入表记录][交易证券_账户_交易组组合策略持仓流水表][字段][字段变量][5][@资产账户编号#, @股东代码编号#, @证券代码编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdseac_exgp_combo_strategy_posi_jour(
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, stock_acco_no, 
            combo_code, stock_code, exch_no, stock_code_no, 
            jour_after_occur_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_stock_acco_no, 
            v_combo_code, v_stock_code, v_exch_no, v_stock_code_no, 
            v_jour_after_occur_info);
        if v_error_code = "1" then
            ROLLBACK;        
            SET v_error_code = "tdsecuT.2.91.5";
            SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* [获取表记录变量][交易证券_账户_资产账户组合策略持仓表][{当前数量},{成本金额},{累计实现盈亏},{实现盈亏}][@当前数量#,@成本金额#,@累计实现盈亏#,@实现盈亏#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {资产账户编号} = @资产账户编号#  and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {组合代码}=@组合代码#][4][@资产账户编号#, @股东代码编号#, @证券代码#,@市场编号#,@组合代码#] */
        select curr_qty,cost_amt,sum_realize_pandl,realize_pandl into v_curr_qty,v_cost_amt,v_sum_realize_pandl,v_realize_pandl from db_tdsecu.tb_tdseac_asac_combo_strategy_posi where co_no = v_co_no and pd_no = v_pd_no and asset_acco_no = v_asset_acco_no  and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and combo_code=v_combo_code limit 1;
        if FOUND_ROWS() = 0 then
            ROLLBACK;        
            SET v_error_code = "tdsecuT.2.91.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码=", v_stock_code,",","市场编号=",v_exch_no,",","组合代码=",v_combo_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码=", v_stock_code,",","市场编号=",v_exch_no,",","组合代码=",v_combo_code);
            end if;
            leave label_pro;
        end if;


        /* set @流水后信息# = concat("变动值||变动数量:",-@变动数量#,",变动成本金额:",-@变动成本金额#,",变动收益:",-@变动收益#,";结果值||当前数量:",@当前数量#,",成本金额:",@成本金额#,",累计实现盈亏:",@累计实现盈亏#,",实现盈亏:",@实现盈亏#); */
        set v_jour_after_occur_info = concat("变动值||变动数量:",-v_occur_qty,",变动成本金额:",-v_occur_cost_amt,",变动收益:",-v_occur_profit,";结果值||当前数量:",v_curr_qty,",成本金额:",v_cost_amt,",累计实现盈亏:",v_sum_realize_pandl,",实现盈亏:",v_realize_pandl);

        /* [插入表记录][交易证券_账户_资产账户组合策略持仓流水表][字段][字段变量][5][@资产账户编号#, @股东代码编号#, @证券代码编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdseac_asac_combo_strategy_posi_jour(
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, asset_acco_no, stock_acco_no, combo_code, 
            stock_code, exch_no, stock_code_no, jour_after_occur_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_stock_acco_no, v_combo_code, 
            v_stock_code, v_exch_no, v_stock_code_no, v_jour_after_occur_info);
        if v_error_code = "1" then
            ROLLBACK;        
            SET v_error_code = "tdsecuT.2.91.5";
            SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;

    /* if @目标组合代码# <> ' ' then */
    if v_target_combo_code <> ' ' then

        /* if @组合代码# = ' ' then */
        if v_combo_code = ' ' then
            #不能超过产品库可以划转的数量

            /* [获取表记录变量][交易证券_账户_交易组组合策略持仓表][sum({当前数量})][@已分配数量#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#][4][@资产账户编号#, @股东代码编号#, @证券代码#,@市场编号#] */
            select sum(curr_qty) into v_assigned_qty from db_tdsecu.tb_tdseac_exgp_combo_strategy_posi where co_no = v_co_no and pd_no = v_pd_no and asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no limit 1;
            if FOUND_ROWS() = 0 then
                ROLLBACK;        
                SET v_error_code = "tdsecuT.2.91.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码=", v_stock_code,",","市场编号=",v_exch_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码=", v_stock_code,",","市场编号=",v_exch_no);
                end if;
                leave label_pro;
            end if;


            /* [检查报错返回][@已分配数量#+ @变动数量#> @持仓数量#][803][@已分配数量#, @变动数量#,@持仓数量#] */
            if v_assigned_qty+ v_occur_qty> v_posi_qty then
                ROLLBACK;
                SET v_error_code = "tdsecuT.2.91.803";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("已分配数量=",v_assigned_qty,","," 变动数量=", v_occur_qty,",","持仓数量=",v_posi_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("已分配数量=",v_assigned_qty,","," 变动数量=", v_occur_qty,",","持仓数量=",v_posi_qty);
                end if;
                leave label_pro;
            end if;

        end if;

        /* set @组合代码# = @目标组合代码#; */
        set v_combo_code = v_target_combo_code;

        /* set @当前数量# = @变动数量#; */
        set v_curr_qty = v_occur_qty;

        /* set @成本金额# = @变动成本金额#; */
        set v_cost_amt = v_occur_cost_amt;

        /* set @累计实现盈亏# = @变动收益#; */
        set v_sum_realize_pandl = v_occur_profit;

        /* set @实现盈亏# = @变动收益#; */
        set v_realize_pandl = v_occur_profit;

        /* set @组合成本# =@变动成本金额#; */
        set v_combo_cost =v_occur_cost_amt;

        /* [插入重复更新][交易证券_账户_交易组组合策略持仓表][字段][字段变量][{当前数量} = {当前数量} + @变动数量#,{成本金额} = {成本金额} + @变动成本金额#,{累计实现盈亏} = {累计实现盈亏} +@变动收益#,{实现盈亏} = {实现盈亏} + @变动收益#][1][@交易组编号#,@组合代码#,@变动数量#,@变动成本金额#,@变动收益#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdseac_exgp_combo_strategy_posi (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, asset_acco_no, exch_group_no, stock_acco_no, 
            combo_code, stock_code, exch_no, stock_code_no, 
            stock_type, asset_type, curr_qty, comm_frozen_qty, 
            comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
            trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_capt_qty, 
            strike_releas_qty, strike_frozen_qty, strike_unfroz_qty, realize_pandl, 
            sum_realize_pandl, cost_amt, intrst_cost_amt, intrst_pandl) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_exch_group_no, v_stock_acco_no, 
            v_combo_code, v_stock_code, v_exch_no, v_stock_code_no, 
            v_stock_type, v_asset_type, v_curr_qty, v_comm_frozen_qty, 
            v_comm_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, 
            v_trade_unfroz_qty, v_trade_capt_qty, v_trade_releas_qty, v_strike_capt_qty, 
            v_strike_releas_qty, v_strike_frozen_qty, v_strike_unfroz_qty, v_realize_pandl, 
            v_sum_realize_pandl, v_cost_amt, v_intrst_cost_amt, v_intrst_pandl) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty = curr_qty + v_occur_qty,cost_amt = cost_amt + v_occur_cost_amt,sum_realize_pandl = sum_realize_pandl +v_occur_profit,realize_pandl = realize_pandl + v_occur_profit;
        if v_error_code = "1" then
            ROLLBACK;        
            SET v_error_code = "tdsecuT.2.91.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code,",","变动数量=",v_occur_qty,",","变动成本金额=",v_occur_cost_amt,",","变动收益=",v_occur_profit),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code,",","变动数量=",v_occur_qty,",","变动成本金额=",v_occur_cost_amt,",","变动收益=",v_occur_profit);
            end if;
            leave label_pro;
        end if;


        /* [插入重复更新][交易证券_账户_交易组组合策略收益表][字段][字段变量][{组合成本} = {组合成本} + @变动成本金额#,{累计实现盈亏} = {累计实现盈亏} + @变动收益#,{实现盈亏} = {实现盈亏} + @变动收益#][1][@交易组编号#,@组合代码#,@变动数量#,@变动成本金额#,@变动收益#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdseac_exgp_combo_strategy_income (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, asset_acco_no, exch_group_no, combo_code, 
            combo_cost, realize_pandl, sum_realize_pandl) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_exch_group_no, v_combo_code, 
            v_combo_cost, v_realize_pandl, v_sum_realize_pandl) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, combo_cost = combo_cost + v_occur_cost_amt,sum_realize_pandl = sum_realize_pandl + v_occur_profit,realize_pandl = realize_pandl + v_occur_profit;
        if v_error_code = "1" then
            ROLLBACK;        
            SET v_error_code = "tdsecuT.2.91.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code,",","变动数量=",v_occur_qty,",","变动成本金额=",v_occur_cost_amt,",","变动收益=",v_occur_profit),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code,",","变动数量=",v_occur_qty,",","变动成本金额=",v_occur_cost_amt,",","变动收益=",v_occur_profit);
            end if;
            leave label_pro;
        end if;


        /* [插入重复更新][交易证券_账户_资产账户组合策略持仓表][字段][字段变量][{当前数量} = {当前数量} + @变动数量#,{成本金额} = {成本金额} + @变动成本金额#,{累计实现盈亏} = {累计实现盈亏} + @变动收益#,{实现盈亏} = {实现盈亏} + @变动收益#][1][@交易组编号#,@资产账户编号#,@组合代码#,@变动数量#,@变动成本金额#,@变动收益#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdseac_asac_combo_strategy_posi (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, asset_acco_no, stock_acco_no, combo_code, 
            stock_code, exch_no, stock_code_no, stock_type, 
            asset_type, curr_qty, comm_frozen_qty, comm_unfroz_qty, 
            comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
            trade_capt_qty, trade_releas_qty, strike_capt_qty, strike_releas_qty, 
            strike_frozen_qty, strike_unfroz_qty, realize_pandl, sum_realize_pandl, 
            cost_amt, intrst_cost_amt, intrst_pandl) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_stock_acco_no, v_combo_code, 
            v_stock_code, v_exch_no, v_stock_code_no, v_stock_type, 
            v_asset_type, v_curr_qty, v_comm_frozen_qty, v_comm_unfroz_qty, 
            v_comm_capt_qty, v_comm_releas_qty, v_trade_frozen_qty, v_trade_unfroz_qty, 
            v_trade_capt_qty, v_trade_releas_qty, v_strike_capt_qty, v_strike_releas_qty, 
            v_strike_frozen_qty, v_strike_unfroz_qty, v_realize_pandl, v_sum_realize_pandl, 
            v_cost_amt, v_intrst_cost_amt, v_intrst_pandl) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty = curr_qty + v_occur_qty,cost_amt = cost_amt + v_occur_cost_amt,sum_realize_pandl = sum_realize_pandl + v_occur_profit,realize_pandl = realize_pandl + v_occur_profit;
        if v_error_code = "1" then
            ROLLBACK;        
            SET v_error_code = "tdsecuT.2.91.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","组合代码=",v_combo_code,",","变动数量=",v_occur_qty,",","变动成本金额=",v_occur_cost_amt,",","变动收益=",v_occur_profit),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","组合代码=",v_combo_code,",","变动数量=",v_occur_qty,",","变动成本金额=",v_occur_cost_amt,",","变动收益=",v_occur_profit);
            end if;
            leave label_pro;
        end if;


        /* [插入重复更新][交易证券_账户_资产账户组合策略收益表][字段][字段变量][{组合成本} = {组合成本} + @变动成本金额#,{累计实现盈亏} = {累计实现盈亏} + @变动收益#,{实现盈亏} = {实现盈亏} + @变动收益#][1][@交易组编号#,@资产账户编号#,@组合代码#,@变动数量#,@变动成本金额#,@变动收益#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdseac_asac_combo_strategy_income (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, asset_acco_no, combo_code, combo_cost, 
            realize_pandl, sum_realize_pandl) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_combo_code, v_combo_cost, 
            v_realize_pandl, v_sum_realize_pandl) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, combo_cost = combo_cost + v_occur_cost_amt,sum_realize_pandl = sum_realize_pandl + v_occur_profit,realize_pandl = realize_pandl + v_occur_profit;
        if v_error_code = "1" then
            ROLLBACK;        
            SET v_error_code = "tdsecuT.2.91.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","组合代码=",v_combo_code,",","变动数量=",v_occur_qty,",","变动成本金额=",v_occur_cost_amt,",","变动收益=",v_occur_profit),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","组合代码=",v_combo_code,",","变动数量=",v_occur_qty,",","变动成本金额=",v_occur_cost_amt,",","变动收益=",v_occur_profit);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][交易证券_账户_交易组组合策略持仓表][{当前数量},{成本金额},{累计实现盈亏},{实现盈亏}][@当前数量#,@成本金额#,@累计实现盈亏#,@实现盈亏#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {组合代码}=@组合代码#][4][@资产账户编号#, @股东代码编号#, @证券代码#,@市场编号#,@组合代码#] */
        select curr_qty,cost_amt,sum_realize_pandl,realize_pandl into v_curr_qty,v_cost_amt,v_sum_realize_pandl,v_realize_pandl from db_tdsecu.tb_tdseac_exgp_combo_strategy_posi where co_no = v_co_no and pd_no = v_pd_no and asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and combo_code=v_combo_code limit 1;
        if FOUND_ROWS() = 0 then
            ROLLBACK;        
            SET v_error_code = "tdsecuT.2.91.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码=", v_stock_code,",","市场编号=",v_exch_no,",","组合代码=",v_combo_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码=", v_stock_code,",","市场编号=",v_exch_no,",","组合代码=",v_combo_code);
            end if;
            leave label_pro;
        end if;


        /* set @流水后信息# = concat("变动值||变动数量:",@变动数量#,",变动成本金额:",@变动成本金额#,",变动收益:",@变动收益#,";结果值||当前数量:",@当前数量#,",成本金额:",@成本金额#,",累计实现盈亏:",@累计实现盈亏#,",实现盈亏:",@实现盈亏#); */
        set v_jour_after_occur_info = concat("变动值||变动数量:",v_occur_qty,",变动成本金额:",v_occur_cost_amt,",变动收益:",v_occur_profit,";结果值||当前数量:",v_curr_qty,",成本金额:",v_cost_amt,",累计实现盈亏:",v_sum_realize_pandl,",实现盈亏:",v_realize_pandl);

        /* [插入表记录][交易证券_账户_交易组组合策略持仓流水表][字段][字段变量][5][@资产账户编号#, @股东代码编号#, @证券代码编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdseac_exgp_combo_strategy_posi_jour(
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, stock_acco_no, 
            combo_code, stock_code, exch_no, stock_code_no, 
            jour_after_occur_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_stock_acco_no, 
            v_combo_code, v_stock_code, v_exch_no, v_stock_code_no, 
            v_jour_after_occur_info);
        if v_error_code = "1" then
            ROLLBACK;        
            SET v_error_code = "tdsecuT.2.91.5";
            SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* [获取表记录变量][交易证券_账户_资产账户组合策略持仓表][{当前数量},{成本金额},{累计实现盈亏},{实现盈亏}][@当前数量#,@成本金额#,@累计实现盈亏#,@实现盈亏#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {资产账户编号} = @资产账户编号#  and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {组合代码}=@组合代码#][4][@资产账户编号#, @股东代码编号#, @证券代码#,@市场编号#,@组合代码#] */
        select curr_qty,cost_amt,sum_realize_pandl,realize_pandl into v_curr_qty,v_cost_amt,v_sum_realize_pandl,v_realize_pandl from db_tdsecu.tb_tdseac_asac_combo_strategy_posi where co_no = v_co_no and pd_no = v_pd_no and asset_acco_no = v_asset_acco_no  and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and combo_code=v_combo_code limit 1;
        if FOUND_ROWS() = 0 then
            ROLLBACK;        
            SET v_error_code = "tdsecuT.2.91.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码=", v_stock_code,",","市场编号=",v_exch_no,",","组合代码=",v_combo_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码=", v_stock_code,",","市场编号=",v_exch_no,",","组合代码=",v_combo_code);
            end if;
            leave label_pro;
        end if;


        /* set @流水后信息# = concat("变动值||变动数量:",@变动数量#,",变动成本金额:",@变动成本金额#,",变动收益:",@变动收益#,";结果值||当前数量:",@当前数量#,",成本金额:",@成本金额#,",累计实现盈亏:",@累计实现盈亏#,",实现盈亏:",@实现盈亏#); */
        set v_jour_after_occur_info = concat("变动值||变动数量:",v_occur_qty,",变动成本金额:",v_occur_cost_amt,",变动收益:",v_occur_profit,";结果值||当前数量:",v_curr_qty,",成本金额:",v_cost_amt,",累计实现盈亏:",v_sum_realize_pandl,",实现盈亏:",v_realize_pandl);

        /* [插入表记录][交易证券_账户_资产账户组合策略持仓流水表][字段][字段变量][5][@资产账户编号#, @股东代码编号#, @证券代码编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdseac_asac_combo_strategy_posi_jour(
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, asset_acco_no, stock_acco_no, combo_code, 
            stock_code, exch_no, stock_code_no, jour_after_occur_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_stock_acco_no, v_combo_code, 
            v_stock_code, v_exch_no, v_stock_code_no, v_jour_after_occur_info);
        if v_error_code = "1" then
            ROLLBACK;        
            SET v_error_code = "tdsecuT.2.91.5";
            SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_查询单条交易组组合策略持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QuerySingleExgpStrategyPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QuerySingleExgpStrategyPosi(
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
    IN p_stock_acco_no int,
    IN p_combo_code varchar(32),
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_init_date int,
    OUT p_stock_code varchar(6),
    OUT p_exch_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_curr_qty decimal(18,2),
    OUT p_comm_frozen_qty decimal(18,2),
    OUT p_comm_unfroz_qty decimal(18,2),
    OUT p_comm_capt_qty decimal(18,2),
    OUT p_comm_releas_qty decimal(18,2),
    OUT p_trade_frozen_qty decimal(18,2),
    OUT p_trade_unfroz_qty decimal(18,2),
    OUT p_trade_capt_qty decimal(18,2),
    OUT p_trade_releas_qty decimal(18,2),
    OUT p_strike_capt_qty decimal(18,2),
    OUT p_strike_releas_qty decimal(18,2),
    OUT p_strike_frozen_qty decimal(18,2),
    OUT p_strike_unfroz_qty decimal(18,2),
    OUT p_realize_pandl decimal(18,4),
    OUT p_sum_realize_pandl decimal(18,4),
    OUT p_cost_amt decimal(18,4),
    OUT p_intrst_cost_amt decimal(18,4),
    OUT p_intrst_pandl decimal(18,4),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_combo_code varchar(32);
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_init_date int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_curr_qty decimal(18,2);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_comm_unfroz_qty decimal(18,2);
    declare v_comm_capt_qty decimal(18,2);
    declare v_comm_releas_qty decimal(18,2);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_trade_unfroz_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_strike_frozen_qty decimal(18,2);
    declare v_strike_unfroz_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_combo_code = p_combo_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_stock_code = " ";
    SET v_exch_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_curr_qty = 0;
    SET v_comm_frozen_qty = 0;
    SET v_comm_unfroz_qty = 0;
    SET v_comm_capt_qty = 0;
    SET v_comm_releas_qty = 0;
    SET v_trade_frozen_qty = 0;
    SET v_trade_unfroz_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_strike_frozen_qty = 0;
    SET v_strike_unfroz_qty = 0;
    SET v_realize_pandl = 0;
    SET v_sum_realize_pandl = 0;
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询单条交易组组合策略持仓表】*/
    call db_tdsecu.pra_tdseac_QuerySingleExgpStrategyPosi(
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
        v_stock_acco_no,
        v_combo_code,
        v_stock_code_no,
        v_error_code,
        v_error_info,
        v_row_id,
        v_init_date,
        v_stock_code,
        v_exch_no,
        v_stock_type,
        v_asset_type,
        v_curr_qty,
        v_comm_frozen_qty,
        v_comm_unfroz_qty,
        v_comm_capt_qty,
        v_comm_releas_qty,
        v_trade_frozen_qty,
        v_trade_unfroz_qty,
        v_trade_capt_qty,
        v_trade_releas_qty,
        v_strike_capt_qty,
        v_strike_releas_qty,
        v_strike_frozen_qty,
        v_strike_unfroz_qty,
        v_realize_pandl,
        v_sum_realize_pandl,
        v_cost_amt,
        v_intrst_cost_amt,
        v_intrst_pandl,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.92.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询单条交易组组合策略持仓表出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_init_date = v_init_date;
    SET p_stock_code = v_stock_code;
    SET p_exch_no = v_exch_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_curr_qty = v_curr_qty;
    SET p_comm_frozen_qty = v_comm_frozen_qty;
    SET p_comm_unfroz_qty = v_comm_unfroz_qty;
    SET p_comm_capt_qty = v_comm_capt_qty;
    SET p_comm_releas_qty = v_comm_releas_qty;
    SET p_trade_frozen_qty = v_trade_frozen_qty;
    SET p_trade_unfroz_qty = v_trade_unfroz_qty;
    SET p_trade_capt_qty = v_trade_capt_qty;
    SET p_trade_releas_qty = v_trade_releas_qty;
    SET p_strike_capt_qty = v_strike_capt_qty;
    SET p_strike_releas_qty = v_strike_releas_qty;
    SET p_strike_frozen_qty = v_strike_frozen_qty;
    SET p_strike_unfroz_qty = v_strike_unfroz_qty;
    SET p_realize_pandl = v_realize_pandl;
    SET p_sum_realize_pandl = v_sum_realize_pandl;
    SET p_cost_amt = v_cost_amt;
    SET p_intrst_cost_amt = v_intrst_cost_amt;
    SET p_intrst_pandl = v_intrst_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_查询单条交易组组合策略收益表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QuerySingleExgpStrategyIncome;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QuerySingleExgpStrategyIncome(
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
    IN p_combo_code varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_combo_cost decimal(18,4),
    OUT p_realize_pandl decimal(18,4),
    OUT p_sum_realize_pandl decimal(18,4),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_combo_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_combo_cost decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_combo_code = p_combo_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_combo_cost = 0;
    SET v_realize_pandl = 0;
    SET v_sum_realize_pandl = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询单条交易组组合策略收益表】*/
    call db_tdsecu.pra_tdseac_QuerySingleExgpStrategyIncome(
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
        v_combo_code,
        v_error_code,
        v_error_info,
        v_row_id,
        v_combo_cost,
        v_realize_pandl,
        v_sum_realize_pandl,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.93.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询单条交易组组合策略收益表出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_combo_cost = v_combo_cost;
    SET p_realize_pandl = v_realize_pandl;
    SET p_sum_realize_pandl = v_sum_realize_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_查询单条资产账户组合策略持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QuerySingleAsacStrategyPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QuerySingleAsacStrategyPosi(
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
    IN p_combo_code varchar(32),
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_init_date int,
    OUT p_stock_code varchar(6),
    OUT p_exch_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_curr_qty decimal(18,2),
    OUT p_comm_frozen_qty decimal(18,2),
    OUT p_comm_unfroz_qty decimal(18,2),
    OUT p_comm_capt_qty decimal(18,2),
    OUT p_comm_releas_qty decimal(18,2),
    OUT p_trade_frozen_qty decimal(18,2),
    OUT p_trade_unfroz_qty decimal(18,2),
    OUT p_trade_capt_qty decimal(18,2),
    OUT p_trade_releas_qty decimal(18,2),
    OUT p_strike_capt_qty decimal(18,2),
    OUT p_strike_releas_qty decimal(18,2),
    OUT p_strike_frozen_qty decimal(18,2),
    OUT p_strike_unfroz_qty decimal(18,2),
    OUT p_realize_pandl decimal(18,4),
    OUT p_sum_realize_pandl decimal(18,4),
    OUT p_cost_amt decimal(18,4),
    OUT p_intrst_cost_amt decimal(18,4),
    OUT p_intrst_pandl decimal(18,4),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_combo_code varchar(32);
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_init_date int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_curr_qty decimal(18,2);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_comm_unfroz_qty decimal(18,2);
    declare v_comm_capt_qty decimal(18,2);
    declare v_comm_releas_qty decimal(18,2);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_trade_unfroz_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_strike_frozen_qty decimal(18,2);
    declare v_strike_unfroz_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_combo_code = p_combo_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_stock_code = " ";
    SET v_exch_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_curr_qty = 0;
    SET v_comm_frozen_qty = 0;
    SET v_comm_unfroz_qty = 0;
    SET v_comm_capt_qty = 0;
    SET v_comm_releas_qty = 0;
    SET v_trade_frozen_qty = 0;
    SET v_trade_unfroz_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_strike_frozen_qty = 0;
    SET v_strike_unfroz_qty = 0;
    SET v_realize_pandl = 0;
    SET v_sum_realize_pandl = 0;
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询单条资产账户组合策略持仓表】*/
    call db_tdsecu.pra_tdseac_QuerySingleAsacStrategyPosi(
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
        v_combo_code,
        v_stock_code_no,
        v_error_code,
        v_error_info,
        v_row_id,
        v_init_date,
        v_stock_code,
        v_exch_no,
        v_stock_type,
        v_asset_type,
        v_curr_qty,
        v_comm_frozen_qty,
        v_comm_unfroz_qty,
        v_comm_capt_qty,
        v_comm_releas_qty,
        v_trade_frozen_qty,
        v_trade_unfroz_qty,
        v_trade_capt_qty,
        v_trade_releas_qty,
        v_strike_capt_qty,
        v_strike_releas_qty,
        v_strike_frozen_qty,
        v_strike_unfroz_qty,
        v_realize_pandl,
        v_sum_realize_pandl,
        v_cost_amt,
        v_intrst_cost_amt,
        v_intrst_pandl,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.94.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询单条资产账户组合策略持仓表出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_init_date = v_init_date;
    SET p_stock_code = v_stock_code;
    SET p_exch_no = v_exch_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_curr_qty = v_curr_qty;
    SET p_comm_frozen_qty = v_comm_frozen_qty;
    SET p_comm_unfroz_qty = v_comm_unfroz_qty;
    SET p_comm_capt_qty = v_comm_capt_qty;
    SET p_comm_releas_qty = v_comm_releas_qty;
    SET p_trade_frozen_qty = v_trade_frozen_qty;
    SET p_trade_unfroz_qty = v_trade_unfroz_qty;
    SET p_trade_capt_qty = v_trade_capt_qty;
    SET p_trade_releas_qty = v_trade_releas_qty;
    SET p_strike_capt_qty = v_strike_capt_qty;
    SET p_strike_releas_qty = v_strike_releas_qty;
    SET p_strike_frozen_qty = v_strike_frozen_qty;
    SET p_strike_unfroz_qty = v_strike_unfroz_qty;
    SET p_realize_pandl = v_realize_pandl;
    SET p_sum_realize_pandl = v_sum_realize_pandl;
    SET p_cost_amt = v_cost_amt;
    SET p_intrst_cost_amt = v_intrst_cost_amt;
    SET p_intrst_pandl = v_intrst_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_账户_查询单条资产账户组合策略收益表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdseac_QuerySingleAsacStrategyIncome;;
DELIMITER ;;
CREATE PROCEDURE prt_tdseac_QuerySingleAsacStrategyIncome(
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
    IN p_combo_code varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_combo_cost decimal(18,4),
    OUT p_realize_pandl decimal(18,4),
    OUT p_sum_realize_pandl decimal(18,4),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_combo_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_combo_cost decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_combo_code = p_combo_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_combo_cost = 0;
    SET v_realize_pandl = 0;
    SET v_sum_realize_pandl = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_账户_查询单条资产账户组合策略收益表】*/
    call db_tdsecu.pra_tdseac_QuerySingleAsacStrategyIncome(
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
        v_combo_code,
        v_error_code,
        v_error_info,
        v_row_id,
        v_combo_cost,
        v_realize_pandl,
        v_sum_realize_pandl,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.2.95.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_查询单条资产账户组合策略收益表出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_combo_cost = v_combo_cost;
    SET p_realize_pandl = v_realize_pandl;
    SET p_sum_realize_pandl = v_sum_realize_pandl;
    SET p_update_times = v_update_times;

END;;


