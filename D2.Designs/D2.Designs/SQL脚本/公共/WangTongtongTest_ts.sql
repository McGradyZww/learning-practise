DELIMITER ;;
use db_pub;;

# 事务_公共_王彤彤测试_新增增删改查表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_wtttest_add;;
DELIMITER ;;
CREATE PROCEDURE prt_wtttest_add(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_wanttt_id int,
    IN p_wanttt_name varchar(255),
    IN p_wangtt_stock_code_no int,
    IN p_wanttt_asset_no int,
    IN p_wanttt_buy_stock_qty int,
    IN p_wanttt_sale_stock_qty int,
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
    declare v_wanttt_id int;
    declare v_wanttt_name varchar(255);
    declare v_wangtt_stock_code_no int;
    declare v_wanttt_asset_no int;
    declare v_wanttt_buy_stock_qty int;
    declare v_wanttt_sale_stock_qty int;
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
    SET v_wanttt_id = p_wanttt_id;
    SET v_wanttt_name = p_wanttt_name;
    SET v_wangtt_stock_code_no = p_wangtt_stock_code_no;
    SET v_wanttt_asset_no = p_wanttt_asset_no;
    SET v_wanttt_buy_stock_qty = p_wanttt_buy_stock_qty;
    SET v_wanttt_sale_stock_qty = p_wanttt_sale_stock_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_王彤彤测试_新增增删改查表】*/
        call db_pub.pra_wtttest_add(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_wanttt_id,
            v_wanttt_name,
            v_wangtt_stock_code_no,
            v_wanttt_asset_no,
            v_wanttt_buy_stock_qty,
            v_wanttt_sale_stock_qty,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.31.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_王彤彤测试_新增增删改查表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_王彤彤测试_删除增删改查表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_wtttest_dele;;
DELIMITER ;;
CREATE PROCEDURE prt_wtttest_dele(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_wanttt_id int,
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
    declare v_wanttt_id int;
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
    SET v_wanttt_id = p_wanttt_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_王彤彤测试_删除增删改查表】*/
        call db_pub.pra_wtttest_dele(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_wanttt_id,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.31.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_王彤彤测试_删除增删改查表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_王彤彤测试_更改增删改查表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_wtttest_Modify;;
DELIMITER ;;
CREATE PROCEDURE prt_wtttest_Modify(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_wanttt_id int,
    IN p_wanttt_name varchar(255),
    IN p_wangtt_stock_code_no int,
    IN p_wanttt_asset_no int,
    IN p_wanttt_buy_stock_qty int,
    IN p_wanttt_sale_stock_qty int,
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
    declare v_wanttt_id int;
    declare v_wanttt_name varchar(255);
    declare v_wangtt_stock_code_no int;
    declare v_wanttt_asset_no int;
    declare v_wanttt_buy_stock_qty int;
    declare v_wanttt_sale_stock_qty int;
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
    SET v_wanttt_id = p_wanttt_id;
    SET v_wanttt_name = p_wanttt_name;
    SET v_wangtt_stock_code_no = p_wangtt_stock_code_no;
    SET v_wanttt_asset_no = p_wanttt_asset_no;
    SET v_wanttt_buy_stock_qty = p_wanttt_buy_stock_qty;
    SET v_wanttt_sale_stock_qty = p_wanttt_sale_stock_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


       /* 调用【原子_公共_王彤彤测试_更改增删改查表】*/
       call db_pub.pra_wtttest_Modify(
           v_opor_co_no,
           v_opor_no,
           v_oper_mac,
           v_oper_ip_addr,
           v_oper_info,
           v_oper_way,
           v_func_code,
           v_wanttt_id,
           v_wanttt_name,
           v_wangtt_stock_code_no,
           v_wanttt_asset_no,
           v_wanttt_sale_stock_qty,
           v_wanttt_buy_stock_qty,
           v_error_code,
           v_error_info);
       if v_error_code = "1" then
           SET v_error_code = "pubT.31.3.999";
           if v_mysql_message <> "" then
                SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_王彤彤测试_更改增删改查表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_王彤彤测试_查找增删改查表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_wtttest_sel;;
DELIMITER ;;
CREATE PROCEDURE prt_wtttest_sel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_wanttt_id int,
    IN p_wanttt_name varchar(255),
    IN p_wangtt_stock_code_no int,
    IN p_wanttt_asset_no int,
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
    declare v_wanttt_id int;
    declare v_wanttt_name varchar(255);
    declare v_wangtt_stock_code_no int;
    declare v_wanttt_asset_no int;
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
    SET v_wanttt_id = p_wanttt_id;
    SET v_wanttt_name = p_wanttt_name;
    SET v_wangtt_stock_code_no = p_wangtt_stock_code_no;
    SET v_wanttt_asset_no = p_wanttt_asset_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_王彤彤测试_查找增删改查表】*/
    call db_pub.pra_wtttest_sel(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_wanttt_id,
        v_wanttt_name,
        v_wangtt_stock_code_no,
        v_wanttt_asset_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.31.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_王彤彤测试_查找增删改查表出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


