-- /**************************************************************************************/
-- 创建数据库【风控期货】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_rkfutu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_rkfutu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：风控期货_公用_风险规则表
use db_rkfutu;
DROP TABLE IF EXISTS tb_rkfupb_risk_rule;
CREATE TABLE tb_rkfupb_risk_rule (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    risk_rule_type int NOT NULL ,
    risk_rule_name varchar(64) NOT NULL ,
    risk_rule_code varchar(2048) NOT NULL ,
    risk_param_str varchar(2048) NOT NULL ,
    corrsp_plug varchar(64) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rkfupb_risk_rule_1 on tb_rkfupb_risk_rule (co_no,risk_rule_type,risk_rule_name);

-- 创建数据表：风控期货_公用_风险条目表
use db_rkfutu;
DROP TABLE IF EXISTS tb_rkfupb_risk_item;
CREATE TABLE tb_rkfupb_risk_item (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    risk_item_name varchar(64) NOT NULL ,
    exch_no int NOT NULL ,
    contrc_type int NOT NULL ,
    order_dir_str varchar(1024) NOT NULL ,
    trig_stage_type int NOT NULL ,
    compli_calc_level int NOT NULL ,
    unit_nav_flag int NOT NULL ,
    trig_type int NOT NULL ,
    risk_rule_id int NOT NULL ,
    risk_rule_type int NOT NULL ,
    risk_rule_name varchar(64) NOT NULL ,
    risk_rule_code varchar(2048) NOT NULL ,
    risk_param_str varchar(2048) NOT NULL ,
    risk_rule_value_str varchar(255) NOT NULL ,
    corrsp_plug varchar(64) NOT NULL ,
    risk_rule_action varchar(32) NOT NULL ,
    begin_time int NOT NULL ,
    end_time int NOT NULL ,
    rule_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rkfupb_risk_item_1 on tb_rkfupb_risk_item (co_no,risk_item_name);
create index idx_tb_rkfupb_risk_item_2 on tb_rkfupb_risk_item (co_no,exch_no,contrc_type,risk_rule_id);

-- 创建数据表：风控期货_公用_风险模板条目表
use db_rkfutu;
DROP TABLE IF EXISTS tb_rkfupb_futu_risk_model_item;
CREATE TABLE tb_rkfupb_futu_risk_model_item (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    model_id bigint NOT NULL ,
    risk_item_id int NOT NULL ,
    risk_item_name varchar(64) NOT NULL ,
    risk_rule_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rkfupb_futu_risk_model_item_1 on tb_rkfupb_futu_risk_model_item (co_no,model_id);

-- 创建数据表：风控期货_公用_风险模板表
use db_rkfutu;
DROP TABLE IF EXISTS tb_rkfupb_risk_model;
CREATE TABLE tb_rkfupb_risk_model (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    model_name varchar(64) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rkfupb_risk_model_1 on tb_rkfupb_risk_model (co_no,model_name);
commit;
