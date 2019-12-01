DELIMITER ;;
use db_rpts;;

# 原子_报表_报表基础_初始化市场初始化
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Init_Exch;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Init_Exch(
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
    declare v_last_init_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_last_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @初始化日期# = IFNULL(@初始化日期#,0); */
    set v_init_date = IFNULL(v_init_date,0);
    # part1: 获取系统初始化日期

    /* select {上日初始化日期} into @上日初始化日期# from tb_rpt_sys_info limit 1; */
    select last_init_date into v_last_init_date from tb_rpt_sys_info limit 1;
    # part1: 初始化日期=0，取当前日期

    /* set @初始化日期# = if(@初始化日期#=0,@上日初始化日期#,@初始化日期#); */
    set v_init_date = if(v_init_date=0,v_last_init_date,v_init_date);
    # part2: 更新市场的下日初始化日期

    /* update tb_rpt_exch_info t set t.last_init_date = t.init_date,t.init_date = f_get_next_init_date(t.exch_no,@初始化日期#),t.next_init_date = f_get_next_init_date(t.exch_no,t.init_date) */
    update tb_rpt_exch_info t set t.last_init_date = t.init_date,t.init_date = f_get_next_init_date(t.exch_no,v_init_date),t.next_init_date = f_get_next_init_date(t.exch_no,t.init_date)

     /* where t.init_date <> f_get_next_init_date(t.exch_no,@初始化日期#); */
     where t.init_date <> f_get_next_init_date(t.exch_no,v_init_date);
    # part3: 【市场初始化】证券信息
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表基础_初始化系统初始化
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Init_System;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Init_System(
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
    declare v_next_init_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_next_init_date = 0;

    
    label_pro:BEGIN
    

    /* set @初始化日期# = IFNULL(@初始化日期#,0); */
    set v_init_date = IFNULL(v_init_date,0);

    /* set @下日初始化日期# = 0; */
    set v_next_init_date = 0;
    # part1: 初始化日期=0，取当前日期

    /* set @初始化日期# = if(@初始化日期#=0,date_format(curdate(),'%Y%m%d'),@初始化日期#); */
    set v_init_date = if(v_init_date=0,date_format(curdate(),'%Y%m%d'),v_init_date);
    # part2: 根据当前日期获取市场最小初始化日期

    /* SELECT IFNULL(MIN(f_get_next_init_date(t.exch_no, @初始化日期#)),0) into @初始化日期# from tb_rpt_exch_info t 
where IFNULL(f_get_next_init_date(t.exch_no, @初始化日期#),0) <> 0;
 */
    SELECT IFNULL(MIN(f_get_next_init_date(t.exch_no, v_init_date)),0) into v_init_date from tb_rpt_exch_info t 
    where IFNULL(f_get_next_init_date(t.exch_no, v_init_date),0) <> 0;
    
    # part3: 更新"上日初始化日期"与“初始化日期”

    /* update tb_rpt_sys_info t set  t.last_init_date = t.init_date,{初始化日期}= @初始化日期# where {初始化日期}<> @初始化日期#; */
    update tb_rpt_sys_info t set  t.last_init_date = t.init_date,init_date= v_init_date where init_date<> v_init_date;
    # part4: 根据【初始化日期】获取市场最小“下日初始化日期”

    /* SELECT IFNULL(MIN(f_get_next_init_date(t.exch_no, @初始化日期#)),0) into @下日初始化日期# from tb_rpt_exch_info t 
where IFNULL(f_get_next_init_date(t.exch_no, @初始化日期#),0) <> 0;
 */
    SELECT IFNULL(MIN(f_get_next_init_date(t.exch_no, v_init_date)),0) into v_next_init_date from tb_rpt_exch_info t 
    where IFNULL(f_get_next_init_date(t.exch_no, v_init_date),0) <> 0;
    
    # part5: 更新“下日初始化日期”

    /* update tb_rpt_sys_info t set {下日初始化日期}= @下日初始化日期#; */
    update tb_rpt_sys_info t set next_init_date= v_next_init_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表基础_查询系统初始化日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_Sys_Initdate;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_Sys_Initdate(
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
    OUT p_last_init_date int,
    OUT p_next_init_date int
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
    declare v_last_init_date int;
    declare v_next_init_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_last_init_date = date_format(curdate(),'%Y%m%d');
    SET v_next_init_date = 0;

    
    label_pro:BEGIN
    

    /* set @初始化日期# = 0; */
    set v_init_date = 0;
    # part1: 获取系统初始化日期

    /* select {上日初始化日期}, {初始化日期},{下日初始化日期} into @上日初始化日期#, @初始化日期#, @下日初始化日期# from tb_rpt_sys_info limit 1; */
    select last_init_date, init_date,next_init_date into v_last_init_date, v_init_date, v_next_init_date from tb_rpt_sys_info limit 1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_last_init_date = v_last_init_date;
    SET p_next_init_date = v_next_init_date;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表基础_新增基础定义语句仓库表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Add_Def_Sqls_Repo;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Add_Def_Sqls_Repo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sql_no int,
    IN p_sql_name varchar(64),
    IN p_sql_str varchar(10000),
    IN p_sql_type int,
    IN p_in_params varchar(2048),
    IN p_in_params_value varchar(2048),
    IN p_valid_flag int,
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
    declare v_sql_no int;
    declare v_sql_name varchar(64);
    declare v_sql_str varchar(10000);
    declare v_sql_type int;
    declare v_in_params varchar(2048);
    declare v_in_params_value varchar(2048);
    declare v_valid_flag int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sql_dependencies varchar(255);
    declare v_sql_level int;
    declare v_exe_sql_str varchar(10000);
    declare v_rl_tables varchar(255);
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
    SET v_sql_no = p_sql_no;
    SET v_sql_name = p_sql_name;
    SET v_sql_str = p_sql_str;
    SET v_sql_type = p_sql_type;
    SET v_in_params = p_in_params;
    SET v_in_params_value = p_in_params_value;
    SET v_valid_flag = p_valid_flag;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sql_dependencies = " ";
    SET v_sql_level = 0;
    SET v_exe_sql_str = " ";
    SET v_rl_tables = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @语句依赖# = " "; */
    set v_sql_dependencies = " ";

    /* set @语句级别# = 0; */
    set v_sql_level = 0;

    /* set @执行语句# = " "; */
    set v_exe_sql_str = " ";

    /* set @涉及表名# = " "; */
    set v_rl_tables = " ";

    /* [插入表记录][报表_报表数据_基础定义语句仓库表][字段][字段变量][1][@语句名称#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rpts.tb_rpt_def_sqls_repo(
        create_date, create_time, update_date, 
        update_time, update_times, sql_no, sql_name, 
        sql_str, sql_type, in_params, in_params_value, 
        valid_flag, sql_dependencies, sql_level, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_sql_no, v_sql_name, 
        v_sql_str, v_sql_type, v_in_params, v_in_params_value, 
        v_valid_flag, v_sql_dependencies, v_sql_level, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.1.21.1";
        SET v_error_info =  CONCAT(concat("语句名称=",v_sql_name),"#",v_mysql_message);
        leave label_pro;
    end if;

    #part2: 获取“关联表”

    /* SELECT GROUP_CONCAT(DISTINCT t.TABLE_NAME) into @涉及表名# from information_schema.`TABLES` t 
where @执行语句# REGEXP(concat('[ ,.()]',t.TABLE_NAME,'[ ,.()]')) > 0; */
    SELECT GROUP_CONCAT(DISTINCT t.TABLE_NAME) into v_rl_tables from information_schema.`TABLES` t 
    where v_exe_sql_str REGEXP(concat('[ ,.()]',t.TABLE_NAME,'[ ,.()]')) > 0;
    #part2.1: 更新表“关联表”与“语句级别”

    /* update tb_rpt_def_sqls_repo set {语句级别}={语句级别} +1,{语句级别}=@语句级别# where {语句名称}=@语句名称#; */
    update tb_rpt_def_sqls_repo set sql_level=sql_level +1,sql_level=v_sql_level where sql_name=v_sql_name;
    #part3: 获取“关联视图”

    /* SELECT GROUP_CONCAT(DISTINCT t.TABLE_NAME) into @语句依赖# from tb_rpt_def_sqls_repo t 
where @语句内容# REGEXP(concat('[ ,.()]',t.{语句名称},'[ ,.()]')) > 0; */
    SELECT GROUP_CONCAT(DISTINCT t.TABLE_NAME) into v_sql_dependencies from tb_rpt_def_sqls_repo t 
    where v_sql_str REGEXP(concat('[ ,.()]',t.sql_name,'[ ,.()]')) > 0;
    #part3.1: 更新表“关联视图”与“语句级别”

    /* update tb_rpt_def_sqls_repo set {语句级别}={语句级别} +1,{语句级别}=@语句级别# where {语句名称}=@语句名称#; */
    update tb_rpt_def_sqls_repo set sql_level=sql_level +1,sql_level=v_sql_level where sql_name=v_sql_name;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表基础_修改基础定义语句仓库表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Modi_Def_Sqls_Repo;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Modi_Def_Sqls_Repo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sql_no int,
    IN p_sql_name varchar(64),
    IN p_sql_str varchar(10000),
    IN p_sql_type int,
    IN p_in_params varchar(2048),
    IN p_in_params_value varchar(2048),
    IN p_valid_flag int,
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
    declare v_sql_no int;
    declare v_sql_name varchar(64);
    declare v_sql_str varchar(10000);
    declare v_sql_type int;
    declare v_in_params varchar(2048);
    declare v_in_params_value varchar(2048);
    declare v_valid_flag int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sql_dependencies varchar(255);
    declare v_sql_level int;
    declare v_exe_sql_str varchar(10000);
    declare v_update_date int;
    declare v_update_time int;
    declare v_rl_tables varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_sql_no = p_sql_no;
    SET v_sql_name = p_sql_name;
    SET v_sql_str = p_sql_str;
    SET v_sql_type = p_sql_type;
    SET v_in_params = p_in_params;
    SET v_in_params_value = p_in_params_value;
    SET v_valid_flag = p_valid_flag;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sql_dependencies = " ";
    SET v_sql_level = 0;
    SET v_exe_sql_str = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_rl_tables = " ";

    
    label_pro:BEGIN
    

    /* set @语句依赖# = ""; */
    set v_sql_dependencies = "";

    /* set @语句级别# = 0; */
    set v_sql_level = 0;

    /* set @执行语句# = ""; */
    set v_exe_sql_str = "";
    #part1: 更新表记录

    /* [更新表记录][报表_报表数据_基础定义语句仓库表][{语句名称}=@语句名称#,{语句内容}=@语句内容#,{语句类型}=@语句类型#,{输入参数}=@输入参数#,{输入参数值}=@输入参数值#,{有效标志}=@有效标志#,{语句依赖}=@语句依赖#,{语句级别}=@语句级别#,{备注信息}=@备注信息#][{语句编号}=@语句编号#][2][@语句名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rpts.tb_rpt_def_sqls_repo set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sql_name=v_sql_name,sql_str=v_sql_str,sql_type=v_sql_type,in_params=v_in_params,in_params_value=v_in_params_value,valid_flag=v_valid_flag,sql_dependencies=v_sql_dependencies,sql_level=v_sql_level,remark_info=v_remark_info where sql_no=v_sql_no;
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.1.22.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("语句名称=",v_sql_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("语句名称=",v_sql_name);
        end if;
        leave label_pro;
    end if;

    #part2: 获取“关联表”

    /* SELECT GROUP_CONCAT(DISTINCT t.TABLE_NAME) into @涉及表名# from information_schema.`TABLES` t 
where @执行语句# REGEXP(concat('[ ,.()]',t.TABLE_NAME,'[ ,.()]')) > 0; */
    SELECT GROUP_CONCAT(DISTINCT t.TABLE_NAME) into v_rl_tables from information_schema.`TABLES` t 
    where v_exe_sql_str REGEXP(concat('[ ,.()]',t.TABLE_NAME,'[ ,.()]')) > 0;
    #part2.1: 更新表“关联表”与“语句级别”

    /* update tb_rpt_def_sqls_repo set {语句级别}={语句级别} +1,{语句级别}=@语句级别# where {语句名称}=@语句名称#; */
    update tb_rpt_def_sqls_repo set sql_level=sql_level +1,sql_level=v_sql_level where sql_name=v_sql_name;
    #part3: 获取“关联视图”

    /* SELECT GROUP_CONCAT(DISTINCT t.TABLE_NAME) into @语句依赖# from tb_rpt_def_sqls_repo t 
where @语句内容# REGEXP(concat('[ ,.()]',t.{语句名称},'[ ,.()]')) > 0; */
    SELECT GROUP_CONCAT(DISTINCT t.TABLE_NAME) into v_sql_dependencies from tb_rpt_def_sqls_repo t 
    where v_sql_str REGEXP(concat('[ ,.()]',t.sql_name,'[ ,.()]')) > 0;
    #part3.1: 更新表“关联视图”与“语句级别”

    /* update tb_rpt_def_sqls_repo set {语句级别}={语句级别} +1,{语句级别}=@语句级别# where {语句名称}=@语句名称#; */
    update tb_rpt_def_sqls_repo set sql_level=sql_level +1,sql_level=v_sql_level where sql_name=v_sql_name;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表基础_执行基础定义语句仓库表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Run_Def_Sqls_Repo;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Run_Def_Sqls_Repo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exe_sql_name varchar(64),
    IN p_in_params_value varchar(2048),
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
    declare v_exe_sql_name varchar(64);
    declare v_in_params_value varchar(2048);
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
    SET v_exe_sql_name = p_exe_sql_name;
    SET v_in_params_value = p_in_params_value;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # part1: 执行语句
    # [声明游标][报表_报表数据_基础定义执行语句表][{执行语句},{执行语句},{语句类型},{有效标志},{输入参数},{输入参数值},{备注信息}][{有效标志} = 1 and (ifnull(@执行语句#,' ') = ' ' or {执行语句}=@执行语句#) order by {语句执行等级}][cursor_exesqls]
    # [打开游标][@执行语句#,@执行语句#,@语句类型#,@有效标志#,@输入参数#,@输入参数值#,@备注信息#][cursor_exesqls][loop_exesqls]
    #part1: 传入“执行语句”与“参数值”不为空时，赋值
    # if (IFNULL(@参数值#," ") <> " ") then set @输入参数值#=@参数值#; end if;
    # [执行语句][concat(@输入参数值#,char(13),@执行语句#)]
    # [关闭游标][cursor_exesqls]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表基础_新增基础定义执行语句表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Add_Def_Exe_Sqls;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Add_Def_Exe_Sqls(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exe_sql_name varchar(64),
    IN p_exe_sql_type int,
    IN p_exe_sql_str varchar(10000),
    IN p_manual_modi_flag int,
    IN p_in_params_value varchar(2048),
    IN p_update_table_name varchar(64),
    IN p_update_fields varchar(255),
    IN p_rl_fields varchar(255),
    IN p_join_fields varchar(255),
    IN p_sql_no int,
    IN p_sql_name varchar(64),
    IN p_valid_flag int,
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
    declare v_exe_sql_name varchar(64);
    declare v_exe_sql_type int;
    declare v_exe_sql_str varchar(10000);
    declare v_manual_modi_flag int;
    declare v_in_params_value varchar(2048);
    declare v_update_table_name varchar(64);
    declare v_update_fields varchar(255);
    declare v_rl_fields varchar(255);
    declare v_join_fields varchar(255);
    declare v_sql_no int;
    declare v_sql_name varchar(64);
    declare v_valid_flag int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exe_sql_no int;
    declare v_qry_table varchar(255);
    declare v_qry_fields varchar(255);
    declare v_sql_type int;
    declare v_sql_str varchar(10000);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_tmp_in_params_value varchar(2048);
    declare v_tmp_exe_sql_str varchar(10000);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_exe_sql_name = p_exe_sql_name;
    SET v_exe_sql_type = p_exe_sql_type;
    SET v_exe_sql_str = p_exe_sql_str;
    SET v_manual_modi_flag = p_manual_modi_flag;
    SET v_in_params_value = p_in_params_value;
    SET v_update_table_name = p_update_table_name;
    SET v_update_fields = p_update_fields;
    SET v_rl_fields = p_rl_fields;
    SET v_join_fields = p_join_fields;
    SET v_sql_no = p_sql_no;
    SET v_sql_name = p_sql_name;
    SET v_valid_flag = p_valid_flag;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exe_sql_no = 0;
    SET v_qry_table = " ";
    SET v_qry_fields = " ";
    SET v_sql_type = 0;
    SET v_sql_str = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_tmp_in_params_value = " ";
    SET v_tmp_exe_sql_str = " ";

    
    label_pro:BEGIN
    

    /* set @执行语句编号# = 0; */
    set v_exe_sql_no = 0;

    /* set @查询表名# = 0; */
    set v_qry_table = 0;

    /* set @查询字段# = 0; */
    set v_qry_fields = 0;

    /* set @语句类型# = 0; */
    set v_sql_type = 0;

    /* set @语句内容# = 0; */
    set v_sql_str = 0;

    /* [插入表记录][报表_报表数据_基础定义执行语句表][字段][字段变量][1][@执行语句名称#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rpts.tb_rpt_def_exe_sqls(
        create_date, create_time, update_date, 
        update_time, update_times, exe_sql_no, exe_sql_name, 
        exe_sql_type, exe_sql_str, manual_modi_flag, in_params_value, 
        update_table_name, update_fields, rl_fields, join_fields, 
        sql_no, sql_name, valid_flag, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_exe_sql_no, v_exe_sql_name, 
        v_exe_sql_type, v_exe_sql_str, v_manual_modi_flag, v_in_params_value, 
        v_update_table_name, v_update_fields, v_rl_fields, v_join_fields, 
        v_sql_no, v_sql_name, v_valid_flag, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.1.25.1";
        SET v_error_info =  CONCAT(concat("执行语句名称=",v_exe_sql_name),"#",v_mysql_message);
        leave label_pro;
    end if;

    # part1: 手工修改标志为0，自动生成语句

    /* if (@手工修改标志# = 0) then */
    if (v_manual_modi_flag = 0) then

    /* [获取表记录变量][报表_报表数据_基础定义语句仓库表][{语句类型},{语句内容},{输入参数值}][@语句类型#,@语句内容#,@临时_输入参数值#][{语句编号}=@语句编号#][10005]["获取语句失败"] */
    select sql_type,sql_str,in_params_value into v_sql_type,v_sql_str,v_tmp_in_params_value from db_rpts.tb_rpt_def_sqls_repo where sql_no=v_sql_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "rptA.1.25.10005";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("获取语句失败","#",v_mysql_message);
        else
            SET v_error_info = "获取语句失败";
        end if;
        leave label_pro;
    end if;


    /* set @输入参数值# = concat(@临时_输入参数值#,@输入参数值#); */
    set v_in_params_value = concat(v_tmp_in_params_value,v_in_params_value);
    #part1.1: 根据类型拼接语句

    /* if (@语句类型# = 2) then */
    if (v_sql_type = 2) then
    # part1.1.1: 带变量查询

    /* set @语句名称# = concat("(",@语句内容#,")"); */
    set v_sql_name = concat("(",v_sql_str,")");
    end if;
    # part1:拼接“查询语句”

    /* set @查询表名# = concat("select ",@关联字段#," from ",@语句名称#," pt"); */
    set v_qry_table = concat("select ",v_rl_fields," from ",v_sql_name," pt");

    /* if (@执行类型# = 1) then */
    if (v_exe_sql_type = 1) then
    # part2.1: 执行类型=“新增”

    /* set @查询字段# = f_get_table_fields(@更新表#,'row_id'); */
    set v_qry_fields = f_get_table_fields(v_update_table_name,'row_id');

    /* set @临时_执行语句# = concat("insert into “,@更新表#, "(",@查询字段#,”) select ",@查询字段#," from  (", @查询表名# ,") s;" ); */
    set v_tmp_exe_sql_str = concat("insert into ",v_update_table_name, "(",v_qry_fields,") select ",v_qry_fields," from  (", v_qry_table ,") s;" );

    /* elseif (@执行类型# = 2) then */
    elseif (v_exe_sql_type = 2) then
    # part2.2: 执行类型=“修改”

    /* set @临时_执行语句# = concat("update ",@更新表#," t join (",@查询表名#,") s on (",concat('t.',REPLACE(@连接字段#,',',',t.')) ,") = (",concat('s.',REPLACE(@连接字段#,',',',s.')) ,") set ",f_get_table_update_fields(@更新字段串#,'t','s'),";"); */
    set v_tmp_exe_sql_str = concat("update ",v_update_table_name," t join (",v_qry_table,") s on (",concat('t.',REPLACE(v_join_fields,',',',t.')) ,") = (",concat('s.',REPLACE(v_join_fields,',',',s.')) ,") set ",f_get_table_update_fields(v_update_fields,'t','s'),";");
    end if;
    # part1: 更新字段“执行语句”

    /* [更新表记录][报表_报表数据_基础定义执行语句表][{执行语句}=@执行语句#][{执行语句编号}=@执行语句编号#][10004]["基础定义_执行语句表"] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rpts.tb_rpt_def_exe_sqls set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, exe_sql_str=v_exe_sql_str where exe_sql_no=v_exe_sql_no;
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.1.25.10004";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("基础定义_执行语句表","#",v_mysql_message);
        else
            SET v_error_info = "基础定义_执行语句表";
        end if;
        leave label_pro;
    end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表基础_获取基础定义执行语句表执行语句
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Get_Def_Exe_Sqls_Sql;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Get_Def_Exe_Sqls_Sql(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exe_sql_name varchar(64),
    IN p_exe_sql_type int,
    IN p_manual_modi_flag int,
    IN p_in_params_value varchar(2048),
    IN p_update_table_name varchar(64),
    IN p_update_fields varchar(255),
    IN p_rl_fields varchar(255),
    IN p_join_fields varchar(255),
    IN p_sql_no int,
    IN p_sql_name varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exe_sql_str varchar(10000)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_exe_sql_name varchar(64);
    declare v_exe_sql_type int;
    declare v_manual_modi_flag int;
    declare v_in_params_value varchar(2048);
    declare v_update_table_name varchar(64);
    declare v_update_fields varchar(255);
    declare v_rl_fields varchar(255);
    declare v_join_fields varchar(255);
    declare v_sql_no int;
    declare v_sql_name varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exe_sql_str varchar(10000);
    declare v_sql_type int;
    declare v_sql_str varchar(10000);
    declare v_tmp_in_params_value varchar(2048);
    declare v_qry_table varchar(255);
    declare v_qry_fields varchar(255);
    declare v_tmp_exe_sql_str varchar(10000);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_exe_sql_name = p_exe_sql_name;
    SET v_exe_sql_type = p_exe_sql_type;
    SET v_manual_modi_flag = p_manual_modi_flag;
    SET v_in_params_value = p_in_params_value;
    SET v_update_table_name = p_update_table_name;
    SET v_update_fields = p_update_fields;
    SET v_rl_fields = p_rl_fields;
    SET v_join_fields = p_join_fields;
    SET v_sql_no = p_sql_no;
    SET v_sql_name = p_sql_name;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exe_sql_str = " ";
    SET v_sql_type = 0;
    SET v_sql_str = " ";
    SET v_tmp_in_params_value = " ";
    SET v_qry_table = " ";
    SET v_qry_fields = " ";
    SET v_tmp_exe_sql_str = " ";

    
    label_pro:BEGIN
    
    # part1: 手工修改标志为0，自动生成语句

    /* if (@手工修改标志# = 0) then */
    if (v_manual_modi_flag = 0) then

    /* [获取表记录变量][报表_报表数据_基础定义语句仓库表][{语句类型},{语句内容},{输入参数值}][@语句类型#,@语句内容#,@临时_输入参数值#][{语句编号}=@语句编号#][10005]["获取语句失败"] */
    select sql_type,sql_str,in_params_value into v_sql_type,v_sql_str,v_tmp_in_params_value from db_rpts.tb_rpt_def_sqls_repo where sql_no=v_sql_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "rptA.1.26.10005";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("获取语句失败","#",v_mysql_message);
        else
            SET v_error_info = "获取语句失败";
        end if;
        leave label_pro;
    end if;


    /* set @输入参数值# = concat(@临时_输入参数值#,@输入参数值#); */
    set v_in_params_value = concat(v_tmp_in_params_value,v_in_params_value);
    #part1.1: 根据类型拼接语句

    /* if (@语句类型# = 2) then */
    if (v_sql_type = 2) then
    # part1.1.1: 带变量查询

    /* set @语句内容# = concat("(",@语句内容#,")"); */
    set v_sql_str = concat("(",v_sql_str,")");
    end if;
    # part1:拼接“查询语句”

    /* set @查询表名# = concat("select ",@关联字段#," from ",@语句内容#," pt"); */
    set v_qry_table = concat("select ",v_rl_fields," from ",v_sql_str," pt");

    /* if (@执行类型# = 1) then */
    if (v_exe_sql_type = 1) then
    # part2.1: 执行类型=“新增”

    /* set @查询字段# = f_get_table_fields(@更新表#,'row_id'); */
    set v_qry_fields = f_get_table_fields(v_update_table_name,'row_id');

    /* set @临时_执行语句# = concat("insert into “,@更新表#, "(",@查询字段#,”) select ",@查询字段#," from  (", @查询表名# ,") s;" ); */
    set v_tmp_exe_sql_str = concat("insert into ",v_update_table_name, "(",v_qry_fields,") select ",v_qry_fields," from  (", v_qry_table ,") s;" );

    /* elseif (@执行类型# = 2) then */
    elseif (v_exe_sql_type = 2) then
    # part2.2: 执行类型=“修改”

    /* set @临时_执行语句# = concat("update ",@更新表#," t join (",@查询表名#,") s on (",concat('t.',REPLACE(@连接字段#,',',',t.')) ,") = (",concat('s.',REPLACE(@连接字段#,',',',s.')) ,") set ",f_get_table_update_fields(@更新字段串#,'t','s'),";"); */
    set v_tmp_exe_sql_str = concat("update ",v_update_table_name," t join (",v_qry_table,") s on (",concat('t.',REPLACE(v_join_fields,',',',t.')) ,") = (",concat('s.',REPLACE(v_join_fields,',',',s.')) ,") set ",f_get_table_update_fields(v_update_fields,'t','s'),";");
    end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exe_sql_str = v_exe_sql_str;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表基础_运行执行语句执行组
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Run_Init_Exe_Sql_Grps;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Run_Init_Exe_Sql_Grps(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exe_sql_grp_nos_str varchar(255),
    IN p_exe_sql_nos_str varchar(255),
    IN p_sql_grp_no bigint,
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
    declare v_exe_sql_grp_nos_str varchar(255);
    declare v_exe_sql_nos_str varchar(255);
    declare v_sql_grp_no bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sql_content varchar(10000);
    declare v_exe_sql_result int;
    declare v_sql_grp_name varchar(64);
    declare v_exe_seq int;
    declare v_exe_sql_no int;
    declare v_exe_sql_name varchar(64);
    declare v_exe_sql_str varchar(10000);
    declare v_in_params_value varchar(2048);
    declare v_curr_tmstp int;
    declare v_sql_exe_time decimal(18,4);
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
    SET v_exe_sql_grp_nos_str = p_exe_sql_grp_nos_str;
    SET v_exe_sql_nos_str = p_exe_sql_nos_str;
    SET v_sql_grp_no = p_sql_grp_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sql_content = " ";
    SET v_exe_sql_result = 0;
    SET v_sql_grp_name = " ";
    SET v_exe_seq = 0;
    SET v_exe_sql_no = 0;
    SET v_exe_sql_name = " ";
    SET v_exe_sql_str = " ";
    SET v_in_params_value = " ";
    SET v_curr_tmstp = unix_timestamp();
    SET v_sql_exe_time = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @完整语句内容# = ""; */
    set v_sql_content = "";

    /* set @执行结果# = ""; */
    set v_exe_sql_result = "";

    /* set @错误信息# = ""; */
    set v_error_info = "";
    #step1: “执行顺序”获取【基础_执行语句_执行组_执行语句】
    #step2： 【游标】拼接【限定机构、产品】

    /* [声明游标][报表_报表数据_视图执行SQL][{组号},{组名},{执行顺序},{执行语句编号},{执行语句名称},{执行语句},{输入参数值}][{组号}=@组号#][cursor_exesqls] */
    cursor_exesqls:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_exesqls CURSOR FOR
        select sql_grp_no,sql_grp_name,exe_seq,exe_sql_no,exe_sql_name,exe_sql_str,in_params_value 
        from db_rpts.v_init_exe_sql 
        where sql_grp_no=v_sql_grp_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@组号#,@组名#,@执行顺序#,@执行语句编号#,@执行语句名称#,@执行语句#,@输入参数值#][cursor_exesqls][loop_exesqls] */
    open cursor_exesqls;
    loop_exesqls: LOOP
    fetch cursor_exesqls into v_sql_grp_no,v_sql_grp_name,v_exe_seq,v_exe_sql_no,v_exe_sql_name,v_exe_sql_str,v_in_params_value;
        IF v_cursor_done THEN
            LEAVE loop_exesqls;
        END IF;

    #step3：注意：1.执行sql不能有多个”；“

    /* set @执行语句# = if(trim(@输入参数值#) = '', @执行语句#, REPLACE(@执行语句#,'?',@输入参数值#)); */
    set v_exe_sql_str = if(trim(v_in_params_value) = '', v_exe_sql_str, REPLACE(v_exe_sql_str,'?',v_in_params_value));
    # select @执行语句#,@输入参数值#;

    /* set @当前时间戳# = unix_timestamp(); */
    set v_curr_tmstp = unix_timestamp();

    /* [执行语句][@执行语句#] */
    set @tmp_sql = v_exe_sql_str;
    PREPARE stmt from @tmp_sql;
    EXECUTE stmt;
    set @tmp_sql = '';
    DEALLOCATE PREPARE stmt;

    # [退出循环][cursor_exesqls]
    # leave label_pro;
    #step4：记录执行sql的结果

    /* set @执行耗时# = (UNIX_TIMESTAMP(NOW())-@当前时间戳# ),@完整语句内容# = @执行语句#,@执行结果# = v_mysql_sqlstate; */
    set v_sql_exe_time = (UNIX_TIMESTAMP(NOW())-v_curr_tmstp ),v_sql_content = v_exe_sql_str,v_exe_sql_result = v_mysql_sqlstate;

    /* [插入表记录][报表_报表数据_基础执行执行语句流水][{组号},{组名},{执行顺序},{执行语句编号},{执行语句名称},{执行耗时},{完整语句内容},{执行结果},{错误信息}][@组号#,@组名#,@执行顺序#,@执行语句编号#,@执行语句名称#,@执行耗时#,@完整语句内容#,@执行结果#,@错误信息#][10002]["基础_执行_执行语句_流水"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rpts.tb_rpt_init_exe_sql_grps_jour(
        sql_grp_no,sql_grp_name,exe_seq,exe_sql_no,exe_sql_name,sql_exe_time,sql_content,exe_sql_result,error_info) 
    value( 
        v_sql_grp_no,v_sql_grp_name,v_exe_seq,v_exe_sql_no,v_exe_sql_name,v_sql_exe_time,v_sql_content,v_exe_sql_result,v_error_info);
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.1.27.10002";
        SET v_error_info =  CONCAT("基础_执行_执行语句_流水","#",v_mysql_message);
        close cursor_exesqls;
        leave label_pro;
    end if;


    /* [关闭游标][cursor_exesqls] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_exesqls;
    end cursor_exesqls;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表基础_执行语句执行组
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Run_Exe_Sql_Grps;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Run_Exe_Sql_Grps(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sql_grp_no bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_sync_his_flag int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_src_data_type int,
    IN p_pos_str varchar(64),
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
    declare v_sql_grp_no bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_sync_his_flag int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_src_data_type int;
    declare v_pos_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sql_content varchar(10000);
    declare v_exe_sql_result int;
    declare v_sql_grp_name varchar(64);
    declare v_exe_seq int;
    declare v_exe_sql_no int;
    declare v_exe_sql_name varchar(64);
    declare v_exe_sql_str varchar(10000);
    declare v_in_params_value varchar(2048);
    declare v_curr_tmstp int;
    declare v_sql_exe_time decimal(18,4);
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
    SET v_sql_grp_no = p_sql_grp_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_sync_his_flag = p_sync_his_flag;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_src_data_type = p_src_data_type;
    SET v_pos_str = p_pos_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sql_content = " ";
    SET v_exe_sql_result = 0;
    SET v_sql_grp_name = " ";
    SET v_exe_seq = 0;
    SET v_exe_sql_no = 0;
    SET v_exe_sql_name = " ";
    SET v_exe_sql_str = " ";
    SET v_in_params_value = " ";
    SET v_curr_tmstp = unix_timestamp();
    SET v_sql_exe_time = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @定位串# = if(TRIM(@定位串#)="",CONCAT(@操作员编号#,""),@定位串#); */
    set v_pos_str = if(TRIM(v_pos_str)="",CONCAT(v_opor_no,""),v_pos_str);

    /* set @完整语句内容# = ""; */
    set v_sql_content = "";

    /* set @执行结果# = ""; */
    set v_exe_sql_result = "";

    /* set @错误信息# = ""; */
    set v_error_info = "";
    #step1: “执行顺序”获取【基础_执行语句_执行组_执行语句】
    #step2： 【游标】拼接【限定机构、产品】

    /* [声明游标][报表_报表数据_视图执行SQL][{组号},{组名},{执行顺序},{执行语句编号},{执行语句名称},{执行语句},{输入参数值}][{组号}=@组号#][cursor_exesqls] */
    cursor_exesqls:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_exesqls CURSOR FOR
        select sql_grp_no,sql_grp_name,exe_seq,exe_sql_no,exe_sql_name,exe_sql_str,in_params_value 
        from db_rpts.v_init_exe_sql 
        where sql_grp_no=v_sql_grp_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@组号#,@组名#,@执行顺序#,@执行语句编号#,@执行语句名称#,@执行语句#,@输入参数值#][cursor_exesqls][loop_exesqls] */
    open cursor_exesqls;
    loop_exesqls: LOOP
    fetch cursor_exesqls into v_sql_grp_no,v_sql_grp_name,v_exe_seq,v_exe_sql_no,v_exe_sql_name,v_exe_sql_str,v_in_params_value;
        IF v_cursor_done THEN
            LEAVE loop_exesqls;
        END IF;

    #step3：注意：1.执行sql不能有多个”；“

    /* set @执行语句# =REPLACE(@执行语句#,CONCAT(CHAR(64),SUBSTR('@机构编号#',3)),@机构编号#); */
    set v_exe_sql_str =REPLACE(v_exe_sql_str,CONCAT(CHAR(64),SUBSTR('v_co_no',3)),v_co_no);

    /* set @执行语句# =REPLACE(@执行语句#,CONCAT(CHAR(64),SUBSTR('@产品编号#',3)),@产品编号#); */
    set v_exe_sql_str =REPLACE(v_exe_sql_str,CONCAT(CHAR(64),SUBSTR('v_pd_no',3)),v_pd_no);

    /* set @执行语句# =REPLACE(@执行语句#,CONCAT(CHAR(64),SUBSTR('@同步历史标志#',3)),@同步历史标志#); */
    set v_exe_sql_str =REPLACE(v_exe_sql_str,CONCAT(CHAR(64),SUBSTR('v_sync_his_flag',3)),v_sync_his_flag);

    /* set @执行语句# =REPLACE(@执行语句#,CONCAT(CHAR(64),SUBSTR('@开始日期#',3)),@开始日期#); */
    set v_exe_sql_str =REPLACE(v_exe_sql_str,CONCAT(CHAR(64),SUBSTR('v_begin_date',3)),v_begin_date);

    /* set @执行语句# =REPLACE(@执行语句#,CONCAT(CHAR(64),SUBSTR('@结束日期#',3)),@结束日期#); */
    set v_exe_sql_str =REPLACE(v_exe_sql_str,CONCAT(CHAR(64),SUBSTR('v_end_date',3)),v_end_date);

    /* set @执行语句# =REPLACE(@执行语句#,CONCAT(CHAR(64),SUBSTR('@数据来源类型#',3)),@数据来源类型#); */
    set v_exe_sql_str =REPLACE(v_exe_sql_str,CONCAT(CHAR(64),SUBSTR('v_src_data_type',3)),v_src_data_type);

    /* set @执行语句# =REPLACE(@执行语句#,CONCAT(CHAR(64),SUBSTR('@定位串#',3)),@定位串#); */
    set v_exe_sql_str =REPLACE(v_exe_sql_str,CONCAT(CHAR(64),SUBSTR('v_pos_str',3)),v_pos_str);
    # select @执行语句#;

    /* set @当前时间戳# = unix_timestamp(); */
    set v_curr_tmstp = unix_timestamp();

    /* [执行语句][@执行语句#] */
    set @tmp_sql = v_exe_sql_str;
    PREPARE stmt from @tmp_sql;
    EXECUTE stmt;
    set @tmp_sql = '';
    DEALLOCATE PREPARE stmt;

    # [退出循环][cursor_exesqls]
    # leave label_pro;
    #step4：记录执行sql的结果

    /* set @执行耗时# = (UNIX_TIMESTAMP(NOW())-@当前时间戳# ),@完整语句内容# = @执行语句#,@执行结果# = v_mysql_sqlstate; */
    set v_sql_exe_time = (UNIX_TIMESTAMP(NOW())-v_curr_tmstp ),v_sql_content = v_exe_sql_str,v_exe_sql_result = v_mysql_sqlstate;

    /* [插入表记录][报表_报表数据_基础执行执行语句流水][{组号},{组名},{执行顺序},{执行语句编号},{执行语句名称},{执行耗时},{完整语句内容},{执行结果},{错误信息}][@组号#,@组名#,@执行顺序#,@执行语句编号#,@执行语句名称#,@执行耗时#,@完整语句内容#,@执行结果#,@错误信息#][10002]["基础_执行_执行语句_流水"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rpts.tb_rpt_init_exe_sql_grps_jour(
        sql_grp_no,sql_grp_name,exe_seq,exe_sql_no,exe_sql_name,sql_exe_time,sql_content,exe_sql_result,error_info) 
    value( 
        v_sql_grp_no,v_sql_grp_name,v_exe_seq,v_exe_sql_no,v_exe_sql_name,v_sql_exe_time,v_sql_content,v_exe_sql_result,v_error_info);
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.1.30.10002";
        SET v_error_info =  CONCAT("基础_执行_执行语句_流水","#",v_mysql_message);
        close cursor_exesqls;
        leave label_pro;
    end if;


    /* [关闭游标][cursor_exesqls] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_exesqls;
    end cursor_exesqls;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


