-- /**************************************************************************************/
-- 创建数据库【风控期货】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_rkfutu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_rkfutu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：风控期货_风控_客户风险规则表
use db_rkfutu;
DROP TABLE IF EXISTS tb_rkfurk_client_risk_rule;
CREATE TABLE tb_rkfurk_client_risk_rule (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    model_id bigint NOT NULL ,
    model_name varchar(64) NOT NULL ,
    risk_item_id int NOT NULL ,
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
    risk_rule_calc_str varchar(255) NOT NULL ,
    corrsp_plug varchar(64) NOT NULL ,
    risk_rule_action varchar(32) NOT NULL ,
    begin_time int NOT NULL ,
    end_time int NOT NULL ,
    rule_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rkfurk_client_risk_rule_1 on tb_rkfurk_client_risk_rule (co_no,pd_no,exch_group_no,asset_acco_no,risk_item_id,model_id);
create index idx_tb_rkfurk_client_risk_rule_2 on tb_rkfurk_client_risk_rule (co_no,risk_item_id);

-- 创建数据表：风控期货_风控_客户风险触警流水表
use db_rkfutu;
DROP TABLE IF EXISTS tbjour_rkfurk_futu_client_risk_trig;
CREATE TABLE tbjour_rkfurk_futu_client_risk_trig (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    client_risk_rule_id int NOT NULL ,
    compli_trig_id bigint NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    order_dir_str varchar(1024) NOT NULL ,
    exch_no int NOT NULL ,
    contrc_type int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    trig_stage_type int NOT NULL ,
    compli_calc_level int NOT NULL ,
    unit_nav_flag int NOT NULL ,
    trig_type int NOT NULL ,
    risk_item_name varchar(64) NOT NULL ,
    risk_rule_action varchar(32) NOT NULL ,
    risk_rule_type int NOT NULL ,
    risk_rule_value_str varchar(255) NOT NULL ,
    risk_rule_calc_str varchar(255) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tbjour_rkfurk_futu_client_risk_trig_1 on tbjour_rkfurk_futu_client_risk_trig (co_no,risk_rule_action,risk_rule_type);
create index idx_tbjour_rkfurk_futu_client_risk_trig_2 on tbjour_rkfurk_futu_client_risk_trig (co_no,trig_stage_type,compli_trig_id);
create index idx_tbjour_rkfurk_futu_client_risk_trig_3 on tbjour_rkfurk_futu_client_risk_trig (create_date);

-- 创建数据表：历史_风控期货_风控_客户风险触警流水表
use db_rkfutu_his;
DROP TABLE IF EXISTS tbjour_rkfurk_futu_client_risk_trig_his;
CREATE TABLE tbjour_rkfurk_futu_client_risk_trig_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    client_risk_rule_id int NOT NULL ,
    compli_trig_id bigint NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    order_dir_str varchar(1024) NOT NULL ,
    exch_no int NOT NULL ,
    contrc_type int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    trig_stage_type int NOT NULL ,
    compli_calc_level int NOT NULL ,
    unit_nav_flag int NOT NULL ,
    trig_type int NOT NULL ,
    risk_item_name varchar(64) NOT NULL ,
    risk_rule_action varchar(32) NOT NULL ,
    risk_rule_type int NOT NULL ,
    risk_rule_value_str varchar(255) NOT NULL ,
    risk_rule_calc_str varchar(255) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tbjour_rkfurk_futu_client_risk_trig_his_1 on tbjour_rkfurk_futu_client_risk_trig_his (co_no,risk_rule_action,risk_rule_type);
create index idx_tbjour_rkfurk_futu_client_risk_trig_his_2 on tbjour_rkfurk_futu_client_risk_trig_his (co_no,trig_stage_type,compli_trig_id);
create index idx_tbjour_rkfurk_futu_client_risk_trig_his_3 on tbjour_rkfurk_futu_client_risk_trig_his (create_date);

-- 创建数据表：风控期货_风控_合规触警流水序号表
use db_rkfutu;
DROP TABLE IF EXISTS tb_rkfurk_compliancetrigger_id;
CREATE TABLE tb_rkfurk_compliancetrigger_id (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    compli_trig_id bigint NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rkfurk_compliancetrigger_id_1 on tb_rkfurk_compliancetrigger_id (co_no);
commit;
