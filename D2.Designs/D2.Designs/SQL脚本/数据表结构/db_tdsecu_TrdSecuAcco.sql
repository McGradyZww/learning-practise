-- /**************************************************************************************/
-- 创建数据库【交易证券】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_tdsecu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_tdsecu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：交易证券_账户_交易组业务资金表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_exgp_busi_capit;
CREATE TABLE tb_tdseac_exgp_busi_capit (
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
create unique index idx_tb_tdseac_exgp_busi_capit_1 on tb_tdseac_exgp_busi_capit (exch_group_no,asset_acco_no,exch_crncy_type);
create index idx_tb_tdseac_exgp_busi_capit_2 on tb_tdseac_exgp_busi_capit (co_no,pd_no,exch_crncy_type);
create index idx_tb_tdseac_exgp_busi_capit_3 on tb_tdseac_exgp_busi_capit (update_date,update_time);

-- 创建数据表：交易证券_账户_历史交易组业务资金表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_exgp_busi_capit_his;
CREATE TABLE tb_tdseac_exgp_busi_capit_his (
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
create unique index idx_tb_tdseac_exgp_busi_capit_his_1 on tb_tdseac_exgp_busi_capit_his (init_date,exch_group_no,asset_acco_no,exch_crncy_type);
create index idx_tb_tdseac_exgp_busi_capit_his_2 on tb_tdseac_exgp_busi_capit_his (init_date,co_no,pd_no,exch_crncy_type);

-- 创建数据表：交易证券_账户_资产账户业务资金表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_asac_busi_capit;
CREATE TABLE tb_tdseac_asac_busi_capit (
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
create unique index idx_tb_tdseac_asac_busi_capit_1 on tb_tdseac_asac_busi_capit (asset_acco_no,exch_crncy_type);
create index idx_tb_tdseac_asac_busi_capit_2 on tb_tdseac_asac_busi_capit (co_no,pd_no,exch_crncy_type);
create index idx_tb_tdseac_asac_busi_capit_3 on tb_tdseac_asac_busi_capit (update_date,update_time);

-- 创建数据表：交易证券_账户_历史资产账户业务资金表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_asac_busi_capit_his;
CREATE TABLE tb_tdseac_asac_busi_capit_his (
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
create unique index idx_tb_tdseac_asac_busi_capit_his_1 on tb_tdseac_asac_busi_capit_his (init_date,asset_acco_no,exch_crncy_type);
create index idx_tb_tdseac_asac_busi_capit_his_2 on tb_tdseac_asac_busi_capit_his (init_date,co_no,pd_no,exch_crncy_type);

-- 创建数据表：交易证券_账户_交易组业务持仓表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_exgp_busi_posi;
CREATE TABLE tb_tdseac_exgp_busi_posi (
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
create unique index idx_tb_tdseac_exgp_busi_posi_1 on tb_tdseac_exgp_busi_posi (exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_tdseac_exgp_busi_posi_2 on tb_tdseac_exgp_busi_posi (co_no,pd_no);
create index idx_tb_tdseac_exgp_busi_posi_3 on tb_tdseac_exgp_busi_posi (update_date,update_time);

-- 创建数据表：交易证券_账户_历史交易组业务持仓表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_exgp_busi_posi_his;
CREATE TABLE tb_tdseac_exgp_busi_posi_his (
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
create unique index idx_tb_tdseac_exgp_busi_posi_his_1 on tb_tdseac_exgp_busi_posi_his (init_date,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_tdseac_exgp_busi_posi_his_2 on tb_tdseac_exgp_busi_posi_his (init_date,co_no,pd_no);

-- 创建数据表：交易证券_账户_资产账户业务持仓表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_asac_busi_posi;
CREATE TABLE tb_tdseac_asac_busi_posi (
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
create unique index idx_tb_tdseac_asac_busi_posi_1 on tb_tdseac_asac_busi_posi (asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_tdseac_asac_busi_posi_2 on tb_tdseac_asac_busi_posi (co_no,pd_no);
create index idx_tb_tdseac_asac_busi_posi_3 on tb_tdseac_asac_busi_posi (update_date,update_time);

-- 创建数据表：交易证券_账户_历史资产账户业务持仓表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_asac_busi_posi_his;
CREATE TABLE tb_tdseac_asac_busi_posi_his (
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
create unique index idx_tb_tdseac_asac_busi_posi_his_1 on tb_tdseac_asac_busi_posi_his (init_date,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_tdseac_asac_busi_posi_his_2 on tb_tdseac_asac_busi_posi_his (co_no,pd_no);

-- 创建数据表：交易证券_账户_交易组债券质押表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_exgp_bond_impawn;
CREATE TABLE tb_tdseac_exgp_bond_impawn (
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
create unique index idx_tb_tdseac_exgp_bond_impawn_1 on tb_tdseac_exgp_bond_impawn (exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_tdseac_exgp_bond_impawn_2 on tb_tdseac_exgp_bond_impawn (co_no,pd_no);
create index idx_tb_tdseac_exgp_bond_impawn_3 on tb_tdseac_exgp_bond_impawn (update_date,update_time);

-- 创建数据表：交易证券_账户_历史交易组债券质押表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_exgp_bond_impawn_his;
CREATE TABLE tb_tdseac_exgp_bond_impawn_his (
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
create unique index idx_tb_tdseac_exgp_bond_impawn_his_1 on tb_tdseac_exgp_bond_impawn_his (init_date,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_tdseac_exgp_bond_impawn_his_2 on tb_tdseac_exgp_bond_impawn_his (init_date,co_no,pd_no);

-- 创建数据表：交易证券_账户_资产账户债券质押表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_asac_bond_impawn;
CREATE TABLE tb_tdseac_asac_bond_impawn (
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
create unique index idx_tb_tdseac_asac_bond_impawn_1 on tb_tdseac_asac_bond_impawn (asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_tdseac_asac_bond_impawn_2 on tb_tdseac_asac_bond_impawn (co_no,pd_no);
create index idx_tb_tdseac_asac_bond_impawn_3 on tb_tdseac_asac_bond_impawn (update_date,update_time);

-- 创建数据表：交易证券_账户_历史资产账户债券质押表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_asac_bond_impawn_his;
CREATE TABLE tb_tdseac_asac_bond_impawn_his (
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
create unique index idx_tb_tdseac_asac_bond_impawn_his_1 on tb_tdseac_asac_bond_impawn_his (init_date,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_tdseac_asac_bond_impawn_his_2 on tb_tdseac_asac_bond_impawn_his (init_date,co_no,pd_no);

-- 创建数据表：交易证券_账户_债券回购表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_bond_repo;
CREATE TABLE tb_tdseac_bond_repo (
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
    target_code_no int NOT NULL ,
    comm_id bigint NOT NULL ,
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
create index idx_tb_tdseac_bond_repo_1 on tb_tdseac_bond_repo (init_date,asset_acco_no,stock_acco_no,stock_code_no,order_dir);
create index idx_tb_tdseac_bond_repo_2 on tb_tdseac_bond_repo (init_date,co_no,pd_no,exch_group_no);
create index idx_tb_tdseac_bond_repo_3 on tb_tdseac_bond_repo (repo_back_trade_date,repo_status);
create unique index idx_tb_tdseac_bond_repo_4 on tb_tdseac_bond_repo (repo_strike_id);

-- 创建数据表：历史_交易证券_账户_债券回购表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_bond_repo_his;
CREATE TABLE tb_tdseac_bond_repo_his (
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
    target_code_no int NOT NULL ,
    comm_id bigint NOT NULL ,
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
create index idx_tb_tdseac_bond_repo_his_1 on tb_tdseac_bond_repo_his (init_date,asset_acco_no,stock_acco_no,stock_code_no,order_dir);
create index idx_tb_tdseac_bond_repo_his_2 on tb_tdseac_bond_repo_his (init_date,co_no,pd_no,exch_group_no);
create index idx_tb_tdseac_bond_repo_his_3 on tb_tdseac_bond_repo_his (repo_back_trade_date,repo_status);
create unique index idx_tb_tdseac_bond_repo_his_4 on tb_tdseac_bond_repo_his (repo_strike_id);

-- 创建数据表：交易证券_账户_交易组业务资金持仓变动流水表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_exgp_busi_capit_posi_jour;
CREATE TABLE tb_tdseac_exgp_busi_capit_posi_jour (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    comm_id bigint NOT NULL ,
    order_strike_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    comm_occur_amt decimal(18,4) NOT NULL ,
    comm_occur_qty decimal(18,2) NOT NULL ,
    trade_occur_amt decimal(18,4) NOT NULL ,
    trade_occur_qty decimal(18,2) NOT NULL ,
    strike_occur_amt decimal(18,4) NOT NULL ,
    strike_occur_qty decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdseac_exgp_busi_capit_posi_jour_1 on tb_tdseac_exgp_busi_capit_posi_jour (init_date,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_tdseac_exgp_busi_capit_posi_jour_2 on tb_tdseac_exgp_busi_capit_posi_jour (init_date,co_no,pd_no,exch_group_no);

-- 创建数据表：历史_交易证券_账户_交易组业务资金持仓变动流水表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_exgp_busi_capit_posi_jour_his;
CREATE TABLE tb_tdseac_exgp_busi_capit_posi_jour_his (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    comm_id bigint NOT NULL ,
    order_strike_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    comm_occur_amt decimal(18,4) NOT NULL ,
    comm_occur_qty decimal(18,2) NOT NULL ,
    trade_occur_amt decimal(18,4) NOT NULL ,
    trade_occur_qty decimal(18,2) NOT NULL ,
    strike_occur_amt decimal(18,4) NOT NULL ,
    strike_occur_qty decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdseac_exgp_busi_capit_posi_jour_his_1 on tb_tdseac_exgp_busi_capit_posi_jour_his (init_date,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_tdseac_exgp_busi_capit_posi_jour_his_2 on tb_tdseac_exgp_busi_capit_posi_jour_his (init_date,co_no,pd_no,exch_group_no);

-- 创建数据表：交易证券_账户_资产账户业务资金持仓变动流水表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_asac_busi_capit_posi_jour;
CREATE TABLE tb_tdseac_asac_busi_capit_posi_jour (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    comm_id bigint NOT NULL ,
    order_strike_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    comm_occur_amt decimal(18,4) NOT NULL ,
    comm_occur_qty decimal(18,2) NOT NULL ,
    trade_occur_amt decimal(18,4) NOT NULL ,
    trade_occur_qty decimal(18,2) NOT NULL ,
    strike_occur_amt decimal(18,4) NOT NULL ,
    strike_occur_qty decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdseac_asac_busi_capit_posi_jour_1 on tb_tdseac_asac_busi_capit_posi_jour (init_date,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_tdseac_asac_busi_capit_posi_jour_2 on tb_tdseac_asac_busi_capit_posi_jour (init_date,co_no,pd_no,exch_group_no);

-- 创建数据表：历史_交易证券_账户_资产账户业务资金持仓变动流水表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_asac_busi_capit_posi_jour_his;
CREATE TABLE tb_tdseac_asac_busi_capit_posi_jour_his (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    comm_id bigint NOT NULL ,
    order_strike_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    comm_occur_amt decimal(18,4) NOT NULL ,
    comm_occur_qty decimal(18,2) NOT NULL ,
    trade_occur_amt decimal(18,4) NOT NULL ,
    trade_occur_qty decimal(18,2) NOT NULL ,
    strike_occur_amt decimal(18,4) NOT NULL ,
    strike_occur_qty decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdseac_asac_busi_capit_posi_jour_his_1 on tb_tdseac_asac_busi_capit_posi_jour_his (init_date,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_tdseac_asac_busi_capit_posi_jour_his_2 on tb_tdseac_asac_busi_capit_posi_jour_his (init_date,co_no,pd_no,exch_group_no);

-- 创建数据表：交易证券_账户_组合持仓入账流水表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_combo_posi_entry_jour;
CREATE TABLE tb_tdseac_combo_posi_entry_jour (
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
    target_code_no int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    old_arrive_date int NOT NULL ,
    arrive_date int NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdseac_combo_posi_entry_jour_1 on tb_tdseac_combo_posi_entry_jour (init_date);
create index idx_tb_tdseac_combo_posi_entry_jour_2 on tb_tdseac_combo_posi_entry_jour (exch_no,arrive_date,entry_status);

-- 创建数据表：历史_交易证券_账户_组合持仓入账流水表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_combo_posi_entry_jour_his;
CREATE TABLE tb_tdseac_combo_posi_entry_jour_his (
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
    target_code_no int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    old_arrive_date int NOT NULL ,
    arrive_date int NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdseac_combo_posi_entry_jour_his_1 on tb_tdseac_combo_posi_entry_jour_his (init_date);
create index idx_tb_tdseac_combo_posi_entry_jour_his_2 on tb_tdseac_combo_posi_entry_jour_his (exch_no,arrive_date,entry_status);

-- 创建数据表：交易证券_账户_组合持仓汇总表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_comboposisum;
CREATE TABLE tb_tdseac_comboposisum (
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
    combo_code varchar(32) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    posi_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    pre_settle_qty decimal(18,2) NOT NULL ,
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
    posi_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_comboposisum_1 on tb_tdseac_comboposisum (exch_group_no,asset_acco_no,stock_acco_no,combo_code,stock_code_no,init_date);
create index idx_tb_tdseac_comboposisum_2 on tb_tdseac_comboposisum (posi_status);

-- 创建数据表：历史_交易证券_账户_组合持仓汇总表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_comboposisum_his;
CREATE TABLE tb_tdseac_comboposisum_his (
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
    combo_code varchar(32) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    posi_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    pre_settle_qty decimal(18,2) NOT NULL ,
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
    posi_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_comboposisum_his_1 on tb_tdseac_comboposisum_his (exch_group_no,asset_acco_no,stock_acco_no,combo_code,stock_code_no,init_date);
create index idx_tb_tdseac_comboposisum_his_2 on tb_tdseac_comboposisum_his (posi_status);

-- 创建数据表：交易证券_账户_组合持仓表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_comboposi;
CREATE TABLE tb_tdseac_comboposi (
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
    combo_code varchar(32) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    open_posi_date int NOT NULL ,
    posi_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    pre_settle_qty decimal(18,2) NOT NULL ,
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
    posi_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_comboposi_1 on tb_tdseac_comboposi (exch_group_no,asset_acco_no,stock_acco_no,combo_code,stock_code_no,open_posi_date,init_date);
create index idx_tb_tdseac_comboposi_2 on tb_tdseac_comboposi (posi_status);

-- 创建数据表：历史_交易证券_账户_组合持仓表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_comboposi_his;
CREATE TABLE tb_tdseac_comboposi_his (
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
    combo_code varchar(32) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    open_posi_date int NOT NULL ,
    posi_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    pre_settle_qty decimal(18,2) NOT NULL ,
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
    posi_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_comboposi_his_1 on tb_tdseac_comboposi_his (exch_group_no,asset_acco_no,stock_acco_no,combo_code,stock_code_no,open_posi_date,init_date);
create index idx_tb_tdseac_comboposi_his_2 on tb_tdseac_comboposi_his (posi_status);

-- 创建数据表：交易证券_账户_组合收益表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_comboincome;
CREATE TABLE tb_tdseac_comboincome (
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
    open_posi_date int NOT NULL ,
    comm_batch_no int NOT NULL ,
    combo_code varchar(32) NOT NULL ,
    combo_copies decimal(18,2) NOT NULL ,
    combo_status varchar(2) NOT NULL ,
    combo_cost decimal(18,4) NOT NULL ,
    combo_market_value decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    sum_realize_pandl decimal(18,4) NOT NULL ,
    status_update_date int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_comboincome_1 on tb_tdseac_comboincome (co_no,pd_no,exch_group_no,combo_code,open_posi_date,init_date);
create index idx_tb_tdseac_comboincome_2 on tb_tdseac_comboincome (comm_batch_no);

-- 创建数据表：历史_交易证券_账户_组合收益表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_comboincome_his;
CREATE TABLE tb_tdseac_comboincome_his (
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
    open_posi_date int NOT NULL ,
    comm_batch_no int NOT NULL ,
    combo_code varchar(32) NOT NULL ,
    combo_copies decimal(18,2) NOT NULL ,
    combo_status varchar(2) NOT NULL ,
    combo_cost decimal(18,4) NOT NULL ,
    combo_market_value decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    sum_realize_pandl decimal(18,4) NOT NULL ,
    status_update_date int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_comboincome_his_1 on tb_tdseac_comboincome_his (co_no,pd_no,exch_group_no,combo_code,open_posi_date,init_date);
create index idx_tb_tdseac_comboincome_his_2 on tb_tdseac_comboincome_his (comm_batch_no);

-- 创建数据表：交易证券_账户_组合收益汇总表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_comboincomesum;
CREATE TABLE tb_tdseac_comboincomesum (
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
    comm_batch_no int NOT NULL ,
    combo_code varchar(32) NOT NULL ,
    combo_copies decimal(18,2) NOT NULL ,
    combo_status varchar(2) NOT NULL ,
    combo_cost decimal(18,4) NOT NULL ,
    combo_market_value decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    sum_realize_pandl decimal(18,4) NOT NULL ,
    status_update_date int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_comboincomesum_1 on tb_tdseac_comboincomesum (co_no,pd_no,exch_group_no,combo_code,init_date);
create index idx_tb_tdseac_comboincomesum_2 on tb_tdseac_comboincomesum (comm_batch_no);

-- 创建数据表：历史_交易证券_账户_组合收益汇总表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_comboincomesum_his;
CREATE TABLE tb_tdseac_comboincomesum_his (
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
    comm_batch_no int NOT NULL ,
    combo_code varchar(32) NOT NULL ,
    combo_copies decimal(18,2) NOT NULL ,
    combo_status varchar(2) NOT NULL ,
    combo_cost decimal(18,4) NOT NULL ,
    combo_market_value decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    sum_realize_pandl decimal(18,4) NOT NULL ,
    status_update_date int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_comboincomesum_his_1 on tb_tdseac_comboincomesum_his (co_no,pd_no,exch_group_no,combo_code,init_date);
create index idx_tb_tdseac_comboincomesum_his_2 on tb_tdseac_comboincomesum_his (comm_batch_no);

-- 创建数据表：交易证券_账户_组合持仓划转流水表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_combopositransferlog;
CREATE TABLE tb_tdseac_combopositransferlog (
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
    combo_code varchar(32) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    combo_posi_id bigint NOT NULL ,
    source_date int NOT NULL ,
    occur_cost_amt decimal(18,4) NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    target_combo_posi_id bigint NOT NULL ,
    target_date int NOT NULL ,
    target_combo_code varchar(32) NOT NULL ,
    target_exch_group_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdseac_combopositransferlog_1 on tb_tdseac_combopositransferlog (init_date,co_no,pd_no,exch_group_no,combo_code);

-- 创建数据表：历史_交易证券_账户_组合持仓划转流水表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_combopositransferlog_his;
CREATE TABLE tb_tdseac_combopositransferlog_his (
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
    combo_code varchar(32) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    combo_posi_id bigint NOT NULL ,
    source_date int NOT NULL ,
    occur_cost_amt decimal(18,4) NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    target_combo_posi_id bigint NOT NULL ,
    target_date int NOT NULL ,
    target_combo_code varchar(32) NOT NULL ,
    target_exch_group_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdseac_combopositransferlog_his_1 on tb_tdseac_combopositransferlog_his (init_date,co_no,pd_no,exch_group_no,combo_code);

-- 创建数据表：交易证券_账户_交易组融资融券保证金计算表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_exgp_fina_loan_margin_calc;
CREATE TABLE tb_tdseac_exgp_fina_loan_margin_calc (
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
    converted_margin decimal(18,4) NOT NULL ,
    fina_converted_pandl decimal(18,4) NOT NULL ,
    loan_converted_pandl decimal(18,4) NOT NULL ,
    fina_capt_margin decimal(18,4) NOT NULL ,
    loan_capt_margin decimal(18,4) NOT NULL ,
    keep_guarantee_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_exgp_fina_loan_margin_calc_1 on tb_tdseac_exgp_fina_loan_margin_calc (co_no,pd_no,exch_group_no);

-- 创建数据表：历史_交易证券_账户_交易组融资融券保证金计算表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_exgp_fina_loan_margin_calc_his;
CREATE TABLE tb_tdseac_exgp_fina_loan_margin_calc_his (
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
    converted_margin decimal(18,4) NOT NULL ,
    fina_converted_pandl decimal(18,4) NOT NULL ,
    loan_converted_pandl decimal(18,4) NOT NULL ,
    fina_capt_margin decimal(18,4) NOT NULL ,
    loan_capt_margin decimal(18,4) NOT NULL ,
    keep_guarantee_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_exgp_fina_loan_margin_calc_his_1 on tb_tdseac_exgp_fina_loan_margin_calc_his (co_no,pd_no,exch_group_no);

-- 创建数据表：交易证券_账户_资产账户融资融券保证金计算表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_asac_fina_loan_margin_calc;
CREATE TABLE tb_tdseac_asac_fina_loan_margin_calc (
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
    converted_margin decimal(18,4) NOT NULL ,
    fina_converted_pandl decimal(18,4) NOT NULL ,
    loan_converted_pandl decimal(18,4) NOT NULL ,
    fina_capt_margin decimal(18,4) NOT NULL ,
    loan_capt_margin decimal(18,4) NOT NULL ,
    keep_guarantee_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_asac_fina_loan_margin_calc_1 on tb_tdseac_asac_fina_loan_margin_calc (co_no,pd_no,asset_acco_no);

-- 创建数据表：历史_交易证券_账户_资产账户融资融券保证金计算表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_asac_fina_loan_margin_calc_his;
CREATE TABLE tb_tdseac_asac_fina_loan_margin_calc_his (
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
    converted_margin decimal(18,4) NOT NULL ,
    fina_converted_pandl decimal(18,4) NOT NULL ,
    loan_converted_pandl decimal(18,4) NOT NULL ,
    fina_capt_margin decimal(18,4) NOT NULL ,
    loan_capt_margin decimal(18,4) NOT NULL ,
    keep_guarantee_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_asac_fina_loan_margin_calc_his_1 on tb_tdseac_asac_fina_loan_margin_calc_his (co_no,pd_no,asset_acco_no);

-- 创建数据表：交易证券_账户_交易组业务资金负债表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_exgp_busi_capital_debt;
CREATE TABLE tb_tdseac_exgp_busi_capital_debt (
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
    debt_loan_sell_strike_amt decimal(18,4) NOT NULL ,
    debt_strike_fee decimal(18,4) NOT NULL ,
    loan_return_strike_amt decimal(18,4) NOT NULL ,
    loan_return_order_amt decimal(18,4) NOT NULL ,
    loan_return_comm_amt decimal(18,4) NOT NULL ,
    return_strike_fee decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_exgp_busi_capital_debt_1 on tb_tdseac_exgp_busi_capital_debt (init_date,co_no,pd_no,asset_acco_no,exch_group_no);

-- 创建数据表：历史_交易证券_账户_交易组业务资金负债表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_exgp_busi_capital_debt_his;
CREATE TABLE tb_tdseac_exgp_busi_capital_debt_his (
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
    debt_loan_sell_strike_amt decimal(18,4) NOT NULL ,
    debt_strike_fee decimal(18,4) NOT NULL ,
    loan_return_strike_amt decimal(18,4) NOT NULL ,
    loan_return_order_amt decimal(18,4) NOT NULL ,
    loan_return_comm_amt decimal(18,4) NOT NULL ,
    return_strike_fee decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_exgp_busi_capital_debt_his_1 on tb_tdseac_exgp_busi_capital_debt_his (init_date,co_no,pd_no,asset_acco_no,exch_group_no);

-- 创建数据表：交易证券_账户_资产账户业务资金负债表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_asac_busi_capital_debt;
CREATE TABLE tb_tdseac_asac_busi_capital_debt (
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
    debt_loan_sell_strike_amt decimal(18,4) NOT NULL ,
    debt_strike_fee decimal(18,4) NOT NULL ,
    loan_return_strike_amt decimal(18,4) NOT NULL ,
    loan_return_order_amt decimal(18,4) NOT NULL ,
    loan_return_comm_amt decimal(18,4) NOT NULL ,
    return_strike_fee decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_asac_busi_capital_debt_1 on tb_tdseac_asac_busi_capital_debt (init_date,co_no,pd_no,asset_acco_no);

-- 创建数据表：历史_交易证券_账户_资产账户业务资金负债表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_asac_busi_capital_debt_his;
CREATE TABLE tb_tdseac_asac_busi_capital_debt_his (
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
    debt_loan_sell_strike_amt decimal(18,4) NOT NULL ,
    debt_strike_fee decimal(18,4) NOT NULL ,
    loan_return_strike_amt decimal(18,4) NOT NULL ,
    loan_return_order_amt decimal(18,4) NOT NULL ,
    loan_return_comm_amt decimal(18,4) NOT NULL ,
    return_strike_fee decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_asac_busi_capital_debt_his_1 on tb_tdseac_asac_busi_capital_debt_his (init_date,co_no,pd_no,asset_acco_no);

-- 创建数据表：交易证券_账户_交易组业务持仓负债表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_exgp_busi_posi_debt;
CREATE TABLE tb_tdseac_exgp_busi_posi_debt (
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
    stock_acco_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    invest_type int NOT NULL ,
    debt_type int NOT NULL ,
    debt_fina_buy_strike_qty decimal(18,2) NOT NULL ,
    fina_return_strike_qty decimal(18,2) NOT NULL ,
    debt_loan_sell_strike_qty decimal(18,2) NOT NULL ,
    loan_return_strike_qty decimal(18,2) NOT NULL ,
    debt_fina_buy_order_qty decimal(18,2) NOT NULL ,
    fina_return_order_qty decimal(18,2) NOT NULL ,
    debt_loan_sell_order_qty decimal(18,2) NOT NULL ,
    loan_return_order_qty decimal(18,2) NOT NULL ,
    debt_fina_buy_comm_qty decimal(18,2) NOT NULL ,
    fina_return_comm_qty decimal(18,2) NOT NULL ,
    debt_loan_sell_comm_qty decimal(18,2) NOT NULL ,
    loan_return_comm_qty decimal(18,2) NOT NULL ,
    debt_fina_buy_strike_amt decimal(18,4) NOT NULL ,
    fina_return_strike_amt decimal(18,4) NOT NULL ,
    debt_loan_sell_strike_amt decimal(18,4) NOT NULL ,
    loan_return_strike_amt decimal(18,4) NOT NULL ,
    debt_fina_buy_order_amt decimal(18,4) NOT NULL ,
    fina_return_order_amt decimal(18,4) NOT NULL ,
    debt_loan_sell_order_amt decimal(18,4) NOT NULL ,
    loan_return_order_amt decimal(18,4) NOT NULL ,
    debt_fina_buy_comm_amt decimal(18,4) NOT NULL ,
    fina_return_comm_amt decimal(18,4) NOT NULL ,
    debt_loan_sell_comm_amt decimal(18,4) NOT NULL ,
    loan_return_comm_amt decimal(18,4) NOT NULL ,
    debt_strike_fee decimal(18,4) NOT NULL ,
    return_strike_fee decimal(18,4) NOT NULL ,
    debt_interest decimal(18,4) NOT NULL ,
    return_interest_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_exgp_busi_posi_debt_1 on tb_tdseac_exgp_busi_posi_debt (init_date,co_no,pd_no,asset_acco_no,exch_group_no,stock_acco_no,stock_code_no,debt_type);

-- 创建数据表：历史_交易证券_账户_交易组业务持仓负债表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_exgp_busi_posi_debt_his;
CREATE TABLE tb_tdseac_exgp_busi_posi_debt_his (
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
    stock_acco_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    invest_type int NOT NULL ,
    debt_type int NOT NULL ,
    debt_fina_buy_strike_qty decimal(18,2) NOT NULL ,
    fina_return_strike_qty decimal(18,2) NOT NULL ,
    debt_loan_sell_strike_qty decimal(18,2) NOT NULL ,
    loan_return_strike_qty decimal(18,2) NOT NULL ,
    debt_fina_buy_order_qty decimal(18,2) NOT NULL ,
    fina_return_order_qty decimal(18,2) NOT NULL ,
    debt_loan_sell_order_qty decimal(18,2) NOT NULL ,
    loan_return_order_qty decimal(18,2) NOT NULL ,
    debt_fina_buy_comm_qty decimal(18,2) NOT NULL ,
    fina_return_comm_qty decimal(18,2) NOT NULL ,
    debt_loan_sell_comm_qty decimal(18,2) NOT NULL ,
    loan_return_comm_qty decimal(18,2) NOT NULL ,
    debt_fina_buy_strike_amt decimal(18,4) NOT NULL ,
    fina_return_strike_amt decimal(18,4) NOT NULL ,
    debt_loan_sell_strike_amt decimal(18,4) NOT NULL ,
    loan_return_strike_amt decimal(18,4) NOT NULL ,
    debt_fina_buy_order_amt decimal(18,4) NOT NULL ,
    fina_return_order_amt decimal(18,4) NOT NULL ,
    debt_loan_sell_order_amt decimal(18,4) NOT NULL ,
    loan_return_order_amt decimal(18,4) NOT NULL ,
    debt_fina_buy_comm_amt decimal(18,4) NOT NULL ,
    fina_return_comm_amt decimal(18,4) NOT NULL ,
    debt_loan_sell_comm_amt decimal(18,4) NOT NULL ,
    loan_return_comm_amt decimal(18,4) NOT NULL ,
    debt_strike_fee decimal(18,4) NOT NULL ,
    return_strike_fee decimal(18,4) NOT NULL ,
    debt_interest decimal(18,4) NOT NULL ,
    return_interest_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_exgp_busi_posi_debt_his_1 on tb_tdseac_exgp_busi_posi_debt_his (init_date,co_no,pd_no,asset_acco_no,exch_group_no,stock_acco_no,stock_code_no,debt_type);

-- 创建数据表：交易证券_账户_资产账户业务持仓负债表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_asac_busi_posi_debt;
CREATE TABLE tb_tdseac_asac_busi_posi_debt (
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
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    invest_type int NOT NULL ,
    debt_type int NOT NULL ,
    debt_fina_buy_strike_qty decimal(18,2) NOT NULL ,
    fina_return_strike_qty decimal(18,2) NOT NULL ,
    debt_loan_sell_strike_qty decimal(18,2) NOT NULL ,
    loan_return_strike_qty decimal(18,2) NOT NULL ,
    debt_fina_buy_order_qty decimal(18,2) NOT NULL ,
    fina_return_order_qty decimal(18,2) NOT NULL ,
    debt_loan_sell_order_qty decimal(18,2) NOT NULL ,
    loan_return_order_qty decimal(18,2) NOT NULL ,
    debt_fina_buy_comm_qty decimal(18,2) NOT NULL ,
    fina_return_comm_qty decimal(18,2) NOT NULL ,
    debt_loan_sell_comm_qty decimal(18,2) NOT NULL ,
    loan_return_comm_qty decimal(18,2) NOT NULL ,
    debt_fina_buy_strike_amt decimal(18,4) NOT NULL ,
    fina_return_strike_amt decimal(18,4) NOT NULL ,
    debt_loan_sell_strike_amt decimal(18,4) NOT NULL ,
    loan_return_strike_amt decimal(18,4) NOT NULL ,
    debt_fina_buy_order_amt decimal(18,4) NOT NULL ,
    fina_return_order_amt decimal(18,4) NOT NULL ,
    debt_loan_sell_order_amt decimal(18,4) NOT NULL ,
    loan_return_order_amt decimal(18,4) NOT NULL ,
    debt_fina_buy_comm_amt decimal(18,4) NOT NULL ,
    fina_return_comm_amt decimal(18,4) NOT NULL ,
    debt_loan_sell_comm_amt decimal(18,4) NOT NULL ,
    loan_return_comm_amt decimal(18,4) NOT NULL ,
    debt_strike_fee decimal(18,4) NOT NULL ,
    return_strike_fee decimal(18,4) NOT NULL ,
    debt_interest decimal(18,4) NOT NULL ,
    return_interest_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_asac_busi_posi_debt_1 on tb_tdseac_asac_busi_posi_debt (init_date,co_no,pd_no,asset_acco_no,stock_acco_no,stock_code_no,debt_type);

-- 创建数据表：历史_交易证券_账户_资产账户业务持仓负债表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_asac_busi_posi_debt_his;
CREATE TABLE tb_tdseac_asac_busi_posi_debt_his (
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
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    invest_type int NOT NULL ,
    debt_type int NOT NULL ,
    debt_fina_buy_strike_qty decimal(18,2) NOT NULL ,
    fina_return_strike_qty decimal(18,2) NOT NULL ,
    debt_loan_sell_strike_qty decimal(18,2) NOT NULL ,
    loan_return_strike_qty decimal(18,2) NOT NULL ,
    debt_fina_buy_order_qty decimal(18,2) NOT NULL ,
    fina_return_order_qty decimal(18,2) NOT NULL ,
    debt_loan_sell_order_qty decimal(18,2) NOT NULL ,
    loan_return_order_qty decimal(18,2) NOT NULL ,
    debt_fina_buy_comm_qty decimal(18,2) NOT NULL ,
    fina_return_comm_qty decimal(18,2) NOT NULL ,
    debt_loan_sell_comm_qty decimal(18,2) NOT NULL ,
    loan_return_comm_qty decimal(18,2) NOT NULL ,
    debt_fina_buy_strike_amt decimal(18,4) NOT NULL ,
    fina_return_strike_amt decimal(18,4) NOT NULL ,
    debt_loan_sell_strike_amt decimal(18,4) NOT NULL ,
    loan_return_strike_amt decimal(18,4) NOT NULL ,
    debt_fina_buy_order_amt decimal(18,4) NOT NULL ,
    fina_return_order_amt decimal(18,4) NOT NULL ,
    debt_loan_sell_order_amt decimal(18,4) NOT NULL ,
    loan_return_order_amt decimal(18,4) NOT NULL ,
    debt_fina_buy_comm_amt decimal(18,4) NOT NULL ,
    fina_return_comm_amt decimal(18,4) NOT NULL ,
    debt_loan_sell_comm_amt decimal(18,4) NOT NULL ,
    loan_return_comm_amt decimal(18,4) NOT NULL ,
    debt_strike_fee decimal(18,4) NOT NULL ,
    return_strike_fee decimal(18,4) NOT NULL ,
    debt_interest decimal(18,4) NOT NULL ,
    return_interest_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_asac_busi_posi_debt_his_1 on tb_tdseac_asac_busi_posi_debt_his (init_date,co_no,pd_no,asset_acco_no,stock_acco_no,stock_code_no,debt_type);

-- 创建数据表：交易证券_账户_资产账户负债明细表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_asac_debtjour;
CREATE TABLE tb_tdseac_asac_debtjour (
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
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    debt_type int NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_fee decimal(18,4) NOT NULL ,
    debt_order_no int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    debt_amt decimal(18,4) NOT NULL ,
    debt_qty decimal(18,2) NOT NULL ,
    debt_fee decimal(18,4) NOT NULL ,
    debt_interest decimal(18,4) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    debt_return_amt decimal(18,4) NOT NULL ,
    debt_return_qty decimal(18,2) NOT NULL ,
    return_interest_amt decimal(18,4) NOT NULL ,
    debt_status int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdseac_asac_debtjour_1 on tb_tdseac_asac_debtjour (co_no,pd_no,asset_acco_no,stock_code_no,debt_status);
create index idx_tb_tdseac_asac_debtjour_2 on tb_tdseac_asac_debtjour (debt_order_no,order_date);
create index idx_tb_tdseac_asac_debtjour_3 on tb_tdseac_asac_debtjour (init_date);

-- 创建数据表：历史_交易证券_账户_资产账户负债明细表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_asac_debtjour_his;
CREATE TABLE tb_tdseac_asac_debtjour_his (
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
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    debt_type int NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_fee decimal(18,4) NOT NULL ,
    debt_order_no int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    debt_amt decimal(18,4) NOT NULL ,
    debt_qty decimal(18,2) NOT NULL ,
    debt_fee decimal(18,4) NOT NULL ,
    debt_interest decimal(18,4) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    debt_return_amt decimal(18,4) NOT NULL ,
    debt_return_qty decimal(18,2) NOT NULL ,
    return_interest_amt decimal(18,4) NOT NULL ,
    debt_status int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdseac_asac_debtjour_his_1 on tb_tdseac_asac_debtjour_his (co_no,pd_no,asset_acco_no,stock_code_no,debt_status);
create index idx_tb_tdseac_asac_debtjour_his_2 on tb_tdseac_asac_debtjour_his (debt_order_no,order_date);
create index idx_tb_tdseac_asac_debtjour_his_3 on tb_tdseac_asac_debtjour_his (init_date);

-- 创建数据表：交易证券_账户_交易组负债明细表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_exgp_debtjour;
CREATE TABLE tb_tdseac_exgp_debtjour (
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
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    debt_type int NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_fee decimal(18,4) NOT NULL ,
    debt_order_no int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    debt_amt decimal(18,4) NOT NULL ,
    debt_qty decimal(18,2) NOT NULL ,
    debt_fee decimal(18,4) NOT NULL ,
    debt_interest decimal(18,4) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    debt_return_amt decimal(18,4) NOT NULL ,
    debt_return_qty decimal(18,2) NOT NULL ,
    return_interest_amt decimal(18,4) NOT NULL ,
    debt_status int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdseac_exgp_debtjour_3 on tb_tdseac_exgp_debtjour (debt_order_no,order_date);
create index idx_tb_tdseac_exgp_debtjour_1 on tb_tdseac_exgp_debtjour (co_no,pd_no,asset_acco_no,exch_group_no,stock_code_no,debt_status);
create index idx_tb_tdseac_exgp_debtjour_2 on tb_tdseac_exgp_debtjour (init_date);

-- 创建数据表：历史_交易证券_账户_交易组负债明细表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_exgp_debtjour_his;
CREATE TABLE tb_tdseac_exgp_debtjour_his (
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
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    debt_type int NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_fee decimal(18,4) NOT NULL ,
    debt_order_no int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    debt_amt decimal(18,4) NOT NULL ,
    debt_qty decimal(18,2) NOT NULL ,
    debt_fee decimal(18,4) NOT NULL ,
    debt_interest decimal(18,4) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    debt_return_amt decimal(18,4) NOT NULL ,
    debt_return_qty decimal(18,2) NOT NULL ,
    return_interest_amt decimal(18,4) NOT NULL ,
    debt_status int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdseac_exgp_debtjour_his_3 on tb_tdseac_exgp_debtjour_his (debt_order_no,order_date);
create index idx_tb_tdseac_exgp_debtjour_his_1 on tb_tdseac_exgp_debtjour_his (co_no,pd_no,asset_acco_no,exch_group_no,stock_code_no,debt_status);
create index idx_tb_tdseac_exgp_debtjour_his_2 on tb_tdseac_exgp_debtjour_his (init_date);

-- 创建数据表：交易证券_账户_交易组组合策略持仓表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_exgp_combo_strategy_posi;
CREATE TABLE tb_tdseac_exgp_combo_strategy_posi (
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
    stock_acco_no int NOT NULL ,
    combo_code varchar(32) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
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
    sum_realize_pandl decimal(18,4) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_exgp_combo_strategy_posi_1 on tb_tdseac_exgp_combo_strategy_posi (co_no,pd_no,exch_group_no,asset_acco_no,stock_acco_no,combo_code,stock_code_no,init_date);
create index idx_tb_tdseac_exgp_combo_strategy_posi_2 on tb_tdseac_exgp_combo_strategy_posi (init_date);

-- 创建数据表：历史_交易证券_账户_交易组组合策略持仓表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_exgp_combo_strategy_posi_his;
CREATE TABLE tb_tdseac_exgp_combo_strategy_posi_his (
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
    stock_acco_no int NOT NULL ,
    combo_code varchar(32) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
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
    sum_realize_pandl decimal(18,4) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_exgp_combo_strategy_posi_his_1 on tb_tdseac_exgp_combo_strategy_posi_his (co_no,pd_no,exch_group_no,asset_acco_no,stock_acco_no,combo_code,stock_code_no,init_date);
create index idx_tb_tdseac_exgp_combo_strategy_posi_his_2 on tb_tdseac_exgp_combo_strategy_posi_his (init_date);

-- 创建数据表：交易证券_账户_资产账户组合策略持仓表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_asac_combo_strategy_posi;
CREATE TABLE tb_tdseac_asac_combo_strategy_posi (
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
    combo_code varchar(32) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
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
    sum_realize_pandl decimal(18,4) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_asac_combo_strategy_posi_1 on tb_tdseac_asac_combo_strategy_posi (co_no,pd_no,asset_acco_no,stock_acco_no,combo_code,stock_code_no,init_date);
create index idx_tb_tdseac_asac_combo_strategy_posi_2 on tb_tdseac_asac_combo_strategy_posi (init_date);

-- 创建数据表：历史_交易证券_账户_资产账户组合策略持仓表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_asac_combo_strategy_posi_his;
CREATE TABLE tb_tdseac_asac_combo_strategy_posi_his (
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
    combo_code varchar(32) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
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
    sum_realize_pandl decimal(18,4) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_asac_combo_strategy_posi_his_1 on tb_tdseac_asac_combo_strategy_posi_his (co_no,pd_no,asset_acco_no,stock_acco_no,combo_code,stock_code_no,init_date);
create index idx_tb_tdseac_asac_combo_strategy_posi_his_2 on tb_tdseac_asac_combo_strategy_posi_his (init_date);

-- 创建数据表：交易证券_账户_交易组组合策略收益表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_exgp_combo_strategy_income;
CREATE TABLE tb_tdseac_exgp_combo_strategy_income (
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
    combo_code varchar(32) NOT NULL ,
    combo_cost decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    sum_realize_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_exgp_combo_strategy_income_1 on tb_tdseac_exgp_combo_strategy_income (co_no,pd_no,asset_acco_no,exch_group_no,combo_code,init_date);
create index idx_tb_tdseac_exgp_combo_strategy_income_2 on tb_tdseac_exgp_combo_strategy_income (init_date);

-- 创建数据表：历史_交易证券_账户_交易组组合策略收益表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_exgp_combo_strategy_income_his;
CREATE TABLE tb_tdseac_exgp_combo_strategy_income_his (
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
    combo_code varchar(32) NOT NULL ,
    combo_cost decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    sum_realize_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_exgp_combo_strategy_income_his_1 on tb_tdseac_exgp_combo_strategy_income_his (co_no,pd_no,asset_acco_no,exch_group_no,combo_code,init_date);
create index idx_tb_tdseac_exgp_combo_strategy_income_his_2 on tb_tdseac_exgp_combo_strategy_income_his (init_date);

-- 创建数据表：交易证券_账户_资产账户组合策略收益表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_asac_combo_strategy_income;
CREATE TABLE tb_tdseac_asac_combo_strategy_income (
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
    combo_code varchar(32) NOT NULL ,
    combo_cost decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    sum_realize_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_asac_combo_strategy_income_1 on tb_tdseac_asac_combo_strategy_income (co_no,pd_no,asset_acco_no,combo_code,init_date);
create index idx_tb_tdseac_asac_combo_strategy_income_2 on tb_tdseac_asac_combo_strategy_income (init_date);

-- 创建数据表：历史_交易证券_账户_资产账户组合策略收益表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_asac_combo_strategy_income_his;
CREATE TABLE tb_tdseac_asac_combo_strategy_income_his (
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
    combo_code varchar(32) NOT NULL ,
    combo_cost decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    sum_realize_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdseac_asac_combo_strategy_income_his_1 on tb_tdseac_asac_combo_strategy_income_his (co_no,pd_no,asset_acco_no,combo_code,init_date);
create index idx_tb_tdseac_asac_combo_strategy_income_his_2 on tb_tdseac_asac_combo_strategy_income_his (init_date);

-- 创建数据表：交易证券_账户_交易组组合策略持仓流水表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_exgp_combo_strategy_posi_jour;
CREATE TABLE tb_tdseac_exgp_combo_strategy_posi_jour (
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
    combo_code varchar(32) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdseac_exgp_combo_strategy_posi_jour_1 on tb_tdseac_exgp_combo_strategy_posi_jour (co_no,pd_no,exch_group_no,asset_acco_no,stock_acco_no,combo_code,stock_code_no);

-- 创建数据表：历史_交易证券_账户_交易组组合策略持仓流水表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_exgp_combo_strategy_posi_jour_his;
CREATE TABLE tb_tdseac_exgp_combo_strategy_posi_jour_his (
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
    combo_code varchar(32) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdseac_exgp_combo_strategy_posi_jour_his_1 on tb_tdseac_exgp_combo_strategy_posi_jour_his (co_no,pd_no,exch_group_no,asset_acco_no,stock_acco_no,combo_code,stock_code_no);

-- 创建数据表：交易证券_账户_资产账户组合策略持仓流水表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdseac_asac_combo_strategy_posi_jour;
CREATE TABLE tb_tdseac_asac_combo_strategy_posi_jour (
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
    combo_code varchar(32) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdseac_asac_combo_strategy_posi_jour_1 on tb_tdseac_asac_combo_strategy_posi_jour (co_no,pd_no,asset_acco_no,stock_acco_no,combo_code,stock_code_no);

-- 创建数据表：历史_交易证券_账户_资产账户组合策略持仓流水表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdseac_asac_combo_strategy_posi_jour_his;
CREATE TABLE tb_tdseac_asac_combo_strategy_posi_jour_his (
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
    combo_code varchar(32) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdseac_asac_combo_strategy_posi_jour_his_1 on tb_tdseac_asac_combo_strategy_posi_jour_his (co_no,pd_no,asset_acco_no,stock_acco_no,combo_code,stock_code_no);
commit;
