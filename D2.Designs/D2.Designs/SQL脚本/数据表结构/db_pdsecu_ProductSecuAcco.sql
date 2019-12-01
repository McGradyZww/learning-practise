-- /**************************************************************************************/
-- 创建数据库【产品证券】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pdsecu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pdsecu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：产品证券_账户_市场业务记录编号表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseac_market_busi_record_no;
CREATE TABLE tb_pdseac_market_busi_record_no (
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
create unique index idx_tb_pdseac_market_busi_record_no_1 on tb_pdseac_market_busi_record_no (exch_no,record_no_type);

-- 创建数据表：产品证券_账户_证券账户信息表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseac_secu_acco;
CREATE TABLE tb_pdseac_secu_acco (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco varchar(16) NOT NULL ,
    stock_acco_name varchar(64) NOT NULL ,
    stock_acco_status varchar(2) NOT NULL ,
    stock_acco_apoint_status varchar(2) NOT NULL ,
    allow_stock_type varchar(2048) NOT NULL ,
    busi_limit_str varchar(2048) NOT NULL ,
    registration_agency varchar(32) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseac_secu_acco_1 on tb_pdseac_secu_acco (asset_acco_no,exch_no,stock_acco_no,registration_agency);
create index idx_tb_pdseac_secu_acco_2 on tb_pdseac_secu_acco (co_no,pd_no,exch_no);
create index idx_tb_pdseac_secu_acco_3 on tb_pdseac_secu_acco (stock_acco);

-- 创建数据表：产品证券_账户_证券账户信息流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseac_secu_acco_jour;
CREATE TABLE tb_pdseac_secu_acco_jour (
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
    stock_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdseac_secu_acco_jour_1 on tb_pdseac_secu_acco_jour (init_date,asset_acco_no,stock_acco_no);
create index idx_tb_pdseac_secu_acco_jour_2 on tb_pdseac_secu_acco_jour (init_date,co_no,pd_no);
create index idx_tb_pdseac_secu_acco_jour_3 on tb_pdseac_secu_acco_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_产品证券_账户_证券账户信息流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseac_secu_acco_jour_his;
CREATE TABLE tb_pdseac_secu_acco_jour_his (
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
    stock_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    jour_occur_field varchar(2048) NOT NULL ,
    jour_after_occur_info varchar(2048) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdseac_secu_acco_jour_his_1 on tb_pdseac_secu_acco_jour_his (init_date,asset_acco_no,stock_acco_no);
create index idx_tb_pdseac_secu_acco_jour_his_2 on tb_pdseac_secu_acco_jour_his (init_date,co_no,pd_no);
create index idx_tb_pdseac_secu_acco_jour_his_3 on tb_pdseac_secu_acco_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：产品证券_账户_证券账户自动打新配置表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseac_secu_acco_new_stock_config;
CREATE TABLE tb_pdseac_secu_acco_new_stock_config (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    opor_no int NOT NULL ,
    begin_time int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseac_secu_acco_new_stock_config_1 on tb_pdseac_secu_acco_new_stock_config (stock_acco_no);

-- 创建数据表：产品证券_账户_组合交易组表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseac_Comb_Exgp;
CREATE TABLE tb_pdseac_Comb_Exgp (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    combo_code varchar(32) NOT NULL ,
    stock_code_no int NOT NULL ,
    posi_qty decimal(18,2) NOT NULL ,
    deal_status varchar(2) NOT NULL ,
    combo_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseac_Comb_Exgp_1 on tb_pdseac_Comb_Exgp (exch_group_no,combo_code,stock_code_no);

-- 创建数据表：历史_产品证券_账户_组合交易组表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseac_Comb_Exgp_his;
CREATE TABLE tb_pdseac_Comb_Exgp_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    combo_code varchar(32) NOT NULL ,
    stock_code_no int NOT NULL ,
    posi_qty decimal(18,2) NOT NULL ,
    deal_status varchar(2) NOT NULL ,
    combo_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseac_Comb_Exgp_his_1 on tb_pdseac_Comb_Exgp_his (exch_group_no,combo_code,stock_code_no);

-- 创建数据表：产品证券_账户_产品信息表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_pd_info;
CREATE TABLE tb_pdseca_pd_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    busi_config_str varchar(64) NOT NULL ,
    pd_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseca_pd_info_1 on tb_pdseca_pd_info (co_no,pd_no);

-- 创建数据表：产品证券_账户_产品证券库删除流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseca_pdsecu_delete_jour;
CREATE TABLE tb_pdseca_pdsecu_delete_jour (
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
create index idx_tb_pdseca_pdsecu_delete_jour_1 on tb_pdseca_pdsecu_delete_jour (table_name);
create index idx_tb_pdseca_pdsecu_delete_jour_2 on tb_pdseca_pdsecu_delete_jour (init_date);

-- 创建数据表：历史_产品证券_账户_产品证券库删除流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdseca_pdsecu_delete_jour_his;
CREATE TABLE tb_pdseca_pdsecu_delete_jour_his (
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
create index idx_tb_pdseca_pdsecu_delete_jour_his_1 on tb_pdseca_pdsecu_delete_jour_his (table_name);
create index idx_tb_pdseca_pdsecu_delete_jour_his_2 on tb_pdseca_pdsecu_delete_jour_his (init_date);

-- 创建数据表：产品证券_账户_证券账户自动逆回购配置表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdseac_secu_acco_reverse_repo_config;
CREATE TABLE tb_pdseac_secu_acco_reverse_repo_config (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    opor_no int NOT NULL ,
    begin_time int NOT NULL ,
    avail_cash decimal(18,4) NOT NULL ,
    intrst_ratio decimal(18,12) NOT NULL ,
    mul_acco_trd_qty int NOT NULL ,
    exec_price_type int NOT NULL ,
    task_status varchar(2) NOT NULL ,
    order_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdseac_secu_acco_reverse_repo_config_1 on tb_pdseac_secu_acco_reverse_repo_config (asset_acco_no,stock_code_no,exch_group_no);
commit;
