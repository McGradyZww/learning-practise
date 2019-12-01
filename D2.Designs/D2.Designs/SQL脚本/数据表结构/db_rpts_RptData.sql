-- /**************************************************************************************/
-- 创建数据库【报表】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_rpts DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_rpts_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：报表_报表数据_报表产品信息表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_productinfo;
CREATE TABLE tb_rpt_productinfo (
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
    last_year_pd_nav decimal(16,9) NOT NULL ,
    total_unit_nav decimal(18,4) NOT NULL ,
    coust_full_name varchar(255) NOT NULL ,
    coust_acco varchar(16) NOT NULL ,
    coust_acco_name varchar(64) NOT NULL ,
    pd_status varchar(2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    cost_calc_type int NOT NULL ,
    risk_free_interest_rate decimal(18,12) NOT NULL ,
    allow_exch varchar(64) NOT NULL ,
    borker_no int NOT NULL ,
    borker_name varchar(64) NOT NULL ,
    commis_ratio decimal(18,12) NOT NULL ,
    broker_my_type int NOT NULL ,
    share_net_total_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rpt_productinfo_1 on tb_rpt_productinfo (co_no,pd_code);
create index idx_tb_rpt_productinfo_2 on tb_rpt_productinfo (pd_no);

-- 创建数据表：报表_报表数据_报表产品信息临时表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_productinfo_tmp;
CREATE TABLE tb_rpt_productinfo_tmp (
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
    pd_status varchar(2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    cost_calc_type int NOT NULL ,
    risk_free_interest_rate decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rpt_productinfo_tmp_1 on tb_rpt_productinfo_tmp (co_no,pd_code);
create index idx_tb_rpt_productinfo_tmp_2 on tb_rpt_productinfo_tmp (pd_no);

-- 创建数据表：报表_报表数据_报表历史产品信息表
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_productinfo_his;
CREATE TABLE tb_rpt_productinfo_his (
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
    last_year_pd_nav decimal(16,9) NOT NULL ,
    total_unit_nav decimal(18,4) NOT NULL ,
    coust_full_name varchar(255) NOT NULL ,
    coust_acco varchar(16) NOT NULL ,
    coust_acco_name varchar(64) NOT NULL ,
    pd_status varchar(2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    cost_calc_type int NOT NULL ,
    risk_free_interest_rate decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rpt_productinfo_his_1 on tb_rpt_productinfo_his (init_date,co_no,pd_code);
create index idx_tb_rpt_productinfo_his_2 on tb_rpt_productinfo_his (init_date,pd_no);

-- 创建数据表：报表_报表数据_产品资产表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_productasset;
CREATE TABLE tb_rpt_productasset (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    runtime int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    total_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    option_asset decimal(18,4) NOT NULL ,
    warrant_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    acco_cash decimal(18,4) NOT NULL ,
    cash_bala decimal(18,4) NOT NULL ,
    apply_amt decimal(18,4) NOT NULL ,
    redemp_amt decimal(18,4) NOT NULL ,
    total_cash_divide decimal(18,4) NOT NULL ,
    money_fund_asset decimal(18,4) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    pre_pd_unit_nav decimal(18,4) NOT NULL ,
    total_unit_nav decimal(18,4) NOT NULL ,
    last_week_pd_nav decimal(18,4) NOT NULL ,
    last_month_pd_nav decimal(18,4) NOT NULL ,
    last_quarter_pd_nav decimal(18,4) NOT NULL ,
    last_year_pd_nav decimal(16,9) NOT NULL ,
    pd_all_share decimal(18,2) NOT NULL ,
    curr_share decimal(18,2) NOT NULL ,
    pre_share decimal(18,2) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    product_unit_nav_ration decimal(18,12) NOT NULL ,
    buy_amt decimal(18,4) NOT NULL ,
    sellout_amt decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_productasset_1 on tb_rpt_productasset (init_date,pd_no,crncy_type);
create index idx_tb_rpt_productasset_2 on tb_rpt_productasset (init_date,co_no,pd_code);
create index idx_tb_rpt_productasset_3 on tb_rpt_productasset (co_no,pd_code,init_date);

-- 创建数据表：报表_报表数据_产品资产表历史
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_productasset_his;
CREATE TABLE tb_rpt_productasset_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    runtime int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    total_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    option_asset decimal(18,4) NOT NULL ,
    warrant_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    acco_cash decimal(18,4) NOT NULL ,
    cash_bala decimal(18,4) NOT NULL ,
    apply_amt decimal(18,4) NOT NULL ,
    redemp_amt decimal(18,4) NOT NULL ,
    total_cash_divide decimal(18,4) NOT NULL ,
    money_fund_asset decimal(18,4) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    pre_pd_unit_nav decimal(18,4) NOT NULL ,
    total_unit_nav decimal(18,4) NOT NULL ,
    last_week_pd_nav decimal(18,4) NOT NULL ,
    last_month_pd_nav decimal(18,4) NOT NULL ,
    last_quarter_pd_nav decimal(18,4) NOT NULL ,
    last_year_pd_nav decimal(16,9) NOT NULL ,
    pd_all_share decimal(18,2) NOT NULL ,
    curr_share decimal(18,2) NOT NULL ,
    pre_share decimal(18,2) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    product_unit_nav_ration decimal(18,12) NOT NULL ,
    buy_amt decimal(18,4) NOT NULL ,
    sellout_amt decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_productasset_his_1 on tb_rpt_productasset_his (init_date,pd_no,crncy_type);
create index idx_tb_rpt_productasset_his_2 on tb_rpt_productasset_his (init_date,co_no,pd_code);
create index idx_tb_rpt_productasset_his_3 on tb_rpt_productasset_his (co_no,pd_code,init_date);

-- 创建数据表：报表_报表数据_产品持仓表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_productholder;
CREATE TABLE tb_rpt_productholder (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_code varchar(32) NOT NULL ,
    pd_name varchar(64) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    asset_acco_str varchar(2048) NOT NULL ,
    stock_acco_str varchar(2048) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    invest_type int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    asset_kind int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    stock_asset_value decimal(18,4) NOT NULL ,
    value_dirty_price decimal(16,9) NOT NULL ,
    value_net_price decimal(16,9) NOT NULL ,
    buy_qty decimal(18,2) NOT NULL ,
    buy_amt decimal(18,4) NOT NULL ,
    sell_qty decimal(18,2) NOT NULL ,
    sellout_amt decimal(18,4) NOT NULL ,
    record_count int NOT NULL ,
    record_remark varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rpt_productholder_1 on tb_rpt_productholder (init_date,pd_no,exch_no,stock_code);
create index idx_tb_rpt_productholder_2 on tb_rpt_productholder (init_date,co_no,pd_code,exch_no,stock_code);
create index idx_tb_rpt_productholder_3 on tb_rpt_productholder (co_no,init_date,pd_no,exch_no,stock_code);

-- 创建数据表：报表_报表数据_产品持仓表历史
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_productholder_his;
CREATE TABLE tb_rpt_productholder_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    asset_acco_str varchar(2048) NOT NULL ,
    stock_acco_str varchar(2048) NOT NULL ,
    invest_type int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    asset_kind int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    stock_asset_value decimal(18,4) NOT NULL ,
    value_dirty_price decimal(16,9) NOT NULL ,
    value_net_price decimal(16,9) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    buy_qty decimal(18,2) NOT NULL ,
    buy_amt decimal(18,4) NOT NULL ,
    sell_qty decimal(18,2) NOT NULL ,
    sellout_amt decimal(18,4) NOT NULL ,
    record_count int NOT NULL ,
    record_remark varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_productholder_his_1 on tb_rpt_productholder_his (init_date,co_no,pd_no,stock_code,exch_no);
create index idx_tb_rpt_productholder_his_2 on tb_rpt_productholder_his (init_date,pd_no,stock_code_no);
create index idx_tb_rpt_productholder_his_3 on tb_rpt_productholder_his (co_no,pd_no,stock_code_no,init_date);

-- 创建数据表：报表_报表数据_报表交易日信息表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_tradeday;
CREATE TABLE tb_rpt_tradeday (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    trade_date int NOT NULL ,
    exch_name varchar(64) NOT NULL ,
    exch_no int NOT NULL ,
    is_open varchar(2) NOT NULL ,
    last_tradeday int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_报表数据_报表产品持仓市值表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_product_marketvalue;
CREATE TABLE tb_rpt_product_marketvalue (
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
    market_value decimal(18,4) NOT NULL ,
    market_value_sh decimal(18,4) NOT NULL ,
    market_value_sz decimal(18,4) NOT NULL ,
    market_value_avg decimal(18,4) NOT NULL ,
    market_value_avg_sh decimal(18,4) NOT NULL ,
    market_value_avg_sz decimal(18,4) NOT NULL ,
    market_value_last_twedays decimal(18,4) NOT NULL ,
    market_value_last_twedays_sh decimal(18,4) NOT NULL ,
    market_value_last_twedays_sz decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_报表数据_报表交易周信息表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_week_tradeday;
CREATE TABLE tb_rpt_week_tradeday (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    curr_year int NOT NULL ,
    curr_week int NOT NULL ,
    last_week_max_tradeday int NOT NULL ,
    curr_week_min_tradeday int NOT NULL ,
    curr_week_max_tradeday int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_报表数据_报表收益率基础表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_return_basic;
CREATE TABLE tb_rpt_return_basic (
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
    unit_nav decimal(18,4) NOT NULL ,
    daily_pandl_ratio decimal(18,12) NOT NULL ,
    daily_pandl_ratio_year decimal(18,12) NOT NULL ,
    total_realiz_pandl_ratio decimal(18,12) NOT NULL ,
    total_realize_pandl_ratio_year decimal(18,12) NOT NULL ,
    excess_earning_year decimal(18,12) NOT NULL ,
    day_retracement decimal(18,12) NOT NULL ,
    day_continue_retracement decimal(18,12) NOT NULL ,
    sharpe_ration decimal(18,12) NOT NULL ,
    max_retracement decimal(18,12) NOT NULL ,
    product_return_rate decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_报表数据_报表委托表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_secu_order;
CREATE TABLE tb_rpt_secu_order (
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
    opor_no int NOT NULL ,
    comm_opor int NOT NULL ,
    mach_date int NOT NULL ,
    external_no bigint NOT NULL ,
    order_batch_no int NOT NULL ,
    order_no int NOT NULL ,
    comm_id bigint NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    unit_id bigint NOT NULL ,
    part_code varchar(6) NOT NULL ,
    part_name varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    pass_no int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    exch_no int NOT NULL ,
    invest_type int NOT NULL ,
    asset_type int NOT NULL ,
    stock_type int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    order_dir int NOT NULL ,
    price_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    order_status varchar(2) NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    wtdraw_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    oper_statn varchar(64) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    stamp_tax decimal(18,4) NOT NULL ,
    trans_fee decimal(18,4) NOT NULL ,
    brkage_fee decimal(18,4) NOT NULL ,
    SEC_charges decimal(18,4) NOT NULL ,
    other_fee decimal(18,4) NOT NULL ,
    trade_commis decimal(18,4) NOT NULL ,
    other_commis decimal(18,4) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    net_price_flag int NOT NULL ,
    strike_bond_accr_intrst decimal(18,4) NOT NULL ,
    order_frozen_amt decimal(18,4) NOT NULL ,
    rsp_info varchar(255) NOT NULL ,
    compli_trig_id bigint NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    bank_ib_member varchar(255) NOT NULL ,
    intrst_days int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    bond_rate_type int NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    order_frozen_qty decimal(18,2) NOT NULL ,
    order_oper_way varchar(2) NOT NULL ,
    exter_comm_flag int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    comm_batch_no int NOT NULL ,
    record_valid_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：历史_报表_报表数据_报表委托表
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_secu_order_his;
CREATE TABLE tb_rpt_secu_order_his (
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
    opor_no int NOT NULL ,
    comm_opor int NOT NULL ,
    mach_date int NOT NULL ,
    external_no bigint NOT NULL ,
    order_batch_no int NOT NULL ,
    order_no int NOT NULL ,
    comm_id bigint NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    unit_id bigint NOT NULL ,
    part_code varchar(6) NOT NULL ,
    part_name varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    pass_no int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    exch_no int NOT NULL ,
    invest_type int NOT NULL ,
    asset_type int NOT NULL ,
    stock_type int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    order_dir int NOT NULL ,
    price_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    order_status varchar(2) NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    wtdraw_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    oper_statn varchar(64) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    stamp_tax decimal(18,4) NOT NULL ,
    trans_fee decimal(18,4) NOT NULL ,
    brkage_fee decimal(18,4) NOT NULL ,
    SEC_charges decimal(18,4) NOT NULL ,
    other_fee decimal(18,4) NOT NULL ,
    trade_commis decimal(18,4) NOT NULL ,
    other_commis decimal(18,4) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    net_price_flag int NOT NULL ,
    strike_bond_accr_intrst decimal(18,4) NOT NULL ,
    order_frozen_amt decimal(18,4) NOT NULL ,
    rsp_info varchar(255) NOT NULL ,
    compli_trig_id bigint NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    bank_ib_member varchar(255) NOT NULL ,
    intrst_days int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    bond_rate_type int NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    order_frozen_qty decimal(18,2) NOT NULL ,
    order_oper_way varchar(2) NOT NULL ,
    exter_comm_flag int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    comm_batch_no int NOT NULL ,
    record_valid_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_报表数据_报表成交表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_secu_execution;
CREATE TABLE tb_rpt_secu_execution (
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
    opor_no int NOT NULL ,
    unit_id bigint NOT NULL ,
    part_code varchar(6) NOT NULL ,
    part_name varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    pass_no int NOT NULL ,
    comm_id bigint NOT NULL ,
    order_no int NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    exch_no int NOT NULL ,
    invest_type int NOT NULL ,
    stock_type int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
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
    bond_accr_intrst decimal(18,12) NOT NULL ,
    net_price_flag int NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    bank_ib_member varchar(255) NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    comm_batch_no int NOT NULL ,
    order_id bigint NOT NULL ,
    intrst_days int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    bond_rate_type int NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    order_oper_way varchar(2) NOT NULL ,
    exter_comm_flag int NOT NULL ,
    record_valid_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：历史_报表_报表数据_报表成交表
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_secu_execution_his;
CREATE TABLE tb_rpt_secu_execution_his (
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
    opor_no int NOT NULL ,
    unit_id bigint NOT NULL ,
    part_code varchar(6) NOT NULL ,
    part_name varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    pass_no int NOT NULL ,
    comm_id bigint NOT NULL ,
    order_no int NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    exch_no int NOT NULL ,
    invest_type int NOT NULL ,
    stock_type int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
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
    bond_accr_intrst decimal(18,12) NOT NULL ,
    net_price_flag int NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    bank_ib_member varchar(255) NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    comm_batch_no int NOT NULL ,
    order_id bigint NOT NULL ,
    intrst_days int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    bond_rate_type int NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    order_oper_way varchar(2) NOT NULL ,
    exter_comm_flag int NOT NULL ,
    record_valid_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_报表数据_单元委托表历史
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_secu_order_his;
CREATE TABLE tb_rpt_secu_order_his (
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
    opor_no int NOT NULL ,
    comm_opor int NOT NULL ,
    mach_date int NOT NULL ,
    external_no bigint NOT NULL ,
    order_batch_no int NOT NULL ,
    order_no int NOT NULL ,
    comm_id bigint NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    unit_id bigint NOT NULL ,
    part_code varchar(6) NOT NULL ,
    part_name varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    pass_no int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    exch_no int NOT NULL ,
    invest_type int NOT NULL ,
    asset_type int NOT NULL ,
    stock_type int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    order_dir int NOT NULL ,
    price_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    order_status varchar(2) NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    wtdraw_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    oper_statn varchar(64) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    stamp_tax decimal(18,4) NOT NULL ,
    trans_fee decimal(18,4) NOT NULL ,
    brkage_fee decimal(18,4) NOT NULL ,
    SEC_charges decimal(18,4) NOT NULL ,
    other_fee decimal(18,4) NOT NULL ,
    trade_commis decimal(18,4) NOT NULL ,
    other_commis decimal(18,4) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    net_price_flag int NOT NULL ,
    strike_bond_accr_intrst decimal(18,4) NOT NULL ,
    order_frozen_amt decimal(18,4) NOT NULL ,
    rsp_info varchar(255) NOT NULL ,
    compli_trig_id bigint NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    bank_ib_member varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_报表数据_单元成交表历史
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_secu_execution_his;
CREATE TABLE tb_rpt_secu_execution_his (
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
    opor_no int NOT NULL ,
    unit_id bigint NOT NULL ,
    part_code varchar(6) NOT NULL ,
    part_name varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    pass_no int NOT NULL ,
    comm_id bigint NOT NULL ,
    order_no int NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    exch_no int NOT NULL ,
    invest_type int NOT NULL ,
    stock_type int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
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
    bond_accr_intrst decimal(18,12) NOT NULL ,
    net_price_flag int NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    bank_ib_member varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_报表数据_资产分类表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_asset_class_define;
CREATE TABLE tb_rpt_asset_class_define (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    asset_class int NOT NULL ,
    asset_class_name varchar(255) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    asset_value decimal(18,4) NOT NULL ,
    exch_no int NOT NULL ,
    invest_type int NOT NULL ,
    stock_type_str varchar(2048) NOT NULL ,
    source_table_name varchar(64) NOT NULL ,
    calc_formula varchar(255) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_报表数据_资产分类公式表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_asset_class_calc_formula;
CREATE TABLE tb_rpt_asset_class_calc_formula (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    asset_class int NOT NULL ,
    asset_class_name varchar(255) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    invest_type int NOT NULL ,
    stock_type int NOT NULL ,
    asset_value decimal(18,4) NOT NULL ,
    source_table_name varchar(64) NOT NULL ,
    calc_formula varchar(255) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_报表数据_产品资产类别明细表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_pd_asset_class_total;
CREATE TABLE tb_rpt_pd_asset_class_total (
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
    exch_no int NOT NULL ,
    invest_type int NOT NULL ,
    stock_type int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    asset_value decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_报表数据_报表产品自定义资产
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_pd_def_asset;
CREATE TABLE tb_rpt_pd_def_asset (
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
    def_asset_type int NOT NULL ,
    def_asset_field int NOT NULL ,
    def_type int NOT NULL ,
    asset_value decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_pd_def_asset_1 on tb_rpt_pd_def_asset (pd_no,co_no,def_asset_type,def_asset_field,crncy_type);
create index idx_tb_rpt_pd_def_asset_2 on tb_rpt_pd_def_asset (co_no,def_asset_type);

-- 创建数据表：报表_报表数据_报表产品自定义历史资产
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_pd_def_asset_his;
CREATE TABLE tb_rpt_pd_def_asset_his (
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
    def_asset_type int NOT NULL ,
    def_asset_field int NOT NULL ,
    def_type int NOT NULL ,
    asset_value decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_pd_def_asset_his_1 on tb_rpt_pd_def_asset_his (init_date,pd_no,co_no,def_asset_type,def_asset_field,crncy_type);
create index idx_tb_rpt_pd_def_asset_his_2 on tb_rpt_pd_def_asset_his (init_date,co_no,def_asset_type);

-- 创建数据表：报表_报表数据_报表序列表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_sequence;
CREATE TABLE tb_rpt_sequence (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_报表数据_报表交易组附加属性表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_exgp_ex_info;
CREATE TABLE tb_rpt_exgp_ex_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    pd_no int NOT NULL ,
    co_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    first_asset decimal(18,4) NOT NULL ,
    first_amt decimal(18,4) NOT NULL ,
    curr_share decimal(18,2) NOT NULL ,
    strategy_type int NOT NULL ,
    total_pre_fee decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_exgp_ex_info_1 on tb_rpt_exgp_ex_info (exch_group_no,pd_no,co_no);
create index idx_tb_rpt_exgp_ex_info_2 on tb_rpt_exgp_ex_info (pd_no);

-- 创建数据表：报表_报表数据_报表持仓交易组持仓表
use db_rpts;
DROP TABLE IF EXISTS tb_pdsepo_exgp_posi;
CREATE TABLE tb_pdsepo_exgp_posi (
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
create unique index idx_tb_pdsepo_exgp_posi_1 on tb_pdsepo_exgp_posi (exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_pdsepo_exgp_posi_2 on tb_pdsepo_exgp_posi (co_no,pd_no,exch_no);

-- 创建数据表：报表_报表数据_报表持仓历史交易组持仓表
use db_rpts_his;
DROP TABLE IF EXISTS tb_pdsepo_exgp_posi_his;
CREATE TABLE tb_pdsepo_exgp_posi_his (
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
create unique index idx_tb_pdsepo_exgp_posi_his_1 on tb_pdsepo_exgp_posi_his (init_date,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_pdsepo_exgp_posi_his_2 on tb_pdsepo_exgp_posi_his (init_date,co_no,pd_no,exch_no);

-- 创建数据表：报表_报表数据_报表周
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_week;
CREATE TABLE tb_rpt_week (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    curr_year int NOT NULL ,
    week_no int NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_week_1 on tb_rpt_week (curr_year,week_no);

-- 创建数据表：报表_报表数据_报表统计区间
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_region;
CREATE TABLE tb_rpt_region (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    curr_month int NOT NULL ,
    region_type int NOT NULL ,
    region_type_name varchar(255) NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_region_1 on tb_rpt_region (curr_month,region_type);

-- 创建数据表：报表_报表数据_报表产品日净值
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_pd_day_net;
CREATE TABLE tb_rpt_pd_day_net (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    share_net decimal(18,4) NOT NULL ,
    last_share_net decimal(18,4) NOT NULL ,
    share_net_total decimal(18,4) NOT NULL ,
    pre_share_net_total decimal(18,4) NOT NULL ,
    net_change decimal(18,4) NOT NULL ,
    net_growth_rate decimal(18,12) NOT NULL ,
    grp_row bigint NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    asset_market_value decimal(18,4) NOT NULL ,
    fund_share_total decimal(18,2) NOT NULL ,
    fund_asset_net decimal(18,4) NOT NULL ,
    pd_nav_day_ratio decimal(18,12) NOT NULL ,
    pd_nav_month_ratio decimal(18,12) NOT NULL ,
    total_realiz_pandl_ratio decimal(18,12) NOT NULL ,
    divi_amt decimal(18,4) NOT NULL ,
    divi_share decimal(18,4) NOT NULL ,
    share_bonus_amt decimal(18,4) NOT NULL ,
    share_bonus_share decimal(18,4) NOT NULL ,
    unit_nav_exclude_divi decimal(18,4) NOT NULL ,
    unit_nav_exclude_bonus decimal(18,4) NOT NULL ,
    pre_fee_share_net_total decimal(18,4) NOT NULL ,
    post_fee_share_net_total decimal(18,4) NOT NULL ,
    achieve_performance decimal(18,4) NOT NULL ,
    recover_param decimal(18,12) NOT NULL ,
    last_init_date int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_pd_day_net_1 on tb_rpt_pd_day_net (init_date,pd_no,co_no);

-- 创建数据表：报表_报表数据_报表指数日行情
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_index_day_quota;
CREATE TABLE tb_rpt_index_day_quota (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    today_close_price decimal(16,9) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    price_change decimal(18,4) NOT NULL ,
    price_growth_rate decimal(18,4) NOT NULL ,
    grp_row bigint NOT NULL ,
    last_init_date int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_index_day_quota_1 on tb_rpt_index_day_quota (init_date,stock_code_no);
create index idx_tb_rpt_index_day_quota_2 on tb_rpt_index_day_quota (init_date,stock_code,exch_no);

-- 创建数据表：报表_报表数据_报表产品周净值
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_pd_week_net;
CREATE TABLE tb_rpt_pd_week_net (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    curr_year int NOT NULL ,
    week_no int NOT NULL ,
    share_net decimal(18,4) NOT NULL ,
    share_net_total decimal(18,4) NOT NULL ,
    pre_share_net_total decimal(18,4) NOT NULL ,
    net_change decimal(18,4) NOT NULL ,
    net_growth_rate decimal(18,12) NOT NULL ,
    stat_days int NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    grp_row bigint NOT NULL ,
    last_init_date int NOT NULL ,
    pre_fee_share_net_total decimal(18,4) NOT NULL ,
    post_fee_share_net_total decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_pd_week_net_1 on tb_rpt_pd_week_net (pd_no,curr_year,week_no);

-- 创建数据表：报表_报表数据_报表指数周行情
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_index_week_quota;
CREATE TABLE tb_rpt_index_week_quota (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    curr_year int NOT NULL ,
    week_no int NOT NULL ,
    today_close_price decimal(16,9) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    price_change decimal(18,4) NOT NULL ,
    price_growth_rate decimal(18,4) NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    grp_row bigint NOT NULL ,
    last_init_date int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_index_week_quota_1 on tb_rpt_index_week_quota (curr_year,week_no,stock_code_no);
create index idx_tb_rpt_index_week_quota_2 on tb_rpt_index_week_quota (stock_code_no,init_date);

-- 创建数据表：报表_报表数据_报表产品月净值
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_pd_month_net;
CREATE TABLE tb_rpt_pd_month_net (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    curr_month int NOT NULL ,
    share_net decimal(18,4) NOT NULL ,
    share_net_total decimal(18,4) NOT NULL ,
    pre_share_net_total decimal(18,4) NOT NULL ,
    stat_days int NOT NULL ,
    rise_days int NOT NULL ,
    fall_days int NOT NULL ,
    max_cont_rise_days int NOT NULL ,
    max_cont_fall_days int NOT NULL ,
    net_change decimal(18,4) NOT NULL ,
    net_growth_rate decimal(18,12) NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    grp_row bigint NOT NULL ,
    last_init_date int NOT NULL ,
    pre_fee_share_net_total decimal(18,4) NOT NULL ,
    post_fee_share_net_total decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_pd_month_net_1 on tb_rpt_pd_month_net (pd_no,curr_month);

-- 创建数据表：报表_报表数据_报表指数月行情
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_index_month_quota;
CREATE TABLE tb_rpt_index_month_quota (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    curr_month int NOT NULL ,
    today_close_price decimal(16,9) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    stat_days int NOT NULL ,
    rise_days int NOT NULL ,
    fall_days int NOT NULL ,
    max_cont_rise_days int NOT NULL ,
    max_cont_fall_days int NOT NULL ,
    price_change decimal(18,4) NOT NULL ,
    price_growth_rate decimal(18,4) NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    grp_row bigint NOT NULL ,
    last_init_date int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_index_month_quota_1 on tb_rpt_index_month_quota (curr_month,stock_code_no);
create index idx_tb_rpt_index_month_quota_2 on tb_rpt_index_month_quota (curr_month,stock_code,exch_no);
create index idx_tb_rpt_index_month_quota_3 on tb_rpt_index_month_quota (stock_code_no);

-- 创建数据表：报表_报表数据_报表产品季度净值
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_pd_quarter_net;
CREATE TABLE tb_rpt_pd_quarter_net (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    curr_year int NOT NULL ,
    quarter_no int NOT NULL ,
    share_net decimal(18,4) NOT NULL ,
    share_net_total decimal(18,4) NOT NULL ,
    pre_share_net_total decimal(18,4) NOT NULL ,
    stat_days int NOT NULL ,
    rise_days int NOT NULL ,
    fall_days int NOT NULL ,
    max_cont_rise_days int NOT NULL ,
    max_cont_fall_days int NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    grp_row bigint NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_pd_quarter_net_1 on tb_rpt_pd_quarter_net (pd_no,curr_year,quarter_no);

-- 创建数据表：报表_报表数据_报表指数季度行情
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_index_quarter_quota;
CREATE TABLE tb_rpt_index_quarter_quota (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    curr_year int NOT NULL ,
    quarter_no int NOT NULL ,
    today_close_price decimal(16,9) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    stat_days int NOT NULL ,
    rise_days int NOT NULL ,
    fall_days int NOT NULL ,
    max_cont_rise_days int NOT NULL ,
    max_cont_fall_days int NOT NULL ,
    price_change decimal(18,4) NOT NULL ,
    price_growth_rate decimal(18,4) NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    grp_row bigint NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_index_quarter_quota_1 on tb_rpt_index_quarter_quota (curr_year,quarter_no,stock_code_no);

-- 创建数据表：报表_报表数据_报表产品区间统计
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_pd_region_stat;
CREATE TABLE tb_rpt_pd_region_stat (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    curr_month int NOT NULL ,
    region_type int NOT NULL ,
    region_type_name varchar(255) NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    stat_days int NOT NULL ,
    rise_days int NOT NULL ,
    fall_days int NOT NULL ,
    max_cont_rise_days int NOT NULL ,
    max_cont_fall_days int NOT NULL ,
    day_win_ratio decimal(18,4) NOT NULL ,
    week_cnt int NOT NULL ,
    rise_weeks int NOT NULL ,
    fall_weeks int NOT NULL ,
    week_win_ratio decimal(18,4) NOT NULL ,
    begin_share_net_total decimal(18,4) NOT NULL ,
    end_share_net_total decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_pd_region_stat_1 on tb_rpt_pd_region_stat (curr_month,pd_no,region_type);
create index idx_tb_rpt_pd_region_stat_2 on tb_rpt_pd_region_stat (co_no,pd_no,curr_month);

-- 创建数据表：报表_报表数据_报表指数区间统计
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_index_region_stat;
CREATE TABLE tb_rpt_index_region_stat (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    curr_month int NOT NULL ,
    region_type int NOT NULL ,
    region_type_name varchar(255) NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    stat_days int NOT NULL ,
    rise_days int NOT NULL ,
    fall_days int NOT NULL ,
    max_cont_rise_days int NOT NULL ,
    max_cont_fall_days int NOT NULL ,
    day_win_ratio decimal(18,4) NOT NULL ,
    week_cnt int NOT NULL ,
    rise_weeks int NOT NULL ,
    fall_weeks int NOT NULL ,
    week_win_ratio decimal(18,4) NOT NULL ,
    begin_share_net_total decimal(18,4) NOT NULL ,
    end_share_net_total decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_index_region_stat_1 on tb_rpt_index_region_stat (curr_month,stock_code_no,region_type);

-- 创建数据表：报表_报表数据_报表产品区间指标
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_pd_region_indicator;
CREATE TABLE tb_rpt_pd_region_indicator (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    curr_month int NOT NULL ,
    region_type int NOT NULL ,
    region_type_name varchar(255) NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    indicator_id int NOT NULL ,
    indicator_name varchar(255) NOT NULL ,
    indicator_value decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_pd_region_indicator_1 on tb_rpt_pd_region_indicator (pd_no,curr_month,region_type);

-- 创建数据表：报表_报表数据_报表指数区间指标
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_index_region_indicator;
CREATE TABLE tb_rpt_index_region_indicator (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    curr_month int NOT NULL ,
    region_type int NOT NULL ,
    region_type_name varchar(255) NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    indicator_id int NOT NULL ,
    indicator_name varchar(255) NOT NULL ,
    indicator_value decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_index_region_indicator_1 on tb_rpt_index_region_indicator (curr_month,stock_code_no,region_type);

-- 创建数据表：报表_报表数据_报表产品月报
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_pd_month_rpt_info;
CREATE TABLE tb_rpt_pd_month_rpt_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    curr_month int NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    rpt_content text NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    rpt_add_info varchar(10000) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_pd_month_rpt_info_1 on tb_rpt_pd_month_rpt_info (pd_no,curr_month);

-- 创建数据表：报表_报表数据_报表产品业绩基准区间指标
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_pd_std_region_indicator;
CREATE TABLE tb_rpt_pd_std_region_indicator (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    curr_month int NOT NULL ,
    region_type int NOT NULL ,
    region_type_name varchar(255) NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    indicator_id int NOT NULL ,
    indicator_name varchar(255) NOT NULL ,
    indicator_value decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    achi_compa_crite int NOT NULL ,
    achi_crite_value decimal(18,4) NOT NULL ,
    cmp_value decimal(18,4) NOT NULL ,
    indicator_memo varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_pd_std_region_indicator_1 on tb_rpt_pd_std_region_indicator (pd_no,curr_month,region_type);

-- 创建数据表：报表_报表数据_行业类别表
use db_rpts;
DROP TABLE IF EXISTS tb_sys_industry;
CREATE TABLE tb_sys_industry (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    industry_id int NOT NULL ,
    industry_code varchar(32) NOT NULL ,
    indu_name varchar(64) NOT NULL ,
    industry_classification int NOT NULL ,
    parent_industry_id int NOT NULL ,
    industry_std int NOT NULL ,
    first_indu_code varchar(8) NOT NULL ,
    first_industry_name varchar(64) NOT NULL ,
    second_industry_code varchar(32) NOT NULL ,
    second_industry_name varchar(64) NOT NULL ,
    third_industry_code varchar(32) NOT NULL ,
    third_industry_name varchar(64) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_sys_industry_1 on tb_sys_industry (industry_id,industry_std);
create index idx_tb_sys_industry_2 on tb_sys_industry (industry_code);

-- 创建数据表：报表_报表数据_行业证券表
use db_rpts;
DROP TABLE IF EXISTS tb_sys_industry_stock;
CREATE TABLE tb_sys_industry_stock (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    industry_std int NOT NULL ,
    industry_id int NOT NULL ,
    industry_code varchar(32) NOT NULL ,
    indu_name varchar(64) NOT NULL ,
    first_indu_code varchar(8) NOT NULL ,
    first_industry_name varchar(64) NOT NULL ,
    second_industry_code varchar(32) NOT NULL ,
    second_industry_name varchar(64) NOT NULL ,
    third_industry_code varchar(32) NOT NULL ,
    third_industry_name varchar(64) NOT NULL ,
    fourth_industry_code varchar(32) NOT NULL ,
    fourth_industry_name varchar(64) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_sys_industry_stock_1 on tb_sys_industry_stock (stock_code_no,industry_std);
create index idx_tb_sys_industry_stock_2 on tb_sys_industry_stock (stock_code,exch_no,industry_std);

-- 创建数据表：报表_报表数据_报表产品行业市值表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_pd_industry;
CREATE TABLE tb_rpt_pd_industry (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    pd_no int NOT NULL ,
    pd_name varchar(64) NOT NULL ,
    co_no int NOT NULL ,
    industry_std int NOT NULL ,
    industry_classification int NOT NULL ,
    industry_id int NOT NULL ,
    industry_code varchar(32) NOT NULL ,
    indu_name varchar(64) NOT NULL ,
    basket_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    weight_ratio decimal(18,2) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    buy_amt decimal(18,4) NOT NULL ,
    sellout_amt decimal(18,4) NOT NULL ,
    divi_amt decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_pd_industry_1 on tb_rpt_pd_industry (pd_no,industry_id,industry_std);
create index idx_tb_rpt_pd_industry_2 on tb_rpt_pd_industry (co_no,industry_id,industry_std);

-- 创建数据表：报表_报表数据_报表汇总机构证券买卖成交
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_sum_co_stock_buy_sale_strike;
CREATE TABLE tb_rpt_sum_co_stock_buy_sale_strike (
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
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
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
    sellout_amt decimal(18,4) NOT NULL ,
    sell_strike_price decimal(16,9) NOT NULL ,
    diff_qty decimal(18,2) NOT NULL ,
    buy_begin_time int NOT NULL ,
    buy_end_time int NOT NULL ,
    sell_begin_time int NOT NULL ,
    sell_end_time int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：历史_报表_报表数据_报表汇总机构证券买卖成交
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_sum_co_stock_buy_sale_strike_his;
CREATE TABLE tb_rpt_sum_co_stock_buy_sale_strike_his (
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
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
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
    sellout_amt decimal(18,4) NOT NULL ,
    sell_strike_price decimal(16,9) NOT NULL ,
    diff_qty decimal(18,2) NOT NULL ,
    buy_begin_time int NOT NULL ,
    buy_end_time int NOT NULL ,
    sell_begin_time int NOT NULL ,
    sell_end_time int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_报表数据_报表汇总产品证券买卖成交
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_sum_pd_stock_buy_sale_strike;
CREATE TABLE tb_rpt_sum_pd_stock_buy_sale_strike (
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
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
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
    sellout_amt decimal(18,4) NOT NULL ,
    sell_strike_price decimal(16,9) NOT NULL ,
    diff_qty decimal(18,2) NOT NULL ,
    buy_begin_time int NOT NULL ,
    buy_end_time int NOT NULL ,
    sell_begin_time int NOT NULL ,
    sell_end_time int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：历史_报表_报表数据_报表汇总产品证券买卖成交
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_sum_pd_stock_buy_sale_strike_his;
CREATE TABLE tb_rpt_sum_pd_stock_buy_sale_strike_his (
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
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
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
    sellout_amt decimal(18,4) NOT NULL ,
    sell_strike_price decimal(16,9) NOT NULL ,
    diff_qty decimal(18,2) NOT NULL ,
    buy_begin_time int NOT NULL ,
    buy_end_time int NOT NULL ,
    sell_begin_time int NOT NULL ,
    sell_end_time int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_报表数据_报表产品证券成交历史
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_pd_stock_strike_his;
CREATE TABLE tb_rpt_pd_stock_strike_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    pd_no int NOT NULL ,
    co_no int NOT NULL ,
    order_no int NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    exch_no int NOT NULL ,
    invest_type int NOT NULL ,
    stock_type int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
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
    bond_accr_intrst decimal(18,12) NOT NULL ,
    net_price_flag int NOT NULL ,
    src_data_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：历史_报表_报表数据_报表产品证券成交历史
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_pd_stock_strike_his_his;
CREATE TABLE tb_rpt_pd_stock_strike_his_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    pd_no int NOT NULL ,
    co_no int NOT NULL ,
    order_no int NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    exch_no int NOT NULL ,
    invest_type int NOT NULL ,
    stock_type int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
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
    bond_accr_intrst decimal(18,12) NOT NULL ,
    net_price_flag int NOT NULL ,
    src_data_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_报表数据_报表汇总产品证券成交
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_sum_pd_stock_strike;
CREATE TABLE tb_rpt_sum_pd_stock_strike (
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
    asset_acco varchar(16) NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    exch_no int NOT NULL ,
    invest_type int NOT NULL ,
    stock_type int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    strike_aver_price decimal(16,9) NOT NULL ,
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
    bond_accr_intrst decimal(18,12) NOT NULL ,
    net_price_flag int NOT NULL ,
    bank_ib_member varchar(255) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    quot_strike_qty decimal(18,2) NOT NULL ,
    quot_strike_amt decimal(18,4) NOT NULL ,
    sum_grp_cnt int NOT NULL ,
    sum_grp_str varchar(255) NOT NULL ,
    busi_flag int NOT NULL ,
    valid_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    src_data_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_sum_pd_stock_strike_1 on tb_rpt_sum_pd_stock_strike (init_date,co_no,pd_no,stock_code_no,asset_acco);

-- 创建数据表：历史_报表_报表数据_报表汇总产品证券成交
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_sum_pd_stock_strike_his;
CREATE TABLE tb_rpt_sum_pd_stock_strike_his (
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
    asset_acco varchar(16) NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    exch_no int NOT NULL ,
    invest_type int NOT NULL ,
    stock_type int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    strike_aver_price decimal(16,9) NOT NULL ,
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
    bond_accr_intrst decimal(18,12) NOT NULL ,
    net_price_flag int NOT NULL ,
    bank_ib_member varchar(255) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    quot_strike_qty decimal(18,2) NOT NULL ,
    quot_strike_amt decimal(18,4) NOT NULL ,
    sum_grp_cnt int NOT NULL ,
    sum_grp_str varchar(255) NOT NULL ,
    busi_flag int NOT NULL ,
    valid_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    src_data_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_sum_pd_stock_strike_his_1 on tb_rpt_sum_pd_stock_strike_his (init_date,co_no,pd_no,stock_code_no,asset_acco);

-- 创建数据表：报表_报表数据_报表月汇总产品持仓成交
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_monthsum_pd_posi_strike;
CREATE TABLE tb_rpt_monthsum_pd_posi_strike (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    curr_month int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_code varchar(32) NOT NULL ,
    pd_name varchar(64) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    stat_days int NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    end_nav_asset decimal(18,4) NOT NULL ,
    avg_nav_asset decimal(18,4) NOT NULL ,
    avg_total_asset decimal(18,4) NOT NULL ,
    avg_stock_asset decimal(18,4) NOT NULL ,
    avg_futu_asset decimal(18,4) NOT NULL ,
    avg_option_asset decimal(18,4) NOT NULL ,
    avg_warrant_asset decimal(18,4) NOT NULL ,
    avg_fund_asset decimal(18,4) NOT NULL ,
    avg_cash_asset decimal(18,4) NOT NULL ,
    avg_repo_asset decimal(18,4) NOT NULL ,
    avg_bond_asset decimal(18,4) NOT NULL ,
    avg_money_fund_asset decimal(18,4) NOT NULL ,
    pd_begin_unit_nav decimal(18,4) NOT NULL ,
    end_unit_nav decimal(18,4) NOT NULL ,
    avg_pd_all_share decimal(18,4) NOT NULL ,
    buy_amt decimal(18,4) NOT NULL ,
    sellout_amt decimal(18,4) NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    month_apply_amt decimal(18,4) NOT NULL ,
    trade_deduct_amt decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    sum_grp_cnt int NOT NULL ,
    sum_grp_str varchar(255) NOT NULL ,
    src_data_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_monthsum_pd_posi_strike_1 on tb_rpt_monthsum_pd_posi_strike (curr_month,pd_no,crncy_type);
create index idx_tb_rpt_monthsum_pd_posi_strike_2 on tb_rpt_monthsum_pd_posi_strike (curr_month,co_no,pd_code);

-- 创建数据表：历史_报表_报表数据_报表月汇总产品持仓成交
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_monthsum_pd_posi_strike_his;
CREATE TABLE tb_rpt_monthsum_pd_posi_strike_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    curr_month int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_code varchar(32) NOT NULL ,
    pd_name varchar(64) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    stat_days int NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    end_nav_asset decimal(18,4) NOT NULL ,
    avg_nav_asset decimal(18,4) NOT NULL ,
    avg_total_asset decimal(18,4) NOT NULL ,
    avg_stock_asset decimal(18,4) NOT NULL ,
    avg_futu_asset decimal(18,4) NOT NULL ,
    avg_option_asset decimal(18,4) NOT NULL ,
    avg_warrant_asset decimal(18,4) NOT NULL ,
    avg_fund_asset decimal(18,4) NOT NULL ,
    avg_cash_asset decimal(18,4) NOT NULL ,
    avg_repo_asset decimal(18,4) NOT NULL ,
    avg_bond_asset decimal(18,4) NOT NULL ,
    avg_money_fund_asset decimal(18,4) NOT NULL ,
    pd_begin_unit_nav decimal(18,4) NOT NULL ,
    end_unit_nav decimal(18,4) NOT NULL ,
    avg_pd_all_share decimal(18,4) NOT NULL ,
    buy_amt decimal(18,4) NOT NULL ,
    sellout_amt decimal(18,4) NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    month_apply_amt decimal(18,4) NOT NULL ,
    trade_deduct_amt decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    sum_grp_cnt int NOT NULL ,
    sum_grp_str varchar(255) NOT NULL ,
    src_data_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_monthsum_pd_posi_strike_his_1 on tb_rpt_monthsum_pd_posi_strike_his (curr_month,pd_no,crncy_type);
create index idx_tb_rpt_monthsum_pd_posi_strike_his_2 on tb_rpt_monthsum_pd_posi_strike_his (curr_month,co_no,pd_code);

-- 创建数据表：报表_报表数据_报表产品年夏普比率
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_pd_year_sharperatio;
CREATE TABLE tb_rpt_pd_year_sharperatio (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    curr_year int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    share_net decimal(18,4) NOT NULL ,
    share_net_total decimal(18,4) NOT NULL ,
    sharpe_ration decimal(18,12) NOT NULL ,
    max_retracement decimal(18,12) NOT NULL ,
    annual_yield decimal(18,12) NOT NULL ,
    net_growth_rate_stdev decimal(18,12) NOT NULL ,
    achi_compa_pandl_ratio decimal(18,12) NOT NULL ,
    risk_free_interest_rate decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_pd_year_sharperatio_1 on tb_rpt_pd_year_sharperatio (curr_year,co_no,pd_no);

-- 创建数据表：报表_报表数据_报表结算提前待入账记录表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_clsest_before_preentry;
CREATE TABLE tb_rpt_clsest_before_preentry (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_name varchar(64) NOT NULL ,
    exch_group_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    asset_acco_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
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
    entry_status varchar(2) NOT NULL ,
    reg_date int NOT NULL ,
    arrive_date int NOT NULL ,
    begin_trade_date int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    src_data_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rpt_clsest_before_preentry_1 on tb_rpt_clsest_before_preentry (arrive_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_rpt_clsest_before_preentry_2 on tb_rpt_clsest_before_preentry (arrive_date,co_no,exch_no,stock_acco_no,stock_code_no);
create index idx_tb_rpt_clsest_before_preentry_3 on tb_rpt_clsest_before_preentry (co_no,init_date);

-- 创建数据表：报表_报表数据_产品业绩报告附加信息
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_pd_month_rpt_add_info;
CREATE TABLE tb_rpt_pd_month_rpt_add_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    rpt_add_info varchar(10000) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_pd_month_rpt_add_info_1 on tb_rpt_pd_month_rpt_add_info (co_no,pd_no);

-- 创建数据表：历史_报表_报表数据_产品业绩报告附加信息
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_pd_month_rpt_add_info_his;
CREATE TABLE tb_rpt_pd_month_rpt_add_info_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    rpt_add_info varchar(10000) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_pd_month_rpt_add_info_his_1 on tb_rpt_pd_month_rpt_add_info_his (co_no,pd_no);

-- 创建数据表：报表_报表数据_业绩报告配置
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_month_rpt_config;
CREATE TABLE tb_rpt_month_rpt_config (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    config_no bigint NOT NULL ,
    config_name varchar(64) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_month_rpt_config_1 on tb_rpt_month_rpt_config (config_no);

-- 创建数据表：报表_报表数据_机构业绩报告配置
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_co_month_rpt_config;
CREATE TABLE tb_rpt_co_month_rpt_config (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    config_no bigint NOT NULL ,
    config_name varchar(64) NOT NULL ,
    show_order int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_co_month_rpt_config_1 on tb_rpt_co_month_rpt_config (co_no,pd_no,config_no);

-- 创建数据表：报表_报表数据_报表产品回报查询区间主表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_qry_region;
CREATE TABLE tb_rpt_qry_region (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    qry_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_code varchar(32) NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_qry_region_1 on tb_rpt_qry_region (qry_no);

-- 创建数据表：报表_报表数据_报表产品回报查询区间从表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_qry_region_detail;
CREATE TABLE tb_rpt_qry_region_detail (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    qry_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_code varchar(32) NOT NULL ,
    region_no int NOT NULL ,
    region_name varchar(64) NOT NULL ,
    qry_begin_date int NOT NULL ,
    qry_end_date int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_qry_region_detail_1 on tb_rpt_qry_region_detail (qry_no,region_no);

-- 创建数据表：报表_报表数据_报表单产品收益率表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_qry_singleproduct_profit;
CREATE TABLE tb_rpt_qry_singleproduct_profit (
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
    found_date int NOT NULL ,
    runtime int NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    daily_pandl_ratio decimal(18,12) NOT NULL ,
    daily_pandl_ratio_year decimal(18,12) NOT NULL ,
    total_unit_nav decimal(18,4) NOT NULL ,
    total_realiz_pandl_ratio decimal(18,12) NOT NULL ,
    total_realize_pandl_ratio_year decimal(18,12) NOT NULL ,
    excess_earning_year decimal(18,12) NOT NULL ,
    day_retracement decimal(18,12) NOT NULL ,
    day_continue_retracement decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_qry_singleproduct_profit_1 on tb_rpt_qry_singleproduct_profit (init_date,co_no,pd_code);
create index idx_tb_rpt_qry_singleproduct_profit_2 on tb_rpt_qry_singleproduct_profit (init_date,pd_no);

-- 创建数据表：报表_报表数据_报表单产品收益率历史表
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_qry_singleproduct_profit_his;
CREATE TABLE tb_rpt_qry_singleproduct_profit_his (
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
    found_date int NOT NULL ,
    runtime int NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    daily_pandl_ratio decimal(18,12) NOT NULL ,
    daily_pandl_ratio_year decimal(18,12) NOT NULL ,
    total_unit_nav decimal(18,4) NOT NULL ,
    total_realiz_pandl_ratio decimal(18,12) NOT NULL ,
    total_realize_pandl_ratio_year decimal(18,12) NOT NULL ,
    excess_earning_year decimal(18,12) NOT NULL ,
    day_retracement decimal(18,12) NOT NULL ,
    day_continue_retracement decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rpt_qry_singleproduct_profit_his_1 on tb_rpt_qry_singleproduct_profit_his (init_date,co_no,pd_code);
create index idx_tb_rpt_qry_singleproduct_profit_his_2 on tb_rpt_qry_singleproduct_profit_his (init_date,pd_no);

-- 创建数据表：报表_报表数据_报表收益率分析表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_qry_profitanalysis;
CREATE TABLE tb_rpt_qry_profitanalysis (
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
    unit_nav decimal(18,4) NOT NULL ,
    daily_pandl_ratio decimal(18,12) NOT NULL ,
    total_realize_pandl_ratio_year decimal(18,12) NOT NULL ,
    sharpe_ration decimal(18,12) NOT NULL ,
    max_retracement decimal(18,12) NOT NULL ,
    market_value_sh decimal(18,4) NOT NULL ,
    market_value_avg_sh decimal(18,4) NOT NULL ,
    sh_remainday_two int NOT NULL ,
    sh_remainday_three int NOT NULL ,
    sh_remainday_five int NOT NULL ,
    market_value_sz decimal(18,4) NOT NULL ,
    market_value_avg_sz decimal(18,4) NOT NULL ,
    sz_remainday_two int NOT NULL ,
    sz_remainday_three int NOT NULL ,
    sz_remainday_five int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_qry_profitanalysis_1 on tb_rpt_qry_profitanalysis (init_date,pd_no);
create index idx_tb_rpt_qry_profitanalysis_2 on tb_rpt_qry_profitanalysis (init_date,co_no,pd_code);

-- 创建数据表：报表_报表数据_报表收益率分析历史表
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_qry_profitanalysis_his;
CREATE TABLE tb_rpt_qry_profitanalysis_his (
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
    unit_nav decimal(18,4) NOT NULL ,
    daily_pandl_ratio decimal(18,12) NOT NULL ,
    total_realize_pandl_ratio_year decimal(18,12) NOT NULL ,
    sharpe_ration decimal(18,12) NOT NULL ,
    max_retracement decimal(18,12) NOT NULL ,
    market_value_sh decimal(18,4) NOT NULL ,
    market_value_avg_sh decimal(18,4) NOT NULL ,
    sh_remainday_two int NOT NULL ,
    sh_remainday_three int NOT NULL ,
    sh_remainday_five int NOT NULL ,
    market_value_sz decimal(18,4) NOT NULL ,
    market_value_avg_sz decimal(18,4) NOT NULL ,
    sz_remainday_two int NOT NULL ,
    sz_remainday_three int NOT NULL ,
    sz_remainday_five int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rpt_qry_profitanalysis_his_1 on tb_rpt_qry_profitanalysis_his (init_date,co_no,pd_code);
create index idx_tb_rpt_qry_profitanalysis_his_2 on tb_rpt_qry_profitanalysis_his (init_date,pd_no);

-- 创建数据表：报表_报表数据_报表跟投分析历史表
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_qry_followanalysis_his;
CREATE TABLE tb_rpt_qry_followanalysis_his (
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
    net_performance decimal(18,4) NOT NULL ,
    total_unit_nav decimal(18,4) NOT NULL ,
    market_value_posi_ratio decimal(18,12) NOT NULL ,
    pd_manager varchar(32) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    profit_year decimal(18,4) NOT NULL ,
    profit_year_ratio decimal(18,12) NOT NULL ,
    follow_share decimal(18,2) NOT NULL ,
    follow_nav_asset decimal(18,4) NOT NULL ,
    follow_income_year decimal(18,4) NOT NULL ,
    follow_income_total decimal(18,4) NOT NULL ,
    follow_profit_ratio decimal(18,12) NOT NULL ,
    warn_value decimal(18,4) NOT NULL ,
    stop_value decimal(18,4) NOT NULL ,
    curr_share decimal(18,2) NOT NULL ,
    max_retracement decimal(18,12) NOT NULL ,
    found_date int NOT NULL ,
    last_year_nav decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rpt_qry_followanalysis_his_1 on tb_rpt_qry_followanalysis_his (init_date,co_no,pd_code);
create index idx_tb_rpt_qry_followanalysis_his_2 on tb_rpt_qry_followanalysis_his (init_date,pd_no);

-- 创建数据表：报表_报表数据_临时表交易组持仓区间盈亏
use db_rpts;
DROP TABLE IF EXISTS tmp_exgp_posi_value_inter_pl;
CREATE TABLE tmp_exgp_posi_value_inter_pl (
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

-- 创建数据表：报表_报表数据_基础数据市场信息表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_exch_info;
CREATE TABLE tb_rpt_exch_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    exch_name varchar(64) NOT NULL ,
    exch_code varchar(6) NOT NULL ,
    exch_type int NOT NULL ,
    distric varchar(32) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_status int NOT NULL ,
    init_date int NOT NULL ,
    last_init_date int NOT NULL ,
    next_init_date int NOT NULL ,
    time_lag int NOT NULL ,
    no_exch_date_str varchar(2048) NOT NULL ,
    allow_next_init_time int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rpt_exch_info_1 on tb_rpt_exch_info (exch_no);

-- 创建数据表：报表_报表数据_基础数据证券代码信息表
use db_rpts;
DROP TABLE IF EXISTS tb_basesedt_stock_code_info;
CREATE TABLE tb_basesedt_stock_code_info (
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
    report_unit int NOT NULL ,
    min_unit int NOT NULL ,
    max_qty decimal(18,2) NOT NULL ,
    min_qty decimal(18,2) NOT NULL ,
    stop_status varchar(2) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    capit_reback_days int NOT NULL ,
    posi_reback_days int NOT NULL ,
    fee_set varchar(2048) NOT NULL ,
    is_order_dir_flag int NOT NULL ,
    total_stock_issue decimal(18,2) NOT NULL ,
    circl_stock_capit decimal(18,2) NOT NULL ,
    fair_price decimal(16,9) NOT NULL ,
    begin_trade_date int NOT NULL ,
    apply_date int NOT NULL ,
    apply_limit decimal(18,2) NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_stock_code_info_1 on tb_basesedt_stock_code_info (exch_no,stock_code);
create index idx_tb_basesedt_stock_code_info_2 on tb_basesedt_stock_code_info (stock_code_no);
create index idx_tb_basesedt_stock_code_info_3 on tb_basesedt_stock_code_info (time_stamp);

-- 创建数据表：报表_报表数据_证券行情表
use db_rpts;
DROP TABLE IF EXISTS tb_basesedt_stock_quot;
CREATE TABLE tb_basesedt_stock_quot (
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
    up_limit_price decimal(16,9) NOT NULL ,
    down_limit_price decimal(16,9) NOT NULL ,
    pe_ratio decimal(18,12) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    today_open_price decimal(16,9) NOT NULL ,
    today_close_price decimal(16,9) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    today_max_price decimal(16,9) NOT NULL ,
    today_min_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    fair_price decimal(16,9) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    net_price_flag int NOT NULL ,
    asset_type int NOT NULL ,
    stock_type int NOT NULL ,
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
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_stock_quot_1 on tb_basesedt_stock_quot (stock_code_no);
create index idx_tb_basesedt_stock_quot_2 on tb_basesedt_stock_quot (exch_no,stock_code);

-- 创建数据表：报表_报表数据_证券行情表历史
use db_rpts_his;
DROP TABLE IF EXISTS tb_basesedt_stock_quot_his;
CREATE TABLE tb_basesedt_stock_quot_his (
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
    up_limit_price decimal(16,9) NOT NULL ,
    down_limit_price decimal(16,9) NOT NULL ,
    pe_ratio decimal(18,12) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    today_open_price decimal(16,9) NOT NULL ,
    today_close_price decimal(16,9) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    today_max_price decimal(16,9) NOT NULL ,
    today_min_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    fair_price decimal(16,9) NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    net_price_flag int NOT NULL ,
    asset_type int NOT NULL ,
    stock_type int NOT NULL ,
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
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_stock_quot_his_1 on tb_basesedt_stock_quot_his (init_date,stock_code_no);
create index idx_tb_basesedt_stock_quot_his_2 on tb_basesedt_stock_quot_his (init_date,exch_no,stock_code);

-- 创建数据表：报表_报表数据_基础定义资产分类表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_def_asset_class;
CREATE TABLE tb_rpt_def_asset_class (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    def_asset_type int NOT NULL ,
    def_asset_type_no varchar(64) NOT NULL ,
    def_asset_name varchar(255) NOT NULL ,
    def_asset_field int NOT NULL ,
    def_asset_field_name varchar(255) NOT NULL ,
    sql_grp_no bigint NOT NULL ,
    sql_grp_name varchar(64) NOT NULL ,
    calc_order int NOT NULL ,
    calc_type int NOT NULL ,
    calc_times varchar(64) NOT NULL ,
    calc_memo varchar(255) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    parent_def_asset_type int NOT NULL ,
    def_type int NOT NULL ,
    is_visible int NOT NULL ,
    show_order int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_def_asset_class_1 on tb_rpt_def_asset_class (def_asset_type,def_asset_field);

-- 创建数据表：报表_报表数据_机构资产分类表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_co_def_asset_class;
CREATE TABLE tb_rpt_co_def_asset_class (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    def_type int NOT NULL ,
    def_asset_type int NOT NULL ,
    def_asset_type_no varchar(64) NOT NULL ,
    def_asset_name varchar(255) NOT NULL ,
    def_asset_field int NOT NULL ,
    parent_def_asset_type int NOT NULL ,
    show_order int NOT NULL ,
    calc_type int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_co_def_asset_class_1 on tb_rpt_co_def_asset_class (co_no,def_asset_type,def_asset_field);
create index idx_tb_rpt_co_def_asset_class_2 on tb_rpt_co_def_asset_class (co_no,def_type);

-- 创建数据表：报表_报表数据_基础系统信息表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_sys_info;
CREATE TABLE tb_rpt_sys_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    sys_name varchar(64) NOT NULL ,
    sys_status varchar(2) NOT NULL ,
    init_date int NOT NULL ,
    last_init_date int NOT NULL ,
    next_init_date int NOT NULL ,
    no_exch_date_str varchar(2048) NOT NULL ,
    allow_next_init_time int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_报表数据_基础定义语句仓库表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_def_sqls_repo;
CREATE TABLE tb_rpt_def_sqls_repo (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    sql_no int NOT NULL ,
    sql_name varchar(64) NOT NULL ,
    sql_str varchar(10000) NOT NULL ,
    sql_type int NOT NULL ,
    in_params varchar(2048) NOT NULL ,
    in_params_value varchar(2048) NOT NULL ,
    valid_flag int NOT NULL ,
    sql_dependencies varchar(255) NOT NULL ,
    sql_level int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_def_sqls_repo_1 on tb_rpt_def_sqls_repo (sql_no);

-- 创建数据表：报表_报表数据_基础定义执行语句表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_def_exe_sqls;
CREATE TABLE tb_rpt_def_exe_sqls (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exe_sql_no int NOT NULL ,
    exe_sql_name varchar(64) NOT NULL ,
    exe_sql_type int NOT NULL ,
    exe_sql_str varchar(10000) NOT NULL ,
    manual_modi_flag int NOT NULL ,
    in_params_value varchar(2048) NOT NULL ,
    update_table_name varchar(64) NOT NULL ,
    update_fields varchar(255) NOT NULL ,
    rl_fields varchar(255) NOT NULL ,
    join_fields varchar(255) NOT NULL ,
    sql_no int NOT NULL ,
    sql_name varchar(64) NOT NULL ,
    valid_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_def_exe_sqls_1 on tb_rpt_def_exe_sqls (exe_sql_no);

-- 创建数据表：报表_报表数据_基础执行语句执行组
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_init_exe_sql_grps;
CREATE TABLE tb_rpt_init_exe_sql_grps (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    sql_grp_no bigint NOT NULL ,
    sql_grp_name varchar(64) NOT NULL ,
    valid_flag int NOT NULL ,
    exe_seq int NOT NULL ,
    in_params_value varchar(2048) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_init_exe_sql_grps_1 on tb_rpt_init_exe_sql_grps (sql_grp_no);

-- 创建数据表：报表_报表数据_基础执行语句执行组执行语句
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_init_exe_sql_grps_sql;
CREATE TABLE tb_rpt_init_exe_sql_grps_sql (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    sql_grp_no bigint NOT NULL ,
    sql_grp_name varchar(64) NOT NULL ,
    exe_seq int NOT NULL ,
    exe_sql_no int NOT NULL ,
    exe_sql_name varchar(64) NOT NULL ,
    in_params_value varchar(2048) NOT NULL ,
    sql_memo varchar(2048) NOT NULL ,
    valid_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_init_exe_sql_grps_sql_1 on tb_rpt_init_exe_sql_grps_sql (sql_grp_no,exe_seq);

-- 创建数据表：报表_报表数据_基础执行执行语句流水
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_init_exe_sql_grps_jour;
CREATE TABLE tb_rpt_init_exe_sql_grps_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    sql_grp_no bigint NOT NULL ,
    sql_grp_name varchar(64) NOT NULL ,
    exe_seq int NOT NULL ,
    exe_sql_no int NOT NULL ,
    exe_sql_name varchar(64) NOT NULL ,
    sql_exe_time decimal(18,4) NOT NULL ,
    sql_content varchar(10000) NOT NULL ,
    exe_sql_result int NOT NULL ,
    error_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rpt_init_exe_sql_grps_jour_1 on tb_rpt_init_exe_sql_grps_jour (sql_grp_no,exe_sql_no);

-- 创建数据表：报表_报表数据_视图执行SQL
use db_rpts;
DROP TABLE IF EXISTS v_init_exe_sql;
CREATE TABLE v_init_exe_sql (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    sql_grp_no bigint NOT NULL ,
    sql_grp_name varchar(64) NOT NULL ,
    exe_seq int NOT NULL ,
    exe_sql_no int NOT NULL ,
    exe_sql_name varchar(64) NOT NULL ,
    exe_sql_str varchar(10000) NOT NULL ,
    in_params_value varchar(2048) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_v_init_exe_sql_1 on v_init_exe_sql (sql_grp_no,exe_sql_no);

-- 创建数据表：报表_报表数据_视图机构自定义资产执行SQL
use db_rpts;
DROP TABLE IF EXISTS v_co_def_asset_exe_sql;
CREATE TABLE v_co_def_asset_exe_sql (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    sql_grp_no bigint NOT NULL ,
    sql_grp_name varchar(64) NOT NULL ,
    exe_seq int NOT NULL ,
    exe_sql_no int NOT NULL ,
    exe_sql_name varchar(64) NOT NULL ,
    exe_sql_str varchar(10000) NOT NULL ,
    in_params_value varchar(2048) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_v_co_def_asset_exe_sql_1 on v_co_def_asset_exe_sql (sql_grp_no,exe_sql_no);
create index idx_v_co_def_asset_exe_sql_2 on v_co_def_asset_exe_sql (co_no,sql_grp_no,exe_sql_no);

-- 创建数据表：报表_报表数据_视图产品全资产
use db_rpts;
DROP TABLE IF EXISTS v_dt_pd_asset_all;
CREATE TABLE v_dt_pd_asset_all (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_code varchar(32) NOT NULL ,
    pd_name varchar(64) NOT NULL ,
    runtime int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    total_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    option_asset decimal(18,4) NOT NULL ,
    warrant_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    acco_cash decimal(18,4) NOT NULL ,
    total_cash_divide decimal(18,4) NOT NULL ,
    money_fund_asset decimal(18,4) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    pre_pd_unit_nav decimal(18,4) NOT NULL ,
    total_unit_nav decimal(18,4) NOT NULL ,
    last_year_pd_nav decimal(16,9) NOT NULL ,
    pd_all_share decimal(18,2) NOT NULL ,
    curr_share decimal(18,2) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    product_unit_nav_ration decimal(18,12) NOT NULL ,
    buy_amt decimal(18,4) NOT NULL ,
    sellout_amt decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_v_dt_pd_asset_all_1 on v_dt_pd_asset_all (init_date,pd_no,crncy_type);
create index idx_v_dt_pd_asset_all_2 on v_dt_pd_asset_all (init_date,co_no,pd_code);

-- 创建数据表：报表_报表数据_视图产品全持仓
use db_rpts;
DROP TABLE IF EXISTS v_dt_pd_holder_all;
CREATE TABLE v_dt_pd_holder_all (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_code varchar(32) NOT NULL ,
    pd_name varchar(64) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    invest_type int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    asset_kind int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    stock_asset_value decimal(18,4) NOT NULL ,
    value_dirty_price decimal(16,9) NOT NULL ,
    value_net_price decimal(16,9) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_v_dt_pd_holder_all_1 on v_dt_pd_holder_all (init_date,pd_no,exch_no,stock_code);
create index idx_v_dt_pd_holder_all_2 on v_dt_pd_holder_all (init_date,co_no,pd_code,exch_no,stock_code);
create index idx_v_dt_pd_holder_all_3 on v_dt_pd_holder_all (co_no,init_date,pd_no,exch_no,stock_code);

-- 创建数据表：报表_报表数据_视图数据交易组持仓历史
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
    posi_market_value decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_vi_dt_exgp_posi_value_his_1 on vi_dt_exgp_posi_value_his (init_date,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_vi_dt_exgp_posi_value_his_2 on vi_dt_exgp_posi_value_his (init_date,co_no,pd_no,exch_no);

-- 创建数据表：报表_报表数据_交易日期表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_trade_date;
CREATE TABLE tb_rpt_trade_date (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    trade_date int NOT NULL ,
    is_open varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：报表_报表数据_统计产品月盈亏
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_stat_month_pd_posi;
CREATE TABLE tb_rpt_stat_month_pd_posi (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    qry_begin_date int NOT NULL ,
    qry_end_date int NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    pd_no int NOT NULL ,
    co_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    begin_close_price decimal(18,4) NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    begin_cost_amt decimal(18,4) NOT NULL ,
    begin_posi_market_value decimal(18,4) NOT NULL ,
    begin_realize_pandl decimal(18,4) NOT NULL ,
    end_close_price decimal(18,4) NOT NULL ,
    end_cur_qty int NOT NULL ,
    end_cost_amt decimal(18,4) NOT NULL ,
    end_posi_market_value decimal(18,4) NOT NULL ,
    end_realize_pandl decimal(18,4) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    interval_realize_pandl decimal(18,4) NOT NULL ,
    interval_pandl decimal(18,4) NOT NULL ,
    max_posi_market_value decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_stat_month_pd_posi_1 on tb_rpt_stat_month_pd_posi (co_no,pd_no,qry_begin_date,qry_end_date,stock_code_no);

-- 创建数据表：报表_报表数据_统计交易组区间持仓盈亏
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_stat_exgp_posi_value_inter_pl;
CREATE TABLE tb_rpt_stat_exgp_posi_value_inter_pl (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    qry_begin_date int NOT NULL ,
    qry_end_date int NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    pd_no int NOT NULL ,
    co_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    begin_close_price decimal(18,4) NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    begin_cost_amt decimal(18,4) NOT NULL ,
    begin_posi_market_value decimal(18,4) NOT NULL ,
    begin_realize_pandl decimal(18,4) NOT NULL ,
    end_close_price decimal(18,4) NOT NULL ,
    end_cur_qty int NOT NULL ,
    end_cost_amt decimal(18,4) NOT NULL ,
    end_posi_market_value decimal(18,4) NOT NULL ,
    end_realize_pandl decimal(18,4) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    interval_realize_pandl decimal(18,4) NOT NULL ,
    interval_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_stat_exgp_posi_value_inter_pl_1 on tb_rpt_stat_exgp_posi_value_inter_pl (co_no,pd_no,exch_group_no,qry_begin_date,qry_end_date,stock_code_no);

-- 创建数据表：报表_报表数据_基金经理与交易员关系表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_pd_mananger_trader_conn;
CREATE TABLE tb_rpt_pd_mananger_trader_conn (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    fund_manager_no int NOT NULL ,
    fund_manager_name varchar(32) NOT NULL ,
    trader_no int NOT NULL ,
    trader_name varchar(32) NOT NULL ,
    show_order int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rpt_pd_mananger_trader_conn_1 on tb_rpt_pd_mananger_trader_conn (co_no,pd_no,comm_opor,comm_executor);

-- 创建数据表：报表_报表数据_统计产品行业区间盈亏
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_stat_month_pd_industry_inter_pl;
CREATE TABLE tb_rpt_stat_month_pd_industry_inter_pl (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    qry_begin_date int NOT NULL ,
    qry_end_date int NOT NULL ,
    begin_date int NOT NULL ,
    end_date int NOT NULL ,
    pd_no int NOT NULL ,
    co_no int NOT NULL ,
    industry_std int NOT NULL ,
    industry_classification int NOT NULL ,
    industry_id int NOT NULL ,
    industry_code varchar(32) NOT NULL ,
    indu_name varchar(64) NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    begin_cost_amt decimal(18,4) NOT NULL ,
    begin_posi_market_value decimal(18,4) NOT NULL ,
    begin_realize_pandl decimal(18,4) NOT NULL ,
    end_cur_qty int NOT NULL ,
    end_cost_amt decimal(18,4) NOT NULL ,
    end_posi_market_value decimal(18,4) NOT NULL ,
    end_realize_pandl decimal(18,4) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    interval_realize_pandl decimal(18,4) NOT NULL ,
    interval_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_stat_month_pd_industry_inter_pl_1 on tb_rpt_stat_month_pd_industry_inter_pl (co_no,pd_no,industry_std,industry_id,qry_begin_date,qry_end_date);
create index idx_tb_rpt_stat_month_pd_industry_inter_pl_2 on tb_rpt_stat_month_pd_industry_inter_pl (co_no,pd_no,qry_begin_date,qry_end_date);

-- 创建数据表：报表_报表数据_指数行情表历史
use db_rpts_his;
DROP TABLE IF EXISTS tb_basesedt_index_quot_his;
CREATE TABLE tb_basesedt_index_quot_his (
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
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_index_quot_his_1 on tb_basesedt_index_quot_his (stock_code_no);
create index idx_tb_basesedt_index_quot_his_2 on tb_basesedt_index_quot_his (exch_no,stock_code);
create index idx_tb_basesedt_index_quot_his_3 on tb_basesedt_index_quot_his (time_stamp);

-- 创建数据表：报表_报表数据_基金经理信息表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_fund_mananger;
CREATE TABLE tb_rpt_fund_mananger (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    fund_manager_no int NOT NULL ,
    fund_manager_name varchar(32) NOT NULL ,
    opor_no int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_fund_mananger_1 on tb_rpt_fund_mananger (co_no,fund_manager_no);

-- 创建数据表：报表_报表数据_交易员信息表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_trader;
CREATE TABLE tb_rpt_trader (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    trader_no int NOT NULL ,
    trader_code varchar(32) NOT NULL ,
    trader_name varchar(32) NOT NULL ,
    opor_no int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_trader_1 on tb_rpt_trader (co_no,trader_no);

-- 创建数据表：报表_报表数据_统计基金经理资产
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_stat_fund_mananger_asset;
CREATE TABLE tb_rpt_stat_fund_mananger_asset (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    fund_manager_no int NOT NULL ,
    fund_manager_name varchar(32) NOT NULL ,
    total_count int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    total_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    option_asset decimal(18,4) NOT NULL ,
    warrant_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    acco_cash decimal(18,4) NOT NULL ,
    total_cash_divide decimal(18,4) NOT NULL ,
    money_fund_asset decimal(18,4) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    pd_all_share decimal(18,2) NOT NULL ,
    curr_share decimal(18,2) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    buy_amt decimal(18,4) NOT NULL ,
    sellout_amt decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_stat_fund_mananger_asset_1 on tb_rpt_stat_fund_mananger_asset (co_no,fund_manager_no);

-- 创建数据表：历史_报表_报表数据_统计基金经理资产
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_stat_fund_mananger_asset_his;
CREATE TABLE tb_rpt_stat_fund_mananger_asset_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    fund_manager_no int NOT NULL ,
    fund_manager_name varchar(32) NOT NULL ,
    total_count int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    total_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    option_asset decimal(18,4) NOT NULL ,
    warrant_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    acco_cash decimal(18,4) NOT NULL ,
    total_cash_divide decimal(18,4) NOT NULL ,
    money_fund_asset decimal(18,4) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    pd_all_share decimal(18,2) NOT NULL ,
    curr_share decimal(18,2) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    buy_amt decimal(18,4) NOT NULL ,
    sellout_amt decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_stat_fund_mananger_asset_his_1 on tb_rpt_stat_fund_mananger_asset_his (co_no,fund_manager_no);

-- 创建数据表：报表_报表数据_统计基金经理持仓
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_stat_fund_mananger_posi;
CREATE TABLE tb_rpt_stat_fund_mananger_posi (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    fund_manager_no int NOT NULL ,
    fund_manager_name varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    total_count int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    total_stock_issue decimal(18,2) NOT NULL ,
    circl_stock_capit decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    buy_qty decimal(18,2) NOT NULL ,
    buy_amt decimal(18,4) NOT NULL ,
    sell_qty decimal(18,2) NOT NULL ,
    sellout_amt decimal(18,4) NOT NULL ,
    quot_strike_qty decimal(18,2) NOT NULL ,
    quot_strike_amt decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_stat_fund_mananger_posi_1 on tb_rpt_stat_fund_mananger_posi (co_no,fund_manager_no,stock_code_no);

-- 创建数据表：历史_报表_报表数据_统计基金经理持仓
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_stat_fund_mananger_posi_his;
CREATE TABLE tb_rpt_stat_fund_mananger_posi_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    fund_manager_no int NOT NULL ,
    fund_manager_name varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    total_count int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    total_stock_issue decimal(18,2) NOT NULL ,
    circl_stock_capit decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    posi_market_value decimal(18,4) NOT NULL ,
    buy_qty decimal(18,2) NOT NULL ,
    buy_amt decimal(18,4) NOT NULL ,
    sell_qty decimal(18,2) NOT NULL ,
    sellout_amt decimal(18,4) NOT NULL ,
    quot_strike_qty decimal(18,2) NOT NULL ,
    quot_strike_amt decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_stat_fund_mananger_posi_his_1 on tb_rpt_stat_fund_mananger_posi_his (co_no,fund_manager_no,stock_code_no);

-- 创建数据表：报表_报表数据_调用命令表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_basic_cmd;
CREATE TABLE tb_rpt_basic_cmd (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    ip_addr varchar(32) NOT NULL ,
    ip_port varchar(32) NOT NULL ,
    user_name varchar(64) NOT NULL ,
    user_password varchar(64) NOT NULL ,
    cmd_id int NOT NULL ,
    cmd_type int NOT NULL ,
    cmd_content varchar(4096) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_basic_cmd_1 on tb_rpt_basic_cmd (cmd_id);

-- 创建数据表：报表_报表数据_同步状态表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_basic_sync_info;
CREATE TABLE tb_rpt_basic_sync_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    sync_no int NOT NULL ,
    sync_name varchar(64) NOT NULL ,
    target_db_name varchar(64) NOT NULL ,
    target_table_name varchar(64) NOT NULL ,
    source_db_name varchar(64) NOT NULL ,
    source_table_name varchar(64) NOT NULL ,
    src_last_update_time varchar(32) NOT NULL ,
    src_max_updatetimes int NOT NULL ,
    src_table_rows int NOT NULL ,
    tgt_last_update_time varchar(32) NOT NULL ,
    tgt_max_updatetimes int NOT NULL ,
    tgt_table_rows int NOT NULL ,
    sync_type int NOT NULL ,
    sync_status int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    begin_date int NOT NULL ,
    begin_time int NOT NULL ,
    end_date int NOT NULL ,
    end_time int NOT NULL ,
    deal_count int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rpt_basic_sync_info_1 on tb_rpt_basic_sync_info (sync_no);
create index idx_tb_rpt_basic_sync_info_2 on tb_rpt_basic_sync_info (target_table_name,target_db_name);

-- 创建数据表：报表_报表数据_产品持仓导入外部交割流水表
use db_rpts;
DROP TABLE IF EXISTS tb_rpt_imp_pd_out_deli_jour;
CREATE TABLE tb_rpt_imp_pd_out_deli_jour (
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
    pass_deli_jour_no bigint NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_num int NOT NULL ,
    entry_end_qty decimal(18,2) NOT NULL ,
    entry_end_amt decimal(18,4) NOT NULL ,
    out_all_fee decimal(18,4) NOT NULL ,
    out_stamp_tax decimal(18,4) NOT NULL ,
    out_trans_fee decimal(18,4) NOT NULL ,
    out_brkage decimal(18,4) NOT NULL ,
    out_SEC_charges decimal(18,4) NOT NULL ,
    out_other_fee decimal(18,4) NOT NULL ,
    out_brkage_commis decimal(18,4) NOT NULL ,
    out_chann_commis decimal(18,4) NOT NULL ,
    out_divi_commis decimal(18,4) NOT NULL ,
    out_other_commis decimal(18,4) NOT NULL ,
    busi_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rpt_imp_pd_out_deli_jour_1 on tb_rpt_imp_pd_out_deli_jour (pass_no,out_acco,init_date,pass_deli_jour_no);

-- 创建数据表：历史_报表_报表数据_产品持仓导入外部交割流水表
use db_rpts_his;
DROP TABLE IF EXISTS tb_rpt_imp_pd_out_deli_jour_his;
CREATE TABLE tb_rpt_imp_pd_out_deli_jour_his (
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
    pass_deli_jour_no bigint NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_num int NOT NULL ,
    entry_end_qty decimal(18,2) NOT NULL ,
    entry_end_amt decimal(18,4) NOT NULL ,
    out_all_fee decimal(18,4) NOT NULL ,
    out_stamp_tax decimal(18,4) NOT NULL ,
    out_trans_fee decimal(18,4) NOT NULL ,
    out_brkage decimal(18,4) NOT NULL ,
    out_SEC_charges decimal(18,4) NOT NULL ,
    out_other_fee decimal(18,4) NOT NULL ,
    out_brkage_commis decimal(18,4) NOT NULL ,
    out_chann_commis decimal(18,4) NOT NULL ,
    out_divi_commis decimal(18,4) NOT NULL ,
    out_other_commis decimal(18,4) NOT NULL ,
    busi_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rpt_imp_pd_out_deli_jour_his_1 on tb_rpt_imp_pd_out_deli_jour_his (pass_no,out_acco,init_date,pass_deli_jour_no);
commit;
