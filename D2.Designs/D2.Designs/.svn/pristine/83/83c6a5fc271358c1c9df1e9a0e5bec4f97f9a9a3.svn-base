DELIMITER ;;
use db_pub;;

# 原子_公共_权限_新增角色
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_AddRole;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_AddRole(
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
    IN p_co_no int,
    IN p_role_type int,
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
    declare v_co_no int;
    declare v_role_type int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_co_no = p_co_no;
    SET v_role_type = p_role_type;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [插入表记录][公共_权限_角色表][字段][字段变量][1][@角色编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_perm_role(
        create_date, create_time, update_date, 
        update_time, update_times, role_no, co_no, 
        role_code, role_name, role_type) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_role_no, v_co_no, 
        v_role_code, v_role_name, v_role_type);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.7.1.1";
        SET v_error_info =  CONCAT(concat("角色编号=",v_role_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_权限_角色流水表][字段][字段变量][5][@角色编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_perm_role_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        role_no, role_name, role_type, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_role_no, v_role_name, v_role_type, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.7.1.5";
        SET v_error_info =  CONCAT(concat("角色编号=",v_role_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_修改角色
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_ModiRole;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_ModiRole(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_role_no int,
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
    declare v_role_name varchar(64);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_co_no int;
    declare v_role_code varchar(32);
    declare v_role_type int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_role_name = p_role_name;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_co_no = 0;
    SET v_role_code = " ";
    SET v_role_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_权限_角色表][{角色名称}=@角色名称#][{角色编号}=@角色编号#][2][@角色编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_perm_role set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, role_name=v_role_name where role_no=v_role_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.7.2.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("角色编号=",v_role_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("角色编号=",v_role_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_权限_角色表][字段][字段变量][{角色编号}=@角色编号#][4][@角色编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, role_no, 
        co_no, role_code, role_name, role_type into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_role_no, 
        v_co_no, v_role_code, v_role_name, v_role_type from db_pub.tb_perm_role where role_no=v_role_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.7.2.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("角色编号=",v_role_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("角色编号=",v_role_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* [插入表记录][公共_权限_角色流水表][字段][字段变量][5][@角色编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_perm_role_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        role_no, role_name, role_type, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_role_no, v_role_name, v_role_type, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.7.2.5";
        SET v_error_info =  CONCAT(concat("角色编号=",v_role_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_删除角色
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_DeleteRole;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_DeleteRole(
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
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_co_no int;
    declare v_role_code varchar(32);
    declare v_role_name varchar(64);
    declare v_role_type int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_co_no = 0;
    SET v_role_code = " ";
    SET v_role_name = " ";
    SET v_role_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_权限_角色表][字段][字段变量][{角色编号}=@角色编号#][4][@角色编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, role_no, 
        co_no, role_code, role_name, role_type into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_role_no, 
        v_co_no, v_role_code, v_role_name, v_role_type from db_pub.tb_perm_role where role_no=v_role_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.7.3.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("角色编号=",v_role_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("角色编号=",v_role_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_权限_角色表][{角色编号}=@角色编号#][3][@角色编号#] */
    delete from db_pub.tb_perm_role 
        where role_no=v_role_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.7.3.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("角色编号=",v_role_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("角色编号=",v_role_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* [插入表记录][公共_权限_角色流水表][字段][字段变量][5][@角色编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_perm_role_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        role_no, role_name, role_type, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_role_no, v_role_name, v_role_type, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.7.3.5";
        SET v_error_info =  CONCAT(concat("角色编号=",v_role_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* if @角色类型# = 《角色类型-交易》 then */
    if v_role_type = 1 then

        /* [删除表记录][公共_权限_角色交易菜单功能表][{角色编号}=@角色编号#][3][@角色编号#] */
        delete from db_pub.tb_perm_role_exch_menu 
            where role_no=v_role_no;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.7.3.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("角色编号=",v_role_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("角色编号=",v_role_no);
            end if;
            leave label_pro;
        end if;


    /* elseif @角色类型# = 《角色类型-管理》 then */
    elseif v_role_type = 2 then

        /* [删除表记录][公共_权限_角色管理菜单功能表][{角色编号}=@角色编号#][3][@角色编号#] */
        delete from db_pub.tb_perm_role_mage_menu 
            where role_no=v_role_no;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.7.3.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("角色编号=",v_role_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("角色编号=",v_role_no);
            end if;
            leave label_pro;
        end if;


    /* elseif @角色类型# = 《角色类型-运维》 then */
    elseif v_role_type = 3 then

        /* [删除表记录][公共_权限_角色运维菜单功能表][{角色编号}=@角色编号#][3][@角色编号#] */
        delete from db_pub.tb_perm_role_back_menu 
            where role_no=v_role_no;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.7.3.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("角色编号=",v_role_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("角色编号=",v_role_no);
            end if;
            leave label_pro;
        end if;


    /* elseif @角色类型# = 《角色类型-服务》 then */
    elseif v_role_type = 4 then

        /* [删除表记录][公共_权限_角色服务菜单功能表][{角色编号}=@角色编号#][3][@角色编号#] */
        delete from db_pub.tb_perm_role_serv_menu 
            where role_no=v_role_no;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.7.3.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("角色编号=",v_role_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("角色编号=",v_role_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [删除表记录][公共_权限_操作员角色表][{角色编号}=@角色编号#][3][@角色编号#] */
    delete from db_pub.tb_perm_opor_role 
        where role_no=v_role_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.7.3.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("角色编号=",v_role_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("角色编号=",v_role_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_查询角色列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_QueryRoleList;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_QueryRoleList(
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
    
    #特殊角色不允许查询

    /* [获取表全记录][公共_权限_角色表][字段][(@机构编号#=0 or {机构编号}=@机构编号# or {机构编号}=9999) and (@角色编号#=0 or {角色编号}=@角色编号#) and ({角色类型}=《角色类型-交易》 or {角色类型}=《角色类型-管理》 or {角色类型}=《角色类型-运维》 or {角色类型}=《角色类型-服务》)] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, role_no, 
        co_no, role_code, role_name, role_type from db_pub.tb_perm_role where (v_co_no=0 or co_no=v_co_no or co_no=9999) and (v_role_no=0 or role_no=v_role_no) and (role_type=1 or role_type=2 or role_type=3 or role_type=4);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_检查角色存在
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_CheckRoleExists;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_CheckRoleExists(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_role_code varchar(32),
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
    declare v_co_no int;
    declare v_role_code varchar(32);
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
    SET v_co_no = p_co_no;
    SET v_role_code = p_role_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录数量][公共_权限_角色表][@记录个数#][{机构编号}=@机构编号# and {角色编码}=@角色编码#] */
    select count(1) into v_record_count from db_pub.tb_perm_role where co_no=v_co_no and role_code=v_role_code;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_批量新增角色菜单功能
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_BatchAddRoleMenuFunc;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_BatchAddRoleMenuFunc(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_role_no int,
    IN p_role_type int,
    IN p_busi_menu_no int,
    IN p_busi_func_code varchar(16),
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
    declare v_role_no int;
    declare v_role_type int;
    declare v_busi_menu_no int;
    declare v_busi_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_record_count int;
    declare v_menu_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_role_no = p_role_no;
    SET v_role_type = p_role_type;
    SET v_busi_menu_no = p_busi_menu_no;
    SET v_busi_func_code = p_busi_func_code;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_record_count = 0;
    SET v_menu_type = 0;

    
    label_pro:BEGIN
    

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* if @角色类型#=《角色类型-交易》 or  @角色类型#=《角色类型-交易特殊》 then */
    if v_role_type=1 or  v_role_type=11 then

        /* [记录不存在插入表记录][公共_权限_角色交易菜单功能表][字段][字段变量][{角色编号}=@角色编号# and {业务菜单编号}=@业务菜单编号# and {业务功能编码}=@业务功能编码#][1][@角色编号#,@业务菜单编号#,@业务功能编码#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_perm_role_exch_menu (
            create_date, create_time, update_date, 
            update_time, update_times, role_no, busi_menu_no, 
            busi_func_code) 
            select v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_role_no, v_busi_menu_no, 
            v_busi_func_code 
            from dual 
            where not exists(select * from db_pub.tb_perm_role_exch_menu where role_no=v_role_no and busi_menu_no=v_busi_menu_no and busi_func_code=v_busi_func_code);
        if v_error_code <> "0" then
                    
            SET v_error_code = "pubA.7.13.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code);
            end if;
            leave label_pro;
        end if;


        /* [获取影响行数][@记录个数#] */
        SET v_record_count=ROW_COUNT();


        /* if @记录个数#>0 then */
        if v_record_count>0 then

            /* set @菜单类型#=《菜单类型-交易》; */
            set v_menu_type=1;

            /* [插入表记录][公共_权限_角色菜单功能流水表][字段][字段变量][5][@角色编号#,@业务菜单编号#,@业务功能编码#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pub.tb_perm_role_menu_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                role_no, menu_type, busi_menu_no, busi_func_code, 
                oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_role_no, v_menu_type, v_busi_menu_no, v_busi_func_code, 
                v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.7.13.5";
                SET v_error_info =  CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
                leave label_pro;
            end if;

        end if;

    /* elseif @角色类型#=《角色类型-管理》 or @角色类型#=《角色类型-管理特殊》 then */
    elseif v_role_type=2 or v_role_type=12 then

        /* [记录不存在插入表记录][公共_权限_角色管理菜单功能表][字段][字段变量][{角色编号}=@角色编号# and {业务菜单编号}=@业务菜单编号# and {业务功能编码}=@业务功能编码#][1][@角色编号#,@业务菜单编号#,@业务功能编码#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_perm_role_mage_menu (
            create_date, create_time, update_date, 
            update_time, update_times, role_no, busi_menu_no, 
            busi_func_code) 
            select v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_role_no, v_busi_menu_no, 
            v_busi_func_code 
            from dual 
            where not exists(select * from db_pub.tb_perm_role_mage_menu where role_no=v_role_no and busi_menu_no=v_busi_menu_no and busi_func_code=v_busi_func_code);
        if v_error_code <> "0" then
                    
            SET v_error_code = "pubA.7.13.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code);
            end if;
            leave label_pro;
        end if;


        /* [获取影响行数][@记录个数#] */
        SET v_record_count=ROW_COUNT();


        /* if @记录个数#>0 then */
        if v_record_count>0 then

            /* set @菜单类型#=《菜单类型-管理》; */
            set v_menu_type=2;

            /* [插入表记录][公共_权限_角色菜单功能流水表][字段][字段变量][5][@角色编号#,@业务菜单编号#,@业务功能编码#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pub.tb_perm_role_menu_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                role_no, menu_type, busi_menu_no, busi_func_code, 
                oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_role_no, v_menu_type, v_busi_menu_no, v_busi_func_code, 
                v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.7.13.5";
                SET v_error_info =  CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
                leave label_pro;
            end if;

        end if;

    /* elseif @角色类型#=《角色类型-运维》 or @角色类型#=《角色类型-运维特殊》 then */
    elseif v_role_type=3 or v_role_type=13 then

        /* [记录不存在插入表记录][公共_权限_角色运维菜单功能表][字段][字段变量][{角色编号}=@角色编号# and {业务菜单编号}=@业务菜单编号# and {业务功能编码}=@业务功能编码#][1][@角色编号#,@业务菜单编号#,@业务功能编码#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_perm_role_back_menu (
            create_date, create_time, update_date, 
            update_time, update_times, role_no, busi_menu_no, 
            busi_func_code) 
            select v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_role_no, v_busi_menu_no, 
            v_busi_func_code 
            from dual 
            where not exists(select * from db_pub.tb_perm_role_back_menu where role_no=v_role_no and busi_menu_no=v_busi_menu_no and busi_func_code=v_busi_func_code);
        if v_error_code <> "0" then
                    
            SET v_error_code = "pubA.7.13.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code);
            end if;
            leave label_pro;
        end if;


        /* [获取影响行数][@记录个数#] */
        SET v_record_count=ROW_COUNT();


        /* if @记录个数#>0 then */
        if v_record_count>0 then

            /* set @菜单类型#=《菜单类型-运维》; */
            set v_menu_type=3;

            /* [插入表记录][公共_权限_角色菜单功能流水表][字段][字段变量][5][@角色编号#,@业务菜单编号#,@业务功能编码#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pub.tb_perm_role_menu_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                role_no, menu_type, busi_menu_no, busi_func_code, 
                oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_role_no, v_menu_type, v_busi_menu_no, v_busi_func_code, 
                v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.7.13.5";
                SET v_error_info =  CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
                leave label_pro;
            end if;

        end if;

    /* elseif @角色类型#=《角色类型-服务》 or @角色类型#=《角色类型-服务特殊》 then */
    elseif v_role_type=4 or v_role_type=14 then

        /* [记录不存在插入表记录][公共_权限_角色服务菜单功能表][字段][字段变量][{角色编号}=@角色编号# and {业务菜单编号}=@业务菜单编号# and {业务功能编码}=@业务功能编码#][1][@角色编号#,@业务菜单编号#,@业务功能编码#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_perm_role_serv_menu (
            create_date, create_time, update_date, 
            update_time, update_times, role_no, busi_menu_no, 
            busi_func_code) 
            select v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_role_no, v_busi_menu_no, 
            v_busi_func_code 
            from dual 
            where not exists(select * from db_pub.tb_perm_role_serv_menu where role_no=v_role_no and busi_menu_no=v_busi_menu_no and busi_func_code=v_busi_func_code);
        if v_error_code <> "0" then
                    
            SET v_error_code = "pubA.7.13.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code);
            end if;
            leave label_pro;
        end if;


        /* [获取影响行数][@记录个数#] */
        SET v_record_count=ROW_COUNT();


        /* if @记录个数#>0 then */
        if v_record_count>0 then

            /* set @菜单类型#=《菜单类型-服务》; */
            set v_menu_type=4;

            /* [插入表记录][公共_权限_角色菜单功能流水表][字段][字段变量][5][@角色编号#,@业务菜单编号#,@业务功能编码#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pub.tb_perm_role_menu_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                role_no, menu_type, busi_menu_no, busi_func_code, 
                oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_role_no, v_menu_type, v_busi_menu_no, v_busi_func_code, 
                v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.7.13.5";
                SET v_error_info =  CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
                leave label_pro;
            end if;

        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_批量删除角色菜单功能
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_BatchDeleteRoleMenuFunc;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_BatchDeleteRoleMenuFunc(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_role_no int,
    IN p_role_type int,
    IN p_busi_menu_no int,
    IN p_busi_func_code varchar(16),
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
    declare v_role_no int;
    declare v_role_type int;
    declare v_busi_menu_no int;
    declare v_busi_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_record_count int;
    declare v_menu_type int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_role_no = p_role_no;
    SET v_role_type = p_role_type;
    SET v_busi_menu_no = p_busi_menu_no;
    SET v_busi_func_code = p_busi_func_code;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_record_count = 0;
    SET v_menu_type = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* if @角色类型#=《角色类型-交易》 or @角色类型#=《角色类型-交易特殊》 then */
    if v_role_type=1 or v_role_type=11 then

        /* [删除表记录][公共_权限_角色交易菜单功能表][{角色编号}=@角色编号# and {业务菜单编号}=@业务菜单编号# and {业务功能编码}=@业务功能编码#][3][@角色编号#,@业务菜单编号#,@业务功能编码#] */
        delete from db_pub.tb_perm_role_exch_menu 
            where role_no=v_role_no and busi_menu_no=v_busi_menu_no and busi_func_code=v_busi_func_code;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.7.14.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code);
            end if;
            leave label_pro;
        end if;


        /* [获取影响行数][@记录个数#] */
        SET v_record_count=ROW_COUNT();


        /* if @记录个数#>0 then */
        if v_record_count>0 then

            /* set @菜单类型#=《菜单类型-交易》; */
            set v_menu_type=1;

            /* [插入表记录][公共_权限_角色菜单功能流水表][字段][字段变量][5][@角色编号#,@业务菜单编号#,@业务功能编码#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pub.tb_perm_role_menu_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                role_no, menu_type, busi_menu_no, busi_func_code, 
                oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_role_no, v_menu_type, v_busi_menu_no, v_busi_func_code, 
                v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.7.14.5";
                SET v_error_info =  CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
                leave label_pro;
            end if;

        end if;

    /* elseif @角色类型#=《角色类型-管理》 or @角色类型#=《角色类型-管理特殊》 then */
    elseif v_role_type=2 or v_role_type=12 then

        /* [删除表记录][公共_权限_角色管理菜单功能表][{角色编号}=@角色编号# and {业务菜单编号}=@业务菜单编号# and {业务功能编码}=@业务功能编码#][3][@角色编号#,@业务菜单编号#,@业务功能编码#] */
        delete from db_pub.tb_perm_role_mage_menu 
            where role_no=v_role_no and busi_menu_no=v_busi_menu_no and busi_func_code=v_busi_func_code;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.7.14.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code);
            end if;
            leave label_pro;
        end if;


        /* [获取影响行数][@记录个数#] */
        SET v_record_count=ROW_COUNT();


        /* if @记录个数#>0 then */
        if v_record_count>0 then

            /* set @菜单类型#=《菜单类型-管理》; */
            set v_menu_type=2;

            /* [插入表记录][公共_权限_角色菜单功能流水表][字段][字段变量][5][@角色编号#,@业务菜单编号#,@业务功能编码#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pub.tb_perm_role_menu_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                role_no, menu_type, busi_menu_no, busi_func_code, 
                oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_role_no, v_menu_type, v_busi_menu_no, v_busi_func_code, 
                v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.7.14.5";
                SET v_error_info =  CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
                leave label_pro;
            end if;

        end if;

    /* elseif @角色类型#=《角色类型-运维》 or @角色类型#=《角色类型-运维特殊》 then */
    elseif v_role_type=3 or v_role_type=13 then

        /* [删除表记录][公共_权限_角色运维菜单功能表][{角色编号}=@角色编号# and {业务菜单编号}=@业务菜单编号# and {业务功能编码}=@业务功能编码#][3][@角色编号#,@业务菜单编号#,@业务功能编码#] */
        delete from db_pub.tb_perm_role_back_menu 
            where role_no=v_role_no and busi_menu_no=v_busi_menu_no and busi_func_code=v_busi_func_code;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.7.14.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code);
            end if;
            leave label_pro;
        end if;


        /* [获取影响行数][@记录个数#] */
        SET v_record_count=ROW_COUNT();


        /* if @记录个数#>0 then */
        if v_record_count>0 then

            /* set @菜单类型#=《菜单类型-运维》; */
            set v_menu_type=3;

            /* [插入表记录][公共_权限_角色菜单功能流水表][字段][字段变量][5][@角色编号#,@业务菜单编号#,@业务功能编码#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pub.tb_perm_role_menu_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                role_no, menu_type, busi_menu_no, busi_func_code, 
                oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_role_no, v_menu_type, v_busi_menu_no, v_busi_func_code, 
                v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.7.14.5";
                SET v_error_info =  CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
                leave label_pro;
            end if;

        end if;

    /* elseif @角色类型#=《角色类型-服务》 or @角色类型#=《角色类型-服务特殊》 then */
    elseif v_role_type=4 or v_role_type=14 then

        /* [删除表记录][公共_权限_角色服务菜单功能表][{角色编号}=@角色编号# and {业务菜单编号}=@业务菜单编号# and {业务功能编码}=@业务功能编码#][3][@角色编号#,@业务菜单编号#,@业务功能编码#] */
        delete from db_pub.tb_perm_role_serv_menu 
            where role_no=v_role_no and busi_menu_no=v_busi_menu_no and busi_func_code=v_busi_func_code;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.7.14.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code);
            end if;
            leave label_pro;
        end if;


        /* [获取影响行数][@记录个数#] */
        SET v_record_count=ROW_COUNT();


        /* if @记录个数#>0 then */
        if v_record_count>0 then

            /* set @菜单类型#=《菜单类型-服务》; */
            set v_menu_type=4;

            /* [插入表记录][公共_权限_角色菜单功能流水表][字段][字段变量][5][@角色编号#,@业务菜单编号#,@业务功能编码#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pub.tb_perm_role_menu_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                role_no, menu_type, busi_menu_no, busi_func_code, 
                oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_role_no, v_menu_type, v_busi_menu_no, v_busi_func_code, 
                v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.7.14.5";
                SET v_error_info =  CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
                leave label_pro;
            end if;

        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_查询角色菜单功能列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_QueryRoleMenuFunc;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_QueryRoleMenuFunc(
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
    declare v_role_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_role_type = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_权限_角色表][{角色类型}][@角色类型#][{角色编号}=@角色编号#][201][@角色编号#] */
    select role_type into v_role_type from db_pub.tb_perm_role where role_no=v_role_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.7.15.201";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("角色编号=",v_role_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("角色编号=",v_role_no);
        end if;
        leave label_pro;
    end if;


    /* if @角色类型#=《角色类型-交易》 then */
    if v_role_type=1 then

        /* [获取表记录][公共_权限_角色交易菜单功能表][字段][{角色编号}=@角色编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, role_no, 
            busi_menu_no, busi_func_code from db_pub.tb_perm_role_exch_menu where role_no=v_role_no and row_id > v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, role_no, 
            busi_menu_no, busi_func_code from db_pub.tb_perm_role_exch_menu where role_no=v_role_no and row_id > v_row_id order by row_id limit v_row_count;
        end if;


    /* elseif @角色类型#=《角色类型-管理》 then */
    elseif v_role_type=2 then

        /* [获取表记录][公共_权限_角色管理菜单功能表][字段][{角色编号}=@角色编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, role_no, 
            busi_menu_no, busi_func_code from db_pub.tb_perm_role_mage_menu where role_no=v_role_no and row_id > v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, role_no, 
            busi_menu_no, busi_func_code from db_pub.tb_perm_role_mage_menu where role_no=v_role_no and row_id > v_row_id order by row_id limit v_row_count;
        end if;


    /* elseif @角色类型#=《角色类型-运维》 then */
    elseif v_role_type=3 then

        /* [获取表记录][公共_权限_角色运维菜单功能表][字段][{角色编号}=@角色编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, role_no, 
            busi_menu_no, busi_func_code from db_pub.tb_perm_role_back_menu where role_no=v_role_no and row_id > v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, role_no, 
            busi_menu_no, busi_func_code from db_pub.tb_perm_role_back_menu where role_no=v_role_no and row_id > v_row_id order by row_id limit v_row_count;
        end if;


    /* elseif @角色类型#=《角色类型-服务》 then */
    elseif v_role_type=4 then

        /* [获取表记录][公共_权限_角色服务菜单功能表][字段][{角色编号}=@角色编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, role_no, 
            busi_menu_no, busi_func_code from db_pub.tb_perm_role_serv_menu where role_no=v_role_no and row_id > v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, role_no, 
            busi_menu_no, busi_func_code from db_pub.tb_perm_role_serv_menu where role_no=v_role_no and row_id > v_row_id order by row_id limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_复制角色
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_CopyRole;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_CopyRole(
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
    IN p_co_no int,
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
    declare v_role_no int;
    declare v_role_code varchar(32);
    declare v_role_name varchar(64);
    declare v_co_no int;
    declare v_source_role_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_role_type int;
    declare v_menu_type int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_busi_menu_no int;
    declare v_busi_func_code varchar(16);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_co_no = p_co_no;
    SET v_source_role_no = p_source_role_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_role_type = 0;
    SET v_menu_type = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_busi_menu_no = 0;
    SET v_busi_func_code = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_权限_角色表][{角色类型}][@角色类型#][{角色编号}=@源角色编号#][201][@源角色编号#] */
    select role_type into v_role_type from db_pub.tb_perm_role where role_no=v_source_role_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.7.4.201";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("源角色编号=",v_source_role_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("源角色编号=",v_source_role_no);
        end if;
        leave label_pro;
    end if;


    /* if @角色类型#=《角色类型-交易》 then */
    if v_role_type=1 then

        /* set @菜单类型#=《菜单类型-交易》; */
        set v_menu_type=1;

        /* [插入表记录][公共_权限_角色表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{角色编号}, {机构编号}, {角色编码}, {角色名称}, {角色类型}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,1,@角色编号#, @机构编号#, @角色编码#, @角色名称#, @角色类型#][1][@源角色编号#,@角色编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_perm_role(
            create_date,create_time,update_date,update_time,update_times,role_no, co_no, role_code, role_name, role_type) 
        value( 
            v_create_date,v_create_time,v_update_date,v_update_time,1,v_role_no, v_co_no, v_role_code, v_role_name, v_role_type);
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.7.4.1";
            SET v_error_info =  CONCAT(concat("源角色编号=",v_source_role_no,",","角色编号=",v_role_no),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* [读取插入表记录][公共_权限_角色交易菜单功能表][公共_权限_角色交易菜单功能表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{角色编号}, {业务菜单编号}, {业务功能编码}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,1,@角色编号#, {业务菜单编号}, {业务功能编码}][{角色编号}=@源角色编号#][1][@源角色编号#,@角色编号#,@机构编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_perm_role_exch_menu (
            create_date,create_time,update_date,update_time,update_times,role_no, busi_menu_no, busi_func_code) 
            select 
            v_create_date,v_create_time,v_update_date,v_update_time,1,v_role_no, busi_menu_no, busi_func_code 
            from db_pub.tb_perm_role_exch_menu 
            where role_no=v_source_role_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.7.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("源角色编号=",v_source_role_no,",","角色编号=",v_role_no,",","机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("源角色编号=",v_source_role_no,",","角色编号=",v_role_no,",","机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;


    /* elseif @角色类型#=《角色类型-管理》 then */
    elseif v_role_type=2 then

        /* set @菜单类型#=《菜单类型-管理》; */
        set v_menu_type=2;

        /* [插入表记录][公共_权限_角色表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{角色编号}, {机构编号}, {角色编码}, {角色名称}, {角色类型}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,1,@角色编号#, @机构编号#, @角色编码#, @角色名称#, @角色类型#][1][@源角色编号#,@角色编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_perm_role(
            create_date,create_time,update_date,update_time,update_times,role_no, co_no, role_code, role_name, role_type) 
        value( 
            v_create_date,v_create_time,v_update_date,v_update_time,1,v_role_no, v_co_no, v_role_code, v_role_name, v_role_type);
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.7.4.1";
            SET v_error_info =  CONCAT(concat("源角色编号=",v_source_role_no,",","角色编号=",v_role_no),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* [读取插入表记录][公共_权限_角色管理菜单功能表][公共_权限_角色管理菜单功能表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{角色编号}, {业务菜单编号}, {业务功能编码}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,1,@角色编号#, {业务菜单编号}, {业务功能编码}][{角色编号}=@源角色编号#][1][@源角色编号#,@角色编号#,@机构编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_perm_role_mage_menu (
            create_date,create_time,update_date,update_time,update_times,role_no, busi_menu_no, busi_func_code) 
            select 
            v_create_date,v_create_time,v_update_date,v_update_time,1,v_role_no, busi_menu_no, busi_func_code 
            from db_pub.tb_perm_role_mage_menu 
            where role_no=v_source_role_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.7.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("源角色编号=",v_source_role_no,",","角色编号=",v_role_no,",","机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("源角色编号=",v_source_role_no,",","角色编号=",v_role_no,",","机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;


    /* elseif @角色类型#=《角色类型-运维》 then */
    elseif v_role_type=3 then

        /* set @菜单类型#=《菜单类型-运维》; */
        set v_menu_type=3;

        /* [插入表记录][公共_权限_角色表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{角色编号}, {机构编号}, {角色编码}, {角色名称}, {角色类型}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,1,@角色编号#, @机构编号#, @角色编码#, @角色名称#, @角色类型#][1][@源角色编号#,@角色编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_perm_role(
            create_date,create_time,update_date,update_time,update_times,role_no, co_no, role_code, role_name, role_type) 
        value( 
            v_create_date,v_create_time,v_update_date,v_update_time,1,v_role_no, v_co_no, v_role_code, v_role_name, v_role_type);
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.7.4.1";
            SET v_error_info =  CONCAT(concat("源角色编号=",v_source_role_no,",","角色编号=",v_role_no),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* [读取插入表记录][公共_权限_角色运维菜单功能表][公共_权限_角色运维菜单功能表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{角色编号}, {业务菜单编号}, {业务功能编码}][@创建日期#,@创建时间#,@更新日期#,1,@更新时间#,@角色编号#, {业务菜单编号}, {业务功能编码}][{角色编号}=@源角色编号#][1][@源角色编号#,@角色编号#,@机构编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_perm_role_back_menu (
            create_date,create_time,update_date,update_time,update_times,role_no, busi_menu_no, busi_func_code) 
            select 
            v_create_date,v_create_time,v_update_date,1,v_update_time,v_role_no, busi_menu_no, busi_func_code 
            from db_pub.tb_perm_role_back_menu 
            where role_no=v_source_role_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.7.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("源角色编号=",v_source_role_no,",","角色编号=",v_role_no,",","机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("源角色编号=",v_source_role_no,",","角色编号=",v_role_no,",","机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;


    /* elseif @角色类型#=《角色类型-服务》 then */
    elseif v_role_type=4 then

        /* set @菜单类型#=《菜单类型-服务》; */
        set v_menu_type=4;

        /* [插入表记录][公共_权限_角色表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数}{角色编号}, {机构编号}, {角色编码}, {角色名称}, {角色类型}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,1,@角色编号#, @机构编号#, @角色编码#, @角色名称#, @角色类型#][1][@源角色编号#,@角色编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_perm_role(
            create_date,create_time,update_date,update_time,update_timesrole_no, co_no, role_code, role_name, role_type) 
        value( 
            v_create_date,v_create_time,v_update_date,v_update_time,1,v_role_no, v_co_no, v_role_code, v_role_name, v_role_type);
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.7.4.1";
            SET v_error_info =  CONCAT(concat("源角色编号=",v_source_role_no,",","角色编号=",v_role_no),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* [读取插入表记录][公共_权限_角色服务菜单功能表][公共_权限_角色服务菜单功能表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{角色编号}, {业务菜单编号}, {业务功能编码}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,1,@角色编号#, {业务菜单编号}, {业务功能编码}][{角色编号}=@源角色编号#][1][@源角色编号#,@角色编号#,@机构编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_perm_role_serv_menu (
            create_date,create_time,update_date,update_time,update_times,role_no, busi_menu_no, busi_func_code) 
            select 
            v_create_date,v_create_time,v_update_date,v_update_time,1,v_role_no, busi_menu_no, busi_func_code 
            from db_pub.tb_perm_role_serv_menu 
            where role_no=v_source_role_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.7.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("源角色编号=",v_source_role_no,",","角色编号=",v_role_no,",","机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("源角色编号=",v_source_role_no,",","角色编号=",v_role_no,",","机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* set @业务菜单编号#=0; */
    set v_busi_menu_no=0;

    /* set @业务功能编码#=" "; */
    set v_busi_func_code=" ";

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_权限_角色流水表][字段][字段变量][5][@源角色编号#,@角色编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_perm_role_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        role_no, role_name, role_type, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_role_no, v_role_name, v_role_type, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.7.4.5";
        SET v_error_info =  CONCAT(concat("源角色编号=",v_source_role_no,",","角色编号=",v_role_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_查询操作员可用角色列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_QueryOperatorAllowRoleList;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_QueryOperatorAllowRoleList(
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
    

    /* [获取表全记录][公共_权限_角色表][字段][({机构编号}=@操作员机构编号# or {机构编号}=9999) and ({角色类型}=《角色类型-交易》 or {角色类型}=《角色类型-管理》 or {角色类型}=《角色类型-运维》 or {角色类型}=《角色类型-服务》)] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, role_no, 
        co_no, role_code, role_name, role_type from db_pub.tb_perm_role where (co_no=v_opor_co_no or co_no=9999) and (role_type=1 or role_type=2 or role_type=3 or role_type=4);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_新增操作员角色
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_AddOporRole;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_AddOporRole(
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
    IN p_is_check int,
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
    declare v_is_check int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_remark_info varchar(255);
    declare v_co_no int;
    declare v_role_type int;
    declare v_tmp_opor_no int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_is_check = p_is_check;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_remark_info = " ";
    SET v_co_no = 0;
    SET v_role_type = 0;
    SET v_tmp_opor_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @操作备注#="新增操作员角色"; */
    set v_oper_remark_info="新增操作员角色";

    /* [获取表记录变量][公共_权限_角色表][{机构编号}, {角色类型}][@机构编号#, @角色类型#][{角色编号}=@角色编号#][201][@角色编号#] */
    select co_no, role_type into v_co_no, v_role_type from db_pub.tb_perm_role where role_no=v_role_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.7.22.201";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("角色编号=",v_role_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("角色编号=",v_role_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@是否校验# = 《是否校验-是》 and (@角色类型# = 《角色类型-交易特殊》 or @角色类型# = 《角色类型-管理特殊》 or @角色类型# = 《角色类型-运维特殊》 or @角色类型# = 《角色类型-服务特殊》)][219][@目标操作员编号#, @角色编号#] */
    if v_is_check = 1 and (v_role_type = 11 or v_role_type = 12 or v_role_type = 13 or v_role_type = 14) then
        
        SET v_error_code = "pubA.7.22.219";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no,","," 角色编号=", v_role_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no,","," 角色编号=", v_role_no);
        end if;
        leave label_pro;
    end if;

    #可设置 9999 机构的角色。

    /* set @机构编号#=@目标操作员编号#/10000; */
    set v_co_no=v_target_opor_no/10000;

    /* set @临时_操作员编号#=@操作员编号#; */
    set v_tmp_opor_no=v_opor_no;

    /* set @操作员编号#=@目标操作员编号#; */
    set v_opor_no=v_target_opor_no;

    /* [插入表记录][公共_权限_操作员角色表][字段][字段变量][1][@操作员编号#,@角色编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_perm_opor_role(
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, role_no, 
        role_type) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_role_no, 
        v_role_type);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.7.22.1";
        SET v_error_info =  CONCAT(concat("操作员编号=",v_opor_no,",","角色编号=",v_role_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @操作员编号#=@临时_操作员编号#; */
    set v_opor_no=v_tmp_opor_no;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_权限_操作员角色流水表][字段][字段变量][5][@操作员编号#,@角色编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_perm_opor_role_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        target_opor_no, role_no, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_target_opor_no, v_role_no, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.7.22.5";
        SET v_error_info =  CONCAT(concat("操作员编号=",v_opor_no,",","角色编号=",v_role_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_删除操作员角色
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_DeleteOporRole;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_DeleteOporRole(
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
    declare v_oper_remark_info varchar(255);
    declare v_co_no int;
    declare v_tmp_opor_no int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_role_no = p_role_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_remark_info = " ";
    SET v_co_no = 0;
    SET v_tmp_opor_no = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @操作备注#="删除操作员角色"; */
    set v_oper_remark_info="删除操作员角色";

    /* [获取表记录变量][公共_权限_角色表][{机构编号}][@机构编号#][{角色编号}=@角色编号#][4][@角色编号#] */
    select co_no into v_co_no from db_pub.tb_perm_role where role_no=v_role_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.7.23.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("角色编号=",v_role_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("角色编号=",v_role_no);
        end if;
        leave label_pro;
    end if;

    #可设置 9999 机构的角色。

    /* set @机构编号#=@目标操作员编号#/10000; */
    set v_co_no=v_target_opor_no/10000;

    /* set @临时_操作员编号#=@操作员编号#; */
    set v_tmp_opor_no=v_opor_no;

    /* set @操作员编号#=@目标操作员编号#; */
    set v_opor_no=v_target_opor_no;

    /* [删除表记录][公共_权限_操作员角色表][{操作员编号}=@操作员编号# and {角色编号}=@角色编号#][3][@操作员编号#,@角色编号#] */
    delete from db_pub.tb_perm_opor_role 
        where opor_no=v_opor_no and role_no=v_role_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.7.23.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","角色编号=",v_role_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,",","角色编号=",v_role_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作员编号#=@临时_操作员编号#; */
    set v_opor_no=v_tmp_opor_no;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* [插入表记录][公共_权限_操作员角色流水表][字段][字段变量][5][@目标操作员编号#,@角色编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_perm_opor_role_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        target_opor_no, role_no, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_target_opor_no, v_role_no, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.7.23.5";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no,",","角色编号=",v_role_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_查询操作员角色列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_QueryOporRoleList;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_QueryOporRoleList(
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
    

    /* [获取表全记录][公共_权限_操作员角色表][字段][{操作员编号}=@查询操作员编号# and ({角色类型}=《角色类型-交易》 or {角色类型}=《角色类型-管理》 or {角色类型}=《角色类型-运维》 or {角色类型}=《角色类型-服务》)] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        role_no, role_type from db_pub.tb_perm_opor_role where opor_no=v_query_opor_no and (role_type=1 or role_type=2 or role_type=3 or role_type=4);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_获取操作员特殊角色编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_GetOporSpecRoleNo;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_GetOporSpecRoleNo(
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
    IN p_is_check int,
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
    declare v_target_opor_no int;
    declare v_menu_type int;
    declare v_is_check int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_role_no int;
    declare v_opor_name varchar(64);
    declare v_co_no int;
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_role_code varchar(32);
    declare v_role_name varchar(64);
    declare v_role_type int;
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_menu_type = p_menu_type;
    SET v_is_check = p_is_check;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_role_no = 0;
    SET v_opor_name = " ";
    SET v_co_no = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_role_code = " ";
    SET v_role_name = " ";
    SET v_role_type = 0;
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* set @角色编号#=0; */
    set v_role_no=0;

    /* if @是否校验# = 《是否校验-是》 then */
    if v_is_check = 1 then

        /* [锁定获取表记录变量][公共_用户_操作员信息表][{操作员名称}][@操作员名称#][{操作员编号}=@目标操作员编号#][4][@目标操作员编号#] */
        select opor_name into v_opor_name from db_pub.tb_user_opor_info where opor_no=v_target_opor_no limit 1 for update;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.7.25.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @菜单类型#=《菜单类型-交易》 then */
    if v_menu_type=1 then
        #先检查操作员特殊角色是否存在，存在则取此角色编号，不存在则自动新增角色

        /* [获取表记录变量语句][公共_权限_操作员角色表][{角色编号}][@角色编号#][{操作员编号}=@目标操作员编号# and {角色类型}=《角色类型-交易特殊》] */
        select role_no into v_role_no from db_pub.tb_perm_opor_role where opor_no=v_target_opor_no and role_type=11 limit 1;

        if FOUND_ROWS()=0 then

            /* set @角色编号#=0; */
            set v_role_no=0;
        end if;

    /* elseif @菜单类型#=《菜单类型-管理》 then */
    elseif v_menu_type=2 then
        #先检查操作员特殊角色是否存在，存在则取此角色编号，不存在则自动新增角色

        /* [获取表记录变量语句][公共_权限_操作员角色表][{角色编号}][@角色编号#][{操作员编号}=@目标操作员编号# and {角色类型}=《角色类型-管理特殊》] */
        select role_no into v_role_no from db_pub.tb_perm_opor_role where opor_no=v_target_opor_no and role_type=12 limit 1;

        if FOUND_ROWS()=0 then

            /* set @角色编号#=0; */
            set v_role_no=0;
        end if;

    /* elseif @菜单类型#=《菜单类型-运维》 then */
    elseif v_menu_type=3 then
        #先检查操作员特殊角色是否存在，存在则取此角色编号，不存在则自动新增角色

        /* [获取表记录变量语句][公共_权限_操作员角色表][{角色编号}][@角色编号#][{操作员编号}=@目标操作员编号# and {角色类型}=《角色类型-运维特殊》] */
        select role_no into v_role_no from db_pub.tb_perm_opor_role where opor_no=v_target_opor_no and role_type=13 limit 1;

        if FOUND_ROWS()=0 then

            /* set @角色编号#=0; */
            set v_role_no=0;
        end if;

    /* elseif @菜单类型#=《菜单类型-服务》 then */
    elseif v_menu_type=4 then
        #先检查操作员特殊角色是否存在，存在则取此角色编号，不存在则自动新增角色

        /* [获取表记录变量语句][公共_权限_操作员角色表][{角色编号}][@角色编号#][{操作员编号}=@目标操作员编号# and {角色类型}=《角色类型-服务特殊》] */
        select role_no into v_role_no from db_pub.tb_perm_opor_role where opor_no=v_target_opor_no and role_type=14 limit 1;

        if FOUND_ROWS()=0 then

            /* set @角色编号#=0; */
            set v_role_no=0;
        end if;
    end if;

    /* if @角色编号#=0 and @是否校验# = 《是否校验-是》 then */
    if v_role_no=0 and v_is_check = 1 then

        /* set @机构编号#=@目标操作员编号# div 10000; */
        set v_co_no=v_target_opor_no div 10000;

        /* set @编号类型#=《编号类型-角色编号》; */
        set v_record_no_type=14;

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
            SET v_error_code = "pubA.7.25.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取机构业务记录编号出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @角色编号#=@当前编号#; */
        set v_role_no=v_curr_no;

        /* set @角色编码#=@角色编号#; */
        set v_role_code=v_role_no;

        /* if @菜单类型#=《菜单类型-交易》 then */
        if v_menu_type=1 then

            /* set @角色名称#=concat("操作员", @目标操作员编号#, "交易特殊角色"); */
            set v_role_name=concat("操作员", v_target_opor_no, "交易特殊角色");

            /* set @角色类型#=《角色类型-交易特殊》; */
            set v_role_type=11;

        /* elseif @菜单类型#=《菜单类型-管理》 then */
        elseif v_menu_type=2 then

            /* set @角色名称#=concat("操作员", @目标操作员编号#, "管理特殊角色"); */
            set v_role_name=concat("操作员", v_target_opor_no, "管理特殊角色");

            /* set @角色类型#=《角色类型-管理特殊》; */
            set v_role_type=12;
        else

            /* set @角色名称#=concat("操作员", @目标操作员编号#, "运维特殊角色"); */
            set v_role_name=concat("操作员", v_target_opor_no, "运维特殊角色");

            /* set @角色类型#=《角色类型-运维特殊》; */
            set v_role_type=13;
        end if;

        /* set @操作备注#="自动新增操作员特殊角色"; */
        set v_oper_remark_info="自动新增操作员特殊角色";

        /* 调用【原子_公共_权限_新增角色】*/
        call db_pub.pra_perm_AddRole(
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
            SET v_error_code = "pubA.7.25.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_新增角色出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @是否校验# = 《是否校验-否》; */
        set v_is_check = 2;

        /* 调用【原子_公共_权限_新增操作员角色】*/
        call db_pub.pra_perm_AddOporRole(
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
            v_is_check,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubA.7.25.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_新增操作员角色出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_role_no = v_role_no;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_查询全部菜单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_QueryAllMenu;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_QueryAllMenu(
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
    

    /* if @菜单类型#=《菜单类型-交易》 then */
    if v_menu_type=1 then

        /* [获取表全记录][公共_权限_交易菜单表][字段][1=1] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, busi_menu_no, 
            menu_name, menu_parent, menu_child, menu_path, 
            menu_image from db_pub.tb_perm_exch_menu where 1=1;


    /* elseif @菜单类型#=《菜单类型-管理》 then */
    elseif v_menu_type=2 then

        /* [获取表全记录][公共_权限_管理菜单表][字段][1=1] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, busi_menu_no, 
            menu_name, menu_parent, menu_child, menu_path, 
            menu_image from db_pub.tb_perm_mage_menu where 1=1;


    /* elseif @菜单类型#=《菜单类型-运维》 then */
    elseif v_menu_type=3 then

        /* [获取表全记录][公共_权限_运维菜单表][字段][1=1] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, busi_menu_no, 
            menu_name, menu_parent, menu_child, menu_path, 
            menu_image from db_pub.tb_perm_back_menu where 1=1;


    /* elseif @菜单类型#=《菜单类型-服务》 then */
    elseif v_menu_type=4 then

        /* [获取表全记录][公共_权限_服务菜单表][字段][1=1] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, busi_menu_no, 
            menu_name, menu_parent, menu_child, menu_path, 
            menu_image from db_pub.tb_perm_serv_menu where 1=1;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_查询全部菜单功能
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_QueryAllMenuFunc;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_QueryAllMenuFunc(
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
    

    /* if @菜单类型#=《菜单类型-交易》 then */
    if v_menu_type=1 then

        /* [获取表全记录][公共_权限_交易菜单功能对照表][字段][1=1] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, busi_menu_no, 
            busi_func_code, func_name from db_pub.tb_perm_exch_menu_func where 1=1;


    /* elseif @菜单类型#=《菜单类型-管理》 then */
    elseif v_menu_type=2 then

        /* [获取表全记录][公共_权限_管理菜单功能对照表][字段][1=1] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, busi_menu_no, 
            busi_func_code, func_name from db_pub.tb_perm_mage_menu_func where 1=1;


    /* elseif @菜单类型#=《菜单类型-运维》 then */
    elseif v_menu_type=3 then

        /* [获取表全记录][公共_权限_运维菜单功能对照表][字段][1=1] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, busi_menu_no, 
            busi_func_code, func_name from db_pub.tb_perm_back_menu_func where 1=1;


    /* elseif @菜单类型#=《菜单类型-服务》 then */
    elseif v_menu_type=4 then

        /* [获取表全记录][公共_权限_服务菜单功能对照表][字段][1=1] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, busi_menu_no, 
            busi_func_code, func_name from db_pub.tb_perm_serv_menu_func where 1=1;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_查询操作员普通菜单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_QueryOporAllMenu;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_QueryOporAllMenu(
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
    declare v_role_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_role_no_str = " ";

    
    label_pro:BEGIN
    

    /* if @菜单类型#=《菜单类型-交易》 then */
    if v_menu_type=1 then

        /* [获取表记录变量语句][公共_权限_操作员角色表][group_concat({角色编号} SEPARATOR ';')][@角色编号串#][{操作员编号}=@查询操作员编号# and {角色类型}=《角色类型-交易》] */
        select group_concat(role_no SEPARATOR ';') into v_role_no_str from db_pub.tb_perm_opor_role where opor_no=v_query_opor_no and role_type=1 limit 1;


        /* [检查正常返回][@角色编号串# is null] */
        if v_role_no_str is null then
            leave label_pro;
        end if;


        /* set @角色编号串#=concat(";", @角色编号串#, ";"); */
        set v_role_no_str=concat(";", v_role_no_str, ";");

        /* [获取表全记录去重][公共_权限_角色交易菜单功能表][{业务菜单编号}][instr(@角色编号串#, concat(";",{角色编号},";")) > 0] */
        select distinct busi_menu_no from db_pub.tb_perm_role_exch_menu where instr(v_role_no_str, concat(";",role_no,";")) > 0;


    /* elseif @菜单类型#=《菜单类型-管理》 then */
    elseif v_menu_type=2 then

        /* [获取表记录变量语句][公共_权限_操作员角色表][group_concat({角色编号} SEPARATOR ';')][@角色编号串#][{操作员编号}=@查询操作员编号# and {角色类型}=《角色类型-管理》] */
        select group_concat(role_no SEPARATOR ';') into v_role_no_str from db_pub.tb_perm_opor_role where opor_no=v_query_opor_no and role_type=2 limit 1;


        /* [检查正常返回][@角色编号串# is null] */
        if v_role_no_str is null then
            leave label_pro;
        end if;


        /* set @角色编号串#=concat(";", @角色编号串#, ";"); */
        set v_role_no_str=concat(";", v_role_no_str, ";");

        /* [获取表全记录去重][公共_权限_角色管理菜单功能表][{业务菜单编号}][instr(@角色编号串#, concat(";",{角色编号},";")) > 0] */
        select distinct busi_menu_no from db_pub.tb_perm_role_mage_menu where instr(v_role_no_str, concat(";",role_no,";")) > 0;


    /* elseif @菜单类型#=《菜单类型-运维》 then */
    elseif v_menu_type=3 then

        /* [获取表记录变量语句][公共_权限_操作员角色表][group_concat({角色编号} SEPARATOR ';')][@角色编号串#][{操作员编号}=@查询操作员编号# and {角色类型}=《角色类型-运维》] */
        select group_concat(role_no SEPARATOR ';') into v_role_no_str from db_pub.tb_perm_opor_role where opor_no=v_query_opor_no and role_type=3 limit 1;


        /* [检查正常返回][@角色编号串# is null] */
        if v_role_no_str is null then
            leave label_pro;
        end if;


        /* set @角色编号串#=concat(";", @角色编号串#, ";"); */
        set v_role_no_str=concat(";", v_role_no_str, ";");

        /* [获取表全记录去重][公共_权限_角色运维菜单功能表][{业务菜单编号}][instr(@角色编号串#, concat(";",{角色编号},";")) > 0] */
        select distinct busi_menu_no from db_pub.tb_perm_role_back_menu where instr(v_role_no_str, concat(";",role_no,";")) > 0;


    /* elseif @菜单类型#=《菜单类型-服务》 then */
    elseif v_menu_type=4 then

        /* [获取表记录变量语句][公共_权限_操作员角色表][group_concat({角色编号} SEPARATOR ';')][@角色编号串#][{操作员编号}=@查询操作员编号# and {角色类型}=《角色类型-服务》] */
        select group_concat(role_no SEPARATOR ';') into v_role_no_str from db_pub.tb_perm_opor_role where opor_no=v_query_opor_no and role_type=4 limit 1;


        /* [检查正常返回][@角色编号串# is null] */
        if v_role_no_str is null then
            leave label_pro;
        end if;


        /* set @角色编号串#=concat(";", @角色编号串#, ";"); */
        set v_role_no_str=concat(";", v_role_no_str, ";");

        /* [获取表全记录去重][公共_权限_角色服务菜单功能表][{业务菜单编号}][instr(@角色编号串#, concat(";",{角色编号},";")) > 0] */
        select distinct busi_menu_no from db_pub.tb_perm_role_serv_menu where instr(v_role_no_str, concat(";",role_no,";")) > 0;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_查询操作员特殊菜单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_QueryOporSpecMenu;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_QueryOporSpecMenu(
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
    declare v_role_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_role_no_str = " ";

    
    label_pro:BEGIN
    

    /* if @菜单类型#=《菜单类型-交易》 then */
    if v_menu_type=1 then

        /* [获取表记录变量语句][公共_权限_操作员角色表][group_concat({角色编号} SEPARATOR ';')][@角色编号串#][{操作员编号}=@查询操作员编号# and {角色类型}=《角色类型-交易特殊》] */
        select group_concat(role_no SEPARATOR ';') into v_role_no_str from db_pub.tb_perm_opor_role where opor_no=v_query_opor_no and role_type=11 limit 1;


        /* [检查正常返回][@角色编号串# is null] */
        if v_role_no_str is null then
            leave label_pro;
        end if;


        /* set @角色编号串#=concat(";", @角色编号串#, ";"); */
        set v_role_no_str=concat(";", v_role_no_str, ";");

        /* [获取表全记录去重][公共_权限_角色交易菜单功能表][{业务菜单编号}][instr(@角色编号串#, concat(";",{角色编号},";")) > 0] */
        select distinct busi_menu_no from db_pub.tb_perm_role_exch_menu where instr(v_role_no_str, concat(";",role_no,";")) > 0;


    /* elseif @菜单类型#=《菜单类型-管理》 then */
    elseif v_menu_type=2 then

        /* [获取表记录变量语句][公共_权限_操作员角色表][group_concat({角色编号} SEPARATOR ';')][@角色编号串#][{操作员编号}=@查询操作员编号# and {角色类型}=《角色类型-管理特殊》] */
        select group_concat(role_no SEPARATOR ';') into v_role_no_str from db_pub.tb_perm_opor_role where opor_no=v_query_opor_no and role_type=12 limit 1;


        /* [检查正常返回][@角色编号串# is null] */
        if v_role_no_str is null then
            leave label_pro;
        end if;


        /* set @角色编号串#=concat(";", @角色编号串#, ";"); */
        set v_role_no_str=concat(";", v_role_no_str, ";");

        /* [获取表全记录去重][公共_权限_角色管理菜单功能表][{业务菜单编号}][instr(@角色编号串#, concat(";",{角色编号},";")) > 0] */
        select distinct busi_menu_no from db_pub.tb_perm_role_mage_menu where instr(v_role_no_str, concat(";",role_no,";")) > 0;


    /* elseif @菜单类型#=《菜单类型-运维》 then */
    elseif v_menu_type=3 then

        /* [获取表记录变量语句][公共_权限_操作员角色表][group_concat({角色编号} SEPARATOR ';')][@角色编号串#][{操作员编号}=@查询操作员编号# and {角色类型}=《角色类型-运维特殊》] */
        select group_concat(role_no SEPARATOR ';') into v_role_no_str from db_pub.tb_perm_opor_role where opor_no=v_query_opor_no and role_type=13 limit 1;


        /* [检查正常返回][@角色编号串# is null] */
        if v_role_no_str is null then
            leave label_pro;
        end if;


        /* set @角色编号串#=concat(";", @角色编号串#, ";"); */
        set v_role_no_str=concat(";", v_role_no_str, ";");

        /* [获取表全记录去重][公共_权限_角色运维菜单功能表][{业务菜单编号}][instr(@角色编号串#, concat(";",{角色编号},";")) > 0] */
        select distinct busi_menu_no from db_pub.tb_perm_role_back_menu where instr(v_role_no_str, concat(";",role_no,";")) > 0;


    /* elseif @菜单类型#=《菜单类型-服务》 then */
    elseif v_menu_type=4 then

        /* [获取表记录变量语句][公共_权限_操作员角色表][group_concat({角色编号} SEPARATOR ';')][@角色编号串#][{操作员编号}=@查询操作员编号# and {角色类型}=《角色类型-服务特殊》] */
        select group_concat(role_no SEPARATOR ';') into v_role_no_str from db_pub.tb_perm_opor_role where opor_no=v_query_opor_no and role_type=14 limit 1;


        /* [检查正常返回][@角色编号串# is null] */
        if v_role_no_str is null then
            leave label_pro;
        end if;


        /* set @角色编号串#=concat(";", @角色编号串#, ";"); */
        set v_role_no_str=concat(";", v_role_no_str, ";");

        /* [获取表全记录去重][公共_权限_角色服务菜单功能表][{业务菜单编号}][instr(@角色编号串#, concat(";",{角色编号},";")) > 0] */
        select distinct busi_menu_no from db_pub.tb_perm_role_serv_menu where instr(v_role_no_str, concat(";",role_no,";")) > 0;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_查询操作员普通菜单功能
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_QueryOporAllMenuFunc;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_QueryOporAllMenuFunc(
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
    declare v_role_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_role_no_str = " ";

    
    label_pro:BEGIN
    

    /* if @菜单类型#=《菜单类型-交易》 then */
    if v_menu_type=1 then

        /* [获取表记录变量语句][公共_权限_操作员角色表][group_concat({角色编号} SEPARATOR ';')][@角色编号串#][{操作员编号}=@查询操作员编号# and {角色类型}=《角色类型-交易》] */
        select group_concat(role_no SEPARATOR ';') into v_role_no_str from db_pub.tb_perm_opor_role where opor_no=v_query_opor_no and role_type=1 limit 1;


        /* [检查正常返回][@角色编号串# is null] */
        if v_role_no_str is null then
            leave label_pro;
        end if;


        /* set @角色编号串#=concat(";", @角色编号串#, ";"); */
        set v_role_no_str=concat(";", v_role_no_str, ";");

        /* [获取表全记录去重][公共_权限_角色交易菜单功能表][{业务菜单编号},{业务功能编码}][instr(@角色编号串#, concat(";",{角色编号},";")) > 0] */
        select distinct busi_menu_no,busi_func_code from db_pub.tb_perm_role_exch_menu where instr(v_role_no_str, concat(";",role_no,";")) > 0;


    /* elseif @菜单类型#=《菜单类型-管理》 then */
    elseif v_menu_type=2 then

        /* [获取表记录变量语句][公共_权限_操作员角色表][group_concat({角色编号} SEPARATOR ';')][@角色编号串#][{操作员编号}=@查询操作员编号# and {角色类型}=《角色类型-管理》] */
        select group_concat(role_no SEPARATOR ';') into v_role_no_str from db_pub.tb_perm_opor_role where opor_no=v_query_opor_no and role_type=2 limit 1;


        /* [检查正常返回][@角色编号串# is null] */
        if v_role_no_str is null then
            leave label_pro;
        end if;


        /* set @角色编号串#=concat(";", @角色编号串#, ";"); */
        set v_role_no_str=concat(";", v_role_no_str, ";");

        /* [获取表全记录去重][公共_权限_角色管理菜单功能表][{业务菜单编号},{业务功能编码}][instr(@角色编号串#, concat(";",{角色编号},";")) > 0] */
        select distinct busi_menu_no,busi_func_code from db_pub.tb_perm_role_mage_menu where instr(v_role_no_str, concat(";",role_no,";")) > 0;


    /* elseif @菜单类型#=《菜单类型-运维》 then */
    elseif v_menu_type=3 then

        /* [获取表记录变量语句][公共_权限_操作员角色表][group_concat({角色编号} SEPARATOR ';')][@角色编号串#][{操作员编号}=@查询操作员编号# and {角色类型}=《角色类型-运维》] */
        select group_concat(role_no SEPARATOR ';') into v_role_no_str from db_pub.tb_perm_opor_role where opor_no=v_query_opor_no and role_type=3 limit 1;


        /* [检查正常返回][@角色编号串# is null] */
        if v_role_no_str is null then
            leave label_pro;
        end if;


        /* set @角色编号串#=concat(";", @角色编号串#, ";"); */
        set v_role_no_str=concat(";", v_role_no_str, ";");

        /* [获取表全记录去重][公共_权限_角色运维菜单功能表][{业务菜单编号},{业务功能编码}][instr(@角色编号串#, concat(";",{角色编号},";")) > 0] */
        select distinct busi_menu_no,busi_func_code from db_pub.tb_perm_role_back_menu where instr(v_role_no_str, concat(";",role_no,";")) > 0;


    /* elseif @菜单类型#=《菜单类型-服务》 then */
    elseif v_menu_type=4 then

        /* [获取表记录变量语句][公共_权限_操作员角色表][group_concat({角色编号} SEPARATOR ';')][@角色编号串#][{操作员编号}=@查询操作员编号# and {角色类型}=《角色类型-管理》] */
        select group_concat(role_no SEPARATOR ';') into v_role_no_str from db_pub.tb_perm_opor_role where opor_no=v_query_opor_no and role_type=2 limit 1;


        /* [检查正常返回][@角色编号串# is null] */
        if v_role_no_str is null then
            leave label_pro;
        end if;


        /* set @角色编号串#=concat(";", @角色编号串#, ";"); */
        set v_role_no_str=concat(";", v_role_no_str, ";");

        /* [获取表全记录去重][公共_权限_角色服务菜单功能表][{业务菜单编号},{业务功能编码}][instr(@角色编号串#, concat(";",{角色编号},";")) > 0] */
        select distinct busi_menu_no,busi_func_code from db_pub.tb_perm_role_serv_menu where instr(v_role_no_str, concat(";",role_no,";")) > 0;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_查询操作员特殊菜单功能
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_QueryOporSpecMenuFunc;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_QueryOporSpecMenuFunc(
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
    declare v_role_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_role_no_str = " ";

    
    label_pro:BEGIN
    

    /* if @菜单类型#=《菜单类型-交易》 then */
    if v_menu_type=1 then

        /* [获取表记录变量语句][公共_权限_操作员角色表][group_concat({角色编号} SEPARATOR ';')][@角色编号串#][{操作员编号}=@查询操作员编号# and {角色类型}=《角色类型-交易特殊》] */
        select group_concat(role_no SEPARATOR ';') into v_role_no_str from db_pub.tb_perm_opor_role where opor_no=v_query_opor_no and role_type=11 limit 1;


        /* [检查正常返回][@角色编号串# is null] */
        if v_role_no_str is null then
            leave label_pro;
        end if;


        /* set @角色编号串#=concat(";", @角色编号串#, ";"); */
        set v_role_no_str=concat(";", v_role_no_str, ";");

        /* [获取表全记录去重][公共_权限_角色交易菜单功能表][{业务菜单编号},{业务功能编码}][instr(@角色编号串#, concat(";",{角色编号},";")) > 0] */
        select distinct busi_menu_no,busi_func_code from db_pub.tb_perm_role_exch_menu where instr(v_role_no_str, concat(";",role_no,";")) > 0;


    /* elseif @菜单类型#=《菜单类型-管理》 then */
    elseif v_menu_type=2 then

        /* [获取表记录变量语句][公共_权限_操作员角色表][group_concat({角色编号} SEPARATOR ';')][@角色编号串#][{操作员编号}=@查询操作员编号# and {角色类型}=《角色类型-管理特殊》] */
        select group_concat(role_no SEPARATOR ';') into v_role_no_str from db_pub.tb_perm_opor_role where opor_no=v_query_opor_no and role_type=12 limit 1;


        /* [检查正常返回][@角色编号串# is null] */
        if v_role_no_str is null then
            leave label_pro;
        end if;


        /* set @角色编号串#=concat(";", @角色编号串#, ";"); */
        set v_role_no_str=concat(";", v_role_no_str, ";");

        /* [获取表全记录去重][公共_权限_角色管理菜单功能表][{业务菜单编号},{业务功能编码}][instr(@角色编号串#, concat(";",{角色编号},";")) > 0] */
        select distinct busi_menu_no,busi_func_code from db_pub.tb_perm_role_mage_menu where instr(v_role_no_str, concat(";",role_no,";")) > 0;


    /* elseif @菜单类型#=《菜单类型-运维》 then */
    elseif v_menu_type=3 then

        /* [获取表记录变量语句][公共_权限_操作员角色表][group_concat({角色编号} SEPARATOR ';')][@角色编号串#][{操作员编号}=@查询操作员编号# and {角色类型}=《角色类型-运维特殊》] */
        select group_concat(role_no SEPARATOR ';') into v_role_no_str from db_pub.tb_perm_opor_role where opor_no=v_query_opor_no and role_type=13 limit 1;


        /* [检查正常返回][@角色编号串# is null] */
        if v_role_no_str is null then
            leave label_pro;
        end if;


        /* set @角色编号串#=concat(";", @角色编号串#, ";"); */
        set v_role_no_str=concat(";", v_role_no_str, ";");

        /* [获取表全记录去重][公共_权限_角色运维菜单功能表][{业务菜单编号},{业务功能编码}][instr(@角色编号串#, concat(";",{角色编号},";")) > 0] */
        select distinct busi_menu_no,busi_func_code from db_pub.tb_perm_role_back_menu where instr(v_role_no_str, concat(";",role_no,";")) > 0;


    /* elseif @菜单类型#=《菜单类型-服务》 then */
    elseif v_menu_type=4 then

        /* [获取表记录变量语句][公共_权限_操作员角色表][group_concat({角色编号} SEPARATOR ';')][@角色编号串#][{操作员编号}=@查询操作员编号# and {角色类型}=《角色类型-服务特殊》] */
        select group_concat(role_no SEPARATOR ';') into v_role_no_str from db_pub.tb_perm_opor_role where opor_no=v_query_opor_no and role_type=14 limit 1;


        /* [检查正常返回][@角色编号串# is null] */
        if v_role_no_str is null then
            leave label_pro;
        end if;


        /* set @角色编号串#=concat(";", @角色编号串#, ";"); */
        set v_role_no_str=concat(";", v_role_no_str, ";");

        /* [获取表全记录去重][公共_权限_角色服务菜单功能表][{业务菜单编号},{业务功能编码}][instr(@角色编号串#, concat(";",{角色编号},";")) > 0] */
        select distinct busi_menu_no,busi_func_code from db_pub.tb_perm_role_serv_menu where instr(v_role_no_str, concat(";",role_no,";")) > 0;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_回收菜单功能权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_WithdrawMenuFunc;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_WithdrawMenuFunc(
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
    declare v_role_no int;
    declare v_target_opor_no int;
    declare v_oper_remark_info varchar(255);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_role_no_str varchar(2048);
    declare v_tmp_menu_func_str varchar(2048);
    declare v_busi_menu_no int;
    declare v_busi_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_menu_type = p_menu_type;
    SET v_menu_func_str = p_menu_func_str;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_role_no = 0;
    SET v_target_opor_no = 0;
    SET v_oper_remark_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_role_no_str = " ";
    SET v_tmp_menu_func_str = " ";
    SET v_busi_menu_no = 0;
    SET v_busi_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @角色编号#=0; */
    set v_role_no=0;

    /* set @目标操作员编号#=0; */
    set v_target_opor_no=0;

    /* set @操作备注#="回收菜单功能权限"; */
    set v_oper_remark_info="回收菜单功能权限";

    /* set @操作菜单#=@菜单编号#; */
    set v_oper_menu_no=v_menu_no;

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* set @角色编号串# = " "; */
    set v_role_no_str = " ";
    #先回收角色菜单功能权限
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

                /* if @菜单类型#=《菜单类型-交易》 then */
                if v_menu_type=1 then

                    /* [获取表记录串][公共_权限_角色表][{角色编号}][@角色编号串#][{机构编号}=@机构编号# and ({角色类型}=《角色类型-交易》 or {角色类型}=《角色类型-交易特殊》)] */
                    select group_concat(role_no) into v_role_no_str from db_pub.tb_perm_role where co_no=v_co_no and (role_type=1 or role_type=11);


                    /* set @角色编号串# = concat(",",ifnull(@角色编号串#," "),","); */
                    set v_role_no_str = concat(",",ifnull(v_role_no_str," "),",");

                    /* [删除表记录][公共_权限_角色交易菜单功能表][instr(@角色编号串#, concat(",", {角色编号}, ",")) > 0 and {业务菜单编号}=@业务菜单编号# and {业务功能编码}=@业务功能编码#][3][@角色编号#,@业务菜单编号#,@业务功能编码#] */
                    delete from db_pub.tb_perm_role_exch_menu 
                        where instr(v_role_no_str, concat(",", role_no, ",")) > 0 and busi_menu_no=v_busi_menu_no and busi_func_code=v_busi_func_code;
                    if v_error_code = 1 then
                                
                        SET v_error_code = "pubA.7.51.3";
                        if v_mysql_message <> "" then
                            SET v_error_info = CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
                        else
                            SET v_error_info = concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code);
                        end if;
                        leave label_pro;
                    end if;


                    /* set @角色编号# = -1; */
                    set v_role_no = -1;

                    /* [插入表记录][公共_权限_角色菜单功能流水表][字段][字段变量][5][@角色编号#,@业务菜单编号#,@业务功能编码#] */
                    set v_create_date = date_format(curdate(),'%Y%m%d');
                    set v_create_time = date_format(curtime(),'%H%i%s');
                    set v_update_date = v_create_date;
                    set v_update_time = v_create_time;
                    set v_update_times = 1;
                    insert into db_pub.tb_perm_role_menu_jour(
                        create_date, create_time, update_date, 
                        update_time, update_times, opor_co_no, opor_no, 
                        oper_mac, oper_ip_addr, oper_info, oper_way, 
                        oper_menu_no, oper_func_code, init_date, co_no, 
                        role_no, menu_type, busi_menu_no, busi_func_code, 
                        oper_remark_info) 
                    value( 
                        v_create_date, v_create_time, v_update_date, 
                        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                        v_role_no, v_menu_type, v_busi_menu_no, v_busi_func_code, 
                        v_oper_remark_info);
                    if v_error_code = "1" then
                                
                        SET v_error_code = "pubA.7.51.5";
                        SET v_error_info =  CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
                        leave label_pro;
                    end if;


                /* elseif @菜单类型#=《菜单类型-管理》 then */
                elseif v_menu_type=2 then

                    /* [获取表记录串][公共_权限_角色表][{角色编号}][@角色编号串#][{机构编号}=@机构编号# and ({角色类型}=《角色类型-管理》 or {角色类型}=《角色类型-管理特殊》)] */
                    select group_concat(role_no) into v_role_no_str from db_pub.tb_perm_role where co_no=v_co_no and (role_type=2 or role_type=12);


                    /* set @角色编号串# = concat(",",ifnull(@角色编号串#," "),","); */
                    set v_role_no_str = concat(",",ifnull(v_role_no_str," "),",");

                    /* [删除表记录][公共_权限_角色管理菜单功能表][instr(@角色编号串#, concat(",", {角色编号}, ",")) > 0 and {业务菜单编号}=@业务菜单编号# and {业务功能编码}=@业务功能编码#][3][@角色编号#,@业务菜单编号#,@业务功能编码#] */
                    delete from db_pub.tb_perm_role_mage_menu 
                        where instr(v_role_no_str, concat(",", role_no, ",")) > 0 and busi_menu_no=v_busi_menu_no and busi_func_code=v_busi_func_code;
                    if v_error_code = 1 then
                                
                        SET v_error_code = "pubA.7.51.3";
                        if v_mysql_message <> "" then
                            SET v_error_info = CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
                        else
                            SET v_error_info = concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code);
                        end if;
                        leave label_pro;
                    end if;


                    /* set @角色编号# = -1; */
                    set v_role_no = -1;

                    /* [插入表记录][公共_权限_角色菜单功能流水表][字段][字段变量][5][@角色编号#,@业务菜单编号#,@业务功能编码#] */
                    set v_create_date = date_format(curdate(),'%Y%m%d');
                    set v_create_time = date_format(curtime(),'%H%i%s');
                    set v_update_date = v_create_date;
                    set v_update_time = v_create_time;
                    set v_update_times = 1;
                    insert into db_pub.tb_perm_role_menu_jour(
                        create_date, create_time, update_date, 
                        update_time, update_times, opor_co_no, opor_no, 
                        oper_mac, oper_ip_addr, oper_info, oper_way, 
                        oper_menu_no, oper_func_code, init_date, co_no, 
                        role_no, menu_type, busi_menu_no, busi_func_code, 
                        oper_remark_info) 
                    value( 
                        v_create_date, v_create_time, v_update_date, 
                        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                        v_role_no, v_menu_type, v_busi_menu_no, v_busi_func_code, 
                        v_oper_remark_info);
                    if v_error_code = "1" then
                                
                        SET v_error_code = "pubA.7.51.5";
                        SET v_error_info =  CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
                        leave label_pro;
                    end if;


                /* elseif @菜单类型#=《菜单类型-运维》 then */
                elseif v_menu_type=3 then

                    /* [获取表记录串][公共_权限_角色表][{角色编号}][@角色编号串#][{机构编号}=@机构编号# and ({角色类型}=《角色类型-运维》 or {角色类型}=《角色类型-运维特殊》)] */
                    select group_concat(role_no) into v_role_no_str from db_pub.tb_perm_role where co_no=v_co_no and (role_type=3 or role_type=13);


                    /* set @角色编号串# = concat(",",ifnull(@角色编号串#," "),","); */
                    set v_role_no_str = concat(",",ifnull(v_role_no_str," "),",");

                    /* [删除表记录][公共_权限_角色运维菜单功能表][instr(@角色编号串#, concat(",", {角色编号}, ",")) > 0 and {业务菜单编号}=@业务菜单编号# and {业务功能编码}=@业务功能编码#][3][@角色编号#,@业务菜单编号#,@业务功能编码#] */
                    delete from db_pub.tb_perm_role_back_menu 
                        where instr(v_role_no_str, concat(",", role_no, ",")) > 0 and busi_menu_no=v_busi_menu_no and busi_func_code=v_busi_func_code;
                    if v_error_code = 1 then
                                
                        SET v_error_code = "pubA.7.51.3";
                        if v_mysql_message <> "" then
                            SET v_error_info = CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
                        else
                            SET v_error_info = concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code);
                        end if;
                        leave label_pro;
                    end if;


                    /* set @角色编号# = -1; */
                    set v_role_no = -1;

                    /* [插入表记录][公共_权限_角色菜单功能流水表][字段][字段变量][5][@角色编号#,@业务菜单编号#,@业务功能编码#] */
                    set v_create_date = date_format(curdate(),'%Y%m%d');
                    set v_create_time = date_format(curtime(),'%H%i%s');
                    set v_update_date = v_create_date;
                    set v_update_time = v_create_time;
                    set v_update_times = 1;
                    insert into db_pub.tb_perm_role_menu_jour(
                        create_date, create_time, update_date, 
                        update_time, update_times, opor_co_no, opor_no, 
                        oper_mac, oper_ip_addr, oper_info, oper_way, 
                        oper_menu_no, oper_func_code, init_date, co_no, 
                        role_no, menu_type, busi_menu_no, busi_func_code, 
                        oper_remark_info) 
                    value( 
                        v_create_date, v_create_time, v_update_date, 
                        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                        v_role_no, v_menu_type, v_busi_menu_no, v_busi_func_code, 
                        v_oper_remark_info);
                    if v_error_code = "1" then
                                
                        SET v_error_code = "pubA.7.51.5";
                        SET v_error_info =  CONCAT(concat("角色编号=",v_role_no,",","业务菜单编号=",v_busi_menu_no,",","业务功能编码=",v_busi_func_code),"#",v_mysql_message);
                        leave label_pro;
                    end if;

                end if;
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

# 原子_公共_权限_获取角色类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_GetRoleType;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_GetRoleType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_role_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_role_type int,
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
    declare v_role_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_role_type int;
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
    SET v_role_no = p_role_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_role_type = 0;
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_权限_角色表][{机构编号}, {角色类型}][@机构编号#, @角色类型#][{角色编号}=@角色编号#][4][@角色编号#] */
    select co_no, role_type into v_co_no, v_role_type from db_pub.tb_perm_role where role_no=v_role_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.7.52.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("角色编号=",v_role_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("角色编号=",v_role_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_role_type = v_role_type;
    SET p_co_no = v_co_no;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_归档公共权限数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_BackUpPermData;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_BackUpPermData(
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
    

    /* [数据归历史][公共_权限_角色流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_perm_role_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, role_no, role_name, role_type, 
        oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, role_no, role_name, role_type, 
        oper_remark_info 
        from db_pub.tb_perm_role_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.7.101.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_权限_角色流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_perm_role_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.7.101.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_权限_角色菜单功能流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_perm_role_menu_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, role_no, menu_type, busi_menu_no, 
        busi_func_code, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, role_no, menu_type, busi_menu_no, 
        busi_func_code, oper_remark_info 
        from db_pub.tb_perm_role_menu_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.7.101.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_权限_角色菜单功能流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_perm_role_menu_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.7.101.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_权限_操作员角色流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_perm_opor_role_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, target_opor_no, role_no, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, target_opor_no, role_no, oper_remark_info 
        from db_pub.tb_perm_opor_role_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.7.101.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_权限_操作员角色流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_perm_opor_role_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.7.101.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_权限_检查菜单功能权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_perm_CheckMenuFuncRights;;
DELIMITER ;;
CREATE PROCEDURE pra_perm_CheckMenuFuncRights(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_opor_type int,
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
    declare v_opor_type int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_role_no_str varchar(2048);
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
    SET v_opor_type = p_opor_type;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_role_no_str = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [检查正常返回][@菜单编号# =0] */
    if v_menu_no =0 then
        leave label_pro;
    end if;


    /* set @角色编号串# = ";"; */
    set v_role_no_str = ";";

    /* [获取表记录变量语句][公共_权限_操作员角色表][group_concat({角色编号} SEPARATOR ';')][@角色编号串#][{操作员编号} = @操作员编号#] */
    select group_concat(role_no SEPARATOR ';') into v_role_no_str from db_pub.tb_perm_opor_role where opor_no = v_opor_no limit 1;


    /* if @角色编号串# is null then */
    if v_role_no_str is null then

        /* set @角色编号串# = " "; */
        set v_role_no_str = " ";

        /* [报错返回][217][@角色编号串#,@菜单编号#,@功能编码#] */
            
            SET v_error_code = "pubA.7.301.217";
            SET v_error_info = concat("角色编号串=",v_role_no_str,",","菜单编号=",v_menu_no,",","功能编码=",v_func_code);
            leave label_pro;

    else

        /* set @角色编号串# = concat(";", @角色编号串#, ";"); */
        set v_role_no_str = concat(";", v_role_no_str, ";");
    end if;
    #检查操作员类型，授权操作员只能操作系统设计用于授权的菜单，其他菜单都不能操作
    #菜单权限授权时，菜单本身不区分授权菜单与普通菜单，只要操作员拥有的都可以授予其他人员
    #检查操作员角色菜单功能权限，菜单权限类型通过分段来区分，1开头为交易，2开头为管理，3开头为运维，4开头为运维，菜单编号总长度为9位

    /* if @菜单编号# >= 10000000 and @菜单编号# <= 99999999 then */
    if v_menu_no >= 10000000 and v_menu_no <= 99999999 then

        /* [记录不存在][公共_权限_角色交易菜单功能表][@记录个数#][instr(@角色编号串#, {角色编号}) > 0 and {业务菜单编号} = @菜单编号# and {业务功能编码} = @功能编码#][217][@角色编号串#,@菜单编号#,@功能编码#] */
        select count(1) into v_record_count from db_pub.tb_perm_role_exch_menu where instr(v_role_no_str, role_no) > 0 and busi_menu_no = v_menu_no and busi_func_code = v_func_code limit 1;
        if v_record_count = 0 then
                    
            SET v_error_code = "pubA.7.301.217";
            SET v_error_info = concat("角色编号串=",v_role_no_str,",","菜单编号=",v_menu_no,",","功能编码=",v_func_code);
            leave label_pro;
        end if;


    /* elseif @菜单编号# >= 1000000 and @菜单编号# <= 9999999 then */
    elseif v_menu_no >= 1000000 and v_menu_no <= 9999999 then

        /* [记录不存在][公共_权限_角色管理菜单功能表][@记录个数#][instr(@角色编号串#, {角色编号}) > 0 and {业务菜单编号} = @菜单编号# and {业务功能编码} = @功能编码#][217][@角色编号串#,@菜单编号#,@功能编码#] */
        select count(1) into v_record_count from db_pub.tb_perm_role_mage_menu where instr(v_role_no_str, role_no) > 0 and busi_menu_no = v_menu_no and busi_func_code = v_func_code limit 1;
        if v_record_count = 0 then
                    
            SET v_error_code = "pubA.7.301.217";
            SET v_error_info = concat("角色编号串=",v_role_no_str,",","菜单编号=",v_menu_no,",","功能编码=",v_func_code);
            leave label_pro;
        end if;


    /* elseif @菜单编号# >= 100000000 and @菜单编号# <= 999999999 then */
    elseif v_menu_no >= 100000000 and v_menu_no <= 999999999 then

        /* [记录不存在][公共_权限_角色运维菜单功能表][@记录个数#][instr(@角色编号串#, {角色编号}) > 0 and {业务菜单编号} = @菜单编号# and {业务功能编码} = @功能编码#][217][@角色编号串#,@菜单编号#,@功能编码#] */
        select count(1) into v_record_count from db_pub.tb_perm_role_back_menu where instr(v_role_no_str, role_no) > 0 and busi_menu_no = v_menu_no and busi_func_code = v_func_code limit 1;
        if v_record_count = 0 then
                    
            SET v_error_code = "pubA.7.301.217";
            SET v_error_info = concat("角色编号串=",v_role_no_str,",","菜单编号=",v_menu_no,",","功能编码=",v_func_code);
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


