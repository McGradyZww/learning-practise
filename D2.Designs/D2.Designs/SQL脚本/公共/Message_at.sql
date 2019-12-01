DELIMITER ;;
use db_pub;;

# 原子_公共_消息_更新对象版本信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_UpdateObjectVerInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_UpdateObjectVerInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_object_zh_name varchar(32),
    IN p_object_en_name varchar(32),
    IN p_object_type int,
    IN p_main_ver_no int,
    IN p_second_ver_no int,
    IN p_rele_ver_no int,
    IN p_ver_date int,
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
    declare v_init_date int;
    declare v_object_zh_name varchar(32);
    declare v_object_en_name varchar(32);
    declare v_object_type int;
    declare v_main_ver_no int;
    declare v_second_ver_no int;
    declare v_rele_ver_no int;
    declare v_ver_date int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_row_id bigint;
    declare v_jour_after_occur_info varchar(2048);
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
    SET v_object_zh_name = p_object_zh_name;
    SET v_object_en_name = p_object_en_name;
    SET v_object_type = p_object_type;
    SET v_main_ver_no = p_main_ver_no;
    SET v_second_ver_no = p_second_ver_no;
    SET v_rele_ver_no = p_rele_ver_no;
    SET v_ver_date = p_ver_date;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "对象中文名", "|", "对象英文名", "|", "对象类型", "|", "主版本号", "|", "次版本号", "|", "发行版本号", "|", "版本日期", "|", "备注信息", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_object_zh_name, "|", v_object_en_name, "|", v_object_type, "|", v_main_ver_no, "|", v_second_ver_no, "|", v_rele_ver_no, "|", v_ver_date, "|", v_remark_info, "|");


    /* [插入重复更新][公共_消息_对象版本信息表][字段][字段变量][{对象英文名} = @对象英文名#, {对象类型} = @对象类型#, {主版本号} = @主版本号#, {次版本号} = @次版本号#, {发行版本号} = @发行版本号#, {版本日期} = @版本日期#, {备注信息} = @备注信息#][1][@对象中文名#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_msage_object_ver (
        create_date, create_time, update_date, 
        update_time, update_times, object_zh_name, object_en_name, 
        object_type, main_ver_no, second_ver_no, rele_ver_no, 
        ver_date, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_object_zh_name, v_object_en_name, 
        v_object_type, v_main_ver_no, v_second_ver_no, v_rele_ver_no, 
        v_ver_date, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, object_en_name = v_object_en_name, object_type = v_object_type, main_ver_no = v_main_ver_no, second_ver_no = v_second_ver_no, rele_ver_no = v_rele_ver_no, ver_date = v_ver_date, remark_info = v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.11.1.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("对象中文名=",v_object_zh_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("对象中文名=",v_object_zh_name);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_消息_对象版本信息表][字段][字段变量][{对象中文名} = @对象中文名#][4][@对象中文名#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, object_zh_name, 
        object_en_name, object_type, main_ver_no, second_ver_no, 
        rele_ver_no, ver_date, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_object_zh_name, 
        v_object_en_name, v_object_type, v_main_ver_no, v_second_ver_no, 
        v_rele_ver_no, v_ver_date, v_remark_info from db_pub.tb_msage_object_ver where object_zh_name = v_object_zh_name limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.11.1.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("对象中文名=",v_object_zh_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("对象中文名=",v_object_zh_name);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_object_zh_name, "|", v_object_en_name, "|", v_object_type, "|", v_main_ver_no, "|", v_second_ver_no, "|", v_rele_ver_no, "|", v_ver_date, "|", v_remark_info, "|");


    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_消息_对象版本信息流水表][字段][字段变量][5][@对象中文名#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_msage_object_ver_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, object_zh_name, jour_occur_field, 
        jour_occur_info, jour_after_occur_info, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_object_zh_name, v_jour_occur_field, 
        v_jour_occur_info, v_jour_after_occur_info, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.11.1.5";
        SET v_error_info =  CONCAT(concat("对象中文名=",v_object_zh_name),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_消息_查询对象版本信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_QueryObjectVerInfoJour;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_QueryObjectVerInfoJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_object_zh_name varchar(32),
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
    declare v_object_zh_name varchar(32);
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
    SET v_object_zh_name = p_object_zh_name;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_消息_对象版本信息流水表][字段][{初始化日期} = @初始化日期# and (@对象中文名# = " " or {对象中文名} = @对象中文名#) and {记录序号} > @记录序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, object_zh_name, 
        jour_occur_field, jour_occur_info, jour_after_occur_info, remark_info from db_pub.tb_msage_object_ver_jour where init_date = v_init_date and (v_object_zh_name = " " or object_zh_name = v_object_zh_name) and row_id > v_row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, object_zh_name, 
        jour_occur_field, jour_occur_info, jour_after_occur_info, remark_info from db_pub.tb_msage_object_ver_jour where init_date = v_init_date and (v_object_zh_name = " " or object_zh_name = v_object_zh_name) and row_id > v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_消息_查询历史对象版本信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_QueryObjectVerInfoJourHis;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_QueryObjectVerInfoJourHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_object_zh_name varchar(32),
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
    declare v_object_zh_name varchar(32);
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
    SET v_object_zh_name = p_object_zh_name;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_消息_对象版本信息流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@对象中文名# = " " or {对象中文名} = @对象中文名#) and {记录序号} > @记录序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, object_zh_name, 
        jour_occur_field, jour_occur_info, jour_after_occur_info, remark_info from db_pub_his.tb_msage_object_ver_jour_his where (init_date between v_begin_date and v_end_date) and (v_object_zh_name = " " or object_zh_name = v_object_zh_name) and row_id > v_row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, object_zh_name, 
        jour_occur_field, jour_occur_info, jour_after_occur_info, remark_info from db_pub_his.tb_msage_object_ver_jour_his where (init_date between v_begin_date and v_end_date) and (v_object_zh_name = " " or object_zh_name = v_object_zh_name) and row_id > v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_消息_更新计划任务信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_UpdateTask;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_UpdateTask(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_task_no int,
    IN p_task_name varchar(64),
    IN p_depend_task_no int,
    IN p_task_order varchar(16),
    IN p_task_strike_status varchar(2),
    IN p_task_strike_rule varchar(64),
    IN p_exec_pro varchar(64),
    IN p_busi_menu_no int,
    IN p_busi_func_code varchar(16),
    IN p_exec_count int,
    IN p_task_status varchar(2),
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
    declare v_init_date int;
    declare v_task_no int;
    declare v_task_name varchar(64);
    declare v_depend_task_no int;
    declare v_task_order varchar(16);
    declare v_task_strike_status varchar(2);
    declare v_task_strike_rule varchar(64);
    declare v_exec_pro varchar(64);
    declare v_busi_menu_no int;
    declare v_busi_func_code varchar(16);
    declare v_exec_count int;
    declare v_task_status varchar(2);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_exec_date int;
    declare v_exec_time int;
    declare v_comple_date int;
    declare v_comple_time int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_row_id bigint;
    declare v_jour_after_occur_info varchar(2048);
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
    SET v_task_no = p_task_no;
    SET v_task_name = p_task_name;
    SET v_depend_task_no = p_depend_task_no;
    SET v_task_order = p_task_order;
    SET v_task_strike_status = p_task_strike_status;
    SET v_task_strike_rule = p_task_strike_rule;
    SET v_exec_pro = p_exec_pro;
    SET v_busi_menu_no = p_busi_menu_no;
    SET v_busi_func_code = p_busi_func_code;
    SET v_exec_count = p_exec_count;
    SET v_task_status = p_task_status;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_exec_date = 0;
    SET v_exec_time = 0;
    SET v_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comple_time = date_format(curtime(),'%H%i%s');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "任务编号", "|", "任务名称", "|", "依赖任务编号", "|", "任务排序", "|", "任务执行状态", "|", "任务执行规则", "|", "执行过程", "|", "业务菜单编号", "|", "业务功能编码", "|", "执行次数", "|", "任务状态", "|", "备注信息", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_task_no, "|", v_task_name, "|", v_depend_task_no, "|", v_task_order, "|", v_task_strike_status, "|", v_task_strike_rule, "|", v_exec_pro, "|", v_busi_menu_no, "|", v_busi_func_code, "|", v_exec_count, "|", v_task_status, "|", v_remark_info, "|");


    /* set @执行日期# = 0; */
    set v_exec_date = 0;

    /* set @执行时间# = 0; */
    set v_exec_time = 0;

    /* set @完成日期# = 0; */
    set v_comple_date = 0;

    /* set @完成时间# = 0; */
    set v_comple_time = 0;

    /* [插入重复更新][公共_消息_计划任务信息表][字段][字段变量][{任务名称}=@任务名称#,{依赖任务编号}=@依赖任务编号#,{任务排序}=@任务排序#,{任务执行状态}=@任务执行状态#,{任务执行规则}=@任务执行规则#,{执行过程}=@执行过程#,{业务菜单编号}=@业务菜单编号#,{业务功能编码}=@业务功能编码#,{执行次数}=@执行次数#,{任务状态}=@任务状态#][1][@任务编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_msage_task (
        create_date, create_time, update_date, 
        update_time, update_times, task_no, task_name, 
        depend_task_no, task_order, task_strike_status, task_strike_rule, 
        exec_pro, busi_menu_no, busi_func_code, exec_date, 
        exec_time, comple_date, comple_time, exec_count, 
        task_status, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_task_no, v_task_name, 
        v_depend_task_no, v_task_order, v_task_strike_status, v_task_strike_rule, 
        v_exec_pro, v_busi_menu_no, v_busi_func_code, v_exec_date, 
        v_exec_time, v_comple_date, v_comple_time, v_exec_count, 
        v_task_status, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, task_name=v_task_name,depend_task_no=v_depend_task_no,task_order=v_task_order,task_strike_status=v_task_strike_status,task_strike_rule=v_task_strike_rule,exec_pro=v_exec_pro,busi_menu_no=v_busi_menu_no,busi_func_code=v_busi_func_code,exec_count=v_exec_count,task_status=v_task_status;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.11.6.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("任务编号=",v_task_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("任务编号=",v_task_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_消息_计划任务信息表][字段][字段变量][{任务编号}=@任务编号#][4][@任务编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, task_no, 
        task_name, depend_task_no, task_order, task_strike_status, 
        task_strike_rule, exec_pro, busi_menu_no, busi_func_code, 
        exec_date, exec_time, comple_date, comple_time, 
        exec_count, task_status, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_task_no, 
        v_task_name, v_depend_task_no, v_task_order, v_task_strike_status, 
        v_task_strike_rule, v_exec_pro, v_busi_menu_no, v_busi_func_code, 
        v_exec_date, v_exec_time, v_comple_date, v_comple_time, 
        v_exec_count, v_task_status, v_remark_info from db_pub.tb_msage_task where task_no=v_task_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.11.6.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("任务编号=",v_task_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("任务编号=",v_task_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_task_no, "|", v_task_name, "|", v_depend_task_no, "|", v_task_order, "|", v_task_strike_status, "|", v_task_strike_rule, "|", v_exec_pro, "|", v_busi_menu_no, "|", v_busi_func_code, "|", v_exec_count, "|", v_task_status, "|", v_remark_info, "|");


    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_消息_计划任务信息流水表][字段][字段变量][5][@任务编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_msage_task_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, task_no, jour_occur_field, 
        jour_occur_info, jour_after_occur_info, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_task_no, v_jour_occur_field, 
        v_jour_occur_info, v_jour_after_occur_info, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.11.6.5";
        SET v_error_info =  CONCAT(concat("任务编号=",v_task_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_消息_查询计划任务信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_QueryTask;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_QueryTask(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_task_no int,
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
    declare v_task_no int;
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
    SET v_task_no = p_task_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_消息_计划任务信息表][字段][(@任务编号# = 0 or {任务编号} = @任务编号#) and {记录序号} > @记录序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, task_no, 
        task_name, depend_task_no, task_order, task_strike_status, 
        task_strike_rule, exec_pro, busi_menu_no, busi_func_code, 
        exec_date, exec_time, comple_date, comple_time, 
        exec_count, task_status, remark_info from db_pub.tb_msage_task where (v_task_no = 0 or task_no = v_task_no) and row_id > v_row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, task_no, 
        task_name, depend_task_no, task_order, task_strike_status, 
        task_strike_rule, exec_pro, busi_menu_no, busi_func_code, 
        exec_date, exec_time, comple_date, comple_time, 
        exec_count, task_status, remark_info from db_pub.tb_msage_task where (v_task_no = 0 or task_no = v_task_no) and row_id > v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_消息_更新计划任务扩展信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_UpdateTaskEx;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_UpdateTaskEx(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_task_no int,
    IN p_task_name varchar(64),
    IN p_depend_task_no int,
    IN p_task_order varchar(16),
    IN p_task_strike_status varchar(2),
    IN p_task_strike_rule varchar(64),
    IN p_exec_pro varchar(64),
    IN p_busi_menu_no int,
    IN p_busi_func_code varchar(16),
    IN p_exec_count int,
    IN p_task_status varchar(2),
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
    declare v_init_date int;
    declare v_task_no int;
    declare v_task_name varchar(64);
    declare v_depend_task_no int;
    declare v_task_order varchar(16);
    declare v_task_strike_status varchar(2);
    declare v_task_strike_rule varchar(64);
    declare v_exec_pro varchar(64);
    declare v_busi_menu_no int;
    declare v_busi_func_code varchar(16);
    declare v_exec_count int;
    declare v_task_status varchar(2);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_exec_date int;
    declare v_exec_time int;
    declare v_comple_date int;
    declare v_comple_time int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_row_id bigint;
    declare v_jour_after_occur_info varchar(2048);
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
    SET v_task_no = p_task_no;
    SET v_task_name = p_task_name;
    SET v_depend_task_no = p_depend_task_no;
    SET v_task_order = p_task_order;
    SET v_task_strike_status = p_task_strike_status;
    SET v_task_strike_rule = p_task_strike_rule;
    SET v_exec_pro = p_exec_pro;
    SET v_busi_menu_no = p_busi_menu_no;
    SET v_busi_func_code = p_busi_func_code;
    SET v_exec_count = p_exec_count;
    SET v_task_status = p_task_status;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_exec_date = 0;
    SET v_exec_time = 0;
    SET v_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comple_time = date_format(curtime(),'%H%i%s');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "任务编号", "|", "任务名称", "|", "依赖任务编号", "|", "任务排序", "|", "任务执行状态", "|", "任务执行规则", "|", "执行过程", "|", "业务菜单编号", "|", "业务功能编码", "|", "执行次数", "|", "任务状态", "|", "备注信息", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_task_no, "|", v_task_name, "|", v_depend_task_no, "|", v_task_order, "|", v_task_strike_status, "|", v_task_strike_rule, "|", v_exec_pro, "|", v_busi_menu_no, "|", v_busi_func_code, "|", v_exec_count, "|", v_task_status, "|", v_remark_info, "|");


    /* set @执行日期# = 0; */
    set v_exec_date = 0;

    /* set @执行时间# = 0; */
    set v_exec_time = 0;

    /* set @完成日期# = 0; */
    set v_comple_date = 0;

    /* set @完成时间# = 0; */
    set v_comple_time = 0;

    /* [插入重复更新][公共_消息_计划任务扩展信息表][字段][字段变量][{任务名称}=@任务名称#,{依赖任务编号}=@依赖任务编号#,{任务排序}=@任务排序#,{任务执行状态}=@任务执行状态#,{任务执行规则}=@任务执行规则#,{执行过程}=@执行过程#,{业务菜单编号}=@业务菜单编号#,{业务功能编码}=@业务功能编码#,{执行次数}=@执行次数#,{任务状态}=@任务状态#][1][@任务编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_msage_task_ex (
        create_date, create_time, update_date, 
        update_time, update_times, task_no, task_name, 
        depend_task_no, task_strike_status, task_strike_rule, task_order, 
        exec_pro, busi_menu_no, busi_func_code, exec_date, 
        exec_time, comple_date, comple_time, exec_count, 
        task_status, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_task_no, v_task_name, 
        v_depend_task_no, v_task_strike_status, v_task_strike_rule, v_task_order, 
        v_exec_pro, v_busi_menu_no, v_busi_func_code, v_exec_date, 
        v_exec_time, v_comple_date, v_comple_time, v_exec_count, 
        v_task_status, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, task_name=v_task_name,depend_task_no=v_depend_task_no,task_order=v_task_order,task_strike_status=v_task_strike_status,task_strike_rule=v_task_strike_rule,exec_pro=v_exec_pro,busi_menu_no=v_busi_menu_no,busi_func_code=v_busi_func_code,exec_count=v_exec_count,task_status=v_task_status;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.11.11.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("任务编号=",v_task_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("任务编号=",v_task_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_消息_计划任务扩展信息表][字段][字段变量][{任务编号}=@任务编号#][4][@任务编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, task_no, 
        task_name, depend_task_no, task_strike_status, task_strike_rule, 
        task_order, exec_pro, busi_menu_no, busi_func_code, 
        exec_date, exec_time, comple_date, comple_time, 
        exec_count, task_status, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_task_no, 
        v_task_name, v_depend_task_no, v_task_strike_status, v_task_strike_rule, 
        v_task_order, v_exec_pro, v_busi_menu_no, v_busi_func_code, 
        v_exec_date, v_exec_time, v_comple_date, v_comple_time, 
        v_exec_count, v_task_status, v_remark_info from db_pub.tb_msage_task_ex where task_no=v_task_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.11.11.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("任务编号=",v_task_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("任务编号=",v_task_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_task_no, "|", v_task_name, "|", v_depend_task_no, "|", v_task_order, "|", v_task_strike_status, "|", v_task_strike_rule, "|", v_exec_pro, "|", v_busi_menu_no, "|", v_busi_func_code, "|", v_exec_count, "|", v_task_status, "|", v_remark_info, "|");


    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_消息_计划任务扩展信息流水表][字段][字段变量][5][@任务编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_msage_task_ex_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, task_no, jour_occur_field, 
        jour_occur_info, jour_after_occur_info, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_task_no, v_jour_occur_field, 
        v_jour_occur_info, v_jour_after_occur_info, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.11.11.5";
        SET v_error_info =  CONCAT(concat("任务编号=",v_task_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_消息_查询计划任务扩展信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_QueryTaskEx;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_QueryTaskEx(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_task_no int,
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
    declare v_task_no int;
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
    SET v_task_no = p_task_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_消息_计划任务扩展信息表][字段][(@任务编号# = 0 or {任务编号} = @任务编号#) and {记录序号} > @记录序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, task_no, 
        task_name, depend_task_no, task_strike_status, task_strike_rule, 
        task_order, exec_pro, busi_menu_no, busi_func_code, 
        exec_date, exec_time, comple_date, comple_time, 
        exec_count, task_status, remark_info from db_pub.tb_msage_task_ex where (v_task_no = 0 or task_no = v_task_no) and row_id > v_row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, task_no, 
        task_name, depend_task_no, task_strike_status, task_strike_rule, 
        task_order, exec_pro, busi_menu_no, busi_func_code, 
        exec_date, exec_time, comple_date, comple_time, 
        exec_count, task_status, remark_info from db_pub.tb_msage_task_ex where (v_task_no = 0 or task_no = v_task_no) and row_id > v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_消息_查询操作日志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_QueryOperLog;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_QueryOperLog(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_query_opor_no int,
    IN p_co_no int,
    IN p_query_menu_no int,
    IN p_query_func_code varchar(16),
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
    declare v_query_opor_no int;
    declare v_co_no int;
    declare v_query_menu_no int;
    declare v_query_func_code varchar(16);
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_co_no = p_co_no;
    SET v_query_menu_no = p_query_menu_no;
    SET v_query_func_code = p_query_func_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @机构编号# = 9999  then */
    if v_co_no = 9999  then

         /* set @机构编号# = 0; */
         set v_co_no = 0;
    end if;

    /* [获取表记录][公共_消息_操作日志表][{记录序号},{初始化日期},{操作员机构编号},{操作员编号},{操作方式},{操作IP},{操作MAC},{日志级别},{目标菜单编号},{目标功能编码},{操作标志},{日志错误编码} as {错误编码},{日志错误信息} as {错误信息}][{初始化日期} <= @初始化日期# and (@查询操作员编号# = 0 or {操作员编号} = @查询操作员编号#) and (@机构编号# = 0 or {操作员机构编号} = @机构编号#) and (@查询菜单编号# = 0 or {目标菜单编号} = @查询菜单编号#) and (@查询功能编码# = " " or {目标功能编码} = @查询功能编码#) and {记录序号} > @记录序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id,init_date,opor_co_no,opor_no,oper_way,oper_ip_addr,oper_mac,log_level,target_menu_no,target_func_code,oper_mark,log_error_code as error_code,log_error_info as error_info from db_pub.tb_msage_oper_log where init_date <= v_init_date and (v_query_opor_no = 0 or opor_no = v_query_opor_no) and (v_co_no = 0 or opor_co_no = v_co_no) and (v_query_menu_no = 0 or target_menu_no = v_query_menu_no) and (v_query_func_code = " " or target_func_code = v_query_func_code) and row_id > v_row_id;
    else
        select row_id,init_date,opor_co_no,opor_no,oper_way,oper_ip_addr,oper_mac,log_level,target_menu_no,target_func_code,oper_mark,log_error_code as error_code,log_error_info as error_info from db_pub.tb_msage_oper_log where init_date <= v_init_date and (v_query_opor_no = 0 or opor_no = v_query_opor_no) and (v_co_no = 0 or opor_co_no = v_co_no) and (v_query_menu_no = 0 or target_menu_no = v_query_menu_no) and (v_query_func_code = " " or target_func_code = v_query_func_code) and row_id > v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_消息_查询历史操作日志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_QueryOperLogHis;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_QueryOperLogHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_query_opor_no int,
    IN p_co_no int,
    IN p_query_menu_no int,
    IN p_query_func_code varchar(16),
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
    declare v_query_opor_no int;
    declare v_co_no int;
    declare v_query_menu_no int;
    declare v_query_func_code varchar(16);
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_co_no = p_co_no;
    SET v_query_menu_no = p_query_menu_no;
    SET v_query_func_code = p_query_func_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @机构编号# = 9999  then */
    if v_co_no = 9999  then

         /* set @机构编号# = 0; */
         set v_co_no = 0;
    end if;
    #[获取表记录][历史_公共_消息_操作日志表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@查询操作员编号# = 0 or {操作员编号} = @查询操作员编号#) and (@机构编号# = 0 or {操作员机构编号} = @机构编号#) and (@查询菜单编号# = 0 or {目标菜单编号} = @查询菜单编号#) and (@查询功能编码# = " " or {目标功能编码} = @查询功能编码#) and {记录序号} > @记录序号#][@指定行数#]

    /* [获取表记录][历史_公共_消息_操作日志表][{记录序号},{初始化日期},{操作员机构编号},{操作员编号},{操作方式},{操作IP},{操作MAC},{日志级别},{目标菜单编号},{目标功能编码},{操作标志},{日志错误编码} as {错误编码},{日志错误信息} as {错误信息}][({初始化日期} between @开始日期# and @结束日期#) and (@查询操作员编号# = 0 or {操作员编号} = @查询操作员编号#) and (@机构编号# = 0 or {操作员机构编号} = @机构编号#) and (@查询菜单编号# = 0 or {目标菜单编号} = @查询菜单编号#) and (@查询功能编码# = " " or {目标功能编码} = @查询功能编码#) and {记录序号} > @记录序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id,init_date,opor_co_no,opor_no,oper_way,oper_ip_addr,oper_mac,log_level,target_menu_no,target_func_code,oper_mark,log_error_code as error_code,log_error_info as error_info from db_pub_his.tb_msage_oper_log_his where (init_date between v_begin_date and v_end_date) and (v_query_opor_no = 0 or opor_no = v_query_opor_no) and (v_co_no = 0 or opor_co_no = v_co_no) and (v_query_menu_no = 0 or target_menu_no = v_query_menu_no) and (v_query_func_code = " " or target_func_code = v_query_func_code) and row_id > v_row_id;
    else
        select row_id,init_date,opor_co_no,opor_no,oper_way,oper_ip_addr,oper_mac,log_level,target_menu_no,target_func_code,oper_mark,log_error_code as error_code,log_error_info as error_info from db_pub_his.tb_msage_oper_log_his where (init_date between v_begin_date and v_end_date) and (v_query_opor_no = 0 or opor_no = v_query_opor_no) and (v_co_no = 0 or opor_co_no = v_co_no) and (v_query_menu_no = 0 or target_menu_no = v_query_menu_no) and (v_query_func_code = " " or target_func_code = v_query_func_code) and row_id > v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_消息_归档公共消息数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_BackUpMsageData;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_BackUpMsageData(
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
    

    /* [数据归历史][公共_消息_对象版本信息流水表][字段][{初始化日期}<=@初始化日期#][301][@初始化日期#] */
    insert into db_pub_his.tb_msage_object_ver_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, object_zh_name, 
        jour_occur_field, jour_occur_info, jour_after_occur_info, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, object_zh_name, 
        jour_occur_field, jour_occur_info, jour_after_occur_info, remark_info 
        from db_pub.tb_msage_object_ver_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.11.23.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_消息_对象版本信息流水表][{初始化日期}<=@初始化日期#][302][@初始化日期#] */
    delete from db_pub.tb_msage_object_ver_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.11.23.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_消息_计划任务信息流水表][字段][{初始化日期}<=@初始化日期#][301][@初始化日期#] */
    insert into db_pub_his.tb_msage_task_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, task_no, 
        jour_occur_field, jour_occur_info, jour_after_occur_info, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, task_no, 
        jour_occur_field, jour_occur_info, jour_after_occur_info, remark_info 
        from db_pub.tb_msage_task_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.11.23.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_消息_计划任务信息流水表][{初始化日期}<=@初始化日期#][302][@初始化日期#] */
    delete from db_pub.tb_msage_task_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.11.23.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_消息_计划任务执行日志表][字段][{执行日期}<=@初始化日期#][301][@初始化日期#] */
    insert into db_pub_his.tb_msage_task_exec_log_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, task_no, 
        task_name, task_strike_status, exec_pro, exec_date, 
        exec_time, comple_date, comple_time, exec_count, 
        remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, task_no, 
        task_name, task_strike_status, exec_pro, exec_date, 
        exec_time, comple_date, comple_time, exec_count, 
        remark_info 
        from db_pub.tb_msage_task_exec_log 
        where exec_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.11.23.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_消息_计划任务执行日志表][{执行日期}<=@初始化日期#][302][@初始化日期#] */
    delete from db_pub.tb_msage_task_exec_log 
        where exec_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.11.23.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_消息_计划任务扩展信息流水表][字段][{初始化日期}<=@初始化日期#][301][@初始化日期#] */
    insert into db_pub_his.tb_msage_task_ex_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, task_no, 
        jour_occur_field, jour_occur_info, jour_after_occur_info, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, task_no, 
        jour_occur_field, jour_occur_info, jour_after_occur_info, remark_info 
        from db_pub.tb_msage_task_ex_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.11.23.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_消息_计划任务扩展信息流水表][{初始化日期}<=@初始化日期#][302][@初始化日期#] */
    delete from db_pub.tb_msage_task_ex_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.11.23.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_消息_计划任务扩展执行日志表][字段][{执行日期}<=@初始化日期#][301][@初始化日期#] */
    insert into db_pub_his.tb_msage_task_ex_exec_log_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, task_no, 
        task_name, task_strike_status, exec_pro, exec_date, 
        exec_time, comple_date, comple_time, exec_count, 
        remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, task_no, 
        task_name, task_strike_status, exec_pro, exec_date, 
        exec_time, comple_date, comple_time, exec_count, 
        remark_info 
        from db_pub.tb_msage_task_ex_exec_log 
        where exec_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.11.23.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_消息_计划任务扩展执行日志表][{执行日期}<=@初始化日期#][302][@初始化日期#] */
    delete from db_pub.tb_msage_task_ex_exec_log 
        where exec_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.11.23.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_消息_操作日志表][字段][{初始化日期}<=@初始化日期#][301][@初始化日期#] */
    insert into db_pub_his.tb_msage_oper_log_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_co_no, opor_no, oper_way, oper_ip_addr, 
        oper_mac, log_level, target_menu_no, target_func_code, 
        oper_mark, log_error_code, log_error_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_co_no, opor_no, oper_way, oper_ip_addr, 
        oper_mac, log_level, target_menu_no, target_func_code, 
        oper_mark, log_error_code, log_error_info 
        from db_pub.tb_msage_oper_log 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.11.23.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_消息_操作日志表][{初始化日期}<=@初始化日期#][302][@初始化日期#] */
    delete from db_pub.tb_msage_oper_log 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.11.23.302";
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

# 原子_公共_消息_开始计划任务
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_CheckTaskStart;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_CheckTaskStart(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_task_no int,
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
    declare v_task_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exec_date int;
    declare v_exec_time int;
    declare v_task_strike_status varchar(2);
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
    SET v_task_no = p_task_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exec_date = 0;
    SET v_exec_time = 0;
    SET v_task_strike_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器日期][@执行日期#] */
    select date_format(curdate(),'%Y%m%d') into v_exec_date;


    /* [获取机器时间][@执行时间#] */
    select date_format(curtime(),'%H%i%s') into v_exec_time;


    /* set @任务执行状态# = 《任务执行状态-正在执行》; */
    set v_task_strike_status = "1";

    /* [更新表记录][公共_消息_计划任务信息表][{任务执行状态} =《任务执行状态-正在执行》, {执行次数} = {执行次数} + 1, {执行日期} = @执行日期#, {执行时间} = @执行时间#][{任务编号}= @任务编号#][2][@任务编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_msage_task set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, task_strike_status ="1", exec_count = exec_count + 1, exec_date = v_exec_date, exec_time = v_exec_time where task_no= v_task_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.11.81.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("任务编号=",v_task_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("任务编号=",v_task_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_消息_完成计划任务
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_CompleteTask;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_CompleteTask(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_task_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_task_strike_status varchar(2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_task_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_task_strike_status varchar(2);
    declare v_comple_date int;
    declare v_comple_time int;
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
    SET v_task_no = p_task_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_task_strike_status = "0";
    SET v_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comple_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [检查正常返回][1=1] */
    if 1=1 then
        leave label_pro;
    end if;


    /* [获取机器日期][@完成日期#] */
    select date_format(curdate(),'%Y%m%d') into v_comple_date;


    /* [获取机器时间][@完成时间#] */
    select date_format(curtime(),'%H%i%s') into v_comple_time;


    /* set @任务执行状态# = 《任务执行状态-执行完成》; */
    set v_task_strike_status = "2";

    /* [更新表记录][公共_消息_计划任务信息表][{任务执行状态}=@任务执行状态#, {完成日期}=@完成日期#, {完成时间}=@完成时间#][{任务编号}= @任务编号#][2][@任务编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_msage_task set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, task_strike_status=v_task_strike_status, comple_date=v_comple_date, comple_time=v_comple_time where task_no= v_task_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.11.82.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("任务编号=",v_task_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("任务编号=",v_task_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_消息_计划任务信息表][{任务执行状态}][@任务执行状态#][{任务编号}=@任务编号#][4][@任务编号#] */
    select task_strike_status into v_task_strike_status from db_pub.tb_msage_task where task_no=v_task_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.11.82.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("任务编号=",v_task_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("任务编号=",v_task_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_task_strike_status = v_task_strike_status;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_消息_增加操作日志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_AddOperLog;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_AddOperLog(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_menu_no int,
    IN p_oper_mark varchar(2048),
    IN p_log_level int,
    IN p_log_error_code varchar(32),
    IN p_log_error_info varchar(255),
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
    declare v_menu_no int;
    declare v_oper_mark varchar(2048);
    declare v_log_level int;
    declare v_log_error_code varchar(32);
    declare v_log_error_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_target_menu_no int;
    declare v_target_func_code varchar(16);
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
    SET v_menu_no = p_menu_no;
    SET v_oper_mark = p_oper_mark;
    SET v_log_level = p_log_level;
    SET v_log_error_code = p_log_error_code;
    SET v_log_error_info = p_log_error_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_target_menu_no = 0;
    SET v_target_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* set @目标菜单编号# = @菜单编号#; */
    set v_target_menu_no = v_menu_no;

    /* set @目标功能编码# = @功能编码#; */
    set v_target_func_code = v_func_code;

    /* [插入表记录][公共_消息_操作日志表][字段][字段变量][1][@初始化日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_msage_oper_log(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, opor_co_no, 
        opor_no, oper_way, oper_ip_addr, oper_mac, 
        log_level, target_menu_no, target_func_code, oper_mark, 
        log_error_code, log_error_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_opor_co_no, 
        v_opor_no, v_oper_way, v_oper_ip_addr, v_oper_mac, 
        v_log_level, v_target_menu_no, v_target_func_code, v_oper_mark, 
        v_log_error_code, v_log_error_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.11.83.1";
        SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @错误编码# = "0"; */
    set v_error_code = "0";

    /* set @错误信息# = " "; */
    set v_error_info = " ";
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_消息_获取错误信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_GetErrorInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_GetErrorInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_log_error_code varchar(32),
    IN p_log_error_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_error_prompt varchar(255),
    OUT p_error_level int,
    OUT p_error_deal varchar(1024)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_log_error_code varchar(32);
    declare v_log_error_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_error_prompt varchar(255);
    declare v_error_level int;
    declare v_error_deal varchar(1024);
    declare v_error_no int;
    declare v_row_id bigint;
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
    SET v_log_error_code = p_log_error_code;
    SET v_log_error_info = p_log_error_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_error_prompt = " ";
    SET v_error_level = 0;
    SET v_error_deal = " ";
    SET v_error_no = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @错误编号# = substring_index(@日志错误编码#, '.', -1) + 0; */
    set v_error_no = substring_index(v_log_error_code, '.', -1) + 0;

    /* [获取表记录变量语句][公共_消息_错误编码对照表][字段][字段变量][{错误编号} = @错误编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, error_no, 
        error_level, error_prompt, error_deal into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_error_no, 
        v_error_level, v_error_prompt, v_error_deal from db_pub.tb_msage_error_info where error_no = v_error_no limit 1;

    if FOUND_ROWS() = 0 then

        /* SET @错误提示# = "程序发生没有设置错误编码对照的错误！"; */
        SET v_error_prompt = "程序发生没有设置错误编码对照的错误！";

        /* SET @错误级别# = 《错误级别-提示》; */
        SET v_error_level = 0;

        /* SET @错误处理# = "请与系统管理人员联系解决！"; */
        SET v_error_deal = "请与系统管理人员联系解决！";
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_error_prompt = v_error_prompt;
    SET p_error_level = v_error_level;
    SET p_error_deal = v_error_deal;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_消息_获取所有错误信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_GetAllErrorInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_GetAllErrorInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_update_date int,
    IN p_update_time int,
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
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_update_date = p_update_date;
    SET v_update_time = p_update_time;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][公共_消息_错误编码对照表][字段][{更新日期}>=@更新日期# and {更新时间} >= @更新时间#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, error_no, 
        error_level, error_prompt, error_deal from db_pub.tb_msage_error_info where update_date>=v_update_date and update_time >= v_update_time;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_消息_查询操作员任务提示信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_QueryOperTaskTipsInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_QueryOperTaskTipsInfo(
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
    

    /* [获取表全记录][公共_消息_任务提示信息][字段][{操作员编号}=@操作员编号# and {操作员机构编号}=@操作员机构编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, log_level, exec_date, exec_time, 
        comple_date, comple_time, mark_info, busi_menu_no from db_pub.tb_msage_tasktips_info where opor_no=v_opor_no and opor_co_no=v_opor_co_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_消息_新增操作员任务提示信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_AddOperTaskTipsInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_AddOperTaskTipsInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_log_level int,
    IN p_exec_date int,
    IN p_exec_time int,
    IN p_comple_date int,
    IN p_comple_time int,
    IN p_mark_info varchar(1024),
    IN p_busi_menu_no int,
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
    declare v_log_level int;
    declare v_exec_date int;
    declare v_exec_time int;
    declare v_comple_date int;
    declare v_comple_time int;
    declare v_mark_info varchar(1024);
    declare v_busi_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_log_level = p_log_level;
    SET v_exec_date = p_exec_date;
    SET v_exec_time = p_exec_time;
    SET v_comple_date = p_comple_date;
    SET v_comple_time = p_comple_time;
    SET v_mark_info = p_mark_info;
    SET v_busi_menu_no = p_busi_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][公共_消息_任务提示信息][字段][字段变量][1][concat(@标识信息#, @业务菜单编号#, "任务信息", "关联菜单编号")] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_msage_tasktips_info(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        log_level, exec_date, exec_time, comple_date, 
        comple_time, mark_info, busi_menu_no) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_log_level, v_exec_date, v_exec_time, v_comple_date, 
        v_comple_time, v_mark_info, v_busi_menu_no);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.11.91.1";
        SET v_error_info =  CONCAT(concat(v_mark_info, v_busi_menu_no, "任务信息", "关联菜单编号"),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_消息_修改操作员任务提示信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_ModOperTaskTipsInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_ModOperTaskTipsInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_log_level int,
    IN p_exec_date int,
    IN p_exec_time int,
    IN p_comple_date int,
    IN p_comple_time int,
    IN p_mark_info varchar(1024),
    IN p_busi_menu_no int,
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
    declare v_log_level int;
    declare v_exec_date int;
    declare v_exec_time int;
    declare v_comple_date int;
    declare v_comple_time int;
    declare v_mark_info varchar(1024);
    declare v_busi_menu_no int;
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
    SET v_row_id = p_row_id;
    SET v_log_level = p_log_level;
    SET v_exec_date = p_exec_date;
    SET v_exec_time = p_exec_time;
    SET v_comple_date = p_comple_date;
    SET v_comple_time = p_comple_time;
    SET v_mark_info = p_mark_info;
    SET v_busi_menu_no = p_busi_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_消息_任务提示信息][{日志级别}=@日志级别#, {执行日期}=@执行日期#, {执行时间}=@执行时间#, {完成日期}=@完成日期#, {完成时间}=@完成时间#,{标识信息}=@标识信息#, {业务菜单编号}=@业务菜单编号#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_msage_tasktips_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, log_level=v_log_level, exec_date=v_exec_date, exec_time=v_exec_time, comple_date=v_comple_date, comple_time=v_comple_time,mark_info=v_mark_info, busi_menu_no=v_busi_menu_no where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.11.92.2";
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

# 原子_公共_消息_删除操作员任务提示信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_DelOperTaskTipsInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_DelOperTaskTipsInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_rsp_id bigint
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
    declare v_rsp_id bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_rsp_id = 0;

    
    label_pro:BEGIN
    

    /* SET @回报序号# = @记录序号#; */
    SET v_rsp_id = v_row_id;

    /* [删除表记录][公共_消息_任务提示信息][{记录序号}=@记录序号#][3][@记录序号#] */
    delete from db_pub.tb_msage_tasktips_info 
        where row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.11.93.3";
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
    SET p_rsp_id = v_rsp_id;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_消息_查询监控服务信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_QueryMoniSevrInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_QueryMoniSevrInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_deal_flag int,
    IN p_begin_date int,
    IN p_begin_time int,
    IN p_end_date int,
    IN p_end_time int,
    IN p_moni_server_type int,
    IN p_exception_level int,
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
    declare v_deal_flag int;
    declare v_begin_date int;
    declare v_begin_time int;
    declare v_end_date int;
    declare v_end_time int;
    declare v_moni_server_type int;
    declare v_exception_level int;
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
    SET v_deal_flag = p_deal_flag;
    SET v_begin_date = p_begin_date;
    SET v_begin_time = p_begin_time;
    SET v_end_date = p_end_date;
    SET v_end_time = p_end_time;
    SET v_moni_server_type = p_moni_server_type;
    SET v_exception_level = p_exception_level;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_消息_监控服务信息][字段][(@处理标志#=0 or {处理标志}=@处理标志#) and (@监控服务类型#=0 or {监控服务类型}=@监控服务类型#)  and (@异常级别#=0 or {异常级别}=@异常级别#) and {创建日期}*1000000+{创建时间}>=@开始日期#*1000000+@开始时间# and (@结束日期#=0 or {创建日期}*1000000+{创建时间}<=@结束日期#*1000000+@结束时间#)  and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        exception_level, moni_server_type, computer_name, proc_no, 
        proc_path, deal_flag, deal_info, remark_info from db_pub.tb_msage_monisevr_info where (v_deal_flag=0 or deal_flag=v_deal_flag) and (v_moni_server_type=0 or moni_server_type=v_moni_server_type)  and (v_exception_level=0 or exception_level=v_exception_level) and create_date*1000000+create_time>=v_begin_date*1000000+v_begin_time and (v_end_date=0 or create_date*1000000+create_time<=v_end_date*1000000+v_end_time)  and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        exception_level, moni_server_type, computer_name, proc_no, 
        proc_path, deal_flag, deal_info, remark_info from db_pub.tb_msage_monisevr_info where (v_deal_flag=0 or deal_flag=v_deal_flag) and (v_moni_server_type=0 or moni_server_type=v_moni_server_type)  and (v_exception_level=0 or exception_level=v_exception_level) and create_date*1000000+create_time>=v_begin_date*1000000+v_begin_time and (v_end_date=0 or create_date*1000000+create_time<=v_end_date*1000000+v_end_time)  and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_消息_新增监控服务信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_AddMoniSevrInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_AddMoniSevrInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exception_level int,
    IN p_moni_server_type int,
    IN p_computer_name varchar(255),
    IN p_proc_no int,
    IN p_proc_path varchar(255),
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
    declare v_exception_level int;
    declare v_moni_server_type int;
    declare v_computer_name varchar(255);
    declare v_proc_no int;
    declare v_proc_path varchar(255);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_deal_flag int;
    declare v_deal_info varchar(255);
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
    SET v_exception_level = p_exception_level;
    SET v_moni_server_type = p_moni_server_type;
    SET v_computer_name = p_computer_name;
    SET v_proc_no = p_proc_no;
    SET v_proc_path = p_proc_path;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_deal_flag = 0;
    SET v_deal_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

      /* set @处理标志#=《处理标志-未处理》; */
      set v_deal_flag=2;

      /* set  @处理信息#=" "; */
      set  v_deal_info=" ";

      /* set @操作员编号#=0; */
      set v_opor_no=0;

    /* [插入表记录][公共_消息_监控服务信息][字段][字段变量][1][concat(@异常级别#, @监控服务类型#)] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_msage_monisevr_info(
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, exception_level, 
        moni_server_type, computer_name, proc_no, proc_path, 
        deal_flag, deal_info, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_exception_level, 
        v_moni_server_type, v_computer_name, v_proc_no, v_proc_path, 
        v_deal_flag, v_deal_info, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.11.101.1";
        SET v_error_info =  CONCAT(concat(v_exception_level, v_moni_server_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_消息_修改监控服务信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_ModMoniSevrInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_ModMoniSevrInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_deal_flag int,
    IN p_deal_info varchar(255),
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
    declare v_deal_flag int;
    declare v_deal_info varchar(255);
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
    SET v_row_id = p_row_id;
    SET v_deal_flag = p_deal_flag;
    SET v_deal_info = p_deal_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_消息_监控服务信息][{处理标志}=@处理标志#, {处理信息}=@处理信息#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_msage_monisevr_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_flag=v_deal_flag, deal_info=v_deal_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.11.102.2";
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

# 原子_公共_消息_查询操作日志历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_msage_QueryOperLogHis2;;
DELIMITER ;;
CREATE PROCEDURE pra_msage_QueryOperLogHis2(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_date int,
    IN p_query_opor_no int,
    IN p_co_no int,
    IN p_query_menu_no int,
    IN p_query_func_code varchar(16),
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
    declare v_query_date int;
    declare v_query_opor_no int;
    declare v_co_no int;
    declare v_query_menu_no int;
    declare v_query_func_code varchar(16);
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
    SET v_query_date = p_query_date;
    SET v_query_opor_no = p_query_opor_no;
    SET v_co_no = p_co_no;
    SET v_query_menu_no = p_query_menu_no;
    SET v_query_func_code = p_query_func_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @机构编号# = 9999  then */
    if v_co_no = 9999  then

         /* set @机构编号# = 0; */
         set v_co_no = 0;
    end if;

    /* [获取表记录][历史_公共_消息_操作日志表][{记录序号},{初始化日期},{操作员机构编号},{操作员编号},{操作方式},{操作IP},{操作MAC},{日志级别},{目标菜单编号},{目标功能编码},{操作标志},{日志错误编码} as {错误编码},{日志错误信息} as {错误信息}][{初始化日期} = @查询日期#     and (@机构编号# = 0 or {操作员机构编号} = @机构编号#)  and (@查询操作员编号# = 0 or {操作员编号} = @查询操作员编号#) and (@查询菜单编号# = 0 or {目标菜单编号} = @查询菜单编号#) and (@查询功能编码# = " " or {目标功能编码} = @查询功能编码#) and {记录序号} > @记录序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id,init_date,opor_co_no,opor_no,oper_way,oper_ip_addr,oper_mac,log_level,target_menu_no,target_func_code,oper_mark,log_error_code as error_code,log_error_info as error_info from db_pub_his.tb_msage_oper_log_his where init_date = v_query_date     and (v_co_no = 0 or opor_co_no = v_co_no)  and (v_query_opor_no = 0 or opor_no = v_query_opor_no) and (v_query_menu_no = 0 or target_menu_no = v_query_menu_no) and (v_query_func_code = " " or target_func_code = v_query_func_code) and row_id > v_row_id;
    else
        select row_id,init_date,opor_co_no,opor_no,oper_way,oper_ip_addr,oper_mac,log_level,target_menu_no,target_func_code,oper_mark,log_error_code as error_code,log_error_info as error_info from db_pub_his.tb_msage_oper_log_his where init_date = v_query_date     and (v_co_no = 0 or opor_co_no = v_co_no)  and (v_query_opor_no = 0 or opor_no = v_query_opor_no) and (v_query_menu_no = 0 or target_menu_no = v_query_menu_no) and (v_query_func_code = " " or target_func_code = v_query_func_code) and row_id > v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


