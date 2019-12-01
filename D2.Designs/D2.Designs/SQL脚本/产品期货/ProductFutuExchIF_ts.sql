DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_交易接口_检查账户状态获取可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfuexif_CheckStockAccoStatusAvail;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfuexif_CheckStockAccoStatusAvail(
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
    IN p_contrc_code_no int,
    IN p_hedge_type int,
    IN p_comb_code varchar(6),
    IN p_contrc_type int,
    IN p_contrc_dir int,
    IN p_order_dir int,
    IN p_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_futu_acco_no int,
    OUT p_futu_acco varchar(16),
    OUT p_exgp_avail_amt decimal(18,4),
    OUT p_asac_avail_amt decimal(18,4),
    OUT p_exgp_avail_qty decimal(18,2),
    OUT p_asac_avail_qty decimal(18,2),
    OUT p_exgp_long_rece_margin decimal(18,4),
    OUT p_exgp_short_rece_margin decimal(18,4),
    OUT p_asac_long_rece_margin decimal(18,4),
    OUT p_asac_short_rece_margin decimal(18,4),
    OUT p_exgp_long_stock_rece_margin decimal(18,4),
    OUT p_exgp_short_stock_rece_margin decimal(18,4)
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
    declare v_contrc_code_no int;
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_contrc_type int;
    declare v_contrc_dir int;
    declare v_order_dir int;
    declare v_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_futu_acco_no int;
    declare v_futu_acco varchar(16);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_exgp_long_rece_margin decimal(18,4);
    declare v_exgp_short_rece_margin decimal(18,4);
    declare v_asac_long_rece_margin decimal(18,4);
    declare v_asac_short_rece_margin decimal(18,4);
    declare v_exgp_long_stock_rece_margin decimal(18,4);
    declare v_exgp_short_stock_rece_margin decimal(18,4);

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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_hedge_type = p_hedge_type;
    SET v_comb_code = p_comb_code;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_dir = p_contrc_dir;
    SET v_order_dir = p_order_dir;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_futu_acco_no = 0;
    SET v_futu_acco = " ";
    SET v_exgp_avail_amt = 0;
    SET v_asac_avail_amt = 0;
    SET v_exgp_avail_qty = 0;
    SET v_asac_avail_qty = 0;
    SET v_exgp_long_rece_margin = 0;
    SET v_exgp_short_rece_margin = 0;
    SET v_asac_long_rece_margin = 0;
    SET v_asac_short_rece_margin = 0;
    SET v_exgp_long_stock_rece_margin = 0;
    SET v_exgp_short_stock_rece_margin = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品期货_交易接口_检查账户状态获取可用】*/
    call db_pdfutu.pra_pdfuexif_CheckStockAccoStatusAvail(
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
        v_contrc_code_no,
        v_hedge_type,
        v_comb_code,
        v_contrc_type,
        v_contrc_dir,
        v_order_dir,
        v_crncy_type,
        v_error_code,
        v_error_info,
        v_futu_acco_no,
        v_futu_acco,
        v_exgp_avail_amt,
        v_asac_avail_amt,
        v_exgp_avail_qty,
        v_asac_avail_qty,
        v_exgp_long_rece_margin,
        v_exgp_short_rece_margin,
        v_asac_long_rece_margin,
        v_asac_short_rece_margin,
        v_exgp_long_stock_rece_margin,
        v_exgp_short_stock_rece_margin);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.6.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_交易接口_检查账户状态获取可用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_futu_acco = v_futu_acco;
    SET p_exgp_avail_amt = v_exgp_avail_amt;
    SET p_asac_avail_amt = v_asac_avail_amt;
    SET p_exgp_avail_qty = v_exgp_avail_qty;
    SET p_asac_avail_qty = v_asac_avail_qty;
    SET p_exgp_long_rece_margin = v_exgp_long_rece_margin;
    SET p_exgp_short_rece_margin = v_exgp_short_rece_margin;
    SET p_asac_long_rece_margin = v_asac_long_rece_margin;
    SET p_asac_short_rece_margin = v_asac_short_rece_margin;
    SET p_exgp_long_stock_rece_margin = v_exgp_long_stock_rece_margin;
    SET p_exgp_short_stock_rece_margin = v_exgp_short_stock_rece_margin;

END;;


