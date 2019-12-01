-- /**************************************************************************************/
-- 创建数据库【报表】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_rpts DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_rpts_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：报表_资管报表_产品资产查询表
use db_rpts;
DROP TABLE IF EXISTS tb_rptasset_pd_capit_asset;
CREATE TABLE tb_rptasset_pd_capit_asset (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_all_share decimal(18,2) NOT NULL ,
    curr_share decimal(18,2) NOT NULL ,
    pre_share decimal(18,2) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    nav_fluct decimal(18,12) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    not_money_fund_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    hk_thrgh_stock_asset decimal(18,4) NOT NULL ,
    assign_avail_amt decimal(18,4) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    today_pandl decimal(18,4) NOT NULL ,
    daily_pandl_ratio decimal(18,12) NOT NULL ,
    cash_out_amt decimal(18,4) NOT NULL ,
    stock_asset_ratio decimal(18,12) NOT NULL ,
    fund_asset_ratio decimal(18,12) NOT NULL ,
    securities_ratio decimal(18,12) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    money_fund_asset decimal(18,4) NOT NULL ,
    stock_cost decimal(18,4) NOT NULL ,
    bond_cost decimal(18,4) NOT NULL ,
    fund_cost decimal(18,4) NOT NULL ,
    repo_cost decimal(18,4) NOT NULL ,
    other_cost decimal(18,4) NOT NULL ,
    futu_cost decimal(18,4) NOT NULL ,
    hk_thrgh_stock_cost decimal(18,4) NOT NULL ,
    money_fund_cost decimal(18,4) NOT NULL ,
    unit_nav_total decimal(18,4) NOT NULL ,
    unit_divi_amt decimal(18,4) NOT NULL ,
    grp_row bigint NOT NULL ,
    last_month_pd_nav decimal(18,4) NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    avail_cash decimal(18,4) NOT NULL ,
    capit_bala decimal(18,4) NOT NULL ,
    avail_amt decimal(18,4) NOT NULL ,
    total_change_amt decimal(18,4) NOT NULL ,
    futu_cash_asset decimal(18,4) NOT NULL ,
    total_cash_asset decimal(18,4) NOT NULL ,
    stock_cash_asset decimal(18,4) NOT NULL ,
    capt_margin decimal(18,4) NOT NULL ,
    total_fina_debt decimal(18,4) NOT NULL ,
    total_loan_debt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rptasset_pd_capit_asset_1 on tb_rptasset_pd_capit_asset (co_no,pd_no);

-- 创建数据表：报表_资管报表_产品资产查询历表
use db_rpts;
DROP TABLE IF EXISTS tb_rptasset_pd_capit_asset_his;
CREATE TABLE tb_rptasset_pd_capit_asset_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_all_share decimal(18,2) NOT NULL ,
    curr_share decimal(18,2) NOT NULL ,
    pre_share decimal(18,2) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    nav_fluct decimal(18,12) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    not_money_fund_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    hk_thrgh_stock_asset decimal(18,4) NOT NULL ,
    assign_avail_amt decimal(18,4) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    today_pandl decimal(18,4) NOT NULL ,
    daily_pandl_ratio decimal(18,12) NOT NULL ,
    cash_out_amt decimal(18,4) NOT NULL ,
    stock_asset_ratio decimal(18,12) NOT NULL ,
    fund_asset_ratio decimal(18,12) NOT NULL ,
    securities_ratio decimal(18,12) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    money_fund_asset decimal(18,4) NOT NULL ,
    stock_cost decimal(18,4) NOT NULL ,
    bond_cost decimal(18,4) NOT NULL ,
    fund_cost decimal(18,4) NOT NULL ,
    repo_cost decimal(18,4) NOT NULL ,
    other_cost decimal(18,4) NOT NULL ,
    futu_cost decimal(18,4) NOT NULL ,
    hk_thrgh_stock_cost decimal(18,4) NOT NULL ,
    money_fund_cost decimal(18,4) NOT NULL ,
    unit_nav_total decimal(18,4) NOT NULL ,
    unit_divi_amt decimal(18,4) NOT NULL ,
    grp_row bigint NOT NULL ,
    last_month_pd_nav decimal(18,4) NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    avail_cash decimal(18,4) NOT NULL ,
    capit_bala decimal(18,4) NOT NULL ,
    avail_amt decimal(18,4) NOT NULL ,
    total_change_amt decimal(18,4) NOT NULL ,
    futu_cash_asset decimal(18,4) NOT NULL ,
    total_cash_asset decimal(18,4) NOT NULL ,
    stock_cash_asset decimal(18,4) NOT NULL ,
    capt_margin decimal(18,4) NOT NULL ,
    total_fina_debt decimal(18,4) NOT NULL ,
    total_loan_debt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rptasset_pd_capit_asset_his_1 on tb_rptasset_pd_capit_asset_his (init_date,co_no,pd_no);

-- 创建数据表：报表_资管报表_交易组资产查询表
use db_rpts;
DROP TABLE IF EXISTS tb_rptasset_exgrp_asset;
CREATE TABLE tb_rptasset_exgrp_asset (
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
    nav_asset decimal(18,4) NOT NULL ,
    exch_group_pd_share decimal(18,2) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    nav_fluct decimal(18,12) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    money_fund_asset decimal(18,4) NOT NULL ,
    not_money_fund_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    hk_thrgh_stock_asset decimal(18,4) NOT NULL ,
    assign_avail_amt decimal(18,4) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    today_pandl decimal(18,4) NOT NULL ,
    daily_pandl_ratio decimal(18,12) NOT NULL ,
    total_realiz_pandl decimal(18,4) NOT NULL ,
    total_realiz_pandl_ratio decimal(18,12) NOT NULL ,
    posi_ratio decimal(18,12) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    avail_cash decimal(18,4) NOT NULL ,
    capit_bala decimal(18,4) NOT NULL ,
    avail_amt decimal(18,4) NOT NULL ,
    total_change_amt decimal(18,4) NOT NULL ,
    futu_cash_asset decimal(18,4) NOT NULL ,
    total_cash_asset decimal(18,4) NOT NULL ,
    stock_cash_asset decimal(18,4) NOT NULL ,
    hk_avail_amt decimal(18,4) NOT NULL ,
    total_fina_debt decimal(18,4) NOT NULL ,
    total_loan_debt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rptasset_exgrp_asset_1 on tb_rptasset_exgrp_asset (co_no,pd_no,exch_group_no);

-- 创建数据表：报表_资管报表_交易组资产查询历表
use db_rpts;
DROP TABLE IF EXISTS tb_rptasset_exgrp_asset_his;
CREATE TABLE tb_rptasset_exgrp_asset_his (
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
    nav_asset decimal(18,4) NOT NULL ,
    exch_group_pd_share decimal(18,2) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    nav_fluct decimal(18,12) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    money_fund_asset decimal(18,4) NOT NULL ,
    not_money_fund_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    hk_thrgh_stock_asset decimal(18,4) NOT NULL ,
    assign_avail_amt decimal(18,4) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    today_pandl decimal(18,4) NOT NULL ,
    daily_pandl_ratio decimal(18,12) NOT NULL ,
    total_realiz_pandl decimal(18,4) NOT NULL ,
    total_realiz_pandl_ratio decimal(18,12) NOT NULL ,
    posi_ratio decimal(18,12) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    avail_cash decimal(18,4) NOT NULL ,
    capit_bala decimal(18,4) NOT NULL ,
    avail_amt decimal(18,4) NOT NULL ,
    total_change_amt decimal(18,4) NOT NULL ,
    futu_cash_asset decimal(18,4) NOT NULL ,
    total_cash_asset decimal(18,4) NOT NULL ,
    stock_cash_asset decimal(18,4) NOT NULL ,
    hk_avail_amt decimal(18,4) NOT NULL ,
    total_fina_debt decimal(18,4) NOT NULL ,
    total_loan_debt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rptasset_exgrp_asset_his_1 on tb_rptasset_exgrp_asset_his (init_date,co_no,pd_no,exch_group_no);

-- 创建数据表：报表_资管报表_产品汇总持仓表
use db_rpts;
DROP TABLE IF EXISTS tb_rptasset_pd_sum_posi;
CREATE TABLE tb_rptasset_pd_sum_posi (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    invest_type int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    pre_settle_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    comm_frozen_qty decimal(18,2) NOT NULL ,
    comm_unfroz_qty decimal(18,2) NOT NULL ,
    comm_capt_qty decimal(18,2) NOT NULL ,
    comm_releas_qty decimal(18,2) NOT NULL ,
    trade_frozen_qty decimal(18,2) NOT NULL ,
    trade_unfroz_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    strike_frozen_qty decimal(18,2) NOT NULL ,
    strike_unfroz_qty decimal(18,2) NOT NULL ,
    buy_pre_sett_qty decimal(18,2) NOT NULL ,
    sell_pre_sett_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    avail_qty decimal(18,2) NOT NULL ,
    full_holding_amt decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    impawn_qty decimal(18,2) NOT NULL ,
    bond_receivable_amt decimal(18,4) NOT NULL ,
    net_price decimal(16,9) NOT NULL ,
    full_price decimal(16,9) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    cost_price decimal(16,9) NOT NULL ,
    posi_nav_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rptasset_pd_sum_posi_1 on tb_rptasset_pd_sum_posi (co_no,pd_no,stock_code_no,invest_type);

-- 创建数据表：报表_资管报表_产品汇总持仓历史
use db_rpts_his;
DROP TABLE IF EXISTS tb_rptasset_pd_sum_posi_his;
CREATE TABLE tb_rptasset_pd_sum_posi_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    invest_type int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    pre_settle_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    comm_frozen_qty decimal(18,2) NOT NULL ,
    comm_unfroz_qty decimal(18,2) NOT NULL ,
    comm_capt_qty decimal(18,2) NOT NULL ,
    comm_releas_qty decimal(18,2) NOT NULL ,
    trade_frozen_qty decimal(18,2) NOT NULL ,
    trade_unfroz_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    strike_frozen_qty decimal(18,2) NOT NULL ,
    strike_unfroz_qty decimal(18,2) NOT NULL ,
    buy_pre_sett_qty decimal(18,2) NOT NULL ,
    sell_pre_sett_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    avail_qty decimal(18,2) NOT NULL ,
    full_holding_amt decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    impawn_qty decimal(18,2) NOT NULL ,
    bond_receivable_amt decimal(18,4) NOT NULL ,
    net_price decimal(16,9) NOT NULL ,
    full_price decimal(16,9) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    cost_price decimal(16,9) NOT NULL ,
    posi_nav_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rptasset_pd_sum_posi_his_1 on tb_rptasset_pd_sum_posi_his (init_date,co_no,pd_no,stock_code_no,invest_type);
create index idx_tb_rptasset_pd_sum_posi_his_2 on tb_rptasset_pd_sum_posi_his (co_no,pd_no,init_date);

-- 创建数据表：报表_资管报表_产品持仓查询表
use db_rpts;
DROP TABLE IF EXISTS tb_rptasset_pd_posi;
CREATE TABLE tb_rptasset_pd_posi (
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
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    exch_no int NOT NULL ,
    invest_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    pre_settle_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    comm_frozen_qty decimal(18,2) NOT NULL ,
    comm_unfroz_qty decimal(18,2) NOT NULL ,
    comm_capt_qty decimal(18,2) NOT NULL ,
    comm_releas_qty decimal(18,2) NOT NULL ,
    trade_frozen_qty decimal(18,2) NOT NULL ,
    trade_unfroz_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    strike_frozen_qty decimal(18,2) NOT NULL ,
    strike_unfroz_qty decimal(18,2) NOT NULL ,
    buy_pre_sett_qty decimal(18,2) NOT NULL ,
    sell_pre_sett_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    avail_qty decimal(18,2) NOT NULL ,
    impawn_qty decimal(18,2) NOT NULL ,
    block_trade_posi_market_value decimal(18,4) NOT NULL ,
    asset_type int NOT NULL ,
    fair_price decimal(16,9) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    net_price_flag int NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    total_stock_issue decimal(18,2) NOT NULL ,
    circl_stock_capit decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rptasset_pd_posi_1 on tb_rptasset_pd_posi (co_no,pd_no,asset_acco_no,stock_acco_no,stock_code_no,invest_type);

-- 创建数据表：报表_资管报表_产品持仓查询历表
use db_rpts;
DROP TABLE IF EXISTS tb_rptasset_pd_posi_his;
CREATE TABLE tb_rptasset_pd_posi_his (
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
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    exch_no int NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    posi_nav_ratio decimal(18,12) NOT NULL ,
    invest_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    pre_settle_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    buy_pre_sett_qty decimal(18,2) NOT NULL ,
    sell_pre_sett_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    avail_qty decimal(18,2) NOT NULL ,
    full_holding_amt decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    impawn_qty decimal(18,2) NOT NULL ,
    bond_receivable_amt decimal(18,4) NOT NULL ,
    net_price decimal(16,9) NOT NULL ,
    full_price decimal(16,9) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    cost_price decimal(16,9) NOT NULL ,
    asset_type int NOT NULL ,
    fair_price decimal(16,9) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    net_price_flag int NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    total_stock_issue decimal(18,2) NOT NULL ,
    circl_stock_capit decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rptasset_pd_posi_his_1 on tb_rptasset_pd_posi_his (init_date,co_no,pd_no,stock_acco_no,asset_acco_no,invest_type);
create index idx_tb_rptasset_pd_posi_his_2 on tb_rptasset_pd_posi_his (co_no,pd_no,init_date);

-- 创建数据表：报表_资管报表_交易组持仓查询表
use db_rpts;
DROP TABLE IF EXISTS tb_rptasset_exgrp_posi;
CREATE TABLE tb_rptasset_exgrp_posi (
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
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    exch_no int NOT NULL ,
    invest_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    pre_settle_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    comm_frozen_qty decimal(18,2) NOT NULL ,
    comm_unfroz_qty decimal(18,2) NOT NULL ,
    comm_capt_qty decimal(18,2) NOT NULL ,
    comm_releas_qty decimal(18,2) NOT NULL ,
    trade_frozen_qty decimal(18,2) NOT NULL ,
    trade_unfroz_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    strike_frozen_qty decimal(18,2) NOT NULL ,
    strike_unfroz_qty decimal(18,2) NOT NULL ,
    buy_pre_sett_qty decimal(18,2) NOT NULL ,
    sell_pre_sett_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    impawn_qty decimal(18,2) NOT NULL ,
    bond_receivable_amt decimal(18,4) NOT NULL ,
    net_price decimal(16,9) NOT NULL ,
    full_price decimal(16,9) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    full_holding_amt decimal(18,4) NOT NULL ,
    trade_avail_qty decimal(18,2) NOT NULL ,
    comm_avail_qty decimal(18,2) NOT NULL ,
    static_avail_qty decimal(18,2) NOT NULL ,
    block_trade_posi_market_value decimal(18,4) NOT NULL ,
    asset_type int NOT NULL ,
    fair_price decimal(16,9) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    net_price_flag int NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rptasset_exgrp_posi_1 on tb_rptasset_exgrp_posi (co_no,pd_no,exch_group_no,asset_acco_no,stock_acco_no,invest_type);

-- 创建数据表：报表_资管报表_交易组持仓查询历表
use db_rpts;
DROP TABLE IF EXISTS tb_rptasset_exgrp_posi_his;
CREATE TABLE tb_rptasset_exgrp_posi_his (
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
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    exch_no int NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    posi_nav_ratio decimal(18,12) NOT NULL ,
    invest_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    pre_settle_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    buy_pre_sett_qty decimal(18,2) NOT NULL ,
    sell_pre_sett_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    full_holding_amt decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    impawn_qty decimal(18,2) NOT NULL ,
    bond_receivable_amt decimal(18,4) NOT NULL ,
    net_price decimal(16,9) NOT NULL ,
    full_price decimal(16,9) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    cost_price decimal(16,9) NOT NULL ,
    trade_avail_qty decimal(18,2) NOT NULL ,
    comm_avail_qty decimal(18,2) NOT NULL ,
    static_avail_qty decimal(18,2) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    pandl_ratio decimal(18,12) NOT NULL ,
    asset_type int NOT NULL ,
    fair_price decimal(16,9) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    net_price_flag int NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rptasset_exgrp_posi_his_1 on tb_rptasset_exgrp_posi_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no,invest_type);
create index idx_tb_rptasset_exgrp_posi_his_2 on tb_rptasset_exgrp_posi_his (co_no,pd_no,init_date);

-- 创建数据表：报表_资管报表_公共-基础-业务标志表
use db_rpts;
DROP TABLE IF EXISTS tb_base_busiflag;
CREATE TABLE tb_base_busiflag (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    busi_type int NOT NULL ,
    busi_sub_type int NOT NULL ,
    busi_flag int NOT NULL ,
    busi_name varchar(64) NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_base_busiflag_1 on tb_base_busiflag (busi_flag);
create index idx_tb_base_busiflag_2 on tb_base_busiflag (busi_type,busi_sub_type);
create index idx_tb_base_busiflag_3 on tb_base_busiflag (time_stamp);

-- 创建数据表：报表_资管报表_公共-基础-港股通汇率表
use db_rpts;
DROP TABLE IF EXISTS tb_base_hk_exch_rate;
CREATE TABLE tb_base_hk_exch_rate (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    exch_no int NOT NULL ,
    for_crncy_type varchar(3) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    buy_ref_rate decimal(18,12) NOT NULL ,
    sell_ref_rate decimal(18,12) NOT NULL ,
    settle_buy_rate decimal(18,12) NOT NULL ,
    settle_sell_rate decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_base_hk_exch_rate_1 on tb_base_hk_exch_rate (init_date,exch_no);

-- 创建数据表：报表_资管报表_公共-基础-机构汇率表
use db_rpts;
DROP TABLE IF EXISTS tb_base_co_exch_rate;
CREATE TABLE tb_base_co_exch_rate (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    for_crncy_type varchar(3) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    buy_exch_rate decimal(18,12) NOT NULL ,
    sale_exch_rate decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_base_co_exch_rate_1 on tb_base_co_exch_rate (co_no,for_crncy_type,crncy_type);

-- 创建数据表：报表_资管报表_交易业务处理配置表
use db_rpts;
DROP TABLE IF EXISTS vi_act_operationconfig;
CREATE TABLE vi_act_operationconfig (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_type int NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    clear_date int NOT NULL ,
    oper_type int NOT NULL ,
    asset_deal_date_type int NOT NULL ,
    asset_deal_time_type int NOT NULL ,
    cash_deal_type int NOT NULL ,
    cash_deal_date_type int NOT NULL ,
    cash_deal_time_type int NOT NULL ,
    cash_avail_date_type int NOT NULL ,
    stock_deal_type int NOT NULL ,
    stock_deal_date_type int NOT NULL ,
    stock_deal_time_type int NOT NULL ,
    stock_avail_date_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_act_operationconfig_1 on vi_act_operationconfig (exch_no,stock_type,order_dir,contrc_dir,oper_type);

-- 创建数据表：报表_资管报表_产品-账户-历史产品信息表
use db_rpts_his;
DROP TABLE IF EXISTS vi_pdacco_pd_info_his;
CREATE TABLE vi_pdacco_pd_info_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    pd_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_code varchar(32) NOT NULL ,
    pd_name varchar(64) NOT NULL ,
    pd_flname varchar(255) NOT NULL ,
    found_date int NOT NULL ,
    pd_manager varchar(32) NOT NULL ,
    pd_type int NOT NULL ,
    apply_currency varchar(3) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    first_asset decimal(18,4) NOT NULL ,
    first_amt decimal(18,4) NOT NULL ,
    pd_all_share decimal(18,2) NOT NULL ,
    curr_share decimal(18,2) NOT NULL ,
    pre_share decimal(18,2) NOT NULL ,
    his_max_per_nav decimal(18,4) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    coust_full_name varchar(255) NOT NULL ,
    coust_acco varchar(16) NOT NULL ,
    coust_acco_name varchar(64) NOT NULL ,
    pd_status varchar(2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdacco_pd_info_his_1 on vi_pdacco_pd_info_his (init_date,co_no,pd_code);
create index idx_vi_pdacco_pd_info_his_2 on vi_pdacco_pd_info_his (init_date,pd_no);

-- 创建数据表：报表_资管报表_产品-资金-产品资金表
use db_rpts;
DROP TABLE IF EXISTS vi_pdcapit_pd_capit;
CREATE TABLE vi_pdcapit_pd_capit (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    first_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    pd_dist_amt decimal(18,4) NOT NULL ,
    pd_auth_amt decimal(18,4) NOT NULL ,
    total_cash_divide decimal(18,4) NOT NULL ,
    total_pre_fee decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    intrst_cacl_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdcapit_pd_capit_1 on vi_pdcapit_pd_capit (init_date,pd_no,crncy_type);
create index idx_vi_pdcapit_pd_capit_2 on vi_pdcapit_pd_capit (init_date,co_no,pd_no);

-- 创建数据表：报表_资管报表_交易证券-账户-资产账户业务资金表
use db_rpts;
DROP TABLE IF EXISTS vi_tdseac_asac_busi_capit;
CREATE TABLE vi_tdseac_asac_busi_capit (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    comm_frozen_amt decimal(18,4) NOT NULL ,
    comm_unfroz_amt decimal(18,4) NOT NULL ,
    comm_capt_amt decimal(18,4) NOT NULL ,
    comm_releas_amt decimal(18,4) NOT NULL ,
    trade_frozen_amt decimal(18,4) NOT NULL ,
    trade_unfroz_amt decimal(18,4) NOT NULL ,
    trade_capt_amt decimal(18,4) NOT NULL ,
    trade_releas_amt decimal(18,4) NOT NULL ,
    strike_capt_amt decimal(18,4) NOT NULL ,
    strike_releas_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdseac_asac_busi_capit_1 on vi_tdseac_asac_busi_capit (asset_acco_no,exch_crncy_type);
create index idx_vi_tdseac_asac_busi_capit_2 on vi_tdseac_asac_busi_capit (co_no,pd_no,exch_crncy_type);

-- 创建数据表：报表_资管报表_产品-资金-产品资产表
use db_rpts;
DROP TABLE IF EXISTS vi_pdcapit_pd_asset;
CREATE TABLE vi_pdcapit_pd_asset (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdcapit_pd_asset_1 on vi_pdcapit_pd_asset (pd_no,crncy_type);

-- 创建数据表：报表_资管报表_产品-资金-历史产品资产表
use db_rpts_his;
DROP TABLE IF EXISTS vi_pdcapit_pd_asset_his;
CREATE TABLE vi_pdcapit_pd_asset_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdcapit_pd_asset_his_1 on vi_pdcapit_pd_asset_his (init_date,pd_no,crncy_type);

-- 创建数据表：报表_资管报表_产品证券-资金-资产账户资金表
use db_rpts;
DROP TABLE IF EXISTS vi_pdseca_asac_capit;
CREATE TABLE vi_pdseca_asac_capit (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    dist_amt decimal(18,4) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_rate decimal(18,12) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdseca_asac_capit_1 on vi_pdseca_asac_capit (asset_acco_no,crncy_type);
create index idx_vi_pdseca_asac_capit_2 on vi_pdseca_asac_capit (co_no,pd_no,crncy_type);

-- 创建数据表：报表_资管报表_产品证券-资金-历史资产账户资金表
use db_rpts_his;
DROP TABLE IF EXISTS vi_pdseca_asac_capit_his;
CREATE TABLE vi_pdseca_asac_capit_his (
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
    crncy_type varchar(3) NOT NULL ,
    dist_amt decimal(18,4) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_rate decimal(18,12) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdseca_asac_capit_his_1 on vi_pdseca_asac_capit_his (init_date,asset_acco_no,crncy_type);
create index idx_vi_pdseca_asac_capit_his_2 on vi_pdseca_asac_capit_his (init_date,co_no,pd_no,crncy_type);

-- 创建数据表：报表_资管报表_产品证券-资金-交易组资产表
use db_rpts;
DROP TABLE IF EXISTS vi_pdseca_exgp_asset;
CREATE TABLE vi_pdseca_exgp_asset (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_vi_pdseca_exgp_asset_1 on vi_pdseca_exgp_asset (exch_group_no,crncy_type);

-- 创建数据表：报表_资管报表_产品证券-资金-交易组资金表
use db_rpts;
DROP TABLE IF EXISTS vi_pdseca_exgp_capit;
CREATE TABLE vi_pdseca_exgp_capit (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_rate decimal(18,12) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdseca_exgp_capit_1 on vi_pdseca_exgp_capit (exch_group_no,asset_acco_no,crncy_type);
create index idx_vi_pdseca_exgp_capit_2 on vi_pdseca_exgp_capit (co_no,pd_no,crncy_type);

-- 创建数据表：报表_资管报表_交易证券-账户-交易组业务资金表
use db_rpts;
DROP TABLE IF EXISTS vi_tdseac_exgp_busi_capit;
CREATE TABLE vi_tdseac_exgp_busi_capit (
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
    exch_crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    comm_frozen_amt decimal(18,4) NOT NULL ,
    comm_unfroz_amt decimal(18,4) NOT NULL ,
    comm_capt_amt decimal(18,4) NOT NULL ,
    comm_releas_amt decimal(18,4) NOT NULL ,
    trade_frozen_amt decimal(18,4) NOT NULL ,
    trade_unfroz_amt decimal(18,4) NOT NULL ,
    trade_capt_amt decimal(18,4) NOT NULL ,
    trade_releas_amt decimal(18,4) NOT NULL ,
    strike_capt_amt decimal(18,4) NOT NULL ,
    strike_releas_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdseac_exgp_busi_capit_1 on vi_tdseac_exgp_busi_capit (exch_group_no,asset_acco_no,exch_crncy_type);
create index idx_vi_tdseac_exgp_busi_capit_2 on vi_tdseac_exgp_busi_capit (co_no,pd_no,exch_crncy_type);

-- 创建数据表：报表_资管报表_产品证券-持仓-资产账户持仓表
use db_rpts;
DROP TABLE IF EXISTS vi_pdsepo_asac_posi;
CREATE TABLE vi_pdsepo_asac_posi (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdsepo_asac_posi_1 on vi_pdsepo_asac_posi (asset_acco_no,stock_acco_no,stock_code_no);
create index idx_vi_pdsepo_asac_posi_2 on vi_pdsepo_asac_posi (co_no,pd_no,exch_no);

-- 创建数据表：报表_资管报表_视图-数据-产品-资产账户-持仓
use db_rpts;
DROP TABLE IF EXISTS vi_dt_pd_asac_posi;
CREATE TABLE vi_dt_pd_asac_posi (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    comm_frozen_qty decimal(18,2) NOT NULL ,
    comm_unfroz_qty decimal(18,2) NOT NULL ,
    comm_capt_qty decimal(18,2) NOT NULL ,
    comm_releas_qty decimal(18,2) NOT NULL ,
    trade_frozen_qty decimal(18,2) NOT NULL ,
    trade_unfroz_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    strike_frozen_qty decimal(18,2) NOT NULL ,
    strike_unfroz_qty decimal(18,2) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_dt_pd_asac_posi_1 on vi_dt_pd_asac_posi (asset_acco_no,stock_acco_no,stock_code_no);
create index idx_vi_dt_pd_asac_posi_2 on vi_dt_pd_asac_posi (co_no,pd_no);

-- 创建数据表：报表_资管报表_交易证券-账户-历史交易组业务资金表
use db_rpts_his;
DROP TABLE IF EXISTS vi_tdseac_exgp_busi_capit_his;
CREATE TABLE vi_tdseac_exgp_busi_capit_his (
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
    exch_crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    comm_frozen_amt decimal(18,4) NOT NULL ,
    comm_unfroz_amt decimal(18,4) NOT NULL ,
    comm_capt_amt decimal(18,4) NOT NULL ,
    comm_releas_amt decimal(18,4) NOT NULL ,
    trade_frozen_amt decimal(18,4) NOT NULL ,
    trade_unfroz_amt decimal(18,4) NOT NULL ,
    trade_capt_amt decimal(18,4) NOT NULL ,
    trade_releas_amt decimal(18,4) NOT NULL ,
    strike_capt_amt decimal(18,4) NOT NULL ,
    strike_releas_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdseac_exgp_busi_capit_his_1 on vi_tdseac_exgp_busi_capit_his (exch_group_no,asset_acco_no,exch_crncy_type);
create index idx_vi_tdseac_exgp_busi_capit_his_2 on vi_tdseac_exgp_busi_capit_his (init_date,co_no,pd_no,exch_crncy_type);

-- 创建数据表：报表_资管报表_交易证券-账户-交易组业务持仓表
use db_rpts;
DROP TABLE IF EXISTS vi_tdseac_exgp_busi_posi;
CREATE TABLE vi_tdseac_exgp_busi_posi (
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
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    comm_frozen_qty decimal(18,2) NOT NULL ,
    comm_unfroz_qty decimal(18,2) NOT NULL ,
    comm_capt_qty decimal(18,2) NOT NULL ,
    comm_releas_qty decimal(18,2) NOT NULL ,
    trade_frozen_qty decimal(18,2) NOT NULL ,
    trade_unfroz_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    strike_frozen_qty decimal(18,2) NOT NULL ,
    strike_unfroz_qty decimal(18,2) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdseac_exgp_busi_posi_1 on vi_tdseac_exgp_busi_posi (exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_vi_tdseac_exgp_busi_posi_2 on vi_tdseac_exgp_busi_posi (co_no,pd_no);

-- 创建数据表：报表_资管报表_产品证券-持仓-交易组持仓表
use db_rpts;
DROP TABLE IF EXISTS vi_pdsepo_exgp_posi;
CREATE TABLE vi_pdsepo_exgp_posi (
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
    asset_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdsepo_exgp_posi_1 on vi_pdsepo_exgp_posi (init_date,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_vi_pdsepo_exgp_posi_2 on vi_pdsepo_exgp_posi (init_date,co_no,pd_no,exch_no);

-- 创建数据表：报表_资管报表_产品证券-持仓-交易组债券质押表
use db_rpts;
DROP TABLE IF EXISTS vi_pdsepo_exgp_bond_pledge;
CREATE TABLE vi_pdsepo_exgp_bond_pledge (
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
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    put_impawn_qty decimal(18,2) NOT NULL ,
    get_impawn_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdsepo_exgp_bond_pledge_1 on vi_pdsepo_exgp_bond_pledge (exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);

-- 创建数据表：报表_资管报表_产品证券-持仓-历史交易组债券质押表
use db_rpts_his;
DROP TABLE IF EXISTS vi_pdsepo_exgp_bond_pledge_his;
CREATE TABLE vi_pdsepo_exgp_bond_pledge_his (
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
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    put_impawn_qty decimal(18,2) NOT NULL ,
    get_impawn_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdsepo_exgp_bond_pledge_his_1 on vi_pdsepo_exgp_bond_pledge_his (init_date,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);

-- 创建数据表：报表_资管报表_产品证券-持仓-债券回购表
use db_rpts;
DROP TABLE IF EXISTS vi_pdsepo_bond_repo;
CREATE TABLE vi_pdsepo_bond_repo (
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
    stock_code varchar(6) NOT NULL ,
    target_code_no int NOT NULL ,
    target_code varchar(6) NOT NULL ,
    order_dir int NOT NULL ,
    repo_qty decimal(18,2) NOT NULL ,
    repo_amt decimal(18,4) NOT NULL ,
    repo_rate decimal(18,12) NOT NULL ,
    repo_trade_date int NOT NULL ,
    repo_order_id bigint NOT NULL ,
    repo_strike_id bigint NOT NULL ,
    repo_days int NOT NULL ,
    repo_cale_days int NOT NULL ,
    repo_back_date int NOT NULL ,
    repo_back_amt decimal(18,4) NOT NULL ,
    repo_back_intrst decimal(18,4) NOT NULL ,
    repo_back_trade_date int NOT NULL ,
    repo_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_vi_pdsepo_bond_repo_1 on vi_pdsepo_bond_repo (asset_acco_no,stock_acco_no,stock_code_no,order_dir);
create index idx_vi_pdsepo_bond_repo_2 on vi_pdsepo_bond_repo (co_no,pd_no,exch_group_no);
create index idx_vi_pdsepo_bond_repo_3 on vi_pdsepo_bond_repo (repo_back_trade_date,repo_status);

-- 创建数据表：报表_资管报表_产品证券-持仓-历史债券回购表
use db_rpts_his;
DROP TABLE IF EXISTS vi_pdsepo_bond_repo_his;
CREATE TABLE vi_pdsepo_bond_repo_his (
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
    target_code_no int NOT NULL ,
    target_code varchar(6) NOT NULL ,
    order_dir int NOT NULL ,
    repo_qty decimal(18,2) NOT NULL ,
    repo_amt decimal(18,4) NOT NULL ,
    repo_rate decimal(18,12) NOT NULL ,
    repo_trade_date int NOT NULL ,
    repo_order_id bigint NOT NULL ,
    repo_strike_id bigint NOT NULL ,
    repo_days int NOT NULL ,
    repo_cale_days int NOT NULL ,
    repo_back_date int NOT NULL ,
    repo_back_amt decimal(18,4) NOT NULL ,
    repo_back_intrst decimal(18,4) NOT NULL ,
    repo_back_trade_date int NOT NULL ,
    repo_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_vi_pdsepo_bond_repo_his_1 on vi_pdsepo_bond_repo_his (init_date,asset_acco_no,stock_acco_no,stock_code_no,order_dir);
create index idx_vi_pdsepo_bond_repo_his_2 on vi_pdsepo_bond_repo_his (init_date,co_no,pd_no,exch_group_no);
create index idx_vi_pdsepo_bond_repo_his_3 on vi_pdsepo_bond_repo_his (repo_back_trade_date,repo_status);

-- 创建数据表：报表_资管报表_交易证券-报盘-成交表
use db_rpts;
DROP TABLE IF EXISTS vi_tdserp_strike;
CREATE TABLE vi_tdserp_strike (
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
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_vi_tdserp_strike_1 on vi_tdserp_strike (pass_no,out_acco,exch_no,strike_date,strike_no);
create index idx_vi_tdserp_strike_2 on vi_tdserp_strike (init_date,co_no,pd_no,exch_group_no);
create index idx_vi_tdserp_strike_3 on vi_tdserp_strike (order_date);
create index idx_vi_tdserp_strike_4 on vi_tdserp_strike (exter_comm_flag,record_valid_flag);

-- 创建数据表：报表_资管报表_交易证券-报盘-成交表-历史
use db_rpts_his;
DROP TABLE IF EXISTS vi_tdserp_strike_his;
CREATE TABLE vi_tdserp_strike_his (
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
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdserp_strike_his_1 on vi_tdserp_strike_his (pass_no,out_acco,exch_no,strike_date,strike_no);
create index idx_vi_tdserp_strike_his_2 on vi_tdserp_strike_his (init_date,co_no,pd_no,exch_group_no);
create index idx_vi_tdserp_strike_his_3 on vi_tdserp_strike_his (order_date);
create index idx_vi_tdserp_strike_his_4 on vi_tdserp_strike_his (exter_comm_flag,record_valid_flag);

-- 创建数据表：报表_资管报表_交易证券-T0-证券持仓明细表
use db_rpts;
DROP TABLE IF EXISTS vi_tdset0_stock_posi_detail;
CREATE TABLE vi_tdset0_stock_posi_detail (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    open_posi_date int NOT NULL ,
    open_posi_time int NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    open_posi_value decimal(18,4) NOT NULL ,
    open_posi_fee decimal(18,4) NOT NULL ,
    close_posi_qty decimal(18,2) NOT NULL ,
    close_posi_market_value decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    over_night_pandl decimal(18,4) NOT NULL ,
    posi_status varchar(2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    un_close_marke_value decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_vi_tdset0_stock_posi_detail_1 on vi_tdset0_stock_posi_detail (opor_no,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_vi_tdset0_stock_posi_detail_2 on vi_tdset0_stock_posi_detail (co_no,pd_no,exch_group_no);

-- 创建数据表：报表_资管报表_交易证券-T0-历史证券持仓明细表
use db_rpts_his;
DROP TABLE IF EXISTS vi_tdset0_stock_posi_detail_his;
CREATE TABLE vi_tdset0_stock_posi_detail_his (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    open_posi_date int NOT NULL ,
    open_posi_time int NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    open_posi_value decimal(18,4) NOT NULL ,
    open_posi_fee decimal(18,4) NOT NULL ,
    close_posi_qty decimal(18,2) NOT NULL ,
    close_posi_market_value decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    over_night_pandl decimal(18,4) NOT NULL ,
    posi_status varchar(2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    un_close_marke_value decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_vi_tdset0_stock_posi_detail_his_1 on vi_tdset0_stock_posi_detail_his (opor_no,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_vi_tdset0_stock_posi_detail_his_2 on vi_tdset0_stock_posi_detail_his (co_no,pd_no,exch_group_no);

-- 创建数据表：报表_资管报表_交易证券-T0-操作员券源限额设置表
use db_rpts;
DROP TABLE IF EXISTS vi_tdset0_opor_stock_limit;
CREATE TABLE vi_tdset0_opor_stock_limit (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    trade_limit_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    total_realize_pandl decimal(18,4) NOT NULL ,
    total_open_posi_fee decimal(18,4) NOT NULL ,
    total_close_posi_fee decimal(18,4) NOT NULL ,
    out_order_releas_qty decimal(18,2) NOT NULL ,
    out_order_capt_qty decimal(18,2) NOT NULL ,
    out_strike_releas_qty decimal(18,2) NOT NULL ,
    out_strike_capt_qty decimal(18,2) NOT NULL ,
    limit_set_status varchar(2) NOT NULL ,
    limit_set_type int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdset0_opor_stock_limit_1 on vi_tdset0_opor_stock_limit (opor_no,exch_group_no,asset_acco_no,stock_code_no,stock_acco_no);
create index idx_vi_tdset0_opor_stock_limit_2 on vi_tdset0_opor_stock_limit (co_no,pd_no);
create index idx_vi_tdset0_opor_stock_limit_3 on vi_tdset0_opor_stock_limit (limit_set_status,limit_set_type);

-- 创建数据表：报表_资管报表_交易证券-T0-操作员券源限额设置历史表
use db_rpts_his;
DROP TABLE IF EXISTS vi_tdset0_opor_stock_limit_his;
CREATE TABLE vi_tdset0_opor_stock_limit_his (
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
    stock_acco_no int NOT NULL ,
    invest_type int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    trade_limit_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    total_realize_pandl decimal(18,4) NOT NULL ,
    total_open_posi_fee decimal(18,4) NOT NULL ,
    total_close_posi_fee decimal(18,4) NOT NULL ,
    out_order_releas_qty decimal(18,2) NOT NULL ,
    out_order_capt_qty decimal(18,2) NOT NULL ,
    out_strike_releas_qty decimal(18,2) NOT NULL ,
    out_strike_capt_qty decimal(18,2) NOT NULL ,
    limit_set_status varchar(2) NOT NULL ,
    limit_set_type int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdset0_opor_stock_limit_his_1 on vi_tdset0_opor_stock_limit_his (init_date,opor_no,exch_group_no,asset_acco_no,stock_code_no);
create index idx_vi_tdset0_opor_stock_limit_his_2 on vi_tdset0_opor_stock_limit_his (limit_set_status,limit_set_type);

-- 创建数据表：报表_资管报表_交易证券-T0-持仓盈亏信息历史表
use db_rpts_his;
DROP TABLE IF EXISTS vi_tdset0_hold_pandl_his;
CREATE TABLE vi_tdset0_hold_pandl_his (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    posi_qty decimal(18,2) NOT NULL ,
    trade_qty decimal(18,2) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    close_posi_market_value decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    over_night_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_vi_tdset0_hold_pandl_his_1 on vi_tdset0_hold_pandl_his (init_date,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_vi_tdset0_hold_pandl_his_2 on vi_tdset0_hold_pandl_his (init_date,co_no,pd_no,exch_group_no);

-- 创建数据表：报表_资管报表_交易证券-T0-券源持仓信息历史表
use db_rpts_his;
DROP TABLE IF EXISTS vi_tdset0_source_hold_posi_his;
CREATE TABLE vi_tdset0_source_hold_posi_his (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    source_stock_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_vi_tdset0_source_hold_posi_his_1 on vi_tdset0_source_hold_posi_his (init_date,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_vi_tdset0_source_hold_posi_his_2 on vi_tdset0_source_hold_posi_his (init_date,co_no,pd_no,exch_group_no);

-- 创建数据表：报表_资管报表_交易证券-T0-账户交易信息历史表
use db_rpts_his;
DROP TABLE IF EXISTS vi_tdset0_trade_total_his;
CREATE TABLE vi_tdset0_trade_total_his (
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
    begin_amt decimal(18,4) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    trade_amt decimal(18,4) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    close_posi_market_value decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    buy_qty decimal(18,2) NOT NULL ,
    sell_qty decimal(18,2) NOT NULL ,
    buy_amt decimal(18,4) NOT NULL ,
    sell_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_vi_tdset0_trade_total_his_1 on vi_tdset0_trade_total_his (init_date,asset_acco_no);
create index idx_vi_tdset0_trade_total_his_2 on vi_tdset0_trade_total_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no);

-- 创建数据表：报表_资管报表_T0_操作员阈值设置表
use db_rpts;
DROP TABLE IF EXISTS vi_tdset0_opor_tshold_set;
CREATE TABLE vi_tdset0_opor_tshold_set (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    opor_warn_tshold decimal(18,4) NOT NULL ,
    opor_stop_tshold decimal(18,4) NOT NULL ,
    order_limit_time int NOT NULL ,
    per_secu_posi_ratio decimal(18,12) NOT NULL ,
    posi_limit_time int NOT NULL ,
    order_ctrl_qty decimal(18,2) NOT NULL ,
    order_ctrl_amt decimal(18,4) NOT NULL ,
    stock_warn_ratio decimal(18,12) NOT NULL ,
    stock_stop_ratio decimal(18,12) NOT NULL ,
    stock_warn_amt decimal(18,4) NOT NULL ,
    stock_stop_amt decimal(18,4) NOT NULL ,
    trig_oper_type int NOT NULL ,
    open_close_permission int NOT NULL ,
    risk_oper int NOT NULL ,
    fee_calc_type int NOT NULL ,
    permit_margin_trade int NOT NULL ,
    buy_fee_ratio decimal(18,12) NOT NULL ,
    sell_fee_ratio decimal(18,12) NOT NULL ,
    buy_min_fee decimal(18,4) NOT NULL ,
    sell_min_fee decimal(18,4) NOT NULL ,
    trade_capt_amt decimal(18,4) NOT NULL ,
    trade_releas_amt decimal(18,4) NOT NULL ,
    strike_capt_amt decimal(18,4) NOT NULL ,
    strike_releas_amt decimal(18,4) NOT NULL ,
    sum_realize_pandl decimal(18,4) NOT NULL ,
    amt_diff decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdset0_opor_tshold_set_1 on vi_tdset0_opor_tshold_set (opor_no);

-- 创建数据表：报表_资管报表_T0_操作员参数设置表
use db_rpts;
DROP TABLE IF EXISTS vi_tdset0_opor_param_set;
CREATE TABLE vi_tdset0_opor_param_set (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    config_no bigint NOT NULL ,
    config_value varchar(2048) NOT NULL ,
    config_name varchar(64) NOT NULL ,
    config_memo varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdset0_opor_param_set_1 on vi_tdset0_opor_param_set (co_no,opor_no,config_no);

-- 创建数据表：报表_资管报表_T0_证券持仓明细表
use db_rpts;
DROP TABLE IF EXISTS vi_tdset0_stock_posi_detail;
CREATE TABLE vi_tdset0_stock_posi_detail (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    open_posi_date int NOT NULL ,
    open_posi_time int NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    open_posi_value decimal(18,4) NOT NULL ,
    open_posi_fee decimal(18,4) NOT NULL ,
    close_posi_qty decimal(18,2) NOT NULL ,
    close_posi_market_value decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    over_night_pandl decimal(18,4) NOT NULL ,
    posi_status varchar(2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_vi_tdset0_stock_posi_detail_1 on vi_tdset0_stock_posi_detail (opor_no,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_vi_tdset0_stock_posi_detail_2 on vi_tdset0_stock_posi_detail (co_no,pd_no,exch_group_no);
create index idx_vi_tdset0_stock_posi_detail_3 on vi_tdset0_stock_posi_detail (posi_status);

-- 创建数据表：报表_资管报表_T0_证券持仓明细表历史
use db_rpts_his;
DROP TABLE IF EXISTS vi_tdset0_stock_posi_detail_his;
CREATE TABLE vi_tdset0_stock_posi_detail_his (
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
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    open_posi_date int NOT NULL ,
    open_posi_time int NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    open_posi_value decimal(18,4) NOT NULL ,
    open_posi_fee decimal(18,4) NOT NULL ,
    close_posi_qty decimal(18,2) NOT NULL ,
    close_posi_market_value decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    over_night_pandl decimal(18,4) NOT NULL ,
    posi_status varchar(2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_vi_tdset0_stock_posi_detail_his_1 on vi_tdset0_stock_posi_detail_his (init_date,opor_no,exch_group_no,asset_acco_no,stock_acco_no);
create index idx_vi_tdset0_stock_posi_detail_his_2 on vi_tdset0_stock_posi_detail_his (init_date,co_no,pd_no,exch_group_no);
create index idx_vi_tdset0_stock_posi_detail_his_3 on vi_tdset0_stock_posi_detail_his (posi_status);

-- 创建数据表：报表_资管报表_T0_证券平仓成交明细表
use db_rpts;
DROP TABLE IF EXISTS vi_tdset0_close_posi_strike_detail;
CREATE TABLE vi_tdset0_close_posi_strike_detail (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    detail_posi_id bigint NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    close_posi_date int NOT NULL ,
    close_posi_time int NOT NULL ,
    close_posi_price decimal(16,9) NOT NULL ,
    close_posi_qty decimal(18,2) NOT NULL ,
    close_posi_market_value decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdset0_close_posi_strike_detail_1 on vi_tdset0_close_posi_strike_detail (init_date,detail_posi_id,strike_no);

-- 创建数据表：报表_资管报表_T0_证券平仓成交明细表历史
use db_rpts_his;
DROP TABLE IF EXISTS vi_tdset0_close_posi_strike_detail_his;
CREATE TABLE vi_tdset0_close_posi_strike_detail_his (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    detail_posi_id bigint NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    close_posi_date int NOT NULL ,
    close_posi_time int NOT NULL ,
    close_posi_price decimal(16,9) NOT NULL ,
    close_posi_qty decimal(18,2) NOT NULL ,
    close_posi_market_value decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdset0_close_posi_strike_detail_his_1 on vi_tdset0_close_posi_strike_detail_his (init_date,detail_posi_id,strike_no);

-- 创建数据表：报表_资管报表_T0_操作员券源设置表
use db_rpts;
DROP TABLE IF EXISTS vi_tdset0_opor_stock_source;
CREATE TABLE vi_tdset0_opor_stock_source (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    source_stock_qty decimal(18,2) NOT NULL ,
    single_limit_qty decimal(18,2) NOT NULL ,
    assigned_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    total_realize_pandl decimal(18,4) NOT NULL ,
    over_night_pandl decimal(18,4) NOT NULL ,
    sum_realize_pandl decimal(18,4) NOT NULL ,
    total_open_posi_fee decimal(18,4) NOT NULL ,
    total_close_posi_fee decimal(18,4) NOT NULL ,
    out_order_releas_qty decimal(18,2) NOT NULL ,
    out_order_capt_qty decimal(18,2) NOT NULL ,
    out_strike_releas_qty decimal(18,2) NOT NULL ,
    out_strike_capt_qty decimal(18,2) NOT NULL ,
    diff_qty decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdset0_opor_stock_source_1 on vi_tdset0_opor_stock_source (opor_no,exch_group_no,asset_acco_no,stock_code_no,stock_acco_no);
create index idx_vi_tdset0_opor_stock_source_2 on vi_tdset0_opor_stock_source (co_no,pd_no);
create index idx_vi_tdset0_opor_stock_source_3 on vi_tdset0_opor_stock_source (exch_group_no,asset_acco_no,stock_code_no,stock_acco_no);

-- 创建数据表：报表_资管报表_T0_操作员券源设置表历史
use db_rpts_his;
DROP TABLE IF EXISTS vi_tdset0_opor_stock_source_his;
CREATE TABLE vi_tdset0_opor_stock_source_his (
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
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    source_stock_qty decimal(18,2) NOT NULL ,
    single_limit_qty decimal(18,2) NOT NULL ,
    assigned_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    total_realize_pandl decimal(18,4) NOT NULL ,
    over_night_pandl decimal(18,4) NOT NULL ,
    sum_realize_pandl decimal(18,4) NOT NULL ,
    total_open_posi_fee decimal(18,4) NOT NULL ,
    total_close_posi_fee decimal(18,4) NOT NULL ,
    out_order_releas_qty decimal(18,2) NOT NULL ,
    out_order_capt_qty decimal(18,2) NOT NULL ,
    out_strike_releas_qty decimal(18,2) NOT NULL ,
    out_strike_capt_qty decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    diff_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdset0_opor_stock_source_his_1 on vi_tdset0_opor_stock_source_his (init_date,opor_no,exch_group_no,asset_acco_no,stock_code_no);

-- 创建数据表：报表_资管报表_T0_证券持仓汇总表
use db_rpts;
DROP TABLE IF EXISTS vi_tdset0_stock_posi_sum;
CREATE TABLE vi_tdset0_stock_posi_sum (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    total_long_curr_qty decimal(18,2) NOT NULL ,
    total_short_curr_qty decimal(18,2) NOT NULL ,
    total_long_open_posi_value decimal(18,4) NOT NULL ,
    total_short_open_posi_value decimal(18,4) NOT NULL ,
    total_long_open_posi_fee decimal(18,4) NOT NULL ,
    total_short_open_posi_fee decimal(18,4) NOT NULL ,
    total_long_close_posi_value decimal(18,4) NOT NULL ,
    total_short_close_posi_value decimal(18,4) NOT NULL ,
    total_long_close_posi_qty decimal(18,2) NOT NULL ,
    total_short_close_posi_qty decimal(18,2) NOT NULL ,
    total_long_close_posi_fee decimal(18,4) NOT NULL ,
    total_short_close_posi_fee decimal(18,4) NOT NULL ,
    total_realize_pandl decimal(18,4) NOT NULL ,
    long_curr_qty decimal(18,2) NOT NULL ,
    short_curr_qty decimal(18,2) NOT NULL ,
    long_open_posi_value decimal(18,4) NOT NULL ,
    short_open_posi_value decimal(18,4) NOT NULL ,
    long_open_posi_fee decimal(18,4) NOT NULL ,
    short_open_posi_fee decimal(18,4) NOT NULL ,
    long_close_posi_qty decimal(18,2) NOT NULL ,
    short_close_posi_qty decimal(18,2) NOT NULL ,
    long_close_posi_value decimal(18,4) NOT NULL ,
    short_close_posi_value decimal(18,4) NOT NULL ,
    long_close_posi_fee decimal(18,4) NOT NULL ,
    short_close_posi_fee decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    over_night_pandl decimal(18,4) NOT NULL ,
    open_posi_date int NOT NULL ,
    open_posi_time int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdset0_stock_posi_sum_1 on vi_tdset0_stock_posi_sum (opor_no,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_vi_tdset0_stock_posi_sum_2 on vi_tdset0_stock_posi_sum (co_no,pd_no,exch_group_no);

-- 创建数据表：报表_资管报表_T0_证券持仓汇总表历史
use db_rpts_his;
DROP TABLE IF EXISTS vi_tdset0_stock_posi_sum_his;
CREATE TABLE vi_tdset0_stock_posi_sum_his (
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
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    total_long_curr_qty decimal(18,2) NOT NULL ,
    total_short_curr_qty decimal(18,2) NOT NULL ,
    total_long_open_posi_value decimal(18,4) NOT NULL ,
    total_short_open_posi_value decimal(18,4) NOT NULL ,
    total_long_open_posi_fee decimal(18,4) NOT NULL ,
    total_short_open_posi_fee decimal(18,4) NOT NULL ,
    total_long_close_posi_value decimal(18,4) NOT NULL ,
    total_short_close_posi_value decimal(18,4) NOT NULL ,
    total_long_close_posi_qty decimal(18,2) NOT NULL ,
    total_short_close_posi_qty decimal(18,2) NOT NULL ,
    total_long_close_posi_fee decimal(18,4) NOT NULL ,
    total_short_close_posi_fee decimal(18,4) NOT NULL ,
    total_realize_pandl decimal(18,4) NOT NULL ,
    long_curr_qty decimal(18,2) NOT NULL ,
    short_curr_qty decimal(18,2) NOT NULL ,
    long_open_posi_value decimal(18,4) NOT NULL ,
    short_open_posi_value decimal(18,4) NOT NULL ,
    long_open_posi_fee decimal(18,4) NOT NULL ,
    short_open_posi_fee decimal(18,4) NOT NULL ,
    long_close_posi_qty decimal(18,2) NOT NULL ,
    short_close_posi_qty decimal(18,2) NOT NULL ,
    long_close_posi_value decimal(18,4) NOT NULL ,
    short_close_posi_value decimal(18,4) NOT NULL ,
    long_close_posi_fee decimal(18,4) NOT NULL ,
    short_close_posi_fee decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    over_night_pandl decimal(18,4) NOT NULL ,
    open_posi_date int NOT NULL ,
    open_posi_time int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_vi_tdset0_stock_posi_sum_his_1 on vi_tdset0_stock_posi_sum_his (init_date,opor_no,exch_group_no,asset_acco_no,stock_acco_no);
create index idx_vi_tdset0_stock_posi_sum_his_2 on vi_tdset0_stock_posi_sum_his (init_date,co_no,pd_no,exch_group_no);

-- 创建数据表：报表_资管报表_产品-账户-产品信息表
use db_rpts;
DROP TABLE IF EXISTS vi_pdacco_pd_info;
CREATE TABLE vi_pdacco_pd_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    pd_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_code varchar(32) NOT NULL ,
    pd_name varchar(64) NOT NULL ,
    pd_flname varchar(255) NOT NULL ,
    pd_manager varchar(32) NOT NULL ,
    found_date int NOT NULL ,
    pd_type int NOT NULL ,
    apply_currency varchar(3) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    first_asset decimal(18,4) NOT NULL ,
    first_amt decimal(18,4) NOT NULL ,
    pd_all_share decimal(18,2) NOT NULL ,
    curr_share decimal(18,2) NOT NULL ,
    pre_share decimal(18,2) NOT NULL ,
    his_max_per_nav decimal(18,4) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    coust_full_name varchar(255) NOT NULL ,
    coust_acco varchar(16) NOT NULL ,
    coust_acco_name varchar(64) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdacco_pd_info_1 on vi_pdacco_pd_info (co_no,pd_code);
create index idx_vi_pdacco_pd_info_2 on vi_pdacco_pd_info (pd_no);

-- 创建数据表：报表_资管报表_公共-用户-交易组信息表
use db_rpts;
DROP TABLE IF EXISTS vi_user_exch_group_info;
CREATE TABLE vi_user_exch_group_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_group_no int NOT NULL ,
    co_no int NOT NULL ,
    exch_group_code varchar(32) NOT NULL ,
    exch_group_name varchar(64) NOT NULL ,
    exch_group_status varchar(2) NOT NULL ,
    default_group_flag int NOT NULL ,
    pd_no int NOT NULL ,
    first_asset decimal(18,4) NOT NULL ,
    exch_group_dist_pd_amt decimal(18,4) NOT NULL ,
    exch_group_pd_share decimal(18,2) NOT NULL ,
    pre_exch_group_pd_share decimal(18,2) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    allow_exch varchar(64) NOT NULL ,
    allow_stock_type varchar(2048) NOT NULL ,
    busi_config_str varchar(64) NOT NULL ,
    market_price_ratio decimal(18,12) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_user_exch_group_info_1 on vi_user_exch_group_info (co_no,exch_group_code);
create index idx_vi_user_exch_group_info_2 on vi_user_exch_group_info (exch_group_no);
create index idx_vi_user_exch_group_info_3 on vi_user_exch_group_info (pd_no);

-- 创建数据表：报表_资管报表_公共-用户-历史交易组信息表
use db_rpts_his;
DROP TABLE IF EXISTS vi_user_exch_group_info_his;
CREATE TABLE vi_user_exch_group_info_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    exch_group_no int NOT NULL ,
    co_no int NOT NULL ,
    exch_group_code varchar(32) NOT NULL ,
    exch_group_name varchar(64) NOT NULL ,
    exch_group_status varchar(2) NOT NULL ,
    default_group_flag int NOT NULL ,
    pd_no int NOT NULL ,
    first_asset decimal(18,4) NOT NULL ,
    exch_group_dist_pd_amt decimal(18,4) NOT NULL ,
    exch_group_pd_share decimal(18,2) NOT NULL ,
    pre_exch_group_pd_share decimal(18,2) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    allow_exch varchar(64) NOT NULL ,
    allow_stock_type varchar(2048) NOT NULL ,
    busi_config_str varchar(64) NOT NULL ,
    market_price_ratio decimal(18,12) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_user_exch_group_info_his_1 on vi_user_exch_group_info_his (init_date,co_no,exch_group_code);
create index idx_vi_user_exch_group_info_his_2 on vi_user_exch_group_info_his (init_date,exch_group_no);
create index idx_vi_user_exch_group_info_his_3 on vi_user_exch_group_info_his (init_date,pd_no);

-- 创建数据表：报表_资管报表_产品-账户-产品限制信息表
use db_rpts;
DROP TABLE IF EXISTS vi_pdacco_pd_limit;
CREATE TABLE vi_pdacco_pd_limit (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    cost_calc_type int NOT NULL ,
    allow_exch varchar(64) NOT NULL ,
    allow_stock_type varchar(2048) NOT NULL ,
    busi_config_str varchar(64) NOT NULL ,
    comm_appr_oper int NOT NULL ,
    market_price_ratio decimal(18,12) NOT NULL ,
    forbid_order_dir varchar(64) NOT NULL ,
    pd_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdacco_pd_limit_1 on vi_pdacco_pd_limit (pd_no);
create index idx_vi_pdacco_pd_limit_2 on vi_pdacco_pd_limit (co_no);

-- 创建数据表：报表_资管报表_公共-用户-操作员配置表
use db_rpts;
DROP TABLE IF EXISTS vi_user_opor_param;
CREATE TABLE vi_user_opor_param (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    config_no bigint NOT NULL ,
    config_name varchar(64) NOT NULL ,
    config_value varchar(2048) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_user_opor_param_1 on vi_user_opor_param (opor_no,config_no);
create index idx_vi_user_opor_param_2 on vi_user_opor_param (co_no);

-- 创建数据表：报表_资管报表_公共-用户-操作员可操作机构表
use db_rpts;
DROP TABLE IF EXISTS vi_user_opor_allow_co;
CREATE TABLE vi_user_opor_allow_co (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    oper_rights int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_user_opor_allow_co_1 on vi_user_opor_allow_co (opor_no,co_no);

-- 创建数据表：报表_资管报表_公共-用户-操作员可操作产品表
use db_rpts;
DROP TABLE IF EXISTS vi_user_opor_allow_prod;
CREATE TABLE vi_user_opor_allow_prod (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    oper_rights int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_user_opor_allow_prod_1 on vi_user_opor_allow_prod (opor_no,pd_no);
create index idx_vi_user_opor_allow_prod_2 on vi_user_opor_allow_prod (co_no,opor_no,pd_no);

-- 创建数据表：报表_资管报表_公共-用户-操作员所属交易组表
use db_rpts;
DROP TABLE IF EXISTS vi_user_opor_exch_group;
CREATE TABLE vi_user_opor_exch_group (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    oper_rights int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_user_opor_exch_group_1 on vi_user_opor_exch_group (opor_no,exch_group_no);
create index idx_vi_user_opor_exch_group_2 on vi_user_opor_exch_group (co_no,opor_no,pd_no,exch_group_no);

-- 创建数据表：报表_资管报表_公共-证券基础数据-债券属性信息表
use db_rpts;
DROP TABLE IF EXISTS vi_basesedt_bond_info;
CREATE TABLE vi_basesedt_bond_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    trade_code varchar(6) NOT NULL ,
    target_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    issue_date int NOT NULL ,
    end_date int NOT NULL ,
    value_date int NOT NULL ,
    next_value_date int NOT NULL ,
    begin_trade_date int NOT NULL ,
    bond_limit decimal(18,2) NOT NULL ,
    issue_price decimal(16,9) NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    intrst_ratio decimal(18,12) NOT NULL ,
    intrst_days int NOT NULL ,
    pay_inteval int NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    inteval_days int NOT NULL ,
    net_price_flag int NOT NULL ,
    last_trade_date int NOT NULL ,
    rights_type int NOT NULL ,
    trans_begin_date int NOT NULL ,
    trans_end_date int NOT NULL ,
    exec_begin_date int NOT NULL ,
    exec_end_date int NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_basesedt_bond_info_1 on vi_basesedt_bond_info (exch_no,stock_code);
create index idx_vi_basesedt_bond_info_2 on vi_basesedt_bond_info (stock_code_no);
create index idx_vi_basesedt_bond_info_3 on vi_basesedt_bond_info (trade_code_no);
create index idx_vi_basesedt_bond_info_4 on vi_basesedt_bond_info (time_stamp);

-- 创建数据表：报表_资管报表_公共-证券基础数据-证券代码信息表
use db_rpts;
DROP TABLE IF EXISTS vi_basesedt_stock_code_info;
CREATE TABLE vi_basesedt_stock_code_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    pinyin_short varchar(16) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    total_stock_issue decimal(18,2) NOT NULL ,
    circl_stock_capit decimal(18,2) NOT NULL ,
    capit_reback_days int NOT NULL ,
    posi_reback_days int NOT NULL ,
    type_unit int NOT NULL ,
    report_unit int NOT NULL ,
    min_unit int NOT NULL ,
    max_qty decimal(18,2) NOT NULL ,
    min_qty decimal(18,2) NOT NULL ,
    is_order_dir_flag int NOT NULL ,
    price_up decimal(16,9) NOT NULL ,
    price_down decimal(16,9) NOT NULL ,
    step_price decimal(16,9) NOT NULL ,
    up_limit_price decimal(16,9) NOT NULL ,
    down_limit_price decimal(16,9) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    fair_price decimal(16,9) NOT NULL ,
    stop_status varchar(2) NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_vi_basesedt_stock_code_info_1 on vi_basesedt_stock_code_info (exch_no,stock_code);
create index idx_vi_basesedt_stock_code_info_2 on vi_basesedt_stock_code_info (stock_code_no);
create index idx_vi_basesedt_stock_code_info_3 on vi_basesedt_stock_code_info (time_stamp);

-- 创建数据表：报表_资管报表_视图-证券基础数据-证券行情表
use db_rpts;
DROP TABLE IF EXISTS vi_basesedt_stock_quot;
CREATE TABLE vi_basesedt_stock_quot (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    pinyin_short varchar(16) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    total_stock_issue decimal(18,2) NOT NULL ,
    circl_stock_capit decimal(18,2) NOT NULL ,
    capit_reback_days int NOT NULL ,
    posi_reback_days int NOT NULL ,
    type_unit int NOT NULL ,
    report_unit int NOT NULL ,
    min_unit int NOT NULL ,
    max_qty decimal(18,2) NOT NULL ,
    min_qty decimal(18,2) NOT NULL ,
    is_order_dir_flag int NOT NULL ,
    price_up decimal(16,9) NOT NULL ,
    price_down decimal(16,9) NOT NULL ,
    step_price decimal(16,9) NOT NULL ,
    up_limit_price decimal(16,9) NOT NULL ,
    down_limit_price decimal(16,9) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    fair_price decimal(16,9) NOT NULL ,
    stop_status varchar(2) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    today_open_price decimal(16,9) NOT NULL ,
    today_close_price decimal(16,9) NOT NULL ,
    today_max_price decimal(16,9) NOT NULL ,
    today_min_price decimal(16,9) NOT NULL ,
    buy_price_1 decimal(16,9) NOT NULL ,
    buy_qty_1 decimal(18,2) NOT NULL ,
    buy_price_2 decimal(16,9) NOT NULL ,
    buy_qty_2 decimal(18,2) NOT NULL ,
    buy_price_3 decimal(16,9) NOT NULL ,
    buy_qty_3 decimal(18,2) NOT NULL ,
    buy_price_4 decimal(16,9) NOT NULL ,
    buy_qty_4 decimal(18,2) NOT NULL ,
    buy_price_5 decimal(16,9) NOT NULL ,
    buy_qty_5 decimal(18,2) NOT NULL ,
    sell_price_1 decimal(16,9) NOT NULL ,
    sell_qty_1 decimal(18,2) NOT NULL ,
    sell_price_2 decimal(16,9) NOT NULL ,
    sell_qty_2 decimal(18,2) NOT NULL ,
    sell_price_3 decimal(16,9) NOT NULL ,
    sell_qty_3 decimal(18,2) NOT NULL ,
    sell_price_4 decimal(16,9) NOT NULL ,
    sell_qty_4 decimal(18,2) NOT NULL ,
    sell_price_5 decimal(16,9) NOT NULL ,
    sell_qty_5 decimal(18,2) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    pe_ratio decimal(18,12) NOT NULL ,
    time_stamp int NOT NULL ,
    trade_code varchar(6) NOT NULL ,
    target_code varchar(6) NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    issue_date int NOT NULL ,
    end_date int NOT NULL ,
    value_date int NOT NULL ,
    next_value_date int NOT NULL ,
    begin_trade_date int NOT NULL ,
    bond_limit decimal(18,2) NOT NULL ,
    issue_price decimal(16,9) NOT NULL ,
    intrst_ratio decimal(18,12) NOT NULL ,
    intrst_days int NOT NULL ,
    pay_inteval int NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    inteval_days int NOT NULL ,
    net_price_flag int NOT NULL ,
    last_trade_date int NOT NULL ,
    rights_type int NOT NULL ,
    trans_begin_date int NOT NULL ,
    trans_end_date int NOT NULL ,
    exec_begin_date int NOT NULL ,
    exec_end_date int NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_vi_basesedt_stock_quot_1 on vi_basesedt_stock_quot (stock_code_no);
create index idx_vi_basesedt_stock_quot_2 on vi_basesedt_stock_quot (exch_no,stock_code);
create index idx_vi_basesedt_stock_quot_3 on vi_basesedt_stock_quot (time_stamp);

-- 创建数据表：报表_资管报表_视图-证券基础数据-历史证券行情表
use db_rpts_his;
DROP TABLE IF EXISTS vi_basesedt_stock_quot_his;
CREATE TABLE vi_basesedt_stock_quot_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    fair_price decimal(16,9) NOT NULL ,
    up_limit_price decimal(16,9) NOT NULL ,
    down_limit_price decimal(16,9) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    today_open_price decimal(16,9) NOT NULL ,
    today_close_price decimal(16,9) NOT NULL ,
    today_max_price decimal(16,9) NOT NULL ,
    today_min_price decimal(16,9) NOT NULL ,
    buy_price_1 decimal(16,9) NOT NULL ,
    buy_qty_1 decimal(18,2) NOT NULL ,
    buy_price_2 decimal(16,9) NOT NULL ,
    buy_qty_2 decimal(18,2) NOT NULL ,
    buy_price_3 decimal(16,9) NOT NULL ,
    buy_qty_3 decimal(18,2) NOT NULL ,
    buy_price_4 decimal(16,9) NOT NULL ,
    buy_qty_4 decimal(18,2) NOT NULL ,
    buy_price_5 decimal(16,9) NOT NULL ,
    buy_qty_5 decimal(18,2) NOT NULL ,
    sell_price_1 decimal(16,9) NOT NULL ,
    sell_qty_1 decimal(18,2) NOT NULL ,
    sell_price_2 decimal(16,9) NOT NULL ,
    sell_qty_2 decimal(18,2) NOT NULL ,
    sell_price_3 decimal(16,9) NOT NULL ,
    sell_qty_3 decimal(18,2) NOT NULL ,
    sell_price_4 decimal(16,9) NOT NULL ,
    sell_qty_4 decimal(18,2) NOT NULL ,
    sell_price_5 decimal(16,9) NOT NULL ,
    sell_qty_5 decimal(18,2) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    pe_ratio decimal(18,12) NOT NULL ,
    time_stamp int NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    net_price_flag int NOT NULL ,
    asset_type int NOT NULL ,
    stock_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_vi_basesedt_stock_quot_his_1 on vi_basesedt_stock_quot_his (stock_code_no);
create index idx_vi_basesedt_stock_quot_his_2 on vi_basesedt_stock_quot_his (exch_no,stock_code);
create index idx_vi_basesedt_stock_quot_his_3 on vi_basesedt_stock_quot_his (time_stamp);

-- 创建数据表：报表_资管报表_视图-公共-用户-操作员信息表
use db_rpts;
DROP TABLE IF EXISTS vi_user_opor_info;
CREATE TABLE vi_user_opor_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    opor_name varchar(64) NOT NULL ,
    opor_type int NOT NULL ,
    opor_pwd varchar(64) NOT NULL ,
    opor_status varchar(2) NOT NULL ,
    create_opor int NOT NULL ,
    conta_addr varchar(255) NOT NULL ,
    oper_rights int NOT NULL ,
    phone_number varchar(16) NOT NULL ,
    email varchar(255) NOT NULL ,
    is_trader int NOT NULL ,
    trader_no int NOT NULL ,
    allow_login_type varchar(64) NOT NULL ,
    allow_oper_ip_addr varchar(255) NOT NULL ,
    allow_oper_mac varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_user_opor_info_1 on vi_user_opor_info (opor_no);
create index idx_vi_user_opor_info_2 on vi_user_opor_info (trader_no);
create index idx_vi_user_opor_info_3 on vi_user_opor_info (co_no);

-- 创建数据表：报表_资管报表_视图-查询产品资产
use db_rpts;
DROP TABLE IF EXISTS vi_rptasset_qry_pd_asset;
CREATE TABLE vi_rptasset_qry_pd_asset (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    pd_no int NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    exch_group_pd_share decimal(18,2) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    nav_fluct decimal(18,12) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    assign_avail_amt decimal(18,4) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    today_pandl decimal(18,4) NOT NULL ,
    daily_pandl_ratio decimal(18,12) NOT NULL ,
    total_realiz_pandl decimal(18,4) NOT NULL ,
    total_realiz_pandl_ratio decimal(18,12) NOT NULL ,
    posi_ratio decimal(18,12) NOT NULL ,
    avail_cash decimal(18,4) NOT NULL ,
    buy_ref_rate decimal(18,12) NOT NULL ,
    sell_ref_rate decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-查询产品资产-历史
use db_rpts_his;
DROP TABLE IF EXISTS vi_rptasset_qry_pd_asset_his;
CREATE TABLE vi_rptasset_qry_pd_asset_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    pd_no int NOT NULL ,
    pd_all_share decimal(18,2) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    nav_fluct decimal(18,12) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    assign_avail_amt decimal(18,4) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    today_pandl decimal(18,4) NOT NULL ,
    daily_pandl_ratio decimal(18,12) NOT NULL ,
    cash_out_amt decimal(18,4) NOT NULL ,
    stock_asset_ratio decimal(18,12) NOT NULL ,
    securities_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-查询交易组资产
use db_rpts;
DROP TABLE IF EXISTS vi_rptasset_qry_exgrp_asset;
CREATE TABLE vi_rptasset_qry_exgrp_asset (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    exch_group_pd_share decimal(18,2) NOT NULL ,
    asset_acco_no int NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    nav_fluct decimal(18,12) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    assign_avail_amt decimal(18,4) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    today_pandl decimal(18,4) NOT NULL ,
    daily_pandl_ratio decimal(18,12) NOT NULL ,
    total_realiz_pandl decimal(18,4) NOT NULL ,
    total_realiz_pandl_ratio decimal(18,12) NOT NULL ,
    posi_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-查询交易组资产-历史
use db_rpts_his;
DROP TABLE IF EXISTS vi_rptasset_qry_exgrp_asset_his;
CREATE TABLE vi_rptasset_qry_exgrp_asset_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    exch_group_pd_share decimal(18,2) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    nav_fluct decimal(18,12) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    assign_avail_amt decimal(18,4) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    today_pandl decimal(18,4) NOT NULL ,
    daily_pandl_ratio decimal(18,12) NOT NULL ,
    total_realiz_pandl decimal(18,4) NOT NULL ,
    total_realiz_pandl_ratio decimal(18,12) NOT NULL ,
    posi_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-查询-产品-证券持仓
use db_rpts;
DROP TABLE IF EXISTS vi_rptasset_qry_pd_posi;
CREATE TABLE vi_rptasset_qry_pd_posi (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    row_id bigint NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    exch_no int NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    invest_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    buy_pre_sett_qty decimal(18,2) NOT NULL ,
    sell_pre_sett_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    avail_qty decimal(18,2) NOT NULL ,
    posi_nav_ratio decimal(18,12) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    bond_receivable_amt decimal(18,4) NOT NULL ,
    impawn_qty decimal(18,2) NOT NULL ,
    full_holding_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-查询-交易组-证券持仓
use db_rpts;
DROP TABLE IF EXISTS vi_rptasset_qry_exgrp_posi;
CREATE TABLE vi_rptasset_qry_exgrp_posi (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    row_id bigint NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    exch_no int NOT NULL ,
    invest_type int NOT NULL ,
    stock_type int NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    cost_price decimal(16,9) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    pandl_ratio decimal(18,12) NOT NULL ,
    trade_avail_qty decimal(18,2) NOT NULL ,
    comm_avail_qty decimal(18,2) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    posi_nav_ratio decimal(18,12) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    bond_receivable_amt decimal(18,4) NOT NULL ,
    impawn_qty decimal(18,2) NOT NULL ,
    full_holding_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-查询-产品-证券持仓-历史
use db_rpts_his;
DROP TABLE IF EXISTS vi_rptasset_qry_pd_posi_his;
CREATE TABLE vi_rptasset_qry_pd_posi_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    row_id bigint NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    exch_no int NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    invest_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    buy_pre_sett_qty decimal(18,2) NOT NULL ,
    sell_pre_sett_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    avail_qty decimal(18,2) NOT NULL ,
    posi_nav_ratio decimal(18,12) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    bond_receivable_amt decimal(18,4) NOT NULL ,
    impawn_qty decimal(18,2) NOT NULL ,
    full_holding_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-查询-交易组-证券持仓-历史
use db_rpts_his;
DROP TABLE IF EXISTS vi_rptasset_qry_exgrp_posi_his;
CREATE TABLE vi_rptasset_qry_exgrp_posi_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    row_id bigint NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    exch_no int NOT NULL ,
    invest_type int NOT NULL ,
    stock_type int NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    cost_price decimal(16,9) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    pandl_ratio decimal(18,12) NOT NULL ,
    trade_avail_qty decimal(18,2) NOT NULL ,
    comm_avail_qty decimal(18,2) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    posi_nav_ratio decimal(18,12) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    bond_receivable_amt decimal(18,4) NOT NULL ,
    impawn_qty decimal(18,2) NOT NULL ,
    full_holding_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_产品证券-持仓-历史资产账户持仓表
use db_rpts_his;
DROP TABLE IF EXISTS vi_pdsepo_asac_posi_his;
CREATE TABLE vi_pdsepo_asac_posi_his (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    impawn_qty decimal(18,2) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    net_price decimal(16,9) NOT NULL ,
    full_price decimal(16,9) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdsepo_asac_posi_his_1 on vi_pdsepo_asac_posi_his (init_date,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_vi_pdsepo_asac_posi_his_2 on vi_pdsepo_asac_posi_his (init_date,co_no,pd_no,exch_no);

-- 创建数据表：报表_资管报表_公共-证券基础数据-债券利率表
use db_rpts;
DROP TABLE IF EXISTS vi_basesedt_bond_rate;
CREATE TABLE vi_basesedt_bond_rate (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    intrst_begin_date int NOT NULL ,
    intrst_ratio decimal(18,12) NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_basesedt_bond_rate_1 on vi_basesedt_bond_rate (stock_code_no,intrst_begin_date);
create index idx_vi_basesedt_bond_rate_2 on vi_basesedt_bond_rate (exch_no);
create index idx_vi_basesedt_bond_rate_3 on vi_basesedt_bond_rate (time_stamp);

-- 创建数据表：报表_资管报表_公共-证券基础数据-债券评级信息表
use db_rpts;
DROP TABLE IF EXISTS vi_basesedt_bond_rating;
CREATE TABLE vi_basesedt_bond_rating (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    rating_agency varchar(64) NOT NULL ,
    co_no int NOT NULL ,
    bond_level int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_basesedt_bond_rating_1 on vi_basesedt_bond_rating (stock_code_no,rating_agency,co_no);
create index idx_vi_basesedt_bond_rating_2 on vi_basesedt_bond_rating (exch_no);

-- 创建数据表：报表_资管报表_公共-证券基础数据-债券兑付表
use db_rpts;
DROP TABLE IF EXISTS vi_basesedt_bond_redemption;
CREATE TABLE vi_basesedt_bond_redemption (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    redem_record_date int NOT NULL ,
    redem_start_date int NOT NULL ,
    redem_end_date int NOT NULL ,
    redem_pay_price decimal(18,12) NOT NULL ,
    redem_pay_amt decimal(18,4) NOT NULL ,
    redem_commis_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_basesedt_bond_redemption_1 on vi_basesedt_bond_redemption (stock_code_no,redem_record_date);

-- 创建数据表：报表_资管报表_交易证券-账户-历史交易组业务持仓表
use db_rpts_his;
DROP TABLE IF EXISTS vi_tdseac_exgp_busi_posi_his;
CREATE TABLE vi_tdseac_exgp_busi_posi_his (
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
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    comm_frozen_qty decimal(18,2) NOT NULL ,
    comm_unfroz_qty decimal(18,2) NOT NULL ,
    comm_capt_qty decimal(18,2) NOT NULL ,
    comm_releas_qty decimal(18,2) NOT NULL ,
    trade_frozen_qty decimal(18,2) NOT NULL ,
    trade_unfroz_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    strike_frozen_qty decimal(18,2) NOT NULL ,
    strike_unfroz_qty decimal(18,2) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdseac_exgp_busi_posi_his_1 on vi_tdseac_exgp_busi_posi_his (init_date,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_vi_tdseac_exgp_busi_posi_his_2 on vi_tdseac_exgp_busi_posi_his (init_date,co_no,pd_no);

-- 创建数据表：报表_资管报表_交易证券-账户-资产账户业务持仓表
use db_rpts;
DROP TABLE IF EXISTS vi_tdseac_asac_busi_posi;
CREATE TABLE vi_tdseac_asac_busi_posi (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    comm_frozen_qty decimal(18,2) NOT NULL ,
    comm_unfroz_qty decimal(18,2) NOT NULL ,
    comm_capt_qty decimal(18,2) NOT NULL ,
    comm_releas_qty decimal(18,2) NOT NULL ,
    trade_frozen_qty decimal(18,2) NOT NULL ,
    trade_unfroz_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    strike_frozen_qty decimal(18,2) NOT NULL ,
    strike_unfroz_qty decimal(18,2) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdseac_asac_busi_posi_1 on vi_tdseac_asac_busi_posi (asset_acco_no,stock_acco_no,stock_code_no);
create index idx_vi_tdseac_asac_busi_posi_2 on vi_tdseac_asac_busi_posi (co_no,pd_no);

-- 创建数据表：报表_资管报表_交易证券-账户-历史资产账户业务持仓表
use db_rpts_his;
DROP TABLE IF EXISTS vi_tdseac_asac_busi_posi_his;
CREATE TABLE vi_tdseac_asac_busi_posi_his (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    comm_frozen_qty decimal(18,2) NOT NULL ,
    comm_unfroz_qty decimal(18,2) NOT NULL ,
    comm_capt_qty decimal(18,2) NOT NULL ,
    comm_releas_qty decimal(18,2) NOT NULL ,
    trade_frozen_qty decimal(18,2) NOT NULL ,
    trade_unfroz_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    strike_frozen_qty decimal(18,2) NOT NULL ,
    strike_unfroz_qty decimal(18,2) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdseac_asac_busi_posi_his_1 on vi_tdseac_asac_busi_posi_his (init_date,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_vi_tdseac_asac_busi_posi_his_2 on vi_tdseac_asac_busi_posi_his (co_no,pd_no);

-- 创建数据表：报表_资管报表_产品证券-持仓-资产账户债券质押表
use db_rpts;
DROP TABLE IF EXISTS vi_pdsepo_asac_bond_pledge;
CREATE TABLE vi_pdsepo_asac_bond_pledge (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    put_impawn_qty decimal(18,2) NOT NULL ,
    get_impawn_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdsepo_asac_bond_pledge_1 on vi_pdsepo_asac_bond_pledge (asset_acco_no,stock_acco_no,stock_code_no);

-- 创建数据表：报表_资管报表_产品证券-持仓-历史资产账户债券质押表
use db_rpts_his;
DROP TABLE IF EXISTS vi_pdsepo_asac_bond_pledge_his;
CREATE TABLE vi_pdsepo_asac_bond_pledge_his (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    put_impawn_qty decimal(18,2) NOT NULL ,
    get_impawn_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdsepo_asac_bond_pledge_his_1 on vi_pdsepo_asac_bond_pledge_his (init_date,asset_acco_no,stock_acco_no,stock_code_no);

-- 创建数据表：报表_资管报表_交易证券-账户-交易组债券质押表
use db_rpts;
DROP TABLE IF EXISTS vi_tdseac_exgp_bond_impawn;
CREATE TABLE vi_tdseac_exgp_bond_impawn (
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
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    put_impawn_qty decimal(18,2) NOT NULL ,
    get_impawn_qty decimal(18,2) NOT NULL ,
    target_code_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdseac_exgp_bond_impawn_1 on vi_tdseac_exgp_bond_impawn (exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_vi_tdseac_exgp_bond_impawn_2 on vi_tdseac_exgp_bond_impawn (co_no,pd_no);

-- 创建数据表：报表_资管报表_交易证券-账户-历史交易组债券质押表
use db_rpts_his;
DROP TABLE IF EXISTS vi_tdseac_exgp_bond_impawn_his;
CREATE TABLE vi_tdseac_exgp_bond_impawn_his (
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
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    put_impawn_qty decimal(18,2) NOT NULL ,
    get_impawn_qty decimal(18,2) NOT NULL ,
    target_code_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdseac_exgp_bond_impawn_his_1 on vi_tdseac_exgp_bond_impawn_his (init_date,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_vi_tdseac_exgp_bond_impawn_his_2 on vi_tdseac_exgp_bond_impawn_his (init_date,co_no,pd_no);

-- 创建数据表：报表_资管报表_交易证券-账户-资产账户债券质押表
use db_rpts;
DROP TABLE IF EXISTS vi_tdseac_asac_bond_impawn;
CREATE TABLE vi_tdseac_asac_bond_impawn (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    put_impawn_qty decimal(18,2) NOT NULL ,
    get_impawn_qty decimal(18,2) NOT NULL ,
    target_code_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdseac_asac_bond_impawn_1 on vi_tdseac_asac_bond_impawn (asset_acco_no,stock_acco_no,stock_code_no);
create index idx_vi_tdseac_asac_bond_impawn_2 on vi_tdseac_asac_bond_impawn (co_no,pd_no);

-- 创建数据表：报表_资管报表_交易证券-账户-历史资产账户债券质押表
use db_rpts_his;
DROP TABLE IF EXISTS vi_tdseac_asac_bond_impawn_his;
CREATE TABLE vi_tdseac_asac_bond_impawn_his (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    put_impawn_qty decimal(18,2) NOT NULL ,
    get_impawn_qty decimal(18,2) NOT NULL ,
    target_code_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_tdseac_asac_bond_impawn_his_1 on vi_tdseac_asac_bond_impawn_his (init_date,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_vi_tdseac_asac_bond_impawn_his_2 on vi_tdseac_asac_bond_impawn_his (init_date,co_no,pd_no);

-- 创建数据表：报表_资管报表_视图-数据-产品-资金-资产
use db_rpts;
DROP TABLE IF EXISTS vi_dt_pd_capit_asset;
CREATE TABLE vi_dt_pd_capit_asset (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    first_asset decimal(18,4) NOT NULL ,
    first_amt decimal(18,4) NOT NULL ,
    pd_all_share decimal(18,2) NOT NULL ,
    curr_share decimal(18,2) NOT NULL ,
    pre_share decimal(18,2) NOT NULL ,
    his_max_per_nav decimal(18,4) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    pd_dist_amt decimal(18,4) NOT NULL ,
    pd_auth_amt decimal(18,4) NOT NULL ,
    total_cash_divide decimal(18,4) NOT NULL ,
    total_pre_fee decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    intrst_cacl_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-数据-产品-资金-资产-历史
use db_rpts_his;
DROP TABLE IF EXISTS vi_dt_pd_capit_asset_his;
CREATE TABLE vi_dt_pd_capit_asset_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    first_asset decimal(18,4) NOT NULL ,
    first_amt decimal(18,4) NOT NULL ,
    pd_all_share decimal(18,2) NOT NULL ,
    curr_share decimal(18,2) NOT NULL ,
    pre_share decimal(18,2) NOT NULL ,
    his_max_per_nav decimal(18,4) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    pd_dist_amt decimal(18,4) NOT NULL ,
    pd_auth_amt decimal(18,4) NOT NULL ,
    total_cash_divide decimal(18,4) NOT NULL ,
    total_pre_fee decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    intrst_cacl_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-计算-产品-资金-资产
use db_rpts;
DROP TABLE IF EXISTS vi_calc_pd_capit_asset;
CREATE TABLE vi_calc_pd_capit_asset (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    exch_group_pd_share decimal(18,2) NOT NULL ,
    first_asset decimal(18,4) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    assign_avail_amt decimal(18,4) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    nav_fluct decimal(18,12) NOT NULL ,
    today_pandl decimal(18,4) NOT NULL ,
    daily_pandl_ratio decimal(18,12) NOT NULL ,
    total_realiz_pandl decimal(18,4) NOT NULL ,
    total_realiz_pandl_ratio decimal(18,12) NOT NULL ,
    posi_ratio decimal(18,12) NOT NULL ,
    securities_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-汇总-机构-证券-持仓
use db_rpts;
DROP TABLE IF EXISTS vi_sum_co_stock_posi;
CREATE TABLE vi_sum_co_stock_posi (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    cost_price decimal(16,9) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-汇总-产品-证券-持仓
use db_rpts;
DROP TABLE IF EXISTS vi_sum_pd_stock_posi;
CREATE TABLE vi_sum_pd_stock_posi (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    cost_price decimal(16,9) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-汇总-产品-持仓市值
use db_rpts;
DROP TABLE IF EXISTS vi_sum_pd_stockvalue;
CREATE TABLE vi_sum_pd_stockvalue (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    market_value_sh decimal(18,4) NOT NULL ,
    market_value_sz decimal(18,4) NOT NULL ,
    stock_market_value_sh decimal(18,4) NOT NULL ,
    stock_market_value_sz decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-汇总-交易组-持仓市值
use db_rpts;
DROP TABLE IF EXISTS vi_sum_exgp_stockvalue;
CREATE TABLE vi_sum_exgp_stockvalue (
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
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-汇总-机构-证券-成交
use db_rpts;
DROP TABLE IF EXISTS vi_sum_co_stock_strike;
CREATE TABLE vi_sum_co_stock_strike (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    buy_qty decimal(18,2) NOT NULL ,
    buy_amt decimal(18,4) NOT NULL ,
    buy_strike_price decimal(16,9) NOT NULL ,
    sell_qty decimal(18,2) NOT NULL ,
    sell_amt decimal(18,4) NOT NULL ,
    sell_strike_price decimal(16,9) NOT NULL ,
    diff_qty decimal(18,2) NOT NULL ,
    buy_begin_time int NOT NULL ,
    buy_end_time int NOT NULL ,
    sell_begin_time int NOT NULL ,
    sell_end_time int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-汇总-交易组-证券-持仓
use db_rpts;
DROP TABLE IF EXISTS vi_sum_exgp_stock_posi;
CREATE TABLE vi_sum_exgp_stock_posi (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    row_id bigint NOT NULL ,
    co_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_type int NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    comm_capt_qty decimal(18,2) NOT NULL ,
    comm_releas_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    cost_price decimal(16,9) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    pandl_ratio decimal(18,12) NOT NULL ,
    trade_avail_qty decimal(18,2) NOT NULL ,
    comm_avail_qty decimal(18,2) NOT NULL ,
    static_avail_qty decimal(18,2) NOT NULL ,
    posi_nav_ratio decimal(18,12) NOT NULL ,
    bond_receivable_amt decimal(18,4) NOT NULL ,
    full_holding_amt decimal(18,4) NOT NULL ,
    impawn_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-汇总-交易组-证券-持仓-历史
use db_rpts_his;
DROP TABLE IF EXISTS vi_sum_exgp_stock_posi_his;
CREATE TABLE vi_sum_exgp_stock_posi_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    row_id bigint NOT NULL ,
    co_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_type int NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    comm_capt_qty decimal(18,2) NOT NULL ,
    comm_releas_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    cost_price decimal(16,9) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    pandl_ratio decimal(18,12) NOT NULL ,
    trade_avail_qty decimal(18,2) NOT NULL ,
    comm_avail_qty decimal(18,2) NOT NULL ,
    static_avail_qty decimal(18,2) NOT NULL ,
    posi_nav_ratio decimal(18,12) NOT NULL ,
    bond_receivable_amt decimal(18,4) NOT NULL ,
    full_holding_amt decimal(18,4) NOT NULL ,
    impawn_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-汇总-产品-证券-成交
use db_rpts;
DROP TABLE IF EXISTS vi_sum_pd_stock_strike;
CREATE TABLE vi_sum_pd_stock_strike (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    buy_qty decimal(18,2) NOT NULL ,
    buy_amt decimal(18,4) NOT NULL ,
    buy_strike_price decimal(16,9) NOT NULL ,
    sell_qty decimal(18,2) NOT NULL ,
    sell_amt decimal(18,4) NOT NULL ,
    sell_strike_price decimal(16,9) NOT NULL ,
    diff_qty decimal(18,2) NOT NULL ,
    buy_begin_time int NOT NULL ,
    buy_end_time int NOT NULL ,
    sell_begin_time int NOT NULL ,
    sell_end_time int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-数据-交易组-持仓
use db_rpts;
DROP TABLE IF EXISTS vi_dt_exgp_posi_value;
CREATE TABLE vi_dt_exgp_posi_value (
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
    asset_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    fair_price decimal(16,9) NOT NULL ,
    net_price_flag int NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-数据-交易组-持仓-历史
use db_rpts_his;
DROP TABLE IF EXISTS vi_dt_exgp_posi_value_his;
CREATE TABLE vi_dt_exgp_posi_value_his (
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
    asset_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    fair_price decimal(16,9) NOT NULL ,
    net_price_flag int NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-汇总-交易组-持仓-区间盈亏
use db_rpts;
DROP TABLE IF EXISTS vi_sum_exgp_posi_value_inter_pl;
CREATE TABLE vi_sum_exgp_posi_value_inter_pl (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    fair_price decimal(16,9) NOT NULL ,
    net_price_flag int NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    interval_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-数据-交易组-成交
use db_rpts;
DROP TABLE IF EXISTS vi_dt_exgp_stock_strike;
CREATE TABLE vi_dt_exgp_stock_strike (
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
    net_price_flag int NOT NULL ,
    intrst_days int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    order_oper_way varchar(2) NOT NULL ,
    exter_comm_flag int NOT NULL ,
    record_valid_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-数据-交易组-资金-资产
use db_rpts;
DROP TABLE IF EXISTS vi_dt_exgp_capit_asset;
CREATE TABLE vi_dt_exgp_capit_asset (
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
    exch_group_code varchar(32) NOT NULL ,
    exch_group_name varchar(64) NOT NULL ,
    exch_group_status varchar(2) NOT NULL ,
    default_group_flag int NOT NULL ,
    first_asset decimal(18,4) NOT NULL ,
    exch_group_dist_pd_amt decimal(18,4) NOT NULL ,
    exch_group_pd_share decimal(18,2) NOT NULL ,
    pre_exch_group_pd_share decimal(18,2) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    allow_exch varchar(64) NOT NULL ,
    allow_stock_type varchar(2048) NOT NULL ,
    busi_config_str varchar(64) NOT NULL ,
    market_price_ratio decimal(18,12) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    asset_acco_no int NOT NULL ,
    auth_amt decimal(18,4) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_rate decimal(18,12) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-连接-交易组-资金-资产-市值
use db_rpts;
DROP TABLE IF EXISTS vi_join_exgp_asset_stockvalue;
CREATE TABLE vi_join_exgp_asset_stockvalue (
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
    first_asset decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    exch_group_pd_share decimal(18,2) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    nav_fluct decimal(18,12) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    assign_avail_amt decimal(18,4) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    today_pandl decimal(18,4) NOT NULL ,
    daily_pandl_ratio decimal(18,12) NOT NULL ,
    total_realiz_pandl decimal(18,4) NOT NULL ,
    total_realiz_pandl_ratio decimal(18,12) NOT NULL ,
    posi_ratio decimal(18,12) NOT NULL ,
    securities_ratio decimal(18,12) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-逻辑-交易组-资产-附加信息
use db_rpts;
DROP TABLE IF EXISTS vi_logic_exgp_asset_other;
CREATE TABLE vi_logic_exgp_asset_other (
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
    nav_asset decimal(18,4) NOT NULL ,
    first_asset decimal(18,4) NOT NULL ,
    exch_group_pd_share decimal(18,2) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    nav_fluct decimal(18,12) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    assign_avail_amt decimal(18,4) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    today_pandl decimal(18,4) NOT NULL ,
    daily_pandl_ratio decimal(18,12) NOT NULL ,
    total_realiz_pandl decimal(18,4) NOT NULL ,
    total_realiz_pandl_ratio decimal(18,12) NOT NULL ,
    posi_ratio decimal(18,12) NOT NULL ,
    securities_ratio decimal(18,12) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    strategy_type int NOT NULL ,
    total_pre_fee decimal(18,4) NOT NULL ,
    total_divi_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-公共-用户-操作员可操作机构表
use db_rpts;
DROP TABLE IF EXISTS vi_user_opor_allow_co;
CREATE TABLE vi_user_opor_allow_co (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    oper_rights int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_user_opor_allow_co_1 on vi_user_opor_allow_co (opor_no,co_no);

-- 创建数据表：报表_资管报表_视图-公共-用户-操作员可操作产品表
use db_rpts;
DROP TABLE IF EXISTS vi_user_opor_allow_prod;
CREATE TABLE vi_user_opor_allow_prod (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    oper_rights int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_user_opor_allow_prod_1 on vi_user_opor_allow_prod (opor_no,pd_no);
create index idx_vi_user_opor_allow_prod_2 on vi_user_opor_allow_prod (co_no,opor_no,pd_no);

-- 创建数据表：报表_资管报表_视图-公共-用户-交易组信息表
use db_rpts;
DROP TABLE IF EXISTS vi_user_exch_group_info;
CREATE TABLE vi_user_exch_group_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    oper_rights int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_user_exch_group_info_1 on vi_user_exch_group_info (opor_no,exch_group_no);
create index idx_vi_user_exch_group_info_2 on vi_user_exch_group_info (co_no,opor_no,pd_no,exch_group_no);

-- 创建数据表：报表_资管报表_视图-汇总-交易组-红利红股
use db_rpts;
DROP TABLE IF EXISTS vi_sum_exgp_posi_divi_total;
CREATE TABLE vi_sum_exgp_posi_divi_total (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    pd_no int NOT NULL ,
    co_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    total_divi_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-证券持仓汇总查询
use db_rpts;
DROP TABLE IF EXISTS vi_logic_rptasset_sum_stock_value_co;
CREATE TABLE vi_logic_rptasset_sum_stock_value_co (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    row_id bigint NOT NULL ,
    co_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_type int NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    comm_capt_qty decimal(18,2) NOT NULL ,
    comm_releas_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    cost_price decimal(16,9) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    pandl_ratio decimal(18,12) NOT NULL ,
    trade_avail_qty decimal(18,2) NOT NULL ,
    comm_avail_qty decimal(18,2) NOT NULL ,
    static_avail_qty decimal(18,2) NOT NULL ,
    posi_nav_ratio decimal(18,12) NOT NULL ,
    bond_receivable_amt decimal(18,4) NOT NULL ,
    full_holding_amt decimal(18,4) NOT NULL ,
    impawn_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_产品证券-资金-资产账户资产表
use db_rpts;
DROP TABLE IF EXISTS vi_pdseca_asac_asset;
CREATE TABLE vi_pdseca_asac_asset (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdseca_asac_asset_1 on vi_pdseca_asac_asset (asset_acco_no,crncy_type);

-- 创建数据表：报表_资管报表_产品证券-资金-历史资产账户资产表
use db_rpts_his;
DROP TABLE IF EXISTS vi_pdseca_asac_asset_his;
CREATE TABLE vi_pdseca_asac_asset_his (
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
    crncy_type varchar(3) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdseca_asac_asset_his_1 on vi_pdseca_asac_asset_his (init_date,asset_acco_no,crncy_type);

-- 创建数据表：报表_资管报表_产品证券-资金-历史交易组资金表
use db_rpts_his;
DROP TABLE IF EXISTS vi_pdseca_exgp_capit_his;
CREATE TABLE vi_pdseca_exgp_capit_his (
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
    crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    auth_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_rate decimal(18,12) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdseca_exgp_capit_his_1 on vi_pdseca_exgp_capit_his (init_date,asset_acco_no,exch_group_no,crncy_type);
create index idx_vi_pdseca_exgp_capit_his_2 on vi_pdseca_exgp_capit_his (init_date,co_no,pd_no,crncy_type);

-- 创建数据表：报表_资管报表_产品证券-资金-历史交易组资产表
use db_rpts_his;
DROP TABLE IF EXISTS vi_pdseca_exgp_asset_his;
CREATE TABLE vi_pdseca_exgp_asset_his (
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
    crncy_type varchar(3) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    hk_thrgh_stock_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_pdseca_exgp_asset_his_1 on vi_pdseca_exgp_asset_his (init_date,exch_group_no,crncy_type);

-- 创建数据表：报表_资管报表_视图-报表产品持仓交易汇总查询
use db_rpts;
DROP TABLE IF EXISTS vi_logic_rptasset_ReportProductPositionTradeQuery;
CREATE TABLE vi_logic_rptasset_ReportProductPositionTradeQuery (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    pre_holding_qty decimal(18,2) NOT NULL ,
    posi_qty decimal(18,2) NOT NULL ,
    today_close_price decimal(16,9) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    today_buy_qty decimal(18,2) NOT NULL ,
    today_buy_amt decimal(18,4) NOT NULL ,
    today_buy_price decimal(16,9) NOT NULL ,
    buy_begin_time int NOT NULL ,
    buy_end_time int NOT NULL ,
    today_sell_qty decimal(18,2) NOT NULL ,
    today_sell_amt decimal(18,4) NOT NULL ,
    today_sell_price decimal(16,9) NOT NULL ,
    sell_begin_time int NOT NULL ,
    sell_end_time int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-期货产品持仓
use db_rpts;
DROP TABLE IF EXISTS vi_futu_qry_pd_posi;
CREATE TABLE vi_futu_qry_pd_posi (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    marked_pandl decimal(18,4) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    today_strike_capt_qty decimal(18,2) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    posi_nav_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-期货交易组持仓
use db_rpts;
DROP TABLE IF EXISTS vi_futu_qry_grp_posi;
CREATE TABLE vi_futu_qry_grp_posi (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    marked_pandl decimal(18,4) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    today_strike_capt_qty decimal(18,2) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    posi_nav_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-期货产品持仓-历史
use db_rpts_his;
DROP TABLE IF EXISTS vi_futu_qry_pd_posi_his;
CREATE TABLE vi_futu_qry_pd_posi_his (
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
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    marked_pandl decimal(18,4) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    today_strike_capt_qty decimal(18,2) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    posi_nav_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-期货交易组持仓-历史
use db_rpts_his;
DROP TABLE IF EXISTS vi_futu_qry_grp_posi_his;
CREATE TABLE vi_futu_qry_grp_posi_his (
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
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    marked_pandl decimal(18,4) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    today_strike_capt_qty decimal(18,2) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    posi_nav_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-期货交易组持仓明细
use db_rpts;
DROP TABLE IF EXISTS vi_futu_qry_grp_posi_detail;
CREATE TABLE vi_futu_qry_grp_posi_detail (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    open_posi_date int NOT NULL ,
    open_posi_time int NOT NULL ,
    marked_pandl decimal(18,4) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-机构资产
use db_rpts;
DROP TABLE IF EXISTS vi_rpt_sum_asset;
CREATE TABLE vi_rpt_sum_asset (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_视图-机构资产-历史
use db_rpts_his;
DROP TABLE IF EXISTS vi_rpt_sum_asset_his;
CREATE TABLE vi_rpt_sum_asset_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_资管报表_指令表
use db_rpts;
DROP TABLE IF EXISTS vi_tdseap_command;
CREATE TABLE vi_tdseap_command (
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
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    target_code_no int NOT NULL ,
    trade_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
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
    comm_frozen_amt decimal(18,4) NOT NULL ,
    comm_frozen_qty decimal(18,2) NOT NULL ,
    net_price_flag int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    intrst_days int NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
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
    basket_id bigint NOT NULL ,
    comm_oper_way varchar(2) NOT NULL ,
    exter_comm_flag int NOT NULL ,
    comm_comple_flag int NOT NULL ,
    strategy_order_qty decimal(18,2) NOT NULL ,
    strategy_capt_qty decimal(18,2) NOT NULL ,
    combo_code varchar(32) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_vi_tdseap_command_1 on vi_tdseap_command (comm_batch_no);
create index idx_vi_tdseap_command_2 on vi_tdseap_command (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_vi_tdseap_command_3 on vi_tdseap_command (comm_date,comm_end_date);
create index idx_vi_tdseap_command_4 on vi_tdseap_command (exter_comm_flag,comm_comple_flag);
create index idx_vi_tdseap_command_5 on vi_tdseap_command (stock_acco_no,stock_code_no);

-- 创建数据表：历史_报表_资管报表_指令表
use db_rpts_his;
DROP TABLE IF EXISTS vi_tdseap_command_his;
CREATE TABLE vi_tdseap_command_his (
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
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    target_code_no int NOT NULL ,
    trade_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
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
    comm_frozen_amt decimal(18,4) NOT NULL ,
    comm_frozen_qty decimal(18,2) NOT NULL ,
    net_price_flag int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    intrst_days int NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
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
    basket_id bigint NOT NULL ,
    comm_oper_way varchar(2) NOT NULL ,
    exter_comm_flag int NOT NULL ,
    comm_comple_flag int NOT NULL ,
    strategy_order_qty decimal(18,2) NOT NULL ,
    strategy_capt_qty decimal(18,2) NOT NULL ,
    combo_code varchar(32) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_vi_tdseap_command_his_1 on vi_tdseap_command_his (comm_batch_no);
create index idx_vi_tdseap_command_his_2 on vi_tdseap_command_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_vi_tdseap_command_his_3 on vi_tdseap_command_his (comm_date,comm_end_date);
create index idx_vi_tdseap_command_his_4 on vi_tdseap_command_his (exter_comm_flag,comm_comple_flag);
create index idx_vi_tdseap_command_his_5 on vi_tdseap_command_his (stock_acco_no,stock_code_no);

-- 创建数据表：报表_资管报表_订单表
use db_rpts;
DROP TABLE IF EXISTS vi_tdsetd_order;
CREATE TABLE vi_tdsetd_order (
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
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    external_no bigint NOT NULL ,
    comm_id bigint NOT NULL ,
    comm_batch_no int NOT NULL ,
    comm_opor int NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_batch_no int NOT NULL ,
    order_dir int NOT NULL ,
    price_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    order_status varchar(2) NOT NULL ,
    wtdraw_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
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
    strike_bond_accr_intrst decimal(18,4) NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    order_frozen_amt decimal(18,4) NOT NULL ,
    order_frozen_qty decimal(18,2) NOT NULL ,
    rsp_info varchar(255) NOT NULL ,
    compli_trig_id bigint NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    cost_calc_type int NOT NULL ,
    order_oper_way varchar(2) NOT NULL ,
    exter_comm_flag int NOT NULL ,
    record_valid_flag int NOT NULL ,
    combo_code varchar(32) NOT NULL ,
    combo_posi_id bigint NOT NULL ,
    strategy_id bigint NOT NULL ,
    sett_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_vi_tdsetd_order_1 on vi_tdsetd_order (pass_no,out_acco,exch_no,report_no,report_date);
create index idx_vi_tdsetd_order_2 on vi_tdsetd_order (order_date,order_batch_no);
create index idx_vi_tdsetd_order_3 on vi_tdsetd_order (order_date,order_status);
create index idx_vi_tdsetd_order_4 on vi_tdsetd_order (init_date,co_no,pd_no,exch_group_no);
create index idx_vi_tdsetd_order_5 on vi_tdsetd_order (stock_acco_no,stock_code_no);
create index idx_vi_tdsetd_order_6 on vi_tdsetd_order (exter_comm_flag,record_valid_flag);
create index idx_vi_tdsetd_order_7 on vi_tdsetd_order (co_no,pd_no,exch_group_no,order_status);

-- 创建数据表：历史_报表_资管报表_订单表
use db_rpts_his;
DROP TABLE IF EXISTS vi_tdsetd_order_his;
CREATE TABLE vi_tdsetd_order_his (
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
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    external_no bigint NOT NULL ,
    comm_id bigint NOT NULL ,
    comm_batch_no int NOT NULL ,
    comm_opor int NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_batch_no int NOT NULL ,
    order_dir int NOT NULL ,
    price_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    order_status varchar(2) NOT NULL ,
    wtdraw_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
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
    strike_bond_accr_intrst decimal(18,4) NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    order_frozen_amt decimal(18,4) NOT NULL ,
    order_frozen_qty decimal(18,2) NOT NULL ,
    rsp_info varchar(255) NOT NULL ,
    compli_trig_id bigint NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    cost_calc_type int NOT NULL ,
    order_oper_way varchar(2) NOT NULL ,
    exter_comm_flag int NOT NULL ,
    record_valid_flag int NOT NULL ,
    combo_code varchar(32) NOT NULL ,
    combo_posi_id bigint NOT NULL ,
    strategy_id bigint NOT NULL ,
    sett_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_vi_tdsetd_order_his_1 on vi_tdsetd_order_his (pass_no,out_acco,exch_no,report_no,report_date);
create index idx_vi_tdsetd_order_his_2 on vi_tdsetd_order_his (order_date,order_batch_no);
create index idx_vi_tdsetd_order_his_3 on vi_tdsetd_order_his (order_date,order_status);
create index idx_vi_tdsetd_order_his_4 on vi_tdsetd_order_his (init_date,co_no,pd_no,exch_group_no);
create index idx_vi_tdsetd_order_his_5 on vi_tdsetd_order_his (stock_acco_no,stock_code_no);
create index idx_vi_tdsetd_order_his_6 on vi_tdsetd_order_his (exter_comm_flag,record_valid_flag);
create index idx_vi_tdsetd_order_his_7 on vi_tdsetd_order_his (co_no,pd_no,exch_group_no,order_status);

-- 创建数据表：报表_资管报表_指令统计表
use db_rpts;
DROP TABLE IF EXISTS tb_rptstat_command;
CREATE TABLE tb_rptstat_command (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    order_dir int NOT NULL ,
    commd_cnt decimal(18,2) NOT NULL ,
    comm_qty decimal(18,2) NOT NULL ,
    comm_amt decimal(18,4) NOT NULL ,
    order_num int NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    order_amt decimal(18,4) NOT NULL ,
    undeal_amt decimal(18,4) NOT NULL ,
    strike_num int NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    quot_strike_qty decimal(18,2) NOT NULL ,
    quot_strike_amt decimal(18,4) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rptstat_command_1 on tb_rptstat_command (init_date,co_no,pd_no);

-- 创建数据表：历史_报表_资管报表_指令统计表
use db_rpts_his;
DROP TABLE IF EXISTS tb_rptstat_command_his;
CREATE TABLE tb_rptstat_command_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    order_dir int NOT NULL ,
    commd_cnt decimal(18,2) NOT NULL ,
    comm_qty decimal(18,2) NOT NULL ,
    comm_amt decimal(18,4) NOT NULL ,
    order_num int NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    order_amt decimal(18,4) NOT NULL ,
    undeal_amt decimal(18,4) NOT NULL ,
    strike_num int NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    quot_strike_qty decimal(18,2) NOT NULL ,
    quot_strike_amt decimal(18,4) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rptstat_command_his_1 on tb_rptstat_command_his (init_date,co_no,pd_no);

-- 创建数据表：报表_资管报表_交易操作效率表
use db_rpts;
DROP TABLE IF EXISTS tb_rptstat_trade_oper;
CREATE TABLE tb_rptstat_trade_oper (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    posi_yield_rate decimal(18,12) NOT NULL ,
    real_trade_oper_rate decimal(18,12) NOT NULL ,
    avg_nav_asset decimal(18,4) NOT NULL ,
    buy_amt decimal(18,4) NOT NULL ,
    sellout_amt decimal(18,4) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    begin_share_net_total decimal(18,4) NOT NULL ,
    pd_begin_unit_nav decimal(18,4) NOT NULL ,
    begin_net_all decimal(18,4) NOT NULL ,
    end_nav_asset decimal(18,4) NOT NULL ,
    end_share_net_total decimal(18,4) NOT NULL ,
    end_net_all decimal(18,4) NOT NULL ,
    end_unit_nav decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rptstat_trade_oper_1 on tb_rptstat_trade_oper (init_date,co_no,pd_no);

-- 创建数据表：历史_报表_资管报表_交易操作效率表
use db_rpts_his;
DROP TABLE IF EXISTS tb_rptstat_trade_oper_his;
CREATE TABLE tb_rptstat_trade_oper_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    posi_yield_rate decimal(18,12) NOT NULL ,
    real_trade_oper_rate decimal(18,12) NOT NULL ,
    avg_nav_asset decimal(18,4) NOT NULL ,
    buy_amt decimal(18,4) NOT NULL ,
    sellout_amt decimal(18,4) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    begin_share_net_total decimal(18,4) NOT NULL ,
    pd_begin_unit_nav decimal(18,4) NOT NULL ,
    begin_net_all decimal(18,4) NOT NULL ,
    end_nav_asset decimal(18,4) NOT NULL ,
    end_share_net_total decimal(18,4) NOT NULL ,
    end_net_all decimal(18,4) NOT NULL ,
    end_unit_nav decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rptstat_trade_oper_his_1 on tb_rptstat_trade_oper_his (init_date,co_no,pd_no);

-- 创建数据表：报表_资管报表_报表汇总产品证券成交
use db_rpts;
DROP TABLE IF EXISTS tb_rptsum_pd_stock_strike;
CREATE TABLE tb_rptsum_pd_stock_strike (
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
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
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
    order_batch_no int NOT NULL ,
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
    bond_accr_intrst decimal(18,12) NOT NULL ,
    strike_bond_accr_intrst decimal(18,4) NOT NULL ,
    net_price_flag int NOT NULL ,
    order_oper_way varchar(2) NOT NULL ,
    exter_comm_flag int NOT NULL ,
    record_valid_flag int NOT NULL ,
    external_no bigint NOT NULL ,
    combo_code varchar(32) NOT NULL ,
    quot_strike_qty decimal(18,2) NOT NULL ,
    quot_strike_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rptsum_pd_stock_strike_1 on tb_rptsum_pd_stock_strike (init_date,co_no,pd_no,stock_code_no);

-- 创建数据表：历史_报表_资管报表_报表汇总产品证券成交
use db_rpts_his;
DROP TABLE IF EXISTS tb_rptsum_pd_stock_strike_his;
CREATE TABLE tb_rptsum_pd_stock_strike_his (
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
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
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
    order_batch_no int NOT NULL ,
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
    bond_accr_intrst decimal(18,12) NOT NULL ,
    strike_bond_accr_intrst decimal(18,4) NOT NULL ,
    net_price_flag int NOT NULL ,
    order_oper_way varchar(2) NOT NULL ,
    exter_comm_flag int NOT NULL ,
    record_valid_flag int NOT NULL ,
    external_no bigint NOT NULL ,
    combo_code varchar(32) NOT NULL ,
    quot_strike_qty decimal(18,2) NOT NULL ,
    quot_strike_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rptsum_pd_stock_strike_his_1 on tb_rptsum_pd_stock_strike_his (init_date,co_no,pd_no,stock_code_no);
commit;
