DELIMITER ;;
use db_pub;;

# 事务_公共_权限客户端_新增角色
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_AddRole;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_AddRole(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_role_code varchar(32),
    IN p_role_name varchar(64),
    IN p_co_no int,
    IN p_role_type int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_role_no int
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
    declare v_role_code varchar(32);
    declare v_role_name varchar(64);
    declare v_co_no int;
    declare v_role_type int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_role_no int;
    declare v_record_count int;
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
    SET v_init_date = p_init_date;
    SET v_role_code = p_role_code;
    SET v_role_name = p_role_name;
    SET v_co_no = p_co_no;
    SET v_role_type = p_role_type;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_role_no = 0;
    SET v_record_count = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* 调用【原子_公共_权限_检查角色存在】*/
    call db_pub.pra_perm_CheckRoleExists(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_role_code,
        v_error_code,
        v_error_info,
        v_record_count);
    if v_error_code = "1" then
        SET v_error_code = "pubT.21.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查角色存在出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@记录个数# > 0][202][@机构编号#,@角色编码#] */
    if v_record_count > 0 then
        
        SET v_error_code = "pubT.21.1.202";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","角色编码=",v_role_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","角色编码=",v_role_code);
        end if;
        leave label_pro;
    end if;


    /* set @编号类型#=《编号类型-角色编号》; */
    set v_record_no_type=14;

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
            SET v_error_code = "pubT.21.1.999";
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


    /* set @角色编号#=@当前编号#; */
    set v_role_no=v_curr_no;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_权限客户端_新增角色】*/
        call db_pub.pra_permclient_AddRole(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_role_no,
            v_role_code,
            v_role_name,
            v_co_no,
            v_role_type,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.21.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_新增角色出现错误！',v_mysql_message);
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
    SET p_role_no = v_role_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_权限客户端_修改角色
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_ModiRole;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_ModiRole(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_role_no int,
    IN p_role_code varchar(32),
    IN p_role_name varchar(64),
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
    declare v_role_no int;
    declare v_role_code varchar(32);
    declare v_role_name varchar(64);
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
    SET v_role_no = p_role_no;
    SET v_role_code = p_role_code;
    SET v_role_name = p_role_name;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_权限客户端_修改角色】*/
        call db_pub.pra_permclient_ModiRole(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_role_no,
            v_role_code,
            v_role_name,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.21.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_修改角色出现错误！',v_mysql_message);
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

# 事务_公共_权限客户端_删除角色
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_DeleteRole;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_DeleteRole(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_role_no int,
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
    declare v_role_no int;
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
    SET v_role_no = p_role_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_权限客户端_删除角色】*/
        call db_pub.pra_permclient_DeleteRole(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_role_no,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.21.3.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_删除角色出现错误！',v_mysql_message);
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

# 事务_公共_权限客户端_查询角色列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_QueryRoleList;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_QueryRoleList(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_role_no int,
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
    declare v_role_no int;
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
    SET v_role_no = p_role_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_权限客户端_查询角色列表】*/
    call db_pub.pra_permclient_QueryRoleList(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_role_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.21.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_查询角色列表出现错误！',v_mysql_message);
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

# 事务_公共_权限客户端_批量新增角色菜单功能
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_BatchAddRoleMenuFunc;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_BatchAddRoleMenuFunc(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_role_no int,
    IN p_menu_func_str varchar(2048),
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
    declare v_role_no int;
    declare v_menu_func_str varchar(2048);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_remark_info varchar(255);
    declare v_co_no int;
    declare v_role_type int;
    declare v_tmp_menu_func_str varchar(2048);
    declare v_busi_menu_no int;
    declare v_busi_func_code varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_role_no = p_role_no;
    SET v_menu_func_str = p_menu_func_str;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_remark_info = " ";
    SET v_co_no = 0;
    SET v_role_type = 0;
    SET v_tmp_menu_func_str = " ";
    SET v_busi_menu_no = 0;
    SET v_busi_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @操作备注#="批量新增角色菜单功能"; */
    set v_oper_remark_info="批量新增角色菜单功能";

    /* set @机构编号#=@操作员机构编号#; */
    set v_co_no=v_opor_co_no;

    /* 调用【原子_公共_权限客户端_获取角色类型】*/
    call db_pub.pra_permclient_GetRoleType(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_role_no,
        v_error_code,
        v_error_info,
        v_role_type);
    if v_error_code = "1" then
        SET v_error_code = "pubT.21.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_获取角色类型出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    loop_label:loop

        /* if instr(@菜单功能串#, ";") > 0 then */
        if instr(v_menu_func_str, ";") > 0 then

            /* set @临时_菜单功能串#=left(@菜单功能串#, instr(@菜单功能串#, ";") - 1); */
            set v_tmp_menu_func_str=left(v_menu_func_str, instr(v_menu_func_str, ";") - 1);

            /* if instr(@临时_菜单功能串#, ",") > 0 then */
            if instr(v_tmp_menu_func_str, ",") > 0 then

                /* set @业务菜单编号#=left(@临时_菜单功能串#, instr(@临时_菜单功能串#, ",") - 1); */
                set v_busi_menu_no=left(v_tmp_menu_func_str, instr(v_tmp_menu_func_str, ",") - 1);

                /* set @业务功能编码#=right(@临时_菜单功能串#, length(@临时_菜单功能串#) - instr(@临时_菜单功能串#, ",")); */
                set v_busi_func_code=right(v_tmp_menu_func_str, length(v_tmp_menu_func_str) - instr(v_tmp_menu_func_str, ","));

                /* [事务开始] */
                START TRANSACTION;


                    /* 调用【原子_公共_权限客户端_批量新增角色菜单功能】*/
                    call db_pub.pra_permclient_BatchAddRoleMenuFunc(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_init_date,
                        v_co_no,
                        v_role_no,
                        v_role_type,
                        v_busi_menu_no,
                        v_busi_func_code,
                        v_oper_remark_info,
                        v_menu_no,
                        v_error_code,
                        v_error_info);
                    if v_error_code = "1" then
                        SET v_error_code = "pubT.21.13.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_批量新增角色菜单功能出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;


                /* [事务结束] */
                COMMIT;

            end if;

            /* set @菜单功能串#=right(@菜单功能串#, length(@菜单功能串#) - instr(@菜单功能串#, ";")); */
            set v_menu_func_str=right(v_menu_func_str, length(v_menu_func_str) - instr(v_menu_func_str, ";"));
        else
            leave loop_label;
        end if;
    end loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_权限客户端_批量删除角色菜单功能
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_BatchDeleteRoleMenuFunc;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_BatchDeleteRoleMenuFunc(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_role_no int,
    IN p_menu_func_str varchar(2048),
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
    declare v_role_no int;
    declare v_menu_func_str varchar(2048);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_remark_info varchar(255);
    declare v_co_no int;
    declare v_role_type int;
    declare v_tmp_menu_func_str varchar(2048);
    declare v_busi_menu_no int;
    declare v_busi_func_code varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_role_no = p_role_no;
    SET v_menu_func_str = p_menu_func_str;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_remark_info = " ";
    SET v_co_no = 0;
    SET v_role_type = 0;
    SET v_tmp_menu_func_str = " ";
    SET v_busi_menu_no = 0;
    SET v_busi_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @操作备注#="批量删除角色菜单功能"; */
    set v_oper_remark_info="批量删除角色菜单功能";

    /* set @机构编号#=@操作员机构编号#; */
    set v_co_no=v_opor_co_no;

    /* 调用【原子_公共_权限客户端_获取角色类型】*/
    call db_pub.pra_permclient_GetRoleType(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_role_no,
        v_error_code,
        v_error_info,
        v_role_type);
    if v_error_code = "1" then
        SET v_error_code = "pubT.21.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_获取角色类型出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    loop_label:loop

        /* if instr(@菜单功能串#, ";") > 0 then */
        if instr(v_menu_func_str, ";") > 0 then

            /* set @临时_菜单功能串#=left(@菜单功能串#, instr(@菜单功能串#, ";") - 1); */
            set v_tmp_menu_func_str=left(v_menu_func_str, instr(v_menu_func_str, ";") - 1);

            /* if instr(@临时_菜单功能串#, ",") > 0 then */
            if instr(v_tmp_menu_func_str, ",") > 0 then

                /* set @业务菜单编号#=left(@临时_菜单功能串#, instr(@临时_菜单功能串#, ",") - 1); */
                set v_busi_menu_no=left(v_tmp_menu_func_str, instr(v_tmp_menu_func_str, ",") - 1);

                /* set @业务功能编码#=right(@临时_菜单功能串#, length(@临时_菜单功能串#) - instr(@临时_菜单功能串#, ",")); */
                set v_busi_func_code=right(v_tmp_menu_func_str, length(v_tmp_menu_func_str) - instr(v_tmp_menu_func_str, ","));

                /* [事务开始] */
                START TRANSACTION;


                    /* 调用【原子_公共_权限客户端_批量删除角色菜单功能】*/
                    call db_pub.pra_permclient_BatchDeleteRoleMenuFunc(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_init_date,
                        v_co_no,
                        v_role_no,
                        v_role_type,
                        v_busi_menu_no,
                        v_busi_func_code,
                        v_oper_remark_info,
                        v_menu_no,
                        v_error_code,
                        v_error_info);
                    if v_error_code = "1" then
                        SET v_error_code = "pubT.21.14.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_批量删除角色菜单功能出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;


                /* [事务结束] */
                COMMIT;

            end if;

            /* set @菜单功能串#=right(@菜单功能串#, length(@菜单功能串#) - instr(@菜单功能串#, ";")); */
            set v_menu_func_str=right(v_menu_func_str, length(v_menu_func_str) - instr(v_menu_func_str, ";"));
        else
            leave loop_label;
        end if;
    end loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_权限客户端_查询角色菜单功能列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_QueryRoleMenuFunc;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_QueryRoleMenuFunc(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_role_no int,
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
    declare v_role_no int;
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
    SET v_role_no = p_role_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_权限客户端_查询角色菜单功能列表】*/
    call db_pub.pra_permclient_QueryRoleMenuFunc(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_role_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.21.15.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_查询角色菜单功能列表出现错误！',v_mysql_message);
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

# 事务_公共_权限客户端_复制角色
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_CopyRole;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_CopyRole(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_role_code varchar(32),
    IN p_role_name varchar(64),
    IN p_source_role_no int,
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
    declare v_role_code varchar(32);
    declare v_role_name varchar(64);
    declare v_source_role_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_role_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_role_code = p_role_code;
    SET v_role_name = p_role_name;
    SET v_source_role_no = p_source_role_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_role_no = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* 调用【原子_公共_权限_检查角色存在】*/
    call db_pub.pra_perm_CheckRoleExists(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_role_code,
        v_error_code,
        v_error_info,
        v_record_count);
    if v_error_code = "1" then
        SET v_error_code = "pubT.21.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查角色存在出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@记录个数# > 0][202][@机构编号#,@角色编码#] */
    if v_record_count > 0 then
        
        SET v_error_code = "pubT.21.4.202";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","角色编码=",v_role_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","角色编码=",v_role_code);
        end if;
        leave label_pro;
    end if;


    /* set @编号类型#=《编号类型-角色编号》; */
    set v_record_no_type=14;

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
            SET v_error_code = "pubT.21.4.999";
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


    /* set @角色编号#=@当前编号#; */
    set v_role_no=v_curr_no;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_权限客户端_复制角色】*/
        call db_pub.pra_permclient_CopyRole(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_role_no,
            v_role_code,
            v_role_name,
            v_co_no,
            v_source_role_no,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.21.4.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_复制角色出现错误！',v_mysql_message);
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

# 事务_公共_权限客户端_查询操作员可用角色列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_QueryOperatorAllowRoleList;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_QueryOperatorAllowRoleList(
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
    

    /* 调用【原子_公共_权限客户端_查询操作员可用角色列表】*/
    call db_pub.pra_permclient_QueryOperatorAllowRoleList(
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
        SET v_error_code = "pubT.21.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_查询操作员可用角色列表出现错误！',v_mysql_message);
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

# 事务_公共_权限客户端_新增操作员角色
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_AddOporRole;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_AddOporRole(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_role_no int,
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
    declare v_role_no int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_is_check int;
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
    SET v_role_no = p_role_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_is_check = 0;
    SET v_oper_mark = " ";
    SET v_log_level = 0;
    SET v_log_error_code = "0";
    SET v_log_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @是否校验#=《是否校验-是》; */
        set v_is_check=1;

        /* 调用【原子_公共_权限客户端_新增操作员角色】*/
        call db_pub.pra_permclient_AddOporRole(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_target_opor_no,
            v_role_no,
            v_is_check,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.21.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_新增操作员角色出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @操作标志# =  concat(@操作员编号#," 进行了新增操作员角色:",@目标操作员编号#); */
        set v_oper_mark =  concat(v_opor_no," 进行了新增操作员角色:",v_target_opor_no);

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
            SET v_error_code = "pubT.21.22.999";
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

# 事务_公共_权限客户端_删除操作员角色
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_DeleteOporRole;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_DeleteOporRole(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_role_no int,
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
    declare v_role_no int;
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
    SET v_role_no = p_role_no;
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


        /* 调用【原子_公共_权限客户端_删除操作员角色】*/
        call db_pub.pra_permclient_DeleteOporRole(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_target_opor_no,
            v_role_no,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.21.23.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_删除操作员角色出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @操作标志# =  concat(@操作员编号#," 进行了删除操作员角色:",@目标操作员编号#); */
        set v_oper_mark =  concat(v_opor_no," 进行了删除操作员角色:",v_target_opor_no);

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
            SET v_error_code = "pubT.21.23.999";
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

# 事务_公共_权限客户端_查询操作员角色列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_QueryOporRoleList;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_QueryOporRoleList(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_权限客户端_查询操作员角色列表】*/
    call db_pub.pra_permclient_QueryOporRoleList(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_opor_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.21.24.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_查询操作员角色列表出现错误！',v_mysql_message);
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

# 事务_公共_权限客户端_批量新增操作员特殊菜单功能
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_BatchAddOporMenuFunc;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_BatchAddOporMenuFunc(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_menu_type int,
    IN p_menu_func_str varchar(2048),
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
    declare v_menu_type int;
    declare v_menu_func_str varchar(2048);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_is_check int;
    declare v_role_no int;
    declare v_oper_remark_info varchar(255);
    declare v_co_no int;
    declare v_role_type int;
    declare v_tmp_menu_func_str varchar(2048);
    declare v_busi_menu_no int;
    declare v_busi_func_code varchar(16);
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
    SET v_menu_type = p_menu_type;
    SET v_menu_func_str = p_menu_func_str;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_is_check = 0;
    SET v_role_no = 0;
    SET v_oper_remark_info = " ";
    SET v_co_no = 0;
    SET v_role_type = 0;
    SET v_tmp_menu_func_str = " ";
    SET v_busi_menu_no = 0;
    SET v_busi_func_code = " ";
    SET v_oper_mark = " ";
    SET v_log_level = 0;
    SET v_log_error_code = "0";
    SET v_log_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @是否校验# = 《是否校验-是》; */
        set v_is_check = 1;

        /* 调用【原子_公共_权限客户端_获取操作员特殊角色编号】*/
        call db_pub.pra_permclient_GetOporSpecRoleNo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_target_opor_no,
            v_menu_type,
            v_is_check,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_role_no);
        if v_error_code = "1" then
            SET v_error_code = "pubT.21.27.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_获取操作员特殊角色编号出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @操作备注#="批量新增操作员特殊菜单功能"; */
    set v_oper_remark_info="批量新增操作员特殊菜单功能";

    /* set @机构编号#=@操作员机构编号#; */
    set v_co_no=v_opor_co_no;

    /* 调用【原子_公共_权限客户端_获取角色类型】*/
    call db_pub.pra_permclient_GetRoleType(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_role_no,
        v_error_code,
        v_error_info,
        v_role_type);
    if v_error_code = "1" then
        SET v_error_code = "pubT.21.27.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_获取角色类型出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    loop_label:loop

        /* if instr(@菜单功能串#, ";") > 0 then */
        if instr(v_menu_func_str, ";") > 0 then

            /* set @临时_菜单功能串#=left(@菜单功能串#, instr(@菜单功能串#, ";") - 1); */
            set v_tmp_menu_func_str=left(v_menu_func_str, instr(v_menu_func_str, ";") - 1);

            /* if instr(@临时_菜单功能串#, ",") > 0 then */
            if instr(v_tmp_menu_func_str, ",") > 0 then

                /* set @业务菜单编号#=left(@临时_菜单功能串#, instr(@临时_菜单功能串#, ",") - 1); */
                set v_busi_menu_no=left(v_tmp_menu_func_str, instr(v_tmp_menu_func_str, ",") - 1);

                /* set @业务功能编码#=right(@临时_菜单功能串#, length(@临时_菜单功能串#) - instr(@临时_菜单功能串#, ",")); */
                set v_busi_func_code=right(v_tmp_menu_func_str, length(v_tmp_menu_func_str) - instr(v_tmp_menu_func_str, ","));

                /* [事务开始] */
                START TRANSACTION;


                    /* 调用【原子_公共_权限客户端_批量新增角色菜单功能】*/
                    call db_pub.pra_permclient_BatchAddRoleMenuFunc(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_init_date,
                        v_co_no,
                        v_role_no,
                        v_role_type,
                        v_busi_menu_no,
                        v_busi_func_code,
                        v_oper_remark_info,
                        v_menu_no,
                        v_error_code,
                        v_error_info);
                    if v_error_code = "1" then
                        SET v_error_code = "pubT.21.27.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_批量新增角色菜单功能出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;


                /* [事务结束] */
                COMMIT;

            end if;

            /* set @菜单功能串#=right(@菜单功能串#, length(@菜单功能串#) - instr(@菜单功能串#, ";")); */
            set v_menu_func_str=right(v_menu_func_str, length(v_menu_func_str) - instr(v_menu_func_str, ";"));
        else
            leave loop_label;
        end if;
    end loop;

        /* set @操作标志# =  concat(@操作员编号#," 进行了批量新增操作员菜单功能:",@目标操作员编号#); */
        set v_oper_mark =  concat(v_opor_no," 进行了批量新增操作员菜单功能:",v_target_opor_no);

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
            SET v_error_code = "pubT.21.27.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_消息_增加操作日志出现错误！',v_mysql_message);
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

# 事务_公共_权限客户端_批量删除操作员特殊菜单功能
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_BatchDeleteOporMenuFunc;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_BatchDeleteOporMenuFunc(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_menu_type int,
    IN p_menu_func_str varchar(2048),
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
    declare v_menu_type int;
    declare v_menu_func_str varchar(2048);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_is_check int;
    declare v_role_no int;
    declare v_oper_remark_info varchar(255);
    declare v_co_no int;
    declare v_role_type int;
    declare v_tmp_menu_func_str varchar(2048);
    declare v_busi_menu_no int;
    declare v_busi_func_code varchar(16);
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
    SET v_menu_type = p_menu_type;
    SET v_menu_func_str = p_menu_func_str;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_is_check = 0;
    SET v_role_no = 0;
    SET v_oper_remark_info = " ";
    SET v_co_no = 0;
    SET v_role_type = 0;
    SET v_tmp_menu_func_str = " ";
    SET v_busi_menu_no = 0;
    SET v_busi_func_code = " ";
    SET v_oper_mark = " ";
    SET v_log_level = 0;
    SET v_log_error_code = "0";
    SET v_log_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @是否校验# = 《是否校验-否》; */
    set v_is_check = 2;

    /* 调用【原子_公共_权限客户端_获取操作员特殊角色编号】*/
    call db_pub.pra_permclient_GetOporSpecRoleNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_target_opor_no,
        v_menu_type,
        v_is_check,
        v_menu_no,
        v_error_code,
        v_error_info,
        v_role_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.21.28.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_获取操作员特殊角色编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @操作备注#="批量删除操作员特殊菜单功能"; */
    set v_oper_remark_info="批量删除操作员特殊菜单功能";

    /* set @机构编号#=@操作员机构编号#; */
    set v_co_no=v_opor_co_no;

    /* 调用【原子_公共_权限客户端_获取角色类型】*/
    call db_pub.pra_permclient_GetRoleType(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_role_no,
        v_error_code,
        v_error_info,
        v_role_type);
    if v_error_code = "1" then
        SET v_error_code = "pubT.21.28.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_获取角色类型出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    loop_label:loop

        /* if instr(@菜单功能串#, ";") > 0 then */
        if instr(v_menu_func_str, ";") > 0 then

            /* set @临时_菜单功能串#=left(@菜单功能串#, instr(@菜单功能串#, ";") - 1); */
            set v_tmp_menu_func_str=left(v_menu_func_str, instr(v_menu_func_str, ";") - 1);

            /* if instr(@临时_菜单功能串#, ",") > 0 then */
            if instr(v_tmp_menu_func_str, ",") > 0 then

                /* set @业务菜单编号#=left(@临时_菜单功能串#, instr(@临时_菜单功能串#, ",") - 1); */
                set v_busi_menu_no=left(v_tmp_menu_func_str, instr(v_tmp_menu_func_str, ",") - 1);

                /* set @业务功能编码#=right(@临时_菜单功能串#, length(@临时_菜单功能串#) - instr(@临时_菜单功能串#, ",")); */
                set v_busi_func_code=right(v_tmp_menu_func_str, length(v_tmp_menu_func_str) - instr(v_tmp_menu_func_str, ","));

                /* [事务开始] */
                START TRANSACTION;


                    /* 调用【原子_公共_权限客户端_批量删除角色菜单功能】*/
                    call db_pub.pra_permclient_BatchDeleteRoleMenuFunc(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_init_date,
                        v_co_no,
                        v_role_no,
                        v_role_type,
                        v_busi_menu_no,
                        v_busi_func_code,
                        v_oper_remark_info,
                        v_menu_no,
                        v_error_code,
                        v_error_info);
                    if v_error_code = "1" then
                        SET v_error_code = "pubT.21.28.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_批量删除角色菜单功能出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;


                /* [事务结束] */
                COMMIT;

            end if;

            /* set @菜单功能串#=right(@菜单功能串#, length(@菜单功能串#) - instr(@菜单功能串#, ";")); */
            set v_menu_func_str=right(v_menu_func_str, length(v_menu_func_str) - instr(v_menu_func_str, ";"));
        else
            leave loop_label;
        end if;
    end loop;

        /* set @操作标志# =  concat(@操作员编号#," 进行了批量删除操作员菜单功能:",@目标操作员编号#); */
        set v_oper_mark =  concat(v_opor_no," 进行了批量删除操作员菜单功能:",v_target_opor_no);

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
            SET v_error_code = "pubT.21.28.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_消息_增加操作日志出现错误！',v_mysql_message);
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

# 事务_公共_权限客户端_查询操作员普通菜单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_QueryOporAllMenu;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_QueryOporAllMenu(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_menu_type int,
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
    declare v_menu_type int;
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
    SET v_menu_type = p_menu_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_权限客户端_查询操作员普通菜单】*/
    call db_pub.pra_permclient_QueryOporAllMenu(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_opor_no,
        v_menu_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.21.29.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_查询操作员普通菜单出现错误！',v_mysql_message);
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

# 事务_公共_权限客户端_查询操作员特殊菜单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_QueryOporSpecMenu;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_QueryOporSpecMenu(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_menu_type int,
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
    declare v_menu_type int;
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
    SET v_menu_type = p_menu_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_权限客户端_查询操作员特殊菜单】*/
    call db_pub.pra_permclient_QueryOporSpecMenu(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_opor_no,
        v_menu_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.21.30.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_查询操作员特殊菜单出现错误！',v_mysql_message);
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

# 事务_公共_权限客户端_查询操作员普通菜单功能
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_QueryOporAllMenuFunc;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_QueryOporAllMenuFunc(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_menu_type int,
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
    declare v_menu_type int;
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
    SET v_menu_type = p_menu_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_权限客户端_查询操作员普通菜单功能】*/
    call db_pub.pra_permclient_QueryOporAllMenuFunc(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_opor_no,
        v_menu_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.21.31.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_查询操作员普通菜单功能出现错误！',v_mysql_message);
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

# 事务_公共_权限客户端_查询操作员特殊菜单功能
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_QueryOporSpecMenuFunc;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_QueryOporSpecMenuFunc(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_menu_type int,
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
    declare v_menu_type int;
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
    SET v_menu_type = p_menu_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_权限客户端_查询操作员特殊菜单功能】*/
    call db_pub.pra_permclient_QueryOporSpecMenuFunc(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_opor_no,
        v_menu_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.21.32.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_查询操作员特殊菜单功能出现错误！',v_mysql_message);
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

# 事务_公共_权限客户端_查询全部菜单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_QueryAllMenu;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_QueryAllMenu(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_type int,
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
    declare v_menu_type int;
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
    SET v_menu_type = p_menu_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_权限客户端_查询全部菜单】*/
    call db_pub.pra_permclient_QueryAllMenu(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_menu_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.21.33.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_查询全部菜单出现错误！',v_mysql_message);
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

# 事务_公共_权限客户端_回收菜单功能权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_permclient_WithdrawMenuFunc;;
DELIMITER ;;
CREATE PROCEDURE prt_permclient_WithdrawMenuFunc(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_menu_type int,
    IN p_menu_func_str varchar(2048),
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
    declare v_menu_type int;
    declare v_menu_func_str varchar(2048);
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
    SET v_menu_type = p_menu_type;
    SET v_menu_func_str = p_menu_func_str;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_权限客户端_回收菜单功能权限】*/
        call db_pub.pra_permclient_WithdrawMenuFunc(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_menu_type,
            v_menu_func_str,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.21.51.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限客户端_回收菜单功能权限出现错误！',v_mysql_message);
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


