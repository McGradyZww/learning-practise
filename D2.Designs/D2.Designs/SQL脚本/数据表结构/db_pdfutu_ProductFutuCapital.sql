-- /**************************************************************************************/
-- 创建数据库【产品期货】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pdfutu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pdfutu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：产品期货_资金_交易组资金表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfuca_exgp_capit;
CREATE TABLE tb_pdfuca_exgp_capit (
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
    capt_margin decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    intrst_rate decimal(18,12) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfuca_exgp_capit_1 on tb_pdfuca_exgp_capit (asset_acco_no,exch_group_no,crncy_type);
create index idx_tb_pdfuca_exgp_capit_2 on tb_pdfuca_exgp_capit (co_no,pd_no,crncy_type);

-- 创建数据表：产品期货_资金_历史交易组资金表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfuca_exgp_capit_his;
CREATE TABLE tb_pdfuca_exgp_capit_his (
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
    capt_margin decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    intrst_rate decimal(18,12) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfuca_exgp_capit_his_1 on tb_pdfuca_exgp_capit_his (init_date,asset_acco_no,exch_group_no,crncy_type);
create index idx_tb_pdfuca_exgp_capit_his_2 on tb_pdfuca_exgp_capit_his (init_date,co_no,pd_no,crncy_type);

-- 创建数据表：产品期货_资金_交易组资金流水表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfuca_exgp_capit_jour;
CREATE TABLE tb_pdfuca_exgp_capit_jour (
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
create index idx_tb_pdfuca_exgp_capit_jour_1 on tb_pdfuca_exgp_capit_jour (init_date,exch_group_no,crncy_type,oper_func_code);
create index idx_tb_pdfuca_exgp_capit_jour_2 on tb_pdfuca_exgp_capit_jour (init_date,co_no,pd_no,crncy_type,oper_func_code);

-- 创建数据表：历史_产品期货_资金_交易组资金流水表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfuca_exgp_capit_jour_his;
CREATE TABLE tb_pdfuca_exgp_capit_jour_his (
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
create index idx_tb_pdfuca_exgp_capit_jour_his_1 on tb_pdfuca_exgp_capit_jour_his (init_date,exch_group_no,crncy_type,oper_func_code);
create index idx_tb_pdfuca_exgp_capit_jour_his_2 on tb_pdfuca_exgp_capit_jour_his (init_date,co_no,pd_no,crncy_type,oper_func_code);

-- 创建数据表：产品期货_资金_交易组资金冻结解冻流水表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfuca_exgp_capit_frozen_jour;
CREATE TABLE tb_pdfuca_exgp_capit_frozen_jour (
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
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfuca_exgp_capit_frozen_jour_1 on tb_pdfuca_exgp_capit_frozen_jour (init_date,asset_acco_no,exch_group_no,crncy_type,oper_func_code);
create index idx_tb_pdfuca_exgp_capit_frozen_jour_2 on tb_pdfuca_exgp_capit_frozen_jour (init_date,co_no,pd_no,crncy_type,oper_func_code);

-- 创建数据表：历史_产品期货_资金_交易组资金冻结解冻流水表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfuca_exgp_capit_frozen_jour_his;
CREATE TABLE tb_pdfuca_exgp_capit_frozen_jour_his (
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
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfuca_exgp_capit_frozen_jour_his_1 on tb_pdfuca_exgp_capit_frozen_jour_his (init_date,asset_acco_no,exch_group_no,crncy_type,oper_func_code);
create index idx_tb_pdfuca_exgp_capit_frozen_jour_his_2 on tb_pdfuca_exgp_capit_frozen_jour_his (init_date,co_no,pd_no,crncy_type,oper_func_code);

-- 创建数据表：产品期货_资金_交易组资产表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfuca_exgp_asset;
CREATE TABLE tb_pdfuca_exgp_asset (
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
    futu_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfuca_exgp_asset_1 on tb_pdfuca_exgp_asset (exch_group_no,crncy_type);
create index idx_tb_pdfuca_exgp_asset_2 on tb_pdfuca_exgp_asset (update_date,update_time);

-- 创建数据表：产品期货_资金_历史交易组资产表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfuca_exgp_asset_his;
CREATE TABLE tb_pdfuca_exgp_asset_his (
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
    futu_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfuca_exgp_asset_his_1 on tb_pdfuca_exgp_asset_his (init_date,exch_group_no,crncy_type);

-- 创建数据表：产品期货_资金_资产账户资金表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfuca_asac_capit;
CREATE TABLE tb_pdfuca_asac_capit (
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
    capt_margin decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    intrst_rate decimal(18,12) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfuca_asac_capit_1 on tb_pdfuca_asac_capit (asset_acco_no,crncy_type);
create index idx_tb_pdfuca_asac_capit_2 on tb_pdfuca_asac_capit (co_no,pd_no,crncy_type);

-- 创建数据表：产品期货_资金_历史资产账户资金表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfuca_asac_capit_his;
CREATE TABLE tb_pdfuca_asac_capit_his (
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
    capt_margin decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    intrst_rate decimal(18,12) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfuca_asac_capit_his_1 on tb_pdfuca_asac_capit_his (init_date,asset_acco_no,crncy_type);
create index idx_tb_pdfuca_asac_capit_his_2 on tb_pdfuca_asac_capit_his (init_date,co_no,pd_no,crncy_type);

-- 创建数据表：产品期货_资金_资产账户资金流水表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfuca_asac_capit_jour;
CREATE TABLE tb_pdfuca_asac_capit_jour (
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
    busi_flag int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    occur_end_amt decimal(18,4) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfuca_asac_capit_jour_1 on tb_pdfuca_asac_capit_jour (init_date,asset_acco_no,crncy_type,oper_func_code);
create index idx_tb_pdfuca_asac_capit_jour_2 on tb_pdfuca_asac_capit_jour (init_date,co_no,pd_no,crncy_type,oper_func_code);

-- 创建数据表：历史_产品期货_资金_资产账户资金流水表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfuca_asac_capit_jour_his;
CREATE TABLE tb_pdfuca_asac_capit_jour_his (
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
    busi_flag int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    occur_end_amt decimal(18,4) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfuca_asac_capit_jour_his_1 on tb_pdfuca_asac_capit_jour_his (init_date,asset_acco_no,crncy_type,oper_func_code);
create index idx_tb_pdfuca_asac_capit_jour_his_2 on tb_pdfuca_asac_capit_jour_his (init_date,co_no,pd_no,crncy_type,oper_func_code);

-- 创建数据表：产品期货_资金_资产账户资金冻结解冻流水表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfuca_asac_capit_frozen_jour;
CREATE TABLE tb_pdfuca_asac_capit_frozen_jour (
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
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfuca_asac_capit_frozen_jour_1 on tb_pdfuca_asac_capit_frozen_jour (init_date,asset_acco_no,crncy_type,oper_func_code);
create index idx_tb_pdfuca_asac_capit_frozen_jour_2 on tb_pdfuca_asac_capit_frozen_jour (init_date,co_no,pd_no,crncy_type,oper_func_code);

-- 创建数据表：历史_产品期货_资金_资产账户资金冻结解冻流水表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfuca_asac_capit_frozen_jour_his;
CREATE TABLE tb_pdfuca_asac_capit_frozen_jour_his (
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
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfuca_asac_capit_frozen_jour_his_1 on tb_pdfuca_asac_capit_frozen_jour_his (init_date,asset_acco_no,crncy_type,oper_func_code);
create index idx_tb_pdfuca_asac_capit_frozen_jour_his_2 on tb_pdfuca_asac_capit_frozen_jour_his (init_date,co_no,pd_no,crncy_type,oper_func_code);

-- 创建数据表：产品期货_资金_资产账户资产表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfuca_asac_asset;
CREATE TABLE tb_pdfuca_asac_asset (
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
    futu_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfuca_asac_asset_1 on tb_pdfuca_asac_asset (asset_acco_no,crncy_type);

-- 创建数据表：产品期货_资金_历史资产账户资产表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfuca_asac_asset_his;
CREATE TABLE tb_pdfuca_asac_asset_his (
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
    futu_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfuca_asac_asset_his_1 on tb_pdfuca_asac_asset_his (init_date,asset_acco_no,crncy_type);

-- 创建数据表：产品期货_资金_外部资产账户资金表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfuca_out_asac_capit;
CREATE TABLE tb_pdfuca_out_asac_capit (
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
    out_capt_margin decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfuca_out_asac_capit_1 on tb_pdfuca_out_asac_capit (init_date,pass_no,out_acco,crncy_type);
create index idx_tb_pdfuca_out_asac_capit_2 on tb_pdfuca_out_asac_capit (init_date,co_no,pd_no,asset_acco_no,crncy_type);

-- 创建数据表：历史_产品期货_资金_外部资产账户资金表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfuca_out_asac_capit_his;
CREATE TABLE tb_pdfuca_out_asac_capit_his (
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
    out_capt_margin decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfuca_out_asac_capit_his_1 on tb_pdfuca_out_asac_capit_his (init_date,pass_no,out_acco,crncy_type);
create index idx_tb_pdfuca_out_asac_capit_his_2 on tb_pdfuca_out_asac_capit_his (init_date,co_no,pd_no,asset_acco_no,crncy_type);

-- 创建数据表：产品期货_资金_内外资产账户资金差异表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfuca_asac_capit_diff;
CREATE TABLE tb_pdfuca_asac_capit_diff (
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
    act_capt_margin decimal(18,4) NOT NULL ,
    out_curr_amt decimal(18,4) NOT NULL ,
    out_enable_amt decimal(18,4) NOT NULL ,
    out_capt_margin decimal(18,4) NOT NULL ,
    acco_curr_amt_diff decimal(18,4) NOT NULL ,
    acco_avail_amt_diff decimal(18,4) NOT NULL ,
    act_capt_margin_diff decimal(18,4) NOT NULL ,
    deal_flag int NOT NULL ,
    asset_sync_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfuca_asac_capit_diff_1 on tb_pdfuca_asac_capit_diff (init_date,pass_no,out_acco,crncy_type);
create index idx_tb_pdfuca_asac_capit_diff_2 on tb_pdfuca_asac_capit_diff (init_date,co_no,pd_no,crncy_type);

-- 创建数据表：历史_产品期货_资金_内外资产账户资金差异表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfuca_asac_capit_diff_his;
CREATE TABLE tb_pdfuca_asac_capit_diff_his (
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
    act_capt_margin decimal(18,4) NOT NULL ,
    out_curr_amt decimal(18,4) NOT NULL ,
    out_enable_amt decimal(18,4) NOT NULL ,
    out_capt_margin decimal(18,4) NOT NULL ,
    acco_curr_amt_diff decimal(18,4) NOT NULL ,
    acco_avail_amt_diff decimal(18,4) NOT NULL ,
    act_capt_margin_diff decimal(18,4) NOT NULL ,
    deal_flag int NOT NULL ,
    asset_sync_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfuca_asac_capit_diff_his_1 on tb_pdfuca_asac_capit_diff_his (init_date,pass_no,out_acco,crncy_type);
create index idx_tb_pdfuca_asac_capit_diff_his_2 on tb_pdfuca_asac_capit_diff_his (init_date,co_no,pd_no,crncy_type);

-- 创建数据表：产品期货_资金_银期转账流水表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfuca_bank_transfer;
CREATE TABLE tb_pdfuca_bank_transfer (
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
create index idx_tb_pdfuca_bank_transfer_1 on tb_pdfuca_bank_transfer (co_no,pd_no,asset_acco_no,bank_acco_no,crncy_type);

-- 创建数据表：历史_产品期货_资金_银期转账流水表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfuca_bank_transfer_his;
CREATE TABLE tb_pdfuca_bank_transfer_his (
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
create index idx_tb_pdfuca_bank_transfer_his_1 on tb_pdfuca_bank_transfer_his (co_no,pd_no,asset_acco_no,bank_acco_no,crncy_type);

-- 创建数据表：产品期货_资金_外部期货资金流水表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfuca_out_futu_capit_jour;
CREATE TABLE tb_pdfuca_out_futu_capit_jour (
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
    futu_acco varchar(16) NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfuca_out_futu_capit_jour_1 on tb_pdfuca_out_futu_capit_jour (pass_no,out_acco,init_date,pass_money_jour_no);

-- 创建数据表：历史_产品期货_资金_外部期货资金流水表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfuca_out_futu_capit_jour_his;
CREATE TABLE tb_pdfuca_out_futu_capit_jour_his (
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
    futu_acco varchar(16) NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfuca_out_futu_capit_jour_his_1 on tb_pdfuca_out_futu_capit_jour_his (pass_no,out_acco,init_date,pass_money_jour_no);

-- 创建数据表：产品期货_资金_资金入账流水表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfuca_capit_entry_jour;
CREATE TABLE tb_pdfuca_capit_entry_jour (
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
    busi_flag int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfuca_capit_entry_jour_1 on tb_pdfuca_capit_entry_jour (init_date);

-- 创建数据表：历史_产品期货_资金_资金入账流水表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfuca_capit_entry_jour_his;
CREATE TABLE tb_pdfuca_capit_entry_jour_his (
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
    busi_flag int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfuca_capit_entry_jour_his_1 on tb_pdfuca_capit_entry_jour_his (init_date);

-- 创建数据表：产品期货_资金_资金统计表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfuca_capit_total;
CREATE TABLE tb_pdfuca_capit_total (
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
create index idx_tb_pdfuca_capit_total_1 on tb_pdfuca_capit_total (init_date,co_no,pd_no,exch_group_no,asset_acco_no,crncy_type);

-- 创建数据表：历史_产品期货_资金_资金统计表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfuca_capit_total_his;
CREATE TABLE tb_pdfuca_capit_total_his (
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
create index idx_tb_pdfuca_capit_total_his_1 on tb_pdfuca_capit_total_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no,crncy_type);

-- 创建数据表：产品期货_资金_交易资产账户资金表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfuca_trd_asac_capit;
CREATE TABLE tb_pdfuca_trd_asac_capit (
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
    avail_amt decimal(18,4) NOT NULL ,
    margin_amt decimal(18,4) NOT NULL ,
    capit_bala decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfuca_trd_asac_capit_1 on tb_pdfuca_trd_asac_capit (asset_acco_no,crncy_type);
create index idx_tb_pdfuca_trd_asac_capit_2 on tb_pdfuca_trd_asac_capit (co_no,pd_no,crncy_type);

-- 创建数据表：产品期货_资金_历史交易资产账户资金表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfuca_trd_asac_capit_his;
CREATE TABLE tb_pdfuca_trd_asac_capit_his (
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
    avail_amt decimal(18,4) NOT NULL ,
    margin_amt decimal(18,4) NOT NULL ,
    capit_bala decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfuca_trd_asac_capit_his_1 on tb_pdfuca_trd_asac_capit_his (init_date,asset_acco_no,crncy_type);
create index idx_tb_pdfuca_trd_asac_capit_his_2 on tb_pdfuca_trd_asac_capit_his (init_date,co_no,pd_no,crncy_type);

-- 创建数据表：产品期货_资金_交易库交易组资金表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfuca_trd_exgp_capit;
CREATE TABLE tb_pdfuca_trd_exgp_capit (
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
    avail_amt decimal(18,4) NOT NULL ,
    margin_amt decimal(18,4) NOT NULL ,
    capit_bala decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfuca_trd_exgp_capit_1 on tb_pdfuca_trd_exgp_capit (exch_group_no,asset_acco_no,crncy_type);
create index idx_tb_pdfuca_trd_exgp_capit_2 on tb_pdfuca_trd_exgp_capit (co_no,pd_no,crncy_type);

-- 创建数据表：产品期货_资金_历史交易库交易组资金表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfuca_trd_exgp_capit_his;
CREATE TABLE tb_pdfuca_trd_exgp_capit_his (
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
    avail_amt decimal(18,4) NOT NULL ,
    margin_amt decimal(18,4) NOT NULL ,
    capit_bala decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfuca_trd_exgp_capit_his_1 on tb_pdfuca_trd_exgp_capit_his (init_date,exch_group_no,asset_acco_no,crncy_type);
create index idx_tb_pdfuca_trd_exgp_capit_his_2 on tb_pdfuca_trd_exgp_capit_his (init_date,co_no,pd_no,crncy_type);
commit;
