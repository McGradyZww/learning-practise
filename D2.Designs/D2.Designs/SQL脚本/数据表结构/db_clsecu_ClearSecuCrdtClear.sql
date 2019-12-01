-- /**************************************************************************************/
-- 创建数据库【清算证券】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_clsecu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_clsecu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：清算证券_融资融券清算_成交表
use db_clsecu;
DROP TABLE IF EXISTS tb_clcrdtcl_strike;
CREATE TABLE tb_clcrdtcl_strike (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_no int NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
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
    arrive_date int NOT NULL ,
    net_price_flag int NOT NULL ,
    intrst_days int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    clear_entry_type int NOT NULL ,
    busi_jour_no bigint NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clcrdtcl_strike_1 on tb_clcrdtcl_strike (asset_acco_no,exch_no,strike_date,strike_no,order_dir);
create index idx_tb_clcrdtcl_strike_2 on tb_clcrdtcl_strike (init_date,strike_date);
create index idx_tb_clcrdtcl_strike_3 on tb_clcrdtcl_strike (deal_flag);
create index idx_tb_clcrdtcl_strike_4 on tb_clcrdtcl_strike (exch_no,order_no,order_date);

-- 创建数据表：历史_清算证券_融资融券清算_成交表
use db_clsecu_his;
DROP TABLE IF EXISTS tb_clcrdtcl_strike_his;
CREATE TABLE tb_clcrdtcl_strike_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_no int NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
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
    arrive_date int NOT NULL ,
    net_price_flag int NOT NULL ,
    intrst_days int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    clear_entry_type int NOT NULL ,
    busi_jour_no bigint NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clcrdtcl_strike_his_1 on tb_clcrdtcl_strike_his (asset_acco_no,exch_no,strike_date,strike_no,order_dir);
create index idx_tb_clcrdtcl_strike_his_2 on tb_clcrdtcl_strike_his (init_date,strike_date);
create index idx_tb_clcrdtcl_strike_his_3 on tb_clcrdtcl_strike_his (deal_flag);
create index idx_tb_clcrdtcl_strike_his_4 on tb_clcrdtcl_strike_his (exch_no,order_no,order_date);

-- 创建数据表：清算证券_融资融券清算_合并清算表
use db_clsecu;
DROP TABLE IF EXISTS tb_clcrdtcl_merge_clear;
CREATE TABLE tb_clcrdtcl_merge_clear (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_no int NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_num int NOT NULL ,
    strike_aver_price decimal(16,9) NOT NULL ,
    pre_entry_qty decimal(18,2) NOT NULL ,
    pre_entry_amt decimal(18,4) NOT NULL ,
    split_strike_qty decimal(18,2) NOT NULL ,
    split_strike_amt decimal(18,4) NOT NULL ,
    split_stamp_tax decimal(18,4) NOT NULL ,
    split_trans_fee decimal(18,4) NOT NULL ,
    split_brkage decimal(18,4) NOT NULL ,
    split_SEC_charges decimal(18,4) NOT NULL ,
    split_other_fee decimal(18,4) NOT NULL ,
    split_brkage_commis decimal(18,4) NOT NULL ,
    split_other_commis decimal(18,4) NOT NULL ,
    split_trade_tax decimal(18,4) NOT NULL ,
    split_trade_cost_fee decimal(18,4) NOT NULL ,
    split_trade_system_use_fee decimal(18,4) NOT NULL ,
    split_stock_settle_fee decimal(18,4) NOT NULL ,
    arrive_date int NOT NULL ,
    net_price_flag int NOT NULL ,
    intrst_days int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    clear_entry_type int NOT NULL ,
    busi_flag int NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clcrdtcl_merge_clear_1 on tb_clcrdtcl_merge_clear (order_date,order_no,exch_no);
create index idx_tb_clcrdtcl_merge_clear_2 on tb_clcrdtcl_merge_clear (deal_flag);
create index idx_tb_clcrdtcl_merge_clear_3 on tb_clcrdtcl_merge_clear (strike_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_clcrdtcl_merge_clear_4 on tb_clcrdtcl_merge_clear (init_date);

-- 创建数据表：历史_清算证券_融资融券清算_合并清算表
use db_clsecu_his;
DROP TABLE IF EXISTS tb_clcrdtcl_merge_clear_his;
CREATE TABLE tb_clcrdtcl_merge_clear_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_no int NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_num int NOT NULL ,
    strike_aver_price decimal(16,9) NOT NULL ,
    pre_entry_qty decimal(18,2) NOT NULL ,
    pre_entry_amt decimal(18,4) NOT NULL ,
    split_strike_qty decimal(18,2) NOT NULL ,
    split_strike_amt decimal(18,4) NOT NULL ,
    split_stamp_tax decimal(18,4) NOT NULL ,
    split_trans_fee decimal(18,4) NOT NULL ,
    split_brkage decimal(18,4) NOT NULL ,
    split_SEC_charges decimal(18,4) NOT NULL ,
    split_other_fee decimal(18,4) NOT NULL ,
    split_brkage_commis decimal(18,4) NOT NULL ,
    split_other_commis decimal(18,4) NOT NULL ,
    split_trade_tax decimal(18,4) NOT NULL ,
    split_trade_cost_fee decimal(18,4) NOT NULL ,
    split_trade_system_use_fee decimal(18,4) NOT NULL ,
    split_stock_settle_fee decimal(18,4) NOT NULL ,
    arrive_date int NOT NULL ,
    net_price_flag int NOT NULL ,
    intrst_days int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    clear_entry_type int NOT NULL ,
    busi_flag int NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clcrdtcl_merge_clear_his_1 on tb_clcrdtcl_merge_clear_his (order_date,order_no,exch_no);
create index idx_tb_clcrdtcl_merge_clear_his_2 on tb_clcrdtcl_merge_clear_his (deal_flag);
create index idx_tb_clcrdtcl_merge_clear_his_3 on tb_clcrdtcl_merge_clear_his (strike_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_clcrdtcl_merge_clear_his_4 on tb_clcrdtcl_merge_clear_his (init_date);

-- 创建数据表：清算证券_融资融券清算_待入账记录表
use db_clsecu;
DROP TABLE IF EXISTS tb_clcrdtcl_pre_entry;
CREATE TABLE tb_clcrdtcl_pre_entry (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    pd_no int NOT NULL ,
    pass_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    debt_type int NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_no int NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_num int NOT NULL ,
    pre_entry_qty decimal(18,2) NOT NULL ,
    pre_entry_amt decimal(18,4) NOT NULL ,
    debt_qty decimal(18,2) NOT NULL ,
    debt_amt decimal(18,4) NOT NULL ,
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
    busi_flag int NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    deal_flag int NOT NULL ,
    clear_loan_sell_flag int NOT NULL ,
    undo_status varchar(2) NOT NULL ,
    busi_jour_no bigint NOT NULL ,
    entry_money_jour_no bigint NOT NULL ,
    entry_exgp_debt_jour_no int NOT NULL ,
    entry_asac_debt_jour_no int NOT NULL ,
    entry_exgp_posi_jour_no bigint NOT NULL ,
    entry_asac_posi_jour_no bigint NOT NULL ,
    arrive_date int NOT NULL ,
    intrst_days int NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clcrdtcl_pre_entry_1 on tb_clcrdtcl_pre_entry (exch_no,strike_date,strike_no,asset_acco_no);
create index idx_tb_clcrdtcl_pre_entry_2 on tb_clcrdtcl_pre_entry (entry_status);
create index idx_tb_clcrdtcl_pre_entry_3 on tb_clcrdtcl_pre_entry (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_clcrdtcl_pre_entry_4 on tb_clcrdtcl_pre_entry (update_date,update_time);
create index idx_tb_clcrdtcl_pre_entry_5 on tb_clcrdtcl_pre_entry (co_no,pd_no,exch_group_no,asset_acco_no,debt_type);

-- 创建数据表：历史_清算证券_融资融券清算_待入账记录表
use db_clsecu_his;
DROP TABLE IF EXISTS tb_clcrdtcl_pre_entry_his;
CREATE TABLE tb_clcrdtcl_pre_entry_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    pd_no int NOT NULL ,
    pass_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    debt_type int NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_no int NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_num int NOT NULL ,
    pre_entry_qty decimal(18,2) NOT NULL ,
    pre_entry_amt decimal(18,4) NOT NULL ,
    debt_qty decimal(18,2) NOT NULL ,
    debt_amt decimal(18,4) NOT NULL ,
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
    busi_flag int NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    deal_flag int NOT NULL ,
    clear_loan_sell_flag int NOT NULL ,
    undo_status varchar(2) NOT NULL ,
    busi_jour_no bigint NOT NULL ,
    entry_money_jour_no bigint NOT NULL ,
    entry_exgp_debt_jour_no int NOT NULL ,
    entry_asac_debt_jour_no int NOT NULL ,
    entry_exgp_posi_jour_no bigint NOT NULL ,
    entry_asac_posi_jour_no bigint NOT NULL ,
    arrive_date int NOT NULL ,
    intrst_days int NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clcrdtcl_pre_entry_his_1 on tb_clcrdtcl_pre_entry_his (exch_no,strike_date,strike_no,asset_acco_no);
create index idx_tb_clcrdtcl_pre_entry_his_2 on tb_clcrdtcl_pre_entry_his (entry_status);
create index idx_tb_clcrdtcl_pre_entry_his_3 on tb_clcrdtcl_pre_entry_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_clcrdtcl_pre_entry_his_4 on tb_clcrdtcl_pre_entry_his (update_date,update_time);
create index idx_tb_clcrdtcl_pre_entry_his_5 on tb_clcrdtcl_pre_entry_his (co_no,pd_no,exch_group_no,asset_acco_no,debt_type);

-- 创建数据表：清算证券_融资融券清算_入账异常表
use db_clsecu;
DROP TABLE IF EXISTS tb_clcrdtcl_entry_error;
CREATE TABLE tb_clcrdtcl_entry_error (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    undo_error_no int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clcrdtcl_entry_error_1 on tb_clcrdtcl_entry_error (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_clcrdtcl_entry_error_2 on tb_clcrdtcl_entry_error (init_date,co_no,exch_no,stock_acco_no,stock_code_no);

-- 创建数据表：历史_清算证券_融资融券清算_入账异常表
use db_clsecu_his;
DROP TABLE IF EXISTS tb_clcrdtcl_entry_error_his;
CREATE TABLE tb_clcrdtcl_entry_error_his (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    undo_error_no int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clcrdtcl_entry_error_his_1 on tb_clcrdtcl_entry_error_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_clcrdtcl_entry_error_his_2 on tb_clcrdtcl_entry_error_his (init_date,co_no,exch_no,stock_acco_no,stock_code_no);

-- 创建数据表：清算证券_融资融券清算_统计表
use db_clsecu;
DROP TABLE IF EXISTS tb_clcrdtcl_clear_total;
CREATE TABLE tb_clcrdtcl_clear_total (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    busi_flag int NOT NULL ,
    clear_num int NOT NULL ,
    order_dir int NOT NULL ,
    strike_num int NOT NULL ,
    strike_aver_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    entry_qty decimal(18,2) NOT NULL ,
    entry_amt decimal(18,4) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    stamp_tax decimal(18,4) NOT NULL ,
    trans_fee decimal(18,4) NOT NULL ,
    brkage_fee decimal(18,4) NOT NULL ,
    SEC_charges decimal(18,4) NOT NULL ,
    other_fee decimal(18,4) NOT NULL ,
    trade_commis decimal(18,4) NOT NULL ,
    chann_commis decimal(18,4) NOT NULL ,
    divi_commis decimal(18,4) NOT NULL ,
    other_commis decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clcrdtcl_clear_total_1 on tb_clcrdtcl_clear_total (init_date,co_no,pd_no,exch_group_no,asset_acco_no,busi_flag);
create index idx_tb_clcrdtcl_clear_total_2 on tb_clcrdtcl_clear_total (init_date,exch_no,stock_acco_no,stock_code_no,busi_flag);

-- 创建数据表：历史_清算证券_融资融券清算_统计表
use db_clsecu_his;
DROP TABLE IF EXISTS tb_clcrdtcl_clear_total_his;
CREATE TABLE tb_clcrdtcl_clear_total_his (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    busi_flag int NOT NULL ,
    clear_num int NOT NULL ,
    order_dir int NOT NULL ,
    strike_num int NOT NULL ,
    strike_aver_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    entry_qty decimal(18,2) NOT NULL ,
    entry_amt decimal(18,4) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    stamp_tax decimal(18,4) NOT NULL ,
    trans_fee decimal(18,4) NOT NULL ,
    brkage_fee decimal(18,4) NOT NULL ,
    SEC_charges decimal(18,4) NOT NULL ,
    other_fee decimal(18,4) NOT NULL ,
    trade_commis decimal(18,4) NOT NULL ,
    chann_commis decimal(18,4) NOT NULL ,
    divi_commis decimal(18,4) NOT NULL ,
    other_commis decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clcrdtcl_clear_total_his_1 on tb_clcrdtcl_clear_total_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no,busi_flag);
create index idx_tb_clcrdtcl_clear_total_his_2 on tb_clcrdtcl_clear_total_his (init_date,exch_no,stock_acco_no,stock_code_no,busi_flag);

-- 创建数据表：清算证券_融资融券清算_成交控制表
use db_clsecu;
DROP TABLE IF EXISTS tb_clcrdtcl_strike_ctrl;
CREATE TABLE tb_clcrdtcl_strike_ctrl (
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
    report_date int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clcrdtcl_strike_ctrl_1 on tb_clcrdtcl_strike_ctrl (asset_acco_no,report_date,report_no);
commit;
