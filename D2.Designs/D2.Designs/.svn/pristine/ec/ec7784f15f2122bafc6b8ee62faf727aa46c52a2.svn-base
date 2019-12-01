-- /**************************************************************************************/
-- 创建数据库【公共】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：公共_期货费用_期货费用模板表
use db_pub;
DROP TABLE IF EXISTS tb_fee_futu_fee_tmplat;
CREATE TABLE tb_fee_futu_fee_tmplat (
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
create unique index idx_tb_fee_futu_fee_tmplat_1 on tb_fee_futu_fee_tmplat (co_no,fee_tmplat_name);
create index idx_tb_fee_futu_fee_tmplat_2 on tb_fee_futu_fee_tmplat (fee_tmplat_no);

-- 创建数据表：公共_期货费用_期货费用模板流水表
use db_pub;
DROP TABLE IF EXISTS tb_fee_futu_fee_tmplat_jour;
CREATE TABLE tb_fee_futu_fee_tmplat_jour (
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
    fee_tmplat_no int NOT NULL ,
    fee_tmplat_name varchar(64) NOT NULL ,
    fee_tmplat_kind int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_fee_futu_fee_tmplat_jour_1 on tb_fee_futu_fee_tmplat_jour (init_date,co_no,fee_tmplat_no);
create index idx_tb_fee_futu_fee_tmplat_jour_2 on tb_fee_futu_fee_tmplat_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_期货费用_期货费用模板流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_fee_futu_fee_tmplat_jour_his;
CREATE TABLE tb_fee_futu_fee_tmplat_jour_his (
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
    fee_tmplat_no int NOT NULL ,
    fee_tmplat_name varchar(64) NOT NULL ,
    fee_tmplat_kind int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_fee_futu_fee_tmplat_jour_his_1 on tb_fee_futu_fee_tmplat_jour_his (init_date,co_no,fee_tmplat_no);
create index idx_tb_fee_futu_fee_tmplat_jour_his_2 on tb_fee_futu_fee_tmplat_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_期货费用_合约类型费用模板明细表
use db_pub;
DROP TABLE IF EXISTS tb_fee_contrc_type_fee_tmplat_detail;
CREATE TABLE tb_fee_contrc_type_fee_tmplat_detail (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    fee_tmplat_no int NOT NULL ,
    co_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_type int NOT NULL ,
    fee_no int NOT NULL ,
    amt_ratio decimal(18,12) NOT NULL ,
    amt_value decimal(18,4) NOT NULL ,
    par_value_ratio decimal(18,12) NOT NULL ,
    par_value_value decimal(18,4) NOT NULL ,
    max_fee decimal(18,4) NOT NULL ,
    min_fee decimal(18,4) NOT NULL ,
    float_ratio decimal(18,12) NOT NULL ,
    fee_choice int NOT NULL ,
    hedge_type int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_fee_contrc_type_fee_tmplat_detail_1 on tb_fee_contrc_type_fee_tmplat_detail (fee_tmplat_no,exch_no,contrc_type,fee_no,hedge_type);

-- 创建数据表：公共_期货费用_合约类型费用模板明细流水表
use db_pub;
DROP TABLE IF EXISTS tb_fee_contrc_type_fee_tmplat_detail_jour;
CREATE TABLE tb_fee_contrc_type_fee_tmplat_detail_jour (
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
    oper_menu_no int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_type int NOT NULL ,
    fee_tmplat_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_fee_contrc_type_fee_tmplat_detail_jour_1 on tb_fee_contrc_type_fee_tmplat_detail_jour (init_date,exch_no,contrc_type,fee_tmplat_no);
create index idx_tb_fee_contrc_type_fee_tmplat_detail_jour_2 on tb_fee_contrc_type_fee_tmplat_detail_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_期货费用_合约类型费用模板明细流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_fee_contrc_type_fee_tmplat_detail_jour_his;
CREATE TABLE tb_fee_contrc_type_fee_tmplat_detail_jour_his (
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
    oper_menu_no int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_type int NOT NULL ,
    fee_tmplat_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_fee_contrc_type_fee_tmplat_detail_jour_his_1 on tb_fee_contrc_type_fee_tmplat_detail_jour_his (init_date,exch_no,contrc_type,fee_tmplat_no);
create index idx_tb_fee_contrc_type_fee_tmplat_detail_jour_his_2 on tb_fee_contrc_type_fee_tmplat_detail_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_期货费用_合约代码费用模板明细表
use db_pub;
DROP TABLE IF EXISTS tb_fee_contrc_code_fee_tmplat_detail;
CREATE TABLE tb_fee_contrc_code_fee_tmplat_detail (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    fee_tmplat_no int NOT NULL ,
    co_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    fee_no int NOT NULL ,
    amt_ratio decimal(18,12) NOT NULL ,
    amt_value decimal(18,4) NOT NULL ,
    par_value_ratio decimal(18,12) NOT NULL ,
    par_value_value decimal(18,4) NOT NULL ,
    max_fee decimal(18,4) NOT NULL ,
    min_fee decimal(18,4) NOT NULL ,
    float_ratio decimal(18,12) NOT NULL ,
    fee_choice int NOT NULL ,
    hedge_type int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_fee_contrc_code_fee_tmplat_detail_1 on tb_fee_contrc_code_fee_tmplat_detail (fee_tmplat_no,contrc_code_no,fee_no,hedge_type);

-- 创建数据表：公共_期货费用_合约代码费用模板明细流水表
use db_pub;
DROP TABLE IF EXISTS tb_fee_contrc_code_fee_tmplat_detail_jour;
CREATE TABLE tb_fee_contrc_code_fee_tmplat_detail_jour (
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
    oper_menu_no int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    fee_tmplat_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_fee_contrc_code_fee_tmplat_detail_jour_1 on tb_fee_contrc_code_fee_tmplat_detail_jour (init_date,exch_no,contrc_code_no,fee_tmplat_no);
create index idx_tb_fee_contrc_code_fee_tmplat_detail_jour_2 on tb_fee_contrc_code_fee_tmplat_detail_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_期货费用_合约代码费用模板明细流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_fee_contrc_code_fee_tmplat_detail_jour_his;
CREATE TABLE tb_fee_contrc_code_fee_tmplat_detail_jour_his (
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
    oper_menu_no int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    fee_tmplat_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_fee_contrc_code_fee_tmplat_detail_jour_his_1 on tb_fee_contrc_code_fee_tmplat_detail_jour_his (init_date,exch_no,contrc_code_no,fee_tmplat_no);
create index idx_tb_fee_contrc_code_fee_tmplat_detail_jour_his_2 on tb_fee_contrc_code_fee_tmplat_detail_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_期货费用_资产账户期货费用模板表
use db_pub;
DROP TABLE IF EXISTS tb_fee_asset_acco_futu_fee_tmplat;
CREATE TABLE tb_fee_asset_acco_futu_fee_tmplat (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    asset_acco_no int NOT NULL ,
    co_no int NOT NULL ,
    futu_code_spec_fee_tmplat_no int NOT NULL ,
    futu_type_spec_fee_tmplat_no int NOT NULL ,
    futu_code_fee_tmplat_no int NOT NULL ,
    futu_type_fee_tmplat_no int NOT NULL ,
    futu_code_out_fee_tmplat_no int NOT NULL ,
    futu_type_out_fee_tmplat_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_fee_asset_acco_futu_fee_tmplat_1 on tb_fee_asset_acco_futu_fee_tmplat (asset_acco_no);
create index idx_tb_fee_asset_acco_futu_fee_tmplat_2 on tb_fee_asset_acco_futu_fee_tmplat (co_no,asset_acco_no);

-- 创建数据表：公共_期货费用_资产账户期货费用模板流水表
use db_pub;
DROP TABLE IF EXISTS tb_fee_asset_acco_futu_fee_tmplat_jour;
CREATE TABLE tb_fee_asset_acco_futu_fee_tmplat_jour (
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
    oper_menu_no int NOT NULL ,
    init_date int NOT NULL ,
    asset_acco_no int NOT NULL ,
    co_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_fee_asset_acco_futu_fee_tmplat_jour_1 on tb_fee_asset_acco_futu_fee_tmplat_jour (init_date,asset_acco_no);
create index idx_tb_fee_asset_acco_futu_fee_tmplat_jour_2 on tb_fee_asset_acco_futu_fee_tmplat_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_期货费用_资产账户期货费用模板流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_fee_asset_acco_futu_fee_tmplat_jour_his;
CREATE TABLE tb_fee_asset_acco_futu_fee_tmplat_jour_his (
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
    oper_menu_no int NOT NULL ,
    init_date int NOT NULL ,
    asset_acco_no int NOT NULL ,
    co_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_fee_asset_acco_futu_fee_tmplat_jour_his_1 on tb_fee_asset_acco_futu_fee_tmplat_jour_his (init_date,asset_acco_no);
create index idx_tb_fee_asset_acco_futu_fee_tmplat_jour_his_2 on tb_fee_asset_acco_futu_fee_tmplat_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_期货费用_外部合约类型费用表
use db_pub;
DROP TABLE IF EXISTS tb_fee_out_contrc_type_fee;
CREATE TABLE tb_fee_out_contrc_type_fee (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    pass_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_type int NOT NULL ,
    fee_no int NOT NULL ,
    amt_ratio decimal(18,12) NOT NULL ,
    amt_value decimal(18,4) NOT NULL ,
    par_value_ratio decimal(18,12) NOT NULL ,
    par_value_value decimal(18,4) NOT NULL ,
    max_fee decimal(18,4) NOT NULL ,
    min_fee decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_fee_out_contrc_type_fee_1 on tb_fee_out_contrc_type_fee (pass_no,exch_no,contrc_type,fee_no);

-- 创建数据表：公共_期货费用_外部合约类型费用流水表
use db_pub;
DROP TABLE IF EXISTS tb_fee_out_contrc_type_fee_jour;
CREATE TABLE tb_fee_out_contrc_type_fee_jour (
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
    oper_menu_no int NOT NULL ,
    init_date int NOT NULL ,
    pass_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_type int NOT NULL ,
    fee_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_fee_out_contrc_type_fee_jour_1 on tb_fee_out_contrc_type_fee_jour (init_date,pass_no,exch_no,contrc_type,fee_no);
create index idx_tb_fee_out_contrc_type_fee_jour_2 on tb_fee_out_contrc_type_fee_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_期货费用_外部合约类型费用流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_fee_out_contrc_type_fee_jour_his;
CREATE TABLE tb_fee_out_contrc_type_fee_jour_his (
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
    oper_menu_no int NOT NULL ,
    init_date int NOT NULL ,
    pass_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_type int NOT NULL ,
    fee_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_fee_out_contrc_type_fee_jour_his_1 on tb_fee_out_contrc_type_fee_jour_his (init_date,pass_no,exch_no,contrc_type,fee_no);
create index idx_tb_fee_out_contrc_type_fee_jour_his_2 on tb_fee_out_contrc_type_fee_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_期货费用_外部合约代码费用表
use db_pub;
DROP TABLE IF EXISTS tb_fee_out_contrc_code_fee;
CREATE TABLE tb_fee_out_contrc_code_fee (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    pass_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    fee_no int NOT NULL ,
    amt_ratio decimal(18,12) NOT NULL ,
    amt_value decimal(18,4) NOT NULL ,
    par_value_ratio decimal(18,12) NOT NULL ,
    par_value_value decimal(18,4) NOT NULL ,
    max_fee decimal(18,4) NOT NULL ,
    min_fee decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_fee_out_contrc_code_fee_1 on tb_fee_out_contrc_code_fee (pass_no,contrc_code_no,fee_no);
create index idx_tb_fee_out_contrc_code_fee_2 on tb_fee_out_contrc_code_fee (pass_no,exch_no);

-- 创建数据表：公共_期货费用_外部合约代码费用流水表
use db_pub;
DROP TABLE IF EXISTS tb_fee_out_contrc_code_fee_jour;
CREATE TABLE tb_fee_out_contrc_code_fee_jour (
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
    oper_menu_no int NOT NULL ,
    init_date int NOT NULL ,
    pass_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    fee_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_fee_out_contrc_code_fee_jour_1 on tb_fee_out_contrc_code_fee_jour (init_date,pass_no,exch_no,contrc_code_no,fee_no);
create index idx_tb_fee_out_contrc_code_fee_jour_2 on tb_fee_out_contrc_code_fee_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_期货费用_外部合约代码费用流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_fee_out_contrc_code_fee_jour_his;
CREATE TABLE tb_fee_out_contrc_code_fee_jour_his (
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
    oper_menu_no int NOT NULL ,
    init_date int NOT NULL ,
    pass_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    fee_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_fee_out_contrc_code_fee_jour_his_1 on tb_fee_out_contrc_code_fee_jour_his (init_date,pass_no,exch_no,contrc_code_no,fee_no);
create index idx_tb_fee_out_contrc_code_fee_jour_his_2 on tb_fee_out_contrc_code_fee_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_期货费用_系统合约类型费用表
use db_pub;
DROP TABLE IF EXISTS tb_fee_sys_contrc_type_fee;
CREATE TABLE tb_fee_sys_contrc_type_fee (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_type int NOT NULL ,
    fee_no int NOT NULL ,
    amt_ratio decimal(18,12) NOT NULL ,
    amt_value decimal(18,4) NOT NULL ,
    par_value_ratio decimal(18,12) NOT NULL ,
    par_value_value decimal(18,4) NOT NULL ,
    max_fee decimal(18,4) NOT NULL ,
    min_fee decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_fee_sys_contrc_type_fee_1 on tb_fee_sys_contrc_type_fee (exch_no,contrc_type,fee_no);

-- 创建数据表：公共_期货费用_系统合约类型费用流水表
use db_pub;
DROP TABLE IF EXISTS tb_fee_sys_contrc_type_fee_jour;
CREATE TABLE tb_fee_sys_contrc_type_fee_jour (
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
    oper_menu_no int NOT NULL ,
    init_date int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_type int NOT NULL ,
    fee_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_fee_sys_contrc_type_fee_jour_1 on tb_fee_sys_contrc_type_fee_jour (init_date,exch_no,contrc_type,fee_no);
create index idx_tb_fee_sys_contrc_type_fee_jour_2 on tb_fee_sys_contrc_type_fee_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_期货费用_系统合约类型费用流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_fee_sys_contrc_type_fee_jour_his;
CREATE TABLE tb_fee_sys_contrc_type_fee_jour_his (
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
    oper_menu_no int NOT NULL ,
    init_date int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_type int NOT NULL ,
    fee_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_fee_sys_contrc_type_fee_jour_his_1 on tb_fee_sys_contrc_type_fee_jour_his (init_date,exch_no,contrc_type,fee_no);
create index idx_tb_fee_sys_contrc_type_fee_jour_his_2 on tb_fee_sys_contrc_type_fee_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_期货费用_系统合约代码费用表
use db_pub;
DROP TABLE IF EXISTS tb_fee_sys_contrc_code_fee;
CREATE TABLE tb_fee_sys_contrc_code_fee (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    fee_no int NOT NULL ,
    amt_ratio decimal(18,12) NOT NULL ,
    amt_value decimal(18,4) NOT NULL ,
    par_value_ratio decimal(18,12) NOT NULL ,
    par_value_value decimal(18,4) NOT NULL ,
    max_fee decimal(18,4) NOT NULL ,
    min_fee decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_fee_sys_contrc_code_fee_1 on tb_fee_sys_contrc_code_fee (contrc_code_no,fee_no);

-- 创建数据表：公共_期货费用_系统合约代码费用流水表
use db_pub;
DROP TABLE IF EXISTS tb_fee_sys_contrc_code_fee_jour;
CREATE TABLE tb_fee_sys_contrc_code_fee_jour (
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
    oper_menu_no int NOT NULL ,
    init_date int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    fee_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_fee_sys_contrc_code_fee_jour_1 on tb_fee_sys_contrc_code_fee_jour (init_date,exch_no,contrc_code_no,fee_no);
create index idx_tb_fee_sys_contrc_code_fee_jour_2 on tb_fee_sys_contrc_code_fee_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_期货费用_系统合约代码费用流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_fee_sys_contrc_code_fee_jour_his;
CREATE TABLE tb_fee_sys_contrc_code_fee_jour_his (
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
    oper_menu_no int NOT NULL ,
    init_date int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    fee_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_fee_sys_contrc_code_fee_jour_his_1 on tb_fee_sys_contrc_code_fee_jour_his (init_date,exch_no,contrc_code_no,fee_no);
create index idx_tb_fee_sys_contrc_code_fee_jour_his_2 on tb_fee_sys_contrc_code_fee_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_期货费用_费用编号表
use db_pub;
DROP TABLE IF EXISTS tb_fee_futu_fee_no;
CREATE TABLE tb_fee_futu_fee_no (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    fee_no int NOT NULL ,
    futu_fee_type int NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_fee_futu_fee_no_1 on tb_fee_futu_fee_no (fee_no);
create index idx_tb_fee_futu_fee_no_2 on tb_fee_futu_fee_no (futu_fee_type,order_dir,contrc_dir);
commit;
