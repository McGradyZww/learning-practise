-- /**************************************************************************************/
-- 创建数据库【交易证券】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_tdsecu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_tdsecu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：交易证券_公用_业务记录编号表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdsepb_co_busi_record_no;
CREATE TABLE tb_tdsepb_co_busi_record_no (
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
create unique index idx_tb_tdsepb_co_busi_record_no_1 on tb_tdsepb_co_busi_record_no (co_no,record_no_type);

-- 创建数据表：交易证券_公用_指令审批操作员表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdsepb_approper;
CREATE TABLE tb_tdsepb_approper (
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
create unique index idx_tb_tdsepb_approper_1 on tb_tdsepb_approper (pd_no,comm_appr_oper_no);
create index idx_tb_tdsepb_approper_2 on tb_tdsepb_approper (pd_no,comm_appr_oper);
create index idx_tb_tdsepb_approper_3 on tb_tdsepb_approper (co_no);

-- 创建数据表：历史_交易证券_公用_指令审批操作员表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdsepb_approper_his;
CREATE TABLE tb_tdsepb_approper_his (
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
create unique index idx_tb_tdsepb_approper_his_1 on tb_tdsepb_approper_his (pd_no,comm_appr_oper_no);
create index idx_tb_tdsepb_approper_his_2 on tb_tdsepb_approper_his (pd_no,comm_appr_oper);
create index idx_tb_tdsepb_approper_his_3 on tb_tdsepb_approper_his (co_no);

-- 创建数据表：交易证券_公用_通道状态表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdsepb_offerstatus;
CREATE TABLE tb_tdsepb_offerstatus (
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
create unique index idx_tb_tdsepb_offerstatus_1 on tb_tdsepb_offerstatus (pass_no);

-- 创建数据表：交易证券_公用_篮子属性表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdsepb_baskeinfo;
CREATE TABLE tb_tdsepb_baskeinfo (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    basket_name varchar(64) NOT NULL ,
    weight_type int NOT NULL ,
    is_public int NOT NULL ,
    compos_count int NOT NULL ,
    basket_status varchar(2) NOT NULL ,
    cash_replace_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdsepb_baskeinfo_1 on tb_tdsepb_baskeinfo (co_no,basket_name);

-- 创建数据表：交易证券_公用_篮子成份表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdsepb_basketcomp;
CREATE TABLE tb_tdsepb_basketcomp (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    basket_id bigint NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    compos_qty decimal(18,2) NOT NULL ,
    compos_ratio decimal(18,12) NOT NULL ,
    repl_stock_code_no int NOT NULL ,
    repl_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdsepb_basketcomp_1 on tb_tdsepb_basketcomp (basket_id,stock_code_no);

-- 创建数据表：交易证券_公用_交易初始化控制表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdsepb_initctrl;
CREATE TABLE tb_tdsepb_initctrl (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    oper_target varchar(64) NOT NULL ,
    init_date int NOT NULL ,
    oper_jour_no bigint NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdsepb_initctrl_1 on tb_tdsepb_initctrl (oper_target);

-- 创建数据表：历史_交易证券_公用_交易初始化控制表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdsepb_initctrl_his;
CREATE TABLE tb_tdsepb_initctrl_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    oper_target varchar(64) NOT NULL ,
    init_date int NOT NULL ,
    oper_jour_no bigint NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdsepb_initctrl_his_1 on tb_tdsepb_initctrl_his (oper_target);

-- 创建数据表：交易证券_公用_组合表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdsepb_combo;
CREATE TABLE tb_tdsepb_combo (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    combo_code varchar(32) NOT NULL ,
    comb_name varchar(64) NOT NULL ,
    is_public int NOT NULL ,
    create_failure_validity_date int NOT NULL ,
    create_end_validity_date int NOT NULL ,
    rebalance_failure_validity_date int NOT NULL ,
    rebalance_end_validity_date int NOT NULL ,
    repair_failure_validity_date int NOT NULL ,
    repair_end_validity_date int NOT NULL ,
    broke_validity_date int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdsepb_combo_1 on tb_tdsepb_combo (co_no,combo_code);
create index idx_tb_tdsepb_combo_2 on tb_tdsepb_combo (co_no);

-- 创建数据表：交易证券_公用_组合证券表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdsepb_combostock;
CREATE TABLE tb_tdsepb_combostock (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    combo_code varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    combo_ratio decimal(18,12) NOT NULL ,
    combo_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdsepb_combostock_1 on tb_tdsepb_combostock (combo_code,stock_code_no);

-- 创建数据表：交易证券_公用_报盘信息表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdsepb_offerinfo;
CREATE TABLE tb_tdsepb_offerinfo (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    pass_no int NOT NULL ,
    offer_type varchar(32) NOT NULL ,
    offer_name varchar(32) NOT NULL ,
    offer_server_name varchar(64) NOT NULL ,
    offer_server_ip varchar(64) NOT NULL ,
    offer_server_port int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdsepb_offerinfo_1 on tb_tdsepb_offerinfo (pass_no);

-- 创建数据表：交易证券_公用_指令自动分发规则表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdsepb_commautodistributerule;
CREATE TABLE tb_tdsepb_commautodistributerule (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    rule_name varchar(64) NOT NULL ,
    prior_type int NOT NULL ,
    exch_group_no_str varchar(2048) NOT NULL ,
    exch_no_str varchar(2048) NOT NULL ,
    stock_type_str varchar(2048) NOT NULL ,
    stock_code_str varchar(4096) NOT NULL ,
    opor_no_str varchar(2048) NOT NULL ,
    distribute_last_trader int NOT NULL ,
    distribute_by_jobs int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdsepb_commautodistributerule_1 on tb_tdsepb_commautodistributerule (co_no,prior_type);
commit;
