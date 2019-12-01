-- /**************************************************************************************/
-- 创建数据库【风控期货】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_rkfutu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_rkfutu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：风控期货_计算_期货信息表
use db_rkfutu;
DROP TABLE IF EXISTS tb_rkfucc_futu_contrc_info;
CREATE TABLE tb_rkfucc_futu_contrc_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    contrc_code_no int NOT NULL ,
    exch_no int NOT NULL ,
    contrc_code varchar(6) NOT NULL ,
    contrc_name varchar(64) NOT NULL ,
    contrc_type int NOT NULL ,
    asset_type int NOT NULL ,
    step_price decimal(16,9) NOT NULL ,
    hold_qty decimal(18,2) NOT NULL ,
    main_flag int NOT NULL ,
    contrc_unit int NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    buy_price_1 decimal(16,9) NOT NULL ,
    sell_price_1 decimal(16,9) NOT NULL ,
    up_limit_price decimal(16,9) NOT NULL ,
    down_limit_price decimal(16,9) NOT NULL ,
    pre_settle_price decimal(16,9) NOT NULL ,
    sett_price decimal(16,9) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rkfucc_futu_contrc_info_1 on tb_rkfucc_futu_contrc_info (contrc_code_no);
create index idx_tb_rkfucc_futu_contrc_info_2 on tb_rkfucc_futu_contrc_info (exch_no,contrc_code);

-- 创建数据表：风控期货_计算_交易组业务持仓表
use db_rkfutu;
DROP TABLE IF EXISTS tb_rkfucc_futu_exgp_posi;
CREATE TABLE tb_rkfucc_futu_exgp_posi (
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
    exch_crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    contrc_unit int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    comb_code varchar(6) NOT NULL ,
    posi_qty decimal(18,2) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rkfucc_futu_exgp_posi_1 on tb_rkfucc_futu_exgp_posi (exch_group_no,asset_acco_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type);
create index idx_tb_rkfucc_futu_exgp_posi_2 on tb_rkfucc_futu_exgp_posi (exch_group_no,contrc_code_no);

-- 创建数据表：风控期货_计算_保证金优惠控制表
use db_rkfutu;
DROP TABLE IF EXISTS tb_rkfucc_margin_ctrl;
CREATE TABLE tb_rkfucc_margin_ctrl (
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
    exch_crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    hedge_type int NOT NULL ,
    comb_code varchar(6) NOT NULL ,
    long_comm_margin decimal(18,4) NOT NULL ,
    short_comm_margin decimal(18,4) NOT NULL ,
    long_order_margin decimal(18,4) NOT NULL ,
    short_order_margin decimal(18,4) NOT NULL ,
    long_strike_margin decimal(18,4) NOT NULL ,
    short_strike_margin decimal(18,4) NOT NULL ,
    long_hold_margin decimal(18,4) NOT NULL ,
    short_hold_margin decimal(18,4) NOT NULL ,
    trade_capt_amt decimal(18,4) NOT NULL ,
    posi_capt_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rkfucc_margin_ctrl_1 on tb_rkfucc_margin_ctrl (pd_no,exch_group_no,asset_acco_no,exch_no,comb_code,hedge_type);
create index idx_tb_rkfucc_margin_ctrl_2 on tb_rkfucc_margin_ctrl (co_no,pd_no,exch_group_no,asset_acco_no,exch_no,comb_code);
commit;
