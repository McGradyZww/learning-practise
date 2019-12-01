-- /**************************************************************************************/
-- 创建数据库【清算证券】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_clsecu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_clsecu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：清算证券_结算_公司行为表
use db_clsecu;
DROP TABLE IF EXISTS tb_clsest_co_action;
CREATE TABLE tb_clsest_co_action (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    divi_cacl_num int NOT NULL ,
    divi_amt decimal(18,4) NOT NULL ,
    divi_qty decimal(18,2) NOT NULL ,
    equity_trans_qty decimal(18,2) NOT NULL ,
    rights_issue_qty decimal(18,2) NOT NULL ,
    placement_price decimal(16,9) NOT NULL ,
    notice_date int NOT NULL ,
    reg_date int NOT NULL ,
    ex_date int NOT NULL ,
    arrive_date int NOT NULL ,
    begin_trade_date int NOT NULL ,
    deal_flag int NOT NULL ,
    busi_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clsest_co_action_1 on tb_clsest_co_action (reg_date,stock_code_no,crncy_type,busi_flag);
create index idx_tb_clsest_co_action_2 on tb_clsest_co_action (exch_no,arrive_date);
create index idx_tb_clsest_co_action_3 on tb_clsest_co_action (arrive_date,busi_flag);

-- 创建数据表：历史_清算证券_结算_公司行为表
use db_clsecu_his;
DROP TABLE IF EXISTS tb_clsest_co_action_his;
CREATE TABLE tb_clsest_co_action_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    divi_cacl_num int NOT NULL ,
    divi_amt decimal(18,4) NOT NULL ,
    divi_qty decimal(18,2) NOT NULL ,
    equity_trans_qty decimal(18,2) NOT NULL ,
    rights_issue_qty decimal(18,2) NOT NULL ,
    placement_price decimal(16,9) NOT NULL ,
    notice_date int NOT NULL ,
    reg_date int NOT NULL ,
    ex_date int NOT NULL ,
    arrive_date int NOT NULL ,
    begin_trade_date int NOT NULL ,
    deal_flag int NOT NULL ,
    busi_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clsest_co_action_his_1 on tb_clsest_co_action_his (reg_date,stock_code_no,crncy_type,busi_flag);
create index idx_tb_clsest_co_action_his_2 on tb_clsest_co_action_his (exch_no,arrive_date);
create index idx_tb_clsest_co_action_his_3 on tb_clsest_co_action_his (arrive_date,busi_flag);

-- 创建数据表：清算证券_结算_机构税率表
use db_clsecu;
DROP TABLE IF EXISTS tb_clsest_co_tax_rate;
CREATE TABLE tb_clsest_co_tax_rate (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    divi_tax_rate decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clsest_co_tax_rate_1 on tb_clsest_co_tax_rate (co_no,crncy_type);

-- 创建数据表：清算证券_结算_机构产品税率表
use db_clsecu;
DROP TABLE IF EXISTS tb_clsest_co_prod_tax_rate;
CREATE TABLE tb_clsest_co_prod_tax_rate (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    divi_tax_rate decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clsest_co_prod_tax_rate_1 on tb_clsest_co_prod_tax_rate (pd_no,crncy_type);
create index idx_tb_clsest_co_prod_tax_rate_2 on tb_clsest_co_prod_tax_rate (co_no);

-- 创建数据表：清算证券_结算_新股中签表
use db_clsecu;
DROP TABLE IF EXISTS tb_clsest_new_shares;
CREATE TABLE tb_clsest_new_shares (
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
    strike_date int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    order_dir int NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clsest_new_shares_1 on tb_clsest_new_shares (asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_clsest_new_shares_2 on tb_clsest_new_shares (init_date,co_no,pd_no,exch_group_no);
create index idx_tb_clsest_new_shares_3 on tb_clsest_new_shares (strike_date);

-- 创建数据表：历史_清算证券_结算_新股中签表
use db_clsecu_his;
DROP TABLE IF EXISTS tb_clsest_new_shares_his;
CREATE TABLE tb_clsest_new_shares_his (
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
    strike_date int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    order_dir int NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clsest_new_shares_his_1 on tb_clsest_new_shares_his (asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_clsest_new_shares_his_2 on tb_clsest_new_shares_his (init_date,co_no,pd_no,exch_group_no);
create index idx_tb_clsest_new_shares_his_3 on tb_clsest_new_shares_his (strike_date);

-- 创建数据表：清算证券_结算_新股申购表
use db_clsecu;
DROP TABLE IF EXISTS tb_clsest_new_report;
CREATE TABLE tb_clsest_new_report (
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
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    dist_qty int NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    deal_flag int NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clsest_new_report_1 on tb_clsest_new_report (asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_clsest_new_report_2 on tb_clsest_new_report (init_date,co_no,pd_no,exch_group_no,asset_acco_no);

-- 创建数据表：历史_清算证券_结算_新股申购表
use db_clsecu_his;
DROP TABLE IF EXISTS tb_clsest_new_report_his;
CREATE TABLE tb_clsest_new_report_his (
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
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    dist_qty int NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    deal_flag int NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clsest_new_report_his_1 on tb_clsest_new_report_his (asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_clsest_new_report_his_2 on tb_clsest_new_report_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no);

-- 创建数据表：清算证券_结算_回购表
use db_clsecu;
DROP TABLE IF EXISTS tb_clsest_repurchase;
CREATE TABLE tb_clsest_repurchase (
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
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    strike_date int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    order_dir int NOT NULL ,
    repo_qty decimal(18,2) NOT NULL ,
    repo_amt decimal(18,4) NOT NULL ,
    repo_rate decimal(18,12) NOT NULL ,
    repo_trade_date int NOT NULL ,
    repo_order_id bigint NOT NULL ,
    repo_strike_id bigint NOT NULL ,
    intrst_days int NOT NULL ,
    repo_cale_days int NOT NULL ,
    repo_back_date int NOT NULL ,
    repo_back_trade_date int NOT NULL ,
    repo_back_amt decimal(18,4) NOT NULL ,
    repo_back_intrst decimal(18,4) NOT NULL ,
    repo_status varchar(2) NOT NULL ,
    busi_flag int NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clsest_repurchase_1 on tb_clsest_repurchase (asset_acco_no,exch_no,strike_date,strike_no);
create index idx_tb_clsest_repurchase_2 on tb_clsest_repurchase (asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_clsest_repurchase_3 on tb_clsest_repurchase (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_clsest_repurchase_4 on tb_clsest_repurchase (repo_back_date,repo_status);

-- 创建数据表：历史_清算证券_结算_回购表
use db_clsecu_his;
DROP TABLE IF EXISTS tb_clsest_repurchase_his;
CREATE TABLE tb_clsest_repurchase_his (
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
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    strike_date int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    order_dir int NOT NULL ,
    repo_qty decimal(18,2) NOT NULL ,
    repo_amt decimal(18,4) NOT NULL ,
    repo_rate decimal(18,12) NOT NULL ,
    repo_trade_date int NOT NULL ,
    repo_order_id bigint NOT NULL ,
    repo_strike_id bigint NOT NULL ,
    intrst_days int NOT NULL ,
    repo_cale_days int NOT NULL ,
    repo_back_date int NOT NULL ,
    repo_back_trade_date int NOT NULL ,
    repo_back_amt decimal(18,4) NOT NULL ,
    repo_back_intrst decimal(18,4) NOT NULL ,
    repo_status varchar(2) NOT NULL ,
    busi_flag int NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clsest_repurchase_his_1 on tb_clsest_repurchase_his (asset_acco_no,exch_no,strike_date,strike_no);
create index idx_tb_clsest_repurchase_his_2 on tb_clsest_repurchase_his (asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_clsest_repurchase_his_3 on tb_clsest_repurchase_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_clsest_repurchase_his_4 on tb_clsest_repurchase_his (repo_back_date,repo_status);

-- 创建数据表：清算证券_结算_提前待入账记录表
use db_clsecu;
DROP TABLE IF EXISTS tb_clsest_before_preentry;
CREATE TABLE tb_clsest_before_preentry (
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
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    pre_entry_qty decimal(18,2) NOT NULL ,
    pre_entry_amt decimal(18,4) NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    busi_flag int NOT NULL ,
    act_record_flag int NOT NULL ,
    acco_entry_flag int NOT NULL ,
    entry_money_jour_no bigint NOT NULL ,
    entry_exgp_posi_jour_no bigint NOT NULL ,
    entry_asac_posi_jour_no bigint NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    reg_date int NOT NULL ,
    arrive_date int NOT NULL ,
    begin_trade_date int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clsest_before_preentry_1 on tb_clsest_before_preentry (arrive_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_clsest_before_preentry_2 on tb_clsest_before_preentry (arrive_date,co_no,exch_no,stock_acco_no,stock_code_no);

-- 创建数据表：历史_清算证券_结算_提前待入账记录表
use db_clsecu_his;
DROP TABLE IF EXISTS tb_clsest_before_preentry_his;
CREATE TABLE tb_clsest_before_preentry_his (
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
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    pre_entry_qty decimal(18,2) NOT NULL ,
    pre_entry_amt decimal(18,4) NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    busi_flag int NOT NULL ,
    act_record_flag int NOT NULL ,
    acco_entry_flag int NOT NULL ,
    entry_money_jour_no bigint NOT NULL ,
    entry_exgp_posi_jour_no bigint NOT NULL ,
    entry_asac_posi_jour_no bigint NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    reg_date int NOT NULL ,
    arrive_date int NOT NULL ,
    begin_trade_date int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clsest_before_preentry_his_1 on tb_clsest_before_preentry_his (arrive_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_clsest_before_preentry_his_2 on tb_clsest_before_preentry_his (arrive_date,co_no,exch_no,stock_acco_no,stock_code_no);

-- 创建数据表：清算证券_结算_待入账记录表
use db_clsecu;
DROP TABLE IF EXISTS tb_clsest_preentry;
CREATE TABLE tb_clsest_preentry (
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
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    order_dir int NOT NULL ,
    pre_entry_qty decimal(18,2) NOT NULL ,
    pre_entry_amt decimal(18,4) NOT NULL ,
    busi_flag int NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    undo_status varchar(2) NOT NULL ,
    entry_money_jour_no bigint NOT NULL ,
    entry_exgp_posi_jour_no bigint NOT NULL ,
    entry_asac_posi_jour_no bigint NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    intrst_days int NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    repo_back_date int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clsest_preentry_1 on tb_clsest_preentry (entry_status);

-- 创建数据表：历史_清算证券_结算_待入账记录表
use db_clsecu_his;
DROP TABLE IF EXISTS tb_clsest_preentry_his;
CREATE TABLE tb_clsest_preentry_his (
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
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    order_dir int NOT NULL ,
    pre_entry_qty decimal(18,2) NOT NULL ,
    pre_entry_amt decimal(18,4) NOT NULL ,
    busi_flag int NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    undo_status varchar(2) NOT NULL ,
    entry_money_jour_no bigint NOT NULL ,
    entry_exgp_posi_jour_no bigint NOT NULL ,
    entry_asac_posi_jour_no bigint NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    intrst_days int NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    repo_back_date int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clsest_preentry_his_1 on tb_clsest_preentry_his (entry_status);

-- 创建数据表：清算证券_结算_入账异常表
use db_clsecu;
DROP TABLE IF EXISTS tb_clsest_entry_error;
CREATE TABLE tb_clsest_entry_error (
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
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    order_dir int NOT NULL ,
    strike_date int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    pre_entry_qty decimal(18,2) NOT NULL ,
    pre_entry_amt decimal(18,4) NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    intrst_days int NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    repo_back_date int NOT NULL ,
    busi_flag int NOT NULL ,
    undo_error_no int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clsest_entry_error_1 on tb_clsest_entry_error (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_clsest_entry_error_2 on tb_clsest_entry_error (init_date,co_no,exch_no,stock_acco_no,stock_code_no);

-- 创建数据表：历史_清算证券_结算_入账异常表
use db_clsecu_his;
DROP TABLE IF EXISTS tb_clsest_entry_error_his;
CREATE TABLE tb_clsest_entry_error_his (
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
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    order_dir int NOT NULL ,
    strike_date int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    pre_entry_qty decimal(18,2) NOT NULL ,
    pre_entry_amt decimal(18,4) NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    intrst_days int NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    repo_back_date int NOT NULL ,
    busi_flag int NOT NULL ,
    undo_error_no int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clsest_entry_error_his_1 on tb_clsest_entry_error_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_clsest_entry_error_his_2 on tb_clsest_entry_error_his (init_date,co_no,exch_no,stock_acco_no,stock_code_no);

-- 创建数据表：清算证券_结算_统计表
use db_clsecu;
DROP TABLE IF EXISTS tb_clsest_settle_total;
CREATE TABLE tb_clsest_settle_total (
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
    crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    busi_flag int NOT NULL ,
    sett_num int NOT NULL ,
    entry_qty decimal(18,2) NOT NULL ,
    entry_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clsest_settle_total_1 on tb_clsest_settle_total (init_date,co_no,pd_no,exch_group_no,asset_acco_no,crncy_type,busi_flag);
create index idx_tb_clsest_settle_total_2 on tb_clsest_settle_total (init_date,exch_no,stock_acco_no,stock_code_no,busi_flag);

-- 创建数据表：历史_清算证券_结算_统计表
use db_clsecu_his;
DROP TABLE IF EXISTS tb_clsest_settle_total_his;
CREATE TABLE tb_clsest_settle_total_his (
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
    crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    busi_flag int NOT NULL ,
    sett_num int NOT NULL ,
    entry_qty decimal(18,2) NOT NULL ,
    entry_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clsest_settle_total_his_1 on tb_clsest_settle_total_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no,crncy_type,busi_flag);
create index idx_tb_clsest_settle_total_his_2 on tb_clsest_settle_total_his (init_date,exch_no,stock_acco_no,stock_code_no,busi_flag);

-- 创建数据表：清算证券_结算_可转债中签表
use db_clsecu;
DROP TABLE IF EXISTS tb_clsest_convertible_bond_shares;
CREATE TABLE tb_clsest_convertible_bond_shares (
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
    strike_date int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    order_dir int NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clsest_convertible_bond_shares_1 on tb_clsest_convertible_bond_shares (asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_clsest_convertible_bond_shares_2 on tb_clsest_convertible_bond_shares (init_date,co_no,pd_no,exch_group_no);
create index idx_tb_clsest_convertible_bond_shares_3 on tb_clsest_convertible_bond_shares (strike_date);

-- 创建数据表：历史_清算证券_结算_可转债中签表
use db_clsecu_his;
DROP TABLE IF EXISTS tb_clsest_convertible_bond_shares_his;
CREATE TABLE tb_clsest_convertible_bond_shares_his (
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
    strike_date int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    order_dir int NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clsest_convertible_bond_shares_his_1 on tb_clsest_convertible_bond_shares_his (asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_clsest_convertible_bond_shares_his_2 on tb_clsest_convertible_bond_shares_his (init_date,co_no,pd_no,exch_group_no);
create index idx_tb_clsest_convertible_bond_shares_his_3 on tb_clsest_convertible_bond_shares_his (strike_date);

-- 创建数据表：清算证券_结算_可转债申购表
use db_clsecu;
DROP TABLE IF EXISTS tb_clsest_convertible_bond_report;
CREATE TABLE tb_clsest_convertible_bond_report (
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
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    dist_qty int NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    deal_flag int NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clsest_convertible_bond_report_1 on tb_clsest_convertible_bond_report (asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_clsest_convertible_bond_report_2 on tb_clsest_convertible_bond_report (init_date,co_no,pd_no,exch_group_no,asset_acco_no);

-- 创建数据表：历史_清算证券_结算_可转债申购表
use db_clsecu_his;
DROP TABLE IF EXISTS tb_clsest_convertible_bond_report_his;
CREATE TABLE tb_clsest_convertible_bond_report_his (
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
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    dist_qty int NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    deal_flag int NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clsest_convertible_bond_report_his_1 on tb_clsest_convertible_bond_report_his (asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_clsest_convertible_bond_report_his_2 on tb_clsest_convertible_bond_report_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no);

-- 创建数据表：清算证券_结算_配股登记表
use db_clsecu;
DROP TABLE IF EXISTS tb_clsest_placement_register;
CREATE TABLE tb_clsest_placement_register (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    rights_issue_qty decimal(18,2) NOT NULL ,
    placement_price decimal(16,9) NOT NULL ,
    avail_pla_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    reg_date int NOT NULL ,
    ex_date int NOT NULL ,
    arrive_date int NOT NULL ,
    begin_trade_date int NOT NULL ,
    placement_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clsest_placement_register_1 on tb_clsest_placement_register (co_no,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_clsest_placement_register_2 on tb_clsest_placement_register (exch_no,stock_code_no);
create index idx_tb_clsest_placement_register_3 on tb_clsest_placement_register (placement_status);

-- 创建数据表：清算证券_结算_历史配股登记表
use db_clsecu_his;
DROP TABLE IF EXISTS tb_clsest_placement_register_his;
CREATE TABLE tb_clsest_placement_register_his (
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
    curr_qty decimal(18,2) NOT NULL ,
    rights_issue_qty decimal(18,2) NOT NULL ,
    placement_price decimal(16,9) NOT NULL ,
    avail_pla_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    reg_date int NOT NULL ,
    ex_date int NOT NULL ,
    arrive_date int NOT NULL ,
    begin_trade_date int NOT NULL ,
    placement_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clsest_placement_register_his_1 on tb_clsest_placement_register_his (init_date,co_no,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
commit;
