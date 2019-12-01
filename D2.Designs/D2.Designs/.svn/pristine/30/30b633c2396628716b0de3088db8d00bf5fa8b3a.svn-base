-- /**************************************************************************************/
-- 创建数据库【风控证券】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_rksecu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_rksecu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：风控证券_维度_证券维度关系表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksedm_stock_code_dimension;
CREATE TABLE tb_rksedm_stock_code_dimension (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    dime_type int NOT NULL ,
    ctrl_cond_dim_code_str varchar(255) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksedm_stock_code_dimension_1 on tb_rksedm_stock_code_dimension (co_no,dime_type,ctrl_cond_dim_code_str);

-- 创建数据表：风控证券_维度_指数类型表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksedm_index_type;
CREATE TABLE tb_rksedm_index_type (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    index_no int NOT NULL ,
    index_code varchar(6) NOT NULL ,
    index_name varchar(64) NOT NULL ,
    index_build_orgn varchar(64) NOT NULL ,
    weight_type int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksedm_index_type_1 on tb_rksedm_index_type (index_no);
create index idx_tb_rksedm_index_type_2 on tb_rksedm_index_type (index_code);

-- 创建数据表：风控证券_维度_指数证券代码表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksedm_index_stock;
CREATE TABLE tb_rksedm_index_stock (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    index_no int NOT NULL ,
    index_code varchar(6) NOT NULL ,
    index_name varchar(64) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    stock_type int NOT NULL ,
    weight_value decimal(18,4) NOT NULL ,
    weight_ratio decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksedm_index_stock_1 on tb_rksedm_index_stock (index_no,exch_no,stock_code_no);
create index idx_tb_rksedm_index_stock_2 on tb_rksedm_index_stock (index_code);

-- 创建数据表：风控证券_维度_行业类型表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksedm_industry_type;
CREATE TABLE tb_rksedm_industry_type (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    indu_type_no int NOT NULL ,
    indu_type_name varchar(64) NOT NULL ,
    indu_bulid_orgn varchar(64) NOT NULL ,
    indu_level_total int NOT NULL ,
    weight_type int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksedm_industry_type_1 on tb_rksedm_industry_type (indu_type_no);

-- 创建数据表：风控证券_维度_行业层级表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksedm_industry_classification;
CREATE TABLE tb_rksedm_industry_classification (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    indu_type_no int NOT NULL ,
    indu_code varchar(6) NOT NULL ,
    indu_name varchar(64) NOT NULL ,
    indu_level_total int NOT NULL ,
    indu_level int NOT NULL ,
    highup_indu_code varchar(6) NOT NULL ,
    weight_type int NOT NULL ,
    weight_value decimal(18,4) NOT NULL ,
    weight_ratio decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksedm_industry_classification_1 on tb_rksedm_industry_classification (indu_type_no,indu_code);

-- 创建数据表：风控证券_维度_行业证券代码表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksedm_industry_stock;
CREATE TABLE tb_rksedm_industry_stock (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    indu_type_no int NOT NULL ,
    indu_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    stock_type int NOT NULL ,
    weight_value decimal(18,4) NOT NULL ,
    weight_ratio decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksedm_industry_stock_1 on tb_rksedm_industry_stock (indu_type_no,indu_code,exch_no,stock_code_no);
create index idx_tb_rksedm_industry_stock_2 on tb_rksedm_industry_stock (indu_code);

-- 创建数据表：风控证券_维度_自定义维度类型表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksedm_custom_dimension_type;
CREATE TABLE tb_rksedm_custom_dimension_type (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    dime_type_code varchar(32) NOT NULL ,
    dime_type_name varchar(64) NOT NULL ,
    dime_sql_script varchar(10000) NOT NULL ,
    dime_sql_create_type int NOT NULL ,
    weight_type int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksedm_custom_dimension_type_1 on tb_rksedm_custom_dimension_type (dime_type_code);
create index idx_tb_rksedm_custom_dimension_type_2 on tb_rksedm_custom_dimension_type (dime_sql_create_type);

-- 创建数据表：风控证券_维度_自定义维度证券代码表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksedm_custom_dimension_stock;
CREATE TABLE tb_rksedm_custom_dimension_stock (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    dime_type_code varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    stock_type int NOT NULL ,
    weight_value decimal(18,4) NOT NULL ,
    weight_ratio decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksedm_custom_dimension_stock_1 on tb_rksedm_custom_dimension_stock (dime_type_code,exch_no,stock_code_no);

-- 创建数据表：风控证券_维度_机构维度类型表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksedm_user_dimension_type;
CREATE TABLE tb_rksedm_user_dimension_type (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    user_dim_type int NOT NULL ,
    dime_type_code varchar(32) NOT NULL ,
    dime_type_name varchar(64) NOT NULL ,
    weight_type int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksedm_user_dimension_type_1 on tb_rksedm_user_dimension_type (co_no,user_dim_type,dime_type_code);

-- 创建数据表：风控证券_维度_机构维度证券代码表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksedm_user_dimension_stock;
CREATE TABLE tb_rksedm_user_dimension_stock (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    dime_type_code varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    stock_type int NOT NULL ,
    weight_value decimal(18,4) NOT NULL ,
    weight_ratio decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksedm_user_dimension_stock_1 on tb_rksedm_user_dimension_stock (co_no,dime_type_code,exch_no,stock_code_no);
create index idx_tb_rksedm_user_dimension_stock_2 on tb_rksedm_user_dimension_stock (dime_type_code,stock_code);

-- 创建数据表：风控证券_维度_A+H股关系对照表
use db_rksecu;
DROP TABLE IF EXISTS tb_rksedm_AH_code_Relationship;
CREATE TABLE tb_rksedm_AH_code_Relationship (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_name varchar(64) NOT NULL ,
    target_code varchar(6) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rksedm_AH_code_Relationship_1 on tb_rksedm_AH_code_Relationship (exch_no,stock_code);
create index idx_tb_rksedm_AH_code_Relationship_2 on tb_rksedm_AH_code_Relationship (target_code);
commit;
