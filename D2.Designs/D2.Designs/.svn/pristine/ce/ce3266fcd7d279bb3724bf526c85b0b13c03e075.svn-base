-- /**************************************************************************************/
-- 创建数据库【公共】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：公共_消息_对象版本信息表
use db_pub;
DROP TABLE IF EXISTS tb_msage_object_ver;
CREATE TABLE tb_msage_object_ver (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    object_zh_name varchar(32) NOT NULL ,
    object_en_name varchar(32) NOT NULL ,
    object_type int NOT NULL ,
    main_ver_no int NOT NULL ,
    second_ver_no int NOT NULL ,
    rele_ver_no int NOT NULL ,
    ver_date int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_msage_object_ver_1 on tb_msage_object_ver (object_zh_name,object_type);

-- 创建数据表：公共_消息_对象版本信息流水表
use db_pub;
DROP TABLE IF EXISTS tb_msage_object_ver_jour;
CREATE TABLE tb_msage_object_ver_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_co_no int NOT NULL ,
    opor_no int NOT NULL ,
    oper_mac varchar(32) NOT NULL ,
    oper_ip_addr varchar(32) NOT NULL ,
    oper_info varchar(1024) NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    object_zh_name varchar(32) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_occur_info varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_msage_object_ver_jour_1 on tb_msage_object_ver_jour (init_date,object_zh_name);

-- 创建数据表：历史_公共_消息_对象版本信息流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_msage_object_ver_jour_his;
CREATE TABLE tb_msage_object_ver_jour_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_co_no int NOT NULL ,
    opor_no int NOT NULL ,
    oper_mac varchar(32) NOT NULL ,
    oper_ip_addr varchar(32) NOT NULL ,
    oper_info varchar(1024) NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    object_zh_name varchar(32) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_occur_info varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_msage_object_ver_jour_his_1 on tb_msage_object_ver_jour_his (init_date,object_zh_name);

-- 创建数据表：公共_消息_计划任务信息表
use db_pub;
DROP TABLE IF EXISTS tb_msage_task;
CREATE TABLE tb_msage_task (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    task_no int NOT NULL ,
    task_name varchar(64) NOT NULL ,
    depend_task_no int NOT NULL ,
    task_order varchar(16) NOT NULL ,
    task_strike_status varchar(2) NOT NULL ,
    task_strike_rule varchar(64) NOT NULL ,
    exec_pro varchar(64) NOT NULL ,
    busi_menu_no int NOT NULL ,
    busi_func_code varchar(16) NOT NULL ,
    exec_date int NOT NULL ,
    exec_time int NOT NULL ,
    comple_date int NOT NULL ,
    comple_time int NOT NULL ,
    exec_count int NOT NULL ,
    task_status varchar(2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_msage_task_1 on tb_msage_task (task_no);

-- 创建数据表：公共_消息_计划任务信息流水表
use db_pub;
DROP TABLE IF EXISTS tb_msage_task_jour;
CREATE TABLE tb_msage_task_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_co_no int NOT NULL ,
    opor_no int NOT NULL ,
    oper_mac varchar(32) NOT NULL ,
    oper_ip_addr varchar(32) NOT NULL ,
    oper_info varchar(1024) NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    task_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_occur_info varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_msage_task_jour_1 on tb_msage_task_jour (init_date,task_no);

-- 创建数据表：历史_公共_消息_计划任务信息流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_msage_task_jour_his;
CREATE TABLE tb_msage_task_jour_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_co_no int NOT NULL ,
    opor_no int NOT NULL ,
    oper_mac varchar(32) NOT NULL ,
    oper_ip_addr varchar(32) NOT NULL ,
    oper_info varchar(1024) NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    task_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_occur_info varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_msage_task_jour_his_1 on tb_msage_task_jour_his (init_date,task_no);

-- 创建数据表：公共_消息_计划任务执行日志表
use db_pub;
DROP TABLE IF EXISTS tb_msage_task_exec_log;
CREATE TABLE tb_msage_task_exec_log (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    task_no int NOT NULL ,
    task_name varchar(64) NOT NULL ,
    task_strike_status varchar(2) NOT NULL ,
    exec_pro varchar(64) NOT NULL ,
    exec_date int NOT NULL ,
    exec_time int NOT NULL ,
    comple_date int NOT NULL ,
    comple_time int NOT NULL ,
    exec_count int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_msage_task_exec_log_1 on tb_msage_task_exec_log (task_no);
create index idx_tb_msage_task_exec_log_2 on tb_msage_task_exec_log (exec_date);

-- 创建数据表：历史_公共_消息_计划任务执行日志表
use db_pub_his;
DROP TABLE IF EXISTS tb_msage_task_exec_log_his;
CREATE TABLE tb_msage_task_exec_log_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    task_no int NOT NULL ,
    task_name varchar(64) NOT NULL ,
    task_strike_status varchar(2) NOT NULL ,
    exec_pro varchar(64) NOT NULL ,
    exec_date int NOT NULL ,
    exec_time int NOT NULL ,
    comple_date int NOT NULL ,
    comple_time int NOT NULL ,
    exec_count int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_msage_task_exec_log_his_1 on tb_msage_task_exec_log_his (task_no);
create index idx_tb_msage_task_exec_log_his_2 on tb_msage_task_exec_log_his (exec_date);

-- 创建数据表：公共_消息_计划任务扩展信息表
use db_pub;
DROP TABLE IF EXISTS tb_msage_task_ex;
CREATE TABLE tb_msage_task_ex (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    task_no int NOT NULL ,
    task_name varchar(64) NOT NULL ,
    depend_task_no int NOT NULL ,
    task_strike_status varchar(2) NOT NULL ,
    task_strike_rule varchar(64) NOT NULL ,
    task_order varchar(16) NOT NULL ,
    exec_pro varchar(64) NOT NULL ,
    busi_menu_no int NOT NULL ,
    busi_func_code varchar(16) NOT NULL ,
    exec_date int NOT NULL ,
    exec_time int NOT NULL ,
    comple_date int NOT NULL ,
    comple_time int NOT NULL ,
    exec_count int NOT NULL ,
    task_status varchar(2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_msage_task_ex_1 on tb_msage_task_ex (task_no);

-- 创建数据表：公共_消息_计划任务扩展信息流水表
use db_pub;
DROP TABLE IF EXISTS tb_msage_task_ex_jour;
CREATE TABLE tb_msage_task_ex_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_co_no int NOT NULL ,
    opor_no int NOT NULL ,
    oper_mac varchar(32) NOT NULL ,
    oper_ip_addr varchar(32) NOT NULL ,
    oper_info varchar(1024) NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    task_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_occur_info varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_msage_task_ex_jour_1 on tb_msage_task_ex_jour (init_date,task_no);

-- 创建数据表：历史_公共_消息_计划任务扩展信息流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_msage_task_ex_jour_his;
CREATE TABLE tb_msage_task_ex_jour_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_co_no int NOT NULL ,
    opor_no int NOT NULL ,
    oper_mac varchar(32) NOT NULL ,
    oper_ip_addr varchar(32) NOT NULL ,
    oper_info varchar(1024) NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    task_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_occur_info varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_msage_task_ex_jour_his_1 on tb_msage_task_ex_jour_his (init_date,task_no);

-- 创建数据表：公共_消息_计划任务扩展执行日志表
use db_pub;
DROP TABLE IF EXISTS tb_msage_task_ex_exec_log;
CREATE TABLE tb_msage_task_ex_exec_log (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    task_no int NOT NULL ,
    task_name varchar(64) NOT NULL ,
    task_strike_status varchar(2) NOT NULL ,
    exec_pro varchar(64) NOT NULL ,
    exec_date int NOT NULL ,
    exec_time int NOT NULL ,
    comple_date int NOT NULL ,
    comple_time int NOT NULL ,
    exec_count int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_msage_task_ex_exec_log_1 on tb_msage_task_ex_exec_log (task_no);
create index idx_tb_msage_task_ex_exec_log_2 on tb_msage_task_ex_exec_log (exec_date);

-- 创建数据表：历史_公共_消息_计划任务扩展执行日志表
use db_pub_his;
DROP TABLE IF EXISTS tb_msage_task_ex_exec_log_his;
CREATE TABLE tb_msage_task_ex_exec_log_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    task_no int NOT NULL ,
    task_name varchar(64) NOT NULL ,
    task_strike_status varchar(2) NOT NULL ,
    exec_pro varchar(64) NOT NULL ,
    exec_date int NOT NULL ,
    exec_time int NOT NULL ,
    comple_date int NOT NULL ,
    comple_time int NOT NULL ,
    exec_count int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_msage_task_ex_exec_log_his_1 on tb_msage_task_ex_exec_log_his (task_no);
create index idx_tb_msage_task_ex_exec_log_his_2 on tb_msage_task_ex_exec_log_his (exec_date);

-- 创建数据表：公共_消息_操作日志表
use db_pub;
DROP TABLE IF EXISTS tb_msage_oper_log;
CREATE TABLE tb_msage_oper_log (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    opor_co_no int NOT NULL ,
    opor_no int NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    oper_ip_addr varchar(32) NOT NULL ,
    oper_mac varchar(32) NOT NULL ,
    log_level int NOT NULL ,
    target_menu_no int NOT NULL ,
    target_func_code varchar(16) NOT NULL ,
    oper_mark varchar(2048) NOT NULL ,
    log_error_code varchar(32) NOT NULL ,
    log_error_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_msage_oper_log_1 on tb_msage_oper_log (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_消息_操作日志表
use db_pub_his;
DROP TABLE IF EXISTS tb_msage_oper_log_his;
CREATE TABLE tb_msage_oper_log_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    opor_co_no int NOT NULL ,
    opor_no int NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    oper_ip_addr varchar(32) NOT NULL ,
    oper_mac varchar(32) NOT NULL ,
    log_level int NOT NULL ,
    target_menu_no int NOT NULL ,
    target_func_code varchar(16) NOT NULL ,
    oper_mark varchar(2048) NOT NULL ,
    log_error_code varchar(32) NOT NULL ,
    log_error_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_msage_oper_log_his_1 on tb_msage_oper_log_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_消息_错误编码对照表
use db_pub;
DROP TABLE IF EXISTS tb_msage_error_info;
CREATE TABLE tb_msage_error_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    error_no int NOT NULL ,
    error_level int NOT NULL ,
    error_prompt varchar(255) NOT NULL ,
    error_deal varchar(1024) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_msage_error_info_1 on tb_msage_error_info (error_no);
create index idx_tb_msage_error_info_2 on tb_msage_error_info (update_date,update_time);

-- 创建数据表：公共_消息_任务提示信息
use db_pub;
DROP TABLE IF EXISTS tb_msage_tasktips_info;
CREATE TABLE tb_msage_tasktips_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_co_no int NOT NULL ,
    opor_no int NOT NULL ,
    log_level int NOT NULL ,
    exec_date int NOT NULL ,
    exec_time int NOT NULL ,
    comple_date int NOT NULL ,
    comple_time int NOT NULL ,
    mark_info varchar(1024) NOT NULL ,
    busi_menu_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：公共_消息_监控服务信息
use db_pub;
DROP TABLE IF EXISTS tb_msage_monisevr_info;
CREATE TABLE tb_msage_monisevr_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    exception_level int NOT NULL ,
    moni_server_type int NOT NULL ,
    computer_name varchar(255) NOT NULL ,
    proc_no int NOT NULL ,
    proc_path varchar(255) NOT NULL ,
    deal_flag int NOT NULL ,
    deal_info varchar(255) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
commit;
