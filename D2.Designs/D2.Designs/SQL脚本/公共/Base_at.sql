DELIMITER ;;
use db_pub;;

# 原子_公共_基础_设置系统信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_SetSysInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_SetSysInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sys_name varchar(64),
    IN p_init_date int,
    IN p_allow_next_init_time int,
    IN p_client_version varchar(16),
    IN p_manage_ver varchar(16),
    IN p_admin_ver varchar(16),
    IN p_update_addr varchar(255),
    IN p_dnload_addr varchar(255),
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
    declare v_sys_name varchar(64);
    declare v_init_date int;
    declare v_allow_next_init_time int;
    declare v_client_version varchar(16);
    declare v_manage_ver varchar(16);
    declare v_admin_ver varchar(16);
    declare v_update_addr varchar(255);
    declare v_dnload_addr varchar(255);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sys_status varchar(2);
    declare v_no_exch_date_str varchar(2048);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_sys_name = p_sys_name;
    SET v_init_date = p_init_date;
    SET v_allow_next_init_time = p_allow_next_init_time;
    SET v_client_version = p_client_version;
    SET v_manage_ver = p_manage_ver;
    SET v_admin_ver = p_admin_ver;
    SET v_update_addr = p_update_addr;
    SET v_dnload_addr = p_dnload_addr;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sys_status = "0";
    SET v_no_exch_date_str = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @系统状态# = 《系统状态-运行》; */
    set v_sys_status = "1";

    /* set @非交易日期串# = " "; */
    set v_no_exch_date_str = " ";

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("系统名称", "|", "初始化日期", "|", "允许次日初始化时间", "|", "客户端版本", "|", "管理端版本", "|", "运维端版本", "|", "更新地址", "|", "下载地址", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_sys_name, "|", v_init_date, "|", v_allow_next_init_time, "|", v_client_version, "|", v_manage_ver, "|", v_admin_ver, "|", v_update_addr, "|", v_dnload_addr, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_基础_系统信息表][{系统名称} = @系统名称#, {初始化日期} = @初始化日期#, {客户端版本} = @客户端版本#, {管理端版本} = @管理端版本#, {运维端版本} = @运维端版本#, {更新地址} = @更新地址#, {下载地址} = @下载地址#, {允许次日初始化时间}=@允许次日初始化时间#][1=1][2][@系统名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_sys_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sys_name = v_sys_name, init_date = v_init_date, client_version = v_client_version, manage_ver = v_manage_ver, admin_ver = v_admin_ver, update_addr = v_update_addr, dnload_addr = v_dnload_addr, allow_next_init_time=v_allow_next_init_time where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.1.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("系统名称=",v_sys_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("系统名称=",v_sys_name);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_sys_name, "|", v_init_date, "|", v_allow_next_init_time, "|", v_client_version, "|", v_manage_ver, "|", v_admin_ver, "|", v_update_addr, "|", v_dnload_addr, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_系统信息流水表][字段][字段变量][5][" "] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_sys_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.1.5";
        SET v_error_info =  CONCAT(" ","#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_设置系统非交易日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_SetSysNoExchDate;;
DELIMITER ;;
CREATE PROCEDURE pra_base_SetSysNoExchDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_no_exch_date_str varchar(2048),
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
    declare v_no_exch_date_str varchar(2048);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_no_exch_date_str = p_no_exch_date_str;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][{非交易日期串}][@非交易日期串#] */
    set v_jour_occur_field = concat("非交易日期串","|");
    set v_jour_occur_info = concat(v_no_exch_date_str,"|");


    /* [更新表记录][公共_基础_系统信息表][{非交易日期串}=@非交易日期串#][1 = 1][2][@非交易日期串#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_sys_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, no_exch_date_str=v_no_exch_date_str where 1 = 1;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.2.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("非交易日期串=",v_no_exch_date_str),"#",v_mysql_message);
        else
            SET v_error_info = concat("非交易日期串=",v_no_exch_date_str);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@非交易日期串#] */
    set v_jour_after_occur_info = concat(v_no_exch_date_str,"|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_系统信息流水表][字段][字段变量][5][" "] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_sys_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.2.5";
        SET v_error_info =  CONCAT(" ","#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_更新系统状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_UpdateSysStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_base_UpdateSysStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_sys_status varchar(2),
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
    declare v_sys_status varchar(2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_sys_status = p_sys_status;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][{系统状态}][@系统状态#] */
    set v_jour_occur_field = concat("系统状态","|");
    set v_jour_occur_info = concat(v_sys_status,"|");


    /* [更新表记录][公共_基础_系统信息表][{系统状态}=@系统状态#][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_sys_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sys_status=v_sys_status where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.3.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@系统状态#] */
    set v_jour_after_occur_info = concat(v_sys_status,"|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_系统信息流水表][字段][字段变量][5][" "] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_sys_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.3.5";
        SET v_error_info =  CONCAT(" ","#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_获取系统信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_GetSysInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_GetSysInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_sys_name varchar(64),
    OUT p_sys_status varchar(2),
    OUT p_init_date int,
    OUT p_no_exch_date_str varchar(2048),
    OUT p_allow_next_init_time int,
    OUT p_sys_config_str varchar(64),
    OUT p_client_version varchar(16),
    OUT p_manage_ver varchar(16),
    OUT p_admin_ver varchar(16),
    OUT p_update_addr varchar(255),
    OUT p_dnload_addr varchar(255)
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
    declare v_row_id bigint;
    declare v_sys_name varchar(64);
    declare v_sys_status varchar(2);
    declare v_init_date int;
    declare v_no_exch_date_str varchar(2048);
    declare v_allow_next_init_time int;
    declare v_sys_config_str varchar(64);
    declare v_client_version varchar(16);
    declare v_manage_ver varchar(16);
    declare v_admin_ver varchar(16);
    declare v_update_addr varchar(255);
    declare v_dnload_addr varchar(255);
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_sys_name = " ";
    SET v_sys_status = "0";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_no_exch_date_str = " ";
    SET v_allow_next_init_time = date_format(curtime(),'%H%i%s');
    SET v_sys_config_str = " ";
    SET v_client_version = " ";
    SET v_manage_ver = " ";
    SET v_admin_ver = " ";
    SET v_update_addr = " ";
    SET v_dnload_addr = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_系统信息表][字段][字段变量][1=1][4][" "] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, sys_name, 
        sys_status, init_date, no_exch_date_str, allow_next_init_time, 
        sys_config_str, client_version, manage_ver, admin_ver, 
        update_addr, dnload_addr into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_sys_name, 
        v_sys_status, v_init_date, v_no_exch_date_str, v_allow_next_init_time, 
        v_sys_config_str, v_client_version, v_manage_ver, v_admin_ver, 
        v_update_addr, v_dnload_addr from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.4.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_sys_name = v_sys_name;
    SET p_sys_status = v_sys_status;
    SET p_init_date = v_init_date;
    SET p_no_exch_date_str = v_no_exch_date_str;
    SET p_allow_next_init_time = v_allow_next_init_time;
    SET p_sys_config_str = v_sys_config_str;
    SET p_client_version = v_client_version;
    SET p_manage_ver = v_manage_ver;
    SET p_admin_ver = v_admin_ver;
    SET p_update_addr = v_update_addr;
    SET p_dnload_addr = v_dnload_addr;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询系统信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QuerySysInfoJour;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QuerySysInfoJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_基础_系统信息流水表][字段][{初始化日期} <= @初始化日期# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_base_sys_info_jour where init_date <= v_init_date and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_base_sys_info_jour where init_date <= v_init_date and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询历史系统信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QuerySysInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QuerySysInfoJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_基础_系统信息流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_base_sys_info_jour_his where (init_date between v_begin_date and v_end_date) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_base_sys_info_jour_his where (init_date between v_begin_date and v_end_date) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_修改系统控制配置串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_UpdateSysConfigStr;;
DELIMITER ;;
CREATE PROCEDURE pra_base_UpdateSysConfigStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_config_index int,
    IN p_config_value varchar(2048),
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
    declare v_config_index int;
    declare v_config_value varchar(2048);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_sys_config_str varchar(64);
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_config_index = p_config_index;
    SET v_config_value = p_config_value;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_sys_config_str = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][{配置位},{配置值},{系统控制配置串}][@配置位#,@配置值#,@系统控制配置串#] */
    set v_jour_occur_field = concat("配置位","|","配置值","|","系统控制配置串","|");
    set v_jour_occur_info = concat(v_config_index,"|",v_config_value,"|",v_sys_config_str,"|");


    /* [锁定获取表记录变量][公共_基础_系统信息表][{系统控制配置串}][@系统控制配置串#][1=1][4][" "] */
    select sys_config_str into v_sys_config_str from db_pub.tb_base_sys_info where 1=1 limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.7.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* set @系统控制配置串# = concat(left(@系统控制配置串#, @配置位#-1), left(@配置值#,1), right(@系统控制配置串#,LENGTH(@系统控制配置串#)-@配置位#)); */
    set v_sys_config_str = concat(left(v_sys_config_str, v_config_index-1), left(v_config_value,1), right(v_sys_config_str,LENGTH(v_sys_config_str)-v_config_index));

    /* [更新表记录][公共_基础_系统信息表][{系统控制配置串}=@系统控制配置串#][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_sys_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sys_config_str=v_sys_config_str where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.7.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@配置位#,@配置值#,@系统控制配置串#] */
    set v_jour_after_occur_info = concat(v_config_index,"|",v_config_value,"|",v_sys_config_str,"|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_系统信息流水表][字段][字段变量][5][" "] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_sys_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.7.5";
        SET v_error_info =  CONCAT(" ","#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_获取机器日期时间
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_GetMachDateTime;;
DELIMITER ;;
CREATE PROCEDURE pra_base_GetMachDateTime(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_mach_date int,
    OUT p_mach_time int
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
    declare v_mach_date int;
    declare v_mach_time int;

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
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_mach_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器日期][@机器日期#] */
    select date_format(curdate(),'%Y%m%d') into v_mach_date;


    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_mach_date = v_mach_date;
    SET p_mach_time = v_mach_time;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_获取数量上限
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_GetMaxQty;;
DELIMITER ;;
CREATE PROCEDURE pra_base_GetMaxQty(
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
    OUT p_pd_qty_max int,
    OUT p_max_acco_count int,
    OUT p_opor_qty_max int
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
    declare v_pd_qty_max int;
    declare v_max_acco_count int;
    declare v_opor_qty_max int;

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
    SET v_pd_qty_max = 0;
    SET v_max_acco_count = 0;
    SET v_opor_qty_max = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_机构信息表][{产品数量上限},{账户数量上限},{操作员数量上限}][@产品数量上限#,@账户数量上限#,@操作员数量上限#][{机构编号}=@机构编号#][4][@机构编号#] */
    select pd_qty_max,max_acco_count,opor_qty_max into v_pd_qty_max,v_max_acco_count,v_opor_qty_max from db_pub.tb_base_co_info where co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.9.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_qty_max = v_pd_qty_max;
    SET p_max_acco_count = v_max_acco_count;
    SET p_opor_qty_max = v_opor_qty_max;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_新增机构信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_AddCoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_AddCoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_co_name varchar(64),
    IN p_co_flname varchar(255),
    IN p_co_type int,
    IN p_reg_code varchar(16),
    IN p_reg_addr varchar(32),
    IN p_found_date int,
    IN p_reg_date int,
    IN p_conta_addr varchar(255),
    IN p_conta_name varchar(64),
    IN p_phone_number varchar(16),
    IN p_email varchar(255),
    IN p_pd_qty_max int,
    IN p_max_acco_count int,
    IN p_opor_qty_max int,
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
    IN p_busi_config_str varchar(64),
    IN p_comm_appr_oper int,
    IN p_market_price_ratio decimal(18,12),
    IN p_mul_acco_trd_assign_set varchar(64),
    IN p_mul_acco_trd_choice int,
    IN p_mul_acco_trd_qty_set varchar(64),
    IN p_genus_algo_strategy_set varchar(64),
    IN p_base_crncy_type varchar(3),
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
    declare v_co_name varchar(64);
    declare v_co_flname varchar(255);
    declare v_co_type int;
    declare v_reg_code varchar(16);
    declare v_reg_addr varchar(32);
    declare v_found_date int;
    declare v_reg_date int;
    declare v_conta_addr varchar(255);
    declare v_conta_name varchar(64);
    declare v_phone_number varchar(16);
    declare v_email varchar(255);
    declare v_pd_qty_max int;
    declare v_max_acco_count int;
    declare v_opor_qty_max int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_config_str varchar(64);
    declare v_comm_appr_oper int;
    declare v_market_price_ratio decimal(18,12);
    declare v_mul_acco_trd_assign_set varchar(64);
    declare v_mul_acco_trd_choice int;
    declare v_mul_acco_trd_qty_set varchar(64);
    declare v_genus_algo_strategy_set varchar(64);
    declare v_base_crncy_type varchar(3);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_co_status varchar(2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);
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
    SET v_co_no = p_co_no;
    SET v_co_name = p_co_name;
    SET v_co_flname = p_co_flname;
    SET v_co_type = p_co_type;
    SET v_reg_code = p_reg_code;
    SET v_reg_addr = p_reg_addr;
    SET v_found_date = p_found_date;
    SET v_reg_date = p_reg_date;
    SET v_conta_addr = p_conta_addr;
    SET v_conta_name = p_conta_name;
    SET v_phone_number = p_phone_number;
    SET v_email = p_email;
    SET v_pd_qty_max = p_pd_qty_max;
    SET v_max_acco_count = p_max_acco_count;
    SET v_opor_qty_max = p_opor_qty_max;
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_busi_config_str = p_busi_config_str;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_mul_acco_trd_assign_set = p_mul_acco_trd_assign_set;
    SET v_mul_acco_trd_choice = p_mul_acco_trd_choice;
    SET v_mul_acco_trd_qty_set = p_mul_acco_trd_qty_set;
    SET v_genus_algo_strategy_set = p_genus_algo_strategy_set;
    SET v_base_crncy_type = p_base_crncy_type;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_co_status = "0";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "机构名称", "|", "机构全称", "|", "机构类型", "|", "登记编号", "|", "注册地", "|", "成立日期", "|", "登记日期", "|", "联系地址", "|", "联系人", "|", "电话", "|", "EMAIL", "|", "产品数量上限", "|", "账户数量上限", "|", "操作员数量上限", "|", "允许投资市场", "|", "允许操作证券类型", "|", "业务控制配置串", "|", "指令审批操作员", "|", "市价冻结浮动比例", "|", "多账户交易分配设置", "|", "多账户交易账户选择", "|", "多账户交易数量设置", "|", "金纳算法策略设置", "|", "基础币种", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_co_name, "|", v_co_flname, "|", v_co_type, "|", v_reg_code, "|", v_reg_addr, "|", v_found_date, "|", v_reg_date, "|", v_conta_addr, "|", v_conta_name, "|", v_phone_number, "|", v_email, "|", v_pd_qty_max, "|", v_max_acco_count, "|", v_opor_qty_max, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_busi_config_str, "|", v_comm_appr_oper, "|", v_market_price_ratio, "|", v_mul_acco_trd_assign_set, "|", v_mul_acco_trd_choice, "|", v_mul_acco_trd_qty_set, "|", v_genus_algo_strategy_set, "|", v_base_crncy_type, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @机构状态# = 《机构状态-正常》; */
    set v_co_status = "1";

    /* [插入表记录][公共_基础_机构信息表][字段][字段变量][1][@机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_co_info(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, co_name, 
        co_flname, co_type, reg_code, reg_addr, 
        found_date, reg_date, conta_addr, conta_name, 
        phone_number, email, pd_qty_max, max_acco_count, 
        opor_qty_max, allow_exch, allow_stock_type, busi_config_str, 
        comm_appr_oper, market_price_ratio, mul_acco_trd_assign_set, mul_acco_trd_choice, 
        mul_acco_trd_qty_set, genus_algo_strategy_set, base_crncy_type, co_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_co_name, 
        v_co_flname, v_co_type, v_reg_code, v_reg_addr, 
        v_found_date, v_reg_date, v_conta_addr, v_conta_name, 
        v_phone_number, v_email, v_pd_qty_max, v_max_acco_count, 
        v_opor_qty_max, v_allow_exch, v_allow_stock_type, v_busi_config_str, 
        v_comm_appr_oper, v_market_price_ratio, v_mul_acco_trd_assign_set, v_mul_acco_trd_choice, 
        v_mul_acco_trd_qty_set, v_genus_algo_strategy_set, v_base_crncy_type, v_co_status);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.11.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_co_name, "|", v_co_flname, "|", v_co_type, "|", v_reg_code, "|", v_reg_addr, "|", v_found_date, "|", v_reg_date, "|", v_conta_addr, "|", v_conta_name, "|", v_phone_number, "|", v_email, "|", v_pd_qty_max, "|", v_max_acco_count, "|", v_opor_qty_max, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_busi_config_str, "|", v_comm_appr_oper, "|", v_market_price_ratio, "|", v_mul_acco_trd_assign_set, "|", v_mul_acco_trd_choice, "|", v_mul_acco_trd_qty_set, "|", v_genus_algo_strategy_set, "|", v_base_crncy_type, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_机构信息流水表][字段][字段变量][5][@机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_co_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.11.5";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_修改机构信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_ModiCoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_ModiCoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_co_name varchar(64),
    IN p_co_flname varchar(255),
    IN p_conta_addr varchar(255),
    IN p_reg_code varchar(16),
    IN p_reg_addr varchar(32),
    IN p_found_date int,
    IN p_reg_date int,
    IN p_conta_name varchar(64),
    IN p_phone_number varchar(16),
    IN p_email varchar(255),
    IN p_pd_qty_max int,
    IN p_max_acco_count int,
    IN p_opor_qty_max int,
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
    IN p_comm_appr_oper int,
    IN p_market_price_ratio decimal(18,12),
    IN p_mul_acco_trd_assign_set varchar(64),
    IN p_mul_acco_trd_choice int,
    IN p_mul_acco_trd_qty_set varchar(64),
    IN p_genus_algo_strategy_set varchar(64),
    IN p_base_crncy_type varchar(3),
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
    declare v_co_name varchar(64);
    declare v_co_flname varchar(255);
    declare v_conta_addr varchar(255);
    declare v_reg_code varchar(16);
    declare v_reg_addr varchar(32);
    declare v_found_date int;
    declare v_reg_date int;
    declare v_conta_name varchar(64);
    declare v_phone_number varchar(16);
    declare v_email varchar(255);
    declare v_pd_qty_max int;
    declare v_max_acco_count int;
    declare v_opor_qty_max int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_comm_appr_oper int;
    declare v_market_price_ratio decimal(18,12);
    declare v_mul_acco_trd_assign_set varchar(64);
    declare v_mul_acco_trd_choice int;
    declare v_mul_acco_trd_qty_set varchar(64);
    declare v_genus_algo_strategy_set varchar(64);
    declare v_base_crncy_type varchar(3);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_co_name = p_co_name;
    SET v_co_flname = p_co_flname;
    SET v_conta_addr = p_conta_addr;
    SET v_reg_code = p_reg_code;
    SET v_reg_addr = p_reg_addr;
    SET v_found_date = p_found_date;
    SET v_reg_date = p_reg_date;
    SET v_conta_name = p_conta_name;
    SET v_phone_number = p_phone_number;
    SET v_email = p_email;
    SET v_pd_qty_max = p_pd_qty_max;
    SET v_max_acco_count = p_max_acco_count;
    SET v_opor_qty_max = p_opor_qty_max;
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_mul_acco_trd_assign_set = p_mul_acco_trd_assign_set;
    SET v_mul_acco_trd_choice = p_mul_acco_trd_choice;
    SET v_mul_acco_trd_qty_set = p_mul_acco_trd_qty_set;
    SET v_genus_algo_strategy_set = p_genus_algo_strategy_set;
    SET v_base_crncy_type = p_base_crncy_type;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "机构名称", "|", "机构全称", "|", "联系地址", "|", "登记编号", "|", "注册地", "|", "成立日期", "|", "登记日期", "|", "联系人", "|", "电话", "|", "EMAIL", "|", "产品数量上限", "|", "账户数量上限", "|", "操作员数量上限", "|", "允许投资市场", "|", "允许操作证券类型", "|", "指令审批操作员", "|", "市价冻结浮动比例", "|", "多账户交易分配设置", "|", "多账户交易账户选择", "|", "多账户交易数量设置", "|", "金纳算法策略设置", "|", "基础币种", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_co_name, "|", v_co_flname, "|", v_conta_addr, "|", v_reg_code, "|", v_reg_addr, "|", v_found_date, "|", v_reg_date, "|", v_conta_name, "|", v_phone_number, "|", v_email, "|", v_pd_qty_max, "|", v_max_acco_count, "|", v_opor_qty_max, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_comm_appr_oper, "|", v_market_price_ratio, "|", v_mul_acco_trd_assign_set, "|", v_mul_acco_trd_choice, "|", v_mul_acco_trd_qty_set, "|", v_genus_algo_strategy_set, "|", v_base_crncy_type, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_基础_机构信息表][{机构名称}=@机构名称#,{机构全称}=@机构全称#,{联系地址}=@联系地址#,{登记编号}=@登记编号#,{注册地}=@注册地#,{成立日期}=@成立日期#,{登记日期}=@登记日期#,{联系人}=@联系人#,{电话}=@电话#,{EMAIL}=@EMAIL#,{产品数量上限}=@产品数量上限#,{账户数量上限}=@账户数量上限#,{操作员数量上限}=@操作员数量上限#,{允许投资市场}=@允许投资市场#,{允许操作证券类型}=@允许操作证券类型#, {指令审批操作员}=@指令审批操作员#,{市价冻结浮动比例}=@市价冻结浮动比例#,{多账户交易分配设置}=@多账户交易分配设置#,{多账户交易账户选择}=@多账户交易账户选择#,{基础币种}=@基础币种#,{多账户交易数量设置}=@多账户交易数量设置#,{金纳算法策略设置}=@金纳算法策略设置#][{机构编号}=@机构编号#][2][@机构编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_co_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, co_name=v_co_name,co_flname=v_co_flname,conta_addr=v_conta_addr,reg_code=v_reg_code,reg_addr=v_reg_addr,found_date=v_found_date,reg_date=v_reg_date,conta_name=v_conta_name,phone_number=v_phone_number,email=v_email,pd_qty_max=v_pd_qty_max,max_acco_count=v_max_acco_count,opor_qty_max=v_opor_qty_max,allow_exch=v_allow_exch,allow_stock_type=v_allow_stock_type, comm_appr_oper=v_comm_appr_oper,market_price_ratio=v_market_price_ratio,mul_acco_trd_assign_set=v_mul_acco_trd_assign_set,mul_acco_trd_choice=v_mul_acco_trd_choice,base_crncy_type=v_base_crncy_type,mul_acco_trd_qty_set=v_mul_acco_trd_qty_set,genus_algo_strategy_set=v_genus_algo_strategy_set where co_no=v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.12.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_基础_机构信息表][{记录序号}][@记录序号#][{机构编号}=@机构编号#][4][@机构编号#] */
    select row_id into v_row_id from db_pub.tb_base_co_info where co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.12.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_co_name, "|", v_co_flname, "|", v_conta_addr, "|", v_reg_code, "|", v_reg_addr, "|", v_found_date, "|", v_reg_date, "|", v_conta_name, "|", v_phone_number, "|", v_email, "|", v_pd_qty_max, "|", v_max_acco_count, "|", v_opor_qty_max, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_comm_appr_oper, "|", v_market_price_ratio, "|", v_mul_acco_trd_assign_set, "|", v_mul_acco_trd_choice, "|", v_mul_acco_trd_qty_set, "|", v_genus_algo_strategy_set, "|", v_base_crncy_type, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_机构信息流水表][字段][字段变量][5][@机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_co_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.12.5";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_更新机构状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_FrozenCoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_FrozenCoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_co_status varchar(2),
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
    declare v_co_status varchar(2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_co_status = p_co_status;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][{机构状态}][@机构状态#] */
    set v_jour_occur_field = concat("机构状态","|");
    set v_jour_occur_info = concat(v_co_status,"|");


    /* [更新表记录][公共_基础_机构信息表][{机构状态}=@机构状态#][{机构编号}=@机构编号#][2][@机构编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_co_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, co_status=v_co_status where co_no=v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.14.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_基础_机构信息表][{机构编号}, {机构状态}][@机构编号#, @机构状态#][{机构编号}=@机构编号#][4][@机构编号#] */
    select co_no, co_status into v_co_no, v_co_status from db_pub.tb_base_co_info where co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.14.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@机构状态#] */
    set v_jour_after_occur_info = concat(v_co_status,"|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_机构信息流水表][字段][字段变量][5][@机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_co_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.14.5";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_获取机构类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_GetCoType;;
DELIMITER ;;
CREATE PROCEDURE pra_base_GetCoType(
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
    declare v_co_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_co_type = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_机构信息表][{机构类型}][@机构类型#][{机构编号}=@机构编号#][4][@机构编号#] */
    select co_type into v_co_type from db_pub.tb_base_co_info where co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.17.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_type = v_co_type;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询机构信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QueryCoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QueryCoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_co_status varchar(2),
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
    declare v_co_status varchar(2);
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
    SET v_co_status = p_co_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_基础_机构信息表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@机构状态# = " " or {机构状态}=@机构状态#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        co_name, co_flname, co_type, reg_code, 
        reg_addr, found_date, reg_date, conta_addr, 
        conta_name, phone_number, email, pd_qty_max, 
        max_acco_count, opor_qty_max, allow_exch, allow_stock_type, 
        busi_config_str, comm_appr_oper, market_price_ratio, mul_acco_trd_assign_set, 
        mul_acco_trd_choice, mul_acco_trd_qty_set, genus_algo_strategy_set, base_crncy_type, 
        co_status from db_pub.tb_base_co_info where (v_co_no=0 or co_no=v_co_no) and (v_co_status = " " or co_status=v_co_status) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        co_name, co_flname, co_type, reg_code, 
        reg_addr, found_date, reg_date, conta_addr, 
        conta_name, phone_number, email, pd_qty_max, 
        max_acco_count, opor_qty_max, allow_exch, allow_stock_type, 
        busi_config_str, comm_appr_oper, market_price_ratio, mul_acco_trd_assign_set, 
        mul_acco_trd_choice, mul_acco_trd_qty_set, genus_algo_strategy_set, base_crncy_type, 
        co_status from db_pub.tb_base_co_info where (v_co_no=0 or co_no=v_co_no) and (v_co_status = " " or co_status=v_co_status) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询机构信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QueryCoInfoJour;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QueryCoInfoJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    declare v_init_date int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_基础_机构信息流水表][字段][{初始化日期} <= @初始化日期# and {机构编号}=@机构编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_base_co_info_jour where init_date <= v_init_date and co_no=v_co_no and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_base_co_info_jour where init_date <= v_init_date and co_no=v_co_no and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询历史机构信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QueryCoInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QueryCoInfoJour_His(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_基础_机构信息流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_base_co_info_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_base_co_info_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_检查机构编号存在
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_CheckCoNoExists;;
DELIMITER ;;
CREATE PROCEDURE pra_base_CheckCoNoExists(
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录数量][公共_基础_机构信息表][@记录个数#][{机构编号} = @机构编号#] */
    select count(1) into v_record_count from db_pub.tb_base_co_info where co_no = v_co_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_获取机构编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_GetOperatorNo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_GetOperatorNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_tmp_co_no = 0;

    
    label_pro:BEGIN
    
    #机构编号从1001开始编号

    /* set @临时_机构编号# = 1001; */
    set v_tmp_co_no = 1001;

    /* [声明游标][公共_基础_机构信息表][{机构编号}][{机构编号} > 0 order by {机构编号}][cursor_coinfo] */
    cursor_coinfo:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_coinfo CURSOR FOR
        select co_no 
        from db_pub.tb_base_co_info 
        where co_no > 0 order by co_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@机构编号#][cursor_coinfo][loop_coinfo] */
    open cursor_coinfo;
    loop_coinfo: LOOP
    fetch cursor_coinfo into v_co_no;
        IF v_cursor_done THEN
            LEAVE loop_coinfo;
        END IF;


        /* if @机构编号# > @临时_机构编号# then */
        if v_co_no > v_tmp_co_no then

            /* [退出循环][loop_coinfo] */
            LEAVE loop_coinfo;


        /* elseif @机构编号# = @临时_机构编号# then */
        elseif v_co_no = v_tmp_co_no then

            /* set @临时_机构编号# = @临时_机构编号# + 1; */
            set v_tmp_co_no = v_tmp_co_no + 1;
        end if;

    /* [关闭游标][cursor_coinfo] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_coinfo;
    end cursor_coinfo;


    /* set @机构编号# = @临时_机构编号#; */
    set v_co_no = v_tmp_co_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_修改机构业务范围
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_UpdateCoAllowBusi;;
DELIMITER ;;
CREATE PROCEDURE pra_base_UpdateCoAllowBusi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
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
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "允许投资市场", "|", "允许操作证券类型", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_基础_机构信息表][{允许投资市场}=@允许投资市场#, {允许操作证券类型}=@允许操作证券类型#][{机构编号}=@机构编号#][2][@机构编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_co_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, allow_exch=v_allow_exch, allow_stock_type=v_allow_stock_type where co_no=v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.17.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_基础_机构信息表][{允许投资市场}, {允许操作证券类型}][@允许投资市场#, @允许操作证券类型#][{机构编号}=@机构编号#][4][@机构编号#] */
    select allow_exch, allow_stock_type into v_allow_exch, v_allow_stock_type from db_pub.tb_base_co_info where co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.17.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_机构信息流水表][字段][字段变量][5][@机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_co_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.17.5";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_修改机构业务控制配置串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_UpdateCoBusiConfigStr;;
DELIMITER ;;
CREATE PROCEDURE pra_base_UpdateCoBusiConfigStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_config_index int,
    IN p_config_value varchar(2048),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_busi_config_str varchar(64),
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
    declare v_config_index int;
    declare v_config_value varchar(2048);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_config_str varchar(64);
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;

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
    SET v_config_index = p_config_index;
    SET v_config_value = p_config_value;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_config_str = " ";
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取流水变动][{配置位},{配置值},{业务控制配置串}][@配置位#,@配置值#,@业务控制配置串#] */
    set v_jour_occur_field = concat("配置位","|","配置值","|","业务控制配置串","|");
    set v_jour_occur_info = concat(v_config_index,"|",v_config_value,"|",v_busi_config_str,"|");


    /* [锁定获取表记录变量][公共_基础_机构信息表][{业务控制配置串}][@业务控制配置串#][{机构编号}=@机构编号#][4][@机构编号#] */
    select busi_config_str into v_busi_config_str from db_pub.tb_base_co_info where co_no=v_co_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.23.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* set @业务控制配置串# = concat(left(@业务控制配置串#, @配置位#-1), left(@配置值#,1), right(@业务控制配置串#,LENGTH(@业务控制配置串#)-@配置位#)); */
    set v_busi_config_str = concat(left(v_busi_config_str, v_config_index-1), left(v_config_value,1), right(v_busi_config_str,LENGTH(v_busi_config_str)-v_config_index));

    /* [更新表记录][公共_基础_机构信息表][{业务控制配置串}=@业务控制配置串#][{机构编号}=@机构编号#][2][@机构编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_co_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, busi_config_str=v_busi_config_str where co_no=v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.23.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@配置位#,@配置值#,@业务控制配置串#] */
    set v_jour_after_occur_info = concat(v_config_index,"|",v_config_value,"|",v_busi_config_str,"|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_机构信息流水表][字段][字段变量][5][@机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_co_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.23.5";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取表记录变量语句][公共_基础_机构信息表][{业务控制配置串},{更新次数}][@业务控制配置串#,@更新次数#][{机构编号}=@机构编号#] */
    select busi_config_str,update_times into v_busi_config_str,v_update_times from db_pub.tb_base_co_info where co_no=v_co_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_config_str = v_busi_config_str;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询机构列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QueryCoInfoList;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QueryCoInfoList(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_基础_机构信息表][{记录序号},{机构编号},{机构名称},{机构类型},{机构状态}][{记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,co_no,co_name,co_type,co_status from db_pub.tb_base_co_info where row_id > v_row_id order by row_id;
    else
        select row_id,co_no,co_name,co_type,co_status from db_pub.tb_base_co_info where row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_设置系统配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_SetSysConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_base_SetSysConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_config_no bigint,
    IN p_config_value varchar(2048),
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
    declare v_config_no bigint;
    declare v_config_value varchar(2048);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_config_name varchar(64);
    declare v_config_choice_type int;
    declare v_dict_field_name varchar(32);
    declare v_config_memo varchar(255);
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_config_no = p_config_no;
    SET v_config_value = p_config_value;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_config_name = " ";
    SET v_config_choice_type = 0;
    SET v_dict_field_name = " ";
    SET v_config_memo = " ";
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "配置编号", "|", "配置值", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_config_no, "|", v_config_value, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_基础_系统配置表][{配置值}=@配置值#][{机构编号}=@机构编号# and {配置编号}=@配置编号#][2][@机构编号#,@配置编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_sys_config set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, config_value=v_config_value where co_no=v_co_no and config_no=v_config_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.31.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","配置编号=",v_config_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","配置编号=",v_config_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_基础_系统配置表][{配置名称},{配置选择模式},{字典字段名},{配置说明}][@配置名称#,@配置选择模式#,@字典字段名#,@配置说明#][{机构编号}=@机构编号# and {配置编号}=@配置编号#][4][@机构编号#,@配置编号#] */
    select config_name,config_choice_type,dict_field_name,config_memo into v_config_name,v_config_choice_type,v_dict_field_name,v_config_memo from db_pub.tb_base_sys_config where co_no=v_co_no and config_no=v_config_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.31.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","配置编号=",v_config_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","配置编号=",v_config_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_config_no, "|", v_config_value, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_系统配置流水表][字段][字段变量][5][@机构编号#,@配置编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_sys_config_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        config_no, config_name, config_choice_type, config_value, 
        dict_field_name, config_memo, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_config_no, v_config_name, v_config_choice_type, v_config_value, 
        v_dict_field_name, v_config_memo, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.31.5";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","配置编号=",v_config_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询系统配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QuerySysConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QuerySysConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_config_no_str varchar(2048),
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
    declare v_config_no_str varchar(2048);
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
    SET v_config_no_str = p_config_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_基础_系统配置表][字段][{机构编号}=@机构编号# and (@配置编号串# = "; ;" or instr(@配置编号串#, concat(";", {配置编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        config_no, config_name, config_choice_type, config_value, 
        dict_field_name, config_memo from db_pub.tb_base_sys_config where co_no=v_co_no and (v_config_no_str = "; ;" or instr(v_config_no_str, concat(";", config_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        config_no, config_name, config_choice_type, config_value, 
        dict_field_name, config_memo from db_pub.tb_base_sys_config where co_no=v_co_no and (v_config_no_str = "; ;" or instr(v_config_no_str, concat(";", config_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询系统配置流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QuerySysConfigJour;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QuerySysConfigJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_config_no_str varchar(2048),
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
    declare v_config_no_str varchar(2048);
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
    SET v_config_no_str = p_config_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_基础_系统配置流水表][字段][{初始化日期} <= @初始化日期# and {机构编号}=@机构编号# and (@配置编号串# = "; ;" or instr(@配置编号串#, concat(";", {配置编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, config_no, config_name, config_choice_type, 
        config_value, dict_field_name, config_memo, oper_remark_info from db_pub.tb_base_sys_config_jour where init_date <= v_init_date and co_no=v_co_no and (v_config_no_str = "; ;" or instr(v_config_no_str, concat(";", config_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, config_no, config_name, config_choice_type, 
        config_value, dict_field_name, config_memo, oper_remark_info from db_pub.tb_base_sys_config_jour where init_date <= v_init_date and co_no=v_co_no and (v_config_no_str = "; ;" or instr(v_config_no_str, concat(";", config_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询历史系统配置流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QuerySysConfigJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QuerySysConfigJour_His(
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
    IN p_config_no_str varchar(2048),
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
    declare v_config_no_str varchar(2048);
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
    SET v_config_no_str = p_config_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_基础_系统配置流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@配置编号串# = "; ;" or instr(@配置编号串#, concat(";", {配置编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, config_no, config_name, config_choice_type, 
        config_value, dict_field_name, config_memo, oper_remark_info from db_pub_his.tb_base_sys_config_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_config_no_str = "; ;" or instr(v_config_no_str, concat(";", config_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, config_no, config_name, config_choice_type, 
        config_value, dict_field_name, config_memo, oper_remark_info from db_pub_his.tb_base_sys_config_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_config_no_str = "; ;" or instr(v_config_no_str, concat(";", config_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_新增机构汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_AddCoExchRate;;
DELIMITER ;;
CREATE PROCEDURE pra_base_AddCoExchRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_for_crncy_type varchar(3),
    IN p_crncy_type varchar(3),
    IN p_buy_exch_rate decimal(18,12),
    IN p_sale_exch_rate decimal(18,12),
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
    declare v_for_crncy_type varchar(3);
    declare v_crncy_type varchar(3);
    declare v_buy_exch_rate decimal(18,12);
    declare v_sale_exch_rate decimal(18,12);
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
    SET v_co_no = p_co_no;
    SET v_for_crncy_type = p_for_crncy_type;
    SET v_crncy_type = p_crncy_type;
    SET v_buy_exch_rate = p_buy_exch_rate;
    SET v_sale_exch_rate = p_sale_exch_rate;
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
    

    /* [插入表记录][公共_基础_机构汇率表][字段][字段变量][1][@机构编号#,@外币币种#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_co_exch_rate(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, for_crncy_type, 
        crncy_type, buy_exch_rate, sale_exch_rate) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_for_crncy_type, 
        v_crncy_type, v_buy_exch_rate, v_sale_exch_rate);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.35.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","外币币种=",v_for_crncy_type,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_机构汇率流水表][字段][字段变量][5][@机构编号#,@外币币种#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_co_exch_rate_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        for_crncy_type, crncy_type, buy_exch_rate, sale_exch_rate, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_for_crncy_type, v_crncy_type, v_buy_exch_rate, v_sale_exch_rate, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.35.5";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","外币币种=",v_for_crncy_type,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_修改机构汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_ModiCoExchRate;;
DELIMITER ;;
CREATE PROCEDURE pra_base_ModiCoExchRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_for_crncy_type varchar(3),
    IN p_crncy_type varchar(3),
    IN p_buy_exch_rate decimal(18,12),
    IN p_sale_exch_rate decimal(18,12),
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
    declare v_for_crncy_type varchar(3);
    declare v_crncy_type varchar(3);
    declare v_buy_exch_rate decimal(18,12);
    declare v_sale_exch_rate decimal(18,12);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_for_crncy_type = p_for_crncy_type;
    SET v_crncy_type = p_crncy_type;
    SET v_buy_exch_rate = p_buy_exch_rate;
    SET v_sale_exch_rate = p_sale_exch_rate;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_基础_机构汇率表][{购汇汇率}=@购汇汇率#,{售汇汇率}=@售汇汇率#][{机构编号}=@机构编号# and {外币币种}=@外币币种# and {本币币种}=@本币币种#][2][@机构编号#,@外币币种#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_co_exch_rate set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, buy_exch_rate=v_buy_exch_rate,sale_exch_rate=v_sale_exch_rate where co_no=v_co_no and for_crncy_type=v_for_crncy_type and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.36.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","外币币种=",v_for_crncy_type,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","外币币种=",v_for_crncy_type,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_基础_机构汇率表][{记录序号}][@记录序号#][{机构编号}=@机构编号# and {外币币种}=@外币币种# and {本币币种}=@本币币种#][4][@机构编号#,@外币币种#,@本币币种#] */
    select row_id into v_row_id from db_pub.tb_base_co_exch_rate where co_no=v_co_no and for_crncy_type=v_for_crncy_type and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.36.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","外币币种=",v_for_crncy_type,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","外币币种=",v_for_crncy_type,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_机构汇率流水表][字段][字段变量][5][@机构编号#,@外币币种#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_co_exch_rate_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        for_crncy_type, crncy_type, buy_exch_rate, sale_exch_rate, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_for_crncy_type, v_crncy_type, v_buy_exch_rate, v_sale_exch_rate, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.36.5";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","外币币种=",v_for_crncy_type,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_删除机构汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_DeleteCoExchRate;;
DELIMITER ;;
CREATE PROCEDURE pra_base_DeleteCoExchRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_for_crncy_type varchar(3),
    IN p_crncy_type varchar(3),
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
    declare v_for_crncy_type varchar(3);
    declare v_crncy_type varchar(3);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_buy_exch_rate decimal(18,12);
    declare v_sale_exch_rate decimal(18,12);
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
    SET v_co_no = p_co_no;
    SET v_for_crncy_type = p_for_crncy_type;
    SET v_crncy_type = p_crncy_type;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_buy_exch_rate = 0;
    SET v_sale_exch_rate = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_机构汇率表][{记录序号}][@记录序号#][{机构编号}=@机构编号# and {外币币种}=@外币币种# and {本币币种}=@本币币种#][4][@机构编号#,@外币币种#,@本币币种#] */
    select row_id into v_row_id from db_pub.tb_base_co_exch_rate where co_no=v_co_no and for_crncy_type=v_for_crncy_type and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.37.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","外币币种=",v_for_crncy_type,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","外币币种=",v_for_crncy_type,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_基础_机构汇率表][{机构编号}=@机构编号# and {外币币种}=@外币币种# and {本币币种}=@本币币种#][3][@机构编号#,@外币币种#,@本币币种#] */
    delete from db_pub.tb_base_co_exch_rate 
        where co_no=v_co_no and for_crncy_type=v_for_crncy_type and crncy_type=v_crncy_type;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.3.37.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","外币币种=",v_for_crncy_type,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","外币币种=",v_for_crncy_type,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @购汇汇率# = 0; */
    set v_buy_exch_rate = 0;

    /* set @售汇汇率# = 0; */
    set v_sale_exch_rate = 0;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_机构汇率流水表][字段][字段变量][5][@机构编号#,@外币币种#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_co_exch_rate_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        for_crncy_type, crncy_type, buy_exch_rate, sale_exch_rate, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_for_crncy_type, v_crncy_type, v_buy_exch_rate, v_sale_exch_rate, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.37.5";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","外币币种=",v_for_crncy_type,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询机构汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QueryCoExchRate;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QueryCoExchRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_co_no = p_co_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_基础_机构汇率表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        for_crncy_type, crncy_type, buy_exch_rate, sale_exch_rate from db_pub.tb_base_co_exch_rate where (v_co_no = 0 or co_no=v_co_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        for_crncy_type, crncy_type, buy_exch_rate, sale_exch_rate from db_pub.tb_base_co_exch_rate where (v_co_no = 0 or co_no=v_co_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询机构汇率流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QueryCoExchRateJour;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QueryCoExchRateJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    declare v_init_date int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_基础_机构汇率流水表][字段][{初始化日期} <= @初始化日期# and {机构编号}=@机构编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, for_crncy_type, crncy_type, buy_exch_rate, 
        sale_exch_rate, oper_remark_info from db_pub.tb_base_co_exch_rate_jour where init_date <= v_init_date and co_no=v_co_no and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, for_crncy_type, crncy_type, buy_exch_rate, 
        sale_exch_rate, oper_remark_info from db_pub.tb_base_co_exch_rate_jour where init_date <= v_init_date and co_no=v_co_no and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询历史机构汇率流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QueryCoExchRateJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QueryCoExchRateJour_His(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_基础_机构汇率流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, for_crncy_type, crncy_type, buy_exch_rate, 
        sale_exch_rate, oper_remark_info from db_pub_his.tb_base_co_exch_rate_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, for_crncy_type, crncy_type, buy_exch_rate, 
        sale_exch_rate, oper_remark_info from db_pub_his.tb_base_co_exch_rate_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询港股通汇率信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QueryHKRateInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QueryHKRateInfo(
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
    declare v_init_date int;
    declare v_row_count int;

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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_市场信息表][{初始化日期}][@初始化日期#][{市场编号}=3][4]["沪港通交易所不能获取初始化日期 !"] */
    select init_date into v_init_date from db_pub.tb_base_exch_info where exch_no=3 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.41.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("沪港通交易所不能获取初始化日期 !","#",v_mysql_message);
        else
            SET v_error_info = "沪港通交易所不能获取初始化日期 !";
        end if;
        leave label_pro;
    end if;


    /* set @指定行数#=-1; */
    set v_row_count=-1;

    /* [获取表记录][公共_基础_港股通汇率表][字段][{初始化日期}=@初始化日期# and  ({市场编号}=3 or {市场编号}=4)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        exch_no, for_crncy_type, crncy_type, buy_ref_rate, 
        sell_ref_rate, settle_buy_rate, settle_sell_rate, pboc_rate from db_pub.tb_base_hk_exch_rate where init_date=v_init_date and  (exch_no=3 or exch_no=4);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        exch_no, for_crncy_type, crncy_type, buy_ref_rate, 
        sell_ref_rate, settle_buy_rate, settle_sell_rate, pboc_rate from db_pub.tb_base_hk_exch_rate where init_date=v_init_date and  (exch_no=3 or exch_no=4) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_新增港股通汇率信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_AddHKRateInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_AddHKRateInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sh_hk_buy_ref_rate decimal(18,12),
    IN p_sh_hk_sell_ref_rate decimal(18,12),
    IN p_sz_hk_buy_ref_rate decimal(18,12),
    IN p_sz_hk_sell_ref_rate decimal(18,12),
    IN p_pboc_rate decimal(18,12),
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
    declare v_sh_hk_buy_ref_rate decimal(18,12);
    declare v_sh_hk_sell_ref_rate decimal(18,12);
    declare v_sz_hk_buy_ref_rate decimal(18,12);
    declare v_sz_hk_sell_ref_rate decimal(18,12);
    declare v_pboc_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_for_crncy_type varchar(3);
    declare v_crncy_type varchar(3);
    declare v_settle_buy_rate decimal(18,12);
    declare v_settle_sell_rate decimal(18,12);
    declare v_exch_no int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
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
    SET v_sh_hk_buy_ref_rate = p_sh_hk_buy_ref_rate;
    SET v_sh_hk_sell_ref_rate = p_sh_hk_sell_ref_rate;
    SET v_sz_hk_buy_ref_rate = p_sz_hk_buy_ref_rate;
    SET v_sz_hk_sell_ref_rate = p_sz_hk_sell_ref_rate;
    SET v_pboc_rate = p_pboc_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_for_crncy_type = "CNY";
    SET v_crncy_type = "CNY";
    SET v_settle_buy_rate = 0;
    SET v_settle_sell_rate = 0;
    SET v_exch_no = 0;
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_市场信息表][{初始化日期}][@初始化日期#][{市场编号}=3][4]["沪港通交易所不能获取初始化日期 !"] */
    select init_date into v_init_date from db_pub.tb_base_exch_info where exch_no=3 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.42.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("沪港通交易所不能获取初始化日期 !","#",v_mysql_message);
        else
            SET v_error_info = "沪港通交易所不能获取初始化日期 !";
        end if;
        leave label_pro;
    end if;


    /* set @外币币种#="HKD"; */
    set v_for_crncy_type="HKD";

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* set @买入结算汇率#=0; */
    set v_settle_buy_rate=0;

    /* set @卖出结算汇率#=0; */
    set v_settle_sell_rate=0;

    /* set @市场编号#=3; */
    set v_exch_no=3;

    /* set @买入参考汇率#=@沪港通买入参考汇率#; */
    set v_buy_ref_rate=v_sh_hk_buy_ref_rate;

    /* set @卖出参考汇率#=@沪港通卖出参考汇率#; */
    set v_sell_ref_rate=v_sh_hk_sell_ref_rate;

    /* [插入表记录][公共_基础_港股通汇率表][字段][字段变量][1][@市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_hk_exch_rate(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, exch_no, 
        for_crncy_type, crncy_type, buy_ref_rate, sell_ref_rate, 
        settle_buy_rate, settle_sell_rate, pboc_rate) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_exch_no, 
        v_for_crncy_type, v_crncy_type, v_buy_ref_rate, v_sell_ref_rate, 
        v_settle_buy_rate, v_settle_sell_rate, v_pboc_rate);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.42.1";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @市场编号#=4; */
    set v_exch_no=4;

    /* set @买入参考汇率#=@深港通买入参考汇率#; */
    set v_buy_ref_rate=v_sz_hk_buy_ref_rate;

    /* set @卖出参考汇率#=@深港通卖出参考汇率#; */
    set v_sell_ref_rate=v_sz_hk_sell_ref_rate;

    /* [插入表记录][公共_基础_港股通汇率表][字段][字段变量][1][@市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_hk_exch_rate(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, exch_no, 
        for_crncy_type, crncy_type, buy_ref_rate, sell_ref_rate, 
        settle_buy_rate, settle_sell_rate, pboc_rate) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_exch_no, 
        v_for_crncy_type, v_crncy_type, v_buy_ref_rate, v_sell_ref_rate, 
        v_settle_buy_rate, v_settle_sell_rate, v_pboc_rate);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.42.1";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_删除港股通汇率信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_DeleteHKRateInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_DeleteHKRateInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_init_date int,
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
    declare v_row_id bigint;
    declare v_init_date int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_init_date int;
    declare v_exch_no int;
    declare v_for_crncy_type varchar(3);
    declare v_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_settle_buy_rate decimal(18,12);
    declare v_settle_sell_rate decimal(18,12);
    declare v_pboc_rate decimal(18,12);
    declare v_table_row_id bigint;
    declare v_table_field_value varchar(10000);
    declare v_table_uni_index_value varchar(10000);
    declare v_table_name varchar(64);
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
    SET v_row_id = p_row_id;
    SET v_init_date = p_init_date;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_init_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_no = 0;
    SET v_for_crncy_type = "CNY";
    SET v_crncy_type = "CNY";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_settle_buy_rate = 0;
    SET v_settle_sell_rate = 0;
    SET v_pboc_rate = 0;
    SET v_table_row_id = 0;
    SET v_table_field_value = " ";
    SET v_table_uni_index_value = " ";
    SET v_table_name = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_港股通汇率表][{初始化日期},{市场编号},{外币币种},{本币币种},{买入参考汇率},{卖出参考汇率},{买入结算汇率},{卖出结算汇率},{中国人行汇率}][@临时_初始化日期#,@市场编号#,@外币币种#,@本币币种#,@买入参考汇率#,@卖出参考汇率#,@买入结算汇率#,@卖出结算汇率#,@中国人行汇率#][{记录序号}=@记录序号#][4][@记录序号#] */
    select init_date,exch_no,for_crncy_type,crncy_type,buy_ref_rate,sell_ref_rate,settle_buy_rate,settle_sell_rate,pboc_rate into v_tmp_init_date,v_exch_no,v_for_crncy_type,v_crncy_type,v_buy_ref_rate,v_sell_ref_rate,v_settle_buy_rate,v_settle_sell_rate,v_pboc_rate from db_pub.tb_base_hk_exch_rate where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.43.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    #删除流水记录

    /* set @表记录序号# = @记录序号#; */
    set v_table_row_id = v_row_id;

    /* set @表字段值# =  concat("|初始化日期:",@临时_初始化日期#,"|市场编号:",@市场编号#,"|外币币种:",@外币币种#,"|本币币种:",@本币币种#,"|买入参考汇率:",@买入参考汇率#,"|卖出参考汇率:",@卖出参考汇率#,"|买入结算汇率:",@买入结算汇率#,"|卖出结算汇率:",@卖出结算汇率#,"|中国人行汇率:",@中国人行汇率#); */
    set v_table_field_value =  concat("|初始化日期:",v_tmp_init_date,"|市场编号:",v_exch_no,"|外币币种:",v_for_crncy_type,"|本币币种:",v_crncy_type,"|买入参考汇率:",v_buy_ref_rate,"|卖出参考汇率:",v_sell_ref_rate,"|买入结算汇率:",v_settle_buy_rate,"|卖出结算汇率:",v_settle_sell_rate,"|中国人行汇率:",v_pboc_rate);

    /* set @表唯一索引值# = concat("|初始化日期:",@临时_初始化日期#,"|市场编号:",@市场编号#); */
    set v_table_uni_index_value = concat("|初始化日期:",v_tmp_init_date,"|市场编号:",v_exch_no);

    /* set @数据表名称# = "tb_base_hk_exch_rate"; */
    set v_table_name = "tb_base_hk_exch_rate";

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_公共库删除流水表][字段][字段变量][5][@数据表名称#, @表记录序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_pub_delete_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, table_name, 
        table_row_id, table_field_value, table_uni_index_value) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_table_name, 
        v_table_row_id, v_table_field_value, v_table_uni_index_value);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.43.5";
        SET v_error_info =  CONCAT(concat("数据表名称=",v_table_name,","," 表记录序号=", v_table_row_id),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [删除表记录][公共_基础_港股通汇率表][{记录序号}=@记录序号#][3][@记录序号#] */
    delete from db_pub.tb_base_hk_exch_rate 
        where row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.3.43.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询市场信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QueryExchInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QueryExchInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
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
    declare v_exch_no int;
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
    SET v_exch_no = p_exch_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_基础_市场信息表][字段][(@市场编号#=0 or {市场编号}=@市场编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        exch_name, exch_code, exch_type, distric, 
        crncy_type, exch_crncy_type, exch_status, init_date, 
        time_lag, no_exch_date_str, allow_next_init_time, no_settle_date_str, 
        remark_info from db_pub.tb_base_exch_info where (v_exch_no=0 or exch_no=v_exch_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        exch_name, exch_code, exch_type, distric, 
        crncy_type, exch_crncy_type, exch_status, init_date, 
        time_lag, no_exch_date_str, allow_next_init_time, no_settle_date_str, 
        remark_info from db_pub.tb_base_exch_info where (v_exch_no=0 or exch_no=v_exch_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询市场信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QueryExchInfoJour;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QueryExchInfoJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
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
    declare v_exch_no int;
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
    SET v_exch_no = p_exch_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_基础_市场信息流水表][字段][{初始化日期} <= @初始化日期#  and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_base_exch_info_jour where init_date <= v_init_date  and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_base_exch_info_jour where init_date <= v_init_date  and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    #[获取表记录][公共_基础_市场信息流水表][字段][{初始化日期} <= @初始化日期# and {市场编号}=@市场编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询历史市场信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QueryExchInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QueryExchInfoJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_exch_no int,
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
    declare v_exch_no int;
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
    SET v_exch_no = p_exch_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_基础_市场信息流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {市场编号}=@市场编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_base_exch_info_jour_his where (init_date between v_begin_date and v_end_date) and exch_no=v_exch_no and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_base_exch_info_jour_his where (init_date between v_begin_date and v_end_date) and exch_no=v_exch_no and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_设置市场非交易日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_SetExchNoExchDate;;
DELIMITER ;;
CREATE PROCEDURE pra_base_SetExchNoExchDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_no_exch_date_str varchar(2048),
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
    declare v_exch_no int;
    declare v_no_exch_date_str varchar(2048);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_exch_no = p_exch_no;
    SET v_no_exch_date_str = p_no_exch_date_str;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][{非交易日期串}][@非交易日期串#] */
    set v_jour_occur_field = concat("非交易日期串","|");
    set v_jour_occur_info = concat(v_no_exch_date_str,"|");


    /* [更新表记录][公共_基础_市场信息表][{非交易日期串}=@非交易日期串#][{市场编号}=@市场编号#][2][@非交易日期串#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_exch_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, no_exch_date_str=v_no_exch_date_str where exch_no=v_exch_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.107.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("非交易日期串=",v_no_exch_date_str),"#",v_mysql_message);
        else
            SET v_error_info = concat("非交易日期串=",v_no_exch_date_str);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_基础_市场信息表][{非交易日期串}][@非交易日期串#][{市场编号}=@市场编号#][4][@市场编号#,@非交易日期串#] */
    select no_exch_date_str into v_no_exch_date_str from db_pub.tb_base_exch_info where exch_no=v_exch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.107.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","非交易日期串=",v_no_exch_date_str),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","非交易日期串=",v_no_exch_date_str);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@非交易日期串#] */
    set v_jour_after_occur_info = concat(v_no_exch_date_str,"|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_市场信息流水表][字段][字段变量][5][@市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_exch_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.107.5";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_设置港股通非交收日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_SetHKExchNoSettleDate;;
DELIMITER ;;
CREATE PROCEDURE pra_base_SetHKExchNoSettleDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_settle_date int,
    IN p_set_type int,
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
    declare v_exch_no int;
    declare v_settle_date int;
    declare v_set_type int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_no_settle_date_str varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
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
    SET v_exch_no = p_exch_no;
    SET v_settle_date = p_settle_date;
    SET v_set_type = p_set_type;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_no_settle_date_str = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [检查报错返回][@初始化日期#<>@交收日期#][23][@初始化日期#,@交收日期#] */
    if v_init_date<>v_settle_date then
        
        SET v_error_code = "pubA.3.108.23";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","交收日期=",v_settle_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","交收日期=",v_settle_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@市场编号#<>《市场编号-沪港通证券交易所》 and @市场编号#<>《市场编号-深港通证券交易所》][26][@市场编号#] */
    if v_exch_no<>3 and v_exch_no<>4 then
        
        SET v_error_code = "pubA.3.108.26";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;
    #增加非交收日期

    /* if @设置方式# = 1 then */
    if v_set_type = 1 then

        /* [获取表记录变量][公共_基础_市场信息表][{非交收日期串}][@非交收日期串#][{市场编号}=@市场编号#][4][@市场编号#] */
        select no_settle_date_str into v_no_settle_date_str from db_pub.tb_base_exch_info where exch_no=v_exch_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.3.108.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][instr(@非交收日期串#,@交收日期#)>0][25][@交收日期#] */
        if instr(v_no_settle_date_str,v_settle_date)>0 then
            
            SET v_error_code = "pubA.3.108.25";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交收日期=",v_settle_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("交收日期=",v_settle_date);
            end if;
            leave label_pro;
        end if;


        /* if @非交收日期串# = "" or @非交收日期串# = " " then */
        if v_no_settle_date_str = "" or v_no_settle_date_str = " " then

            /* set @非交收日期串# = concat(";",@交收日期#,";"); */
            set v_no_settle_date_str = concat(";",v_settle_date,";");
        else

            /* set @非交收日期串# = concat(@非交收日期串#,@交收日期#,";"); */
            set v_no_settle_date_str = concat(v_no_settle_date_str,v_settle_date,";");
        end if;

        /* [更新表记录][公共_基础_市场信息表][{非交收日期串}=@非交收日期串#][{市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》][2][@市场编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pub.tb_base_exch_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, no_settle_date_str=v_no_settle_date_str where exch_no=3 or exch_no=4;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.3.108.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no);
            end if;
            leave label_pro;
        end if;


        /* [插入表记录][公共_基础_港股通交收日设置流水表][字段][字段变量][5][@初始化日期#,@市场编号#,@交收日期#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_base_hk_settle_date_jour(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_menu_no, oper_func_code, init_date, settle_date, 
            set_type, oper_remark_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_menu_no, v_oper_func_code, v_init_date, v_settle_date, 
            v_set_type, v_oper_remark_info);
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.3.108.5";
            SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no,",","交收日期=",v_settle_date),"#",v_mysql_message);
            leave label_pro;
        end if;

    else
        #从不是交收日到是交收日，必须要有从是交收日到非交收日的当天流水记录，不然不能调整

        /* [获取表记录变量][公共_基础_港股通交收日设置流水表][{记录序号}][@记录序号#][{交收日期}=@交收日期# and {设置方式}=1][24][@交收日期#] */
        select row_id into v_row_id from db_pub.tb_base_hk_settle_date_jour where settle_date=v_settle_date and set_type=1 limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.3.108.24";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交收日期=",v_settle_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("交收日期=",v_settle_date);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][公共_基础_市场信息表][{非交收日期串}][@非交收日期串#][{市场编号}=@市场编号#][4][@市场编号#] */
        select no_settle_date_str into v_no_settle_date_str from db_pub.tb_base_exch_info where exch_no=v_exch_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.3.108.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][instr(@非交收日期串#,@交收日期#)=0][27][@交收日期#] */
        if instr(v_no_settle_date_str,v_settle_date)=0 then
            
            SET v_error_code = "pubA.3.108.27";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交收日期=",v_settle_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("交收日期=",v_settle_date);
            end if;
            leave label_pro;
        end if;


        /* set @非交收日期串# = REPLACE(@非交收日期串#,concat(@交收日期#,";"),""); */
        set v_no_settle_date_str = REPLACE(v_no_settle_date_str,concat(v_settle_date,";"),"");

        /* [更新表记录][公共_基础_市场信息表][{非交收日期串}=@非交收日期串#][{市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》][2][@市场编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pub.tb_base_exch_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, no_settle_date_str=v_no_settle_date_str where exch_no=3 or exch_no=4;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.3.108.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no);
            end if;
            leave label_pro;
        end if;


        /* [插入表记录][公共_基础_港股通交收日设置流水表][字段][字段变量][5][@初始化日期#,@市场编号#,@交收日期#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_base_hk_settle_date_jour(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_menu_no, oper_func_code, init_date, settle_date, 
            set_type, oper_remark_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_menu_no, v_oper_func_code, v_init_date, v_settle_date, 
            v_set_type, v_oper_remark_info);
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.3.108.5";
            SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no,",","交收日期=",v_settle_date),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_新增交易时间
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_AddExchTime;;
DELIMITER ;;
CREATE PROCEDURE pra_base_AddExchTime(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_begin_time int,
    IN p_end_time int,
    IN p_allow_wtdraw_flag int,
    IN p_remark_info varchar(255),
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
    declare v_exch_no int;
    declare v_begin_time int;
    declare v_end_time int;
    declare v_allow_wtdraw_flag int;
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
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
    SET v_exch_no = p_exch_no;
    SET v_begin_time = p_begin_time;
    SET v_end_time = p_end_time;
    SET v_allow_wtdraw_flag = p_allow_wtdraw_flag;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录数量][公共_基础_交易时间表][@记录个数#][{开始时间}<=@开始时间# and @开始时间#<={结束时间} and {市场编号}=@市场编号#] */
    select count(1) into v_record_count from db_pub.tb_base_exch_time where begin_time<=v_begin_time and v_begin_time<=end_time and exch_no=v_exch_no;


    /* [检查报错返回][@记录个数# > 0][256][@市场编号#,@开始时间#,@结束时间#] */
    if v_record_count > 0 then
        
        SET v_error_code = "pubA.3.111.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","开始时间=",v_begin_time,",","结束时间=",v_end_time),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","开始时间=",v_begin_time,",","结束时间=",v_end_time);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录数量][公共_基础_交易时间表][@记录个数#][{开始时间}<=@结束时间# and @结束时间#<={结束时间} and {市场编号}=@市场编号#] */
    select count(1) into v_record_count from db_pub.tb_base_exch_time where begin_time<=v_end_time and v_end_time<=end_time and exch_no=v_exch_no;


    /* [检查报错返回][@记录个数# > 0][256][@市场编号#,@开始时间#,@结束时间#] */
    if v_record_count > 0 then
        
        SET v_error_code = "pubA.3.111.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","开始时间=",v_begin_time,",","结束时间=",v_end_time),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","开始时间=",v_begin_time,",","结束时间=",v_end_time);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录数量][公共_基础_交易时间表][@记录个数#][@开始时间#<={开始时间} and {开始时间}<=@结束时间# and {市场编号}=@市场编号#] */
    select count(1) into v_record_count from db_pub.tb_base_exch_time where v_begin_time<=begin_time and begin_time<=v_end_time and exch_no=v_exch_no;


    /* [检查报错返回][@记录个数# > 0][256][@市场编号#,@开始时间#,@结束时间#] */
    if v_record_count > 0 then
        
        SET v_error_code = "pubA.3.111.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","开始时间=",v_begin_time,",","结束时间=",v_end_time),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","开始时间=",v_begin_time,",","结束时间=",v_end_time);
        end if;
        leave label_pro;
    end if;


    /* [插入表记录][公共_基础_交易时间表][字段][字段变量][1][@市场编号#,@开始时间#,@结束时间#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_exch_time(
        create_date, create_time, update_date, 
        update_time, update_times, exch_no, begin_time, 
        end_time, allow_wtdraw_flag, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_exch_no, v_begin_time, 
        v_end_time, v_allow_wtdraw_flag, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.111.1";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","开始时间=",v_begin_time,",","结束时间=",v_end_time),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "新增交易时间"; */
    set v_oper_remark_info = "新增交易时间";

    /* [插入表记录][公共_基础_交易时间流水表][字段][字段变量][5][@市场编号#,@开始时间#,@结束时间#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_exch_time_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, exch_no, 
        begin_time, end_time, allow_wtdraw_flag, remark_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_exch_no, 
        v_begin_time, v_end_time, v_allow_wtdraw_flag, v_remark_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.111.5";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","开始时间=",v_begin_time,",","结束时间=",v_end_time),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_删除交易时间
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_DeleteExchTime;;
DELIMITER ;;
CREATE PROCEDURE pra_base_DeleteExchTime(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_begin_time int,
    IN p_end_time int,
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
    declare v_exch_no int;
    declare v_begin_time int;
    declare v_end_time int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_allow_wtdraw_flag int;
    declare v_remark_info varchar(255);
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
    SET v_exch_no = p_exch_no;
    SET v_begin_time = p_begin_time;
    SET v_end_time = p_end_time;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_allow_wtdraw_flag = 0;
    SET v_remark_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_交易时间表][{允许撤单},{备注信息}][@允许撤单#,@备注信息#][{市场编号}=@市场编号# and {开始时间}=@开始时间# and {结束时间}=@结束时间#][4][@市场编号#,@开始时间#,@结束时间#] */
    select allow_wtdraw_flag,remark_info into v_allow_wtdraw_flag,v_remark_info from db_pub.tb_base_exch_time where exch_no=v_exch_no and begin_time=v_begin_time and end_time=v_end_time limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.113.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","开始时间=",v_begin_time,",","结束时间=",v_end_time),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","开始时间=",v_begin_time,",","结束时间=",v_end_time);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_基础_交易时间表][{市场编号}=@市场编号# and {开始时间}=@开始时间# and {结束时间}=@结束时间#][3][@市场编号#,@开始时间#,@结束时间#] */
    delete from db_pub.tb_base_exch_time 
        where exch_no=v_exch_no and begin_time=v_begin_time and end_time=v_end_time;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.3.113.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","开始时间=",v_begin_time,",","结束时间=",v_end_time),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","开始时间=",v_begin_time,",","结束时间=",v_end_time);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_交易时间流水表][字段][字段变量][5][@市场编号#,@开始时间#,@结束时间#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_exch_time_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, exch_no, 
        begin_time, end_time, allow_wtdraw_flag, remark_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_exch_no, 
        v_begin_time, v_end_time, v_allow_wtdraw_flag, v_remark_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.113.5";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","开始时间=",v_begin_time,",","结束时间=",v_end_time),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询交易时间
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QueryExchTime;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QueryExchTime(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
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
    declare v_exch_no int;
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
    SET v_exch_no = p_exch_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_基础_交易时间表][字段][(@市场编号#=0 or {市场编号}=@市场编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        begin_time, end_time, allow_wtdraw_flag, remark_info from db_pub.tb_base_exch_time where (v_exch_no=0 or exch_no=v_exch_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        begin_time, end_time, allow_wtdraw_flag, remark_info from db_pub.tb_base_exch_time where (v_exch_no=0 or exch_no=v_exch_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询交易时间流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QueryExchTimeJour;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QueryExchTimeJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
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
    declare v_exch_no int;
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
    SET v_exch_no = p_exch_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_基础_交易时间流水表][字段][{初始化日期} <= @初始化日期# and {市场编号}=@市场编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, begin_time, end_time, allow_wtdraw_flag, 
        remark_info, oper_remark_info from db_pub.tb_base_exch_time_jour where init_date <= v_init_date and exch_no=v_exch_no and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, begin_time, end_time, allow_wtdraw_flag, 
        remark_info, oper_remark_info from db_pub.tb_base_exch_time_jour where init_date <= v_init_date and exch_no=v_exch_no and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询历史交易时间流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QueryExchTimeJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QueryExchTimeJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_exch_no int,
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
    declare v_exch_no int;
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
    SET v_exch_no = p_exch_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_基础_交易时间流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {市场编号}=@市场编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, begin_time, end_time, allow_wtdraw_flag, 
        remark_info, oper_remark_info from db_pub_his.tb_base_exch_time_jour_his where (init_date between v_begin_date and v_end_date) and exch_no=v_exch_no and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, begin_time, end_time, allow_wtdraw_flag, 
        remark_info, oper_remark_info from db_pub_his.tb_base_exch_time_jour_his where (init_date between v_begin_date and v_end_date) and exch_no=v_exch_no and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_获取港股通汇率信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_GetHKRate;;
DELIMITER ;;
CREATE PROCEDURE pra_base_GetHKRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_sh_hk_buy_ref_rate decimal(18,12),
    OUT p_sh_hk_sell_ref_rate decimal(18,12),
    OUT p_sh_hk_settle_buy_rate decimal(18,12),
    OUT p_sh_hk_settle_sell_rate decimal(18,12),
    OUT p_sz_hk_buy_ref_rate decimal(18,12),
    OUT p_sz_hk_sell_ref_rate decimal(18,12),
    OUT p_sz_hk_settle_buy_rate decimal(18,12),
    OUT p_sz_hksettle_sell_rate decimal(18,12)
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
    declare v_sh_hk_buy_ref_rate decimal(18,12);
    declare v_sh_hk_sell_ref_rate decimal(18,12);
    declare v_sh_hk_settle_buy_rate decimal(18,12);
    declare v_sh_hk_settle_sell_rate decimal(18,12);
    declare v_sz_hk_buy_ref_rate decimal(18,12);
    declare v_sz_hk_sell_ref_rate decimal(18,12);
    declare v_sz_hk_settle_buy_rate decimal(18,12);
    declare v_sz_hksettle_sell_rate decimal(18,12);
    declare v_init_date int;
    declare v_exch_no int;

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
    SET v_sh_hk_buy_ref_rate = 0;
    SET v_sh_hk_sell_ref_rate = 0;
    SET v_sh_hk_settle_buy_rate = 0;
    SET v_sh_hk_settle_sell_rate = 0;
    SET v_sz_hk_buy_ref_rate = 0;
    SET v_sz_hk_sell_ref_rate = 0;
    SET v_sz_hk_settle_buy_rate = 0;
    SET v_sz_hksettle_sell_rate = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_系统信息表][{初始化日期}][@初始化日期#][1=1][4][" "] */
    select init_date into v_init_date from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.117.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* set @市场编号# = 《市场编号-沪港通证券交易所》; */
    set v_exch_no = 3;

    /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入参考汇率},{卖出参考汇率}][@沪港通买入参考汇率#,@沪港通卖出参考汇率#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期# and {买入参考汇率}<>0 and {卖出参考汇率}<>0 order by {初始化日期} desc] */
    select buy_ref_rate,sell_ref_rate into v_sh_hk_buy_ref_rate,v_sh_hk_sell_ref_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date and buy_ref_rate<>0 and sell_ref_rate<>0 order by init_date desc limit 1;


    /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率},{卖出结算汇率}][@沪港通买入结算汇率#,@沪港通卖出结算汇率#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期# and {买入结算汇率}<>0 and {卖出结算汇率}<>0 order by {初始化日期} desc] */
    select settle_buy_rate,settle_sell_rate into v_sh_hk_settle_buy_rate,v_sh_hk_settle_sell_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date and settle_buy_rate<>0 and settle_sell_rate<>0 order by init_date desc limit 1;


    /* set @市场编号# = 《市场编号-深港通证券交易所》; */
    set v_exch_no = 4;

    /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入参考汇率},{卖出参考汇率}][@深港通买入参考汇率#,@深港通卖出参考汇率#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期# and {买入参考汇率}<>0 and {卖出参考汇率}<>0 order by {初始化日期} desc] */
    select buy_ref_rate,sell_ref_rate into v_sz_hk_buy_ref_rate,v_sz_hk_sell_ref_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date and buy_ref_rate<>0 and sell_ref_rate<>0 order by init_date desc limit 1;


    /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率},{卖出结算汇率}][@深港通买入结算汇率#,@深港通卖出结算汇率#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期# and {买入结算汇率}<>0 and {卖出结算汇率}<>0 order by {初始化日期} desc] */
    select settle_buy_rate,settle_sell_rate into v_sz_hk_settle_buy_rate,v_sz_hksettle_sell_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date and settle_buy_rate<>0 and settle_sell_rate<>0 order by init_date desc limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_sh_hk_buy_ref_rate = v_sh_hk_buy_ref_rate;
    SET p_sh_hk_sell_ref_rate = v_sh_hk_sell_ref_rate;
    SET p_sh_hk_settle_buy_rate = v_sh_hk_settle_buy_rate;
    SET p_sh_hk_settle_sell_rate = v_sh_hk_settle_sell_rate;
    SET p_sz_hk_buy_ref_rate = v_sz_hk_buy_ref_rate;
    SET p_sz_hk_sell_ref_rate = v_sz_hk_sell_ref_rate;
    SET p_sz_hk_settle_buy_rate = v_sz_hk_settle_buy_rate;
    SET p_sz_hksettle_sell_rate = v_sz_hksettle_sell_rate;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_初始化港股通额度
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_InitHKLimit;;
DELIMITER ;;
CREATE PROCEDURE pra_base_InitHKLimit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
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
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_基础_港股通额度表][{当日剩余额度}={当日初始额度},{额度状态}=《额度状态-额度可用》][{市场编号}=@市场编号#][2][@市场编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_hk_limit_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, remain_limit=begin_limit,limit_status=1 where exch_no=v_exch_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.118.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_获取所需港股通汇率信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_GetHKRatePurposely;;
DELIMITER ;;
CREATE PROCEDURE pra_base_GetHKRatePurposely(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_sh_hk_buy_ref_rate decimal(18,12),
    OUT p_sh_hk_sell_ref_rate decimal(18,12),
    OUT p_sh_hk_settle_buy_rate decimal(18,12),
    OUT p_sh_hk_settle_sell_rate decimal(18,12),
    OUT p_sz_hk_buy_ref_rate decimal(18,12),
    OUT p_sz_hk_sell_ref_rate decimal(18,12),
    OUT p_sz_hk_settle_buy_rate decimal(18,12),
    OUT p_sz_hksettle_sell_rate decimal(18,12),
    OUT p_busin_date int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_query_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sh_hk_buy_ref_rate decimal(18,12);
    declare v_sh_hk_sell_ref_rate decimal(18,12);
    declare v_sh_hk_settle_buy_rate decimal(18,12);
    declare v_sh_hk_settle_sell_rate decimal(18,12);
    declare v_sz_hk_buy_ref_rate decimal(18,12);
    declare v_sz_hk_sell_ref_rate decimal(18,12);
    declare v_sz_hk_settle_buy_rate decimal(18,12);
    declare v_sz_hksettle_sell_rate decimal(18,12);
    declare v_busin_date int;
    declare v_init_date int;
    declare v_exch_no int;
    declare v_tmp_busin_date int;

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
    SET v_query_date = p_query_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sh_hk_buy_ref_rate = 0;
    SET v_sh_hk_sell_ref_rate = 0;
    SET v_sh_hk_settle_buy_rate = 0;
    SET v_sh_hk_settle_sell_rate = 0;
    SET v_sz_hk_buy_ref_rate = 0;
    SET v_sz_hk_sell_ref_rate = 0;
    SET v_sz_hk_settle_buy_rate = 0;
    SET v_sz_hksettle_sell_rate = 0;
    SET v_busin_date = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_no = 0;
    SET v_tmp_busin_date = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_系统信息表][{初始化日期}][@初始化日期#][1=1][4][" "] */
    select init_date into v_init_date from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.119.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* if @查询日期#=0  then */
    if v_query_date=0  then

         /* set @市场编号# = 《市场编号-沪港通证券交易所》; */
         set v_exch_no = 3;

         /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入参考汇率},{卖出参考汇率},{初始化日期}][@沪港通买入参考汇率#,@沪港通卖出参考汇率#,@业务日期#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期# and {买入参考汇率}<>0 and {卖出参考汇率}<>0 order by {初始化日期} desc] */
         select buy_ref_rate,sell_ref_rate,init_date into v_sh_hk_buy_ref_rate,v_sh_hk_sell_ref_rate,v_busin_date from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date and buy_ref_rate<>0 and sell_ref_rate<>0 order by init_date desc limit 1;


         /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率},{卖出结算汇率}][@沪港通买入结算汇率#,@沪港通卖出结算汇率#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期# and {买入结算汇率}<>0 and {卖出结算汇率}<>0 order by {初始化日期} desc] */
         select settle_buy_rate,settle_sell_rate into v_sh_hk_settle_buy_rate,v_sh_hk_settle_sell_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date and settle_buy_rate<>0 and settle_sell_rate<>0 order by init_date desc limit 1;


         /* set @市场编号# = 《市场编号-深港通证券交易所》; */
         set v_exch_no = 4;

         /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入参考汇率},{卖出参考汇率},{初始化日期}][@深港通买入参考汇率#,@深港通卖出参考汇率#,@临时_业务日期#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期# and {买入参考汇率}<>0 and {卖出参考汇率}<>0 order by {初始化日期} desc] */
         select buy_ref_rate,sell_ref_rate,init_date into v_sz_hk_buy_ref_rate,v_sz_hk_sell_ref_rate,v_tmp_busin_date from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date and buy_ref_rate<>0 and sell_ref_rate<>0 order by init_date desc limit 1;


         /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率},{卖出结算汇率}][@深港通买入结算汇率#,@深港通卖出结算汇率#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期# and {买入结算汇率}<>0 and {卖出结算汇率}<>0 order by {初始化日期} desc] */
         select settle_buy_rate,settle_sell_rate into v_sz_hk_settle_buy_rate,v_sz_hksettle_sell_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date and settle_buy_rate<>0 and settle_sell_rate<>0 order by init_date desc limit 1;


         /* [检查报错返回][@业务日期#<>@临时_业务日期#][4][@业务日期#,@临时_业务日期#,"该日期缺少汇率"] */
         if v_busin_date<>v_tmp_busin_date then
             
             SET v_error_code = "pubA.3.119.4";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat("业务日期=",v_busin_date,",","临时_业务日期=",v_tmp_busin_date,",","该日期缺少汇率"),"#",v_mysql_message);
             else
                 SET v_error_info = concat("业务日期=",v_busin_date,",","临时_业务日期=",v_tmp_busin_date,",","该日期缺少汇率");
             end if;
             leave label_pro;
         end if;

    else

         /* set @市场编号# = 《市场编号-沪港通证券交易所》; */
         set v_exch_no = 3;

         /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入参考汇率},{卖出参考汇率}][@沪港通买入参考汇率#,@沪港通卖出参考汇率#][{市场编号} = @市场编号# and {初始化日期} = @查询日期# and {买入参考汇率}<>0 and {卖出参考汇率}<>0] */
         select buy_ref_rate,sell_ref_rate into v_sh_hk_buy_ref_rate,v_sh_hk_sell_ref_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date = v_query_date and buy_ref_rate<>0 and sell_ref_rate<>0 limit 1;


         /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率},{卖出结算汇率}][@沪港通买入结算汇率#,@沪港通卖出结算汇率#][{市场编号} = @市场编号# and {初始化日期} = @查询日期# and {买入结算汇率}<>0 and {卖出结算汇率}<>0] */
         select settle_buy_rate,settle_sell_rate into v_sh_hk_settle_buy_rate,v_sh_hk_settle_sell_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date = v_query_date and settle_buy_rate<>0 and settle_sell_rate<>0 limit 1;


         /* set @市场编号# = 《市场编号-深港通证券交易所》; */
         set v_exch_no = 4;

         /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入参考汇率},{卖出参考汇率}][@深港通买入参考汇率#,@深港通卖出参考汇率#][{市场编号} = @市场编号# and {初始化日期} = @查询日期# and {买入参考汇率}<>0 and {卖出参考汇率}<>0] */
         select buy_ref_rate,sell_ref_rate into v_sz_hk_buy_ref_rate,v_sz_hk_sell_ref_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date = v_query_date and buy_ref_rate<>0 and sell_ref_rate<>0 limit 1;


         /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率},{卖出结算汇率}][@深港通买入结算汇率#,@深港通卖出结算汇率#][{市场编号} = @市场编号# and {初始化日期} = @查询日期# and {买入结算汇率}<>0 and {卖出结算汇率}<>0] */
         select settle_buy_rate,settle_sell_rate into v_sz_hk_settle_buy_rate,v_sz_hksettle_sell_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date = v_query_date and settle_buy_rate<>0 and settle_sell_rate<>0 limit 1;


         /* set @业务日期#=@查询日期#; */
         set v_busin_date=v_query_date;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_sh_hk_buy_ref_rate = v_sh_hk_buy_ref_rate;
    SET p_sh_hk_sell_ref_rate = v_sh_hk_sell_ref_rate;
    SET p_sh_hk_settle_buy_rate = v_sh_hk_settle_buy_rate;
    SET p_sh_hk_settle_sell_rate = v_sh_hk_settle_sell_rate;
    SET p_sz_hk_buy_ref_rate = v_sz_hk_buy_ref_rate;
    SET p_sz_hk_sell_ref_rate = v_sz_hk_sell_ref_rate;
    SET p_sz_hk_settle_buy_rate = v_sz_hk_settle_buy_rate;
    SET p_sz_hksettle_sell_rate = v_sz_hksettle_sell_rate;
    SET p_busin_date = v_busin_date;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_新增通道信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_AddChannelInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_AddChannelInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_pass_name varchar(64),
    IN p_config_file varchar(255),
    IN p_pass_type int,
    IN p_bond_qty_unit_set int,
    IN p_hk_cash_avail_date_type int,
    IN p_remark_info varchar(255),
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
    declare v_pass_no int;
    declare v_pass_name varchar(64);
    declare v_config_file varchar(255);
    declare v_pass_type int;
    declare v_bond_qty_unit_set int;
    declare v_hk_cash_avail_date_type int;
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_status varchar(2);
    declare v_online_status int;
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
    SET v_pass_no = p_pass_no;
    SET v_pass_name = p_pass_name;
    SET v_config_file = p_config_file;
    SET v_pass_type = p_pass_type;
    SET v_bond_qty_unit_set = p_bond_qty_unit_set;
    SET v_hk_cash_avail_date_type = p_hk_cash_avail_date_type;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_status = "0";
    SET v_online_status = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @通道状态# = 《通道状态-正常》; */
    set v_pass_status = "1";

    /* set @在线状态# = 《在线状态-离线》; */
    set v_online_status = 2;

    /* [插入表记录][公共_基础_通道信息表][字段][字段变量][1][@通道编号#,@通道名称#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_channel_info(
        create_date, create_time, update_date, 
        update_time, update_times, pass_no, pass_name, 
        config_file, pass_status, pass_type, bond_qty_unit_set, 
        hk_cash_avail_date_type, online_status, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_pass_no, v_pass_name, 
        v_config_file, v_pass_status, v_pass_type, v_bond_qty_unit_set, 
        v_hk_cash_avail_date_type, v_online_status, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.150.1";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","通道名称=",v_pass_name),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_通道信息流水表][字段][字段变量][5][@通道编号#,@通道名称#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_channel_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, pass_no, 
        pass_name, config_file, pass_status, pass_type, 
        bond_qty_unit_set, online_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_pass_no, 
        v_pass_name, v_config_file, v_pass_status, v_pass_type, 
        v_bond_qty_unit_set, v_online_status);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.150.5";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","通道名称=",v_pass_name),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_修改通道信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_ModiChannelInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_ModiChannelInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_pass_name varchar(64),
    IN p_config_file varchar(255),
    IN p_pass_status varchar(2),
    IN p_pass_type int,
    IN p_bond_qty_unit_set int,
    IN p_hk_cash_avail_date_type int,
    IN p_remark_info varchar(255),
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
    declare v_pass_no int;
    declare v_pass_name varchar(64);
    declare v_config_file varchar(255);
    declare v_pass_status varchar(2);
    declare v_pass_type int;
    declare v_bond_qty_unit_set int;
    declare v_hk_cash_avail_date_type int;
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_online_status int;
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
    SET v_pass_no = p_pass_no;
    SET v_pass_name = p_pass_name;
    SET v_config_file = p_config_file;
    SET v_pass_status = p_pass_status;
    SET v_pass_type = p_pass_type;
    SET v_bond_qty_unit_set = p_bond_qty_unit_set;
    SET v_hk_cash_avail_date_type = p_hk_cash_avail_date_type;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_online_status = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_基础_通道信息表][{通道名称}=@通道名称#,{配置文件名}=@配置文件名#,{通道状态}=@通道状态#,{通道类型}=@通道类型#,{债券数量单位配置}=@债券数量单位配置#,{港股通资金可用日期}=@港股通资金可用日期#,{备注信息}=@备注信息#][{通道编号}=@通道编号#][2][@通道编号#,@通道名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_channel_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pass_name=v_pass_name,config_file=v_config_file,pass_status=v_pass_status,pass_type=v_pass_type,bond_qty_unit_set=v_bond_qty_unit_set,hk_cash_avail_date_type=v_hk_cash_avail_date_type,remark_info=v_remark_info where pass_no=v_pass_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.151.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","通道名称=",v_pass_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,",","通道名称=",v_pass_name);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_基础_通道信息表][字段][字段变量][{通道编号}=@通道编号#][4][@通道编号#,@通道名称#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, pass_no, 
        pass_name, config_file, pass_status, pass_type, 
        bond_qty_unit_set, hk_cash_avail_date_type, online_status, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_pass_no, 
        v_pass_name, v_config_file, v_pass_status, v_pass_type, 
        v_bond_qty_unit_set, v_hk_cash_avail_date_type, v_online_status, v_remark_info from db_pub.tb_base_channel_info where pass_no=v_pass_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.151.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","通道名称=",v_pass_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,",","通道名称=",v_pass_name);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_通道信息流水表][字段][字段变量][5][@通道编号#,@通道名称#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_channel_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, pass_no, 
        pass_name, config_file, pass_status, pass_type, 
        bond_qty_unit_set, online_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_pass_no, 
        v_pass_name, v_config_file, v_pass_status, v_pass_type, 
        v_bond_qty_unit_set, v_online_status);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.151.5";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","通道名称=",v_pass_name),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_删除通道信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_DeleteChannelInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_DeleteChannelInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
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
    declare v_pass_no int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pass_name varchar(64);
    declare v_config_file varchar(255);
    declare v_pass_status varchar(2);
    declare v_pass_type int;
    declare v_bond_qty_unit_set int;
    declare v_hk_cash_avail_date_type int;
    declare v_online_status int;
    declare v_remark_info varchar(255);
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
    SET v_pass_no = p_pass_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pass_name = " ";
    SET v_config_file = " ";
    SET v_pass_status = "0";
    SET v_pass_type = 0;
    SET v_bond_qty_unit_set = 0;
    SET v_hk_cash_avail_date_type = 0;
    SET v_online_status = 0;
    SET v_remark_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_通道信息表][字段][字段变量][{通道编号}=@通道编号#][4][@通道编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, pass_no, 
        pass_name, config_file, pass_status, pass_type, 
        bond_qty_unit_set, hk_cash_avail_date_type, online_status, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_pass_no, 
        v_pass_name, v_config_file, v_pass_status, v_pass_type, 
        v_bond_qty_unit_set, v_hk_cash_avail_date_type, v_online_status, v_remark_info from db_pub.tb_base_channel_info where pass_no=v_pass_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.152.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_基础_通道信息表][{通道编号}=@通道编号#][3][@通道编号#] */
    delete from db_pub.tb_base_channel_info 
        where pass_no=v_pass_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.3.152.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_通道信息流水表][字段][字段变量][5][@通道编号#,@通道名称#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_channel_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, pass_no, 
        pass_name, config_file, pass_status, pass_type, 
        bond_qty_unit_set, online_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_pass_no, 
        v_pass_name, v_config_file, v_pass_status, v_pass_type, 
        v_bond_qty_unit_set, v_online_status);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.152.5";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","通道名称=",v_pass_name),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询通道信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QueryChannelInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QueryChannelInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_pass_type int,
    IN p_pass_status varchar(2),
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
    declare v_pass_no int;
    declare v_pass_type int;
    declare v_pass_status varchar(2);
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
    SET v_pass_no = p_pass_no;
    SET v_pass_type = p_pass_type;
    SET v_pass_status = p_pass_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_基础_通道信息表][字段][(@通道编号#=0 or {通道编号}=@通道编号#) and (@通道类型#=0 or {通道类型}=@通道类型#) and (@通道状态#=" " or {通道状态}=@通道状态#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, pass_no, 
        pass_name, config_file, pass_status, pass_type, 
        bond_qty_unit_set, hk_cash_avail_date_type, online_status, remark_info from db_pub.tb_base_channel_info where (v_pass_no=0 or pass_no=v_pass_no) and (v_pass_type=0 or pass_type=v_pass_type) and (v_pass_status=" " or pass_status=v_pass_status) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, pass_no, 
        pass_name, config_file, pass_status, pass_type, 
        bond_qty_unit_set, hk_cash_avail_date_type, online_status, remark_info from db_pub.tb_base_channel_info where (v_pass_no=0 or pass_no=v_pass_no) and (v_pass_type=0 or pass_type=v_pass_type) and (v_pass_status=" " or pass_status=v_pass_status) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_上线通道
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_LoginChannel;;
DELIMITER ;;
CREATE PROCEDURE pra_base_LoginChannel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_online_status int;
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
    SET v_pass_no = p_pass_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_online_status = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][公共_基础_通道信息表][{在线状态}][@在线状态#][{通道编号}=@通道编号#][4][@通道编号#] */
    select online_status into v_online_status from db_pub.tb_base_channel_info where pass_no=v_pass_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.154.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@在线状态#<>《在线状态-离线》][82][@通道编号#] */
    if v_online_status<>2 then
        
        SET v_error_code = "pubA.3.154.82";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_基础_通道信息表][{在线状态}=《在线状态-在线》][{通道编号}=@通道编号#][2][@通道编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_channel_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, online_status=1 where pass_no=v_pass_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.154.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_下线通道
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_LogoutChannel;;
DELIMITER ;;
CREATE PROCEDURE pra_base_LogoutChannel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_online_status int;
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
    SET v_pass_no = p_pass_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_online_status = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_通道信息表][{在线状态}][@在线状态#][{通道编号}=@通道编号#][4][@通道编号#] */
    select online_status into v_online_status from db_pub.tb_base_channel_info where pass_no=v_pass_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.155.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_基础_通道信息表][{在线状态}=《在线状态-离线》][{通道编号}=@通道编号#][2][@通道编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_channel_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, online_status=2 where pass_no=v_pass_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.155.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询数据字典
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QueryDictionary;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QueryDictionary(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_dict_no int,
    IN p_dict_item_name varchar(64),
    IN p_dict_field_name varchar(32),
    IN p_time_stamp int,
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
    declare v_dict_no int;
    declare v_dict_item_name varchar(64);
    declare v_dict_field_name varchar(32);
    declare v_time_stamp int;
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
    SET v_dict_no = p_dict_no;
    SET v_dict_item_name = p_dict_item_name;
    SET v_dict_field_name = p_dict_field_name;
    SET v_time_stamp = p_time_stamp;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_基础_数据字典表][字段][(@字典编号# = 0 or {字典编号}=@字典编号#) and (@字典项名称# = " " or {字典项名称}=@字典项名称#) and (@字典字段名# = " " or {字典字段名}=@字典字段名#) and (@时间戳# = 0 or {时间戳} > @时间戳#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, dict_no, 
        dict_name, dict_field_name, dict_item_name, dict_item_value, 
        time_stamp from db_pub.tb_base_dictionary where (v_dict_no = 0 or dict_no=v_dict_no) and (v_dict_item_name = " " or dict_item_name=v_dict_item_name) and (v_dict_field_name = " " or dict_field_name=v_dict_field_name) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, dict_no, 
        dict_name, dict_field_name, dict_item_name, dict_item_value, 
        time_stamp from db_pub.tb_base_dictionary where (v_dict_no = 0 or dict_no=v_dict_no) and (v_dict_item_name = " " or dict_item_name=v_dict_item_name) and (v_dict_field_name = " " or dict_field_name=v_dict_field_name) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询业务标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QueryBusiFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QueryBusiFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_type int,
    IN p_busi_sub_type int,
    IN p_busi_flag int,
    IN p_busi_name varchar(64),
    IN p_time_stamp int,
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
    declare v_busi_type int;
    declare v_busi_sub_type int;
    declare v_busi_flag int;
    declare v_busi_name varchar(64);
    declare v_time_stamp int;
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
    SET v_busi_type = p_busi_type;
    SET v_busi_sub_type = p_busi_sub_type;
    SET v_busi_flag = p_busi_flag;
    SET v_busi_name = p_busi_name;
    SET v_time_stamp = p_time_stamp;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_基础_业务标志表][字段][(@业务类别# = 0 or {业务类别}=@业务类别#) and (@业务子类# = 0 or {业务子类}=@业务子类#) and (@业务标志# = 0 or {业务标志}=@业务标志#) and (@业务名称# = " " or {业务名称}=@业务名称#) and (@时间戳# = 0 or {时间戳} > @时间戳#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, busi_type, 
        busi_sub_type, busi_flag, busi_name, time_stamp from db_pub.tb_base_busiflag where (v_busi_type = 0 or busi_type=v_busi_type) and (v_busi_sub_type = 0 or busi_sub_type=v_busi_sub_type) and (v_busi_flag = 0 or busi_flag=v_busi_flag) and (v_busi_name = " " or busi_name=v_busi_name) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, busi_type, 
        busi_sub_type, busi_flag, busi_name, time_stamp from db_pub.tb_base_busiflag where (v_busi_type = 0 or busi_type=v_busi_type) and (v_busi_sub_type = 0 or busi_sub_type=v_busi_sub_type) and (v_busi_flag = 0 or busi_flag=v_busi_flag) and (v_busi_name = " " or busi_name=v_busi_name) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_归档公共基础数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_BackUpBaseData;;
DELIMITER ;;
CREATE PROCEDURE pra_base_BackUpBaseData(
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
    

    /* [数据归历史][公共_基础_系统信息流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_base_sys_info_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        jour_occur_field, jour_after_occur_info, oper_remark_info 
        from db_pub.tb_base_sys_info_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_基础_系统信息流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_base_sys_info_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_基础_机构信息流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_base_co_info_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, jour_occur_field, jour_after_occur_info, oper_remark_info 
        from db_pub.tb_base_co_info_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_基础_机构信息流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_base_co_info_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_基础_系统配置流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_base_sys_config_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, config_no, config_name, config_choice_type, 
        config_value, dict_field_name, config_memo, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, config_no, config_name, config_choice_type, 
        config_value, dict_field_name, config_memo, oper_remark_info 
        from db_pub.tb_base_sys_config_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_基础_系统配置流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_base_sys_config_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_基础_机构汇率流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_base_co_exch_rate_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, for_crncy_type, crncy_type, buy_exch_rate, 
        sale_exch_rate, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, for_crncy_type, crncy_type, buy_exch_rate, 
        sale_exch_rate, oper_remark_info 
        from db_pub.tb_base_co_exch_rate_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_基础_机构汇率流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_base_co_exch_rate_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_基础_市场信息流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_base_exch_info_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        jour_occur_field, jour_after_occur_info, oper_remark_info 
        from db_pub.tb_base_exch_info_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_基础_市场信息流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_base_exch_info_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_基础_交易时间流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_base_exch_time_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, begin_time, end_time, allow_wtdraw_flag, 
        remark_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, begin_time, end_time, allow_wtdraw_flag, 
        remark_info, oper_remark_info 
        from db_pub.tb_base_exch_time_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_基础_交易时间流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_base_exch_time_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_基础_通道信息流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_base_channel_info_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        pass_no, pass_name, config_file, pass_status, 
        pass_type, bond_qty_unit_set, online_status) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        pass_no, pass_name, config_file, pass_status, 
        pass_type, bond_qty_unit_set, online_status 
        from db_pub.tb_base_channel_info_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_基础_通道信息流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_base_channel_info_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_基础_港股通交收日设置流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_base_hk_settle_date_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        settle_date, set_type, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        settle_date, set_type, oper_remark_info 
        from db_pub.tb_base_hk_settle_date_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_基础_港股通交收日设置流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_base_hk_settle_date_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_基础_公共库删除流水表][字段][{初始化日期}<=@初始化日期#][1i][@初始化日期#] */
    insert into db_pub_his.tb_base_pub_delete_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        table_name, table_row_id, table_field_value, table_uni_index_value) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        table_name, table_row_id, table_field_value, table_uni_index_value 
        from db_pub.tb_base_pub_delete_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.201.1i";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_基础_公共库删除流水表][{初始化日期}<=@初始化日期#][3i][@初始化日期#] */
    delete from db_pub.tb_base_pub_delete_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.3.201.3i";
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

# 原子_公共_基础_初始化系统
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_InitSystem;;
DELIMITER ;;
CREATE PROCEDURE pra_base_InitSystem(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_no_exch_date_str varchar(2048);
    declare v_allow_next_init_time int;
    declare v_mach_date int;
    declare v_mach_time int;
    declare v_tmp_init_date int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_no_exch_date_str = " ";
    SET v_allow_next_init_time = date_format(curtime(),'%H%i%s');
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_init_date = date_format(curdate(),'%Y%m%d');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][公共_基础_系统信息表][{初始化日期},{非交易日期串},{允许次日初始化时间}][@初始化日期#,@非交易日期串#,@允许次日初始化时间#][1=1][4][" "] */
    select init_date,no_exch_date_str,allow_next_init_time into v_init_date,v_no_exch_date_str,v_allow_next_init_time from db_pub.tb_base_sys_info where 1=1 limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.202.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [获取机器日期][@机器日期#] */
    select date_format(curdate(),'%Y%m%d') into v_mach_date;


    /* [检查正常返回][@初始化日期# > @机器日期#] */
    if v_init_date > v_mach_date then
        leave label_pro;
    end if;


    /* if @允许次日初始化时间# <> 0 then */
    if v_allow_next_init_time <> 0 then

        /* [获取机器时间][@机器时间#] */
        select date_format(curtime(),'%H%i%s') into v_mach_time;


        /* [检查报错返回][@机器时间# < @允许次日初始化时间#][303][@机器时间#,@允许次日初始化时间#] */
        if v_mach_time < v_allow_next_init_time then
            
            SET v_error_code = "pubA.3.202.303";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机器时间=",v_mach_time,",","允许次日初始化时间=",v_allow_next_init_time),"#",v_mysql_message);
            else
                SET v_error_info = concat("机器时间=",v_mach_time,",","允许次日初始化时间=",v_allow_next_init_time);
            end if;
            leave label_pro;
        end if;

    end if;
    loop_label:loop

        /* set @临时_初始化日期# = DATE_FORMAT(ADDDATE(@初始化日期#,1),"%Y%m%d"); */
        set v_tmp_init_date = DATE_FORMAT(ADDDATE(v_init_date,1),"%Y%m%d");

        /* if dayofweek(@临时_初始化日期#) <> 7 and dayofweek(@临时_初始化日期#) <> 1 and instr(@非交易日期串#, concat(";", @临时_初始化日期#, ";")) = 0 then */
        if dayofweek(v_tmp_init_date) <> 7 and dayofweek(v_tmp_init_date) <> 1 and instr(v_no_exch_date_str, concat(";", v_tmp_init_date, ";")) = 0 then
            leave loop_label;
        else

            /* set @初始化日期# = @临时_初始化日期#; */
            set v_init_date = v_tmp_init_date;
        end if;
    end loop;

    /* set @初始化日期# = @临时_初始化日期#; */
    set v_init_date = v_tmp_init_date;

    /* [更新表记录][公共_基础_系统信息表][{初始化日期}=@初始化日期#][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_sys_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.202.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* set @流水变动字段# = " "; */
    set v_jour_occur_field = " ";

    /* set @流水后信息# = " "; */
    set v_jour_after_occur_info = " ";

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "初始化系统"; */
    set v_oper_remark_info = "初始化系统";

    /* [插入表记录][公共_基础_系统信息流水表][字段][字段变量][5][" "] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_sys_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.202.5";
        SET v_error_info =  CONCAT(" ","#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_初始化市场信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_InitExchInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_InitExchInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_no_exch_date_str varchar(2048)
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
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_no_exch_date_str varchar(2048);
    declare v_allow_next_init_time int;
    declare v_mach_date int;
    declare v_mach_time int;
    declare v_tmp_init_date int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_exch_no = p_exch_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_no_exch_date_str = " ";
    SET v_allow_next_init_time = date_format(curtime(),'%H%i%s');
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_init_date = date_format(curdate(),'%Y%m%d');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][公共_基础_市场信息表][{初始化日期},{非交易日期串},{允许次日初始化时间}][@初始化日期#,@非交易日期串#,@允许次日初始化时间#][{市场编号}=@市场编号#][4][@市场编号#] */
    select init_date,no_exch_date_str,allow_next_init_time into v_init_date,v_no_exch_date_str,v_allow_next_init_time from db_pub.tb_base_exch_info where exch_no=v_exch_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.203.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* [获取机器日期][@机器日期#] */
    select date_format(curdate(),'%Y%m%d') into v_mach_date;


    /* [检查正常返回][@初始化日期# > @机器日期#] */
    if v_init_date > v_mach_date then
        leave label_pro;
    end if;


    /* if @允许次日初始化时间# <> 0 then */
    if v_allow_next_init_time <> 0 then

        /* [获取机器时间][@机器时间#] */
        select date_format(curtime(),'%H%i%s') into v_mach_time;


        /* [检查报错返回][@机器时间# < @允许次日初始化时间#][303][@机器时间#,@允许次日初始化时间#] */
        if v_mach_time < v_allow_next_init_time then
            
            SET v_error_code = "pubA.3.203.303";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机器时间=",v_mach_time,",","允许次日初始化时间=",v_allow_next_init_time),"#",v_mysql_message);
            else
                SET v_error_info = concat("机器时间=",v_mach_time,",","允许次日初始化时间=",v_allow_next_init_time);
            end if;
            leave label_pro;
        end if;

    end if;
    loop_label:loop

        /* set @临时_初始化日期# = DATE_FORMAT(ADDDATE(@初始化日期#,1),"%Y%m%d"); */
        set v_tmp_init_date = DATE_FORMAT(ADDDATE(v_init_date,1),"%Y%m%d");

        /* if dayofweek(@临时_初始化日期#) <> 7 and dayofweek(@临时_初始化日期#) <> 1 and instr(@非交易日期串#, concat(";", @临时_初始化日期#, ";")) = 0 then */
        if dayofweek(v_tmp_init_date) <> 7 and dayofweek(v_tmp_init_date) <> 1 and instr(v_no_exch_date_str, concat(";", v_tmp_init_date, ";")) = 0 then
            leave loop_label;
        else

            /* set @初始化日期# = @临时_初始化日期#; */
            set v_init_date = v_tmp_init_date;
        end if;
    end loop;

    /* set @初始化日期# = @临时_初始化日期#; */
    set v_init_date = v_tmp_init_date;

    /* [更新表记录][公共_基础_市场信息表][{初始化日期}=@初始化日期#][{市场编号}=@市场编号#][2][@市场编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_exch_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_init_date where exch_no=v_exch_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.203.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* set @流水变动字段# = " "; */
    set v_jour_occur_field = " ";

    /* set @流水后信息# = " "; */
    set v_jour_after_occur_info = " ";

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "初始化市场信息"; */
    set v_oper_remark_info = "初始化市场信息";

    /* [插入表记录][公共_基础_市场信息流水表][字段][字段变量][5][" "] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_exch_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.203.5";
        SET v_error_info =  CONCAT(" ","#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_no_exch_date_str = v_no_exch_date_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_获取系统指定下一交易日
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_GetSysNextTradeDate;;
DELIMITER ;;
CREATE PROCEDURE pra_base_GetSysNextTradeDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_fixed_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_fixed_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_no_exch_date_str varchar(2048);

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
    SET v_fixed_date = p_fixed_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_no_exch_date_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_系统信息表][{非交易日期串}][@非交易日期串#][1=1][1][@指定日期#] */
    select no_exch_date_str into v_no_exch_date_str from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.301.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指定日期=",v_fixed_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("指定日期=",v_fixed_date);
        end if;
        leave label_pro;
    end if;

    loop_label:loop

        /* if dayofweek(@指定日期#) <> 7 and dayofweek(@指定日期#) <> 1 and instr(@非交易日期串#, concat(";", @指定日期#, ";")) = 0 then */
        if dayofweek(v_fixed_date) <> 7 and dayofweek(v_fixed_date) <> 1 and instr(v_no_exch_date_str, concat(";", v_fixed_date, ";")) = 0 then
            leave loop_label;
        else

            /* set @指定日期# = date_format(date_add(@指定日期#, interval 1 day), '%Y%m%d'); */
            set v_fixed_date = date_format(date_add(v_fixed_date, interval 1 day), '%Y%m%d');
        end if;
    end loop;

    /* set @初始化日期# = @指定日期#; */
    set v_init_date = v_fixed_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_获取系统初始化日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_GetSysInitDate;;
DELIMITER ;;
CREATE PROCEDURE pra_base_GetSysInitDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int
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
    declare v_init_date int;

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
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_系统信息表][{初始化日期}][@初始化日期#][1=1][4][" "] */
    select init_date into v_init_date from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.302.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_获取机构业务记录编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_GetCoBusiRecordNo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_GetCoBusiRecordNo(
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
    SET v_co_no = p_co_no;
    SET v_record_no_type = p_record_no_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #为防止错误，对编号类型进行检查

    /* [检查报错返回][@编号类型# <> 《编号类型-机构编号》 and @编号类型# <> 《编号类型-产品编号》 and @编号类型# <> 《编号类型-资产账户编号》 and @编号类型# <> 《编号类型-操作员编号》 and @编号类型# <> 《编号类型-交易组编号》 and @编号类型# <> 《编号类型-交易通道编号》 and @编号类型# <> 《编号类型-银行账户编号》 and @编号类型# <> 《编号类型-交易员编号》 and @编号类型# <> 《编号类型-费用模板编号》 and @编号类型# <> 《编号类型-角色编号》 and @编号类型# <> 《编号类型-组别编号》][1][@编号类型#] */
    if v_record_no_type <> 1 and v_record_no_type <> 2 and v_record_no_type <> 3 and v_record_no_type <> 10 and v_record_no_type <> 12 and v_record_no_type <> 4 and v_record_no_type <> 5 and v_record_no_type <> 11 and v_record_no_type <> 13 and v_record_no_type <> 14 and v_record_no_type <> 19 then
        
        SET v_error_code = "pubA.3.303.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("编号类型=",v_record_no_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("编号类型=",v_record_no_type);
        end if;
        leave label_pro;
    end if;

    #如果不区分机构的编号类型，需要重置机构编号为0

    /* if @编号类型# = 《编号类型-机构编号》 or @编号类型# = 《编号类型-交易通道编号》 or @编号类型# = 《编号类型-银行账户编号》 or @编号类型# = 《编号类型-交易员编号》 or @编号类型# = 《编号类型-组别编号》 then */
    if v_record_no_type = 1 or v_record_no_type = 4 or v_record_no_type = 5 or v_record_no_type = 11 or v_record_no_type = 19 then

        /* set @机构编号# = 0; */
        set v_co_no = 0;
    end if;
    #当前编号，除机构编号外，其他都从0开始

    /* if @编号类型# = 《编号类型-机构编号》 then */
    if v_record_no_type = 1 then

        /* set @当前编号# = 1001; */
        set v_curr_no = 1001;
    else

        /* set @当前编号# = 1; */
        set v_curr_no = 1;
    end if;

    /* [插入重复更新][公共_基础_机构业务记录编号表][字段][字段变量][{当前编号} = {当前编号} + 1][1][@机构编号#, @编号类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_co_busi_record_no (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, record_no_type, 
        curr_no) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_record_no_type, 
        v_curr_no) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_no = curr_no + 1;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.303.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 编号类型=", v_record_no_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,","," 编号类型=", v_record_no_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][公共_基础_机构业务记录编号表][{当前编号}][@当前编号#][{机构编号} = @机构编号# and {编号类型} = @编号类型#] */
    select curr_no into v_curr_no from db_pub.tb_base_co_busi_record_no where co_no = v_co_no and record_no_type = v_record_no_type limit 1;

    #当前编号不区分机构的直接输出，其他按规则输出

    /* if @编号类型# <> 《编号类型-机构编号》 and @编号类型# <> 《编号类型-交易通道编号》 and @编号类型# <> 《编号类型-银行账户编号》 and @编号类型# <> 《编号类型-交易员编号》 and @编号类型# <> 《编号类型-组别编号》 then */
    if v_record_no_type <> 1 and v_record_no_type <> 4 and v_record_no_type <> 5 and v_record_no_type <> 11 and v_record_no_type <> 19 then

        /* set @当前编号# = @机构编号# * 10000 + @当前编号#; */
        set v_curr_no = v_co_no * 10000 + v_curr_no;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_curr_no = v_curr_no;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_获取市场业务记录编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_GetMarketBusiRecordNo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_GetMarketBusiRecordNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
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
    declare v_exch_no int;
    declare v_record_no_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_no bigint;
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
    SET v_exch_no = p_exch_no;
    SET v_record_no_type = p_record_no_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #为防止错误，对编号类型进行检查

    /* [检查报错返回][@编号类型# <> 《编号类型-股东代码编号》 and @编号类型# <> 《编号类型-交易编码编号》 and @编号类型# <> 《编号类型-证券代码编号》 and @编号类型# <> 《编号类型-合约代码编号》][1][@编号类型#,"不符合条件"] */
    if v_record_no_type <> 6 and v_record_no_type <> 7 and v_record_no_type <> 8 and v_record_no_type <> 9 then
        
        SET v_error_code = "pubA.3.304.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("编号类型=",v_record_no_type,",","不符合条件"),"#",v_mysql_message);
        else
            SET v_error_info = concat("编号类型=",v_record_no_type,",","不符合条件");
        end if;
        leave label_pro;
    end if;


    /* set @当前编号# = 1; */
    set v_curr_no = 1;

    /* [插入重复更新][公共_基础_市场业务记录编号表][字段][字段变量][{当前编号} = {当前编号} + 1][1][@市场编号#, @编号类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_market_busi_record_no (
        create_date, create_time, update_date, 
        update_time, update_times, exch_no, record_no_type, 
        curr_no) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_exch_no, v_record_no_type, 
        v_curr_no) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_no = curr_no + 1;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.3.304.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 编号类型=", v_record_no_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 编号类型=", v_record_no_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][公共_基础_市场业务记录编号表][{当前编号}][@当前编号#][{市场编号} = @市场编号# and {编号类型} = @编号类型#] */
    select curr_no into v_curr_no from db_pub.tb_base_market_busi_record_no where exch_no = v_exch_no and record_no_type = v_record_no_type limit 1;


    /* set @当前编号# = @市场编号# * 1000000 + @当前编号#; */
    set v_curr_no = v_exch_no * 1000000 + v_curr_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_curr_no = v_curr_no;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_获取市场初始化日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_GetExchInitDate;;
DELIMITER ;;
CREATE PROCEDURE pra_base_GetExchInitDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_init_date int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_init_date int;

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_init_date = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_市场信息表][{初始化日期}][@市场初始化日期#][{市场编号}=@市场编号#][1][@市场编号#] */
    select init_date into v_exch_init_date from db_pub.tb_base_exch_info where exch_no=v_exch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.305.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_init_date = v_exch_init_date;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_获取市场指定下一交易日
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_GetExchSpecNextExchDate;;
DELIMITER ;;
CREATE PROCEDURE pra_base_GetExchSpecNextExchDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_fixed_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_init_date int
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
    declare v_fixed_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_init_date int;
    declare v_no_exch_date_str varchar(2048);

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
    SET v_fixed_date = p_fixed_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_init_date = 0;
    SET v_no_exch_date_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_市场信息表][{非交易日期串}][@非交易日期串#][{市场编号} = @市场编号#][1][@市场编号#] */
    select no_exch_date_str into v_no_exch_date_str from db_pub.tb_base_exch_info where exch_no = v_exch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.306.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;

    loop_label:loop

        /* if dayofweek(@指定日期#) <> 7 and dayofweek(@指定日期#) <> 1 and instr(@非交易日期串#, concat(";", @指定日期#, ";")) = 0 then */
        if dayofweek(v_fixed_date) <> 7 and dayofweek(v_fixed_date) <> 1 and instr(v_no_exch_date_str, concat(";", v_fixed_date, ";")) = 0 then
            leave loop_label;
        else

            /* set @指定日期# = date_format(date_add(@指定日期#, interval 1 day), '%Y%m%d'); */
            set v_fixed_date = date_format(date_add(v_fixed_date, interval 1 day), '%Y%m%d');
        end if;
    end loop;

    /* set @市场初始化日期# = @指定日期#; */
    set v_exch_init_date = v_fixed_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_init_date = v_exch_init_date;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_检查交易日期时间
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_CheckExchDateTime;;
DELIMITER ;;
CREATE PROCEDURE pra_base_CheckExchDateTime(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_trade_date int,
    IN p_exch_no int,
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
    declare v_trade_date int;
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_mach_time int;
    declare v_no_exch_date_str varchar(2048);
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
    SET v_trade_date = p_trade_date;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_no_exch_date_str = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;

    #检查交易日期是否合法

    /* [获取表记录变量][公共_基础_市场信息表][{非交易日期串}][@非交易日期串#][{市场编号} = @市场编号#][1][@市场编号#] */
    select no_exch_date_str into v_no_exch_date_str from db_pub.tb_base_exch_info where exch_no = v_exch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.307.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][dayofweek(@交易日期#) = 7 or dayofweek(@交易日期#) = 1 or instr(concat(";",@非交易日期串#,";"), concat(";", @交易日期#, ";")) > 0][704][@交易日期#] */
    if dayofweek(v_trade_date) = 7 or dayofweek(v_trade_date) = 1 or instr(concat(";",v_no_exch_date_str,";"), concat(";", v_trade_date, ";")) > 0 then
        
        SET v_error_code = "pubA.3.307.704";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易日期=",v_trade_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易日期=",v_trade_date);
        end if;
        leave label_pro;
    end if;

    #检查交易时间是否合法

    /* [获取表记录数量][公共_基础_交易时间表][@记录个数#][{市场编号}=@市场编号#] */
    select count(1) into v_record_count from db_pub.tb_base_exch_time where exch_no=v_exch_no;


    /* [检查正常返回][@记录个数#=0] */
    if v_record_count=0 then
        leave label_pro;
    end if;

    #暂时废弃此表。
    #[记录不存在][公共_基础_交易时间表][@记录个数#][{开始时间}<=@机器时间# and @机器时间#<={结束时间} and {市场编号} = @市场编号#][705][@机器时间#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_获取市场本币币种汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_GetExchMoneyTypeExchRate;;
DELIMITER ;;
CREATE PROCEDURE pra_base_GetExchMoneyTypeExchRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12)
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
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);

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
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_市场信息表][{本币币种},{交易币种}][@本币币种#,@交易币种#][{市场编号}=@市场编号#][4][@市场编号#] */
    select crncy_type,exch_crncy_type into v_crncy_type,v_exch_crncy_type from db_pub.tb_base_exch_info where exch_no=v_exch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.308.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* if @本币币种# <> @交易币种# then */
    if v_crncy_type <> v_exch_crncy_type then

        /* [获取表记录变量语句][公共_基础_机构汇率表][{购汇汇率}][@汇率#][{机构编号}=@机构编号# and {外币币种}=@交易币种# and {本币币种}=@本币币种#] */
        select buy_exch_rate into v_exch_rate from db_pub.tb_base_co_exch_rate where co_no=v_co_no and for_crncy_type=v_exch_crncy_type and crncy_type=v_crncy_type limit 1;

        if FOUND_ROWS() = 0 then

            /* set @汇率# = 1; */
            set v_exch_rate = 1;
        end if;
    else

        /* set @汇率# = 1; */
        set v_exch_rate = 1;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_检查市场状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_CheckMarketStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_base_CheckMarketStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12)
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
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_status int;
    declare v_sys_status varchar(2);

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
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_exch_status = 0;
    SET v_sys_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_市场信息表][{本币币种},{交易币种},{市场状态},{初始化日期}][@本币币种#,@交易币种#,@市场状态#,@初始化日期#][{市场编号}=@市场编号#][1][@市场编号#] */
    select crncy_type,exch_crncy_type,exch_status,init_date into v_crncy_type,v_exch_crncy_type,v_exch_status,v_init_date from db_pub.tb_base_exch_info where exch_no=v_exch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.309.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@市场状态# = 《市场状态-关闭》][6][@系统状态#] */
    if v_exch_status = 2 then
        
        SET v_error_code = "pubA.3.309.6";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("系统状态=",v_sys_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("系统状态=",v_sys_status);
        end if;
        leave label_pro;
    end if;


    /* if @本币币种# <> @交易币种# and @机构编号# <>0 then */
    if v_crncy_type <> v_exch_crncy_type and v_co_no <>0 then

        /* [获取表记录变量语句][公共_基础_机构汇率表][{购汇汇率}][@汇率#][{机构编号}=@机构编号# and {外币币种}=@交易币种# and {本币币种}=@本币币种#] */
        select buy_exch_rate into v_exch_rate from db_pub.tb_base_co_exch_rate where co_no=v_co_no and for_crncy_type=v_exch_crncy_type and crncy_type=v_crncy_type limit 1;

        if FOUND_ROWS() = 0 then

            /* set @汇率# = 1; */
            set v_exch_rate = 1;
        end if;
    else

        /* set @汇率# = 1; */
        set v_exch_rate = 1;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_检查系统状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_CheckSysStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_base_CheckSysStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_sys_config_str varchar(64),
    OUT p_co_busi_config_str varchar(64)
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
    declare v_init_date int;
    declare v_sys_config_str varchar(64);
    declare v_co_busi_config_str varchar(64);
    declare v_sys_status varchar(2);
    declare v_co_status varchar(2);

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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_sys_config_str = " ";
    SET v_co_busi_config_str = " ";
    SET v_sys_status = "0";
    SET v_co_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_系统信息表][{系统状态},{初始化日期},{系统控制配置串}][@系统状态#,@初始化日期#,@系统控制配置串#][1=1][4][" "] */
    select sys_status,init_date,sys_config_str into v_sys_status,v_init_date,v_sys_config_str from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.310.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@系统状态# = 《系统状态-停止》][6][@系统状态#] */
    if v_sys_status = "2" then
        
        SET v_error_code = "pubA.3.310.6";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("系统状态=",v_sys_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("系统状态=",v_sys_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@系统状态# = 《系统状态-维护》][7]["系统维护中"] */
    if v_sys_status = "3" then
        
        SET v_error_code = "pubA.3.310.7";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("系统维护中","#",v_mysql_message);
        else
            SET v_error_info = "系统维护中";
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_基础_机构信息表][{机构状态},{业务控制配置串}][@机构状态#,@机构业务控制配置串#][{机构编号}=@操作员机构编号#][4][@操作员机构编号#] */
    select co_status,busi_config_str into v_co_status,v_co_busi_config_str from db_pub.tb_base_co_info where co_no=v_opor_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.310.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员机构编号=",v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员机构编号=",v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构状态# = 《机构状态-冻结》][54]["机构已冻结"] */
    if v_co_status = "2" then
        
        SET v_error_code = "pubA.3.310.54";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("机构已冻结","#",v_mysql_message);
        else
            SET v_error_info = "机构已冻结";
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构状态# = 《机构状态-注销》][55]["机构已注销"] */
    if v_co_status = "3" then
        
        SET v_error_code = "pubA.3.310.55";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("机构已注销","#",v_mysql_message);
        else
            SET v_error_info = "机构已注销";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_sys_config_str = v_sys_config_str;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_检查机构状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_CheckOperatorStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_base_CheckOperatorStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_co_status varchar(2),
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
    declare v_co_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_co_status varchar(2);

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
    SET v_co_status = p_co_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_co_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_机构信息表][{机构状态}][@临时_机构状态#][{机构编号}=@机构编号#][4][@机构编号#] */
    select co_status into v_tmp_co_status from db_pub.tb_base_co_info where co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.311.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    #机构状态检查

    /* [检查报错返回][@机构状态# = 0 and @临时_机构状态# = 《机构状态-冻结》][51][@机构编号#] */
    if v_co_status = 0 and v_tmp_co_status = "2" then
        
        SET v_error_code = "pubA.3.311.51";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构状态# = 0 and @临时_机构状态# = 《机构状态-注销》][52][@机构编号#] */
    if v_co_status = 0 and v_tmp_co_status = "3" then
        
        SET v_error_code = "pubA.3.311.52";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    #冻结机构检查

    /* [检查报错返回][@机构状态# = 《机构状态-冻结》 and @临时_机构状态# = 《机构状态-冻结》][51][@机构编号#] */
    if v_co_status = "2" and v_tmp_co_status = "2" then
        
        SET v_error_code = "pubA.3.311.51";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构状态# = 《机构状态-冻结》 and @临时_机构状态# = 《机构状态-注销》][52][@机构编号#] */
    if v_co_status = "2" and v_tmp_co_status = "3" then
        
        SET v_error_code = "pubA.3.311.52";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    #恢复机构检查

    /* [检查报错返回][@机构状态# = 《机构状态-正常》 and @临时_机构状态# = 《机构状态-正常》][53][@机构编号#] */
    if v_co_status = "1" and v_tmp_co_status = "1" then
        
        SET v_error_code = "pubA.3.311.53";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构状态# = 《机构状态-正常》 and @临时_机构状态# = 《机构状态-注销》][52][@机构编号#] */
    if v_co_status = "1" and v_tmp_co_status = "3" then
        
        SET v_error_code = "pubA.3.311.52";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    #注销机构检查

    /* [检查报错返回][@机构状态# = 《机构状态-注销》 and @临时_机构状态# = 《机构状态-冻结》][51][@机构编号#] */
    if v_co_status = "3" and v_tmp_co_status = "2" then
        
        SET v_error_code = "pubA.3.311.51";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构状态# = 《机构状态-注销》 and @临时_机构状态# = 《机构状态-注销》][52][@机构编号#] */
    if v_co_status = "3" and v_tmp_co_status = "3" then
        
        SET v_error_code = "pubA.3.311.52";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_获取系统配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_GetSysConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_base_GetSysConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_config_co_no int,
    IN p_config_no bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_config_value varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_config_co_no int;
    declare v_config_no bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_config_value varchar(2048);

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
    SET v_config_co_no = p_config_co_no;
    SET v_config_no = p_config_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_config_value = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_系统配置表][{配置值}][@配置值#][{机构编号} = @配置机构编号# and {配置编号} = @配置编号#][4][@配置机构编号#, @配置编号#] */
    select config_value into v_config_value from db_pub.tb_base_sys_config where co_no = v_config_co_no and config_no = v_config_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.312.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("配置机构编号=",v_config_co_no,","," 配置编号=", v_config_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("配置机构编号=",v_config_co_no,","," 配置编号=", v_config_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_config_value = v_config_value;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_检查机构状态返回业务控制配置串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_CheckOperatorStatusReturnBusiConfigStr;;
DELIMITER ;;
CREATE PROCEDURE pra_base_CheckOperatorStatusReturnBusiConfigStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_co_status varchar(2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_busi_config_str varchar(64)
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
    declare v_co_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_config_str varchar(64);
    declare v_tmp_co_status varchar(2);

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
    SET v_co_status = p_co_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_config_str = " ";
    SET v_tmp_co_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_机构信息表][{机构状态},{业务控制配置串}][@临时_机构状态#,@业务控制配置串#][{机构编号}=@机构编号#][4][@机构编号#] */
    select co_status,busi_config_str into v_tmp_co_status,v_busi_config_str from db_pub.tb_base_co_info where co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.313.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    #机构状态检查

    /* [检查报错返回][@机构状态# = 0 and @临时_机构状态# = 《机构状态-冻结》][51][@机构编号#] */
    if v_co_status = 0 and v_tmp_co_status = "2" then
        
        SET v_error_code = "pubA.3.313.51";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构状态# = 0 and @临时_机构状态# = 《机构状态-注销》][52][@机构编号#] */
    if v_co_status = 0 and v_tmp_co_status = "3" then
        
        SET v_error_code = "pubA.3.313.52";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    #冻结机构检查

    /* [检查报错返回][@机构状态# = 《机构状态-冻结》 and @临时_机构状态# = 《机构状态-冻结》][51][@机构编号#] */
    if v_co_status = "2" and v_tmp_co_status = "2" then
        
        SET v_error_code = "pubA.3.313.51";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构状态# = 《机构状态-冻结》 and @临时_机构状态# = 《机构状态-注销》][52][@机构编号#] */
    if v_co_status = "2" and v_tmp_co_status = "3" then
        
        SET v_error_code = "pubA.3.313.52";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    #恢复机构检查

    /* [检查报错返回][@机构状态# = 《机构状态-正常》 and @临时_机构状态# = 《机构状态-正常》][53][@机构编号#] */
    if v_co_status = "1" and v_tmp_co_status = "1" then
        
        SET v_error_code = "pubA.3.313.53";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构状态# = 《机构状态-正常》 and @临时_机构状态# = 《机构状态-注销》][52][@机构编号#] */
    if v_co_status = "1" and v_tmp_co_status = "3" then
        
        SET v_error_code = "pubA.3.313.52";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    #注销机构检查

    /* [检查报错返回][@机构状态# = 《机构状态-注销》 and @临时_机构状态# = 《机构状态-冻结》][51][@机构编号#] */
    if v_co_status = "3" and v_tmp_co_status = "2" then
        
        SET v_error_code = "pubA.3.313.51";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构状态# = 《机构状态-注销》 and @临时_机构状态# = 《机构状态-注销》][52][@机构编号#] */
    if v_co_status = "3" and v_tmp_co_status = "3" then
        
        SET v_error_code = "pubA.3.313.52";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_config_str = v_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_获取通道信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_GetChannelInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_GetChannelInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_name varchar(64);
    declare v_config_file varchar(255);
    declare v_pass_status varchar(2);
    declare v_pass_type int;
    declare v_bond_qty_unit_set int;

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_name = " ";
    SET v_config_file = " ";
    SET v_pass_status = "0";
    SET v_pass_type = 0;
    SET v_bond_qty_unit_set = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_通道信息表][{通道名称},{配置文件名},{通道状态},{通道类型},{债券数量单位配置}][@通道名称#,@配置文件名#,@通道状态#,@通道类型#,@债券数量单位配置#][{通道编号}=@通道编号#][4][@通道编号#] */
    select pass_name,config_file,pass_status,pass_type,bond_qty_unit_set into v_pass_name,v_config_file,v_pass_status,v_pass_type,v_bond_qty_unit_set from db_pub.tb_base_channel_info where pass_no=v_pass_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.314.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_获取系统指定上一交易日
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_GetSysPreTradeDate;;
DELIMITER ;;
CREATE PROCEDURE pra_base_GetSysPreTradeDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_fixed_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_fixed_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_no_exch_date_str varchar(2048);

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
    SET v_fixed_date = p_fixed_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_no_exch_date_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_系统信息表][{非交易日期串}][@非交易日期串#][1=1][1][@指定日期#] */
    select no_exch_date_str into v_no_exch_date_str from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.315.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指定日期=",v_fixed_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("指定日期=",v_fixed_date);
        end if;
        leave label_pro;
    end if;

    loop_label:loop

        /* if dayofweek(@指定日期#) <> 7 and dayofweek(@指定日期#) <> 1 and instr(@非交易日期串#, concat(";", @指定日期#, ";")) = 0 then */
        if dayofweek(v_fixed_date) <> 7 and dayofweek(v_fixed_date) <> 1 and instr(v_no_exch_date_str, concat(";", v_fixed_date, ";")) = 0 then
            leave loop_label;
        else

            /* set @指定日期# = date_format(date_sub(@指定日期#, interval 1 day), '%Y%m%d'); */
            set v_fixed_date = date_format(date_sub(v_fixed_date, interval 1 day), '%Y%m%d');
        end if;
    end loop;

    /* set @初始化日期# = @指定日期#; */
    set v_init_date = v_fixed_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_检查期货系统状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_CheckFutuSysStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_base_CheckFutuSysStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_sys_config_str varchar(64),
    OUT p_co_busi_config_str varchar(64),
    OUT p_co_comm_appr_oper int
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
    declare v_contrc_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_sys_config_str varchar(64);
    declare v_co_busi_config_str varchar(64);
    declare v_co_comm_appr_oper int;
    declare v_sys_status varchar(2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_co_no int;
    declare v_co_name varchar(64);
    declare v_co_flname varchar(255);
    declare v_co_type int;
    declare v_reg_code varchar(16);
    declare v_reg_addr varchar(32);
    declare v_found_date int;
    declare v_reg_date int;
    declare v_conta_addr varchar(255);
    declare v_conta_name varchar(64);
    declare v_phone_number varchar(16);
    declare v_email varchar(255);
    declare v_pd_qty_max int;
    declare v_max_acco_count int;
    declare v_opor_qty_max int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_config_str varchar(64);
    declare v_comm_appr_oper int;
    declare v_market_price_ratio decimal(18,12);
    declare v_mul_acco_trd_assign_set varchar(64);
    declare v_mul_acco_trd_choice int;
    declare v_mul_acco_trd_qty_set varchar(64);
    declare v_genus_algo_strategy_set varchar(64);
    declare v_base_crncy_type varchar(3);
    declare v_co_status varchar(2);

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
    SET v_contrc_type = p_contrc_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_sys_config_str = " ";
    SET v_co_busi_config_str = " ";
    SET v_co_comm_appr_oper = 0;
    SET v_sys_status = "0";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_co_no = 0;
    SET v_co_name = " ";
    SET v_co_flname = " ";
    SET v_co_type = 0;
    SET v_reg_code = " ";
    SET v_reg_addr = " ";
    SET v_found_date = date_format(curdate(),'%Y%m%d');
    SET v_reg_date = date_format(curdate(),'%Y%m%d');
    SET v_conta_addr = " ";
    SET v_conta_name = " ";
    SET v_phone_number = " ";
    SET v_email = " ";
    SET v_pd_qty_max = 0;
    SET v_max_acco_count = 0;
    SET v_opor_qty_max = 0;
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_busi_config_str = " ";
    SET v_comm_appr_oper = 0;
    SET v_market_price_ratio = 0;
    SET v_mul_acco_trd_assign_set = " ";
    SET v_mul_acco_trd_choice = 0;
    SET v_mul_acco_trd_qty_set = " ";
    SET v_genus_algo_strategy_set = " ";
    SET v_base_crncy_type = "CNY";
    SET v_co_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_系统信息表][{系统状态},{初始化日期},{系统控制配置串}][@系统状态#,@初始化日期#,@系统控制配置串#][1=1][4][" "] */
    select sys_status,init_date,sys_config_str into v_sys_status,v_init_date,v_sys_config_str from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.316.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@系统状态# = 《系统状态-停止》][6][@系统状态#] */
    if v_sys_status = "2" then
        
        SET v_error_code = "pubA.3.316.6";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("系统状态=",v_sys_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("系统状态=",v_sys_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@系统状态# = 《系统状态-维护》][7]["系统维护中"] */
    if v_sys_status = "3" then
        
        SET v_error_code = "pubA.3.316.7";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("系统维护中","#",v_mysql_message);
        else
            SET v_error_info = "系统维护中";
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_基础_机构信息表][字段][字段变量][{机构编号}=@操作员机构编号#][4][@操作员机构编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        co_name, co_flname, co_type, reg_code, 
        reg_addr, found_date, reg_date, conta_addr, 
        conta_name, phone_number, email, pd_qty_max, 
        max_acco_count, opor_qty_max, allow_exch, allow_stock_type, 
        busi_config_str, comm_appr_oper, market_price_ratio, mul_acco_trd_assign_set, 
        mul_acco_trd_choice, mul_acco_trd_qty_set, genus_algo_strategy_set, base_crncy_type, 
        co_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_co_name, v_co_flname, v_co_type, v_reg_code, 
        v_reg_addr, v_found_date, v_reg_date, v_conta_addr, 
        v_conta_name, v_phone_number, v_email, v_pd_qty_max, 
        v_max_acco_count, v_opor_qty_max, v_allow_exch, v_allow_stock_type, 
        v_busi_config_str, v_comm_appr_oper, v_market_price_ratio, v_mul_acco_trd_assign_set, 
        v_mul_acco_trd_choice, v_mul_acco_trd_qty_set, v_genus_algo_strategy_set, v_base_crncy_type, 
        v_co_status from db_pub.tb_base_co_info where co_no=v_opor_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.3.316.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员机构编号=",v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员机构编号=",v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构状态# = 《机构状态-冻结》][54]["机构已冻结"] */
    if v_co_status = "2" then
        
        SET v_error_code = "pubA.3.316.54";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("机构已冻结","#",v_mysql_message);
        else
            SET v_error_info = "机构已冻结";
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构状态# = 《机构状态-注销》][55]["机构已注销"] */
    if v_co_status = "3" then
        
        SET v_error_code = "pubA.3.316.55";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("机构已注销","#",v_mysql_message);
        else
            SET v_error_info = "机构已注销";
        end if;
        leave label_pro;
    end if;

    #检查机构级业务限制
    #如果传入的市场编号有值，检查是否可操作

    /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][56][@市场编号#,@允许投资市场#] */
    if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
        
        SET v_error_code = "pubA.3.316.56";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
        end if;
        leave label_pro;
    end if;

    #如果传入的证券类型有值，检查是否可操作

    /* [检查报错返回][@合约类型# <> 0 and instr(@允许操作证券类型#, @合约类型#) = 0][57][@合约类型#,@允许操作证券类型#] */
    if v_contrc_type <> 0 and instr(v_allow_stock_type, v_contrc_type) = 0 then
        
        SET v_error_code = "pubA.3.316.57";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约类型=",v_contrc_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约类型=",v_contrc_type,",","允许操作证券类型=",v_allow_stock_type);
        end if;
        leave label_pro;
    end if;


    /* set @机构业务控制配置串# = @业务控制配置串#; */
    set v_co_busi_config_str = v_busi_config_str;

    /* set @机构指令审批操作员# = @指令审批操作员#; */
    set v_co_comm_appr_oper = v_comm_appr_oper;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_sys_config_str = v_sys_config_str;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_co_comm_appr_oper = v_co_comm_appr_oper;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础_查询通道报盘信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_base_QueryChanneReportlInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_base_QueryChanneReportlInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_pass_type int,
    IN p_pass_status varchar(2),
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
    declare v_pass_no int;
    declare v_pass_type int;
    declare v_pass_status varchar(2);
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
    SET v_pass_no = p_pass_no;
    SET v_pass_type = p_pass_type;
    SET v_pass_status = p_pass_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_基础_通道报盘信息表][字段][(@通道编号#=0 or {通道编号}=@通道编号#) and (@通道类型#=0 or {通道类型}=@通道类型#) and (@通道状态#=" " or {通道状态}=@通道状态#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, pass_no, 
        pass_name, pass_type, pass_status, trans_name, 
        trans_node_name, trans_create_date, trans_server_name, trans_server_ip, 
        trans_server_port, remark_info from db_pub.tb_base_channel_transfer_info where (v_pass_no=0 or pass_no=v_pass_no) and (v_pass_type=0 or pass_type=v_pass_type) and (v_pass_status=" " or pass_status=v_pass_status) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, pass_no, 
        pass_name, pass_type, pass_status, trans_name, 
        trans_node_name, trans_create_date, trans_server_name, trans_server_ip, 
        trans_server_port, remark_info from db_pub.tb_base_channel_transfer_info where (v_pass_no=0 or pass_no=v_pass_no) and (v_pass_type=0 or pass_type=v_pass_type) and (v_pass_status=" " or pass_status=v_pass_status) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


