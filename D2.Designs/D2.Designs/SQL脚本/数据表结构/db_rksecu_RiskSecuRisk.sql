-- /**************************************************************************************/
-- 创建数据库【风控证券】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_rksecu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_rksecu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：风控证券_风控_客户风险规则表
use db_rksecu;
DROP TABLE IF EXISTS tb_rkserk_secu_client_risk_rule;
CREATE TABLE tb_rkserk_secu_client_risk_rule (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no_str varchar(2048) NOT NULL ,
    exch_group_no_str varchar(2048) NOT NULL ,
    exch_no_str varchar(2048) NOT NULL ,
    order_dir_str varchar(1024) NOT NULL ,
    dime_id bigint NOT NULL ,
    trig_stage_type_str varchar(64) NOT NULL ,
    compli_calc_level int NOT NULL ,
    unit_nav_flag int NOT NULL ,
    trig_type int NOT NULL ,
    model_id bigint NOT NULL ,
    risk_item_id int NOT NULL ,
    compli_rules_remark varchar(255) NOT NULL ,
    risk_rule_id int NOT NULL ,
    risk_rule_type int NOT NULL ,
    risk_rule_name varchar(64) NOT NULL ,
    risk_rule_code varchar(2048) NOT NULL ,
    risk_param_str varchar(2048) NOT NULL ,
    union_flag int NOT NULL ,
    risk_rule_value_str1 varchar(255) NOT NULL ,
    risk_rule_action1 varchar(32) NOT NULL ,
    risk_rule_value_str2 varchar(255) NOT NULL ,
    risk_rule_action2 varchar(32) NOT NULL ,
    risk_rule_value_str3 varchar(255) NOT NULL ,
    risk_rule_action3 varchar(32) NOT NULL ,
    risk_rule_value_str4 varchar(255) NOT NULL ,
    risk_rule_action4 varchar(32) NOT NULL ,
    corrsp_plug varchar(64) NOT NULL ,
    begin_time int NOT NULL ,
    end_time int NOT NULL ,
    rule_flag int NOT NULL ,
    templ_flag int NOT NULL ,
    compli_trig_result_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rkserk_secu_client_risk_rule_1 on tb_rkserk_secu_client_risk_rule (co_no,trig_stage_type_str);
create index idx_tb_rkserk_secu_client_risk_rule_2 on tb_rkserk_secu_client_risk_rule (co_no,model_id);
create index idx_tb_rkserk_secu_client_risk_rule_3 on tb_rkserk_secu_client_risk_rule (co_no,risk_item_id);

-- 创建数据表：风控证券_风控_客户风险触警流水表
use db_rksecu;
DROP TABLE IF EXISTS tbjour_rkserk_secu_client_risk_trig;
CREATE TABLE tbjour_rkserk_secu_client_risk_trig (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    client_risk_rule_id int NOT NULL ,
    risk_item_id int NOT NULL ,
    compli_trig_id bigint NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    order_dir int NOT NULL ,
    dime_id bigint NOT NULL ,
    stock_code_no int NOT NULL ,
    trig_stage_type int NOT NULL ,
    compli_calc_level int NOT NULL ,
    unit_nav_flag int NOT NULL ,
    trig_type int NOT NULL ,
    compli_rules_remark varchar(255) NOT NULL ,
    risk_rule_action varchar(32) NOT NULL ,
    risk_rule_type int NOT NULL ,
    risk_rule_value_str varchar(255) NOT NULL ,
    risk_rule_calc_str varchar(255) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    opor_no int NOT NULL ,
    pd_no_str varchar(2048) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tbjour_rkserk_secu_client_risk_trig_1 on tbjour_rkserk_secu_client_risk_trig (co_no,risk_rule_action,risk_rule_type);
create index idx_tbjour_rkserk_secu_client_risk_trig_2 on tbjour_rkserk_secu_client_risk_trig (co_no,trig_stage_type,compli_trig_id);
create index idx_tbjour_rkserk_secu_client_risk_trig_3 on tbjour_rkserk_secu_client_risk_trig (create_date);

-- 创建数据表：历史_风控证券_风控_客户风险触警流水表
use db_rksecu_his;
DROP TABLE IF EXISTS tbjour_rkserk_secu_client_risk_trig_his;
CREATE TABLE tbjour_rkserk_secu_client_risk_trig_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    client_risk_rule_id int NOT NULL ,
    risk_item_id int NOT NULL ,
    compli_trig_id bigint NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    order_dir int NOT NULL ,
    dime_id bigint NOT NULL ,
    stock_code_no int NOT NULL ,
    trig_stage_type int NOT NULL ,
    compli_calc_level int NOT NULL ,
    unit_nav_flag int NOT NULL ,
    trig_type int NOT NULL ,
    compli_rules_remark varchar(255) NOT NULL ,
    risk_rule_action varchar(32) NOT NULL ,
    risk_rule_type int NOT NULL ,
    risk_rule_value_str varchar(255) NOT NULL ,
    risk_rule_calc_str varchar(255) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    opor_no int NOT NULL ,
    pd_no_str varchar(2048) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tbjour_rkserk_secu_client_risk_trig_his_1 on tbjour_rkserk_secu_client_risk_trig_his (co_no,risk_rule_action,risk_rule_type);
create index idx_tbjour_rkserk_secu_client_risk_trig_his_2 on tbjour_rkserk_secu_client_risk_trig_his (co_no,trig_stage_type,compli_trig_id);
create index idx_tbjour_rkserk_secu_client_risk_trig_his_3 on tbjour_rkserk_secu_client_risk_trig_his (create_date);

-- 创建数据表：风控证券_风控_账户风险监控设置表
use db_rksecu;
DROP TABLE IF EXISTS tb_rkserk_product_monitor_set;
CREATE TABLE tb_rkserk_product_monitor_set (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no_str varchar(2048) NOT NULL ,
    exch_group_no_str varchar(2048) NOT NULL ,
    moni_role_type int NOT NULL ,
    moni_value_flag int NOT NULL ,
    moni_value_type int NOT NULL ,
    warn_posi_value decimal(18,4) NOT NULL ,
    warn_trig_oper_type int NOT NULL ,
    close_posi_value decimal(18,4) NOT NULL ,
    close_trig_oper_type int NOT NULL ,
    appd_value decimal(18,4) NOT NULL ,
    appd_trig_oper_type int NOT NULL ,
    begin_moni_date int NOT NULL ,
    begin_moni_value decimal(18,4) NOT NULL ,
    max_moni_value decimal(18,4) NOT NULL ,
    curr_moni_value decimal(18,4) NOT NULL ,
    curr_result_moni_value decimal(18,4) NOT NULL ,
    contrs_stock_code varchar(6) NOT NULL ,
    contrs_exch_no int NOT NULL ,
    contrs_max_moni_value decimal(18,4) NOT NULL ,
    contrs_curr_moni_value decimal(18,4) NOT NULL ,
    contrs_result_moni_value decimal(18,4) NOT NULL ,
    moni_result_value decimal(18,4) NOT NULL ,
    moni_result_status varchar(2) NOT NULL ,
    moni_set_status varchar(2) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    stock_asset_ratio decimal(18,12) NOT NULL ,
    close_posi_flag int NOT NULL ,
    close_ratio_level_one decimal(18,12) NOT NULL ,
    close_ratio_level_two decimal(18,12) NOT NULL ,
    close_ratio_level_three decimal(18,12) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    time_stamp int NOT NULL ,
    pd_share decimal(18,2) NOT NULL ,
    begin_asset_value decimal(18,4) NOT NULL ,
    hk_thrgh_stock_asset decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建数据表：风控证券_风控_证券风险监控设置表
use db_rksecu;
DROP TABLE IF EXISTS tb_rkserk_stock_monitor_set;
CREATE TABLE tb_rkserk_stock_monitor_set (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    pd_no_str varchar(2048) NOT NULL ,
    exch_group_no_str varchar(2048) NOT NULL ,
    monitor_ctrl_type int NOT NULL ,
    moni_value_type int NOT NULL ,
    monitor_param_value int NOT NULL ,
    moni_value_flag int NOT NULL ,
    warn_posi_value decimal(18,4) NOT NULL ,
    appd_value decimal(18,4) NOT NULL ,
    close_posi_value decimal(18,4) NOT NULL ,
    max_moni_value decimal(18,4) NOT NULL ,
    curr_moni_value decimal(18,4) NOT NULL ,
    curr_result_moni_value decimal(18,4) NOT NULL ,
    contrs_stock_code varchar(6) NOT NULL ,
    contrs_exch_no int NOT NULL ,
    contrs_max_moni_value decimal(18,4) NOT NULL ,
    contrs_curr_moni_value decimal(18,4) NOT NULL ,
    contrs_result_moni_value decimal(18,4) NOT NULL ,
    moni_result_value decimal(18,4) NOT NULL ,
    moni_result_status varchar(2) NOT NULL ,
    moni_set_status varchar(2) NOT NULL ,
    close_posi_flag int NOT NULL ,
    close_ratio_level_one decimal(18,12) NOT NULL ,
    close_ratio_level_two decimal(18,12) NOT NULL ,
    close_ratio_level_three decimal(18,12) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rkserk_stock_monitor_set_1 on tb_rkserk_stock_monitor_set (co_no);

-- 创建数据表：风控证券_风控_操作员风险监控设置表
use db_rksecu;
DROP TABLE IF EXISTS tb_rkserk_opor_monitor_set;
CREATE TABLE tb_rkserk_opor_monitor_set (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    opor_no int NOT NULL ,
    moni_role_type int NOT NULL ,
    moni_value_flag int NOT NULL ,
    moni_value_type int NOT NULL ,
    warn_posi_value decimal(18,4) NOT NULL ,
    warn_trig_oper_type int NOT NULL ,
    close_posi_value decimal(18,4) NOT NULL ,
    close_trig_oper_type int NOT NULL ,
    appd_value decimal(18,4) NOT NULL ,
    appd_trig_oper_type int NOT NULL ,
    begin_moni_date int NOT NULL ,
    begin_moni_value decimal(18,4) NOT NULL ,
    max_moni_value decimal(18,4) NOT NULL ,
    curr_moni_value decimal(18,4) NOT NULL ,
    curr_result_moni_value decimal(18,4) NOT NULL ,
    contrs_stock_code varchar(6) NOT NULL ,
    contrs_exch_no int NOT NULL ,
    contrs_max_moni_value decimal(18,4) NOT NULL ,
    contrs_curr_moni_value decimal(18,4) NOT NULL ,
    contrs_result_moni_value decimal(18,4) NOT NULL ,
    moni_result_value decimal(18,4) NOT NULL ,
    moni_result_status varchar(2) NOT NULL ,
    moni_set_status varchar(2) NOT NULL ,
    cash_asset decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    stock_asset decimal(18,4) NOT NULL ,
    repo_asset decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    stock_asset_ratio decimal(18,12) NOT NULL ,
    close_posi_flag int NOT NULL ,
    close_ratio_level_one decimal(18,12) NOT NULL ,
    close_ratio_level_two decimal(18,12) NOT NULL ,
    close_ratio_level_three decimal(18,12) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    time_stamp int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rkserk_opor_monitor_set_1 on tb_rkserk_opor_monitor_set (co_no,opor_no);

-- 创建数据表：风控证券_风控_合规触警流水序号表
use db_rksecu;
DROP TABLE IF EXISTS tb_rkserk_compliancetrigger_id;
CREATE TABLE tb_rkserk_compliancetrigger_id (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    compli_trig_id bigint NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rkserk_compliancetrigger_id_1 on tb_rkserk_compliancetrigger_id (co_no);

-- 创建数据表：风控证券_风控_交易流水记录表
use db_rksecu;
DROP TABLE IF EXISTS tb_rkserk_trd_trig;
CREATE TABLE tb_rkserk_trd_trig (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    exch_group_no int NOT NULL ,
    exch_no int NOT NULL ,
    exch_crncy_type varchar(3) NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    occur_qty decimal(18,2) NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    trade_amt decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rkserk_trd_trig_1 on tb_rkserk_trd_trig (co_no,pd_no,exch_group_no,exch_crncy_type,exch_no,stock_code);

-- 创建数据表：风控证券_风控_层次计算结果表
use db_rksecu;
DROP TABLE IF EXISTS tb_rkserk_stage_calc;
CREATE TABLE tb_rkserk_stage_calc (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    link_row_id bigint NOT NULL ,
    co_no int NOT NULL ,
    pd_no_str varchar(2048) NOT NULL ,
    exch_group_no_str varchar(2048) NOT NULL ,
    trig_stage_type int NOT NULL ,
    client_risk_rule_id int NOT NULL ,
    risk_rule_calc_str varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rkserk_stage_calc_1 on tb_rkserk_stage_calc (link_row_id);
create index idx_tb_rkserk_stage_calc_2 on tb_rkserk_stage_calc (co_no,client_risk_rule_id,trig_stage_type);

-- 创建数据表：风控证券_风控_T0操作员阈值计算表
use db_rksecu;
DROP TABLE IF EXISTS tb_rkserk_opor_tshold_result;
CREATE TABLE tb_rkserk_opor_tshold_result (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    detail_posi_id bigint NOT NULL ,
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
    close_posi_market_value decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    pandl_ratio decimal(18,12) NOT NULL ,
    un_close_posi_qty decimal(18,2) NOT NULL ,
    un_close_marke_value decimal(18,4) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    up_limit_price decimal(16,9) NOT NULL ,
    down_limit_price decimal(16,9) NOT NULL ,
    cost_price decimal(16,9) NOT NULL ,
    last_tshold_value decimal(18,4) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    posi_status varchar(2) NOT NULL ,
    moni_result_status varchar(2) NOT NULL ,
    posi_limit_status varchar(2) NOT NULL ,
    opor_warn_tshold decimal(18,4) NOT NULL ,
    opor_stop_tshold decimal(18,4) NOT NULL ,
    stock_warn_ratio decimal(18,12) NOT NULL ,
    stock_stop_ratio decimal(18,12) NOT NULL ,
    stock_warn_amt decimal(18,4) NOT NULL ,
    stock_stop_amt decimal(18,4) NOT NULL ,
    open_close_permission int NOT NULL ,
    posi_limit_time int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rkserk_opor_tshold_result_1 on tb_rkserk_opor_tshold_result (opor_no,exch_group_no,asset_acco_no,stock_code_no);
create index idx_tb_rkserk_opor_tshold_result_3 on tb_rkserk_opor_tshold_result (co_no,pd_no,exch_group_no);
create index idx_tb_rkserk_opor_tshold_result_4 on tb_rkserk_opor_tshold_result (pd_no,stock_code_no);
create index idx_tb_rkserk_opor_tshold_result_5 on tb_rkserk_opor_tshold_result (exch_group_no,stock_code_no);

-- 创建数据表：风控证券_风控_T0历史操作员阈值计算表
use db_rksecu_his;
DROP TABLE IF EXISTS tb_rkserk_opor_tshold_result_his;
CREATE TABLE tb_rkserk_opor_tshold_result_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    opor_no int NOT NULL ,
    detail_posi_id bigint NOT NULL ,
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
    close_posi_market_value decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    pandl_ratio decimal(18,12) NOT NULL ,
    un_close_posi_qty decimal(18,2) NOT NULL ,
    un_close_marke_value decimal(18,4) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    up_limit_price decimal(16,9) NOT NULL ,
    down_limit_price decimal(16,9) NOT NULL ,
    last_tshold_value decimal(18,4) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    posi_status varchar(2) NOT NULL ,
    moni_result_status varchar(2) NOT NULL ,
    posi_limit_status varchar(2) NOT NULL ,
    opor_warn_tshold decimal(18,4) NOT NULL ,
    opor_stop_tshold decimal(18,4) NOT NULL ,
    stock_warn_ratio decimal(18,12) NOT NULL ,
    stock_stop_ratio decimal(18,12) NOT NULL ,
    stock_warn_amt decimal(18,4) NOT NULL ,
    stock_stop_amt decimal(18,4) NOT NULL ,
    open_close_permission int NOT NULL ,
    posi_limit_time int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rkserk_opor_tshold_result_his_1 on tb_rkserk_opor_tshold_result_his (init_date,opor_no,detail_posi_id,exch_group_no,asset_acco_no,stock_code_no);
create index idx_tb_rkserk_opor_tshold_result_his_3 on tb_rkserk_opor_tshold_result_his (init_date,co_no,pd_no,exch_group_no);
create index idx_tb_rkserk_opor_tshold_result_his_4 on tb_rkserk_opor_tshold_result_his (init_date,pd_no,stock_code_no);
create index idx_tb_rkserk_opor_tshold_result_his_5 on tb_rkserk_opor_tshold_result_his (init_date,exch_group_no,stock_code_no);

-- 创建数据表：风控证券_风控_T0操作员阈值汇总计算表
use db_rksecu;
DROP TABLE IF EXISTS tb_rkserk_opor_tshold_sum_result;
CREATE TABLE tb_rkserk_opor_tshold_sum_result (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    open_posi_value decimal(18,4) NOT NULL ,
    open_posi_fee decimal(18,4) NOT NULL ,
    close_posi_qty decimal(18,2) NOT NULL ,
    close_posi_market_value decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    pandl_ratio decimal(18,12) NOT NULL ,
    un_close_posi_qty decimal(18,2) NOT NULL ,
    un_close_marke_value decimal(18,4) NOT NULL ,
    last_tshold_value decimal(18,4) NOT NULL ,
    moni_result_status varchar(2) NOT NULL ,
    opor_warn_tshold decimal(18,4) NOT NULL ,
    opor_stop_tshold decimal(18,4) NOT NULL ,
    open_close_permission int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rkserk_opor_tshold_sum_result_1 on tb_rkserk_opor_tshold_sum_result (opor_no,co_no);
create index idx_tb_rkserk_opor_tshold_sum_result_2 on tb_rkserk_opor_tshold_sum_result (co_no,moni_result_status);

-- 创建数据表：风控证券_风控_T0历史操作员阈值汇总计算表
use db_rksecu_his;
DROP TABLE IF EXISTS tb_rkserk_opor_tshold_sum_result_his;
CREATE TABLE tb_rkserk_opor_tshold_sum_result_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    open_posi_value decimal(18,4) NOT NULL ,
    open_posi_fee decimal(18,4) NOT NULL ,
    close_posi_qty decimal(18,2) NOT NULL ,
    close_posi_market_value decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    pandl_ratio decimal(18,12) NOT NULL ,
    un_close_posi_qty decimal(18,2) NOT NULL ,
    un_close_marke_value decimal(18,4) NOT NULL ,
    last_tshold_value decimal(18,4) NOT NULL ,
    moni_result_status varchar(2) NOT NULL ,
    opor_warn_tshold decimal(18,4) NOT NULL ,
    opor_stop_tshold decimal(18,4) NOT NULL ,
    open_close_permission int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_rkserk_opor_tshold_sum_result_his_1 on tb_rkserk_opor_tshold_sum_result_his (init_date,opor_no,co_no);
create index idx_tb_rkserk_opor_tshold_sum_result_his_2 on tb_rkserk_opor_tshold_sum_result_his (init_date,co_no);

-- 创建数据表：风控证券_风控_T0操作员触警流水表
use db_rksecu;
DROP TABLE IF EXISTS tbjour_rkserk_opor_tshold_risk_trig;
CREATE TABLE tbjour_rkserk_opor_tshold_risk_trig (
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
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    open_posi_value decimal(18,4) NOT NULL ,
    open_posi_fee decimal(18,4) NOT NULL ,
    close_posi_qty decimal(18,2) NOT NULL ,
    close_posi_market_value decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    pandl_ratio decimal(18,12) NOT NULL ,
    un_close_posi_qty decimal(18,2) NOT NULL ,
    un_close_marke_value decimal(18,4) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    cost_price decimal(16,9) NOT NULL ,
    last_tshold_value decimal(18,4) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    moni_result_status varchar(2) NOT NULL ,
    opor_warn_tshold decimal(18,4) NOT NULL ,
    opor_stop_tshold decimal(18,4) NOT NULL ,
    stock_warn_ratio decimal(18,12) NOT NULL ,
    stock_stop_ratio decimal(18,12) NOT NULL ,
    stock_warn_amt decimal(18,4) NOT NULL ,
    stock_stop_amt decimal(18,4) NOT NULL ,
    open_close_permission int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tbjour_rkserk_opor_tshold_risk_trig_1 on tbjour_rkserk_opor_tshold_risk_trig (co_no,pd_no,exch_group_no,stock_code_no);
create index idx_tbjour_rkserk_opor_tshold_risk_trig_2 on tbjour_rkserk_opor_tshold_risk_trig (co_no,opor_no,moni_result_status);
create index idx_tbjour_rkserk_opor_tshold_risk_trig_3 on tbjour_rkserk_opor_tshold_risk_trig (create_date);

-- 创建数据表：历史_风控证券_风控_T0操作员触警流水表
use db_rksecu_his;
DROP TABLE IF EXISTS tbjour_rkserk_opor_tshold_risk_trig_his;
CREATE TABLE tbjour_rkserk_opor_tshold_risk_trig_his (
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
    exch_no int NOT NULL ,
    stock_code_no int NOT NULL ,
    stock_acco_no int NOT NULL ,
    lngsht_type int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    open_posi_price decimal(16,9) NOT NULL ,
    open_posi_value decimal(18,4) NOT NULL ,
    open_posi_fee decimal(18,4) NOT NULL ,
    close_posi_qty decimal(18,2) NOT NULL ,
    close_posi_market_value decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    pandl_ratio decimal(18,12) NOT NULL ,
    un_close_posi_qty decimal(18,2) NOT NULL ,
    un_close_marke_value decimal(18,4) NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    cost_price decimal(16,9) NOT NULL ,
    last_tshold_value decimal(18,4) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    moni_result_status varchar(2) NOT NULL ,
    opor_warn_tshold decimal(18,4) NOT NULL ,
    opor_stop_tshold decimal(18,4) NOT NULL ,
    stock_warn_ratio decimal(18,12) NOT NULL ,
    stock_stop_ratio decimal(18,12) NOT NULL ,
    stock_warn_amt decimal(18,4) NOT NULL ,
    stock_stop_amt decimal(18,4) NOT NULL ,
    open_close_permission int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tbjour_rkserk_opor_tshold_risk_trig_his_1 on tbjour_rkserk_opor_tshold_risk_trig_his (co_no,pd_no,exch_group_no,stock_code_no);
create index idx_tbjour_rkserk_opor_tshold_risk_trig_his_2 on tbjour_rkserk_opor_tshold_risk_trig_his (co_no,opor_no,moni_result_status);
create index idx_tbjour_rkserk_opor_tshold_risk_trig_his_3 on tbjour_rkserk_opor_tshold_risk_trig_his (create_date);

-- 创建数据表：风控证券_风控_T0操作员汇总触警流水表
use db_rksecu;
DROP TABLE IF EXISTS tbjour_rkserk_opor_tshold_sum_risk_trig;
CREATE TABLE tbjour_rkserk_opor_tshold_sum_risk_trig (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    open_posi_value decimal(18,4) NOT NULL ,
    open_posi_fee decimal(18,4) NOT NULL ,
    close_posi_qty decimal(18,2) NOT NULL ,
    close_posi_market_value decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    pandl_ratio decimal(18,12) NOT NULL ,
    un_close_posi_qty decimal(18,2) NOT NULL ,
    un_close_marke_value decimal(18,4) NOT NULL ,
    last_tshold_value decimal(18,4) NOT NULL ,
    moni_result_status varchar(2) NOT NULL ,
    opor_warn_tshold decimal(18,4) NOT NULL ,
    opor_stop_tshold decimal(18,4) NOT NULL ,
    open_close_permission int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tbjour_rkserk_opor_tshold_sum_risk_trig_1 on tbjour_rkserk_opor_tshold_sum_risk_trig (co_no,opor_no,moni_result_status);
create index idx_tbjour_rkserk_opor_tshold_sum_risk_trig_2 on tbjour_rkserk_opor_tshold_sum_risk_trig (create_date);

-- 创建数据表：历史_风控证券_风控_T0操作员汇总触警流水表
use db_rksecu_his;
DROP TABLE IF EXISTS tbjour_rkserk_opor_tshold_sum_risk_trig_his;
CREATE TABLE tbjour_rkserk_opor_tshold_sum_risk_trig_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    co_no int NOT NULL ,
    curr_qty decimal(18,2) NOT NULL ,
    open_posi_value decimal(18,4) NOT NULL ,
    open_posi_fee decimal(18,4) NOT NULL ,
    close_posi_qty decimal(18,2) NOT NULL ,
    close_posi_market_value decimal(18,4) NOT NULL ,
    close_posi_fee decimal(18,4) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    float_pandl decimal(18,4) NOT NULL ,
    pandl_ratio decimal(18,12) NOT NULL ,
    un_close_posi_qty decimal(18,2) NOT NULL ,
    un_close_marke_value decimal(18,4) NOT NULL ,
    last_tshold_value decimal(18,4) NOT NULL ,
    moni_result_status varchar(2) NOT NULL ,
    opor_warn_tshold decimal(18,4) NOT NULL ,
    opor_stop_tshold decimal(18,4) NOT NULL ,
    open_close_permission int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tbjour_rkserk_opor_tshold_sum_risk_trig_his_1 on tbjour_rkserk_opor_tshold_sum_risk_trig_his (co_no,opor_no,moni_result_status);
create index idx_tbjour_rkserk_opor_tshold_sum_risk_trig_his_2 on tbjour_rkserk_opor_tshold_sum_risk_trig_his (create_date);

-- 创建数据表：风控证券_风控_资产账户融资融券保证金计算表
use db_rksecu;
DROP TABLE IF EXISTS tbjour_rkserk_asac_fina_loan_margin_calc;
CREATE TABLE tbjour_rkserk_asac_fina_loan_margin_calc (
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
    curr_converted_margin decimal(18,4) NOT NULL ,
    cmmd_converted_margin decimal(18,4) NOT NULL ,
    order_converted_margin decimal(18,4) NOT NULL ,
    fina_market_value decimal(18,4) NOT NULL ,
    fina_profit decimal(18,4) NOT NULL ,
    fina_converted_pandl decimal(18,4) NOT NULL ,
    loan_market_value decimal(18,4) NOT NULL ,
    loan_profit decimal(18,4) NOT NULL ,
    loan_converted_pandl decimal(18,4) NOT NULL ,
    fina_comm_capt_margin decimal(18,4) NOT NULL ,
    loan_comm_capt_margin decimal(18,4) NOT NULL ,
    fina_order_capt_margin decimal(18,4) NOT NULL ,
    loan_order_capt_margin decimal(18,4) NOT NULL ,
    fina_capt_margin decimal(18,4) NOT NULL ,
    loan_capt_margin decimal(18,4) NOT NULL ,
    keep_guarantee_ratio decimal(18,12) NOT NULL ,
    loan_sell_amt decimal(18,4) NOT NULL ,
    margin_ratio_market_value decimal(18,4) NOT NULL ,
    fina_interest decimal(18,4) NOT NULL ,
    loan_interest decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tbjour_rkserk_asac_fina_loan_margin_calc_1 on tbjour_rkserk_asac_fina_loan_margin_calc (co_no,pd_no,asset_acco_no);

-- 创建数据表：历史_风控证券_风控_资产账户融资融券保证金计算表
use db_rksecu_his;
DROP TABLE IF EXISTS tbjour_rkserk_asac_fina_loan_margin_calc_his;
CREATE TABLE tbjour_rkserk_asac_fina_loan_margin_calc_his (
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
    curr_converted_margin decimal(18,4) NOT NULL ,
    cmmd_converted_margin decimal(18,4) NOT NULL ,
    order_converted_margin decimal(18,4) NOT NULL ,
    fina_market_value decimal(18,4) NOT NULL ,
    fina_profit decimal(18,4) NOT NULL ,
    fina_converted_pandl decimal(18,4) NOT NULL ,
    loan_market_value decimal(18,4) NOT NULL ,
    loan_profit decimal(18,4) NOT NULL ,
    loan_converted_pandl decimal(18,4) NOT NULL ,
    fina_comm_capt_margin decimal(18,4) NOT NULL ,
    loan_comm_capt_margin decimal(18,4) NOT NULL ,
    fina_order_capt_margin decimal(18,4) NOT NULL ,
    loan_order_capt_margin decimal(18,4) NOT NULL ,
    fina_capt_margin decimal(18,4) NOT NULL ,
    loan_capt_margin decimal(18,4) NOT NULL ,
    keep_guarantee_ratio decimal(18,12) NOT NULL ,
    loan_sell_amt decimal(18,4) NOT NULL ,
    margin_ratio_market_value decimal(18,4) NOT NULL ,
    fina_interest decimal(18,4) NOT NULL ,
    loan_interest decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tbjour_rkserk_asac_fina_loan_margin_calc_his_1 on tbjour_rkserk_asac_fina_loan_margin_calc_his (co_no,pd_no,asset_acco_no);

-- 创建数据表：风控证券_风控_交易组融资融券保证金计算表
use db_rksecu;
DROP TABLE IF EXISTS tbjour_rkserk_exgp_fina_loan_margin_calc;
CREATE TABLE tbjour_rkserk_exgp_fina_loan_margin_calc (
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
    curr_converted_margin decimal(18,4) NOT NULL ,
    cmmd_converted_margin decimal(18,4) NOT NULL ,
    order_converted_margin decimal(18,4) NOT NULL ,
    fina_market_value decimal(18,4) NOT NULL ,
    fina_profit decimal(18,4) NOT NULL ,
    fina_converted_pandl decimal(18,4) NOT NULL ,
    loan_market_value decimal(18,4) NOT NULL ,
    loan_profit decimal(18,4) NOT NULL ,
    loan_converted_pandl decimal(18,4) NOT NULL ,
    fina_comm_capt_margin decimal(18,4) NOT NULL ,
    loan_comm_capt_margin decimal(18,4) NOT NULL ,
    fina_order_capt_margin decimal(18,4) NOT NULL ,
    loan_order_capt_margin decimal(18,4) NOT NULL ,
    fina_capt_margin decimal(18,4) NOT NULL ,
    loan_capt_margin decimal(18,4) NOT NULL ,
    keep_guarantee_ratio decimal(18,12) NOT NULL ,
    loan_sell_amt decimal(18,4) NOT NULL ,
    margin_ratio_market_value decimal(18,4) NOT NULL ,
    fina_interest decimal(18,4) NOT NULL ,
    loan_interest decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tbjour_rkserk_exgp_fina_loan_margin_calc_1 on tbjour_rkserk_exgp_fina_loan_margin_calc (co_no,pd_no,asset_acco_no,exch_group_no);

-- 创建数据表：历史_风控证券_风控_交易组融资融券保证金计算表
use db_rksecu_his;
DROP TABLE IF EXISTS tbjour_rkserk_exgp_fina_loan_margin_calc_his;
CREATE TABLE tbjour_rkserk_exgp_fina_loan_margin_calc_his (
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
    curr_converted_margin decimal(18,4) NOT NULL ,
    cmmd_converted_margin decimal(18,4) NOT NULL ,
    order_converted_margin decimal(18,4) NOT NULL ,
    fina_market_value decimal(18,4) NOT NULL ,
    fina_profit decimal(18,4) NOT NULL ,
    fina_converted_pandl decimal(18,4) NOT NULL ,
    loan_market_value decimal(18,4) NOT NULL ,
    loan_profit decimal(18,4) NOT NULL ,
    loan_converted_pandl decimal(18,4) NOT NULL ,
    fina_comm_capt_margin decimal(18,4) NOT NULL ,
    loan_comm_capt_margin decimal(18,4) NOT NULL ,
    fina_order_capt_margin decimal(18,4) NOT NULL ,
    loan_order_capt_margin decimal(18,4) NOT NULL ,
    fina_capt_margin decimal(18,4) NOT NULL ,
    loan_capt_margin decimal(18,4) NOT NULL ,
    keep_guarantee_ratio decimal(18,12) NOT NULL ,
    loan_sell_amt decimal(18,4) NOT NULL ,
    margin_ratio_market_value decimal(18,4) NOT NULL ,
    fina_interest decimal(18,4) NOT NULL ,
    loan_interest decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tbjour_rkserk_exgp_fina_loan_margin_calc_his_1 on tbjour_rkserk_exgp_fina_loan_margin_calc_his (co_no,pd_no,asset_acco_no,exch_group_no);

-- 创建数据表：风控证券_风控_预订单信息表
use db_rksecu;
DROP TABLE IF EXISTS tb_rkserk_preorder;
CREATE TABLE tb_rkserk_preorder (
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
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    order_dir int NOT NULL ,
    order_price decimal(16,9) NOT NULL ,
    order_qty decimal(18,2) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    order_batch_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rkserk_preorder_1 on tb_rkserk_preorder (order_batch_no);

-- 创建数据表：风控证券_风控_预指令信息表
use db_rksecu;
DROP TABLE IF EXISTS tb_rkserk_precommand;
CREATE TABLE tb_rkserk_precommand (
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
    stock_code_no int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    comm_dir int NOT NULL ,
    limit_actual_price decimal(16,9) NOT NULL ,
    comm_qty decimal(18,2) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    comm_batch_no int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_rkserk_precommand_1 on tb_rkserk_precommand (comm_batch_no);
commit;
