-- /**************************************************************************************/
-- 创建数据库【产品期货】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pdfutu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pdfutu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：产品期货_账户_市场业务记录编号表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfuac_market_busi_record_no;
CREATE TABLE tb_pdfuac_market_busi_record_no (
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
create unique index idx_tb_pdfuac_market_busi_record_no_1 on tb_pdfuac_market_busi_record_no (exch_no,record_no_type);

-- 创建数据表：产品期货_账户_期货账户信息表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfuac_futu_acco;
CREATE TABLE tb_pdfuac_futu_acco (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco varchar(16) NOT NULL ,
    futu_acco_name varchar(64) NOT NULL ,
    futu_acco_status varchar(2) NOT NULL ,
    hedge_type int NOT NULL ,
    allow_contrc_type varchar(2048) NOT NULL ,
    busi_limit_str varchar(2048) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfuac_futu_acco_1 on tb_pdfuac_futu_acco (asset_acco_no,exch_no,futu_acco,hedge_type);
create index idx_tb_pdfuac_futu_acco_2 on tb_pdfuac_futu_acco (asset_acco_no,futu_acco_no);
create index idx_tb_pdfuac_futu_acco_3 on tb_pdfuac_futu_acco (co_no,pd_no,exch_no);

-- 创建数据表：产品期货_账户_期货账户信息流水表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfuac_futu_acco_jour;
CREATE TABLE tb_pdfuac_futu_acco_jour (
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
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfuac_futu_acco_jour_1 on tb_pdfuac_futu_acco_jour (init_date,asset_acco_no,futu_acco_no);
create index idx_tb_pdfuac_futu_acco_jour_2 on tb_pdfuac_futu_acco_jour (init_date,co_no,pd_no,exch_no);
create index idx_tb_pdfuac_futu_acco_jour_3 on tb_pdfuac_futu_acco_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_产品期货_账户_期货账户信息流水表
use db_pdfutu_his;
DROP TABLE IF EXISTS tb_pdfuac_futu_acco_jour_his;
CREATE TABLE tb_pdfuac_futu_acco_jour_his (
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
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdfuac_futu_acco_jour_his_1 on tb_pdfuac_futu_acco_jour_his (init_date,asset_acco_no,futu_acco_no);
create index idx_tb_pdfuac_futu_acco_jour_his_2 on tb_pdfuac_futu_acco_jour_his (init_date,co_no,pd_no,exch_no);
create index idx_tb_pdfuac_futu_acco_jour_his_3 on tb_pdfuac_futu_acco_jour_his (init_date,opor_co_no,opor_no);
commit;
