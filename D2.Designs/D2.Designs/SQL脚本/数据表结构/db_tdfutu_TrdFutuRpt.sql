-- /**************************************************************************************/
-- 创建数据库【交易期货】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_tdfutu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_tdfutu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：交易期货_报盘_订单回报表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfurp_orderrsp;
CREATE TABLE tb_tdfurp_orderrsp (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco varchar(16) NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    rsp_status varchar(2) NOT NULL ,
    rsp_info varchar(255) NOT NULL ,
    deal_status varchar(2) NOT NULL ,
    sett_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfurp_orderrsp_1 on tb_tdfurp_orderrsp (pass_no,out_acco,exch_no,report_date,report_no);
create index idx_tb_tdfurp_orderrsp_2 on tb_tdfurp_orderrsp (order_id);
create index idx_tb_tdfurp_orderrsp_3 on tb_tdfurp_orderrsp (init_date);

-- 创建数据表：历史_交易期货_报盘_订单回报表
use db_tdfutu_his;
DROP TABLE IF EXISTS tb_tdfurp_orderrsp_his;
CREATE TABLE tb_tdfurp_orderrsp_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco varchar(16) NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    rsp_status varchar(2) NOT NULL ,
    rsp_info varchar(255) NOT NULL ,
    deal_status varchar(2) NOT NULL ,
    sett_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfurp_orderrsp_his_1 on tb_tdfurp_orderrsp_his (pass_no,out_acco,exch_no,report_date,report_no);
create index idx_tb_tdfurp_orderrsp_his_2 on tb_tdfurp_orderrsp_his (order_id);
create index idx_tb_tdfurp_orderrsp_his_3 on tb_tdfurp_orderrsp_his (init_date);

-- 创建数据表：交易期货_报盘_成交回报表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfurp_executionrsp;
CREATE TABLE tb_tdfurp_executionrsp (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco varchar(16) NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    report_date int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    rsp_info varchar(255) NOT NULL ,
    deal_status varchar(2) NOT NULL ,
    sett_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfurp_executionrsp_1 on tb_tdfurp_executionrsp (strike_date,strike_no,exch_no);
create index idx_tb_tdfurp_executionrsp_2 on tb_tdfurp_executionrsp (init_date);

-- 创建数据表：历史_交易期货_报盘_成交回报表
use db_tdfutu_his;
DROP TABLE IF EXISTS tb_tdfurp_executionrsp_his;
CREATE TABLE tb_tdfurp_executionrsp_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco varchar(16) NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    report_date int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    rsp_info varchar(255) NOT NULL ,
    deal_status varchar(2) NOT NULL ,
    sett_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfurp_executionrsp_his_1 on tb_tdfurp_executionrsp_his (strike_date,strike_no,exch_no);
create index idx_tb_tdfurp_executionrsp_his_2 on tb_tdfurp_executionrsp_his (init_date);

-- 创建数据表：交易期货_报盘_成交表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfurp_execution;
CREATE TABLE tb_tdfurp_execution (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    contrc_type int NOT NULL ,
    contrc_unit int NOT NULL ,
    comm_id bigint NOT NULL ,
    comm_batch_no int NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_fee decimal(18,4) NOT NULL ,
    close_pandl decimal(18,4) NOT NULL ,
    strike_margin decimal(18,4) NOT NULL ,
    order_oper_way varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfurp_execution_1 on tb_tdfurp_execution (pass_no,out_acco,exch_no,strike_date,strike_no,order_dir,contrc_dir,hedge_type);
create index idx_tb_tdfurp_execution_2 on tb_tdfurp_execution (init_date,co_no,pd_no,exch_group_no);
create index idx_tb_tdfurp_execution_3 on tb_tdfurp_execution (order_date);

-- 创建数据表：历史_交易期货_报盘_成交表
use db_tdfutu_his;
DROP TABLE IF EXISTS tb_tdfurp_execution_his;
CREATE TABLE tb_tdfurp_execution_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    contrc_type int NOT NULL ,
    contrc_unit int NOT NULL ,
    comm_id bigint NOT NULL ,
    comm_batch_no int NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_fee decimal(18,4) NOT NULL ,
    close_pandl decimal(18,4) NOT NULL ,
    strike_margin decimal(18,4) NOT NULL ,
    order_oper_way varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfurp_execution_his_1 on tb_tdfurp_execution_his (pass_no,out_acco,exch_no,strike_date,strike_no,order_dir,contrc_dir,hedge_type);
create index idx_tb_tdfurp_execution_his_2 on tb_tdfurp_execution_his (init_date,co_no,pd_no,exch_group_no);
create index idx_tb_tdfurp_execution_his_3 on tb_tdfurp_execution_his (order_date);
commit;
