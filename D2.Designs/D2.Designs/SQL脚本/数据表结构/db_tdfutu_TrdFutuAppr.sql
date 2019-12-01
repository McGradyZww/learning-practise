-- /**************************************************************************************/
-- 创建数据库【交易期货】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_tdfutu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_tdfutu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：交易期货_指令_指令表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfuap_command;
CREATE TABLE tb_tdfuap_command (
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
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    contrc_type int NOT NULL ,
    asset_type int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    comm_date int NOT NULL ,
    comm_time int NOT NULL ,
    comm_batch_no int NOT NULL ,
    comm_opor int NOT NULL ,
    comm_executor int NOT NULL ,
    comm_dir int NOT NULL ,
    comm_limit_price decimal(16,9) NOT NULL ,
    limit_actual_price decimal(16,9) NOT NULL ,
    comm_qty decimal(18,2) NOT NULL ,
    comm_amt decimal(18,4) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    comm_cancel_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    comm_frozen_qty decimal(18,2) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    capit_reback_days int NOT NULL ,
    posi_reback_days int NOT NULL ,
    strike_status varchar(2) NOT NULL ,
    comm_status varchar(2) NOT NULL ,
    comm_begin_date int NOT NULL ,
    comm_end_date int NOT NULL ,
    comm_begin_time int NOT NULL ,
    comm_end_time int NOT NULL ,
    comm_comple_date int NOT NULL ,
    comm_comple_time int NOT NULL ,
    comm_appr_date int NOT NULL ,
    comm_appr_time int NOT NULL ,
    comm_appr_status varchar(2) NOT NULL ,
    comm_appr_oper_no int NOT NULL ,
    comm_appr_oper int NOT NULL ,
    comm_appr_remark varchar(255) NOT NULL ,
    external_no bigint NOT NULL ,
    comb_code varchar(6) NOT NULL ,
    comm_oper_way varchar(2) NOT NULL ,
    comm_comple_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdfuap_command_1 on tb_tdfuap_command (comm_batch_no);
create index idx_tb_tdfuap_command_2 on tb_tdfuap_command (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_tdfuap_command_3 on tb_tdfuap_command (comm_date,comm_end_date);

-- 创建数据表：历史_交易期货_指令_指令表
use db_tdfutu_his;
DROP TABLE IF EXISTS tb_tdfuap_command_his;
CREATE TABLE tb_tdfuap_command_his (
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
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    contrc_type int NOT NULL ,
    asset_type int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    comm_date int NOT NULL ,
    comm_time int NOT NULL ,
    comm_batch_no int NOT NULL ,
    comm_opor int NOT NULL ,
    comm_executor int NOT NULL ,
    comm_dir int NOT NULL ,
    comm_limit_price decimal(16,9) NOT NULL ,
    limit_actual_price decimal(16,9) NOT NULL ,
    comm_qty decimal(18,2) NOT NULL ,
    comm_amt decimal(18,4) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    comm_cancel_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    comm_frozen_qty decimal(18,2) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    capit_reback_days int NOT NULL ,
    posi_reback_days int NOT NULL ,
    strike_status varchar(2) NOT NULL ,
    comm_status varchar(2) NOT NULL ,
    comm_begin_date int NOT NULL ,
    comm_end_date int NOT NULL ,
    comm_begin_time int NOT NULL ,
    comm_end_time int NOT NULL ,
    comm_comple_date int NOT NULL ,
    comm_comple_time int NOT NULL ,
    comm_appr_date int NOT NULL ,
    comm_appr_time int NOT NULL ,
    comm_appr_status varchar(2) NOT NULL ,
    comm_appr_oper_no int NOT NULL ,
    comm_appr_oper int NOT NULL ,
    comm_appr_remark varchar(255) NOT NULL ,
    external_no bigint NOT NULL ,
    comb_code varchar(6) NOT NULL ,
    comm_oper_way varchar(2) NOT NULL ,
    comm_comple_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdfuap_command_his_1 on tb_tdfuap_command_his (comm_batch_no);
create index idx_tb_tdfuap_command_his_2 on tb_tdfuap_command_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_tdfuap_command_his_3 on tb_tdfuap_command_his (comm_date,comm_end_date);

-- 创建数据表：交易期货_指令_指令流水表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfuap_command_jour;
CREATE TABLE tb_tdfuap_command_jour (
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
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    comm_date int NOT NULL ,
    comm_id bigint NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_occur_info varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdfuap_command_jour_1 on tb_tdfuap_command_jour (init_date,comm_id);
create index idx_tb_tdfuap_command_jour_2 on tb_tdfuap_command_jour (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_tdfuap_command_jour_3 on tb_tdfuap_command_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_交易期货_指令_指令流水表
use db_tdfutu_his;
DROP TABLE IF EXISTS tb_tdfuap_command_jour_his;
CREATE TABLE tb_tdfuap_command_jour_his (
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
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    comm_date int NOT NULL ,
    comm_id bigint NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_occur_info varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdfuap_command_jour_his_1 on tb_tdfuap_command_jour_his (init_date,comm_id);
create index idx_tb_tdfuap_command_jour_his_2 on tb_tdfuap_command_jour_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_tdfuap_command_jour_his_3 on tb_tdfuap_command_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：交易期货_指令_指令分发表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfuap_dispense;
CREATE TABLE tb_tdfuap_dispense (
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
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    comm_date int NOT NULL ,
    comm_id bigint NOT NULL ,
    comm_batch_no int NOT NULL ,
    comm_dir int NOT NULL ,
    comm_status varchar(2) NOT NULL ,
    disp_date int NOT NULL ,
    disp_time int NOT NULL ,
    comm_opor int NOT NULL ,
    before_comm_executor int NOT NULL ,
    comm_executor int NOT NULL ,
    is_withdraw int NOT NULL ,
    disp_flag int NOT NULL ,
    disp_remark varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdfuap_dispense_1 on tb_tdfuap_dispense (comm_date,comm_id);
create index idx_tb_tdfuap_dispense_2 on tb_tdfuap_dispense (init_date,co_no,pd_no,exch_group_no,asset_acco_no);

-- 创建数据表：历史_交易期货_指令_指令分发表
use db_tdfutu_his;
DROP TABLE IF EXISTS tb_tdfuap_dispense_his;
CREATE TABLE tb_tdfuap_dispense_his (
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
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    comm_date int NOT NULL ,
    comm_id bigint NOT NULL ,
    comm_batch_no int NOT NULL ,
    comm_dir int NOT NULL ,
    comm_status varchar(2) NOT NULL ,
    disp_date int NOT NULL ,
    disp_time int NOT NULL ,
    comm_opor int NOT NULL ,
    before_comm_executor int NOT NULL ,
    comm_executor int NOT NULL ,
    is_withdraw int NOT NULL ,
    disp_flag int NOT NULL ,
    disp_remark varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdfuap_dispense_his_1 on tb_tdfuap_dispense_his (comm_date,comm_id);
create index idx_tb_tdfuap_dispense_his_2 on tb_tdfuap_dispense_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no);

-- 创建数据表：交易期货_指令_指令审批表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfuap_command_approve;
CREATE TABLE tb_tdfuap_command_approve (
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
    comm_appr_date int NOT NULL ,
    comm_appr_time int NOT NULL ,
    comm_appr_oper_no int NOT NULL ,
    comm_appr_oper int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    comm_date int NOT NULL ,
    comm_id bigint NOT NULL ,
    comm_opor int NOT NULL ,
    comm_dir int NOT NULL ,
    comm_qty decimal(18,2) NOT NULL ,
    comm_limit_price decimal(16,9) NOT NULL ,
    limit_actual_price decimal(16,9) NOT NULL ,
    comm_begin_date int NOT NULL ,
    comm_end_date int NOT NULL ,
    comm_begin_time int NOT NULL ,
    comm_end_time int NOT NULL ,
    comm_appr_status varchar(2) NOT NULL ,
    comm_appr_remark varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdfuap_command_approve_1 on tb_tdfuap_command_approve (comm_appr_date,comm_appr_oper);
create index idx_tb_tdfuap_command_approve_2 on tb_tdfuap_command_approve (comm_date,comm_id);
create index idx_tb_tdfuap_command_approve_3 on tb_tdfuap_command_approve (init_date,co_no,pd_no,exch_group_no,asset_acco_no);

-- 创建数据表：历史_交易期货_指令_指令审批表
use db_tdfutu_his;
DROP TABLE IF EXISTS tb_tdfuap_command_approve_his;
CREATE TABLE tb_tdfuap_command_approve_his (
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
    comm_appr_date int NOT NULL ,
    comm_appr_time int NOT NULL ,
    comm_appr_oper_no int NOT NULL ,
    comm_appr_oper int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    comm_date int NOT NULL ,
    comm_id bigint NOT NULL ,
    comm_opor int NOT NULL ,
    comm_dir int NOT NULL ,
    comm_qty decimal(18,2) NOT NULL ,
    comm_limit_price decimal(16,9) NOT NULL ,
    limit_actual_price decimal(16,9) NOT NULL ,
    comm_begin_date int NOT NULL ,
    comm_end_date int NOT NULL ,
    comm_begin_time int NOT NULL ,
    comm_end_time int NOT NULL ,
    comm_appr_status varchar(2) NOT NULL ,
    comm_appr_remark varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdfuap_command_approve_his_1 on tb_tdfuap_command_approve_his (comm_appr_date,comm_appr_oper);
create index idx_tb_tdfuap_command_approve_his_2 on tb_tdfuap_command_approve_his (comm_date,comm_id);
create index idx_tb_tdfuap_command_approve_his_3 on tb_tdfuap_command_approve_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no);

-- 创建数据表：交易期货_指令_指令汇总表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfuap_sumcommand;
CREATE TABLE tb_tdfuap_sumcommand (
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
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    contrc_type int NOT NULL ,
    asset_type int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    comm_date int NOT NULL ,
    comm_time int NOT NULL ,
    comm_batch_no int NOT NULL ,
    comm_opor int NOT NULL ,
    comm_executor int NOT NULL ,
    comm_dir int NOT NULL ,
    comm_limit_price decimal(16,9) NOT NULL ,
    limit_actual_price decimal(16,9) NOT NULL ,
    comm_qty decimal(18,2) NOT NULL ,
    comm_amt decimal(18,4) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    comm_cancel_qty decimal(18,2) NOT NULL ,
    comm_await_cancel_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_status varchar(2) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    comm_sum_status varchar(2) NOT NULL ,
    comm_begin_date int NOT NULL ,
    comm_end_date int NOT NULL ,
    comm_begin_time int NOT NULL ,
    comm_end_time int NOT NULL ,
    comm_comple_date int NOT NULL ,
    comm_comple_time int NOT NULL ,
    max_comm_comple_date int NOT NULL ,
    max_comm_comple_time int NOT NULL ,
    comm_appr_date int NOT NULL ,
    comm_appr_time int NOT NULL ,
    comm_appr_qty decimal(18,2) NOT NULL ,
    comm_sum_approve_status varchar(2) NOT NULL ,
    buy_order_qty decimal(18,2) NOT NULL ,
    sell_order_qty decimal(18,2) NOT NULL ,
    buy_comm_qty decimal(18,2) NOT NULL ,
    sell_comm_qty decimal(18,2) NOT NULL ,
    buy_strike_qty decimal(18,2) NOT NULL ,
    sell_strike_qty decimal(18,2) NOT NULL ,
    buy_strike_amt decimal(18,4) NOT NULL ,
    sell_strike_amt decimal(18,4) NOT NULL ,
    buy_comm_amt decimal(18,4) NOT NULL ,
    sell_comm_amt decimal(18,4) NOT NULL ,
    comm_oper_way varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfuap_sumcommand_1 on tb_tdfuap_sumcommand (comm_date,co_no,comm_batch_no,comm_executor);
create index idx_tb_tdfuap_sumcommand_2 on tb_tdfuap_sumcommand (opor_no,comm_oper_way);
create index idx_tb_tdfuap_sumcommand_3 on tb_tdfuap_sumcommand (init_date);

-- 创建数据表：历史_交易期货_指令_指令汇总表
use db_tdfutu_his;
DROP TABLE IF EXISTS tb_tdfuap_sumcommand_his;
CREATE TABLE tb_tdfuap_sumcommand_his (
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
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    contrc_type int NOT NULL ,
    asset_type int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    comm_date int NOT NULL ,
    comm_time int NOT NULL ,
    comm_batch_no int NOT NULL ,
    comm_opor int NOT NULL ,
    comm_executor int NOT NULL ,
    comm_dir int NOT NULL ,
    comm_limit_price decimal(16,9) NOT NULL ,
    limit_actual_price decimal(16,9) NOT NULL ,
    comm_qty decimal(18,2) NOT NULL ,
    comm_amt decimal(18,4) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    comm_cancel_qty decimal(18,2) NOT NULL ,
    comm_await_cancel_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_status varchar(2) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    comm_sum_status varchar(2) NOT NULL ,
    comm_begin_date int NOT NULL ,
    comm_end_date int NOT NULL ,
    comm_begin_time int NOT NULL ,
    comm_end_time int NOT NULL ,
    comm_comple_date int NOT NULL ,
    comm_comple_time int NOT NULL ,
    max_comm_comple_date int NOT NULL ,
    max_comm_comple_time int NOT NULL ,
    comm_appr_date int NOT NULL ,
    comm_appr_time int NOT NULL ,
    comm_appr_qty decimal(18,2) NOT NULL ,
    comm_sum_approve_status varchar(2) NOT NULL ,
    buy_order_qty decimal(18,2) NOT NULL ,
    sell_order_qty decimal(18,2) NOT NULL ,
    buy_comm_qty decimal(18,2) NOT NULL ,
    sell_comm_qty decimal(18,2) NOT NULL ,
    buy_strike_qty decimal(18,2) NOT NULL ,
    sell_strike_qty decimal(18,2) NOT NULL ,
    buy_strike_amt decimal(18,4) NOT NULL ,
    sell_strike_amt decimal(18,4) NOT NULL ,
    buy_comm_amt decimal(18,4) NOT NULL ,
    sell_comm_amt decimal(18,4) NOT NULL ,
    comm_oper_way varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfuap_sumcommand_his_1 on tb_tdfuap_sumcommand_his (comm_date,co_no,comm_batch_no,comm_executor);
create index idx_tb_tdfuap_sumcommand_his_2 on tb_tdfuap_sumcommand_his (opor_no,comm_oper_way);
create index idx_tb_tdfuap_sumcommand_his_3 on tb_tdfuap_sumcommand_his (init_date);
commit;
