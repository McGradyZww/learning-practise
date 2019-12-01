DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查批量基金转换市场状态权限身份
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckBatchFundTransMarketStatusAuthOper;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckBatchFundTransMarketStatusAuthOper(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_no_str varchar(2048),
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_stock_code_str varchar(4096),
    IN p_target_stock_code_str varchar(4096),
    IN p_order_dir_str varchar(1024),
    IN p_order_qty_str varchar(4096),
    IN p_price_type_str varchar(2048),
    IN p_split_str varchar(4),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_stock_code_no_str varchar(4096),
    OUT p_target_stock_code_no_str varchar(4096),
    OUT p_stock_type_str varchar(2048),
    OUT p_asset_type_str varchar(2048),
    OUT p_crncy_type_str varchar(2048),
    OUT p_exch_crncy_type_str varchar(2048),
    OUT p_buy_ref_rate_str varchar(2048),
    OUT p_sell_ref_rate_str varchar(2048),
    OUT p_par_value_str varchar(4096),
    OUT p_impawn_ratio_str varchar(4096),
    OUT p_net_price_flag_str varchar(2048),
    OUT p_intrst_days_str varchar(2048),
    OUT p_bond_rate_type_str varchar(4096),
    OUT p_bond_accr_intrst_str varchar(4096),
    OUT p_target_code_no_str varchar(4096),
    OUT p_target_code_str varchar(2048),
    OUT p_target_code_stock_type_str varchar(2048),
    OUT p_target_code_asset_type_str varchar(2048),
    OUT p_trade_code_no_str varchar(4096),
    OUT p_trade_code_str varchar(2048),
    OUT p_trade_code_stock_type_str varchar(2048),
    OUT p_trade_code_asset_type_str varchar(2048),
    OUT p_min_unit_str varchar(2048),
    OUT p_up_limit_price_str varchar(4096),
    OUT p_down_limit_price_str varchar(4096),
    OUT p_last_price_str varchar(4096),
    OUT p_capit_reback_days_str varchar(2048),
    OUT p_posi_reback_days_str varchar(2048),
    OUT p_subscription_trade_mark_str varchar(4096),
    OUT p_purchase_trade_mark_str varchar(4096),
    OUT p_rede_trade_mark_str varchar(4096),
    OUT p_first_minimum_amt_str varchar(4096),
    OUT p_minimum_purchase_amt_str varchar(4096),
    OUT p_minimum_subscription_amt_str varchar(4096),
    OUT p_minimum_rede_share_str varchar(4096),
    OUT p_minimum_holding_share_str varchar(4096),
    OUT p_minimum_turning_out_share_str varchar(4096),
    OUT p_fund_manager_str varchar(4096),
    OUT p_charging_method_str varchar(4096),
    OUT p_registration_agency_str varchar(4096),
    OUT p_target_subscrip_trade_mark_str varchar(4096),
    OUT p_target_purchase_trade_mark_str varchar(4096),
    OUT p_target_rede_trade_mark_str varchar(4096),
    OUT p_target_first_minimum_amt_str varchar(4096),
    OUT p_target_min_purchase_amt_str varchar(4096),
    OUT p_target_min_subscrip_amt_str varchar(4096),
    OUT p_target_min_rede_share_str varchar(4096),
    OUT p_target_min_holding_share_str varchar(4096),
    OUT p_target_min_turning_out_share_str varchar(4096),
    OUT p_target_fund_manager_str varchar(4096),
    OUT p_target_charging_method_str varchar(4096),
    OUT p_trade_acco varchar(32),
    OUT p_target_registration_agency_str varchar(4096),
    OUT p_sys_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_exch_no_str varchar(2048);
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_stock_code_str varchar(4096);
    declare v_target_stock_code_str varchar(4096);
    declare v_order_dir_str varchar(1024);
    declare v_order_qty_str varchar(4096);
    declare v_price_type_str varchar(2048);
    declare v_split_str varchar(4);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_exgp_busi_config_str varchar(64);
    declare v_stock_code_no_str varchar(4096);
    declare v_target_stock_code_no_str varchar(4096);
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
    declare v_crncy_type_str varchar(2048);
    declare v_exch_crncy_type_str varchar(2048);
    declare v_buy_ref_rate_str varchar(2048);
    declare v_sell_ref_rate_str varchar(2048);
    declare v_par_value_str varchar(4096);
    declare v_impawn_ratio_str varchar(4096);
    declare v_net_price_flag_str varchar(2048);
    declare v_intrst_days_str varchar(2048);
    declare v_bond_rate_type_str varchar(4096);
    declare v_bond_accr_intrst_str varchar(4096);
    declare v_target_code_no_str varchar(4096);
    declare v_target_code_str varchar(2048);
    declare v_target_code_stock_type_str varchar(2048);
    declare v_target_code_asset_type_str varchar(2048);
    declare v_trade_code_no_str varchar(4096);
    declare v_trade_code_str varchar(2048);
    declare v_trade_code_stock_type_str varchar(2048);
    declare v_trade_code_asset_type_str varchar(2048);
    declare v_min_unit_str varchar(2048);
    declare v_up_limit_price_str varchar(4096);
    declare v_down_limit_price_str varchar(4096);
    declare v_last_price_str varchar(4096);
    declare v_capit_reback_days_str varchar(2048);
    declare v_posi_reback_days_str varchar(2048);
    declare v_subscription_trade_mark_str varchar(4096);
    declare v_purchase_trade_mark_str varchar(4096);
    declare v_rede_trade_mark_str varchar(4096);
    declare v_first_minimum_amt_str varchar(4096);
    declare v_minimum_purchase_amt_str varchar(4096);
    declare v_minimum_subscription_amt_str varchar(4096);
    declare v_minimum_rede_share_str varchar(4096);
    declare v_minimum_holding_share_str varchar(4096);
    declare v_minimum_turning_out_share_str varchar(4096);
    declare v_fund_manager_str varchar(4096);
    declare v_charging_method_str varchar(4096);
    declare v_registration_agency_str varchar(4096);
    declare v_target_subscrip_trade_mark_str varchar(4096);
    declare v_target_purchase_trade_mark_str varchar(4096);
    declare v_target_rede_trade_mark_str varchar(4096);
    declare v_target_first_minimum_amt_str varchar(4096);
    declare v_target_min_purchase_amt_str varchar(4096);
    declare v_target_min_subscrip_amt_str varchar(4096);
    declare v_target_min_rede_share_str varchar(4096);
    declare v_target_min_holding_share_str varchar(4096);
    declare v_target_min_turning_out_share_str varchar(4096);
    declare v_target_fund_manager_str varchar(4096);
    declare v_target_charging_method_str varchar(4096);
    declare v_trade_acco varchar(32);
    declare v_target_registration_agency_str varchar(4096);
    declare v_sys_config_str varchar(64);
    declare v_order_price_str varchar(4096);
    declare v_comm_qty_str varchar(4096);
    declare v_tmp_exch_no_str varchar(2048);
    declare v_tmp_stock_type_str varchar(2048);
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_target_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_target_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;
    declare v_trade_code_no int;
    declare v_trade_code varchar(6);
    declare v_trade_code_stock_type int;
    declare v_trade_code_asset_type int;
    declare v_bond_qty_unit_set int;
    declare v_apply_date int;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_minimum_turning_out_share decimal(18,2);
    declare v_fund_manager varchar(64);
    declare v_charging_method int;
    declare v_registration_agency varchar(32);
    declare v_target_subscription_trade_mark int;
    declare v_target_purchase_trade_mark int;
    declare v_target_rede_trade_mark int;
    declare v_target_first_minimum_amt decimal(18,4);
    declare v_target_minimum_purchase_amt decimal(18,4);
    declare v_target_minimum_subscription_amt decimal(18,4);
    declare v_target_minimum_rede_share decimal(18,2);
    declare v_target_minimum_holding_share decimal(18,2);
    declare v_target_minimum_turning_out_share decimal(18,2);
    declare v_target_fund_manager varchar(64);
    declare v_target_charging_method int;
    declare v_target_registration_agency varchar(32);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_trade_date int;
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_target_opor_no int;
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code_str = p_stock_code_str;
    SET v_target_stock_code_str = p_target_stock_code_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_qty_str = p_order_qty_str;
    SET v_price_type_str = p_price_type_str;
    SET v_split_str = p_split_str;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_stock_code_no_str = " ";
    SET v_target_stock_code_no_str = " ";
    SET v_stock_type_str = " ";
    SET v_asset_type_str = " ";
    SET v_crncy_type_str = " ";
    SET v_exch_crncy_type_str = " ";
    SET v_buy_ref_rate_str = " ";
    SET v_sell_ref_rate_str = " ";
    SET v_par_value_str = " ";
    SET v_impawn_ratio_str = " ";
    SET v_net_price_flag_str = " ";
    SET v_intrst_days_str = " ";
    SET v_bond_rate_type_str = " ";
    SET v_bond_accr_intrst_str = " ";
    SET v_target_code_no_str = " ";
    SET v_target_code_str = " ";
    SET v_target_code_stock_type_str = " ";
    SET v_target_code_asset_type_str = " ";
    SET v_trade_code_no_str = " ";
    SET v_trade_code_str = " ";
    SET v_trade_code_stock_type_str = " ";
    SET v_trade_code_asset_type_str = " ";
    SET v_min_unit_str = " ";
    SET v_up_limit_price_str = " ";
    SET v_down_limit_price_str = " ";
    SET v_last_price_str = " ";
    SET v_capit_reback_days_str = " ";
    SET v_posi_reback_days_str = " ";
    SET v_subscription_trade_mark_str = " ";
    SET v_purchase_trade_mark_str = " ";
    SET v_rede_trade_mark_str = " ";
    SET v_first_minimum_amt_str = " ";
    SET v_minimum_purchase_amt_str = " ";
    SET v_minimum_subscription_amt_str = " ";
    SET v_minimum_rede_share_str = " ";
    SET v_minimum_holding_share_str = " ";
    SET v_minimum_turning_out_share_str = " ";
    SET v_fund_manager_str = " ";
    SET v_charging_method_str = " ";
    SET v_registration_agency_str = " ";
    SET v_target_subscrip_trade_mark_str = " ";
    SET v_target_purchase_trade_mark_str = " ";
    SET v_target_rede_trade_mark_str = " ";
    SET v_target_first_minimum_amt_str = " ";
    SET v_target_min_purchase_amt_str = " ";
    SET v_target_min_subscrip_amt_str = " ";
    SET v_target_min_rede_share_str = " ";
    SET v_target_min_holding_share_str = " ";
    SET v_target_min_turning_out_share_str = " ";
    SET v_target_fund_manager_str = " ";
    SET v_target_charging_method_str = " ";
    SET v_trade_acco = " ";
    SET v_target_registration_agency_str = " ";
    SET v_sys_config_str = " ";
    SET v_order_price_str = " ";
    SET v_comm_qty_str = " ";
    SET v_tmp_exch_no_str = " ";
    SET v_tmp_stock_type_str = " ";
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_stock_code = " ";
    SET v_exch_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_price_type = 0;
    SET v_target_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_target_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;
    SET v_min_unit = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_target_code_no = 0;
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_trade_code = " ";
    SET v_trade_code_stock_type = 0;
    SET v_trade_code_asset_type = 0;
    SET v_bond_qty_unit_set = 0;
    SET v_apply_date = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_minimum_turning_out_share = 0;
    SET v_fund_manager = " ";
    SET v_charging_method = 0;
    SET v_registration_agency = " ";
    SET v_target_subscription_trade_mark = 0;
    SET v_target_purchase_trade_mark = 0;
    SET v_target_rede_trade_mark = 0;
    SET v_target_first_minimum_amt = 0;
    SET v_target_minimum_purchase_amt = 0;
    SET v_target_minimum_subscription_amt = 0;
    SET v_target_minimum_rede_share = 0;
    SET v_target_minimum_holding_share = 0;
    SET v_target_minimum_turning_out_share = 0;
    SET v_target_fund_manager = " ";
    SET v_target_charging_method = 0;
    SET v_target_registration_agency = " ";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_target_opor_no = 0;
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";
    SET v_opor_rights = 0;

    
    label_pro:BEGIN
    

    /* set @订单价格串# = ""; */
    set v_order_price_str = "";

    /* set @本币币种串# = ""; */
    set v_crncy_type_str = "";

    /* set @交易币种串# = ""; */
    set v_exch_crncy_type_str = "";

    /* set @买入参考汇率串# = ""; */
    set v_buy_ref_rate_str = "";

    /* set @卖出参考汇率串# = ""; */
    set v_sell_ref_rate_str = "";

    /* set @证券代码编号串# = ""; */
    set v_stock_code_no_str = "";

    /* set @证券类型串# = ""; */
    set v_stock_type_str = "";

    /* set @资产类型串# = ""; */
    set v_asset_type_str = "";

    /* set @净价标志串# = ""; */
    set v_net_price_flag_str = "";

    /* set @票面面值串# = ""; */
    set v_par_value_str = "";

    /* set @质押比例串# = ""; */
    set v_impawn_ratio_str = "";

    /* set @计息天数串# = ""; */
    set v_intrst_days_str = "";

    /* set @债券利率类型串# = ""; */
    set v_bond_rate_type_str = "";

    /* set @债券计提利息串# = ""; */
    set v_bond_accr_intrst_str = "";

    /* set @标的代码编号串# = ""; */
    set v_target_code_no_str = "";

    /* set @标的代码串# = ""; */
    set v_target_code_str = "";

    /* set @标的代码证券类型串# = ""; */
    set v_target_code_stock_type_str = "";

    /* set @标的代码资产类型串# = ""; */
    set v_target_code_asset_type_str = "";

    /* set @交易代码编号串# = ""; */
    set v_trade_code_no_str = "";

    /* set @交易代码串# = ""; */
    set v_trade_code_str = "";

    /* set @交易代码证券类型串# = ""; */
    set v_trade_code_stock_type_str = "";

    /* set @交易代码资产类型串# = ""; */
    set v_trade_code_asset_type_str = "";

    /* set @最小单位串# = ""; */
    set v_min_unit_str = "";

    /* set @涨停价串# = ""; */
    set v_up_limit_price_str = "";

    /* set @跌停价串# = ""; */
    set v_down_limit_price_str = "";

    /* set @最新价串# = ""; */
    set v_last_price_str = "";

    /* set @资金回转天数串# = ""; */
    set v_capit_reback_days_str = "";

    /* set @持仓回转天数串# = ""; */
    set v_posi_reback_days_str = "";

    /* set @订单价格串# = ""; */
    set v_order_price_str = "";

    /* set @指令数量串# = ""; */
    set v_comm_qty_str = "";

    /* set @认购交易标志串#=""; */
    set v_subscription_trade_mark_str="";

    /* set @申购交易标志串#=""; */
    set v_purchase_trade_mark_str="";

    /* set @赎回交易标志串#=""; */
    set v_rede_trade_mark_str="";

    /* set @首次最低金额串#=""; */
    set v_first_minimum_amt_str="";

    /* set @最低申购金额串#=""; */
    set v_minimum_purchase_amt_str="";

    /* set @最低认购金额串#=""; */
    set v_minimum_subscription_amt_str="";

    /* set @最低赎回份额串#=""; */
    set v_minimum_rede_share_str="";

    /* set @最低持有份额串#=""; */
    set v_minimum_holding_share_str="";

    /* set @最低转出份额串#=""; */
    set v_minimum_turning_out_share_str="";

    /* set @基金管理人串#=""; */
    set v_fund_manager_str="";

    /* set @收费方式串#=""; */
    set v_charging_method_str="";

    /* set @登记机构串# = ""; */
    set v_registration_agency_str = "";

    /* set @目标认购交易标志串#=""; */
    set v_target_subscrip_trade_mark_str="";

    /* set @目标申购交易标志串#=""; */
    set v_target_purchase_trade_mark_str="";

    /* set @目标赎回交易标志串#=""; */
    set v_target_rede_trade_mark_str="";

    /* set @目标首次最低金额串#=""; */
    set v_target_first_minimum_amt_str="";

    /* set @目标最低申购金额串#=""; */
    set v_target_min_purchase_amt_str="";

    /* set @目标最低认购金额串#=""; */
    set v_target_min_subscrip_amt_str="";

    /* set @目标最低赎回份额串#=""; */
    set v_target_min_rede_share_str="";

    /* set @目标最低持有份额串#=""; */
    set v_target_min_holding_share_str="";

    /* set @目标最低转出份额串#=""; */
    set v_target_min_turning_out_share_str="";

    /* set @目标基金管理人串#=""; */
    set v_target_fund_manager_str="";

    /* set @目标收费方式串#=""; */
    set v_target_charging_method_str="";

    /* set @目标证券代码编号串#=""; */
    set v_target_stock_code_no_str="";

    /* set @目标登记机构串# = ""; */
    set v_target_registration_agency_str = "";

    /* set @临时_市场编号串# = ""; */
    set v_tmp_exch_no_str = "";

    /* set @临时_证券类型串# = ""; */
    set v_tmp_stock_type_str = "";

    /* if @分隔符# = ' ' then */
    if v_split_str = ' ' then

        /* set @分隔符#= ';'; */
        set v_split_str= ';';
    end if;

    /* 调用【原子_公共_交易接口_检查交易系统状态权限】*/
    call db_pub.pra_trdif_CheckTrdSysStatusAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_init_date,
        v_co_busi_config_str,
        v_allow_exch,
        v_allow_stock_type,
        v_sys_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易系统状态权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* while LOCATE(@分隔符#,@证券代码串#) <>0   do */
    while LOCATE(v_split_str,v_stock_code_str) <>0   do
        #截取前面每一位

        /* set @证券代码#=substring(@证券代码串#,1,LOCATE(@分隔符#,@证券代码串#)-1); */
        set v_stock_code=substring(v_stock_code_str,1,LOCATE(v_split_str,v_stock_code_str)-1);

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

        /* set @订单方向#=cast(substring(@订单方向串#,1,LOCATE(@分隔符#,@订单方向串#)-1) as SIGNED); */
        set v_order_dir=cast(substring(v_order_dir_str,1,LOCATE(v_split_str,v_order_dir_str)-1) as SIGNED);

        /* set @订单价格#=cast(substring(@订单价格串#,1,LOCATE(@分隔符#,@订单价格串#)-1) as decimal(16,9)); */
        set v_order_price=cast(substring(v_order_price_str,1,LOCATE(v_split_str,v_order_price_str)-1) as decimal(16,9));

        /* set @订单数量#=cast(substring(@订单数量串#,1,LOCATE(@分隔符#,@订单数量串#)-1) as decimal(18,2)); */
        set v_order_qty=cast(substring(v_order_qty_str,1,LOCATE(v_split_str,v_order_qty_str)-1) as decimal(18,2));

        /* set @价格类型#=cast(substring(@价格类型串#,1,LOCATE(@分隔符#,@价格类型串#)-1) as decimal(18,2)); */
        set v_price_type=cast(substring(v_price_type_str,1,LOCATE(v_split_str,v_price_type_str)-1) as decimal(18,2));
        #set @目标证券代码#=substring(@目标证券代码串#,1,LOCATE(@分隔符#,@目标证券代码串#)-1);

        /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][56][@市场编号#,@允许投资市场#] */
        if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
            
            SET v_error_code = "pubT.25.8.56";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
            end if;
            leave label_pro;
        end if;

        #如果目标证券代码串有值,那就说明做的是基金的转换,没有值就是基金申赎

        /* if LOCATE(@分隔符#,@目标证券代码串#) <>0 then */
        if LOCATE(v_split_str,v_target_stock_code_str) <>0 then

            /* set @目标证券代码#=substring(@目标证券代码串#,1,LOCATE(@分隔符#,@目标证券代码串#)-1); */
            set v_target_stock_code=substring(v_target_stock_code_str,1,LOCATE(v_split_str,v_target_stock_code_str)-1);
        else

            /* set @目标证券代码#=" "; */
            set v_target_stock_code=" ";
        end if;

        /* 调用【原子_公共_交易接口_批量检查基金转换交易业务属性】*/
        call db_pub.pra_trdif_BatchCheckFundTransExchProp(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_target_stock_code,
            v_order_dir,
            v_order_qty,
            v_price_type,
            v_error_code,
            v_error_info,
            v_stock_code_no,
            v_target_stock_code_no,
            v_stock_type,
            v_asset_type,
            v_crncy_type,
            v_exch_crncy_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_par_value,
            v_impawn_ratio,
            v_net_price_flag,
            v_intrst_days,
            v_bond_rate_type,
            v_bond_accr_intrst,
            v_min_unit,
            v_up_limit_price,
            v_down_limit_price,
            v_last_price,
            v_target_code_no,
            v_target_code,
            v_target_code_stock_type,
            v_target_code_asset_type,
            v_trade_code_no,
            v_trade_code,
            v_trade_code_stock_type,
            v_trade_code_asset_type,
            v_bond_qty_unit_set,
            v_apply_date,
            v_subscription_trade_mark,
            v_purchase_trade_mark,
            v_rede_trade_mark,
            v_first_minimum_amt,
            v_minimum_purchase_amt,
            v_minimum_subscription_amt,
            v_minimum_rede_share,
            v_minimum_holding_share,
            v_minimum_turning_out_share,
            v_fund_manager,
            v_charging_method,
            v_registration_agency,
            v_target_subscription_trade_mark,
            v_target_purchase_trade_mark,
            v_target_rede_trade_mark,
            v_target_first_minimum_amt,
            v_target_minimum_purchase_amt,
            v_target_minimum_subscription_amt,
            v_target_minimum_rede_share,
            v_target_minimum_holding_share,
            v_target_minimum_turning_out_share,
            v_target_fund_manager,
            v_target_charging_method,
            v_target_registration_agency);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.8.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_批量检查基金转换交易业务属性出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][57][@证券类型#,@允许操作证券类型#] */
        if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
            
            SET v_error_code = "pubT.25.8.57";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
            end if;
            leave label_pro;
        end if;


        /* set @本币币种串#  = concat(@本币币种串#,@本币币种#,";"); */
        set v_crncy_type_str  = concat(v_crncy_type_str,v_crncy_type,";");

        /* set @交易币种串#  = concat(@交易币种串#,@交易币种#,";"); */
        set v_exch_crncy_type_str  = concat(v_exch_crncy_type_str,v_exch_crncy_type,";");

        /* 调用【原子_公共_交易接口_检查交易市场状态】*/
        call db_pub.pra_trdif_CheckTrdMarketStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_exch_no,
            v_error_code,
            v_error_info,
            v_init_date,
            v_buy_ref_rate,
            v_sell_ref_rate);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.8.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易市场状态出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

        #if LOCATE(@分隔符#,@目标证券代码串#) <>0

            /* set @目标证券代码编号串#  = concat(@目标证券代码编号串#,@目标证券代码编号#,";"); */
            set v_target_stock_code_no_str  = concat(v_target_stock_code_no_str,v_target_stock_code_no,";");
        #end if;
        #交易组级，订单方向检查。Modify by wjp 20190428

        /* 调用【原子_公共_用户_检查交易组限制信息】*/
        call db_pub.pra_user_CheckExchGroupLimitInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_group_no,
            v_order_dir,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.8.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组限制信息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @买入参考汇率串#  = concat(@买入参考汇率串#,@买入参考汇率#,";"); */
        set v_buy_ref_rate_str  = concat(v_buy_ref_rate_str,v_buy_ref_rate,";");

        /* set @卖出参考汇率串#  = concat(@卖出参考汇率串#,@卖出参考汇率#,";"); */
        set v_sell_ref_rate_str  = concat(v_sell_ref_rate_str,v_sell_ref_rate,";");

        /* set @证券代码编号串#  = concat(@证券代码编号串#,@证券代码编号#,";"); */
        set v_stock_code_no_str  = concat(v_stock_code_no_str,v_stock_code_no,";");

        /* set @证券类型串#  = concat(@证券类型串#,@证券类型#,";"); */
        set v_stock_type_str  = concat(v_stock_type_str,v_stock_type,";");

        /* set @资产类型串#  = concat(@资产类型串#,@资产类型#,";"); */
        set v_asset_type_str  = concat(v_asset_type_str,v_asset_type,";");

        /* set @净价标志串#  = concat(@净价标志串#,@净价标志#,";"); */
        set v_net_price_flag_str  = concat(v_net_price_flag_str,v_net_price_flag,";");

        /* set @票面面值串#  = concat(@票面面值串#,@票面面值#,";"); */
        set v_par_value_str  = concat(v_par_value_str,v_par_value,";");

        /* set @质押比例串#  = concat(@质押比例串#,@质押比例#,";"); */
        set v_impawn_ratio_str  = concat(v_impawn_ratio_str,v_impawn_ratio,";");

        /* set @计息天数串#  = concat(@计息天数串#,@计息天数#,";"); */
        set v_intrst_days_str  = concat(v_intrst_days_str,v_intrst_days,";");

        /* set @债券利率类型串#  = concat(@债券利率类型串#,@债券利率类型#,";"); */
        set v_bond_rate_type_str  = concat(v_bond_rate_type_str,v_bond_rate_type,";");

        /* set @债券计提利息串#  = concat(@债券计提利息串#,@债券计提利息#,";"); */
        set v_bond_accr_intrst_str  = concat(v_bond_accr_intrst_str,v_bond_accr_intrst,";");

        /* set @标的代码编号串#  = concat(@标的代码编号串#,@标的代码编号#,";"); */
        set v_target_code_no_str  = concat(v_target_code_no_str,v_target_code_no,";");

        /* set @标的代码串#  = concat(@标的代码串#,@标的代码#,";"); */
        set v_target_code_str  = concat(v_target_code_str,v_target_code,";");

        /* set @标的代码证券类型串#  = concat(@标的代码证券类型串#,@标的代码证券类型#,";"); */
        set v_target_code_stock_type_str  = concat(v_target_code_stock_type_str,v_target_code_stock_type,";");

        /* set @标的代码资产类型串#  = concat(@标的代码资产类型串#,@标的代码资产类型#,";"); */
        set v_target_code_asset_type_str  = concat(v_target_code_asset_type_str,v_target_code_asset_type,";");

        /* set @交易代码编号串#  = concat(@交易代码编号串#,@交易代码编号#,";"); */
        set v_trade_code_no_str  = concat(v_trade_code_no_str,v_trade_code_no,";");

        /* set @交易代码串#  = concat(@交易代码串#,@交易代码#,";"); */
        set v_trade_code_str  = concat(v_trade_code_str,v_trade_code,";");

        /* set @交易代码证券类型串#  = concat(@交易代码证券类型串#,@交易代码证券类型#,";"); */
        set v_trade_code_stock_type_str  = concat(v_trade_code_stock_type_str,v_trade_code_stock_type,";");

        /* set @交易代码资产类型串#  = concat(@交易代码资产类型串#,@交易代码资产类型#,";"); */
        set v_trade_code_asset_type_str  = concat(v_trade_code_asset_type_str,v_trade_code_asset_type,";");

        /* set @最小单位串#  = concat(@最小单位串#,@最小单位#,";"); */
        set v_min_unit_str  = concat(v_min_unit_str,v_min_unit,";");

        /* set @涨停价串#  = concat(@涨停价串#,@涨停价#,";"); */
        set v_up_limit_price_str  = concat(v_up_limit_price_str,v_up_limit_price,";");

        /* set @跌停价串#  = concat(@跌停价串#,@跌停价#,";"); */
        set v_down_limit_price_str  = concat(v_down_limit_price_str,v_down_limit_price,";");

        /* set @最新价串#  = concat(@最新价串#,@最新价#,";"); */
        set v_last_price_str  = concat(v_last_price_str,v_last_price,";");

        /* set @资金回转天数串#  = concat(@资金回转天数串#,@资金回转天数#,";"); */
        set v_capit_reback_days_str  = concat(v_capit_reback_days_str,v_capit_reback_days,";");

        /* set @持仓回转天数串#  = concat(@持仓回转天数串#,@持仓回转天数#,";"); */
        set v_posi_reback_days_str  = concat(v_posi_reback_days_str,v_posi_reback_days,";");

        /* set @认购交易标志串#=concat(@认购交易标志串#,@认购交易标志#,";"); */
        set v_subscription_trade_mark_str=concat(v_subscription_trade_mark_str,v_subscription_trade_mark,";");

        /* set @申购交易标志串#=concat(@申购交易标志串#,@申购交易标志#,";"); */
        set v_purchase_trade_mark_str=concat(v_purchase_trade_mark_str,v_purchase_trade_mark,";");

        /* set @赎回交易标志串#=concat(@赎回交易标志串#,@赎回交易标志#,";"); */
        set v_rede_trade_mark_str=concat(v_rede_trade_mark_str,v_rede_trade_mark,";");

        /* set @首次最低金额串#=concat(@首次最低金额串#,@首次最低金额#,";"); */
        set v_first_minimum_amt_str=concat(v_first_minimum_amt_str,v_first_minimum_amt,";");

        /* set @最低申购金额串#=concat(@最低申购金额串#,@最低申购金额#,";"); */
        set v_minimum_purchase_amt_str=concat(v_minimum_purchase_amt_str,v_minimum_purchase_amt,";");

        /* set @最低认购金额串#=concat(@最低认购金额串#,@最低认购金额#,";"); */
        set v_minimum_subscription_amt_str=concat(v_minimum_subscription_amt_str,v_minimum_subscription_amt,";");

        /* set @最低赎回份额串#=concat(@最低赎回份额串#,@最低赎回份额#,";"); */
        set v_minimum_rede_share_str=concat(v_minimum_rede_share_str,v_minimum_rede_share,";");

        /* set @最低持有份额串#=concat(@最低持有份额串#,@最低持有份额#,";"); */
        set v_minimum_holding_share_str=concat(v_minimum_holding_share_str,v_minimum_holding_share,";");

        /* set @最低转出份额串#=concat(@最低转出份额串#,@最低转出份额#,";"); */
        set v_minimum_turning_out_share_str=concat(v_minimum_turning_out_share_str,v_minimum_turning_out_share,";");

        /* set @基金管理人串#=concat(@基金管理人串#,@基金管理人#,";"); */
        set v_fund_manager_str=concat(v_fund_manager_str,v_fund_manager,";");

        /* set @收费方式串#=concat(@收费方式串#,@收费方式#,";"); */
        set v_charging_method_str=concat(v_charging_method_str,v_charging_method,";");

        /* set @登记机构串#=concat(@登记机构串#,@登记机构#,";"); */
        set v_registration_agency_str=concat(v_registration_agency_str,v_registration_agency,";");

        /* set @目标认购交易标志串#=concat(@目标认购交易标志串#,@目标认购交易标志#,";"); */
        set v_target_subscrip_trade_mark_str=concat(v_target_subscrip_trade_mark_str,v_target_subscription_trade_mark,";");

        /* set @目标申购交易标志串#=concat(@目标申购交易标志串#,@目标申购交易标志#,";"); */
        set v_target_purchase_trade_mark_str=concat(v_target_purchase_trade_mark_str,v_target_purchase_trade_mark,";");

        /* set @目标赎回交易标志串#=concat(@目标赎回交易标志串#,@目标赎回交易标志#,";"); */
        set v_target_rede_trade_mark_str=concat(v_target_rede_trade_mark_str,v_target_rede_trade_mark,";");

        /* set @目标首次最低金额串#=concat(@目标首次最低金额串#,@目标首次最低金额#,";"); */
        set v_target_first_minimum_amt_str=concat(v_target_first_minimum_amt_str,v_target_first_minimum_amt,";");

        /* set @目标最低申购金额串#=concat(@目标最低申购金额串#,@目标最低申购金额#,";"); */
        set v_target_min_purchase_amt_str=concat(v_target_min_purchase_amt_str,v_target_minimum_purchase_amt,";");

        /* set @目标最低认购金额串#=concat(@目标最低认购金额串#,@目标最低认购金额#,";"); */
        set v_target_min_subscrip_amt_str=concat(v_target_min_subscrip_amt_str,v_target_minimum_subscription_amt,";");

        /* set @目标最低赎回份额串#=concat(@目标最低赎回份额串#,@目标最低赎回份额#,";"); */
        set v_target_min_rede_share_str=concat(v_target_min_rede_share_str,v_target_minimum_rede_share,";");

        /* set @目标最低持有份额串#=concat(@目标最低持有份额串#,@目标最低持有份额#,";"); */
        set v_target_min_holding_share_str=concat(v_target_min_holding_share_str,v_target_minimum_holding_share,";");

        /* set @目标最低转出份额串#=concat(@目标最低转出份额串#,@目标最低转出份额#,";"); */
        set v_target_min_turning_out_share_str=concat(v_target_min_turning_out_share_str,v_target_minimum_turning_out_share,";");

        /* set @目标基金管理人串#=concat(@目标基金管理人串#,@目标基金管理人#,";"); */
        set v_target_fund_manager_str=concat(v_target_fund_manager_str,v_target_fund_manager,";");

        /* set @目标收费方式串#=concat(@目标收费方式串#,@目标收费方式#,";"); */
        set v_target_charging_method_str=concat(v_target_charging_method_str,v_target_charging_method,";");

        /* set @目标登记机构串#=concat(@目标登记机构串#,@目标登记机构#,";"); */
        set v_target_registration_agency_str=concat(v_target_registration_agency_str,v_target_registration_agency,";");

        /* set @证券代码串#=substring(@证券代码串#,LOCATE(@分隔符#,@证券代码串#)+1); */
        set v_stock_code_str=substring(v_stock_code_str,LOCATE(v_split_str,v_stock_code_str)+1);

        /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
        set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

        /* set @订单方向串#=substring(@订单方向串#,LOCATE(@分隔符#,@订单方向串#)+1); */
        set v_order_dir_str=substring(v_order_dir_str,LOCATE(v_split_str,v_order_dir_str)+1);

        /* set @订单价格串#=substring(@订单价格串#,LOCATE(@分隔符#,@订单价格串#)+1); */
        set v_order_price_str=substring(v_order_price_str,LOCATE(v_split_str,v_order_price_str)+1);

        /* set @订单数量串#=substring(@订单数量串#,LOCATE(@分隔符#,@订单数量串#)+1); */
        set v_order_qty_str=substring(v_order_qty_str,LOCATE(v_split_str,v_order_qty_str)+1);

        /* set @价格类型串#=substring(@价格类型串#,LOCATE(@分隔符#,@价格类型串#)+1); */
        set v_price_type_str=substring(v_price_type_str,LOCATE(v_split_str,v_price_type_str)+1);

        /* set @目标证券代码串#=substring(@目标证券代码串#,LOCATE(@分隔符#,@目标证券代码串#)+1); */
        set v_target_stock_code_str=substring(v_target_stock_code_str,LOCATE(v_split_str,v_target_stock_code_str)+1);
    end while;

    /* set @交易日期# = @初始化日期#; */
    set v_trade_date = v_init_date;

    /* 调用【原子_公共_基础_检查交易日期时间】*/
    call db_pub.pra_base_CheckExchDateTime(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_trade_date,
        v_exch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查交易日期时间出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if  substring(@系统控制配置串#,7,1) <>《系统类型-PB系统》  then */
    if  substring(v_sys_config_str,7,1) <>1  then

    /* [检查报错返回][@是否交易员# <> 《是否交易员-是》][762][@操作员编号#, @是否交易员#] */
    if v_is_trader <> 1 then
        
        SET v_error_code = "pubT.25.8.762";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader);
        end if;
        leave label_pro;
    end if;

    end if;

    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号#=@操作员编号#; */
    set v_target_opor_no=v_opor_no;

    /* 调用【原子_公共_用户_获取操作员权限串】*/
    call db_pub.pra_user_GetOporRightsStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_opor_rights_str,
        v_allow_oper_mac);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #校验交易权限

    /* if (@允许操作MAC#<>" " or @允许操作MAC#<>"") then */
    if (v_allow_oper_mac<>" " or v_allow_oper_mac<>"") then

        /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][209][@操作员编号#] */
        if locate(v_oper_mac,v_allow_oper_mac)=0 then
            
            SET v_error_code = "pubT.25.8.209";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* set @操作员权限#=2; */
        set v_opor_rights=2;

        /* [检查报错返回][locate(@操作员权限#,@操作员权限串#)=0][207][@操作员编号#] */
        if locate(v_opor_rights,v_opor_rights_str)=0 then
            
            SET v_error_code = "pubT.25.8.207";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_stock_code_no_str = v_stock_code_no_str;
    SET p_target_stock_code_no_str = v_target_stock_code_no_str;
    SET p_stock_type_str = v_stock_type_str;
    SET p_asset_type_str = v_asset_type_str;
    SET p_crncy_type_str = v_crncy_type_str;
    SET p_exch_crncy_type_str = v_exch_crncy_type_str;
    SET p_buy_ref_rate_str = v_buy_ref_rate_str;
    SET p_sell_ref_rate_str = v_sell_ref_rate_str;
    SET p_par_value_str = v_par_value_str;
    SET p_impawn_ratio_str = v_impawn_ratio_str;
    SET p_net_price_flag_str = v_net_price_flag_str;
    SET p_intrst_days_str = v_intrst_days_str;
    SET p_bond_rate_type_str = v_bond_rate_type_str;
    SET p_bond_accr_intrst_str = v_bond_accr_intrst_str;
    SET p_target_code_no_str = v_target_code_no_str;
    SET p_target_code_str = v_target_code_str;
    SET p_target_code_stock_type_str = v_target_code_stock_type_str;
    SET p_target_code_asset_type_str = v_target_code_asset_type_str;
    SET p_trade_code_no_str = v_trade_code_no_str;
    SET p_trade_code_str = v_trade_code_str;
    SET p_trade_code_stock_type_str = v_trade_code_stock_type_str;
    SET p_trade_code_asset_type_str = v_trade_code_asset_type_str;
    SET p_min_unit_str = v_min_unit_str;
    SET p_up_limit_price_str = v_up_limit_price_str;
    SET p_down_limit_price_str = v_down_limit_price_str;
    SET p_last_price_str = v_last_price_str;
    SET p_capit_reback_days_str = v_capit_reback_days_str;
    SET p_posi_reback_days_str = v_posi_reback_days_str;
    SET p_subscription_trade_mark_str = v_subscription_trade_mark_str;
    SET p_purchase_trade_mark_str = v_purchase_trade_mark_str;
    SET p_rede_trade_mark_str = v_rede_trade_mark_str;
    SET p_first_minimum_amt_str = v_first_minimum_amt_str;
    SET p_minimum_purchase_amt_str = v_minimum_purchase_amt_str;
    SET p_minimum_subscription_amt_str = v_minimum_subscription_amt_str;
    SET p_minimum_rede_share_str = v_minimum_rede_share_str;
    SET p_minimum_holding_share_str = v_minimum_holding_share_str;
    SET p_minimum_turning_out_share_str = v_minimum_turning_out_share_str;
    SET p_fund_manager_str = v_fund_manager_str;
    SET p_charging_method_str = v_charging_method_str;
    SET p_registration_agency_str = v_registration_agency_str;
    SET p_target_subscrip_trade_mark_str = v_target_subscrip_trade_mark_str;
    SET p_target_purchase_trade_mark_str = v_target_purchase_trade_mark_str;
    SET p_target_rede_trade_mark_str = v_target_rede_trade_mark_str;
    SET p_target_first_minimum_amt_str = v_target_first_minimum_amt_str;
    SET p_target_min_purchase_amt_str = v_target_min_purchase_amt_str;
    SET p_target_min_subscrip_amt_str = v_target_min_subscrip_amt_str;
    SET p_target_min_rede_share_str = v_target_min_rede_share_str;
    SET p_target_min_holding_share_str = v_target_min_holding_share_str;
    SET p_target_min_turning_out_share_str = v_target_min_turning_out_share_str;
    SET p_target_fund_manager_str = v_target_fund_manager_str;
    SET p_target_charging_method_str = v_target_charging_method_str;
    SET p_trade_acco = v_trade_acco;
    SET p_target_registration_agency_str = v_target_registration_agency_str;
    SET p_sys_config_str = v_sys_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查基金批量指令市场状态权限身份
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckFundBatchApprMarketStatusAuthOper;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckFundBatchApprMarketStatusAuthOper(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_no_str varchar(2048),
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_target_stock_code_str varchar(4096),
    IN p_stock_code_str varchar(4096),
    IN p_comm_executor int,
    IN p_comm_dir_str varchar(2048),
    IN p_comm_qty_str varchar(4096),
    IN p_limit_price_str varchar(4096),
    IN p_split_str varchar(4),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_co_comm_appr_oper int,
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_crncy_type_str varchar(2048),
    OUT p_exch_crncy_type_str varchar(2048),
    OUT p_buy_ref_rate_str varchar(2048),
    OUT p_sell_ref_rate_str varchar(2048),
    OUT p_stock_code_no_str varchar(4096),
    OUT p_target_stock_code_no_str varchar(4096),
    OUT p_stock_type_str varchar(2048),
    OUT p_asset_type_str varchar(2048),
    OUT p_net_price_flag_str varchar(2048),
    OUT p_par_value_str varchar(4096),
    OUT p_impawn_ratio_str varchar(4096),
    OUT p_intrst_days_str varchar(2048),
    OUT p_bond_rate_type_str varchar(4096),
    OUT p_bond_accr_intrst_str varchar(4096),
    OUT p_target_code_no_str varchar(4096),
    OUT p_target_code_str varchar(2048),
    OUT p_target_code_stock_type_str varchar(2048),
    OUT p_target_code_asset_type_str varchar(2048),
    OUT p_trade_code_no_str varchar(4096),
    OUT p_trade_code_str varchar(2048),
    OUT p_trade_code_stock_type_str varchar(2048),
    OUT p_trade_code_asset_type_str varchar(2048),
    OUT p_min_unit_str varchar(2048),
    OUT p_up_limit_price_str varchar(4096),
    OUT p_down_limit_price_str varchar(4096),
    OUT p_last_price_str varchar(4096),
    OUT p_capit_reback_days_str varchar(2048),
    OUT p_posi_reback_days_str varchar(2048),
    OUT p_limit_actual_price_str varchar(4096),
    OUT p_pre_close_price_str varchar(4096),
    OUT p_subscription_trade_mark_str varchar(4096),
    OUT p_purchase_trade_mark_str varchar(4096),
    OUT p_rede_trade_mark_str varchar(4096),
    OUT p_first_minimum_amt_str varchar(4096),
    OUT p_minimum_purchase_amt_str varchar(4096),
    OUT p_minimum_subscription_amt_str varchar(4096),
    OUT p_minimum_rede_share_str varchar(4096),
    OUT p_minimum_holding_share_str varchar(4096),
    OUT p_minimum_turning_out_share_str varchar(4096),
    OUT p_fund_manager_str varchar(4096),
    OUT p_charging_method_str varchar(4096),
    OUT p_registration_agency_str varchar(4096),
    OUT p_target_subscrip_trade_mark_str varchar(4096),
    OUT p_target_purchase_trade_mark_str varchar(4096),
    OUT p_target_rede_trade_mark_str varchar(4096),
    OUT p_target_first_minimum_amt_str varchar(4096),
    OUT p_target_min_purchase_amt_str varchar(4096),
    OUT p_target_min_subscrip_amt_str varchar(4096),
    OUT p_target_min_rede_share_str varchar(4096),
    OUT p_target_min_holding_share_str varchar(4096),
    OUT p_target_min_turning_out_share_str varchar(4096),
    OUT p_target_fund_manager_str varchar(4096),
    OUT p_target_charging_method_str varchar(4096),
    OUT p_target_registration_agency_str varchar(4096),
    OUT p_trade_acco varchar(32),
    OUT p_sys_config_str varchar(64),
    OUT p_online_opor_no_str varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_exch_no_str varchar(2048);
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_target_stock_code_str varchar(4096);
    declare v_stock_code_str varchar(4096);
    declare v_comm_executor int;
    declare v_comm_dir_str varchar(2048);
    declare v_comm_qty_str varchar(4096);
    declare v_limit_price_str varchar(4096);
    declare v_split_str varchar(4);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_co_comm_appr_oper int;
    declare v_exgp_busi_config_str varchar(64);
    declare v_crncy_type_str varchar(2048);
    declare v_exch_crncy_type_str varchar(2048);
    declare v_buy_ref_rate_str varchar(2048);
    declare v_sell_ref_rate_str varchar(2048);
    declare v_stock_code_no_str varchar(4096);
    declare v_target_stock_code_no_str varchar(4096);
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
    declare v_net_price_flag_str varchar(2048);
    declare v_par_value_str varchar(4096);
    declare v_impawn_ratio_str varchar(4096);
    declare v_intrst_days_str varchar(2048);
    declare v_bond_rate_type_str varchar(4096);
    declare v_bond_accr_intrst_str varchar(4096);
    declare v_target_code_no_str varchar(4096);
    declare v_target_code_str varchar(2048);
    declare v_target_code_stock_type_str varchar(2048);
    declare v_target_code_asset_type_str varchar(2048);
    declare v_trade_code_no_str varchar(4096);
    declare v_trade_code_str varchar(2048);
    declare v_trade_code_stock_type_str varchar(2048);
    declare v_trade_code_asset_type_str varchar(2048);
    declare v_min_unit_str varchar(2048);
    declare v_up_limit_price_str varchar(4096);
    declare v_down_limit_price_str varchar(4096);
    declare v_last_price_str varchar(4096);
    declare v_capit_reback_days_str varchar(2048);
    declare v_posi_reback_days_str varchar(2048);
    declare v_limit_actual_price_str varchar(4096);
    declare v_pre_close_price_str varchar(4096);
    declare v_subscription_trade_mark_str varchar(4096);
    declare v_purchase_trade_mark_str varchar(4096);
    declare v_rede_trade_mark_str varchar(4096);
    declare v_first_minimum_amt_str varchar(4096);
    declare v_minimum_purchase_amt_str varchar(4096);
    declare v_minimum_subscription_amt_str varchar(4096);
    declare v_minimum_rede_share_str varchar(4096);
    declare v_minimum_holding_share_str varchar(4096);
    declare v_minimum_turning_out_share_str varchar(4096);
    declare v_fund_manager_str varchar(4096);
    declare v_charging_method_str varchar(4096);
    declare v_registration_agency_str varchar(4096);
    declare v_target_subscrip_trade_mark_str varchar(4096);
    declare v_target_purchase_trade_mark_str varchar(4096);
    declare v_target_rede_trade_mark_str varchar(4096);
    declare v_target_first_minimum_amt_str varchar(4096);
    declare v_target_min_purchase_amt_str varchar(4096);
    declare v_target_min_subscrip_amt_str varchar(4096);
    declare v_target_min_rede_share_str varchar(4096);
    declare v_target_min_holding_share_str varchar(4096);
    declare v_target_min_turning_out_share_str varchar(4096);
    declare v_target_fund_manager_str varchar(4096);
    declare v_target_charging_method_str varchar(4096);
    declare v_target_registration_agency_str varchar(4096);
    declare v_trade_acco varchar(32);
    declare v_sys_config_str varchar(64);
    declare v_online_opor_no_str varchar(2048);
    declare v_tmp_exch_no_str varchar(2048);
    declare v_tmp_stock_type_str varchar(2048);
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_target_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_target_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;
    declare v_trade_code_no int;
    declare v_trade_code varchar(6);
    declare v_trade_code_stock_type int;
    declare v_trade_code_asset_type int;
    declare v_pre_close_price decimal(16,9);
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_minimum_turning_out_share decimal(18,2);
    declare v_fund_manager varchar(64);
    declare v_charging_method int;
    declare v_registration_agency varchar(32);
    declare v_target_subscription_trade_mark int;
    declare v_target_purchase_trade_mark int;
    declare v_target_rede_trade_mark int;
    declare v_target_first_minimum_amt decimal(18,4);
    declare v_target_minimum_purchase_amt decimal(18,4);
    declare v_target_minimum_subscription_amt decimal(18,4);
    declare v_target_minimum_rede_share decimal(18,2);
    declare v_target_minimum_holding_share decimal(18,2);
    declare v_target_minimum_turning_out_share decimal(18,2);
    declare v_target_fund_manager varchar(64);
    declare v_target_charging_method int;
    declare v_target_registration_agency varchar(32);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_order_dir int;
    declare v_limit_actual_price decimal(16,9);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_target_opor_no int;
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights int;
    declare v_tmp_exgp_busi_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_target_stock_code_str = p_target_stock_code_str;
    SET v_stock_code_str = p_stock_code_str;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_comm_qty_str = p_comm_qty_str;
    SET v_limit_price_str = p_limit_price_str;
    SET v_split_str = p_split_str;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_co_comm_appr_oper = 0;
    SET v_exgp_busi_config_str = " ";
    SET v_crncy_type_str = " ";
    SET v_exch_crncy_type_str = " ";
    SET v_buy_ref_rate_str = " ";
    SET v_sell_ref_rate_str = " ";
    SET v_stock_code_no_str = " ";
    SET v_target_stock_code_no_str = " ";
    SET v_stock_type_str = " ";
    SET v_asset_type_str = " ";
    SET v_net_price_flag_str = " ";
    SET v_par_value_str = " ";
    SET v_impawn_ratio_str = " ";
    SET v_intrst_days_str = " ";
    SET v_bond_rate_type_str = " ";
    SET v_bond_accr_intrst_str = " ";
    SET v_target_code_no_str = " ";
    SET v_target_code_str = " ";
    SET v_target_code_stock_type_str = " ";
    SET v_target_code_asset_type_str = " ";
    SET v_trade_code_no_str = " ";
    SET v_trade_code_str = " ";
    SET v_trade_code_stock_type_str = " ";
    SET v_trade_code_asset_type_str = " ";
    SET v_min_unit_str = " ";
    SET v_up_limit_price_str = " ";
    SET v_down_limit_price_str = " ";
    SET v_last_price_str = " ";
    SET v_capit_reback_days_str = " ";
    SET v_posi_reback_days_str = " ";
    SET v_limit_actual_price_str = " ";
    SET v_pre_close_price_str = " ";
    SET v_subscription_trade_mark_str = " ";
    SET v_purchase_trade_mark_str = " ";
    SET v_rede_trade_mark_str = " ";
    SET v_first_minimum_amt_str = " ";
    SET v_minimum_purchase_amt_str = " ";
    SET v_minimum_subscription_amt_str = " ";
    SET v_minimum_rede_share_str = " ";
    SET v_minimum_holding_share_str = " ";
    SET v_minimum_turning_out_share_str = " ";
    SET v_fund_manager_str = " ";
    SET v_charging_method_str = " ";
    SET v_registration_agency_str = " ";
    SET v_target_subscrip_trade_mark_str = " ";
    SET v_target_purchase_trade_mark_str = " ";
    SET v_target_rede_trade_mark_str = " ";
    SET v_target_first_minimum_amt_str = " ";
    SET v_target_min_purchase_amt_str = " ";
    SET v_target_min_subscrip_amt_str = " ";
    SET v_target_min_rede_share_str = " ";
    SET v_target_min_holding_share_str = " ";
    SET v_target_min_turning_out_share_str = " ";
    SET v_target_fund_manager_str = " ";
    SET v_target_charging_method_str = " ";
    SET v_target_registration_agency_str = " ";
    SET v_trade_acco = " ";
    SET v_sys_config_str = " ";
    SET v_online_opor_no_str = " ";
    SET v_tmp_exch_no_str = " ";
    SET v_tmp_stock_type_str = " ";
    SET v_stock_code = " ";
    SET v_exch_no = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_comm_qty = 0;
    SET v_target_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_target_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;
    SET v_min_unit = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_target_code_no = 0;
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_trade_code = " ";
    SET v_trade_code_stock_type = 0;
    SET v_trade_code_asset_type = 0;
    SET v_pre_close_price = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_minimum_turning_out_share = 0;
    SET v_fund_manager = " ";
    SET v_charging_method = 0;
    SET v_registration_agency = " ";
    SET v_target_subscription_trade_mark = 0;
    SET v_target_purchase_trade_mark = 0;
    SET v_target_rede_trade_mark = 0;
    SET v_target_first_minimum_amt = 0;
    SET v_target_minimum_purchase_amt = 0;
    SET v_target_minimum_subscription_amt = 0;
    SET v_target_minimum_rede_share = 0;
    SET v_target_minimum_holding_share = 0;
    SET v_target_minimum_turning_out_share = 0;
    SET v_target_fund_manager = " ";
    SET v_target_charging_method = 0;
    SET v_target_registration_agency = " ";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_order_dir = 0;
    SET v_limit_actual_price = 0;
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_target_opor_no = 0;
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";
    SET v_opor_rights = 0;
    SET v_tmp_exgp_busi_config_str = " ";

    
    label_pro:BEGIN
    

    /* set @本币币种串# = ""; */
    set v_crncy_type_str = "";

    /* set @交易币种串# = ""; */
    set v_exch_crncy_type_str = "";

    /* set @买入参考汇率串# = ""; */
    set v_buy_ref_rate_str = "";

    /* set @卖出参考汇率串# = ""; */
    set v_sell_ref_rate_str = "";

    /* set @证券代码编号串# = ""; */
    set v_stock_code_no_str = "";

    /* set @目标证券代码编号串#=""; */
    set v_target_stock_code_no_str="";

    /* set @证券类型串# = ""; */
    set v_stock_type_str = "";

    /* set @资产类型串# = ""; */
    set v_asset_type_str = "";

    /* set @净价标志串# = ""; */
    set v_net_price_flag_str = "";

    /* set @票面面值串# = ""; */
    set v_par_value_str = "";

    /* set @质押比例串# = ""; */
    set v_impawn_ratio_str = "";

    /* set @计息天数串# = ""; */
    set v_intrst_days_str = "";

    /* set @债券利率类型串# = ""; */
    set v_bond_rate_type_str = "";

    /* set @债券计提利息串# = ""; */
    set v_bond_accr_intrst_str = "";

    /* set @标的代码编号串# = ""; */
    set v_target_code_no_str = "";

    /* set @标的代码串# = ""; */
    set v_target_code_str = "";

    /* set @标的代码证券类型串# = ""; */
    set v_target_code_stock_type_str = "";

    /* set @标的代码资产类型串# = ""; */
    set v_target_code_asset_type_str = "";

    /* set @交易代码编号串# = ""; */
    set v_trade_code_no_str = "";

    /* set @交易代码串# = ""; */
    set v_trade_code_str = "";

    /* set @交易代码证券类型串# = ""; */
    set v_trade_code_stock_type_str = "";

    /* set @交易代码资产类型串# = ""; */
    set v_trade_code_asset_type_str = "";

    /* set @最小单位串# = ""; */
    set v_min_unit_str = "";

    /* set @涨停价串# = ""; */
    set v_up_limit_price_str = "";

    /* set @跌停价串# = ""; */
    set v_down_limit_price_str = "";

    /* set @最新价串# = ""; */
    set v_last_price_str = "";

    /* set @昨收盘价串# = ""; */
    set v_pre_close_price_str = "";

    /* set @资金回转天数串# = ""; */
    set v_capit_reback_days_str = "";

    /* set @持仓回转天数串# = ""; */
    set v_posi_reback_days_str = "";

    /* set @指令实际限价串# = ""; */
    set v_limit_actual_price_str = "";

    /* set @认购交易标志串#=""; */
    set v_subscription_trade_mark_str="";

    /* set @申购交易标志串#=""; */
    set v_purchase_trade_mark_str="";

    /* set @赎回交易标志串#=""; */
    set v_rede_trade_mark_str="";

    /* set @首次最低金额串#=""; */
    set v_first_minimum_amt_str="";

    /* set @最低申购金额串#=""; */
    set v_minimum_purchase_amt_str="";

    /* set @最低认购金额串#=""; */
    set v_minimum_subscription_amt_str="";

    /* set @最低赎回份额串#=""; */
    set v_minimum_rede_share_str="";

    /* set @最低持有份额串#=""; */
    set v_minimum_holding_share_str="";

    /* set @最低转出份额串#=""; */
    set v_minimum_turning_out_share_str="";

    /* set @基金管理人串#=""; */
    set v_fund_manager_str="";

    /* set @收费方式串#=""; */
    set v_charging_method_str="";

    /* set @登记机构串#=""; */
    set v_registration_agency_str="";

    /* set @目标认购交易标志串#=""; */
    set v_target_subscrip_trade_mark_str="";

    /* set @目标申购交易标志串#=""; */
    set v_target_purchase_trade_mark_str="";

    /* set @目标赎回交易标志串#=""; */
    set v_target_rede_trade_mark_str="";

    /* set @目标首次最低金额串#=""; */
    set v_target_first_minimum_amt_str="";

    /* set @目标最低申购金额串#=""; */
    set v_target_min_purchase_amt_str="";

    /* set @目标最低认购金额串#=""; */
    set v_target_min_subscrip_amt_str="";

    /* set @目标最低赎回份额串#=""; */
    set v_target_min_rede_share_str="";

    /* set @目标最低持有份额串#=""; */
    set v_target_min_holding_share_str="";

    /* set @目标最低转出份额串#=""; */
    set v_target_min_turning_out_share_str="";

    /* set @目标基金管理人串#=""; */
    set v_target_fund_manager_str="";

    /* set @目标收费方式串#=""; */
    set v_target_charging_method_str="";

    /* set @目标登记机构串#=""; */
    set v_target_registration_agency_str="";

    /* set @临时_市场编号串# = ""; */
    set v_tmp_exch_no_str = "";

    /* set @临时_证券类型串# = ""; */
    set v_tmp_stock_type_str = "";

    /* if @分隔符# = ' ' then */
    if v_split_str = ' ' then

        /* set @分隔符#= ';'; */
        set v_split_str= ';';
    end if;

    /* while LOCATE(@分隔符#,@证券代码串#) <>0   do */
    while LOCATE(v_split_str,v_stock_code_str) <>0   do
        #截取前面每一位

        /* set @证券代码#=substring(@证券代码串#,1,LOCATE(@分隔符#,@证券代码串#)-1); */
        set v_stock_code=substring(v_stock_code_str,1,LOCATE(v_split_str,v_stock_code_str)-1);

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

        /* set @指令方向#=cast(substring(@指令方向串#,1,LOCATE(@分隔符#,@指令方向串#)-1) as SIGNED); */
        set v_comm_dir=cast(substring(v_comm_dir_str,1,LOCATE(v_split_str,v_comm_dir_str)-1) as SIGNED);

        /* set @指令限价#=cast(substring(@指令限价串#,1,LOCATE(@分隔符#,@指令限价串#)-1) as decimal(16,9)); */
        set v_comm_limit_price=cast(substring(v_limit_price_str,1,LOCATE(v_split_str,v_limit_price_str)-1) as decimal(16,9));

        /* set @指令数量#=cast(substring(@指令数量串#,1,LOCATE(@分隔符#,@指令数量串#)-1) as decimal(18,2)); */
        set v_comm_qty=cast(substring(v_comm_qty_str,1,LOCATE(v_split_str,v_comm_qty_str)-1) as decimal(18,2));

        /* if locate(@分隔符#,@目标证券代码串#)<>0 then */
        if locate(v_split_str,v_target_stock_code_str)<>0 then

            /* set @目标证券代码#=substring(@目标证券代码串#,1,LOCATE(@分隔符#,@目标证券代码串#)-1); */
            set v_target_stock_code=substring(v_target_stock_code_str,1,LOCATE(v_split_str,v_target_stock_code_str)-1);
        else

            /* set @目标证券代码#=" "; */
            set v_target_stock_code=" ";
        end if;

        /* 调用【原子_公共_交易接口_批量检查基金转换指令业务属性】*/
        call db_pub.pra_trdif_BatchCheckFundTransApprProp(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_target_stock_code,
            v_comm_dir,
            v_comm_qty,
            v_comm_limit_price,
            v_error_code,
            v_error_info,
            v_stock_code_no,
            v_target_stock_code_no,
            v_stock_type,
            v_asset_type,
            v_crncy_type,
            v_exch_crncy_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_par_value,
            v_impawn_ratio,
            v_net_price_flag,
            v_intrst_days,
            v_bond_rate_type,
            v_bond_accr_intrst,
            v_min_unit,
            v_up_limit_price,
            v_down_limit_price,
            v_last_price,
            v_target_code_no,
            v_target_code,
            v_target_code_stock_type,
            v_target_code_asset_type,
            v_trade_code_no,
            v_trade_code,
            v_trade_code_stock_type,
            v_trade_code_asset_type,
            v_pre_close_price,
            v_subscription_trade_mark,
            v_purchase_trade_mark,
            v_rede_trade_mark,
            v_first_minimum_amt,
            v_minimum_purchase_amt,
            v_minimum_subscription_amt,
            v_minimum_rede_share,
            v_minimum_holding_share,
            v_minimum_turning_out_share,
            v_fund_manager,
            v_charging_method,
            v_registration_agency,
            v_target_subscription_trade_mark,
            v_target_purchase_trade_mark,
            v_target_rede_trade_mark,
            v_target_first_minimum_amt,
            v_target_minimum_purchase_amt,
            v_target_minimum_subscription_amt,
            v_target_minimum_rede_share,
            v_target_minimum_holding_share,
            v_target_minimum_turning_out_share,
            v_target_fund_manager,
            v_target_charging_method,
            v_target_registration_agency);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_批量检查基金转换指令业务属性出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* if LOCATE(@临时_市场编号串#, @市场编号#) > 0 or LOCATE(@临时_证券类型串#, @证券类型#) > 0 then */
        if LOCATE(v_tmp_exch_no_str, v_exch_no) > 0 or LOCATE(v_tmp_stock_type_str, v_stock_type) > 0 then

            /* 调用【原子_公共_交易接口_检查指令系统状态】*/
            call db_pub.pra_trdif_CheckApprSysStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_exch_no,
                v_stock_type,
                v_error_code,
                v_error_info,
                v_init_date,
                v_co_busi_config_str,
                v_co_comm_appr_oper,
                v_sys_config_str);
            if v_error_code = "1" then
                SET v_error_code = "pubT.25.9.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查指令系统状态出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @临时_市场编号串#  = concat(@临时_市场编号串#,@市场编号#,";"); */
            set v_tmp_exch_no_str  = concat(v_tmp_exch_no_str,v_exch_no,";");

            /* set @临时_证券类型串#  = concat(@临时_证券类型串#,@证券类型#,";"); */
            set v_tmp_stock_type_str  = concat(v_tmp_stock_type_str,v_stock_type,";");
        end if;

        /* 调用【原子_公共_交易接口_检查交易市场状态】*/
        call db_pub.pra_trdif_CheckTrdMarketStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_exch_no,
            v_error_code,
            v_error_info,
            v_init_date,
            v_buy_ref_rate,
            v_sell_ref_rate);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易市场状态出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

        #交易组级，订单方向检查。Modify by wjp 20190428

        /* set @订单方向# = @指令方向#; */
        set v_order_dir = v_comm_dir;

        /* 调用【原子_公共_用户_检查交易组限制信息】*/
        call db_pub.pra_user_CheckExchGroupLimitInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_group_no,
            v_order_dir,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组限制信息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @目标证券代码编号串#  = concat(@目标证券代码编号串#,@目标证券代码编号#,";"); */
        set v_target_stock_code_no_str  = concat(v_target_stock_code_no_str,v_target_stock_code_no,";");

        /* set @本币币种串#  = concat(@本币币种串#,@本币币种#,";"); */
        set v_crncy_type_str  = concat(v_crncy_type_str,v_crncy_type,";");

        /* set @交易币种串#  = concat(@交易币种串#,@交易币种#,";"); */
        set v_exch_crncy_type_str  = concat(v_exch_crncy_type_str,v_exch_crncy_type,";");

        /* set @买入参考汇率串#  = concat(@买入参考汇率串#,@买入参考汇率#,";"); */
        set v_buy_ref_rate_str  = concat(v_buy_ref_rate_str,v_buy_ref_rate,";");

        /* set @卖出参考汇率串#  = concat(@卖出参考汇率串#,@卖出参考汇率#,";"); */
        set v_sell_ref_rate_str  = concat(v_sell_ref_rate_str,v_sell_ref_rate,";");

        /* set @证券代码编号串#  = concat(@证券代码编号串#,@证券代码编号#,";"); */
        set v_stock_code_no_str  = concat(v_stock_code_no_str,v_stock_code_no,";");

        /* set @证券类型串#  = concat(@证券类型串#,@证券类型#,";"); */
        set v_stock_type_str  = concat(v_stock_type_str,v_stock_type,";");

        /* set @资产类型串#  = concat(@资产类型串#,@资产类型#,";"); */
        set v_asset_type_str  = concat(v_asset_type_str,v_asset_type,";");

        /* set @净价标志串#  = concat(@净价标志串#,@净价标志#,";"); */
        set v_net_price_flag_str  = concat(v_net_price_flag_str,v_net_price_flag,";");

        /* set @票面面值串#  = concat(@票面面值串#,@票面面值#,";"); */
        set v_par_value_str  = concat(v_par_value_str,v_par_value,";");

        /* set @质押比例串#  = concat(@质押比例串#,@质押比例#,";"); */
        set v_impawn_ratio_str  = concat(v_impawn_ratio_str,v_impawn_ratio,";");

        /* set @计息天数串#  = concat(@计息天数串#,@计息天数#,";"); */
        set v_intrst_days_str  = concat(v_intrst_days_str,v_intrst_days,";");

        /* set @债券利率类型串#  = concat(@债券利率类型串#,@债券利率类型#,";"); */
        set v_bond_rate_type_str  = concat(v_bond_rate_type_str,v_bond_rate_type,";");

        /* set @债券计提利息串#  = concat(@债券计提利息串#,@债券计提利息#,";"); */
        set v_bond_accr_intrst_str  = concat(v_bond_accr_intrst_str,v_bond_accr_intrst,";");

        /* set @标的代码编号串#  = concat(@标的代码编号串#,@标的代码编号#,";"); */
        set v_target_code_no_str  = concat(v_target_code_no_str,v_target_code_no,";");

        /* set @标的代码串#  = concat(@标的代码串#,@标的代码#,";"); */
        set v_target_code_str  = concat(v_target_code_str,v_target_code,";");

        /* set @标的代码证券类型串#  = concat(@标的代码证券类型串#,@标的代码证券类型#,";"); */
        set v_target_code_stock_type_str  = concat(v_target_code_stock_type_str,v_target_code_stock_type,";");

        /* set @标的代码资产类型串#  = concat(@标的代码资产类型串#,@标的代码资产类型#,";"); */
        set v_target_code_asset_type_str  = concat(v_target_code_asset_type_str,v_target_code_asset_type,";");

        /* set @交易代码编号串#  = concat(@交易代码编号串#,@交易代码编号#,";"); */
        set v_trade_code_no_str  = concat(v_trade_code_no_str,v_trade_code_no,";");

        /* set @交易代码串#  = concat(@交易代码串#,@交易代码#,";"); */
        set v_trade_code_str  = concat(v_trade_code_str,v_trade_code,";");

        /* set @交易代码证券类型串#  = concat(@交易代码证券类型串#,@交易代码证券类型#,";"); */
        set v_trade_code_stock_type_str  = concat(v_trade_code_stock_type_str,v_trade_code_stock_type,";");

        /* set @交易代码资产类型串#  = concat(@交易代码资产类型串#,@交易代码资产类型#,";"); */
        set v_trade_code_asset_type_str  = concat(v_trade_code_asset_type_str,v_trade_code_asset_type,";");

        /* set @最小单位串#  = concat(@最小单位串#,@最小单位#,";"); */
        set v_min_unit_str  = concat(v_min_unit_str,v_min_unit,";");

        /* set @涨停价串#  = concat(@涨停价串#,@涨停价#,";"); */
        set v_up_limit_price_str  = concat(v_up_limit_price_str,v_up_limit_price,";");

        /* set @跌停价串#  = concat(@跌停价串#,@跌停价#,";"); */
        set v_down_limit_price_str  = concat(v_down_limit_price_str,v_down_limit_price,";");

        /* set @最新价串#  = concat(@最新价串#,@最新价#,";"); */
        set v_last_price_str  = concat(v_last_price_str,v_last_price,";");

        /* set @昨收盘价串#  = concat(@昨收盘价串#,@昨收盘价#,";"); */
        set v_pre_close_price_str  = concat(v_pre_close_price_str,v_pre_close_price,";");

        /* set @资金回转天数串#  = concat(@资金回转天数串#,@资金回转天数#,";"); */
        set v_capit_reback_days_str  = concat(v_capit_reback_days_str,v_capit_reback_days,";");

        /* set @持仓回转天数串#  = concat(@持仓回转天数串#,@持仓回转天数#,";"); */
        set v_posi_reback_days_str  = concat(v_posi_reback_days_str,v_posi_reback_days,";");

        /* set @认购交易标志串#=concat(@认购交易标志串#,@认购交易标志#,";"); */
        set v_subscription_trade_mark_str=concat(v_subscription_trade_mark_str,v_subscription_trade_mark,";");

        /* set @申购交易标志串#=concat(@申购交易标志串#,@申购交易标志#,";"); */
        set v_purchase_trade_mark_str=concat(v_purchase_trade_mark_str,v_purchase_trade_mark,";");

        /* set @赎回交易标志串#=concat(@赎回交易标志串#,@赎回交易标志#,";"); */
        set v_rede_trade_mark_str=concat(v_rede_trade_mark_str,v_rede_trade_mark,";");

        /* set @首次最低金额串#=concat(@首次最低金额串#,@首次最低金额#,";"); */
        set v_first_minimum_amt_str=concat(v_first_minimum_amt_str,v_first_minimum_amt,";");

        /* set @最低申购金额串#=concat(@最低申购金额串#,@最低申购金额#,";"); */
        set v_minimum_purchase_amt_str=concat(v_minimum_purchase_amt_str,v_minimum_purchase_amt,";");

        /* set @最低认购金额串#=concat(@最低认购金额串#,@最低认购金额#,";"); */
        set v_minimum_subscription_amt_str=concat(v_minimum_subscription_amt_str,v_minimum_subscription_amt,";");

        /* set @最低赎回份额串#=concat(@最低赎回份额串#,@最低赎回份额#,";"); */
        set v_minimum_rede_share_str=concat(v_minimum_rede_share_str,v_minimum_rede_share,";");

        /* set @最低持有份额串#=concat(@最低持有份额串#,@最低持有份额#,";"); */
        set v_minimum_holding_share_str=concat(v_minimum_holding_share_str,v_minimum_holding_share,";");

        /* set @最低转出份额串#=concat(@最低转出份额串#,@最低转出份额#,";"); */
        set v_minimum_turning_out_share_str=concat(v_minimum_turning_out_share_str,v_minimum_turning_out_share,";");

        /* set @基金管理人串#=concat(@基金管理人串#,@基金管理人#,";"); */
        set v_fund_manager_str=concat(v_fund_manager_str,v_fund_manager,";");

        /* set @收费方式串#=concat(@收费方式串#,@收费方式#,";"); */
        set v_charging_method_str=concat(v_charging_method_str,v_charging_method,";");

        /* set @登记机构串#=concat(@登记机构串#,@登记机构#,";"); */
        set v_registration_agency_str=concat(v_registration_agency_str,v_registration_agency,";");

        /* set @目标认购交易标志串#=concat(@目标认购交易标志串#,@目标认购交易标志#,";"); */
        set v_target_subscrip_trade_mark_str=concat(v_target_subscrip_trade_mark_str,v_target_subscription_trade_mark,";");

        /* set @目标申购交易标志串#=concat(@目标申购交易标志串#,@目标申购交易标志#,";"); */
        set v_target_purchase_trade_mark_str=concat(v_target_purchase_trade_mark_str,v_target_purchase_trade_mark,";");

        /* set @目标赎回交易标志串#=concat(@目标赎回交易标志串#,@目标赎回交易标志#,";"); */
        set v_target_rede_trade_mark_str=concat(v_target_rede_trade_mark_str,v_target_rede_trade_mark,";");

        /* set @目标首次最低金额串#=concat(@目标首次最低金额串#,@目标首次最低金额#,";"); */
        set v_target_first_minimum_amt_str=concat(v_target_first_minimum_amt_str,v_target_first_minimum_amt,";");

        /* set @目标最低申购金额串#=concat(@目标最低申购金额串#,@目标最低申购金额#,";"); */
        set v_target_min_purchase_amt_str=concat(v_target_min_purchase_amt_str,v_target_minimum_purchase_amt,";");

        /* set @目标最低认购金额串#=concat(@目标最低认购金额串#,@目标最低认购金额#,";"); */
        set v_target_min_subscrip_amt_str=concat(v_target_min_subscrip_amt_str,v_target_minimum_subscription_amt,";");

        /* set @目标最低赎回份额串#=concat(@目标最低赎回份额串#,@目标最低赎回份额#,";"); */
        set v_target_min_rede_share_str=concat(v_target_min_rede_share_str,v_target_minimum_rede_share,";");

        /* set @目标最低持有份额串#=concat(@目标最低持有份额串#,@目标最低持有份额#,";"); */
        set v_target_min_holding_share_str=concat(v_target_min_holding_share_str,v_target_minimum_holding_share,";");

        /* set @目标最低转出份额串#=concat(@目标最低转出份额串#,@目标最低转出份额#,";"); */
        set v_target_min_turning_out_share_str=concat(v_target_min_turning_out_share_str,v_target_minimum_turning_out_share,";");

        /* set @目标基金管理人串#=concat(@目标基金管理人串#,@目标基金管理人#,";"); */
        set v_target_fund_manager_str=concat(v_target_fund_manager_str,v_target_fund_manager,";");

        /* set @目标收费方式串#=concat(@目标收费方式串#,@目标收费方式#,";"); */
        set v_target_charging_method_str=concat(v_target_charging_method_str,v_target_charging_method,";");

        /* set @目标登记机构串#=concat(@目标登记机构串#,@目标登记机构#,";"); */
        set v_target_registration_agency_str=concat(v_target_registration_agency_str,v_target_registration_agency,";");

        /* set @指令实际限价#=@指令限价#; */
        set v_limit_actual_price=v_comm_limit_price;
        #if @指令限价#=0 then
        #    if @指令方向#=《指令方向-买入》 then
        #        set @指令实际限价#=@涨停价#;
       #    elseif @指令方向#=《指令方向-卖出》 then
        #        set @指令实际限价#=@跌停价#;
        #    end if;
       # end if;

        /* set @指令实际限价串# = concat(@指令实际限价串#,@指令实际限价#,";"); */
        set v_limit_actual_price_str = concat(v_limit_actual_price_str,v_limit_actual_price,";");

        /* set @证券代码串#=substring(@证券代码串#,LOCATE(@分隔符#,@证券代码串#)+1); */
        set v_stock_code_str=substring(v_stock_code_str,LOCATE(v_split_str,v_stock_code_str)+1);

        /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
        set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

        /* set @指令方向串#=substring(@指令方向串#,LOCATE(@分隔符#,@指令方向串#)+1); */
        set v_comm_dir_str=substring(v_comm_dir_str,LOCATE(v_split_str,v_comm_dir_str)+1);

        /* set @指令限价串#=substring(@指令限价串#,LOCATE(@分隔符#,@指令限价串#)+1); */
        set v_limit_price_str=substring(v_limit_price_str,LOCATE(v_split_str,v_limit_price_str)+1);

        /* set @指令数量串#=substring(@指令数量串#,LOCATE(@分隔符#,@指令数量串#)+1); */
        set v_comm_qty_str=substring(v_comm_qty_str,LOCATE(v_split_str,v_comm_qty_str)+1);

        /* set @目标证券代码串#=substring(@目标证券代码串#,LOCATE(@分隔符#,@目标证券代码串#)+1); */
        set v_target_stock_code_str=substring(v_target_stock_code_str,LOCATE(v_split_str,v_target_stock_code_str)+1);
    end while;

    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号#=@操作员编号#; */
    set v_target_opor_no=v_opor_no;

    /* 调用【原子_公共_用户_获取操作员权限串】*/
    call db_pub.pra_user_GetOporRightsStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_opor_rights_str,
        v_allow_oper_mac);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #校验指令权限

    /* if (@允许操作MAC#<>" " or @允许操作MAC#<>"") then */
    if (v_allow_oper_mac<>" " or v_allow_oper_mac<>"") then

        /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][209][@操作员编号#] */
        if locate(v_oper_mac,v_allow_oper_mac)=0 then
            
            SET v_error_code = "pubT.25.9.209";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* set @操作员权限#=1; */
        set v_opor_rights=1;

        /* [检查报错返回][locate(@操作员权限#,@操作员权限串#)=0][206][@操作员编号#] */
        if locate(v_opor_rights,v_opor_rights_str)=0 then
            
            SET v_error_code = "pubT.25.9.206";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @临时_交易组业务控制配置串# = @交易组业务控制配置串#; */
    set v_tmp_exgp_busi_config_str = v_exgp_busi_config_str;
    #对指令执行人进行可操作性检查

    /* if @指令执行人# <> (0)   and  substring(@系统控制配置串#,7,1) <>《系统类型-PB系统》  then */
    if v_comm_executor <> (0)   and  substring(v_sys_config_str,7,1) <>1  then

        /* set @操作员编号# = @指令执行人#; */
        set v_opor_no = v_comm_executor;
    #不校验指令执行人密码。

        /* 调用【原子_公共_用户_检查操作员身份无密码】*/
        call db_pub.pra_user_CheckOperatorAuthNoPwd(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_error_code,
            v_error_info,
            v_opor_type,
            v_oper_rights,
            v_is_trader);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份无密码出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

        #[原子_公共_用户_检查操作员身份]

        /* [检查报错返回][@是否交易员# <> 《是否交易员-是》][762][@指令执行人#, @是否交易员#] */
        if v_is_trader <> 1 then
            
            SET v_error_code = "pubT.25.9.762";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令执行人=",v_comm_executor,","," 是否交易员=", v_is_trader),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令执行人=",v_comm_executor,","," 是否交易员=", v_is_trader);
            end if;
            leave label_pro;
        end if;


        /* 调用【原子_公共_用户_检查操作员操作权限】*/
        call db_pub.pra_user_CheckOperatorOperRights(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_exch_group_no,
            v_oper_rights,
            v_error_code,
            v_error_info,
            v_pd_no);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* 调用【原子_公共_用户_检查交易组操作权限】*/
        call db_pub.pra_user_CheckExchGroupOperRights(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_group_no,
            v_exch_no,
            v_stock_type,
            v_error_code,
            v_error_info,
            v_pd_no,
            v_exgp_busi_config_str,
            v_trade_acco);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;

    /* set @交易组业务控制配置串# = @临时_交易组业务控制配置串#; */
    set v_exgp_busi_config_str = v_tmp_exgp_busi_config_str;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_co_comm_appr_oper = v_co_comm_appr_oper;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_crncy_type_str = v_crncy_type_str;
    SET p_exch_crncy_type_str = v_exch_crncy_type_str;
    SET p_buy_ref_rate_str = v_buy_ref_rate_str;
    SET p_sell_ref_rate_str = v_sell_ref_rate_str;
    SET p_stock_code_no_str = v_stock_code_no_str;
    SET p_target_stock_code_no_str = v_target_stock_code_no_str;
    SET p_stock_type_str = v_stock_type_str;
    SET p_asset_type_str = v_asset_type_str;
    SET p_net_price_flag_str = v_net_price_flag_str;
    SET p_par_value_str = v_par_value_str;
    SET p_impawn_ratio_str = v_impawn_ratio_str;
    SET p_intrst_days_str = v_intrst_days_str;
    SET p_bond_rate_type_str = v_bond_rate_type_str;
    SET p_bond_accr_intrst_str = v_bond_accr_intrst_str;
    SET p_target_code_no_str = v_target_code_no_str;
    SET p_target_code_str = v_target_code_str;
    SET p_target_code_stock_type_str = v_target_code_stock_type_str;
    SET p_target_code_asset_type_str = v_target_code_asset_type_str;
    SET p_trade_code_no_str = v_trade_code_no_str;
    SET p_trade_code_str = v_trade_code_str;
    SET p_trade_code_stock_type_str = v_trade_code_stock_type_str;
    SET p_trade_code_asset_type_str = v_trade_code_asset_type_str;
    SET p_min_unit_str = v_min_unit_str;
    SET p_up_limit_price_str = v_up_limit_price_str;
    SET p_down_limit_price_str = v_down_limit_price_str;
    SET p_last_price_str = v_last_price_str;
    SET p_capit_reback_days_str = v_capit_reback_days_str;
    SET p_posi_reback_days_str = v_posi_reback_days_str;
    SET p_limit_actual_price_str = v_limit_actual_price_str;
    SET p_pre_close_price_str = v_pre_close_price_str;
    SET p_subscription_trade_mark_str = v_subscription_trade_mark_str;
    SET p_purchase_trade_mark_str = v_purchase_trade_mark_str;
    SET p_rede_trade_mark_str = v_rede_trade_mark_str;
    SET p_first_minimum_amt_str = v_first_minimum_amt_str;
    SET p_minimum_purchase_amt_str = v_minimum_purchase_amt_str;
    SET p_minimum_subscription_amt_str = v_minimum_subscription_amt_str;
    SET p_minimum_rede_share_str = v_minimum_rede_share_str;
    SET p_minimum_holding_share_str = v_minimum_holding_share_str;
    SET p_minimum_turning_out_share_str = v_minimum_turning_out_share_str;
    SET p_fund_manager_str = v_fund_manager_str;
    SET p_charging_method_str = v_charging_method_str;
    SET p_registration_agency_str = v_registration_agency_str;
    SET p_target_subscrip_trade_mark_str = v_target_subscrip_trade_mark_str;
    SET p_target_purchase_trade_mark_str = v_target_purchase_trade_mark_str;
    SET p_target_rede_trade_mark_str = v_target_rede_trade_mark_str;
    SET p_target_first_minimum_amt_str = v_target_first_minimum_amt_str;
    SET p_target_min_purchase_amt_str = v_target_min_purchase_amt_str;
    SET p_target_min_subscrip_amt_str = v_target_min_subscrip_amt_str;
    SET p_target_min_rede_share_str = v_target_min_rede_share_str;
    SET p_target_min_holding_share_str = v_target_min_holding_share_str;
    SET p_target_min_turning_out_share_str = v_target_min_turning_out_share_str;
    SET p_target_fund_manager_str = v_target_fund_manager_str;
    SET p_target_charging_method_str = v_target_charging_method_str;
    SET p_target_registration_agency_str = v_target_registration_agency_str;
    SET p_trade_acco = v_trade_acco;
    SET p_sys_config_str = v_sys_config_str;
    SET p_online_opor_no_str = v_online_opor_no_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查基金转换指令市场状态权限身份
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckFundTransApprMarketStatusAuthOper;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckFundTransApprMarketStatusAuthOper(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_stock_code varchar(6),
    IN p_target_stock_code varchar(6),
    IN p_comm_executor int,
    IN p_comm_dir int,
    IN p_comm_qty decimal(18,2),
    IN p_comm_limit_price decimal(16,9),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_co_comm_appr_oper int,
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_stock_code_no int,
    OUT p_target_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_net_price_flag int,
    OUT p_par_value decimal(16,9),
    OUT p_subscription_trade_mark int,
    OUT p_purchase_trade_mark int,
    OUT p_rede_trade_mark int,
    OUT p_first_minimum_amt decimal(18,4),
    OUT p_minimum_purchase_amt decimal(18,4),
    OUT p_minimum_subscription_amt decimal(18,4),
    OUT p_minimum_rede_share decimal(18,2),
    OUT p_minimum_holding_share decimal(18,2),
    OUT p_minimum_turning_out_share decimal(18,2),
    OUT p_target_subscription_trade_mark int,
    OUT p_target_purchase_trade_mark int,
    OUT p_target_rede_trade_mark int,
    OUT p_target_first_minimum_amt decimal(18,4),
    OUT p_target_minimum_purchase_amt decimal(18,4),
    OUT p_target_minimum_subscription_amt decimal(18,4),
    OUT p_target_minimum_rede_share decimal(18,2),
    OUT p_target_minimum_holding_share decimal(18,2),
    OUT p_target_minimum_turning_out_share decimal(18,2),
    OUT p_fund_manager varchar(64),
    OUT p_target_fund_manager varchar(64),
    OUT p_charging_method int,
    OUT p_target_charging_method int,
    OUT p_sys_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_exch_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_stock_code varchar(6);
    declare v_target_stock_code varchar(6);
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_qty decimal(18,2);
    declare v_comm_limit_price decimal(16,9);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_co_comm_appr_oper int;
    declare v_exgp_busi_config_str varchar(64);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_stock_code_no int;
    declare v_target_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_minimum_turning_out_share decimal(18,2);
    declare v_target_subscription_trade_mark int;
    declare v_target_purchase_trade_mark int;
    declare v_target_rede_trade_mark int;
    declare v_target_first_minimum_amt decimal(18,4);
    declare v_target_minimum_purchase_amt decimal(18,4);
    declare v_target_minimum_subscription_amt decimal(18,4);
    declare v_target_minimum_rede_share decimal(18,2);
    declare v_target_minimum_holding_share decimal(18,2);
    declare v_target_minimum_turning_out_share decimal(18,2);
    declare v_fund_manager varchar(64);
    declare v_target_fund_manager varchar(64);
    declare v_charging_method int;
    declare v_target_charging_method int;
    declare v_sys_config_str varchar(64);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_target_opor_no int;
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights int;
    declare v_trade_acco varchar(32);
    declare v_order_dir int;
    declare v_tmp_exgp_busi_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_no = p_exch_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code = p_stock_code;
    SET v_target_stock_code = p_target_stock_code;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_dir = p_comm_dir;
    SET v_comm_qty = p_comm_qty;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_co_comm_appr_oper = 0;
    SET v_exgp_busi_config_str = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_stock_code_no = 0;
    SET v_target_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_minimum_turning_out_share = 0;
    SET v_target_subscription_trade_mark = 0;
    SET v_target_purchase_trade_mark = 0;
    SET v_target_rede_trade_mark = 0;
    SET v_target_first_minimum_amt = 0;
    SET v_target_minimum_purchase_amt = 0;
    SET v_target_minimum_subscription_amt = 0;
    SET v_target_minimum_rede_share = 0;
    SET v_target_minimum_holding_share = 0;
    SET v_target_minimum_turning_out_share = 0;
    SET v_fund_manager = " ";
    SET v_target_fund_manager = " ";
    SET v_charging_method = 0;
    SET v_target_charging_method = 0;
    SET v_sys_config_str = " ";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_target_opor_no = 0;
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";
    SET v_opor_rights = 0;
    SET v_trade_acco = " ";
    SET v_order_dir = 0;
    SET v_tmp_exgp_busi_config_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_交易接口_检查基金转换指令业务属性】*/
    call db_pub.pra_trdif_CheckFundTransApprProp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_target_stock_code,
        v_comm_dir,
        v_comm_qty,
        v_comm_limit_price,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_target_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_crncy_type,
        v_exch_crncy_type,
        v_capit_reback_days,
        v_posi_reback_days,
        v_par_value,
        v_subscription_trade_mark,
        v_purchase_trade_mark,
        v_rede_trade_mark,
        v_first_minimum_amt,
        v_minimum_purchase_amt,
        v_minimum_subscription_amt,
        v_minimum_rede_share,
        v_minimum_holding_share,
        v_minimum_turning_out_share,
        v_target_subscription_trade_mark,
        v_target_purchase_trade_mark,
        v_target_rede_trade_mark,
        v_target_first_minimum_amt,
        v_target_minimum_purchase_amt,
        v_target_minimum_subscription_amt,
        v_target_minimum_rede_share,
        v_target_minimum_holding_share,
        v_target_minimum_turning_out_share,
        v_fund_manager,
        v_target_fund_manager,
        v_charging_method,
        v_target_charging_method);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.10.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查基金转换指令业务属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查指令系统状态】*/
    call db_pub.pra_trdif_CheckApprSysStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_init_date,
        v_co_busi_config_str,
        v_co_comm_appr_oper,
        v_sys_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.10.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查指令系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查交易市场状态】*/
    call db_pub.pra_trdif_CheckTrdMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_buy_ref_rate,
        v_sell_ref_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.10.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.10.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.10.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.10.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号#=@操作员编号#; */
    set v_target_opor_no=v_opor_no;

    /* 调用【原子_公共_用户_获取操作员权限串】*/
    call db_pub.pra_user_GetOporRightsStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_opor_rights_str,
        v_allow_oper_mac);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.10.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #校验指令权限

    /* if (@允许操作MAC#<>" " or @允许操作MAC#<>"") then */
    if (v_allow_oper_mac<>" " or v_allow_oper_mac<>"") then

        /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][209][@操作员编号#] */
        if locate(v_oper_mac,v_allow_oper_mac)=0 then
            
            SET v_error_code = "pubT.25.10.209";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* set @操作员权限#=1; */
        set v_opor_rights=1;

        /* [检查报错返回][locate(@操作员权限#,@操作员权限串#)=0][206][@操作员编号#] */
        if locate(v_opor_rights,v_opor_rights_str)=0 then
            
            SET v_error_code = "pubT.25.10.206";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.10.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

        #交易组级，订单方向检查。Modify by wjp 20190428

        /* set @订单方向# = @指令方向#; */
        set v_order_dir = v_comm_dir;

        /* 调用【原子_公共_用户_检查交易组限制信息】*/
        call db_pub.pra_user_CheckExchGroupLimitInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_group_no,
            v_order_dir,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.10.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组限制信息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


    /* set @临时_交易组业务控制配置串# = @交易组业务控制配置串#; */
    set v_tmp_exgp_busi_config_str = v_exgp_busi_config_str;
    #对指令执行人进行可操作性检查

    /* if @指令执行人# <> (0)   and  substring(@系统控制配置串#,7,1) <>《系统类型-PB系统》  then */
    if v_comm_executor <> (0)   and  substring(v_sys_config_str,7,1) <>1  then

        /* set @操作员编号# = @指令执行人#; */
        set v_opor_no = v_comm_executor;
    #不校验指令执行人密码。

        /* 调用【原子_公共_用户_检查操作员身份无密码】*/
        call db_pub.pra_user_CheckOperatorAuthNoPwd(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_error_code,
            v_error_info,
            v_opor_type,
            v_oper_rights,
            v_is_trader);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.10.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份无密码出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

       # [原子_公共_用户_检查操作员身份]

        /* [检查报错返回][@是否交易员# <> 《是否交易员-是》][762][@指令执行人#, @是否交易员#] */
        if v_is_trader <> 1 then
            
            SET v_error_code = "pubT.25.10.762";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令执行人=",v_comm_executor,","," 是否交易员=", v_is_trader),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令执行人=",v_comm_executor,","," 是否交易员=", v_is_trader);
            end if;
            leave label_pro;
        end if;


        /* 调用【原子_公共_用户_检查操作员操作权限】*/
        call db_pub.pra_user_CheckOperatorOperRights(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_exch_group_no,
            v_oper_rights,
            v_error_code,
            v_error_info,
            v_pd_no);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.10.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* 调用【原子_公共_用户_检查交易组操作权限】*/
        call db_pub.pra_user_CheckExchGroupOperRights(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_group_no,
            v_exch_no,
            v_stock_type,
            v_error_code,
            v_error_info,
            v_pd_no,
            v_exgp_busi_config_str,
            v_trade_acco);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.10.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;

    /* set @交易组业务控制配置串# = @临时_交易组业务控制配置串#; */
    set v_exgp_busi_config_str = v_tmp_exgp_busi_config_str;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_co_comm_appr_oper = v_co_comm_appr_oper;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_stock_code_no = v_stock_code_no;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_net_price_flag = v_net_price_flag;
    SET p_par_value = v_par_value;
    SET p_subscription_trade_mark = v_subscription_trade_mark;
    SET p_purchase_trade_mark = v_purchase_trade_mark;
    SET p_rede_trade_mark = v_rede_trade_mark;
    SET p_first_minimum_amt = v_first_minimum_amt;
    SET p_minimum_purchase_amt = v_minimum_purchase_amt;
    SET p_minimum_subscription_amt = v_minimum_subscription_amt;
    SET p_minimum_rede_share = v_minimum_rede_share;
    SET p_minimum_holding_share = v_minimum_holding_share;
    SET p_minimum_turning_out_share = v_minimum_turning_out_share;
    SET p_target_subscription_trade_mark = v_target_subscription_trade_mark;
    SET p_target_purchase_trade_mark = v_target_purchase_trade_mark;
    SET p_target_rede_trade_mark = v_target_rede_trade_mark;
    SET p_target_first_minimum_amt = v_target_first_minimum_amt;
    SET p_target_minimum_purchase_amt = v_target_minimum_purchase_amt;
    SET p_target_minimum_subscription_amt = v_target_minimum_subscription_amt;
    SET p_target_minimum_rede_share = v_target_minimum_rede_share;
    SET p_target_minimum_holding_share = v_target_minimum_holding_share;
    SET p_target_minimum_turning_out_share = v_target_minimum_turning_out_share;
    SET p_fund_manager = v_fund_manager;
    SET p_target_fund_manager = v_target_fund_manager;
    SET p_charging_method = v_charging_method;
    SET p_target_charging_method = v_target_charging_method;
    SET p_sys_config_str = v_sys_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查指令市场状态权限身份
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckApprMarketStatusAuthOper;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckApprMarketStatusAuthOper(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_stock_code varchar(6),
    IN p_comm_executor int,
    IN p_comm_dir int,
    IN p_comm_qty decimal(18,2),
    IN p_comm_limit_price decimal(16,9),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_co_comm_appr_oper int,
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_buy_ref_rate decimal(18,12),
    OUT p_sell_ref_rate decimal(18,12),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_net_price_flag int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_intrst_days int,
    OUT p_bond_rate_type int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_target_code_no int,
    OUT p_target_code varchar(6),
    OUT p_target_code_stock_type int,
    OUT p_target_code_asset_type int,
    OUT p_trade_code_no int,
    OUT p_trade_code varchar(6),
    OUT p_trade_code_stock_type int,
    OUT p_trade_code_asset_type int,
    OUT p_min_unit int,
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_last_price decimal(16,9),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_pre_close_price decimal(16,9),
    OUT p_subscription_trade_mark int,
    OUT p_purchase_trade_mark int,
    OUT p_rede_trade_mark int,
    OUT p_first_minimum_amt decimal(18,4),
    OUT p_minimum_purchase_amt decimal(18,4),
    OUT p_minimum_subscription_amt decimal(18,4),
    OUT p_minimum_rede_share decimal(18,2),
    OUT p_minimum_holding_share decimal(18,2),
    OUT p_sys_config_str varchar(64),
    OUT p_online_opor_no_str varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_exch_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_stock_code varchar(6);
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_qty decimal(18,2);
    declare v_comm_limit_price decimal(16,9);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_co_comm_appr_oper int;
    declare v_exgp_busi_config_str varchar(64);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;
    declare v_trade_code_no int;
    declare v_trade_code varchar(6);
    declare v_trade_code_stock_type int;
    declare v_trade_code_asset_type int;
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_pre_close_price decimal(16,9);
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_sys_config_str varchar(64);
    declare v_online_opor_no_str varchar(2048);
    declare v_minimum_turning_out_share decimal(18,2);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_target_opor_no int;
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights int;
    declare v_trade_acco varchar(32);
    declare v_order_dir int;
    declare v_tmp_exgp_busi_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_no = p_exch_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code = p_stock_code;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_dir = p_comm_dir;
    SET v_comm_qty = p_comm_qty;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_co_comm_appr_oper = 0;
    SET v_exgp_busi_config_str = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;
    SET v_target_code_no = 0;
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_trade_code = " ";
    SET v_trade_code_stock_type = 0;
    SET v_trade_code_asset_type = 0;
    SET v_min_unit = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_pre_close_price = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_sys_config_str = " ";
    SET v_online_opor_no_str = " ";
    SET v_minimum_turning_out_share = 0;
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_target_opor_no = 0;
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";
    SET v_opor_rights = 0;
    SET v_trade_acco = " ";
    SET v_order_dir = 0;
    SET v_tmp_exgp_busi_config_str = " ";

    
    label_pro:BEGIN
    

    /* if @指令方向# <> 《指令方向-直接还款》 then */
    if v_comm_dir <> 14 then

        /* 调用【原子_公共_交易接口_检查证券指令业务属性】*/
        call db_pub.pra_trdif_CheckSecuApprProp(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_comm_dir,
            v_comm_qty,
            v_comm_limit_price,
            v_error_code,
            v_error_info,
            v_stock_code_no,
            v_stock_type,
            v_asset_type,
            v_crncy_type,
            v_exch_crncy_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_par_value,
            v_impawn_ratio,
            v_net_price_flag,
            v_intrst_days,
            v_bond_rate_type,
            v_bond_accr_intrst,
            v_min_unit,
            v_up_limit_price,
            v_down_limit_price,
            v_last_price,
            v_target_code_no,
            v_target_code,
            v_target_code_stock_type,
            v_target_code_asset_type,
            v_trade_code_no,
            v_trade_code,
            v_trade_code_stock_type,
            v_trade_code_asset_type,
            v_pre_close_price,
            v_subscription_trade_mark,
            v_purchase_trade_mark,
            v_rede_trade_mark,
            v_first_minimum_amt,
            v_minimum_purchase_amt,
            v_minimum_subscription_amt,
            v_minimum_rede_share,
            v_minimum_holding_share,
            v_minimum_turning_out_share);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查证券指令业务属性出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    else

        /* set @市场编号# = 《市场编号-上海证券交易所》; */
        set v_exch_no = 1;
    end if;

    /* 调用【原子_公共_交易接口_检查指令系统状态】*/
    call db_pub.pra_trdif_CheckApprSysStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_init_date,
        v_co_busi_config_str,
        v_co_comm_appr_oper,
        v_sys_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查指令系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查交易市场状态】*/
    call db_pub.pra_trdif_CheckTrdMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_buy_ref_rate,
        v_sell_ref_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号#=@操作员编号#; */
    set v_target_opor_no=v_opor_no;

    /* 调用【原子_公共_用户_获取操作员权限串】*/
    call db_pub.pra_user_GetOporRightsStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_opor_rights_str,
        v_allow_oper_mac);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #校验指令权限

    /* if (@允许操作MAC#<>" " or @允许操作MAC#<>"") then */
    if (v_allow_oper_mac<>" " or v_allow_oper_mac<>"") then

        /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][209][@操作员编号#] */
        if locate(v_oper_mac,v_allow_oper_mac)=0 then
            
            SET v_error_code = "pubT.25.11.209";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* set @操作员权限#=1; */
        set v_opor_rights=1;

        /* [检查报错返回][locate(@操作员权限#,@操作员权限串#)=0][206][@操作员编号#] */
        if locate(v_opor_rights,v_opor_rights_str)=0 then
            
            SET v_error_code = "pubT.25.11.206";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #交易组级，订单方向检查。Modify by wjp 20190428

    /* set @订单方向# = @指令方向#; */
    set v_order_dir = v_comm_dir;

    /* 调用【原子_公共_用户_检查交易组限制信息】*/
    call db_pub.pra_user_CheckExchGroupLimitInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_order_dir,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组限制信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @临时_交易组业务控制配置串# = @交易组业务控制配置串#; */
    set v_tmp_exgp_busi_config_str = v_exgp_busi_config_str;
    #对指令执行人进行可操作性检查

    /* if @指令执行人# <> (0)   and  substring(@系统控制配置串#,7,1) <>《系统类型-PB系统》  then */
    if v_comm_executor <> (0)   and  substring(v_sys_config_str,7,1) <>1  then

        /* set @操作员编号# = @指令执行人#; */
        set v_opor_no = v_comm_executor;
    #不校验指令执行人密码。

        /* 调用【原子_公共_用户_检查操作员身份无密码】*/
        call db_pub.pra_user_CheckOperatorAuthNoPwd(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_error_code,
            v_error_info,
            v_opor_type,
            v_oper_rights,
            v_is_trader);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份无密码出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

        #[原子_公共_用户_检查操作员身份]

        /* [检查报错返回][@是否交易员# <> 《是否交易员-是》][762][@指令执行人#, @是否交易员#] */
        if v_is_trader <> 1 then
            
            SET v_error_code = "pubT.25.11.762";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令执行人=",v_comm_executor,","," 是否交易员=", v_is_trader),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令执行人=",v_comm_executor,","," 是否交易员=", v_is_trader);
            end if;
            leave label_pro;
        end if;


        /* 调用【原子_公共_用户_检查操作员操作权限】*/
        call db_pub.pra_user_CheckOperatorOperRights(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_exch_group_no,
            v_oper_rights,
            v_error_code,
            v_error_info,
            v_pd_no);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* 调用【原子_公共_用户_检查交易组操作权限】*/
        call db_pub.pra_user_CheckExchGroupOperRights(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_group_no,
            v_exch_no,
            v_stock_type,
            v_error_code,
            v_error_info,
            v_pd_no,
            v_exgp_busi_config_str,
            v_trade_acco);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;

    /* set @交易组业务控制配置串# = @临时_交易组业务控制配置串#; */
    set v_exgp_busi_config_str = v_tmp_exgp_busi_config_str;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_co_comm_appr_oper = v_co_comm_appr_oper;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_buy_ref_rate = v_buy_ref_rate;
    SET p_sell_ref_rate = v_sell_ref_rate;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_net_price_flag = v_net_price_flag;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_target_code_no = v_target_code_no;
    SET p_target_code = v_target_code;
    SET p_target_code_stock_type = v_target_code_stock_type;
    SET p_target_code_asset_type = v_target_code_asset_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_trade_code = v_trade_code;
    SET p_trade_code_stock_type = v_trade_code_stock_type;
    SET p_trade_code_asset_type = v_trade_code_asset_type;
    SET p_min_unit = v_min_unit;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_last_price = v_last_price;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_pre_close_price = v_pre_close_price;
    SET p_subscription_trade_mark = v_subscription_trade_mark;
    SET p_purchase_trade_mark = v_purchase_trade_mark;
    SET p_rede_trade_mark = v_rede_trade_mark;
    SET p_first_minimum_amt = v_first_minimum_amt;
    SET p_minimum_purchase_amt = v_minimum_purchase_amt;
    SET p_minimum_subscription_amt = v_minimum_subscription_amt;
    SET p_minimum_rede_share = v_minimum_rede_share;
    SET p_minimum_holding_share = v_minimum_holding_share;
    SET p_sys_config_str = v_sys_config_str;
    SET p_online_opor_no_str = v_online_opor_no_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查批量指令市场状态权限身份
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckBatchApprMarketStatusAuthOper;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckBatchApprMarketStatusAuthOper(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_no_str varchar(2048),
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_stock_code_str varchar(4096),
    IN p_comm_executor int,
    IN p_comm_dir_str varchar(2048),
    IN p_comm_qty_str varchar(4096),
    IN p_limit_price_str varchar(4096),
    IN p_split_str varchar(4),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_co_comm_appr_oper int,
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_crncy_type_str varchar(2048),
    OUT p_exch_crncy_type_str varchar(2048),
    OUT p_buy_ref_rate_str varchar(2048),
    OUT p_sell_ref_rate_str varchar(2048),
    OUT p_stock_code_no_str varchar(4096),
    OUT p_stock_type_str varchar(2048),
    OUT p_asset_type_str varchar(2048),
    OUT p_net_price_flag_str varchar(2048),
    OUT p_par_value_str varchar(4096),
    OUT p_impawn_ratio_str varchar(4096),
    OUT p_intrst_days_str varchar(2048),
    OUT p_bond_rate_type_str varchar(4096),
    OUT p_bond_accr_intrst_str varchar(4096),
    OUT p_target_code_no_str varchar(4096),
    OUT p_target_code_str varchar(2048),
    OUT p_target_code_stock_type_str varchar(2048),
    OUT p_target_code_asset_type_str varchar(2048),
    OUT p_trade_code_no_str varchar(4096),
    OUT p_trade_code_str varchar(2048),
    OUT p_trade_code_stock_type_str varchar(2048),
    OUT p_trade_code_asset_type_str varchar(2048),
    OUT p_min_unit_str varchar(2048),
    OUT p_up_limit_price_str varchar(4096),
    OUT p_down_limit_price_str varchar(4096),
    OUT p_last_price_str varchar(4096),
    OUT p_capit_reback_days_str varchar(2048),
    OUT p_posi_reback_days_str varchar(2048),
    OUT p_limit_actual_price_str varchar(4096),
    OUT p_pre_close_price_str varchar(4096),
    OUT p_subscription_trade_mark_str varchar(4096),
    OUT p_purchase_trade_mark_str varchar(4096),
    OUT p_rede_trade_mark_str varchar(4096),
    OUT p_first_minimum_amt_str varchar(4096),
    OUT p_minimum_purchase_amt_str varchar(4096),
    OUT p_minimum_subscription_amt_str varchar(4096),
    OUT p_minimum_rede_share_str varchar(4096),
    OUT p_minimum_holding_share_str varchar(4096),
    OUT p_sys_config_str varchar(64),
    OUT p_online_opor_no_str varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_exch_no_str varchar(2048);
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_stock_code_str varchar(4096);
    declare v_comm_executor int;
    declare v_comm_dir_str varchar(2048);
    declare v_comm_qty_str varchar(4096);
    declare v_limit_price_str varchar(4096);
    declare v_split_str varchar(4);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_co_comm_appr_oper int;
    declare v_exgp_busi_config_str varchar(64);
    declare v_crncy_type_str varchar(2048);
    declare v_exch_crncy_type_str varchar(2048);
    declare v_buy_ref_rate_str varchar(2048);
    declare v_sell_ref_rate_str varchar(2048);
    declare v_stock_code_no_str varchar(4096);
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
    declare v_net_price_flag_str varchar(2048);
    declare v_par_value_str varchar(4096);
    declare v_impawn_ratio_str varchar(4096);
    declare v_intrst_days_str varchar(2048);
    declare v_bond_rate_type_str varchar(4096);
    declare v_bond_accr_intrst_str varchar(4096);
    declare v_target_code_no_str varchar(4096);
    declare v_target_code_str varchar(2048);
    declare v_target_code_stock_type_str varchar(2048);
    declare v_target_code_asset_type_str varchar(2048);
    declare v_trade_code_no_str varchar(4096);
    declare v_trade_code_str varchar(2048);
    declare v_trade_code_stock_type_str varchar(2048);
    declare v_trade_code_asset_type_str varchar(2048);
    declare v_min_unit_str varchar(2048);
    declare v_up_limit_price_str varchar(4096);
    declare v_down_limit_price_str varchar(4096);
    declare v_last_price_str varchar(4096);
    declare v_capit_reback_days_str varchar(2048);
    declare v_posi_reback_days_str varchar(2048);
    declare v_limit_actual_price_str varchar(4096);
    declare v_pre_close_price_str varchar(4096);
    declare v_subscription_trade_mark_str varchar(4096);
    declare v_purchase_trade_mark_str varchar(4096);
    declare v_rede_trade_mark_str varchar(4096);
    declare v_first_minimum_amt_str varchar(4096);
    declare v_minimum_purchase_amt_str varchar(4096);
    declare v_minimum_subscription_amt_str varchar(4096);
    declare v_minimum_rede_share_str varchar(4096);
    declare v_minimum_holding_share_str varchar(4096);
    declare v_sys_config_str varchar(64);
    declare v_online_opor_no_str varchar(2048);
    declare v_tmp_exch_no_str varchar(2048);
    declare v_tmp_stock_type_str varchar(2048);
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;
    declare v_trade_code_no int;
    declare v_trade_code varchar(6);
    declare v_trade_code_stock_type int;
    declare v_trade_code_asset_type int;
    declare v_pre_close_price decimal(16,9);
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_minimum_turning_out_share decimal(18,2);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_order_dir int;
    declare v_limit_actual_price decimal(16,9);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_target_opor_no int;
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights int;
    declare v_trade_acco varchar(32);
    declare v_tmp_exgp_busi_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code_str = p_stock_code_str;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_comm_qty_str = p_comm_qty_str;
    SET v_limit_price_str = p_limit_price_str;
    SET v_split_str = p_split_str;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_co_comm_appr_oper = 0;
    SET v_exgp_busi_config_str = " ";
    SET v_crncy_type_str = " ";
    SET v_exch_crncy_type_str = " ";
    SET v_buy_ref_rate_str = " ";
    SET v_sell_ref_rate_str = " ";
    SET v_stock_code_no_str = " ";
    SET v_stock_type_str = " ";
    SET v_asset_type_str = " ";
    SET v_net_price_flag_str = " ";
    SET v_par_value_str = " ";
    SET v_impawn_ratio_str = " ";
    SET v_intrst_days_str = " ";
    SET v_bond_rate_type_str = " ";
    SET v_bond_accr_intrst_str = " ";
    SET v_target_code_no_str = " ";
    SET v_target_code_str = " ";
    SET v_target_code_stock_type_str = " ";
    SET v_target_code_asset_type_str = " ";
    SET v_trade_code_no_str = " ";
    SET v_trade_code_str = " ";
    SET v_trade_code_stock_type_str = " ";
    SET v_trade_code_asset_type_str = " ";
    SET v_min_unit_str = " ";
    SET v_up_limit_price_str = " ";
    SET v_down_limit_price_str = " ";
    SET v_last_price_str = " ";
    SET v_capit_reback_days_str = " ";
    SET v_posi_reback_days_str = " ";
    SET v_limit_actual_price_str = " ";
    SET v_pre_close_price_str = " ";
    SET v_subscription_trade_mark_str = " ";
    SET v_purchase_trade_mark_str = " ";
    SET v_rede_trade_mark_str = " ";
    SET v_first_minimum_amt_str = " ";
    SET v_minimum_purchase_amt_str = " ";
    SET v_minimum_subscription_amt_str = " ";
    SET v_minimum_rede_share_str = " ";
    SET v_minimum_holding_share_str = " ";
    SET v_sys_config_str = " ";
    SET v_online_opor_no_str = " ";
    SET v_tmp_exch_no_str = " ";
    SET v_tmp_stock_type_str = " ";
    SET v_stock_code = " ";
    SET v_exch_no = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_comm_qty = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;
    SET v_min_unit = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_target_code_no = 0;
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_trade_code = " ";
    SET v_trade_code_stock_type = 0;
    SET v_trade_code_asset_type = 0;
    SET v_pre_close_price = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_minimum_turning_out_share = 0;
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_order_dir = 0;
    SET v_limit_actual_price = 0;
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_target_opor_no = 0;
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";
    SET v_opor_rights = 0;
    SET v_trade_acco = " ";
    SET v_tmp_exgp_busi_config_str = " ";

    
    label_pro:BEGIN
    

    /* set @本币币种串# = ""; */
    set v_crncy_type_str = "";

    /* set @交易币种串# = ""; */
    set v_exch_crncy_type_str = "";

    /* set @买入参考汇率串# = ""; */
    set v_buy_ref_rate_str = "";

    /* set @卖出参考汇率串# = ""; */
    set v_sell_ref_rate_str = "";

    /* set @证券代码编号串# = ""; */
    set v_stock_code_no_str = "";

    /* set @证券类型串# = ""; */
    set v_stock_type_str = "";

    /* set @资产类型串# = ""; */
    set v_asset_type_str = "";

    /* set @净价标志串# = ""; */
    set v_net_price_flag_str = "";

    /* set @票面面值串# = ""; */
    set v_par_value_str = "";

    /* set @质押比例串# = ""; */
    set v_impawn_ratio_str = "";

    /* set @计息天数串# = ""; */
    set v_intrst_days_str = "";

    /* set @债券利率类型串# = ""; */
    set v_bond_rate_type_str = "";

    /* set @债券计提利息串# = ""; */
    set v_bond_accr_intrst_str = "";

    /* set @标的代码编号串# = ""; */
    set v_target_code_no_str = "";

    /* set @标的代码串# = ""; */
    set v_target_code_str = "";

    /* set @标的代码证券类型串# = ""; */
    set v_target_code_stock_type_str = "";

    /* set @标的代码资产类型串# = ""; */
    set v_target_code_asset_type_str = "";

    /* set @交易代码编号串# = ""; */
    set v_trade_code_no_str = "";

    /* set @交易代码串# = ""; */
    set v_trade_code_str = "";

    /* set @交易代码证券类型串# = ""; */
    set v_trade_code_stock_type_str = "";

    /* set @交易代码资产类型串# = ""; */
    set v_trade_code_asset_type_str = "";

    /* set @最小单位串# = ""; */
    set v_min_unit_str = "";

    /* set @涨停价串# = ""; */
    set v_up_limit_price_str = "";

    /* set @跌停价串# = ""; */
    set v_down_limit_price_str = "";

    /* set @最新价串# = ""; */
    set v_last_price_str = "";

    /* set @昨收盘价串# = ""; */
    set v_pre_close_price_str = "";

    /* set @资金回转天数串# = ""; */
    set v_capit_reback_days_str = "";

    /* set @持仓回转天数串# = ""; */
    set v_posi_reback_days_str = "";

    /* set @指令实际限价串# = ""; */
    set v_limit_actual_price_str = "";

    /* set @认购交易标志串#=""; */
    set v_subscription_trade_mark_str="";

    /* set @申购交易标志串#=""; */
    set v_purchase_trade_mark_str="";

    /* set @赎回交易标志串#=""; */
    set v_rede_trade_mark_str="";

    /* set @首次最低金额串#=""; */
    set v_first_minimum_amt_str="";

    /* set @最低申购金额串#=""; */
    set v_minimum_purchase_amt_str="";

    /* set @最低认购金额串#=""; */
    set v_minimum_subscription_amt_str="";

    /* set @最低赎回份额串#=""; */
    set v_minimum_rede_share_str="";

    /* set @最低持有份额串#=""; */
    set v_minimum_holding_share_str="";

    /* set @临时_市场编号串# = ""; */
    set v_tmp_exch_no_str = "";

    /* set @临时_证券类型串# = ""; */
    set v_tmp_stock_type_str = "";

    /* if @分隔符# = ' ' then */
    if v_split_str = ' ' then

        /* set @分隔符#= ';'; */
        set v_split_str= ';';
    end if;

    /* while LOCATE(@分隔符#,@证券代码串#) <>0   do */
    while LOCATE(v_split_str,v_stock_code_str) <>0   do
        #截取前面每一位

        /* set @证券代码#=substring(@证券代码串#,1,LOCATE(@分隔符#,@证券代码串#)-1); */
        set v_stock_code=substring(v_stock_code_str,1,LOCATE(v_split_str,v_stock_code_str)-1);

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

        /* set @指令方向#=cast(substring(@指令方向串#,1,LOCATE(@分隔符#,@指令方向串#)-1) as SIGNED); */
        set v_comm_dir=cast(substring(v_comm_dir_str,1,LOCATE(v_split_str,v_comm_dir_str)-1) as SIGNED);

        /* set @指令限价#=cast(substring(@指令限价串#,1,LOCATE(@分隔符#,@指令限价串#)-1) as decimal(16,9)); */
        set v_comm_limit_price=cast(substring(v_limit_price_str,1,LOCATE(v_split_str,v_limit_price_str)-1) as decimal(16,9));

        /* set @指令数量#=cast(substring(@指令数量串#,1,LOCATE(@分隔符#,@指令数量串#)-1) as decimal(18,2)); */
        set v_comm_qty=cast(substring(v_comm_qty_str,1,LOCATE(v_split_str,v_comm_qty_str)-1) as decimal(18,2));

        /* 调用【原子_公共_交易接口_检查证券指令业务属性】*/
        call db_pub.pra_trdif_CheckSecuApprProp(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_comm_dir,
            v_comm_qty,
            v_comm_limit_price,
            v_error_code,
            v_error_info,
            v_stock_code_no,
            v_stock_type,
            v_asset_type,
            v_crncy_type,
            v_exch_crncy_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_par_value,
            v_impawn_ratio,
            v_net_price_flag,
            v_intrst_days,
            v_bond_rate_type,
            v_bond_accr_intrst,
            v_min_unit,
            v_up_limit_price,
            v_down_limit_price,
            v_last_price,
            v_target_code_no,
            v_target_code,
            v_target_code_stock_type,
            v_target_code_asset_type,
            v_trade_code_no,
            v_trade_code,
            v_trade_code_stock_type,
            v_trade_code_asset_type,
            v_pre_close_price,
            v_subscription_trade_mark,
            v_purchase_trade_mark,
            v_rede_trade_mark,
            v_first_minimum_amt,
            v_minimum_purchase_amt,
            v_minimum_subscription_amt,
            v_minimum_rede_share,
            v_minimum_holding_share,
            v_minimum_turning_out_share);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查证券指令业务属性出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* if LOCATE(@临时_市场编号串#, @市场编号#) > 0 or LOCATE(@临时_证券类型串#, @证券类型#) > 0 then */
        if LOCATE(v_tmp_exch_no_str, v_exch_no) > 0 or LOCATE(v_tmp_stock_type_str, v_stock_type) > 0 then

            /* 调用【原子_公共_交易接口_检查指令系统状态】*/
            call db_pub.pra_trdif_CheckApprSysStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_exch_no,
                v_stock_type,
                v_error_code,
                v_error_info,
                v_init_date,
                v_co_busi_config_str,
                v_co_comm_appr_oper,
                v_sys_config_str);
            if v_error_code = "1" then
                SET v_error_code = "pubT.25.12.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查指令系统状态出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @临时_市场编号串#  = concat(@临时_市场编号串#,@市场编号#,";"); */
            set v_tmp_exch_no_str  = concat(v_tmp_exch_no_str,v_exch_no,";");

            /* set @临时_证券类型串#  = concat(@临时_证券类型串#,@证券类型#,";"); */
            set v_tmp_stock_type_str  = concat(v_tmp_stock_type_str,v_stock_type,";");
        end if;

        /* 调用【原子_公共_交易接口_检查交易市场状态】*/
        call db_pub.pra_trdif_CheckTrdMarketStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_exch_no,
            v_error_code,
            v_error_info,
            v_init_date,
            v_buy_ref_rate,
            v_sell_ref_rate);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易市场状态出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

        #交易组级，订单方向检查。Modify by wjp 20190428

        /* set @订单方向# = @指令方向#; */
        set v_order_dir = v_comm_dir;

        /* 调用【原子_公共_用户_检查交易组限制信息】*/
        call db_pub.pra_user_CheckExchGroupLimitInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_group_no,
            v_order_dir,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组限制信息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @本币币种串#  = concat(@本币币种串#,@本币币种#,";"); */
        set v_crncy_type_str  = concat(v_crncy_type_str,v_crncy_type,";");

        /* set @交易币种串#  = concat(@交易币种串#,@交易币种#,";"); */
        set v_exch_crncy_type_str  = concat(v_exch_crncy_type_str,v_exch_crncy_type,";");

        /* set @买入参考汇率串#  = concat(@买入参考汇率串#,@买入参考汇率#,";"); */
        set v_buy_ref_rate_str  = concat(v_buy_ref_rate_str,v_buy_ref_rate,";");

        /* set @卖出参考汇率串#  = concat(@卖出参考汇率串#,@卖出参考汇率#,";"); */
        set v_sell_ref_rate_str  = concat(v_sell_ref_rate_str,v_sell_ref_rate,";");

        /* set @证券代码编号串#  = concat(@证券代码编号串#,@证券代码编号#,";"); */
        set v_stock_code_no_str  = concat(v_stock_code_no_str,v_stock_code_no,";");

        /* set @证券类型串#  = concat(@证券类型串#,@证券类型#,";"); */
        set v_stock_type_str  = concat(v_stock_type_str,v_stock_type,";");

        /* set @资产类型串#  = concat(@资产类型串#,@资产类型#,";"); */
        set v_asset_type_str  = concat(v_asset_type_str,v_asset_type,";");

        /* set @净价标志串#  = concat(@净价标志串#,@净价标志#,";"); */
        set v_net_price_flag_str  = concat(v_net_price_flag_str,v_net_price_flag,";");

        /* set @票面面值串#  = concat(@票面面值串#,@票面面值#,";"); */
        set v_par_value_str  = concat(v_par_value_str,v_par_value,";");

        /* set @质押比例串#  = concat(@质押比例串#,@质押比例#,";"); */
        set v_impawn_ratio_str  = concat(v_impawn_ratio_str,v_impawn_ratio,";");

        /* set @计息天数串#  = concat(@计息天数串#,@计息天数#,";"); */
        set v_intrst_days_str  = concat(v_intrst_days_str,v_intrst_days,";");

        /* set @债券利率类型串#  = concat(@债券利率类型串#,@债券利率类型#,";"); */
        set v_bond_rate_type_str  = concat(v_bond_rate_type_str,v_bond_rate_type,";");

        /* set @债券计提利息串#  = concat(@债券计提利息串#,@债券计提利息#,";"); */
        set v_bond_accr_intrst_str  = concat(v_bond_accr_intrst_str,v_bond_accr_intrst,";");

        /* set @标的代码编号串#  = concat(@标的代码编号串#,@标的代码编号#,";"); */
        set v_target_code_no_str  = concat(v_target_code_no_str,v_target_code_no,";");

        /* set @标的代码串#  = concat(@标的代码串#,@标的代码#,";"); */
        set v_target_code_str  = concat(v_target_code_str,v_target_code,";");

        /* set @标的代码证券类型串#  = concat(@标的代码证券类型串#,@标的代码证券类型#,";"); */
        set v_target_code_stock_type_str  = concat(v_target_code_stock_type_str,v_target_code_stock_type,";");

        /* set @标的代码资产类型串#  = concat(@标的代码资产类型串#,@标的代码资产类型#,";"); */
        set v_target_code_asset_type_str  = concat(v_target_code_asset_type_str,v_target_code_asset_type,";");

        /* set @交易代码编号串#  = concat(@交易代码编号串#,@交易代码编号#,";"); */
        set v_trade_code_no_str  = concat(v_trade_code_no_str,v_trade_code_no,";");

        /* set @交易代码串#  = concat(@交易代码串#,@交易代码#,";"); */
        set v_trade_code_str  = concat(v_trade_code_str,v_trade_code,";");

        /* set @交易代码证券类型串#  = concat(@交易代码证券类型串#,@交易代码证券类型#,";"); */
        set v_trade_code_stock_type_str  = concat(v_trade_code_stock_type_str,v_trade_code_stock_type,";");

        /* set @交易代码资产类型串#  = concat(@交易代码资产类型串#,@交易代码资产类型#,";"); */
        set v_trade_code_asset_type_str  = concat(v_trade_code_asset_type_str,v_trade_code_asset_type,";");

        /* set @最小单位串#  = concat(@最小单位串#,@最小单位#,";"); */
        set v_min_unit_str  = concat(v_min_unit_str,v_min_unit,";");

        /* set @涨停价串#  = concat(@涨停价串#,@涨停价#,";"); */
        set v_up_limit_price_str  = concat(v_up_limit_price_str,v_up_limit_price,";");

        /* set @跌停价串#  = concat(@跌停价串#,@跌停价#,";"); */
        set v_down_limit_price_str  = concat(v_down_limit_price_str,v_down_limit_price,";");

        /* set @最新价串#  = concat(@最新价串#,@最新价#,";"); */
        set v_last_price_str  = concat(v_last_price_str,v_last_price,";");

        /* set @昨收盘价串#  = concat(@昨收盘价串#,@昨收盘价#,";"); */
        set v_pre_close_price_str  = concat(v_pre_close_price_str,v_pre_close_price,";");

        /* set @资金回转天数串#  = concat(@资金回转天数串#,@资金回转天数#,";"); */
        set v_capit_reback_days_str  = concat(v_capit_reback_days_str,v_capit_reback_days,";");

        /* set @持仓回转天数串#  = concat(@持仓回转天数串#,@持仓回转天数#,";"); */
        set v_posi_reback_days_str  = concat(v_posi_reback_days_str,v_posi_reback_days,";");

        /* set @认购交易标志串#=concat(@认购交易标志串#,@认购交易标志#,";"); */
        set v_subscription_trade_mark_str=concat(v_subscription_trade_mark_str,v_subscription_trade_mark,";");

        /* set @申购交易标志串#=concat(@申购交易标志串#,@申购交易标志#,";"); */
        set v_purchase_trade_mark_str=concat(v_purchase_trade_mark_str,v_purchase_trade_mark,";");

        /* set @赎回交易标志串#=concat(@赎回交易标志串#,@赎回交易标志#,";"); */
        set v_rede_trade_mark_str=concat(v_rede_trade_mark_str,v_rede_trade_mark,";");

        /* set @首次最低金额串#=concat(@首次最低金额串#,@首次最低金额#,";"); */
        set v_first_minimum_amt_str=concat(v_first_minimum_amt_str,v_first_minimum_amt,";");

        /* set @最低申购金额串#=concat(@最低申购金额串#,@最低申购金额#,";"); */
        set v_minimum_purchase_amt_str=concat(v_minimum_purchase_amt_str,v_minimum_purchase_amt,";");

        /* set @最低认购金额串#=concat(@最低认购金额串#,@最低认购金额#,";"); */
        set v_minimum_subscription_amt_str=concat(v_minimum_subscription_amt_str,v_minimum_subscription_amt,";");

        /* set @最低赎回份额串#=concat(@最低赎回份额串#,@最低赎回份额#,";"); */
        set v_minimum_rede_share_str=concat(v_minimum_rede_share_str,v_minimum_rede_share,";");

        /* set @最低持有份额串#=concat(@最低持有份额串#,@最低持有份额#,";"); */
        set v_minimum_holding_share_str=concat(v_minimum_holding_share_str,v_minimum_holding_share,";");

        /* set @指令实际限价#=@指令限价#; */
        set v_limit_actual_price=v_comm_limit_price;
        #if @指令限价#=0 then
        #    if @指令方向#=《指令方向-买入》 then
        #        set @指令实际限价#=@涨停价#;
       #    elseif @指令方向#=《指令方向-卖出》 then
        #        set @指令实际限价#=@跌停价#;
        #    end if;
       # end if;

        /* set @指令实际限价串# = concat(@指令实际限价串#,@指令实际限价#,";"); */
        set v_limit_actual_price_str = concat(v_limit_actual_price_str,v_limit_actual_price,";");

        /* set @证券代码串#=substring(@证券代码串#,LOCATE(@分隔符#,@证券代码串#)+1); */
        set v_stock_code_str=substring(v_stock_code_str,LOCATE(v_split_str,v_stock_code_str)+1);

        /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
        set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

        /* set @指令方向串#=substring(@指令方向串#,LOCATE(@分隔符#,@指令方向串#)+1); */
        set v_comm_dir_str=substring(v_comm_dir_str,LOCATE(v_split_str,v_comm_dir_str)+1);

        /* set @指令限价串#=substring(@指令限价串#,LOCATE(@分隔符#,@指令限价串#)+1); */
        set v_limit_price_str=substring(v_limit_price_str,LOCATE(v_split_str,v_limit_price_str)+1);

        /* set @指令数量串#=substring(@指令数量串#,LOCATE(@分隔符#,@指令数量串#)+1); */
        set v_comm_qty_str=substring(v_comm_qty_str,LOCATE(v_split_str,v_comm_qty_str)+1);
    end while;

    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号#=@操作员编号#; */
    set v_target_opor_no=v_opor_no;

    /* 调用【原子_公共_用户_获取操作员权限串】*/
    call db_pub.pra_user_GetOporRightsStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_opor_rights_str,
        v_allow_oper_mac);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #校验指令权限

    /* if (@允许操作MAC#<>" " or @允许操作MAC#<>"") then */
    if (v_allow_oper_mac<>" " or v_allow_oper_mac<>"") then

        /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][209][@操作员编号#] */
        if locate(v_oper_mac,v_allow_oper_mac)=0 then
            
            SET v_error_code = "pubT.25.12.209";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* set @操作员权限#=1; */
        set v_opor_rights=1;

        /* [检查报错返回][locate(@操作员权限#,@操作员权限串#)=0][206][@操作员编号#] */
        if locate(v_opor_rights,v_opor_rights_str)=0 then
            
            SET v_error_code = "pubT.25.12.206";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @临时_交易组业务控制配置串# = @交易组业务控制配置串#; */
    set v_tmp_exgp_busi_config_str = v_exgp_busi_config_str;
    #对指令执行人进行可操作性检查

    /* if @指令执行人# <> (0)   and  substring(@系统控制配置串#,7,1) <>《系统类型-PB系统》  then */
    if v_comm_executor <> (0)   and  substring(v_sys_config_str,7,1) <>1  then

        /* set @操作员编号# = @指令执行人#; */
        set v_opor_no = v_comm_executor;
    #不校验指令执行人密码。

        /* 调用【原子_公共_用户_检查操作员身份无密码】*/
        call db_pub.pra_user_CheckOperatorAuthNoPwd(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_error_code,
            v_error_info,
            v_opor_type,
            v_oper_rights,
            v_is_trader);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份无密码出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

        #[原子_公共_用户_检查操作员身份]

        /* [检查报错返回][@是否交易员# <> 《是否交易员-是》][762][@指令执行人#, @是否交易员#] */
        if v_is_trader <> 1 then
            
            SET v_error_code = "pubT.25.12.762";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令执行人=",v_comm_executor,","," 是否交易员=", v_is_trader),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令执行人=",v_comm_executor,","," 是否交易员=", v_is_trader);
            end if;
            leave label_pro;
        end if;


        /* 调用【原子_公共_用户_检查操作员操作权限】*/
        call db_pub.pra_user_CheckOperatorOperRights(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_exch_group_no,
            v_oper_rights,
            v_error_code,
            v_error_info,
            v_pd_no);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* 调用【原子_公共_用户_检查交易组操作权限】*/
        call db_pub.pra_user_CheckExchGroupOperRights(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_group_no,
            v_exch_no,
            v_stock_type,
            v_error_code,
            v_error_info,
            v_pd_no,
            v_exgp_busi_config_str,
            v_trade_acco);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;

    /* set @交易组业务控制配置串# = @临时_交易组业务控制配置串#; */
    set v_exgp_busi_config_str = v_tmp_exgp_busi_config_str;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_co_comm_appr_oper = v_co_comm_appr_oper;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_crncy_type_str = v_crncy_type_str;
    SET p_exch_crncy_type_str = v_exch_crncy_type_str;
    SET p_buy_ref_rate_str = v_buy_ref_rate_str;
    SET p_sell_ref_rate_str = v_sell_ref_rate_str;
    SET p_stock_code_no_str = v_stock_code_no_str;
    SET p_stock_type_str = v_stock_type_str;
    SET p_asset_type_str = v_asset_type_str;
    SET p_net_price_flag_str = v_net_price_flag_str;
    SET p_par_value_str = v_par_value_str;
    SET p_impawn_ratio_str = v_impawn_ratio_str;
    SET p_intrst_days_str = v_intrst_days_str;
    SET p_bond_rate_type_str = v_bond_rate_type_str;
    SET p_bond_accr_intrst_str = v_bond_accr_intrst_str;
    SET p_target_code_no_str = v_target_code_no_str;
    SET p_target_code_str = v_target_code_str;
    SET p_target_code_stock_type_str = v_target_code_stock_type_str;
    SET p_target_code_asset_type_str = v_target_code_asset_type_str;
    SET p_trade_code_no_str = v_trade_code_no_str;
    SET p_trade_code_str = v_trade_code_str;
    SET p_trade_code_stock_type_str = v_trade_code_stock_type_str;
    SET p_trade_code_asset_type_str = v_trade_code_asset_type_str;
    SET p_min_unit_str = v_min_unit_str;
    SET p_up_limit_price_str = v_up_limit_price_str;
    SET p_down_limit_price_str = v_down_limit_price_str;
    SET p_last_price_str = v_last_price_str;
    SET p_capit_reback_days_str = v_capit_reback_days_str;
    SET p_posi_reback_days_str = v_posi_reback_days_str;
    SET p_limit_actual_price_str = v_limit_actual_price_str;
    SET p_pre_close_price_str = v_pre_close_price_str;
    SET p_subscription_trade_mark_str = v_subscription_trade_mark_str;
    SET p_purchase_trade_mark_str = v_purchase_trade_mark_str;
    SET p_rede_trade_mark_str = v_rede_trade_mark_str;
    SET p_first_minimum_amt_str = v_first_minimum_amt_str;
    SET p_minimum_purchase_amt_str = v_minimum_purchase_amt_str;
    SET p_minimum_subscription_amt_str = v_minimum_subscription_amt_str;
    SET p_minimum_rede_share_str = v_minimum_rede_share_str;
    SET p_minimum_holding_share_str = v_minimum_holding_share_str;
    SET p_sys_config_str = v_sys_config_str;
    SET p_online_opor_no_str = v_online_opor_no_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查证券指令业务属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckSecuApprProp;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckSecuApprProp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_comm_dir int,
    IN p_comm_qty decimal(18,2),
    IN p_comm_limit_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_bond_rate_type int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_min_unit int,
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_last_price decimal(16,9),
    OUT p_target_code_no int,
    OUT p_target_code varchar(6),
    OUT p_target_code_stock_type int,
    OUT p_target_code_asset_type int,
    OUT p_trade_code_no int,
    OUT p_trade_code varchar(6),
    OUT p_trade_code_stock_type int,
    OUT p_trade_code_asset_type int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_comm_dir int;
    declare v_comm_qty decimal(18,2);
    declare v_comm_limit_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;
    declare v_trade_code_no int;
    declare v_trade_code varchar(6);
    declare v_trade_code_stock_type int;
    declare v_trade_code_asset_type int;
    declare v_pre_close_price decimal(16,9);
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_minimum_turning_out_share decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_comm_dir = p_comm_dir;
    SET v_comm_qty = p_comm_qty;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;
    SET v_min_unit = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_target_code_no = 0;
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_trade_code = " ";
    SET v_trade_code_stock_type = 0;
    SET v_trade_code_asset_type = 0;
    SET v_pre_close_price = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_minimum_turning_out_share = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_交易接口_检查证券指令业务属性】*/
    call db_pub.pra_trdif_CheckSecuApprProp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_comm_dir,
        v_comm_qty,
        v_comm_limit_price,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_crncy_type,
        v_exch_crncy_type,
        v_capit_reback_days,
        v_posi_reback_days,
        v_par_value,
        v_impawn_ratio,
        v_net_price_flag,
        v_intrst_days,
        v_bond_rate_type,
        v_bond_accr_intrst,
        v_min_unit,
        v_up_limit_price,
        v_down_limit_price,
        v_last_price,
        v_target_code_no,
        v_target_code,
        v_target_code_stock_type,
        v_target_code_asset_type,
        v_trade_code_no,
        v_trade_code,
        v_trade_code_stock_type,
        v_trade_code_asset_type,
        v_pre_close_price,
        v_subscription_trade_mark,
        v_purchase_trade_mark,
        v_rede_trade_mark,
        v_first_minimum_amt,
        v_minimum_purchase_amt,
        v_minimum_subscription_amt,
        v_minimum_rede_share,
        v_minimum_holding_share,
        v_minimum_turning_out_share);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查证券指令业务属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_min_unit = v_min_unit;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_last_price = v_last_price;
    SET p_target_code_no = v_target_code_no;
    SET p_target_code = v_target_code;
    SET p_target_code_stock_type = v_target_code_stock_type;
    SET p_target_code_asset_type = v_target_code_asset_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_trade_code = v_trade_code;
    SET p_trade_code_stock_type = v_trade_code_stock_type;
    SET p_trade_code_asset_type = v_trade_code_asset_type;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查指令分发系统状态权限身份
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckApprDispSysStatusAuthOper;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckApprDispSysStatusAuthOper(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_comm_executor int,
    IN p_opor_pwd varchar(64),
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_buy_ref_rate decimal(18,12),
    OUT p_sell_ref_rate decimal(18,12)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_comm_executor int;
    declare v_opor_pwd varchar(64);
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_stock_type int;
    declare v_co_busi_config_str varchar(64);
    declare v_co_comm_appr_oper int;
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_target_opor_no int;
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights int;
    declare v_exgp_busi_config_str varchar(64);
    declare v_trade_acco varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_comm_executor = p_comm_executor;
    SET v_opor_pwd = p_opor_pwd;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_stock_type = 0;
    SET v_co_busi_config_str = " ";
    SET v_co_comm_appr_oper = 0;
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_target_opor_no = 0;
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";
    SET v_opor_rights = 0;
    SET v_exgp_busi_config_str = " ";
    SET v_trade_acco = " ";

    
    label_pro:BEGIN
    

    /* set @证券类型# = 0; */
    set v_stock_type = 0;

    /* 调用【原子_公共_交易接口_检查指令系统状态】*/
    call db_pub.pra_trdif_CheckApprSysStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_init_date,
        v_co_busi_config_str,
        v_co_comm_appr_oper,
        v_sys_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查指令系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查交易市场状态】*/
    call db_pub.pra_trdif_CheckTrdMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_buy_ref_rate,
        v_sell_ref_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号#=@操作员编号#; */
    set v_target_opor_no=v_opor_no;

    /* 调用【原子_公共_用户_获取操作员权限串】*/
    call db_pub.pra_user_GetOporRightsStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_opor_rights_str,
        v_allow_oper_mac);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #校验指令权限

    /* if (@允许操作MAC#<>" " or @允许操作MAC#<>"") then */
    if (v_allow_oper_mac<>" " or v_allow_oper_mac<>"") then

        /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][209][@操作员编号#] */
        if locate(v_oper_mac,v_allow_oper_mac)=0 then
            
            SET v_error_code = "pubT.25.14.209";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* set @操作员权限#=1; */
        set v_opor_rights=1;

        /* [检查报错返回][locate(@操作员权限#,@操作员权限串#)=0][206][@操作员编号#] */
        if locate(v_opor_rights,v_opor_rights_str)=0 then
            
            SET v_error_code = "pubT.25.14.206";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #对指令执行人进行可操作性检查

    /* if @指令执行人# <> (0) then */
    if v_comm_executor <> (0) then

        /* set @操作员编号# = @指令执行人#; */
        set v_opor_no = v_comm_executor;
    #不校验指令执行人密码。

        /* 调用【原子_公共_用户_检查操作员身份无密码】*/
        call db_pub.pra_user_CheckOperatorAuthNoPwd(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_error_code,
            v_error_info,
            v_opor_type,
            v_oper_rights,
            v_is_trader);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.14.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份无密码出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

        #[原子_公共_用户_检查操作员身份]

        /* [检查报错返回][@是否交易员# <> 《是否交易员-是》][762][@指令执行人#, @是否交易员#] */
        if v_is_trader <> 1 then
            
            SET v_error_code = "pubT.25.14.762";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令执行人=",v_comm_executor,","," 是否交易员=", v_is_trader),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令执行人=",v_comm_executor,","," 是否交易员=", v_is_trader);
            end if;
            leave label_pro;
        end if;


        /* 调用【原子_公共_用户_检查操作员操作权限】*/
        call db_pub.pra_user_CheckOperatorOperRights(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_exch_group_no,
            v_oper_rights,
            v_error_code,
            v_error_info,
            v_pd_no);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.14.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* 调用【原子_公共_用户_检查交易组操作权限】*/
        call db_pub.pra_user_CheckExchGroupOperRights(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_group_no,
            v_exch_no,
            v_stock_type,
            v_error_code,
            v_error_info,
            v_pd_no,
            v_exgp_busi_config_str,
            v_trade_acco);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.14.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_buy_ref_rate = v_buy_ref_rate;
    SET p_sell_ref_rate = v_sell_ref_rate;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查基金转换交易市场状态权限身份
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckFundTransExchMarketStatusAuthOper;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckFundTransExchMarketStatusAuthOper(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_stock_code varchar(6),
    IN p_target_stock_code varchar(6),
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_sys_config_str varchar(64),
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_stock_code_no int,
    OUT p_target_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_subscription_trade_mark int,
    OUT p_purchase_trade_mark int,
    OUT p_rede_trade_mark int,
    OUT p_first_minimum_amt decimal(18,4),
    OUT p_minimum_purchase_amt decimal(18,4),
    OUT p_minimum_subscription_amt decimal(18,4),
    OUT p_minimum_rede_share decimal(18,2),
    OUT p_minimum_holding_share decimal(18,2),
    OUT p_minimum_turning_out_share decimal(18,2),
    OUT p_fund_manager varchar(64),
    OUT p_charging_method int,
    OUT p_target_subscription_trade_mark int,
    OUT p_target_purchase_trade_mark int,
    OUT p_target_rede_trade_mark int,
    OUT p_target_first_minimum_amt decimal(18,4),
    OUT p_target_minimum_purchase_amt decimal(18,4),
    OUT p_target_minimum_subscription_amt decimal(18,4),
    OUT p_target_minimum_rede_share decimal(18,2),
    OUT p_target_minimum_holding_share decimal(18,2),
    OUT p_target_fund_manager varchar(64),
    OUT p_target_charging_method int,
    OUT p_target_minimum_turning_out_share decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_exch_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_stock_code varchar(6);
    declare v_target_stock_code varchar(6);
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_sys_config_str varchar(64);
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_exgp_busi_config_str varchar(64);
    declare v_stock_code_no int;
    declare v_target_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_minimum_turning_out_share decimal(18,2);
    declare v_fund_manager varchar(64);
    declare v_charging_method int;
    declare v_target_subscription_trade_mark int;
    declare v_target_purchase_trade_mark int;
    declare v_target_rede_trade_mark int;
    declare v_target_first_minimum_amt decimal(18,4);
    declare v_target_minimum_purchase_amt decimal(18,4);
    declare v_target_minimum_subscription_amt decimal(18,4);
    declare v_target_minimum_rede_share decimal(18,2);
    declare v_target_minimum_holding_share decimal(18,2);
    declare v_target_fund_manager varchar(64);
    declare v_target_charging_method int;
    declare v_target_minimum_turning_out_share decimal(18,2);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_trade_date int;
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_target_opor_no int;
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights int;
    declare v_trade_acco varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_no = p_exch_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code = p_stock_code;
    SET v_target_stock_code = p_target_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_sys_config_str = " ";
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_stock_code_no = 0;
    SET v_target_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_minimum_turning_out_share = 0;
    SET v_fund_manager = " ";
    SET v_charging_method = 0;
    SET v_target_subscription_trade_mark = 0;
    SET v_target_purchase_trade_mark = 0;
    SET v_target_rede_trade_mark = 0;
    SET v_target_first_minimum_amt = 0;
    SET v_target_minimum_purchase_amt = 0;
    SET v_target_minimum_subscription_amt = 0;
    SET v_target_minimum_rede_share = 0;
    SET v_target_minimum_holding_share = 0;
    SET v_target_fund_manager = " ";
    SET v_target_charging_method = 0;
    SET v_target_minimum_turning_out_share = 0;
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_target_opor_no = 0;
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";
    SET v_opor_rights = 0;
    SET v_trade_acco = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_交易接口_检查基金转换交易业务属性】*/
    call db_pub.pra_trdif_CheckFundTransExchProp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_target_stock_code,
        v_order_dir,
        v_order_qty,
        v_price_type,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_target_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_crncy_type,
        v_exch_crncy_type,
        v_capit_reback_days,
        v_posi_reback_days,
        v_subscription_trade_mark,
        v_purchase_trade_mark,
        v_rede_trade_mark,
        v_first_minimum_amt,
        v_minimum_purchase_amt,
        v_minimum_subscription_amt,
        v_minimum_rede_share,
        v_minimum_holding_share,
        v_minimum_turning_out_share,
        v_fund_manager,
        v_charging_method,
        v_target_subscription_trade_mark,
        v_target_purchase_trade_mark,
        v_target_rede_trade_mark,
        v_target_first_minimum_amt,
        v_target_minimum_purchase_amt,
        v_target_minimum_subscription_amt,
        v_target_minimum_rede_share,
        v_target_minimum_holding_share,
        v_target_minimum_turning_out_share,
        v_target_fund_manager,
        v_target_charging_method);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查基金转换交易业务属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查交易系统状态】*/
    call db_pub.pra_trdif_CheckTrdSysStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_init_date,
        v_sys_config_str,
        v_co_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查交易市场状态】*/
    call db_pub.pra_trdif_CheckTrdMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_buy_ref_rate,
        v_sell_ref_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @交易日期# = @初始化日期#; */
    set v_trade_date = v_init_date;

    /* 调用【原子_公共_基础_检查交易日期时间】*/
    call db_pub.pra_base_CheckExchDateTime(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_trade_date,
        v_exch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查交易日期时间出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #增强交易不校验是否操作员

    /* if @菜单编号# <> 1050004 then */
    if v_menu_no <> 1050004 then

        /* [检查报错返回][@是否交易员# <> 《是否交易员-是》][762][@操作员编号#, @是否交易员#] */
        if v_is_trader <> 1 then
            
            SET v_error_code = "pubT.25.20.762";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号#=@操作员编号#; */
    set v_target_opor_no=v_opor_no;

    /* 调用【原子_公共_用户_获取操作员权限串】*/
    call db_pub.pra_user_GetOporRightsStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_opor_rights_str,
        v_allow_oper_mac);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #校验交易权限

    /* if (@允许操作MAC#<>" " or @允许操作MAC#<>"") then */
    if (v_allow_oper_mac<>" " or v_allow_oper_mac<>"") then

        /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][209][@操作员编号#] */
        if locate(v_oper_mac,v_allow_oper_mac)=0 then
            
            SET v_error_code = "pubT.25.20.209";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* set @操作员权限#=2; */
        set v_opor_rights=2;

        /* [检查报错返回][locate(@操作员权限#,@操作员权限串#)=0][207][@操作员编号#] */
        if locate(v_opor_rights,v_opor_rights_str)=0 then
            
            SET v_error_code = "pubT.25.20.207";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #交易组级，订单方向检查。Modify by wjp 20190428

    /* 调用【原子_公共_用户_检查交易组限制信息】*/
    call db_pub.pra_user_CheckExchGroupLimitInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_order_dir,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组限制信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_sys_config_str = v_sys_config_str;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_stock_code_no = v_stock_code_no;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_subscription_trade_mark = v_subscription_trade_mark;
    SET p_purchase_trade_mark = v_purchase_trade_mark;
    SET p_rede_trade_mark = v_rede_trade_mark;
    SET p_first_minimum_amt = v_first_minimum_amt;
    SET p_minimum_purchase_amt = v_minimum_purchase_amt;
    SET p_minimum_subscription_amt = v_minimum_subscription_amt;
    SET p_minimum_rede_share = v_minimum_rede_share;
    SET p_minimum_holding_share = v_minimum_holding_share;
    SET p_minimum_turning_out_share = v_minimum_turning_out_share;
    SET p_fund_manager = v_fund_manager;
    SET p_charging_method = v_charging_method;
    SET p_target_subscription_trade_mark = v_target_subscription_trade_mark;
    SET p_target_purchase_trade_mark = v_target_purchase_trade_mark;
    SET p_target_rede_trade_mark = v_target_rede_trade_mark;
    SET p_target_first_minimum_amt = v_target_first_minimum_amt;
    SET p_target_minimum_purchase_amt = v_target_minimum_purchase_amt;
    SET p_target_minimum_subscription_amt = v_target_minimum_subscription_amt;
    SET p_target_minimum_rede_share = v_target_minimum_rede_share;
    SET p_target_minimum_holding_share = v_target_minimum_holding_share;
    SET p_target_fund_manager = v_target_fund_manager;
    SET p_target_charging_method = v_target_charging_method;
    SET p_target_minimum_turning_out_share = v_target_minimum_turning_out_share;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查交易市场状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckExchMarketStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckExchMarketStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_sys_config_str varchar(64);
    declare v_co_busi_config_str varchar(64);
    declare v_co_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_trade_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_sys_config_str = " ";
    SET v_co_busi_config_str = " ";
    SET v_co_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_trade_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础_检查系统状态】*/
    call db_pub.pra_base_CheckSysStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_init_date,
        v_sys_config_str,
        v_co_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* 调用【原子_公共_基础_检查市场状态】*/
    call db_pub.pra_base_CheckMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_crncy_type,
        v_exch_crncy_type,
        v_exch_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @交易日期# = @初始化日期#; */
    set v_trade_date = v_init_date;

    /* 调用【原子_公共_基础_检查交易日期时间】*/
    call db_pub.pra_base_CheckExchDateTime(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_trade_date,
        v_exch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查交易日期时间出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查交易市场状态权限身份
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckExchMarketStatusAuthOper;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckExchMarketStatusAuthOper(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_sys_config_str varchar(64),
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_buy_ref_rate decimal(18,12),
    OUT p_sell_ref_rate decimal(18,12),
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_bond_rate_type int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_target_code_no int,
    OUT p_target_code varchar(6),
    OUT p_target_code_stock_type int,
    OUT p_target_code_asset_type int,
    OUT p_trade_code_no int,
    OUT p_trade_code varchar(6),
    OUT p_trade_code_stock_type int,
    OUT p_trade_code_asset_type int,
    OUT p_min_unit int,
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_last_price decimal(16,9),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_apply_date int,
    OUT p_subscription_trade_mark int,
    OUT p_purchase_trade_mark int,
    OUT p_rede_trade_mark int,
    OUT p_first_minimum_amt decimal(18,4),
    OUT p_minimum_purchase_amt decimal(18,4),
    OUT p_minimum_subscription_amt decimal(18,4),
    OUT p_minimum_rede_share decimal(18,2),
    OUT p_minimum_holding_share decimal(18,2),
    OUT p_trade_acco varchar(32)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_exch_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_sys_config_str varchar(64);
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_exgp_busi_config_str varchar(64);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;
    declare v_trade_code_no int;
    declare v_trade_code varchar(6);
    declare v_trade_code_stock_type int;
    declare v_trade_code_asset_type int;
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_apply_date int;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_trade_acco varchar(32);
    declare v_bond_qty_unit_set int;
    declare v_trade_date int;
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_target_opor_no int;
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_no = p_exch_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_sys_config_str = " ";
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;
    SET v_target_code_no = 0;
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_trade_code = " ";
    SET v_trade_code_stock_type = 0;
    SET v_trade_code_asset_type = 0;
    SET v_min_unit = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_apply_date = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_trade_acco = " ";
    SET v_bond_qty_unit_set = 0;
    SET v_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_target_opor_no = 0;
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";
    SET v_opor_rights = 0;

    
    label_pro:BEGIN
    

    /* if @订单方向# <> 《订单方向-直接还款》 then */
    if v_order_dir <> 14 then

        /* 调用【原子_公共_交易接口_检查证券交易业务属性】*/
        call db_pub.pra_trdif_CheckSecuExchProp(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_order_dir,
            v_order_qty,
            v_price_type,
            v_error_code,
            v_error_info,
            v_stock_code_no,
            v_stock_type,
            v_asset_type,
            v_crncy_type,
            v_exch_crncy_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_par_value,
            v_impawn_ratio,
            v_net_price_flag,
            v_intrst_days,
            v_bond_rate_type,
            v_bond_accr_intrst,
            v_min_unit,
            v_up_limit_price,
            v_down_limit_price,
            v_last_price,
            v_target_code_no,
            v_target_code,
            v_target_code_stock_type,
            v_target_code_asset_type,
            v_trade_code_no,
            v_trade_code,
            v_trade_code_stock_type,
            v_trade_code_asset_type,
            v_bond_qty_unit_set,
            v_apply_date,
            v_subscription_trade_mark,
            v_purchase_trade_mark,
            v_rede_trade_mark,
            v_first_minimum_amt,
            v_minimum_purchase_amt,
            v_minimum_subscription_amt,
            v_minimum_rede_share,
            v_minimum_holding_share);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查证券交易业务属性出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    else

        /* set @市场编号# =《市场编号-上海证券交易所》; */
        set v_exch_no =1;
    end if;

    /* 调用【原子_公共_交易接口_检查交易系统状态】*/
    call db_pub.pra_trdif_CheckTrdSysStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_init_date,
        v_sys_config_str,
        v_co_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查交易市场状态】*/
    call db_pub.pra_trdif_CheckTrdMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_buy_ref_rate,
        v_sell_ref_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @交易日期# = @初始化日期#; */
    set v_trade_date = v_init_date;

    /* 调用【原子_公共_基础_检查交易日期时间】*/
    call db_pub.pra_base_CheckExchDateTime(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_trade_date,
        v_exch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查交易日期时间出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #PB系统不判断

    /* if  substring(@系统控制配置串#,7,1) <> 《系统类型-PB系统》 then */
    if  substring(v_sys_config_str,7,1) <> 1 then
      #增强交易不校验是否操作员

      /* if @菜单编号# <> 1050004 then */
      if v_menu_no <> 1050004 then

        /* [检查报错返回][@是否交易员# <> 《是否交易员-是》][762][@操作员编号#, @是否交易员#] */
        if v_is_trader <> 1 then
            
            SET v_error_code = "pubT.25.22.762";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader);
            end if;
            leave label_pro;
        end if;

      end if;
    end if;

    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号#=@操作员编号#; */
    set v_target_opor_no=v_opor_no;

    /* 调用【原子_公共_用户_获取操作员权限串】*/
    call db_pub.pra_user_GetOporRightsStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_opor_rights_str,
        v_allow_oper_mac);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #校验交易权限

    /* if (@允许操作MAC#<>" " or @允许操作MAC#<>"") then */
    if (v_allow_oper_mac<>" " or v_allow_oper_mac<>"") then

        /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][209][@操作员编号#] */
        if locate(v_oper_mac,v_allow_oper_mac)=0 then
            
            SET v_error_code = "pubT.25.22.209";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* set @操作员权限#=2; */
        set v_opor_rights=2;

        /* [检查报错返回][locate(@操作员权限#,@操作员权限串#)=0][207][@操作员编号#] */
        if locate(v_opor_rights,v_opor_rights_str)=0 then
            
            SET v_error_code = "pubT.25.22.207";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #交易组级，订单方向检查。Modify by wjp 20190428

    /* 调用【原子_公共_用户_检查交易组限制信息】*/
    call db_pub.pra_user_CheckExchGroupLimitInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_order_dir,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组限制信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_sys_config_str = v_sys_config_str;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_buy_ref_rate = v_buy_ref_rate;
    SET p_sell_ref_rate = v_sell_ref_rate;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_target_code_no = v_target_code_no;
    SET p_target_code = v_target_code;
    SET p_target_code_stock_type = v_target_code_stock_type;
    SET p_target_code_asset_type = v_target_code_asset_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_trade_code = v_trade_code;
    SET p_trade_code_stock_type = v_trade_code_stock_type;
    SET p_trade_code_asset_type = v_trade_code_asset_type;
    SET p_min_unit = v_min_unit;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_last_price = v_last_price;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_apply_date = v_apply_date;
    SET p_subscription_trade_mark = v_subscription_trade_mark;
    SET p_purchase_trade_mark = v_purchase_trade_mark;
    SET p_rede_trade_mark = v_rede_trade_mark;
    SET p_first_minimum_amt = v_first_minimum_amt;
    SET p_minimum_purchase_amt = v_minimum_purchase_amt;
    SET p_minimum_subscription_amt = v_minimum_subscription_amt;
    SET p_minimum_rede_share = v_minimum_rede_share;
    SET p_minimum_holding_share = v_minimum_holding_share;
    SET p_trade_acco = v_trade_acco;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查批量交易市场状态权限身份
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckBatchExchMarketStatusAuthOper;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckBatchExchMarketStatusAuthOper(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_no_str varchar(2048),
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_stock_code_str varchar(4096),
    IN p_order_dir_str varchar(1024),
    IN p_order_qty_str varchar(4096),
    IN p_price_type_str varchar(2048),
    IN p_split_str varchar(4),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_stock_code_no_str varchar(4096),
    OUT p_stock_type_str varchar(2048),
    OUT p_asset_type_str varchar(2048),
    OUT p_crncy_type_str varchar(2048),
    OUT p_exch_crncy_type_str varchar(2048),
    OUT p_buy_ref_rate_str varchar(2048),
    OUT p_sell_ref_rate_str varchar(2048),
    OUT p_par_value_str varchar(4096),
    OUT p_impawn_ratio_str varchar(4096),
    OUT p_net_price_flag_str varchar(2048),
    OUT p_intrst_days_str varchar(2048),
    OUT p_bond_rate_type_str varchar(4096),
    OUT p_bond_accr_intrst_str varchar(4096),
    OUT p_target_code_no_str varchar(4096),
    OUT p_target_code_str varchar(2048),
    OUT p_target_code_stock_type_str varchar(2048),
    OUT p_target_code_asset_type_str varchar(2048),
    OUT p_trade_code_no_str varchar(4096),
    OUT p_trade_code_str varchar(2048),
    OUT p_trade_code_stock_type_str varchar(2048),
    OUT p_trade_code_asset_type_str varchar(2048),
    OUT p_min_unit_str varchar(2048),
    OUT p_up_limit_price_str varchar(4096),
    OUT p_down_limit_price_str varchar(4096),
    OUT p_last_price_str varchar(4096),
    OUT p_capit_reback_days_str varchar(2048),
    OUT p_posi_reback_days_str varchar(2048),
    OUT p_subscription_trade_mark_str varchar(4096),
    OUT p_purchase_trade_mark_str varchar(4096),
    OUT p_rede_trade_mark_str varchar(4096),
    OUT p_first_minimum_amt_str varchar(4096),
    OUT p_minimum_purchase_amt_str varchar(4096),
    OUT p_minimum_subscription_amt_str varchar(4096),
    OUT p_minimum_rede_share_str varchar(4096),
    OUT p_minimum_holding_share_str varchar(4096),
    OUT p_sys_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_exch_no_str varchar(2048);
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_stock_code_str varchar(4096);
    declare v_order_dir_str varchar(1024);
    declare v_order_qty_str varchar(4096);
    declare v_price_type_str varchar(2048);
    declare v_split_str varchar(4);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_exgp_busi_config_str varchar(64);
    declare v_stock_code_no_str varchar(4096);
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
    declare v_crncy_type_str varchar(2048);
    declare v_exch_crncy_type_str varchar(2048);
    declare v_buy_ref_rate_str varchar(2048);
    declare v_sell_ref_rate_str varchar(2048);
    declare v_par_value_str varchar(4096);
    declare v_impawn_ratio_str varchar(4096);
    declare v_net_price_flag_str varchar(2048);
    declare v_intrst_days_str varchar(2048);
    declare v_bond_rate_type_str varchar(4096);
    declare v_bond_accr_intrst_str varchar(4096);
    declare v_target_code_no_str varchar(4096);
    declare v_target_code_str varchar(2048);
    declare v_target_code_stock_type_str varchar(2048);
    declare v_target_code_asset_type_str varchar(2048);
    declare v_trade_code_no_str varchar(4096);
    declare v_trade_code_str varchar(2048);
    declare v_trade_code_stock_type_str varchar(2048);
    declare v_trade_code_asset_type_str varchar(2048);
    declare v_min_unit_str varchar(2048);
    declare v_up_limit_price_str varchar(4096);
    declare v_down_limit_price_str varchar(4096);
    declare v_last_price_str varchar(4096);
    declare v_capit_reback_days_str varchar(2048);
    declare v_posi_reback_days_str varchar(2048);
    declare v_subscription_trade_mark_str varchar(4096);
    declare v_purchase_trade_mark_str varchar(4096);
    declare v_rede_trade_mark_str varchar(4096);
    declare v_first_minimum_amt_str varchar(4096);
    declare v_minimum_purchase_amt_str varchar(4096);
    declare v_minimum_subscription_amt_str varchar(4096);
    declare v_minimum_rede_share_str varchar(4096);
    declare v_minimum_holding_share_str varchar(4096);
    declare v_sys_config_str varchar(64);
    declare v_order_price_str varchar(4096);
    declare v_comm_qty_str varchar(4096);
    declare v_tmp_exch_no_str varchar(2048);
    declare v_tmp_stock_type_str varchar(2048);
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;
    declare v_trade_code_no int;
    declare v_trade_code varchar(6);
    declare v_trade_code_stock_type int;
    declare v_trade_code_asset_type int;
    declare v_bond_qty_unit_set int;
    declare v_apply_date int;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_trade_date int;
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_target_opor_no int;
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights int;
    declare v_trade_acco varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code_str = p_stock_code_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_qty_str = p_order_qty_str;
    SET v_price_type_str = p_price_type_str;
    SET v_split_str = p_split_str;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_stock_code_no_str = " ";
    SET v_stock_type_str = " ";
    SET v_asset_type_str = " ";
    SET v_crncy_type_str = " ";
    SET v_exch_crncy_type_str = " ";
    SET v_buy_ref_rate_str = " ";
    SET v_sell_ref_rate_str = " ";
    SET v_par_value_str = " ";
    SET v_impawn_ratio_str = " ";
    SET v_net_price_flag_str = " ";
    SET v_intrst_days_str = " ";
    SET v_bond_rate_type_str = " ";
    SET v_bond_accr_intrst_str = " ";
    SET v_target_code_no_str = " ";
    SET v_target_code_str = " ";
    SET v_target_code_stock_type_str = " ";
    SET v_target_code_asset_type_str = " ";
    SET v_trade_code_no_str = " ";
    SET v_trade_code_str = " ";
    SET v_trade_code_stock_type_str = " ";
    SET v_trade_code_asset_type_str = " ";
    SET v_min_unit_str = " ";
    SET v_up_limit_price_str = " ";
    SET v_down_limit_price_str = " ";
    SET v_last_price_str = " ";
    SET v_capit_reback_days_str = " ";
    SET v_posi_reback_days_str = " ";
    SET v_subscription_trade_mark_str = " ";
    SET v_purchase_trade_mark_str = " ";
    SET v_rede_trade_mark_str = " ";
    SET v_first_minimum_amt_str = " ";
    SET v_minimum_purchase_amt_str = " ";
    SET v_minimum_subscription_amt_str = " ";
    SET v_minimum_rede_share_str = " ";
    SET v_minimum_holding_share_str = " ";
    SET v_sys_config_str = " ";
    SET v_order_price_str = " ";
    SET v_comm_qty_str = " ";
    SET v_tmp_exch_no_str = " ";
    SET v_tmp_stock_type_str = " ";
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_stock_code = " ";
    SET v_exch_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_price_type = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;
    SET v_min_unit = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_target_code_no = 0;
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_trade_code = " ";
    SET v_trade_code_stock_type = 0;
    SET v_trade_code_asset_type = 0;
    SET v_bond_qty_unit_set = 0;
    SET v_apply_date = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_target_opor_no = 0;
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";
    SET v_opor_rights = 0;
    SET v_trade_acco = " ";

    
    label_pro:BEGIN
    

    /* set @订单价格串# = ""; */
    set v_order_price_str = "";

    /* set @本币币种串# = ""; */
    set v_crncy_type_str = "";

    /* set @交易币种串# = ""; */
    set v_exch_crncy_type_str = "";

    /* set @买入参考汇率串# = ""; */
    set v_buy_ref_rate_str = "";

    /* set @卖出参考汇率串# = ""; */
    set v_sell_ref_rate_str = "";

    /* set @证券代码编号串# = ""; */
    set v_stock_code_no_str = "";

    /* set @证券类型串# = ""; */
    set v_stock_type_str = "";

    /* set @资产类型串# = ""; */
    set v_asset_type_str = "";

    /* set @净价标志串# = ""; */
    set v_net_price_flag_str = "";

    /* set @票面面值串# = ""; */
    set v_par_value_str = "";

    /* set @质押比例串# = ""; */
    set v_impawn_ratio_str = "";

    /* set @计息天数串# = ""; */
    set v_intrst_days_str = "";

    /* set @债券利率类型串# = ""; */
    set v_bond_rate_type_str = "";

    /* set @债券计提利息串# = ""; */
    set v_bond_accr_intrst_str = "";

    /* set @标的代码编号串# = ""; */
    set v_target_code_no_str = "";

    /* set @标的代码串# = ""; */
    set v_target_code_str = "";

    /* set @标的代码证券类型串# = ""; */
    set v_target_code_stock_type_str = "";

    /* set @标的代码资产类型串# = ""; */
    set v_target_code_asset_type_str = "";

    /* set @交易代码编号串# = ""; */
    set v_trade_code_no_str = "";

    /* set @交易代码串# = ""; */
    set v_trade_code_str = "";

    /* set @交易代码证券类型串# = ""; */
    set v_trade_code_stock_type_str = "";

    /* set @交易代码资产类型串# = ""; */
    set v_trade_code_asset_type_str = "";

    /* set @最小单位串# = ""; */
    set v_min_unit_str = "";

    /* set @涨停价串# = ""; */
    set v_up_limit_price_str = "";

    /* set @跌停价串# = ""; */
    set v_down_limit_price_str = "";

    /* set @最新价串# = ""; */
    set v_last_price_str = "";

    /* set @资金回转天数串# = ""; */
    set v_capit_reback_days_str = "";

    /* set @持仓回转天数串# = ""; */
    set v_posi_reback_days_str = "";

    /* set @订单价格串# = ""; */
    set v_order_price_str = "";

    /* set @指令数量串# = ""; */
    set v_comm_qty_str = "";

    /* set @认购交易标志串#=""; */
    set v_subscription_trade_mark_str="";

    /* set @申购交易标志串#=""; */
    set v_purchase_trade_mark_str="";

    /* set @赎回交易标志串#=""; */
    set v_rede_trade_mark_str="";

    /* set @首次最低金额串#=""; */
    set v_first_minimum_amt_str="";

    /* set @最低申购金额串#=""; */
    set v_minimum_purchase_amt_str="";

    /* set @最低认购金额串#=""; */
    set v_minimum_subscription_amt_str="";

    /* set @最低赎回份额串#=""; */
    set v_minimum_rede_share_str="";

    /* set @最低持有份额串#=""; */
    set v_minimum_holding_share_str="";

    /* set @临时_市场编号串# = ""; */
    set v_tmp_exch_no_str = "";

    /* set @临时_证券类型串# = ""; */
    set v_tmp_stock_type_str = "";

    /* if @分隔符# = ' ' then */
    if v_split_str = ' ' then

        /* set @分隔符#= ';'; */
        set v_split_str= ';';
    end if;

    /* 调用【原子_公共_交易接口_检查交易系统状态权限】*/
    call db_pub.pra_trdif_CheckTrdSysStatusAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_init_date,
        v_co_busi_config_str,
        v_allow_exch,
        v_allow_stock_type,
        v_sys_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.23.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易系统状态权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* while LOCATE(@分隔符#,@证券代码串#) <>0   do */
    while LOCATE(v_split_str,v_stock_code_str) <>0   do
        #截取前面每一位

        /* set @证券代码#=substring(@证券代码串#,1,LOCATE(@分隔符#,@证券代码串#)-1); */
        set v_stock_code=substring(v_stock_code_str,1,LOCATE(v_split_str,v_stock_code_str)-1);

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

        /* set @订单方向#=cast(substring(@订单方向串#,1,LOCATE(@分隔符#,@订单方向串#)-1) as SIGNED); */
        set v_order_dir=cast(substring(v_order_dir_str,1,LOCATE(v_split_str,v_order_dir_str)-1) as SIGNED);

        /* set @订单价格#=cast(substring(@订单价格串#,1,LOCATE(@分隔符#,@订单价格串#)-1) as decimal(16,9)); */
        set v_order_price=cast(substring(v_order_price_str,1,LOCATE(v_split_str,v_order_price_str)-1) as decimal(16,9));

        /* set @订单数量#=cast(substring(@订单数量串#,1,LOCATE(@分隔符#,@订单数量串#)-1) as decimal(18,2)); */
        set v_order_qty=cast(substring(v_order_qty_str,1,LOCATE(v_split_str,v_order_qty_str)-1) as decimal(18,2));

        /* set @价格类型#=cast(substring(@价格类型串#,1,LOCATE(@分隔符#,@价格类型串#)-1) as decimal(18,2)); */
        set v_price_type=cast(substring(v_price_type_str,1,LOCATE(v_split_str,v_price_type_str)-1) as decimal(18,2));

        /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][56][@市场编号#,@允许投资市场#] */
        if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
            
            SET v_error_code = "pubT.25.23.56";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
            end if;
            leave label_pro;
        end if;


        /* 调用【原子_公共_交易接口_检查证券交易业务属性】*/
        call db_pub.pra_trdif_CheckSecuExchProp(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_order_dir,
            v_order_qty,
            v_price_type,
            v_error_code,
            v_error_info,
            v_stock_code_no,
            v_stock_type,
            v_asset_type,
            v_crncy_type,
            v_exch_crncy_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_par_value,
            v_impawn_ratio,
            v_net_price_flag,
            v_intrst_days,
            v_bond_rate_type,
            v_bond_accr_intrst,
            v_min_unit,
            v_up_limit_price,
            v_down_limit_price,
            v_last_price,
            v_target_code_no,
            v_target_code,
            v_target_code_stock_type,
            v_target_code_asset_type,
            v_trade_code_no,
            v_trade_code,
            v_trade_code_stock_type,
            v_trade_code_asset_type,
            v_bond_qty_unit_set,
            v_apply_date,
            v_subscription_trade_mark,
            v_purchase_trade_mark,
            v_rede_trade_mark,
            v_first_minimum_amt,
            v_minimum_purchase_amt,
            v_minimum_subscription_amt,
            v_minimum_rede_share,
            v_minimum_holding_share);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.23.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查证券交易业务属性出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][57][@证券类型#,@允许操作证券类型#] */
        if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
            
            SET v_error_code = "pubT.25.23.57";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
            end if;
            leave label_pro;
        end if;


        /* set @本币币种串#  = concat(@本币币种串#,@本币币种#,";"); */
        set v_crncy_type_str  = concat(v_crncy_type_str,v_crncy_type,";");

        /* set @交易币种串#  = concat(@交易币种串#,@交易币种#,";"); */
        set v_exch_crncy_type_str  = concat(v_exch_crncy_type_str,v_exch_crncy_type,";");

        /* 调用【原子_公共_交易接口_检查交易市场状态】*/
        call db_pub.pra_trdif_CheckTrdMarketStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_exch_no,
            v_error_code,
            v_error_info,
            v_init_date,
            v_buy_ref_rate,
            v_sell_ref_rate);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.23.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易市场状态出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

        #交易组级，订单方向检查。Modify by wjp 20190428

        /* 调用【原子_公共_用户_检查交易组限制信息】*/
        call db_pub.pra_user_CheckExchGroupLimitInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_group_no,
            v_order_dir,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.23.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组限制信息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @买入参考汇率串#  = concat(@买入参考汇率串#,@买入参考汇率#,";"); */
        set v_buy_ref_rate_str  = concat(v_buy_ref_rate_str,v_buy_ref_rate,";");

        /* set @卖出参考汇率串#  = concat(@卖出参考汇率串#,@卖出参考汇率#,";"); */
        set v_sell_ref_rate_str  = concat(v_sell_ref_rate_str,v_sell_ref_rate,";");

        /* set @证券代码编号串#  = concat(@证券代码编号串#,@证券代码编号#,";"); */
        set v_stock_code_no_str  = concat(v_stock_code_no_str,v_stock_code_no,";");

        /* set @证券类型串#  = concat(@证券类型串#,@证券类型#,";"); */
        set v_stock_type_str  = concat(v_stock_type_str,v_stock_type,";");

        /* set @资产类型串#  = concat(@资产类型串#,@资产类型#,";"); */
        set v_asset_type_str  = concat(v_asset_type_str,v_asset_type,";");

        /* set @净价标志串#  = concat(@净价标志串#,@净价标志#,";"); */
        set v_net_price_flag_str  = concat(v_net_price_flag_str,v_net_price_flag,";");

        /* set @票面面值串#  = concat(@票面面值串#,@票面面值#,";"); */
        set v_par_value_str  = concat(v_par_value_str,v_par_value,";");

        /* set @质押比例串#  = concat(@质押比例串#,@质押比例#,";"); */
        set v_impawn_ratio_str  = concat(v_impawn_ratio_str,v_impawn_ratio,";");

        /* set @计息天数串#  = concat(@计息天数串#,@计息天数#,";"); */
        set v_intrst_days_str  = concat(v_intrst_days_str,v_intrst_days,";");

        /* set @债券利率类型串#  = concat(@债券利率类型串#,@债券利率类型#,";"); */
        set v_bond_rate_type_str  = concat(v_bond_rate_type_str,v_bond_rate_type,";");

        /* set @债券计提利息串#  = concat(@债券计提利息串#,@债券计提利息#,";"); */
        set v_bond_accr_intrst_str  = concat(v_bond_accr_intrst_str,v_bond_accr_intrst,";");

        /* set @标的代码编号串#  = concat(@标的代码编号串#,@标的代码编号#,";"); */
        set v_target_code_no_str  = concat(v_target_code_no_str,v_target_code_no,";");

        /* set @标的代码串#  = concat(@标的代码串#,@标的代码#,";"); */
        set v_target_code_str  = concat(v_target_code_str,v_target_code,";");

        /* set @标的代码证券类型串#  = concat(@标的代码证券类型串#,@标的代码证券类型#,";"); */
        set v_target_code_stock_type_str  = concat(v_target_code_stock_type_str,v_target_code_stock_type,";");

        /* set @标的代码资产类型串#  = concat(@标的代码资产类型串#,@标的代码资产类型#,";"); */
        set v_target_code_asset_type_str  = concat(v_target_code_asset_type_str,v_target_code_asset_type,";");

        /* set @交易代码编号串#  = concat(@交易代码编号串#,@交易代码编号#,";"); */
        set v_trade_code_no_str  = concat(v_trade_code_no_str,v_trade_code_no,";");

        /* set @交易代码串#  = concat(@交易代码串#,@交易代码#,";"); */
        set v_trade_code_str  = concat(v_trade_code_str,v_trade_code,";");

        /* set @交易代码证券类型串#  = concat(@交易代码证券类型串#,@交易代码证券类型#,";"); */
        set v_trade_code_stock_type_str  = concat(v_trade_code_stock_type_str,v_trade_code_stock_type,";");

        /* set @交易代码资产类型串#  = concat(@交易代码资产类型串#,@交易代码资产类型#,";"); */
        set v_trade_code_asset_type_str  = concat(v_trade_code_asset_type_str,v_trade_code_asset_type,";");

        /* set @最小单位串#  = concat(@最小单位串#,@最小单位#,";"); */
        set v_min_unit_str  = concat(v_min_unit_str,v_min_unit,";");

        /* set @涨停价串#  = concat(@涨停价串#,@涨停价#,";"); */
        set v_up_limit_price_str  = concat(v_up_limit_price_str,v_up_limit_price,";");

        /* set @跌停价串#  = concat(@跌停价串#,@跌停价#,";"); */
        set v_down_limit_price_str  = concat(v_down_limit_price_str,v_down_limit_price,";");

        /* set @最新价串#  = concat(@最新价串#,@最新价#,";"); */
        set v_last_price_str  = concat(v_last_price_str,v_last_price,";");

        /* set @资金回转天数串#  = concat(@资金回转天数串#,@资金回转天数#,";"); */
        set v_capit_reback_days_str  = concat(v_capit_reback_days_str,v_capit_reback_days,";");

        /* set @持仓回转天数串#  = concat(@持仓回转天数串#,@持仓回转天数#,";"); */
        set v_posi_reback_days_str  = concat(v_posi_reback_days_str,v_posi_reback_days,";");

        /* set @认购交易标志串#=concat(@认购交易标志串#,@认购交易标志#,";"); */
        set v_subscription_trade_mark_str=concat(v_subscription_trade_mark_str,v_subscription_trade_mark,";");

        /* set @申购交易标志串#=concat(@申购交易标志串#,@申购交易标志#,";"); */
        set v_purchase_trade_mark_str=concat(v_purchase_trade_mark_str,v_purchase_trade_mark,";");

        /* set @赎回交易标志串#=concat(@赎回交易标志串#,@赎回交易标志#,";"); */
        set v_rede_trade_mark_str=concat(v_rede_trade_mark_str,v_rede_trade_mark,";");

        /* set @首次最低金额串#=concat(@首次最低金额串#,@首次最低金额#,";"); */
        set v_first_minimum_amt_str=concat(v_first_minimum_amt_str,v_first_minimum_amt,";");

        /* set @最低申购金额串#=concat(@最低申购金额串#,@最低申购金额#,";"); */
        set v_minimum_purchase_amt_str=concat(v_minimum_purchase_amt_str,v_minimum_purchase_amt,";");

        /* set @最低认购金额串#=concat(@最低认购金额串#,@最低认购金额#,";"); */
        set v_minimum_subscription_amt_str=concat(v_minimum_subscription_amt_str,v_minimum_subscription_amt,";");

        /* set @最低赎回份额串#=concat(@最低赎回份额串#,@最低赎回份额#,";"); */
        set v_minimum_rede_share_str=concat(v_minimum_rede_share_str,v_minimum_rede_share,";");

        /* set @最低持有份额串#=concat(@最低持有份额串#,@最低持有份额#,";"); */
        set v_minimum_holding_share_str=concat(v_minimum_holding_share_str,v_minimum_holding_share,";");

        /* set @证券代码串#=substring(@证券代码串#,LOCATE(@分隔符#,@证券代码串#)+1); */
        set v_stock_code_str=substring(v_stock_code_str,LOCATE(v_split_str,v_stock_code_str)+1);

        /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
        set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

        /* set @订单方向串#=substring(@订单方向串#,LOCATE(@分隔符#,@订单方向串#)+1); */
        set v_order_dir_str=substring(v_order_dir_str,LOCATE(v_split_str,v_order_dir_str)+1);

        /* set @订单价格串#=substring(@订单价格串#,LOCATE(@分隔符#,@订单价格串#)+1); */
        set v_order_price_str=substring(v_order_price_str,LOCATE(v_split_str,v_order_price_str)+1);

        /* set @订单数量串#=substring(@订单数量串#,LOCATE(@分隔符#,@订单数量串#)+1); */
        set v_order_qty_str=substring(v_order_qty_str,LOCATE(v_split_str,v_order_qty_str)+1);

        /* set @价格类型串#=substring(@价格类型串#,LOCATE(@分隔符#,@价格类型串#)+1); */
        set v_price_type_str=substring(v_price_type_str,LOCATE(v_split_str,v_price_type_str)+1);
    end while;

    /* set @交易日期# = @初始化日期#; */
    set v_trade_date = v_init_date;

    /* 调用【原子_公共_基础_检查交易日期时间】*/
    call db_pub.pra_base_CheckExchDateTime(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_trade_date,
        v_exch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.23.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查交易日期时间出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.23.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #PB系统不判断

    /* if  substring(@系统控制配置串#,7,1) <> 《系统类型-PB系统》 then */
    if  substring(v_sys_config_str,7,1) <> 1 then

    /* [检查报错返回][@是否交易员# <> 《是否交易员-是》][762][@操作员编号#, @是否交易员#] */
    if v_is_trader <> 1 then
        
        SET v_error_code = "pubT.25.23.762";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader);
        end if;
        leave label_pro;
    end if;

    end if;

    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.23.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.23.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号#=@操作员编号#; */
    set v_target_opor_no=v_opor_no;

    /* 调用【原子_公共_用户_获取操作员权限串】*/
    call db_pub.pra_user_GetOporRightsStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_opor_rights_str,
        v_allow_oper_mac);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.23.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #校验交易权限

    /* if (@允许操作MAC#<>" " or @允许操作MAC#<>"") then */
    if (v_allow_oper_mac<>" " or v_allow_oper_mac<>"") then

        /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][209][@操作员编号#] */
        if locate(v_oper_mac,v_allow_oper_mac)=0 then
            
            SET v_error_code = "pubT.25.23.209";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* set @操作员权限#=2; */
        set v_opor_rights=2;

        /* [检查报错返回][locate(@操作员权限#,@操作员权限串#)=0][207][@操作员编号#] */
        if locate(v_opor_rights,v_opor_rights_str)=0 then
            
            SET v_error_code = "pubT.25.23.207";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.23.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_stock_code_no_str = v_stock_code_no_str;
    SET p_stock_type_str = v_stock_type_str;
    SET p_asset_type_str = v_asset_type_str;
    SET p_crncy_type_str = v_crncy_type_str;
    SET p_exch_crncy_type_str = v_exch_crncy_type_str;
    SET p_buy_ref_rate_str = v_buy_ref_rate_str;
    SET p_sell_ref_rate_str = v_sell_ref_rate_str;
    SET p_par_value_str = v_par_value_str;
    SET p_impawn_ratio_str = v_impawn_ratio_str;
    SET p_net_price_flag_str = v_net_price_flag_str;
    SET p_intrst_days_str = v_intrst_days_str;
    SET p_bond_rate_type_str = v_bond_rate_type_str;
    SET p_bond_accr_intrst_str = v_bond_accr_intrst_str;
    SET p_target_code_no_str = v_target_code_no_str;
    SET p_target_code_str = v_target_code_str;
    SET p_target_code_stock_type_str = v_target_code_stock_type_str;
    SET p_target_code_asset_type_str = v_target_code_asset_type_str;
    SET p_trade_code_no_str = v_trade_code_no_str;
    SET p_trade_code_str = v_trade_code_str;
    SET p_trade_code_stock_type_str = v_trade_code_stock_type_str;
    SET p_trade_code_asset_type_str = v_trade_code_asset_type_str;
    SET p_min_unit_str = v_min_unit_str;
    SET p_up_limit_price_str = v_up_limit_price_str;
    SET p_down_limit_price_str = v_down_limit_price_str;
    SET p_last_price_str = v_last_price_str;
    SET p_capit_reback_days_str = v_capit_reback_days_str;
    SET p_posi_reback_days_str = v_posi_reback_days_str;
    SET p_subscription_trade_mark_str = v_subscription_trade_mark_str;
    SET p_purchase_trade_mark_str = v_purchase_trade_mark_str;
    SET p_rede_trade_mark_str = v_rede_trade_mark_str;
    SET p_first_minimum_amt_str = v_first_minimum_amt_str;
    SET p_minimum_purchase_amt_str = v_minimum_purchase_amt_str;
    SET p_minimum_subscription_amt_str = v_minimum_subscription_amt_str;
    SET p_minimum_rede_share_str = v_minimum_rede_share_str;
    SET p_minimum_holding_share_str = v_minimum_holding_share_str;
    SET p_sys_config_str = v_sys_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查改单下单权限身份
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckModiOrderAuthOper;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckModiOrderAuthOper(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_buy_ref_rate decimal(18,12),
    OUT p_sell_ref_rate decimal(18,12),
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_bond_rate_type int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_target_code_no int,
    OUT p_target_code varchar(6),
    OUT p_target_code_stock_type int,
    OUT p_target_code_asset_type int,
    OUT p_trade_code_no int,
    OUT p_trade_code varchar(6),
    OUT p_trade_code_stock_type int,
    OUT p_trade_code_asset_type int,
    OUT p_min_unit int,
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_last_price decimal(16,9),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_exch_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_exgp_busi_config_str varchar(64);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;
    declare v_trade_code_no int;
    declare v_trade_code varchar(6);
    declare v_trade_code_stock_type int;
    declare v_trade_code_asset_type int;
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_sys_config_str varchar(64);
    declare v_bond_qty_unit_set int;
    declare v_apply_date int;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_target_opor_no int;
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights int;
    declare v_trade_acco varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_exch_no = p_exch_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;
    SET v_target_code_no = 0;
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_trade_code = " ";
    SET v_trade_code_stock_type = 0;
    SET v_trade_code_asset_type = 0;
    SET v_min_unit = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_sys_config_str = " ";
    SET v_bond_qty_unit_set = 0;
    SET v_apply_date = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_target_opor_no = 0;
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";
    SET v_opor_rights = 0;
    SET v_trade_acco = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_交易接口_检查交易系统状态权限】*/
    call db_pub.pra_trdif_CheckTrdSysStatusAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_init_date,
        v_co_busi_config_str,
        v_allow_exch,
        v_allow_stock_type,
        v_sys_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.24.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易系统状态权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查交易市场状态】*/
    call db_pub.pra_trdif_CheckTrdMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_buy_ref_rate,
        v_sell_ref_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.24.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查证券交易业务属性】*/
    call db_pub.pra_trdif_CheckSecuExchProp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_order_dir,
        v_order_qty,
        v_price_type,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_crncy_type,
        v_exch_crncy_type,
        v_capit_reback_days,
        v_posi_reback_days,
        v_par_value,
        v_impawn_ratio,
        v_net_price_flag,
        v_intrst_days,
        v_bond_rate_type,
        v_bond_accr_intrst,
        v_min_unit,
        v_up_limit_price,
        v_down_limit_price,
        v_last_price,
        v_target_code_no,
        v_target_code,
        v_target_code_stock_type,
        v_target_code_asset_type,
        v_trade_code_no,
        v_trade_code,
        v_trade_code_stock_type,
        v_trade_code_asset_type,
        v_bond_qty_unit_set,
        v_apply_date,
        v_subscription_trade_mark,
        v_purchase_trade_mark,
        v_rede_trade_mark,
        v_first_minimum_amt,
        v_minimum_purchase_amt,
        v_minimum_subscription_amt,
        v_minimum_rede_share,
        v_minimum_holding_share);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.24.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查证券交易业务属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份无密码】*/
    call db_pub.pra_user_CheckOperatorAuthNoPwd(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.24.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份无密码出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@是否交易员# <> 《是否交易员-是》][762][@操作员编号#, @是否交易员#] */
    if v_is_trader <> 1 then
        
        SET v_error_code = "pubT.25.24.762";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.24.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号#=@操作员编号#; */
    set v_target_opor_no=v_opor_no;

    /* 调用【原子_公共_用户_获取操作员权限串】*/
    call db_pub.pra_user_GetOporRightsStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_opor_rights_str,
        v_allow_oper_mac);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.24.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #校验交易权限

    /* if (@允许操作MAC#<>" " or @允许操作MAC#<>"") then */
    if (v_allow_oper_mac<>" " or v_allow_oper_mac<>"") then

        /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][209][@操作员编号#] */
        if locate(v_oper_mac,v_allow_oper_mac)=0 then
            
            SET v_error_code = "pubT.25.24.209";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* set @操作员权限#=2; */
        set v_opor_rights=2;

        /* [检查报错返回][locate(@操作员权限#,@操作员权限串#)=0][207][@操作员编号#] */
        if locate(v_opor_rights,v_opor_rights_str)=0 then
            
            SET v_error_code = "pubT.25.24.207";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.24.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #交易组级，订单方向检查。Modify by wjp 20190428

    /* 调用【原子_公共_用户_检查交易组限制信息】*/
    call db_pub.pra_user_CheckExchGroupLimitInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_order_dir,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.24.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组限制信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_buy_ref_rate = v_buy_ref_rate;
    SET p_sell_ref_rate = v_sell_ref_rate;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_target_code_no = v_target_code_no;
    SET p_target_code = v_target_code;
    SET p_target_code_stock_type = v_target_code_stock_type;
    SET p_target_code_asset_type = v_target_code_asset_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_trade_code = v_trade_code;
    SET p_trade_code_stock_type = v_trade_code_stock_type;
    SET p_trade_code_asset_type = v_trade_code_asset_type;
    SET p_min_unit = v_min_unit;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_last_price = v_last_price;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查证券交易业务属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckSecuExchProp;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckSecuExchProp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_bond_rate_type int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_min_unit int,
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_last_price decimal(16,9),
    OUT p_target_code_no int,
    OUT p_target_code varchar(6),
    OUT p_target_code_stock_type int,
    OUT p_target_code_asset_type int,
    OUT p_trade_code_no int,
    OUT p_trade_code varchar(6),
    OUT p_trade_code_stock_type int,
    OUT p_trade_code_asset_type int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;
    declare v_trade_code_no int;
    declare v_trade_code varchar(6);
    declare v_trade_code_stock_type int;
    declare v_trade_code_asset_type int;
    declare v_bond_qty_unit_set int;
    declare v_apply_date int;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;
    SET v_min_unit = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_target_code_no = 0;
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_trade_code = " ";
    SET v_trade_code_stock_type = 0;
    SET v_trade_code_asset_type = 0;
    SET v_bond_qty_unit_set = 0;
    SET v_apply_date = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_交易接口_检查证券交易业务属性】*/
    call db_pub.pra_trdif_CheckSecuExchProp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_order_dir,
        v_order_qty,
        v_price_type,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_crncy_type,
        v_exch_crncy_type,
        v_capit_reback_days,
        v_posi_reback_days,
        v_par_value,
        v_impawn_ratio,
        v_net_price_flag,
        v_intrst_days,
        v_bond_rate_type,
        v_bond_accr_intrst,
        v_min_unit,
        v_up_limit_price,
        v_down_limit_price,
        v_last_price,
        v_target_code_no,
        v_target_code,
        v_target_code_stock_type,
        v_target_code_asset_type,
        v_trade_code_no,
        v_trade_code,
        v_trade_code_stock_type,
        v_trade_code_asset_type,
        v_bond_qty_unit_set,
        v_apply_date,
        v_subscription_trade_mark,
        v_purchase_trade_mark,
        v_rede_trade_mark,
        v_first_minimum_amt,
        v_minimum_purchase_amt,
        v_minimum_subscription_amt,
        v_minimum_rede_share,
        v_minimum_holding_share);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.25.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查证券交易业务属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_min_unit = v_min_unit;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_last_price = v_last_price;
    SET p_target_code_no = v_target_code_no;
    SET p_target_code = v_target_code;
    SET p_target_code_stock_type = v_target_code_stock_type;
    SET p_target_code_asset_type = v_target_code_asset_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_trade_code = v_trade_code;
    SET p_trade_code_stock_type = v_trade_code_stock_type;
    SET p_trade_code_asset_type = v_trade_code_asset_type;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查系统状态权限身份交易业务
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckSysStatusAuthOperExchBusi;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckSysStatusAuthOperExchBusi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    IN p_strike_date int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_sys_config_str varchar(64),
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_buy_ref_rate decimal(18,12),
    OUT p_sell_ref_rate decimal(18,12),
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_min_unit int,
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_last_price decimal(16,9),
    OUT p_repo_days int,
    OUT p_repo_back_date int,
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_bond_qty_unit_set int,
    OUT p_apply_date int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_strike_date int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_sys_config_str varchar(64);
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_exgp_busi_config_str varchar(64);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_repo_days int;
    declare v_repo_back_date int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_bond_qty_unit_set int;
    declare v_apply_date int;
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;
    declare v_trade_code varchar(6);
    declare v_trade_code_stock_type int;
    declare v_trade_code_asset_type int;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_trade_acco varchar(32);
    declare v_repo_first_settle_date int;
    declare v_cash_capt_days int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_strike_date = p_strike_date;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_sys_config_str = " ";
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_min_unit = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_repo_days = 0;
    SET v_repo_back_date = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_bond_qty_unit_set = 0;
    SET v_apply_date = 0;
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;
    SET v_trade_code = " ";
    SET v_trade_code_stock_type = 0;
    SET v_trade_code_asset_type = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_trade_acco = " ";
    SET v_repo_first_settle_date = 0;
    SET v_cash_capt_days = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础_检查系统状态】*/
    call db_pub.pra_base_CheckSysStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_init_date,
        v_sys_config_str,
        v_co_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.26.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查交易市场状态】*/
    call db_pub.pra_trdif_CheckTrdMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_buy_ref_rate,
        v_sell_ref_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.26.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.26.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.26.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查证券交易业务属性】*/
    call db_pub.pra_trdif_CheckSecuExchProp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_order_dir,
        v_order_qty,
        v_price_type,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_crncy_type,
        v_exch_crncy_type,
        v_capit_reback_days,
        v_posi_reback_days,
        v_par_value,
        v_impawn_ratio,
        v_net_price_flag,
        v_intrst_days,
        v_bond_rate_type,
        v_bond_accr_intrst,
        v_min_unit,
        v_up_limit_price,
        v_down_limit_price,
        v_last_price,
        v_target_code_no,
        v_target_code,
        v_target_code_stock_type,
        v_target_code_asset_type,
        v_trade_code_no,
        v_trade_code,
        v_trade_code_stock_type,
        v_trade_code_asset_type,
        v_bond_qty_unit_set,
        v_apply_date,
        v_subscription_trade_mark,
        v_purchase_trade_mark,
        v_rede_trade_mark,
        v_first_minimum_amt,
        v_minimum_purchase_amt,
        v_minimum_subscription_amt,
        v_minimum_rede_share,
        v_minimum_holding_share);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.26.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查证券交易业务属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.26.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.26.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #交易组级，订单方向检查。Modify by wjp 20190428

    /* 调用【原子_公共_用户_检查交易组限制信息】*/
    call db_pub.pra_user_CheckExchGroupLimitInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_order_dir,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.26.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组限制信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @成交日期# = 0 then */
    if v_strike_date = 0 then

        /* set @成交日期# = @初始化日期#; */
        set v_strike_date = v_init_date;
    end if;
    #计算实际计息天数

    /* if (@订单方向# =《订单方向-融资回购》) or (@订单方向#=《订单方向-融券回购》) then */
    if (v_order_dir =3) or (v_order_dir=4) then

        /* 调用【原子_公共_证券基础数据_获取编号回购参数信息】*/
        call db_pub.pra_basesedt_GetNoRepoParamInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code_no,
            v_error_code,
            v_error_info,
            v_repo_days,
            v_repo_first_settle_date,
            v_repo_back_date,
            v_cash_capt_days,
            v_target_code_no,
            v_target_code,
            v_target_code_stock_type,
            v_target_code_asset_type);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.26.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取编号回购参数信息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @计息天数# = @资金占款天数#; */
        set v_intrst_days = v_cash_capt_days;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_sys_config_str = v_sys_config_str;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_buy_ref_rate = v_buy_ref_rate;
    SET p_sell_ref_rate = v_sell_ref_rate;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_min_unit = v_min_unit;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_last_price = v_last_price;
    SET p_repo_days = v_repo_days;
    SET p_repo_back_date = v_repo_back_date;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_bond_qty_unit_set = v_bond_qty_unit_set;
    SET p_apply_date = v_apply_date;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查系统状态交易业务
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckSysStatusExchBusi;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckSysStatusExchBusi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    IN p_strike_date int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_sys_config_str varchar(64),
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_buy_ref_rate decimal(18,12),
    OUT p_sell_ref_rate decimal(18,12),
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_min_unit int,
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_last_price decimal(16,9),
    OUT p_repo_days int,
    OUT p_repo_back_date int,
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_bond_qty_unit_set int,
    OUT p_apply_date int,
    OUT p_trade_acco varchar(32)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_strike_date int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_sys_config_str varchar(64);
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_exgp_busi_config_str varchar(64);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_repo_days int;
    declare v_repo_back_date int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_bond_qty_unit_set int;
    declare v_apply_date int;
    declare v_trade_acco varchar(32);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;
    declare v_trade_code varchar(6);
    declare v_trade_code_stock_type int;
    declare v_trade_code_asset_type int;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_repo_first_settle_date int;
    declare v_cash_capt_days int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_strike_date = p_strike_date;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_sys_config_str = " ";
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_min_unit = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_repo_days = 0;
    SET v_repo_back_date = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_bond_qty_unit_set = 0;
    SET v_apply_date = 0;
    SET v_trade_acco = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;
    SET v_trade_code = " ";
    SET v_trade_code_stock_type = 0;
    SET v_trade_code_asset_type = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_repo_first_settle_date = 0;
    SET v_cash_capt_days = 0;

    
    label_pro:BEGIN
    

    /* set @申购日期# = 0; */
    set v_apply_date = 0;

    /* 调用【原子_公共_基础_检查系统状态】*/
    call db_pub.pra_base_CheckSysStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_init_date,
        v_sys_config_str,
        v_co_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.27.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查交易市场状态】*/
    call db_pub.pra_trdif_CheckTrdMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_buy_ref_rate,
        v_sell_ref_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.27.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.27.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.27.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查证券交易业务属性】*/
    call db_pub.pra_trdif_CheckSecuExchProp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_order_dir,
        v_order_qty,
        v_price_type,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_crncy_type,
        v_exch_crncy_type,
        v_capit_reback_days,
        v_posi_reback_days,
        v_par_value,
        v_impawn_ratio,
        v_net_price_flag,
        v_intrst_days,
        v_bond_rate_type,
        v_bond_accr_intrst,
        v_min_unit,
        v_up_limit_price,
        v_down_limit_price,
        v_last_price,
        v_target_code_no,
        v_target_code,
        v_target_code_stock_type,
        v_target_code_asset_type,
        v_trade_code_no,
        v_trade_code,
        v_trade_code_stock_type,
        v_trade_code_asset_type,
        v_bond_qty_unit_set,
        v_apply_date,
        v_subscription_trade_mark,
        v_purchase_trade_mark,
        v_rede_trade_mark,
        v_first_minimum_amt,
        v_minimum_purchase_amt,
        v_minimum_subscription_amt,
        v_minimum_rede_share,
        v_minimum_holding_share);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.27.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查证券交易业务属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #[原子_公共_用户_检查操作员操作权限]

    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.27.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #交易组级，订单方向检查。Modify by wjp 20190428

    /* 调用【原子_公共_用户_检查交易组限制信息】*/
    call db_pub.pra_user_CheckExchGroupLimitInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_order_dir,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.27.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组限制信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @成交日期# = 0 then */
    if v_strike_date = 0 then

        /* set @成交日期# = @初始化日期#; */
        set v_strike_date = v_init_date;
    end if;
    #计算实际计息天数

    /* if (@订单方向# =《订单方向-融资回购》) or (@订单方向#=《订单方向-融券回购》) then */
    if (v_order_dir =3) or (v_order_dir=4) then

        /* 调用【原子_公共_证券基础数据_获取编号回购参数信息】*/
        call db_pub.pra_basesedt_GetNoRepoParamInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code_no,
            v_error_code,
            v_error_info,
            v_repo_days,
            v_repo_first_settle_date,
            v_repo_back_date,
            v_cash_capt_days,
            v_target_code_no,
            v_target_code,
            v_target_code_stock_type,
            v_target_code_asset_type);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.27.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取编号回购参数信息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @计息天数# = @资金占款天数#; */
        set v_intrst_days = v_cash_capt_days;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_sys_config_str = v_sys_config_str;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_buy_ref_rate = v_buy_ref_rate;
    SET p_sell_ref_rate = v_sell_ref_rate;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_min_unit = v_min_unit;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_last_price = v_last_price;
    SET p_repo_days = v_repo_days;
    SET p_repo_back_date = v_repo_back_date;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_bond_qty_unit_set = v_bond_qty_unit_set;
    SET p_apply_date = v_apply_date;
    SET p_trade_acco = v_trade_acco;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查回报业务控制
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckRspBusiControl;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckRspBusiControl(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_sys_config_str varchar(64),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_buy_ref_rate decimal(18,12),
    OUT p_sell_ref_rate decimal(18,12),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_net_price_flag int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_min_unit int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_sys_config_str varchar(64);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_min_unit int;
    declare v_pass_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_sys_config_str = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_net_price_flag = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_min_unit = 0;
    SET v_pass_no = 0;

    
    label_pro:BEGIN
    

    /* set @通道编号# = 0; */
    set v_pass_no = 0;

    /* 调用【原子_公共_交易接口_检查证券回报业务控制】*/
    call db_pub.pra_trdif_CheckSecuRspBusiControl(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_pass_no,
        v_stock_code,
        v_order_dir,
        v_error_code,
        v_error_info,
        v_init_date,
        v_sys_config_str,
        v_crncy_type,
        v_exch_crncy_type,
        v_buy_ref_rate,
        v_sell_ref_rate,
        v_stock_code_no,
        v_stock_type,
        v_capit_reback_days,
        v_posi_reback_days,
        v_trade_code_no,
        v_target_code_no,
        v_net_price_flag,
        v_bond_accr_intrst,
        v_bond_rate_type,
        v_par_value,
        v_impawn_ratio,
        v_min_unit);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.31.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查证券回报业务控制出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #[原子_公共_证券基础数据_获取证券代码编号]
    #[原子_公共_证券基础数据_获取编号证券代码属性]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_sys_config_str = v_sys_config_str;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_buy_ref_rate = v_buy_ref_rate;
    SET p_sell_ref_rate = v_sell_ref_rate;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_net_price_flag = v_net_price_flag;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_min_unit = v_min_unit;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查成交回报业务控制
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckStrikeRspBusiControl;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckStrikeRspBusiControl(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_strike_date int,
    IN p_pass_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_sys_config_str varchar(64),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_buy_ref_rate decimal(18,12),
    OUT p_sell_ref_rate decimal(18,12),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_intrst_days int,
    OUT p_net_price_flag int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_repo_days int,
    OUT p_repo_cale_days int,
    OUT p_repo_back_date int,
    OUT p_bond_qty_unit_set int,
    OUT p_apply_date int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_strike_date int;
    declare v_pass_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_sys_config_str varchar(64);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_intrst_days int;
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_repo_days int;
    declare v_repo_cale_days int;
    declare v_repo_back_date int;
    declare v_bond_qty_unit_set int;
    declare v_apply_date int;
    declare v_repo_first_settle_date int;
    declare v_cash_capt_days int;
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_strike_date = p_strike_date;
    SET v_pass_no = p_pass_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_sys_config_str = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_intrst_days = 0;
    SET v_net_price_flag = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_repo_days = 0;
    SET v_repo_cale_days = 0;
    SET v_repo_back_date = 0;
    SET v_bond_qty_unit_set = 0;
    SET v_apply_date = 0;
    SET v_repo_first_settle_date = 0;
    SET v_cash_capt_days = 0;
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_交易接口_检查成交回报业务控制】*/
    call db_pub.pra_trdif_CheckStrikeRspBusiControl(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_pass_no,
        v_order_dir,
        v_error_code,
        v_error_info,
        v_init_date,
        v_sys_config_str,
        v_crncy_type,
        v_exch_crncy_type,
        v_buy_ref_rate,
        v_sell_ref_rate,
        v_bond_qty_unit_set,
        v_stock_code_no,
        v_stock_type,
        v_apply_date);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.32.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查成交回报业务控制出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #[原子_公共_证券基础数据_获取证券代码编号]

    /* 调用【原子_公共_证券基础数据_获取编号证券代码属性】*/
    call db_pub.pra_basesedt_GetNoStockCodeProp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_error_code,
        v_error_info,
        v_exch_no,
        v_stock_code,
        v_stock_type,
        v_crncy_type,
        v_exch_crncy_type,
        v_capit_reback_days,
        v_posi_reback_days,
        v_trade_code_no,
        v_target_code_no,
        v_net_price_flag,
        v_bond_rate_type,
        v_bond_accr_intrst,
        v_intrst_days,
        v_par_value,
        v_impawn_ratio);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.32.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取编号证券代码属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #回购实际天数 和 回购到期日期 需要计算
    #计算实际计息天数

    /* if (@订单方向# =《订单方向-融资回购》) or (@订单方向#=《订单方向-融券回购》) then */
    if (v_order_dir =3) or (v_order_dir=4) then

        /* 调用【原子_公共_证券基础数据_获取编号回购参数信息】*/
        call db_pub.pra_basesedt_GetNoRepoParamInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code_no,
            v_error_code,
            v_error_info,
            v_repo_days,
            v_repo_first_settle_date,
            v_repo_back_date,
            v_cash_capt_days,
            v_target_code_no,
            v_target_code,
            v_target_code_stock_type,
            v_target_code_asset_type);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.32.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取编号回购参数信息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @计息天数# = @资金占款天数#; */
        set v_intrst_days = v_cash_capt_days;

        /* set @回购实际天数# = @计息天数#; */
        set v_repo_cale_days = v_intrst_days;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_sys_config_str = v_sys_config_str;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_buy_ref_rate = v_buy_ref_rate;
    SET p_sell_ref_rate = v_sell_ref_rate;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_intrst_days = v_intrst_days;
    SET p_net_price_flag = v_net_price_flag;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_repo_days = v_repo_days;
    SET p_repo_cale_days = v_repo_cale_days;
    SET p_repo_back_date = v_repo_back_date;
    SET p_bond_qty_unit_set = v_bond_qty_unit_set;
    SET p_apply_date = v_apply_date;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查市场状态权限身份获取操作员权限串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckMarketStatusAuthOperRightsStr;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckMarketStatusAuthOperRightsStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_crncy_type varchar(3),
    OUT p_co_no_rights_str varchar(2048),
    OUT p_pd_no_rights_str varchar(2048),
    OUT p_exch_group_no_rights_str varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_exch_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_crncy_type varchar(3);
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_sys_config_str varchar(64);
    declare v_co_busi_config_str varchar(64);
    declare v_co_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_trade_date int;
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_busi_ctrl_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_no = p_exch_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_crncy_type = "CNY";
    SET v_co_no_rights_str = " ";
    SET v_pd_no_rights_str = " ";
    SET v_exch_group_no_rights_str = " ";
    SET v_sys_config_str = " ";
    SET v_co_busi_config_str = " ";
    SET v_co_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_busi_ctrl_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础_检查系统状态】*/
    call db_pub.pra_base_CheckSysStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_init_date,
        v_sys_config_str,
        v_co_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.132.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @机构编号# = 0; */
    set v_co_no = 0;

    /* 调用【原子_公共_基础_检查市场状态】*/
    call db_pub.pra_base_CheckMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_crncy_type,
        v_exch_crncy_type,
        v_exch_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.132.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @交易日期# = @初始化日期#; */
    set v_trade_date = v_init_date;

    /* 调用【原子_公共_基础_检查交易日期时间】*/
    call db_pub.pra_base_CheckExchDateTime(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_trade_date,
        v_exch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.132.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查交易日期时间出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.132.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.132.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @业务控制串# = "111"; */
    set v_busi_ctrl_str = "111";

    /* 调用【原子_公共_用户_获取操作员操作权限串】*/
    call db_pub.pra_user_GetOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_ctrl_str,
        v_error_code,
        v_error_info,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.132.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员操作权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_crncy_type = v_crncy_type;
    SET p_co_no_rights_str = v_co_no_rights_str;
    SET p_pd_no_rights_str = v_pd_no_rights_str;
    SET p_exch_group_no_rights_str = v_exch_group_no_rights_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查交易员身份权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckTraderAuthOper;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckTraderAuthOper(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_exgp_busi_config_str varchar(64);
    declare v_trade_acco varchar(32);
    declare v_target_opor_no int;
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_exgp_busi_config_str = " ";
    SET v_trade_acco = " ";
    SET v_target_opor_no = 0;
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";
    SET v_opor_rights = 0;

    
    label_pro:BEGIN
    
    #[原子_公共_用户_检查操作员身份]
    #不校验密码。

        /* 调用【原子_公共_用户_检查操作员身份无密码】*/
        call db_pub.pra_user_CheckOperatorAuthNoPwd(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_error_code,
            v_error_info,
            v_opor_type,
            v_oper_rights,
            v_is_trader);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.151.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份无密码出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


    /* [检查报错返回][@是否交易员# <> 《是否交易员-是》][762][@操作员编号#, @是否交易员#] */
    if v_is_trader <> 1 then
        
        SET v_error_code = "pubT.25.151.762";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.151.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.151.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号#=@操作员编号#; */
    set v_target_opor_no=v_opor_no;

    /* 调用【原子_公共_用户_获取操作员权限串】*/
    call db_pub.pra_user_GetOporRightsStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_opor_rights_str,
        v_allow_oper_mac);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.151.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #校验指令权限

    /* if (@允许操作MAC#<>" " or @允许操作MAC#<>"") then */
    if (v_allow_oper_mac<>" " or v_allow_oper_mac<>"") then

        /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][209][@操作员编号#] */
        if locate(v_oper_mac,v_allow_oper_mac)=0 then
            
            SET v_error_code = "pubT.25.151.209";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* set @操作员权限#=1; */
        set v_opor_rights=1;

        /* [检查报错返回][locate(@操作员权限#,@操作员权限串#)=0][206][@操作员编号#] */
        if locate(v_opor_rights,v_opor_rights_str)=0 then
            
            SET v_error_code = "pubT.25.151.206";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_no = v_pd_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查交易员身份批量权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckTraderAuthBatchOper;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckTraderAuthBatchOper(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_split_str varchar(4),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_split_str varchar(4);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_exgp_busi_config_str varchar(64);
    declare v_target_opor_no int;
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_split_str = p_split_str;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_exgp_busi_config_str = " ";
    SET v_target_opor_no = 0;
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";
    SET v_opor_rights = 0;

    
    label_pro:BEGIN
    
    #[原子_公共_用户_检查操作员身份]
    #不校验密码。

        /* 调用【原子_公共_用户_检查操作员身份无密码】*/
        call db_pub.pra_user_CheckOperatorAuthNoPwd(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_error_code,
            v_error_info,
            v_opor_type,
            v_oper_rights,
            v_is_trader);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.152.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份无密码出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


    /* [检查报错返回][@是否交易员# <> 《是否交易员-是》][762][@操作员编号#, @是否交易员#] */
    if v_is_trader <> 1 then
        
        SET v_error_code = "pubT.25.152.762";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.152.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查交易组操作批量权限】*/
    call db_pub.pra_trdif_CheckExchGroupOperBatchRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no_str,
        v_stock_type_str,
        v_split_str,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.152.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易组操作批量权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号#=@操作员编号#; */
    set v_target_opor_no=v_opor_no;

    /* 调用【原子_公共_用户_获取操作员权限串】*/
    call db_pub.pra_user_GetOporRightsStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_opor_rights_str,
        v_allow_oper_mac);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.152.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #校验指令权限

    /* if (@允许操作MAC#<>" " or @允许操作MAC#<>"") then */
    if (v_allow_oper_mac<>" " or v_allow_oper_mac<>"") then

        /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][209][@操作员编号#] */
        if locate(v_oper_mac,v_allow_oper_mac)=0 then
            
            SET v_error_code = "pubT.25.152.209";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* set @操作员权限#=1; */
        set v_opor_rights=1;

        /* [检查报错返回][locate(@操作员权限#,@操作员权限串#)=0][206][@操作员编号#] */
        if locate(v_opor_rights,v_opor_rights_str)=0 then
            
            SET v_error_code = "pubT.25.152.206";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_no = v_pd_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查指令执行人身份权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckCommExecutorAuthOper;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckCommExecutorAuthOper(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_comm_executor int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_comm_executor int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_exgp_busi_config_str varchar(64);
    declare v_trade_acco varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_comm_executor = p_comm_executor;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_exgp_busi_config_str = " ";
    SET v_trade_acco = " ";

    
    label_pro:BEGIN
    

    /* set @操作员编号# = @指令执行人#; */
    set v_opor_no = v_comm_executor;
    #不校验密码。

        /* 调用【原子_公共_用户_检查操作员身份无密码】*/
        call db_pub.pra_user_CheckOperatorAuthNoPwd(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_error_code,
            v_error_info,
            v_opor_type,
            v_oper_rights,
            v_is_trader);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.153.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份无密码出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    #[原子_公共_用户_检查操作员身份]

    /* [检查报错返回][@是否交易员# <> 《是否交易员-是》][762][@指令执行人#, @是否交易员#] */
    if v_is_trader <> 1 then
        
        SET v_error_code = "pubT.25.153.762";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令执行人=",v_comm_executor,","," 是否交易员=", v_is_trader),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令执行人=",v_comm_executor,","," 是否交易员=", v_is_trader);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.153.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.153.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_no = v_pd_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查操作员身份权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckOporAuth;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckOporAuth(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_exgp_busi_config_str varchar(64);
    declare v_trade_acco varchar(32);
    declare v_target_opor_no int;
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_exgp_busi_config_str = " ";
    SET v_trade_acco = " ";
    SET v_target_opor_no = 0;
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";
    SET v_opor_rights = 0;

    
    label_pro:BEGIN
    
    #[原子_公共_用户_检查操作员身份]
    #不校验密码。

        /* 调用【原子_公共_用户_检查操作员身份无密码】*/
        call db_pub.pra_user_CheckOperatorAuthNoPwd(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_error_code,
            v_error_info,
            v_opor_type,
            v_oper_rights,
            v_is_trader);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.154.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份无密码出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.154.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.154.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号#=@操作员编号#; */
    set v_target_opor_no=v_opor_no;

    /* 调用【原子_公共_用户_获取操作员权限串】*/
    call db_pub.pra_user_GetOporRightsStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_opor_rights_str,
        v_allow_oper_mac);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.154.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #校验指令权限

    /* if (@允许操作MAC#<>" " or @允许操作MAC#<>"") then */
    if (v_allow_oper_mac<>" " or v_allow_oper_mac<>"") then

        /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][209][@操作员编号#] */
        if locate(v_oper_mac,v_allow_oper_mac)=0 then
            
            SET v_error_code = "pubT.25.154.209";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* set @操作员权限#=1; */
        set v_opor_rights=1;

        /* [检查报错返回][locate(@操作员权限#,@操作员权限串#)=0][206][@操作员编号#] */
        if locate(v_opor_rights,v_opor_rights_str)=0 then
            
            SET v_error_code = "pubT.25.154.206";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_no = v_pd_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查操作员身份批量权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckOporAuthBatch;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckOporAuthBatch(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_split_str varchar(4),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_split_str varchar(4);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_exgp_busi_config_str varchar(64);
    declare v_target_opor_no int;
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_split_str = p_split_str;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_exgp_busi_config_str = " ";
    SET v_target_opor_no = 0;
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";
    SET v_opor_rights = 0;

    
    label_pro:BEGIN
    
    #[原子_公共_用户_检查操作员身份]
    #不校验密码。

        /* 调用【原子_公共_用户_检查操作员身份无密码】*/
        call db_pub.pra_user_CheckOperatorAuthNoPwd(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_error_code,
            v_error_info,
            v_opor_type,
            v_oper_rights,
            v_is_trader);
        if v_error_code = "1" then
            SET v_error_code = "pubT.25.155.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份无密码出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.155.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查交易组操作批量权限】*/
    call db_pub.pra_trdif_CheckExchGroupOperBatchRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no_str,
        v_stock_type_str,
        v_split_str,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.155.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易组操作批量权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号#=@操作员编号#; */
    set v_target_opor_no=v_opor_no;

    /* 调用【原子_公共_用户_获取操作员权限串】*/
    call db_pub.pra_user_GetOporRightsStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_opor_rights_str,
        v_allow_oper_mac);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.155.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #校验指令权限

    /* if (@允许操作MAC#<>" " or @允许操作MAC#<>"") then */
    if (v_allow_oper_mac<>" " or v_allow_oper_mac<>"") then

        /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][209][@操作员编号#] */
        if locate(v_oper_mac,v_allow_oper_mac)=0 then
            
            SET v_error_code = "pubT.25.155.209";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* set @操作员权限#=1; */
        set v_opor_rights=1;

        /* [检查报错返回][locate(@操作员权限#,@操作员权限串#)=0][206][@操作员编号#] */
        if locate(v_opor_rights,v_opor_rights_str)=0 then
            
            SET v_error_code = "pubT.25.155.206";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_no = v_pd_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查期货交易市场状态权限身份
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckFutuExchMarketStatusAuthOper;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckFutuExchMarketStatusAuthOper(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_contrc_code varchar(6),
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_contrc_unit int,
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_exch_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_contrc_code varchar(6);
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_exgp_busi_config_str varchar(64);
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_contrc_unit int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_sys_config_str varchar(64);
    declare v_co_comm_appr_oper int;
    declare v_exch_rate decimal(18,12);
    declare v_trade_date int;
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_stock_type int;
    declare v_trade_acco varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_no = p_exch_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_contrc_code = p_contrc_code;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_contrc_unit = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_sys_config_str = " ";
    SET v_co_comm_appr_oper = 0;
    SET v_exch_rate = 0;
    SET v_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_stock_type = 0;
    SET v_trade_acco = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_期货基础数据_检查期货交易业务属性】*/
    call db_pub.pra_basefudt_CheckFutuExchProp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_contrc_code,
        v_order_dir,
        v_contrc_dir,
        v_order_qty,
        v_price_type,
        v_error_code,
        v_error_info,
        v_contrc_code_no,
        v_contrc_type,
        v_asset_type,
        v_crncy_type,
        v_capit_reback_days,
        v_posi_reback_days,
        v_contrc_unit);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.135.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货基础数据_检查期货交易业务属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_基础_检查期货系统状态】*/
    call db_pub.pra_base_CheckFutuSysStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_contrc_type,
        v_error_code,
        v_error_info,
        v_init_date,
        v_sys_config_str,
        v_co_busi_config_str,
        v_co_comm_appr_oper);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.135.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查期货系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_基础_检查市场状态】*/
    call db_pub.pra_base_CheckMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_crncy_type,
        v_exch_crncy_type,
        v_exch_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.135.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @交易日期# = @初始化日期#; */
    set v_trade_date = v_init_date;

    /* 调用【原子_公共_基础_检查交易日期时间】*/
    call db_pub.pra_base_CheckExchDateTime(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_trade_date,
        v_exch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.135.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查交易日期时间出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @操作员编号#<>"99990001" and @操作员编号#<>"99990002" then */
    if v_opor_no<>"99990001" and v_opor_no<>"99990002" then

      /* 调用【原子_公共_用户_检查操作员身份】*/
      call db_pub.pra_user_CheckOperatorAuth(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_opor_pwd,
          v_error_code,
          v_error_info,
          v_opor_type,
          v_oper_rights,
          v_is_trader,
          v_online_opor_no_str);
      if v_error_code = "1" then
          SET v_error_code = "pubT.25.135.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;


      /* [检查报错返回][@是否交易员# <> 《是否交易员-是》][762][@操作员编号#, @是否交易员#] */
      if v_is_trader <> 1 then
          
          SET v_error_code = "pubT.25.135.762";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader),"#",v_mysql_message);
          else
              SET v_error_info = concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader);
          end if;
          leave label_pro;
      end if;

    end if;

    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.135.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @操作员编号#<>"99990001" and @操作员编号#<>"99990002" then */
    if v_opor_no<>"99990001" and v_opor_no<>"99990002" then

      /* 调用【原子_公共_用户_检查操作员操作权限】*/
      call db_pub.pra_user_CheckOperatorOperRights(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_exch_group_no,
          v_oper_rights,
          v_error_code,
          v_error_info,
          v_pd_no);
      if v_error_code = "1" then
          SET v_error_code = "pubT.25.135.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

    end if;

    /* set @证券类型# = @合约类型#; */
    set v_stock_type = v_contrc_type;

    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.135.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #交易组级，订单方向检查。Modify by wjp 20190428
    #[原子_公共_用户_检查交易组限制信息]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查期货指令市场状态权限身份
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckFutuCommMarketStatusAuthOper;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckFutuCommMarketStatusAuthOper(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_comm_executor int,
    IN p_contrc_code varchar(6),
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_contrc_unit int,
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_co_comm_appr_oper int,
    OUT p_sys_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_exch_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_comm_executor int;
    declare v_contrc_code varchar(6);
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_exgp_busi_config_str varchar(64);
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_contrc_unit int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_co_comm_appr_oper int;
    declare v_sys_config_str varchar(64);
    declare v_exch_rate decimal(18,12);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_stock_type int;
    declare v_trade_acco varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_no = p_exch_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_comm_executor = p_comm_executor;
    SET v_contrc_code = p_contrc_code;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_contrc_unit = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_co_comm_appr_oper = 0;
    SET v_sys_config_str = " ";
    SET v_exch_rate = 0;
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_stock_type = 0;
    SET v_trade_acco = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_期货基础数据_检查期货交易业务属性】*/
    call db_pub.pra_basefudt_CheckFutuExchProp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_contrc_code,
        v_order_dir,
        v_contrc_dir,
        v_order_qty,
        v_price_type,
        v_error_code,
        v_error_info,
        v_contrc_code_no,
        v_contrc_type,
        v_asset_type,
        v_crncy_type,
        v_capit_reback_days,
        v_posi_reback_days,
        v_contrc_unit);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.136.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货基础数据_检查期货交易业务属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_基础_检查期货系统状态】*/
    call db_pub.pra_base_CheckFutuSysStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_contrc_type,
        v_error_code,
        v_error_info,
        v_init_date,
        v_sys_config_str,
        v_co_busi_config_str,
        v_co_comm_appr_oper);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.136.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查期货系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_基础_检查市场状态】*/
    call db_pub.pra_base_CheckMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_crncy_type,
        v_exch_crncy_type,
        v_exch_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.136.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @操作员编号#<>"99990001" and @操作员编号#<>"99990002" then */
    if v_opor_no<>"99990001" and v_opor_no<>"99990002" then

      /* 调用【原子_公共_用户_检查操作员身份】*/
      call db_pub.pra_user_CheckOperatorAuth(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_opor_pwd,
          v_error_code,
          v_error_info,
          v_opor_type,
          v_oper_rights,
          v_is_trader,
          v_online_opor_no_str);
      if v_error_code = "1" then
          SET v_error_code = "pubT.25.136.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

    end if;

    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.136.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @操作员编号#<>"99990001" and @操作员编号#<>"99990002" then */
    if v_opor_no<>"99990001" and v_opor_no<>"99990002" then

      /* 调用【原子_公共_用户_检查操作员操作权限】*/
      call db_pub.pra_user_CheckOperatorOperRights(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_exch_group_no,
          v_oper_rights,
          v_error_code,
          v_error_info,
          v_pd_no);
      if v_error_code = "1" then
          SET v_error_code = "pubT.25.136.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

    end if;

    /* set @证券类型# = @合约类型#; */
    set v_stock_type = v_contrc_type;

    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.136.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #交易组级，订单方向检查。Modify by wjp 20190428
    #[原子_公共_用户_检查交易组限制信息]
    #对指令执行人进行可操作性检查

    /* if @指令执行人# <> (0)   and  substring(@系统控制配置串#,7,1) <>《系统类型-PB系统》  then */
    if v_comm_executor <> (0)   and  substring(v_sys_config_str,7,1) <>1  then

        /* set @操作员编号# = @指令执行人#; */
        set v_opor_no = v_comm_executor;
        #[原子_公共_用户_检查操作员身份无密码]

        /* [检查报错返回][@是否交易员# <> 《是否交易员-是》][762][@指令执行人#, @是否交易员#] */
        if v_is_trader <> 1 then
            
            SET v_error_code = "pubT.25.136.762";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令执行人=",v_comm_executor,","," 是否交易员=", v_is_trader),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令执行人=",v_comm_executor,","," 是否交易员=", v_is_trader);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_co_comm_appr_oper = v_co_comm_appr_oper;
    SET p_sys_config_str = v_sys_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查系统状态期货交易业务
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckSysStatusFutuExchBusi;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckSysStatusFutuExchBusi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_contrc_code varchar(6),
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_contrc_unit int,
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_exch_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_contrc_code varchar(6);
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_exgp_busi_config_str varchar(64);
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_contrc_unit int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_apply_date int;
    declare v_sys_config_str varchar(64);
    declare v_co_comm_appr_oper int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_trade_date int;
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_stock_type int;
    declare v_trade_acco varchar(32);
    declare v_strike_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_no = p_exch_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_contrc_code = p_contrc_code;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_contrc_unit = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_apply_date = 0;
    SET v_sys_config_str = " ";
    SET v_co_comm_appr_oper = 0;
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_stock_type = 0;
    SET v_trade_acco = " ";
    SET v_strike_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @申购日期# = 0; */
    set v_apply_date = 0;

    /* 调用【原子_公共_期货基础数据_检查期货交易业务属性】*/
    call db_pub.pra_basefudt_CheckFutuExchProp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_contrc_code,
        v_order_dir,
        v_contrc_dir,
        v_order_qty,
        v_price_type,
        v_error_code,
        v_error_info,
        v_contrc_code_no,
        v_contrc_type,
        v_asset_type,
        v_crncy_type,
        v_capit_reback_days,
        v_posi_reback_days,
        v_contrc_unit);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.137.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货基础数据_检查期货交易业务属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_基础_检查期货系统状态】*/
    call db_pub.pra_base_CheckFutuSysStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_contrc_type,
        v_error_code,
        v_error_info,
        v_init_date,
        v_sys_config_str,
        v_co_busi_config_str,
        v_co_comm_appr_oper);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.137.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查期货系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查交易市场状态】*/
    call db_pub.pra_trdif_CheckTrdMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_buy_ref_rate,
        v_sell_ref_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.137.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @交易日期# = @初始化日期#; */
    set v_trade_date = v_init_date;

    /* 调用【原子_公共_基础_检查交易日期时间】*/
    call db_pub.pra_base_CheckExchDateTime(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_trade_date,
        v_exch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.137.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查交易日期时间出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.137.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.137.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #[原子_公共_交易接口_检查期货交易业务属性]

    /* set @证券类型# = @合约类型#; */
    set v_stock_type = v_contrc_type;

    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.137.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #交易组级，订单方向检查。Modify by wjp 20190428
    #[原子_公共_用户_检查交易组限制信息]

    /* if @成交日期# = 0 then */
    if v_strike_date = 0 then

        /* set @成交日期# = @初始化日期#; */
        set v_strike_date = v_init_date;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查期货回报业务控制
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckFutuRspBusiControl;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckFutuRspBusiControl(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_contrc_code_no int,
    OUT p_contrc_type int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_exch_no int;
    declare v_contrc_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_pass_no int;
    declare v_bond_qty_unit_set int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_exch_no = p_exch_no;
    SET v_contrc_code = p_contrc_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_pass_no = 0;
    SET v_bond_qty_unit_set = 0;

    
    label_pro:BEGIN
    

    /* set @通道编号# = 0; */
    set v_pass_no = 0;

    /* 调用【原子_公共_交易接口_检查回报业务控制】*/
    call db_pub.pra_trdif_CheckRspBusiControl(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_pass_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_crncy_type,
        v_exch_crncy_type,
        v_bond_qty_unit_set);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.230.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查回报业务控制出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_期货基础数据_获取合约代码编号】*/
    call db_pub.pra_basefudt_GetContrcCodeNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_contrc_code,
        v_error_code,
        v_error_info,
        v_contrc_code_no,
        v_contrc_type);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.230.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货基础数据_获取合约代码编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查交易市场状态权限身份无操作员权限校验
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckExchMarketStatusAuthOperNoOperatorCheck;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckExchMarketStatusAuthOperNoOperatorCheck(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_sys_config_str varchar(64),
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_buy_ref_rate decimal(18,12),
    OUT p_sell_ref_rate decimal(18,12),
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_bond_rate_type int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_target_code_no int,
    OUT p_target_code varchar(6),
    OUT p_target_code_stock_type int,
    OUT p_target_code_asset_type int,
    OUT p_trade_code_no int,
    OUT p_trade_code varchar(6),
    OUT p_trade_code_stock_type int,
    OUT p_trade_code_asset_type int,
    OUT p_min_unit int,
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_last_price decimal(16,9),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_apply_date int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_exch_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_sys_config_str varchar(64);
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_exgp_busi_config_str varchar(64);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;
    declare v_trade_code_no int;
    declare v_trade_code varchar(6);
    declare v_trade_code_stock_type int;
    declare v_trade_code_asset_type int;
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_apply_date int;
    declare v_bond_qty_unit_set int;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_trade_date int;
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_target_opor_no int;
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights int;
    declare v_trade_acco varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_no = p_exch_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_sys_config_str = " ";
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;
    SET v_target_code_no = 0;
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_trade_code = " ";
    SET v_trade_code_stock_type = 0;
    SET v_trade_code_asset_type = 0;
    SET v_min_unit = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_apply_date = 0;
    SET v_bond_qty_unit_set = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_target_opor_no = 0;
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";
    SET v_opor_rights = 0;
    SET v_trade_acco = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_交易接口_检查证券交易业务属性】*/
    call db_pub.pra_trdif_CheckSecuExchProp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_order_dir,
        v_order_qty,
        v_price_type,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_crncy_type,
        v_exch_crncy_type,
        v_capit_reback_days,
        v_posi_reback_days,
        v_par_value,
        v_impawn_ratio,
        v_net_price_flag,
        v_intrst_days,
        v_bond_rate_type,
        v_bond_accr_intrst,
        v_min_unit,
        v_up_limit_price,
        v_down_limit_price,
        v_last_price,
        v_target_code_no,
        v_target_code,
        v_target_code_stock_type,
        v_target_code_asset_type,
        v_trade_code_no,
        v_trade_code,
        v_trade_code_stock_type,
        v_trade_code_asset_type,
        v_bond_qty_unit_set,
        v_apply_date,
        v_subscription_trade_mark,
        v_purchase_trade_mark,
        v_rede_trade_mark,
        v_first_minimum_amt,
        v_minimum_purchase_amt,
        v_minimum_subscription_amt,
        v_minimum_rede_share,
        v_minimum_holding_share);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.231.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查证券交易业务属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查交易系统状态】*/
    call db_pub.pra_trdif_CheckTrdSysStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_init_date,
        v_sys_config_str,
        v_co_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.231.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查交易市场状态】*/
    call db_pub.pra_trdif_CheckTrdMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_buy_ref_rate,
        v_sell_ref_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.231.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @交易日期# = @初始化日期#; */
    set v_trade_date = v_init_date;

    /* 调用【原子_公共_基础_检查交易日期时间】*/
    call db_pub.pra_base_CheckExchDateTime(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_trade_date,
        v_exch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.231.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查交易日期时间出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.231.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@是否交易员# <> 《是否交易员-是》][762][@操作员编号#, @是否交易员#] */
    if v_is_trader <> 1 then
        
        SET v_error_code = "pubT.25.231.762";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.231.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号#=@操作员编号#; */
    set v_target_opor_no=v_opor_no;

    /* 调用【原子_公共_用户_获取操作员权限串】*/
    call db_pub.pra_user_GetOporRightsStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_opor_rights_str,
        v_allow_oper_mac);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.231.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #校验交易权限

    /* if (@允许操作MAC#<>" " or @允许操作MAC#<>"") then */
    if (v_allow_oper_mac<>" " or v_allow_oper_mac<>"") then

        /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][209][@操作员编号#] */
        if locate(v_oper_mac,v_allow_oper_mac)=0 then
            
            SET v_error_code = "pubT.25.231.209";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* set @操作员权限#=2; */
        set v_opor_rights=2;

        /* [检查报错返回][locate(@操作员权限#,@操作员权限串#)=0][207][@操作员编号#] */
        if locate(v_opor_rights,v_opor_rights_str)=0 then
            
            SET v_error_code = "pubT.25.231.207";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;
    #[原子_公共_用户_检查操作员操作权限]

    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.231.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #交易组级，订单方向检查。Modify by wjp 20190428

    /* 调用【原子_公共_用户_检查交易组限制信息】*/
    call db_pub.pra_user_CheckExchGroupLimitInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_order_dir,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.231.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组限制信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_sys_config_str = v_sys_config_str;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_buy_ref_rate = v_buy_ref_rate;
    SET p_sell_ref_rate = v_sell_ref_rate;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_target_code_no = v_target_code_no;
    SET p_target_code = v_target_code;
    SET p_target_code_stock_type = v_target_code_stock_type;
    SET p_target_code_asset_type = v_target_code_asset_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_trade_code = v_trade_code;
    SET p_trade_code_stock_type = v_trade_code_stock_type;
    SET p_trade_code_asset_type = v_trade_code_asset_type;
    SET p_min_unit = v_min_unit;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_last_price = v_last_price;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_apply_date = v_apply_date;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查交易系统状态权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckTrdSysStatusAuth;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckTrdSysStatusAuth(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_busi_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_busi_config_str varchar(64);
    declare v_init_date int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_sys_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no = p_co_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_busi_config_str = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_sys_config_str = " ";

    
    label_pro:BEGIN
    

    /* set @操作员机构编号# = @机构编号#; */
    set v_opor_co_no = v_co_no;

    /* 调用【原子_公共_交易接口_检查交易系统状态权限】*/
    call db_pub.pra_trdif_CheckTrdSysStatusAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_init_date,
        v_co_busi_config_str,
        v_allow_exch,
        v_allow_stock_type,
        v_sys_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.232.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易系统状态权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_获取操作员登录信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_GetOperLoginInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_GetOperLoginInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_last_login_ip varchar(32),
    OUT p_last_login_mac varchar(32),
    OUT p_last_login_date int,
    OUT p_last_oper_info varchar(255),
    OUT p_online_status int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_last_login_ip varchar(32);
    declare v_last_login_mac varchar(32);
    declare v_last_login_date int;
    declare v_last_oper_info varchar(255);
    declare v_online_status int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_last_login_ip = " ";
    SET v_last_login_mac = " ";
    SET v_last_login_date = date_format(curdate(),'%Y%m%d');
    SET v_last_oper_info = " ";
    SET v_online_status = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_交易接口_获取操作员登录信息】*/
    call db_pub.pra_trdif_GetOperLoginInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_last_login_ip,
        v_last_login_mac,
        v_last_login_date,
        v_last_oper_info,
        v_online_status);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.233.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_获取操作员登录信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_last_login_ip = v_last_login_ip;
    SET p_last_login_mac = v_last_login_mac;
    SET p_last_login_date = v_last_login_date;
    SET p_last_oper_info = v_last_oper_info;
    SET p_online_status = v_online_status;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_融资融券获取券商保证金比例
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_FinaLoanGetBrokerMarginRadio;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_FinaLoanGetBrokerMarginRadio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_co_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_fina_marg_ratio decimal(18,12),
    OUT p_secu_loan_marg_ratio decimal(18,12),
    OUT p_secu_loan_price_limit decimal(16,9)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pass_no int;
    declare v_co_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_fina_marg_ratio decimal(18,12);
    declare v_secu_loan_marg_ratio decimal(18,12);
    declare v_secu_loan_price_limit decimal(16,9);
    declare v_fina_status varchar(2);
    declare v_secu_loan_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pass_no = p_pass_no;
    SET v_co_no = p_co_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_fina_marg_ratio = 0;
    SET v_secu_loan_marg_ratio = 0;
    SET v_secu_loan_price_limit = 0;
    SET v_fina_status = "0";
    SET v_secu_loan_status = "0";

    
    label_pro:BEGIN
    

    /* set @融资保证金比例# = 0; */
    set v_fina_marg_ratio = 0;

    /* set @融券保证金比例# = 0; */
    set v_secu_loan_marg_ratio = 0;

    /* set @融资状态# = 《融资状态-正常》; */
    set v_fina_status = "1";

    /* set @融券状态# = 《融资状态-正常》; */
    set v_secu_loan_status = "1";

    /* if @订单方向# = 《订单方向-融资买入》 then */
    if v_order_dir = 5 then

        /* [获取表记录变量语句][公共_融资融券基础数据_融资融券券商禁止标的证券表][{融资状态}][@融资状态#][({通道编号} = 0 or {通道编号} = @通道编号#) and ({机构编号}= 0 or  {机构编号} = @机构编号#) and ({市场编号} = @市场编号#) and ({证券代码} = 0 or  {证券代码}=@证券代码#)] */
        select fina_status into v_fina_status from db_pub.tb_basesemdt_margin_broker_ban_underly_secu where (pass_no = 0 or pass_no = v_pass_no) and (co_no= 0 or  co_no = v_co_no) and (exch_no = v_exch_no) and (stock_code = 0 or  stock_code=v_stock_code) limit 1;


        /* [检查报错返回][@融资状态# = 《融资状态-停止》][28][@融资状态#] */
        if v_fina_status = "2" then
            
            SET v_error_code = "pubT.25.234.28";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("融资状态=",v_fina_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("融资状态=",v_fina_status);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][公共_融资融券基础数据_融资融券保证金比例配置表][{融券价格限制},{融资保证金比例}][@融券价格限制#,@融资保证金比例#][({通道编号} = 0 or {通道编号} = @通道编号#) and ({机构编号}= 0 or  {机构编号} = @机构编号#) and ( {市场编号} = @市场编号#) and ({证券代码} = 0 or  {证券代码}=@证券代码#) order by pass_no desc,co_no desc,stock_code desc][4b][@通道编号#,@机构编号#,@市场编号#,@证券代码#] */
        select secu_loan_price_limit,fina_marg_ratio into v_secu_loan_price_limit,v_fina_marg_ratio from db_pub.tb_basesemdt_secu_margin_ratio_allocation where (pass_no = 0 or pass_no = v_pass_no) and (co_no= 0 or  co_no = v_co_no) and ( exch_no = v_exch_no) and (stock_code = 0 or  stock_code=v_stock_code) order by pass_no desc,co_no desc,stock_code desc limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubT.25.234.4b";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","机构编号=",v_co_no,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("通道编号=",v_pass_no,",","机构编号=",v_co_no,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @订单方向# = 《订单方向-融券卖出》 then */
    if v_order_dir = 6 then

        /* [获取表记录变量语句][公共_融资融券基础数据_融资融券券商禁止标的证券表][{融券状态}][@融券状态#][({通道编号} = 0 or {通道编号} = @通道编号#) and ({机构编号}= 0 or  {机构编号} = @机构编号#) and ({市场编号} = @市场编号#) and ({证券代码} = 0 or  {证券代码}=@证券代码#)] */
        select secu_loan_status into v_secu_loan_status from db_pub.tb_basesemdt_margin_broker_ban_underly_secu where (pass_no = 0 or pass_no = v_pass_no) and (co_no= 0 or  co_no = v_co_no) and (exch_no = v_exch_no) and (stock_code = 0 or  stock_code=v_stock_code) limit 1;


        /* [检查报错返回][@融券状态# = 《融券状态-停止》][28][@融资状态#] */
        if v_secu_loan_status = "2" then
            
            SET v_error_code = "pubT.25.234.28";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("融资状态=",v_fina_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("融资状态=",v_fina_status);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][公共_融资融券基础数据_融资融券保证金比例配置表][{融券价格限制},{融券保证金比例}][@融券价格限制#,@融券保证金比例#][({通道编号} = 0 or {通道编号} = @通道编号#) and ({机构编号}= 0 or  {机构编号} = @机构编号#) and ( {市场编号} = @市场编号#) and ({证券代码} = 0 or  {证券代码}=@证券代码#) order by pass_no desc,co_no desc,stock_code desc][4d][@通道编号#,@机构编号#,@市场编号#,@证券代码#] */
        select secu_loan_price_limit,secu_loan_marg_ratio into v_secu_loan_price_limit,v_secu_loan_marg_ratio from db_pub.tb_basesemdt_secu_margin_ratio_allocation where (pass_no = 0 or pass_no = v_pass_no) and (co_no= 0 or  co_no = v_co_no) and ( exch_no = v_exch_no) and (stock_code = 0 or  stock_code=v_stock_code) order by pass_no desc,co_no desc,stock_code desc limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubT.25.234.4d";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","机构编号=",v_co_no,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("通道编号=",v_pass_no,",","机构编号=",v_co_no,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_fina_marg_ratio = v_fina_marg_ratio;
    SET p_secu_loan_marg_ratio = v_secu_loan_marg_ratio;
    SET p_secu_loan_price_limit = v_secu_loan_price_limit;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查交易市场状态权限身份无密码
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckExchMarketStatusAuthOperWithoutPwd;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckExchMarketStatusAuthOperWithoutPwd(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_sys_config_str varchar(64),
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_buy_ref_rate decimal(18,12),
    OUT p_sell_ref_rate decimal(18,12),
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_bond_rate_type int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_target_code_no int,
    OUT p_target_code varchar(6),
    OUT p_target_code_stock_type int,
    OUT p_target_code_asset_type int,
    OUT p_trade_code_no int,
    OUT p_trade_code varchar(6),
    OUT p_trade_code_stock_type int,
    OUT p_trade_code_asset_type int,
    OUT p_min_unit int,
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_last_price decimal(16,9),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_apply_date int,
    OUT p_subscription_trade_mark int,
    OUT p_purchase_trade_mark int,
    OUT p_rede_trade_mark int,
    OUT p_first_minimum_amt decimal(18,4),
    OUT p_minimum_purchase_amt decimal(18,4),
    OUT p_minimum_subscription_amt decimal(18,4),
    OUT p_minimum_rede_share decimal(18,2),
    OUT p_minimum_holding_share decimal(18,2),
    OUT p_trade_acco varchar(32)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_exch_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_sys_config_str varchar(64);
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_exgp_busi_config_str varchar(64);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;
    declare v_trade_code_no int;
    declare v_trade_code varchar(6);
    declare v_trade_code_stock_type int;
    declare v_trade_code_asset_type int;
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_apply_date int;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_trade_acco varchar(32);
    declare v_bond_qty_unit_set int;
    declare v_trade_date int;
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_target_opor_no int;
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_no = p_exch_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_sys_config_str = " ";
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;
    SET v_target_code_no = 0;
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_trade_code = " ";
    SET v_trade_code_stock_type = 0;
    SET v_trade_code_asset_type = 0;
    SET v_min_unit = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_apply_date = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_trade_acco = " ";
    SET v_bond_qty_unit_set = 0;
    SET v_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_target_opor_no = 0;
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";
    SET v_opor_rights = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_交易接口_检查证券交易业务属性】*/
    call db_pub.pra_trdif_CheckSecuExchProp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_order_dir,
        v_order_qty,
        v_price_type,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_crncy_type,
        v_exch_crncy_type,
        v_capit_reback_days,
        v_posi_reback_days,
        v_par_value,
        v_impawn_ratio,
        v_net_price_flag,
        v_intrst_days,
        v_bond_rate_type,
        v_bond_accr_intrst,
        v_min_unit,
        v_up_limit_price,
        v_down_limit_price,
        v_last_price,
        v_target_code_no,
        v_target_code,
        v_target_code_stock_type,
        v_target_code_asset_type,
        v_trade_code_no,
        v_trade_code,
        v_trade_code_stock_type,
        v_trade_code_asset_type,
        v_bond_qty_unit_set,
        v_apply_date,
        v_subscription_trade_mark,
        v_purchase_trade_mark,
        v_rede_trade_mark,
        v_first_minimum_amt,
        v_minimum_purchase_amt,
        v_minimum_subscription_amt,
        v_minimum_rede_share,
        v_minimum_holding_share);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.235.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查证券交易业务属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查交易系统状态】*/
    call db_pub.pra_trdif_CheckTrdSysStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_init_date,
        v_sys_config_str,
        v_co_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.235.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_交易接口_检查交易市场状态】*/
    call db_pub.pra_trdif_CheckTrdMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_buy_ref_rate,
        v_sell_ref_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.235.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查交易市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @交易日期# = @初始化日期#; */
    set v_trade_date = v_init_date;

    /* 调用【原子_公共_基础_检查交易日期时间】*/
    call db_pub.pra_base_CheckExchDateTime(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_trade_date,
        v_exch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.235.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查交易日期时间出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份无密码】*/
    call db_pub.pra_user_CheckOperatorAuthNoPwd(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.235.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份无密码出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #PB系统不判断

    /* if  substring(@系统控制配置串#,7,1) <> 《系统类型-PB系统》 then */
    if  substring(v_sys_config_str,7,1) <> 1 then
      #增强交易不校验是否操作员

      /* if @菜单编号# <> 1050004 then */
      if v_menu_no <> 1050004 then

        /* [检查报错返回][@是否交易员# <> 《是否交易员-是》][762][@操作员编号#, @是否交易员#] */
        if v_is_trader <> 1 then
            
            SET v_error_code = "pubT.25.235.762";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no,","," 是否交易员=", v_is_trader);
            end if;
            leave label_pro;
        end if;

      end if;
    end if;

    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.235.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.235.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号#=@操作员编号#; */
    set v_target_opor_no=v_opor_no;

    /* 调用【原子_公共_用户_获取操作员权限串】*/
    call db_pub.pra_user_GetOporRightsStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_opor_rights_str,
        v_allow_oper_mac);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.235.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #校验交易权限

    /* if (@允许操作MAC#<>" " or @允许操作MAC#<>"") then */
    if (v_allow_oper_mac<>" " or v_allow_oper_mac<>"") then

        /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][209][@操作员编号#] */
        if locate(v_oper_mac,v_allow_oper_mac)=0 then
            
            SET v_error_code = "pubT.25.235.209";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* set @操作员权限#=2; */
        set v_opor_rights=2;

        /* [检查报错返回][locate(@操作员权限#,@操作员权限串#)=0][207][@操作员编号#] */
        if locate(v_opor_rights,v_opor_rights_str)=0 then
            
            SET v_error_code = "pubT.25.235.207";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.235.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #交易组级，订单方向检查。Modify by wjp 20190428

    /* 调用【原子_公共_用户_检查交易组限制信息】*/
    call db_pub.pra_user_CheckExchGroupLimitInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_order_dir,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.235.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组限制信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_sys_config_str = v_sys_config_str;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_buy_ref_rate = v_buy_ref_rate;
    SET p_sell_ref_rate = v_sell_ref_rate;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_target_code_no = v_target_code_no;
    SET p_target_code = v_target_code;
    SET p_target_code_stock_type = v_target_code_stock_type;
    SET p_target_code_asset_type = v_target_code_asset_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_trade_code = v_trade_code;
    SET p_trade_code_stock_type = v_trade_code_stock_type;
    SET p_trade_code_asset_type = v_trade_code_asset_type;
    SET p_min_unit = v_min_unit;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_last_price = v_last_price;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_apply_date = v_apply_date;
    SET p_subscription_trade_mark = v_subscription_trade_mark;
    SET p_purchase_trade_mark = v_purchase_trade_mark;
    SET p_rede_trade_mark = v_rede_trade_mark;
    SET p_first_minimum_amt = v_first_minimum_amt;
    SET p_minimum_purchase_amt = v_minimum_purchase_amt;
    SET p_minimum_subscription_amt = v_minimum_subscription_amt;
    SET p_minimum_rede_share = v_minimum_rede_share;
    SET p_minimum_holding_share = v_minimum_holding_share;
    SET p_trade_acco = v_trade_acco;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_交易接口_检查证券属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_trdif_CheckSecuProp;;
DELIMITER ;;
CREATE PROCEDURE prt_trdif_CheckSecuProp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_price_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_bond_rate_type int,
    OUT p_bond_accr_intrst decimal(18,12)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_price_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_price_type = p_price_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_交易接口_检查证券属性】*/
    call db_pub.pra_trdif_CheckExchProp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_price_type,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_crncy_type,
        v_exch_crncy_type,
        v_capit_reback_days,
        v_posi_reback_days,
        v_par_value,
        v_impawn_ratio,
        v_net_price_flag,
        v_intrst_days,
        v_bond_rate_type,
        v_bond_accr_intrst);
    if v_error_code = "1" then
        SET v_error_code = "pubT.25.236.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_交易接口_检查证券属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_bond_accr_intrst = v_bond_accr_intrst;

END;;


