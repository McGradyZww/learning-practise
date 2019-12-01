-- /**************************************************************************************/
-- 创建数据库【产品证券】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pdsecu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pdsecu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：产品证券_融资融券_交易组资金负债表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsecr_exgp_capitdebt;
CREATE TABLE tb_pdsecr_exgp_capitdebt (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    loan_sell_amt decimal(18,4) NOT NULL ,
    debt_interest_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsecr_exgp_capitdebt_1 on tb_pdsecr_exgp_capitdebt (exch_group_no,asset_acco_no,crncy_type);
create index idx_tb_pdsecr_exgp_capitdebt_2 on tb_pdsecr_exgp_capitdebt (co_no,pd_no,crncy_type);
create index idx_tb_pdsecr_exgp_capitdebt_3 on tb_pdsecr_exgp_capitdebt (asset_acco_no,crncy_type);
create index idx_tb_pdsecr_exgp_capitdebt_4 on tb_pdsecr_exgp_capitdebt (update_date,update_time);

-- 创建数据表：产品证券_融资融券_历史交易组资金负债表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsecr_exgp_capitdebt_his;
CREATE TABLE tb_pdsecr_exgp_capitdebt_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    loan_sell_amt decimal(18,4) NOT NULL ,
    debt_interest_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsecr_exgp_capitdebt_his_1 on tb_pdsecr_exgp_capitdebt_his (init_date,exch_group_no,asset_acco_no,crncy_type);
create index idx_tb_pdsecr_exgp_capitdebt_his_2 on tb_pdsecr_exgp_capitdebt_his (init_date,co_no,pd_no,crncy_type);
create index idx_tb_pdsecr_exgp_capitdebt_his_3 on tb_pdsecr_exgp_capitdebt_his (init_date,crncy_type,asset_acco_no);

-- 创建数据表：产品证券_融资融券_资产账户资金负债表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsecr_asac_capitdebt;
CREATE TABLE tb_pdsecr_asac_capitdebt (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    loan_sell_amt decimal(18,4) NOT NULL ,
    debt_interest_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsecr_asac_capitdebt_1 on tb_pdsecr_asac_capitdebt (asset_acco_no,crncy_type);
create index idx_tb_pdsecr_asac_capitdebt_2 on tb_pdsecr_asac_capitdebt (co_no,pd_no,crncy_type);
create index idx_tb_pdsecr_asac_capitdebt_3 on tb_pdsecr_asac_capitdebt (asset_acco_no,crncy_type);
create index idx_tb_pdsecr_asac_capitdebt_4 on tb_pdsecr_asac_capitdebt (update_date,update_time);

-- 创建数据表：产品证券_融资融券_历史资产账户资金负债表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsecr_asac_capitdebt_his;
CREATE TABLE tb_pdsecr_asac_capitdebt_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    loan_sell_amt decimal(18,4) NOT NULL ,
    debt_interest_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsecr_asac_capitdebt_his_1 on tb_pdsecr_asac_capitdebt_his (init_date,asset_acco_no,crncy_type);
create index idx_tb_pdsecr_asac_capitdebt_his_2 on tb_pdsecr_asac_capitdebt_his (init_date,co_no,pd_no,crncy_type);

-- 创建数据表：产品证券_融资融券_交易组持仓负债表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsecr_exgp_posidebt;
CREATE TABLE tb_pdsecr_exgp_posidebt (
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
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    invest_type int NOT NULL ,
    debt_type int NOT NULL ,
    begin_debt_qty decimal(18,2) NOT NULL ,
    curr_debt_qty decimal(18,2) NOT NULL ,
    posi_qty_check_diff decimal(18,2) NOT NULL ,
    begin_debt_amt decimal(18,4) NOT NULL ,
    curr_debt_amt decimal(18,4) NOT NULL ,
    debt_interest_amt decimal(18,4) NOT NULL ,
    debt_return_amt decimal(18,4) NOT NULL ,
    debt_return_qty decimal(18,2) NOT NULL ,
    return_interest_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsecr_exgp_posidebt_1 on tb_pdsecr_exgp_posidebt (exch_group_no,asset_acco_no,stock_acco_no,stock_code_no,invest_type,debt_type);
create index idx_tb_pdsecr_exgp_posidebt_2 on tb_pdsecr_exgp_posidebt (co_no,pd_no,exch_no);
create index idx_tb_pdsecr_exgp_posidebt_3 on tb_pdsecr_exgp_posidebt (update_date,update_time);

-- 创建数据表：产品证券_融资融券_历史交易组持仓负债表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsecr_exgp_posidebt_his;
CREATE TABLE tb_pdsecr_exgp_posidebt_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    invest_type int NOT NULL ,
    debt_type int NOT NULL ,
    begin_debt_qty decimal(18,2) NOT NULL ,
    curr_debt_qty decimal(18,2) NOT NULL ,
    posi_qty_check_diff decimal(18,2) NOT NULL ,
    begin_debt_amt decimal(18,4) NOT NULL ,
    curr_debt_amt decimal(18,4) NOT NULL ,
    debt_interest_amt decimal(18,4) NOT NULL ,
    debt_return_amt decimal(18,4) NOT NULL ,
    debt_return_qty decimal(18,2) NOT NULL ,
    return_interest_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsecr_exgp_posidebt_his_1 on tb_pdsecr_exgp_posidebt_his (init_date,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no,invest_type,debt_type);
create index idx_tb_pdsecr_exgp_posidebt_his_2 on tb_pdsecr_exgp_posidebt_his (init_date,co_no,pd_no,exch_no);

-- 创建数据表：产品证券_融资融券_资产账户持仓负债表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsecr_asac_posidebt;
CREATE TABLE tb_pdsecr_asac_posidebt (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    invest_type int NOT NULL ,
    debt_type int NOT NULL ,
    begin_debt_qty decimal(18,2) NOT NULL ,
    curr_debt_qty decimal(18,2) NOT NULL ,
    posi_qty_check_diff decimal(18,2) NOT NULL ,
    begin_debt_amt decimal(18,4) NOT NULL ,
    curr_debt_amt decimal(18,4) NOT NULL ,
    debt_interest_amt decimal(18,4) NOT NULL ,
    debt_return_amt decimal(18,4) NOT NULL ,
    debt_return_qty decimal(18,2) NOT NULL ,
    return_interest_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsecr_asac_posidebt_1 on tb_pdsecr_asac_posidebt (asset_acco_no,stock_acco_no,stock_code_no,invest_type,debt_type);
create index idx_tb_pdsecr_asac_posidebt_2 on tb_pdsecr_asac_posidebt (co_no,pd_no,debt_type);
create index idx_tb_pdsecr_asac_posidebt_3 on tb_pdsecr_asac_posidebt (update_date,update_time);

-- 创建数据表：产品证券_融资融券_历史资产账户持仓负债表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsecr_asac_posidebt_his;
CREATE TABLE tb_pdsecr_asac_posidebt_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    invest_type int NOT NULL ,
    debt_type int NOT NULL ,
    begin_debt_qty decimal(18,2) NOT NULL ,
    curr_debt_qty decimal(18,2) NOT NULL ,
    posi_qty_check_diff decimal(18,2) NOT NULL ,
    begin_debt_amt decimal(18,4) NOT NULL ,
    curr_debt_amt decimal(18,4) NOT NULL ,
    debt_interest_amt decimal(18,4) NOT NULL ,
    debt_return_amt decimal(18,4) NOT NULL ,
    debt_return_qty decimal(18,2) NOT NULL ,
    return_interest_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdsecr_asac_posidebt_his_1 on tb_pdsecr_asac_posidebt_his (init_date,asset_acco_no,stock_acco_no,stock_code_no,invest_type,debt_type);
create index idx_tb_pdsecr_asac_posidebt_his_2 on tb_pdsecr_asac_posidebt_his (init_date,co_no,pd_no,debt_type);

-- 创建数据表：产品证券_融资融券_负债变动流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsecr_debt_occur_jour;
CREATE TABLE tb_pdsecr_debt_occur_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    debt_type int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    occur_end_qty decimal(18,2) NOT NULL ,
    occur_end_amt decimal(18,4) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    record_valid_flag int NOT NULL ,
    curr_row_id bigint NOT NULL ,
    return_capit_jour_nor int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsecr_debt_occur_jour_1 on tb_pdsecr_debt_occur_jour (init_date);
create index idx_tb_pdsecr_debt_occur_jour_2 on tb_pdsecr_debt_occur_jour (stock_code_no,debt_type);

-- 创建数据表：历史_产品证券_融资融券_负债变动流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsecr_debt_occur_jour_his;
CREATE TABLE tb_pdsecr_debt_occur_jour_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    debt_type int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    occur_end_qty decimal(18,2) NOT NULL ,
    occur_end_amt decimal(18,4) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    record_valid_flag int NOT NULL ,
    curr_row_id bigint NOT NULL ,
    return_capit_jour_nor int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsecr_debt_occur_jour_his_1 on tb_pdsecr_debt_occur_jour_his (init_date);
create index idx_tb_pdsecr_debt_occur_jour_his_2 on tb_pdsecr_debt_occur_jour_his (stock_code_no,debt_type);

-- 创建数据表：产品证券_融资融券_资产账户负债明细表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsecr_asac_debtdetail;
CREATE TABLE tb_pdsecr_asac_debtdetail (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    debt_type int NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_fee decimal(18,4) NOT NULL ,
    order_no int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    debt_intrst_rate decimal(18,12) NOT NULL ,
    begin_debt_amt decimal(18,4) NOT NULL ,
    begin_debt_qty decimal(18,2) NOT NULL ,
    debt_amt decimal(18,4) NOT NULL ,
    debt_qty decimal(18,2) NOT NULL ,
    debt_fee decimal(18,4) NOT NULL ,
    debt_interest decimal(18,4) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    debt_return_amt decimal(18,4) NOT NULL ,
    debt_return_qty decimal(18,2) NOT NULL ,
    return_interest_amt decimal(18,4) NOT NULL ,
    interest_update_date int NOT NULL ,
    debt_end_date int NOT NULL ,
    orign_debt_end_date int NOT NULL ,
    defer_times int NOT NULL ,
    debt_return_date int NOT NULL ,
    debt_status int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsecr_asac_debtdetail_1 on tb_pdsecr_asac_debtdetail (init_date,order_no);
create index idx_tb_pdsecr_asac_debtdetail_2 on tb_pdsecr_asac_debtdetail (asset_acco_no,stock_code_no,debt_type,debt_status);
create index idx_tb_pdsecr_asac_debtdetail_3 on tb_pdsecr_asac_debtdetail (debt_status);
create index idx_tb_pdsecr_asac_debtdetail_4 on tb_pdsecr_asac_debtdetail (co_no,pd_no,asset_acco_no);

-- 创建数据表：历史_产品证券_融资融券_资产账户负债明细表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsecr_asac_debtdetail_his;
CREATE TABLE tb_pdsecr_asac_debtdetail_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    debt_type int NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_fee decimal(18,4) NOT NULL ,
    order_no int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    debt_intrst_rate decimal(18,12) NOT NULL ,
    begin_debt_amt decimal(18,4) NOT NULL ,
    begin_debt_qty decimal(18,2) NOT NULL ,
    debt_amt decimal(18,4) NOT NULL ,
    debt_qty decimal(18,2) NOT NULL ,
    debt_fee decimal(18,4) NOT NULL ,
    debt_interest decimal(18,4) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    debt_return_amt decimal(18,4) NOT NULL ,
    debt_return_qty decimal(18,2) NOT NULL ,
    return_interest_amt decimal(18,4) NOT NULL ,
    interest_update_date int NOT NULL ,
    debt_end_date int NOT NULL ,
    orign_debt_end_date int NOT NULL ,
    defer_times int NOT NULL ,
    debt_return_date int NOT NULL ,
    debt_status int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsecr_asac_debtdetail_his_1 on tb_pdsecr_asac_debtdetail_his (init_date,order_no);
create index idx_tb_pdsecr_asac_debtdetail_his_2 on tb_pdsecr_asac_debtdetail_his (asset_acco_no,stock_code_no,debt_type,debt_status);
create index idx_tb_pdsecr_asac_debtdetail_his_3 on tb_pdsecr_asac_debtdetail_his (debt_status);
create index idx_tb_pdsecr_asac_debtdetail_his_4 on tb_pdsecr_asac_debtdetail_his (co_no,pd_no,asset_acco_no);

-- 创建数据表：产品证券_融资融券_交易组负债明细表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsecr_exgp_debtdetail;
CREATE TABLE tb_pdsecr_exgp_debtdetail (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    pass_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    debt_type int NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_fee decimal(18,4) NOT NULL ,
    order_no int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    debt_intrst_rate decimal(18,12) NOT NULL ,
    begin_debt_amt decimal(18,4) NOT NULL ,
    begin_debt_qty decimal(18,2) NOT NULL ,
    debt_amt decimal(18,4) NOT NULL ,
    debt_qty decimal(18,2) NOT NULL ,
    debt_fee decimal(18,4) NOT NULL ,
    debt_interest decimal(18,4) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    debt_return_amt decimal(18,4) NOT NULL ,
    debt_return_qty decimal(18,2) NOT NULL ,
    return_interest_amt decimal(18,4) NOT NULL ,
    interest_update_date int NOT NULL ,
    debt_end_date int NOT NULL ,
    orign_debt_end_date int NOT NULL ,
    defer_times int NOT NULL ,
    debt_return_date int NOT NULL ,
    debt_status int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsecr_exgp_debtdetail_1 on tb_pdsecr_exgp_debtdetail (init_date,order_no);
create index idx_tb_pdsecr_exgp_debtdetail_2 on tb_pdsecr_exgp_debtdetail (exch_group_no,asset_acco_no,stock_code_no,debt_type,debt_status);
create index idx_tb_pdsecr_exgp_debtdetail_3 on tb_pdsecr_exgp_debtdetail (debt_status);
create index idx_tb_pdsecr_exgp_debtdetail_4 on tb_pdsecr_exgp_debtdetail (co_no,pd_no,asset_acco_no);

-- 创建数据表：历史_产品证券_融资融券_交易组负债明细表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsecr_exgp_debtdetail_his;
CREATE TABLE tb_pdsecr_exgp_debtdetail_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    pass_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    debt_type int NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_fee decimal(18,4) NOT NULL ,
    order_no int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    debt_intrst_rate decimal(18,12) NOT NULL ,
    begin_debt_amt decimal(18,4) NOT NULL ,
    begin_debt_qty decimal(18,2) NOT NULL ,
    debt_amt decimal(18,4) NOT NULL ,
    debt_qty decimal(18,2) NOT NULL ,
    debt_fee decimal(18,4) NOT NULL ,
    debt_interest decimal(18,4) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    debt_return_amt decimal(18,4) NOT NULL ,
    debt_return_qty decimal(18,2) NOT NULL ,
    return_interest_amt decimal(18,4) NOT NULL ,
    interest_update_date int NOT NULL ,
    debt_end_date int NOT NULL ,
    orign_debt_end_date int NOT NULL ,
    defer_times int NOT NULL ,
    debt_return_date int NOT NULL ,
    debt_status int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsecr_exgp_debtdetail_his_1 on tb_pdsecr_exgp_debtdetail_his (init_date,order_no);
create index idx_tb_pdsecr_exgp_debtdetail_his_2 on tb_pdsecr_exgp_debtdetail_his (exch_group_no,asset_acco_no,stock_code_no,debt_type,debt_status);
create index idx_tb_pdsecr_exgp_debtdetail_his_3 on tb_pdsecr_exgp_debtdetail_his (debt_status);
create index idx_tb_pdsecr_exgp_debtdetail_his_4 on tb_pdsecr_exgp_debtdetail_his (co_no,pd_no,asset_acco_no);

-- 创建数据表：产品证券_融资融券_资产账户负债变动流水表
use db_pdsecu;
DROP TABLE IF EXISTS tb_pdsecr_asac_debt_occur_jour;
CREATE TABLE tb_pdsecr_asac_debt_occur_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    debt_type int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    occur_end_qty decimal(18,2) NOT NULL ,
    occur_end_amt decimal(18,4) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    record_valid_flag int NOT NULL ,
    curr_row_id bigint NOT NULL ,
    return_capit_jour_nor int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsecr_asac_debt_occur_jour_1 on tb_pdsecr_asac_debt_occur_jour (init_date);
create index idx_tb_pdsecr_asac_debt_occur_jour_2 on tb_pdsecr_asac_debt_occur_jour (stock_code_no,debt_type);

-- 创建数据表：历史_产品证券_融资融券_资产账户负债变动流水表
use db_pdsecu_his;
DROP TABLE IF EXISTS tb_pdsecr_asac_debt_occur_jour_his;
CREATE TABLE tb_pdsecr_asac_debt_occur_jour_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_type int NOT NULL ,
    asset_type int NOT NULL ,
    debt_type int NOT NULL ,
    busi_flag int NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    occur_end_qty decimal(18,2) NOT NULL ,
    occur_end_amt decimal(18,4) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    record_valid_flag int NOT NULL ,
    curr_row_id bigint NOT NULL ,
    return_capit_jour_nor int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_pdsecr_asac_debt_occur_jour_his_1 on tb_pdsecr_asac_debt_occur_jour_his (init_date);
create index idx_tb_pdsecr_asac_debt_occur_jour_his_2 on tb_pdsecr_asac_debt_occur_jour_his (stock_code_no,debt_type);
commit;
