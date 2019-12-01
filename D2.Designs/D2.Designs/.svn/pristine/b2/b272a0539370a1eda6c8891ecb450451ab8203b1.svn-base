-- /**************************************************************************************/
-- 创建数据库【清算期货】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_clfutu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_clfutu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：清算期货_结算_待入账记录表
use db_clfutu;
DROP TABLE IF EXISTS tb_clfust_pre_entry;
CREATE TABLE tb_clfust_pre_entry (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    contrc_unit int NOT NULL ,
    lngsht_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    hedge_type int NOT NULL ,
    pre_settle_price decimal(16,9) NOT NULL ,
    sett_price decimal(16,9) NOT NULL ,
    pre_entry_qty decimal(18,2) NOT NULL ,
    pre_entry_amt decimal(18,4) NOT NULL ,
    busi_flag int NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    undo_status varchar(2) NOT NULL ,
    entry_money_jour_no bigint NOT NULL ,
    entry_exgp_posi_jour_no bigint NOT NULL ,
    entry_asac_posi_jour_no bigint NOT NULL ,
    deli_jour_no bigint NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clfust_pre_entry_1 on tb_clfust_pre_entry (pass_no,out_acco,exch_no);
create index idx_tb_clfust_pre_entry_2 on tb_clfust_pre_entry (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_clfust_pre_entry_3 on tb_clfust_pre_entry (exch_group_no,contrc_code_no,lngsht_type,hedge_type);

-- 创建数据表：历史_清算期货_结算_待入账记录表
use db_clfutu_his;
DROP TABLE IF EXISTS tb_clfust_pre_entry_his;
CREATE TABLE tb_clfust_pre_entry_his (
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
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_rate decimal(18,12) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    contrc_unit int NOT NULL ,
    lngsht_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    hedge_type int NOT NULL ,
    pre_settle_price decimal(16,9) NOT NULL ,
    sett_price decimal(16,9) NOT NULL ,
    pre_entry_qty decimal(18,2) NOT NULL ,
    pre_entry_amt decimal(18,4) NOT NULL ,
    busi_flag int NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    undo_status varchar(2) NOT NULL ,
    entry_money_jour_no bigint NOT NULL ,
    entry_exgp_posi_jour_no bigint NOT NULL ,
    entry_asac_posi_jour_no bigint NOT NULL ,
    deli_jour_no bigint NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clfust_pre_entry_his_1 on tb_clfust_pre_entry_his (pass_no,out_acco,exch_no);
create index idx_tb_clfust_pre_entry_his_2 on tb_clfust_pre_entry_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_clfust_pre_entry_his_3 on tb_clfust_pre_entry_his (exch_group_no,contrc_code_no,lngsht_type,hedge_type);
commit;
