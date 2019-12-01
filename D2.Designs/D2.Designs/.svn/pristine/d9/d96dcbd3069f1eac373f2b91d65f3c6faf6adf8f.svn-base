DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_计算_获取行情信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rksecc_GetStockInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rksecc_GetStockInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_last_price decimal(16,9),
    OUT p_pre_close_price decimal(16,9),
    OUT p_today_open_price decimal(16,9),
    OUT p_total_stock_issue decimal(18,2),
    OUT p_circl_stock_capit decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_stock_type int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_last_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_today_open_price decimal(16,9);
    declare v_total_stock_issue decimal(18,2);
    declare v_circl_stock_capit decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_stock_type int;

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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_last_price = 0;
    SET v_pre_close_price = 0;
    SET v_today_open_price = 0;
    SET v_total_stock_issue = 0;
    SET v_circl_stock_capit = 0;
    SET v_strike_amt = 0;
    SET v_stock_type = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_风控证券_计算_获取证券信息】*/
    call db_rksecu.pra_rksecc_GetStockInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_total_stock_issue,
        v_circl_stock_capit,
        v_stock_type,
        v_last_price,
        v_pre_close_price,
        v_today_open_price,
        v_strike_amt);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.2.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取证券信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_last_price = v_last_price;
    SET p_pre_close_price = v_pre_close_price;
    SET p_today_open_price = v_today_open_price;
    SET p_total_stock_issue = v_total_stock_issue;
    SET p_circl_stock_capit = v_circl_stock_capit;
    SET p_strike_amt = v_strike_amt;
    SET p_stock_type = v_stock_type;

END;;


