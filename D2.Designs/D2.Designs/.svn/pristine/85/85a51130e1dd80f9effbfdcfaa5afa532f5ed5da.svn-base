-- /**************************************************************************************/
-- 创建数据库【公共】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：公共_证券费用_证券费用模板表
use db_pub;
DROP TABLE IF EXISTS tb_feesecu_secu_fee_tmplat;
CREATE TABLE tb_feesecu_secu_fee_tmplat (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    fee_tmplat_no int NOT NULL ,
    co_no int NOT NULL ,
    fee_tmplat_name varchar(64) NOT NULL ,
    fee_tmplat_kind int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_feesecu_secu_fee_tmplat_1 on tb_feesecu_secu_fee_tmplat (co_no,fee_tmplat_name);
create index idx_tb_feesecu_secu_fee_tmplat_2 on tb_feesecu_secu_fee_tmplat (fee_tmplat_no);

-- 创建数据表：公共_证券费用_证券费用模板流水表
use db_pub;
DROP TABLE IF EXISTS tb_feesecu_secu_fee_tmplat_jour;
CREATE TABLE tb_feesecu_secu_fee_tmplat_jour (
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
    fee_tmplat_no int NOT NULL ,
    co_no int NOT NULL ,
    fee_tmplat_name varchar(64) NOT NULL ,
    fee_tmplat_kind int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_feesecu_secu_fee_tmplat_jour_1 on tb_feesecu_secu_fee_tmplat_jour (init_date,co_no,fee_tmplat_no);
create index idx_tb_feesecu_secu_fee_tmplat_jour_2 on tb_feesecu_secu_fee_tmplat_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券费用_证券费用模板流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_feesecu_secu_fee_tmplat_jour_his;
CREATE TABLE tb_feesecu_secu_fee_tmplat_jour_his (
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
    fee_tmplat_no int NOT NULL ,
    co_no int NOT NULL ,
    fee_tmplat_name varchar(64) NOT NULL ,
    fee_tmplat_kind int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_feesecu_secu_fee_tmplat_jour_his_1 on tb_feesecu_secu_fee_tmplat_jour_his (init_date,co_no,fee_tmplat_no);
create index idx_tb_feesecu_secu_fee_tmplat_jour_his_2 on tb_feesecu_secu_fee_tmplat_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券费用_证券类型费用模板明细表
use db_pub;
DROP TABLE IF EXISTS tb_feesecu_stock_type_fee_tmplat_detail;
CREATE TABLE tb_feesecu_stock_type_fee_tmplat_detail (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    fee_tmplat_no int NOT NULL ,
    co_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_type int NOT NULL ,
    fee_no int NOT NULL ,
    amt_ratio decimal(18,12) NOT NULL ,
    amt_value decimal(18,4) NOT NULL ,
    par_value_ratio decimal(18,12) NOT NULL ,
    par_value_value decimal(18,4) NOT NULL ,
    max_fee decimal(18,4) NOT NULL ,
    min_fee decimal(18,4) NOT NULL ,
    float_ratio decimal(18,12) NOT NULL ,
    fee_choice int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_feesecu_stock_type_fee_tmplat_detail_1 on tb_feesecu_stock_type_fee_tmplat_detail (fee_tmplat_no,exch_no,stock_type,fee_no);

-- 创建数据表：公共_证券费用_证券类型费用模板明细流水表
use db_pub;
DROP TABLE IF EXISTS tb_feesecu_stock_type_fee_tmplat_detail_jour;
CREATE TABLE tb_feesecu_stock_type_fee_tmplat_detail_jour (
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
    exch_no int NOT NULL ,
    stock_type int NOT NULL ,
    fee_tmplat_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_feesecu_stock_type_fee_tmplat_detail_jour_1 on tb_feesecu_stock_type_fee_tmplat_detail_jour (init_date,exch_no,stock_type,fee_tmplat_no);
create index idx_tb_feesecu_stock_type_fee_tmplat_detail_jour_2 on tb_feesecu_stock_type_fee_tmplat_detail_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券费用_证券类型费用模板明细流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_feesecu_stock_type_fee_tmplat_detail_jour_his;
CREATE TABLE tb_feesecu_stock_type_fee_tmplat_detail_jour_his (
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
    exch_no int NOT NULL ,
    stock_type int NOT NULL ,
    fee_tmplat_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_feesecu_stock_type_fee_tmplat_detail_jour_his_1 on tb_feesecu_stock_type_fee_tmplat_detail_jour_his (init_date,exch_no,stock_type,fee_tmplat_no);
create index idx_tb_feesecu_stock_type_fee_tmplat_detail_jour_his_2 on tb_feesecu_stock_type_fee_tmplat_detail_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券费用_证券代码费用模板明细表
use db_pub;
DROP TABLE IF EXISTS tb_feesecu_stock_code_fee_tmplat_detail;
CREATE TABLE tb_feesecu_stock_code_fee_tmplat_detail (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    fee_tmplat_no int NOT NULL ,
    co_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    fee_no int NOT NULL ,
    amt_ratio decimal(18,12) NOT NULL ,
    amt_value decimal(18,4) NOT NULL ,
    par_value_ratio decimal(18,12) NOT NULL ,
    par_value_value decimal(18,4) NOT NULL ,
    max_fee decimal(18,4) NOT NULL ,
    min_fee decimal(18,4) NOT NULL ,
    float_ratio decimal(18,12) NOT NULL ,
    fee_choice int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_feesecu_stock_code_fee_tmplat_detail_1 on tb_feesecu_stock_code_fee_tmplat_detail (fee_tmplat_no,stock_code_no,fee_no);

-- 创建数据表：公共_证券费用_证券代码费用模板明细流水表
use db_pub;
DROP TABLE IF EXISTS tb_feesecu_stock_code_fee_tmplat_detail_jour;
CREATE TABLE tb_feesecu_stock_code_fee_tmplat_detail_jour (
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
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    fee_tmplat_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_feesecu_stock_code_fee_tmplat_detail_jour_1 on tb_feesecu_stock_code_fee_tmplat_detail_jour (init_date,exch_no,stock_code_no,fee_tmplat_no);
create index idx_tb_feesecu_stock_code_fee_tmplat_detail_jour_2 on tb_feesecu_stock_code_fee_tmplat_detail_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券费用_证券代码费用模板明细流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_feesecu_stock_code_fee_tmplat_detail_jour_his;
CREATE TABLE tb_feesecu_stock_code_fee_tmplat_detail_jour_his (
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
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    fee_tmplat_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_feesecu_stock_code_fee_tmplat_detail_jour_his_1 on tb_feesecu_stock_code_fee_tmplat_detail_jour_his (init_date,exch_no,stock_code_no,fee_tmplat_no);
create index idx_tb_feesecu_stock_code_fee_tmplat_detail_jour_his_2 on tb_feesecu_stock_code_fee_tmplat_detail_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券费用_资产账户证券费用模板表
use db_pub;
DROP TABLE IF EXISTS tb_feesecu_asset_acco_fee_tmplat;
CREATE TABLE tb_feesecu_asset_acco_fee_tmplat (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    asset_acco_no int NOT NULL ,
    co_no int NOT NULL ,
    secu_code_spec_fee_tmplat_no int NOT NULL ,
    secu_type_spec_fee_tmplat_no int NOT NULL ,
    secu_code_fee_tmplat_no int NOT NULL ,
    secu_type_fee_tmplat_no int NOT NULL ,
    secu_code_out_fee_tmplat_no int NOT NULL ,
    secu_type_out_fee_tmplat_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_feesecu_asset_acco_fee_tmplat_1 on tb_feesecu_asset_acco_fee_tmplat (asset_acco_no);
create index idx_tb_feesecu_asset_acco_fee_tmplat_2 on tb_feesecu_asset_acco_fee_tmplat (co_no);

-- 创建数据表：公共_证券费用_资产账户证券费用模板流水表
use db_pub;
DROP TABLE IF EXISTS tb_feesecu_asset_acco_fee_tmplat_jour;
CREATE TABLE tb_feesecu_asset_acco_fee_tmplat_jour (
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
    asset_acco_no int NOT NULL ,
    co_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_feesecu_asset_acco_fee_tmplat_jour_1 on tb_feesecu_asset_acco_fee_tmplat_jour (init_date,asset_acco_no);
create index idx_tb_feesecu_asset_acco_fee_tmplat_jour_2 on tb_feesecu_asset_acco_fee_tmplat_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券费用_资产账户证券费用模板流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_feesecu_asset_acco_fee_tmplat_jour_his;
CREATE TABLE tb_feesecu_asset_acco_fee_tmplat_jour_his (
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
    asset_acco_no int NOT NULL ,
    co_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_feesecu_asset_acco_fee_tmplat_jour_his_1 on tb_feesecu_asset_acco_fee_tmplat_jour_his (init_date,asset_acco_no);
create index idx_tb_feesecu_asset_acco_fee_tmplat_jour_his_2 on tb_feesecu_asset_acco_fee_tmplat_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券费用_外部证券类型费用表
use db_pub;
DROP TABLE IF EXISTS tb_feesecu_out_stock_type_fee;
CREATE TABLE tb_feesecu_out_stock_type_fee (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    pass_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_type int NOT NULL ,
    fee_no int NOT NULL ,
    amt_ratio decimal(18,12) NOT NULL ,
    amt_value decimal(18,4) NOT NULL ,
    par_value_ratio decimal(18,12) NOT NULL ,
    par_value_value decimal(18,4) NOT NULL ,
    max_fee decimal(18,4) NOT NULL ,
    min_fee decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_feesecu_out_stock_type_fee_1 on tb_feesecu_out_stock_type_fee (pass_no,exch_no,stock_type,fee_no);

-- 创建数据表：公共_证券费用_外部证券类型费用流水表
use db_pub;
DROP TABLE IF EXISTS tb_feesecu_out_stock_type_fee_jour;
CREATE TABLE tb_feesecu_out_stock_type_fee_jour (
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
    exch_no int NOT NULL ,
    stock_type int NOT NULL ,
    fee_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_feesecu_out_stock_type_fee_jour_1 on tb_feesecu_out_stock_type_fee_jour (init_date,pass_no,exch_no,stock_type,fee_no);
create index idx_tb_feesecu_out_stock_type_fee_jour_2 on tb_feesecu_out_stock_type_fee_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券费用_外部证券类型费用流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_feesecu_out_stock_type_fee_jour_his;
CREATE TABLE tb_feesecu_out_stock_type_fee_jour_his (
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
    exch_no int NOT NULL ,
    stock_type int NOT NULL ,
    fee_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_feesecu_out_stock_type_fee_jour_his_1 on tb_feesecu_out_stock_type_fee_jour_his (init_date,pass_no,exch_no,stock_type,fee_no);
create index idx_tb_feesecu_out_stock_type_fee_jour_his_2 on tb_feesecu_out_stock_type_fee_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券费用_外部证券代码费用表
use db_pub;
DROP TABLE IF EXISTS tb_feesecu_out_stock_code_fee;
CREATE TABLE tb_feesecu_out_stock_code_fee (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    pass_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    fee_no int NOT NULL ,
    amt_ratio decimal(18,12) NOT NULL ,
    amt_value decimal(18,4) NOT NULL ,
    par_value_ratio decimal(18,12) NOT NULL ,
    par_value_value decimal(18,4) NOT NULL ,
    max_fee decimal(18,4) NOT NULL ,
    min_fee decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_feesecu_out_stock_code_fee_1 on tb_feesecu_out_stock_code_fee (pass_no,stock_code_no,fee_no);
create index idx_tb_feesecu_out_stock_code_fee_2 on tb_feesecu_out_stock_code_fee (pass_no,exch_no);

-- 创建数据表：公共_证券费用_外部证券代码费用流水表
use db_pub;
DROP TABLE IF EXISTS tb_feesecu_out_stock_code_fee_jour;
CREATE TABLE tb_feesecu_out_stock_code_fee_jour (
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
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    fee_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_feesecu_out_stock_code_fee_jour_1 on tb_feesecu_out_stock_code_fee_jour (init_date,pass_no,exch_no,stock_code_no,fee_no);
create index idx_tb_feesecu_out_stock_code_fee_jour_2 on tb_feesecu_out_stock_code_fee_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券费用_外部证券代码费用流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_feesecu_out_stock_code_fee_jour_his;
CREATE TABLE tb_feesecu_out_stock_code_fee_jour_his (
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
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    fee_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_feesecu_out_stock_code_fee_jour_his_1 on tb_feesecu_out_stock_code_fee_jour_his (init_date,pass_no,exch_no,stock_code_no,fee_no);
create index idx_tb_feesecu_out_stock_code_fee_jour_his_2 on tb_feesecu_out_stock_code_fee_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券费用_系统证券类型费用表
use db_pub;
DROP TABLE IF EXISTS tb_feesecu_sys_stock_type_fee;
CREATE TABLE tb_feesecu_sys_stock_type_fee (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_type int NOT NULL ,
    fee_no int NOT NULL ,
    amt_ratio decimal(18,12) NOT NULL ,
    amt_value decimal(18,4) NOT NULL ,
    par_value_ratio decimal(18,12) NOT NULL ,
    par_value_value decimal(18,4) NOT NULL ,
    max_fee decimal(18,4) NOT NULL ,
    min_fee decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_feesecu_sys_stock_type_fee_1 on tb_feesecu_sys_stock_type_fee (exch_no,stock_type,fee_no);

-- 创建数据表：公共_证券费用_系统证券类型费用流水表
use db_pub;
DROP TABLE IF EXISTS tb_feesecu_sys_stock_type_fee_jour;
CREATE TABLE tb_feesecu_sys_stock_type_fee_jour (
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
    fee_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_feesecu_sys_stock_type_fee_jour_1 on tb_feesecu_sys_stock_type_fee_jour (init_date,exch_no,stock_type,fee_no);
create index idx_tb_feesecu_sys_stock_type_fee_jour_2 on tb_feesecu_sys_stock_type_fee_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券费用_系统证券类型费用流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_feesecu_sys_stock_type_fee_jour_his;
CREATE TABLE tb_feesecu_sys_stock_type_fee_jour_his (
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
    fee_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_feesecu_sys_stock_type_fee_jour_his_1 on tb_feesecu_sys_stock_type_fee_jour_his (init_date,exch_no,stock_type,fee_no);
create index idx_tb_feesecu_sys_stock_type_fee_jour_his_2 on tb_feesecu_sys_stock_type_fee_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券费用_系统证券代码费用表
use db_pub;
DROP TABLE IF EXISTS tb_feesecu_sys_stock_code_fee;
CREATE TABLE tb_feesecu_sys_stock_code_fee (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    fee_no int NOT NULL ,
    amt_ratio decimal(18,12) NOT NULL ,
    amt_value decimal(18,4) NOT NULL ,
    par_value_ratio decimal(18,12) NOT NULL ,
    par_value_value decimal(18,4) NOT NULL ,
    max_fee decimal(18,4) NOT NULL ,
    min_fee decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_feesecu_sys_stock_code_fee_1 on tb_feesecu_sys_stock_code_fee (stock_code_no,fee_no);
create index idx_tb_feesecu_sys_stock_code_fee_2 on tb_feesecu_sys_stock_code_fee (exch_no);

-- 创建数据表：公共_证券费用_系统证券代码费用流水表
use db_pub;
DROP TABLE IF EXISTS tb_feesecu_sys_stock_code_fee_jour;
CREATE TABLE tb_feesecu_sys_stock_code_fee_jour (
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
    stock_code_no int NOT NULL ,
    fee_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_feesecu_sys_stock_code_fee_jour_1 on tb_feesecu_sys_stock_code_fee_jour (init_date,exch_no,stock_code_no,fee_no);
create index idx_tb_feesecu_sys_stock_code_fee_jour_2 on tb_feesecu_sys_stock_code_fee_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券费用_系统证券代码费用流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_feesecu_sys_stock_code_fee_jour_his;
CREATE TABLE tb_feesecu_sys_stock_code_fee_jour_his (
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
    stock_code_no int NOT NULL ,
    fee_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_feesecu_sys_stock_code_fee_jour_his_1 on tb_feesecu_sys_stock_code_fee_jour_his (init_date,exch_no,stock_code_no,fee_no);
create index idx_tb_feesecu_sys_stock_code_fee_jour_his_2 on tb_feesecu_sys_stock_code_fee_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券费用_产品费用表
use db_pub;
DROP TABLE IF EXISTS tb_feesecu_prod_fare;
CREATE TABLE tb_feesecu_prod_fare (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_fee_type int NOT NULL ,
    pd_fee_name varchar(64) NOT NULL ,
    pd_fee_rate decimal(18,12) NOT NULL ,
    pd_fee_cacl_type int NOT NULL ,
    pd_fee_cacl_base decimal(18,4) NOT NULL ,
    min_fee decimal(18,4) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_feesecu_prod_fare_1 on tb_feesecu_prod_fare (pd_no,pd_fee_type);
create index idx_tb_feesecu_prod_fare_2 on tb_feesecu_prod_fare (co_no);

-- 创建数据表：公共_证券费用_产品费用流水表
use db_pub;
DROP TABLE IF EXISTS tb_feesecu_prod_fare_jour;
CREATE TABLE tb_feesecu_prod_fare_jour (
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
    pd_fee_type int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_feesecu_prod_fare_jour_1 on tb_feesecu_prod_fare_jour (init_date,co_no,pd_no,pd_fee_type);
create index idx_tb_feesecu_prod_fare_jour_2 on tb_feesecu_prod_fare_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_证券费用_产品费用流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_feesecu_prod_fare_jour_his;
CREATE TABLE tb_feesecu_prod_fare_jour_his (
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
    pd_fee_type int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_feesecu_prod_fare_jour_his_1 on tb_feesecu_prod_fare_jour_his (init_date,co_no,pd_no,pd_fee_type);
create index idx_tb_feesecu_prod_fare_jour_his_2 on tb_feesecu_prod_fare_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_证券费用_费用编号表
use db_pub;
DROP TABLE IF EXISTS tb_feesecu_fee_no;
CREATE TABLE tb_feesecu_fee_no (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    fee_no int NOT NULL ,
    secu_fee_type int NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_feesecu_fee_no_1 on tb_feesecu_fee_no (fee_no);
create index idx_tb_feesecu_fee_no_2 on tb_feesecu_fee_no (secu_fee_type,order_dir,contrc_dir);
commit;
