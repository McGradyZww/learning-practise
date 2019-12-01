-- /**************************************************************************************/
-- 创建数据库【平台估值】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_eva DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_eva_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：平台估值_业务数据_估值产品账户资金表
use db_eva;
DROP TABLE IF EXISTS tb_evadata_pd_acco_capit;
CREATE TABLE tb_evadata_pd_acco_capit (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_acco_type int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    intrst_cacl_amt decimal(18,4) NOT NULL ,
    evalu_data_source int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evadata_pd_acco_capit_1 on tb_evadata_pd_acco_capit (init_date,co_no,pd_no,pd_acco_type,asset_acco,crncy_type,evalu_data_source);
create index idx_tb_evadata_pd_acco_capit_2 on tb_evadata_pd_acco_capit (co_no,pd_no);

-- 创建数据表：历史_平台估值_业务数据_估值产品账户资金表
use db_eva_his;
DROP TABLE IF EXISTS tb_evadata_pd_acco_capit_his;
CREATE TABLE tb_evadata_pd_acco_capit_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_acco_type int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    intrst_cacl_amt decimal(18,4) NOT NULL ,
    evalu_data_source int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evadata_pd_acco_capit_his_1 on tb_evadata_pd_acco_capit_his (init_date,co_no,pd_no,pd_acco_type,asset_acco,crncy_type,evalu_data_source);
create index idx_tb_evadata_pd_acco_capit_his_2 on tb_evadata_pd_acco_capit_his (co_no,pd_no);

-- 创建数据表：平台估值_业务数据_估值产品交易组账户资金表
use db_eva;
DROP TABLE IF EXISTS tb_evadata_pd_exgp_acco_capit;
CREATE TABLE tb_evadata_pd_exgp_acco_capit (
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
    pd_acco_type int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    intrst_cacl_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evadata_pd_exgp_acco_capit_1 on tb_evadata_pd_exgp_acco_capit (init_date,co_no,pd_no,asset_acco,exch_group_no,pd_acco_type);

-- 创建数据表：历史_平台估值_业务数据_估值产品交易组账户资金表
use db_eva_his;
DROP TABLE IF EXISTS tb_evadata_pd_exgp_acco_capit_his;
CREATE TABLE tb_evadata_pd_exgp_acco_capit_his (
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
    pd_acco_type int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    intrst_cacl_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evadata_pd_exgp_acco_capit_his_1 on tb_evadata_pd_exgp_acco_capit_his (init_date,co_no,pd_no,asset_acco,exch_group_no,pd_acco_type);

-- 创建数据表：平台估值_业务数据_估值产品证券持仓表
use db_eva;
DROP TABLE IF EXISTS tb_evadata_pd_secu_posi;
CREATE TABLE tb_evadata_pd_secu_posi (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_type int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    invest_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    curr_cost_amt decimal(18,4) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    repl_qty decimal(18,2) NOT NULL ,
    evalu_data_source int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evadata_pd_secu_posi_1 on tb_evadata_pd_secu_posi (init_date,co_no,pd_no,asset_acco,stock_acco);
create index idx_tb_evadata_pd_secu_posi_2 on tb_evadata_pd_secu_posi (co_no,pd_no);

-- 创建数据表：历史_平台估值_业务数据_估值产品证券持仓表
use db_eva_his;
DROP TABLE IF EXISTS tb_evadata_pd_secu_posi_his;
CREATE TABLE tb_evadata_pd_secu_posi_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_type int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    invest_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    curr_cost_amt decimal(18,4) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    repl_qty decimal(18,2) NOT NULL ,
    evalu_data_source int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evadata_pd_secu_posi_his_1 on tb_evadata_pd_secu_posi_his (init_date,co_no,pd_no,asset_acco,stock_acco);
create index idx_tb_evadata_pd_secu_posi_his_2 on tb_evadata_pd_secu_posi_his (co_no,pd_no);

-- 创建数据表：平台估值_业务数据_估值产品交易组证券持仓表
use db_eva;
DROP TABLE IF EXISTS tb_evadata_pd_exgp_secu_posi;
CREATE TABLE tb_evadata_pd_exgp_secu_posi (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    exch_group_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_type int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    invest_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    curr_cost_amt decimal(18,4) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    repl_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evadata_pd_exgp_secu_posi_1 on tb_evadata_pd_exgp_secu_posi (init_date,co_no,pd_no,asset_acco,stock_acco);
create index idx_tb_evadata_pd_exgp_secu_posi_2 on tb_evadata_pd_exgp_secu_posi (co_no,pd_no,exch_group_no);

-- 创建数据表：历史_平台估值_业务数据_估值产品交易组证券持仓表
use db_eva_his;
DROP TABLE IF EXISTS tb_evadata_pd_exgp_secu_posi_his;
CREATE TABLE tb_evadata_pd_exgp_secu_posi_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    exch_group_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_type int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    invest_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    curr_cost_amt decimal(18,4) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    repl_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evadata_pd_exgp_secu_posi_his_1 on tb_evadata_pd_exgp_secu_posi_his (init_date,co_no,pd_no,asset_acco,stock_acco);
create index idx_tb_evadata_pd_exgp_secu_posi_his_2 on tb_evadata_pd_exgp_secu_posi_his (co_no,pd_no,exch_group_no);

-- 创建数据表：平台估值_业务数据_估值产品债券回购表
use db_eva;
DROP TABLE IF EXISTS tb_evadata_pd_bond_repo;
CREATE TABLE tb_evadata_pd_bond_repo (
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
    target_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    order_dir int NOT NULL ,
    repo_qty decimal(18,2) NOT NULL ,
    repo_amt decimal(18,4) NOT NULL ,
    repo_rate decimal(18,12) NOT NULL ,
    repo_trade_date int NOT NULL ,
    repo_days int NOT NULL ,
    repo_cale_days int NOT NULL ,
    repo_back_date int NOT NULL ,
    repo_back_amt decimal(18,4) NOT NULL ,
    repo_back_intrst decimal(18,4) NOT NULL ,
    repo_back_trade_date int NOT NULL ,
    repo_status varchar(2) NOT NULL ,
    evalu_data_source int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evadata_pd_bond_repo_1 on tb_evadata_pd_bond_repo (init_date,co_no,pd_no);
create index idx_tb_evadata_pd_bond_repo_2 on tb_evadata_pd_bond_repo (co_no,pd_no,evalu_data_source);

-- 创建数据表：历史_平台估值_业务数据_估值产品债券回购表
use db_eva_his;
DROP TABLE IF EXISTS tb_evadata_pd_bond_repo_his;
CREATE TABLE tb_evadata_pd_bond_repo_his (
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
    target_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    order_dir int NOT NULL ,
    repo_qty decimal(18,2) NOT NULL ,
    repo_amt decimal(18,4) NOT NULL ,
    repo_rate decimal(18,12) NOT NULL ,
    repo_trade_date int NOT NULL ,
    repo_days int NOT NULL ,
    repo_cale_days int NOT NULL ,
    repo_back_date int NOT NULL ,
    repo_back_amt decimal(18,4) NOT NULL ,
    repo_back_intrst decimal(18,4) NOT NULL ,
    repo_back_trade_date int NOT NULL ,
    repo_status varchar(2) NOT NULL ,
    evalu_data_source int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evadata_pd_bond_repo_his_1 on tb_evadata_pd_bond_repo_his (init_date,co_no,pd_no);
create index idx_tb_evadata_pd_bond_repo_his_2 on tb_evadata_pd_bond_repo_his (co_no,pd_no,evalu_data_source);

-- 创建数据表：平台估值_业务数据_估值产品银行流水表
use db_eva;
DROP TABLE IF EXISTS tb_evadata_product_bank_jour;
CREATE TABLE tb_evadata_product_bank_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    occur_dir int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evadata_product_bank_jour_1 on tb_evadata_product_bank_jour (co_no,pd_no,occur_dir);

-- 创建数据表：平台估值_业务数据_估值产品成交表
use db_eva;
DROP TABLE IF EXISTS tb_evadata_pd_execution;
CREATE TABLE tb_evadata_pd_execution (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
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
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evadata_pd_execution_1 on tb_evadata_pd_execution (co_no,pd_no,init_date);
create index idx_tb_evadata_pd_execution_2 on tb_evadata_pd_execution (init_date);

-- 创建数据表：历史_平台估值_业务数据_估值产品成交表
use db_eva_his;
DROP TABLE IF EXISTS tb_evadata_pd_execution_his;
CREATE TABLE tb_evadata_pd_execution_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
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
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evadata_pd_execution_his_1 on tb_evadata_pd_execution_his (co_no,pd_no,init_date);
create index idx_tb_evadata_pd_execution_his_2 on tb_evadata_pd_execution_his (init_date);

-- 创建数据表：平台估值_业务数据_估值产品证券持仓成本增值税表
use db_eva;
DROP TABLE IF EXISTS tb_evadata_pd_vat_cost;
CREATE TABLE tb_evadata_pd_vat_cost (
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
    stock_type int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    curr_cost_amt decimal(18,4) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    cost_price decimal(16,9) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    offset_qty decimal(18,2) NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evadata_pd_vat_cost_1 on tb_evadata_pd_vat_cost (init_date,co_no,pd_no,stock_code);
create index idx_tb_evadata_pd_vat_cost_2 on tb_evadata_pd_vat_cost (co_no,pd_no);

-- 创建数据表：平台估值_业务数据_估值产品场外交易表
use db_eva;
DROP TABLE IF EXISTS tb_evadata_pd_transout;
CREATE TABLE tb_evadata_pd_transout (
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
    stock_type int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    order_dir int NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    expire_date int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evadata_pd_transout_1 on tb_evadata_pd_transout (init_date,co_no,pd_no);

-- 创建数据表：平台估值_业务数据_估值产品期货持仓表
use db_eva;
DROP TABLE IF EXISTS tb_evadata_pd_fupo_posi;
CREATE TABLE tb_evadata_pd_fupo_posi (
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
    contrc_type int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    comb_code varchar(6) NOT NULL ,
    contrc_unit int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    pre_settle_price decimal(16,9) NOT NULL ,
    sett_price decimal(16,9) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    open_amount decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    close_pandl decimal(18,4) NOT NULL ,
    today_posi_flag int NOT NULL ,
    evalu_data_source int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evadata_pd_fupo_posi_1 on tb_evadata_pd_fupo_posi (init_date,co_no,pd_no,asset_acco_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type);
create index idx_tb_evadata_pd_fupo_posi_2 on tb_evadata_pd_fupo_posi (init_date,co_no,pd_no,asset_acco_no,exch_no,lngsht_type);
create index idx_tb_evadata_pd_fupo_posi_3 on tb_evadata_pd_fupo_posi (co_no,pd_no,evalu_data_source);

-- 创建数据表：历史_平台估值_业务数据_估值产品期货持仓表
use db_eva_his;
DROP TABLE IF EXISTS tb_evadata_pd_fupo_posi_his;
CREATE TABLE tb_evadata_pd_fupo_posi_his (
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
    contrc_type int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    comb_code varchar(6) NOT NULL ,
    contrc_unit int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    pre_settle_price decimal(16,9) NOT NULL ,
    sett_price decimal(16,9) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    open_amount decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    close_pandl decimal(18,4) NOT NULL ,
    today_posi_flag int NOT NULL ,
    evalu_data_source int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evadata_pd_fupo_posi_his_1 on tb_evadata_pd_fupo_posi_his (init_date,co_no,pd_no,asset_acco_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type);
create index idx_tb_evadata_pd_fupo_posi_his_2 on tb_evadata_pd_fupo_posi_his (init_date,co_no,pd_no,asset_acco_no,exch_no,lngsht_type);
create index idx_tb_evadata_pd_fupo_posi_his_3 on tb_evadata_pd_fupo_posi_his (co_no,pd_no,evalu_data_source);

-- 创建数据表：平台估值_业务数据_投资人份额流水表
use db_eva;
DROP TABLE IF EXISTS tb_evadata_invster_holding_jour;
CREATE TABLE tb_evadata_invster_holding_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    init_date int NOT NULL ,
    cust_no int NOT NULL ,
    pd_no int NOT NULL ,
    occur_share decimal(18,2) NOT NULL ,
    pd_share decimal(18,2) NOT NULL ,
    occur_dir int NOT NULL ,
    busi_oper int NOT NULL ,
    divi_id bigint NOT NULL ,
    confirm_date int NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    confirm_apply decimal(18,4) NOT NULL ,
    trade_fee decimal(18,4) NOT NULL ,
    achieve_performance decimal(18,4) NOT NULL ,
    redem_pd_share decimal(18,4) NOT NULL ,
    sales_commission decimal(18,4) NOT NULL ,
    chann_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evadata_invster_holding_jour_1 on tb_evadata_invster_holding_jour (co_no,pd_no,init_date);
commit;
