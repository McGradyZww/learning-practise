DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_账户运维_查询全部期货账户
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfuacbk_QueryAllFutuAcco;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfuacbk_QueryAllFutuAcco(
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
    IN p_futu_acco_status varchar(2),
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
    declare v_futu_acco_no int;
    declare v_futu_acco_status varchar(2);
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_futu_acco_status = p_futu_acco_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品期货_账户运维_查询全部期货账户】*/
    call db_pdfutu.pra_pdfuacbk_QueryAllFutuAcco(
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
        v_futu_acco_status,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.7.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_账户运维_查询全部期货账户出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_账户运维_归档产品期货数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfuacbk_BackUpPdFutuData;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfuacbk_BackUpPdFutuData(
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


        /* 调用【原子_产品期货_账户_归档产品期货账户数据】*/
        call db_pdfutu.pra_pdfuac_BackUpPdFutuAccoData(
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
            SET v_error_code = "pdfutuT.7.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_账户_归档产品期货账户数据出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务开始] */
    START TRANSACTION;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_资金_归档产品期货资金数据】*/
        call db_pdfutu.pra_pdfuca_BackUpPdFutuCaptialData(
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
            SET v_error_code = "pdfutuT.7.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_资金_归档产品期货资金数据出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务开始] */
    START TRANSACTION;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_持仓_归档产品期货持仓数据】*/
        call db_pdfutu.pra_pdfupo_BackUpPdFutuPosiData(
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
            SET v_error_code = "pdfutuT.7.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_归档产品期货持仓数据出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务开始] */
    START TRANSACTION;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_账户运维_查询期货账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfuacbk_QueryFutuAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfuacbk_QueryFutuAccoInfo(
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
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_status_str varchar(64),
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
    declare v_futu_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_status_str varchar(64);
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_status_str = p_futu_acco_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* [变量补分隔符][@交易编码状态串#] */
    set v_futu_acco_status_str = concat(";", v_futu_acco_status_str,";");


    /* 调用【原子_产品期货_账户运维_查询期货账户信息】*/
    call db_pdfutu.pra_pdfuacbk_QueryFutuAccoInfo(
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
        v_exch_no_str,
        v_futu_acco_status_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.7.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_账户运维_查询期货账户信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


