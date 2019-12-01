-- /**************************************************************************************/
-- 创建数据库【风控证券】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_rksecu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_rksecu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：风控证券_计算_证券信息表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksecc_secu_stock_info;
CREATE TABLE tb_rksecc_secu_stock_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    exch_no int NOT NULL ,
    asset_type int NOT NULL ,
    stock_type int NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    total_stock_issue decimal(18,2) NOT NULL ,
    circl_stock_capit decimal(18,2) NOT NULL ,
    net_price_flag int NOT NULL ,
    fair_price decimal(16,9) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    today_open_price decimal(16,9) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksecc_secu_stock_info_1 on tb_rksecc_secu_stock_info (stock_code_no);
create index idx_tb_rksecc_secu_stock_info_2 on tb_rksecc_secu_stock_info (stock_code,exch_no);
create index idx_tb_rksecc_secu_stock_info_3 on tb_rksecc_secu_stock_info (exch_no,stock_type);

-- 创建数据表：风控证券_计算_交易组证券业务持仓表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksecc_secu_exgp_posi;
CREATE TABLE tb_rksecc_secu_exgp_posi (
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
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    invest_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    comm_capt_qty decimal(18,2) NOT NULL ,
    comm_releas_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    curr_cost_amt decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    cost_calc_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksecc_secu_exgp_posi_1 on tb_rksecc_secu_exgp_posi (exch_group_no,asset_acco_no,stock_acco_no,stock_code_no,invest_type);
create index idx_tb_rksecc_secu_exgp_posi_2 on tb_rksecc_secu_exgp_posi (co_no,stock_code,exch_no);

-- 创建数据表：风控证券_计算_交易组证券业务资金表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksecc_secu_exgp_capit;
CREATE TABLE tb_rksecc_secu_exgp_capit (
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
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    comm_capt_amt decimal(18,4) NOT NULL ,
    comm_releas_amt decimal(18,4) NOT NULL ,
    trade_capt_amt decimal(18,4) NOT NULL ,
    trade_releas_amt decimal(18,4) NOT NULL ,
    strike_capt_amt decimal(18,4) NOT NULL ,
    strike_releas_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksecc_secu_exgp_capit_1 on tb_rksecc_secu_exgp_capit (exch_group_no,asset_acco_no,exch_crncy_type);
create index idx_tb_rksecc_secu_exgp_capit_2 on tb_rksecc_secu_exgp_capit (co_no,pd_no,exch_crncy_type);
create index idx_tb_rksecc_secu_exgp_capit_3 on tb_rksecc_secu_exgp_capit (co_no,exch_group_no,exch_crncy_type);

-- 创建数据表：风控证券_计算_交易组资产表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksecc_secu_exgp_asset;
CREATE TABLE tb_rksecc_secu_exgp_asset (
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
    begin_asset_value decimal(18,4) NOT NULL ,
    asset_item int NOT NULL ,
    asset_value decimal(18,4) NOT NULL ,
    part_share decimal(18,2) NOT NULL ,
    pd_all_share decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksecc_secu_exgp_asset_1 on tb_rksecc_secu_exgp_asset (exch_group_no,asset_item,crncy_type);
create index idx_tb_rksecc_secu_exgp_asset_2 on tb_rksecc_secu_exgp_asset (pd_no,crncy_type);
create index idx_tb_rksecc_secu_exgp_asset_3 on tb_rksecc_secu_exgp_asset (exch_group_no,crncy_type);

-- 创建数据表：风控证券_计算_订单表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksecc_secu_order;
CREATE TABLE tb_rksecc_secu_order (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    order_id bigint NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    order_dir int NOT NULL ,
    price_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_status varchar(2) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    order_frozen_amt decimal(18,4) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    stock_type int NOT NULL ,
    order_frozen_qty decimal(18,2) NOT NULL ,
    comm_id bigint NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksecc_secu_order_1 on tb_rksecc_secu_order (order_id);
create index idx_tb_rksecc_secu_order_2 on tb_rksecc_secu_order (co_no,exch_no,stock_code_no);
create index idx_tb_rksecc_secu_order_4 on tb_rksecc_secu_order (create_date);

-- 创建数据表：风控证券_计算_指令表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksecc_secu_command;
CREATE TABLE tb_rksecc_secu_command (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    comm_id bigint NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    comm_dir int NOT NULL ,
    comm_limit_price decimal(16,9) NOT NULL ,
    comm_status varchar(2) NOT NULL ,
    comm_frozen_amt decimal(18,4) NOT NULL ,
    stock_type int NOT NULL ,
    comm_frozen_qty decimal(18,2) NOT NULL ,
    limit_actual_price decimal(16,9) NOT NULL ,
    strike_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksecc_secu_command_1 on tb_rksecc_secu_command (comm_id);
create index idx_tb_rksecc_secu_command_2 on tb_rksecc_secu_command (co_no,exch_no,stock_code_no);
create index idx_tb_rksecc_secu_command_4 on tb_rksecc_secu_command (create_date);

-- 创建数据表：风控证券_计算_港股汇率表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksecc_HK_rate;
CREATE TABLE tb_rksecc_HK_rate (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    buy_ref_rate decimal(18,12) NOT NULL ,
    sell_ref_rate decimal(18,12) NOT NULL ,
    settle_buy_rate decimal(18,12) NOT NULL ,
    settle_sell_rate decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksecc_HK_rate_1 on tb_rksecc_HK_rate (exch_no);

-- 创建数据表：风控证券_计算_大宗交易持仓表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksecc_block_trade_posi;
CREATE TABLE tb_rksecc_block_trade_posi (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    posi_id bigint NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    fair_price decimal(16,9) NOT NULL ,
    strike_date int NOT NULL ,
    release_date int NOT NULL ,
    deal_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksecc_block_trade_posi_1 on tb_rksecc_block_trade_posi (posi_id);
create index idx_tb_rksecc_block_trade_posi_2 on tb_rksecc_block_trade_posi (asset_acco_no,exch_group_no,stock_acco_no,stock_code_no,strike_date);
create index idx_tb_rksecc_block_trade_posi_3 on tb_rksecc_block_trade_posi (co_no,stock_code_no,exch_no);
create index idx_tb_rksecc_block_trade_posi_4 on tb_rksecc_block_trade_posi (update_date,update_time);

-- 创建数据表：风控证券_计算_交易组信息表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksecc_exch_group_info;
CREATE TABLE tb_rksecc_exch_group_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    exch_group_code varchar(32) NOT NULL ,
    exch_group_status varchar(2) NOT NULL ,
    default_group_flag int NOT NULL ,
    exch_group_pd_share decimal(18,2) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksecc_exch_group_info_1 on tb_rksecc_exch_group_info (co_no,exch_group_no);
create index idx_tb_rksecc_exch_group_info_2 on tb_rksecc_exch_group_info (exch_group_no);
create index idx_tb_rksecc_exch_group_info_3 on tb_rksecc_exch_group_info (pd_no);
commit;
