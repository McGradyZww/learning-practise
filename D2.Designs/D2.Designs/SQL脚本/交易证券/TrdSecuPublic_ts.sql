DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_公用_获取业务记录编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_GetCoBusiRecordNo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_GetCoBusiRecordNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_record_no_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_curr_no bigint
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
    declare v_record_no_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_no bigint;

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
    SET v_record_no_type = p_record_no_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_获取业务记录编号】*/
        call db_tdsecu.pra_tdsepb_GetCoBusiRecordNo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_record_no_type,
            v_error_code,
            v_error_info,
            v_curr_no);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.901.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
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
    SET p_curr_no = v_curr_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_公用_更新报盘机状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_offer_update;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_offer_update(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_pass_status varchar(2),
    IN p_offer_name varchar(32),
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
    declare v_pass_no int;
    declare v_pass_status varchar(2);
    declare v_offer_name varchar(32);
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
    SET v_pass_no = p_pass_no;
    SET v_pass_status = p_pass_status;
    SET v_offer_name = p_offer_name;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_更新报盘机状态】*/
        call db_tdsecu.pra_tdsepb_UpdateOfferStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pass_no,
            v_pass_status,
            v_offer_name,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_更新报盘机状态出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_获取指令审批操作员序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_GetCommOperNo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_GetCommOperNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_comm_appr_oper int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_appr_oper_no int
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
    declare v_comm_appr_oper int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_appr_oper_no int;

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
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_appr_oper_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_公用_获取指令审批操作员序号】*/
    call db_tdsecu.pra_tdsepb_GetCommOperNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_comm_appr_oper,
        v_error_code,
        v_error_info,
        v_comm_appr_oper_no);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.1.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取指令审批操作员序号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_appr_oper_no = v_comm_appr_oper_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_公用_新增篮子
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_AddBasket;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_AddBasket(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_basket_name varchar(64),
    IN p_weight_type int,
    IN p_is_public int,
    IN p_compos_count int,
    IN p_basket_status varchar(2),
    IN p_cash_replace_amt decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_basket_id bigint
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
    declare v_basket_name varchar(64);
    declare v_weight_type int;
    declare v_is_public int;
    declare v_compos_count int;
    declare v_basket_status varchar(2);
    declare v_cash_replace_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_basket_id bigint;

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
    SET v_basket_name = p_basket_name;
    SET v_weight_type = p_weight_type;
    SET v_is_public = p_is_public;
    SET v_compos_count = p_compos_count;
    SET v_basket_status = p_basket_status;
    SET v_cash_replace_amt = p_cash_replace_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_basket_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_新增篮子】*/
        call db_tdsecu.pra_tdsepb_AddBasket(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_basket_name,
            v_weight_type,
            v_is_public,
            v_compos_count,
            v_basket_status,
            v_cash_replace_amt,
            v_error_code,
            v_error_info,
            v_basket_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_新增篮子出现错误！',v_mysql_message);
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
    SET p_basket_id = v_basket_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_公用_修改篮子
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_ModiBasket;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_ModiBasket(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_basket_id bigint,
    IN p_basket_name varchar(64),
    IN p_weight_type int,
    IN p_is_public int,
    IN p_compos_count int,
    IN p_basket_status varchar(2),
    IN p_cash_replace_amt decimal(18,4),
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
    declare v_basket_id bigint;
    declare v_basket_name varchar(64);
    declare v_weight_type int;
    declare v_is_public int;
    declare v_compos_count int;
    declare v_basket_status varchar(2);
    declare v_cash_replace_amt decimal(18,4);
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
    SET v_basket_id = p_basket_id;
    SET v_basket_name = p_basket_name;
    SET v_weight_type = p_weight_type;
    SET v_is_public = p_is_public;
    SET v_compos_count = p_compos_count;
    SET v_basket_status = p_basket_status;
    SET v_cash_replace_amt = p_cash_replace_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_修改篮子】*/
        call db_tdsecu.pra_tdsepb_ModiBasket(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_basket_id,
            v_basket_name,
            v_weight_type,
            v_is_public,
            v_compos_count,
            v_basket_status,
            v_cash_replace_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_修改篮子出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_删除篮子
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_DropBasket;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_DropBasket(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_basket_id bigint,
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
    declare v_basket_id bigint;
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
    SET v_basket_id = p_basket_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_删除篮子】*/
        call db_tdsecu.pra_tdsepb_DropBasket(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_basket_id,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_删除篮子出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_查询篮子
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_QueryBasket;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_QueryBasket(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
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
    declare v_query_opor_no int;
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_公用_查询篮子】*/
    call db_tdsecu.pra_tdsepb_QueryBasket(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_query_opor_no,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.1.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_查询篮子出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_新增篮子成份
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_AddBasketComposition;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_AddBasketComposition(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_basket_id bigint,
    IN p_co_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_compos_qty decimal(18,2),
    IN p_compos_ratio decimal(18,12),
    IN p_repl_stock_code_no int,
    IN p_repl_qty decimal(18,2),
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
    declare v_basket_id bigint;
    declare v_co_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_compos_qty decimal(18,2);
    declare v_compos_ratio decimal(18,12);
    declare v_repl_stock_code_no int;
    declare v_repl_qty decimal(18,2);
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
    SET v_basket_id = p_basket_id;
    SET v_co_no = p_co_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_compos_qty = p_compos_qty;
    SET v_compos_ratio = p_compos_ratio;
    SET v_repl_stock_code_no = p_repl_stock_code_no;
    SET v_repl_qty = p_repl_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_新增篮子成份】*/
        call db_tdsecu.pra_tdsepb_AddBasketComposition(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_basket_id,
            v_co_no,
            v_exch_no,
            v_stock_code_no,
            v_compos_qty,
            v_compos_ratio,
            v_repl_stock_code_no,
            v_repl_qty,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_新增篮子成份出现错误！',v_mysql_message);
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

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_公用_修改篮子成份
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_ModiBasketComposition;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_ModiBasketComposition(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_basket_id bigint,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_compos_qty decimal(18,2),
    IN p_compos_ratio decimal(18,12),
    IN p_repl_stock_code_no int,
    IN p_repl_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_basket_no int
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
    declare v_basket_id bigint;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_compos_qty decimal(18,2);
    declare v_compos_ratio decimal(18,12);
    declare v_repl_stock_code_no int;
    declare v_repl_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_basket_no int;

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
    SET v_basket_id = p_basket_id;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_compos_qty = p_compos_qty;
    SET v_compos_ratio = p_compos_ratio;
    SET v_repl_stock_code_no = p_repl_stock_code_no;
    SET v_repl_qty = p_repl_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_basket_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_修改篮子成份】*/
        call db_tdsecu.pra_tdsepb_ModifyBasketComposition(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_basket_id,
            v_exch_no,
            v_stock_code_no,
            v_compos_qty,
            v_compos_ratio,
            v_repl_stock_code_no,
            v_repl_qty,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_修改篮子成份出现错误！',v_mysql_message);
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
    SET p_basket_no = v_basket_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_公用_删除篮子成份
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_DropBasketCompostion;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_DropBasketCompostion(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_basket_id bigint,
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
    declare v_row_id bigint;
    declare v_basket_id bigint;
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
    SET v_row_id = p_row_id;
    SET v_basket_id = p_basket_id;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_删除篮子成份】*/
        call db_tdsecu.pra_tdsepb_DropBasketCompostion(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_basket_id,
            v_stock_code_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.23.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_删除篮子成份出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_查询篮子成份
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_QueryBasketComposition;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_QueryBasketComposition(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_basket_id bigint,
    IN p_co_no int,
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
    declare v_basket_id bigint;
    declare v_co_no int;
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
    SET v_basket_id = p_basket_id;
    SET v_co_no = p_co_no;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_公用_查询篮子成份】*/
    call db_tdsecu.pra_tdsepb_QueryBasketComposition(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_basket_id,
        v_co_no,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.1.24.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_查询篮子成份出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_数据归历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_DataToHis;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_DataToHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_next_init_date int,
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
    declare v_next_init_date int;
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
    SET v_next_init_date = p_next_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_数据归历史】*/
        call db_tdsecu.pra_tdsepb_DataToHis(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_next_init_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.51.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_数据归历史出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_交易初始化
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_InitTrade;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_InitTrade(
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
    declare v_is_record_jour int;
    declare v_oper_target varchar(64);
    declare v_open_close_permission int;
    declare v_avail_cal_flag int;
    declare v_oper_jour_no bigint;
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_comm_id bigint;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_date int;
    declare v_comm_time int;
    declare v_comm_batch_no int;
    declare v_comm_status varchar(2);
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_flag int;
    declare v_basket_id bigint;
    declare v_comm_amt decimal(18,4);
    declare v_strike_amt decimal(18,4);
    declare v_comm_oper_way varchar(2);
    declare v_strike_status varchar(2);
    declare v_comm_appr_status varchar(2);
    declare v_exter_comm_flag int;
    declare v_oper_func_code varchar(16);
    declare v_combo_code varchar(32);
    declare v_comm_remark_info varchar(1024);
    declare v_order_dir int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_id bigint;
    declare v_order_batch_no int;
    declare v_order_time int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_status varchar(2);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_order_date int;
    declare v_total_strike_qty decimal(18,2);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_combo_posi_id bigint;
    declare v_target_stock_code_no int;
    declare v_open_posi_date int;

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
    SET v_is_record_jour = 1;
    SET v_oper_target = " ";
    SET v_open_close_permission = 0;
    SET v_avail_cal_flag = 0;
    SET v_oper_jour_no = 0;
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_comm_id = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_batch_no = 0;
    SET v_comm_status = "0";
    SET v_comm_opor = 0;
    SET v_comm_executor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_qty = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_flag = 0;
    SET v_basket_id = 0;
    SET v_comm_amt = 0;
    SET v_strike_amt = 0;
    SET v_comm_oper_way = " ";
    SET v_strike_status = "0";
    SET v_comm_appr_status = " ";
    SET v_exter_comm_flag = 0;
    SET v_oper_func_code = " ";
    SET v_combo_code = " ";
    SET v_comm_remark_info = " ";
    SET v_order_dir = 0;
    SET v_wtdraw_qty = 0;
    SET v_calc_dir = 1;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_external_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_id = 0;
    SET v_order_batch_no = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_status = "0";
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_total_strike_qty = 0;
    SET v_all_wtdraw_qty = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_combo_posi_id = 0;
    SET v_target_stock_code_no = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @操作对象# = "~交易证券_指令_指令表^"; */
    set v_oper_target = "db_tdsecu.tb_tdseap_command";

    /* set @开平仓权限# = 0; */
    set v_open_close_permission = 0;

    /* set @可用计算标志# = 0; */
    set v_avail_cal_flag = 0;

    /* 调用【原子_交易证券_公用_获取操作流水号】*/
    call db_tdsecu.pra_tdsepb_GetOperJourNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_oper_target,
        v_init_date,
        v_error_code,
        v_error_info,
        v_oper_jour_no);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.1.52.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取操作流水号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @记录序号# = @操作流水号#; */
    set v_row_id = v_oper_jour_no;
    loop_label:loop

        /* [事务开始] */
        START TRANSACTION;


        /* 调用【原子_交易证券_指令_循环锁定获取指令】*/
        call db_tdsecu.pra_tdseap_LoopLockGetComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_comm_id,
            v_exch_crncy_type,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_date,
            v_comm_time,
            v_comm_batch_no,
            v_comm_status,
            v_comm_opor,
            v_comm_executor,
            v_comm_dir,
            v_comm_limit_price,
            v_limit_actual_price,
            v_comm_qty,
            v_order_qty,
            v_comm_cancel_qty,
            v_strike_qty,
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_comple_flag,
            v_basket_id,
            v_comm_amt,
            v_strike_amt,
            v_comm_oper_way,
            v_strike_status,
            v_comm_appr_status,
            v_exter_comm_flag,
            v_oper_func_code,
            v_combo_code,
            v_comm_remark_info);

        /* if @错误编码#="0"  then */
        if v_error_code="0"  then

            /* set @记录序号# = @指令序号#; */
            set v_row_id = v_comm_id;

            /* if @指令数量# - @指令撤销数量# - @订单数量# <> 0 and (@指令方向# <> 《指令方向-新股申购》 or @指令方向# = 《指令方向-配售申购》) and ((@指令结束日期# <> 0 and @指令结束日期# <= @初始化日期#) or (@指令结束日期# = 0 and @指令日期# <= @初始化日期#) or @指令完成标志# = 《指令完成标志-已完成》) then */
            if v_comm_qty - v_comm_cancel_qty - v_order_qty <> 0 and (v_comm_dir <> 11 or v_comm_dir = 23) and ((v_comm_end_date <> 0 and v_comm_end_date <= v_init_date) or (v_comm_end_date = 0 and v_comm_date <= v_init_date) or v_comm_comple_flag = 2) then

                /* set @订单方向# = @指令方向#; */
                set v_order_dir = v_comm_dir;

                /* set @指令数量# = @指令数量# - @指令撤销数量# - @订单数量#; */
                set v_comm_qty = v_comm_qty - v_comm_cancel_qty - v_order_qty;
                #更新汇总指令

                /* set @指令撤销数量# = @指令数量# - @指令撤销数量# - @订单数量#; */
                set v_comm_cancel_qty = v_comm_qty - v_comm_cancel_qty - v_order_qty;

                /* set @撤单数量# = 0; */
                set v_wtdraw_qty = 0;

                /* 调用【原子_交易证券_指令_初始化更新汇总指令】*/
                call db_tdsecu.pra_tdseap_InitUpdateSumComm(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_init_date,
                    v_co_no,
                    v_comm_date,
                    v_comm_batch_no,
                    v_comm_cancel_qty,
                    v_wtdraw_qty,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.1.52.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_初始化更新汇总指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #计算指令变动金额和数量

                /* set @指令数量# = @指令撤销数量#; */
                set v_comm_qty = v_comm_cancel_qty;

                /* set @计算方向# = 《计算方向-减去》; */
                set v_calc_dir = -1;

                /* 调用【原子_交易证券_公用_计算指令变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetCommOccurAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_comm_dir,
                    v_limit_actual_price,
                    v_comm_qty,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_calc_dir,
                    v_error_code,
                    v_error_info,
                    v_comm_occur_amt,
                    v_comm_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.1.52.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


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
                    SET v_error_code = "tdsecuT.1.52.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令资金持仓出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            end if;
            #更新流水号

            /* set @操作流水号# = @记录序号#; */
            set v_oper_jour_no = v_row_id;

            /* 调用【原子_交易证券_公用_更新操作流水号】*/
            call db_tdsecu.pra_tdsepb_UpdateOperJourNo(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_oper_target,
                v_init_date,
                v_oper_jour_no,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.1.52.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_更新操作流水号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        else

            /* set @错误编码#="0"; */
            set v_error_code="0";

            /* set @错误信息#=' '; */
            set v_error_info=' ';
            leave loop_label;
        end if;

        /* [事务结束] */
        COMMIT;

    end loop;

    /* set @操作对象# = "~交易证券_交易_订单表^"; */
    set v_oper_target = "db_tdsecu.tb_tdsetd_order";

    /* 调用【原子_交易证券_公用_获取操作流水号】*/
    call db_tdsecu.pra_tdsepb_GetOperJourNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_oper_target,
        v_init_date,
        v_error_code,
        v_error_info,
        v_oper_jour_no);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.1.52.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取操作流水号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @记录序号# = @操作流水号#; */
    set v_row_id = v_oper_jour_no;
    loop_label:loop

        /* [事务开始] */
        START TRANSACTION;


        /* 调用【原子_交易证券_交易_循环锁定获取订单】*/
        call db_tdsecu.pra_tdsetd_LoopLockGetOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_asset_type,
            v_stock_type,
            v_comm_opor,
            v_external_no,
            v_comm_id,
            v_comm_batch_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_id,
            v_order_batch_no,
            v_order_time,
            v_order_dir,
            v_price_type,
            v_order_price,
            v_order_qty,
            v_order_status,
            v_wtdraw_qty,
            v_strike_amt,
            v_strike_qty,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_par_value,
            v_bond_accr_intrst,
            v_net_price_flag,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_rsp_info,
            v_compli_trig_id,
            v_remark_info,
            v_order_oper_way,
            v_busi_opor_no,
            v_combo_code,
            v_order_date,
            v_bond_rate_type,
            v_exch_crncy_type,
            v_impawn_ratio,
            v_trade_code_no);

        /* if @错误编码#="0"  then */
        if v_error_code="0"  then

            /* set @记录序号# = @订单序号#; */
            set v_row_id = v_order_id;

            /* if @订单数量# - @撤单数量# - @成交数量# <> 0 and @订单日期# <= @初始化日期# and (@订单方向# <> 《订单方向-新股申购》 or @订单方向# = 《订单方向-配售申购》) then */
            if v_order_qty - v_wtdraw_qty - v_strike_qty <> 0 and v_order_date <= v_init_date and (v_order_dir <> 11 or v_order_dir = 23) then

                /* set @总成交数量# = @成交数量#; */
                set v_total_strike_qty = v_strike_qty;

                /* set @总撤单数量# = @订单数量# - @成交数量#; */
                set v_all_wtdraw_qty = v_order_qty - v_strike_qty;

                /* set @撤单数量# = @订单数量# - @撤单数量# - @成交数量#; */
                set v_wtdraw_qty = v_order_qty - v_wtdraw_qty - v_strike_qty;

                /* 调用【原子_交易证券_公用_计算撤单交易变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetCancelExchChangeAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_order_dir,
                    v_order_qty,
                    v_order_price,
                    v_order_frozen_amt,
                    v_wtdraw_qty,
                    v_total_strike_qty,
                    v_all_wtdraw_qty,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_error_code,
                    v_error_info,
                    v_trade_occur_amt,
                    v_trade_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.1.52.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算撤单交易变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @指令变动数量# = 0; */
                set v_comm_occur_qty = 0;

                /* set @指令变动金额# = 0; */
                set v_comm_occur_amt = 0;

                /* if @指令序号# > 0 then */
                if v_comm_id > 0 then

                    /* set @指令撤销数量# = 0; */
                    set v_comm_cancel_qty = 0;

                    /* 调用【原子_交易证券_指令_初始化更新指令】*/
                    call db_tdsecu.pra_tdseap_InitUpdateComm(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_init_date,
                        v_comm_id,
                        v_comm_cancel_qty,
                        v_wtdraw_qty,
                        v_error_code,
                        v_error_info,
                        v_limit_actual_price,
                        v_comm_status);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.1.52.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_初始化更新指令出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;

                    #计算指令变动金额

                    /* set @指令方向# = @订单方向#; */
                    set v_comm_dir = v_order_dir;

                    /* set @指令数量# = @撤单数量#; */
                    set v_comm_qty = v_wtdraw_qty;

                    /* set @计算方向# = 《计算方向-加上》; */
                    set v_calc_dir = 1;

                    /* 调用【原子_交易证券_公用_计算撤单指令变动金额和数量】*/
                    call db_tdsecu.pra_tdsepb_GetCancelCommOccurAmtAndQty(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_stock_type,
                        v_comm_dir,
                        v_limit_actual_price,
                        v_wtdraw_qty,
                        v_comm_status,
                        v_net_price_flag,
                        v_par_value,
                        v_bond_accr_intrst,
                        v_bond_rate_type,
                        v_calc_dir,
                        v_error_code,
                        v_error_info,
                        v_comm_occur_amt,
                        v_comm_occur_qty);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.1.52.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算撤单指令变动金额和数量出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;

                end if;
                #处理订单资金持仓数据，保护指令变动和交易的变动

                /* set @组合持仓序号# = 0; */
                set v_combo_posi_id = 0;

                /* set @目标证券代码编号# = 0; */
                set v_target_stock_code_no = 0;

                /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
                call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
                    v_exch_crncy_type,
                    v_comm_id,
                    v_order_id,
                    v_exch_no,
                    v_stock_code,
                    v_stock_type,
                    v_asset_type,
                    v_order_dir,
                    v_impawn_ratio,
                    v_stock_acco_no,
                    v_stock_code_no,
                    v_trade_code_no,
                    v_target_code_no,
                    v_comm_occur_amt,
                    v_comm_occur_qty,
                    v_trade_occur_amt,
                    v_trade_occur_qty,
                    v_is_record_jour,
                    v_order_oper_way,
                    v_busi_opor_no,
                    v_open_close_permission,
                    v_avail_cal_flag,
                    v_combo_code,
                    v_combo_posi_id,
                    v_target_stock_code_no,
                    v_error_code,
                    v_error_info,
                    v_open_posi_date);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.1.52.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            end if;
            #更新流水号

            /* set @操作流水号# = @记录序号#; */
            set v_oper_jour_no = v_row_id;

            /* 调用【原子_交易证券_公用_更新操作流水号】*/
            call db_tdsecu.pra_tdsepb_UpdateOperJourNo(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_oper_target,
                v_init_date,
                v_oper_jour_no,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.1.52.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_更新操作流水号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        else

            /* set @错误编码#="0"; */
            set v_error_code="0";

            /* set @错误信息#=' '; */
            set v_error_info=' ';
            leave loop_label;
        end if;

        /* [事务结束] */
        COMMIT;

    end loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_公用_交易归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_TradeArchive;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_TradeArchive(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_next_init_date int,
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
    declare v_next_init_date int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_avail_cal_flag int;
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_comm_id bigint;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_date int;
    declare v_comm_time int;
    declare v_comm_batch_no int;
    declare v_comm_status varchar(2);
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_flag int;
    declare v_basket_id bigint;
    declare v_comm_amt decimal(18,4);
    declare v_strike_amt decimal(18,4);
    declare v_comm_oper_way varchar(2);
    declare v_strike_status varchar(2);
    declare v_comm_appr_status varchar(2);
    declare v_exter_comm_flag int;
    declare v_oper_func_code varchar(16);
    declare v_combo_code varchar(32);
    declare v_comm_remark_info varchar(1024);
    declare v_wtdraw_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_invest_type int;
    declare v_order_dir int;
    declare v_trade_occur_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_debt_type int;
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_id bigint;
    declare v_order_batch_no int;
    declare v_order_time int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_status varchar(2);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_order_date int;
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_combo_posi_id bigint;
    declare v_target_stock_code_no int;
    declare v_open_posi_date int;
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
    SET v_next_init_date = p_next_init_date;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_avail_cal_flag = 0;
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_comm_id = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_batch_no = 0;
    SET v_comm_status = "0";
    SET v_comm_opor = 0;
    SET v_comm_executor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_qty = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_flag = 0;
    SET v_basket_id = 0;
    SET v_comm_amt = 0;
    SET v_strike_amt = 0;
    SET v_comm_oper_way = " ";
    SET v_strike_status = "0";
    SET v_comm_appr_status = " ";
    SET v_exter_comm_flag = 0;
    SET v_oper_func_code = " ";
    SET v_combo_code = " ";
    SET v_comm_remark_info = " ";
    SET v_wtdraw_qty = 0;
    SET v_calc_dir = 1;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_invest_type = 0;
    SET v_order_dir = 0;
    SET v_trade_occur_qty = 0;
    SET v_trade_occur_amt = 0;
    SET v_debt_qty = 0;
    SET v_debt_type = 0;
    SET v_external_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_id = 0;
    SET v_order_batch_no = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_status = "0";
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_combo_posi_id = 0;
    SET v_target_stock_code_no = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @开平仓权限# = 0; */
    set v_open_close_permission = 0;

    /* set @可用计算标志# = 0; */
    set v_avail_cal_flag = 0;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_交易归档】*/
        call db_tdsecu.pra_tdsepb_TradeArchive(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_next_init_date,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.54.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_交易归档出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #重算指令

        /* set @记录序号# = 0; */
        set v_row_id = 0;
        loop_label:loop

            /* 调用【原子_交易证券_指令_循环锁定获取指令】*/
            call db_tdsecu.pra_tdseap_LoopLockGetComm(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_row_id,
                v_error_code,
                v_error_info,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_pass_no,
                v_out_acco,
                v_comm_id,
                v_exch_crncy_type,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_stock_code,
                v_target_code_no,
                v_trade_code_no,
                v_stock_type,
                v_asset_type,
                v_comm_date,
                v_comm_time,
                v_comm_batch_no,
                v_comm_status,
                v_comm_opor,
                v_comm_executor,
                v_comm_dir,
                v_comm_limit_price,
                v_limit_actual_price,
                v_comm_qty,
                v_order_qty,
                v_comm_cancel_qty,
                v_strike_qty,
                v_net_price_flag,
                v_par_value,
                v_impawn_ratio,
                v_intrst_days,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_comm_begin_date,
                v_comm_end_date,
                v_comm_begin_time,
                v_comm_end_time,
                v_comm_comple_flag,
                v_basket_id,
                v_comm_amt,
                v_strike_amt,
                v_comm_oper_way,
                v_strike_status,
                v_comm_appr_status,
                v_exter_comm_flag,
                v_oper_func_code,
                v_combo_code,
                v_comm_remark_info);

            /* if @错误编码#="0"  then */
            if v_error_code="0"  then

                /* set @记录序号# = @指令序号#; */
                set v_row_id = v_comm_id;

                /* if @指令方向# <> 《指令方向-基金申购》 and @指令方向# <> 《指令方向-基金赎回》 and  @指令方向#  <> 《指令方向-基金转换》 then */
                if v_comm_dir <> 9 and v_comm_dir <> 10 and  v_comm_dir  <> 12 then
                    #未成交的订单直接回滚，那订单数量=成交数量，差额返回

                    /* set @撤单数量# = @订单数量# - @成交数量#; */
                    set v_wtdraw_qty = v_order_qty - v_strike_qty;

                    /* set @指令撤销数量# = 0; */
                    set v_comm_cancel_qty = 0;

                    /* 调用【原子_交易证券_指令_撤销更新指令】*/
                    call db_tdsecu.pra_tdseap_CancelUpdateComm(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_comm_id,
                        v_comm_cancel_qty,
                        v_wtdraw_qty,
                        v_error_code,
                        v_error_info,
                        v_limit_actual_price,
                        v_comm_status,
                        v_comm_date,
                        v_comm_batch_no,
                        v_comm_executor,
                        v_comm_oper_way,
                        v_comm_dir,
                        v_comm_amt);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.1.54.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销更新指令出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;

                    #计算指令变动金额和数量

                    /* set @计算方向# = 《计算方向-加上》; */
                    set v_calc_dir = 1;

                    /* set @指令数量# = @指令数量# - @成交数量# - @指令撤销数量#; */
                    set v_comm_qty = v_comm_qty - v_strike_qty - v_comm_cancel_qty;

                    /* if @指令方向# = 《指令方向-融资买入》 or @指令方向# = 《指令方向-融券卖出》 or @指令方向# = 《指令方向-买券还券》 or @指令方向# = 《指令方向-卖券还款》 or @指令方向# = 《指令方向-直接还款》 or @指令方向# = 《指令方向-直接还券》  then */
                    if v_comm_dir = 5 or v_comm_dir = 6 or v_comm_dir = 8 or v_comm_dir = 7 or v_comm_dir = 14 or v_comm_dir = 15  then

                        /* 调用【原子_交易证券_公用_计算融资融券指令变动金额和数量】*/
                        call db_tdsecu.pra_tdsepb_GetFinaLoanCommOccurAmtAndQty(
                            v_opor_co_no,
                            v_opor_no,
                            v_oper_mac,
                            v_oper_ip_addr,
                            v_oper_info,
                            v_oper_way,
                            v_func_code,
                            v_stock_type,
                            v_comm_dir,
                            v_limit_actual_price,
                            v_comm_qty,
                            v_net_price_flag,
                            v_par_value,
                            v_bond_accr_intrst,
                            v_bond_rate_type,
                            v_calc_dir,
                            v_comm_amt,
                            v_error_code,
                            v_error_info,
                            v_comm_occur_amt,
                            v_comm_occur_qty);
                        if v_error_code = "1" then
                            SET v_error_code = "tdsecuT.1.54.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券指令变动金额和数量出现错误！',v_mysql_message);
                            end if;
                            ROLLBACK;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            ROLLBACK;
                            leave label_pro;
                        end if;


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
                            SET v_error_code = "tdsecuT.1.54.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令资金持仓出现错误！',v_mysql_message);
                            end if;
                            ROLLBACK;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            ROLLBACK;
                            leave label_pro;
                        end if;


                        /* set @投资类型#=《投资类型-二级市场交易性金融资产》 ; */
                        set v_invest_type=1 ;

                        /* set @订单方向#=@指令方向# ; */
                        set v_order_dir=v_comm_dir ;

                        /* set @交易变动数量#=0 ; */
                        set v_trade_occur_qty=0 ;

                        /* set @交易变动金额#=0 ; */
                        set v_trade_occur_amt=0 ;

                        /* set @初始化日期# = @下日初始化日期#; */
                        set v_init_date = v_next_init_date;

                        /* set  @负债数量# = 0; */
                        set  v_debt_qty = 0;

                        /* 调用【原子_交易证券_账户_更新融资融券指令交易资金持仓负债】*/
                        call db_tdsecu.pra_tdseac_UpdateFinaLoanApprDebt(
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
                            v_exch_crncy_type,
                            v_comm_id,
                            v_exch_no,
                            v_stock_code,
                            v_stock_type,
                            v_asset_type,
                            v_invest_type,
                            v_order_dir,
                            v_stock_acco_no,
                            v_stock_code_no,
                            v_trade_code_no,
                            v_comm_occur_amt,
                            v_comm_occur_qty,
                            v_trade_occur_amt,
                            v_trade_occur_qty,
                            v_is_record_jour,
                            v_debt_qty,
                            v_error_code,
                            v_error_info,
                            v_debt_type);
                        if v_error_code = "1" then
                            SET v_error_code = "tdsecuT.1.54.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新融资融券指令交易资金持仓负债出现错误！',v_mysql_message);
                            end if;
                            ROLLBACK;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            ROLLBACK;
                            leave label_pro;
                        end if;

                    else

                        /* 调用【原子_交易证券_公用_计算指令变动金额和数量】*/
                        call db_tdsecu.pra_tdsepb_GetCommOccurAmtAndQty(
                            v_opor_co_no,
                            v_opor_no,
                            v_oper_mac,
                            v_oper_ip_addr,
                            v_oper_info,
                            v_oper_way,
                            v_func_code,
                            v_stock_type,
                            v_comm_dir,
                            v_limit_actual_price,
                            v_comm_qty,
                            v_net_price_flag,
                            v_par_value,
                            v_bond_accr_intrst,
                            v_bond_rate_type,
                            v_calc_dir,
                            v_error_code,
                            v_error_info,
                            v_comm_occur_amt,
                            v_comm_occur_qty);
                        if v_error_code = "1" then
                            SET v_error_code = "tdsecuT.1.54.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
                            end if;
                            ROLLBACK;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            ROLLBACK;
                            leave label_pro;
                        end if;


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
                            SET v_error_code = "tdsecuT.1.54.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令资金持仓出现错误！',v_mysql_message);
                            end if;
                            ROLLBACK;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            ROLLBACK;
                            leave label_pro;
                        end if;

                    end if;
                end if;
            else

                /* set @错误编码#="0"; */
                set v_error_code="0";
                SET v_error_info = " ";
                leave  loop_label;
            end if;
        end loop;
        #重算订单

        /* set @记录序号# = 0; */
        set v_row_id = 0;
        loop_label2:loop

            /* 调用【原子_交易证券_交易_循环锁定获取订单】*/
            call db_tdsecu.pra_tdsetd_LoopLockGetOrder(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_row_id,
                v_error_code,
                v_error_info,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_pass_no,
                v_out_acco,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_stock_code,
                v_target_code_no,
                v_asset_type,
                v_stock_type,
                v_comm_opor,
                v_external_no,
                v_comm_id,
                v_comm_batch_no,
                v_report_date,
                v_report_time,
                v_report_no,
                v_order_id,
                v_order_batch_no,
                v_order_time,
                v_order_dir,
                v_price_type,
                v_order_price,
                v_order_qty,
                v_order_status,
                v_wtdraw_qty,
                v_strike_amt,
                v_strike_qty,
                v_all_fee,
                v_stamp_tax,
                v_trans_fee,
                v_brkage_fee,
                v_SEC_charges,
                v_other_fee,
                v_trade_commis,
                v_other_commis,
                v_par_value,
                v_bond_accr_intrst,
                v_net_price_flag,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_rsp_info,
                v_compli_trig_id,
                v_remark_info,
                v_order_oper_way,
                v_busi_opor_no,
                v_combo_code,
                v_order_date,
                v_bond_rate_type,
                v_exch_crncy_type,
                v_impawn_ratio,
                v_trade_code_no);

            /* if @错误编码#="0"  then */
            if v_error_code="0"  then

                /* set @记录序号# = @订单序号#; */
                set v_row_id = v_order_id;

                /* set @订单数量# = @订单数量# - @撤单数量# - @成交数量#; */
                set v_order_qty = v_order_qty - v_wtdraw_qty - v_strike_qty;

                /* if @订单数量# > 0 then */
                if v_order_qty > 0 then

                    /* if @指令序号# > 0 then */
                    if v_comm_id > 0 then

                        /* set @指令方向# = @订单方向#; */
                        set v_comm_dir = v_order_dir;

                        /* set @指令数量# = @订单数量#; */
                        set v_comm_qty = v_order_qty;

                        /* set @计算方向# = 《计算方向-减去》; */
                        set v_calc_dir = -1;

                        /* 调用【原子_交易证券_公用_计算指令冻结金额和数量】*/
                        call db_tdsecu.pra_tdsepb_GetCommFrozenAmtAndQty(
                            v_opor_co_no,
                            v_opor_no,
                            v_oper_mac,
                            v_oper_ip_addr,
                            v_oper_info,
                            v_oper_way,
                            v_func_code,
                            v_stock_type,
                            v_comm_dir,
                            v_limit_actual_price,
                            v_comm_qty,
                            v_net_price_flag,
                            v_par_value,
                            v_bond_accr_intrst,
                            v_bond_rate_type,
                            v_calc_dir,
                            v_error_code,
                            v_error_info,
                            v_comm_frozen_amt,
                            v_comm_frozen_qty);
                        if v_error_code = "1" then
                            SET v_error_code = "tdsecuT.1.54.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令冻结金额和数量出现错误！',v_mysql_message);
                            end if;
                            ROLLBACK;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            ROLLBACK;
                            leave label_pro;
                        end if;


                        /* 调用【原子_交易证券_指令_下单更新指令】*/
                        call db_tdsecu.pra_tdseap_OrderUpdateComm(
                            v_opor_co_no,
                            v_opor_no,
                            v_oper_mac,
                            v_oper_ip_addr,
                            v_oper_info,
                            v_oper_way,
                            v_func_code,
                            v_comm_id,
                            v_comm_frozen_amt,
                            v_comm_frozen_qty,
                            v_order_qty,
                            v_error_code,
                            v_error_info,
                            v_limit_actual_price,
                            v_exter_comm_flag,
                            v_comm_comple_date,
                            v_comm_comple_time,
                            v_comm_status,
                            v_strike_status);
                        if v_error_code = "1" then
                            SET v_error_code = "tdsecuT.1.54.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_下单更新指令出现错误！',v_mysql_message);
                            end if;
                            ROLLBACK;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            ROLLBACK;
                            leave label_pro;
                        end if;

                        #计算指令变动金额和数量

                        /* set @计算方向# = 《计算方向-减去》; */
                        set v_calc_dir = -1;

                        /* 调用【原子_交易证券_公用_计算指令变动金额和数量】*/
                        call db_tdsecu.pra_tdsepb_GetCommOccurAmtAndQty(
                            v_opor_co_no,
                            v_opor_no,
                            v_oper_mac,
                            v_oper_ip_addr,
                            v_oper_info,
                            v_oper_way,
                            v_func_code,
                            v_stock_type,
                            v_comm_dir,
                            v_limit_actual_price,
                            v_comm_qty,
                            v_net_price_flag,
                            v_par_value,
                            v_bond_accr_intrst,
                            v_bond_rate_type,
                            v_calc_dir,
                            v_error_code,
                            v_error_info,
                            v_comm_occur_amt,
                            v_comm_occur_qty);
                        if v_error_code = "1" then
                            SET v_error_code = "tdsecuT.1.54.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
                            end if;
                            ROLLBACK;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            ROLLBACK;
                            leave label_pro;
                        end if;

                    end if;
                    #计算下单交易变动金额和数量

                    /* 调用【原子_交易证券_公用_计算下单交易变动金额和数量】*/
                    call db_tdsecu.pra_tdsepb_GetOrderTradeOccurAmtAndQty(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_stock_type,
                        v_order_dir,
                        v_order_qty,
                        v_order_price,
                        v_order_frozen_amt,
                        v_net_price_flag,
                        v_par_value,
                        v_bond_accr_intrst,
                        v_bond_rate_type,
                        v_error_code,
                        v_error_info,
                        v_trade_occur_amt,
                        v_trade_occur_qty);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.1.54.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算下单交易变动金额和数量出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;


                    /* set @组合持仓序号# = 0; */
                    set v_combo_posi_id = 0;

                    /* set @目标证券代码编号# = 0; */
                    set v_target_stock_code_no = 0;

                    /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
                    call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
                        v_exch_crncy_type,
                        v_comm_id,
                        v_order_id,
                        v_exch_no,
                        v_stock_code,
                        v_stock_type,
                        v_asset_type,
                        v_order_dir,
                        v_impawn_ratio,
                        v_stock_acco_no,
                        v_stock_code_no,
                        v_trade_code_no,
                        v_target_code_no,
                        v_comm_occur_amt,
                        v_comm_occur_qty,
                        v_trade_occur_amt,
                        v_trade_occur_qty,
                        v_is_record_jour,
                        v_order_oper_way,
                        v_busi_opor_no,
                        v_open_close_permission,
                        v_avail_cal_flag,
                        v_combo_code,
                        v_combo_posi_id,
                        v_target_stock_code_no,
                        v_error_code,
                        v_error_info,
                        v_open_posi_date);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.1.54.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;

                end if;
            else

                /* set @错误编码#="0"; */
                set v_error_code="0";
                SET v_error_info = " ";
                leave  loop_label2;
            end if;
        end loop;
    #重新汇总指令时，重新计算汇总指令暂停状态。| 明细全为暂停，才暂停。Modify by wjp 20181014 | update_times 等没更新。

    /* set @更新日期#= date_format(curdate(),'%Y%m%d'); */
    set v_update_date= date_format(curdate(),'%Y%m%d');

    /* set @更新时间#= date_format(curtime(),'%H%i%s'); */
    set v_update_time= date_format(curtime(),'%H%i%s');

    /* update   ~交易证券_指令_指令汇总表^  a set a.{指令汇总状态} = 《指令汇总状态-暂停执行》  ,a.{更新日期}=@更新日期#,a.{更新时间}=@更新时间#,a.{更新次数}=a.{更新次数}+1  where  a.{指令批号} in (select t1.{指令批号}  from 
(select count(*) a,{指令批号}  from ~交易证券_指令_指令表^ t where {指令状态}=《指令状态-暂停执行》 group by {指令批号},{机构编号}) as t1,
(select count(*) b,{指令批号}  from ~交易证券_指令_指令表^ t group by {指令批号},{机构编号}) as t2 WHERE t1.{指令批号}= t2.{指令批号} and t1.a=t2.b); */
    update   db_tdsecu.tb_tdseap_sumcommand  a set a.comm_sum_status = "7"  ,a.update_date=v_update_date,a.update_time=v_update_time,a.update_times=a.update_times+1  where  a.comm_batch_no in (select t1.comm_batch_no  from 
    (select count(*) a,comm_batch_no  from db_tdsecu.tb_tdseap_command t where comm_status="7" group by comm_batch_no,co_no) as t1,
    (select count(*) b,comm_batch_no  from db_tdsecu.tb_tdseap_command t group by comm_batch_no,co_no) as t2 WHERE t1.comm_batch_no= t2.comm_batch_no and t1.a=t2.b);
    #根据订单历史表 重算 指令策略数量。

    /* update  ~交易证券_指令_指令表^ a  set {策略订单数量} = (select ifnull(sum({成交数量}),0) from  ~历史_交易证券_交易_订单表^ b where a.{机构编号}=b.{机构编号} and a.{记录序号} =b.{指令序号} and b.{策略序号} <>0), {策略占用数量} =(select ifnull(sum({成交数量}),0) from  ~历史_交易证券_交易_订单表^ c where a.{机构编号}=c.{机构编号} and a.{记录序号} =c.{指令序号} and c.{策略序号} <>0) ; */
    update  db_tdsecu.tb_tdseap_command a  set strategy_order_qty = (select ifnull(sum(strike_qty),0) from  db_tdsecu_his.tb_tdsetd_order_his b where a.co_no=b.co_no and a.row_id =b.comm_id and b.strategy_id <>0), strategy_capt_qty =(select ifnull(sum(strike_qty),0) from  db_tdsecu_his.tb_tdsetd_order_his c where a.co_no=c.co_no and a.row_id =c.comm_id and c.strategy_id <>0) ;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_公用_新增组合
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_AddCombo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_AddCombo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_combo_code varchar(32),
    IN p_comb_name varchar(64),
    IN p_is_public int,
    IN p_create_failure_validity_date int,
    IN p_create_end_validity_date int,
    IN p_rebalance_failure_validity_date int,
    IN p_rebalance_end_validity_date int,
    IN p_repair_failure_validity_date int,
    IN p_repair_end_validity_date int,
    IN p_broke_validity_date int,
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_combo_id bigint
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
    declare v_combo_code varchar(32);
    declare v_comb_name varchar(64);
    declare v_is_public int;
    declare v_create_failure_validity_date int;
    declare v_create_end_validity_date int;
    declare v_rebalance_failure_validity_date int;
    declare v_rebalance_end_validity_date int;
    declare v_repair_failure_validity_date int;
    declare v_repair_end_validity_date int;
    declare v_broke_validity_date int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_combo_id bigint;

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
    SET v_combo_code = p_combo_code;
    SET v_comb_name = p_comb_name;
    SET v_is_public = p_is_public;
    SET v_create_failure_validity_date = p_create_failure_validity_date;
    SET v_create_end_validity_date = p_create_end_validity_date;
    SET v_rebalance_failure_validity_date = p_rebalance_failure_validity_date;
    SET v_rebalance_end_validity_date = p_rebalance_end_validity_date;
    SET v_repair_failure_validity_date = p_repair_failure_validity_date;
    SET v_repair_end_validity_date = p_repair_end_validity_date;
    SET v_broke_validity_date = p_broke_validity_date;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_combo_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_新增组合】*/
        call db_tdsecu.pra_tdsepb_AddCombo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_combo_code,
            v_comb_name,
            v_is_public,
            v_create_failure_validity_date,
            v_create_end_validity_date,
            v_rebalance_failure_validity_date,
            v_rebalance_end_validity_date,
            v_repair_failure_validity_date,
            v_repair_end_validity_date,
            v_broke_validity_date,
            v_remark_info,
            v_error_code,
            v_error_info,
            v_combo_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.31.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_新增组合出现错误！',v_mysql_message);
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
    SET p_combo_id = v_combo_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_公用_修改组合
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_ModiCombo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_ModiCombo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_combo_id bigint,
    IN p_combo_code varchar(32),
    IN p_comb_name varchar(64),
    IN p_is_public int,
    IN p_create_failure_validity_date int,
    IN p_create_end_validity_date int,
    IN p_rebalance_failure_validity_date int,
    IN p_rebalance_end_validity_date int,
    IN p_repair_failure_validity_date int,
    IN p_repair_end_validity_date int,
    IN p_broke_validity_date int,
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
    declare v_combo_id bigint;
    declare v_combo_code varchar(32);
    declare v_comb_name varchar(64);
    declare v_is_public int;
    declare v_create_failure_validity_date int;
    declare v_create_end_validity_date int;
    declare v_rebalance_failure_validity_date int;
    declare v_rebalance_end_validity_date int;
    declare v_repair_failure_validity_date int;
    declare v_repair_end_validity_date int;
    declare v_broke_validity_date int;
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
    SET v_combo_id = p_combo_id;
    SET v_combo_code = p_combo_code;
    SET v_comb_name = p_comb_name;
    SET v_is_public = p_is_public;
    SET v_create_failure_validity_date = p_create_failure_validity_date;
    SET v_create_end_validity_date = p_create_end_validity_date;
    SET v_rebalance_failure_validity_date = p_rebalance_failure_validity_date;
    SET v_rebalance_end_validity_date = p_rebalance_end_validity_date;
    SET v_repair_failure_validity_date = p_repair_failure_validity_date;
    SET v_repair_end_validity_date = p_repair_end_validity_date;
    SET v_broke_validity_date = p_broke_validity_date;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_修改组合】*/
        call db_tdsecu.pra_tdsepb_ModiCombo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_combo_id,
            v_combo_code,
            v_comb_name,
            v_is_public,
            v_create_failure_validity_date,
            v_create_end_validity_date,
            v_rebalance_failure_validity_date,
            v_rebalance_end_validity_date,
            v_repair_failure_validity_date,
            v_repair_end_validity_date,
            v_broke_validity_date,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.32.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_修改组合出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_删除组合
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_DelCombo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_DelCombo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_combo_id bigint,
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
    declare v_combo_id bigint;
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
    SET v_combo_id = p_combo_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_删除组合】*/
        call db_tdsecu.pra_tdsepb_DelCombo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_combo_id,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.33.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_删除组合出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_查询组合
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_QueryCombo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_QueryCombo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
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
    declare v_query_opor_no int;
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_公用_查询组合】*/
    call db_tdsecu.pra_tdsepb_QueryCombo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_query_opor_no,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.1.34.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_查询组合出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_获取单个组合
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_GetSingleCombo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_GetSingleCombo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_combo_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_busi_opor_no int,
    OUT p_co_no int,
    OUT p_combo_code varchar(32),
    OUT p_comb_name varchar(64),
    OUT p_is_public int,
    OUT p_create_failure_validity_date int,
    OUT p_create_end_validity_date int,
    OUT p_rebalance_failure_validity_date int,
    OUT p_rebalance_end_validity_date int,
    OUT p_repair_failure_validity_date int,
    OUT p_repair_end_validity_date int,
    OUT p_broke_validity_date int,
    OUT p_remark_info varchar(255),
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
    declare v_combo_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_combo_code varchar(32);
    declare v_comb_name varchar(64);
    declare v_is_public int;
    declare v_create_failure_validity_date int;
    declare v_create_end_validity_date int;
    declare v_rebalance_failure_validity_date int;
    declare v_rebalance_end_validity_date int;
    declare v_repair_failure_validity_date int;
    declare v_repair_end_validity_date int;
    declare v_broke_validity_date int;
    declare v_remark_info varchar(255);
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
    SET v_combo_id = p_combo_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_busi_opor_no = 0;
    SET v_co_no = 0;
    SET v_combo_code = " ";
    SET v_comb_name = " ";
    SET v_is_public = 0;
    SET v_create_failure_validity_date = 0;
    SET v_create_end_validity_date = 0;
    SET v_rebalance_failure_validity_date = 0;
    SET v_rebalance_end_validity_date = 0;
    SET v_repair_failure_validity_date = 0;
    SET v_repair_end_validity_date = 0;
    SET v_broke_validity_date = 0;
    SET v_remark_info = " ";
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_公用_获取单个组合】*/
    call db_tdsecu.pra_tdsepb_GetSingleCombo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_combo_id,
        v_error_code,
        v_error_info,
        v_row_id,
        v_busi_opor_no,
        v_co_no,
        v_combo_code,
        v_comb_name,
        v_is_public,
        v_create_failure_validity_date,
        v_create_end_validity_date,
        v_rebalance_failure_validity_date,
        v_rebalance_end_validity_date,
        v_repair_failure_validity_date,
        v_repair_end_validity_date,
        v_broke_validity_date,
        v_remark_info,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.1.35.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取单个组合出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_co_no = v_co_no;
    SET p_combo_code = v_combo_code;
    SET p_comb_name = v_comb_name;
    SET p_is_public = v_is_public;
    SET p_create_failure_validity_date = v_create_failure_validity_date;
    SET p_create_end_validity_date = v_create_end_validity_date;
    SET p_rebalance_failure_validity_date = v_rebalance_failure_validity_date;
    SET p_rebalance_end_validity_date = v_rebalance_end_validity_date;
    SET p_repair_failure_validity_date = v_repair_failure_validity_date;
    SET p_repair_end_validity_date = v_repair_end_validity_date;
    SET p_broke_validity_date = v_broke_validity_date;
    SET p_remark_info = v_remark_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_公用_新增组合证券
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_AddComboStock;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_AddComboStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_combo_code varchar(32),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_combo_ratio decimal(18,12),
    IN p_combo_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_combo_stock_id bigint
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
    declare v_combo_code varchar(32);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_combo_ratio decimal(18,12);
    declare v_combo_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_combo_stock_id bigint;

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
    SET v_combo_code = p_combo_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_combo_ratio = p_combo_ratio;
    SET v_combo_qty = p_combo_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_combo_stock_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_新增组合证券】*/
        call db_tdsecu.pra_tdsepb_AddComboStock(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_combo_code,
            v_exch_no,
            v_stock_code,
            v_stock_code_no,
            v_combo_ratio,
            v_combo_qty,
            v_error_code,
            v_error_info,
            v_combo_stock_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.36.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_新增组合证券出现错误！',v_mysql_message);
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
    SET p_combo_stock_id = v_combo_stock_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_公用_修改组合证券
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_ModiComboStock;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_ModiComboStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_combo_stock_id bigint,
    IN p_combo_code varchar(32),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_combo_ratio decimal(18,12),
    IN p_combo_qty decimal(18,2),
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
    declare v_combo_stock_id bigint;
    declare v_combo_code varchar(32);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_combo_ratio decimal(18,12);
    declare v_combo_qty decimal(18,2);
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
    SET v_combo_stock_id = p_combo_stock_id;
    SET v_combo_code = p_combo_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_combo_ratio = p_combo_ratio;
    SET v_combo_qty = p_combo_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_修改组合证券】*/
        call db_tdsecu.pra_tdsepb_ModiComboStock(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_combo_stock_id,
            v_combo_code,
            v_exch_no,
            v_stock_code,
            v_stock_code_no,
            v_combo_ratio,
            v_combo_qty,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.37.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_修改组合证券出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_删除组合证券
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_DelComboStock;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_DelComboStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_combo_code varchar(32),
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
    declare v_combo_code varchar(32);
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
    SET v_combo_code = p_combo_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_删除组合证券】*/
        call db_tdsecu.pra_tdsepb_DelComboStock(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_combo_code,
            v_stock_code_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.38.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_删除组合证券出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_查询组合证券
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_QueryComboStock;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_QueryComboStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
    IN p_combo_code varchar(32),
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
    declare v_query_opor_no int;
    declare v_combo_code varchar(32);
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_combo_code = p_combo_code;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_公用_查询组合证券】*/
    call db_tdsecu.pra_tdsepb_QueryComboStock(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_query_opor_no,
        v_combo_code,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.1.39.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_查询组合证券出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_获取单个组合证券
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_GetSingleComboStock;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_GetSingleComboStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_combo_code varchar(32),
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_busi_opor_no int,
    OUT p_co_no int,
    OUT p_exch_no int,
    OUT p_stock_code varchar(6),
    OUT p_combo_ratio decimal(18,12),
    OUT p_combo_qty decimal(18,2),
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
    declare v_combo_code varchar(32);
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_combo_ratio decimal(18,12);
    declare v_combo_qty decimal(18,2);
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
    SET v_combo_code = p_combo_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_busi_opor_no = 0;
    SET v_co_no = 0;
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_combo_ratio = 0;
    SET v_combo_qty = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_公用_获取单个组合证券】*/
    call db_tdsecu.pra_tdsepb_GetSingleComboStock(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_combo_code,
        v_stock_code_no,
        v_error_code,
        v_error_info,
        v_row_id,
        v_busi_opor_no,
        v_co_no,
        v_exch_no,
        v_stock_code,
        v_combo_ratio,
        v_combo_qty,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.1.40.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取单个组合证券出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_co_no = v_co_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_code = v_stock_code;
    SET p_combo_ratio = v_combo_ratio;
    SET p_combo_qty = v_combo_qty;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_公用_事务提交
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_TransactionCommit;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_TransactionCommit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    commit;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_公用_查询获取t0机构
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_QueryGetT0Company;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_QueryGetT0Company(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_公用_查询获取t0机构】*/
    call db_tdsecu.pra_tdsepb_QueryGetT0Company(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.1.42.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_查询获取t0机构出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_归档更新t0资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_BackUpUpdateT0Capit;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_BackUpUpdateT0Capit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_co_busi_config_str varchar(64),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_deal_flag int;
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
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_deal_flag = p_deal_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易证券_公用_归档更新t0资金】*/
    call db_tdsecu.pra_tdsepb_BackUpUpdateT0Capit(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_co_busi_config_str,
        v_deal_flag,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.1.43.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_归档更新t0资金出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_新增指令自动分发规则
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_AddCommAutoDistributeRule;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_AddCommAutoDistributeRule(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_rule_name varchar(64),
    IN p_prior_type int,
    IN p_exch_group_no_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_stock_code_str varchar(4096),
    IN p_opor_no_str varchar(2048),
    IN p_distribute_last_trader int,
    IN p_distribute_by_jobs int,
    IN p_remark_info varchar(255),
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
    declare v_co_no int;
    declare v_rule_name varchar(64);
    declare v_prior_type int;
    declare v_exch_group_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_stock_code_str varchar(4096);
    declare v_opor_no_str varchar(2048);
    declare v_distribute_last_trader int;
    declare v_distribute_by_jobs int;
    declare v_remark_info varchar(255);
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
    SET v_co_no = p_co_no;
    SET v_rule_name = p_rule_name;
    SET v_prior_type = p_prior_type;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_stock_code_str = p_stock_code_str;
    SET v_opor_no_str = p_opor_no_str;
    SET v_distribute_last_trader = p_distribute_last_trader;
    SET v_distribute_by_jobs = p_distribute_by_jobs;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_新增指令自动分发规则】*/
        call db_tdsecu.pra_tdsepb_AddCommAutoDistributeRule(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_rule_name,
            v_prior_type,
            v_exch_group_no_str,
            v_exch_no_str,
            v_stock_type_str,
            v_stock_code_str,
            v_opor_no_str,
            v_distribute_last_trader,
            v_distribute_by_jobs,
            v_remark_info,
            v_error_code,
            v_error_info,
            v_row_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.44.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_新增指令自动分发规则出现错误！',v_mysql_message);
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

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_公用_修改指令自动分发规则
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_ModiCommAutoDistributeRule;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_ModiCommAutoDistributeRule(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_rule_name varchar(64),
    IN p_prior_type int,
    IN p_exch_group_no_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_stock_code_str varchar(4096),
    IN p_opor_no_str varchar(2048),
    IN p_distribute_last_trader int,
    IN p_distribute_by_jobs int,
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
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_rule_name varchar(64);
    declare v_prior_type int;
    declare v_exch_group_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_stock_code_str varchar(4096);
    declare v_opor_no_str varchar(2048);
    declare v_distribute_last_trader int;
    declare v_distribute_by_jobs int;
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
    SET v_row_id = p_row_id;
    SET v_co_no = p_co_no;
    SET v_rule_name = p_rule_name;
    SET v_prior_type = p_prior_type;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_stock_code_str = p_stock_code_str;
    SET v_opor_no_str = p_opor_no_str;
    SET v_distribute_last_trader = p_distribute_last_trader;
    SET v_distribute_by_jobs = p_distribute_by_jobs;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_修改指令自动分发规则】*/
        call db_tdsecu.pra_tdsepb_ModiCommAutoDistributeRule(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_co_no,
            v_rule_name,
            v_prior_type,
            v_exch_group_no_str,
            v_exch_no_str,
            v_stock_type_str,
            v_stock_code_str,
            v_opor_no_str,
            v_distribute_last_trader,
            v_distribute_by_jobs,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.45.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_修改指令自动分发规则出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_删除指令自动分发规则
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_DelCommAutoDistributeRule;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_DelCommAutoDistributeRule(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    declare v_row_id bigint;
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_删除指令自动分发规则】*/
        call db_tdsecu.pra_tdsepb_DelCommAutoDistributeRule(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.46.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_删除指令自动分发规则出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_查询指令自动分发规则
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_QueryCommAutoDistributeRule;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_QueryCommAutoDistributeRule(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
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
    declare v_query_opor_no int;
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_公用_查询指令自动分发规则】*/
    call db_tdsecu.pra_tdsepb_QueryCommAutoDistributeRule(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_query_opor_no,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.1.47.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_查询指令自动分发规则出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_获取单个指令自动分发规则
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_GetSingleCommAutoDistributeRule;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_GetSingleCommAutoDistributeRule(
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
    OUT p_busi_opor_no int,
    OUT p_co_no int,
    OUT p_rule_name varchar(64),
    OUT p_prior_type int,
    OUT p_exch_group_no_str varchar(2048),
    OUT p_exch_no_str varchar(2048),
    OUT p_stock_type_str varchar(2048),
    OUT p_stock_code_str varchar(4096),
    OUT p_opor_no_str varchar(2048),
    OUT p_distribute_last_trader int,
    OUT p_distribute_by_jobs int,
    OUT p_remark_info varchar(255),
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
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_rule_name varchar(64);
    declare v_prior_type int;
    declare v_exch_group_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_stock_code_str varchar(4096);
    declare v_opor_no_str varchar(2048);
    declare v_distribute_last_trader int;
    declare v_distribute_by_jobs int;
    declare v_remark_info varchar(255);
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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_busi_opor_no = 0;
    SET v_co_no = 0;
    SET v_rule_name = " ";
    SET v_prior_type = 0;
    SET v_exch_group_no_str = " ";
    SET v_exch_no_str = " ";
    SET v_stock_type_str = " ";
    SET v_stock_code_str = " ";
    SET v_opor_no_str = " ";
    SET v_distribute_last_trader = 0;
    SET v_distribute_by_jobs = 0;
    SET v_remark_info = " ";
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_公用_获取单个指令自动分发规则】*/
    call db_tdsecu.pra_tdsepb_GetSingleCommAutoDistributeRule(
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
        v_busi_opor_no,
        v_co_no,
        v_rule_name,
        v_prior_type,
        v_exch_group_no_str,
        v_exch_no_str,
        v_stock_type_str,
        v_stock_code_str,
        v_opor_no_str,
        v_distribute_last_trader,
        v_distribute_by_jobs,
        v_remark_info,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.1.48.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取单个指令自动分发规则出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_co_no = v_co_no;
    SET p_rule_name = v_rule_name;
    SET p_prior_type = v_prior_type;
    SET p_exch_group_no_str = v_exch_group_no_str;
    SET p_exch_no_str = v_exch_no_str;
    SET p_stock_type_str = v_stock_type_str;
    SET p_stock_code_str = v_stock_code_str;
    SET p_opor_no_str = v_opor_no_str;
    SET p_distribute_last_trader = v_distribute_last_trader;
    SET p_distribute_by_jobs = v_distribute_by_jobs;
    SET p_remark_info = v_remark_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_公用_融资融券归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_FinaLoanArchive;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_FinaLoanArchive(
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


        /* 调用【原子_交易证券_公用_融资融券归档】*/
        call db_tdsecu.pra_tdsepb_FinaLoanArchive(
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
            SET v_error_code = "tdsecuT.1.60.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_融资融券归档出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_组合归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_ComboArchive;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_ComboArchive(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_next_init_date int,
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
    declare v_next_init_date int;
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
    SET v_next_init_date = p_next_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_组合归档】*/
        call db_tdsecu.pra_tdsepb_ComboArchive(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_next_init_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.61.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_组合归档出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_策略归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_StrategyArchive;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_StrategyArchive(
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


        /* 调用【原子_交易证券_公用_策略归档】*/
        call db_tdsecu.pra_tdsepb_StrategyArchive(
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
            SET v_error_code = "tdsecuT.1.62.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_策略归档出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_T0归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_T0Archive;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_T0Archive(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_next_init_date int,
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
    declare v_next_init_date int;
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
    SET v_next_init_date = p_next_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_T0归档】*/
        call db_tdsecu.pra_tdsepb_T0Archive(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_next_init_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.63.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_T0归档出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_资金持仓归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_CapitPosiArchive;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_CapitPosiArchive(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_next_init_date int,
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
    declare v_next_init_date int;
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
    SET v_next_init_date = p_next_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_资金持仓归档】*/
        call db_tdsecu.pra_tdsepb_CapitPosiArchive(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_next_init_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.64.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_资金持仓归档出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_成交归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_StrikeArchive;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_StrikeArchive(
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


        /* 调用【原子_交易证券_公用_成交归档】*/
        call db_tdsecu.pra_tdsepb_StrikeArchive(
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
            SET v_error_code = "tdsecuT.1.65.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_成交归档出现错误！',v_mysql_message);
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

# 事务_交易证券_公用_订单归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_OrderArchive;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_OrderArchive(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_next_init_date int,
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
    declare v_next_init_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_avail_cal_flag int;
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_comm_opor int;
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_id bigint;
    declare v_order_batch_no int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_net_price_flag int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_combo_code varchar(32);
    declare v_order_date int;
    declare v_bond_rate_type int;
    declare v_exch_crncy_type varchar(3);
    declare v_impawn_ratio decimal(18,12);
    declare v_trade_code_no int;
    declare v_limit_actual_price decimal(16,9);
    declare v_exter_comm_flag int;
    declare v_comm_date int;
    declare v_comm_executor int;
    declare v_comm_oper_way varchar(2);
    declare v_comm_amt decimal(18,4);
    declare v_comm_dir int;
    declare v_comm_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_status varchar(2);
    declare v_strike_status varchar(2);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_combo_posi_id bigint;
    declare v_target_stock_code_no int;
    declare v_open_posi_date int;

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
    SET v_next_init_date = p_next_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_avail_cal_flag = 0;
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_asset_type = 0;
    SET v_stock_type = 0;
    SET v_comm_opor = 0;
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_id = 0;
    SET v_order_batch_no = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_net_price_flag = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_combo_code = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_bond_rate_type = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_impawn_ratio = 0;
    SET v_trade_code_no = 0;
    SET v_limit_actual_price = 0;
    SET v_exter_comm_flag = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_executor = 0;
    SET v_comm_oper_way = " ";
    SET v_comm_amt = 0;
    SET v_comm_dir = 0;
    SET v_comm_qty = 0;
    SET v_calc_dir = 1;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_status = "0";
    SET v_strike_status = "0";
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_combo_posi_id = 0;
    SET v_target_stock_code_no = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @开平仓权限# = 0; */
    set v_open_close_permission = 0;

    /* set @可用计算标志# = 0; */
    set v_avail_cal_flag = 0;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_订单归档】*/
        call db_tdsecu.pra_tdsepb_OrderArchive(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_next_init_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.66.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_订单归档出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #重算订单

        /* set @记录序号# = 0; */
        set v_row_id = 0;
        loop_label2:loop

            /* 调用【原子_交易证券_交易_循环锁定获取订单】*/
            call db_tdsecu.pra_tdsetd_LoopLockGetOrder(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_row_id,
                v_error_code,
                v_error_info,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_pass_no,
                v_out_acco,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_stock_code,
                v_target_code_no,
                v_asset_type,
                v_stock_type,
                v_comm_opor,
                v_external_no,
                v_comm_id,
                v_comm_batch_no,
                v_report_date,
                v_report_time,
                v_report_no,
                v_order_id,
                v_order_batch_no,
                v_order_time,
                v_order_dir,
                v_price_type,
                v_order_price,
                v_order_qty,
                v_order_status,
                v_wtdraw_qty,
                v_strike_amt,
                v_strike_qty,
                v_all_fee,
                v_stamp_tax,
                v_trans_fee,
                v_brkage_fee,
                v_SEC_charges,
                v_other_fee,
                v_trade_commis,
                v_other_commis,
                v_par_value,
                v_bond_accr_intrst,
                v_net_price_flag,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_rsp_info,
                v_compli_trig_id,
                v_remark_info,
                v_order_oper_way,
                v_busi_opor_no,
                v_combo_code,
                v_order_date,
                v_bond_rate_type,
                v_exch_crncy_type,
                v_impawn_ratio,
                v_trade_code_no);

            /* if @错误编码#="0"  then */
            if v_error_code="0"  then

                /* set @记录序号# = @订单序号#; */
                set v_row_id = v_order_id;

                /* set @订单数量# = @订单数量# - @撤单数量# - @成交数量#; */
                set v_order_qty = v_order_qty - v_wtdraw_qty - v_strike_qty;

                /* if @订单数量# > 0 then */
                if v_order_qty > 0 then

                    /* if @指令序号# > 0 then */
                    if v_comm_id > 0 then

                        /* 调用【原子_交易证券_指令_校验订单指令】*/
                        call db_tdsecu.pra_tdseap_CheckOrderComm(
                            v_opor_co_no,
                            v_opor_no,
                            v_oper_mac,
                            v_oper_ip_addr,
                            v_oper_info,
                            v_oper_way,
                            v_func_code,
                            v_comm_id,
                            v_order_date,
                            v_order_dir,
                            v_order_price,
                            v_order_qty,
                            v_price_type,
                            v_error_code,
                            v_error_info,
                            v_limit_actual_price,
                            v_comm_batch_no,
                            v_exter_comm_flag,
                            v_comm_date,
                            v_comm_executor,
                            v_comm_opor,
                            v_comm_oper_way,
                            v_comm_amt);
                        if v_error_code = "1" then
                            SET v_error_code = "tdsecuT.1.66.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_校验订单指令出现错误！',v_mysql_message);
                            end if;
                            ROLLBACK;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            ROLLBACK;
                            leave label_pro;
                        end if;


                        /* set @指令方向# = @订单方向#; */
                        set v_comm_dir = v_order_dir;

                        /* set @指令数量# = @订单数量#; */
                        set v_comm_qty = v_order_qty;

                        /* set @计算方向# = 《计算方向-减去》; */
                        set v_calc_dir = -1;

                        /* 调用【原子_交易证券_公用_计算指令冻结金额和数量】*/
                        call db_tdsecu.pra_tdsepb_GetCommFrozenAmtAndQty(
                            v_opor_co_no,
                            v_opor_no,
                            v_oper_mac,
                            v_oper_ip_addr,
                            v_oper_info,
                            v_oper_way,
                            v_func_code,
                            v_stock_type,
                            v_comm_dir,
                            v_limit_actual_price,
                            v_comm_qty,
                            v_net_price_flag,
                            v_par_value,
                            v_bond_accr_intrst,
                            v_bond_rate_type,
                            v_calc_dir,
                            v_error_code,
                            v_error_info,
                            v_comm_frozen_amt,
                            v_comm_frozen_qty);
                        if v_error_code = "1" then
                            SET v_error_code = "tdsecuT.1.66.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令冻结金额和数量出现错误！',v_mysql_message);
                            end if;
                            ROLLBACK;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            ROLLBACK;
                            leave label_pro;
                        end if;


                        /* 调用【原子_交易证券_指令_下单更新指令】*/
                        call db_tdsecu.pra_tdseap_OrderUpdateComm(
                            v_opor_co_no,
                            v_opor_no,
                            v_oper_mac,
                            v_oper_ip_addr,
                            v_oper_info,
                            v_oper_way,
                            v_func_code,
                            v_comm_id,
                            v_comm_frozen_amt,
                            v_comm_frozen_qty,
                            v_order_qty,
                            v_error_code,
                            v_error_info,
                            v_limit_actual_price,
                            v_exter_comm_flag,
                            v_comm_comple_date,
                            v_comm_comple_time,
                            v_comm_status,
                            v_strike_status);
                        if v_error_code = "1" then
                            SET v_error_code = "tdsecuT.1.66.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_下单更新指令出现错误！',v_mysql_message);
                            end if;
                            ROLLBACK;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            ROLLBACK;
                            leave label_pro;
                        end if;

                        #计算指令变动金额和数量

                        /* set @计算方向# = 《计算方向-减去》; */
                        set v_calc_dir = -1;

                        /* 调用【原子_交易证券_公用_计算指令变动金额和数量】*/
                        call db_tdsecu.pra_tdsepb_GetCommOccurAmtAndQty(
                            v_opor_co_no,
                            v_opor_no,
                            v_oper_mac,
                            v_oper_ip_addr,
                            v_oper_info,
                            v_oper_way,
                            v_func_code,
                            v_stock_type,
                            v_comm_dir,
                            v_limit_actual_price,
                            v_comm_qty,
                            v_net_price_flag,
                            v_par_value,
                            v_bond_accr_intrst,
                            v_bond_rate_type,
                            v_calc_dir,
                            v_error_code,
                            v_error_info,
                            v_comm_occur_amt,
                            v_comm_occur_qty);
                        if v_error_code = "1" then
                            SET v_error_code = "tdsecuT.1.66.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
                            end if;
                            ROLLBACK;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            ROLLBACK;
                            leave label_pro;
                        end if;

                    end if;
                    #计算下单交易变动金额和数量

                    /* 调用【原子_交易证券_公用_计算下单交易变动金额和数量】*/
                    call db_tdsecu.pra_tdsepb_GetOrderTradeOccurAmtAndQty(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_stock_type,
                        v_order_dir,
                        v_order_qty,
                        v_order_price,
                        v_order_frozen_amt,
                        v_net_price_flag,
                        v_par_value,
                        v_bond_accr_intrst,
                        v_bond_rate_type,
                        v_error_code,
                        v_error_info,
                        v_trade_occur_amt,
                        v_trade_occur_qty);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.1.66.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算下单交易变动金额和数量出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;


                    /* set @组合持仓序号# = 0; */
                    set v_combo_posi_id = 0;

                    /* set @目标证券代码编号# = 0; */
                    set v_target_stock_code_no = 0;

                    /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
                    call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
                        v_exch_crncy_type,
                        v_comm_id,
                        v_order_id,
                        v_exch_no,
                        v_stock_code,
                        v_stock_type,
                        v_asset_type,
                        v_order_dir,
                        v_impawn_ratio,
                        v_stock_acco_no,
                        v_stock_code_no,
                        v_trade_code_no,
                        v_target_code_no,
                        v_comm_occur_amt,
                        v_comm_occur_qty,
                        v_trade_occur_amt,
                        v_trade_occur_qty,
                        v_is_record_jour,
                        v_order_oper_way,
                        v_busi_opor_no,
                        v_open_close_permission,
                        v_avail_cal_flag,
                        v_combo_code,
                        v_combo_posi_id,
                        v_target_stock_code_no,
                        v_error_code,
                        v_error_info,
                        v_open_posi_date);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.1.66.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;

                end if;
            else

                /* set @错误编码#="0"; */
                set v_error_code="0";
                SET v_error_info = " ";
                leave  loop_label2;
            end if;
        end loop;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_公用_指令归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsepb_CommArchive;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsepb_CommArchive(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_next_init_date int,
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
    declare v_next_init_date int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_avail_cal_flag int;
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_comm_id bigint;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_date int;
    declare v_comm_time int;
    declare v_comm_batch_no int;
    declare v_comm_status varchar(2);
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_flag int;
    declare v_basket_id bigint;
    declare v_comm_amt decimal(18,4);
    declare v_strike_amt decimal(18,4);
    declare v_comm_oper_way varchar(2);
    declare v_strike_status varchar(2);
    declare v_comm_appr_status varchar(2);
    declare v_exter_comm_flag int;
    declare v_oper_func_code varchar(16);
    declare v_combo_code varchar(32);
    declare v_comm_remark_info varchar(1024);
    declare v_wtdraw_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_invest_type int;
    declare v_order_dir int;
    declare v_trade_occur_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_debt_type int;
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
    SET v_next_init_date = p_next_init_date;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_avail_cal_flag = 0;
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_comm_id = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_batch_no = 0;
    SET v_comm_status = "0";
    SET v_comm_opor = 0;
    SET v_comm_executor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_qty = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_flag = 0;
    SET v_basket_id = 0;
    SET v_comm_amt = 0;
    SET v_strike_amt = 0;
    SET v_comm_oper_way = " ";
    SET v_strike_status = "0";
    SET v_comm_appr_status = " ";
    SET v_exter_comm_flag = 0;
    SET v_oper_func_code = " ";
    SET v_combo_code = " ";
    SET v_comm_remark_info = " ";
    SET v_wtdraw_qty = 0;
    SET v_calc_dir = 1;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_invest_type = 0;
    SET v_order_dir = 0;
    SET v_trade_occur_qty = 0;
    SET v_trade_occur_amt = 0;
    SET v_debt_qty = 0;
    SET v_debt_type = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @开平仓权限# = 0; */
    set v_open_close_permission = 0;

    /* set @可用计算标志# = 0; */
    set v_avail_cal_flag = 0;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_指令归档】*/
        call db_tdsecu.pra_tdsepb_CommArchive(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_next_init_date,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.1.67.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_指令归档出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #重算指令

        /* set @记录序号# = 0; */
        set v_row_id = 0;
        loop_label:loop

            /* 调用【原子_交易证券_指令_循环锁定获取指令】*/
            call db_tdsecu.pra_tdseap_LoopLockGetComm(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_row_id,
                v_error_code,
                v_error_info,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_pass_no,
                v_out_acco,
                v_comm_id,
                v_exch_crncy_type,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_stock_code,
                v_target_code_no,
                v_trade_code_no,
                v_stock_type,
                v_asset_type,
                v_comm_date,
                v_comm_time,
                v_comm_batch_no,
                v_comm_status,
                v_comm_opor,
                v_comm_executor,
                v_comm_dir,
                v_comm_limit_price,
                v_limit_actual_price,
                v_comm_qty,
                v_order_qty,
                v_comm_cancel_qty,
                v_strike_qty,
                v_net_price_flag,
                v_par_value,
                v_impawn_ratio,
                v_intrst_days,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_comm_begin_date,
                v_comm_end_date,
                v_comm_begin_time,
                v_comm_end_time,
                v_comm_comple_flag,
                v_basket_id,
                v_comm_amt,
                v_strike_amt,
                v_comm_oper_way,
                v_strike_status,
                v_comm_appr_status,
                v_exter_comm_flag,
                v_oper_func_code,
                v_combo_code,
                v_comm_remark_info);

            /* if @错误编码#="0"  then */
            if v_error_code="0"  then

                /* set @记录序号# = @指令序号#; */
                set v_row_id = v_comm_id;

                /* if @指令方向# <> 《指令方向-基金申购》 and @指令方向# <> 《指令方向-基金赎回》 and  @指令方向#  <> 《指令方向-基金转换》 then */
                if v_comm_dir <> 9 and v_comm_dir <> 10 and  v_comm_dir  <> 12 then
                    #未成交的订单直接回滚，那订单数量=成交数量，差额返回

                    /* set @撤单数量# = @订单数量# - @成交数量#; */
                    set v_wtdraw_qty = v_order_qty - v_strike_qty;

                    /* set @指令撤销数量# = 0; */
                    set v_comm_cancel_qty = 0;

                    /* 调用【原子_交易证券_指令_撤销更新指令】*/
                    call db_tdsecu.pra_tdseap_CancelUpdateComm(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_comm_id,
                        v_comm_cancel_qty,
                        v_wtdraw_qty,
                        v_error_code,
                        v_error_info,
                        v_limit_actual_price,
                        v_comm_status,
                        v_comm_date,
                        v_comm_batch_no,
                        v_comm_executor,
                        v_comm_oper_way,
                        v_comm_dir,
                        v_comm_amt);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.1.67.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销更新指令出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;

                    #计算指令变动金额和数量

                    /* set @计算方向# = 《计算方向-加上》; */
                    set v_calc_dir = 1;

                    /* set @指令数量# = @指令数量# - @成交数量# - @指令撤销数量#; */
                    set v_comm_qty = v_comm_qty - v_strike_qty - v_comm_cancel_qty;

                    /* if @指令方向# = 《指令方向-融资买入》 or @指令方向# = 《指令方向-融券卖出》 or @指令方向# = 《指令方向-买券还券》 or @指令方向# = 《指令方向-卖券还款》 or @指令方向# = 《指令方向-直接还款》 or @指令方向# = 《指令方向-直接还券》  then */
                    if v_comm_dir = 5 or v_comm_dir = 6 or v_comm_dir = 8 or v_comm_dir = 7 or v_comm_dir = 14 or v_comm_dir = 15  then

                        /* 调用【原子_交易证券_公用_计算融资融券指令变动金额和数量】*/
                        call db_tdsecu.pra_tdsepb_GetFinaLoanCommOccurAmtAndQty(
                            v_opor_co_no,
                            v_opor_no,
                            v_oper_mac,
                            v_oper_ip_addr,
                            v_oper_info,
                            v_oper_way,
                            v_func_code,
                            v_stock_type,
                            v_comm_dir,
                            v_limit_actual_price,
                            v_comm_qty,
                            v_net_price_flag,
                            v_par_value,
                            v_bond_accr_intrst,
                            v_bond_rate_type,
                            v_calc_dir,
                            v_comm_amt,
                            v_error_code,
                            v_error_info,
                            v_comm_occur_amt,
                            v_comm_occur_qty);
                        if v_error_code = "1" then
                            SET v_error_code = "tdsecuT.1.67.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券指令变动金额和数量出现错误！',v_mysql_message);
                            end if;
                            ROLLBACK;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            ROLLBACK;
                            leave label_pro;
                        end if;


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
                            SET v_error_code = "tdsecuT.1.67.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令资金持仓出现错误！',v_mysql_message);
                            end if;
                            ROLLBACK;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            ROLLBACK;
                            leave label_pro;
                        end if;


                        /* set @投资类型#=《投资类型-二级市场交易性金融资产》 ; */
                        set v_invest_type=1 ;

                        /* set @订单方向#=@指令方向# ; */
                        set v_order_dir=v_comm_dir ;

                        /* set @交易变动数量#=0 ; */
                        set v_trade_occur_qty=0 ;

                        /* set @交易变动金额#=0 ; */
                        set v_trade_occur_amt=0 ;

                        /* set @初始化日期# = @下日初始化日期#; */
                        set v_init_date = v_next_init_date;

                        /* set  @负债数量# = 0; */
                        set  v_debt_qty = 0;

                        /* 调用【原子_交易证券_账户_更新融资融券指令交易资金持仓负债】*/
                        call db_tdsecu.pra_tdseac_UpdateFinaLoanApprDebt(
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
                            v_exch_crncy_type,
                            v_comm_id,
                            v_exch_no,
                            v_stock_code,
                            v_stock_type,
                            v_asset_type,
                            v_invest_type,
                            v_order_dir,
                            v_stock_acco_no,
                            v_stock_code_no,
                            v_trade_code_no,
                            v_comm_occur_amt,
                            v_comm_occur_qty,
                            v_trade_occur_amt,
                            v_trade_occur_qty,
                            v_is_record_jour,
                            v_debt_qty,
                            v_error_code,
                            v_error_info,
                            v_debt_type);
                        if v_error_code = "1" then
                            SET v_error_code = "tdsecuT.1.67.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新融资融券指令交易资金持仓负债出现错误！',v_mysql_message);
                            end if;
                            ROLLBACK;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            ROLLBACK;
                            leave label_pro;
                        end if;

                    else

                        /* 调用【原子_交易证券_公用_计算指令变动金额和数量】*/
                        call db_tdsecu.pra_tdsepb_GetCommOccurAmtAndQty(
                            v_opor_co_no,
                            v_opor_no,
                            v_oper_mac,
                            v_oper_ip_addr,
                            v_oper_info,
                            v_oper_way,
                            v_func_code,
                            v_stock_type,
                            v_comm_dir,
                            v_limit_actual_price,
                            v_comm_qty,
                            v_net_price_flag,
                            v_par_value,
                            v_bond_accr_intrst,
                            v_bond_rate_type,
                            v_calc_dir,
                            v_error_code,
                            v_error_info,
                            v_comm_occur_amt,
                            v_comm_occur_qty);
                        if v_error_code = "1" then
                            SET v_error_code = "tdsecuT.1.67.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
                            end if;
                            ROLLBACK;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            ROLLBACK;
                            leave label_pro;
                        end if;


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
                            SET v_error_code = "tdsecuT.1.67.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令资金持仓出现错误！',v_mysql_message);
                            end if;
                            ROLLBACK;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            ROLLBACK;
                            leave label_pro;
                        end if;

                    end if;
                end if;
            else

                /* set @错误编码#="0"; */
                set v_error_code="0";
                SET v_error_info = " ";
                leave  loop_label;
            end if;
        end loop;
    #重新汇总指令时，重新计算汇总指令暂停状态。| 明细全为暂停，才暂停。Modify by wjp 20181014 | update_times 等没更新。

    /* set @更新日期#= date_format(curdate(),'%Y%m%d'); */
    set v_update_date= date_format(curdate(),'%Y%m%d');

    /* set @更新时间#= date_format(curtime(),'%H%i%s'); */
    set v_update_time= date_format(curtime(),'%H%i%s');

    /* update   ~交易证券_指令_指令汇总表^  a set a.{指令汇总状态} = 《指令汇总状态-暂停执行》  ,a.{更新日期}=@更新日期#,a.{更新时间}=@更新时间#,a.{更新次数}=a.{更新次数}+1  where  a.{指令批号} in (select t1.{指令批号}  from 
(select count(*) a,{指令批号}  from ~交易证券_指令_指令表^ t where {指令状态}=《指令状态-暂停执行》 group by {指令批号},{机构编号}) as t1,
(select count(*) b,{指令批号}  from ~交易证券_指令_指令表^ t group by {指令批号},{机构编号}) as t2 WHERE t1.{指令批号}= t2.{指令批号} and t1.a=t2.b); */
    update   db_tdsecu.tb_tdseap_sumcommand  a set a.comm_sum_status = "7"  ,a.update_date=v_update_date,a.update_time=v_update_time,a.update_times=a.update_times+1  where  a.comm_batch_no in (select t1.comm_batch_no  from 
    (select count(*) a,comm_batch_no  from db_tdsecu.tb_tdseap_command t where comm_status="7" group by comm_batch_no,co_no) as t1,
    (select count(*) b,comm_batch_no  from db_tdsecu.tb_tdseap_command t group by comm_batch_no,co_no) as t2 WHERE t1.comm_batch_no= t2.comm_batch_no and t1.a=t2.b);
    #根据订单历史表 重算 指令策略数量。

    /* update  ~交易证券_指令_指令表^ a  set {策略订单数量} = (select ifnull(sum({成交数量}),0) from  ~历史_交易证券_交易_订单表^ b where a.{机构编号}=b.{机构编号} and a.{记录序号} =b.{指令序号} and b.{策略序号} <>0), {策略占用数量} =(select ifnull(sum({成交数量}),0) from  ~历史_交易证券_交易_订单表^ c where a.{机构编号}=c.{机构编号} and a.{记录序号} =c.{指令序号} and c.{策略序号} <>0) ; */
    update  db_tdsecu.tb_tdseap_command a  set strategy_order_qty = (select ifnull(sum(strike_qty),0) from  db_tdsecu_his.tb_tdsetd_order_his b where a.co_no=b.co_no and a.row_id =b.comm_id and b.strategy_id <>0), strategy_capt_qty =(select ifnull(sum(strike_qty),0) from  db_tdsecu_his.tb_tdsetd_order_his c where a.co_no=c.co_no and a.row_id =c.comm_id and c.strategy_id <>0) ;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


