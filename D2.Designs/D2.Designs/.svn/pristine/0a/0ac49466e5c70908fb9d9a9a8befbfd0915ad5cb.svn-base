-- /**************************************************************************************/
-- 创建数据库【独立估值】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_val DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_val_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：独立估值_资讯数据_股票代码信息表
use db_val;
DROP TABLE IF EXISTS tb_valinfo_stock_info;
CREATE TABLE tb_valinfo_stock_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    par_value decimal(16,9) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    total_stock_issue decimal(18,2) NOT NULL ,
    circl_stock_capit decimal(18,2) NOT NULL ,
    type_unit int NOT NULL ,
    price_up decimal(16,9) NOT NULL ,
    price_down decimal(16,9) NOT NULL ,
    fair_price decimal(16,9) NOT NULL ,
    stop_status varchar(2) NOT NULL ,
    hk_stock_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_valinfo_stock_info_1 on tb_valinfo_stock_info (exch_no,stock_code);

-- 创建数据表：独立估值_资讯数据_股票行情表
use db_val;
DROP TABLE IF EXISTS tb_valinfo_stock_price;
CREATE TABLE tb_valinfo_stock_price (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
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
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    pe_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_valinfo_stock_price_1 on tb_valinfo_stock_price (init_date,exch_no,stock_code);

-- 创建数据表：历史_独立估值_资讯数据_股票行情表
use db_val_his;
DROP TABLE IF EXISTS tb_valinfo_stock_price_his;
CREATE TABLE tb_valinfo_stock_price_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
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
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    pe_ratio decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_valinfo_stock_price_his_1 on tb_valinfo_stock_price_his (init_date,exch_no,stock_code);
commit;
