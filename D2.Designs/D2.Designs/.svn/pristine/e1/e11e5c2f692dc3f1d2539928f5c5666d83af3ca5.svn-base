-- /**************************************************************************************/
-- 创建数据库【交易期货】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_tdfutu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_tdfutu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：交易期货_公用_通道状态表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfupb_offerstatus;
CREATE TABLE tb_tdfupb_offerstatus (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    pass_no int NOT NULL ,
    pass_status varchar(2) NOT NULL ,
    offer_name varchar(32) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfupb_offerstatus_1 on tb_tdfupb_offerstatus (pass_no);

-- 创建数据表：交易期货_公用_业务记录编号表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfupb_co_busi_record_no;
CREATE TABLE tb_tdfupb_co_busi_record_no (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    record_no_type int NOT NULL ,
    curr_no bigint NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfupb_co_busi_record_no_1 on tb_tdfupb_co_busi_record_no (co_no,record_no_type);

-- 创建数据表：交易期货_公用_指令审批操作员表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfupb_approper;
CREATE TABLE tb_tdfupb_approper (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    comm_appr_oper_no int NOT NULL ,
    comm_appr_oper int NOT NULL ,
    online_auto_aapr_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfupb_approper_1 on tb_tdfupb_approper (pd_no,comm_appr_oper_no);
create index idx_tb_tdfupb_approper_2 on tb_tdfupb_approper (pd_no,comm_appr_oper);
create index idx_tb_tdfupb_approper_3 on tb_tdfupb_approper (co_no);

-- 创建数据表：历史_交易期货_公用_指令审批操作员表
use db_tdfutu_his;
DROP TABLE IF EXISTS tb_tdfupb_approper_his;
CREATE TABLE tb_tdfupb_approper_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    comm_appr_oper_no int NOT NULL ,
    comm_appr_oper int NOT NULL ,
    online_auto_aapr_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfupb_approper_his_1 on tb_tdfupb_approper_his (pd_no,comm_appr_oper_no);
create index idx_tb_tdfupb_approper_his_2 on tb_tdfupb_approper_his (pd_no,comm_appr_oper);
create index idx_tb_tdfupb_approper_his_3 on tb_tdfupb_approper_his (co_no);
commit;
