-- /**************************************************************************************/
-- 创建数据库【公共】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：公共_用户_操作员信息表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_info;
CREATE TABLE tb_user_opor_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    opor_name varchar(64) NOT NULL ,
    opor_type int NOT NULL ,
    opor_pwd varchar(64) NOT NULL ,
    opor_status varchar(2) NOT NULL ,
    create_opor int NOT NULL ,
    conta_addr varchar(255) NOT NULL ,
    oper_rights int NOT NULL ,
    phone_number varchar(16) NOT NULL ,
    email varchar(255) NOT NULL ,
    is_trader int NOT NULL ,
    trader_no int NOT NULL ,
    allow_login_type varchar(64) NOT NULL ,
    allow_oper_ip_addr varchar(255) NOT NULL ,
    allow_oper_mac varchar(255) NOT NULL ,
    index_value int NOT NULL ,
    manage_nolgn_opor_orders int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_user_opor_info_1 on tb_user_opor_info (opor_no);
create index idx_tb_user_opor_info_2 on tb_user_opor_info (trader_no);
create index idx_tb_user_opor_info_3 on tb_user_opor_info (co_no);
create index idx_tb_user_opor_info_4 on tb_user_opor_info (update_date,update_time);

-- 创建数据表：公共_用户_操作员登录信息表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_login_info;
CREATE TABLE tb_user_opor_login_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    oper_info varchar(1024) NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    online_status int NOT NULL ,
    login_count int NOT NULL ,
    login_error_count int NOT NULL ,
    client_version varchar(16) NOT NULL ,
    oper_ip_addr varchar(32) NOT NULL ,
    oper_mac varchar(32) NOT NULL ,
    change_pwd_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_user_opor_login_info_1 on tb_user_opor_login_info (opor_no,oper_way);
create index idx_tb_user_opor_login_info_2 on tb_user_opor_login_info (co_no);

-- 创建数据表：公共_用户_操作员配置表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_param;
CREATE TABLE tb_user_opor_param (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    config_no bigint NOT NULL ,
    config_name varchar(64) NOT NULL ,
    config_value varchar(2048) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_user_opor_param_1 on tb_user_opor_param (opor_no,config_no);
create index idx_tb_user_opor_param_2 on tb_user_opor_param (co_no);

-- 创建数据表：公共_用户_操作员信息流水表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_info_jour;
CREATE TABLE tb_user_opor_info_jour (
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
    target_opor_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_user_opor_info_jour_1 on tb_user_opor_info_jour (init_date,co_no,target_opor_no);
create index idx_tb_user_opor_info_jour_2 on tb_user_opor_info_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_用户_操作员信息流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_user_opor_info_jour_his;
CREATE TABLE tb_user_opor_info_jour_his (
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
    target_opor_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_user_opor_info_jour_his_1 on tb_user_opor_info_jour_his (init_date,co_no,target_opor_no);
create index idx_tb_user_opor_info_jour_his_2 on tb_user_opor_info_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_用户_操作员可操作机构表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_allow_co;
CREATE TABLE tb_user_opor_allow_co (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    abolish_status varchar(2) NOT NULL ,
    oper_rights int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_user_opor_allow_co_1 on tb_user_opor_allow_co (opor_no,co_no);
create index idx_tb_user_opor_allow_co_2 on tb_user_opor_allow_co (co_no);
create index idx_tb_user_opor_allow_co_3 on tb_user_opor_allow_co (update_date,update_time);

-- 创建数据表：公共_用户_操作员可操作机构流水表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_allow_co_jour;
CREATE TABLE tb_user_opor_allow_co_jour (
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
    target_opor_no int NOT NULL ,
    co_no int NOT NULL ,
    oper_rights int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_user_opor_allow_co_jour_1 on tb_user_opor_allow_co_jour (init_date,target_opor_no,co_no);

-- 创建数据表：历史_公共_用户_操作员可操作机构流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_user_opor_allow_co_jour_his;
CREATE TABLE tb_user_opor_allow_co_jour_his (
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
    target_opor_no int NOT NULL ,
    co_no int NOT NULL ,
    oper_rights int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_user_opor_allow_co_jour_his_1 on tb_user_opor_allow_co_jour_his (init_date,target_opor_no,co_no);

-- 创建数据表：公共_用户_操作员可操作产品表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_allow_prod;
CREATE TABLE tb_user_opor_allow_prod (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    abolish_status varchar(2) NOT NULL ,
    oper_rights int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_user_opor_allow_prod_1 on tb_user_opor_allow_prod (opor_no,pd_no);
create index idx_tb_user_opor_allow_prod_2 on tb_user_opor_allow_prod (co_no,opor_no,pd_no);
create index idx_tb_user_opor_allow_prod_3 on tb_user_opor_allow_prod (pd_no);
create index idx_tb_user_opor_allow_prod_4 on tb_user_opor_allow_prod (update_date,update_time);

-- 创建数据表：公共_用户_操作员可操作产品流水表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_allow_prod_jour;
CREATE TABLE tb_user_opor_allow_prod_jour (
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
    target_opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    oper_rights int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_user_opor_allow_prod_jour_1 on tb_user_opor_allow_prod_jour (init_date,target_opor_no,pd_no);

-- 创建数据表：历史_公共_用户_操作员可操作产品流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_user_opor_allow_prod_jour_his;
CREATE TABLE tb_user_opor_allow_prod_jour_his (
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
    target_opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    oper_rights int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_user_opor_allow_prod_jour_his_1 on tb_user_opor_allow_prod_jour_his (init_date,target_opor_no,pd_no);

-- 创建数据表：公共_用户_交易组信息表
use db_pub;
DROP TABLE IF EXISTS tb_user_exch_group_info;
CREATE TABLE tb_user_exch_group_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_group_no int NOT NULL ,
    co_no int NOT NULL ,
    exch_group_code varchar(32) NOT NULL ,
    exch_group_name varchar(64) NOT NULL ,
    exch_group_status varchar(2) NOT NULL ,
    default_group_flag int NOT NULL ,
    pd_no int NOT NULL ,
    first_asset decimal(18,4) NOT NULL ,
    exch_group_dist_pd_amt decimal(18,4) NOT NULL ,
    exch_group_pd_share decimal(18,2) NOT NULL ,
    pre_exch_group_pd_share decimal(18,2) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    allow_exch varchar(64) NOT NULL ,
    allow_stock_type varchar(2048) NOT NULL ,
    busi_config_str varchar(64) NOT NULL ,
    market_price_ratio decimal(18,12) NOT NULL ,
    forbid_order_dir varchar(64) NOT NULL ,
    weight_value decimal(18,4) NOT NULL ,
    trade_acco varchar(32) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    abolish_date int NOT NULL ,
    futu_default_group_flag int NOT NULL ,
    fina_loan_default_group_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_user_exch_group_info_1 on tb_user_exch_group_info (co_no,exch_group_code);
create index idx_tb_user_exch_group_info_2 on tb_user_exch_group_info (exch_group_no);
create index idx_tb_user_exch_group_info_3 on tb_user_exch_group_info (pd_no);
create index idx_tb_user_exch_group_info_4 on tb_user_exch_group_info (update_date,update_time);

-- 创建数据表：公共_用户_历史交易组信息表
use db_pub_his;
DROP TABLE IF EXISTS tb_user_exch_group_info_his;
CREATE TABLE tb_user_exch_group_info_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    exch_group_no int NOT NULL ,
    co_no int NOT NULL ,
    exch_group_code varchar(32) NOT NULL ,
    exch_group_name varchar(64) NOT NULL ,
    exch_group_status varchar(2) NOT NULL ,
    default_group_flag int NOT NULL ,
    pd_no int NOT NULL ,
    first_asset decimal(18,4) NOT NULL ,
    exch_group_dist_pd_amt decimal(18,4) NOT NULL ,
    exch_group_pd_share decimal(18,2) NOT NULL ,
    pre_exch_group_pd_share decimal(18,2) NOT NULL ,
    pre_nav decimal(18,4) NOT NULL ,
    begin_NAV decimal(18,4) NOT NULL ,
    allow_exch varchar(64) NOT NULL ,
    allow_stock_type varchar(2048) NOT NULL ,
    busi_config_str varchar(64) NOT NULL ,
    market_price_ratio decimal(18,12) NOT NULL ,
    forbid_order_dir varchar(64) NOT NULL ,
    weight_value decimal(18,4) NOT NULL ,
    trade_acco varchar(32) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    abolish_date int NOT NULL ,
    futu_default_group_flag int NOT NULL ,
    fina_loan_default_group_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_user_exch_group_info_his_1 on tb_user_exch_group_info_his (init_date,co_no,exch_group_code);
create index idx_tb_user_exch_group_info_his_2 on tb_user_exch_group_info_his (init_date,exch_group_no);
create index idx_tb_user_exch_group_info_his_3 on tb_user_exch_group_info_his (init_date,pd_no);

-- 创建数据表：公共_用户_交易组信息流水表
use db_pub;
DROP TABLE IF EXISTS tb_user_exch_group_info_jour;
CREATE TABLE tb_user_exch_group_info_jour (
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
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_user_exch_group_info_jour_1 on tb_user_exch_group_info_jour (init_date,co_no,exch_group_no);
create index idx_tb_user_exch_group_info_jour_2 on tb_user_exch_group_info_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_用户_交易组信息流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_user_exch_group_info_jour_his;
CREATE TABLE tb_user_exch_group_info_jour_his (
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
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_user_exch_group_info_jour_his_1 on tb_user_exch_group_info_jour_his (init_date,co_no,exch_group_no);
create index idx_tb_user_exch_group_info_jour_his_2 on tb_user_exch_group_info_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_用户_交易组资产表
use db_pub;
DROP TABLE IF EXISTS tb_user_exch_group_asset;
CREATE TABLE tb_user_exch_group_asset (
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
    total_realiz_pandl decimal(18,4) NOT NULL ,
    many_days_total_asset decimal(18,4) NOT NULL ,
    stat_days int NOT NULL ,
    begin_evalu_nav_asset decimal(18,4) NOT NULL ,
    evalu_nav_asset decimal(18,4) NOT NULL ,
    total_fina_debt decimal(18,4) NOT NULL ,
    total_loan_debt decimal(18,4) NOT NULL ,
    futu_long_market_value decimal(18,4) NOT NULL ,
    futu_short_market_value decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_user_exch_group_asset_1 on tb_user_exch_group_asset (exch_group_no,crncy_type);
create index idx_tb_user_exch_group_asset_2 on tb_user_exch_group_asset (update_date,update_time);

-- 创建数据表：公共_用户_历史交易组资产表
use db_pub_his;
DROP TABLE IF EXISTS tb_user_exch_group_asset_his;
CREATE TABLE tb_user_exch_group_asset_his (
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
    total_realiz_pandl decimal(18,4) NOT NULL ,
    many_days_total_asset decimal(18,4) NOT NULL ,
    stat_days int NOT NULL ,
    begin_evalu_nav_asset decimal(18,4) NOT NULL ,
    evalu_nav_asset decimal(18,4) NOT NULL ,
    total_fina_debt decimal(18,4) NOT NULL ,
    total_loan_debt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_user_exch_group_asset_his_1 on tb_user_exch_group_asset_his (init_date,exch_group_no,crncy_type);

-- 创建数据表：公共_用户_操作员所属交易组表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_exch_group;
CREATE TABLE tb_user_opor_exch_group (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    abolish_status varchar(2) NOT NULL ,
    oper_rights int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_user_opor_exch_group_1 on tb_user_opor_exch_group (opor_no,exch_group_no);
create index idx_tb_user_opor_exch_group_2 on tb_user_opor_exch_group (co_no,opor_no,pd_no,exch_group_no);
create index idx_tb_user_opor_exch_group_3 on tb_user_opor_exch_group (update_date,update_time);

-- 创建数据表：公共_用户_操作员所属交易组流水表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_exch_group_jour;
CREATE TABLE tb_user_opor_exch_group_jour (
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
    target_opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    oper_rights int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_user_opor_exch_group_jour_1 on tb_user_opor_exch_group_jour (init_date,target_opor_no,exch_group_no);

-- 创建数据表：历史_公共_用户_操作员所属交易组流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_user_opor_exch_group_jour_his;
CREATE TABLE tb_user_opor_exch_group_jour_his (
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
    target_opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    oper_rights int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_user_opor_exch_group_jour_his_1 on tb_user_opor_exch_group_jour_his (init_date,target_opor_no,exch_group_no);

-- 创建数据表：公共_用户_操作员可操作操作员表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_allow_opor;
CREATE TABLE tb_user_opor_allow_opor (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    allow_opor_no int NOT NULL ,
    abolish_status varchar(2) NOT NULL ,
    oper_rights int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_user_opor_allow_opor_1 on tb_user_opor_allow_opor (opor_no,allow_opor_no);
create index idx_tb_user_opor_allow_opor_2 on tb_user_opor_allow_opor (allow_opor_no);

-- 创建数据表：公共_用户_操作员可操作操作员流水表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_allow_opor_jour;
CREATE TABLE tb_user_opor_allow_opor_jour (
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
    target_opor_no int NOT NULL ,
    co_no int NOT NULL ,
    allow_opor_no int NOT NULL ,
    oper_rights int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_user_opor_allow_opor_jour_1 on tb_user_opor_allow_opor_jour (init_date,target_opor_no,allow_opor_no);

-- 创建数据表：历史_公共_用户_操作员可操作操作员流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_user_opor_allow_opor_jour_his;
CREATE TABLE tb_user_opor_allow_opor_jour_his (
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
    target_opor_no int NOT NULL ,
    co_no int NOT NULL ,
    allow_opor_no int NOT NULL ,
    oper_rights int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_user_opor_allow_opor_jour_his_1 on tb_user_opor_allow_opor_jour_his (init_date,target_opor_no,allow_opor_no);

-- 创建数据表：公共_用户_操作员表格显示保存表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_dbgrid_layout;
CREATE TABLE tb_user_opor_dbgrid_layout (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    parent_panel varchar(64) NOT NULL ,
    dbgrid_name varchar(64) NOT NULL ,
    dbgrid_key varchar(64) NOT NULL ,
    dbgrid_field varchar(64) NOT NULL ,
    field_width int NOT NULL ,
    field_order int NOT NULL ,
    client_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_user_opor_dbgrid_layout_1 on tb_user_opor_dbgrid_layout (opor_no,parent_panel,dbgrid_name,dbgrid_key,client_type);

-- 创建数据表：公共_用户_产品账户交易组组别表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_prod_exch_group;
CREATE TABLE tb_user_opor_prod_exch_group (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    group_no int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    group_name varchar(64) NOT NULL ,
    pd_account_group_type int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_user_opor_prod_exch_group_1 on tb_user_opor_prod_exch_group (group_no);

-- 创建数据表：公共_用户_产品账户交易组组别明细表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_prod_exch_group_detail;
CREATE TABLE tb_user_opor_prod_exch_group_detail (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    group_no int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    weight_ratio decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_user_opor_prod_exch_group_detail_1 on tb_user_opor_prod_exch_group_detail (group_no,opor_no,co_no,pd_no,asset_acco_no,exch_group_no);

-- 创建数据表：公共_用户_操作员权限表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_rights;
CREATE TABLE tb_user_opor_rights (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    allow_oper_mac varchar(255) NOT NULL ,
    opor_rights_str varchar(16) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_user_opor_rights_1 on tb_user_opor_rights (opor_no);

-- 创建数据表：公共_用户_操作员权限流水表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_rights_jour;
CREATE TABLE tb_user_opor_rights_jour (
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
    target_opor_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_user_opor_rights_jour_1 on tb_user_opor_rights_jour (init_date,opor_no);

-- 创建数据表：历史_公共_用户_操作员权限流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_user_opor_rights_jour_his;
CREATE TABLE tb_user_opor_rights_jour_his (
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
    target_opor_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_user_opor_rights_jour_his_1 on tb_user_opor_rights_jour_his (init_date,opor_no);

-- 创建数据表：公共_用户_操作员登录地址信息表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_login_address_info;
CREATE TABLE tb_user_opor_login_address_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    oper_info varchar(1024) NOT NULL ,
    oper_mac varchar(32) NOT NULL ,
    oper_ip_addr varchar(32) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_user_opor_login_address_info_1 on tb_user_opor_login_address_info (opor_no,oper_mac);

-- 创建数据表：公共_用户_期现对冲组合表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_fuse_hedg;
CREATE TABLE tb_user_opor_fuse_hedg (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    comm_trd_type int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    hedg_name varchar(255) NOT NULL ,
    futu_exch_group_no int NOT NULL ,
    futu_asset_acco_no int NOT NULL ,
    futu_order_pd_no int NOT NULL ,
    secu_exch_group_no int NOT NULL ,
    secu_asset_acco_no int NOT NULL ,
    secu_order_pd_no int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：公共_用户_期现对冲方案信息表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_fuse_plan_info;
CREATE TABLE tb_user_opor_fuse_plan_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    comm_trd_type int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    hedg_plan_name varchar(255) NOT NULL ,
    contrc_code_no int NOT NULL ,
    futu_qty decimal(18,2) NOT NULL ,
    basket_qty decimal(18,2) NOT NULL ,
    basket_id bigint NOT NULL ,
    plan_type int NOT NULL ,
    hedg_no bigint NOT NULL ,
    hedging_pankou decimal(18,4) NOT NULL ,
    futu_price_offset decimal(16,9) NOT NULL ,
    price_offset decimal(16,9) NOT NULL ,
    target_base_diff decimal(18,4) NOT NULL ,
    template_base_diff decimal(18,4) NOT NULL ,
    up_value_ratio decimal(18,12) NOT NULL ,
    down_value_ratio decimal(18,12) NOT NULL ,
    stop_value_ratio decimal(18,12) NOT NULL ,
    cash_replace_amt decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：公共_用户_操作员可设置操作员表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_allowset_opor;
CREATE TABLE tb_user_opor_allowset_opor (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    allow_opor_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_user_opor_allowset_opor_1 on tb_user_opor_allowset_opor (opor_no,allow_opor_no);
create index idx_tb_user_opor_allowset_opor_2 on tb_user_opor_allowset_opor (allow_opor_no);

-- 创建数据表：公共_用户_操作员可设置操作员流水表
use db_pub;
DROP TABLE IF EXISTS tb_user_opor_allowset_opor_jour;
CREATE TABLE tb_user_opor_allowset_opor_jour (
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
    target_opor_no int NOT NULL ,
    co_no int NOT NULL ,
    allow_opor_no int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_user_opor_allowset_opor_jour_1 on tb_user_opor_allowset_opor_jour (init_date,target_opor_no,allow_opor_no);

-- 创建数据表：历史_公共_用户_操作员可设置操作员流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_user_opor_allowset_opor_jour_his;
CREATE TABLE tb_user_opor_allowset_opor_jour_his (
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
    target_opor_no int NOT NULL ,
    co_no int NOT NULL ,
    allow_opor_no int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_user_opor_allowset_opor_jour_his_1 on tb_user_opor_allowset_opor_jour_his (init_date,target_opor_no,allow_opor_no);
commit;
