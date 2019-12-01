DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_交易接口_检查账户状态获取可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_CheckStockAccoStatusAvail;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_CheckStockAccoStatusAvail(
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
    IN p_stock_code_no int,
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_crncy_type varchar(3),
    IN p_stock_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_exgp_avail_amt decimal(18,4),
    OUT p_asac_avail_amt decimal(18,4),
    OUT p_asac_T_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T_hk_sell_total_amt decimal(18,4),
    OUT p_asac_T1_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T1_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_T_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_avail_qty decimal(18,2),
    OUT p_exgp_target_code_avail_qty decimal(18,2),
    OUT p_exgp_trade_code_avail_qty decimal(18,2),
    OUT p_asac_avail_qty decimal(18,2),
    OUT p_asac_target_code_avail_qty decimal(18,2),
    OUT p_asac_trade_code_avail_qty decimal(18,2),
    OUT p_exgp_loan_sell_amt decimal(18,4),
    OUT p_asac_loan_sell_amt decimal(18,4),
    OUT p_exgp_debt_loan_sell_strike_qty decimal(18,2),
    OUT p_exgp_debt_fina_buy_strike_amt decimal(18,4),
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
    declare v_init_date int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_crncy_type varchar(3);
    declare v_stock_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);
    declare v_asac_T_hk_buy_total_amt decimal(18,4);
    declare v_asac_T_hk_sell_total_amt decimal(18,4);
    declare v_asac_T1_hk_buy_total_amt decimal(18,4);
    declare v_asac_T1_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_exgp_target_code_avail_qty decimal(18,2);
    declare v_exgp_trade_code_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_asac_target_code_avail_qty decimal(18,2);
    declare v_asac_trade_code_avail_qty decimal(18,2);
    declare v_exgp_loan_sell_amt decimal(18,4);
    declare v_asac_loan_sell_amt decimal(18,4);
    declare v_exgp_debt_loan_sell_strike_qty decimal(18,2);
    declare v_exgp_debt_fina_buy_strike_amt decimal(18,4);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_crncy_type = p_crncy_type;
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_exgp_avail_amt = 0;
    SET v_asac_avail_amt = 0;
    SET v_asac_T_hk_buy_total_amt = 0;
    SET v_asac_T_hk_sell_total_amt = 0;
    SET v_asac_T1_hk_buy_total_amt = 0;
    SET v_asac_T1_hk_sell_total_amt = 0;
    SET v_exgp_T_hk_buy_total_amt = 0;
    SET v_exgp_T_hk_sell_total_amt = 0;
    SET v_exgp_T1_hk_buy_total_amt = 0;
    SET v_exgp_T1_hk_sell_total_amt = 0;
    SET v_exgp_avail_qty = 0;
    SET v_exgp_target_code_avail_qty = 0;
    SET v_exgp_trade_code_avail_qty = 0;
    SET v_asac_avail_qty = 0;
    SET v_asac_target_code_avail_qty = 0;
    SET v_asac_trade_code_avail_qty = 0;
    SET v_exgp_loan_sell_amt = 0;
    SET v_asac_loan_sell_amt = 0;
    SET v_exgp_debt_loan_sell_strike_qty = 0;
    SET v_exgp_debt_fina_buy_strike_amt = 0;
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_交易接口_检查账户状态获取可用】*/
    call db_pdsecu.pra_pdseexif_CheckStockAccoStatusAvail(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_code_no,
        v_trade_code_no,
        v_target_code_no,
        v_stock_type,
        v_order_dir,
        v_order_qty,
        v_crncy_type,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_stock_acco_no,
        v_stock_acco,
        v_exgp_avail_amt,
        v_asac_avail_amt,
        v_asac_T_hk_buy_total_amt,
        v_asac_T_hk_sell_total_amt,
        v_asac_T1_hk_buy_total_amt,
        v_asac_T1_hk_sell_total_amt,
        v_exgp_T_hk_buy_total_amt,
        v_exgp_T_hk_sell_total_amt,
        v_exgp_T1_hk_buy_total_amt,
        v_exgp_T1_hk_sell_total_amt,
        v_exgp_avail_qty,
        v_exgp_target_code_avail_qty,
        v_exgp_trade_code_avail_qty,
        v_asac_avail_qty,
        v_asac_target_code_avail_qty,
        v_asac_trade_code_avail_qty,
        v_exgp_loan_sell_amt,
        v_asac_loan_sell_amt,
        v_exgp_debt_loan_sell_strike_qty,
        v_exgp_debt_fina_buy_strike_amt,
        v_record_count);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.6.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_交易接口_检查账户状态获取可用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_exgp_avail_amt = v_exgp_avail_amt;
    SET p_asac_avail_amt = v_asac_avail_amt;
    SET p_asac_T_hk_buy_total_amt = v_asac_T_hk_buy_total_amt;
    SET p_asac_T_hk_sell_total_amt = v_asac_T_hk_sell_total_amt;
    SET p_asac_T1_hk_buy_total_amt = v_asac_T1_hk_buy_total_amt;
    SET p_asac_T1_hk_sell_total_amt = v_asac_T1_hk_sell_total_amt;
    SET p_exgp_T_hk_buy_total_amt = v_exgp_T_hk_buy_total_amt;
    SET p_exgp_T_hk_sell_total_amt = v_exgp_T_hk_sell_total_amt;
    SET p_exgp_T1_hk_buy_total_amt = v_exgp_T1_hk_buy_total_amt;
    SET p_exgp_T1_hk_sell_total_amt = v_exgp_T1_hk_sell_total_amt;
    SET p_exgp_avail_qty = v_exgp_avail_qty;
    SET p_exgp_target_code_avail_qty = v_exgp_target_code_avail_qty;
    SET p_exgp_trade_code_avail_qty = v_exgp_trade_code_avail_qty;
    SET p_asac_avail_qty = v_asac_avail_qty;
    SET p_asac_target_code_avail_qty = v_asac_target_code_avail_qty;
    SET p_asac_trade_code_avail_qty = v_asac_trade_code_avail_qty;
    SET p_exgp_loan_sell_amt = v_exgp_loan_sell_amt;
    SET p_asac_loan_sell_amt = v_asac_loan_sell_amt;
    SET p_exgp_debt_loan_sell_strike_qty = v_exgp_debt_loan_sell_strike_qty;
    SET p_exgp_debt_fina_buy_strike_amt = v_exgp_debt_fina_buy_strike_amt;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_交易接口_检查账户状态获取批量可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_CheckStockAccoStatusBatchAvail;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_CheckStockAccoStatusBatchAvail(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no_str varchar(4096),
    IN p_trade_code_no_str varchar(4096),
    IN p_target_code_no_str varchar(4096),
    IN p_stock_type_str varchar(2048),
    IN p_order_dir_str varchar(1024),
    IN p_order_qty_str varchar(4096),
    IN p_crncy_type_str varchar(2048),
    IN p_registration_agency_str varchar(4096),
    IN p_split_str varchar(4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_acco_no_str varchar(4096),
    OUT p_stock_acco_str varchar(2048),
    OUT p_exgp_avail_amt decimal(18,4),
    OUT p_asac_avail_amt decimal(18,4),
    OUT p_asac_T_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T_hk_sell_total_amt decimal(18,4),
    OUT p_asac_T1_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T1_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_T_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_avail_qty_str varchar(4096),
    OUT p_exgp_target_code_avail_qty_str varchar(4096),
    OUT p_exgp_trade_code_avail_qty_str varchar(4096),
    OUT p_asac_avail_qty_str varchar(4096),
    OUT p_asac_target_code_avail_qty_str varchar(4096),
    OUT p_asac_trade_code_avail_qty_str varchar(4096),
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
    declare v_init_date int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no_str varchar(4096);
    declare v_trade_code_no_str varchar(4096);
    declare v_target_code_no_str varchar(4096);
    declare v_stock_type_str varchar(2048);
    declare v_order_dir_str varchar(1024);
    declare v_order_qty_str varchar(4096);
    declare v_crncy_type_str varchar(2048);
    declare v_registration_agency_str varchar(4096);
    declare v_split_str varchar(4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_no_str varchar(4096);
    declare v_stock_acco_str varchar(2048);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);
    declare v_asac_T_hk_buy_total_amt decimal(18,4);
    declare v_asac_T_hk_sell_total_amt decimal(18,4);
    declare v_asac_T1_hk_buy_total_amt decimal(18,4);
    declare v_asac_T1_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_exgp_avail_qty_str varchar(4096);
    declare v_exgp_target_code_avail_qty_str varchar(4096);
    declare v_exgp_trade_code_avail_qty_str varchar(4096);
    declare v_asac_avail_qty_str varchar(4096);
    declare v_asac_target_code_avail_qty_str varchar(4096);
    declare v_asac_trade_code_avail_qty_str varchar(4096);
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_trade_code_no_str = p_trade_code_no_str;
    SET v_target_code_no_str = p_target_code_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_qty_str = p_order_qty_str;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_registration_agency_str = p_registration_agency_str;
    SET v_split_str = p_split_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_no_str = " ";
    SET v_stock_acco_str = " ";
    SET v_exgp_avail_amt = 0;
    SET v_asac_avail_amt = 0;
    SET v_asac_T_hk_buy_total_amt = 0;
    SET v_asac_T_hk_sell_total_amt = 0;
    SET v_asac_T1_hk_buy_total_amt = 0;
    SET v_asac_T1_hk_sell_total_amt = 0;
    SET v_exgp_T_hk_buy_total_amt = 0;
    SET v_exgp_T_hk_sell_total_amt = 0;
    SET v_exgp_T1_hk_buy_total_amt = 0;
    SET v_exgp_T1_hk_sell_total_amt = 0;
    SET v_exgp_avail_qty_str = " ";
    SET v_exgp_target_code_avail_qty_str = " ";
    SET v_exgp_trade_code_avail_qty_str = " ";
    SET v_asac_avail_qty_str = " ";
    SET v_asac_target_code_avail_qty_str = " ";
    SET v_asac_trade_code_avail_qty_str = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_交易接口_检查账户状态获取批量可用】*/
    call db_pdsecu.pra_pdseexif_CheckStockAccoStatusBatchAvail(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no_str,
        v_stock_code_no_str,
        v_trade_code_no_str,
        v_target_code_no_str,
        v_stock_type_str,
        v_order_dir_str,
        v_order_qty_str,
        v_crncy_type_str,
        v_registration_agency_str,
        v_split_str,
        v_error_code,
        v_error_info,
        v_stock_acco_no_str,
        v_stock_acco_str,
        v_exgp_avail_amt,
        v_asac_avail_amt,
        v_asac_T_hk_buy_total_amt,
        v_asac_T_hk_sell_total_amt,
        v_asac_T1_hk_buy_total_amt,
        v_asac_T1_hk_sell_total_amt,
        v_exgp_T_hk_buy_total_amt,
        v_exgp_T_hk_sell_total_amt,
        v_exgp_T1_hk_buy_total_amt,
        v_exgp_T1_hk_sell_total_amt,
        v_exgp_avail_qty_str,
        v_exgp_target_code_avail_qty_str,
        v_exgp_trade_code_avail_qty_str,
        v_asac_avail_qty_str,
        v_asac_target_code_avail_qty_str,
        v_asac_trade_code_avail_qty_str,
        v_record_count);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.6.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_交易接口_检查账户状态获取批量可用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_acco_no_str = v_stock_acco_no_str;
    SET p_stock_acco_str = v_stock_acco_str;
    SET p_exgp_avail_amt = v_exgp_avail_amt;
    SET p_asac_avail_amt = v_asac_avail_amt;
    SET p_asac_T_hk_buy_total_amt = v_asac_T_hk_buy_total_amt;
    SET p_asac_T_hk_sell_total_amt = v_asac_T_hk_sell_total_amt;
    SET p_asac_T1_hk_buy_total_amt = v_asac_T1_hk_buy_total_amt;
    SET p_asac_T1_hk_sell_total_amt = v_asac_T1_hk_sell_total_amt;
    SET p_exgp_T_hk_buy_total_amt = v_exgp_T_hk_buy_total_amt;
    SET p_exgp_T_hk_sell_total_amt = v_exgp_T_hk_sell_total_amt;
    SET p_exgp_T1_hk_buy_total_amt = v_exgp_T1_hk_buy_total_amt;
    SET p_exgp_T1_hk_sell_total_amt = v_exgp_T1_hk_sell_total_amt;
    SET p_exgp_avail_qty_str = v_exgp_avail_qty_str;
    SET p_exgp_target_code_avail_qty_str = v_exgp_target_code_avail_qty_str;
    SET p_exgp_trade_code_avail_qty_str = v_exgp_trade_code_avail_qty_str;
    SET p_asac_avail_qty_str = v_asac_avail_qty_str;
    SET p_asac_target_code_avail_qty_str = v_asac_target_code_avail_qty_str;
    SET p_asac_trade_code_avail_qty_str = v_asac_trade_code_avail_qty_str;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_交易接口_获取成交回报证券持仓成本
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_GetStrikeRspPosiCost;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_GetStrikeRspPosiCost(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_curr_qty decimal(18,2)
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
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_curr_qty decimal(18,2);
    declare v_stock_acco_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_cost_amt = 0;
    SET v_exgp_intrst_cost_amt = 0;
    SET v_exgp_curr_qty = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_curr_qty = 0;
    SET v_stock_acco_no = 0;

    
    label_pro:BEGIN
    

    /* set @股东代码编号# = 0; */
    set v_stock_acco_no = 0;

    /* 调用【原子_产品证券_交易接口_获取成交回报证券持仓成本】*/
    call db_pdsecu.pra_pdseexif_GetStrikeRspPosiCost(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_code_no,
        v_stock_type,
        v_order_dir,
        v_stock_acco_no,
        v_error_code,
        v_error_info,
        v_exgp_cost_amt,
        v_exgp_intrst_cost_amt,
        v_exgp_curr_qty,
        v_asac_cost_amt,
        v_asac_intrst_cost_amt,
        v_asac_curr_qty);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.6.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_交易接口_获取成交回报证券持仓成本出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_curr_qty = v_asac_curr_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_交易接口_检查股东账户状态获取持仓成本
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_CheckStockAccoStatusGetPosiCost;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_CheckStockAccoStatusGetPosiCost(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_curr_qty decimal(18,2)
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
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_curr_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_exgp_cost_amt = 0;
    SET v_exgp_intrst_cost_amt = 0;
    SET v_exgp_curr_qty = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_curr_qty = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_公共接口_检查股东账户状态】*/
    call db_pdsecu.pra_pdsepubif_CheckStockAccoStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_type,
        v_order_dir,
        v_error_code,
        v_error_info,
        v_stock_acco_no,
        v_stock_acco);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.6.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_检查股东账户状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_产品证券_交易接口_获取成交回报证券持仓成本】*/
    call db_pdsecu.pra_pdseexif_GetStrikeRspPosiCost(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_code_no,
        v_stock_type,
        v_order_dir,
        v_stock_acco_no,
        v_error_code,
        v_error_info,
        v_exgp_cost_amt,
        v_exgp_intrst_cost_amt,
        v_exgp_curr_qty,
        v_asac_cost_amt,
        v_asac_intrst_cost_amt,
        v_asac_curr_qty);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.6.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_交易接口_获取成交回报证券持仓成本出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_curr_qty = v_asac_curr_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_交易接口_获取T0有权限交易组总可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_GetT0AuthExgpSumCashAvail;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_GetT0AuthExgpSumCashAvail(
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
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_avail_amt decimal(18,4)
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
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_avail_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_avail_amt = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_交易接口_获取T0有权限交易组总可用】*/
    call db_pdsecu.pra_pdseexif_GetT0AuthExgpSumCashAvail(
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
        v_crncy_type,
        v_asset_acco_no,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info,
        v_exgp_avail_amt);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.6.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_交易接口_获取T0有权限交易组总可用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_avail_amt = v_exgp_avail_amt;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_交易接口_更新交易持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_UpdateTrdPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_UpdateTrdPosi(
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
    IN p_posi_qty decimal(18,2),
    IN p_cost_amt decimal(18,4),
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_posi_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_status varchar(2);
    declare v_registration_agency varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_posi_qty = p_posi_qty;
    SET v_cost_amt = p_cost_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_status = "0";
    SET v_registration_agency = " ";

    
    label_pro:BEGIN
    

    /* set @股东代码状态# = 0; */
    set v_stock_acco_status = 0;

    /* set @登记机构#= " "; */
    set v_registration_agency= " ";

    /* 调用【原子_产品证券_账户_检查证券账户状态】*/
    call db_pdsecu.pra_pdseac_CheckSecuAccoStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco_no,
        v_stock_acco_no,
        v_stock_acco_status,
        v_registration_agency,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.6.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_账户_检查证券账户状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_持仓_更新交易持仓】*/
        call db_pdsecu.pra_pdsepo_UpdateTrdPosi(
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
            v_posi_qty,
            v_cost_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.6.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_持仓_更新交易持仓出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_交易接口_更新交易库交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_UpdateTrdExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_UpdateTrdExgpPosi(
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
    IN p_posi_qty decimal(18,2),
    IN p_cost_amt decimal(18,4),
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
    declare v_posi_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_status varchar(2);
    declare v_registration_agency varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_posi_qty = p_posi_qty;
    SET v_cost_amt = p_cost_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_status = "0";
    SET v_registration_agency = " ";

    
    label_pro:BEGIN
    

    /* set @股东代码状态# = 0; */
    set v_stock_acco_status = 0;

    /* set @登记机构#=" "; */
    set v_registration_agency=" ";

    /* 调用【原子_产品证券_账户_检查证券账户状态】*/
    call db_pdsecu.pra_pdseac_CheckSecuAccoStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco_no,
        v_stock_acco_no,
        v_stock_acco_status,
        v_registration_agency,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.6.7.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_账户_检查证券账户状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_持仓_更新交易库交易组持仓】*/
        call db_pdsecu.pra_pdsepo_UpdateTrdExgpPosi(
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
            v_posi_qty,
            v_cost_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.6.7.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_持仓_更新交易库交易组持仓出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_交易接口_更新交易资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_UpdateTrdCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_UpdateTrdCapital(
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
    IN p_shsz_avail_amt decimal(18,4),
    IN p_hk_avail_amt decimal(18,4),
    IN p_static_avail_amt decimal(18,4),
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
    declare v_shsz_avail_amt decimal(18,4);
    declare v_hk_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);
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
    SET v_shsz_avail_amt = p_shsz_avail_amt;
    SET v_hk_avail_amt = p_hk_avail_amt;
    SET v_static_avail_amt = p_static_avail_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_更新交易资金】*/
        call db_pdsecu.pra_pdseca_UpdateTrdCapital(
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
            v_shsz_avail_amt,
            v_hk_avail_amt,
            v_static_avail_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.6.8.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_更新交易资金出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_交易接口_更新交易库交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_UpdateTrdExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_UpdateTrdExgpCapital(
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
    IN p_shsz_avail_amt decimal(18,4),
    IN p_hk_avail_amt decimal(18,4),
    IN p_static_avail_amt decimal(18,4),
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
    declare v_shsz_avail_amt decimal(18,4);
    declare v_hk_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);
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
    SET v_shsz_avail_amt = p_shsz_avail_amt;
    SET v_hk_avail_amt = p_hk_avail_amt;
    SET v_static_avail_amt = p_static_avail_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_更新交易库交易组资金】*/
        call db_pdsecu.pra_pdseca_UpdateTrdExgpCapital(
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
            v_shsz_avail_amt,
            v_hk_avail_amt,
            v_static_avail_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.6.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_更新交易库交易组资金出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_交易接口_插入组合信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_InsertCombInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_InsertCombInfo(
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
    IN p_posi_qty decimal(18,2),
    IN p_deal_status varchar(2),
    IN p_combo_status varchar(2),
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
    declare v_stock_code_no int;
    declare v_posi_qty decimal(18,2);
    declare v_deal_status varchar(2);
    declare v_combo_status varchar(2);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_posi_qty = p_posi_qty;
    SET v_deal_status = p_deal_status;
    SET v_combo_status = p_combo_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_交易接口_插入组合信息】*/
        call db_pdsecu.pra_pdseexif_InsertCombInfo(
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
            v_posi_qty,
            v_deal_status,
            v_combo_status,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.6.10.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_交易接口_插入组合信息出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_交易接口_更新组合信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_UpdateCombInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_UpdateCombInfo(
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
    IN p_posi_qty decimal(18,2),
    IN p_deal_status varchar(2),
    IN p_combo_status varchar(2),
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
    declare v_stock_code_no int;
    declare v_posi_qty decimal(18,2);
    declare v_deal_status varchar(2);
    declare v_combo_status varchar(2);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_posi_qty = p_posi_qty;
    SET v_deal_status = p_deal_status;
    SET v_combo_status = p_combo_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_交易接口_更新组合信息】*/
        call db_pdsecu.pra_pdseexif_UpdateCombInfo(
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
            v_posi_qty,
            v_deal_status,
            v_combo_status,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.6.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_交易接口_更新组合信息出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_交易接口_获取组合信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_GetCombInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_GetCombInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    IN p_exch_group_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_combo_code varchar(32),
    OUT p_stock_code_no int,
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
    declare v_query_row_id bigint;
    declare v_exch_group_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_combo_code varchar(32);
    declare v_stock_code_no int;
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
    SET v_query_row_id = p_query_row_id;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_combo_code = " ";
    SET v_stock_code_no = 0;
    SET v_posi_qty = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_交易接口_获取组合信息】*/
        call db_pdsecu.pra_pdseexif_GetCombInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_query_row_id,
            v_exch_group_no_str,
            v_error_code,
            v_error_info,
            v_row_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_combo_code,
            v_stock_code_no,
            v_posi_qty);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.6.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_交易接口_获取组合信息出现错误！',v_mysql_message);
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
    SET p_combo_code = v_combo_code;
    SET p_stock_code_no = v_stock_code_no;
    SET p_posi_qty = v_posi_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_交易接口_处理失效组合交易组资金持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_DealInvalidCombExgpCapitPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_DealInvalidCombExgpCapitPosi(
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
    IN p_default_exch_group_no int,
    IN p_combo_code varchar(32),
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
    declare v_default_exch_group_no int;
    declare v_combo_code varchar(32);
    declare v_menu_no int;
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
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_combo_code = p_combo_code;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_交易接口_转移失效组合交易组资金】*/
        call db_pdsecu.pra_pdseexif_TransferInvalidCombExgpCapit(
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
            v_default_exch_group_no,
            v_combo_code,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.6.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_交易接口_转移失效组合交易组资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_产品证券_交易接口_转移失效组合交易组持仓】*/
        call db_pdsecu.pra_pdseexif_TransferInvalidCombExgpPosi(
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
            v_default_exch_group_no,
            v_combo_code,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.6.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_交易接口_转移失效组合交易组持仓出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_交易接口_查询交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_QueryExgpCapit;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_QueryExgpCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_default_exch_group_no int,
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
    declare v_default_exch_group_no int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_交易接口_查询交易组资金】*/
        call db_pdsecu.pra_pdseexif_QueryExgpCapit(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_group_no,
            v_default_exch_group_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.6.14.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_交易接口_查询交易组资金出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_交易接口_查询交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_QueryExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_QueryExgpPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_default_exch_group_no int,
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
    declare v_exch_group_no int;
    declare v_default_exch_group_no int;
    declare v_stock_code_no int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_交易接口_查询交易组持仓】*/
        call db_pdsecu.pra_pdseexif_QueryExgpPosi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_group_no,
            v_default_exch_group_no,
            v_stock_code_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.6.15.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_交易接口_查询交易组持仓出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_交易接口_更新持仓数量成本
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_UpdateExgpPosiQtyCost;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_UpdateExgpPosiQtyCost(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_occur_qty decimal(18,2),
    IN p_occur_cost_amt decimal(18,4),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_posi_id bigint,
    OUT p_exch_group_stock_type int,
    OUT p_exch_group_asset_type int,
    OUT p_exgp_invest_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_pre_settle_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_posi_qty_check_diff decimal(18,2),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_intrst_pandl decimal(18,4),
    OUT p_update_times int,
    OUT p_asac_posi_id bigint,
    OUT p_asac_stock_type int,
    OUT p_asac_asset_type int,
    OUT p_asac_invest_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_pre_settle_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_posi_qty_check_diff decimal(18,2),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_intrst_pandl decimal(18,4),
    OUT p_asac_update_times int
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_cost_amt decimal(18,4);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exch_group_stock_type int;
    declare v_exch_group_asset_type int;
    declare v_exgp_invest_type int;
    declare v_exch_group_begin_qty decimal(18,2);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_exgp_pre_settle_qty decimal(18,2);
    declare v_exgp_frozen_qty decimal(18,2);
    declare v_exgp_unfroz_qty decimal(18,2);
    declare v_exgp_posi_qty_check_diff decimal(18,2);
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_intrst_pandl decimal(18,4);
    declare v_update_times int;
    declare v_asac_posi_id bigint;
    declare v_asac_stock_type int;
    declare v_asac_asset_type int;
    declare v_asac_invest_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_pre_settle_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_posi_qty_check_diff decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_asac_update_times int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_occur_qty = p_occur_qty;
    SET v_occur_cost_amt = p_occur_cost_amt;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exch_group_stock_type = 0;
    SET v_exch_group_asset_type = 0;
    SET v_exgp_invest_type = 0;
    SET v_exch_group_begin_qty = 0;
    SET v_exgp_curr_qty = 0;
    SET v_exgp_pre_settle_qty = 0;
    SET v_exgp_frozen_qty = 0;
    SET v_exgp_unfroz_qty = 0;
    SET v_exgp_posi_qty_check_diff = 0;
    SET v_exgp_cost_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exgp_intrst_cost_amt = 0;
    SET v_exgp_intrst_pandl = 0;
    SET v_update_times = 1;
    SET v_asac_posi_id = 0;
    SET v_asac_stock_type = 0;
    SET v_asac_asset_type = 0;
    SET v_asac_invest_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_pre_settle_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_posi_qty_check_diff = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_asac_update_times = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_交易接口_更新持仓数量成本】*/
        call db_pdsecu.pra_pdseexif_UpdateExgpPosiQtyCost(
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
            v_stock_code_no,
            v_exch_no,
            v_occur_qty,
            v_occur_cost_amt,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_exgp_posi_id,
            v_exch_group_stock_type,
            v_exch_group_asset_type,
            v_exgp_invest_type,
            v_exch_group_begin_qty,
            v_exgp_curr_qty,
            v_exgp_pre_settle_qty,
            v_exgp_frozen_qty,
            v_exgp_unfroz_qty,
            v_exgp_posi_qty_check_diff,
            v_exgp_cost_amt,
            v_exgp_realize_pandl,
            v_exgp_intrst_cost_amt,
            v_exgp_intrst_pandl,
            v_update_times,
            v_asac_posi_id,
            v_asac_stock_type,
            v_asac_asset_type,
            v_asac_invest_type,
            v_asac_begin_qty,
            v_asac_curr_qty,
            v_asac_pre_settle_qty,
            v_asac_frozen_qty,
            v_asac_unfroz_qty,
            v_asac_posi_qty_check_diff,
            v_asac_cost_amt,
            v_asac_realize_pandl,
            v_asac_intrst_cost_amt,
            v_asac_intrst_pandl,
            v_asac_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.6.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_交易接口_更新持仓数量成本出现错误！',v_mysql_message);
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
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exch_group_stock_type = v_exch_group_stock_type;
    SET p_exch_group_asset_type = v_exch_group_asset_type;
    SET p_exgp_invest_type = v_exgp_invest_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_pre_settle_qty = v_exgp_pre_settle_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_posi_qty_check_diff = v_exgp_posi_qty_check_diff;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_intrst_pandl = v_exgp_intrst_pandl;
    SET p_update_times = v_update_times;
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_stock_type = v_asac_stock_type;
    SET p_asac_asset_type = v_asac_asset_type;
    SET p_asac_invest_type = v_asac_invest_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_pre_settle_qty = v_asac_pre_settle_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_posi_qty_check_diff = v_asac_posi_qty_check_diff;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_intrst_pandl = v_asac_intrst_pandl;
    SET p_asac_update_times = v_asac_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_交易接口_更新交易库资产账户债券质押
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_UpdateTrdAsacBondPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_UpdateTrdAsacBondPosi(
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
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_posi_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_status varchar(2);
    declare v_registration_agency varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_posi_qty = p_posi_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_status = "0";
    SET v_registration_agency = " ";

    
    label_pro:BEGIN
    

    /* set @股东代码状态# = 0; */
    set v_stock_acco_status = 0;

    /* set @登记机构#=" "; */
    set v_registration_agency=" ";

    /* 调用【原子_产品证券_账户_检查证券账户状态】*/
    call db_pdsecu.pra_pdseac_CheckSecuAccoStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco_no,
        v_stock_acco_no,
        v_stock_acco_status,
        v_registration_agency,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.6.17.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_账户_检查证券账户状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_持仓_更新交易库资产账户债券质押】*/
        call db_pdsecu.pra_pdsepo_UpdateTrdAsacBondPosi(
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
            v_posi_qty,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.6.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_持仓_更新交易库资产账户债券质押出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_交易接口_更新交易库交易组债券质押
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_UpdateTrdExgpBondPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_UpdateTrdExgpBondPosi(
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
    declare v_stock_code_no int;
    declare v_posi_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_status varchar(2);
    declare v_registration_agency varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_posi_qty = p_posi_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_status = "0";
    SET v_registration_agency = " ";

    
    label_pro:BEGIN
    

    /* set @股东代码状态# = 0; */
    set v_stock_acco_status = 0;

    /* set @登记机构#= " "; */
    set v_registration_agency= " ";

    /* 调用【原子_产品证券_账户_检查证券账户状态】*/
    call db_pdsecu.pra_pdseac_CheckSecuAccoStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco_no,
        v_stock_acco_no,
        v_stock_acco_status,
        v_registration_agency,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.6.18.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_账户_检查证券账户状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_持仓_更新交易库交易组债券质押】*/
        call db_pdsecu.pra_pdsepo_UpdateTrdExgpBondPosi(
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
            v_posi_qty,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.6.18.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_持仓_更新交易库交易组债券质押出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_交易接口_交易组持仓变动
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepo_ExgpPosiChange;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepo_ExgpPosiChange(
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
    IN p_target_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_occur_qty decimal(18,2),
    IN p_occur_cost_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
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
    declare v_target_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_cost_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_status varchar(2);
    declare v_registration_agency varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_target_exch_group_no = p_target_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_occur_cost_amt = p_occur_cost_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_status = "0";
    SET v_registration_agency = " ";

    
    label_pro:BEGIN
    

    /* set @股东代码状态# = 0; */
    set v_stock_acco_status = 0;

    /* set @登记机构#= " "; */
    set v_registration_agency= " ";

    /* 调用【原子_产品证券_账户_检查证券账户状态】*/
    call db_pdsecu.pra_pdseac_CheckSecuAccoStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco_no,
        v_stock_acco_no,
        v_stock_acco_status,
        v_registration_agency,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.6.19.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_账户_检查证券账户状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_交易接口_交易组持仓变动】*/
        call db_pdsecu.pra_pdsepo_ExgpPosiChange(
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
            v_target_exch_group_no,
            v_asset_acco_no,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_occur_qty,
            v_occur_cost_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.6.19.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_交易接口_交易组持仓变动出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_交易接口_补单获取交易组编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepo_MissOrderGetExgpNum;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepo_MissOrderGetExgpNum(
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
    OUT p_exch_group_no int
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_交易接口_补单获取交易组编号】*/
        call db_pdsecu.pra_pdsepo_MissOrderGetExgpNum(
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
            v_exch_group_no);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.6.20.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_交易接口_补单获取交易组编号出现错误！',v_mysql_message);
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
    SET p_exch_group_no = v_exch_group_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_交易接口_获取股东代码
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_GetStockAcco;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_GetStockAcco(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_no int,
    OUT p_stock_acco varchar(16)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_no = 0;
    SET v_stock_acco = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_公共接口_获取股东代码】*/
        call db_pdsecu.pra_pdsepubif_GetStockAcco(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_asset_acco_no,
            v_stock_acco_no,
            v_error_code,
            v_error_info,
            v_exch_no,
            v_stock_acco);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.6.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_获取股东代码出现错误！',v_mysql_message);
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
    SET p_exch_no = v_exch_no;
    SET p_stock_acco = v_stock_acco;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_交易接口_检查账户状态获取资金可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseexif_CheckStockAccoStatusCapitalAvail;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseexif_CheckStockAccoStatusCapitalAvail(
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
    IN p_order_dir int,
    IN p_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_avail_amt decimal(18,4),
    OUT p_asac_avail_amt decimal(18,4),
    OUT p_asac_T_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T_hk_sell_total_amt decimal(18,4),
    OUT p_asac_T1_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T1_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_T_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_loan_sell_amt decimal(18,4),
    OUT p_asac_loan_sell_amt decimal(18,4),
    OUT p_exgp_debt_fina_buy_strike_amt decimal(18,4),
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
    declare v_init_date int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_order_dir int;
    declare v_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);
    declare v_asac_T_hk_buy_total_amt decimal(18,4);
    declare v_asac_T_hk_sell_total_amt decimal(18,4);
    declare v_asac_T1_hk_buy_total_amt decimal(18,4);
    declare v_asac_T1_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_exgp_loan_sell_amt decimal(18,4);
    declare v_asac_loan_sell_amt decimal(18,4);
    declare v_exgp_debt_fina_buy_strike_amt decimal(18,4);
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
    SET v_order_dir = p_order_dir;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_avail_amt = 0;
    SET v_asac_avail_amt = 0;
    SET v_asac_T_hk_buy_total_amt = 0;
    SET v_asac_T_hk_sell_total_amt = 0;
    SET v_asac_T1_hk_buy_total_amt = 0;
    SET v_asac_T1_hk_sell_total_amt = 0;
    SET v_exgp_T_hk_buy_total_amt = 0;
    SET v_exgp_T_hk_sell_total_amt = 0;
    SET v_exgp_T1_hk_buy_total_amt = 0;
    SET v_exgp_T1_hk_sell_total_amt = 0;
    SET v_exgp_loan_sell_amt = 0;
    SET v_asac_loan_sell_amt = 0;
    SET v_exgp_debt_fina_buy_strike_amt = 0;
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_交易接口_检查账户状态获取资金可用】*/
    call db_pdsecu.pra_pdseexif_CheckStockAccoStatusCapitalAvail(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_exch_group_no,
        v_asset_acco_no,
        v_order_dir,
        v_crncy_type,
        v_error_code,
        v_error_info,
        v_exgp_avail_amt,
        v_asac_avail_amt,
        v_asac_T_hk_buy_total_amt,
        v_asac_T_hk_sell_total_amt,
        v_asac_T1_hk_buy_total_amt,
        v_asac_T1_hk_sell_total_amt,
        v_exgp_T_hk_buy_total_amt,
        v_exgp_T_hk_sell_total_amt,
        v_exgp_T1_hk_buy_total_amt,
        v_exgp_T1_hk_sell_total_amt,
        v_exgp_loan_sell_amt,
        v_asac_loan_sell_amt,
        v_exgp_debt_fina_buy_strike_amt);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.6.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_交易接口_检查账户状态获取资金可用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_avail_amt = v_exgp_avail_amt;
    SET p_asac_avail_amt = v_asac_avail_amt;
    SET p_asac_T_hk_buy_total_amt = v_asac_T_hk_buy_total_amt;
    SET p_asac_T_hk_sell_total_amt = v_asac_T_hk_sell_total_amt;
    SET p_asac_T1_hk_buy_total_amt = v_asac_T1_hk_buy_total_amt;
    SET p_asac_T1_hk_sell_total_amt = v_asac_T1_hk_sell_total_amt;
    SET p_exgp_T_hk_buy_total_amt = v_exgp_T_hk_buy_total_amt;
    SET p_exgp_T_hk_sell_total_amt = v_exgp_T_hk_sell_total_amt;
    SET p_exgp_T1_hk_buy_total_amt = v_exgp_T1_hk_buy_total_amt;
    SET p_exgp_T1_hk_sell_total_amt = v_exgp_T1_hk_sell_total_amt;
    SET p_exgp_loan_sell_amt = v_exgp_loan_sell_amt;
    SET p_asac_loan_sell_amt = v_asac_loan_sell_amt;
    SET p_exgp_debt_fina_buy_strike_amt = v_exgp_debt_fina_buy_strike_amt;
    SET p_record_count = v_record_count;

END;;


