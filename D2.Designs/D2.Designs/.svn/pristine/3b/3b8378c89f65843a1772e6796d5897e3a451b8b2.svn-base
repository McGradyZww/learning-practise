-- /**************************************************************************************/
-- 创建数据库【风控证券】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_rksecu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_rksecu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：风控证券_公用_风险规则表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksepb_secu_risk_rule;
CREATE TABLE tb_rksepb_secu_risk_rule (
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
    risk_calc_type int NOT NULL ,
    tim_deal_flag int NOT NULL ,
    corrsp_plug varchar(64) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rksepb_secu_risk_rule_1 on tb_rksepb_secu_risk_rule (co_no,risk_rule_type,risk_calc_type);

-- 创建数据表：风控证券_公用_风险条目表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksepb_secu_risk_item;
CREATE TABLE tb_rksepb_secu_risk_item (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    exch_no_str varchar(2048) NOT NULL ,
    order_dir_str varchar(1024) NOT NULL ,
    dime_id bigint NOT NULL ,
    risk_item_tmplat_id bigint NOT NULL ,
    trig_stage_type_str varchar(64) NOT NULL ,
    compli_calc_level int NOT NULL ,
    unit_nav_flag int NOT NULL ,
    trig_type int NOT NULL ,
    compli_rules_remark varchar(255) NOT NULL ,
    risk_rule_id int NOT NULL ,
    risk_rule_name varchar(64) NOT NULL ,
    risk_rule_type int NOT NULL ,
    risk_rule_code varchar(2048) NOT NULL ,
    risk_param_str varchar(2048) NOT NULL ,
    corrsp_plug varchar(64) NOT NULL ,
    risk_rule_value_str1 varchar(255) NOT NULL ,
    risk_rule_action1 varchar(32) NOT NULL ,
    risk_rule_value_str2 varchar(255) NOT NULL ,
    risk_rule_action2 varchar(32) NOT NULL ,
    risk_rule_value_str3 varchar(255) NOT NULL ,
    risk_rule_action3 varchar(32) NOT NULL ,
    risk_rule_value_str4 varchar(255) NOT NULL ,
    risk_rule_action4 varchar(32) NOT NULL ,
    begin_time int NOT NULL ,
    end_time int NOT NULL ,
    rule_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rksepb_secu_risk_item_1 on tb_rksepb_secu_risk_item (co_no);
create index idx_tb_rksepb_secu_risk_item_2 on tb_rksepb_secu_risk_item (co_no,risk_rule_id);

-- 创建数据表：风控证券_公用_风险模板条目表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksepb_secu_risk_model_item;
CREATE TABLE tb_rksepb_secu_risk_model_item (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    model_id bigint NOT NULL ,
    risk_item_id int NOT NULL ,
    compli_rules_remark varchar(255) NOT NULL ,
    risk_rule_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rksepb_secu_risk_model_item_1 on tb_rksepb_secu_risk_model_item (co_no,model_id);

-- 创建数据表：风控证券_公用_风险模板表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksepb_secu_risk_model;
CREATE TABLE tb_rksepb_secu_risk_model (
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
create unique index idx_tb_rksepb_secu_risk_model_1 on tb_rksepb_secu_risk_model (co_no,model_name);

-- 创建数据表：风控证券_公用_风险条目模板表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksepb_secu_risk_rule_templ;
CREATE TABLE tb_rksepb_secu_risk_rule_templ (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    exch_no_str varchar(2048) NOT NULL ,
    order_dir_str varchar(1024) NOT NULL ,
    dime_type int NOT NULL ,
    ctrl_cond_dim_code_str varchar(255) NOT NULL ,
    trig_stage_type_str varchar(64) NOT NULL ,
    compli_calc_level int NOT NULL ,
    trig_type int NOT NULL ,
    risk_item_tmplat_name varchar(255) NOT NULL ,
    risk_rule_id int NOT NULL ,
    risk_rule_type int NOT NULL ,
    risk_rule_name varchar(64) NOT NULL ,
    risk_rule_code varchar(2048) NOT NULL ,
    risk_param_str varchar(2048) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rksepb_secu_risk_rule_templ_1 on tb_rksepb_secu_risk_rule_templ (co_no,risk_rule_type);
commit;
