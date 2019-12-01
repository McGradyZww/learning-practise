-- /**************************************************************************************/
-- 创建数据库【独立估值】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_val DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_val_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：独立估值_查询核对_托管估值表
use db_val;
DROP TABLE IF EXISTS tb_valcheck_deposit_valtable;
CREATE TABLE tb_valcheck_deposit_valtable (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    evalu_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    valtable_no int NOT NULL ,
    fina_acco_code varchar(64) NOT NULL ,
    fina_acco_name varchar(64) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    amount varchar(32) NOT NULL ,
    unit_cost varchar(32) NOT NULL ,
    prime_cost_original varchar(32) NOT NULL ,
    prime_cost_crncy varchar(32) NOT NULL ,
    cost_net_ratio varchar(32) NOT NULL ,
    market_price varchar(32) NOT NULL ,
    market_value_original varchar(32) NOT NULL ,
    market_value_crncy varchar(32) NOT NULL ,
    market_net_ratio varchar(32) NOT NULL ,
    evalu_add_original varchar(64) NOT NULL ,
    evalu_add_crncy varchar(64) NOT NULL ,
    stop_info varchar(32) NOT NULL ,
    rights_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_valcheck_deposit_valtable_1 on tb_valcheck_deposit_valtable (evalu_date,co_no,pd_no,valtable_no);
create index idx_tb_valcheck_deposit_valtable_2 on tb_valcheck_deposit_valtable (evalu_date,co_no,pd_no);

-- 创建数据表：历史_独立估值_查询核对_托管估值表
use db_val_his;
DROP TABLE IF EXISTS tb_valcheck_deposit_valtable_his;
CREATE TABLE tb_valcheck_deposit_valtable_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    evalu_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    valtable_no int NOT NULL ,
    fina_acco_code varchar(64) NOT NULL ,
    fina_acco_name varchar(64) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    amount varchar(32) NOT NULL ,
    unit_cost varchar(32) NOT NULL ,
    prime_cost_original varchar(32) NOT NULL ,
    prime_cost_crncy varchar(32) NOT NULL ,
    cost_net_ratio varchar(32) NOT NULL ,
    market_price varchar(32) NOT NULL ,
    market_value_original varchar(32) NOT NULL ,
    market_value_crncy varchar(32) NOT NULL ,
    market_net_ratio varchar(32) NOT NULL ,
    evalu_add_original varchar(64) NOT NULL ,
    evalu_add_crncy varchar(64) NOT NULL ,
    stop_info varchar(32) NOT NULL ,
    rights_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_valcheck_deposit_valtable_his_1 on tb_valcheck_deposit_valtable_his (evalu_date,co_no,pd_no,valtable_no);
create index idx_tb_valcheck_deposit_valtable_his_2 on tb_valcheck_deposit_valtable_his (evalu_date,co_no,pd_no);

-- 创建数据表：独立估值_查询核对_托管估值配置表
use db_val;
DROP TABLE IF EXISTS tb_valcheck_deposit_valtable_config;
CREATE TABLE tb_valcheck_deposit_valtable_config (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    file_name varchar(64) NOT NULL ,
    netvalue_date_posi varchar(32) NOT NULL ,
    valtable_begin_row int NOT NULL ,
    fina_acco_code varchar(64) NOT NULL ,
    fina_acco_name varchar(64) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    amount varchar(32) NOT NULL ,
    unit_cost varchar(32) NOT NULL ,
    prime_cost_original varchar(32) NOT NULL ,
    prime_cost_crncy varchar(32) NOT NULL ,
    cost_net_ratio varchar(32) NOT NULL ,
    market_price varchar(32) NOT NULL ,
    market_value_original varchar(32) NOT NULL ,
    market_value_crncy varchar(32) NOT NULL ,
    market_net_ratio varchar(32) NOT NULL ,
    evalu_add_original varchar(64) NOT NULL ,
    evalu_add_crncy varchar(64) NOT NULL ,
    stop_info varchar(32) NOT NULL ,
    rights_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_valcheck_deposit_valtable_config_1 on tb_valcheck_deposit_valtable_config (co_no,pd_no);
create index idx_tb_valcheck_deposit_valtable_config_2 on tb_valcheck_deposit_valtable_config (co_no);

-- 创建数据表：独立估值_查询核对_邮箱配置表
use db_val;
DROP TABLE IF EXISTS tb_valcheck_mailbox_config;
CREATE TABLE tb_valcheck_mailbox_config (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    mail_server varchar(64) NOT NULL ,
    server_type int NOT NULL ,
    mail_server_protocol varchar(16) NOT NULL ,
    mail_server_port int NOT NULL ,
    mail_server_username varchar(64) NOT NULL ,
    mail_server_password varchar(64) NOT NULL ,
    ssl_type int NOT NULL ,
    rule_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_valcheck_mailbox_config_1 on tb_valcheck_mailbox_config (co_no,rule_flag);
commit;
