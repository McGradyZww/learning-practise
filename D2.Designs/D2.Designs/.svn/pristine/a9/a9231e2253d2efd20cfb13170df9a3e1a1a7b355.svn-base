-- /**************************************************************************************/
-- 创建数据库【产品期货】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pdfutu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pdfutu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：产品期货_持仓_交易组持仓表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupo_exgp_posi;
CREATE TABLE tb_pdfupo_exgp_posi (
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
    sett_flag int NOT NULL ,
    open_amount decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_exgp_posi_1 on tb_pdfupo_exgp_posi (asset_acco_no,futu_acco_no,exch_group_no,contrc_code_no,lngsht_type,hedge_type);
create index idx_tb_pdfupo_exgp_posi_2 on tb_pdfupo_exgp_posi (co_no,pd_no,exch_no);
create index idx_tb_pdfupo_exgp_posi_3 on tb_pdfupo_exgp_posi (update_date,update_time);

-- 创建数据表：产品期货_持仓_历史交易组持仓表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfupo_exgp_posi_his;
CREATE TABLE tb_pdfupo_exgp_posi_his (
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
    sett_flag int NOT NULL ,
    open_amount decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_exgp_posi_his_1 on tb_pdfupo_exgp_posi_his (init_date,asset_acco_no,futu_acco_no,exch_group_no,contrc_code_no,lngsht_type,hedge_type);
create index idx_tb_pdfupo_exgp_posi_his_2 on tb_pdfupo_exgp_posi_his (init_date,co_no,pd_no,exch_no);

-- 创建数据表：产品期货_持仓_交易组持仓流水表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupo_exgp_posi_jour;
CREATE TABLE tb_pdfupo_exgp_posi_jour (
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
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    occur_end_qty decimal(18,2) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfupo_exgp_posi_jour_1 on tb_pdfupo_exgp_posi_jour (init_date,exch_group_no,futu_acco_no,contrc_code_no,oper_func_code);
create index idx_tb_pdfupo_exgp_posi_jour_2 on tb_pdfupo_exgp_posi_jour (init_date,co_no,pd_no,exch_no,oper_func_code);
create index idx_tb_pdfupo_exgp_posi_jour_3 on tb_pdfupo_exgp_posi_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_产品期货_持仓_交易组持仓流水表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfupo_exgp_posi_jour_his;
CREATE TABLE tb_pdfupo_exgp_posi_jour_his (
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
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    occur_end_qty decimal(18,2) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfupo_exgp_posi_jour_his_1 on tb_pdfupo_exgp_posi_jour_his (init_date,exch_group_no,futu_acco_no,contrc_code_no,oper_func_code);
create index idx_tb_pdfupo_exgp_posi_jour_his_2 on tb_pdfupo_exgp_posi_jour_his (init_date,co_no,pd_no,exch_no,oper_func_code);
create index idx_tb_pdfupo_exgp_posi_jour_his_3 on tb_pdfupo_exgp_posi_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：产品期货_持仓_交易组持仓冻结解冻流水表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupo_exgp_posi_frozen_jour;
CREATE TABLE tb_pdfupo_exgp_posi_frozen_jour (
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
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    frozen_type int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    expire_date int NOT NULL ,
    jour_status varchar(2) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfupo_exgp_posi_frozen_jour_1 on tb_pdfupo_exgp_posi_frozen_jour (init_date,exch_group_no,futu_acco_no,contrc_code_no,oper_func_code);
create index idx_tb_pdfupo_exgp_posi_frozen_jour_2 on tb_pdfupo_exgp_posi_frozen_jour (init_date,co_no,pd_no,exch_no,oper_func_code);
create index idx_tb_pdfupo_exgp_posi_frozen_jour_3 on tb_pdfupo_exgp_posi_frozen_jour (init_date,opor_co_no,opor_no);
create index idx_tb_pdfupo_exgp_posi_frozen_jour_4 on tb_pdfupo_exgp_posi_frozen_jour (jour_status);

-- 创建数据表：历史_产品期货_持仓_交易组持仓冻结解冻流水表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfupo_exgp_posi_frozen_jour_his;
CREATE TABLE tb_pdfupo_exgp_posi_frozen_jour_his (
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
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    frozen_type int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    expire_date int NOT NULL ,
    jour_status varchar(2) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfupo_exgp_posi_frozen_jour_his_1 on tb_pdfupo_exgp_posi_frozen_jour_his (init_date,exch_group_no,futu_acco_no,contrc_code_no,oper_func_code);
create index idx_tb_pdfupo_exgp_posi_frozen_jour_his_2 on tb_pdfupo_exgp_posi_frozen_jour_his (init_date,co_no,pd_no,exch_no,oper_func_code);
create index idx_tb_pdfupo_exgp_posi_frozen_jour_his_3 on tb_pdfupo_exgp_posi_frozen_jour_his (init_date,opor_co_no,opor_no);
create index idx_tb_pdfupo_exgp_posi_frozen_jour_his_4 on tb_pdfupo_exgp_posi_frozen_jour_his (jour_status);

-- 创建数据表：产品期货_持仓_交易组持仓入账流水表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupo_exgp_posi_entry_jour;
CREATE TABLE tb_pdfupo_exgp_posi_entry_jour (
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
    contrc_type int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    contrc_unit int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfupo_exgp_posi_entry_jour_1 on tb_pdfupo_exgp_posi_entry_jour (init_date);

-- 创建数据表：历史_产品期货_持仓_交易组持仓入账流水表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfupo_exgp_posi_entry_jour_his;
CREATE TABLE tb_pdfupo_exgp_posi_entry_jour_his (
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
    contrc_type int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    contrc_unit int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfupo_exgp_posi_entry_jour_his_1 on tb_pdfupo_exgp_posi_entry_jour_his (init_date);

-- 创建数据表：产品期货_持仓_资产账户持仓表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupo_asac_posi;
CREATE TABLE tb_pdfupo_asac_posi (
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
    sett_flag int NOT NULL ,
    open_amount decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_asac_posi_1 on tb_pdfupo_asac_posi (asset_acco_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type);
create index idx_tb_pdfupo_asac_posi_2 on tb_pdfupo_asac_posi (co_no,pd_no,exch_no);
create index idx_tb_pdfupo_asac_posi_3 on tb_pdfupo_asac_posi (update_date,update_time);

-- 创建数据表：产品期货_持仓_历史资产账户持仓表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfupo_asac_posi_his;
CREATE TABLE tb_pdfupo_asac_posi_his (
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
    sett_flag int NOT NULL ,
    open_amount decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_asac_posi_his_1 on tb_pdfupo_asac_posi_his (init_date,asset_acco_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type);
create index idx_tb_pdfupo_asac_posi_his_2 on tb_pdfupo_asac_posi_his (init_date,co_no,pd_no,exch_no);

-- 创建数据表：产品期货_持仓_资产账户持仓流水表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupo_asac_posi_jour;
CREATE TABLE tb_pdfupo_asac_posi_jour (
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
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    occur_end_qty decimal(18,2) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfupo_asac_posi_jour_1 on tb_pdfupo_asac_posi_jour (init_date,asset_acco_no,futu_acco_no,contrc_code_no,oper_func_code);
create index idx_tb_pdfupo_asac_posi_jour_2 on tb_pdfupo_asac_posi_jour (init_date,co_no,pd_no,exch_no,oper_func_code);
create index idx_tb_pdfupo_asac_posi_jour_3 on tb_pdfupo_asac_posi_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_产品期货_持仓_资产账户持仓流水表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfupo_asac_posi_jour_his;
CREATE TABLE tb_pdfupo_asac_posi_jour_his (
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
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    occur_end_qty decimal(18,2) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfupo_asac_posi_jour_his_1 on tb_pdfupo_asac_posi_jour_his (init_date,asset_acco_no,futu_acco_no,contrc_code_no,oper_func_code);
create index idx_tb_pdfupo_asac_posi_jour_his_2 on tb_pdfupo_asac_posi_jour_his (init_date,co_no,pd_no,exch_no,oper_func_code);
create index idx_tb_pdfupo_asac_posi_jour_his_3 on tb_pdfupo_asac_posi_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：产品期货_持仓_资产账户持仓冻结解冻流水表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupo_asac_posi_frozen_jour;
CREATE TABLE tb_pdfupo_asac_posi_frozen_jour (
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
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    frozen_type int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    expire_date int NOT NULL ,
    jour_status varchar(2) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfupo_asac_posi_frozen_jour_1 on tb_pdfupo_asac_posi_frozen_jour (init_date,asset_acco_no,futu_acco_no,contrc_code_no,oper_func_code);
create index idx_tb_pdfupo_asac_posi_frozen_jour_2 on tb_pdfupo_asac_posi_frozen_jour (init_date,co_no,pd_no,exch_no,oper_func_code);
create index idx_tb_pdfupo_asac_posi_frozen_jour_3 on tb_pdfupo_asac_posi_frozen_jour (init_date,opor_co_no,opor_no);
create index idx_tb_pdfupo_asac_posi_frozen_jour_4 on tb_pdfupo_asac_posi_frozen_jour (jour_status);

-- 创建数据表：历史_产品期货_持仓_资产账户持仓冻结解冻流水表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfupo_asac_posi_frozen_jour_his;
CREATE TABLE tb_pdfupo_asac_posi_frozen_jour_his (
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
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    frozen_type int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    expire_date int NOT NULL ,
    jour_status varchar(2) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfupo_asac_posi_frozen_jour_his_1 on tb_pdfupo_asac_posi_frozen_jour_his (init_date,asset_acco_no,futu_acco_no,contrc_code_no,oper_func_code);
create index idx_tb_pdfupo_asac_posi_frozen_jour_his_2 on tb_pdfupo_asac_posi_frozen_jour_his (init_date,co_no,pd_no,exch_no,oper_func_code);
create index idx_tb_pdfupo_asac_posi_frozen_jour_his_3 on tb_pdfupo_asac_posi_frozen_jour_his (init_date,opor_co_no,opor_no);
create index idx_tb_pdfupo_asac_posi_frozen_jour_his_4 on tb_pdfupo_asac_posi_frozen_jour_his (jour_status);

-- 创建数据表：产品期货_持仓_资产账户持仓入账流水表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupo_asac_posi_entry_jour;
CREATE TABLE tb_pdfupo_asac_posi_entry_jour (
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
    contrc_unit int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfupo_asac_posi_entry_jour_1 on tb_pdfupo_asac_posi_entry_jour (init_date);

-- 创建数据表：历史_产品期货_持仓_资产账户持仓入账流水表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfupo_asac_posi_entry_jour_his;
CREATE TABLE tb_pdfupo_asac_posi_entry_jour_his (
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
    contrc_unit int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfupo_asac_posi_entry_jour_his_1 on tb_pdfupo_asac_posi_entry_jour_his (init_date);

-- 创建数据表：产品期货_持仓_外部资产账户持仓表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupo_out_asac_posi;
CREATE TABLE tb_pdfupo_out_asac_posi (
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
    futu_acco_no int NOT NULL ,
    futu_acco varchar(16) NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    contrc_name varchar(64) NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    contrc_unit int NOT NULL ,
    out_curr_qty decimal(18,2) NOT NULL ,
    out_enable_qty decimal(18,2) NOT NULL ,
    out_rece_margin decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_out_asac_posi_1 on tb_pdfupo_out_asac_posi (init_date,pass_no,out_acco,exch_no,futu_acco,contrc_code,lngsht_type,hedge_type);
create index idx_tb_pdfupo_out_asac_posi_2 on tb_pdfupo_out_asac_posi (init_date,co_no,pd_no,asset_acco_no,exch_no);

-- 创建数据表：历史_产品期货_持仓_外部资产账户持仓表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfupo_out_asac_posi_his;
CREATE TABLE tb_pdfupo_out_asac_posi_his (
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
    futu_acco_no int NOT NULL ,
    futu_acco varchar(16) NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    contrc_name varchar(64) NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    contrc_unit int NOT NULL ,
    out_curr_qty decimal(18,2) NOT NULL ,
    out_enable_qty decimal(18,2) NOT NULL ,
    out_rece_margin decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_out_asac_posi_his_1 on tb_pdfupo_out_asac_posi_his (init_date,pass_no,out_acco,exch_no,futu_acco,contrc_code,lngsht_type,hedge_type);
create index idx_tb_pdfupo_out_asac_posi_his_2 on tb_pdfupo_out_asac_posi_his (init_date,co_no,pd_no,asset_acco_no,exch_no);

-- 创建数据表：产品期货_持仓_内外资产账户持仓差异表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupo_asac_posi_diff;
CREATE TABLE tb_pdfupo_asac_posi_diff (
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
    futu_acco_no int NOT NULL ,
    futu_acco varchar(16) NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    contrc_name varchar(64) NOT NULL ,
    contrc_type int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    comb_code varchar(6) NOT NULL ,
    contrc_unit int NOT NULL ,
    pre_settle_price decimal(16,9) NOT NULL ,
    acco_curr_qty decimal(18,2) NOT NULL ,
    acco_avail_qty decimal(18,2) NOT NULL ,
    acco_rece_margin decimal(18,4) NOT NULL ,
    out_curr_qty decimal(18,2) NOT NULL ,
    out_enable_qty decimal(18,2) NOT NULL ,
    out_rece_margin decimal(18,4) NOT NULL ,
    acco_curr_qty_diff decimal(18,2) NOT NULL ,
    acco_avail_qty_diff decimal(18,2) NOT NULL ,
    acco_rece_margin_diff decimal(18,4) NOT NULL ,
    deal_flag int NOT NULL ,
    asset_sync_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_asac_posi_diff_1 on tb_pdfupo_asac_posi_diff (init_date,pass_no,out_acco,exch_no,futu_acco,contrc_code,lngsht_type,hedge_type);
create index idx_tb_pdfupo_asac_posi_diff_2 on tb_pdfupo_asac_posi_diff (init_date,co_no,pd_no,asset_acco_no,exch_no);

-- 创建数据表：历史_产品期货_持仓_内外资产账户持仓差异表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfupo_asac_posi_diff_his;
CREATE TABLE tb_pdfupo_asac_posi_diff_his (
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
    futu_acco_no int NOT NULL ,
    futu_acco varchar(16) NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    contrc_name varchar(64) NOT NULL ,
    contrc_type int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    comb_code varchar(6) NOT NULL ,
    contrc_unit int NOT NULL ,
    pre_settle_price decimal(16,9) NOT NULL ,
    acco_curr_qty decimal(18,2) NOT NULL ,
    acco_avail_qty decimal(18,2) NOT NULL ,
    acco_rece_margin decimal(18,4) NOT NULL ,
    out_curr_qty decimal(18,2) NOT NULL ,
    out_enable_qty decimal(18,2) NOT NULL ,
    out_rece_margin decimal(18,4) NOT NULL ,
    acco_curr_qty_diff decimal(18,2) NOT NULL ,
    acco_avail_qty_diff decimal(18,2) NOT NULL ,
    acco_rece_margin_diff decimal(18,4) NOT NULL ,
    deal_flag int NOT NULL ,
    asset_sync_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_asac_posi_diff_his_1 on tb_pdfupo_asac_posi_diff_his (init_date,pass_no,out_acco,exch_no,futu_acco,contrc_code,lngsht_type,hedge_type);
create index idx_tb_pdfupo_asac_posi_diff_his_2 on tb_pdfupo_asac_posi_diff_his (init_date,co_no,pd_no,asset_acco_no,exch_no);

-- 创建数据表：产品期货_持仓_内部资产账户持仓核对表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupo_asac_posi_check;
CREATE TABLE tb_pdfupo_asac_posi_check (
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
    hedge_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    avail_qty decimal(18,2) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_asac_posi_check_1 on tb_pdfupo_asac_posi_check (init_date,asset_acco_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type);
create index idx_tb_pdfupo_asac_posi_check_2 on tb_pdfupo_asac_posi_check (init_date,co_no,pd_no,asset_acco_no);

-- 创建数据表：产品期货_持仓_外部持仓流水表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupo_out_posi_jour;
CREATE TABLE tb_pdfupo_out_posi_jour (
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
    pass_stock_jour_no int NOT NULL ,
    busi_flag int NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco varchar(16) NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    entry_qty decimal(18,2) NOT NULL ,
    entry_end_qty decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_out_posi_jour_1 on tb_pdfupo_out_posi_jour (pass_no,out_acco,init_date,pass_stock_jour_no);

-- 创建数据表：历史_产品期货_持仓_外部持仓流水表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfupo_out_posi_jour_his;
CREATE TABLE tb_pdfupo_out_posi_jour_his (
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
    pass_stock_jour_no int NOT NULL ,
    busi_flag int NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco varchar(16) NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    entry_qty decimal(18,2) NOT NULL ,
    entry_end_qty decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_out_posi_jour_his_1 on tb_pdfupo_out_posi_jour_his (pass_no,out_acco,init_date,pass_stock_jour_no);

-- 创建数据表：产品期货_持仓_外部订单表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupo_out_order;
CREATE TABLE tb_pdfupo_out_order (
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
    exch_no int NOT NULL ,
    futu_acco varchar(16) NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_out_order_1 on tb_pdfupo_out_order (pass_no,out_acco,report_date,report_no);
create index idx_tb_pdfupo_out_order_3 on tb_pdfupo_out_order (pass_no,report_date,exch_no,futu_acco,contrc_code);

-- 创建数据表：历史_产品期货_持仓_外部订单表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfupo_out_order_his;
CREATE TABLE tb_pdfupo_out_order_his (
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
    exch_no int NOT NULL ,
    futu_acco varchar(16) NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_out_order_his_1 on tb_pdfupo_out_order_his (pass_no,out_acco,report_date,report_no);
create index idx_tb_pdfupo_out_order_his_3 on tb_pdfupo_out_order_his (pass_no,report_date,exch_no,futu_acco,contrc_code);

-- 创建数据表：产品期货_持仓_外部成交表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupo_out_busi;
CREATE TABLE tb_pdfupo_out_busi (
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
    exch_no int NOT NULL ,
    futu_acco varchar(16) NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_out_busi_1 on tb_pdfupo_out_busi (pass_no,out_acco,exch_no,strike_date,strike_no);
create index idx_tb_pdfupo_out_busi_2 on tb_pdfupo_out_busi (strike_date,pass_no,exch_no,futu_acco,contrc_code);

-- 创建数据表：历史_产品期货_持仓_外部成交表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfupo_out_busi_his;
CREATE TABLE tb_pdfupo_out_busi_his (
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
    exch_no int NOT NULL ,
    futu_acco varchar(16) NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_out_busi_his_1 on tb_pdfupo_out_busi_his (pass_no,out_acco,exch_no,strike_date,strike_no);
create index idx_tb_pdfupo_out_busi_his_2 on tb_pdfupo_out_busi_his (strike_date,pass_no,exch_no,futu_acco,contrc_code);

-- 创建数据表：产品期货_持仓_外部交割流水表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupo_out_deli_jour;
CREATE TABLE tb_pdfupo_out_deli_jour (
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
    crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco varchar(16) NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    pass_deli_jour_no bigint NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    sett_price decimal(16,9) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_num int NOT NULL ,
    entry_end_qty decimal(18,2) NOT NULL ,
    entry_end_amt decimal(18,4) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    out_all_fee decimal(18,4) NOT NULL ,
    out_report_fee decimal(18,4) NOT NULL ,
    out_cancel_fee decimal(18,4) NOT NULL ,
    out_deli_fee decimal(18,4) NOT NULL ,
    out_other_fee decimal(18,4) NOT NULL ,
    out_brkage_commis decimal(18,4) NOT NULL ,
    out_other_commis decimal(18,4) NOT NULL ,
    busi_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_out_deli_jour_1 on tb_pdfupo_out_deli_jour (pass_no,init_date,pass_deli_jour_no);
create index idx_tb_pdfupo_out_deli_jour_2 on tb_pdfupo_out_deli_jour (pass_no,init_date,out_acco);
create index idx_tb_pdfupo_out_deli_jour_3 on tb_pdfupo_out_deli_jour (pass_no,init_date,exch_no,futu_acco,contrc_code);

-- 创建数据表：历史_产品期货_持仓_外部交割流水表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfupo_out_deli_jour_his;
CREATE TABLE tb_pdfupo_out_deli_jour_his (
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
    crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco varchar(16) NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    pass_deli_jour_no bigint NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    sett_price decimal(16,9) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_num int NOT NULL ,
    entry_end_qty decimal(18,2) NOT NULL ,
    entry_end_amt decimal(18,4) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    out_all_fee decimal(18,4) NOT NULL ,
    out_report_fee decimal(18,4) NOT NULL ,
    out_cancel_fee decimal(18,4) NOT NULL ,
    out_deli_fee decimal(18,4) NOT NULL ,
    out_other_fee decimal(18,4) NOT NULL ,
    out_brkage_commis decimal(18,4) NOT NULL ,
    out_other_commis decimal(18,4) NOT NULL ,
    busi_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_out_deli_jour_his_1 on tb_pdfupo_out_deli_jour_his (pass_no,init_date,pass_deli_jour_no);
create index idx_tb_pdfupo_out_deli_jour_his_2 on tb_pdfupo_out_deli_jour_his (pass_no,init_date,out_acco);
create index idx_tb_pdfupo_out_deli_jour_his_3 on tb_pdfupo_out_deli_jour_his (pass_no,init_date,exch_no,futu_acco,contrc_code);

-- 创建数据表：产品期货_持仓_对账表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupo_Deli;
CREATE TABLE tb_pdfupo_Deli (
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
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    entry_jour_no bigint NOT NULL ,
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
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    sett_price decimal(16,9) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_num int NOT NULL ,
    entry_qty decimal(18,2) NOT NULL ,
    entry_amt decimal(18,4) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    report_fee decimal(18,4) NOT NULL ,
    wtdraw_fee decimal(18,4) NOT NULL ,
    deli_fee decimal(18,4) NOT NULL ,
    other_fee decimal(18,4) NOT NULL ,
    trade_commis decimal(18,4) NOT NULL ,
    other_commis decimal(18,4) NOT NULL ,
    out_all_fee decimal(18,4) NOT NULL ,
    out_report_fee decimal(18,4) NOT NULL ,
    out_cancel_fee decimal(18,4) NOT NULL ,
    out_deli_fee decimal(18,4) NOT NULL ,
    out_other_fee decimal(18,4) NOT NULL ,
    out_brkage_commis decimal(18,4) NOT NULL ,
    out_other_commis decimal(18,4) NOT NULL ,
    busi_flag int NOT NULL ,
    deli_status varchar(2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfupo_Deli_1 on tb_pdfupo_Deli (init_date,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_pdfupo_Deli_2 on tb_pdfupo_Deli (init_date,co_no,futu_acco_no,contrc_code_no);

-- 创建数据表：历史_产品期货_持仓_对账表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfupo_Deli_his;
CREATE TABLE tb_pdfupo_Deli_his (
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
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    entry_jour_no bigint NOT NULL ,
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
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    sett_price decimal(16,9) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_num int NOT NULL ,
    entry_qty decimal(18,2) NOT NULL ,
    entry_amt decimal(18,4) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    report_fee decimal(18,4) NOT NULL ,
    wtdraw_fee decimal(18,4) NOT NULL ,
    deli_fee decimal(18,4) NOT NULL ,
    other_fee decimal(18,4) NOT NULL ,
    trade_commis decimal(18,4) NOT NULL ,
    other_commis decimal(18,4) NOT NULL ,
    out_all_fee decimal(18,4) NOT NULL ,
    out_report_fee decimal(18,4) NOT NULL ,
    out_cancel_fee decimal(18,4) NOT NULL ,
    out_deli_fee decimal(18,4) NOT NULL ,
    out_other_fee decimal(18,4) NOT NULL ,
    out_brkage_commis decimal(18,4) NOT NULL ,
    out_other_commis decimal(18,4) NOT NULL ,
    busi_flag int NOT NULL ,
    deli_status varchar(2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfupo_Deli_his_1 on tb_pdfupo_Deli_his (init_date,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_pdfupo_Deli_his_2 on tb_pdfupo_Deli_his (init_date,co_no,futu_acco_no,contrc_code_no);

-- 创建数据表：产品期货_持仓_持仓统计表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupo_futu_posi_total;
CREATE TABLE tb_pdfupo_futu_posi_total (
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
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    avail_qty decimal(18,2) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfupo_futu_posi_total_1 on tb_pdfupo_futu_posi_total (init_date,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_pdfupo_futu_posi_total_2 on tb_pdfupo_futu_posi_total (init_date,futu_acco_no,contrc_code_no,lngsht_type,hedge_type);

-- 创建数据表：产品期货_持仓_交易资产账户持仓表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupo_trd_asac_posi;
CREATE TABLE tb_pdfupo_trd_asac_posi (
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
    hedge_type int NOT NULL ,
    posi_qty decimal(18,2) NOT NULL ,
    marked_pandl decimal(18,4) NOT NULL ,
    pre_strike_capt_qty decimal(18,2) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_trd_asac_posi_1 on tb_pdfupo_trd_asac_posi (asset_acco_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type);
create index idx_tb_pdfupo_trd_asac_posi_2 on tb_pdfupo_trd_asac_posi (co_no,pd_no,exch_no);

-- 创建数据表：产品期货_持仓_交易库交易组持仓表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupo_trd_exgp_posi;
CREATE TABLE tb_pdfupo_trd_exgp_posi (
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
    hedge_type int NOT NULL ,
    posi_qty decimal(18,2) NOT NULL ,
    marked_pandl decimal(18,4) NOT NULL ,
    pre_strike_capt_qty decimal(18,2) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_trd_exgp_posi_1 on tb_pdfupo_trd_exgp_posi (exch_group_no,asset_acco_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type);
create index idx_tb_pdfupo_trd_exgp_posi_2 on tb_pdfupo_trd_exgp_posi (co_no,pd_no,exch_no);

-- 创建数据表：产品期货_持仓_历史交易资产账户持仓表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfupo_trd_asac_posi_his;
CREATE TABLE tb_pdfupo_trd_asac_posi_his (
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
    hedge_type int NOT NULL ,
    posi_qty decimal(18,2) NOT NULL ,
    marked_pandl decimal(18,4) NOT NULL ,
    pre_strike_capt_qty decimal(18,2) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_trd_asac_posi_his_1 on tb_pdfupo_trd_asac_posi_his (init_date,asset_acco_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type);
create index idx_tb_pdfupo_trd_asac_posi_his_2 on tb_pdfupo_trd_asac_posi_his (init_date,co_no,pd_no,exch_no);

-- 创建数据表：产品期货_持仓_历史交易库交易组持仓表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfupo_trd_exgp_posi_his;
CREATE TABLE tb_pdfupo_trd_exgp_posi_his (
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
    hedge_type int NOT NULL ,
    posi_qty decimal(18,2) NOT NULL ,
    marked_pandl decimal(18,4) NOT NULL ,
    pre_strike_capt_qty decimal(18,2) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupo_trd_exgp_posi_his_1 on tb_pdfupo_trd_exgp_posi_his (init_date,exch_group_no,asset_acco_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type);
create index idx_tb_pdfupo_trd_exgp_posi_his_2 on tb_pdfupo_trd_exgp_posi_his (init_date,co_no,pd_no,exch_no);
commit;
