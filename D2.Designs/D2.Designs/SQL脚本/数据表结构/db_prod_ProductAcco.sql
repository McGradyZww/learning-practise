-- /**************************************************************************************/
-- 创建数据库【产品】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_prod DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_prod_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：产品_账户_机构业务记录编号表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_co_busi_record_no;
CREATE TABLE tb_pdacco_co_busi_record_no (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    record_no_type int NOT NULL ,
    curr_no bigint NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdacco_co_busi_record_no_1 on tb_pdacco_co_busi_record_no (co_no,record_no_type);

-- 创建数据表：产品_账户_产品信息表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_pd_info;
CREATE TABLE tb_pdacco_pd_info (
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
    fund_reg_code varchar(16) NOT NULL ,
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
    begin_NAV decimal(18,4) NOT NULL ,
    evalu_share decimal(18,2) NOT NULL ,
    pre_evalu_share decimal(18,2) NOT NULL ,
    coust_full_name varchar(255) NOT NULL ,
    coust_acco varchar(16) NOT NULL ,
    coust_acco_name varchar(64) NOT NULL ,
    warn_posi_value decimal(18,4) NOT NULL ,
    close_posi_value decimal(18,4) NOT NULL ,
    target_posi_ratio decimal(18,4) NOT NULL ,
    beta_coeffi decimal(18,12) NOT NULL ,
    custom_pd_class varchar(255) NOT NULL ,
    index_value int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdacco_pd_info_1 on tb_pdacco_pd_info (co_no,pd_code);
create index idx_tb_pdacco_pd_info_2 on tb_pdacco_pd_info (pd_no);
create index idx_tb_pdacco_pd_info_3 on tb_pdacco_pd_info (update_date,update_time);

-- 创建数据表：产品_账户_历史产品信息表
use db_prod_his;
DROP TABLE IF EXISTS tb_pdacco_pd_info_his;
CREATE TABLE tb_pdacco_pd_info_his (
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
    fund_reg_code varchar(16) NOT NULL ,
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
    evalu_share decimal(18,2) NOT NULL ,
    pre_evalu_share decimal(18,2) NOT NULL ,
    coust_full_name varchar(255) NOT NULL ,
    coust_acco varchar(16) NOT NULL ,
    coust_acco_name varchar(64) NOT NULL ,
    warn_posi_value decimal(18,4) NOT NULL ,
    close_posi_value decimal(18,4) NOT NULL ,
    target_posi_ratio decimal(18,4) NOT NULL ,
    beta_coeffi decimal(18,12) NOT NULL ,
    custom_pd_class varchar(255) NOT NULL ,
    index_value int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdacco_pd_info_his_1 on tb_pdacco_pd_info_his (init_date,co_no,pd_code);
create index idx_tb_pdacco_pd_info_his_2 on tb_pdacco_pd_info_his (init_date,pd_no);

-- 创建数据表：产品_账户_产品信息流水表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_pd_info_jour;
CREATE TABLE tb_pdacco_pd_info_jour (
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
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdacco_pd_info_jour_1 on tb_pdacco_pd_info_jour (init_date,pd_no);
create index idx_tb_pdacco_pd_info_jour_2 on tb_pdacco_pd_info_jour (init_date,co_no);
create index idx_tb_pdacco_pd_info_jour_3 on tb_pdacco_pd_info_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_产品_账户_产品信息流水表
use db_prod_his;
DROP TABLE IF EXISTS tb_pdacco_pd_info_jour_his;
CREATE TABLE tb_pdacco_pd_info_jour_his (
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
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdacco_pd_info_jour_his_1 on tb_pdacco_pd_info_jour_his (init_date,pd_no);
create index idx_tb_pdacco_pd_info_jour_his_2 on tb_pdacco_pd_info_jour_his (init_date,co_no);
create index idx_tb_pdacco_pd_info_jour_his_3 on tb_pdacco_pd_info_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：产品_账户_产品限制信息表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_pd_limit;
CREATE TABLE tb_pdacco_pd_limit (
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
    comm_no_limit_price_ratio decimal(18,12) NOT NULL ,
    abolish_date int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdacco_pd_limit_1 on tb_pdacco_pd_limit (pd_no);
create index idx_tb_pdacco_pd_limit_2 on tb_pdacco_pd_limit (co_no);
create index idx_tb_pdacco_pd_limit_3 on tb_pdacco_pd_limit (update_date,update_time);

-- 创建数据表：产品_账户_历史产品限制信息表
use db_prod_his;
DROP TABLE IF EXISTS tb_pdacco_pd_limit_his;
CREATE TABLE tb_pdacco_pd_limit_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
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
    comm_no_limit_price_ratio decimal(18,12) NOT NULL ,
    abolish_date int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdacco_pd_limit_his_1 on tb_pdacco_pd_limit_his (init_date,pd_no);
create index idx_tb_pdacco_pd_limit_his_2 on tb_pdacco_pd_limit_his (init_date,co_no);

-- 创建数据表：产品_账户_产品限制信息流水表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_pd_limit_jour;
CREATE TABLE tb_pdacco_pd_limit_jour (
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
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdacco_pd_limit_jour_1 on tb_pdacco_pd_limit_jour (init_date,pd_no);
create index idx_tb_pdacco_pd_limit_jour_2 on tb_pdacco_pd_limit_jour (init_date,co_no);
create index idx_tb_pdacco_pd_limit_jour_3 on tb_pdacco_pd_limit_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_产品_账户_产品限制信息流水表
use db_prod_his;
DROP TABLE IF EXISTS tb_pdacco_pd_limit_jour_his;
CREATE TABLE tb_pdacco_pd_limit_jour_his (
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
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdacco_pd_limit_jour_his_1 on tb_pdacco_pd_limit_jour_his (init_date,pd_no);
create index idx_tb_pdacco_pd_limit_jour_his_2 on tb_pdacco_pd_limit_jour_his (init_date,co_no);
create index idx_tb_pdacco_pd_limit_jour_his_3 on tb_pdacco_pd_limit_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：产品_账户_银行账户信息表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_bank_acco;
CREATE TABLE tb_pdacco_bank_acco (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    bank_acco_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    bank_code varchar(32) NOT NULL ,
    bank_name varchar(64) NOT NULL ,
    bank_acco varchar(16) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdacco_bank_acco_1 on tb_pdacco_bank_acco (pd_no,bank_code);
create index idx_tb_pdacco_bank_acco_2 on tb_pdacco_bank_acco (bank_acco_no);
create index idx_tb_pdacco_bank_acco_3 on tb_pdacco_bank_acco (co_no);

-- 创建数据表：产品_账户_银行账户信息流水表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_bank_acco_jour;
CREATE TABLE tb_pdacco_bank_acco_jour (
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
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdacco_bank_acco_jour_1 on tb_pdacco_bank_acco_jour (init_date,bank_acco_no);
create index idx_tb_pdacco_bank_acco_jour_2 on tb_pdacco_bank_acco_jour (init_date,co_no,pd_no);
create index idx_tb_pdacco_bank_acco_jour_3 on tb_pdacco_bank_acco_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_产品_账户_银行账户信息流水表
use db_prod_his;
DROP TABLE IF EXISTS tb_pdacco_bank_acco_jour_his;
CREATE TABLE tb_pdacco_bank_acco_jour_his (
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
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdacco_bank_acco_jour_his_1 on tb_pdacco_bank_acco_jour_his (init_date,bank_acco_no);
create index idx_tb_pdacco_bank_acco_jour_his_2 on tb_pdacco_bank_acco_jour_his (init_date,co_no,pd_no);
create index idx_tb_pdacco_bank_acco_jour_his_3 on tb_pdacco_bank_acco_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：产品_账户_资产账户信息表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_asset_acco;
CREATE TABLE tb_pdacco_asset_acco (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    asset_acco_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    asset_acco_name varchar(64) NOT NULL ,
    asset_acco_type int NOT NULL ,
    trade_pwd varchar(64) NOT NULL ,
    asset_acco_status varchar(2) NOT NULL ,
    busi_config_str varchar(64) NOT NULL ,
    market_price_ratio decimal(18,12) NOT NULL ,
    allow_exch varchar(64) NOT NULL ,
    allow_stock_type varchar(2048) NOT NULL ,
    split_fee_typr_str varchar(64) NOT NULL ,
    busi_limit_str varchar(2048) NOT NULL ,
    exter_comm_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    busi_depart varchar(255) NOT NULL ,
    abolish_date int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdacco_asset_acco_1 on tb_pdacco_asset_acco (co_no,asset_acco);
create index idx_tb_pdacco_asset_acco_2 on tb_pdacco_asset_acco (asset_acco_no);
create index idx_tb_pdacco_asset_acco_3 on tb_pdacco_asset_acco (co_no,pd_no);
create index idx_tb_pdacco_asset_acco_4 on tb_pdacco_asset_acco (update_date,update_time);

-- 创建数据表：产品_账户_资产账户信息流水表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_asset_acco_jour;
CREATE TABLE tb_pdacco_asset_acco_jour (
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
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdacco_asset_acco_jour_1 on tb_pdacco_asset_acco_jour (init_date,asset_acco_no);
create index idx_tb_pdacco_asset_acco_jour_2 on tb_pdacco_asset_acco_jour (init_date,opor_co_no,opor_no);
create index idx_tb_pdacco_asset_acco_jour_3 on tb_pdacco_asset_acco_jour (init_date,co_no,pd_no);

-- 创建数据表：历史_产品_账户_资产账户信息流水表
use db_prod_his;
DROP TABLE IF EXISTS tb_pdacco_asset_acco_jour_his;
CREATE TABLE tb_pdacco_asset_acco_jour_his (
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
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdacco_asset_acco_jour_his_1 on tb_pdacco_asset_acco_jour_his (init_date,asset_acco_no);
create index idx_tb_pdacco_asset_acco_jour_his_2 on tb_pdacco_asset_acco_jour_his (init_date,opor_co_no,opor_no);
create index idx_tb_pdacco_asset_acco_jour_his_3 on tb_pdacco_asset_acco_jour_his (init_date,co_no,pd_no);

-- 创建数据表：产品_账户_资产账户通道信息表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_asset_acco_ch;
CREATE TABLE tb_pdacco_asset_acco_ch (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    pass_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_type int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    trade_pwd varchar(64) NOT NULL ,
    comm_pwd varchar(64) NOT NULL ,
    online_status int NOT NULL ,
    config_str varchar(2048) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    pwd_check_status int NOT NULL ,
    read_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdacco_asset_acco_ch_1 on tb_pdacco_asset_acco_ch (asset_acco_no);
create index idx_tb_pdacco_asset_acco_ch_2 on tb_pdacco_asset_acco_ch (pass_no);
create index idx_tb_pdacco_asset_acco_ch_3 on tb_pdacco_asset_acco_ch (co_no,pd_no);
create index idx_tb_pdacco_asset_acco_ch_4 on tb_pdacco_asset_acco_ch (update_date,update_time);
create index idx_tb_pdacco_asset_acco_ch_5 on tb_pdacco_asset_acco_ch (out_acco);

-- 创建数据表：产品_账户_资产账户通道信息流水表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_asset_acco_ch_jour;
CREATE TABLE tb_pdacco_asset_acco_ch_jour (
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
    pass_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdacco_asset_acco_ch_jour_1 on tb_pdacco_asset_acco_ch_jour (init_date,pass_no);
create index idx_tb_pdacco_asset_acco_ch_jour_2 on tb_pdacco_asset_acco_ch_jour (init_date,co_no,pd_no,asset_acco_no);
create index idx_tb_pdacco_asset_acco_ch_jour_3 on tb_pdacco_asset_acco_ch_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_产品_账户_资产账户通道信息流水表
use db_prod_his;
DROP TABLE IF EXISTS tb_pdacco_asset_acco_ch_jour_his;
CREATE TABLE tb_pdacco_asset_acco_ch_jour_his (
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
    pass_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdacco_asset_acco_ch_jour_his_1 on tb_pdacco_asset_acco_ch_jour_his (init_date,pass_no);
create index idx_tb_pdacco_asset_acco_ch_jour_his_2 on tb_pdacco_asset_acco_ch_jour_his (init_date,co_no,pd_no,asset_acco_no);
create index idx_tb_pdacco_asset_acco_ch_jour_his_3 on tb_pdacco_asset_acco_ch_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：产品_账户_产品工作流信息表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_pd_workflow;
CREATE TABLE tb_pdacco_pd_workflow (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    workflow_type int NOT NULL ,
    pd_no int NOT NULL ,
    workflow_num int NOT NULL ,
    opor_no_str varchar(2048) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdacco_pd_workflow_1 on tb_pdacco_pd_workflow (pd_no);

-- 创建数据表：产品_账户_开盘检查流程表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_open_check_flow;
CREATE TABLE tb_pdacco_open_check_flow (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    execute_type int NOT NULL ,
    init_step int NOT NULL ,
    begin_time int NOT NULL ,
    exec_date int NOT NULL ,
    exec_time int NOT NULL ,
    open_execute_type int NOT NULL ,
    open_execute_result int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdacco_open_check_flow_1 on tb_pdacco_open_check_flow (init_step,exec_date);

-- 创建数据表：产品_账户_收盘作业流程表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_close_check_flow;
CREATE TABLE tb_pdacco_close_check_flow (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    flow_business int NOT NULL ,
    execute_type int NOT NULL ,
    begin_time int NOT NULL ,
    exec_date int NOT NULL ,
    exec_time int NOT NULL ,
    close_execute_type int NOT NULL ,
    error_deal_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdacco_close_check_flow_1 on tb_pdacco_close_check_flow (flow_business,exec_date);

-- 创建数据表：产品_账户_产品关系表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_pd_relation;
CREATE TABLE tb_pdacco_pd_relation (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    pd_no int NOT NULL ,
    co_no int NOT NULL ,
    mum_pd_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdacco_pd_relation_1 on tb_pdacco_pd_relation (pd_no,mum_pd_no);
create index idx_tb_pdacco_pd_relation_2 on tb_pdacco_pd_relation (co_no,pd_no);
create index idx_tb_pdacco_pd_relation_3 on tb_pdacco_pd_relation (mum_pd_no);

-- 创建数据表：产品_账户_产品关系流水表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_pd_relation_jour;
CREATE TABLE tb_pdacco_pd_relation_jour (
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
    mum_pd_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdacco_pd_relation_jour_1 on tb_pdacco_pd_relation_jour (init_date,pd_no);
create index idx_tb_pdacco_pd_relation_jour_2 on tb_pdacco_pd_relation_jour (init_date,co_no);

-- 创建数据表：历史_产品_账户_产品关系流水表
use db_prod_his;
DROP TABLE IF EXISTS tb_pdacco_pd_relation_jour_his;
CREATE TABLE tb_pdacco_pd_relation_jour_his (
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
    mum_pd_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdacco_pd_relation_jour_his_1 on tb_pdacco_pd_relation_jour_his (init_date,pd_no);
create index idx_tb_pdacco_pd_relation_jour_his_2 on tb_pdacco_pd_relation_jour_his (init_date,co_no);

-- 创建数据表：产品_账户_融资融券配置表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_fina_loan_config;
CREATE TABLE tb_pdacco_fina_loan_config (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pd_no int NOT NULL ,
    fina_return_type int NOT NULL ,
    sell_auto_back_debt int NOT NULL ,
    fina_limit_max decimal(18,4) NOT NULL ,
    loan_limit_max decimal(18,4) NOT NULL ,
    fina_year_intrst_rate decimal(18,12) NOT NULL ,
    secu_loan_year_intrst_rate decimal(18,12) NOT NULL ,
    close_posi_keep_guarantee_ratio decimal(18,12) NOT NULL ,
    fill_posi_keep_guarantee_ratio decimal(18,12) NOT NULL ,
    extract_guarantee_ratio decimal(18,12) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdacco_fina_loan_config_1 on tb_pdacco_fina_loan_config (co_no,asset_acco_no,pd_no);
create index idx_tb_pdacco_fina_loan_config_2 on tb_pdacco_fina_loan_config (asset_acco_no);

-- 创建数据表：产品_账户_资产账户默认交易组信息表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_asset_acco_default_exgp;
CREATE TABLE tb_pdacco_asset_acco_default_exgp (
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
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdacco_asset_acco_default_exgp_1 on tb_pdacco_asset_acco_default_exgp (asset_acco_no);

-- 创建数据表：产品_账户_报盘回写通道信息表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_trans_chanel_info_writein;
CREATE TABLE tb_pdacco_trans_chanel_info_writein (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    offer_server_name varchar(64) NOT NULL ,
    offer_server_ip varchar(64) NOT NULL ,
    mac_addr varchar(32) NOT NULL ,
    offer_name varchar(32) NOT NULL ,
    software_start_time int NOT NULL ,
    pass_no int NOT NULL ,
    pass_status varchar(2) NOT NULL ,
    bkup_field_1 varchar(32) NOT NULL ,
    bkup_field_2 int NOT NULL ,
    bkup_field_3 decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdacco_trans_chanel_info_writein_1 on tb_pdacco_trans_chanel_info_writein (offer_name,pass_no,mac_addr);

-- 创建数据表：产品_账户_产品库删除流水表
use db_prod;
DROP TABLE IF EXISTS tb_pdacco_prod_delete_jour;
CREATE TABLE tb_pdacco_prod_delete_jour (
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
    table_name varchar(64) NOT NULL ,
    table_row_id bigint NOT NULL ,
    table_field_value varchar(10000) NOT NULL ,
    table_uni_index_value varchar(10000) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdacco_prod_delete_jour_1 on tb_pdacco_prod_delete_jour (table_name);
create index idx_tb_pdacco_prod_delete_jour_2 on tb_pdacco_prod_delete_jour (init_date);

-- 创建数据表：历史_产品_账户_产品库删除流水表
use db_prod_his;
DROP TABLE IF EXISTS tb_pdacco_prod_delete_jour_his;
CREATE TABLE tb_pdacco_prod_delete_jour_his (
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
    table_name varchar(64) NOT NULL ,
    table_row_id bigint NOT NULL ,
    table_field_value varchar(10000) NOT NULL ,
    table_uni_index_value varchar(10000) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdacco_prod_delete_jour_his_1 on tb_pdacco_prod_delete_jour_his (table_name);
create index idx_tb_pdacco_prod_delete_jour_his_2 on tb_pdacco_prod_delete_jour_his (init_date);
commit;
