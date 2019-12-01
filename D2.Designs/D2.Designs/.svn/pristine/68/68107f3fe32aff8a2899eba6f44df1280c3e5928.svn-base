-- /**************************************************************************************/
-- 创建数据库【公共】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：公共_证券基础数据_证券模板表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_stock_tmplat;
CREATE TABLE tb_basesedt_stock_tmplat (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    model_name varchar(64) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_feature varchar(16) NOT NULL ,
    stock_name_feature varchar(16) NOT NULL ,
    stock_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_stock_tmplat_1 on tb_basesedt_stock_tmplat (exch_no,stock_code_feature,stock_name_feature);

-- 创建数据表：公共_证券基础数据_证券类型表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_stock_type;
CREATE TABLE tb_basesedt_stock_type (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_type int NOT NULL ,
    stock_type_name varchar(16) NOT NULL ,
    asset_type int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    capit_reback_days int NOT NULL ,
    posi_reback_days int NOT NULL ,
    type_unit int NOT NULL ,
    report_unit int NOT NULL ,
    min_unit int NOT NULL ,
    max_qty decimal(18,2) NOT NULL ,
    min_qty decimal(18,2) NOT NULL ,
    is_order_dir_flag int NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_stock_type_1 on tb_basesedt_stock_type (exch_no,stock_type);
create index idx_tb_basesedt_stock_type_2 on tb_basesedt_stock_type (asset_type);
create index idx_tb_basesedt_stock_type_3 on tb_basesedt_stock_type (time_stamp);

-- 创建数据表：公共_证券基础数据_证券类型流水表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_stock_type_jour;
CREATE TABLE tb_basesedt_stock_type_jour (
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
    stock_type int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_stock_type_jour_1 on tb_basesedt_stock_type_jour (init_date,exch_no,stock_type);
create index idx_tb_basesedt_stock_type_jour_2 on tb_basesedt_stock_type_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券基础数据_证券类型流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_stock_type_jour_his;
CREATE TABLE tb_basesedt_stock_type_jour_his (
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
    stock_type int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_stock_type_jour_his_1 on tb_basesedt_stock_type_jour_his (init_date,exch_no,stock_type);
create index idx_tb_basesedt_stock_type_jour_his_2 on tb_basesedt_stock_type_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券基础数据_证券类型订单方向表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_stock_type_order_dir;
CREATE TABLE tb_basesedt_stock_type_order_dir (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_type int NOT NULL ,
    order_dir int NOT NULL ,
    cash_frozen_type int NOT NULL ,
    order_split_flag int NOT NULL ,
    min_unit int NOT NULL ,
    max_qty decimal(18,2) NOT NULL ,
    min_qty decimal(18,2) NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_stock_type_order_dir_1 on tb_basesedt_stock_type_order_dir (exch_no,stock_type,order_dir);
create index idx_tb_basesedt_stock_type_order_dir_2 on tb_basesedt_stock_type_order_dir (time_stamp);

-- 创建数据表：公共_证券基础数据_证券类型订单方向流水表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_stock_type_order_dir_jour;
CREATE TABLE tb_basesedt_stock_type_order_dir_jour (
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
    stock_type int NOT NULL ,
    order_dir int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_stock_type_order_dir_jour_1 on tb_basesedt_stock_type_order_dir_jour (init_date,exch_no,stock_type,order_dir);
create index idx_tb_basesedt_stock_type_order_dir_jour_2 on tb_basesedt_stock_type_order_dir_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券基础数据_证券类型订单方向流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_stock_type_order_dir_jour_his;
CREATE TABLE tb_basesedt_stock_type_order_dir_jour_his (
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
    stock_type int NOT NULL ,
    order_dir int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_stock_type_order_dir_jour_his_1 on tb_basesedt_stock_type_order_dir_jour_his (init_date,exch_no,stock_type,order_dir);
create index idx_tb_basesedt_stock_type_order_dir_jour_his_2 on tb_basesedt_stock_type_order_dir_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券基础数据_证券代码信息表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_stock_code_info;
CREATE TABLE tb_basesedt_stock_code_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    pinyin_short varchar(16) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    total_stock_issue decimal(18,2) NOT NULL ,
    circl_stock_capit decimal(18,2) NOT NULL ,
    capit_reback_days int NOT NULL ,
    posi_reback_days int NOT NULL ,
    type_unit int NOT NULL ,
    report_unit int NOT NULL ,
    min_unit int NOT NULL ,
    max_qty decimal(18,2) NOT NULL ,
    min_qty decimal(18,2) NOT NULL ,
    is_order_dir_flag int NOT NULL ,
    price_up decimal(16,9) NOT NULL ,
    price_down decimal(16,9) NOT NULL ,
    step_price decimal(16,9) NOT NULL ,
    fair_price decimal(16,9) NOT NULL ,
    stop_status varchar(2) NOT NULL ,
    hk_stock_flag int NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_stock_code_info_1 on tb_basesedt_stock_code_info (exch_no,stock_code);
create index idx_tb_basesedt_stock_code_info_2 on tb_basesedt_stock_code_info (stock_code_no);
create index idx_tb_basesedt_stock_code_info_3 on tb_basesedt_stock_code_info (time_stamp);
create index idx_tb_basesedt_stock_code_info_4 on tb_basesedt_stock_code_info (update_date,update_time);

-- 创建数据表：公共_证券基础数据_证券代码信息流水表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_stock_code_info_jour;
CREATE TABLE tb_basesedt_stock_code_info_jour (
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
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_stock_code_info_jour_1 on tb_basesedt_stock_code_info_jour (init_date,stock_code_no);
create index idx_tb_basesedt_stock_code_info_jour_2 on tb_basesedt_stock_code_info_jour (init_date,exch_no,stock_code);
create index idx_tb_basesedt_stock_code_info_jour_3 on tb_basesedt_stock_code_info_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券基础数据_证券代码信息流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_stock_code_info_jour_his;
CREATE TABLE tb_basesedt_stock_code_info_jour_his (
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
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_stock_code_info_jour_his_1 on tb_basesedt_stock_code_info_jour_his (init_date,stock_code_no);
create index idx_tb_basesedt_stock_code_info_jour_his_2 on tb_basesedt_stock_code_info_jour_his (init_date,exch_no,stock_code);
create index idx_tb_basesedt_stock_code_info_jour_his_3 on tb_basesedt_stock_code_info_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券基础数据_证券代码订单方向表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_stock_code_order_dir;
CREATE TABLE tb_basesedt_stock_code_order_dir (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
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
create unique index idx_tb_basesedt_stock_code_order_dir_1 on tb_basesedt_stock_code_order_dir (stock_code_no,order_dir);
create index idx_tb_basesedt_stock_code_order_dir_2 on tb_basesedt_stock_code_order_dir (exch_no);
create index idx_tb_basesedt_stock_code_order_dir_3 on tb_basesedt_stock_code_order_dir (time_stamp);

-- 创建数据表：公共_证券基础数据_证券代码订单方向流水表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_stock_code_order_dir_jour;
CREATE TABLE tb_basesedt_stock_code_order_dir_jour (
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
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    order_dir int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_stock_code_order_dir_jour_1 on tb_basesedt_stock_code_order_dir_jour (init_date,stock_code_no,order_dir);
create index idx_tb_basesedt_stock_code_order_dir_jour_2 on tb_basesedt_stock_code_order_dir_jour (init_date,exch_no);
create index idx_tb_basesedt_stock_code_order_dir_jour_3 on tb_basesedt_stock_code_order_dir_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券基础数据_证券代码订单方向流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_stock_code_order_dir_jour_his;
CREATE TABLE tb_basesedt_stock_code_order_dir_jour_his (
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
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    order_dir int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_stock_code_order_dir_jour_his_1 on tb_basesedt_stock_code_order_dir_jour_his (init_date,stock_code_no,order_dir);
create index idx_tb_basesedt_stock_code_order_dir_jour_his_2 on tb_basesedt_stock_code_order_dir_jour_his (init_date,exch_no);
create index idx_tb_basesedt_stock_code_order_dir_jour_his_3 on tb_basesedt_stock_code_order_dir_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券基础数据_证券代码映射表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_code_map;
CREATE TABLE tb_basesedt_code_map (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    trade_code varchar(6) NOT NULL ,
    target_code varchar(6) NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_code_map_1 on tb_basesedt_code_map (stock_code_no);
create index idx_tb_basesedt_code_map_2 on tb_basesedt_code_map (exch_no,trade_code);

-- 创建数据表：公共_证券基础数据_证券代码映射流水表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_code_map_jour;
CREATE TABLE tb_basesedt_code_map_jour (
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
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    trade_code varchar(6) NOT NULL ,
    target_code varchar(6) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_code_map_jour_1 on tb_basesedt_code_map_jour (init_date,stock_code_no);
create index idx_tb_basesedt_code_map_jour_2 on tb_basesedt_code_map_jour (init_date,exch_no);
create index idx_tb_basesedt_code_map_jour_3 on tb_basesedt_code_map_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券基础数据_证券代码映射流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_code_map_jour_his;
CREATE TABLE tb_basesedt_code_map_jour_his (
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
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    trade_code varchar(6) NOT NULL ,
    target_code varchar(6) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_code_map_jour_his_1 on tb_basesedt_code_map_jour_his (init_date,stock_code_no);
create index idx_tb_basesedt_code_map_jour_his_2 on tb_basesedt_code_map_jour_his (init_date,exch_no);
create index idx_tb_basesedt_code_map_jour_his_3 on tb_basesedt_code_map_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券基础数据_证券行情表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_stock_quot;
CREATE TABLE tb_basesedt_stock_quot (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    up_limit_price decimal(16,9) NOT NULL ,
    down_limit_price decimal(16,9) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    today_open_price decimal(16,9) NOT NULL ,
    today_close_price decimal(16,9) NOT NULL ,
    today_max_price decimal(16,9) NOT NULL ,
    today_min_price decimal(16,9) NOT NULL ,
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
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    pe_ratio decimal(18,12) NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_stock_quot_1 on tb_basesedt_stock_quot (stock_code_no);
create index idx_tb_basesedt_stock_quot_2 on tb_basesedt_stock_quot (exch_no,stock_code);
create index idx_tb_basesedt_stock_quot_3 on tb_basesedt_stock_quot (time_stamp);
create index idx_tb_basesedt_stock_quot_4 on tb_basesedt_stock_quot (update_date,update_time);

-- 创建数据表：公共_证券基础数据_证券行情流水表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_stock_quot_jour;
CREATE TABLE tb_basesedt_stock_quot_jour (
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
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_stock_quot_jour_1 on tb_basesedt_stock_quot_jour (init_date,stock_code_no);
create index idx_tb_basesedt_stock_quot_jour_2 on tb_basesedt_stock_quot_jour (init_date,exch_no,stock_code);
create index idx_tb_basesedt_stock_quot_jour_3 on tb_basesedt_stock_quot_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券基础数据_证券行情流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_stock_quot_jour_his;
CREATE TABLE tb_basesedt_stock_quot_jour_his (
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
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_stock_quot_jour_his_1 on tb_basesedt_stock_quot_jour_his (init_date,stock_code_no);
create index idx_tb_basesedt_stock_quot_jour_his_2 on tb_basesedt_stock_quot_jour_his (init_date,exch_no,stock_code);
create index idx_tb_basesedt_stock_quot_jour_his_3 on tb_basesedt_stock_quot_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券基础数据_历史证券行情表
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_stock_quot_his;
CREATE TABLE tb_basesedt_stock_quot_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    up_limit_price decimal(16,9) NOT NULL ,
    down_limit_price decimal(16,9) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    pre_close_price decimal(16,9) NOT NULL ,
    today_open_price decimal(16,9) NOT NULL ,
    today_close_price decimal(16,9) NOT NULL ,
    today_max_price decimal(16,9) NOT NULL ,
    today_min_price decimal(16,9) NOT NULL ,
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
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    pe_ratio decimal(18,12) NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_stock_quot_his_1 on tb_basesedt_stock_quot_his (init_date,stock_code_no);
create index idx_tb_basesedt_stock_quot_his_2 on tb_basesedt_stock_quot_his (init_date,exch_no,stock_code);
create index idx_tb_basesedt_stock_quot_his_3 on tb_basesedt_stock_quot_his (time_stamp);

-- 创建数据表：公共_证券基础数据_证券新股代码信息表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_new_stock_code_info;
CREATE TABLE tb_basesedt_new_stock_code_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    trade_code varchar(6) NOT NULL ,
    target_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    apply_date int NOT NULL ,
    apply_limit decimal(18,2) NOT NULL ,
    begin_trade_date int NOT NULL ,
    issue_price decimal(16,9) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_new_stock_code_info_1 on tb_basesedt_new_stock_code_info (exch_no,stock_code);
create index idx_tb_basesedt_new_stock_code_info_2 on tb_basesedt_new_stock_code_info (stock_code_no);
create index idx_tb_basesedt_new_stock_code_info_3 on tb_basesedt_new_stock_code_info (apply_date);

-- 创建数据表：历史_公共_证券基础数据_证券新股代码信息表
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_new_stock_code_info_his;
CREATE TABLE tb_basesedt_new_stock_code_info_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    trade_code varchar(6) NOT NULL ,
    target_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    apply_date int NOT NULL ,
    apply_limit decimal(18,2) NOT NULL ,
    begin_trade_date int NOT NULL ,
    issue_price decimal(16,9) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_new_stock_code_info_his_1 on tb_basesedt_new_stock_code_info_his (exch_no,stock_code);
create index idx_tb_basesedt_new_stock_code_info_his_2 on tb_basesedt_new_stock_code_info_his (stock_code_no);
create index idx_tb_basesedt_new_stock_code_info_his_3 on tb_basesedt_new_stock_code_info_his (apply_date);

-- 创建数据表：公共_证券基础数据_证券新股开板监控信息表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_new_stock_monitor_info;
CREATE TABLE tb_basesedt_new_stock_monitor_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    trade_code varchar(6) NOT NULL ,
    target_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    apply_date int NOT NULL ,
    apply_limit decimal(18,2) NOT NULL ,
    begin_trade_date int NOT NULL ,
    issue_price decimal(16,9) NOT NULL ,
    warn_trade_amount decimal(18,2) NOT NULL ,
    warn_buy_amount decimal(18,2) NOT NULL ,
    warn_auto_sell int NOT NULL ,
    is_warn int NOT NULL ,
    stock_open_date int NOT NULL ,
    stock_open_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    buy_qty_1 decimal(18,2) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    up_limit_price decimal(16,9) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_new_stock_monitor_info_1 on tb_basesedt_new_stock_monitor_info (exch_no,stock_code,co_no);

-- 创建数据表：公共_证券基础数据_债券属性信息表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_bond_info;
CREATE TABLE tb_basesedt_bond_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    trade_code varchar(6) NOT NULL ,
    target_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    issue_date int NOT NULL ,
    end_date int NOT NULL ,
    value_date int NOT NULL ,
    next_value_date int NOT NULL ,
    begin_trade_date int NOT NULL ,
    bond_limit decimal(18,2) NOT NULL ,
    issue_price decimal(16,9) NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    intrst_ratio decimal(18,12) NOT NULL ,
    intrst_days int NOT NULL ,
    pay_inteval int NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    inteval_days int NOT NULL ,
    net_price_flag int NOT NULL ,
    last_trade_date int NOT NULL ,
    rights_type int NOT NULL ,
    trans_begin_date int NOT NULL ,
    trans_end_date int NOT NULL ,
    exec_begin_date int NOT NULL ,
    exec_end_date int NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    pay_intrst_flag int NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_bond_info_1 on tb_basesedt_bond_info (exch_no,stock_code);
create index idx_tb_basesedt_bond_info_2 on tb_basesedt_bond_info (stock_code_no);
create index idx_tb_basesedt_bond_info_3 on tb_basesedt_bond_info (trade_code_no);
create index idx_tb_basesedt_bond_info_4 on tb_basesedt_bond_info (time_stamp);
create index idx_tb_basesedt_bond_info_5 on tb_basesedt_bond_info (update_date,update_time);

-- 创建数据表：公共_证券基础数据_历史债券属性信息表
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_bond_info_his;
CREATE TABLE tb_basesedt_bond_info_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    trade_code varchar(6) NOT NULL ,
    target_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    issue_date int NOT NULL ,
    end_date int NOT NULL ,
    value_date int NOT NULL ,
    next_value_date int NOT NULL ,
    begin_trade_date int NOT NULL ,
    bond_limit decimal(18,2) NOT NULL ,
    issue_price decimal(16,9) NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    intrst_ratio decimal(18,12) NOT NULL ,
    intrst_days int NOT NULL ,
    pay_inteval int NOT NULL ,
    bond_accr_intrst decimal(18,12) NOT NULL ,
    bond_rate_type int NOT NULL ,
    inteval_days int NOT NULL ,
    net_price_flag int NOT NULL ,
    last_trade_date int NOT NULL ,
    rights_type int NOT NULL ,
    trans_begin_date int NOT NULL ,
    trans_end_date int NOT NULL ,
    exec_begin_date int NOT NULL ,
    exec_end_date int NOT NULL ,
    impawn_ratio decimal(18,12) NOT NULL ,
    pay_intrst_flag int NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_bond_info_his_1 on tb_basesedt_bond_info_his (init_date,exch_no,stock_code);
create index idx_tb_basesedt_bond_info_his_2 on tb_basesedt_bond_info_his (init_date,stock_code_no);
create index idx_tb_basesedt_bond_info_his_3 on tb_basesedt_bond_info_his (init_date,trade_code_no);
create index idx_tb_basesedt_bond_info_his_4 on tb_basesedt_bond_info_his (time_stamp);

-- 创建数据表：公共_证券基础数据_债券属性信息流水表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_bond_info_jour;
CREATE TABLE tb_basesedt_bond_info_jour (
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
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_bond_info_jour_1 on tb_basesedt_bond_info_jour (init_date,exch_no,stock_code);
create index idx_tb_basesedt_bond_info_jour_2 on tb_basesedt_bond_info_jour (init_date,stock_code_no);
create index idx_tb_basesedt_bond_info_jour_3 on tb_basesedt_bond_info_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券基础数据_债券属性信息流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_bond_info_jour_his;
CREATE TABLE tb_basesedt_bond_info_jour_his (
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
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_bond_info_jour_his_1 on tb_basesedt_bond_info_jour_his (init_date,exch_no,stock_code);
create index idx_tb_basesedt_bond_info_jour_his_2 on tb_basesedt_bond_info_jour_his (init_date,stock_code_no);
create index idx_tb_basesedt_bond_info_jour_his_3 on tb_basesedt_bond_info_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券基础数据_债券利率表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_bond_rate;
CREATE TABLE tb_basesedt_bond_rate (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    intrst_begin_date int NOT NULL ,
    intrst_ratio decimal(18,12) NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_bond_rate_1 on tb_basesedt_bond_rate (stock_code_no,intrst_begin_date);
create index idx_tb_basesedt_bond_rate_2 on tb_basesedt_bond_rate (exch_no);
create index idx_tb_basesedt_bond_rate_3 on tb_basesedt_bond_rate (time_stamp);

-- 创建数据表：公共_证券基础数据_债券利率流水表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_bond_rate_jour;
CREATE TABLE tb_basesedt_bond_rate_jour (
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
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    intrst_begin_date int NOT NULL ,
    intrst_ratio decimal(18,12) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_bond_rate_jour_1 on tb_basesedt_bond_rate_jour (init_date,stock_code_no);
create index idx_tb_basesedt_bond_rate_jour_2 on tb_basesedt_bond_rate_jour (init_date,exch_no);
create index idx_tb_basesedt_bond_rate_jour_3 on tb_basesedt_bond_rate_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券基础数据_债券利率流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_bond_rate_jour_his;
CREATE TABLE tb_basesedt_bond_rate_jour_his (
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
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    intrst_begin_date int NOT NULL ,
    intrst_ratio decimal(18,12) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_bond_rate_jour_his_1 on tb_basesedt_bond_rate_jour_his (init_date,stock_code_no);
create index idx_tb_basesedt_bond_rate_jour_his_2 on tb_basesedt_bond_rate_jour_his (init_date,exch_no);
create index idx_tb_basesedt_bond_rate_jour_his_3 on tb_basesedt_bond_rate_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券基础数据_债券评级信息表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_bond_rating;
CREATE TABLE tb_basesedt_bond_rating (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    rating_agency varchar(64) NOT NULL ,
    co_no int NOT NULL ,
    bond_level int NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_bond_rating_1 on tb_basesedt_bond_rating (stock_code_no,rating_agency,co_no);
create index idx_tb_basesedt_bond_rating_2 on tb_basesedt_bond_rating (exch_no);

-- 创建数据表：公共_证券基础数据_债券评级信息流水表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_bond_rating_jour;
CREATE TABLE tb_basesedt_bond_rating_jour (
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
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    rating_agency varchar(64) NOT NULL ,
    co_no int NOT NULL ,
    bond_level int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_bond_rating_jour_1 on tb_basesedt_bond_rating_jour (init_date,stock_code_no);
create index idx_tb_basesedt_bond_rating_jour_2 on tb_basesedt_bond_rating_jour (init_date,exch_no);
create index idx_tb_basesedt_bond_rating_jour_3 on tb_basesedt_bond_rating_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券基础数据_债券评级信息流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_bond_rating_jour_his;
CREATE TABLE tb_basesedt_bond_rating_jour_his (
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
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    rating_agency varchar(64) NOT NULL ,
    co_no int NOT NULL ,
    bond_level int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_bond_rating_jour_his_1 on tb_basesedt_bond_rating_jour_his (init_date,stock_code_no);
create index idx_tb_basesedt_bond_rating_jour_his_2 on tb_basesedt_bond_rating_jour_his (init_date,exch_no);
create index idx_tb_basesedt_bond_rating_jour_his_3 on tb_basesedt_bond_rating_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券基础数据_债券兑付表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_bond_redemption;
CREATE TABLE tb_basesedt_bond_redemption (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    redem_record_date int NOT NULL ,
    redem_start_date int NOT NULL ,
    redem_end_date int NOT NULL ,
    redem_pay_price decimal(18,12) NOT NULL ,
    redem_pay_amt decimal(18,4) NOT NULL ,
    redem_commis_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_bond_redemption_1 on tb_basesedt_bond_redemption (stock_code_no,redem_record_date);

-- 创建数据表：历史_公共_证券基础数据_债券兑付表
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_bond_redemption_his;
CREATE TABLE tb_basesedt_bond_redemption_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    redem_record_date int NOT NULL ,
    redem_start_date int NOT NULL ,
    redem_end_date int NOT NULL ,
    redem_pay_price decimal(18,12) NOT NULL ,
    redem_pay_amt decimal(18,4) NOT NULL ,
    redem_commis_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_bond_redemption_his_1 on tb_basesedt_bond_redemption_his (stock_code_no,redem_record_date);

-- 创建数据表：公共_证券基础数据_债券兑息记录表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_bond_interest_payment;
CREATE TABLE tb_basesedt_bond_interest_payment (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    bond_rate_type int NOT NULL ,
    pay_inteval int NOT NULL ,
    pay_intrst_freqcy int NOT NULL ,
    value_date int NOT NULL ,
    intrst_ratio decimal(18,12) NOT NULL ,
    pay_intrst_yeer int NOT NULL ,
    intrst_pre_tax decimal(18,12) NOT NULL ,
    intrst_after_tax decimal(18,12) NOT NULL ,
    pay_intrst_record_date int NOT NULL ,
    pay_intrst_divi_date int NOT NULL ,
    intrst_pay_start_date int NOT NULL ,
    intrst_pay_end_date int NOT NULL ,
    intrst_tax_ratio decimal(18,12) NOT NULL ,
    pay_intrst_times int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_bond_interest_payment_1 on tb_basesedt_bond_interest_payment (stock_code_no,pay_intrst_record_date);

-- 创建数据表：历史_公共_证券基础数据_债券兑息记录表
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_bond_interest_payment_his;
CREATE TABLE tb_basesedt_bond_interest_payment_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    bond_rate_type int NOT NULL ,
    pay_inteval int NOT NULL ,
    pay_intrst_freqcy int NOT NULL ,
    value_date int NOT NULL ,
    intrst_ratio decimal(18,12) NOT NULL ,
    pay_intrst_yeer int NOT NULL ,
    intrst_pre_tax decimal(18,12) NOT NULL ,
    intrst_after_tax decimal(18,12) NOT NULL ,
    pay_intrst_record_date int NOT NULL ,
    pay_intrst_divi_date int NOT NULL ,
    intrst_pay_start_date int NOT NULL ,
    intrst_pay_end_date int NOT NULL ,
    intrst_tax_ratio decimal(18,12) NOT NULL ,
    pay_intrst_times int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_bond_interest_payment_his_1 on tb_basesedt_bond_interest_payment_his (stock_code_no,pay_intrst_record_date);

-- 创建数据表：公共_证券基础数据_债券分期兑付本金表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_bond_instal_redemp_prin;
CREATE TABLE tb_basesedt_bond_instal_redemp_prin (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    instal_repay_type int NOT NULL ,
    early_repay_date int NOT NULL ,
    early_repay_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_bond_instal_redemp_prin_1 on tb_basesedt_bond_instal_redemp_prin (stock_code_no,early_repay_date);

-- 创建数据表：历史_公共_证券基础数据_债券分期兑付本金表
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_bond_instal_redemp_prin_his;
CREATE TABLE tb_basesedt_bond_instal_redemp_prin_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    instal_repay_type int NOT NULL ,
    early_repay_date int NOT NULL ,
    early_repay_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_bond_instal_redemp_prin_his_1 on tb_basesedt_bond_instal_redemp_prin_his (stock_code_no,early_repay_date);

-- 创建数据表：公共_证券基础数据_回购参数表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_repo_param;
CREATE TABLE tb_basesedt_repo_param (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_type int NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    repo_days int NOT NULL ,
    repo_first_settle_date int NOT NULL ,
    repo_back_date int NOT NULL ,
    cash_capt_days int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_repo_param_1 on tb_basesedt_repo_param (stock_code_no);
create index idx_tb_basesedt_repo_param_2 on tb_basesedt_repo_param (exch_no,stock_code);

-- 创建数据表：公共_证券基础数据_回购参数流水表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_repo_param_jour;
CREATE TABLE tb_basesedt_repo_param_jour (
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
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_type int NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    repo_days int NOT NULL ,
    cash_capt_days int NOT NULL ,
    repo_first_settle_date int NOT NULL ,
    repo_back_date int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_repo_param_jour_1 on tb_basesedt_repo_param_jour (init_date,stock_code_no);
create index idx_tb_basesedt_repo_param_jour_2 on tb_basesedt_repo_param_jour (init_date,exch_no);
create index idx_tb_basesedt_repo_param_jour_3 on tb_basesedt_repo_param_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券基础数据_回购参数流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_repo_param_jour_his;
CREATE TABLE tb_basesedt_repo_param_jour_his (
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
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_type int NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    repo_days int NOT NULL ,
    cash_capt_days int NOT NULL ,
    repo_first_settle_date int NOT NULL ,
    repo_back_date int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_repo_param_jour_his_1 on tb_basesedt_repo_param_jour_his (init_date,stock_code_no);
create index idx_tb_basesedt_repo_param_jour_his_2 on tb_basesedt_repo_param_jour_his (init_date,exch_no);
create index idx_tb_basesedt_repo_param_jour_his_3 on tb_basesedt_repo_param_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券基础数据_货币基金收益表现
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_mf_yield_perfor;
CREATE TABLE tb_basesedt_mf_yield_perfor (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    trade_date int NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    unit_nav_total decimal(18,4) NOT NULL ,
    fund_daily_profit decimal(18,4) NOT NULL ,
    latest_weekly_yield decimal(18,12) NOT NULL ,
    involved_days int NOT NULL ,
    per_ten_thousd_daily_profit decimal(18,12) NOT NULL ,
    ann_return_ratio_in_single_wk decimal(18,12) NOT NULL ,
    ann_return_ratio_in_two_wk decimal(18,12) NOT NULL ,
    ann_return_ratio_in_three_wk decimal(18,12) NOT NULL ,
    ann_return_ratio_in_four_wk decimal(18,12) NOT NULL ,
    ann_return_ratio_in_five_wk decimal(18,12) NOT NULL ,
    return_ratio_in_this_wk decimal(18,12) NOT NULL ,
    return_ratio_in_single_wk decimal(18,12) NOT NULL ,
    return_ratio_in_this_month decimal(18,12) NOT NULL ,
    return_ratio_in_single_month decimal(18,12) NOT NULL ,
    return_ratio_in_three_month decimal(18,12) NOT NULL ,
    return_ratio_in_six_month decimal(18,12) NOT NULL ,
    return_ratio_since_this_year decimal(18,12) NOT NULL ,
    return_ratio_in_single_year decimal(18,12) NOT NULL ,
    return_ratio_in_two_year decimal(18,12) NOT NULL ,
    ann_return_ratio_in_two_year decimal(18,12) NOT NULL ,
    return_ratio_in_three_year decimal(18,12) NOT NULL ,
    ann_return_ratio_in_three_year decimal(18,12) NOT NULL ,
    return_ratio_in_five_year decimal(18,12) NOT NULL ,
    ann_return_ratio_in_five_year decimal(18,12) NOT NULL ,
    return_ratio_in_ten_year decimal(18,12) NOT NULL ,
    ann_return_ratio_in_ten_year decimal(18,12) NOT NULL ,
    return_ratio_since_start decimal(18,12) NOT NULL ,
    ann_return_ratio_since_start decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_mf_yield_perfor_1 on tb_basesedt_mf_yield_perfor (stock_code_no,trade_date);

-- 创建数据表：历史_公共_证券基础数据_货币基金收益表现
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_mf_yield_perfor_his;
CREATE TABLE tb_basesedt_mf_yield_perfor_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    trade_date int NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    unit_nav_total decimal(18,4) NOT NULL ,
    fund_daily_profit decimal(18,4) NOT NULL ,
    latest_weekly_yield decimal(18,12) NOT NULL ,
    involved_days int NOT NULL ,
    per_ten_thousd_daily_profit decimal(18,12) NOT NULL ,
    ann_return_ratio_in_single_wk decimal(18,12) NOT NULL ,
    ann_return_ratio_in_two_wk decimal(18,12) NOT NULL ,
    ann_return_ratio_in_three_wk decimal(18,12) NOT NULL ,
    ann_return_ratio_in_four_wk decimal(18,12) NOT NULL ,
    ann_return_ratio_in_five_wk decimal(18,12) NOT NULL ,
    return_ratio_in_this_wk decimal(18,12) NOT NULL ,
    return_ratio_in_single_wk decimal(18,12) NOT NULL ,
    return_ratio_in_this_month decimal(18,12) NOT NULL ,
    return_ratio_in_single_month decimal(18,12) NOT NULL ,
    return_ratio_in_three_month decimal(18,12) NOT NULL ,
    return_ratio_in_six_month decimal(18,12) NOT NULL ,
    return_ratio_since_this_year decimal(18,12) NOT NULL ,
    return_ratio_in_single_year decimal(18,12) NOT NULL ,
    return_ratio_in_two_year decimal(18,12) NOT NULL ,
    ann_return_ratio_in_two_year decimal(18,12) NOT NULL ,
    return_ratio_in_three_year decimal(18,12) NOT NULL ,
    ann_return_ratio_in_three_year decimal(18,12) NOT NULL ,
    return_ratio_in_five_year decimal(18,12) NOT NULL ,
    ann_return_ratio_in_five_year decimal(18,12) NOT NULL ,
    return_ratio_in_ten_year decimal(18,12) NOT NULL ,
    ann_return_ratio_in_ten_year decimal(18,12) NOT NULL ,
    return_ratio_since_start decimal(18,12) NOT NULL ,
    ann_return_ratio_since_start decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_mf_yield_perfor_his_1 on tb_basesedt_mf_yield_perfor_his (stock_code_no,trade_date);

-- 创建数据表：公共_证券基础数据_货币型基金净值
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_mf_net_value;
CREATE TABLE tb_basesedt_mf_net_value (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    deadln_date int NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    fund_daily_profit decimal(18,4) NOT NULL ,
    latest_weekly_yield decimal(18,12) NOT NULL ,
    involved_days int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_mf_net_value_1 on tb_basesedt_mf_net_value (stock_code_no,deadln_date);

-- 创建数据表：历史_公共_证券基础数据_货币型基金净值
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_mf_net_value_his;
CREATE TABLE tb_basesedt_mf_net_value_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    deadln_date int NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    fund_daily_profit decimal(18,4) NOT NULL ,
    latest_weekly_yield decimal(18,12) NOT NULL ,
    involved_days int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_mf_net_value_his_1 on tb_basesedt_mf_net_value_his (stock_code_no,deadln_date);

-- 创建数据表：公共_证券基础数据_港股价位表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_hk_step_price;
CREATE TABLE tb_basesedt_hk_step_price (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    begin_price decimal(16,9) NOT NULL ,
    end_price decimal(16,9) NOT NULL ,
    step_price decimal(16,9) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_hk_step_price_1 on tb_basesedt_hk_step_price (begin_price,end_price);

-- 创建数据表：公共_证券基础数据_基金属性信息表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_fund_info;
CREATE TABLE tb_basesedt_fund_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    fund_kind int NOT NULL ,
    fund_manager varchar(64) NOT NULL ,
    fund_trustee varchar(64) NOT NULL ,
    distribution_scale decimal(18,4) NOT NULL ,
    charging_method int NOT NULL ,
    default_divide_type int NOT NULL ,
    fund_found_date int NOT NULL ,
    fund_expire_date int NOT NULL ,
    subscription_trade_mark int NOT NULL ,
    purchase_trade_mark int NOT NULL ,
    rede_trade_mark int NOT NULL ,
    first_minimum_amt decimal(18,4) NOT NULL ,
    minimum_subscription_amt decimal(18,4) NOT NULL ,
    minimum_purchase_amt decimal(18,4) NOT NULL ,
    minimum_rede_share decimal(18,2) NOT NULL ,
    minimum_holding_share decimal(18,2) NOT NULL ,
    minimum_turning_out_share decimal(18,2) NOT NULL ,
    rede_money_to_account_days int NOT NULL ,
    registration_agency varchar(32) NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_fund_info_1 on tb_basesedt_fund_info (exch_no,stock_code);
create index idx_tb_basesedt_fund_info_2 on tb_basesedt_fund_info (stock_code_no);
create index idx_tb_basesedt_fund_info_3 on tb_basesedt_fund_info (time_stamp);

-- 创建数据表：公共_证券基础数据_历史基金属性信息表
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_fund_info_his;
CREATE TABLE tb_basesedt_fund_info_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    fund_kind int NOT NULL ,
    fund_manager varchar(64) NOT NULL ,
    fund_trustee varchar(64) NOT NULL ,
    distribution_scale decimal(18,4) NOT NULL ,
    charging_method int NOT NULL ,
    default_divide_type int NOT NULL ,
    fund_found_date int NOT NULL ,
    fund_expire_date int NOT NULL ,
    subscription_trade_mark int NOT NULL ,
    purchase_trade_mark int NOT NULL ,
    rede_trade_mark int NOT NULL ,
    first_minimum_amt decimal(18,4) NOT NULL ,
    minimum_subscription_amt decimal(18,4) NOT NULL ,
    minimum_purchase_amt decimal(18,4) NOT NULL ,
    minimum_rede_share decimal(18,2) NOT NULL ,
    minimum_holding_share decimal(18,2) NOT NULL ,
    minimum_turning_out_share decimal(18,2) NOT NULL ,
    rede_money_to_account_days int NOT NULL ,
    registration_agency varchar(32) NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_fund_info_his_1 on tb_basesedt_fund_info_his (init_date,exch_no,stock_code);
create index idx_tb_basesedt_fund_info_his_2 on tb_basesedt_fund_info_his (init_date,stock_code_no);
create index idx_tb_basesedt_fund_info_his_3 on tb_basesedt_fund_info_his (time_stamp);

-- 创建数据表：公共_证券基础数据_基金属性信息流水表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_fund_info_jour;
CREATE TABLE tb_basesedt_fund_info_jour (
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
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_fund_info_jour_1 on tb_basesedt_fund_info_jour (init_date,exch_no,stock_code);
create index idx_tb_basesedt_fund_info_jour_2 on tb_basesedt_fund_info_jour (init_date,stock_code_no);
create index idx_tb_basesedt_fund_info_jour_3 on tb_basesedt_fund_info_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券基础数据_基金属性信息流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_fund_info_jour_his;
CREATE TABLE tb_basesedt_fund_info_jour_his (
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
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_basesedt_fund_info_jour_his_1 on tb_basesedt_fund_info_jour_his (init_date,exch_no,stock_code);
create index idx_tb_basesedt_fund_info_jour_his_2 on tb_basesedt_fund_info_jour_his (init_date,stock_code_no);
create index idx_tb_basesedt_fund_info_jour_his_3 on tb_basesedt_fund_info_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券基础数据_可转债代码信息表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_convertible_bond_info;
CREATE TABLE tb_basesedt_convertible_bond_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    trade_code varchar(6) NOT NULL ,
    target_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    apply_date int NOT NULL ,
    apply_limit decimal(18,2) NOT NULL ,
    begin_trade_date int NOT NULL ,
    issue_price decimal(16,9) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_convertible_bond_info_1 on tb_basesedt_convertible_bond_info (exch_no,stock_code);
create index idx_tb_basesedt_convertible_bond_info_2 on tb_basesedt_convertible_bond_info (stock_code_no);
create index idx_tb_basesedt_convertible_bond_info_3 on tb_basesedt_convertible_bond_info (apply_date);

-- 创建数据表：历史_公共_证券基础数据_可转债代码信息表
use db_pub_his;
DROP TABLE IF EXISTS tb_basesedt_convertible_bond_info_his;
CREATE TABLE tb_basesedt_convertible_bond_info_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    trade_code varchar(6) NOT NULL ,
    target_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    trade_code_no int NOT NULL ,
    target_code_no int NOT NULL ,
    apply_date int NOT NULL ,
    apply_limit decimal(18,2) NOT NULL ,
    begin_trade_date int NOT NULL ,
    issue_price decimal(16,9) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_convertible_bond_info_his_1 on tb_basesedt_convertible_bond_info_his (exch_no,stock_code);
create index idx_tb_basesedt_convertible_bond_info_his_2 on tb_basesedt_convertible_bond_info_his (stock_code_no);
create index idx_tb_basesedt_convertible_bond_info_his_3 on tb_basesedt_convertible_bond_info_his (apply_date);

-- 创建数据表：公共_证券基础数据_基金产品对照表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_fund_pd_comparision;
CREATE TABLE tb_basesedt_fund_pd_comparision (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    pd_no int NOT NULL ,
    co_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_fund_pd_comparision_1 on tb_basesedt_fund_pd_comparision (co_no,pd_no);
create index idx_tb_basesedt_fund_pd_comparision_2 on tb_basesedt_fund_pd_comparision (stock_code_no);
create index idx_tb_basesedt_fund_pd_comparision_3 on tb_basesedt_fund_pd_comparision (exch_no,stock_code);

-- 创建数据表：公共_证券基础数据_产品扩展信息表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_pd_expand_inf;
CREATE TABLE tb_basesedt_pd_expand_inf (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    link_row_id bigint NOT NULL ,
    fund_trustee varchar(64) NOT NULL ,
    distribution_scale decimal(18,4) NOT NULL ,
    charging_method int NOT NULL ,
    default_divide_type int NOT NULL ,
    fund_found_date int NOT NULL ,
    fund_expire_date int NOT NULL ,
    subscription_trade_mark int NOT NULL ,
    purchase_trade_mark int NOT NULL ,
    rede_trade_mark int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_pd_expand_inf_1 on tb_basesedt_pd_expand_inf (link_row_id);

-- 创建数据表：公共_证券基础数据_产品基本信息
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_pd_basic_inf;
CREATE TABLE tb_basesedt_pd_basic_inf (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    link_row_id bigint NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    fund_manager varchar(64) NOT NULL ,
    registration_agency varchar(32) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_pd_basic_inf_1 on tb_basesedt_pd_basic_inf (link_row_id);

-- 创建数据表：公共_证券基础数据_特殊证券行情信息表
use db_pub;
DROP TABLE IF EXISTS tb_basesedt_specail_stock_quot_info;
CREATE TABLE tb_basesedt_specail_stock_quot_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    quot_calc_unit decimal(16,9) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesedt_specail_stock_quot_info_1 on tb_basesedt_specail_stock_quot_info (stock_code_no);
create index idx_tb_basesedt_specail_stock_quot_info_2 on tb_basesedt_specail_stock_quot_info (exch_no,stock_code);
commit;
