-- /**************************************************************************************/
-- 创建数据库【产品】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_prod DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_prod_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：产品_资金_产品资金表
use db_prod;
DROP TABLE IF EXISTS tb_pdcapit_pd_capit;
CREATE TABLE tb_pdcapit_pd_capit (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    first_amt decimal(18,4) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    pd_dist_amt decimal(18,4) NOT NULL ,
    pd_auth_amt decimal(18,4) NOT NULL ,
    amt_check_diff decimal(18,4) NOT NULL ,
    pre_settle_amt decimal(18,4) NOT NULL ,
    total_cash_divide decimal(18,4) NOT NULL ,
    total_pre_fee decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    total_change_amt decimal(18,4) NOT NULL ,
    intrst_cacl_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdcapit_pd_capit_1 on tb_pdcapit_pd_capit (pd_no,crncy_type);
create index idx_tb_pdcapit_pd_capit_2 on tb_pdcapit_pd_capit (co_no,pd_no);
create index idx_tb_pdcapit_pd_capit_3 on tb_pdcapit_pd_capit (update_date,update_time);

-- 创建数据表：产品_资金_历史产品资金表
use db_prod_his;
DROP TABLE IF EXISTS tb_pdcapit_pd_capit_his;
CREATE TABLE tb_pdcapit_pd_capit_his (
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
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    pd_dist_amt decimal(18,4) NOT NULL ,
    pd_auth_amt decimal(18,4) NOT NULL ,
    amt_check_diff decimal(18,4) NOT NULL ,
    pre_settle_amt decimal(18,4) NOT NULL ,
    total_cash_divide decimal(18,4) NOT NULL ,
    total_pre_fee decimal(18,4) NOT NULL ,
    total_rece_amt decimal(18,4) NOT NULL ,
    total_payab_amt decimal(18,4) NOT NULL ,
    total_change_amt decimal(18,4) NOT NULL ,
    intrst_cacl_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdcapit_pd_capit_his_1 on tb_pdcapit_pd_capit_his (init_date,pd_no,crncy_type);
create index idx_tb_pdcapit_pd_capit_his_2 on tb_pdcapit_pd_capit_his (init_date,co_no,pd_no);

-- 创建数据表：产品_资金_产品资金流水表
use db_prod;
DROP TABLE IF EXISTS tb_pdcapit_pd_capit_jour;
CREATE TABLE tb_pdcapit_pd_capit_jour (
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
    crncy_type varchar(3) NOT NULL ,
    busi_flag int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    occur_end_amt decimal(18,4) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdcapit_pd_capit_jour_1 on tb_pdcapit_pd_capit_jour (init_date,co_no,pd_no,crncy_type,oper_func_code);

-- 创建数据表：历史_产品_资金_产品资金流水表
use db_prod_his;
DROP TABLE IF EXISTS tb_pdcapit_pd_capit_jour_his;
CREATE TABLE tb_pdcapit_pd_capit_jour_his (
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
    crncy_type varchar(3) NOT NULL ,
    busi_flag int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    occur_end_amt decimal(18,4) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdcapit_pd_capit_jour_his_1 on tb_pdcapit_pd_capit_jour_his (init_date,co_no,pd_no,crncy_type,oper_func_code);

-- 创建数据表：产品_资金_产品资产表
use db_prod;
DROP TABLE IF EXISTS tb_pdcapit_pd_asset;
CREATE TABLE tb_pdcapit_pd_asset (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_evalu_nav_asset decimal(18,4) NOT NULL ,
    evalu_nav_asset decimal(18,4) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    total_cash_asset decimal(18,4) NOT NULL ,
    stock_cash_asset decimal(18,4) NOT NULL ,
    futu_cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    money_fund_asset decimal(18,4) NOT NULL ,
    not_money_fund_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    hk_thrgh_stock_asset decimal(18,4) NOT NULL ,
    total_fina_debt decimal(18,4) NOT NULL ,
    total_loan_debt decimal(18,4) NOT NULL ,
    futu_long_market_value decimal(18,4) NOT NULL ,
    futu_short_market_value decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdcapit_pd_asset_1 on tb_pdcapit_pd_asset (pd_no,crncy_type);
create index idx_tb_pdcapit_pd_asset_2 on tb_pdcapit_pd_asset (update_date,update_time);

-- 创建数据表：产品_资金_历史产品资产表
use db_prod_his;
DROP TABLE IF EXISTS tb_pdcapit_pd_asset_his;
CREATE TABLE tb_pdcapit_pd_asset_his (
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
    begin_evalu_nav_asset decimal(18,4) NOT NULL ,
    evalu_nav_asset decimal(18,4) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    total_cash_asset decimal(18,4) NOT NULL ,
    stock_cash_asset decimal(18,4) NOT NULL ,
    futu_cash_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    money_fund_asset decimal(18,4) NOT NULL ,
    not_money_fund_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    hk_thrgh_stock_asset decimal(18,4) NOT NULL ,
    total_fina_debt decimal(18,4) NOT NULL ,
    total_loan_debt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdcapit_pd_asset_his_1 on tb_pdcapit_pd_asset_his (init_date,pd_no,crncy_type);

-- 创建数据表：产品_资金_银行账户资金表
use db_prod;
DROP TABLE IF EXISTS tb_pdcapit_bkac_capit;
CREATE TABLE tb_pdcapit_bkac_capit (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    bank_acco_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    intrst_rate decimal(18,12) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdcapit_bkac_capit_1 on tb_pdcapit_bkac_capit (bank_acco_no,crncy_type);
create index idx_tb_pdcapit_bkac_capit_2 on tb_pdcapit_bkac_capit (co_no,pd_no,crncy_type);

-- 创建数据表：产品_资金_历史银行账户资金表
use db_prod_his;
DROP TABLE IF EXISTS tb_pdcapit_bkac_capit_his;
CREATE TABLE tb_pdcapit_bkac_capit_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    bank_acco_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    intrst_rate decimal(18,12) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    pre_entry_intrst_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdcapit_bkac_capit_his_1 on tb_pdcapit_bkac_capit_his (init_date,bank_acco_no,crncy_type);
create index idx_tb_pdcapit_bkac_capit_his_2 on tb_pdcapit_bkac_capit_his (init_date,co_no,pd_no,crncy_type);

-- 创建数据表：产品_资金_银行账户资金流水表
use db_prod;
DROP TABLE IF EXISTS tb_pdcapit_bkac_capit_jour;
CREATE TABLE tb_pdcapit_bkac_capit_jour (
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
    bank_acco_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    busi_flag int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    occur_end_amt decimal(18,4) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdcapit_bkac_capit_jour_1 on tb_pdcapit_bkac_capit_jour (init_date,bank_acco_no,crncy_type,oper_func_code);
create index idx_tb_pdcapit_bkac_capit_jour_2 on tb_pdcapit_bkac_capit_jour (init_date,co_no,pd_no,crncy_type,oper_func_code);

-- 创建数据表：历史_产品_资金_银行账户资金流水表
use db_prod_his;
DROP TABLE IF EXISTS tb_pdcapit_bkac_capit_jour_his;
CREATE TABLE tb_pdcapit_bkac_capit_jour_his (
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
    bank_acco_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    busi_flag int NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    occur_end_amt decimal(18,4) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdcapit_bkac_capit_jour_his_1 on tb_pdcapit_bkac_capit_jour_his (init_date,bank_acco_no,crncy_type,oper_func_code);
create index idx_tb_pdcapit_bkac_capit_jour_his_2 on tb_pdcapit_bkac_capit_jour_his (init_date,co_no,pd_no,crncy_type,oper_func_code);

-- 创建数据表：产品_资金_科目资金流水表
use db_prod;
DROP TABLE IF EXISTS tb_pdcapit_fina_capit_jour;
CREATE TABLE tb_pdcapit_fina_capit_jour (
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
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdcapit_fina_capit_jour_1 on tb_pdcapit_fina_capit_jour (init_date,co_no,pd_no,busi_flag,pd_fee_type);

-- 创建数据表：历史_产品_资金_科目资金流水表
use db_prod_his;
DROP TABLE IF EXISTS tb_pdcapit_fina_capit_jour_his;
CREATE TABLE tb_pdcapit_fina_capit_jour_his (
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
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdcapit_fina_capit_jour_his_1 on tb_pdcapit_fina_capit_jour_his (init_date,co_no,pd_no,busi_flag,pd_fee_type);

-- 创建数据表：产品_资金_止损参数表
use db_prod;
DROP TABLE IF EXISTS tb_pdcapit_stop_loss_param;
CREATE TABLE tb_pdcapit_stop_loss_param (
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
create unique index idx_tb_pdcapit_stop_loss_param_1 on tb_pdcapit_stop_loss_param (co_no,pd_no);
commit;
