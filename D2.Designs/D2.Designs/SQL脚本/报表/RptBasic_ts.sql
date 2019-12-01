DELIMITER ;;
use db_rpts;;

# 事务_报表_报表基础_初始化市场初始化
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rpt_Init_Exch;;
DELIMITER ;;
CREATE PROCEDURE prt_rpt_Init_Exch(
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


           /* 调用【原子_报表_报表基础_初始化市场初始化】*/
           call db_rpts.pra_rpt_Init_Exch(
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
               SET v_error_code = "rptT.1.1.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表基础_初始化市场初始化出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_报表基础_初始化系统初始化
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rpt_Init_System;;
DELIMITER ;;
CREATE PROCEDURE prt_rpt_Init_System(
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


           /* 调用【原子_报表_报表基础_初始化系统初始化】*/
           call db_rpts.pra_rpt_Init_System(
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
               SET v_error_code = "rptT.1.2.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表基础_初始化系统初始化出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_报表基础_查询系统初始化日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rpt_Qry_Sys_Initdate;;
DELIMITER ;;
CREATE PROCEDURE prt_rpt_Qry_Sys_Initdate(
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
    

    /* [事务开始] */
    START TRANSACTION;


           /* 调用【原子_报表_报表基础_查询系统初始化日期】*/
           call db_rpts.pra_rpt_Qry_Sys_Initdate(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_error_code,
               v_error_info,
               v_init_date,
               v_last_init_date,
               v_next_init_date);
           if v_error_code = "1" then
               SET v_error_code = "rptT.1.3.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表基础_查询系统初始化日期出现错误！',v_mysql_message);
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
    SET p_init_date = v_init_date;
    SET p_last_init_date = v_last_init_date;
    SET p_next_init_date = v_next_init_date;

END;;


DELIMITER ;;
use db_rpts;;

# 事务_报表_报表基础_新增基础定义语句仓库表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rpt_Add_Def_Sqls_Repo;;
DELIMITER ;;
CREATE PROCEDURE prt_rpt_Add_Def_Sqls_Repo(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


           /* 调用【原子_报表_报表基础_新增基础定义语句仓库表】*/
           call db_rpts.pra_rpt_Add_Def_Sqls_Repo(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_sql_no,
               v_sql_name,
               v_sql_str,
               v_sql_type,
               v_in_params,
               v_in_params_value,
               v_valid_flag,
               v_remark_info,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "rptT.1.21.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表基础_新增基础定义语句仓库表出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_报表基础_修改基础定义语句仓库表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rpt_Modi_Def_Sqls_Repo;;
DELIMITER ;;
CREATE PROCEDURE prt_rpt_Modi_Def_Sqls_Repo(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


           /* 调用【原子_报表_报表基础_修改基础定义语句仓库表】*/
           call db_rpts.pra_rpt_Modi_Def_Sqls_Repo(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_sql_no,
               v_sql_name,
               v_sql_str,
               v_sql_type,
               v_in_params,
               v_in_params_value,
               v_valid_flag,
               v_remark_info,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "rptT.1.22.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表基础_修改基础定义语句仓库表出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_报表基础_执行基础定义语句仓库表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rpt_Run_Def_Sqls_Repo;;
DELIMITER ;;
CREATE PROCEDURE prt_rpt_Run_Def_Sqls_Repo(
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
    

    /* [事务开始] */
    START TRANSACTION;


           /* 调用【原子_报表_报表基础_执行基础定义语句仓库表】*/
           call db_rpts.pra_rpt_Run_Def_Sqls_Repo(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_exe_sql_name,
               v_in_params_value,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "rptT.1.23.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表基础_执行基础定义语句仓库表出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_报表基础_新增基础定义执行语句表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rpt_Add_Def_Exe_Sqls;;
DELIMITER ;;
CREATE PROCEDURE prt_rpt_Add_Def_Exe_Sqls(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


           /* 调用【原子_报表_报表基础_新增基础定义执行语句表】*/
           call db_rpts.pra_rpt_Add_Def_Exe_Sqls(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_exe_sql_name,
               v_exe_sql_type,
               v_exe_sql_str,
               v_manual_modi_flag,
               v_in_params_value,
               v_update_table_name,
               v_update_fields,
               v_rl_fields,
               v_join_fields,
               v_sql_no,
               v_sql_name,
               v_valid_flag,
               v_remark_info,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "rptT.1.25.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表基础_新增基础定义执行语句表出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_报表基础_运行执行语句执行组
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rpt_Run_Init_Exe_Sql_Grps;;
DELIMITER ;;
CREATE PROCEDURE prt_rpt_Run_Init_Exe_Sql_Grps(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表基础_运行执行语句执行组】*/
    call db_rpts.pra_rpt_Run_Init_Exe_Sql_Grps(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exe_sql_grp_nos_str,
        v_exe_sql_nos_str,
        v_sql_grp_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.1.27.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表基础_运行执行语句执行组出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_报表基础_执行语句执行组
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rpt_Run_Exe_Sql_Grps;;
DELIMITER ;;
CREATE PROCEDURE prt_rpt_Run_Exe_Sql_Grps(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表基础_执行语句执行组】*/
    call db_rpts.pra_rpt_Run_Exe_Sql_Grps(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_sql_grp_no,
        v_co_no,
        v_pd_no,
        v_sync_his_flag,
        v_begin_date,
        v_end_date,
        v_src_data_type,
        v_pos_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.1.30.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表基础_执行语句执行组出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


