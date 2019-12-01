-- /**************************************************************************************/
-- 创建数据库【公共】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：公共_期货基础数据_合约类型表
use db_pub;
DROP TABLE IF EXISTS tb_basefudt_contrc_type;
CREATE TABLE tb_basefudt_contrc_type (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_type int NOT NULL ,
    contrc_type_name varchar(16) NOT NULL ,
    asset_type int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    contrc_unit int NOT NULL ,
    report_unit int NOT NULL ,
    min_unit int NOT NULL ,
    max_qty decimal(18,2) NOT NULL ,
    min_qty decimal(18,2) NOT NULL ,
    type_unit int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    capit_reback_days int NOT NULL ,
    posi_reback_days int NOT NULL ,
    is_order_dir_flag int NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basefudt_contrc_type_1 on tb_basefudt_contrc_type (exch_no,contrc_type);
create index idx_tb_basefudt_contrc_type_2 on tb_basefudt_contrc_type (time_stamp);

-- 创建数据表：公共_期货基础数据_合约类型流水表
use db_pub;
DROP TABLE IF EXISTS tb_basefudt_contrc_type_jour;
CREATE TABLE tb_basefudt_contrc_type_jour (
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
    contrc_type int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basefudt_contrc_type_jour_1 on tb_basefudt_contrc_type_jour (init_date,exch_no,contrc_type);
create index idx_tb_basefudt_contrc_type_jour_2 on tb_basefudt_contrc_type_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_期货基础数据_合约类型流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_basefudt_contrc_type_jour_his;
CREATE TABLE tb_basefudt_contrc_type_jour_his (
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
    contrc_type int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basefudt_contrc_type_jour_his_1 on tb_basefudt_contrc_type_jour_his (init_date,exch_no,contrc_type);
create index idx_tb_basefudt_contrc_type_jour_his_2 on tb_basefudt_contrc_type_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_期货基础数据_合约类型订单方向表
use db_pub;
DROP TABLE IF EXISTS tb_basefudt_contrc_type_order_dir;
CREATE TABLE tb_basefudt_contrc_type_order_dir (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_type int NOT NULL ,
    order_dir int NOT NULL ,
    cash_frozen_type int NOT NULL ,
    order_split_flag int NOT NULL ,
    min_unit int NOT NULL ,
    max_qty decimal(18,2) NOT NULL ,
    min_qty decimal(18,2) NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basefudt_contrc_type_order_dir_1 on tb_basefudt_contrc_type_order_dir (exch_no,contrc_type,order_dir);
create index idx_tb_basefudt_contrc_type_order_dir_2 on tb_basefudt_contrc_type_order_dir (time_stamp);

-- 创建数据表：公共_期货基础数据_合约类型订单方向流水表
use db_pub;
DROP TABLE IF EXISTS tb_basefudt_contrc_type_order_dir_jour;
CREATE TABLE tb_basefudt_contrc_type_order_dir_jour (
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
    contrc_type int NOT NULL ,
    order_dir int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basefudt_contrc_type_order_dir_jour_1 on tb_basefudt_contrc_type_order_dir_jour (init_date,exch_no,contrc_type,order_dir);
create index idx_tb_basefudt_contrc_type_order_dir_jour_2 on tb_basefudt_contrc_type_order_dir_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_期货基础数据_合约类型订单方向流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_basefudt_contrc_type_order_dir_jour_his;
CREATE TABLE tb_basefudt_contrc_type_order_dir_jour_his (
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
    contrc_type int NOT NULL ,
    order_dir int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basefudt_contrc_type_order_dir_jour_his_1 on tb_basefudt_contrc_type_order_dir_jour_his (init_date,exch_no,contrc_type,order_dir);
create index idx_tb_basefudt_contrc_type_order_dir_jour_his_2 on tb_basefudt_contrc_type_order_dir_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_期货基础数据_期货模板表
use db_pub;
DROP TABLE IF EXISTS tb_basefudt_futu_tmplat;
CREATE TABLE tb_basefudt_futu_tmplat (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    model_name varchar(64) NOT NULL ,
    exch_no int NOT NULL ,
    prefix_char varchar(16) NOT NULL ,
    contrc_type int NOT NULL ,
    asset_type int NOT NULL ,
    contrc_unit int NOT NULL ,
    report_unit int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basefudt_futu_tmplat_1 on tb_basefudt_futu_tmplat (exch_no,prefix_char);

-- 创建数据表：公共_期货基础数据_合约代码信息表
use db_pub;
DROP TABLE IF EXISTS tb_basefudt_futu_contrc_info;
CREATE TABLE tb_basefudt_futu_contrc_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    contrc_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    contrc_name varchar(64) NOT NULL ,
    pinyin_short varchar(16) NOT NULL ,
    contrc_type int NOT NULL ,
    asset_type int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    contrc_unit int NOT NULL ,
    report_unit int NOT NULL ,
    min_unit int NOT NULL ,
    max_qty decimal(18,2) NOT NULL ,
    min_qty decimal(18,2) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    capit_reback_days int NOT NULL ,
    posi_reback_days int NOT NULL ,
    fee_set varchar(2048) NOT NULL ,
    is_order_dir_flag int NOT NULL ,
    valid_flag int NOT NULL ,
    contrc_limit_flag int NOT NULL ,
    margin_pref int NOT NULL ,
    posi_type int NOT NULL ,
    deli_year int NOT NULL ,
    deli_month int NOT NULL ,
    begin_trade_date int NOT NULL ,
    expire_date int NOT NULL ,
    begin_deli_date int NOT NULL ,
    end_deli_date int NOT NULL ,
    open_order_type int NOT NULL ,
    step_price decimal(16,9) NOT NULL ,
    hold_qty decimal(18,2) NOT NULL ,
    main_flag int NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basefudt_futu_contrc_info_1 on tb_basefudt_futu_contrc_info (exch_no,contrc_code);
create index idx_tb_basefudt_futu_contrc_info_2 on tb_basefudt_futu_contrc_info (contrc_code_no);
create index idx_tb_basefudt_futu_contrc_info_3 on tb_basefudt_futu_contrc_info (time_stamp);
create index idx_tb_basefudt_futu_contrc_info_4 on tb_basefudt_futu_contrc_info (contrc_code);

-- 创建数据表：公共_期货基础数据_合约代码信息流水表
use db_pub;
DROP TABLE IF EXISTS tb_basefudt_futu_contrc_info_jour;
CREATE TABLE tb_basefudt_futu_contrc_info_jour (
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
    contrc_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basefudt_futu_contrc_info_jour_1 on tb_basefudt_futu_contrc_info_jour (init_date,contrc_code_no);
create index idx_tb_basefudt_futu_contrc_info_jour_2 on tb_basefudt_futu_contrc_info_jour (init_date,exch_no,contrc_code);
create index idx_tb_basefudt_futu_contrc_info_jour_3 on tb_basefudt_futu_contrc_info_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_期货基础数据_合约代码信息流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_basefudt_futu_contrc_info_jour_his;
CREATE TABLE tb_basefudt_futu_contrc_info_jour_his (
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
    contrc_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basefudt_futu_contrc_info_jour_his_1 on tb_basefudt_futu_contrc_info_jour_his (init_date,contrc_code_no);
create index idx_tb_basefudt_futu_contrc_info_jour_his_2 on tb_basefudt_futu_contrc_info_jour_his (init_date,exch_no,contrc_code);
create index idx_tb_basefudt_futu_contrc_info_jour_his_3 on tb_basefudt_futu_contrc_info_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_期货基础数据_合约代码订单方向表
use db_pub;
DROP TABLE IF EXISTS tb_basefudt_contrc_code_order_dir;
CREATE TABLE tb_basefudt_contrc_code_order_dir (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    contrc_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    order_dir int NOT NULL ,
    cash_frozen_type int NOT NULL ,
    order_split_flag int NOT NULL ,
    min_unit int NOT NULL ,
    max_qty decimal(18,2) NOT NULL ,
    min_qty decimal(18,2) NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basefudt_contrc_code_order_dir_1 on tb_basefudt_contrc_code_order_dir (contrc_code_no,order_dir);
create index idx_tb_basefudt_contrc_code_order_dir_2 on tb_basefudt_contrc_code_order_dir (exch_no);
create index idx_tb_basefudt_contrc_code_order_dir_3 on tb_basefudt_contrc_code_order_dir (time_stamp);

-- 创建数据表：公共_期货基础数据_合约代码订单方向流水表
use db_pub;
DROP TABLE IF EXISTS tb_basefudt_contrc_code_order_dir_jour;
CREATE TABLE tb_basefudt_contrc_code_order_dir_jour (
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
    contrc_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    order_dir int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basefudt_contrc_code_order_dir_jour_1 on tb_basefudt_contrc_code_order_dir_jour (init_date,contrc_code_no,order_dir);
create index idx_tb_basefudt_contrc_code_order_dir_jour_2 on tb_basefudt_contrc_code_order_dir_jour (init_date,exch_no);
create index idx_tb_basefudt_contrc_code_order_dir_jour_3 on tb_basefudt_contrc_code_order_dir_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_期货基础数据_合约代码订单方向流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_basefudt_contrc_code_order_dir_jour_his;
CREATE TABLE tb_basefudt_contrc_code_order_dir_jour_his (
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
    contrc_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    order_dir int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basefudt_contrc_code_order_dir_jour_his_1 on tb_basefudt_contrc_code_order_dir_jour_his (init_date,contrc_code_no,order_dir);
create index idx_tb_basefudt_contrc_code_order_dir_jour_his_2 on tb_basefudt_contrc_code_order_dir_jour_his (init_date,exch_no);
create index idx_tb_basefudt_contrc_code_order_dir_jour_his_3 on tb_basefudt_contrc_code_order_dir_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_期货基础数据_期货行情表
use db_pub;
DROP TABLE IF EXISTS tb_basefudt_futu_quot;
CREATE TABLE tb_basefudt_futu_quot (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    contrc_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    contrc_name varchar(64) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    sett_price decimal(16,9) NOT NULL ,
    pre_settle_price decimal(16,9) NOT NULL ,
    today_close_price decimal(16,9) NOT NULL ,
    hold_qty decimal(18,2) NOT NULL ,
    pre_hold_qty decimal(18,2) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    today_open_price decimal(16,9) NOT NULL ,
    max_buy_price decimal(16,9) NOT NULL ,
    min_sale_price decimal(16,9) NOT NULL ,
    total_buy_qty decimal(18,2) NOT NULL ,
    total_sale_qty decimal(18,2) NOT NULL ,
    up_limit_price decimal(16,9) NOT NULL ,
    down_limit_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    buy_price_1 decimal(16,9) NOT NULL ,
    buy_qty_1 decimal(18,2) NOT NULL ,
    buy_price_2 decimal(16,9) NOT NULL ,
    buy_qty_2 decimal(18,2) NOT NULL ,
    buy_price_3 decimal(16,9) NOT NULL ,
    buy_qty_3 decimal(18,2) NOT NULL ,
    buy_price_4 decimal(16,9) NOT NULL ,
    buy_qty_4 decimal(18,2) NOT NULL ,
    buy_price_5 decimal(16,9) NOT NULL ,
    buy_qty_5 decimal(18,2) NOT NULL ,
    sell_price_1 decimal(16,9) NOT NULL ,
    sell_qty_1 decimal(18,2) NOT NULL ,
    sell_price_2 decimal(16,9) NOT NULL ,
    sell_qty_2 decimal(18,2) NOT NULL ,
    sell_price_3 decimal(16,9) NOT NULL ,
    sell_qty_3 decimal(18,2) NOT NULL ,
    sell_price_4 decimal(16,9) NOT NULL ,
    sell_qty_4 decimal(18,2) NOT NULL ,
    sell_price_5 decimal(16,9) NOT NULL ,
    sell_qty_5 decimal(18,2) NOT NULL ,
    contrc_type int NOT NULL ,
    asset_type int NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basefudt_futu_quot_1 on tb_basefudt_futu_quot (contrc_code_no);
create index idx_tb_basefudt_futu_quot_2 on tb_basefudt_futu_quot (exch_no,contrc_code);
create index idx_tb_basefudt_futu_quot_3 on tb_basefudt_futu_quot (time_stamp);
create index idx_tb_basefudt_futu_quot_4 on tb_basefudt_futu_quot (update_date,update_time);

-- 创建数据表：公共_期货基础数据_期货行情流水表
use db_pub;
DROP TABLE IF EXISTS tb_basefudt_futu_quot_jour;
CREATE TABLE tb_basefudt_futu_quot_jour (
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
    contrc_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_occur_info varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basefudt_futu_quot_jour_1 on tb_basefudt_futu_quot_jour (init_date,contrc_code_no);
create index idx_tb_basefudt_futu_quot_jour_2 on tb_basefudt_futu_quot_jour (init_date,exch_no,contrc_code);
create index idx_tb_basefudt_futu_quot_jour_3 on tb_basefudt_futu_quot_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_期货基础数据_期货行情流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_basefudt_futu_quot_jour_his;
CREATE TABLE tb_basefudt_futu_quot_jour_his (
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
    contrc_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_occur_info varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basefudt_futu_quot_jour_his_1 on tb_basefudt_futu_quot_jour_his (init_date,contrc_code_no);
create index idx_tb_basefudt_futu_quot_jour_his_2 on tb_basefudt_futu_quot_jour_his (init_date,exch_no,contrc_code);
create index idx_tb_basefudt_futu_quot_jour_his_3 on tb_basefudt_futu_quot_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_期货基础数据_历史期货行情表
use db_pub_his;
DROP TABLE IF EXISTS tb_basefudt_futu_quot_his;
CREATE TABLE tb_basefudt_futu_quot_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    contrc_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    contrc_name varchar(64) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    sett_price decimal(16,9) NOT NULL ,
    pre_settle_price decimal(16,9) NOT NULL ,
    today_close_price decimal(16,9) NOT NULL ,
    hold_qty decimal(18,2) NOT NULL ,
    pre_hold_qty decimal(18,2) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    today_open_price decimal(16,9) NOT NULL ,
    max_buy_price decimal(16,9) NOT NULL ,
    min_sale_price decimal(16,9) NOT NULL ,
    total_buy_qty decimal(18,2) NOT NULL ,
    total_sale_qty decimal(18,2) NOT NULL ,
    up_limit_price decimal(16,9) NOT NULL ,
    down_limit_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    buy_price_1 decimal(16,9) NOT NULL ,
    buy_qty_1 decimal(18,2) NOT NULL ,
    buy_price_2 decimal(16,9) NOT NULL ,
    buy_qty_2 decimal(18,2) NOT NULL ,
    buy_price_3 decimal(16,9) NOT NULL ,
    buy_qty_3 decimal(18,2) NOT NULL ,
    buy_price_4 decimal(16,9) NOT NULL ,
    buy_qty_4 decimal(18,2) NOT NULL ,
    buy_price_5 decimal(16,9) NOT NULL ,
    buy_qty_5 decimal(18,2) NOT NULL ,
    sell_price_1 decimal(16,9) NOT NULL ,
    sell_qty_1 decimal(18,2) NOT NULL ,
    sell_price_2 decimal(16,9) NOT NULL ,
    sell_qty_2 decimal(18,2) NOT NULL ,
    sell_price_3 decimal(16,9) NOT NULL ,
    sell_qty_3 decimal(18,2) NOT NULL ,
    sell_price_4 decimal(16,9) NOT NULL ,
    sell_qty_4 decimal(18,2) NOT NULL ,
    sell_price_5 decimal(16,9) NOT NULL ,
    sell_qty_5 decimal(18,2) NOT NULL ,
    contrc_type int NOT NULL ,
    asset_type int NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basefudt_futu_quot_his_1 on tb_basefudt_futu_quot_his (init_date,contrc_code_no);
create index idx_tb_basefudt_futu_quot_his_2 on tb_basefudt_futu_quot_his (init_date,exch_no,contrc_code);
create index idx_tb_basefudt_futu_quot_his_3 on tb_basefudt_futu_quot_his (time_stamp);

-- 创建数据表：公共_期货基础数据_期货组合保证金参数表
use db_pub;
DROP TABLE IF EXISTS tb_basefudt_futu_group_margin_config;
CREATE TABLE tb_basefudt_futu_group_margin_config (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    comb_code varchar(6) NOT NULL ,
    comb_name varchar(64) NOT NULL ,
    comb_type int NOT NULL ,
    pref_type int NOT NULL ,
    partic_code varchar(6) NOT NULL ,
    margin_ratio decimal(18,12) NOT NULL ,
    prior_type int NOT NULL ,
    trade_pref int NOT NULL ,
    sett_pref int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basefudt_futu_group_margin_config_1 on tb_basefudt_futu_group_margin_config (comb_code,partic_code);
create index idx_tb_basefudt_futu_group_margin_config_2 on tb_basefudt_futu_group_margin_config (exch_no,partic_code);

-- 创建数据表：公共_期货基础数据_合约交割参数表
use db_pub;
DROP TABLE IF EXISTS tb_basefudt_futu_deli_param;
CREATE TABLE tb_basefudt_futu_deli_param (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    deli_price decimal(16,9) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basefudt_futu_deli_param_1 on tb_basefudt_futu_deli_param (contrc_code_no);

-- 创建数据表：公共_期货基础数据_期货自选行情表
use db_pub;
DROP TABLE IF EXISTS tb_basefudt_futu_custom_quot;
CREATE TABLE tb_basefudt_futu_custom_quot (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    contrc_name varchar(64) NOT NULL ,
    contrc_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basefudt_futu_custom_quot_1 on tb_basefudt_futu_custom_quot (opor_no,contrc_code_no);
create index idx_tb_basefudt_futu_custom_quot_2 on tb_basefudt_futu_custom_quot (exch_no,contrc_code);
commit;
