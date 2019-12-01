-- /**************************************************************************************/
-- 创建数据库【公共】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：公共_基础_系统信息表
use db_pub;
DROP TABLE IF EXISTS tb_base_sys_info;
CREATE TABLE tb_base_sys_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    sys_name varchar(64) NOT NULL ,
    sys_status varchar(2) NOT NULL ,
    init_date int NOT NULL ,
    no_exch_date_str varchar(2048) NOT NULL ,
    allow_next_init_time int NOT NULL ,
    sys_config_str varchar(64) NOT NULL ,
    client_version varchar(16) NOT NULL ,
    manage_ver varchar(16) NOT NULL ,
    admin_ver varchar(16) NOT NULL ,
    update_addr varchar(255) NOT NULL ,
    dnload_addr varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_sys_info_1 on tb_base_sys_info (update_date,update_time);

-- 创建数据表：公共_基础_系统信息流水表
use db_pub;
DROP TABLE IF EXISTS tb_base_sys_info_jour;
CREATE TABLE tb_base_sys_info_jour (
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
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_sys_info_jour_1 on tb_base_sys_info_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_基础_系统信息流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_base_sys_info_jour_his;
CREATE TABLE tb_base_sys_info_jour_his (
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
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_sys_info_jour_his_1 on tb_base_sys_info_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_基础_机构信息表
use db_pub;
DROP TABLE IF EXISTS tb_base_co_info;
CREATE TABLE tb_base_co_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    co_name varchar(64) NOT NULL ,
    co_flname varchar(255) NOT NULL ,
    co_type int NOT NULL ,
    reg_code varchar(16) NOT NULL ,
    reg_addr varchar(32) NOT NULL ,
    found_date int NOT NULL ,
    reg_date int NOT NULL ,
    conta_addr varchar(255) NOT NULL ,
    conta_name varchar(64) NOT NULL ,
    phone_number varchar(16) NOT NULL ,
    email varchar(255) NOT NULL ,
    pd_qty_max int NOT NULL ,
    max_acco_count int NOT NULL ,
    opor_qty_max int NOT NULL ,
    allow_exch varchar(64) NOT NULL ,
    allow_stock_type varchar(2048) NOT NULL ,
    busi_config_str varchar(64) NOT NULL ,
    comm_appr_oper int NOT NULL ,
    market_price_ratio decimal(18,12) NOT NULL ,
    mul_acco_trd_assign_set varchar(64) NOT NULL ,
    mul_acco_trd_choice int NOT NULL ,
    mul_acco_trd_qty_set varchar(64) NOT NULL ,
    genus_algo_strategy_set varchar(64) NOT NULL ,
    base_crncy_type varchar(3) NOT NULL ,
    co_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_base_co_info_1 on tb_base_co_info (co_no);
create index idx_tb_base_co_info_2 on tb_base_co_info (update_date,update_time);

-- 创建数据表：公共_基础_机构信息流水表
use db_pub;
DROP TABLE IF EXISTS tb_base_co_info_jour;
CREATE TABLE tb_base_co_info_jour (
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
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_co_info_jour_1 on tb_base_co_info_jour (init_date,co_no);
create index idx_tb_base_co_info_jour_2 on tb_base_co_info_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_基础_机构信息流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_base_co_info_jour_his;
CREATE TABLE tb_base_co_info_jour_his (
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
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_co_info_jour_his_1 on tb_base_co_info_jour_his (init_date,co_no);
create index idx_tb_base_co_info_jour_his_2 on tb_base_co_info_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_基础_系统配置表
use db_pub;
DROP TABLE IF EXISTS tb_base_sys_config;
CREATE TABLE tb_base_sys_config (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    config_no bigint NOT NULL ,
    config_name varchar(64) NOT NULL ,
    config_choice_type int NOT NULL ,
    config_value varchar(2048) NOT NULL ,
    dict_field_name varchar(32) NOT NULL ,
    config_memo varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_base_sys_config_1 on tb_base_sys_config (co_no,config_no);

-- 创建数据表：公共_基础_系统配置流水表
use db_pub;
DROP TABLE IF EXISTS tb_base_sys_config_jour;
CREATE TABLE tb_base_sys_config_jour (
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
    config_no bigint NOT NULL ,
    config_name varchar(64) NOT NULL ,
    config_choice_type int NOT NULL ,
    config_value varchar(2048) NOT NULL ,
    dict_field_name varchar(32) NOT NULL ,
    config_memo varchar(255) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_sys_config_jour_1 on tb_base_sys_config_jour (init_date,co_no,config_no);
create index idx_tb_base_sys_config_jour_2 on tb_base_sys_config_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_基础_系统配置流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_base_sys_config_jour_his;
CREATE TABLE tb_base_sys_config_jour_his (
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
    config_no bigint NOT NULL ,
    config_name varchar(64) NOT NULL ,
    config_choice_type int NOT NULL ,
    config_value varchar(2048) NOT NULL ,
    dict_field_name varchar(32) NOT NULL ,
    config_memo varchar(255) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_sys_config_jour_his_1 on tb_base_sys_config_jour_his (init_date,co_no,config_no);
create index idx_tb_base_sys_config_jour_his_2 on tb_base_sys_config_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_基础_机构汇率表
use db_pub;
DROP TABLE IF EXISTS tb_base_co_exch_rate;
CREATE TABLE tb_base_co_exch_rate (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    for_crncy_type varchar(3) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    buy_exch_rate decimal(18,12) NOT NULL ,
    sale_exch_rate decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_base_co_exch_rate_1 on tb_base_co_exch_rate (co_no,for_crncy_type,crncy_type);

-- 创建数据表：公共_基础_机构汇率流水表
use db_pub;
DROP TABLE IF EXISTS tb_base_co_exch_rate_jour;
CREATE TABLE tb_base_co_exch_rate_jour (
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
    for_crncy_type varchar(3) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    buy_exch_rate decimal(18,12) NOT NULL ,
    sale_exch_rate decimal(18,12) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_co_exch_rate_jour_1 on tb_base_co_exch_rate_jour (init_date,co_no,for_crncy_type,crncy_type);
create index idx_tb_base_co_exch_rate_jour_2 on tb_base_co_exch_rate_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_基础_机构汇率流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_base_co_exch_rate_jour_his;
CREATE TABLE tb_base_co_exch_rate_jour_his (
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
    for_crncy_type varchar(3) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    buy_exch_rate decimal(18,12) NOT NULL ,
    sale_exch_rate decimal(18,12) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_co_exch_rate_jour_his_1 on tb_base_co_exch_rate_jour_his (init_date,co_no,for_crncy_type,crncy_type);
create index idx_tb_base_co_exch_rate_jour_his_2 on tb_base_co_exch_rate_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_基础_市场信息表
use db_pub;
DROP TABLE IF EXISTS tb_base_exch_info;
CREATE TABLE tb_base_exch_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    exch_name varchar(64) NOT NULL ,
    exch_code varchar(6) NOT NULL ,
    exch_type int NOT NULL ,
    distric varchar(32) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_status int NOT NULL ,
    init_date int NOT NULL ,
    time_lag int NOT NULL ,
    no_exch_date_str varchar(2048) NOT NULL ,
    allow_next_init_time int NOT NULL ,
    no_settle_date_str varchar(2048) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_base_exch_info_1 on tb_base_exch_info (exch_no);

-- 创建数据表：公共_基础_市场信息流水表
use db_pub;
DROP TABLE IF EXISTS tb_base_exch_info_jour;
CREATE TABLE tb_base_exch_info_jour (
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
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_exch_info_jour_1 on tb_base_exch_info_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_基础_市场信息流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_base_exch_info_jour_his;
CREATE TABLE tb_base_exch_info_jour_his (
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
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_exch_info_jour_his_1 on tb_base_exch_info_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_基础_港股通交收日设置流水表
use db_pub;
DROP TABLE IF EXISTS tb_base_hk_settle_date_jour;
CREATE TABLE tb_base_hk_settle_date_jour (
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
    settle_date int NOT NULL ,
    set_type int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_hk_settle_date_jour_1 on tb_base_hk_settle_date_jour (init_date,opor_co_no,opor_no);
create index idx_tb_base_hk_settle_date_jour_2 on tb_base_hk_settle_date_jour (settle_date,set_type);

-- 创建数据表：历史_公共_基础_港股通交收日设置流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_base_hk_settle_date_jour_his;
CREATE TABLE tb_base_hk_settle_date_jour_his (
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
    settle_date int NOT NULL ,
    set_type int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_hk_settle_date_jour_his_1 on tb_base_hk_settle_date_jour_his (init_date,opor_co_no,opor_no);
create index idx_tb_base_hk_settle_date_jour_his_2 on tb_base_hk_settle_date_jour_his (settle_date,set_type);

-- 创建数据表：公共_基础_交易时间表
use db_pub;
DROP TABLE IF EXISTS tb_base_exch_time;
CREATE TABLE tb_base_exch_time (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    begin_time int NOT NULL ,
    end_time int NOT NULL ,
    allow_wtdraw_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_base_exch_time_1 on tb_base_exch_time (exch_no,begin_time,end_time);

-- 创建数据表：公共_基础_交易时间流水表
use db_pub;
DROP TABLE IF EXISTS tb_base_exch_time_jour;
CREATE TABLE tb_base_exch_time_jour (
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
    exch_no int NOT NULL ,
    begin_time int NOT NULL ,
    end_time int NOT NULL ,
    allow_wtdraw_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_exch_time_jour_1 on tb_base_exch_time_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_基础_交易时间流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_base_exch_time_jour_his;
CREATE TABLE tb_base_exch_time_jour_his (
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
    exch_no int NOT NULL ,
    begin_time int NOT NULL ,
    end_time int NOT NULL ,
    allow_wtdraw_flag int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_exch_time_jour_his_1 on tb_base_exch_time_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_基础_交易业务处理配置表
use db_pub;
DROP TABLE IF EXISTS tb_base_exch_config;
CREATE TABLE tb_base_exch_config (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_type int NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    clear_date int NOT NULL ,
    oper_type int NOT NULL ,
    asset_deal_date_type int NOT NULL ,
    asset_deal_time_type int NOT NULL ,
    cash_deal_type int NOT NULL ,
    cash_deal_date_type int NOT NULL ,
    cash_deal_time_type int NOT NULL ,
    cash_avail_date_type int NOT NULL ,
    stock_deal_type int NOT NULL ,
    stock_deal_date_type int NOT NULL ,
    stock_deal_time_type int NOT NULL ,
    stock_avail_date_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_base_exch_config_1 on tb_base_exch_config (exch_no,stock_type,order_dir,contrc_dir,oper_type);

-- 创建数据表：公共_基础_机构业务记录编号表
use db_pub;
DROP TABLE IF EXISTS tb_base_co_busi_record_no;
CREATE TABLE tb_base_co_busi_record_no (
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
create unique index idx_tb_base_co_busi_record_no_1 on tb_base_co_busi_record_no (co_no,record_no_type);

-- 创建数据表：公共_基础_市场业务记录编号表
use db_pub;
DROP TABLE IF EXISTS tb_base_market_busi_record_no;
CREATE TABLE tb_base_market_busi_record_no (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    record_no_type int NOT NULL ,
    curr_no bigint NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_base_market_busi_record_no_1 on tb_base_market_busi_record_no (exch_no,record_no_type);

-- 创建数据表：公共_基础_通道信息表
use db_pub;
DROP TABLE IF EXISTS tb_base_channel_info;
CREATE TABLE tb_base_channel_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    pass_no int NOT NULL ,
    pass_name varchar(64) NOT NULL ,
    config_file varchar(255) NOT NULL ,
    pass_status varchar(2) NOT NULL ,
    pass_type int NOT NULL ,
    bond_qty_unit_set int NOT NULL ,
    hk_cash_avail_date_type int NOT NULL ,
    online_status int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_base_channel_info_1 on tb_base_channel_info (pass_no);
create index idx_tb_base_channel_info_2 on tb_base_channel_info (pass_type);

-- 创建数据表：公共_基础_通道信息流水表
use db_pub;
DROP TABLE IF EXISTS tb_base_channel_info_jour;
CREATE TABLE tb_base_channel_info_jour (
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
    pass_no int NOT NULL ,
    pass_name varchar(64) NOT NULL ,
    config_file varchar(255) NOT NULL ,
    pass_status varchar(2) NOT NULL ,
    pass_type int NOT NULL ,
    bond_qty_unit_set int NOT NULL ,
    online_status int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_channel_info_jour_1 on tb_base_channel_info_jour (init_date,pass_no);
create index idx_tb_base_channel_info_jour_2 on tb_base_channel_info_jour (init_date,pass_type);

-- 创建数据表：历史_公共_基础_通道信息流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_base_channel_info_jour_his;
CREATE TABLE tb_base_channel_info_jour_his (
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
    pass_no int NOT NULL ,
    pass_name varchar(64) NOT NULL ,
    config_file varchar(255) NOT NULL ,
    pass_status varchar(2) NOT NULL ,
    pass_type int NOT NULL ,
    bond_qty_unit_set int NOT NULL ,
    online_status int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_channel_info_jour_his_1 on tb_base_channel_info_jour_his (init_date,pass_no);
create index idx_tb_base_channel_info_jour_his_2 on tb_base_channel_info_jour_his (init_date,pass_type);

-- 创建数据表：公共_基础_数据字典表
use db_pub;
DROP TABLE IF EXISTS tb_base_dictionary;
CREATE TABLE tb_base_dictionary (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    dict_no int NOT NULL ,
    dict_name varchar(64) NOT NULL ,
    dict_field_name varchar(32) NOT NULL ,
    dict_item_name varchar(64) NOT NULL ,
    dict_item_value varchar(32) NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_base_dictionary_1 on tb_base_dictionary (dict_name,dict_item_name);
create index idx_tb_base_dictionary_2 on tb_base_dictionary (dict_no);
create index idx_tb_base_dictionary_3 on tb_base_dictionary (time_stamp);

-- 创建数据表：公共_基础_业务标志表
use db_pub;
DROP TABLE IF EXISTS tb_base_busiflag;
CREATE TABLE tb_base_busiflag (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    busi_type int NOT NULL ,
    busi_sub_type int NOT NULL ,
    busi_flag int NOT NULL ,
    busi_name varchar(64) NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_base_busiflag_1 on tb_base_busiflag (busi_flag);
create index idx_tb_base_busiflag_2 on tb_base_busiflag (busi_type,busi_sub_type);
create index idx_tb_base_busiflag_3 on tb_base_busiflag (time_stamp);

-- 创建数据表：公共_基础_港股通汇率表
use db_pub;
DROP TABLE IF EXISTS tb_base_hk_exch_rate;
CREATE TABLE tb_base_hk_exch_rate (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    exch_no int NOT NULL ,
    for_crncy_type varchar(3) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    buy_ref_rate decimal(18,12) NOT NULL ,
    sell_ref_rate decimal(18,12) NOT NULL ,
    settle_buy_rate decimal(18,12) NOT NULL ,
    settle_sell_rate decimal(18,12) NOT NULL ,
    pboc_rate decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_base_hk_exch_rate_1 on tb_base_hk_exch_rate (init_date,exch_no);
create index idx_tb_base_hk_exch_rate_2 on tb_base_hk_exch_rate (update_date,update_time);

-- 创建数据表：公共_基础_港股通额度表
use db_pub;
DROP TABLE IF EXISTS tb_base_hk_limit_info;
CREATE TABLE tb_base_hk_limit_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    begin_limit decimal(18,4) NOT NULL ,
    remain_limit decimal(18,4) NOT NULL ,
    limit_status int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_base_hk_limit_info_1 on tb_base_hk_limit_info (exch_no);

-- 创建数据表：公共_基础_币种汇率表
use db_pub;
DROP TABLE IF EXISTS tb_base_crncy_exch_rate;
CREATE TABLE tb_base_crncy_exch_rate (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    issue_co int NOT NULL ,
    co_name varchar(64) NOT NULL ,
    for_crncy_type varchar(3) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_unit int NOT NULL ,
    spot_exch_buy_rate decimal(18,12) NOT NULL ,
    spot_exch_sale_rate decimal(18,12) NOT NULL ,
    china_bank_convert_rate decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_base_crncy_exch_rate_1 on tb_base_crncy_exch_rate (issue_co,for_crncy_type,crncy_type);

-- 创建数据表：公共_基础_币种汇率流水表
use db_pub;
DROP TABLE IF EXISTS tb_base_crncy_exch_rate_jour;
CREATE TABLE tb_base_crncy_exch_rate_jour (
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
    issue_co int NOT NULL ,
    for_crncy_type varchar(3) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_unit int NOT NULL ,
    spot_exch_buy_rate decimal(18,12) NOT NULL ,
    spot_exch_sale_rate decimal(18,12) NOT NULL ,
    china_bank_convert_rate decimal(18,12) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_crncy_exch_rate_jour_1 on tb_base_crncy_exch_rate_jour (init_date,issue_co,for_crncy_type,crncy_type);
create index idx_tb_base_crncy_exch_rate_jour_2 on tb_base_crncy_exch_rate_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_基础_币种汇率流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_base_crncy_exch_rate_jour_his;
CREATE TABLE tb_base_crncy_exch_rate_jour_his (
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
    issue_co int NOT NULL ,
    for_crncy_type varchar(3) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_unit int NOT NULL ,
    spot_exch_buy_rate decimal(18,12) NOT NULL ,
    spot_exch_sale_rate decimal(18,12) NOT NULL ,
    china_bank_convert_rate decimal(18,12) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_crncy_exch_rate_jour_his_1 on tb_base_crncy_exch_rate_jour_his (init_date,issue_co,for_crncy_type,crncy_type);
create index idx_tb_base_crncy_exch_rate_jour_his_2 on tb_base_crncy_exch_rate_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_基础_公共库删除流水表
use db_pub;
DROP TABLE IF EXISTS tb_base_pub_delete_jour;
CREATE TABLE tb_base_pub_delete_jour (
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
create index idx_tb_base_pub_delete_jour_1 on tb_base_pub_delete_jour (table_name);
create index idx_tb_base_pub_delete_jour_2 on tb_base_pub_delete_jour (init_date);

-- 创建数据表：历史_公共_基础_公共库删除流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_base_pub_delete_jour_his;
CREATE TABLE tb_base_pub_delete_jour_his (
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
create index idx_tb_base_pub_delete_jour_his_1 on tb_base_pub_delete_jour_his (table_name);
create index idx_tb_base_pub_delete_jour_his_2 on tb_base_pub_delete_jour_his (init_date);

-- 创建数据表：公共_基础_通道报盘信息表
use db_pub;
DROP TABLE IF EXISTS tb_base_channel_transfer_info;
CREATE TABLE tb_base_channel_transfer_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    pass_no int NOT NULL ,
    pass_name varchar(64) NOT NULL ,
    pass_type int NOT NULL ,
    pass_status varchar(2) NOT NULL ,
    trans_name varchar(64) NOT NULL ,
    trans_node_name varchar(64) NOT NULL ,
    trans_create_date int NOT NULL ,
    trans_server_name varchar(64) NOT NULL ,
    trans_server_ip varchar(64) NOT NULL ,
    trans_server_port int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_base_channel_transfer_info_1 on tb_base_channel_transfer_info (pass_no);
create index idx_tb_base_channel_transfer_info_2 on tb_base_channel_transfer_info (pass_type);
commit;
