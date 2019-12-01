DELIMITER ;;
use db_rkfutu;;

# 事务_风控期货_接口_检查客户风险
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfuif_CheckFutuClientRisk;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfuif_CheckFutuClientRisk(
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
    IN p_exch_no int,
    IN p_hedge_type int,
    IN p_comb_code varchar(6),
    IN p_lngsht_type int,
    IN p_contrc_type int,
    IN p_contrc_code varchar(6),
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_all_fee decimal(18,4),
    IN p_rece_margin decimal(18,4),
    IN p_order_qty decimal(18,2),
    IN p_contrc_unit int,
    IN p_order_price decimal(16,9),
    IN p_trig_stage_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_compli_trig_id bigint
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
    declare v_exch_no int;
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_lngsht_type int;
    declare v_contrc_type int;
    declare v_contrc_code varchar(6);
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_all_fee decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_contrc_unit int;
    declare v_order_price decimal(16,9);
    declare v_trig_stage_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_risk_param_value_str varchar(1024);

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
    SET v_exch_no = p_exch_no;
    SET v_hedge_type = p_hedge_type;
    SET v_comb_code = p_comb_code;
    SET v_lngsht_type = p_lngsht_type;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_code = p_contrc_code;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_all_fee = p_all_fee;
    SET v_rece_margin = p_rece_margin;
    SET v_order_qty = p_order_qty;
    SET v_contrc_unit = p_contrc_unit;
    SET v_order_price = p_order_price;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_compli_trig_id = 0;
    SET v_risk_param_value_str = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控期货_风控_获取最大的合规触警流水序号】*/
      call db_rkfutu.pra_rkfurk_GetMaxComplianceTriggerId(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_error_code,
          v_error_info,
          v_compli_trig_id);
      if v_error_code = "1" then
          SET v_error_code = "rkfutuT.5.1.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_获取最大的合规触警流水序号出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


    /* [事务结束] */
    COMMIT;


    /* set @风险要素值串# = concat(";","合约代码=", @合约代码#, ";"); */
    set v_risk_param_value_str = concat(";","合约代码=", v_contrc_code, ";");

    /* 调用【原子_风控期货_风控_交易检查客户风险】*/
    call db_rkfutu.pra_rkfurk_CheckFutuClientRisk(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_hedge_type,
        v_comb_code,
        v_lngsht_type,
        v_contrc_type,
        v_contrc_code,
        v_order_dir,
        v_contrc_dir,
        v_all_fee,
        v_rece_margin,
        v_order_qty,
        v_contrc_unit,
        v_order_price,
        v_trig_stage_type,
        v_compli_trig_id,
        v_risk_param_value_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rkfutuT.5.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_交易检查客户风险出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_compli_trig_id = v_compli_trig_id;

END;;


DELIMITER ;;
use db_rkfutu;;

# 事务_风控期货_接口_同步期货信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfuif_SyncFutuMarketInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfuif_SyncFutuMarketInfo(
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控期货_接口_同步期货信息】*/
      call db_rkfutu.pra_rkfuif_SyncFutuMarketInfo(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_contrc_code_no,
          v_exch_no,
          v_contrc_code,
          v_contrc_name,
          v_contrc_type,
          v_asset_type,
          v_step_price,
          v_hold_qty,
          v_main_flag,
          v_contrc_unit,
          v_last_price,
          v_buy_price_1,
          v_sell_price_1,
          v_up_limit_price,
          v_down_limit_price,
          v_pre_settle_price,
          v_sett_price,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rkfutuT.5.2.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_接口_同步期货信息出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rkfutu;;

# 事务_风控期货_接口_同步期货持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfuif_SyncFutuPosition;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfuif_SyncFutuPosition(
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控期货_接口_同步期货持仓】*/
      call db_rkfutu.pra_rkfuif_SyncFutuPosition(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_pd_no,
          v_exch_group_no,
          v_asset_acco_no,
          v_exch_crncy_type,
          v_exch_no,
          v_futu_acco_no,
          v_contrc_code_no,
          v_contrc_type,
          v_contrc_unit,
          v_lngsht_type,
          v_hedge_type,
          v_comb_code,
          v_posi_qty,
          v_rece_margin,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rkfutuT.5.3.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_接口_同步期货持仓出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rkfutu;;

# 事务_风控期货_接口_服务器查询客户风险规则
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfuif_ServerQueryFutuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfuif_ServerQueryFutuClientRiskRule(
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
    

    /* 调用【原子_风控期货_接口_服务器查询客户风险规则】*/
    call db_rkfutu.pra_rkfuif_ServerQueryFutuClientRiskRule(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rkfutuT.5.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_接口_服务器查询客户风险规则出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rkfutu;;

# 事务_风控期货_接口_更新客户风险规则计算值串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfuif_UpdateFutuClientRiskRuleCalcStr;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfuif_UpdateFutuClientRiskRuleCalcStr(
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控期货_接口_更新客户风险规则计算值串】*/
      call db_rkfutu.pra_rkfuif_UpdateFutuClientRiskRuleCalcStr(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_client_risk_rule_id,
          v_risk_rule_calc_str,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rkfutuT.5.5.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_接口_更新客户风险规则计算值串出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rkfutu;;

# 事务_风控期货_接口_同步期货保证金优惠
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfuif_SyncFutuMarginCtrl;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfuif_SyncFutuMarginCtrl(
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控期货_接口_同步期货保证金优惠】*/
      call db_rkfutu.pra_rkfuif_SyncFutuMarginCtrl(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_pd_no,
          v_exch_group_no,
          v_asset_acco_no,
          v_exch_crncy_type,
          v_exch_no,
          v_hedge_type,
          v_comb_code,
          v_long_comm_margin,
          v_short_comm_margin,
          v_long_order_margin,
          v_short_order_margin,
          v_long_strike_margin,
          v_short_strike_margin,
          v_long_hold_margin,
          v_short_hold_margin,
          v_trade_capt_amt,
          v_posi_capt_amt,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rkfutuT.5.6.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_接口_同步期货保证金优惠出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


