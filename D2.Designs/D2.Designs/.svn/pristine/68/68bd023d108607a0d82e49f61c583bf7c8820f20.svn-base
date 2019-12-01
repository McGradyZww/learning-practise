DELIMITER ;;
use db_pub;;

# 事务_公共_用户_新增操作员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_AddOperatorInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_user_AddOperatorInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_co_no int,
    IN p_opor_name varchar(64),
    IN p_opor_type int,
    IN p_target_opor_pwd varchar(64),
    IN p_conta_addr varchar(255),
    IN p_oper_rights int,
    IN p_phone_number varchar(16),
    IN p_email varchar(255),
    IN p_is_trader int,
    IN p_trader_no int,
    IN p_allow_login_type varchar(64),
    IN p_allow_oper_ip_addr varchar(255),
    IN p_allow_oper_mac varchar(255),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    IN p_opor_qty_max int,
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
    declare v_target_opor_no int;
    declare v_co_no int;
    declare v_opor_name varchar(64);
    declare v_opor_type int;
    declare v_target_opor_pwd varchar(64);
    declare v_conta_addr varchar(255);
    declare v_oper_rights int;
    declare v_phone_number varchar(16);
    declare v_email varchar(255);
    declare v_is_trader int;
    declare v_trader_no int;
    declare v_allow_login_type varchar(64);
    declare v_allow_oper_ip_addr varchar(255);
    declare v_allow_oper_mac varchar(255);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_opor_qty_max int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_mark varchar(2048);
    declare v_log_level int;
    declare v_log_error_code varchar(32);
    declare v_log_error_info varchar(255);

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
    SET v_target_opor_no = p_target_opor_no;
    SET v_co_no = p_co_no;
    SET v_opor_name = p_opor_name;
    SET v_opor_type = p_opor_type;
    SET v_target_opor_pwd = p_target_opor_pwd;
    SET v_conta_addr = p_conta_addr;
    SET v_oper_rights = p_oper_rights;
    SET v_phone_number = p_phone_number;
    SET v_email = p_email;
    SET v_is_trader = p_is_trader;
    SET v_trader_no = p_trader_no;
    SET v_allow_login_type = p_allow_login_type;
    SET v_allow_oper_ip_addr = p_allow_oper_ip_addr;
    SET v_allow_oper_mac = p_allow_oper_mac;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_opor_qty_max = p_opor_qty_max;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_mark = " ";
    SET v_log_level = 0;
    SET v_log_error_code = "0";
    SET v_log_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户_新增操作员信息】*/
        call db_pub.pra_user_AddOperatorInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_target_opor_no,
            v_co_no,
            v_opor_name,
            v_opor_type,
            v_target_opor_pwd,
            v_conta_addr,
            v_oper_rights,
            v_phone_number,
            v_email,
            v_is_trader,
            v_trader_no,
            v_allow_login_type,
            v_allow_oper_ip_addr,
            v_allow_oper_mac,
            v_oper_remark_info,
            v_menu_no,
            v_opor_qty_max,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.5.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_新增操作员信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @操作标志# =  concat(@操作员编号#," 进行了新增操作员信息的操作:",@目标操作员编号#); */
        set v_oper_mark =  concat(v_opor_no," 进行了新增操作员信息的操作:",v_target_opor_no);

        /* set @日志级别# = 2; */
        set v_log_level = 2;

        /* set @日志错误编码# = "0"; */
        set v_log_error_code = "0";

        /* set @日志错误信息# = " "; */
        set v_log_error_info = " ";

        /* 调用【原子_公共_消息_增加操作日志】*/
        call db_pub.pra_msage_AddOperLog(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_menu_no,
            v_oper_mark,
            v_log_level,
            v_log_error_code,
            v_log_error_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.5.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_消息_增加操作日志出现错误！',v_mysql_message);
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

# 事务_公共_用户_修改操作员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_ModiOperatorInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_user_ModiOperatorInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_opor_name varchar(64),
    IN p_opor_type int,
    IN p_conta_addr varchar(255),
    IN p_phone_number varchar(16),
    IN p_email varchar(255),
    IN p_is_trader int,
    IN p_trader_no int,
    IN p_allow_login_type varchar(64),
    IN p_allow_oper_ip_addr varchar(255),
    IN p_allow_oper_mac varchar(255),
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
    declare v_target_opor_no int;
    declare v_opor_name varchar(64);
    declare v_opor_type int;
    declare v_conta_addr varchar(255);
    declare v_phone_number varchar(16);
    declare v_email varchar(255);
    declare v_is_trader int;
    declare v_trader_no int;
    declare v_allow_login_type varchar(64);
    declare v_allow_oper_ip_addr varchar(255);
    declare v_allow_oper_mac varchar(255);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_mark varchar(2048);
    declare v_log_level int;
    declare v_log_error_code varchar(32);
    declare v_log_error_info varchar(255);

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
    SET v_target_opor_no = p_target_opor_no;
    SET v_opor_name = p_opor_name;
    SET v_opor_type = p_opor_type;
    SET v_conta_addr = p_conta_addr;
    SET v_phone_number = p_phone_number;
    SET v_email = p_email;
    SET v_is_trader = p_is_trader;
    SET v_trader_no = p_trader_no;
    SET v_allow_login_type = p_allow_login_type;
    SET v_allow_oper_ip_addr = p_allow_oper_ip_addr;
    SET v_allow_oper_mac = p_allow_oper_mac;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_mark = " ";
    SET v_log_level = 0;
    SET v_log_error_code = "0";
    SET v_log_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户_修改操作员信息】*/
        call db_pub.pra_user_ModiOperatorInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_target_opor_no,
            v_opor_name,
            v_opor_type,
            v_conta_addr,
            v_phone_number,
            v_email,
            v_is_trader,
            v_trader_no,
            v_allow_login_type,
            v_allow_oper_ip_addr,
            v_allow_oper_mac,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.5.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_修改操作员信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @操作标志# =  concat(@操作员编号#," 进行了修改操作员信息的操作:",@目标操作员编号#); */
        set v_oper_mark =  concat(v_opor_no," 进行了修改操作员信息的操作:",v_target_opor_no);

        /* set @日志级别# = 2; */
        set v_log_level = 2;

        /* set @日志错误编码# = "0"; */
        set v_log_error_code = "0";

        /* set @日志错误信息# = " "; */
        set v_log_error_info = " ";

        /* 调用【原子_公共_消息_增加操作日志】*/
        call db_pub.pra_msage_AddOperLog(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_menu_no,
            v_oper_mark,
            v_log_level,
            v_log_error_code,
            v_log_error_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.5.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_消息_增加操作日志出现错误！',v_mysql_message);
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

# 事务_公共_用户_获取操作员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_GetOperatorInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_user_GetOperatorInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_opor_type int,
    OUT p_opor_name varchar(64),
    OUT p_oper_rights int,
    OUT p_is_trader int,
    OUT p_trader_no int,
    OUT p_allow_login_type varchar(64),
    OUT p_allow_oper_ip_addr varchar(255),
    OUT p_allow_oper_mac varchar(255),
    OUT p_conta_addr varchar(255),
    OUT p_phone_number varchar(16),
    OUT p_email varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_query_opor_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_opor_type int;
    declare v_opor_name varchar(64);
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_trader_no int;
    declare v_allow_login_type varchar(64);
    declare v_allow_oper_ip_addr varchar(255);
    declare v_allow_oper_mac varchar(255);
    declare v_conta_addr varchar(255);
    declare v_phone_number varchar(16);
    declare v_email varchar(255);

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
    SET v_query_opor_no = p_query_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_opor_type = 0;
    SET v_opor_name = " ";
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_trader_no = 0;
    SET v_allow_login_type = " ";
    SET v_allow_oper_ip_addr = " ";
    SET v_allow_oper_mac = " ";
    SET v_conta_addr = " ";
    SET v_phone_number = " ";
    SET v_email = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户_获取操作员信息】*/
        call db_pub.pra_user_GetOperatorInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_query_opor_no,
            v_error_code,
            v_error_info,
            v_opor_type,
            v_opor_name,
            v_oper_rights,
            v_is_trader,
            v_trader_no,
            v_allow_login_type,
            v_allow_oper_ip_addr,
            v_allow_oper_mac,
            v_conta_addr,
            v_phone_number,
            v_email);
        if v_error_code = "1" then
            SET v_error_code = "pubT.5.3.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员信息出现错误！',v_mysql_message);
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
    SET p_opor_type = v_opor_type;
    SET p_opor_name = v_opor_name;
    SET p_oper_rights = v_oper_rights;
    SET p_is_trader = v_is_trader;
    SET p_trader_no = v_trader_no;
    SET p_allow_login_type = v_allow_login_type;
    SET p_allow_oper_ip_addr = v_allow_oper_ip_addr;
    SET p_allow_oper_mac = v_allow_oper_mac;
    SET p_conta_addr = v_conta_addr;
    SET p_phone_number = v_phone_number;
    SET p_email = v_email;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户_查询操作员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_QueryOperatorInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_user_QueryOperatorInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_co_no int,
    IN p_is_trader int,
    IN p_opor_type_str varchar(64),
    IN p_opor_status_str varchar(64),
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
    declare v_query_opor_no int;
    declare v_co_no int;
    declare v_is_trader int;
    declare v_opor_type_str varchar(64);
    declare v_opor_status_str varchar(64);
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_co_no = p_co_no;
    SET v_is_trader = p_is_trader;
    SET v_opor_type_str = p_opor_type_str;
    SET v_opor_status_str = p_opor_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @操作员类型串# = concat(";", @操作员类型串#, ";"); */
    set v_opor_type_str = concat(";", v_opor_type_str, ";");

    /* set @操作员状态串# = concat(";", @操作员状态串#, ";"); */
    set v_opor_status_str = concat(";", v_opor_status_str, ";");

    /* 调用【原子_公共_用户_查询操作员信息】*/
    call db_pub.pra_user_QueryOperatorInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_opor_no,
        v_co_no,
        v_is_trader,
        v_opor_type_str,
        v_opor_status_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.5.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_查询操作员信息出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_用户_更新操作员状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_UpdateOperatorStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_user_UpdateOperatorStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_opor_status varchar(2),
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
    declare v_target_opor_no int;
    declare v_opor_status varchar(2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_allow_opor_no int;
    declare v_oper_mark varchar(2048);
    declare v_log_level int;
    declare v_log_error_code varchar(32);
    declare v_log_error_info varchar(255);

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
    SET v_target_opor_no = p_target_opor_no;
    SET v_opor_status = p_opor_status;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_allow_opor_no = 0;
    SET v_oper_mark = " ";
    SET v_log_level = 0;
    SET v_log_error_code = "0";
    SET v_log_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户_检查操作员状态】*/
    call db_pub.pra_user_CheckOperatorStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_opor_status,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.5.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户_更新操作员状态】*/
        call db_pub.pra_user_UpdateOperatorStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_target_opor_no,
            v_opor_status,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.5.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_更新操作员状态出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @操作员状态# = 《操作员状态-注销》 then */
        if v_opor_status = "3" then

            /* set @可操作操作员编号# = @目标操作员编号#; */
            set v_allow_opor_no = v_target_opor_no;

            /* 调用【原子_公共_用户客户端_更新操作员可操作操作员注销标志】*/
            call db_pub.pra_userclient_UpdateOporAllowOporAbolishStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_allow_opor_no,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pubT.5.6.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_更新操作员可操作操作员注销标志出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

        /* if @操作员状态#=《操作员状态-冻结》 then */
        if v_opor_status="2" then

             /* set @操作标志# =  concat(@操作员编号#,"冻结了操作员:",@目标操作员编号#); */
             set v_oper_mark =  concat(v_opor_no,"冻结了操作员:",v_target_opor_no);

        /* elseif @操作员状态#=《操作员状态-正常》 then */
        elseif v_opor_status="1" then

             /* set @操作标志# =  concat(@操作员编号#,"解冻了操作员:",@目标操作员编号#); */
             set v_oper_mark =  concat(v_opor_no,"解冻了操作员:",v_target_opor_no);

        /* elseif @操作员状态#=《操作员状态-注销》 then */
        elseif v_opor_status="3" then

             /* set @操作标志# =  concat(@操作员编号#,"注销了操作员:",@目标操作员编号#); */
             set v_oper_mark =  concat(v_opor_no,"注销了操作员:",v_target_opor_no);
        end if;

        /* set @日志级别# = 2; */
        set v_log_level = 2;

        /* set @日志错误编码# = "0"; */
        set v_log_error_code = "0";

        /* set @日志错误信息# = " "; */
        set v_log_error_info = " ";

        /* 调用【原子_公共_消息_增加操作日志】*/
        call db_pub.pra_msage_AddOperLog(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_menu_no,
            v_oper_mark,
            v_log_level,
            v_log_error_code,
            v_log_error_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.5.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_消息_增加操作日志出现错误！',v_mysql_message);
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

# 事务_公共_用户_修改操作员密码
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_UpdateOperatorPassword;;
DELIMITER ;;
CREATE PROCEDURE prt_user_UpdateOperatorPassword(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_opor_old_pwd varchar(64),
    IN p_opor_new_pwd varchar(64),
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
    declare v_opor_old_pwd varchar(64);
    declare v_opor_new_pwd varchar(64);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_target_opor_no int;
    declare v_oper_remark_info varchar(255);

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
    SET v_opor_old_pwd = p_opor_old_pwd;
    SET v_opor_new_pwd = p_opor_new_pwd;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_target_opor_no = 0;
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户_校验操作员密码】*/
    call db_pub.pra_user_CheckOperatorPassword(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_old_pwd,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.5.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_校验操作员密码出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@操作员原密码# = @操作员新密码#][210][@操作员编号#] */
    if v_opor_old_pwd = v_opor_new_pwd then
        
        SET v_error_code = "pubT.5.9.210";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* set @目标操作员编号# = @操作员编号#; */
        set v_target_opor_no = v_opor_no;

        /* set @操作备注# = "修改操作员密码"; */
        set v_oper_remark_info = "修改操作员密码";

        /* 调用【原子_公共_用户_修改操作员密码】*/
        call db_pub.pra_user_UpdateOperatorPassword(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_target_opor_no,
            v_opor_new_pwd,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.5.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_修改操作员密码出现错误！',v_mysql_message);
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

# 事务_公共_用户_重置操作员密码
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_ResetOperatorPassword;;
DELIMITER ;;
CREATE PROCEDURE prt_user_ResetOperatorPassword(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_opor_new_pwd varchar(64),
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
    declare v_target_opor_no int;
    declare v_opor_new_pwd varchar(64);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_opor_old_pwd varchar(64);
    declare v_oper_remark_info varchar(255);
    declare v_oper_mark varchar(2048);
    declare v_log_level int;
    declare v_log_error_code varchar(32);
    declare v_log_error_info varchar(255);

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
    SET v_target_opor_no = p_target_opor_no;
    SET v_opor_new_pwd = p_opor_new_pwd;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_opor_old_pwd = " ";
    SET v_oper_remark_info = " ";
    SET v_oper_mark = " ";
    SET v_log_level = 0;
    SET v_log_error_code = "0";
    SET v_log_error_info = " ";

    
    label_pro:BEGIN
    

    /* [检查报错返回][@目标操作员编号# = @操作员编号#][218][@目标操作员编号#] */
    if v_target_opor_no = v_opor_no then
        
        SET v_error_code = "pubT.5.10.218";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作员原密码# = " "; */
    set v_opor_old_pwd = " ";

    /* set @操作备注# = "重置操作员密码"; */
    set v_oper_remark_info = "重置操作员密码";

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户_修改操作员密码】*/
        call db_pub.pra_user_UpdateOperatorPassword(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_target_opor_no,
            v_opor_new_pwd,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.5.10.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_修改操作员密码出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @操作标志# =  concat(@操作员编号#," 重置了操作员密码:",@目标操作员编号#); */
        set v_oper_mark =  concat(v_opor_no," 重置了操作员密码:",v_target_opor_no);

        /* set @日志级别# = 2; */
        set v_log_level = 2;

        /* set @日志错误编码# = "0"; */
        set v_log_error_code = "0";

        /* set @日志错误信息# = " "; */
        set v_log_error_info = " ";

        /* 调用【原子_公共_消息_增加操作日志】*/
        call db_pub.pra_msage_AddOperLog(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_menu_no,
            v_oper_mark,
            v_log_level,
            v_log_error_code,
            v_log_error_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.5.10.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_消息_增加操作日志出现错误！',v_mysql_message);
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

# 事务_公共_用户_查询操作员信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_QueryOperatorInfoJour;;
DELIMITER ;;
CREATE PROCEDURE prt_user_QueryOperatorInfoJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_target_opor_no int,
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
    declare v_target_opor_no int;
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户_查询操作员信息流水】*/
    call db_pub.pra_user_QueryOperatorInfoJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_target_opor_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.5.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_查询操作员信息流水出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_用户_查询历史操作员信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_QueryOperatorInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_user_QueryOperatorInfoJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_target_opor_no int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_target_opor_no int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_target_opor_no = p_target_opor_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户_查询历史操作员信息流水】*/
    call db_pub.pra_user_QueryOperatorInfoJour_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_co_no,
        v_target_opor_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.5.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_查询历史操作员信息流水出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_用户_检查操作员存在
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_CheckOperatorExists;;
DELIMITER ;;
CREATE PROCEDURE prt_user_CheckOperatorExists(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_target_opor_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_target_opor_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;

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
    SET v_target_opor_no = p_target_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户_检查操作员存在】*/
    call db_pub.pra_user_CheckOperatorExists(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.5.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员存在出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户_获取操作员编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_GetOperatorNo;;
DELIMITER ;;
CREATE PROCEDURE prt_user_GetOperatorNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_target_opor_no int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_target_opor_no int;
    declare v_co_type int;

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_target_opor_no = 0;
    SET v_co_type = 0;

    
    label_pro:BEGIN
    
    #校验机构是否存在

    /* 调用【原子_公共_基础_获取机构类型】*/
    call db_pub.pra_base_GetCoType(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_error_code,
        v_error_info,
        v_co_type);
    if v_error_code = "1" then
        SET v_error_code = "pubT.5.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取机构类型出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_获取操作员编号】*/
    call db_pub.pra_user_GetOperatorNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_error_code,
        v_error_info,
        v_target_opor_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.5.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_target_opor_no = v_target_opor_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户_操作员登录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_OperatorLogin;;
DELIMITER ;;
CREATE PROCEDURE prt_user_OperatorLogin(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_target_opor_pwd varchar(64),
    IN p_client_version varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_opor_name varchar(64),
    OUT p_opor_type int,
    OUT p_oper_rights int,
    OUT p_is_trader int,
    OUT p_trader_no int,
    OUT p_online_status int,
    OUT p_login_count int,
    OUT p_login_error_count int,
    OUT p_init_date int,
    OUT p_last_login_ip varchar(32),
    OUT p_last_login_mac varchar(32),
    OUT p_last_login_date int,
    OUT p_last_login_time int,
    OUT p_co_type int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_target_opor_pwd varchar(64);
    declare v_client_version varchar(16);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_opor_name varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_trader_no int;
    declare v_online_status int;
    declare v_login_count int;
    declare v_login_error_count int;
    declare v_init_date int;
    declare v_last_login_ip varchar(32);
    declare v_last_login_mac varchar(32);
    declare v_last_login_date int;
    declare v_last_login_time int;
    declare v_co_type int;
    declare v_opor_pwd varchar(64);
    declare v_allow_oper_ip_addr varchar(255);
    declare v_allow_oper_mac varchar(255);
    declare v_allow_login_type varchar(64);
    declare v_oper_mark varchar(2048);
    declare v_log_level int;
    declare v_log_error_code varchar(32);
    declare v_log_error_info varchar(255);
    declare v_menu_no int;

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
    SET v_target_opor_pwd = p_target_opor_pwd;
    SET v_client_version = p_client_version;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_opor_name = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_trader_no = 0;
    SET v_online_status = 0;
    SET v_login_count = 0;
    SET v_login_error_count = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_last_login_ip = " ";
    SET v_last_login_mac = " ";
    SET v_last_login_date = date_format(curdate(),'%Y%m%d');
    SET v_last_login_time = 0;
    SET v_co_type = 0;
    SET v_opor_pwd = " ";
    SET v_allow_oper_ip_addr = " ";
    SET v_allow_oper_mac = " ";
    SET v_allow_login_type = " ";
    SET v_oper_mark = " ";
    SET v_log_level = 0;
    SET v_log_error_code = "0";
    SET v_log_error_info = " ";
    SET v_menu_no = 0;

    
    label_pro:BEGIN
    

    /* [操作员密码加密][@目标操作员密码#] */
    set v_target_opor_pwd = MD5(concat("LDOSM",v_target_opor_pwd));


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户_操作员登录】*/
        call db_pub.pra_user_OperatorLogin(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_target_opor_pwd,
            v_client_version,
            v_error_code,
            v_error_info,
            v_co_no,
            v_opor_name,
            v_opor_type,
            v_opor_pwd,
            v_oper_rights,
            v_is_trader,
            v_trader_no,
            v_allow_oper_ip_addr,
            v_allow_oper_mac,
            v_allow_login_type,
            v_online_status,
            v_login_count,
            v_login_error_count,
            v_init_date,
            v_last_login_ip,
            v_last_login_mac,
            v_last_login_date,
            v_last_login_time,
            v_co_type);
        if v_error_code = "1" then
            SET v_error_code = "pubT.5.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_操作员登录出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @操作标志# =  concat(@操作员编号#,"操作员登录！"); */
        set v_oper_mark =  concat(v_opor_no,"操作员登录！");

        /* set @日志级别# = 1; */
        set v_log_level = 1;

        /* set @日志错误编码# = "0"; */
        set v_log_error_code = "0";

        /* set @日志错误信息# = " "; */
        set v_log_error_info = " ";

        /* set @菜单编号# = 0; */
        set v_menu_no = 0;

        /* set @操作员机构编号# = @操作员编号# / 10000; */
        set v_opor_co_no = v_opor_no / 10000;

        /* 调用【原子_公共_消息_增加操作日志】*/
        call db_pub.pra_msage_AddOperLog(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_menu_no,
            v_oper_mark,
            v_log_level,
            v_log_error_code,
            v_log_error_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.5.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_消息_增加操作日志出现错误！',v_mysql_message);
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
    SET p_opor_name = v_opor_name;
    SET p_opor_type = v_opor_type;
    SET p_oper_rights = v_oper_rights;
    SET p_is_trader = v_is_trader;
    SET p_trader_no = v_trader_no;
    SET p_online_status = v_online_status;
    SET p_login_count = v_login_count;
    SET p_login_error_count = v_login_error_count;
    SET p_init_date = v_init_date;
    SET p_last_login_ip = v_last_login_ip;
    SET p_last_login_mac = v_last_login_mac;
    SET p_last_login_date = v_last_login_date;
    SET p_last_login_time = v_last_login_time;
    SET p_co_type = v_co_type;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户_操作员退出
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_OperatorLogout;;
DELIMITER ;;
CREATE PROCEDURE prt_user_OperatorLogout(
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
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户_操作员退出】*/
        call db_pub.pra_user_OperatorLogout(
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
            SET v_error_code = "pubT.5.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_操作员退出出现错误！',v_mysql_message);
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

# 事务_公共_用户_新增操作员可操作机构
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_AddOporAllowCo;;
DELIMITER ;;
CREATE PROCEDURE prt_user_AddOporAllowCo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_co_no int,
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
    declare v_target_opor_no int;
    declare v_co_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_co_no int;
    declare v_co_type int;

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
    SET v_target_opor_no = p_target_opor_no;
    SET v_co_no = p_co_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_co_no = 0;
    SET v_co_type = 0;

    
    label_pro:BEGIN
    

    /* set @临时_机构编号# = @机构编号#; */
    set v_tmp_co_no = v_co_no;

    /* set @机构编号# = @目标操作员编号# div 10000; */
    set v_co_no = v_target_opor_no div 10000;

    /* 调用【原子_公共_基础_获取机构类型】*/
    call db_pub.pra_base_GetCoType(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_error_code,
        v_error_info,
        v_co_type);
    if v_error_code = "1" then
        SET v_error_code = "pubT.5.41.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取机构类型出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @机构类型# = 《机构类型-普通》 then */
    if v_co_type = 2 then

        /* if @机构编号# <> @临时_机构编号# then */
        if v_co_no <> v_tmp_co_no then

            /* set @机构编号# = @临时_机构编号#; */
            set v_co_no = v_tmp_co_no;

            /* [报错返回][79][@目标操作员编号#,@机构编号#] */
                
                SET v_error_code = "pubT.5.41.79";
                SET v_error_info = concat("目标操作员编号=",v_target_opor_no,",","机构编号=",v_co_no);
                leave label_pro;

        end if;
    end if;

    /* set @机构编号# = @临时_机构编号#; */
    set v_co_no = v_tmp_co_no;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户_新增操作员可操作机构】*/
        call db_pub.pra_user_AddOporAllowCo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_target_opor_no,
            v_co_no,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.5.41.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_新增操作员可操作机构出现错误！',v_mysql_message);
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

# 事务_公共_用户_删除操作员可操作机构
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_DeleteOporAllowCo;;
DELIMITER ;;
CREATE PROCEDURE prt_user_DeleteOporAllowCo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_co_no int,
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
    declare v_target_opor_no int;
    declare v_co_no int;
    declare v_oper_remark_info varchar(255);
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_co_no = p_co_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户_删除操作员可操作机构】*/
        call db_pub.pra_user_DeleteOporAllowCo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_target_opor_no,
            v_co_no,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.5.42.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_删除操作员可操作机构出现错误！',v_mysql_message);
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

# 事务_公共_用户_查询操作员可操作机构
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_QueryOporAllowCo;;
DELIMITER ;;
CREATE PROCEDURE prt_user_QueryOporAllowCo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
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
    declare v_query_opor_no int;
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户_查询操作员可操作机构】*/
    call db_pub.pra_user_QueryOporAllowCo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_opor_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.5.44.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_查询操作员可操作机构出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_用户_查询全部交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_QueryAllExchGroup;;
DELIMITER ;;
CREATE PROCEDURE prt_user_QueryAllExchGroup(
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
    IN p_exch_group_status varchar(2),
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
    declare v_exch_group_status varchar(2);
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
    SET v_exch_group_status = p_exch_group_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户_查询全部交易组】*/
    call db_pub.pra_user_QueryAllExchGroup(
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
        v_exch_group_status,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.5.65.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_查询全部交易组出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_用户_查询全部操作员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_QueryAllOperatorInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_user_QueryAllOperatorInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_co_no int,
    IN p_is_trader int,
    IN p_opor_status_str varchar(64),
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
    declare v_query_opor_no int;
    declare v_co_no int;
    declare v_is_trader int;
    declare v_opor_status_str varchar(64);
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_co_no = p_co_no;
    SET v_is_trader = p_is_trader;
    SET v_opor_status_str = p_opor_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @操作员状态串# <> " " then */
    if v_opor_status_str <> " " then

        /* set @操作员状态串# = concat(";", @操作员状态串#, ";"); */
        set v_opor_status_str = concat(";", v_opor_status_str, ";");
    end if;

    /* 调用【原子_公共_用户_查询全部操作员信息】*/
    call db_pub.pra_user_QueryAllOperatorInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_opor_no,
        v_co_no,
        v_is_trader,
        v_opor_status_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.5.201.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_查询全部操作员信息出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_用户_获取操作员交易组权限串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_GetOporExgpRightsStr;;
DELIMITER ;;
CREATE PROCEDURE prt_user_GetOporExgpRightsStr(
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
    

    /* 调用【原子_公共_用户_获取操作员交易组权限串】*/
    call db_pub.pra_user_GetOporExgpRightsStr(
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
        SET v_error_code = "pubT.5.202.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员交易组权限串出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_用户_获取操作员交易组权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_GetOporExgpRights;;
DELIMITER ;;
CREATE PROCEDURE prt_user_GetOporExgpRights(
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
    

    /* 调用【原子_公共_用户_获取操作员交易组权限】*/
    call db_pub.pra_user_GetOporExgpRights(
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
        SET v_error_code = "pubT.5.203.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员交易组权限出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_用户_查询操作员可设置操作员
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_QueryOporAllowSetOpor;;
DELIMITER ;;
CREATE PROCEDURE prt_user_QueryOporAllowSetOpor(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_co_no int,
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
    declare v_query_opor_no int;
    declare v_co_no int;
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_co_no = p_co_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户_查询操作员可设置操作员】*/
    call db_pub.pra_user_QueryOporAllowSetOpor(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_opor_no,
        v_co_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.5.204.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_查询操作员可设置操作员出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_用户_更新交易组禁止订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_UpdateExchGroupForbidOrderDir;;
DELIMITER ;;
CREATE PROCEDURE prt_user_UpdateExchGroupForbidOrderDir(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_forbid_order_dir varchar(64),
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
    declare v_exch_group_no int;
    declare v_forbid_order_dir varchar(64);
    declare v_oper_remark_info varchar(255);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_forbid_order_dir = p_forbid_order_dir;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


         /* 调用【原子_公共_用户_更新交易组禁止订单方向】*/
         call db_pub.pra_user_UpdateExchGroupForbidOrderDir(
             v_opor_co_no,
             v_opor_no,
             v_oper_mac,
             v_oper_ip_addr,
             v_oper_info,
             v_oper_way,
             v_func_code,
             v_init_date,
             v_co_no,
             v_exch_group_no,
             v_forbid_order_dir,
             v_oper_remark_info,
             v_menu_no,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "pubT.5.205.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_更新交易组禁止订单方向出现错误！',v_mysql_message);
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

# 事务_公共_用户_查询交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_user_QueryExchGroupInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_user_QueryExchGroupInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_default_group_flag int,
    IN p_pd_no int,
    IN p_exch_group_status_str varchar(64),
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
    declare v_exch_group_no int;
    declare v_default_group_flag int;
    declare v_pd_no int;
    declare v_exch_group_status_str varchar(64);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_default_group_flag = p_default_group_flag;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_status_str = p_exch_group_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @交易组状态串# = concat(";", @交易组状态串#, ";"); */
    set v_exch_group_status_str = concat(";", v_exch_group_status_str, ";");

    /* 调用【原子_公共_用户_查询交易组信息】*/
    call db_pub.pra_user_QueryExchGroupInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_default_group_flag,
        v_pd_no,
        v_exch_group_status_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.5.206.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_查询交易组信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


