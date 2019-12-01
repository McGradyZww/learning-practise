DELIMITER ;;
use db_pub;;

# 事务_公共_用户客户端_新增操作员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_AddOperatorInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_AddOperatorInfo(
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
    IN p_index_value int,
    IN p_manage_nolgn_opor_orders int,
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
    declare v_index_value int;
    declare v_manage_nolgn_opor_orders int;
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
    SET v_index_value = p_index_value;
    SET v_manage_nolgn_opor_orders = p_manage_nolgn_opor_orders;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_mark = " ";
    SET v_log_level = 0;
    SET v_log_error_code = "0";
    SET v_log_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_新增操作员信息】*/
        call db_pub.pra_userclient_AddOperatorInfo(
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
            v_index_value,
            v_manage_nolgn_opor_orders,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_新增操作员信息出现错误！',v_mysql_message);
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
            SET v_error_code = "pubT.19.1.999";
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

# 事务_公共_用户客户端_修改操作员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_ModiOperatorInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_ModiOperatorInfo(
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
    IN p_manage_nolgn_opor_orders int,
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
    declare v_manage_nolgn_opor_orders int;
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
    SET v_manage_nolgn_opor_orders = p_manage_nolgn_opor_orders;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_mark = " ";
    SET v_log_level = 0;
    SET v_log_error_code = "0";
    SET v_log_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_修改操作员信息】*/
        call db_pub.pra_userclient_ModiOperatorInfo(
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
            v_manage_nolgn_opor_orders,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_修改操作员信息出现错误！',v_mysql_message);
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
            SET v_error_code = "pubT.19.2.999";
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

# 事务_公共_用户客户端_查询操作员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryOperatorInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryOperatorInfo(
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

    /* 调用【原子_公共_用户客户端_查询操作员信息】*/
    call db_pub.pra_userclient_QueryOperatorInfo(
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
        SET v_error_code = "pubT.19.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询操作员信息出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_更新操作员状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_UpdateOperatorStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_UpdateOperatorStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
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
    declare v_co_no int;
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
    SET v_co_no = p_co_no;
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
        SET v_error_code = "pubT.19.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_更新操作员状态】*/
        call db_pub.pra_userclient_UpdateOperatorStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_target_opor_no,
            v_opor_status,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_更新操作员状态出现错误！',v_mysql_message);
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
                SET v_error_code = "pubT.19.6.999";
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
            SET v_error_code = "pubT.19.6.999";
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

# 事务_公共_用户客户端_修改操作员密码
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_UpdateOperatorPassword;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_UpdateOperatorPassword(
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
    declare v_oper_remark_info varchar(255);
    declare v_target_opor_no int;

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
    SET v_oper_remark_info = " ";
    SET v_target_opor_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_校验操作员密码】*/
    call db_pub.pra_userclient_CheckOperatorPassword(
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
        SET v_error_code = "pubT.19.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_校验操作员密码出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@操作员原密码# = @操作员新密码#][210][@操作员编号#] */
    if v_opor_old_pwd = v_opor_new_pwd then
        
        SET v_error_code = "pubT.19.9.210";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作备注# = "修改操作员密码"; */
    set v_oper_remark_info = "修改操作员密码";

    /* [事务开始] */
    START TRANSACTION;


        /* set @目标操作员编号# = @操作员编号#; */
        set v_target_opor_no = v_opor_no;

        /* 调用【原子_公共_用户客户端_修改操作员密码】*/
        call db_pub.pra_userclient_UpdateOperatorPassword(
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
            SET v_error_code = "pubT.19.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_修改操作员密码出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_重置操作员密码
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_ResetOperatorPassword;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_ResetOperatorPassword(
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
        
        SET v_error_code = "pubT.19.10.218";
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


        /* 调用【原子_公共_用户客户端_修改操作员密码】*/
        call db_pub.pra_userclient_UpdateOperatorPassword(
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
            SET v_error_code = "pubT.19.10.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_修改操作员密码出现错误！',v_mysql_message);
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
            SET v_error_code = "pubT.19.10.999";
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

# 事务_公共_用户客户端_查询操作员信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryOperatorInfoJour;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryOperatorInfoJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    declare v_init_date int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_target_opor_no = p_target_opor_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_查询操作员信息流水】*/
    call db_pub.pra_userclient_QueryOperatorInfoJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_target_opor_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询操作员信息流水出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_查询历史操作员信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryOperatorInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryOperatorInfoJour_His(
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
    

    /* 调用【原子_公共_用户客户端_查询历史操作员信息流水】*/
    call db_pub.pra_userclient_QueryOperatorInfoJour_His(
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
        SET v_error_code = "pubT.19.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询历史操作员信息流水出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_检查操作员存在
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_CheckOperatorExists;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_CheckOperatorExists(
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
    

    /* 调用【原子_公共_用户客户端_检查操作员存在】*/
    call db_pub.pra_userclient_CheckOperatorExists(
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
        SET v_error_code = "pubT.19.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_检查操作员存在出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_获取操作员编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_GetOperatorNo;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_GetOperatorNo(
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

    
    label_pro:BEGIN
    

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* 调用【原子_公共_用户客户端_获取操作员编号】*/
    call db_pub.pra_userclient_GetOperatorNo(
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
        SET v_error_code = "pubT.19.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_获取操作员编号出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_查询操作员列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryOperatorList;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryOperatorList(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_co_no = p_co_no;
    SET v_is_trader = p_is_trader;
    SET v_opor_status_str = p_opor_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @操作员状态串# = concat(";", @操作员状态串#, ";"); */
    set v_opor_status_str = concat(";", v_opor_status_str, ";");

    /* 调用【原子_公共_用户客户端_查询操作员列表】*/
    call db_pub.pra_userclient_QueryOperatorList(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_is_trader,
        v_opor_status_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.15.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询操作员列表出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_新增操作员权限信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_AddOperatorRightsInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_AddOperatorRightsInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_allow_oper_mac varchar(255),
    IN p_opor_rights_str varchar(16),
    IN p_menu_no int,
    IN p_oper_remark_info varchar(255),
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
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights_str varchar(16);
    declare v_menu_no int;
    declare v_oper_remark_info varchar(255);
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
    SET v_allow_oper_mac = p_allow_oper_mac;
    SET v_opor_rights_str = p_opor_rights_str;
    SET v_menu_no = p_menu_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_mark = " ";
    SET v_log_level = 0;
    SET v_log_error_code = "0";
    SET v_log_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_新增操作员权限信息】*/
        call db_pub.pra_userclient_AddOperatorRightsInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_target_opor_no,
            v_allow_oper_mac,
            v_opor_rights_str,
            v_menu_no,
            v_oper_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_新增操作员权限信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @操作标志# =  concat(@操作员编号#," 进行了新增操作权限的操作:",@目标操作员编号#); */
        set v_oper_mark =  concat(v_opor_no," 进行了新增操作权限的操作:",v_target_opor_no);

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
            SET v_error_code = "pubT.19.16.999";
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

# 事务_公共_用户客户端_修改操作员权限信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_ModiOperatorRightsInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_ModiOperatorRightsInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_allow_oper_mac varchar(255),
    IN p_opor_rights_str varchar(16),
    IN p_menu_no int,
    IN p_oper_remark_info varchar(255),
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
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights_str varchar(16);
    declare v_menu_no int;
    declare v_oper_remark_info varchar(255);
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
    SET v_allow_oper_mac = p_allow_oper_mac;
    SET v_opor_rights_str = p_opor_rights_str;
    SET v_menu_no = p_menu_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_mark = " ";
    SET v_log_level = 0;
    SET v_log_error_code = "0";
    SET v_log_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_修改操作员权限信息】*/
        call db_pub.pra_userclient_ModiOperatorRightsInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_target_opor_no,
            v_allow_oper_mac,
            v_opor_rights_str,
            v_menu_no,
            v_oper_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_修改操作员权限信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @操作标志# =  concat(@操作员编号#," 进行了修改操作权限的操作:",@目标操作员编号#); */
        set v_oper_mark =  concat(v_opor_no," 进行了修改操作权限的操作:",v_target_opor_no);

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
            SET v_error_code = "pubT.19.17.999";
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

# 事务_公共_用户客户端_查询操作员权限信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryOperatorRightsInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryOperatorRightsInfo(
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
    OUT p_allow_oper_mac varchar(255),
    OUT p_opor_rights_str varchar(16)
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
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights_str varchar(16);

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
    SET v_allow_oper_mac = " ";
    SET v_opor_rights_str = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_查询操作员权限信息】*/
        call db_pub.pra_userclient_QueryOperatorRightsInfo(
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
            v_allow_oper_mac,
            v_opor_rights_str);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.18.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询操作员权限信息出现错误！',v_mysql_message);
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
    SET p_allow_oper_mac = v_allow_oper_mac;
    SET p_opor_rights_str = v_opor_rights_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户客户端_查询操作员登录地址信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryOperatorLoginAddressInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryOperatorLoginAddressInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_target_opor_no int,
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
    declare v_target_opor_no int;
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_查询操作员登录地址信息】*/
        call db_pub.pra_userclient_QueryOperatorLoginAddressInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_target_opor_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.19.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询操作员登录地址信息出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_操作员登录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_OperatorLogin;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_OperatorLogin(
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
    OUT p_last_oper_info varchar(255),
    OUT p_co_type int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_change_pwd_flag int,
    OUT p_sys_type int
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
    declare v_last_oper_info varchar(255);
    declare v_co_type int;
    declare v_co_busi_config_str varchar(64);
    declare v_change_pwd_flag int;
    declare v_sys_type int;
    declare v_config_index int;
    declare v_config_value varchar(2048);
    declare v_opor_pwd varchar(64);
    declare v_allow_oper_ip_addr varchar(255);
    declare v_allow_oper_mac varchar(255);
    declare v_allow_login_type varchar(64);
    declare v_menu_no int;
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
    SET v_last_oper_info = " ";
    SET v_co_type = 0;
    SET v_co_busi_config_str = " ";
    SET v_change_pwd_flag = 0;
    SET v_sys_type = 0;
    SET v_config_index = 0;
    SET v_config_value = " ";
    SET v_opor_pwd = " ";
    SET v_allow_oper_ip_addr = " ";
    SET v_allow_oper_mac = " ";
    SET v_allow_login_type = " ";
    SET v_menu_no = 0;
    SET v_oper_mark = " ";
    SET v_log_level = 0;
    SET v_log_error_code = "0";
    SET v_log_error_info = " ";

    
    label_pro:BEGIN
    

    /* [操作员密码加密][@目标操作员密码#] */
    set v_target_opor_pwd = MD5(concat("LDOSM",v_target_opor_pwd));


    /* [事务开始] */
    START TRANSACTION;


        /* set @配置位#=5; */
        set v_config_index=5;

        /* 调用【原子_公共_公共接口_获取系统配置值】*/
        call db_pub.pra_pubif_GetSysConfigValue(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_config_index,
            v_error_code,
            v_error_info,
            v_config_value);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取系统配置值出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_公共_用户客户端_操作员登录】*/
        call db_pub.pra_userclient_OperatorLogin(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_target_opor_pwd,
            v_client_version,
            v_config_value,
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
            v_last_oper_info,
            v_co_type,
            v_co_busi_config_str,
            v_change_pwd_flag);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_操作员登录出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

       #取系统类型

        /* set @配置位#=7; */
        set v_config_index=7;

        /* 调用【原子_公共_公共接口_获取系统配置值】*/
        call db_pub.pra_pubif_GetSysConfigValue(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_config_index,
            v_error_code,
            v_error_info,
            v_config_value);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取系统配置值出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @系统类型#= @配置值#; */
        set v_sys_type= v_config_value;

        /* if  @系统类型#=0  then */
        if  v_sys_type=0  then

            /* set @系统类型# = 《系统类型-资管系统》; */
            set v_sys_type = 2;
        end if;

        /* set @菜单编号# = 0; */
        set v_menu_no = 0;
        #set @服务名称# = "逻辑_公共_用户客户端_操作员登录";

        /* set @操作标志# =  concat(@操作员编号#,"操作员登录！"); */
        set v_oper_mark =  concat(v_opor_no,"操作员登录！");

        /* set @日志级别# = 1; */
        set v_log_level = 1;

        /* set @日志错误编码# = "0"; */
        set v_log_error_code = "0";

        /* set @日志错误信息# = " "; */
        set v_log_error_info = " ";

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
            SET v_error_code = "pubT.19.21.999";
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
    SET p_last_oper_info = v_last_oper_info;
    SET p_co_type = v_co_type;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_change_pwd_flag = v_change_pwd_flag;
    SET p_sys_type = v_sys_type;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户客户端_操作员退出
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_OperatorLogout;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_OperatorLogout(
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


        /* 调用【原子_公共_用户客户端_操作员退出】*/
        call db_pub.pra_userclient_OperatorLogout(
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
            SET v_error_code = "pubT.19.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_操作员退出出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_设置操作员配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_SetOperatorParam;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_SetOperatorParam(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_config_no bigint,
    IN p_config_value varchar(2048),
    IN p_config_name varchar(64),
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
    declare v_config_no bigint;
    declare v_config_value varchar(2048);
    declare v_config_name varchar(64);
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
    SET v_config_no = p_config_no;
    SET v_config_value = p_config_value;
    SET v_config_name = p_config_name;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_设置操作员配置】*/
        call db_pub.pra_userclient_SetOperatorParam(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_config_no,
            v_config_value,
            v_config_name,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.31.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_设置操作员配置出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_查询操作员配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryOperatorParam;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryOperatorParam(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_opor_no_str varchar(2048),
    IN p_config_no bigint,
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
    declare v_opor_no_str varchar(2048);
    declare v_config_no bigint;
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
    SET v_opor_no_str = p_opor_no_str;
    SET v_config_no = p_config_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_查询操作员配置】*/
    call db_pub.pra_userclient_QueryOperatorParam(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_no_str,
        v_config_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.32.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询操作员配置出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_保存操作员表格显示
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_SaveOporDbGridLayout;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_SaveOporDbGridLayout(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_parent_panel varchar(64),
    IN p_dbgrid_name varchar(64),
    IN p_dbgrid_conf_str varchar(4096),
    IN p_client_type int,
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
    declare v_parent_panel varchar(64);
    declare v_dbgrid_name varchar(64);
    declare v_dbgrid_conf_str varchar(4096);
    declare v_client_type int;
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
    SET v_parent_panel = p_parent_panel;
    SET v_dbgrid_name = p_dbgrid_name;
    SET v_dbgrid_conf_str = p_dbgrid_conf_str;
    SET v_client_type = p_client_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_保存操作员表格显示】*/
        call db_pub.pra_userclient_SaveOporDbGridLayout(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_parent_panel,
            v_dbgrid_name,
            v_dbgrid_conf_str,
            v_client_type,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.33.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_保存操作员表格显示出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_查询操作员表格显示
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryOporDbGridLayout;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryOporDbGridLayout(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_client_type int,
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
    declare v_client_type int;
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
    SET v_client_type = p_client_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_查询操作员表格显示】*/
    call db_pub.pra_userclient_QueryOporDbGridLayout(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_client_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.34.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询操作员表格显示出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_新增操作员可操作产品
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_AddOporAllowProd;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_AddOporAllowProd(
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
    IN p_pd_no int,
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
    declare v_pd_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_新增操作员可操作产品】*/
        call db_pub.pra_userclient_AddOporAllowProd(
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
            v_pd_no,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.45.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_新增操作员可操作产品出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_删除操作员可操作产品
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_DeleteOporAllowProd;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_DeleteOporAllowProd(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_pd_no int,
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
    declare v_pd_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_删除操作员可操作产品】*/
        call db_pub.pra_userclient_DeleteOporAllowProd(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_target_opor_no,
            v_pd_no,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.46.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_删除操作员可操作产品出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_查询操作员可操作产品
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryOporAllowProd;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryOporAllowProd(
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
    

    /* 调用【原子_公共_用户客户端_查询操作员可操作产品】*/
    call db_pub.pra_userclient_QueryOporAllowProd(
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
        SET v_error_code = "pubT.19.48.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询操作员可操作产品出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_新增交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_AddExchGroupInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_AddExchGroupInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_exch_group_code varchar(32),
    IN p_exch_group_name varchar(64),
    IN p_default_group_flag int,
    IN p_pd_no int,
    IN p_first_asset decimal(18,4),
    IN p_exch_group_dist_pd_amt decimal(18,4),
    IN p_exch_group_pd_share decimal(18,2),
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
    IN p_busi_config_str varchar(64),
    IN p_market_price_ratio decimal(18,12),
    IN p_forbid_order_dir varchar(64),
    IN p_weight_value decimal(18,4),
    IN p_trade_acco varchar(32),
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    IN p_futu_default_group_flag int,
    IN p_fina_loan_default_group_flag int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_exch_group_code varchar(32);
    declare v_exch_group_name varchar(64);
    declare v_default_group_flag int;
    declare v_pd_no int;
    declare v_first_asset decimal(18,4);
    declare v_exch_group_dist_pd_amt decimal(18,4);
    declare v_exch_group_pd_share decimal(18,2);
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_config_str varchar(64);
    declare v_market_price_ratio decimal(18,12);
    declare v_forbid_order_dir varchar(64);
    declare v_weight_value decimal(18,4);
    declare v_trade_acco varchar(32);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_futu_default_group_flag int;
    declare v_fina_loan_default_group_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no int;
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_target_opor_no int;
    declare v_oper_remark_info varchar(255);
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
    SET v_exch_group_code = p_exch_group_code;
    SET v_exch_group_name = p_exch_group_name;
    SET v_default_group_flag = p_default_group_flag;
    SET v_pd_no = p_pd_no;
    SET v_first_asset = p_first_asset;
    SET v_exch_group_dist_pd_amt = p_exch_group_dist_pd_amt;
    SET v_exch_group_pd_share = p_exch_group_pd_share;
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_busi_config_str = p_busi_config_str;
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_forbid_order_dir = p_forbid_order_dir;
    SET v_weight_value = p_weight_value;
    SET v_trade_acco = p_trade_acco;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_futu_default_group_flag = p_futu_default_group_flag;
    SET v_fina_loan_default_group_flag = p_fina_loan_default_group_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_target_opor_no = 0;
    SET v_oper_remark_info = " ";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* set @编号类型# = 《编号类型-交易组编号》; */
    set v_record_no_type = 12;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_基础_获取机构业务记录编号】*/
        call db_pub.pra_base_GetCoBusiRecordNo(
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
            SET v_error_code = "pubT.19.51.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取机构业务记录编号出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @交易组编号# = @当前编号#; */
    set v_exch_group_no = v_curr_no;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_新增交易组信息】*/
        call db_pub.pra_userclient_AddExchGroupInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_group_no,
            v_co_no,
            v_exch_group_code,
            v_exch_group_name,
            v_default_group_flag,
            v_pd_no,
            v_first_asset,
            v_exch_group_dist_pd_amt,
            v_exch_group_pd_share,
            v_allow_exch,
            v_allow_stock_type,
            v_busi_config_str,
            v_market_price_ratio,
            v_forbid_order_dir,
            v_weight_value,
            v_trade_acco,
            v_remark_info,
            v_menu_no,
            v_futu_default_group_flag,
            v_fina_loan_default_group_flag,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.51.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_新增交易组信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @目标操作员编号# =@操作员编号#; */
        set v_target_opor_no =v_opor_no;

        /* set @操作备注# = "新增交易组信息"; */
        set v_oper_remark_info = "新增交易组信息";

        /* 调用【原子_公共_用户客户端_新增操作员所属交易组】*/
        call db_pub.pra_userclient_AddOporAllowExchGroup(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_target_opor_no,
            v_exch_group_no,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_pd_no,
            v_row_id);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.51.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_新增操作员所属交易组出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_用户客户端_修改交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_ModiExchGroupInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_ModiExchGroupInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_group_no int,
    IN p_co_no int,
    IN p_exch_group_code varchar(32),
    IN p_exch_group_name varchar(64),
    IN p_first_asset decimal(18,4),
    IN p_exch_group_dist_pd_amt decimal(18,4),
    IN p_exch_group_pd_share decimal(18,2),
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
    IN p_busi_config_str varchar(64),
    IN p_market_price_ratio decimal(18,12),
    IN p_forbid_order_dir varchar(64),
    IN p_weight_value decimal(18,4),
    IN p_trade_acco varchar(32),
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    IN p_futu_default_group_flag int,
    IN p_fina_loan_default_group_flag int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_no int,
    OUT p_exch_group_status varchar(2),
    OUT p_default_group_flag int,
    OUT p_exch_group_begin_NAV decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_co_no int;
    declare v_exch_group_code varchar(32);
    declare v_exch_group_name varchar(64);
    declare v_first_asset decimal(18,4);
    declare v_exch_group_dist_pd_amt decimal(18,4);
    declare v_exch_group_pd_share decimal(18,2);
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_config_str varchar(64);
    declare v_market_price_ratio decimal(18,12);
    declare v_forbid_order_dir varchar(64);
    declare v_weight_value decimal(18,4);
    declare v_trade_acco varchar(32);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_futu_default_group_flag int;
    declare v_fina_loan_default_group_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_exch_group_status varchar(2);
    declare v_default_group_flag int;
    declare v_exch_group_begin_NAV decimal(18,4);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_code = p_exch_group_code;
    SET v_exch_group_name = p_exch_group_name;
    SET v_first_asset = p_first_asset;
    SET v_exch_group_dist_pd_amt = p_exch_group_dist_pd_amt;
    SET v_exch_group_pd_share = p_exch_group_pd_share;
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_busi_config_str = p_busi_config_str;
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_forbid_order_dir = p_forbid_order_dir;
    SET v_weight_value = p_weight_value;
    SET v_trade_acco = p_trade_acco;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_futu_default_group_flag = p_futu_default_group_flag;
    SET v_fina_loan_default_group_flag = p_fina_loan_default_group_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_exch_group_status = "0";
    SET v_default_group_flag = 0;
    SET v_exch_group_begin_NAV = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_修改交易组信息】*/
        call db_pub.pra_userclient_ModiExchGroupInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_group_no,
            v_co_no,
            v_exch_group_code,
            v_exch_group_name,
            v_first_asset,
            v_exch_group_dist_pd_amt,
            v_exch_group_pd_share,
            v_allow_exch,
            v_allow_stock_type,
            v_busi_config_str,
            v_market_price_ratio,
            v_forbid_order_dir,
            v_weight_value,
            v_remark_info,
            v_menu_no,
            v_futu_default_group_flag,
            v_fina_loan_default_group_flag,
            v_error_code,
            v_error_info,
            v_pd_no,
            v_exch_group_status,
            v_default_group_flag,
            v_exch_group_begin_NAV,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.52.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_修改交易组信息出现错误！',v_mysql_message);
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
    SET p_pd_no = v_pd_no;
    SET p_exch_group_status = v_exch_group_status;
    SET p_default_group_flag = v_default_group_flag;
    SET p_exch_group_begin_NAV = v_exch_group_begin_NAV;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户客户端_查询交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryExchGroupInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryExchGroupInfo(
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
    declare v_exch_group_no int;
    declare v_default_group_flag int;
    declare v_pd_no int;
    declare v_exch_group_status_str varchar(64);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_default_group_flag = p_default_group_flag;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_status_str = p_exch_group_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @交易组状态串# = concat(";", @交易组状态串#, ";"); */
    set v_exch_group_status_str = concat(";", v_exch_group_status_str, ";");

    /* 调用【原子_公共_用户客户端_查询交易组信息】*/
    call db_pub.pra_userclient_QueryExchGroupInfo(
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
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.54.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询交易组信息出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_更新交易组状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_UpdateExceGroupStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_UpdateExceGroupStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_group_no int,
    IN p_exch_group_status varchar(2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_code varchar(32),
    OUT p_exch_group_name varchar(64),
    OUT p_default_group_flag int,
    OUT p_exch_group_begin_NAV decimal(18,4),
    OUT p_exch_group_pd_share decimal(18,2),
    OUT p_update_times int,
    OUT p_row_id bigint,
    OUT p_oper_rights int,
    OUT p_exch_group_update_times int
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
    declare v_exch_group_status varchar(2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_code varchar(32);
    declare v_exch_group_name varchar(64);
    declare v_default_group_flag int;
    declare v_exch_group_begin_NAV decimal(18,4);
    declare v_exch_group_pd_share decimal(18,2);
    declare v_update_times int;
    declare v_row_id bigint;
    declare v_oper_rights int;
    declare v_exch_group_update_times int;

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
    SET v_exch_group_status = p_exch_group_status;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_code = " ";
    SET v_exch_group_name = " ";
    SET v_default_group_flag = 0;
    SET v_exch_group_begin_NAV = 0;
    SET v_exch_group_pd_share = 0;
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_oper_rights = 0;
    SET v_exch_group_update_times = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_更新交易组状态】*/
        call db_pub.pra_userclient_UpdateExceGroupStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_group_no,
            v_exch_group_status,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_exch_group_code,
            v_exch_group_name,
            v_default_group_flag,
            v_exch_group_begin_NAV,
            v_exch_group_pd_share,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.56.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_更新交易组状态出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @交易组状态# = 《交易组状态-注销》 then */
        if v_exch_group_status = "3" then

            /* 调用【原子_公共_用户客户端_更新操作员所属交易组注销标志】*/
            call db_pub.pra_userclient_UpdateOporAllowExchGroupAbolishStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_co_no,
                v_exch_group_no,
                v_error_code,
                v_error_info,
                v_row_id,
                v_oper_rights,
                v_exch_group_update_times);
            if v_error_code = "1" then
                SET v_error_code = "pubT.19.56.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_更新操作员所属交易组注销标志出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_code = v_exch_group_code;
    SET p_exch_group_name = v_exch_group_name;
    SET p_default_group_flag = v_default_group_flag;
    SET p_exch_group_begin_NAV = v_exch_group_begin_NAV;
    SET p_exch_group_pd_share = v_exch_group_pd_share;
    SET p_update_times = v_update_times;
    SET p_row_id = v_row_id;
    SET p_oper_rights = v_oper_rights;
    SET p_exch_group_update_times = v_exch_group_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户客户端_查询交易组信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryExchGroupInfoJour;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryExchGroupInfoJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_pd_no int,
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
    declare v_pd_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_查询交易组信息流水】*/
    call db_pub.pra_userclient_QueryExchGroupInfoJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_pd_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.58.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询交易组信息流水出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_查询历史交易组信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryExchGroupInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryExchGroupInfoJour_His(
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
    IN p_exch_group_no int,
    IN p_pd_no int,
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
    declare v_exch_group_no int;
    declare v_pd_no int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_查询历史交易组信息流水】*/
    call db_pub.pra_userclient_QueryExchGroupInfoJour_His(
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
        v_exch_group_no,
        v_pd_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.59.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询历史交易组信息流水出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_设置默认交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_SetDefaultExchGroup;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_SetDefaultExchGroup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_group_no int,
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
    declare v_exch_group_no int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_设置默认交易组】*/
        call db_pub.pra_userclient_SetDefaultExchGroup(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_group_no,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.60.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_设置默认交易组出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_查询可见交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryRightsExchGroup;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryRightsExchGroup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
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
    declare v_pd_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_查询可见交易组】*/
    call db_pub.pra_userclient_QueryRightsExchGroup(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.73.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询可见交易组出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_新增操作员所属交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_AddOporAllowExchGroup;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_AddOporAllowExchGroup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_target_opor_no int,
    IN p_exch_group_no int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_no int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_target_opor_no int;
    declare v_exch_group_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_row_id bigint;
    declare v_opor_status varchar(2);

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
    SET v_target_opor_no = p_target_opor_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_row_id = 0;
    SET v_opor_status = "0";

    
    label_pro:BEGIN
    

    /* set @操作员状态# = "0"; */
    set v_opor_status = "0";

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
        SET v_error_code = "pubT.19.61.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_新增操作员所属交易组】*/
        call db_pub.pra_userclient_AddOporAllowExchGroup(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_target_opor_no,
            v_exch_group_no,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_pd_no,
            v_row_id);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.61.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_新增操作员所属交易组出现错误！',v_mysql_message);
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
    SET p_pd_no = v_pd_no;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户客户端_删除操作员所属交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_DeleteOporAllowExchGroup;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_DeleteOporAllowExchGroup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_target_opor_no int,
    IN p_exch_group_no int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_pd_no int,
    OUT p_oper_rights int,
    OUT p_abolish_status varchar(2),
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
    declare v_target_opor_no int;
    declare v_exch_group_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_pd_no int;
    declare v_oper_rights int;
    declare v_abolish_status varchar(2);
    declare v_update_times int;
    declare v_opor_status varchar(2);

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
    SET v_target_opor_no = p_target_opor_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_pd_no = 0;
    SET v_oper_rights = 0;
    SET v_abolish_status = "0";
    SET v_update_times = 1;
    SET v_opor_status = "0";

    
    label_pro:BEGIN
    

    /* set @操作员状态# = "0"; */
    set v_opor_status = "0";

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
        SET v_error_code = "pubT.19.62.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_删除操作员所属交易组】*/
        call db_pub.pra_userclient_DeleteOporAllowExchGroup(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_target_opor_no,
            v_exch_group_no,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_row_id,
            v_pd_no,
            v_oper_rights,
            v_abolish_status,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.62.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_删除操作员所属交易组出现错误！',v_mysql_message);
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
    SET p_pd_no = v_pd_no;
    SET p_oper_rights = v_oper_rights;
    SET p_abolish_status = v_abolish_status;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户客户端_查询操作员所属交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryOporAllowExchGroup;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryOporAllowExchGroup(
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
    

    /* 调用【原子_公共_用户客户端_查询操作员所属交易组】*/
    call db_pub.pra_userclient_QueryOporAllowExchGroup(
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
        SET v_error_code = "pubT.19.64.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询操作员所属交易组出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_新增产品账户交易组组别
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_InsertProductUnitExchGroup;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_InsertProductUnitExchGroup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_group_name varchar(64),
    IN p_remark_info varchar(255),
    IN p_pd_account_group_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_group_no int
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
    declare v_group_name varchar(64);
    declare v_remark_info varchar(255);
    declare v_pd_account_group_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_group_no int;
    declare v_record_no_type int;
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
    SET v_group_name = p_group_name;
    SET v_remark_info = p_remark_info;
    SET v_pd_account_group_type = p_pd_account_group_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_group_no = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;

    
    label_pro:BEGIN
    

    /* set @编号类型# = 《编号类型-组别编号》; */
    set v_record_no_type = 19;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_基础_获取机构业务记录编号】*/
        call db_pub.pra_base_GetCoBusiRecordNo(
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
            SET v_error_code = "pubT.19.65.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取机构业务记录编号出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @组别编号# = @当前编号#; */
    set v_group_no = v_curr_no;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_新增产品账户交易组组别】*/
        call db_pub.pra_userclient_InsertProductUnitExchGroup(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_group_no,
            v_co_no,
            v_group_name,
            v_remark_info,
            v_pd_account_group_type,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.65.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_新增产品账户交易组组别出现错误！',v_mysql_message);
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
    SET p_group_no = v_group_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户客户端_修改产品账户交易组组别
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_UpdateProductUnitExchGroup;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_UpdateProductUnitExchGroup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_group_no int,
    IN p_group_name varchar(64),
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
    declare v_group_no int;
    declare v_group_name varchar(64);
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
    SET v_group_no = p_group_no;
    SET v_group_name = p_group_name;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_修改产品账户交易组组别】*/
        call db_pub.pra_userclient_UpdateProductUnitExchGroup(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_group_no,
            v_group_name,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.66.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_修改产品账户交易组组别出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_删除产品账户交易组组别
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_DeleteProductUnitExchGroup;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_DeleteProductUnitExchGroup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_group_no int,
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
    declare v_group_no int;
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
    SET v_group_no = p_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_删除产品账户交易组组别】*/
        call db_pub.pra_userclient_DeleteProductUnitExchGroup(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_group_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.67.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_删除产品账户交易组组别出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_查询产品账户交易组组别
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryProductUnitExchGroup;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryProductUnitExchGroup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_group_no int,
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
    declare v_group_no int;
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
    SET v_group_no = p_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_查询产品账户交易组组别】*/
    call db_pub.pra_userclient_QueryProductUnitExchGroup(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_group_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.68.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询产品账户交易组组别出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_新增产品账户交易组组别明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_InsertProductUnitExchGroupDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_InsertProductUnitExchGroupDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_group_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_weight_ratio decimal(18,2),
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
    declare v_group_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_weight_ratio decimal(18,2);
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
    SET v_group_no = p_group_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_weight_ratio = p_weight_ratio;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_新增产品账户交易组组别明细】*/
        call db_pub.pra_userclient_InsertProductUnitExchGroupDetail(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_group_no,
            v_co_no,
            v_pd_no,
            v_asset_acco_no,
            v_exch_group_no,
            v_weight_ratio,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.69.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_新增产品账户交易组组别明细出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_修改产品账户交易组组别明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_UpdateProductUnitExchGroupDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_UpdateProductUnitExchGroupDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_group_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_weight_ratio decimal(18,2),
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
    declare v_group_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_weight_ratio decimal(18,2);
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
    SET v_group_no = p_group_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_weight_ratio = p_weight_ratio;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_修改产品账户交易组组别明细】*/
        call db_pub.pra_userclient_UpdateProductUnitExchGroupDetail(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_group_no,
            v_co_no,
            v_pd_no,
            v_asset_acco_no,
            v_exch_group_no,
            v_weight_ratio,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.70.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_修改产品账户交易组组别明细出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_删除产品账户交易组组别明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_DeleteProductUnitExchGroupDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_DeleteProductUnitExchGroupDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_group_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
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
    declare v_group_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
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
    SET v_group_no = p_group_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_删除产品账户交易组组别明细】*/
        call db_pub.pra_userclient_DeleteProductUnitExchGroupDetail(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_group_no,
            v_co_no,
            v_pd_no,
            v_asset_acco_no,
            v_exch_group_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.71.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_删除产品账户交易组组别明细出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_查询产品账户交易组组别明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryProductUnitExchGroupDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryProductUnitExchGroupDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_group_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_part_no int,
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
    declare v_group_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_part_no int;
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
    SET v_group_no = p_group_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_part_no = p_part_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_查询产品账户交易组组别明细】*/
    call db_pub.pra_userclient_QueryProductUnitExchGroupDetail(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_group_no,
        v_pd_no,
        v_asset_acco_no,
        v_part_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.72.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询产品账户交易组组别明细出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_批量新增操作员可操作操作员
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_BatchAddOporAllowOpor;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_BatchAddOporAllowOpor(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_allow_opor_no_str varchar(2048),
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
    declare v_allow_opor_no_str varchar(2048);
    declare v_co_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_allow_opor_no int;

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
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_co_no = p_co_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_allow_opor_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;

        loop_label:loop

            /* if instr(@可操作操作员编号串#,";") > 0 then */
            if instr(v_allow_opor_no_str,";") > 0 then

                /* set @可操作操作员编号#=cast(substring(@可操作操作员编号串#,1,LOCATE(";",@可操作操作员编号串#)-1) as SIGNED); */
                set v_allow_opor_no=cast(substring(v_allow_opor_no_str,1,LOCATE(";",v_allow_opor_no_str)-1) as SIGNED);

                /* 调用【原子_公共_用户客户端_新增操作员可操作操作员】*/
                call db_pub.pra_userclient_AddOporAllowOpor(
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
                    v_allow_opor_no,
                    v_oper_remark_info,
                    v_menu_no,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "pubT.19.77.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_新增操作员可操作操作员出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @可操作操作员编号串#=substring(@可操作操作员编号串#,LOCATE(";",@可操作操作员编号串#)+1); */
                set v_allow_opor_no_str=substring(v_allow_opor_no_str,LOCATE(";",v_allow_opor_no_str)+1);
            else
                leave loop_label;
            end if;
        end loop;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户客户端_新增操作员可操作操作员
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_AddOporAllowOpor;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_AddOporAllowOpor(
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
    IN p_allow_opor_no int,
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
    declare v_allow_opor_no int;
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
    SET v_allow_opor_no = p_allow_opor_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_新增操作员可操作操作员】*/
        call db_pub.pra_userclient_AddOporAllowOpor(
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
            v_allow_opor_no,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.74.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_新增操作员可操作操作员出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_批量删除操作员可操作操作员
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_BatchDeleteOporAllowOpor;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_BatchDeleteOporAllowOpor(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_allow_opor_no_str varchar(2048),
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
    declare v_allow_opor_no_str varchar(2048);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_allow_opor_no int;

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
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_allow_opor_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;

        loop_label:loop

            /* if instr(@可操作操作员编号串#,";") > 0 then */
            if instr(v_allow_opor_no_str,";") > 0 then

                /* set @可操作操作员编号#=cast(substring(@可操作操作员编号串#,1,LOCATE(";",@可操作操作员编号串#)-1) as SIGNED); */
                set v_allow_opor_no=cast(substring(v_allow_opor_no_str,1,LOCATE(";",v_allow_opor_no_str)-1) as SIGNED);

                /* 调用【原子_公共_用户客户端_删除操作员可操作操作员】*/
                call db_pub.pra_userclient_DeleteOporAllowOpor(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_init_date,
                    v_target_opor_no,
                    v_allow_opor_no,
                    v_oper_remark_info,
                    v_menu_no,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "pubT.19.78.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_删除操作员可操作操作员出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @可操作操作员编号串#=substring(@可操作操作员编号串#,LOCATE(";",@可操作操作员编号串#)+1); */
                set v_allow_opor_no_str=substring(v_allow_opor_no_str,LOCATE(";",v_allow_opor_no_str)+1);
            else
                leave loop_label;
            end if;
        end loop;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户客户端_删除操作员可操作操作员
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_DeleteOporAllowOpor;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_DeleteOporAllowOpor(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_allow_opor_no int,
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
    declare v_allow_opor_no int;
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
    SET v_allow_opor_no = p_allow_opor_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_删除操作员可操作操作员】*/
        call db_pub.pra_userclient_DeleteOporAllowOpor(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_target_opor_no,
            v_allow_opor_no,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.75.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_删除操作员可操作操作员出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_查询操作员可操作操作员
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryOporAllowOpor;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryOporAllowOpor(
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
    IN p_allow_opor_no_str varchar(2048),
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
    declare v_allow_opor_no_str varchar(2048);
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
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_查询操作员可操作操作员】*/
    call db_pub.pra_userclient_QueryOporAllowOpor(
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
        v_allow_opor_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.76.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询操作员可操作操作员出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_查询交易组历史资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryExgpGroupAsset_His;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryExgpGroupAsset_His(
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
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_crncy_type varchar(3),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "pubT.19.89.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "pubT.19.89.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户客户端_查询交易组历史资产】*/
    call db_pub.pra_userclient_QueryExgpGroupAsset_His(
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
        v_pd_no,
        v_exch_group_no,
        v_crncy_type,
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.89.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询交易组历史资产出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_查询交易组资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryExgpGroupAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryExgpGroupAsset(
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
    IN p_crncy_type varchar(3),
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
    declare v_crncy_type varchar(3);
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
    SET v_crncy_type = p_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_查询交易组资产】*/
    call db_pub.pra_userclient_QueryExgpGroupAsset(
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
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.91.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询交易组资产出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_查询交易组资产历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryExgpGroupAssetHis;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryExgpGroupAssetHis(
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
    IN p_crncy_type varchar(3),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_查询交易组资产历史】*/
    call db_pub.pra_userclient_QueryExgpGroupAssetHis(
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
        v_crncy_type,
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.90.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询交易组资产历史出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_获取交易组最大净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_GetExgpMaxNav;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_GetExgpMaxNav(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_nav_asset decimal(18,4)
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
    declare v_begin_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_nav_asset decimal(18,4);

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
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_nav_asset = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_获取交易组最大净值】*/
    call db_pub.pra_userclient_GetExgpMaxNav(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_begin_date,
        v_error_code,
        v_error_info,
        v_nav_asset);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.92.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_获取交易组最大净值出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_nav_asset = v_nav_asset;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户客户端_获取交易组最大单位净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_GetExgpMaxPerNav;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_GetExgpMaxPerNav(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_unit_nav decimal(18,4)
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
    declare v_begin_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_unit_nav decimal(18,4);

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
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_unit_nav = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_获取交易组最大单位净值】*/
    call db_pub.pra_userclient_GetExgpMaxPerNav(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_begin_date,
        v_error_code,
        v_error_info,
        v_unit_nav);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.93.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_获取交易组最大单位净值出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_unit_nav = v_unit_nav;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户客户端_获取默认交易组个数
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_GetDefaultExgpCount;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_GetDefaultExgpCount(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_pd_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_获取默认交易组个数】*/
    call db_pub.pra_userclient_GetDefaultExgpCount(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_record_count);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.94.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_获取默认交易组个数出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户客户端_查询交易组份额变动流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryExgpShareOccurJour;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryExgpShareOccurJour(
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
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_查询交易组份额变动流水】*/
    call db_pub.pra_userclient_QueryExgpShareOccurJour(
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
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.95.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询交易组份额变动流水出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_查询交易组份额变动流水历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryExgpShareOccurJourHis;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryExgpShareOccurJourHis(
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [检查报错返回][@开始日期#>@结束日期#][254][@开始日期#,@结束日期#] */
    if v_begin_date>v_end_date then
        
        SET v_error_code = "pubT.19.96.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户客户端_查询交易组份额变动流水历史】*/
    call db_pub.pra_userclient_QueryExgpShareOccurJourHis(
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
        v_exch_group_no_rights_str,
        v_begin_date,
        v_end_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.96.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询交易组份额变动流水历史出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_查询单个交易组资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QuerySingleExgpGroupAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QuerySingleExgpGroupAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_begin_NAV decimal(18,4),
    OUT p_nav_asset decimal(18,4),
    OUT p_stock_cash_asset decimal(18,4),
    OUT p_stock_asset decimal(18,4),
    OUT p_fund_asset decimal(18,4),
    OUT p_bond_asset decimal(18,4),
    OUT p_futu_asset decimal(18,4),
    OUT p_repo_asset decimal(18,4),
    OUT p_other_asset decimal(18,4),
    OUT p_hk_thrgh_stock_asset decimal(18,4),
    OUT p_total_realiz_pandl decimal(18,4),
    OUT p_many_days_total_asset decimal(18,4),
    OUT p_stat_days int
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
    declare v_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_begin_NAV decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_stock_cash_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_total_realiz_pandl decimal(18,4);
    declare v_many_days_total_asset decimal(18,4);
    declare v_stat_days int;

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
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_begin_NAV = 0;
    SET v_nav_asset = 0;
    SET v_stock_cash_asset = 0;
    SET v_stock_asset = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_futu_asset = 0;
    SET v_repo_asset = 0;
    SET v_other_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_total_realiz_pandl = 0;
    SET v_many_days_total_asset = 0;
    SET v_stat_days = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_查询单个交易组资产】*/
    call db_pub.pra_userclient_QuerySingleExgpGroupAsset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_crncy_type,
        v_error_code,
        v_error_info,
        v_row_id,
        v_co_no,
        v_pd_no,
        v_begin_NAV,
        v_nav_asset,
        v_stock_cash_asset,
        v_stock_asset,
        v_fund_asset,
        v_bond_asset,
        v_futu_asset,
        v_repo_asset,
        v_other_asset,
        v_hk_thrgh_stock_asset,
        v_total_realiz_pandl,
        v_many_days_total_asset,
        v_stat_days);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.97.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询单个交易组资产出现错误！',v_mysql_message);
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
    SET p_begin_NAV = v_begin_NAV;
    SET p_nav_asset = v_nav_asset;
    SET p_stock_cash_asset = v_stock_cash_asset;
    SET p_stock_asset = v_stock_asset;
    SET p_fund_asset = v_fund_asset;
    SET p_bond_asset = v_bond_asset;
    SET p_futu_asset = v_futu_asset;
    SET p_repo_asset = v_repo_asset;
    SET p_other_asset = v_other_asset;
    SET p_hk_thrgh_stock_asset = v_hk_thrgh_stock_asset;
    SET p_total_realiz_pandl = v_total_realiz_pandl;
    SET p_many_days_total_asset = v_many_days_total_asset;
    SET p_stat_days = v_stat_days;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户客户端_查询可见交易员列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryTraderViews;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryTraderViews(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_查询可见交易员列表】*/
    call db_pub.pra_userclient_QueryTraderViews(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.202.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询可见交易员列表出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_查询自动打新交易组列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryExchGroupByAutoNewStock;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryExchGroupByAutoNewStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_查询自动打新交易组列表】*/
    call db_pub.pra_userclient_QueryExchGroupByAutoNewStock(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.203.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询自动打新交易组列表出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_获取可操作该产品操作员编号串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_GetOperatorNoByProdNo;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_GetOperatorNoByProdNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_target_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_allow_opor_no_str varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_target_pd_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_allow_opor_no_str varchar(2048);

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
    SET v_target_pd_no = p_target_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_allow_opor_no_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_获取可操作该产品操作员编号串】*/
    call db_pub.pra_userclient_GetOperatorNoByProdNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_pd_no,
        v_error_code,
        v_error_info,
        v_allow_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.902.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_获取可操作该产品操作员编号串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_allow_opor_no_str = v_allow_opor_no_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户客户端_新增期现对冲组合
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_InsertFutuSecuHedg;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_InsertFutuSecuHedg(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_comm_trd_type int,
    IN p_hedg_name varchar(255),
    IN p_futu_exch_group_no int,
    IN p_futu_asset_acco_no int,
    IN p_futu_order_pd_no int,
    IN p_secu_exch_group_no int,
    IN p_secu_asset_acco_no int,
    IN p_secu_order_pd_no int,
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
    declare v_co_no int;
    declare v_comm_trd_type int;
    declare v_hedg_name varchar(255);
    declare v_futu_exch_group_no int;
    declare v_futu_asset_acco_no int;
    declare v_futu_order_pd_no int;
    declare v_secu_exch_group_no int;
    declare v_secu_asset_acco_no int;
    declare v_secu_order_pd_no int;
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
    SET v_co_no = p_co_no;
    SET v_comm_trd_type = p_comm_trd_type;
    SET v_hedg_name = p_hedg_name;
    SET v_futu_exch_group_no = p_futu_exch_group_no;
    SET v_futu_asset_acco_no = p_futu_asset_acco_no;
    SET v_futu_order_pd_no = p_futu_order_pd_no;
    SET v_secu_exch_group_no = p_secu_exch_group_no;
    SET v_secu_asset_acco_no = p_secu_asset_acco_no;
    SET v_secu_order_pd_no = p_secu_order_pd_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_公共_用户客户端_新增期现对冲组合】*/
    call db_pub.pra_userclient_InsertFutuSecuHedg(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_comm_trd_type,
        v_hedg_name,
        v_futu_exch_group_no,
        v_futu_asset_acco_no,
        v_futu_order_pd_no,
        v_secu_exch_group_no,
        v_secu_asset_acco_no,
        v_secu_order_pd_no,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.301.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_新增期现对冲组合出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_删除期现对冲组合
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_DeleteFutuSecuHedg;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_DeleteFutuSecuHedg(
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


    /* 调用【原子_公共_用户客户端_删除期现对冲组合】*/
    call db_pub.pra_userclient_DeleteFutuSecuHedg(
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
        SET v_error_code = "pubT.19.303.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_删除期现对冲组合出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_查询期现对冲组合
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryFutuSecuHedg;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryFutuSecuHedg(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_comm_trd_type int,
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
    declare v_comm_trd_type int;
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
    SET v_comm_trd_type = p_comm_trd_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_查询期现对冲组合】*/
    call db_pub.pra_userclient_QueryFutuSecuHedg(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_opor_no,
        v_comm_trd_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.304.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询期现对冲组合出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_新增期现对冲方案信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_InsertFutuSecuHedgPlanInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_InsertFutuSecuHedgPlanInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_comm_trd_type int,
    IN p_hedg_plan_name varchar(255),
    IN p_contrc_code_no int,
    IN p_futu_qty decimal(18,2),
    IN p_basket_qty decimal(18,2),
    IN p_basket_id bigint,
    IN p_plan_type int,
    IN p_hedg_no bigint,
    IN p_hedging_pankou decimal(18,4),
    IN p_futu_price_offset decimal(16,9),
    IN p_price_offset decimal(16,9),
    IN p_target_base_diff decimal(18,4),
    IN p_template_base_diff decimal(18,4),
    IN p_up_value_ratio decimal(18,12),
    IN p_down_value_ratio decimal(18,12),
    IN p_stop_value_ratio decimal(18,12),
    IN p_cash_replace_amt decimal(18,4),
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
    declare v_co_no int;
    declare v_comm_trd_type int;
    declare v_hedg_plan_name varchar(255);
    declare v_contrc_code_no int;
    declare v_futu_qty decimal(18,2);
    declare v_basket_qty decimal(18,2);
    declare v_basket_id bigint;
    declare v_plan_type int;
    declare v_hedg_no bigint;
    declare v_hedging_pankou decimal(18,4);
    declare v_futu_price_offset decimal(16,9);
    declare v_price_offset decimal(16,9);
    declare v_target_base_diff decimal(18,4);
    declare v_template_base_diff decimal(18,4);
    declare v_up_value_ratio decimal(18,12);
    declare v_down_value_ratio decimal(18,12);
    declare v_stop_value_ratio decimal(18,12);
    declare v_cash_replace_amt decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_comm_trd_type = p_comm_trd_type;
    SET v_hedg_plan_name = p_hedg_plan_name;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_futu_qty = p_futu_qty;
    SET v_basket_qty = p_basket_qty;
    SET v_basket_id = p_basket_id;
    SET v_plan_type = p_plan_type;
    SET v_hedg_no = p_hedg_no;
    SET v_hedging_pankou = p_hedging_pankou;
    SET v_futu_price_offset = p_futu_price_offset;
    SET v_price_offset = p_price_offset;
    SET v_target_base_diff = p_target_base_diff;
    SET v_template_base_diff = p_template_base_diff;
    SET v_up_value_ratio = p_up_value_ratio;
    SET v_down_value_ratio = p_down_value_ratio;
    SET v_stop_value_ratio = p_stop_value_ratio;
    SET v_cash_replace_amt = p_cash_replace_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_公共_用户客户端_新增期现对冲方案信息】*/
    call db_pub.pra_userclient_InsertFutuSecuHedgPlanInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_comm_trd_type,
        v_hedg_plan_name,
        v_contrc_code_no,
        v_futu_qty,
        v_basket_qty,
        v_basket_id,
        v_plan_type,
        v_hedg_no,
        v_hedging_pankou,
        v_futu_price_offset,
        v_price_offset,
        v_target_base_diff,
        v_template_base_diff,
        v_up_value_ratio,
        v_down_value_ratio,
        v_stop_value_ratio,
        v_cash_replace_amt,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.401.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_新增期现对冲方案信息出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_修改期现对冲方案信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_UpdateFutuSecuHedgPlanInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_UpdateFutuSecuHedgPlanInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_hedg_plan_name varchar(255),
    IN p_futu_qty decimal(18,2),
    IN p_basket_qty decimal(18,2),
    IN p_hedging_pankou decimal(18,4),
    IN p_futu_price_offset decimal(16,9),
    IN p_price_offset decimal(16,9),
    IN p_target_base_diff decimal(18,4),
    IN p_template_base_diff decimal(18,4),
    IN p_up_value_ratio decimal(18,12),
    IN p_down_value_ratio decimal(18,12),
    IN p_stop_value_ratio decimal(18,12),
    IN p_cash_replace_amt decimal(18,4),
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
    declare v_hedg_plan_name varchar(255);
    declare v_futu_qty decimal(18,2);
    declare v_basket_qty decimal(18,2);
    declare v_hedging_pankou decimal(18,4);
    declare v_futu_price_offset decimal(16,9);
    declare v_price_offset decimal(16,9);
    declare v_target_base_diff decimal(18,4);
    declare v_template_base_diff decimal(18,4);
    declare v_up_value_ratio decimal(18,12);
    declare v_down_value_ratio decimal(18,12);
    declare v_stop_value_ratio decimal(18,12);
    declare v_cash_replace_amt decimal(18,4);
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
    SET v_hedg_plan_name = p_hedg_plan_name;
    SET v_futu_qty = p_futu_qty;
    SET v_basket_qty = p_basket_qty;
    SET v_hedging_pankou = p_hedging_pankou;
    SET v_futu_price_offset = p_futu_price_offset;
    SET v_price_offset = p_price_offset;
    SET v_target_base_diff = p_target_base_diff;
    SET v_template_base_diff = p_template_base_diff;
    SET v_up_value_ratio = p_up_value_ratio;
    SET v_down_value_ratio = p_down_value_ratio;
    SET v_stop_value_ratio = p_stop_value_ratio;
    SET v_cash_replace_amt = p_cash_replace_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_公共_用户客户端_修改期现对冲方案信息】*/
    call db_pub.pra_userclient_UpdateFutuSecuHedgPlanInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_hedg_plan_name,
        v_futu_qty,
        v_basket_qty,
        v_hedging_pankou,
        v_futu_price_offset,
        v_price_offset,
        v_target_base_diff,
        v_template_base_diff,
        v_up_value_ratio,
        v_down_value_ratio,
        v_stop_value_ratio,
        v_cash_replace_amt,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.402.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_修改期现对冲方案信息出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_删除期现对冲方案信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_DeleteFutuSecuHedgPlanInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_DeleteFutuSecuHedgPlanInfo(
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


    /* 调用【原子_公共_用户客户端_删除期现对冲方案信息】*/
    call db_pub.pra_userclient_DeleteFutuSecuHedgPlanInfo(
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
        SET v_error_code = "pubT.19.403.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_删除期现对冲方案信息出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_查询期现对冲方案信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryFutuSecuHedgPlanInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryFutuSecuHedgPlanInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_comm_trd_type int,
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
    declare v_comm_trd_type int;
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
    SET v_comm_trd_type = p_comm_trd_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_查询期现对冲方案信息】*/
    call db_pub.pra_userclient_QueryFutuSecuHedgPlanInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_opor_no,
        v_comm_trd_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.404.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询期现对冲方案信息出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_新增操作员可设置操作员
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_AddOporAllowSetOpor;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_AddOporAllowSetOpor(
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
    IN p_allow_opor_no int,
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
    declare v_allow_opor_no int;
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
    SET v_co_no = p_co_no;
    SET v_allow_opor_no = p_allow_opor_no;
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


        /* 调用【原子_公共_用户客户端_新增操作员可设置操作员】*/
        call db_pub.pra_userclient_AddOporAllowSetOpor(
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
            v_allow_opor_no,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.501.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_新增操作员可设置操作员出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @操作标志# =  concat(@操作员编号#," 赋予了",@目标操作员编号#,"对",@可操作操作员编号#,"的操作权限"); */
        set v_oper_mark =  concat(v_opor_no," 赋予了",v_target_opor_no,"对",v_allow_opor_no,"的操作权限");

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
            SET v_error_code = "pubT.19.501.999";
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

# 事务_公共_用户客户端_删除操作员可设置操作员
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_DeleteOporAllowSetOpor;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_DeleteOporAllowSetOpor(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_allow_opor_no int,
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
    declare v_allow_opor_no int;
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
    SET v_allow_opor_no = p_allow_opor_no;
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


        /* 调用【原子_公共_用户客户端_删除操作员可设置操作员】*/
        call db_pub.pra_userclient_DeleteOporAllowSetOpor(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_target_opor_no,
            v_allow_opor_no,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.502.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_删除操作员可设置操作员出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @操作标志# =  concat(@操作员编号#," 删除了",@目标操作员编号#,"对",@可操作操作员编号#,"的操作权限"); */
        set v_oper_mark =  concat(v_opor_no," 删除了",v_target_opor_no,"对",v_allow_opor_no,"的操作权限");

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
            SET v_error_code = "pubT.19.502.999";
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

# 事务_公共_用户客户端_查询操作员可设置操作员
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryOporAllowSetOpor;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryOporAllowSetOpor(
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
    

    /* 调用【原子_公共_用户客户端_查询操作员可设置操作员】*/
    call db_pub.pra_userclient_QueryOporAllowSetOpor(
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
        SET v_error_code = "pubT.19.503.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询操作员可设置操作员出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_获取注销交易组串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_GetCancelExgpStr;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_GetCancelExgpStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_group_no_str varchar(2048)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no_str varchar(2048);

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_获取注销交易组串】*/
    call db_pub.pra_userclient_GetCancelExgpStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_exch_group_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.504.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_获取注销交易组串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no_str = v_exch_group_no_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户客户端_更新基金产品行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_UpdateFundPdQuot;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_UpdateFundPdQuot(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_last_price decimal(16,9),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_last_price decimal(16,9);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_update_times int;
    declare v_record_count int;
    declare v_stock_name varchar(64);
    declare v_tmp_co_no int;
    declare v_co_no int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);

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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_last_price = p_last_price;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_update_times = 1;
    SET v_record_count = 0;
    SET v_stock_name = " ";
    SET v_tmp_co_no = 0;
    SET v_co_no = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;

    
    label_pro:BEGIN
    

    /* [检查报错返回][@市场编号# <>《市场编号-场外交易市场》][1][concat("目前只支持场外交易市场的行情更新！",@市场编号#,@证券代码#)] */
    if v_exch_no <>5 then
        
        SET v_error_code = "pubT.19.505.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目前只支持场外交易市场的行情更新！",v_exch_no,v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("目前只支持场外交易市场的行情更新！",v_exch_no,v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


    /* [获取表记录变量语句][公共_证券基础数据_基金产品对照表][count(1),{证券代码编号},{证券名称},{机构编号}][@记录个数#,@证券代码编号#,@证券名称#,@临时_机构编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#] */
    select count(1),stock_code_no,stock_name,co_no into v_record_count,v_stock_code_no,v_stock_name,v_tmp_co_no from db_pub.tb_basesedt_fund_pd_comparision where exch_no=v_exch_no and stock_code=v_stock_code limit 1;


    /* [检查报错返回][@记录个数# =0][1][concat("更新该证券代码的行情需先维护基金产品对照关系！",@市场编号#,@证券代码#)] */
    if v_record_count =0 then
        ROLLBACK;
        SET v_error_code = "pubT.19.505.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("更新该证券代码的行情需先维护基金产品对照关系！",v_exch_no,v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("更新该证券代码的行情需先维护基金产品对照关系！",v_exch_no,v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* set @机构编号# = @操作员编号#/10000; */
    set v_co_no = v_opor_no/10000;

    /* [检查报错返回][@临时_机构编号# <> @机构编号#][50][@操作员编号#,@临时_机构编号#] */
    if v_tmp_co_no <> v_co_no then
        ROLLBACK;
        SET v_error_code = "pubT.19.505.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","临时_机构编号=",v_tmp_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,",","临时_机构编号=",v_tmp_co_no);
        end if;
        leave label_pro;
    end if;


    /* set @涨停价#=0; */
    set v_up_limit_price=0;

    /* set @跌停价#=0; */
    set v_down_limit_price=0;

    /* 调用【原子_公共_证券基础数据_更新基金产品行情】*/
    call db_pub.pra_basesedt_UpdateFundPdQuot(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_stock_code_no,
        v_exch_no,
        v_stock_code,
        v_stock_name,
        v_up_limit_price,
        v_down_limit_price,
        v_last_price,
        v_oper_remark_info,
        v_menu_no,
        v_error_code,
        v_error_info,
        v_stock_type,
        v_asset_type,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.505.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_更新基金产品行情出现错误！',v_mysql_message);
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
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户客户端_查询基金产品行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_QueryFundPdQuot;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_QueryFundPdQuot(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_co_no int;

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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @临时_机构编号# = @操作员编号#/10000; */
    set v_tmp_co_no = v_opor_no/10000;

    /* [检查报错返回][@临时_机构编号# <> @机构编号#][50][@操作员编号#] */
    if v_tmp_co_no <> v_co_no then
        
        SET v_error_code = "pubT.19.506.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户客户端_查询基金产品行情】*/
    call db_pub.pra_userclient_QueryFundPdQuot(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_exch_no,
        v_stock_code,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.19.506.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询基金产品行情出现错误！',v_mysql_message);
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

# 事务_公共_用户客户端_修改操作员索引值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_ModiOporIndex;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_ModiOporIndex(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_opor_no_str varchar(2048),
    IN p_index_value_str varchar(2048),
    IN p_oper_remark_info varchar(255),
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
    declare v_opor_no_str varchar(2048);
    declare v_index_value_str varchar(2048);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_split_str varchar(4);
    declare v_pd_no int;
    declare v_target_opor_no int;
    declare v_index_value int;

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
    SET v_opor_no_str = p_opor_no_str;
    SET v_index_value_str = p_index_value_str;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_split_str = " ";
    SET v_pd_no = 0;
    SET v_target_opor_no = 0;
    SET v_index_value = 0;

    
    label_pro:BEGIN
    

    /* set @分隔符# = ";"; */
    set v_split_str = ";";

    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "pubT.19.507.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* while LOCATE(@分隔符#,@操作员编号串#)<>0   do */
    while LOCATE(v_split_str,v_opor_no_str)<>0   do

          /* set @目标操作员编号#=cast(substring(@操作员编号串#,1,LOCATE(@分隔符#,@操作员编号串#)-1) as SIGNED); */
          set v_target_opor_no=cast(substring(v_opor_no_str,1,LOCATE(v_split_str,v_opor_no_str)-1) as SIGNED);

          /* set @索引值#=cast(substring(@索引值串#,1,LOCATE(@分隔符#,@索引值串#)-1) as SIGNED); */
          set v_index_value=cast(substring(v_index_value_str,1,LOCATE(v_split_str,v_index_value_str)-1) as SIGNED);

          /* [事务开始] */
          START TRANSACTION;


               /* 调用【原子_公共_用户客户端_修改操作员索引值】*/
               call db_pub.pra_userclient_ModiOporIndex(
                   v_opor_co_no,
                   v_opor_no,
                   v_oper_mac,
                   v_oper_ip_addr,
                   v_oper_info,
                   v_oper_way,
                   v_func_code,
                   v_init_date,
                   v_co_no,
                   v_target_opor_no,
                   v_index_value,
                   v_oper_remark_info,
                   v_error_code,
                   v_error_info);
               if v_error_code = "1" then
                   SET v_error_code = "pubT.19.507.999";
                   if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_修改操作员索引值出现错误！',v_mysql_message);
                   end if;
                   ROLLBACK;
                   leave label_pro;
               elseif v_error_code <> "0" then
                   ROLLBACK;
                   leave label_pro;
               end if;


          /* [事务结束] */
          COMMIT;


          /* set @操作员编号串#=substring(@操作员编号串#,LOCATE(@分隔符#,@操作员编号串#)+1); */
          set v_opor_no_str=substring(v_opor_no_str,LOCATE(v_split_str,v_opor_no_str)+1);

          /* set @索引值串#=substring(@索引值串#,LOCATE(@分隔符#,@索引值串#)+1); */
          set v_index_value_str=substring(v_index_value_str,LOCATE(v_split_str,v_index_value_str)+1);
    end while;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_用户客户端_重置操作员登录错误次数
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_userclient_ResetLoginErrorCount;;
DELIMITER ;;
CREATE PROCEDURE prt_userclient_ResetLoginErrorCount(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_query_oper_way varchar(2),
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
    declare v_query_oper_way varchar(2);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_config_index int;
    declare v_config_value varchar(2048);
    declare v_sys_type int;
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
    SET v_query_oper_way = p_query_oper_way;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_config_index = 0;
    SET v_config_value = " ";
    SET v_sys_type = 0;
    SET v_oper_mark = " ";
    SET v_log_level = 0;
    SET v_log_error_code = "0";
    SET v_log_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_重置操作员登录错误次数】*/
        call db_pub.pra_userclient_ResetLoginErrorCount(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_target_opor_no,
            v_query_oper_way,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.508.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_重置操作员登录错误次数出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

       #取系统类型

        /* set @配置位#=7; */
        set v_config_index=7;

        /* 调用【原子_公共_公共接口_获取系统配置值】*/
        call db_pub.pra_pubif_GetSysConfigValue(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_config_index,
            v_error_code,
            v_error_info,
            v_config_value);
        if v_error_code = "1" then
            SET v_error_code = "pubT.19.508.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取系统配置值出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @系统类型#= @配置值#; */
        set v_sys_type= v_config_value;

        /* if  @系统类型#=0  then */
        if  v_sys_type=0  then

            /* set @系统类型# = 《系统类型-资管系统》; */
            set v_sys_type = 2;
        end if;
        #set @菜单编号# = 0;

        /* set @操作标志# =  concat(@操作员编号#," 操作员重置了 ",@目标操作员编号#,"的登录错误次数！"); */
        set v_oper_mark =  concat(v_opor_no," 操作员重置了 ",v_target_opor_no,"的登录错误次数！");

        /* set @日志级别# = 2; */
        set v_log_level = 2;

        /* set @日志错误编码# = "0"; */
        set v_log_error_code = "0";

        /* set @日志错误信息# = " "; */
        set v_log_error_info = " ";

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
            SET v_error_code = "pubT.19.508.999";
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


