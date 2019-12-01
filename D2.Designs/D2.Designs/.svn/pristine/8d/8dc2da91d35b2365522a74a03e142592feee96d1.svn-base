-- /**************************************************************************************/
-- 创建数据库【平台估值】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_eva DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_eva_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：平台估值_基础参数_估值处理表
use db_eva;
DROP TABLE IF EXISTS tb_evabasic_data_deal;
CREATE TABLE tb_evabasic_data_deal (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    sys_busin int NOT NULL ,
    evalu_data_source int NOT NULL ,
    evalu_deal_date int NOT NULL ,
    evalu_deal_id bigint NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evabasic_data_deal_1 on tb_evabasic_data_deal (sys_busin,evalu_data_source);

-- 创建数据表：平台估值_基础参数_估值科目表
use db_eva;
DROP TABLE IF EXISTS tb_evabasic_account_name;
CREATE TABLE tb_evabasic_account_name (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    fina_acco_code varchar(64) NOT NULL ,
    fina_acco_name varchar(64) NOT NULL ,
    fina_acco_level int NOT NULL ,
    field_order int NOT NULL ,
    eva_check_type int NOT NULL ,
    config_str varchar(2048) NOT NULL ,
    pd_asset_type_str varchar(64) NOT NULL ,
    pd_fee_type_str varchar(64) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evabasic_account_name_1 on tb_evabasic_account_name (co_no,pd_no,fina_acco_code,eva_check_type);

-- 创建数据表：平台估值_基础参数_估值产品基本信息表
use db_eva;
DROP TABLE IF EXISTS tb_evabasic_product_info;
CREATE TABLE tb_evabasic_product_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_begin_share decimal(18,2) NOT NULL ,
    pd_curr_share decimal(18,2) NOT NULL ,
    target_pd_code varchar(8) NOT NULL ,
    task_status varchar(2) NOT NULL ,
    is_auto_push varchar(2) NOT NULL ,
    is_sync_netvalue int NOT NULL ,
    unit_evalu int NOT NULL ,
    hk_asset_calc_rate int NOT NULL ,
    sync_total_rece_payab int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evabasic_product_info_1 on tb_evabasic_product_info (co_no,pd_no);
create index idx_tb_evabasic_product_info_2 on tb_evabasic_product_info (task_status);

-- 创建数据表：平台估值_基础参数_估值产品费率表
use db_eva;
DROP TABLE IF EXISTS tb_evabasic_product_fee;
CREATE TABLE tb_evabasic_product_fee (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_fee_type int NOT NULL ,
    pd_fee_rate decimal(18,12) NOT NULL ,
    pd_fee_circle int NOT NULL ,
    min_fee decimal(18,4) NOT NULL ,
    fina_acco_code varchar(64) NOT NULL ,
    calc_fee_date_str varchar(4096) NOT NULL ,
    eva_calc_type int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evabasic_product_fee_1 on tb_evabasic_product_fee (co_no,pd_no,pd_fee_type);

-- 创建数据表：平台估值_基础参数_估值产品利率表
use db_eva;
DROP TABLE IF EXISTS tb_evabasic_product_rate;
CREATE TABLE tb_evabasic_product_rate (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_rate_type int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    intrst_rate decimal(18,12) NOT NULL ,
    pd_fee_circle int NOT NULL ,
    min_interest decimal(18,4) NOT NULL ,
    fina_acco_code varchar(64) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evabasic_product_rate_1 on tb_evabasic_product_rate (co_no,pd_no,pd_rate_type,asset_acco);

-- 创建数据表：平台估值_基础参数_估值产品份额流水表
use db_eva;
DROP TABLE IF EXISTS tb_evabasic_product_share_jour;
CREATE TABLE tb_evabasic_product_share_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    occur_dir int NOT NULL ,
    share_oper int NOT NULL ,
    occur_share decimal(18,2) NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    arrive_date int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evabasic_product_share_jour_1 on tb_evabasic_product_share_jour (co_no,pd_no,occur_dir,share_oper);

-- 创建数据表：平台估值_基础参数_估值产品交易费率表
use db_eva;
DROP TABLE IF EXISTS tb_evabasic_product_trade_fee;
CREATE TABLE tb_evabasic_product_trade_fee (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    fee_type int NOT NULL ,
    amt_ratio decimal(18,12) NOT NULL ,
    pd_fee_circle int NOT NULL ,
    min_fee decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evabasic_product_trade_fee_1 on tb_evabasic_product_trade_fee (co_no,pd_no,fee_type);

-- 创建数据表：平台估值_基础参数_估值产品核对配置表
use db_eva;
DROP TABLE IF EXISTS tb_evabasic_product_check_config;
CREATE TABLE tb_evabasic_product_check_config (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_curr_share_str varchar(64) NOT NULL ,
    eva_total_asset_str varchar(64) NOT NULL ,
    eva_nav_asset_str varchar(64) NOT NULL ,
    eva_cash_bala_str varchar(64) NOT NULL ,
    eva_acco_cash_str varchar(64) NOT NULL ,
    eva_stock_market_value_str varchar(64) NOT NULL ,
    eva_fund_asset_str varchar(64) NOT NULL ,
    eva_bond_asset_str varchar(64) NOT NULL ,
    eva_futu_asset_str varchar(64) NOT NULL ,
    eva_option_asset_str varchar(64) NOT NULL ,
    eva_other_asset_str varchar(64) NOT NULL ,
    accumulative_receivable_str varchar(64) NOT NULL ,
    accumulative_payable_str varchar(64) NOT NULL ,
    unit_nav_str varchar(64) NOT NULL ,
    total_cash_divide_str varchar(64) NOT NULL ,
    total_unit_nav_str varchar(64) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evabasic_product_check_config_1 on tb_evabasic_product_check_config (co_no,pd_no);

-- 创建数据表：平台估值_基础参数_估值产品净值计算配置表
use db_eva;
DROP TABLE IF EXISTS tb_evabasic_pd_net_config;
CREATE TABLE tb_evabasic_pd_net_config (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    divide_type int NOT NULL ,
    pd_curr_share decimal(18,2) NOT NULL ,
    divi_amt decimal(18,4) NOT NULL ,
    unit_divi_amt decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evabasic_pd_net_config_1 on tb_evabasic_pd_net_config (init_date,co_no,pd_no,divide_type);

-- 创建数据表：平台估值_基础参数_估值产品增值税率表
use db_eva;
DROP TABLE IF EXISTS tb_evabasic_pd_vat_config;
CREATE TABLE tb_evabasic_pd_vat_config (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    vat_rate decimal(18,12) NOT NULL ,
    vat_add_rate decimal(18,12) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evabasic_pd_vat_config_1 on tb_evabasic_pd_vat_config (co_no,pd_no);

-- 创建数据表：平台估值_基础参数_估值产品交易组信息表
use db_eva;
DROP TABLE IF EXISTS tb_evabasic_exch_group_info;
CREATE TABLE tb_evabasic_exch_group_info (
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
    weight_value decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    abolish_date int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evabasic_exch_group_info_1 on tb_evabasic_exch_group_info (co_no,exch_group_code);
create index idx_tb_evabasic_exch_group_info_2 on tb_evabasic_exch_group_info (exch_group_no);
create index idx_tb_evabasic_exch_group_info_3 on tb_evabasic_exch_group_info (pd_no);

-- 创建数据表：平台估值_基础参数_产品邮箱配置表
use db_eva;
DROP TABLE IF EXISTS tb_evabasic_product_mail_config;
CREATE TABLE tb_evabasic_product_mail_config (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    mail_server varchar(64) NOT NULL ,
    server_type int NOT NULL ,
    mail_server_protocol varchar(16) NOT NULL ,
    mail_server_port int NOT NULL ,
    mail_server_username varchar(64) NOT NULL ,
    mail_server_password varchar(64) NOT NULL ,
    ssl_type int NOT NULL ,
    send_from varchar(64) NOT NULL ,
    mail_subject varchar(255) NOT NULL ,
    netvalue_posi varchar(32) NOT NULL ,
    netvalue_date_posi varchar(32) NOT NULL ,
    dateformat_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evabasic_product_mail_config_1 on tb_evabasic_product_mail_config (co_no,pd_no);

-- 创建数据表：平台估值_基础参数_产品关系表
use db_eva;
DROP TABLE IF EXISTS tb_evabasic_pd_relation;
CREATE TABLE tb_evabasic_pd_relation (
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
create unique index idx_tb_evabasic_pd_relation_1 on tb_evabasic_pd_relation (pd_no,mum_pd_no);
create index idx_tb_evabasic_pd_relation_2 on tb_evabasic_pd_relation (co_no,pd_no);
create index idx_tb_evabasic_pd_relation_3 on tb_evabasic_pd_relation (mum_pd_no);

-- 创建数据表：平台估值_基础参数_产品特殊配置表
use db_eva;
DROP TABLE IF EXISTS tb_evabasic_pd_special_config;
CREATE TABLE tb_evabasic_pd_special_config (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    config_no bigint NOT NULL ,
    config_value varchar(2048) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evabasic_pd_special_config_1 on tb_evabasic_pd_special_config (co_no,pd_no,config_no);
commit;
