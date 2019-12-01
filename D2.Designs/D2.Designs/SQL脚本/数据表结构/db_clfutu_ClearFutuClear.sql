-- /**************************************************************************************/
-- 创建数据库【清算期货】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_clfutu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_clfutu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：清算期货_清算_平仓明细表
use db_clfutu;
DROP TABLE IF EXISTS tb_clfucl_close_detail;
CREATE TABLE tb_clfucl_close_detail (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    strike_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    avail_closed_posi_qty decimal(18,2) NOT NULL ,
    today_posi_flag int NOT NULL ,
    link_row_id bigint NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clfucl_close_detail_1 on tb_clfucl_close_detail (strike_date,asset_acco_no,futu_acco_no,contrc_code_no,order_dir,contrc_dir,hedge_type,link_row_id);
create index idx_tb_clfucl_close_detail_2 on tb_clfucl_close_detail (link_row_id);

-- 创建数据表：历史_清算期货_清算_平仓明细表
use db_clfutu_his;
DROP TABLE IF EXISTS tb_clfucl_close_detail_his;
CREATE TABLE tb_clfucl_close_detail_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    strike_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    pass_no int NOT NULL ,
    out_acco varchar(32) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    avail_closed_posi_qty decimal(18,2) NOT NULL ,
    today_posi_flag int NOT NULL ,
    link_row_id bigint NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clfucl_close_detail_his_1 on tb_clfucl_close_detail_his (strike_date,asset_acco_no,futu_acco_no,contrc_code_no,order_dir,contrc_dir,hedge_type,link_row_id);
create index idx_tb_clfucl_close_detail_his_2 on tb_clfucl_close_detail_his (link_row_id);

-- 创建数据表：清算期货_清算_订单表
use db_clfutu;
DROP TABLE IF EXISTS tb_clfucl_order;
CREATE TABLE tb_clfucl_order (
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
    comm_id bigint NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_no int NOT NULL ,
    order_batch_no int NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    wtdraw_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    report_fee decimal(18,4) NOT NULL ,
    wtdraw_fee decimal(18,4) NOT NULL ,
    order_status varchar(2) NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clfucl_order_1 on tb_clfucl_order (asset_acco_no,order_date,order_no);
create index idx_tb_clfucl_order_2 on tb_clfucl_order (init_date);

-- 创建数据表：历史_清算期货_清算_订单表
use db_clfutu_his;
DROP TABLE IF EXISTS tb_clfucl_order_his;
CREATE TABLE tb_clfucl_order_his (
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
    comm_id bigint NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_no int NOT NULL ,
    order_batch_no int NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    wtdraw_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    report_fee decimal(18,4) NOT NULL ,
    wtdraw_fee decimal(18,4) NOT NULL ,
    order_status varchar(2) NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clfucl_order_his_1 on tb_clfucl_order_his (asset_acco_no,order_date,order_no);
create index idx_tb_clfucl_order_his_2 on tb_clfucl_order_his (init_date);

-- 创建数据表：清算期货_清算_成交表
use db_clfutu;
DROP TABLE IF EXISTS tb_clfucl_out_busi;
CREATE TABLE tb_clfucl_out_busi (
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
    contrc_code varchar(6) NOT NULL ,
    contrc_type int NOT NULL ,
    contrc_unit int NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_no int NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    report_fee decimal(18,4) NOT NULL ,
    wtdraw_fee decimal(18,4) NOT NULL ,
    deli_fee decimal(18,4) NOT NULL ,
    service_fee decimal(18,4) NOT NULL ,
    other_fee decimal(18,4) NOT NULL ,
    trade_commis decimal(18,4) NOT NULL ,
    other_commis decimal(18,4) NOT NULL ,
    out_report_fee decimal(18,4) NOT NULL ,
    out_cancel_fee decimal(18,4) NOT NULL ,
    out_deli_fee decimal(18,4) NOT NULL ,
    out_service_fee decimal(18,4) NOT NULL ,
    out_other_fee decimal(18,4) NOT NULL ,
    out_brkage_commis decimal(18,4) NOT NULL ,
    out_other_commis decimal(18,4) NOT NULL ,
    capit_reback_days int NOT NULL ,
    posi_reback_days int NOT NULL ,
    clear_entry_type int NOT NULL ,
    comb_code varchar(6) NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clfucl_out_busi_1 on tb_clfucl_out_busi (pass_no,out_acco,exch_no,strike_date,strike_no,order_dir,contrc_dir);
create index idx_tb_clfucl_out_busi_2 on tb_clfucl_out_busi (strike_date,pass_no,exch_no,futu_acco_no,contrc_code_no);
create index idx_tb_clfucl_out_busi_3 on tb_clfucl_out_busi (deal_flag);

-- 创建数据表：历史_清算期货_清算_成交表
use db_clfutu_his;
DROP TABLE IF EXISTS tb_clfucl_out_busi_his;
CREATE TABLE tb_clfucl_out_busi_his (
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
    contrc_code varchar(6) NOT NULL ,
    contrc_type int NOT NULL ,
    contrc_unit int NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_no int NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    hedge_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    report_fee decimal(18,4) NOT NULL ,
    wtdraw_fee decimal(18,4) NOT NULL ,
    deli_fee decimal(18,4) NOT NULL ,
    service_fee decimal(18,4) NOT NULL ,
    other_fee decimal(18,4) NOT NULL ,
    trade_commis decimal(18,4) NOT NULL ,
    other_commis decimal(18,4) NOT NULL ,
    out_report_fee decimal(18,4) NOT NULL ,
    out_cancel_fee decimal(18,4) NOT NULL ,
    out_deli_fee decimal(18,4) NOT NULL ,
    out_service_fee decimal(18,4) NOT NULL ,
    out_other_fee decimal(18,4) NOT NULL ,
    out_brkage_commis decimal(18,4) NOT NULL ,
    out_other_commis decimal(18,4) NOT NULL ,
    capit_reback_days int NOT NULL ,
    posi_reback_days int NOT NULL ,
    clear_entry_type int NOT NULL ,
    comb_code varchar(6) NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clfucl_out_busi_his_1 on tb_clfucl_out_busi_his (pass_no,out_acco,exch_no,strike_date,strike_no,order_dir,contrc_dir);
create index idx_tb_clfucl_out_busi_his_2 on tb_clfucl_out_busi_his (strike_date,pass_no,exch_no,futu_acco_no,contrc_code_no);
create index idx_tb_clfucl_out_busi_his_3 on tb_clfucl_out_busi_his (deal_flag);

-- 创建数据表：清算期货_清算_待入账记录表
use db_clfutu;
DROP TABLE IF EXISTS tb_clfucl_pre_entry;
CREATE TABLE tb_clfucl_pre_entry (
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
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_no int NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    pre_settle_price decimal(16,9) NOT NULL ,
    sett_price decimal(16,9) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_num int NOT NULL ,
    pre_entry_qty decimal(18,2) NOT NULL ,
    pre_entry_amt decimal(18,4) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    comb_code varchar(6) NOT NULL ,
    sett_close_pandl decimal(18,4) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    report_fee decimal(18,4) NOT NULL ,
    wtdraw_fee decimal(18,4) NOT NULL ,
    deli_fee decimal(18,4) NOT NULL ,
    service_fee decimal(18,4) NOT NULL ,
    other_fee decimal(18,4) NOT NULL ,
    trade_commis decimal(18,4) NOT NULL ,
    other_commis decimal(18,4) NOT NULL ,
    out_all_fee decimal(18,4) NOT NULL ,
    out_report_fee decimal(18,4) NOT NULL ,
    out_cancel_fee decimal(18,4) NOT NULL ,
    out_deli_fee decimal(18,4) NOT NULL ,
    out_service_fee decimal(18,4) NOT NULL ,
    out_other_fee decimal(18,4) NOT NULL ,
    out_brkage_commis decimal(18,4) NOT NULL ,
    out_other_commis decimal(18,4) NOT NULL ,
    busi_flag int NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    undo_status varchar(2) NOT NULL ,
    entry_money_jour_no bigint NOT NULL ,
    entry_exgp_posi_jour_no bigint NOT NULL ,
    entry_asac_posi_jour_no bigint NOT NULL ,
    deli_jour_no bigint NOT NULL ,
    open_amount decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clfucl_pre_entry_1 on tb_clfucl_pre_entry (pass_no,out_acco,exch_no,strike_date,strike_no,order_dir,contrc_dir);
create index idx_tb_clfucl_pre_entry_2 on tb_clfucl_pre_entry (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_clfucl_pre_entry_3 on tb_clfucl_pre_entry (entry_status);

-- 创建数据表：历史_清算期货_清算_待入账记录表
use db_clfutu_his;
DROP TABLE IF EXISTS tb_clfucl_pre_entry_his;
CREATE TABLE tb_clfucl_pre_entry_his (
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
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_no int NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    pre_settle_price decimal(16,9) NOT NULL ,
    sett_price decimal(16,9) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_num int NOT NULL ,
    pre_entry_qty decimal(18,2) NOT NULL ,
    pre_entry_amt decimal(18,4) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    comb_code varchar(6) NOT NULL ,
    sett_close_pandl decimal(18,4) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    report_fee decimal(18,4) NOT NULL ,
    wtdraw_fee decimal(18,4) NOT NULL ,
    deli_fee decimal(18,4) NOT NULL ,
    service_fee decimal(18,4) NOT NULL ,
    other_fee decimal(18,4) NOT NULL ,
    trade_commis decimal(18,4) NOT NULL ,
    other_commis decimal(18,4) NOT NULL ,
    out_all_fee decimal(18,4) NOT NULL ,
    out_report_fee decimal(18,4) NOT NULL ,
    out_cancel_fee decimal(18,4) NOT NULL ,
    out_deli_fee decimal(18,4) NOT NULL ,
    out_service_fee decimal(18,4) NOT NULL ,
    out_other_fee decimal(18,4) NOT NULL ,
    out_brkage_commis decimal(18,4) NOT NULL ,
    out_other_commis decimal(18,4) NOT NULL ,
    busi_flag int NOT NULL ,
    entry_status varchar(2) NOT NULL ,
    undo_status varchar(2) NOT NULL ,
    entry_money_jour_no bigint NOT NULL ,
    entry_exgp_posi_jour_no bigint NOT NULL ,
    entry_asac_posi_jour_no bigint NOT NULL ,
    deli_jour_no bigint NOT NULL ,
    open_amount decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clfucl_pre_entry_his_1 on tb_clfucl_pre_entry_his (pass_no,out_acco,exch_no,strike_date,strike_no,order_dir,contrc_dir);
create index idx_tb_clfucl_pre_entry_his_2 on tb_clfucl_pre_entry_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no);
create index idx_tb_clfucl_pre_entry_his_3 on tb_clfucl_pre_entry_his (entry_status);

-- 创建数据表：清算期货_清算_入账异常表
use db_clfutu;
DROP TABLE IF EXISTS tb_clfucl_entry_error;
CREATE TABLE tb_clfucl_entry_error (
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
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_no int NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    pre_settle_price decimal(16,9) NOT NULL ,
    sett_price decimal(16,9) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_num int NOT NULL ,
    pre_entry_qty decimal(18,2) NOT NULL ,
    pre_entry_amt decimal(18,4) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    comb_code varchar(6) NOT NULL ,
    comb_type int NOT NULL ,
    comb_name varchar(64) NOT NULL ,
    long_hold_margin decimal(18,4) NOT NULL ,
    short_hold_margin decimal(18,4) NOT NULL ,
    sett_capt_margin decimal(18,4) NOT NULL ,
    sett_close_pandl decimal(18,4) NOT NULL ,
    sett_marked_pandl decimal(18,4) NOT NULL ,
    sett_close_pandl_today decimal(18,4) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    report_fee decimal(18,4) NOT NULL ,
    wtdraw_fee decimal(18,4) NOT NULL ,
    deli_fee decimal(18,4) NOT NULL ,
    service_fee decimal(18,4) NOT NULL ,
    other_fee decimal(18,4) NOT NULL ,
    trade_commis decimal(18,4) NOT NULL ,
    other_commis decimal(18,4) NOT NULL ,
    out_all_fee decimal(18,4) NOT NULL ,
    out_report_fee decimal(18,4) NOT NULL ,
    out_cancel_fee decimal(18,4) NOT NULL ,
    out_deli_fee decimal(18,4) NOT NULL ,
    out_service_fee decimal(18,4) NOT NULL ,
    out_other_fee decimal(18,4) NOT NULL ,
    out_brkage_commis decimal(18,4) NOT NULL ,
    out_other_commis decimal(18,4) NOT NULL ,
    busi_flag int NOT NULL ,
    undo_error_no int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clfucl_entry_error_1 on tb_clfucl_entry_error (init_date,co_no,pd_no,exch_group_no,asset_acco_no);

-- 创建数据表：历史_清算期货_清算_入账异常表
use db_clfutu_his;
DROP TABLE IF EXISTS tb_clfucl_entry_error_his;
CREATE TABLE tb_clfucl_entry_error_his (
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
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    report_date int NOT NULL ,
    report_time int NOT NULL ,
    report_no varchar(32) NOT NULL ,
    order_date int NOT NULL ,
    order_time int NOT NULL ,
    order_no int NOT NULL ,
    order_dir int NOT NULL ,
    contrc_dir int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    pre_settle_price decimal(16,9) NOT NULL ,
    sett_price decimal(16,9) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    strike_num int NOT NULL ,
    pre_entry_qty decimal(18,2) NOT NULL ,
    pre_entry_amt decimal(18,4) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    comb_code varchar(6) NOT NULL ,
    comb_type int NOT NULL ,
    comb_name varchar(64) NOT NULL ,
    long_hold_margin decimal(18,4) NOT NULL ,
    short_hold_margin decimal(18,4) NOT NULL ,
    sett_capt_margin decimal(18,4) NOT NULL ,
    sett_close_pandl decimal(18,4) NOT NULL ,
    sett_marked_pandl decimal(18,4) NOT NULL ,
    sett_close_pandl_today decimal(18,4) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    report_fee decimal(18,4) NOT NULL ,
    wtdraw_fee decimal(18,4) NOT NULL ,
    deli_fee decimal(18,4) NOT NULL ,
    service_fee decimal(18,4) NOT NULL ,
    other_fee decimal(18,4) NOT NULL ,
    trade_commis decimal(18,4) NOT NULL ,
    other_commis decimal(18,4) NOT NULL ,
    out_all_fee decimal(18,4) NOT NULL ,
    out_report_fee decimal(18,4) NOT NULL ,
    out_cancel_fee decimal(18,4) NOT NULL ,
    out_deli_fee decimal(18,4) NOT NULL ,
    out_service_fee decimal(18,4) NOT NULL ,
    out_other_fee decimal(18,4) NOT NULL ,
    out_brkage_commis decimal(18,4) NOT NULL ,
    out_other_commis decimal(18,4) NOT NULL ,
    busi_flag int NOT NULL ,
    undo_error_no int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_clfucl_entry_error_his_1 on tb_clfucl_entry_error_his (init_date,co_no,pd_no,exch_group_no,asset_acco_no);

-- 创建数据表：清算期货_清算_处理异常记录表
use db_clfutu;
DROP TABLE IF EXISTS tb_clfucl_exception;
CREATE TABLE tb_clfucl_exception (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    deal_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：历史_清算期货_清算_处理异常记录表
use db_clfutu_his;
DROP TABLE IF EXISTS tb_clfucl_exception_his;
CREATE TABLE tb_clfucl_exception_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    deal_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：清算期货_清算_持仓表
use db_clfutu;
DROP TABLE IF EXISTS tb_clfucl_posi;
CREATE TABLE tb_clfucl_posi (
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
    crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    margin_pref int NOT NULL ,
    comb_code varchar(6) NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    contrc_unit int NOT NULL ,
    posi_amt decimal(18,4) NOT NULL ,
    pre_settle_price decimal(16,9) NOT NULL ,
    sett_price decimal(16,9) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    sett_flag int NOT NULL ,
    deliv_flag int NOT NULL ,
    open_amount decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clfucl_posi_1 on tb_clfucl_posi (exch_group_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type,init_date);
create index idx_tb_clfucl_posi_2 on tb_clfucl_posi (asset_acco_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type);
create index idx_tb_clfucl_posi_3 on tb_clfucl_posi (curr_qty);
create index idx_tb_clfucl_posi_4 on tb_clfucl_posi (init_date);

-- 创建数据表：历史_清算期货_清算_持仓表
use db_clfutu_his;
DROP TABLE IF EXISTS tb_clfucl_posi_his;
CREATE TABLE tb_clfucl_posi_his (
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
    crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    contrc_type int NOT NULL ,
    margin_pref int NOT NULL ,
    comb_code varchar(6) NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    contrc_unit int NOT NULL ,
    posi_amt decimal(18,4) NOT NULL ,
    pre_settle_price decimal(16,9) NOT NULL ,
    sett_price decimal(16,9) NOT NULL ,
    rece_margin decimal(18,4) NOT NULL ,
    sett_flag int NOT NULL ,
    deliv_flag int NOT NULL ,
    open_amount decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clfucl_posi_his_1 on tb_clfucl_posi_his (exch_group_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type,init_date);
create index idx_tb_clfucl_posi_his_2 on tb_clfucl_posi_his (asset_acco_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type);
create index idx_tb_clfucl_posi_his_3 on tb_clfucl_posi_his (curr_qty);
create index idx_tb_clfucl_posi_his_4 on tb_clfucl_posi_his (init_date);

-- 创建数据表：清算期货_清算_持仓明细表
use db_clfutu;
DROP TABLE IF EXISTS tb_clfucl_posi_detail;
CREATE TABLE tb_clfucl_posi_detail (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    contrc_unit int NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    open_posi_qty decimal(18,2) NOT NULL ,
    close_posi_qty decimal(18,2) NOT NULL ,
    open_amount decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clfucl_posi_detail_1 on tb_clfucl_posi_detail (exch_group_no,strike_date,exch_no,strike_no);
create index idx_tb_clfucl_posi_detail_2 on tb_clfucl_posi_detail (init_date);

-- 创建数据表：历史_清算期货_清算_持仓明细表
use db_clfutu_his;
DROP TABLE IF EXISTS tb_clfucl_posi_detail_his;
CREATE TABLE tb_clfucl_posi_detail_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    strike_date int NOT NULL ,
    strike_time int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    exch_no int NOT NULL ,
    futu_acco_no int NOT NULL ,
    contrc_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    hedge_type int NOT NULL ,
    contrc_unit int NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    open_posi_qty decimal(18,2) NOT NULL ,
    close_posi_qty decimal(18,2) NOT NULL ,
    open_amount decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_clfucl_posi_detail_his_1 on tb_clfucl_posi_detail_his (exch_group_no,strike_date,exch_no,strike_no);
create index idx_tb_clfucl_posi_detail_his_2 on tb_clfucl_posi_detail_his (init_date);
commit;
