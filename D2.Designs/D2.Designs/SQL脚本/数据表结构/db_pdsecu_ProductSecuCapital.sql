-- /**************************************************************************************/
-- 创建数据库【产品证券】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pdsecu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pdsecu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：产品证券_资金_交易组资金表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_exgp_capit;
CREATE TABLE tb_pdseca_exgp_capit (
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
    pre_settle_amt decimal(18,4) NOT NULL ,
    shsz_avail_change_amt decimal(18,4) NOT NULL ,
    hk_avail_change_amt decimal(18,4) NOT NULL ,
    amt_check_diff decimal(18,4) NOT NULL ,
    T_hk_buy_total_amt decimal(18,4) NOT NULL ,
    T_hk_sell_total_amt decimal(18,4) NOT NULL ,
    T1_hk_buy_total_amt decimal(18,4) NOT NULL ,
    T1_hk_sell_total_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    total_change_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_rate decimal(18,12) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_exgp_capit_1 on tb_pdseca_exgp_capit (exch_group_no,asset_acco_no,crncy_type);
create index idx_tb_pdseca_exgp_capit_2 on tb_pdseca_exgp_capit (co_no,pd_no,crncy_type);
create index idx_tb_pdseca_exgp_capit_3 on tb_pdseca_exgp_capit (asset_acco_no,crncy_type);
create index idx_tb_pdseca_exgp_capit_4 on tb_pdseca_exgp_capit (update_date,update_time);

-- 创建数据表：产品证券_资金_历史交易组资金表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_exgp_capit_his;
CREATE TABLE tb_pdseca_exgp_capit_his (
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
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    pre_settle_amt decimal(18,4) NOT NULL ,
    shsz_avail_change_amt decimal(18,4) NOT NULL ,
    hk_avail_change_amt decimal(18,4) NOT NULL ,
    amt_check_diff decimal(18,4) NOT NULL ,
    T_hk_buy_total_amt decimal(18,4) NOT NULL ,
    T_hk_sell_total_amt decimal(18,4) NOT NULL ,
    T1_hk_buy_total_amt decimal(18,4) NOT NULL ,
    T1_hk_sell_total_amt decimal(18,4) NOT NULL ,
    total_change_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_rate decimal(18,12) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_exgp_capit_his_1 on tb_pdseca_exgp_capit_his (init_date,asset_acco_no,exch_group_no,crncy_type);
create index idx_tb_pdseca_exgp_capit_his_2 on tb_pdseca_exgp_capit_his (init_date,co_no,pd_no,crncy_type);

-- 创建数据表：产品证券_资金_交易组资金流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_exgp_capit_jour;
CREATE TABLE tb_pdseca_exgp_capit_jour (
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
    exch_group_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    busi_flag int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    occur_end_amt decimal(18,4) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdseca_exgp_capit_jour_1 on tb_pdseca_exgp_capit_jour (init_date,exch_group_no,crncy_type,oper_func_code);
create index idx_tb_pdseca_exgp_capit_jour_2 on tb_pdseca_exgp_capit_jour (init_date,co_no,pd_no,crncy_type,oper_func_code);

-- 创建数据表：历史_产品证券_资金_交易组资金流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_exgp_capit_jour_his;
CREATE TABLE tb_pdseca_exgp_capit_jour_his (
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
    exch_group_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    busi_flag int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    occur_end_amt decimal(18,4) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdseca_exgp_capit_jour_his_1 on tb_pdseca_exgp_capit_jour_his (init_date,exch_group_no,crncy_type,oper_func_code);
create index idx_tb_pdseca_exgp_capit_jour_his_2 on tb_pdseca_exgp_capit_jour_his (init_date,co_no,pd_no,crncy_type,oper_func_code);

-- 创建数据表：产品证券_资金_交易组资金冻结解冻流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_exgp_capit_frozen_jour;
CREATE TABLE tb_pdseca_exgp_capit_frozen_jour (
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
    exch_group_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    frozen_type int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    expire_date int NOT NULL ,
    jour_status varchar(2) NOT NULL ,
    asac_frozen_no bigint NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdseca_exgp_capit_frozen_jour_1 on tb_pdseca_exgp_capit_frozen_jour (init_date,asset_acco_no,exch_group_no,crncy_type,oper_func_code);
create index idx_tb_pdseca_exgp_capit_frozen_jour_2 on tb_pdseca_exgp_capit_frozen_jour (init_date,co_no,pd_no,crncy_type,oper_func_code);
create index idx_tb_pdseca_exgp_capit_frozen_jour_3 on tb_pdseca_exgp_capit_frozen_jour (asac_frozen_no);

-- 创建数据表：历史_产品证券_资金_交易组资金冻结解冻流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_exgp_capit_frozen_jour_his;
CREATE TABLE tb_pdseca_exgp_capit_frozen_jour_his (
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
    exch_group_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    frozen_type int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    expire_date int NOT NULL ,
    jour_status varchar(2) NOT NULL ,
    asac_frozen_no bigint NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdseca_exgp_capit_frozen_jour_his_1 on tb_pdseca_exgp_capit_frozen_jour_his (init_date,asset_acco_no,exch_group_no,crncy_type,oper_func_code);
create index idx_tb_pdseca_exgp_capit_frozen_jour_his_2 on tb_pdseca_exgp_capit_frozen_jour_his (init_date,co_no,pd_no,crncy_type,oper_func_code);
create index idx_tb_pdseca_exgp_capit_frozen_jour_his_3 on tb_pdseca_exgp_capit_frozen_jour_his (asac_frozen_no);

-- 创建数据表：产品证券_资金_交易组资产表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_exgp_asset;
CREATE TABLE tb_pdseca_exgp_asset (
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
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    hk_thrgh_stock_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_exgp_asset_1 on tb_pdseca_exgp_asset (exch_group_no,crncy_type);

-- 创建数据表：产品证券_资金_历史交易组资产表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_exgp_asset_his;
CREATE TABLE tb_pdseca_exgp_asset_his (
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
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    hk_thrgh_stock_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_exgp_asset_his_1 on tb_pdseca_exgp_asset_his (init_date,exch_group_no,crncy_type);

-- 创建数据表：产品证券_资金_资产账户资金表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_asac_capit;
CREATE TABLE tb_pdseca_asac_capit (
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
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    pre_settle_amt decimal(18,4) NOT NULL ,
    shsz_avail_change_amt decimal(18,4) NOT NULL ,
    hk_avail_change_amt decimal(18,4) NOT NULL ,
    amt_check_diff decimal(18,4) NOT NULL ,
    T_hk_buy_total_amt decimal(18,4) NOT NULL ,
    T_hk_sell_total_amt decimal(18,4) NOT NULL ,
    T1_hk_buy_total_amt decimal(18,4) NOT NULL ,
    T1_hk_sell_total_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    total_change_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_rate decimal(18,12) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_asac_capit_1 on tb_pdseca_asac_capit (asset_acco_no,crncy_type);
create index idx_tb_pdseca_asac_capit_2 on tb_pdseca_asac_capit (co_no,pd_no,crncy_type);
create index idx_tb_pdseca_asac_capit_3 on tb_pdseca_asac_capit (update_date,update_time);

-- 创建数据表：产品证券_资金_历史资产账户资金表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_asac_capit_his;
CREATE TABLE tb_pdseca_asac_capit_his (
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
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    pre_settle_amt decimal(18,4) NOT NULL ,
    shsz_avail_change_amt decimal(18,4) NOT NULL ,
    hk_avail_change_amt decimal(18,4) NOT NULL ,
    amt_check_diff decimal(18,4) NOT NULL ,
    T_hk_buy_total_amt decimal(18,4) NOT NULL ,
    T_hk_sell_total_amt decimal(18,4) NOT NULL ,
    T1_hk_buy_total_amt decimal(18,4) NOT NULL ,
    T1_hk_sell_total_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    total_change_amt decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    intrst_rate decimal(18,12) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_asac_capit_his_1 on tb_pdseca_asac_capit_his (init_date,asset_acco_no,crncy_type);
create index idx_tb_pdseca_asac_capit_his_2 on tb_pdseca_asac_capit_his (init_date,co_no,pd_no,crncy_type);

-- 创建数据表：产品证券_资金_资产账户资金流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_asac_capit_jour;
CREATE TABLE tb_pdseca_asac_capit_jour (
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
    crncy_type varchar(3) NOT NULL ,
    busi_flag int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    occur_end_amt decimal(18,4) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdseca_asac_capit_jour_1 on tb_pdseca_asac_capit_jour (init_date,asset_acco_no,crncy_type,oper_func_code);
create index idx_tb_pdseca_asac_capit_jour_2 on tb_pdseca_asac_capit_jour (init_date,co_no,pd_no,crncy_type,oper_func_code);

-- 创建数据表：历史_产品证券_资金_资产账户资金流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_asac_capit_jour_his;
CREATE TABLE tb_pdseca_asac_capit_jour_his (
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
    crncy_type varchar(3) NOT NULL ,
    busi_flag int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    occur_end_amt decimal(18,4) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdseca_asac_capit_jour_his_1 on tb_pdseca_asac_capit_jour_his (init_date,asset_acco_no,crncy_type,oper_func_code);
create index idx_tb_pdseca_asac_capit_jour_his_2 on tb_pdseca_asac_capit_jour_his (init_date,co_no,pd_no,crncy_type,oper_func_code);

-- 创建数据表：产品证券_资金_资产账户资金冻结解冻流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_asac_capit_frozen_jour;
CREATE TABLE tb_pdseca_asac_capit_frozen_jour (
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
    crncy_type varchar(3) NOT NULL ,
    frozen_type int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    expire_date int NOT NULL ,
    jour_status varchar(2) NOT NULL ,
    is_change_exch_group_capital int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdseca_asac_capit_frozen_jour_1 on tb_pdseca_asac_capit_frozen_jour (init_date,asset_acco_no,crncy_type,oper_func_code);
create index idx_tb_pdseca_asac_capit_frozen_jour_2 on tb_pdseca_asac_capit_frozen_jour (init_date,co_no,pd_no,crncy_type,oper_func_code);

-- 创建数据表：历史_产品证券_资金_资产账户资金冻结解冻流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_asac_capit_frozen_jour_his;
CREATE TABLE tb_pdseca_asac_capit_frozen_jour_his (
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
    crncy_type varchar(3) NOT NULL ,
    frozen_type int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    expire_date int NOT NULL ,
    jour_status varchar(2) NOT NULL ,
    is_change_exch_group_capital int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdseca_asac_capit_frozen_jour_his_1 on tb_pdseca_asac_capit_frozen_jour_his (init_date,asset_acco_no,crncy_type,oper_func_code);
create index idx_tb_pdseca_asac_capit_frozen_jour_his_2 on tb_pdseca_asac_capit_frozen_jour_his (init_date,co_no,pd_no,crncy_type,oper_func_code);

-- 创建数据表：产品证券_资金_资产账户资产表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_asac_asset;
CREATE TABLE tb_pdseca_asac_asset (
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
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_asac_asset_1 on tb_pdseca_asac_asset (asset_acco_no,crncy_type);

-- 创建数据表：产品证券_资金_历史资产账户资产表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_asac_asset_his;
CREATE TABLE tb_pdseca_asac_asset_his (
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
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_asac_asset_his_1 on tb_pdseca_asac_asset_his (init_date,asset_acco_no,crncy_type);

-- 创建数据表：产品证券_资金_外部资产账户资金表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_out_asac_capit;
CREATE TABLE tb_pdseca_out_asac_capit (
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
    crncy_type varchar(3) NOT NULL ,
    out_curr_amt decimal(18,4) NOT NULL ,
    out_enable_amt decimal(18,4) NOT NULL ,
    out_frozen_amt decimal(18,4) NOT NULL ,
    out_unfroz_amt decimal(18,4) NOT NULL ,
    out_total_payab_amt decimal(18,4) NOT NULL ,
    out_total_rece_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_out_asac_capit_1 on tb_pdseca_out_asac_capit (init_date,pass_no,out_acco,crncy_type);
create index idx_tb_pdseca_out_asac_capit_2 on tb_pdseca_out_asac_capit (init_date,co_no,pd_no,asset_acco_no,crncy_type);
create index idx_tb_pdseca_out_asac_capit_3 on tb_pdseca_out_asac_capit (update_date,update_time);

-- 创建数据表：历史_产品证券_资金_外部资产账户资金表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_out_asac_capit_his;
CREATE TABLE tb_pdseca_out_asac_capit_his (
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
    crncy_type varchar(3) NOT NULL ,
    out_curr_amt decimal(18,4) NOT NULL ,
    out_enable_amt decimal(18,4) NOT NULL ,
    out_frozen_amt decimal(18,4) NOT NULL ,
    out_unfroz_amt decimal(18,4) NOT NULL ,
    out_total_payab_amt decimal(18,4) NOT NULL ,
    out_total_rece_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_out_asac_capit_his_1 on tb_pdseca_out_asac_capit_his (init_date,pass_no,out_acco,crncy_type);
create index idx_tb_pdseca_out_asac_capit_his_2 on tb_pdseca_out_asac_capit_his (init_date,co_no,pd_no,asset_acco_no,crncy_type);
create index idx_tb_pdseca_out_asac_capit_his_3 on tb_pdseca_out_asac_capit_his (update_date,update_time);

-- 创建数据表：产品证券_资金_内外资产账户资金差异表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_asac_capit_diff;
CREATE TABLE tb_pdseca_asac_capit_diff (
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
    crncy_type varchar(3) NOT NULL ,
    acco_curr_amt decimal(18,4) NOT NULL ,
    acco_avail_amt decimal(18,4) NOT NULL ,
    out_curr_amt decimal(18,4) NOT NULL ,
    out_enable_amt decimal(18,4) NOT NULL ,
    acco_curr_amt_diff decimal(18,4) NOT NULL ,
    acco_avail_amt_diff decimal(18,4) NOT NULL ,
    sys_avail_amt_diff decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    out_total_payab_amt decimal(18,4) NOT NULL ,
    out_total_rece_amt decimal(18,4) NOT NULL ,
    acco_total_payab_amt_diff decimal(18,4) NOT NULL ,
    acco_total_rece_amt_diff decimal(18,4) NOT NULL ,
    deal_flag int NOT NULL ,
    asset_sync_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_asac_capit_diff_1 on tb_pdseca_asac_capit_diff (init_date,pass_no,out_acco,crncy_type);
create index idx_tb_pdseca_asac_capit_diff_2 on tb_pdseca_asac_capit_diff (init_date,co_no,pd_no,crncy_type);
create index idx_tb_pdseca_asac_capit_diff_3 on tb_pdseca_asac_capit_diff (init_date,pass_no,out_acco,crncy_type);

-- 创建数据表：历史_产品证券_资金_内外资产账户资金差异表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_asac_capit_diff_his;
CREATE TABLE tb_pdseca_asac_capit_diff_his (
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
    crncy_type varchar(3) NOT NULL ,
    acco_curr_amt decimal(18,4) NOT NULL ,
    acco_avail_amt decimal(18,4) NOT NULL ,
    out_curr_amt decimal(18,4) NOT NULL ,
    out_enable_amt decimal(18,4) NOT NULL ,
    acco_curr_amt_diff decimal(18,4) NOT NULL ,
    acco_avail_amt_diff decimal(18,4) NOT NULL ,
    sys_avail_amt_diff decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    out_total_payab_amt decimal(18,4) NOT NULL ,
    out_total_rece_amt decimal(18,4) NOT NULL ,
    acco_total_payab_amt_diff decimal(18,4) NOT NULL ,
    acco_total_rece_amt_diff decimal(18,4) NOT NULL ,
    deal_flag int NOT NULL ,
    asset_sync_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_asac_capit_diff_his_1 on tb_pdseca_asac_capit_diff_his (init_date,pass_no,out_acco,crncy_type);
create index idx_tb_pdseca_asac_capit_diff_his_2 on tb_pdseca_asac_capit_diff_his (init_date,co_no,pd_no,crncy_type);
create index idx_tb_pdseca_asac_capit_diff_his_3 on tb_pdseca_asac_capit_diff_his (init_date,pass_no,out_acco,crncy_type);

-- 创建数据表：产品证券_资金_估值外部资产账户资金表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_evalu_out_asac_capit;
CREATE TABLE tb_pdseca_evalu_out_asac_capit (
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
    crncy_type varchar(3) NOT NULL ,
    out_curr_amt decimal(18,4) NOT NULL ,
    out_enable_amt decimal(18,4) NOT NULL ,
    out_frozen_amt decimal(18,4) NOT NULL ,
    out_unfroz_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_evalu_out_asac_capit_1 on tb_pdseca_evalu_out_asac_capit (init_date,pass_no,out_acco,crncy_type);
create index idx_tb_pdseca_evalu_out_asac_capit_2 on tb_pdseca_evalu_out_asac_capit (init_date,co_no,pd_no,asset_acco_no,crncy_type);

-- 创建数据表：历史_产品证券_资金_估值外部资产账户资金表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_evalu_out_asac_capit_his;
CREATE TABLE tb_pdseca_evalu_out_asac_capit_his (
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
    crncy_type varchar(3) NOT NULL ,
    out_curr_amt decimal(18,4) NOT NULL ,
    out_enable_amt decimal(18,4) NOT NULL ,
    out_frozen_amt decimal(18,4) NOT NULL ,
    out_unfroz_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_evalu_out_asac_capit_his_1 on tb_pdseca_evalu_out_asac_capit_his (init_date,pass_no,out_acco,crncy_type);
create index idx_tb_pdseca_evalu_out_asac_capit_his_2 on tb_pdseca_evalu_out_asac_capit_his (init_date,co_no,pd_no,asset_acco_no,crncy_type);

-- 创建数据表：产品证券_资金_银证转账流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_bank_transfer;
CREATE TABLE tb_pdseca_bank_transfer (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    trans_date int NOT NULL ,
    trans_time int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    bank_acco_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    busi_flag int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    trans_status varchar(2) NOT NULL ,
    bank_jour_no varchar(64) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdseca_bank_transfer_1 on tb_pdseca_bank_transfer (co_no,pd_no,asset_acco_no,bank_acco_no,crncy_type);
create index idx_tb_pdseca_bank_transfer_2 on tb_pdseca_bank_transfer (pd_no,busi_flag);

-- 创建数据表：历史_产品证券_资金_银证转账流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_bank_transfer_his;
CREATE TABLE tb_pdseca_bank_transfer_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    trans_date int NOT NULL ,
    trans_time int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    bank_acco_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    busi_flag int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    trans_status varchar(2) NOT NULL ,
    bank_jour_no varchar(64) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdseca_bank_transfer_his_1 on tb_pdseca_bank_transfer_his (co_no,pd_no,asset_acco_no,bank_acco_no,crncy_type);
create index idx_tb_pdseca_bank_transfer_his_2 on tb_pdseca_bank_transfer_his (pd_no,busi_flag);

-- 创建数据表：产品证券_资金_科目资金流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_fina_capit_jour;
CREATE TABLE tb_pdseca_fina_capit_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    busi_flag int NOT NULL ,
    pd_fee_type int NOT NULL ,
    pd_fee_name varchar(64) NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    occur_end_amt decimal(18,4) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdseca_fina_capit_jour_1 on tb_pdseca_fina_capit_jour (init_date,co_no,pd_no,busi_flag,pd_fee_type);

-- 创建数据表：历史_产品证券_资金_科目资金流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_fina_capit_jour_his;
CREATE TABLE tb_pdseca_fina_capit_jour_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    busi_flag int NOT NULL ,
    pd_fee_type int NOT NULL ,
    pd_fee_name varchar(64) NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    occur_end_amt decimal(18,4) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdseca_fina_capit_jour_his_1 on tb_pdseca_fina_capit_jour_his (init_date,co_no,pd_no,busi_flag,pd_fee_type);

-- 创建数据表：产品证券_资金_止损参数表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_stop_loss_param;
CREATE TABLE tb_pdseca_stop_loss_param (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    contra_stop_line decimal(18,12) NOT NULL ,
    pre_stop_line decimal(18,12) NOT NULL ,
    exec_stop_line decimal(18,12) NOT NULL ,
    max_posi_param decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_stop_loss_param_1 on tb_pdseca_stop_loss_param (co_no,pd_no);

-- 创建数据表：产品证券_资金_外部证券资金流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_out_secu_capit_jour;
CREATE TABLE tb_pdseca_out_secu_capit_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    init_date int NOT NULL ,
    pass_money_jour_no bigint NOT NULL ,
    busi_flag int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    entry_amt decimal(18,4) NOT NULL ,
    entry_end_amt decimal(18,4) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_out_secu_capit_jour_1 on tb_pdseca_out_secu_capit_jour (pass_no,out_acco,init_date,pass_money_jour_no);

-- 创建数据表：历史_产品证券_资金_外部证券资金流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_out_secu_capit_jour_his;
CREATE TABLE tb_pdseca_out_secu_capit_jour_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    init_date int NOT NULL ,
    pass_money_jour_no bigint NOT NULL ,
    busi_flag int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    entry_amt decimal(18,4) NOT NULL ,
    entry_end_amt decimal(18,4) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_out_secu_capit_jour_his_1 on tb_pdseca_out_secu_capit_jour_his (pass_no,out_acco,init_date,pass_money_jour_no);

-- 创建数据表：产品证券_资金_资金入账流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_capit_entry_jour;
CREATE TABLE tb_pdseca_capit_entry_jour (
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
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    busi_flag int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    old_arrive_date int NOT NULL ,
    arrive_date int NOT NULL ,
    order_no int NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdseca_capit_entry_jour_1 on tb_pdseca_capit_entry_jour (init_date);
create index idx_tb_pdseca_capit_entry_jour_2 on tb_pdseca_capit_entry_jour (arrive_date,entry_status);

-- 创建数据表：历史_产品证券_资金_资金入账流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_capit_entry_jour_his;
CREATE TABLE tb_pdseca_capit_entry_jour_his (
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
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    busi_flag int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    old_arrive_date int NOT NULL ,
    arrive_date int NOT NULL ,
    order_no int NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdseca_capit_entry_jour_his_1 on tb_pdseca_capit_entry_jour_his (init_date);
create index idx_tb_pdseca_capit_entry_jour_his_2 on tb_pdseca_capit_entry_jour_his (arrive_date,entry_status);

-- 创建数据表：产品证券_资金_资金入账流水计算统计表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_capit_entry_jour_calc_stat;
CREATE TABLE tb_pdseca_capit_entry_jour_calc_stat (
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
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    busi_flag int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    arrive_date int NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    hk_cash_avail_date_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdseca_capit_entry_jour_calc_stat_1 on tb_pdseca_capit_entry_jour_calc_stat (arrive_date,entry_status);
create index idx_tb_pdseca_capit_entry_jour_calc_stat_2 on tb_pdseca_capit_entry_jour_calc_stat (asset_acco_no);
create index idx_tb_pdseca_capit_entry_jour_calc_stat_3 on tb_pdseca_capit_entry_jour_calc_stat (busi_flag);

-- 创建数据表：产品证券_资金_资金统计表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_capit_total;
CREATE TABLE tb_pdseca_capit_total (
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
    record_count int NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdseca_capit_total_1 on tb_pdseca_capit_total (init_date,co_no,pd_no,exch_group_no,asset_acco_no,crncy_type);

-- 创建数据表：历史_产品证券_资金_资金统计表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_capit_total_his;
CREATE TABLE tb_pdseca_capit_total_his (
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
    record_count int NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdseca_capit_total_his_1 on tb_pdseca_capit_total_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no,crncy_type);

-- 创建数据表：产品证券_资金_交易资产账户资金表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_trd_asac_capit;
CREATE TABLE tb_pdseca_trd_asac_capit (
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
    shsz_avail_amt decimal(18,4) NOT NULL ,
    hk_avail_amt decimal(18,4) NOT NULL ,
    static_avail_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_trd_asac_capit_1 on tb_pdseca_trd_asac_capit (asset_acco_no,crncy_type);
create index idx_tb_pdseca_trd_asac_capit_2 on tb_pdseca_trd_asac_capit (co_no,pd_no,crncy_type);

-- 创建数据表：产品证券_资金_历史交易资产账户资金表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_trd_asac_capit_his;
CREATE TABLE tb_pdseca_trd_asac_capit_his (
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
    shsz_avail_amt decimal(18,4) NOT NULL ,
    hk_avail_amt decimal(18,4) NOT NULL ,
    static_avail_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_trd_asac_capit_his_1 on tb_pdseca_trd_asac_capit_his (init_date,asset_acco_no,crncy_type);
create index idx_tb_pdseca_trd_asac_capit_his_2 on tb_pdseca_trd_asac_capit_his (init_date,co_no,pd_no,crncy_type);

-- 创建数据表：产品证券_资金_交易库交易组资金表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_trd_exgp_capit;
CREATE TABLE tb_pdseca_trd_exgp_capit (
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
    crncy_type varchar(3) NOT NULL ,
    shsz_avail_amt decimal(18,4) NOT NULL ,
    hk_avail_amt decimal(18,4) NOT NULL ,
    static_avail_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_trd_exgp_capit_1 on tb_pdseca_trd_exgp_capit (exch_group_no,asset_acco_no,crncy_type);
create index idx_tb_pdseca_trd_exgp_capit_2 on tb_pdseca_trd_exgp_capit (co_no,pd_no,crncy_type);

-- 创建数据表：产品证券_资金_历史交易库交易组资金表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_trd_exgp_capit_his;
CREATE TABLE tb_pdseca_trd_exgp_capit_his (
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
    shsz_avail_amt decimal(18,4) NOT NULL ,
    hk_avail_amt decimal(18,4) NOT NULL ,
    static_avail_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_trd_exgp_capit_his_1 on tb_pdseca_trd_exgp_capit_his (init_date,exch_group_no,asset_acco_no,crncy_type);
create index idx_tb_pdseca_trd_exgp_capit_his_2 on tb_pdseca_trd_exgp_capit_his (init_date,co_no,pd_no,crncy_type);

-- 创建数据表：产品证券_资金_场外基金资产账户资金表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_off_side_fund_asac_capit;
CREATE TABLE tb_pdseca_off_side_fund_asac_capit (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    out_curr_amt decimal(18,4) NOT NULL ,
    out_enable_amt decimal(18,4) NOT NULL ,
    out_frozen_amt decimal(18,4) NOT NULL ,
    out_unfroz_amt decimal(18,4) NOT NULL ,
    out_total_payab_amt decimal(18,4) NOT NULL ,
    out_total_rece_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_off_side_fund_asac_capit_1 on tb_pdseca_off_side_fund_asac_capit (out_acco);

-- 创建数据表：产品证券_资金_外部转入资产表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_out_entry_asac;
CREATE TABLE tb_pdseca_out_entry_asac (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    pass_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    out_nav_asset decimal(18,4) NOT NULL ,
    out_stock_asset decimal(18,4) NOT NULL ,
    out_bond_asset decimal(18,4) NOT NULL ,
    out_fund_asset decimal(18,4) NOT NULL ,
    out_repo_asset decimal(18,4) NOT NULL ,
    out_total_rece_amt decimal(18,4) NOT NULL ,
    out_total_payab_amt decimal(18,4) NOT NULL ,
    out_other_asset decimal(18,4) NOT NULL ,
    out_option_asset decimal(18,4) NOT NULL ,
    out_fina_debt decimal(18,4) NOT NULL ,
    out_loan_debt decimal(18,4) NOT NULL ,
    out_futu_asset decimal(18,4) NOT NULL ,
    out_margin_amt decimal(18,4) NOT NULL ,
    out_shsz_T0_avail decimal(18,4) NOT NULL ,
    out_shsz_T1_avail decimal(18,4) NOT NULL ,
    out_shhk_avail_amt decimal(18,4) NOT NULL ,
    out_szhk_avail_amt decimal(18,4) NOT NULL ,
    out_cash_asset decimal(18,4) NOT NULL ,
    out_futu_pandl_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_out_entry_asac_1 on tb_pdseca_out_entry_asac (pass_no,out_acco);

-- 创建数据表：产品证券_资金_内部资产账户资金核对表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_asac_capit_check;
CREATE TABLE tb_pdseca_asac_capit_check (
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
    curr_amt decimal(18,4) NOT NULL ,
    avail_amt decimal(18,4) NOT NULL ,
    avail_amt_cal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_asac_capit_check_1 on tb_pdseca_asac_capit_check (init_date,co_no,pd_no,asset_acco_no);

-- 创建数据表：产品证券_资金_产品申赎流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_pd_apply_jour;
CREATE TABLE tb_pdseca_pd_apply_jour (
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
    record_batch_no int NOT NULL ,
    redempt_type int NOT NULL ,
    redempt_amt decimal(18,4) NOT NULL ,
    redempt_qty decimal(18,2) NOT NULL ,
    exch_group_no_str varchar(2048) NOT NULL ,
    exgp_dist_amt_str varchar(4096) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_pd_apply_jour_1 on tb_pdseca_pd_apply_jour (init_date,co_no,pd_no,asset_acco_no,record_batch_no);

-- 创建数据表：历史_产品证券_资金_产品申赎流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_pd_apply_jour_his;
CREATE TABLE tb_pdseca_pd_apply_jour_his (
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
    record_batch_no int NOT NULL ,
    redempt_type int NOT NULL ,
    redempt_amt decimal(18,4) NOT NULL ,
    redempt_qty decimal(18,2) NOT NULL ,
    exch_group_no_str varchar(2048) NOT NULL ,
    exgp_dist_amt_str varchar(4096) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_pd_apply_jour_his_1 on tb_pdseca_pd_apply_jour_his (init_date,co_no,pd_no,asset_acco_no,record_batch_no);
commit;
