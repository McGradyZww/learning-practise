-- /**************************************************************************************/
-- 创建数据库【交易期货】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_tdfutu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_tdfutu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：交易期货_账户_交易组业务资金表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfuac_exgp_busi_capit;
CREATE TABLE tb_tdfuac_exgp_busi_capit (
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
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    comm_frozen_amt decimal(18,4) NOT NULL ,
    comm_unfroz_amt decimal(18,4) NOT NULL ,
    comm_capt_amt decimal(18,4) NOT NULL ,
    comm_releas_amt decimal(18,4) NOT NULL ,
    trade_capt_amt decimal(18,4) NOT NULL ,
    trade_releas_amt decimal(18,4) NOT NULL ,
    strike_capt_amt decimal(18,4) NOT NULL ,
    strike_releas_amt decimal(18,4) NOT NULL ,
    capt_margin decimal(18,4) NOT NULL ,
    trade_fee decimal(18,4) NOT NULL ,
    strike_fee decimal(18,4) NOT NULL ,
    close_pandl decimal(18,4) NOT NULL ,
    marked_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfuac_exgp_busi_capit_1 on tb_tdfuac_exgp_busi_capit (exch_group_no,asset_acco_no,exch_crncy_type);
create index idx_tb_tdfuac_exgp_busi_capit_2 on tb_tdfuac_exgp_busi_capit (co_no,pd_no,exch_crncy_type);

-- 创建数据表：交易期货_账户_历史交易组业务资金表
use db_tdfutu_his;
DROP TABLE IF EXISTS tb_tdfuac_exgp_busi_capit_his;
CREATE TABLE tb_tdfuac_exgp_busi_capit_his (
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
    exch_crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    comm_frozen_amt decimal(18,4) NOT NULL ,
    comm_unfroz_amt decimal(18,4) NOT NULL ,
    comm_capt_amt decimal(18,4) NOT NULL ,
    comm_releas_amt decimal(18,4) NOT NULL ,
    trade_capt_amt decimal(18,4) NOT NULL ,
    trade_releas_amt decimal(18,4) NOT NULL ,
    strike_capt_amt decimal(18,4) NOT NULL ,
    strike_releas_amt decimal(18,4) NOT NULL ,
    capt_margin decimal(18,4) NOT NULL ,
    trade_fee decimal(18,4) NOT NULL ,
    strike_fee decimal(18,4) NOT NULL ,
    close_pandl decimal(18,4) NOT NULL ,
    marked_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfuac_exgp_busi_capit_his_1 on tb_tdfuac_exgp_busi_capit_his (init_date,exch_group_no,asset_acco_no,exch_crncy_type);
create index idx_tb_tdfuac_exgp_busi_capit_his_2 on tb_tdfuac_exgp_busi_capit_his (init_date,co_no,pd_no,exch_crncy_type);

-- 创建数据表：交易期货_账户_资产账户业务资金表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfuac_asac_busi_capit;
CREATE TABLE tb_tdfuac_asac_busi_capit (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    comm_frozen_amt decimal(18,4) NOT NULL ,
    comm_unfroz_amt decimal(18,4) NOT NULL ,
    comm_capt_amt decimal(18,4) NOT NULL ,
    comm_releas_amt decimal(18,4) NOT NULL ,
    trade_capt_amt decimal(18,4) NOT NULL ,
    trade_releas_amt decimal(18,4) NOT NULL ,
    strike_capt_amt decimal(18,4) NOT NULL ,
    strike_releas_amt decimal(18,4) NOT NULL ,
    capt_margin decimal(18,4) NOT NULL ,
    trade_fee decimal(18,4) NOT NULL ,
    strike_fee decimal(18,4) NOT NULL ,
    close_pandl decimal(18,4) NOT NULL ,
    marked_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfuac_asac_busi_capit_1 on tb_tdfuac_asac_busi_capit (asset_acco_no,exch_crncy_type);
create index idx_tb_tdfuac_asac_busi_capit_2 on tb_tdfuac_asac_busi_capit (co_no,pd_no,exch_crncy_type);

-- 创建数据表：交易期货_账户_历史资产账户业务资金表
use db_tdfutu_his;
DROP TABLE IF EXISTS tb_tdfuac_asac_busi_capit_his;
CREATE TABLE tb_tdfuac_asac_busi_capit_his (
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
    exch_crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    comm_frozen_amt decimal(18,4) NOT NULL ,
    comm_unfroz_amt decimal(18,4) NOT NULL ,
    comm_capt_amt decimal(18,4) NOT NULL ,
    comm_releas_amt decimal(18,4) NOT NULL ,
    trade_capt_amt decimal(18,4) NOT NULL ,
    trade_releas_amt decimal(18,4) NOT NULL ,
    strike_capt_amt decimal(18,4) NOT NULL ,
    strike_releas_amt decimal(18,4) NOT NULL ,
    capt_margin decimal(18,4) NOT NULL ,
    trade_fee decimal(18,4) NOT NULL ,
    strike_fee decimal(18,4) NOT NULL ,
    close_pandl decimal(18,4) NOT NULL ,
    marked_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfuac_asac_busi_capit_his_1 on tb_tdfuac_asac_busi_capit_his (init_date,asset_acco_no,exch_crncy_type);
create index idx_tb_tdfuac_asac_busi_capit_his_2 on tb_tdfuac_asac_busi_capit_his (init_date,co_no,pd_no,exch_crncy_type);

-- 创建数据表：交易期货_账户_交易组业务持仓表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfuac_exgp_busi_posi;
CREATE TABLE tb_tdfuac_exgp_busi_posi (
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
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    comm_frozen_qty decimal(18,2) NOT NULL ,
    comm_unfroz_qty decimal(18,2) NOT NULL ,
    comm_capt_qty decimal(18,2) NOT NULL ,
    comm_releas_qty decimal(18,2) NOT NULL ,
    trade_frozen_qty decimal(18,2) NOT NULL ,
    trade_unfroz_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    pre_comm_capt_qty decimal(18,2) NOT NULL ,
    today_comm_capt_qty decimal(18,2) NOT NULL ,
    old_trade_capt_qty decimal(18,2) NOT NULL ,
    today_trade_capt_qty decimal(18,2) NOT NULL ,
    pre_strike_capt_qty decimal(18,2) NOT NULL ,
    today_strike_capt_qty decimal(18,2) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    pre_settle_price decimal(16,9) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    close_pandl decimal(18,4) NOT NULL ,
    open_amount decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfuac_exgp_busi_posi_1 on tb_tdfuac_exgp_busi_posi (exch_group_no,asset_acco_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type);
create index idx_tb_tdfuac_exgp_busi_posi_2 on tb_tdfuac_exgp_busi_posi (co_no,pd_no,exch_no);
create index idx_tb_tdfuac_exgp_busi_posi_3 on tb_tdfuac_exgp_busi_posi (update_date,update_time);

-- 创建数据表：交易期货_账户_历史交易组业务持仓表
use db_tdfutu_his;
DROP TABLE IF EXISTS tb_tdfuac_exgp_busi_posi_his;
CREATE TABLE tb_tdfuac_exgp_busi_posi_his (
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
    exch_crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    contrc_unit int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    comb_code varchar(6) NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    comm_frozen_qty decimal(18,2) NOT NULL ,
    comm_unfroz_qty decimal(18,2) NOT NULL ,
    comm_capt_qty decimal(18,2) NOT NULL ,
    comm_releas_qty decimal(18,2) NOT NULL ,
    trade_frozen_qty decimal(18,2) NOT NULL ,
    trade_unfroz_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    pre_comm_capt_qty decimal(18,2) NOT NULL ,
    today_comm_capt_qty decimal(18,2) NOT NULL ,
    old_trade_capt_qty decimal(18,2) NOT NULL ,
    today_trade_capt_qty decimal(18,2) NOT NULL ,
    pre_strike_capt_qty decimal(18,2) NOT NULL ,
    today_strike_capt_qty decimal(18,2) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    pre_settle_price decimal(16,9) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    close_pandl decimal(18,4) NOT NULL ,
    open_amount decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfuac_exgp_busi_posi_his_1 on tb_tdfuac_exgp_busi_posi_his (init_date,exch_group_no,asset_acco_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type);
create index idx_tb_tdfuac_exgp_busi_posi_his_2 on tb_tdfuac_exgp_busi_posi_his (init_date,co_no,pd_no,exch_no);

-- 创建数据表：交易期货_账户_资产账户业务持仓表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfuac_asac_busi_posi;
CREATE TABLE tb_tdfuac_asac_busi_posi (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
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
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    comm_frozen_qty decimal(18,2) NOT NULL ,
    comm_unfroz_qty decimal(18,2) NOT NULL ,
    comm_capt_qty decimal(18,2) NOT NULL ,
    comm_releas_qty decimal(18,2) NOT NULL ,
    trade_frozen_qty decimal(18,2) NOT NULL ,
    trade_unfroz_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    pre_comm_capt_qty decimal(18,2) NOT NULL ,
    today_comm_capt_qty decimal(18,2) NOT NULL ,
    old_trade_capt_qty decimal(18,2) NOT NULL ,
    today_trade_capt_qty decimal(18,2) NOT NULL ,
    pre_strike_capt_qty decimal(18,2) NOT NULL ,
    today_strike_capt_qty decimal(18,2) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    pre_settle_price decimal(16,9) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    close_pandl decimal(18,4) NOT NULL ,
    open_amount decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfuac_asac_busi_posi_1 on tb_tdfuac_asac_busi_posi (asset_acco_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type);
create index idx_tb_tdfuac_asac_busi_posi_2 on tb_tdfuac_asac_busi_posi (co_no,pd_no,exch_no);
create index idx_tb_tdfuac_asac_busi_posi_3 on tb_tdfuac_asac_busi_posi (update_date,update_time);

-- 创建数据表：交易期货_账户_历史资产账户业务持仓表
use db_tdfutu_his;
DROP TABLE IF EXISTS tb_tdfuac_asac_busi_posi_his;
CREATE TABLE tb_tdfuac_asac_busi_posi_his (
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
    exch_crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    contrc_unit int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    comb_code varchar(6) NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    frozen_qty decimal(18,2) NOT NULL ,
    unfroz_qty decimal(18,2) NOT NULL ,
    comm_frozen_qty decimal(18,2) NOT NULL ,
    comm_unfroz_qty decimal(18,2) NOT NULL ,
    comm_capt_qty decimal(18,2) NOT NULL ,
    comm_releas_qty decimal(18,2) NOT NULL ,
    trade_frozen_qty decimal(18,2) NOT NULL ,
    trade_unfroz_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    pre_comm_capt_qty decimal(18,2) NOT NULL ,
    today_comm_capt_qty decimal(18,2) NOT NULL ,
    old_trade_capt_qty decimal(18,2) NOT NULL ,
    today_trade_capt_qty decimal(18,2) NOT NULL ,
    pre_strike_capt_qty decimal(18,2) NOT NULL ,
    today_strike_capt_qty decimal(18,2) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    pre_settle_price decimal(16,9) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    close_pandl decimal(18,4) NOT NULL ,
    open_amount decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfuac_asac_busi_posi_his_1 on tb_tdfuac_asac_busi_posi_his (init_date,asset_acco_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type);
create index idx_tb_tdfuac_asac_busi_posi_his_2 on tb_tdfuac_asac_busi_posi_his (init_date,co_no,pd_no,exch_no);

-- 创建数据表：交易期货_账户_期货保证金优惠控制表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfuac_margin_ctrl;
CREATE TABLE tb_tdfuac_margin_ctrl (
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
    comm_capt_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfuac_margin_ctrl_1 on tb_tdfuac_margin_ctrl (pd_no,exch_group_no,asset_acco_no,exch_no,comb_code,hedge_type);
create index idx_tb_tdfuac_margin_ctrl_2 on tb_tdfuac_margin_ctrl (co_no,pd_no,exch_group_no,asset_acco_no,exch_no,comb_code);

-- 创建数据表：交易期货_账户_历史期货保证金优惠控制表
use db_tdfutu_his;
DROP TABLE IF EXISTS tb_tdfuac_margin_ctrl_his;
CREATE TABLE tb_tdfuac_margin_ctrl_his (
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
    comm_capt_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfuac_margin_ctrl_his_1 on tb_tdfuac_margin_ctrl_his (init_date,asset_acco_no,exch_no,exch_group_no,comb_code,hedge_type);
create index idx_tb_tdfuac_margin_ctrl_his_2 on tb_tdfuac_margin_ctrl_his (init_date,co_no,pd_no,exch_group_no);

-- 创建数据表：交易期货_账户_交易组业务资金持仓变动流水表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfuac_exgp_busi_capit_posi_jour;
CREATE TABLE tb_tdfuac_exgp_busi_capit_posi_jour (
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
    exch_crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    order_strike_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    comm_occur_amt decimal(18,4) NOT NULL ,
    comm_occur_qty decimal(18,2) NOT NULL ,
    trade_occur_amt decimal(18,4) NOT NULL ,
    trade_occur_qty decimal(18,2) NOT NULL ,
    strike_occur_amt decimal(18,4) NOT NULL ,
    strike_occur_qty decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdfuac_exgp_busi_capit_posi_jour_1 on tb_tdfuac_exgp_busi_capit_posi_jour (init_date,asset_acco_no,futu_acco_no,contrc_code_no);
create index idx_tb_tdfuac_exgp_busi_capit_posi_jour_2 on tb_tdfuac_exgp_busi_capit_posi_jour (init_date,co_no,pd_no,exch_group_no);

-- 创建数据表：历史_交易期货_账户_交易组业务资金持仓变动流水表
use db_tdfutu_his;
DROP TABLE IF EXISTS tb_tdfuac_exgp_busi_capit_posi_jour_his;
CREATE TABLE tb_tdfuac_exgp_busi_capit_posi_jour_his (
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
    exch_crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    order_strike_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    comm_occur_amt decimal(18,4) NOT NULL ,
    comm_occur_qty decimal(18,2) NOT NULL ,
    trade_occur_amt decimal(18,4) NOT NULL ,
    trade_occur_qty decimal(18,2) NOT NULL ,
    strike_occur_amt decimal(18,4) NOT NULL ,
    strike_occur_qty decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdfuac_exgp_busi_capit_posi_jour_his_1 on tb_tdfuac_exgp_busi_capit_posi_jour_his (init_date,asset_acco_no,futu_acco_no,contrc_code_no);
create index idx_tb_tdfuac_exgp_busi_capit_posi_jour_his_2 on tb_tdfuac_exgp_busi_capit_posi_jour_his (init_date,co_no,pd_no,exch_group_no);

-- 创建数据表：交易期货_账户_资产账户业务资金持仓变动流水表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfuac_asac_busi_capit_posi_jour;
CREATE TABLE tb_tdfuac_asac_busi_capit_posi_jour (
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
    exch_crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    order_strike_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    comm_occur_amt decimal(18,4) NOT NULL ,
    comm_occur_qty decimal(18,2) NOT NULL ,
    trade_occur_amt decimal(18,4) NOT NULL ,
    trade_occur_qty decimal(18,2) NOT NULL ,
    strike_occur_amt decimal(18,4) NOT NULL ,
    strike_occur_qty decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdfuac_asac_busi_capit_posi_jour_1 on tb_tdfuac_asac_busi_capit_posi_jour (init_date,asset_acco_no,futu_acco_no,contrc_code_no);
create index idx_tb_tdfuac_asac_busi_capit_posi_jour_2 on tb_tdfuac_asac_busi_capit_posi_jour (init_date,co_no,pd_no,exch_group_no);

-- 创建数据表：历史_交易期货_账户_资产账户业务资金持仓变动流水表
use db_tdfutu_his;
DROP TABLE IF EXISTS tb_tdfuac_asac_busi_capit_posi_jour_his;
CREATE TABLE tb_tdfuac_asac_busi_capit_posi_jour_his (
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
    exch_crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    order_strike_id bigint NOT NULL ,
    order_dir int NOT NULL ,
    comm_occur_amt decimal(18,4) NOT NULL ,
    comm_occur_qty decimal(18,2) NOT NULL ,
    trade_occur_amt decimal(18,4) NOT NULL ,
    trade_occur_qty decimal(18,2) NOT NULL ,
    strike_occur_amt decimal(18,4) NOT NULL ,
    strike_occur_qty decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdfuac_asac_busi_capit_posi_jour_his_1 on tb_tdfuac_asac_busi_capit_posi_jour_his (init_date,asset_acco_no,futu_acco_no,contrc_code_no);
create index idx_tb_tdfuac_asac_busi_capit_posi_jour_his_2 on tb_tdfuac_asac_busi_capit_posi_jour_his (init_date,co_no,pd_no,exch_group_no);

-- 创建数据表：交易期货_账户_订单成交资金变动流水表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfuac_order_strike_capit_chg_jour;
CREATE TABLE tb_tdfuac_order_strike_capit_chg_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    occur_date int NOT NULL ,
    occur_time int NOT NULL ,
    mach_date int NOT NULL ,
    mach_time int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    invest_type int NOT NULL ,
    order_strike_id bigint NOT NULL ,
    contrc_dir int NOT NULL ,
    lngsht_type int NOT NULL ,
    trade_fee decimal(18,4) NOT NULL ,
    strike_fee decimal(18,4) NOT NULL ,
    comm_occur_amt decimal(18,4) NOT NULL ,
    trade_occur_amt decimal(18,4) NOT NULL ,
    strike_occur_amt decimal(18,4) NOT NULL ,
    close_pandl decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdfuac_order_strike_capit_chg_jour_1 on tb_tdfuac_order_strike_capit_chg_jour (occur_date,co_no,pd_no,exch_group_no);
create index idx_tb_tdfuac_order_strike_capit_chg_jour_2 on tb_tdfuac_order_strike_capit_chg_jour (occur_date,exch_no,contrc_code_no);

-- 创建数据表：历史_交易期货_账户_订单成交资金变动流水表
use db_tdfutu_his;
DROP TABLE IF EXISTS tb_tdfuac_order_strike_capit_chg_jour_his;
CREATE TABLE tb_tdfuac_order_strike_capit_chg_jour_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    occur_date int NOT NULL ,
    occur_time int NOT NULL ,
    mach_date int NOT NULL ,
    mach_time int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    invest_type int NOT NULL ,
    order_strike_id bigint NOT NULL ,
    contrc_dir int NOT NULL ,
    lngsht_type int NOT NULL ,
    trade_fee decimal(18,4) NOT NULL ,
    strike_fee decimal(18,4) NOT NULL ,
    comm_occur_amt decimal(18,4) NOT NULL ,
    trade_occur_amt decimal(18,4) NOT NULL ,
    strike_occur_amt decimal(18,4) NOT NULL ,
    close_pandl decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdfuac_order_strike_capit_chg_jour_his_1 on tb_tdfuac_order_strike_capit_chg_jour_his (occur_date,co_no,pd_no,exch_group_no);
create index idx_tb_tdfuac_order_strike_capit_chg_jour_his_2 on tb_tdfuac_order_strike_capit_chg_jour_his (occur_date,exch_no,contrc_code_no);

-- 创建数据表：交易期货_账户_订单成交持仓变动流水表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfuac_order_strike_posi_chg_jour;
CREATE TABLE tb_tdfuac_order_strike_posi_chg_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    occur_date int NOT NULL ,
    occur_time int NOT NULL ,
    mach_date int NOT NULL ,
    mach_time int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    contrc_unit int NOT NULL ,
    invest_type int NOT NULL ,
    lngsht_type int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    comm_occur_qty decimal(18,2) NOT NULL ,
    strike_occur_qty decimal(18,2) NOT NULL ,
    trade_occur_qty decimal(18,2) NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_fee decimal(18,4) NOT NULL ,
    strike_margin decimal(18,4) NOT NULL ,
    order_strike_id bigint NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdfuac_order_strike_posi_chg_jour_1 on tb_tdfuac_order_strike_posi_chg_jour (occur_date,co_no,pd_no,exch_group_no);
create index idx_tb_tdfuac_order_strike_posi_chg_jour_2 on tb_tdfuac_order_strike_posi_chg_jour (occur_date,exch_no,contrc_code_no);

-- 创建数据表：历史_交易期货_账户_订单成交持仓变动流水表
use db_tdfutu_his;
DROP TABLE IF EXISTS tb_tdfuac_order_strike_posi_chg_jour_his;
CREATE TABLE tb_tdfuac_order_strike_posi_chg_jour_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    occur_date int NOT NULL ,
    occur_time int NOT NULL ,
    mach_date int NOT NULL ,
    mach_time int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    contrc_unit int NOT NULL ,
    invest_type int NOT NULL ,
    lngsht_type int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    comm_occur_qty decimal(18,2) NOT NULL ,
    strike_occur_qty decimal(18,2) NOT NULL ,
    trade_occur_qty decimal(18,2) NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_fee decimal(18,4) NOT NULL ,
    strike_margin decimal(18,4) NOT NULL ,
    order_strike_id bigint NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdfuac_order_strike_posi_chg_jour_his_1 on tb_tdfuac_order_strike_posi_chg_jour_his (occur_date,co_no,pd_no,exch_group_no);
create index idx_tb_tdfuac_order_strike_posi_chg_jour_his_2 on tb_tdfuac_order_strike_posi_chg_jour_his (occur_date,exch_no,contrc_code_no);

-- 创建数据表：交易期货_账户_交易组持仓明细表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfuac_exgp_posi_detail;
CREATE TABLE tb_tdfuac_exgp_posi_detail (
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
    exch_crncy_type varchar(3) NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_unit int NOT NULL ,
    contrc_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    invest_type int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    open_posi_date int NOT NULL ,
    open_posi_time int NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    open_posi_qty decimal(18,2) NOT NULL ,
    open_amount decimal(18,4) NOT NULL ,
    open_posi_fee decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    marked_sett_price decimal(16,9) NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    detail_posi_id bigint NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    close_pandl decimal(18,4) NOT NULL ,
    marked_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfuac_exgp_posi_detail_1 on tb_tdfuac_exgp_posi_detail (co_no,exch_group_no,exch_no,contrc_code_no,futu_acco_no,asset_acco_no,invest_type,lngsht_type,strike_no,hedge_type);
create index idx_tb_tdfuac_exgp_posi_detail_2 on tb_tdfuac_exgp_posi_detail (co_no,pd_no);
create index idx_tb_tdfuac_exgp_posi_detail_4 on tb_tdfuac_exgp_posi_detail (update_date,update_time);

-- 创建数据表：交易期货_账户_资产账户持仓明细表
use db_tdfutu;
DROP TABLE IF EXISTS tb_tdfuac_asac_posi_detail;
CREATE TABLE tb_tdfuac_asac_posi_detail (
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
    exch_crncy_type varchar(3) NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_unit int NOT NULL ,
    contrc_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    invest_type int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    open_posi_date int NOT NULL ,
    open_posi_time int NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    open_posi_qty decimal(18,2) NOT NULL ,
    open_amount decimal(18,4) NOT NULL ,
    open_posi_fee decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    marked_sett_price decimal(16,9) NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    detail_posi_id bigint NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    close_pandl decimal(18,4) NOT NULL ,
    marked_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfuac_asac_posi_detail_1 on tb_tdfuac_asac_posi_detail (co_no,asset_acco_no,exch_no,contrc_code_no,futu_acco_no,invest_type,lngsht_type,strike_no,hedge_type);
create index idx_tb_tdfuac_asac_posi_detail_2 on tb_tdfuac_asac_posi_detail (co_no,pd_no);
create unique index idx_tb_tdfuac_asac_posi_detail_3 on tb_tdfuac_asac_posi_detail (detail_posi_id);

-- 创建数据表：交易期货_账户_历史交易组持仓明细表
use db_tdfutu_his;
DROP TABLE IF EXISTS tb_tdfuac_exgp_posi_detail_his;
CREATE TABLE tb_tdfuac_exgp_posi_detail_his (
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
    exch_crncy_type varchar(3) NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_unit int NOT NULL ,
    contrc_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    invest_type int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    open_posi_date int NOT NULL ,
    open_posi_time int NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    open_posi_qty decimal(18,2) NOT NULL ,
    open_amount decimal(18,4) NOT NULL ,
    open_posi_fee decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    marked_sett_price decimal(16,9) NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    detail_posi_id bigint NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    close_pandl decimal(18,4) NOT NULL ,
    marked_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdfuac_exgp_posi_detail_his_1 on tb_tdfuac_exgp_posi_detail_his (init_date,co_no,exch_group_no,exch_no,contrc_code_no,futu_acco_no,asset_acco_no,invest_type,lngsht_type,strike_no,hedge_type);
create index idx_tb_tdfuac_exgp_posi_detail_his_2 on tb_tdfuac_exgp_posi_detail_his (init_date,co_no,pd_no);
commit;
