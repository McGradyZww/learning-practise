-- /**************************************************************************************/
-- 创建数据库【交易证券】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_tdsecu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_tdsecu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：交易证券_T0_操作员阈值设置表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdset0_opor_tshold_set;
CREATE TABLE tb_tdset0_opor_tshold_set (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    opor_warn_tshold decimal(18,4) NOT NULL ,
    opor_stop_tshold decimal(18,4) NOT NULL ,
    order_limit_time int NOT NULL ,
    per_secu_posi_ratio decimal(18,12) NOT NULL ,
    posi_limit_time int NOT NULL ,
    order_ctrl_qty decimal(18,2) NOT NULL ,
    order_ctrl_amt decimal(18,4) NOT NULL ,
    stock_warn_ratio decimal(18,12) NOT NULL ,
    stock_stop_ratio decimal(18,12) NOT NULL ,
    stock_warn_amt decimal(18,4) NOT NULL ,
    stock_stop_amt decimal(18,4) NOT NULL ,
    trig_oper_type int NOT NULL ,
    open_close_permission int NOT NULL ,
    risk_oper int NOT NULL ,
    fee_calc_type int NOT NULL ,
    permit_margin_trade int NOT NULL ,
    buy_fee_ratio decimal(18,12) NOT NULL ,
    sell_fee_ratio decimal(18,12) NOT NULL ,
    buy_min_fee decimal(18,4) NOT NULL ,
    sell_min_fee decimal(18,4) NOT NULL ,
    trade_capt_amt decimal(18,4) NOT NULL ,
    trade_releas_amt decimal(18,4) NOT NULL ,
    strike_capt_amt decimal(18,4) NOT NULL ,
    strike_releas_amt decimal(18,4) NOT NULL ,
    sum_realize_pandl decimal(18,4) NOT NULL ,
    amt_diff decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdset0_opor_tshold_set_1 on tb_tdset0_opor_tshold_set (opor_no);
create index idx_tb_tdset0_opor_tshold_set_2 on tb_tdset0_opor_tshold_set (update_date,update_time);

-- 创建数据表：交易证券_T0_历史操作员阈值设置表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdset0_opor_tshold_set_his;
CREATE TABLE tb_tdset0_opor_tshold_set_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    opor_warn_tshold decimal(18,4) NOT NULL ,
    opor_stop_tshold decimal(18,4) NOT NULL ,
    order_limit_time int NOT NULL ,
    per_secu_posi_ratio decimal(18,12) NOT NULL ,
    posi_limit_time int NOT NULL ,
    order_ctrl_qty decimal(18,2) NOT NULL ,
    order_ctrl_amt decimal(18,4) NOT NULL ,
    stock_warn_ratio decimal(18,12) NOT NULL ,
    stock_stop_ratio decimal(18,12) NOT NULL ,
    stock_warn_amt decimal(18,4) NOT NULL ,
    stock_stop_amt decimal(18,4) NOT NULL ,
    trig_oper_type int NOT NULL ,
    open_close_permission int NOT NULL ,
    risk_oper int NOT NULL ,
    fee_calc_type int NOT NULL ,
    permit_margin_trade int NOT NULL ,
    buy_fee_ratio decimal(18,12) NOT NULL ,
    sell_fee_ratio decimal(18,12) NOT NULL ,
    buy_min_fee decimal(18,4) NOT NULL ,
    sell_min_fee decimal(18,4) NOT NULL ,
    trade_capt_amt decimal(18,4) NOT NULL ,
    trade_releas_amt decimal(18,4) NOT NULL ,
    strike_capt_amt decimal(18,4) NOT NULL ,
    strike_releas_amt decimal(18,4) NOT NULL ,
    sum_realize_pandl decimal(18,4) NOT NULL ,
    amt_diff decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdset0_opor_tshold_set_his_1 on tb_tdset0_opor_tshold_set_his (init_date,opor_no);

-- 创建数据表：交易证券_T0_操作员参数设置表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdset0_opor_param_set;
CREATE TABLE tb_tdset0_opor_param_set (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    config_no bigint NOT NULL ,
    config_value varchar(2048) NOT NULL ,
    config_name varchar(64) NOT NULL ,
    config_memo varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdset0_opor_param_set_1 on tb_tdset0_opor_param_set (co_no,opor_no,config_no);
create index idx_tb_tdset0_opor_param_set_2 on tb_tdset0_opor_param_set (update_date,update_time);

-- 创建数据表：交易证券_T0_证券持仓明细表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdset0_stock_posi_detail;
CREATE TABLE tb_tdset0_stock_posi_detail (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    open_posi_date int NOT NULL ,
    open_posi_time int NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    open_posi_value decimal(18,4) NOT NULL ,
    open_posi_fee decimal(18,4) NOT NULL ,
    close_posi_qty decimal(18,2) NOT NULL ,
    close_posi_date int NOT NULL ,
    close_posi_time int NOT NULL ,
    close_posi_market_value decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    over_night_pandl decimal(18,4) NOT NULL ,
    posi_status varchar(2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdset0_stock_posi_detail_1 on tb_tdset0_stock_posi_detail (opor_no,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_tdset0_stock_posi_detail_2 on tb_tdset0_stock_posi_detail (co_no,pd_no,exch_group_no);
create index idx_tb_tdset0_stock_posi_detail_3 on tb_tdset0_stock_posi_detail (posi_status);
create index idx_tb_tdset0_stock_posi_detail_4 on tb_tdset0_stock_posi_detail (update_date,update_time);

-- 创建数据表：交易证券_T0_历史证券持仓明细表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdset0_stock_posi_detail_his;
CREATE TABLE tb_tdset0_stock_posi_detail_his (
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
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    open_posi_date int NOT NULL ,
    open_posi_time int NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    open_posi_value decimal(18,4) NOT NULL ,
    open_posi_fee decimal(18,4) NOT NULL ,
    close_posi_date int NOT NULL ,
    close_posi_time int NOT NULL ,
    close_posi_qty decimal(18,2) NOT NULL ,
    close_posi_market_value decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    over_night_pandl decimal(18,4) NOT NULL ,
    posi_status varchar(2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdset0_stock_posi_detail_his_1 on tb_tdset0_stock_posi_detail_his (init_date,opor_no,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_tdset0_stock_posi_detail_his_2 on tb_tdset0_stock_posi_detail_his (init_date,co_no,pd_no,exch_group_no);
create index idx_tb_tdset0_stock_posi_detail_his_3 on tb_tdset0_stock_posi_detail_his (posi_status);

-- 创建数据表：交易证券_T0_证券平仓成交明细表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdset0_close_posi_strike_detail;
CREATE TABLE tb_tdset0_close_posi_strike_detail (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    detail_posi_id bigint NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    close_posi_date int NOT NULL ,
    close_posi_time int NOT NULL ,
    close_posi_price decimal(16,9) NOT NULL ,
    close_posi_qty decimal(18,2) NOT NULL ,
    close_posi_market_value decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdset0_close_posi_strike_detail_1 on tb_tdset0_close_posi_strike_detail (init_date,detail_posi_id,strike_no);
create index idx_tb_tdset0_close_posi_strike_detail_2 on tb_tdset0_close_posi_strike_detail (update_date,update_time);

-- 创建数据表：历史_交易证券_T0_证券平仓成交明细表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdset0_close_posi_strike_detail_his;
CREATE TABLE tb_tdset0_close_posi_strike_detail_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    detail_posi_id bigint NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    close_posi_date int NOT NULL ,
    close_posi_time int NOT NULL ,
    close_posi_price decimal(16,9) NOT NULL ,
    close_posi_qty decimal(18,2) NOT NULL ,
    close_posi_market_value decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdset0_close_posi_strike_detail_his_1 on tb_tdset0_close_posi_strike_detail_his (init_date,detail_posi_id,strike_no);
create index idx_tb_tdset0_close_posi_strike_detail_his_2 on tb_tdset0_close_posi_strike_detail_his (update_date,update_time);

-- 创建数据表：交易证券_T0_操作员券源设置表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdset0_opor_stock_source;
CREATE TABLE tb_tdset0_opor_stock_source (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    source_stock_qty decimal(18,2) NOT NULL ,
    single_limit_qty decimal(18,2) NOT NULL ,
    assigned_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    total_realize_pandl decimal(18,4) NOT NULL ,
    over_night_pandl decimal(18,4) NOT NULL ,
    sum_realize_pandl decimal(18,4) NOT NULL ,
    total_open_posi_fee decimal(18,4) NOT NULL ,
    total_close_posi_fee decimal(18,4) NOT NULL ,
    out_order_releas_qty decimal(18,2) NOT NULL ,
    out_order_capt_qty decimal(18,2) NOT NULL ,
    out_strike_releas_qty decimal(18,2) NOT NULL ,
    out_strike_capt_qty decimal(18,2) NOT NULL ,
    over_night_trade_buy_qty decimal(18,2) NOT NULL ,
    over_night_trade_sell_qty decimal(18,2) NOT NULL ,
    over_night_strike_sell_qty decimal(18,2) NOT NULL ,
    diff_qty decimal(18,2) NOT NULL ,
    t0_buy_type int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdset0_opor_stock_source_1 on tb_tdset0_opor_stock_source (opor_no,exch_group_no,asset_acco_no,stock_code_no,stock_acco_no);
create index idx_tb_tdset0_opor_stock_source_2 on tb_tdset0_opor_stock_source (co_no,pd_no);
create index idx_tb_tdset0_opor_stock_source_3 on tb_tdset0_opor_stock_source (exch_group_no,asset_acco_no,stock_code_no,stock_acco_no);
create index idx_tb_tdset0_opor_stock_source_4 on tb_tdset0_opor_stock_source (update_date,update_time);

-- 创建数据表：交易证券_T0_历史操作员券源设置表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdset0_opor_stock_source_his;
CREATE TABLE tb_tdset0_opor_stock_source_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    source_stock_qty decimal(18,2) NOT NULL ,
    single_limit_qty decimal(18,2) NOT NULL ,
    assigned_qty decimal(18,2) NOT NULL ,
    trade_releas_qty decimal(18,2) NOT NULL ,
    trade_capt_qty decimal(18,2) NOT NULL ,
    strike_releas_qty decimal(18,2) NOT NULL ,
    strike_capt_qty decimal(18,2) NOT NULL ,
    total_realize_pandl decimal(18,4) NOT NULL ,
    over_night_pandl decimal(18,4) NOT NULL ,
    sum_realize_pandl decimal(18,4) NOT NULL ,
    total_open_posi_fee decimal(18,4) NOT NULL ,
    total_close_posi_fee decimal(18,4) NOT NULL ,
    out_order_releas_qty decimal(18,2) NOT NULL ,
    out_order_capt_qty decimal(18,2) NOT NULL ,
    out_strike_releas_qty decimal(18,2) NOT NULL ,
    out_strike_capt_qty decimal(18,2) NOT NULL ,
    over_night_trade_buy_qty decimal(18,2) NOT NULL ,
    over_night_trade_sell_qty decimal(18,2) NOT NULL ,
    over_night_strike_sell_qty decimal(18,2) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    diff_qty decimal(18,2) NOT NULL ,
    t0_buy_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdset0_opor_stock_source_his_1 on tb_tdset0_opor_stock_source_his (init_date,opor_no,exch_group_no,asset_acco_no,stock_code_no,stock_acco_no);

-- 创建数据表：交易证券_T0_证券持仓汇总表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdset0_stock_posi_sum;
CREATE TABLE tb_tdset0_stock_posi_sum (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    total_long_curr_qty decimal(18,2) NOT NULL ,
    total_short_curr_qty decimal(18,2) NOT NULL ,
    total_long_open_posi_value decimal(18,4) NOT NULL ,
    total_short_open_posi_value decimal(18,4) NOT NULL ,
    total_long_open_posi_fee decimal(18,4) NOT NULL ,
    total_short_open_posi_fee decimal(18,4) NOT NULL ,
    total_long_close_posi_value decimal(18,4) NOT NULL ,
    total_short_close_posi_value decimal(18,4) NOT NULL ,
    total_long_close_posi_qty decimal(18,2) NOT NULL ,
    total_short_close_posi_qty decimal(18,2) NOT NULL ,
    total_long_close_posi_fee decimal(18,4) NOT NULL ,
    total_short_close_posi_fee decimal(18,4) NOT NULL ,
    total_realize_pandl decimal(18,4) NOT NULL ,
    long_curr_qty decimal(18,2) NOT NULL ,
    short_curr_qty decimal(18,2) NOT NULL ,
    long_open_posi_value decimal(18,4) NOT NULL ,
    short_open_posi_value decimal(18,4) NOT NULL ,
    long_open_posi_fee decimal(18,4) NOT NULL ,
    short_open_posi_fee decimal(18,4) NOT NULL ,
    long_close_posi_qty decimal(18,2) NOT NULL ,
    short_close_posi_qty decimal(18,2) NOT NULL ,
    long_close_posi_value decimal(18,4) NOT NULL ,
    short_close_posi_value decimal(18,4) NOT NULL ,
    long_close_posi_fee decimal(18,4) NOT NULL ,
    short_close_posi_fee decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    over_night_pandl decimal(18,4) NOT NULL ,
    open_posi_date int NOT NULL ,
    open_posi_time int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdset0_stock_posi_sum_1 on tb_tdset0_stock_posi_sum (opor_no,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_tdset0_stock_posi_sum_2 on tb_tdset0_stock_posi_sum (co_no,pd_no,exch_group_no);
create index idx_tb_tdset0_stock_posi_sum_3 on tb_tdset0_stock_posi_sum (update_date,update_time);

-- 创建数据表：交易证券_T0_历史证券持仓汇总表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdset0_stock_posi_sum_his;
CREATE TABLE tb_tdset0_stock_posi_sum_his (
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
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    total_long_curr_qty decimal(18,2) NOT NULL ,
    total_short_curr_qty decimal(18,2) NOT NULL ,
    total_long_open_posi_value decimal(18,4) NOT NULL ,
    total_short_open_posi_value decimal(18,4) NOT NULL ,
    total_long_open_posi_fee decimal(18,4) NOT NULL ,
    total_short_open_posi_fee decimal(18,4) NOT NULL ,
    total_long_close_posi_value decimal(18,4) NOT NULL ,
    total_short_close_posi_value decimal(18,4) NOT NULL ,
    total_long_close_posi_qty decimal(18,2) NOT NULL ,
    total_short_close_posi_qty decimal(18,2) NOT NULL ,
    total_long_close_posi_fee decimal(18,4) NOT NULL ,
    total_short_close_posi_fee decimal(18,4) NOT NULL ,
    total_realize_pandl decimal(18,4) NOT NULL ,
    long_curr_qty decimal(18,2) NOT NULL ,
    short_curr_qty decimal(18,2) NOT NULL ,
    long_open_posi_value decimal(18,4) NOT NULL ,
    short_open_posi_value decimal(18,4) NOT NULL ,
    long_open_posi_fee decimal(18,4) NOT NULL ,
    short_open_posi_fee decimal(18,4) NOT NULL ,
    long_close_posi_qty decimal(18,2) NOT NULL ,
    short_close_posi_qty decimal(18,2) NOT NULL ,
    long_close_posi_value decimal(18,4) NOT NULL ,
    short_close_posi_value decimal(18,4) NOT NULL ,
    long_close_posi_fee decimal(18,4) NOT NULL ,
    short_close_posi_fee decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    over_night_pandl decimal(18,4) NOT NULL ,
    open_posi_date int NOT NULL ,
    open_posi_time int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdset0_stock_posi_sum_his_1 on tb_tdset0_stock_posi_sum_his (init_date,opor_no,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no);
create index idx_tb_tdset0_stock_posi_sum_his_2 on tb_tdset0_stock_posi_sum_his (init_date,co_no,pd_no,exch_group_no);

-- 创建数据表：交易证券_T0_操作员券源设置流水表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdset0_opor_stock_source_jour;
CREATE TABLE tb_tdset0_opor_stock_source_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    oper_mac varchar(32) NOT NULL ,
    oper_ip_addr varchar(32) NOT NULL ,
    oper_info varchar(1024) NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    oper_menu_no int NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    busi_opor_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    source_stock_occur_qty decimal(18,2) NOT NULL ,
    source_stock_occur_end_qty decimal(18,2) NOT NULL ,
    single_limit_occur_qty decimal(18,2) NOT NULL ,
    single_limit_occur_end_qty decimal(18,2) NOT NULL ,
    assigned_occur_qty decimal(18,2) NOT NULL ,
    assigned_occur_end_qty decimal(18,2) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdset0_opor_stock_source_jour_1 on tb_tdset0_opor_stock_source_jour (init_date,busi_opor_no,exch_group_no,asset_acco_no,stock_code_no,stock_acco_no);
create index idx_tb_tdset0_opor_stock_source_jour_2 on tb_tdset0_opor_stock_source_jour (init_date,co_no,pd_no);
create index idx_tb_tdset0_opor_stock_source_jour_3 on tb_tdset0_opor_stock_source_jour (init_date,exch_group_no,asset_acco_no,stock_code_no,stock_acco_no);

-- 创建数据表：历史_交易证券_T0_操作员券源设置流水表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdset0_opor_stock_source_jour_his;
CREATE TABLE tb_tdset0_opor_stock_source_jour_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    oper_mac varchar(32) NOT NULL ,
    oper_ip_addr varchar(32) NOT NULL ,
    oper_info varchar(1024) NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    oper_menu_no int NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    busi_opor_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    exch_no int NOT NULL ,
    source_stock_occur_qty decimal(18,2) NOT NULL ,
    source_stock_occur_end_qty decimal(18,2) NOT NULL ,
    single_limit_occur_qty decimal(18,2) NOT NULL ,
    single_limit_occur_end_qty decimal(18,2) NOT NULL ,
    assigned_occur_qty decimal(18,2) NOT NULL ,
    assigned_occur_end_qty decimal(18,2) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_tdset0_opor_stock_source_jour_his_1 on tb_tdset0_opor_stock_source_jour_his (init_date,busi_opor_no,exch_group_no,asset_acco_no,stock_code_no,stock_acco_no);
create index idx_tb_tdset0_opor_stock_source_jour_his_2 on tb_tdset0_opor_stock_source_jour_his (init_date,co_no,pd_no);
create index idx_tb_tdset0_opor_stock_source_jour_his_3 on tb_tdset0_opor_stock_source_jour_his (init_date,exch_group_no,asset_acco_no,stock_code_no,stock_acco_no);

-- 创建数据表：交易证券_T0_交易组业务资金表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdset0_exgp_busi_capit;
CREATE TABLE tb_tdset0_exgp_busi_capit (
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
    opor_no int NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    comm_frozen_amt decimal(18,4) NOT NULL ,
    comm_unfroz_amt decimal(18,4) NOT NULL ,
    comm_capt_amt decimal(18,4) NOT NULL ,
    comm_releas_amt decimal(18,4) NOT NULL ,
    trade_frozen_amt decimal(18,4) NOT NULL ,
    trade_unfroz_amt decimal(18,4) NOT NULL ,
    trade_capt_amt decimal(18,4) NOT NULL ,
    trade_releas_amt decimal(18,4) NOT NULL ,
    strike_capt_amt decimal(18,4) NOT NULL ,
    strike_releas_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdset0_exgp_busi_capit_1 on tb_tdset0_exgp_busi_capit (opor_no,exch_group_no,asset_acco_no,exch_crncy_type);
create index idx_tb_tdset0_exgp_busi_capit_2 on tb_tdset0_exgp_busi_capit (co_no,pd_no,exch_crncy_type);

-- 创建数据表：交易证券_T0_历史交易组业务资金表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdset0_exgp_busi_capit_his;
CREATE TABLE tb_tdset0_exgp_busi_capit_his (
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
    opor_no int NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    frozen_amt decimal(18,4) NOT NULL ,
    unfroz_amt decimal(18,4) NOT NULL ,
    comm_frozen_amt decimal(18,4) NOT NULL ,
    comm_unfroz_amt decimal(18,4) NOT NULL ,
    comm_capt_amt decimal(18,4) NOT NULL ,
    comm_releas_amt decimal(18,4) NOT NULL ,
    trade_frozen_amt decimal(18,4) NOT NULL ,
    trade_unfroz_amt decimal(18,4) NOT NULL ,
    trade_capt_amt decimal(18,4) NOT NULL ,
    trade_releas_amt decimal(18,4) NOT NULL ,
    strike_capt_amt decimal(18,4) NOT NULL ,
    strike_releas_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdset0_exgp_busi_capit_his_1 on tb_tdset0_exgp_busi_capit_his (init_date,exch_group_no,opor_no,asset_acco_no,exch_crncy_type);
create index idx_tb_tdset0_exgp_busi_capit_his_2 on tb_tdset0_exgp_busi_capit_his (init_date,co_no,pd_no,exch_crncy_type);

-- 创建数据表：交易证券_T0_持仓作废流水表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdset0_posi_cancel_jour;
CREATE TABLE tb_tdset0_posi_cancel_jour (
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
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    open_posi_date int NOT NULL ,
    open_posi_time int NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    open_posi_value decimal(18,4) NOT NULL ,
    open_posi_fee decimal(18,4) NOT NULL ,
    waste_qty decimal(18,2) NOT NULL ,
    busi_opor_no int NOT NULL ,
    waste_date int NOT NULL ,
    waste_time int NOT NULL ,
    detail_posi_id bigint NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdset0_posi_cancel_jour_1 on tb_tdset0_posi_cancel_jour (busi_opor_no,detail_posi_id);
create index idx_tb_tdset0_posi_cancel_jour_2 on tb_tdset0_posi_cancel_jour (init_date);

-- 创建数据表：历史_交易证券_T0_持仓作废流水表
use db_tdsecu_his;
DROP TABLE IF EXISTS tb_tdset0_posi_cancel_jour_his;
CREATE TABLE tb_tdset0_posi_cancel_jour_his (
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
    exch_group_no int NOT NULL ,
    asset_acco_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    exch_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    stock_code_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    open_posi_date int NOT NULL ,
    open_posi_time int NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    open_posi_value decimal(18,4) NOT NULL ,
    open_posi_fee decimal(18,4) NOT NULL ,
    waste_qty decimal(18,2) NOT NULL ,
    busi_opor_no int NOT NULL ,
    waste_date int NOT NULL ,
    waste_time int NOT NULL ,
    detail_posi_id bigint NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdset0_posi_cancel_jour_his_1 on tb_tdset0_posi_cancel_jour_his (busi_opor_no,detail_posi_id);
create index idx_tb_tdset0_posi_cancel_jour_his_2 on tb_tdset0_posi_cancel_jour_his (init_date);

-- 创建数据表：交易证券_T0_操作员持仓市值设置表
use db_tdsecu;
DROP TABLE IF EXISTS tb_tdset0_opor_posi_market_value_set;
CREATE TABLE tb_tdset0_opor_posi_market_value_set (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    max_posi_market_value decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_tdset0_opor_posi_market_value_set_1 on tb_tdset0_opor_posi_market_value_set (opor_no);
commit;
