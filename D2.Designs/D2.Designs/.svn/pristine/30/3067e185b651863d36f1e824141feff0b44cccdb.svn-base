DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_接口_同步期货信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfuif_SyncFutuMarketInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfuif_SyncFutuMarketInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_contrc_code_no int,
    IN p_exch_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_name varchar(64),
    IN p_contrc_type int,
    IN p_asset_type int,
    IN p_step_price decimal(16,9),
    IN p_hold_qty decimal(18,2),
    IN p_main_flag int,
    IN p_contrc_unit int,
    IN p_last_price decimal(16,9),
    IN p_buy_price_1 decimal(16,9),
    IN p_sell_price_1 decimal(16,9),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_pre_settle_price decimal(16,9),
    IN p_sett_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_contrc_code_no int;
    declare v_exch_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_name varchar(64);
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_step_price decimal(16,9);
    declare v_hold_qty decimal(18,2);
    declare v_main_flag int;
    declare v_contrc_unit int;
    declare v_last_price decimal(16,9);
    declare v_buy_price_1 decimal(16,9);
    declare v_sell_price_1 decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_time_stamp int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;

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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_exch_no = p_exch_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_name = p_contrc_name;
    SET v_contrc_type = p_contrc_type;
    SET v_asset_type = p_asset_type;
    SET v_step_price = p_step_price;
    SET v_hold_qty = p_hold_qty;
    SET v_main_flag = p_main_flag;
    SET v_contrc_unit = p_contrc_unit;
    SET v_last_price = p_last_price;
    SET v_buy_price_1 = p_buy_price_1;
    SET v_sell_price_1 = p_sell_price_1;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_sett_price = p_sett_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_time_stamp = unix_timestamp();
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @时间戳# =  unix_timestamp(); */
    set v_time_stamp =  unix_timestamp();

    /* [插入重复更新][风控期货_计算_期货信息表][字段][字段变量][{涨停价} = @涨停价#, {跌停价} = @跌停价#, {卖一价} = @卖一价#, {买一价} = @买一价#, {持仓量} = @持仓量#, {主力标志} =@主力标志#, {最新价} = @最新价#][5][@合约代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rkfutu.tb_rkfucc_futu_contrc_info (
        create_date, create_time, update_date, 
        update_time, update_times, contrc_code_no, exch_no, 
        contrc_code, contrc_name, contrc_type, asset_type, 
        step_price, hold_qty, main_flag, contrc_unit, 
        last_price, buy_price_1, sell_price_1, up_limit_price, 
        down_limit_price, pre_settle_price, sett_price) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_contrc_code_no, v_exch_no, 
        v_contrc_code, v_contrc_name, v_contrc_type, v_asset_type, 
        v_step_price, v_hold_qty, v_main_flag, v_contrc_unit, 
        v_last_price, v_buy_price_1, v_sell_price_1, v_up_limit_price, 
        v_down_limit_price, v_pre_settle_price, v_sett_price) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, up_limit_price = v_up_limit_price, down_limit_price = v_down_limit_price, sell_price_1 = v_sell_price_1, buy_price_1 = v_buy_price_1, hold_qty = v_hold_qty, main_flag =v_main_flag, last_price = v_last_price;
    if v_error_code = "1" then
                
        SET v_error_code = "rkfutuA.5.1.5";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约代码=",v_contrc_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约代码=",v_contrc_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_接口_同步期货持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfuif_SyncFutuPosition;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfuif_SyncFutuPosition(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_comb_code varchar(6),
    IN p_posi_qty decimal(18,2),
    IN p_rece_margin decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_posi_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;

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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_comb_code = p_comb_code;
    SET v_posi_qty = p_posi_qty;
    SET v_rece_margin = p_rece_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][风控期货_计算_交易组业务持仓表][字段][字段变量][{持仓数量} = @持仓数量#,{应收保证金} = @应收保证金#][5][@交易组编号#,@资产账户编号#, @交易编码编号#,@合约代码编号#, @多空类型#, @套保标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rkfutu.tb_rkfucc_futu_exgp_posi (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
        lngsht_type, hedge_type, comb_code, posi_qty, 
        rece_margin) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
        v_lngsht_type, v_hedge_type, v_comb_code, v_posi_qty, 
        v_rece_margin) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, posi_qty = v_posi_qty,rece_margin = v_rece_margin;
    if v_error_code = "1" then
                
        SET v_error_code = "rkfutuA.5.2.5";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,","," 交易编码编号=", v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,","," 多空类型=", v_lngsht_type,","," 套保标志=", v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,","," 交易编码编号=", v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,","," 多空类型=", v_lngsht_type,","," 套保标志=", v_hedge_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_接口_服务器查询客户风险规则
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfuif_ServerQueryFutuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfuif_ServerQueryFutuClientRiskRule(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_row_count int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][风控期货_风控_客户风险规则表][字段][{记录序号} > @记录序号# ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, model_id, 
        model_name, risk_item_id, risk_item_name, exch_no, 
        contrc_type, order_dir_str, trig_stage_type, compli_calc_level, 
        unit_nav_flag, trig_type, risk_rule_id, risk_rule_type, 
        risk_rule_name, risk_rule_code, risk_param_str, risk_rule_value_str, 
        risk_rule_calc_str, corrsp_plug, risk_rule_action, begin_time, 
        end_time, rule_flag from db_rkfutu.tb_rkfurk_client_risk_rule where row_id > v_row_id ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, model_id, 
        model_name, risk_item_id, risk_item_name, exch_no, 
        contrc_type, order_dir_str, trig_stage_type, compli_calc_level, 
        unit_nav_flag, trig_type, risk_rule_id, risk_rule_type, 
        risk_rule_name, risk_rule_code, risk_param_str, risk_rule_value_str, 
        risk_rule_calc_str, corrsp_plug, risk_rule_action, begin_time, 
        end_time, rule_flag from db_rkfutu.tb_rkfurk_client_risk_rule where row_id > v_row_id  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_接口_更新客户风险规则计算值串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfuif_UpdateFutuClientRiskRuleCalcStr;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfuif_UpdateFutuClientRiskRuleCalcStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_client_risk_rule_id int,
    IN p_risk_rule_calc_str varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_client_risk_rule_id int;
    declare v_risk_rule_calc_str varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;

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
    SET v_client_risk_rule_id = p_client_risk_rule_id;
    SET v_risk_rule_calc_str = p_risk_rule_calc_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][风控期货_风控_客户风险规则表][{风险计算值串} = @风险计算值串#][{记录序号} = @客户风险规则序号#][2][@客户风险规则序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rkfutu.tb_rkfurk_client_risk_rule set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, risk_rule_calc_str = v_risk_rule_calc_str where row_id = v_client_risk_rule_id;
    if v_error_code = "1" then
                
        SET v_error_code = "rkfutuA.5.4.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("客户风险规则序号=",v_client_risk_rule_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_接口_同步期货保证金优惠
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfuif_SyncFutuMarginCtrl;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfuif_SyncFutuMarginCtrl(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_hedge_type int,
    IN p_comb_code varchar(6),
    IN p_long_comm_margin decimal(18,4),
    IN p_short_comm_margin decimal(18,4),
    IN p_long_order_margin decimal(18,4),
    IN p_short_order_margin decimal(18,4),
    IN p_long_strike_margin decimal(18,4),
    IN p_short_strike_margin decimal(18,4),
    IN p_long_hold_margin decimal(18,4),
    IN p_short_hold_margin decimal(18,4),
    IN p_trade_capt_amt decimal(18,4),
    IN p_posi_capt_amt decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_long_comm_margin decimal(18,4);
    declare v_short_comm_margin decimal(18,4);
    declare v_long_order_margin decimal(18,4);
    declare v_short_order_margin decimal(18,4);
    declare v_long_strike_margin decimal(18,4);
    declare v_short_strike_margin decimal(18,4);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_posi_capt_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;

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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_hedge_type = p_hedge_type;
    SET v_comb_code = p_comb_code;
    SET v_long_comm_margin = p_long_comm_margin;
    SET v_short_comm_margin = p_short_comm_margin;
    SET v_long_order_margin = p_long_order_margin;
    SET v_short_order_margin = p_short_order_margin;
    SET v_long_strike_margin = p_long_strike_margin;
    SET v_short_strike_margin = p_short_strike_margin;
    SET v_long_hold_margin = p_long_hold_margin;
    SET v_short_hold_margin = p_short_hold_margin;
    SET v_trade_capt_amt = p_trade_capt_amt;
    SET v_posi_capt_amt = p_posi_capt_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][风控期货_计算_保证金优惠控制表][字段][字段变量][{多头订单保证金} = @多头订单保证金# , {空头订单保证金} = @空头订单保证金#, {多头成交保证金} = @多头成交保证金#, {空头成交保证金} =@空头成交保证金#, {多头持仓保证金} = @多头持仓保证金#, {空头持仓保证金} = @空头持仓保证金#, {交易占用金额} = @交易占用金额#, {持仓占用金额} = @持仓占用金额#][5][@机构编号#,@产品编号#, @交易组编号#,@资产账户编号#, @交易币种#, @市场编号#, @套保标志#, @组合编码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rkfutu.tb_rkfucc_margin_ctrl (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
        hedge_type, comb_code, long_comm_margin, short_comm_margin, 
        long_order_margin, short_order_margin, long_strike_margin, short_strike_margin, 
        long_hold_margin, short_hold_margin, trade_capt_amt, posi_capt_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_exch_no, 
        v_hedge_type, v_comb_code, v_long_comm_margin, v_short_comm_margin, 
        v_long_order_margin, v_short_order_margin, v_long_strike_margin, v_short_strike_margin, 
        v_long_hold_margin, v_short_hold_margin, v_trade_capt_amt, v_posi_capt_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, long_order_margin = v_long_order_margin , short_order_margin = v_short_order_margin, long_strike_margin = v_long_strike_margin, short_strike_margin =v_short_strike_margin, long_hold_margin = v_long_hold_margin, short_hold_margin = v_short_hold_margin, trade_capt_amt = v_trade_capt_amt, posi_capt_amt = v_posi_capt_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "rkfutuA.5.5.5";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,","," 交易组编号=", v_exch_group_no,",","资产账户编号=",v_asset_acco_no,","," 交易币种=", v_exch_crncy_type,","," 市场编号=", v_exch_no,","," 套保标志=", v_hedge_type,","," 组合编码=", v_comb_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,","," 交易组编号=", v_exch_group_no,",","资产账户编号=",v_asset_acco_no,","," 交易币种=", v_exch_crncy_type,","," 市场编号=", v_exch_no,","," 套保标志=", v_hedge_type,","," 组合编码=", v_comb_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


