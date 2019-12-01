-- /**************************************************************************************/
-- 创建数据库【交易证券】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_tdsecu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_tdsecu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：交易证券_报盘_订单回报表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdserp_orderrsp;
CREATE TABLE tb_tdserp_orderrsp (
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
    stock_acco varchar(16) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    price_type int NOT NULL ,
    order_rsp_status varchar(2) NOT NULL ,
    rsp_info varchar(255) NOT NULL ,
    deal_status varchar(2) NOT NULL ,
    record_valid_flag int NOT NULL ,
    contra_no varchar(32) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdserp_orderrsp_1 on tb_tdserp_orderrsp (pass_no,out_acco,exch_no,report_date,report_no);
create index idx_tb_tdserp_orderrsp_2 on tb_tdserp_orderrsp (record_valid_flag);
create index idx_tb_tdserp_orderrsp_3 on tb_tdserp_orderrsp (init_date);

-- 创建数据表：历史_交易证券_报盘_订单回报表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdserp_orderrsp_his;
CREATE TABLE tb_tdserp_orderrsp_his (
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
    stock_acco varchar(16) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    price_type int NOT NULL ,
    order_rsp_status varchar(2) NOT NULL ,
    rsp_info varchar(255) NOT NULL ,
    deal_status varchar(2) NOT NULL ,
    record_valid_flag int NOT NULL ,
    contra_no varchar(32) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdserp_orderrsp_his_1 on tb_tdserp_orderrsp_his (pass_no,out_acco,exch_no,report_date,report_no);
create index idx_tb_tdserp_orderrsp_his_2 on tb_tdserp_orderrsp_his (record_valid_flag);
create index idx_tb_tdserp_orderrsp_his_3 on tb_tdserp_orderrsp_his (init_date);

-- 创建数据表：交易证券_报盘_成交回报表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdserp_strikersp;
CREATE TABLE tb_tdserp_strikersp (
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
    stock_acco varchar(16) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    report_date int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    order_dir int NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_deal_type int NOT NULL ,
    rsp_info varchar(255) NOT NULL ,
    deal_status varchar(2) NOT NULL ,
    sett_flag int NOT NULL ,
    record_valid_flag int NOT NULL ,
    asset_acco_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdserp_strikersp_1 on tb_tdserp_strikersp (pass_no,out_acco,exch_no,strike_date,strike_no,order_dir);
create index idx_tb_tdserp_strikersp_2 on tb_tdserp_strikersp (pass_no,out_acco,exch_no,strike_date,report_no);
create index idx_tb_tdserp_strikersp_3 on tb_tdserp_strikersp (strike_date,record_valid_flag,sett_flag);
create index idx_tb_tdserp_strikersp_4 on tb_tdserp_strikersp (init_date);
create index idx_tb_tdserp_strikersp_5 on tb_tdserp_strikersp (update_date,update_time);

-- 创建数据表：历史_交易证券_报盘_成交回报表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdserp_strikersp_his;
CREATE TABLE tb_tdserp_strikersp_his (
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
    stock_acco varchar(16) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    report_date int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    order_dir int NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_deal_type int NOT NULL ,
    rsp_info varchar(255) NOT NULL ,
    deal_status varchar(2) NOT NULL ,
    sett_flag int NOT NULL ,
    record_valid_flag int NOT NULL ,
    asset_acco_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdserp_strikersp_his_1 on tb_tdserp_strikersp_his (pass_no,out_acco,exch_no,strike_date,strike_no,order_dir);
create index idx_tb_tdserp_strikersp_his_2 on tb_tdserp_strikersp_his (pass_no,out_acco,exch_no,strike_date,report_no);
create index idx_tb_tdserp_strikersp_his_3 on tb_tdserp_strikersp_his (strike_date,record_valid_flag,sett_flag);
create index idx_tb_tdserp_strikersp_his_4 on tb_tdserp_strikersp_his (init_date);
create index idx_tb_tdserp_strikersp_his_5 on tb_tdserp_strikersp_his (update_date,update_time);

-- 创建数据表：交易证券_报盘_成交表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdserp_strike;
CREATE TABLE tb_tdserp_strike (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    comm_id bigint NOT NULL ,
    comm_batch_no int NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_batch_no int NOT NULL ,
    order_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    stamp_tax decimal(18,4) NOT NULL ,
    trans_fee decimal(18,4) NOT NULL ,
    brkage_fee decimal(18,4) NOT NULL ,
    SEC_charges decimal(18,4) NOT NULL ,
    other_fee decimal(18,4) NOT NULL ,
    trade_commis decimal(18,4) NOT NULL ,
    other_commis decimal(18,4) NOT NULL ,
    trade_tax decimal(18,4) NOT NULL ,
    trade_cost_fee decimal(18,4) NOT NULL ,
    trade_system_use_fee decimal(18,4) NOT NULL ,
    stock_settle_fee decimal(18,4) NOT NULL ,
    net_price_flag int NOT NULL ,
    intrst_days int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    strike_bond_accr_intrst decimal(18,4) NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    order_oper_way varchar(2) NOT NULL ,
    exter_comm_flag int NOT NULL ,
    record_valid_flag int NOT NULL ,
    external_no bigint NOT NULL ,
    combo_code varchar(32) NOT NULL ,
    asset_acco_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdserp_strike_1 on tb_tdserp_strike (pass_no,out_acco,exch_no,strike_date,strike_no,order_dir);
create index idx_tb_tdserp_strike_2 on tb_tdserp_strike (init_date,co_no,pd_no,exch_group_no);
create index idx_tb_tdserp_strike_3 on tb_tdserp_strike (order_date);
create index idx_tb_tdserp_strike_4 on tb_tdserp_strike (exter_comm_flag,record_valid_flag);
create index idx_tb_tdserp_strike_5 on tb_tdserp_strike (order_id);

-- 创建数据表：历史_交易证券_报盘_成交表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdserp_strike_his;
CREATE TABLE tb_tdserp_strike_his (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    comm_id bigint NOT NULL ,
    comm_batch_no int NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_batch_no int NOT NULL ,
    order_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    stamp_tax decimal(18,4) NOT NULL ,
    trans_fee decimal(18,4) NOT NULL ,
    brkage_fee decimal(18,4) NOT NULL ,
    SEC_charges decimal(18,4) NOT NULL ,
    other_fee decimal(18,4) NOT NULL ,
    trade_commis decimal(18,4) NOT NULL ,
    other_commis decimal(18,4) NOT NULL ,
    trade_tax decimal(18,4) NOT NULL ,
    trade_cost_fee decimal(18,4) NOT NULL ,
    trade_system_use_fee decimal(18,4) NOT NULL ,
    stock_settle_fee decimal(18,4) NOT NULL ,
    net_price_flag int NOT NULL ,
    intrst_days int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    strike_bond_accr_intrst decimal(18,4) NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    order_oper_way varchar(2) NOT NULL ,
    exter_comm_flag int NOT NULL ,
    record_valid_flag int NOT NULL ,
    external_no bigint NOT NULL ,
    combo_code varchar(32) NOT NULL ,
    asset_acco_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdserp_strike_his_1 on tb_tdserp_strike_his (pass_no,out_acco,exch_no,strike_date,strike_no,order_dir);
create index idx_tb_tdserp_strike_his_2 on tb_tdserp_strike_his (init_date,co_no,pd_no,exch_group_no);
create index idx_tb_tdserp_strike_his_3 on tb_tdserp_strike_his (order_date);
create index idx_tb_tdserp_strike_his_4 on tb_tdserp_strike_his (exter_comm_flag,record_valid_flag);
create index idx_tb_tdserp_strike_his_5 on tb_tdserp_strike_his (order_id);

-- 创建数据表：交易证券_报盘_成交汇总表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdserp_sumstrike;
CREATE TABLE tb_tdserp_sumstrike (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    comm_id bigint NOT NULL ,
    strike_date int NOT NULL ,
    report_date int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_batch_no int NOT NULL ,
    order_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    stamp_tax decimal(18,4) NOT NULL ,
    trans_fee decimal(18,4) NOT NULL ,
    brkage_fee decimal(18,4) NOT NULL ,
    SEC_charges decimal(18,4) NOT NULL ,
    other_fee decimal(18,4) NOT NULL ,
    trade_commis decimal(18,4) NOT NULL ,
    other_commis decimal(18,4) NOT NULL ,
    trade_tax decimal(18,4) NOT NULL ,
    trade_cost_fee decimal(18,4) NOT NULL ,
    trade_system_use_fee decimal(18,4) NOT NULL ,
    stock_settle_fee decimal(18,4) NOT NULL ,
    net_price_flag int NOT NULL ,
    intrst_days int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    strike_bond_accr_intrst decimal(18,4) NOT NULL ,
    order_oper_way varchar(2) NOT NULL ,
    exter_comm_flag int NOT NULL ,
    record_valid_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdserp_sumstrike_1 on tb_tdserp_sumstrike (order_date,order_id);
create index idx_tb_tdserp_sumstrike_2 on tb_tdserp_sumstrike (init_date,co_no,pd_no,exch_group_no);
create index idx_tb_tdserp_sumstrike_3 on tb_tdserp_sumstrike (exter_comm_flag,record_valid_flag);

-- 创建数据表：历史_交易证券_报盘_成交汇总表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdserp_sumstrike_his;
CREATE TABLE tb_tdserp_sumstrike_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    comm_id bigint NOT NULL ,
    strike_date int NOT NULL ,
    report_date int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_batch_no int NOT NULL ,
    order_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    stamp_tax decimal(18,4) NOT NULL ,
    trans_fee decimal(18,4) NOT NULL ,
    brkage_fee decimal(18,4) NOT NULL ,
    SEC_charges decimal(18,4) NOT NULL ,
    other_fee decimal(18,4) NOT NULL ,
    trade_commis decimal(18,4) NOT NULL ,
    other_commis decimal(18,4) NOT NULL ,
    trade_tax decimal(18,4) NOT NULL ,
    trade_cost_fee decimal(18,4) NOT NULL ,
    trade_system_use_fee decimal(18,4) NOT NULL ,
    stock_settle_fee decimal(18,4) NOT NULL ,
    net_price_flag int NOT NULL ,
    intrst_days int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    strike_bond_accr_intrst decimal(18,4) NOT NULL ,
    order_oper_way varchar(2) NOT NULL ,
    exter_comm_flag int NOT NULL ,
    record_valid_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdserp_sumstrike_his_1 on tb_tdserp_sumstrike_his (order_date,order_id);
create index idx_tb_tdserp_sumstrike_his_2 on tb_tdserp_sumstrike_his (init_date,co_no,pd_no,exch_group_no);
create index idx_tb_tdserp_sumstrike_his_3 on tb_tdserp_sumstrike_his (exter_comm_flag,record_valid_flag);

-- 创建数据表：交易证券_报盘_体外交易差额记录表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdserp_outtradedifflog;
CREATE TABLE tb_tdserp_outtradedifflog (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    order_date int NOT NULL ,
    order_id bigint NOT NULL ,
    strike_date int NOT NULL ,
    strike_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    amt_diff decimal(18,4) NOT NULL ,
    diff_qty decimal(18,2) NOT NULL ,
    deal_amt_diff decimal(18,4) NOT NULL ,
    deal_diff_qty decimal(18,2) NOT NULL ,
    deal_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdserp_outtradedifflog_1 on tb_tdserp_outtradedifflog (strike_id);
create index idx_tb_tdserp_outtradedifflog_2 on tb_tdserp_outtradedifflog (deal_status);

-- 创建数据表：历史_交易证券_报盘_体外交易差额记录表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdserp_outtradedifflog_his;
CREATE TABLE tb_tdserp_outtradedifflog_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    order_date int NOT NULL ,
    order_id bigint NOT NULL ,
    strike_date int NOT NULL ,
    strike_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    amt_diff decimal(18,4) NOT NULL ,
    diff_qty decimal(18,2) NOT NULL ,
    deal_amt_diff decimal(18,4) NOT NULL ,
    deal_diff_qty decimal(18,2) NOT NULL ,
    deal_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdserp_outtradedifflog_his_1 on tb_tdserp_outtradedifflog_his (strike_id);
create index idx_tb_tdserp_outtradedifflog_his_2 on tb_tdserp_outtradedifflog_his (deal_status);

-- 创建数据表：交易证券_报盘_撤单回报表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdserp_cancelrsp;
CREATE TABLE tb_tdserp_cancelrsp (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    wtdraw_qty decimal(18,2) NOT NULL ,
    rsp_status varchar(2) NOT NULL ,
    rsp_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdserp_cancelrsp_1 on tb_tdserp_cancelrsp (pass_no,out_acco,exch_no,report_date,report_no);
create index idx_tb_tdserp_cancelrsp_2 on tb_tdserp_cancelrsp (init_date);

-- 创建数据表：历史_交易证券_报盘_撤单回报表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdserp_cancelrsp_his;
CREATE TABLE tb_tdserp_cancelrsp_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    wtdraw_qty decimal(18,2) NOT NULL ,
    rsp_status varchar(2) NOT NULL ,
    rsp_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdserp_cancelrsp_his_1 on tb_tdserp_cancelrsp_his (pass_no,out_acco,exch_no,report_date,report_no);
create index idx_tb_tdserp_cancelrsp_his_2 on tb_tdserp_cancelrsp_his (init_date);
commit;
