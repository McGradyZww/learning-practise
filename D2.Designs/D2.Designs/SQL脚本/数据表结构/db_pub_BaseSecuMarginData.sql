-- /**************************************************************************************/
-- 创建数据库【公共】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：公共_融资融券基础数据_可冲抵保证金证券表
use db_pub;
DROP TABLE IF EXISTS tb_basesemdt_offset_margin_stock;
CREATE TABLE tb_basesemdt_offset_margin_stock (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    pass_no int NOT NULL ,
    co_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    discount_rate decimal(18,12) NOT NULL ,
    offset_status int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesemdt_offset_margin_stock_1 on tb_basesemdt_offset_margin_stock (pass_no,co_no,exch_no,stock_code);

-- 创建数据表：公共_融资融券基础数据_融资融券配置表
use db_pub;
DROP TABLE IF EXISTS tb_basesemdt_secu_margin_allocation;
CREATE TABLE tb_basesemdt_secu_margin_allocation (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    pass_no int NOT NULL ,
    co_no int NOT NULL ,
    fina_year_intrst_rate decimal(18,12) NOT NULL ,
    secu_loan_year_intrst_rate decimal(18,12) NOT NULL ,
    fina_pen_intrst_rate decimal(18,12) NOT NULL ,
    secu_loan_pen_intrst_rate decimal(18,12) NOT NULL ,
    intrst_sett_day int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesemdt_secu_margin_allocation_1 on tb_basesemdt_secu_margin_allocation (pass_no,co_no);

-- 创建数据表：公共_融资融券基础数据_融资融券标的证券表
use db_pub;
DROP TABLE IF EXISTS tb_basesemdt_secu_margin_underly_secu;
CREATE TABLE tb_basesemdt_secu_margin_underly_secu (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    fina_status varchar(2) NOT NULL ,
    secu_loan_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesemdt_secu_margin_underly_secu_1 on tb_basesemdt_secu_margin_underly_secu (exch_no,stock_code);
create index idx_tb_basesemdt_secu_margin_underly_secu_2 on tb_basesemdt_secu_margin_underly_secu (stock_code_no);

-- 创建数据表：公共_融资融券基础数据_融资融券券商禁止标的证券表
use db_pub;
DROP TABLE IF EXISTS tb_basesemdt_margin_broker_ban_underly_secu;
CREATE TABLE tb_basesemdt_margin_broker_ban_underly_secu (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    pass_no int NOT NULL ,
    co_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    fina_status varchar(2) NOT NULL ,
    secu_loan_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesemdt_margin_broker_ban_underly_secu_1 on tb_basesemdt_margin_broker_ban_underly_secu (pass_no,co_no,exch_no,stock_code);
create index idx_tb_basesemdt_margin_broker_ban_underly_secu_2 on tb_basesemdt_margin_broker_ban_underly_secu (stock_code_no);

-- 创建数据表：公共_融资融券基础数据_融资融券保证金比例配置表
use db_pub;
DROP TABLE IF EXISTS tb_basesemdt_secu_margin_ratio_allocation;
CREATE TABLE tb_basesemdt_secu_margin_ratio_allocation (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    pass_no int NOT NULL ,
    co_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_type int NOT NULL ,
    fina_marg_ratio decimal(18,12) NOT NULL ,
    secu_loan_marg_ratio decimal(18,12) NOT NULL ,
    secu_loan_price_limit decimal(16,9) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesemdt_secu_margin_ratio_allocation_1 on tb_basesemdt_secu_margin_ratio_allocation (pass_no,co_no,exch_no,stock_code);

-- 创建数据表：公共_融资融券基础数据_折算比例模板表
use db_pub;
DROP TABLE IF EXISTS tb_basesemdt_conversion_scale_template;
CREATE TABLE tb_basesemdt_conversion_scale_template (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_type int NOT NULL ,
    discount_rate decimal(18,12) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_basesemdt_conversion_scale_template_1 on tb_basesemdt_conversion_scale_template (exch_no,stock_type);
commit;
