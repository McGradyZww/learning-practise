-- /**************************************************************************************/
-- 创建数据库【清算期货】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_clfutu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_clfutu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：清算期货_公用_处理错误信息表
use db_clfutu;
DROP TABLE IF EXISTS tb_clfupb_deal_error;
CREATE TABLE tb_clfupb_deal_error (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    busi_func_code varchar(16) NOT NULL ,
    log_error_code varchar(32) NOT NULL ,
    log_error_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：历史_清算期货_公用_处理错误信息表
use db_clfutu_his;
DROP TABLE IF EXISTS tb_clfupb_deal_error_his;
CREATE TABLE tb_clfupb_deal_error_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    busi_func_code varchar(16) NOT NULL ,
    log_error_code varchar(32) NOT NULL ,
    log_error_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：清算期货_公用_处理状态表
use db_clfutu;
DROP TABLE IF EXISTS tb_clfupb_deal_status;
CREATE TABLE tb_clfupb_deal_status (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    exch_no int NOT NULL ,
    sett_flow_step int NOT NULL ,
    sett_deal_status varchar(2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clfupb_deal_status_1 on tb_clfupb_deal_status (init_date,exch_no,sett_flow_step);

-- 创建数据表：历史_清算期货_公用_处理状态表
use db_clfutu_his;
DROP TABLE IF EXISTS tb_clfupb_deal_status_his;
CREATE TABLE tb_clfupb_deal_status_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    exch_no int NOT NULL ,
    sett_flow_step int NOT NULL ,
    sett_deal_status varchar(2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clfupb_deal_status_his_1 on tb_clfupb_deal_status_his (init_date,exch_no,sett_flow_step);

-- 创建数据表：清算期货_公用_处理流程统计表
use db_clfutu;
DROP TABLE IF EXISTS tb_clfupb_flow_total;
CREATE TABLE tb_clfupb_flow_total (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    exch_no int NOT NULL ,
    sett_flow_step int NOT NULL ,
    total_count int NOT NULL ,
    total_amt decimal(18,4) NOT NULL ,
    total_succ_count int NOT NULL ,
    total_succ_amt decimal(18,4) NOT NULL ,
    total_fail_count int NOT NULL ,
    total_fail_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clfupb_flow_total_1 on tb_clfupb_flow_total (init_date,exch_no,sett_flow_step);

-- 创建数据表：历史_清算期货_公用_处理流程统计表
use db_clfutu_his;
DROP TABLE IF EXISTS tb_clfupb_flow_total_his;
CREATE TABLE tb_clfupb_flow_total_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    exch_no int NOT NULL ,
    sett_flow_step int NOT NULL ,
    total_count int NOT NULL ,
    total_amt decimal(18,4) NOT NULL ,
    total_succ_count int NOT NULL ,
    total_succ_amt decimal(18,4) NOT NULL ,
    total_fail_count int NOT NULL ,
    total_fail_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clfupb_flow_total_his_1 on tb_clfupb_flow_total_his (init_date,exch_no,sett_flow_step);
commit;
