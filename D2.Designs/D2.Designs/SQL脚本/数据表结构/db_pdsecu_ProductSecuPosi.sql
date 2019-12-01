-- /**************************************************************************************/
-- 创建数据库【产品证券】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pdsecu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pdsecu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：产品证券_持仓_交易组持仓表
use db_pdsecu;
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
    invest_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    pre_settle_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    posi_qty_check_diff decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_exgp_posi_1 on tb_pdsepo_exgp_posi (exch_group_no,asset_acco_no,stock_acco_no,stock_code_no,invest_type);
create index idx_tb_pdsepo_exgp_posi_2 on tb_pdsepo_exgp_posi (co_no,pd_no,exch_no);
create index idx_tb_pdsepo_exgp_posi_3 on tb_pdsepo_exgp_posi (update_date,update_time);
create index idx_tb_pdsepo_exgp_posi_4 on tb_pdsepo_exgp_posi (stock_code_no);
create index idx_tb_pdsepo_exgp_posi_5 on tb_pdsepo_exgp_posi (asset_acco_no,stock_code_no,invest_type);

-- 创建数据表：产品证券_持仓_历史交易组持仓表
use db_pdsecu_his;
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
    invest_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    pre_settle_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    posi_qty_check_diff decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_exgp_posi_his_1 on tb_pdsepo_exgp_posi_his (init_date,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no,invest_type);
create index idx_tb_pdsepo_exgp_posi_his_2 on tb_pdsepo_exgp_posi_his (init_date,co_no,pd_no,exch_no);

-- 创建数据表：产品证券_持仓_交易组持仓流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_exgp_posi_jour;
CREATE TABLE tb_pdsepo_exgp_posi_jour (
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
    oper_menu_no int NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    occur_end_qty decimal(18,2) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    invest_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_exgp_posi_jour_1 on tb_pdsepo_exgp_posi_jour (init_date,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_pdsepo_exgp_posi_jour_2 on tb_pdsepo_exgp_posi_jour (init_date,co_no,pd_no,exch_no);
create index idx_tb_pdsepo_exgp_posi_jour_3 on tb_pdsepo_exgp_posi_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_产品证券_持仓_交易组持仓流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_exgp_posi_jour_his;
CREATE TABLE tb_pdsepo_exgp_posi_jour_his (
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
    oper_menu_no int NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    occur_end_qty decimal(18,2) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    invest_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_exgp_posi_jour_his_1 on tb_pdsepo_exgp_posi_jour_his (init_date,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_pdsepo_exgp_posi_jour_his_2 on tb_pdsepo_exgp_posi_jour_his (init_date,co_no,pd_no,exch_no);
create index idx_tb_pdsepo_exgp_posi_jour_his_3 on tb_pdsepo_exgp_posi_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：产品证券_持仓_交易组持仓冻结解冻流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_exgp_posi_frozen_jour;
CREATE TABLE tb_pdsepo_exgp_posi_frozen_jour (
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
    oper_menu_no int NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    frozen_type int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    expire_date int NOT NULL ,
    jour_status varchar(2) NOT NULL ,
    asac_frozen_no bigint NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_exgp_posi_frozen_jour_1 on tb_pdsepo_exgp_posi_frozen_jour (init_date,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_pdsepo_exgp_posi_frozen_jour_2 on tb_pdsepo_exgp_posi_frozen_jour (init_date,co_no,pd_no,exch_no);
create index idx_tb_pdsepo_exgp_posi_frozen_jour_3 on tb_pdsepo_exgp_posi_frozen_jour (init_date,opor_co_no,opor_no);
create index idx_tb_pdsepo_exgp_posi_frozen_jour_4 on tb_pdsepo_exgp_posi_frozen_jour (jour_status);
create index idx_tb_pdsepo_exgp_posi_frozen_jour_5 on tb_pdsepo_exgp_posi_frozen_jour (asac_frozen_no);

-- 创建数据表：历史_产品证券_持仓_交易组持仓冻结解冻流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_exgp_posi_frozen_jour_his;
CREATE TABLE tb_pdsepo_exgp_posi_frozen_jour_his (
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
    oper_menu_no int NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    frozen_type int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    expire_date int NOT NULL ,
    jour_status varchar(2) NOT NULL ,
    asac_frozen_no bigint NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_exgp_posi_frozen_jour_his_1 on tb_pdsepo_exgp_posi_frozen_jour_his (init_date,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_pdsepo_exgp_posi_frozen_jour_his_2 on tb_pdsepo_exgp_posi_frozen_jour_his (init_date,co_no,pd_no,exch_no);
create index idx_tb_pdsepo_exgp_posi_frozen_jour_his_3 on tb_pdsepo_exgp_posi_frozen_jour_his (init_date,opor_co_no,opor_no);
create index idx_tb_pdsepo_exgp_posi_frozen_jour_his_4 on tb_pdsepo_exgp_posi_frozen_jour_his (jour_status);
create index idx_tb_pdsepo_exgp_posi_frozen_jour_his_5 on tb_pdsepo_exgp_posi_frozen_jour_his (asac_frozen_no);

-- 创建数据表：产品证券_持仓_交易组持仓入账流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_exgp_posi_entry_jour;
CREATE TABLE tb_pdsepo_exgp_posi_entry_jour (
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
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    impawn_qty decimal(18,2) NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    begin_trade_date int NOT NULL ,
    old_arrive_date int NOT NULL ,
    arrive_date int NOT NULL ,
    order_no int NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_exgp_posi_entry_jour_1 on tb_pdsepo_exgp_posi_entry_jour (init_date);
create index idx_tb_pdsepo_exgp_posi_entry_jour_2 on tb_pdsepo_exgp_posi_entry_jour (begin_trade_date,entry_status);
create index idx_tb_pdsepo_exgp_posi_entry_jour_3 on tb_pdsepo_exgp_posi_entry_jour (exch_no,arrive_date,entry_status);

-- 创建数据表：历史_产品证券_持仓_交易组持仓入账流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_exgp_posi_entry_jour_his;
CREATE TABLE tb_pdsepo_exgp_posi_entry_jour_his (
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
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    impawn_qty decimal(18,2) NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    begin_trade_date int NOT NULL ,
    old_arrive_date int NOT NULL ,
    arrive_date int NOT NULL ,
    order_no int NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_exgp_posi_entry_jour_his_1 on tb_pdsepo_exgp_posi_entry_jour_his (init_date);
create index idx_tb_pdsepo_exgp_posi_entry_jour_his_2 on tb_pdsepo_exgp_posi_entry_jour_his (begin_trade_date,entry_status);
create index idx_tb_pdsepo_exgp_posi_entry_jour_his_3 on tb_pdsepo_exgp_posi_entry_jour_his (exch_no,arrive_date,entry_status);

-- 创建数据表：产品证券_持仓_交易组债券质押表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_exgp_bond_pledge;
CREATE TABLE tb_pdsepo_exgp_bond_pledge (
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
create unique index idx_tb_pdsepo_exgp_bond_pledge_1 on tb_pdsepo_exgp_bond_pledge (exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_pdsepo_exgp_bond_pledge_2 on tb_pdsepo_exgp_bond_pledge (update_date,update_time);

-- 创建数据表：产品证券_持仓_历史交易组债券质押表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_exgp_bond_pledge_his;
CREATE TABLE tb_pdsepo_exgp_bond_pledge_his (
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
create unique index idx_tb_pdsepo_exgp_bond_pledge_his_1 on tb_pdsepo_exgp_bond_pledge_his (init_date,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);

-- 创建数据表：产品证券_持仓_资产账户持仓表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_asac_posi;
CREATE TABLE tb_pdsepo_asac_posi (
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
    invest_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    pre_settle_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    posi_qty_check_diff decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_asac_posi_1 on tb_pdsepo_asac_posi (asset_acco_no,stock_acco_no,stock_code_no,invest_type);
create index idx_tb_pdsepo_asac_posi_2 on tb_pdsepo_asac_posi (co_no,pd_no,exch_no);
create index idx_tb_pdsepo_asac_posi_3 on tb_pdsepo_asac_posi (update_date,update_time);
create index idx_tb_pdsepo_asac_posi_4 on tb_pdsepo_asac_posi (stock_code_no);

-- 创建数据表：产品证券_持仓_历史资产账户持仓表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_asac_posi_his;
CREATE TABLE tb_pdsepo_asac_posi_his (
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
    invest_type int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    pre_settle_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    posi_qty_check_diff decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_asac_posi_his_1 on tb_pdsepo_asac_posi_his (init_date,asset_acco_no,stock_acco_no,stock_code_no,invest_type);
create index idx_tb_pdsepo_asac_posi_his_2 on tb_pdsepo_asac_posi_his (init_date,co_no,pd_no,exch_no);

-- 创建数据表：产品证券_持仓_资产账户持仓流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_asac_posi_jour;
CREATE TABLE tb_pdsepo_asac_posi_jour (
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
    oper_menu_no int NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    occur_end_qty decimal(18,2) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    invest_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_asac_posi_jour_1 on tb_pdsepo_asac_posi_jour (init_date,asset_acco_no,stock_acco_no,stock_code_no,oper_func_code);
create index idx_tb_pdsepo_asac_posi_jour_2 on tb_pdsepo_asac_posi_jour (init_date,co_no,pd_no,exch_no,oper_func_code);
create index idx_tb_pdsepo_asac_posi_jour_3 on tb_pdsepo_asac_posi_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_产品证券_持仓_资产账户持仓流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_asac_posi_jour_his;
CREATE TABLE tb_pdsepo_asac_posi_jour_his (
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
    oper_menu_no int NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    occur_end_qty decimal(18,2) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    invest_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_asac_posi_jour_his_1 on tb_pdsepo_asac_posi_jour_his (init_date,asset_acco_no,stock_acco_no,stock_code_no,oper_func_code);
create index idx_tb_pdsepo_asac_posi_jour_his_2 on tb_pdsepo_asac_posi_jour_his (init_date,co_no,pd_no,exch_no,oper_func_code);
create index idx_tb_pdsepo_asac_posi_jour_his_3 on tb_pdsepo_asac_posi_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：产品证券_持仓_资产账户持仓冻结解冻流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_asac_posi_frozen_jour;
CREATE TABLE tb_pdsepo_asac_posi_frozen_jour (
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
    oper_menu_no int NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    frozen_type int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    expire_date int NOT NULL ,
    jour_status varchar(2) NOT NULL ,
    is_change_exch_group_posi int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_asac_posi_frozen_jour_1 on tb_pdsepo_asac_posi_frozen_jour (init_date,asset_acco_no,stock_acco_no,stock_code_no,oper_func_code);
create index idx_tb_pdsepo_asac_posi_frozen_jour_2 on tb_pdsepo_asac_posi_frozen_jour (init_date,co_no,pd_no,exch_no,oper_func_code);
create index idx_tb_pdsepo_asac_posi_frozen_jour_3 on tb_pdsepo_asac_posi_frozen_jour (init_date,opor_co_no,opor_no);
create index idx_tb_pdsepo_asac_posi_frozen_jour_4 on tb_pdsepo_asac_posi_frozen_jour (jour_status);

-- 创建数据表：历史_产品证券_持仓_资产账户持仓冻结解冻流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_asac_posi_frozen_jour_his;
CREATE TABLE tb_pdsepo_asac_posi_frozen_jour_his (
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
    oper_menu_no int NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    frozen_type int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    expire_date int NOT NULL ,
    jour_status varchar(2) NOT NULL ,
    is_change_exch_group_posi int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_asac_posi_frozen_jour_his_1 on tb_pdsepo_asac_posi_frozen_jour_his (init_date,asset_acco_no,stock_acco_no,stock_code_no,oper_func_code);
create index idx_tb_pdsepo_asac_posi_frozen_jour_his_2 on tb_pdsepo_asac_posi_frozen_jour_his (init_date,co_no,pd_no,exch_no,oper_func_code);
create index idx_tb_pdsepo_asac_posi_frozen_jour_his_3 on tb_pdsepo_asac_posi_frozen_jour_his (init_date,opor_co_no,opor_no);
create index idx_tb_pdsepo_asac_posi_frozen_jour_his_4 on tb_pdsepo_asac_posi_frozen_jour_his (jour_status);

-- 创建数据表：产品证券_持仓_资产账户持仓入账流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_asac_posi_entry_jour;
CREATE TABLE tb_pdsepo_asac_posi_entry_jour (
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
    target_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    begin_trade_date int NOT NULL ,
    old_arrive_date int NOT NULL ,
    arrive_date int NOT NULL ,
    order_no int NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_asac_posi_entry_jour_1 on tb_pdsepo_asac_posi_entry_jour (init_date);
create index idx_tb_pdsepo_asac_posi_entry_jour_2 on tb_pdsepo_asac_posi_entry_jour (begin_trade_date,entry_status);
create index idx_tb_pdsepo_asac_posi_entry_jour_3 on tb_pdsepo_asac_posi_entry_jour (exch_no,arrive_date,entry_status);

-- 创建数据表：历史_产品证券_持仓_资产账户持仓入账流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_asac_posi_entry_jour_his;
CREATE TABLE tb_pdsepo_asac_posi_entry_jour_his (
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
    target_code_no int NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    begin_trade_date int NOT NULL ,
    old_arrive_date int NOT NULL ,
    arrive_date int NOT NULL ,
    order_no int NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_asac_posi_entry_jour_his_1 on tb_pdsepo_asac_posi_entry_jour_his (init_date);
create index idx_tb_pdsepo_asac_posi_entry_jour_his_2 on tb_pdsepo_asac_posi_entry_jour_his (begin_trade_date,entry_status);
create index idx_tb_pdsepo_asac_posi_entry_jour_his_3 on tb_pdsepo_asac_posi_entry_jour_his (exch_no,arrive_date,entry_status);

-- 创建数据表：产品证券_持仓_资产账户债券质押表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_asac_bond_pledge;
CREATE TABLE tb_pdsepo_asac_bond_pledge (
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
create unique index idx_tb_pdsepo_asac_bond_pledge_1 on tb_pdsepo_asac_bond_pledge (asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_pdsepo_asac_bond_pledge_2 on tb_pdsepo_asac_bond_pledge (update_date,update_time);

-- 创建数据表：产品证券_持仓_历史资产账户债券质押表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_asac_bond_pledge_his;
CREATE TABLE tb_pdsepo_asac_bond_pledge_his (
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
create unique index idx_tb_pdsepo_asac_bond_pledge_his_1 on tb_pdsepo_asac_bond_pledge_his (init_date,asset_acco_no,stock_acco_no,stock_code_no);

-- 创建数据表：产品证券_持仓_资产账户债券质押流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_asac_bond_pledge_jour;
CREATE TABLE tb_pdsepo_asac_bond_pledge_jour (
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
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_occur_info varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_asac_bond_pledge_jour_1 on tb_pdsepo_asac_bond_pledge_jour (init_date,asset_acco_no,stock_acco_no,stock_code_no,oper_func_code);
create index idx_tb_pdsepo_asac_bond_pledge_jour_2 on tb_pdsepo_asac_bond_pledge_jour (init_date,co_no,pd_no,exch_no,oper_func_code);
create index idx_tb_pdsepo_asac_bond_pledge_jour_3 on tb_pdsepo_asac_bond_pledge_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_产品证券_持仓_资产账户债券质押流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_asac_bond_pledge_jour_his;
CREATE TABLE tb_pdsepo_asac_bond_pledge_jour_his (
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
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_occur_info varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_asac_bond_pledge_jour_his_1 on tb_pdsepo_asac_bond_pledge_jour_his (init_date,asset_acco_no,stock_acco_no,stock_code_no,oper_func_code);
create index idx_tb_pdsepo_asac_bond_pledge_jour_his_2 on tb_pdsepo_asac_bond_pledge_jour_his (init_date,co_no,pd_no,exch_no,oper_func_code);
create index idx_tb_pdsepo_asac_bond_pledge_jour_his_3 on tb_pdsepo_asac_bond_pledge_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：产品证券_持仓_债券回购表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_bond_repo;
CREATE TABLE tb_pdsepo_bond_repo (
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
create index idx_tb_pdsepo_bond_repo_1 on tb_pdsepo_bond_repo (co_no,pd_no,exch_group_no);
create index idx_tb_pdsepo_bond_repo_2 on tb_pdsepo_bond_repo (repo_status,repo_back_trade_date);
create index idx_tb_pdsepo_bond_repo_3 on tb_pdsepo_bond_repo (update_date,update_time);

-- 创建数据表：产品证券_持仓_历史债券回购表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_bond_repo_his;
CREATE TABLE tb_pdsepo_bond_repo_his (
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
create index idx_tb_pdsepo_bond_repo_his_1 on tb_pdsepo_bond_repo_his (init_date,co_no,pd_no,exch_group_no);
create index idx_tb_pdsepo_bond_repo_his_2 on tb_pdsepo_bond_repo_his (repo_status,repo_back_trade_date);

-- 创建数据表：产品证券_持仓_外部资产账户持仓表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_out_asac_posi;
CREATE TABLE tb_pdsepo_out_asac_posi (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    out_cost_price decimal(16,9) NOT NULL ,
    out_curr_qty decimal(18,2) NOT NULL ,
    out_enable_qty decimal(18,2) NOT NULL ,
    out_frozen_qty decimal(18,2) NOT NULL ,
    out_unfroz_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_out_asac_posi_1 on tb_pdsepo_out_asac_posi (init_date,pass_no,out_acco,exch_no,stock_acco,stock_code);
create index idx_tb_pdsepo_out_asac_posi_2 on tb_pdsepo_out_asac_posi (init_date,co_no,pd_no,asset_acco_no);
create index idx_tb_pdsepo_out_asac_posi_3 on tb_pdsepo_out_asac_posi (update_date,update_time);

-- 创建数据表：历史_产品证券_持仓_外部资产账户持仓表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_out_asac_posi_his;
CREATE TABLE tb_pdsepo_out_asac_posi_his (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    out_cost_price decimal(16,9) NOT NULL ,
    out_curr_qty decimal(18,2) NOT NULL ,
    out_enable_qty decimal(18,2) NOT NULL ,
    out_frozen_qty decimal(18,2) NOT NULL ,
    out_unfroz_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_out_asac_posi_his_1 on tb_pdsepo_out_asac_posi_his (init_date,pass_no,out_acco,exch_no,stock_acco,stock_code);
create index idx_tb_pdsepo_out_asac_posi_his_2 on tb_pdsepo_out_asac_posi_his (init_date,co_no,pd_no,asset_acco_no);
create index idx_tb_pdsepo_out_asac_posi_his_3 on tb_pdsepo_out_asac_posi_his (update_date,update_time);

-- 创建数据表：产品证券_持仓_估值外部资产账户持仓表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_evalu_out_asac_posi;
CREATE TABLE tb_pdsepo_evalu_out_asac_posi (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    out_cost_price decimal(16,9) NOT NULL ,
    out_curr_qty decimal(18,2) NOT NULL ,
    out_enable_qty decimal(18,2) NOT NULL ,
    out_frozen_qty decimal(18,2) NOT NULL ,
    out_unfroz_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_evalu_out_asac_posi_1 on tb_pdsepo_evalu_out_asac_posi (init_date,pass_no,out_acco,exch_no,stock_acco,stock_code);
create index idx_tb_pdsepo_evalu_out_asac_posi_2 on tb_pdsepo_evalu_out_asac_posi (init_date,co_no,pd_no,asset_acco_no);

-- 创建数据表：历史_产品证券_持仓_估值外部资产账户持仓表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_evalu_out_asac_posi_his;
CREATE TABLE tb_pdsepo_evalu_out_asac_posi_his (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    out_cost_price decimal(16,9) NOT NULL ,
    out_curr_qty decimal(18,2) NOT NULL ,
    out_enable_qty decimal(18,2) NOT NULL ,
    out_frozen_qty decimal(18,2) NOT NULL ,
    out_unfroz_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_evalu_out_asac_posi_his_1 on tb_pdsepo_evalu_out_asac_posi_his (init_date,pass_no,out_acco,exch_no,stock_acco,stock_code);
create index idx_tb_pdsepo_evalu_out_asac_posi_his_2 on tb_pdsepo_evalu_out_asac_posi_his (init_date,co_no,pd_no,asset_acco_no);

-- 创建数据表：产品证券_持仓_内外资产账户持仓差异表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_asac_posi_diff;
CREATE TABLE tb_pdsepo_asac_posi_diff (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    out_cost_price decimal(16,9) NOT NULL ,
    acco_curr_qty decimal(18,2) NOT NULL ,
    acco_avail_qty decimal(18,2) NOT NULL ,
    out_curr_qty decimal(18,2) NOT NULL ,
    out_enable_qty decimal(18,2) NOT NULL ,
    acco_curr_qty_diff decimal(18,2) NOT NULL ,
    acco_avail_qty_diff decimal(18,2) NOT NULL ,
    out_impawn_qty decimal(18,2) NOT NULL ,
    deal_flag int NOT NULL ,
    asset_sync_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_asac_posi_diff_1 on tb_pdsepo_asac_posi_diff (init_date,pass_no,out_acco,exch_no,stock_acco,stock_code);
create index idx_tb_pdsepo_asac_posi_diff_2 on tb_pdsepo_asac_posi_diff (init_date,co_no,pd_no,asset_acco_no);

-- 创建数据表：历史_产品证券_持仓_内外资产账户持仓差异表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_asac_posi_diff_his;
CREATE TABLE tb_pdsepo_asac_posi_diff_his (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    out_cost_price decimal(16,9) NOT NULL ,
    acco_curr_qty decimal(18,2) NOT NULL ,
    acco_avail_qty decimal(18,2) NOT NULL ,
    out_curr_qty decimal(18,2) NOT NULL ,
    out_enable_qty decimal(18,2) NOT NULL ,
    acco_curr_qty_diff decimal(18,2) NOT NULL ,
    acco_avail_qty_diff decimal(18,2) NOT NULL ,
    out_impawn_qty decimal(18,2) NOT NULL ,
    deal_flag int NOT NULL ,
    asset_sync_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_asac_posi_diff_his_1 on tb_pdsepo_asac_posi_diff_his (init_date,pass_no,out_acco,exch_no,stock_acco,stock_code);
create index idx_tb_pdsepo_asac_posi_diff_his_2 on tb_pdsepo_asac_posi_diff_his (init_date,co_no,pd_no,asset_acco_no);

-- 创建数据表：产品证券_持仓_内部资产账户持仓核对表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_asac_posi_check;
CREATE TABLE tb_pdsepo_asac_posi_check (
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
    curr_qty decimal(18,2) NOT NULL ,
    avail_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_asac_posi_check_1 on tb_pdsepo_asac_posi_check (init_date,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_pdsepo_asac_posi_check_2 on tb_pdsepo_asac_posi_check (init_date,co_no,pd_no,asset_acco_no);

-- 创建数据表：产品证券_持仓_外部资产账户债券质押表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_out_asac_bond_pledge;
CREATE TABLE tb_pdsepo_out_asac_bond_pledge (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    out_begin_qty decimal(18,2) NOT NULL ,
    out_curr_qty decimal(18,2) NOT NULL ,
    out_enable_qty decimal(18,2) NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_out_asac_bond_pledge_1 on tb_pdsepo_out_asac_bond_pledge (init_date,pass_no,out_acco,exch_no,stock_acco,stock_code);
create index idx_tb_pdsepo_out_asac_bond_pledge_2 on tb_pdsepo_out_asac_bond_pledge (init_date,co_no,pd_no,asset_acco_no);
create index idx_tb_pdsepo_out_asac_bond_pledge_3 on tb_pdsepo_out_asac_bond_pledge (init_date,asset_acco_no,stock_acco_no,stock_code_no);

-- 创建数据表：历史_产品证券_持仓_外部资产账户债券质押表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_out_asac_bond_pledge_his;
CREATE TABLE tb_pdsepo_out_asac_bond_pledge_his (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    out_begin_qty decimal(18,2) NOT NULL ,
    out_curr_qty decimal(18,2) NOT NULL ,
    out_enable_qty decimal(18,2) NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_out_asac_bond_pledge_his_1 on tb_pdsepo_out_asac_bond_pledge_his (init_date,pass_no,out_acco,exch_no,stock_acco,stock_code);
create index idx_tb_pdsepo_out_asac_bond_pledge_his_2 on tb_pdsepo_out_asac_bond_pledge_his (init_date,co_no,pd_no,asset_acco_no);
create index idx_tb_pdsepo_out_asac_bond_pledge_his_3 on tb_pdsepo_out_asac_bond_pledge_his (init_date,asset_acco_no,stock_acco_no,stock_code_no);

-- 创建数据表：产品证券_持仓_内外资产账户债券质押差异表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_asac_bond_pledge_diff;
CREATE TABLE tb_pdsepo_asac_bond_pledge_diff (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    acco_curr_qty decimal(18,2) NOT NULL ,
    acco_avail_qty decimal(18,2) NOT NULL ,
    out_begin_qty decimal(18,2) NOT NULL ,
    out_curr_qty decimal(18,2) NOT NULL ,
    out_enable_qty decimal(18,2) NOT NULL ,
    acco_avail_qty_diff decimal(18,2) NOT NULL ,
    deal_flag int NOT NULL ,
    asset_sync_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_asac_bond_pledge_diff_1 on tb_pdsepo_asac_bond_pledge_diff (init_date,pass_no,out_acco,exch_no,stock_acco,stock_code);
create index idx_tb_pdsepo_asac_bond_pledge_diff_2 on tb_pdsepo_asac_bond_pledge_diff (init_date,co_no,pd_no,asset_acco_no);

-- 创建数据表：历史_产品证券_持仓_内外资产账户债券质押差异表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_asac_bond_pledge_diff_his;
CREATE TABLE tb_pdsepo_asac_bond_pledge_diff_his (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    acco_curr_qty decimal(18,2) NOT NULL ,
    acco_avail_qty decimal(18,2) NOT NULL ,
    out_begin_qty decimal(18,2) NOT NULL ,
    out_curr_qty decimal(18,2) NOT NULL ,
    out_enable_qty decimal(18,2) NOT NULL ,
    acco_avail_qty_diff decimal(18,2) NOT NULL ,
    deal_flag int NOT NULL ,
    asset_sync_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_asac_bond_pledge_diff_his_1 on tb_pdsepo_asac_bond_pledge_diff_his (init_date,pass_no,out_acco,exch_no,stock_acco,stock_code);
create index idx_tb_pdsepo_asac_bond_pledge_diff_his_2 on tb_pdsepo_asac_bond_pledge_diff_his (init_date,co_no,pd_no,asset_acco_no);

-- 创建数据表：产品证券_持仓_内部资产账户债券质押核对表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_asac_bond_pledge_check;
CREATE TABLE tb_pdsepo_asac_bond_pledge_check (
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
    curr_qty decimal(18,2) NOT NULL ,
    avail_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_asac_bond_pledge_check_1 on tb_pdsepo_asac_bond_pledge_check (init_date,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_pdsepo_asac_bond_pledge_check_2 on tb_pdsepo_asac_bond_pledge_check (init_date,co_no,pd_no,asset_acco_no);

-- 创建数据表：历史_产品证券_持仓_内部资产账户债券质押核对表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_asac_bond_pledge_check_his;
CREATE TABLE tb_pdsepo_asac_bond_pledge_check_his (
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
    curr_qty decimal(18,2) NOT NULL ,
    avail_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_asac_bond_pledge_check_his_1 on tb_pdsepo_asac_bond_pledge_check_his (init_date,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_pdsepo_asac_bond_pledge_check_his_2 on tb_pdsepo_asac_bond_pledge_check_his (init_date,co_no,pd_no,asset_acco_no);

-- 创建数据表：产品证券_持仓_外部新股申购上限表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_out_new_stock_limit;
CREATE TABLE tb_pdsepo_out_new_stock_limit (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    apply_limit decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_out_new_stock_limit_1 on tb_pdsepo_out_new_stock_limit (init_date,out_acco,pass_no,exch_no,stock_acco);
create index idx_tb_pdsepo_out_new_stock_limit_2 on tb_pdsepo_out_new_stock_limit (init_date,co_no,asset_acco_no,exch_no,stock_acco);

-- 创建数据表：历史_产品证券_持仓_外部新股申购上限表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_out_new_stock_limit_his;
CREATE TABLE tb_pdsepo_out_new_stock_limit_his (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    apply_limit decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_out_new_stock_limit_his_1 on tb_pdsepo_out_new_stock_limit_his (init_date,out_acco,pass_no,exch_no,stock_acco);
create index idx_tb_pdsepo_out_new_stock_limit_his_2 on tb_pdsepo_out_new_stock_limit_his (init_date,co_no,asset_acco_no,exch_no,stock_acco);

-- 创建数据表：产品证券_持仓_新股申购上限表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_new_stock_limit;
CREATE TABLE tb_pdsepo_new_stock_limit (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    apply_limit decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_new_stock_limit_1 on tb_pdsepo_new_stock_limit (init_date,out_acco,pass_no,exch_no,stock_acco);
create index idx_tb_pdsepo_new_stock_limit_2 on tb_pdsepo_new_stock_limit (init_date,co_no,asset_acco_no,exch_no,stock_acco);

-- 创建数据表：历史_产品证券_持仓_新股申购上限表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_new_stock_limit_his;
CREATE TABLE tb_pdsepo_new_stock_limit_his (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    apply_limit decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_new_stock_limit_his_1 on tb_pdsepo_new_stock_limit_his (init_date,out_acco,pass_no,exch_no,stock_acco);
create index idx_tb_pdsepo_new_stock_limit_his_2 on tb_pdsepo_new_stock_limit_his (init_date,co_no,asset_acco_no,exch_no,stock_acco);

-- 创建数据表：产品证券_持仓_外部持仓流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_out_posi_jour;
CREATE TABLE tb_pdsepo_out_posi_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    pass_stock_jour_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    busi_flag int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    entry_qty decimal(18,2) NOT NULL ,
    entry_end_qty decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_out_posi_jour_1 on tb_pdsepo_out_posi_jour (pass_no,out_acco,init_date,pass_stock_jour_no);

-- 创建数据表：历史_产品证券_持仓_外部持仓流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_out_posi_jour_his;
CREATE TABLE tb_pdsepo_out_posi_jour_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    pass_stock_jour_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    busi_flag int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    entry_qty decimal(18,2) NOT NULL ,
    entry_end_qty decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_out_posi_jour_his_1 on tb_pdsepo_out_posi_jour_his (pass_no,out_acco,init_date,pass_stock_jour_no);

-- 创建数据表：产品证券_持仓_外部订单表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_out_order;
CREATE TABLE tb_pdsepo_out_order (
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
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_out_order_1 on tb_pdsepo_out_order (pass_no,out_acco,report_date,report_no);

-- 创建数据表：历史_产品证券_持仓_外部订单表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_out_order_his;
CREATE TABLE tb_pdsepo_out_order_his (
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
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_out_order_his_1 on tb_pdsepo_out_order_his (pass_no,out_acco,report_date,report_no);

-- 创建数据表：产品证券_持仓_外部成交表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_out_busi;
CREATE TABLE tb_pdsepo_out_busi (
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
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    order_dir int NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_out_busi_1 on tb_pdsepo_out_busi (pass_no,out_acco,exch_no,strike_date,strike_no,order_dir);

-- 创建数据表：历史_产品证券_持仓_外部成交表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_out_busi_his;
CREATE TABLE tb_pdsepo_out_busi_his (
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
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    order_dir int NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_out_busi_his_1 on tb_pdsepo_out_busi_his (pass_no,out_acco,exch_no,strike_date,strike_no,order_dir);

-- 创建数据表：产品证券_持仓_外部新股中签表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_out_new_shares;
CREATE TABLE tb_pdsepo_out_new_shares (
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
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    order_dir int NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_out_new_shares_1 on tb_pdsepo_out_new_shares (pass_no,out_acco,exch_no,stock_acco,stock_code);

-- 创建数据表：历史_产品证券_持仓_外部新股中签表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_out_new_shares_his;
CREATE TABLE tb_pdsepo_out_new_shares_his (
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
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    order_dir int NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_out_new_shares_his_1 on tb_pdsepo_out_new_shares_his (pass_no,out_acco,exch_no,stock_acco,stock_code);

-- 创建数据表：产品证券_持仓_外部交割流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_out_deli_jour;
CREATE TABLE tb_pdsepo_out_deli_jour (
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
create index idx_tb_pdsepo_out_deli_jour_1 on tb_pdsepo_out_deli_jour (pass_no,out_acco,init_date,pass_deli_jour_no);

-- 创建数据表：历史_产品证券_持仓_外部交割流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_out_deli_jour_his;
CREATE TABLE tb_pdsepo_out_deli_jour_his (
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
create index idx_tb_pdsepo_out_deli_jour_his_1 on tb_pdsepo_out_deli_jour_his (pass_no,out_acco,init_date,pass_deli_jour_no);

-- 创建数据表：产品证券_持仓_对账表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_deli_jour;
CREATE TABLE tb_pdsepo_deli_jour (
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
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_no int NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_num int NOT NULL ,
    entry_qty decimal(18,2) NOT NULL ,
    entry_amt decimal(18,4) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
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
    deli_status varchar(2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_deli_jour_1 on tb_pdsepo_deli_jour (init_date,co_no,pd_no,exch_group_no,asset_acco_no);

-- 创建数据表：历史_产品证券_持仓_对账表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_deli_jour_his;
CREATE TABLE tb_pdsepo_deli_jour_his (
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
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_no int NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_num int NOT NULL ,
    entry_qty decimal(18,2) NOT NULL ,
    entry_amt decimal(18,4) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    intrst_cost_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_pandl decimal(18,4) NOT NULL ,
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
    deli_status varchar(2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_deli_jour_his_1 on tb_pdsepo_deli_jour_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no);

-- 创建数据表：产品证券_持仓_持仓统计表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_posi_total;
CREATE TABLE tb_pdsepo_posi_total (
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
    record_count int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_posi_total_1 on tb_pdsepo_posi_total (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_pdsepo_posi_total_2 on tb_pdsepo_posi_total (init_date,exch_no,stock_acco_no,stock_code_no);

-- 创建数据表：历史_产品证券_持仓_持仓统计表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_posi_total_his;
CREATE TABLE tb_pdsepo_posi_total_his (
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
    record_count int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_posi_total_his_1 on tb_pdsepo_posi_total_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_pdsepo_posi_total_his_2 on tb_pdsepo_posi_total_his (init_date,exch_no,stock_acco_no,stock_code_no);

-- 创建数据表：产品证券_持仓_证券代码信息行情汇率表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_stock_code_info_quot_rate;
CREATE TABLE tb_pdsepo_stock_code_info_quot_rate (
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
    last_price decimal(16,9) NOT NULL ,
    fair_price decimal(16,9) NOT NULL ,
    net_price_flag int NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    settle_buy_rate decimal(18,12) NOT NULL ,
    settle_sell_rate decimal(18,12) NOT NULL ,
    pboc_rate decimal(18,12) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_stock_code_info_quot_rate_1 on tb_pdsepo_stock_code_info_quot_rate (stock_code_no);
create index idx_tb_pdsepo_stock_code_info_quot_rate_2 on tb_pdsepo_stock_code_info_quot_rate (exch_no,stock_code_no,asset_type);

-- 创建数据表：产品证券_持仓_债券质押比例表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_bond_impawn_ratio;
CREATE TABLE tb_pdsepo_bond_impawn_ratio (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_bond_impawn_ratio_1 on tb_pdsepo_bond_impawn_ratio (exch_no,stock_code_no);

-- 创建数据表：产品证券_持仓_交易资产账户持仓表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_trd_asac_posi;
CREATE TABLE tb_pdsepo_trd_asac_posi (
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
    posi_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_trd_asac_posi_1 on tb_pdsepo_trd_asac_posi (asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_pdsepo_trd_asac_posi_2 on tb_pdsepo_trd_asac_posi (co_no,pd_no);

-- 创建数据表：产品证券_持仓_历史交易资产账户持仓表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_trd_asac_posi_his;
CREATE TABLE tb_pdsepo_trd_asac_posi_his (
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
    posi_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_trd_asac_posi_his_1 on tb_pdsepo_trd_asac_posi_his (init_date,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_pdsepo_trd_asac_posi_his_2 on tb_pdsepo_trd_asac_posi_his (init_date,co_no,pd_no);

-- 创建数据表：产品证券_持仓_交易库交易组持仓表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_trd_exgp_posi;
CREATE TABLE tb_pdsepo_trd_exgp_posi (
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
    posi_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_trd_exgp_posi_1 on tb_pdsepo_trd_exgp_posi (exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_pdsepo_trd_exgp_posi_2 on tb_pdsepo_trd_exgp_posi (co_no,pd_no);

-- 创建数据表：产品证券_持仓_历史交易库交易组持仓表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_trd_exgp_posi_his;
CREATE TABLE tb_pdsepo_trd_exgp_posi_his (
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
    posi_qty decimal(18,2) NOT NULL ,
    cost_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_trd_exgp_posi_his_1 on tb_pdsepo_trd_exgp_posi_his (init_date,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_pdsepo_trd_exgp_posi_his_2 on tb_pdsepo_trd_exgp_posi_his (init_date,co_no,pd_no);

-- 创建数据表：产品证券_持仓_交易库交易组债券质押表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_trd_exgp_bond_pledge;
CREATE TABLE tb_pdsepo_trd_exgp_bond_pledge (
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
    posi_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_trd_exgp_bond_pledge_1 on tb_pdsepo_trd_exgp_bond_pledge (exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);

-- 创建数据表：产品证券_持仓_交易库资产账户债券质押表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_trd_asac_bond_pledge;
CREATE TABLE tb_pdsepo_trd_asac_bond_pledge (
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
    posi_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_trd_asac_bond_pledge_1 on tb_pdsepo_trd_asac_bond_pledge (asset_acco_no,stock_acco_no,stock_code_no);

-- 创建数据表：产品证券_持仓_历史交易库交易组债券质押表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_trd_exgp_bond_pledge_his;
CREATE TABLE tb_pdsepo_trd_exgp_bond_pledge_his (
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
    posi_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_trd_exgp_bond_pledge_his_1 on tb_pdsepo_trd_exgp_bond_pledge_his (init_date,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_pdsepo_trd_exgp_bond_pledge_his_2 on tb_pdsepo_trd_exgp_bond_pledge_his (init_date,co_no,pd_no);

-- 创建数据表：产品证券_持仓_历史交易库资产账户债券质押表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_trd_asac_bond_pledge_his;
CREATE TABLE tb_pdsepo_trd_asac_bond_pledge_his (
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
    posi_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_trd_asac_bond_pledge_his_1 on tb_pdsepo_trd_asac_bond_pledge_his (init_date,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_pdsepo_trd_asac_bond_pledge_his_2 on tb_pdsepo_trd_asac_bond_pledge_his (init_date,co_no,pd_no);

-- 创建数据表：产品证券_持仓_大宗交易持仓表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_block_trade_posi;
CREATE TABLE tb_pdsepo_block_trade_posi (
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
create unique index idx_tb_pdsepo_block_trade_posi_1 on tb_pdsepo_block_trade_posi (posi_id);
create index idx_tb_pdsepo_block_trade_posi_2 on tb_pdsepo_block_trade_posi (asset_acco_no,exch_group_no,stock_acco_no,stock_code_no,strike_date);
create index idx_tb_pdsepo_block_trade_posi_3 on tb_pdsepo_block_trade_posi (co_no,pd_no,exch_no);
create index idx_tb_pdsepo_block_trade_posi_4 on tb_pdsepo_block_trade_posi (update_date,update_time);

-- 创建数据表：产品证券_持仓_大宗交易持仓流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_block_trade_posi_jour;
CREATE TABLE tb_pdsepo_block_trade_posi_jour (
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
    oper_menu_no int NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    occur_end_qty decimal(18,2) NOT NULL ,
    occur_price decimal(16,9) NOT NULL ,
    occur_end_price decimal(16,9) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_block_trade_posi_jour_1 on tb_pdsepo_block_trade_posi_jour (init_date,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_pdsepo_block_trade_posi_jour_2 on tb_pdsepo_block_trade_posi_jour (init_date,co_no,pd_no,exch_no);
create index idx_tb_pdsepo_block_trade_posi_jour_3 on tb_pdsepo_block_trade_posi_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_产品证券_持仓_大宗交易持仓流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_block_trade_posi_jour_his;
CREATE TABLE tb_pdsepo_block_trade_posi_jour_his (
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
    oper_menu_no int NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    occur_end_qty decimal(18,2) NOT NULL ,
    occur_price decimal(16,9) NOT NULL ,
    occur_end_price decimal(16,9) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_block_trade_posi_jour_his_1 on tb_pdsepo_block_trade_posi_jour_his (init_date,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_pdsepo_block_trade_posi_jour_his_2 on tb_pdsepo_block_trade_posi_jour_his (init_date,co_no,pd_no,exch_no);
create index idx_tb_pdsepo_block_trade_posi_jour_his_3 on tb_pdsepo_block_trade_posi_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：产品证券_持仓_历史大宗交易持仓表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_block_trade_posi_his;
CREATE TABLE tb_pdsepo_block_trade_posi_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
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
create unique index idx_tb_pdsepo_block_trade_posi_his_1 on tb_pdsepo_block_trade_posi_his (init_date,posi_id);
create index idx_tb_pdsepo_block_trade_posi_his_2 on tb_pdsepo_block_trade_posi_his (init_date,asset_acco_no,exch_group_no,stock_acco_no,stock_code_no,strike_date);
create index idx_tb_pdsepo_block_trade_posi_his_3 on tb_pdsepo_block_trade_posi_his (init_date,co_no,pd_no,exch_no);

-- 创建数据表：产品证券_持仓_场外基金代码映射表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_off_side_fund_code_mapping;
CREATE TABLE tb_pdsepo_off_side_fund_code_mapping (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    link_row_id bigint NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_off_side_fund_code_mapping_1 on tb_pdsepo_off_side_fund_code_mapping (stock_code);
create index idx_tb_pdsepo_off_side_fund_code_mapping_2 on tb_pdsepo_off_side_fund_code_mapping (link_row_id);

-- 创建数据表：产品证券_持仓_场外基金资产账户持仓表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_off_side_fund_asac_posi;
CREATE TABLE tb_pdsepo_off_side_fund_asac_posi (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    out_cost_price decimal(16,9) NOT NULL ,
    out_curr_qty decimal(18,2) NOT NULL ,
    out_enable_qty decimal(18,2) NOT NULL ,
    out_frozen_qty decimal(18,2) NOT NULL ,
    out_unfroz_qty decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsepo_off_side_fund_asac_posi_1 on tb_pdsepo_off_side_fund_asac_posi (out_acco,exch_no,stock_code);
create index idx_tb_pdsepo_off_side_fund_asac_posi_2 on tb_pdsepo_off_side_fund_asac_posi (exch_no);

-- 创建数据表：产品证券_持仓_科创板外部新股申购上限表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_kcb_out_new_stock_limit;
CREATE TABLE tb_pdsepo_kcb_out_new_stock_limit (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    apply_limit decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_kcb_out_new_stock_limit_1 on tb_pdsepo_kcb_out_new_stock_limit (init_date,out_acco,pass_no,exch_no,stock_acco);
create index idx_tb_pdsepo_kcb_out_new_stock_limit_2 on tb_pdsepo_kcb_out_new_stock_limit (init_date,co_no,asset_acco_no,exch_no,stock_acco);

-- 创建数据表：历史_产品证券_持仓_科创板外部新股申购上限表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_kcb_out_new_stock_limit_his;
CREATE TABLE tb_pdsepo_kcb_out_new_stock_limit_his (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    apply_limit decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_kcb_out_new_stock_limit_his_1 on tb_pdsepo_kcb_out_new_stock_limit_his (init_date,out_acco,pass_no,exch_no,stock_acco);
create index idx_tb_pdsepo_kcb_out_new_stock_limit_his_2 on tb_pdsepo_kcb_out_new_stock_limit_his (init_date,co_no,asset_acco_no,exch_no,stock_acco);

-- 创建数据表：产品证券_持仓_科创板新股申购上限表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsepo_kcb_new_stock_limit;
CREATE TABLE tb_pdsepo_kcb_new_stock_limit (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    apply_limit decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_kcb_new_stock_limit_1 on tb_pdsepo_kcb_new_stock_limit (init_date,out_acco,pass_no,exch_no,stock_acco);
create index idx_tb_pdsepo_kcb_new_stock_limit_2 on tb_pdsepo_kcb_new_stock_limit (init_date,co_no,asset_acco_no,exch_no,stock_acco);

-- 创建数据表：历史_产品证券_持仓_科创板新股申购上限表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsepo_kcb_new_stock_limit_his;
CREATE TABLE tb_pdsepo_kcb_new_stock_limit_his (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    apply_limit decimal(18,2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsepo_kcb_new_stock_limit_his_1 on tb_pdsepo_kcb_new_stock_limit_his (init_date,out_acco,pass_no,exch_no,stock_acco);
create index idx_tb_pdsepo_kcb_new_stock_limit_his_2 on tb_pdsepo_kcb_new_stock_limit_his (init_date,co_no,asset_acco_no,exch_no,stock_acco);
commit;
