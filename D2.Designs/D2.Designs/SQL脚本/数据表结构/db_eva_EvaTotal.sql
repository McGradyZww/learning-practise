-- /**************************************************************************************/
-- 创建数据库【平台估值】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_eva DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_eva_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：平台估值_估值汇总_估值产品费用表
use db_eva;
DROP TABLE IF EXISTS tb_evatotal_pd_fee_total;
CREATE TABLE tb_evatotal_pd_fee_total (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_fee_type int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    pd_net_asset decimal(18,4) NOT NULL ,
    confirm_apply decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    manual_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evatotal_pd_fee_total_1 on tb_evatotal_pd_fee_total (co_no,pd_no,pd_fee_type,init_date,crncy_type);
create index idx_tb_evatotal_pd_fee_total_2 on tb_evatotal_pd_fee_total (init_date);

-- 创建数据表：历史_平台估值_估值汇总_估值产品费用表
use db_eva_his;
DROP TABLE IF EXISTS tb_evatotal_pd_fee_total_his;
CREATE TABLE tb_evatotal_pd_fee_total_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_fee_type int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    pd_net_asset decimal(18,4) NOT NULL ,
    confirm_apply decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    manual_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evatotal_pd_fee_total_his_1 on tb_evatotal_pd_fee_total_his (co_no,pd_no,pd_fee_type,init_date,crncy_type);
create index idx_tb_evatotal_pd_fee_total_his_2 on tb_evatotal_pd_fee_total_his (init_date);

-- 创建数据表：平台估值_估值汇总_估值产品交易组费用表
use db_eva;
DROP TABLE IF EXISTS tb_evatotal_pd_exgp_fee_total;
CREATE TABLE tb_evatotal_pd_exgp_fee_total (
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
    pd_fee_type int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    pd_net_asset decimal(18,4) NOT NULL ,
    confirm_apply decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    manual_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evatotal_pd_exgp_fee_total_1 on tb_evatotal_pd_exgp_fee_total (co_no,pd_no,exch_group_no,pd_fee_type,init_date,crncy_type);
create index idx_tb_evatotal_pd_exgp_fee_total_2 on tb_evatotal_pd_exgp_fee_total (init_date,pd_no);

-- 创建数据表：历史_平台估值_估值汇总_估值产品交易组费用表
use db_eva_his;
DROP TABLE IF EXISTS tb_evatotal_pd_exgp_fee_total_his;
CREATE TABLE tb_evatotal_pd_exgp_fee_total_his (
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
    pd_fee_type int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    pd_net_asset decimal(18,4) NOT NULL ,
    confirm_apply decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    manual_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evatotal_pd_exgp_fee_total_his_1 on tb_evatotal_pd_exgp_fee_total_his (co_no,pd_no,exch_group_no,pd_fee_type,init_date,crncy_type);
create index idx_tb_evatotal_pd_exgp_fee_total_his_2 on tb_evatotal_pd_exgp_fee_total_his (init_date,pd_no);

-- 创建数据表：平台估值_估值汇总_估值产品利息表
use db_eva;
DROP TABLE IF EXISTS tb_evatotal_pd_interest_total;
CREATE TABLE tb_evatotal_pd_interest_total (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_rate_type int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    confirm_apply decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    manual_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evatotal_pd_interest_total_1 on tb_evatotal_pd_interest_total (co_no,pd_no,asset_acco,init_date);
create index idx_tb_evatotal_pd_interest_total_2 on tb_evatotal_pd_interest_total (init_date);

-- 创建数据表：历史_平台估值_估值汇总_估值产品利息表
use db_eva_his;
DROP TABLE IF EXISTS tb_evatotal_pd_interest_total_his;
CREATE TABLE tb_evatotal_pd_interest_total_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_rate_type int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    confirm_apply decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    manual_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evatotal_pd_interest_total_his_1 on tb_evatotal_pd_interest_total_his (co_no,pd_no,asset_acco,init_date);
create index idx_tb_evatotal_pd_interest_total_his_2 on tb_evatotal_pd_interest_total_his (init_date);

-- 创建数据表：平台估值_估值汇总_估值产品交易组利息表
use db_eva;
DROP TABLE IF EXISTS tb_evatotal_pd_exgp_interest_total;
CREATE TABLE tb_evatotal_pd_exgp_interest_total (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_rate_type int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    exch_group_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    confirm_apply decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    manual_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evatotal_pd_exgp_interest_total_1 on tb_evatotal_pd_exgp_interest_total (co_no,pd_no,asset_acco,exch_group_no,init_date);
create index idx_tb_evatotal_pd_exgp_interest_total_2 on tb_evatotal_pd_exgp_interest_total (init_date);

-- 创建数据表：历史_平台估值_估值汇总_估值产品交易组利息表
use db_eva_his;
DROP TABLE IF EXISTS tb_evatotal_pd_exgp_interest_total_his;
CREATE TABLE tb_evatotal_pd_exgp_interest_total_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_rate_type int NOT NULL ,
    asset_acco varchar(16) NOT NULL ,
    exch_group_no int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    begin_amt decimal(18,4) NOT NULL ,
    curr_amt decimal(18,4) NOT NULL ,
    intrst_base_amt decimal(18,4) NOT NULL ,
    confirm_apply decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    manual_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evatotal_pd_exgp_interest_total_his_1 on tb_evatotal_pd_exgp_interest_total_his (co_no,pd_no,asset_acco,exch_group_no,init_date);
create index idx_tb_evatotal_pd_exgp_interest_total_his_2 on tb_evatotal_pd_exgp_interest_total_his (init_date);

-- 创建数据表：平台估值_估值汇总_估值产品资产信息表
use db_eva;
DROP TABLE IF EXISTS tb_evatotal_product_asset_info;
CREATE TABLE tb_evatotal_product_asset_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_curr_share decimal(18,2) NOT NULL ,
    total_asset decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    cash_bala decimal(18,4) NOT NULL ,
    acco_cash decimal(18,4) NOT NULL ,
    stock_market_value decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    option_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    accumulative_receivable decimal(18,4) NOT NULL ,
    accumulative_payable decimal(18,4) NOT NULL ,
    apply_amt decimal(18,4) NOT NULL ,
    redemp_amt decimal(18,4) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    total_cash_divide decimal(18,4) NOT NULL ,
    total_unit_nav decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evatotal_product_asset_info_1 on tb_evatotal_product_asset_info (init_date,co_no,pd_no);
create index idx_tb_evatotal_product_asset_info_2 on tb_evatotal_product_asset_info (co_no);

-- 创建数据表：历史_平台估值_估值汇总_估值产品资产信息表
use db_eva_his;
DROP TABLE IF EXISTS tb_evatotal_product_asset_info_his;
CREATE TABLE tb_evatotal_product_asset_info_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_curr_share decimal(18,2) NOT NULL ,
    total_asset decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    cash_bala decimal(18,4) NOT NULL ,
    acco_cash decimal(18,4) NOT NULL ,
    stock_market_value decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    option_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    accumulative_receivable decimal(18,4) NOT NULL ,
    accumulative_payable decimal(18,4) NOT NULL ,
    apply_amt decimal(18,4) NOT NULL ,
    redemp_amt decimal(18,4) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    total_cash_divide decimal(18,4) NOT NULL ,
    total_unit_nav decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evatotal_product_asset_info_his_1 on tb_evatotal_product_asset_info_his (init_date,co_no,pd_no);
create index idx_tb_evatotal_product_asset_info_his_2 on tb_evatotal_product_asset_info_his (co_no);

-- 创建数据表：平台估值_估值汇总_估值产品交易组资产信息表
use db_eva;
DROP TABLE IF EXISTS tb_evatotal_product_exgp_asset_info;
CREATE TABLE tb_evatotal_product_exgp_asset_info (
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
    pd_curr_share decimal(18,2) NOT NULL ,
    total_asset decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    cash_bala decimal(18,4) NOT NULL ,
    acco_cash decimal(18,4) NOT NULL ,
    stock_market_value decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    option_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    accumulative_receivable decimal(18,4) NOT NULL ,
    accumulative_payable decimal(18,4) NOT NULL ,
    apply_amt decimal(18,4) NOT NULL ,
    redemp_amt decimal(18,4) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    total_cash_divide decimal(18,4) NOT NULL ,
    total_unit_nav decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evatotal_product_exgp_asset_info_1 on tb_evatotal_product_exgp_asset_info (init_date,co_no,pd_no,exch_group_no);

-- 创建数据表：历史_平台估值_估值汇总_估值产品交易组资产信息表
use db_eva_his;
DROP TABLE IF EXISTS tb_evatotal_product_exgp_asset_info_his;
CREATE TABLE tb_evatotal_product_exgp_asset_info_his (
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
    pd_curr_share decimal(18,2) NOT NULL ,
    total_asset decimal(18,4) NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    cash_bala decimal(18,4) NOT NULL ,
    acco_cash decimal(18,4) NOT NULL ,
    stock_market_value decimal(18,4) NOT NULL ,
    fund_asset decimal(18,4) NOT NULL ,
    bond_asset decimal(18,4) NOT NULL ,
    futu_asset decimal(18,4) NOT NULL ,
    option_asset decimal(18,4) NOT NULL ,
    other_asset decimal(18,4) NOT NULL ,
    accumulative_receivable decimal(18,4) NOT NULL ,
    accumulative_payable decimal(18,4) NOT NULL ,
    apply_amt decimal(18,4) NOT NULL ,
    redemp_amt decimal(18,4) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    total_cash_divide decimal(18,4) NOT NULL ,
    total_unit_nav decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evatotal_product_exgp_asset_info_his_1 on tb_evatotal_product_exgp_asset_info_his (init_date,co_no,pd_no,exch_group_no);

-- 创建数据表：平台估值_估值汇总_估值产品费用流水表
use db_eva;
DROP TABLE IF EXISTS tb_evatotal_product_fee_jour;
CREATE TABLE tb_evatotal_product_fee_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_fee_type int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evatotal_product_fee_jour_1 on tb_evatotal_product_fee_jour (init_date,co_no,pd_no,pd_fee_type,crncy_type);

-- 创建数据表：平台估值_估值汇总_估值产品利息流水表
use db_eva;
DROP TABLE IF EXISTS tb_evatotal_pd_interest_jour;
CREATE TABLE tb_evatotal_pd_interest_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_rate_type int NOT NULL ,
    crncy_type varchar(3) NOT NULL ,
    occur_amt decimal(18,4) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evatotal_pd_interest_jour_1 on tb_evatotal_pd_interest_jour (init_date,co_no,pd_no,pd_rate_type,crncy_type);

-- 创建数据表：平台估值_估值汇总_估值产品增值税计算表
use db_eva;
DROP TABLE IF EXISTS tb_evatotal_pd_vat_calc;
CREATE TABLE tb_evatotal_pd_vat_calc (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    vat_loan decimal(18,4) NOT NULL ,
    calc_pay decimal(18,4) NOT NULL ,
    vat_pay_offset decimal(18,4) NOT NULL ,
    vat_transfer decimal(18,4) NOT NULL ,
    vat_pay_add decimal(18,4) NOT NULL ,
    calc_estimate decimal(18,4) NOT NULL ,
    vat_estimate_offset decimal(18,4) NOT NULL ,
    vat_estimate decimal(18,4) NOT NULL ,
    vat_estimate_add decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evatotal_pd_vat_calc_1 on tb_evatotal_pd_vat_calc (init_date,co_no,pd_no);

-- 创建数据表：平台估值_估值汇总_估值产品增值税成交计算表
use db_eva;
DROP TABLE IF EXISTS tb_evatotal_pd_vat_transcalc;
CREATE TABLE tb_evatotal_pd_vat_transcalc (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    order_dir int NOT NULL ,
    strike_no varchar(64) NOT NULL ,
    strike_time int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    strike_price decimal(16,9) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    cost_price decimal(16,9) NOT NULL ,
    offset_qty decimal(18,2) NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_evatotal_pd_vat_transcalc_1 on tb_evatotal_pd_vat_transcalc (init_date,co_no,pd_no);

-- 创建数据表：平台估值_估值汇总_估值产品增值税成交汇总表
use db_eva;
DROP TABLE IF EXISTS tb_evatotal_pd_vat_transtotal;
CREATE TABLE tb_evatotal_pd_vat_transtotal (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    order_dir int NOT NULL ,
    stock_code varchar(6) NOT NULL ,
    strike_qty decimal(18,2) NOT NULL ,
    strike_amt decimal(18,4) NOT NULL ,
    all_fee decimal(18,4) NOT NULL ,
    cost_price decimal(16,9) NOT NULL ,
    offset_qty decimal(18,2) NOT NULL ,
    realize_pandl decimal(18,4) NOT NULL ,
    begin_qty decimal(18,2) NOT NULL ,
    deal_flag int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evatotal_pd_vat_transtotal_1 on tb_evatotal_pd_vat_transtotal (init_date,co_no,pd_no);

-- 创建数据表：平台估值_估值汇总_估值产品外部估值项目表
use db_eva;
DROP TABLE IF EXISTS tb_evatotal_pd_asset_check;
CREATE TABLE tb_evatotal_pd_asset_check (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    fina_acco_code varchar(64) NOT NULL ,
    fina_acco_name varchar(64) NOT NULL ,
    amount varchar(32) NOT NULL ,
    unit_cost varchar(32) NOT NULL ,
    prime_cost varchar(32) NOT NULL ,
    cost_net_ratio varchar(32) NOT NULL ,
    market_price varchar(32) NOT NULL ,
    market_value varchar(32) NOT NULL ,
    market_net_ratio varchar(32) NOT NULL ,
    evalu_add_value decimal(18,4) NOT NULL ,
    evalu_add_str varchar(64) NOT NULL ,
    stop_info varchar(32) NOT NULL ,
    rights_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evatotal_pd_asset_check_1 on tb_evatotal_pd_asset_check (init_date,co_no,pd_no,fina_acco_code);

-- 创建数据表：平台估值_估值汇总_估值产品估值核对项目表
use db_eva;
DROP TABLE IF EXISTS tb_evatotal_pd_fina_value;
CREATE TABLE tb_evatotal_pd_fina_value (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    fina_acco_code varchar(64) NOT NULL ,
    fina_acco_name varchar(64) NOT NULL ,
    eva_check_type int NOT NULL ,
    amount varchar(32) NOT NULL ,
    prime_cost varchar(32) NOT NULL ,
    market_price varchar(32) NOT NULL ,
    market_value varchar(32) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evatotal_pd_fina_value_1 on tb_evatotal_pd_fina_value (init_date,co_no,pd_no,fina_acco_code);

-- 创建数据表：平台估值_估值汇总_估值产品累计净值计算表
use db_eva;
DROP TABLE IF EXISTS tb_evatotal_pd_totalnet_calc;
CREATE TABLE tb_evatotal_pd_totalnet_calc (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    nav_asset decimal(18,4) NOT NULL ,
    pd_curr_share decimal(18,2) NOT NULL ,
    unit_nav decimal(18,4) NOT NULL ,
    cash_coeffi decimal(18,12) NOT NULL ,
    share_coeffi decimal(18,12) NOT NULL ,
    total_unit_nav decimal(18,4) NOT NULL ,
    net_prefee_coeffi decimal(18,12) NOT NULL ,
    pre_fee_share_net_total decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evatotal_pd_totalnet_calc_1 on tb_evatotal_pd_totalnet_calc (init_date,co_no,pd_no);

-- 创建数据表：平台估值_估值汇总_估值产品估值表资产项目表
use db_eva;
DROP TABLE IF EXISTS tb_evatotal_pd_fina_asset_info;
CREATE TABLE tb_evatotal_pd_fina_asset_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    eva_pd_curr_share varchar(32) NOT NULL ,
    eva_nav_asset varchar(32) NOT NULL ,
    eva_unit_nav varchar(32) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_evatotal_pd_fina_asset_info_1 on tb_evatotal_pd_fina_asset_info (init_date,co_no,pd_no);
commit;
