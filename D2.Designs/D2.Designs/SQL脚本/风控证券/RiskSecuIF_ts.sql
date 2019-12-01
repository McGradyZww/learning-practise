DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_接口_同步证券信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_SyncSecuMarketInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_SyncSecuMarketInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_exch_no int,
    IN p_asset_type int,
    IN p_stock_type int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_total_stock_issue decimal(18,2),
    IN p_circl_stock_capit decimal(18,2),
    IN p_net_price_flag int,
    IN p_bond_rate_type int,
    IN p_last_price decimal(16,9),
    IN p_pre_close_price decimal(16,9),
    IN p_today_open_price decimal(16,9),
    IN p_fair_price decimal(16,9),
    IN p_strike_amt decimal(18,4),
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
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_exch_no int;
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_total_stock_issue decimal(18,2);
    declare v_circl_stock_capit decimal(18,2);
    declare v_net_price_flag int;
    declare v_bond_rate_type int;
    declare v_last_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_today_open_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_exch_no = p_exch_no;
    SET v_asset_type = p_asset_type;
    SET v_stock_type = p_stock_type;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_total_stock_issue = p_total_stock_issue;
    SET v_circl_stock_capit = p_circl_stock_capit;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_last_price = p_last_price;
    SET v_pre_close_price = p_pre_close_price;
    SET v_today_open_price = p_today_open_price;
    SET v_fair_price = p_fair_price;
    SET v_strike_amt = p_strike_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_接口_同步证券信息】*/
      call db_rksecu.pra_rkseif_SyncSecuMarketInfo(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_stock_code_no,
          v_stock_name,
          v_stock_code,
          v_exch_no,
          v_asset_type,
          v_stock_type,
          v_bond_accr_intrst,
          v_total_stock_issue,
          v_circl_stock_capit,
          v_net_price_flag,
          v_bond_rate_type,
          v_last_price,
          v_pre_close_price,
          v_today_open_price,
          v_strike_amt,
          v_fair_price,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.1.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_同步证券信息出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_同步证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_SyncSecuPosition;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_SyncSecuPosition(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_invest_type int,
    IN p_curr_qty decimal(18,2),
    IN p_frozen_qty decimal(18,2),
    IN p_unfroz_qty decimal(18,2),
    IN p_comm_capt_qty decimal(18,2),
    IN p_comm_releas_qty decimal(18,2),
    IN p_trade_capt_qty decimal(18,2),
    IN p_trade_releas_qty decimal(18,2),
    IN p_strike_capt_qty decimal(18,2),
    IN p_strike_releas_qty decimal(18,2),
    IN p_curr_cost_amt decimal(18,4),
    IN p_intrst_cost_amt decimal(18,4),
    IN p_cost_calc_type int,
    IN p_risk_sync_type int,
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_invest_type int;
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_comm_capt_qty decimal(18,2);
    declare v_comm_releas_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_curr_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_cost_calc_type int;
    declare v_risk_sync_type int;
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_invest_type = p_invest_type;
    SET v_curr_qty = p_curr_qty;
    SET v_frozen_qty = p_frozen_qty;
    SET v_unfroz_qty = p_unfroz_qty;
    SET v_comm_capt_qty = p_comm_capt_qty;
    SET v_comm_releas_qty = p_comm_releas_qty;
    SET v_trade_capt_qty = p_trade_capt_qty;
    SET v_trade_releas_qty = p_trade_releas_qty;
    SET v_strike_capt_qty = p_strike_capt_qty;
    SET v_strike_releas_qty = p_strike_releas_qty;
    SET v_curr_cost_amt = p_curr_cost_amt;
    SET v_intrst_cost_amt = p_intrst_cost_amt;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_risk_sync_type = p_risk_sync_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_接口_同步证券持仓】*/
      call db_rksecu.pra_rkseif_SyncSecuPosition(
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
          v_stock_acco_no,
          v_stock_code_no,
          v_stock_code,
          v_exch_no,
          v_invest_type,
          v_curr_qty,
          v_frozen_qty,
          v_unfroz_qty,
          v_comm_capt_qty,
          v_comm_releas_qty,
          v_trade_capt_qty,
          v_trade_releas_qty,
          v_strike_capt_qty,
          v_strike_releas_qty,
          v_curr_cost_amt,
          v_intrst_cost_amt,
          v_cost_calc_type,
          v_risk_sync_type,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.2.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_同步证券持仓出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_同步证券资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_SyncSecuAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_SyncSecuAmt(
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
    IN p_curr_amt decimal(18,4),
    IN p_frozen_amt decimal(18,4),
    IN p_unfroz_amt decimal(18,4),
    IN p_comm_capt_amt decimal(18,4),
    IN p_comm_releas_amt decimal(18,4),
    IN p_trade_capt_amt decimal(18,4),
    IN p_trade_releas_amt decimal(18,4),
    IN p_strike_capt_amt decimal(18,4),
    IN p_strike_releas_amt decimal(18,4),
    IN p_risk_sync_type int,
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
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_comm_releas_amt decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_risk_sync_type int;
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
    SET v_curr_amt = p_curr_amt;
    SET v_frozen_amt = p_frozen_amt;
    SET v_unfroz_amt = p_unfroz_amt;
    SET v_comm_capt_amt = p_comm_capt_amt;
    SET v_comm_releas_amt = p_comm_releas_amt;
    SET v_trade_capt_amt = p_trade_capt_amt;
    SET v_trade_releas_amt = p_trade_releas_amt;
    SET v_strike_capt_amt = p_strike_capt_amt;
    SET v_strike_releas_amt = p_strike_releas_amt;
    SET v_risk_sync_type = p_risk_sync_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_接口_同步证券资金】*/
      call db_rksecu.pra_rkseif_SyncSecuAmt(
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
          v_curr_amt,
          v_frozen_amt,
          v_unfroz_amt,
          v_comm_capt_amt,
          v_comm_releas_amt,
          v_trade_capt_amt,
          v_trade_releas_amt,
          v_strike_capt_amt,
          v_strike_releas_amt,
          v_risk_sync_type,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.3.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_同步证券资金出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_同步证券资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_SyncSecuAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_SyncSecuAsset(
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
    IN p_crncy_type varchar(3),
    IN p_begin_asset_value decimal(18,4),
    IN p_asset_item int,
    IN p_asset_value decimal(18,4),
    IN p_part_share decimal(18,2),
    IN p_pd_all_share decimal(18,2),
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
    declare v_crncy_type varchar(3);
    declare v_begin_asset_value decimal(18,4);
    declare v_asset_item int;
    declare v_asset_value decimal(18,4);
    declare v_part_share decimal(18,2);
    declare v_pd_all_share decimal(18,2);
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
    SET v_crncy_type = p_crncy_type;
    SET v_begin_asset_value = p_begin_asset_value;
    SET v_asset_item = p_asset_item;
    SET v_asset_value = p_asset_value;
    SET v_part_share = p_part_share;
    SET v_pd_all_share = p_pd_all_share;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_接口_同步证券资产】*/
      call db_rksecu.pra_rkseif_SyncSecuAsset(
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
          v_crncy_type,
          v_begin_asset_value,
          v_asset_item,
          v_asset_value,
          v_part_share,
          v_pd_all_share,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.4.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_同步证券资产出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_同步证券订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_SyncSecuOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_SyncSecuOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_order_dir int,
    IN p_price_type int,
    IN p_order_price decimal(16,9),
    IN p_order_status varchar(2),
    IN p_all_fee decimal(18,4),
    IN p_order_frozen_amt decimal(18,4),
    IN p_strike_amt decimal(18,4),
    IN p_stock_type int,
    IN p_order_frozen_qty decimal(18,2),
    IN p_comm_id bigint,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_status varchar(2);
    declare v_all_fee decimal(18,4);
    declare v_order_frozen_amt decimal(18,4);
    declare v_strike_amt decimal(18,4);
    declare v_stock_type int;
    declare v_order_frozen_qty decimal(18,2);
    declare v_comm_id bigint;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_order_dir = p_order_dir;
    SET v_price_type = p_price_type;
    SET v_order_price = p_order_price;
    SET v_order_status = p_order_status;
    SET v_all_fee = p_all_fee;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_strike_amt = p_strike_amt;
    SET v_stock_type = p_stock_type;
    SET v_order_frozen_qty = p_order_frozen_qty;
    SET v_comm_id = p_comm_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_接口_同步证券订单】*/
      call db_rksecu.pra_rkseif_SyncSecuOrder(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_row_id,
          v_co_no,
          v_pd_no,
          v_exch_group_no,
          v_stock_code_no,
          v_exch_no,
          v_order_dir,
          v_price_type,
          v_order_price,
          v_order_status,
          v_all_fee,
          v_order_frozen_amt,
          v_strike_amt,
          v_stock_type,
          v_order_frozen_qty,
          v_comm_id,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.5.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_同步证券订单出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_同步证券指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_SyncSecuCommand;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_SyncSecuCommand(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_comm_dir int,
    IN p_comm_limit_price decimal(16,9),
    IN p_comm_status varchar(2),
    IN p_comm_frozen_amt decimal(18,4),
    IN p_stock_type int,
    IN p_comm_frozen_qty decimal(18,2),
    IN p_limit_actual_price decimal(16,9),
    IN p_strike_status varchar(2),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_stock_type int;
    declare v_comm_frozen_qty decimal(18,2);
    declare v_limit_actual_price decimal(16,9);
    declare v_strike_status varchar(2);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_comm_dir = p_comm_dir;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_comm_status = p_comm_status;
    SET v_comm_frozen_amt = p_comm_frozen_amt;
    SET v_stock_type = p_stock_type;
    SET v_comm_frozen_qty = p_comm_frozen_qty;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_strike_status = p_strike_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_接口_同步证券指令】*/
      call db_rksecu.pra_rkseif_SyncSecucommand(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_row_id,
          v_co_no,
          v_pd_no,
          v_exch_group_no,
          v_stock_code_no,
          v_exch_no,
          v_comm_dir,
          v_comm_limit_price,
          v_comm_status,
          v_comm_frozen_amt,
          v_stock_type,
          v_comm_frozen_qty,
          v_limit_actual_price,
          v_strike_status,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.6.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_同步证券指令出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_服务器查询客户风险规则
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_ServerQuerySecuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_ServerQuerySecuClientRiskRule(
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
    

    /* if (@指定行数# > 500 or @指定行数# <1) and @指定行数# <> -1 then */
    if (v_row_count > 500 or v_row_count <1) and v_row_count <> -1 then

      /* set @指定行数# = 500; */
      set v_row_count = 500;
    end if;

    /* 调用【原子_风控证券_接口_服务器查询客户风险规则】*/
    call db_rksecu.pra_rkseif_ServerQuerySecuClientRiskRule(
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
        SET v_error_code = "rksecuT.5.7.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_服务器查询客户风险规则出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_更新客户风险规则计算值串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_UpdateSecuClientRiskRuleCalcStr;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_UpdateSecuClientRiskRuleCalcStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_link_row_id bigint,
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_trig_stage_type int,
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
    declare v_link_row_id bigint;
    declare v_co_no int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_trig_stage_type int;
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
    SET v_link_row_id = p_link_row_id;
    SET v_co_no = p_co_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_client_risk_rule_id = p_client_risk_rule_id;
    SET v_risk_rule_calc_str = p_risk_rule_calc_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_接口_更新客户风险规则计算值串】*/
      call db_rksecu.pra_rkseif_UpdateSecuClientRiskRuleCalcStr(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_link_row_id,
          v_co_no,
          v_pd_no_str,
          v_exch_group_no_str,
          v_trig_stage_type,
          v_client_risk_rule_id,
          v_risk_rule_calc_str,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.8.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_更新客户风险规则计算值串出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_检查客户风险
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_CheckSecuClientRisk;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_CheckSecuClientRisk(
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
    IN p_exch_crncy_type varchar(3),
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_all_fee decimal(18,4),
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
    declare v_exch_crncy_type varchar(3);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_trig_stage_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_risk_param_value_str varchar(1024);
    declare v_compli_rules_remark varchar(255);
    declare v_risk_rule_action varchar(32);

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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_all_fee = p_all_fee;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_compli_trig_id = 0;
    SET v_risk_param_value_str = " ";
    SET v_compli_rules_remark = " ";
    SET v_risk_rule_action = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_风控_获取最大的合规触警流水序号】*/
      call db_rksecu.pra_rkserk_GetMaxComplianceTriggerId(
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
          SET v_error_code = "rksecuT.5.9.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取最大的合规触警流水序号出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


    /* [事务结束] */
    COMMIT;


    /* [事务开始] */
    START TRANSACTION;

    # 正回购特殊处理

      /* if @订单方向# = 3 or @订单方向# = 4 then */
      if v_order_dir = 3 or v_order_dir = 4 then

        /* if @市场编号# = 1 then */
        if v_exch_no = 1 then

          /* set @证券代码# = "888880"; */
          set v_stock_code = "888880";

        /* elseif @市场编号# = 2 then */
        elseif v_exch_no = 2 then

          /* set @证券代码# = "131990"; */
          set v_stock_code = "131990";
        end if;
      end if;
      #[原子_风控证券_风控_增加交易流水记录]

      /* set @风险要素值串# = concat(";","证券代码=", @证券代码#, ";"); */
      set v_risk_param_value_str = concat(";","证券代码=", v_stock_code, ";");

      /* 调用【原子_风控证券_风控_交易检查客户风险】*/
      call db_rksecu.pra_rkserk_CheckSecuClientRisk(
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
          v_exch_no,
          v_exch_crncy_type,
          v_stock_code_no,
          v_stock_code,
          v_order_dir,
          v_order_price,
          v_order_qty,
          v_all_fee,
          v_trig_stage_type,
          v_risk_param_value_str,
          v_compli_trig_id,
          v_error_code,
          v_error_info,
          v_compli_rules_remark,
          v_risk_rule_action);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.9.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_交易检查客户风险出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;

     #[原子_风控证券_风控_清空交易流水记录]

    /* [事务结束] */
    COMMIT;


    /* [检查报错返回][@风险采取行为# = 4][906][concat("订单触发风控:", @合规规则说明#,"|证券代码",@证券代码#)] */
    if v_risk_rule_action = 4 then
        
        SET v_error_code = "rksecuT.5.9.906";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单触发风控:", v_compli_rules_remark,"|证券代码",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单触发风控:", v_compli_rules_remark,"|证券代码",v_stock_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_compli_trig_id = v_compli_trig_id;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_接口_批量检查客户风险
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_ChecktBatchSecuClientRisk;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_ChecktBatchSecuClientRisk(
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
    IN p_exch_no_str varchar(2048),
    IN p_exch_crncy_type_str varchar(2048),
    IN p_stock_code_no_str varchar(4096),
    IN p_stock_code_str varchar(4096),
    IN p_order_dir_str varchar(1024),
    IN p_order_price_str varchar(4096),
    IN p_order_qty_str varchar(4096),
    IN p_all_fee_str varchar(4096),
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
    declare v_exch_no_str varchar(2048);
    declare v_exch_crncy_type_str varchar(2048);
    declare v_stock_code_no_str varchar(4096);
    declare v_stock_code_str varchar(4096);
    declare v_order_dir_str varchar(1024);
    declare v_order_price_str varchar(4096);
    declare v_order_qty_str varchar(4096);
    declare v_all_fee_str varchar(4096);
    declare v_trig_stage_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_tmp_exch_no_str varchar(2048);
    declare v_tmp_exch_crncy_type_str varchar(2048);
    declare v_tmp_stock_code_str varchar(4096);
    declare v_split_str varchar(4);
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_exch_crncy_type varchar(3);
    declare v_all_fee decimal(18,4);
    declare v_risk_param_value_str varchar(1024);
    declare v_compli_rules_remark varchar(255);
    declare v_risk_rule_action varchar(32);
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);

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
    SET v_exch_no_str = p_exch_no_str;
    SET v_exch_crncy_type_str = p_exch_crncy_type_str;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_stock_code_str = p_stock_code_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_price_str = p_order_price_str;
    SET v_order_qty_str = p_order_qty_str;
    SET v_all_fee_str = p_all_fee_str;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_compli_trig_id = 0;
    SET v_tmp_exch_no_str = " ";
    SET v_tmp_exch_crncy_type_str = " ";
    SET v_tmp_stock_code_str = " ";
    SET v_split_str = " ";
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_exch_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_all_fee = 0;
    SET v_risk_param_value_str = " ";
    SET v_compli_rules_remark = " ";
    SET v_risk_rule_action = " ";
    SET v_pd_no_str = " ";
    SET v_exch_group_no_str = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控证券_风控_获取最大的合规触警流水序号】*/
        call db_rksecu.pra_rkserk_GetMaxComplianceTriggerId(
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
            SET v_error_code = "rksecuT.5.10.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取最大的合规触警流水序号出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    check_label:  BEGIN

    /* set @临时_市场编号串# = @市场编号串#; */
    set v_tmp_exch_no_str = v_exch_no_str;

    /* set @临时_交易币种串#  = @交易币种串#; */
    set v_tmp_exch_crncy_type_str  = v_exch_crncy_type_str;

    /* set @临时_证券代码串# = @证券代码串#; */
    set v_tmp_stock_code_str = v_stock_code_str;

    /* set @分隔符# = ";"; */
    set v_split_str = ";";

    /* while LOCATE(@分隔符#,@证券代码串#)<>0   do */
    while LOCATE(v_split_str,v_stock_code_str)<>0   do

    /* [事务开始] */
    START TRANSACTION;

        #截取前面每一位

        /* set @证券代码#=substring(@证券代码串#,1,LOCATE(@分隔符#,@证券代码串#)-1); */
        set v_stock_code=substring(v_stock_code_str,1,LOCATE(v_split_str,v_stock_code_str)-1);

        /* set @证券代码编号#=cast(substring(@证券代码编号串#,1,LOCATE(@分隔符#,@证券代码编号串#)-1) as SIGNED); */
        set v_stock_code_no=cast(substring(v_stock_code_no_str,1,LOCATE(v_split_str,v_stock_code_no_str)-1) as SIGNED);

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

        /* set @订单方向#=cast(substring(@订单方向串#,1,LOCATE(@分隔符#,@订单方向串#)-1) as SIGNED); */
        set v_order_dir=cast(substring(v_order_dir_str,1,LOCATE(v_split_str,v_order_dir_str)-1) as SIGNED);

        /* set @订单价格#=cast(substring(@订单价格串#,1,LOCATE(@分隔符#,@订单价格串#)-1) as decimal(16,9)); */
        set v_order_price=cast(substring(v_order_price_str,1,LOCATE(v_split_str,v_order_price_str)-1) as decimal(16,9));

        /* set @订单数量#=cast(substring(@订单数量串#,1,LOCATE(@分隔符#,@订单数量串#)-1) as decimal(18,2)); */
        set v_order_qty=cast(substring(v_order_qty_str,1,LOCATE(v_split_str,v_order_qty_str)-1) as decimal(18,2));

        /* set @交易币种#=substring(@交易币种串#,1,LOCATE(@分隔符#,@交易币种串#)-1); */
        set v_exch_crncy_type=substring(v_exch_crncy_type_str,1,LOCATE(v_split_str,v_exch_crncy_type_str)-1);

        /* set @全部费用#=cast(substring(@全部费用串#,1,LOCATE(@分隔符#,@全部费用串#)-1) as decimal(32,6)); */
        set v_all_fee=cast(substring(v_all_fee_str,1,LOCATE(v_split_str,v_all_fee_str)-1) as decimal(32,6));
        #[原子_风控证券_风控_增加交易流水记录]

        /* set @风险要素值串# = concat(";","证券代码=", @证券代码#, ";"); */
        set v_risk_param_value_str = concat(";","证券代码=", v_stock_code, ";");

        /* 调用【原子_风控证券_风控_交易检查客户风险】*/
        call db_rksecu.pra_rkserk_CheckSecuClientRisk(
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
            v_exch_no,
            v_exch_crncy_type,
            v_stock_code_no,
            v_stock_code,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_all_fee,
            v_trig_stage_type,
            v_risk_param_value_str,
            v_compli_trig_id,
            v_error_code,
            v_error_info,
            v_compli_rules_remark,
            v_risk_rule_action);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.5.10.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_交易检查客户风险出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @风险采取行为# = 4 then */
        if v_risk_rule_action = 4 then
           LEAVE  check_label;
        end if;

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

        /* set @交易币种串#=substring(@交易币种串#,LOCATE(@分隔符#,@交易币种串#)+1); */
        set v_exch_crncy_type_str=substring(v_exch_crncy_type_str,LOCATE(v_split_str,v_exch_crncy_type_str)+1);

        /* set @证券代码编号串#=substring(@证券代码编号串#,LOCATE(@分隔符#,@证券代码编号串#)+1); */
        set v_stock_code_no_str=substring(v_stock_code_no_str,LOCATE(v_split_str,v_stock_code_no_str)+1);

        /* set @全部费用串#=substring(@全部费用串#,LOCATE(@分隔符#,@全部费用串#)+1); */
        set v_all_fee_str=substring(v_all_fee_str,LOCATE(v_split_str,v_all_fee_str)+1);
        #[更新表记录][风控证券_风控_交易流水记录表][{变动数量} = 0 , {变动金额} = 0, {全部费用} = 0, {交易金额} = 0][{机构编号} = @机构编号# and {机构编号} = @机构编号# and {产品编号} = @产品编号# and {交易组编号} = @交易组编号#  and {交易币种} = @交易币种# and {市场编号} = @市场编号# and {证券代码} = @证券代码#][3][@机构编号#]

    /* [事务结束] */
    COMMIT;

    end while;
    END check_label;

    /* set @产品编号串# = @产品编号#; */
    set v_pd_no_str = v_pd_no;

    /* set @交易组编号串# = @交易组编号#; */
    set v_exch_group_no_str = v_exch_group_no;

    /* set @市场编号串# = @临时_市场编号串#; */
    set v_exch_no_str = v_tmp_exch_no_str;

    /* set @交易币种串#  = @临时_交易币种串#; */
    set v_exch_crncy_type_str  = v_tmp_exch_crncy_type_str;

    /* set @证券代码串# = @临时_证券代码串#; */
    set v_stock_code_str = v_tmp_stock_code_str;
    #[原子_风控证券_风控_批量清空交易流水记录]

    /* [检查报错返回][@风险采取行为# = 4][906][concat("订单触发风控:", @合规规则说明#,"|证券代码",@证券代码#)] */
    if v_risk_rule_action = 4 then
        
        SET v_error_code = "rksecuT.5.10.906";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单触发风控:", v_compli_rules_remark,"|证券代码",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单触发风控:", v_compli_rules_remark,"|证券代码",v_stock_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_compli_trig_id = v_compli_trig_id;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_接口_更新账户风险监控设置计算值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_UpdateProductMonitorSetServiceValue;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_UpdateProductMonitorSetServiceValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_moni_set_id bigint,
    IN p_curr_moni_value decimal(18,4),
    IN p_cash_asset decimal(18,4),
    IN p_fund_asset decimal(18,4),
    IN p_bond_asset decimal(18,4),
    IN p_stock_asset decimal(18,4),
    IN p_repo_asset decimal(18,4),
    IN p_nav_asset decimal(18,4),
    IN p_contrs_curr_moni_value decimal(18,4),
    IN p_pd_share decimal(18,2),
    IN p_begin_asset_value decimal(18,4),
    IN p_hk_thrgh_stock_asset decimal(18,4),
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
    declare v_moni_set_id bigint;
    declare v_curr_moni_value decimal(18,4);
    declare v_cash_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_contrs_curr_moni_value decimal(18,4);
    declare v_pd_share decimal(18,2);
    declare v_begin_asset_value decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_curr_moni_value = p_curr_moni_value;
    SET v_cash_asset = p_cash_asset;
    SET v_fund_asset = p_fund_asset;
    SET v_bond_asset = p_bond_asset;
    SET v_stock_asset = p_stock_asset;
    SET v_repo_asset = p_repo_asset;
    SET v_nav_asset = p_nav_asset;
    SET v_contrs_curr_moni_value = p_contrs_curr_moni_value;
    SET v_pd_share = p_pd_share;
    SET v_begin_asset_value = p_begin_asset_value;
    SET v_hk_thrgh_stock_asset = p_hk_thrgh_stock_asset;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_接口_更新账户风险监控设置计算值】*/
      call db_rksecu.pra_rkseif_UpdateProductMonitorSetServiceValue(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_moni_set_id,
          v_curr_moni_value,
          v_cash_asset,
          v_fund_asset,
          v_bond_asset,
          v_stock_asset,
          v_repo_asset,
          v_nav_asset,
          v_contrs_curr_moni_value,
          v_pd_share,
          v_begin_asset_value,
          v_hk_thrgh_stock_asset,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.11.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_更新账户风险监控设置计算值出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_获取账户风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_GetProductMonitor;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_GetProductMonitor(
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
    

      /* 调用【原子_风控证券_接口_获取账户风险监控设置】*/
      call db_rksecu.pra_rkseif_GetProductMonitor(
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
          SET v_error_code = "rksecuT.5.12.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_获取账户风险监控设置出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_同步成本计算方式
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_SyncSecuCostCalcType;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_SyncSecuCostCalcType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_cost_calc_type int,
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
    declare v_cost_calc_type int;
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
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_接口_同步成本计算方式】*/
      call db_rksecu.pra_rkseif_SyncSecuCostCalcType(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_pd_no,
          v_cost_calc_type,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.13.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_同步成本计算方式出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_同步港股汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_SyncSecuHKrate;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_SyncSecuHKrate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_settle_buy_rate decimal(18,12),
    IN p_settle_sell_rate decimal(18,12),
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
    declare v_exch_no int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_settle_buy_rate decimal(18,12);
    declare v_settle_sell_rate decimal(18,12);
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
    SET v_exch_no = p_exch_no;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_settle_buy_rate = p_settle_buy_rate;
    SET v_settle_sell_rate = p_settle_sell_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_接口_同步港股汇率】*/
      call db_rksecu.pra_rkseif_SyncSecuHKrate(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_exch_no,
          v_buy_ref_rate,
          v_sell_ref_rate,
          v_settle_buy_rate,
          v_settle_sell_rate,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.14.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_同步港股汇率出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_清空层次计算表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_TruncateCalcTable;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_TruncateCalcTable(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    declare v_init_date int;
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
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #用以清除盘中重启的计算表的脏数据

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_风控_清空层次计算表】*/
      call db_rksecu.pra_rksepb_TruncateCalcTable(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_init_date,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.15.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_清空层次计算表出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_计算更新证券风险监控数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_CalcStockMonitorData;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_CalcStockMonitorData(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_moni_set_id bigint,
    IN p_curr_moni_value decimal(18,4),
    IN p_contrs_curr_moni_value decimal(18,4),
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
    declare v_moni_set_id bigint;
    declare v_curr_moni_value decimal(18,4);
    declare v_contrs_curr_moni_value decimal(18,4);
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_curr_moni_value = p_curr_moni_value;
    SET v_contrs_curr_moni_value = p_contrs_curr_moni_value;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_接口_计算更新证券风险监控数据】*/
      call db_rksecu.pra_rkseif_CalcStockMonitorData(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_moni_set_id,
          v_curr_moni_value,
          v_contrs_curr_moni_value,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.16.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_计算更新证券风险监控数据出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_获取批量证券风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_GetBatchStockMonitor;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_GetBatchStockMonitor(
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
    

      /* 调用【原子_风控证券_接口_获取批量证券风险监控设置】*/
      call db_rksecu.pra_rkseif_GetBatchStockMonitor(
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
          SET v_error_code = "rksecuT.5.17.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_获取批量证券风险监控设置出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_获取单条证券风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_GetSingleStockMonitor;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_GetSingleStockMonitor(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_moni_set_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no_str varchar(2048),
    OUT p_exch_group_no_str varchar(2048),
    OUT p_monitor_ctrl_type int,
    OUT p_moni_value_type int,
    OUT p_monitor_param_value int,
    OUT p_moni_value_flag int,
    OUT p_warn_posi_value decimal(18,4),
    OUT p_appd_value decimal(18,4),
    OUT p_close_posi_value decimal(18,4),
    OUT p_max_moni_value decimal(18,4),
    OUT p_curr_moni_value decimal(18,4),
    OUT p_curr_result_moni_value decimal(18,4),
    OUT p_contrs_stock_code varchar(6),
    OUT p_contrs_exch_no int,
    OUT p_contrs_max_moni_value decimal(18,4),
    OUT p_contrs_curr_moni_value decimal(18,4),
    OUT p_contrs_result_moni_value decimal(18,4),
    OUT p_moni_result_value decimal(18,4),
    OUT p_moni_result_status varchar(2),
    OUT p_moni_set_status varchar(2),
    OUT p_close_posi_flag int,
    OUT p_close_ratio_level_one decimal(18,12),
    OUT p_close_ratio_level_two decimal(18,12),
    OUT p_close_ratio_level_three decimal(18,12),
    OUT p_remark_info varchar(255),
    OUT p_update_times int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_moni_set_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_monitor_ctrl_type int;
    declare v_moni_value_type int;
    declare v_monitor_param_value int;
    declare v_moni_value_flag int;
    declare v_warn_posi_value decimal(18,4);
    declare v_appd_value decimal(18,4);
    declare v_close_posi_value decimal(18,4);
    declare v_max_moni_value decimal(18,4);
    declare v_curr_moni_value decimal(18,4);
    declare v_curr_result_moni_value decimal(18,4);
    declare v_contrs_stock_code varchar(6);
    declare v_contrs_exch_no int;
    declare v_contrs_max_moni_value decimal(18,4);
    declare v_contrs_curr_moni_value decimal(18,4);
    declare v_contrs_result_moni_value decimal(18,4);
    declare v_moni_result_value decimal(18,4);
    declare v_moni_result_status varchar(2);
    declare v_moni_set_status varchar(2);
    declare v_close_posi_flag int;
    declare v_close_ratio_level_one decimal(18,12);
    declare v_close_ratio_level_two decimal(18,12);
    declare v_close_ratio_level_three decimal(18,12);
    declare v_remark_info varchar(255);
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no_str = " ";
    SET v_exch_group_no_str = " ";
    SET v_monitor_ctrl_type = 0;
    SET v_moni_value_type = 0;
    SET v_monitor_param_value = 0;
    SET v_moni_value_flag = 0;
    SET v_warn_posi_value = 0;
    SET v_appd_value = 0;
    SET v_close_posi_value = 0;
    SET v_max_moni_value = 0;
    SET v_curr_moni_value = 0;
    SET v_curr_result_moni_value = 0;
    SET v_contrs_stock_code = " ";
    SET v_contrs_exch_no = 0;
    SET v_contrs_max_moni_value = 0;
    SET v_contrs_curr_moni_value = 0;
    SET v_contrs_result_moni_value = 0;
    SET v_moni_result_value = 0;
    SET v_moni_result_status = " ";
    SET v_moni_set_status = " ";
    SET v_close_posi_flag = 0;
    SET v_close_ratio_level_one = 0;
    SET v_close_ratio_level_two = 0;
    SET v_close_ratio_level_three = 0;
    SET v_remark_info = " ";
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

      /* 调用【原子_风控证券_接口_获取单条证券风险监控设置】*/
      call db_rksecu.pra_rkseif_GetSingleStockMonitor(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_moni_set_id,
          v_error_code,
          v_error_info,
          v_row_id,
          v_co_no,
          v_pd_no_str,
          v_exch_group_no_str,
          v_monitor_ctrl_type,
          v_moni_value_type,
          v_monitor_param_value,
          v_moni_value_flag,
          v_warn_posi_value,
          v_appd_value,
          v_close_posi_value,
          v_max_moni_value,
          v_curr_moni_value,
          v_curr_result_moni_value,
          v_contrs_stock_code,
          v_contrs_exch_no,
          v_contrs_max_moni_value,
          v_contrs_curr_moni_value,
          v_contrs_result_moni_value,
          v_moni_result_value,
          v_moni_result_status,
          v_moni_set_status,
          v_close_posi_flag,
          v_close_ratio_level_one,
          v_close_ratio_level_two,
          v_close_ratio_level_three,
          v_remark_info,
          v_update_times);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.18.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_获取单条证券风险监控设置出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no_str = v_pd_no_str;
    SET p_exch_group_no_str = v_exch_group_no_str;
    SET p_monitor_ctrl_type = v_monitor_ctrl_type;
    SET p_moni_value_type = v_moni_value_type;
    SET p_monitor_param_value = v_monitor_param_value;
    SET p_moni_value_flag = v_moni_value_flag;
    SET p_warn_posi_value = v_warn_posi_value;
    SET p_appd_value = v_appd_value;
    SET p_close_posi_value = v_close_posi_value;
    SET p_max_moni_value = v_max_moni_value;
    SET p_curr_moni_value = v_curr_moni_value;
    SET p_curr_result_moni_value = v_curr_result_moni_value;
    SET p_contrs_stock_code = v_contrs_stock_code;
    SET p_contrs_exch_no = v_contrs_exch_no;
    SET p_contrs_max_moni_value = v_contrs_max_moni_value;
    SET p_contrs_curr_moni_value = v_contrs_curr_moni_value;
    SET p_contrs_result_moni_value = v_contrs_result_moni_value;
    SET p_moni_result_value = v_moni_result_value;
    SET p_moni_result_status = v_moni_result_status;
    SET p_moni_set_status = v_moni_set_status;
    SET p_close_posi_flag = v_close_posi_flag;
    SET p_close_ratio_level_one = v_close_ratio_level_one;
    SET p_close_ratio_level_two = v_close_ratio_level_two;
    SET p_close_ratio_level_three = v_close_ratio_level_three;
    SET p_remark_info = v_remark_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_接口_获取单条账户风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_GetSingleProductMonitor;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_GetSingleProductMonitor(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_moni_set_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no_str varchar(2048),
    OUT p_exch_group_no_str varchar(2048),
    OUT p_moni_role_type int,
    OUT p_moni_value_flag int,
    OUT p_moni_value_type int,
    OUT p_warn_posi_value decimal(18,4),
    OUT p_warn_trig_oper_type int,
    OUT p_close_posi_value decimal(18,4),
    OUT p_close_trig_oper_type int,
    OUT p_appd_value decimal(18,4),
    OUT p_appd_trig_oper_type int,
    OUT p_begin_moni_date int,
    OUT p_begin_moni_value decimal(18,4),
    OUT p_max_moni_value decimal(18,4),
    OUT p_curr_moni_value decimal(18,4),
    OUT p_curr_result_moni_value decimal(18,4),
    OUT p_contrs_stock_code varchar(6),
    OUT p_contrs_exch_no int,
    OUT p_contrs_max_moni_value decimal(18,4),
    OUT p_contrs_curr_moni_value decimal(18,4),
    OUT p_contrs_result_moni_value decimal(18,4),
    OUT p_moni_result_value decimal(18,4),
    OUT p_moni_result_status varchar(2),
    OUT p_moni_set_status varchar(2),
    OUT p_cash_asset decimal(18,4),
    OUT p_fund_asset decimal(18,4),
    OUT p_bond_asset decimal(18,4),
    OUT p_stock_asset decimal(18,4),
    OUT p_repo_asset decimal(18,4),
    OUT p_nav_asset decimal(18,4),
    OUT p_stock_asset_ratio decimal(18,12),
    OUT p_close_posi_flag int,
    OUT p_close_ratio_level_one decimal(18,12),
    OUT p_close_ratio_level_two decimal(18,12),
    OUT p_close_ratio_level_three decimal(18,12),
    OUT p_remark_info varchar(255),
    OUT p_time_stamp int,
    OUT p_update_times int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_moni_set_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_moni_role_type int;
    declare v_moni_value_flag int;
    declare v_moni_value_type int;
    declare v_warn_posi_value decimal(18,4);
    declare v_warn_trig_oper_type int;
    declare v_close_posi_value decimal(18,4);
    declare v_close_trig_oper_type int;
    declare v_appd_value decimal(18,4);
    declare v_appd_trig_oper_type int;
    declare v_begin_moni_date int;
    declare v_begin_moni_value decimal(18,4);
    declare v_max_moni_value decimal(18,4);
    declare v_curr_moni_value decimal(18,4);
    declare v_curr_result_moni_value decimal(18,4);
    declare v_contrs_stock_code varchar(6);
    declare v_contrs_exch_no int;
    declare v_contrs_max_moni_value decimal(18,4);
    declare v_contrs_curr_moni_value decimal(18,4);
    declare v_contrs_result_moni_value decimal(18,4);
    declare v_moni_result_value decimal(18,4);
    declare v_moni_result_status varchar(2);
    declare v_moni_set_status varchar(2);
    declare v_cash_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_stock_asset_ratio decimal(18,12);
    declare v_close_posi_flag int;
    declare v_close_ratio_level_one decimal(18,12);
    declare v_close_ratio_level_two decimal(18,12);
    declare v_close_ratio_level_three decimal(18,12);
    declare v_remark_info varchar(255);
    declare v_time_stamp int;
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no_str = " ";
    SET v_exch_group_no_str = " ";
    SET v_moni_role_type = 0;
    SET v_moni_value_flag = 0;
    SET v_moni_value_type = 0;
    SET v_warn_posi_value = 0;
    SET v_warn_trig_oper_type = 0;
    SET v_close_posi_value = 0;
    SET v_close_trig_oper_type = 0;
    SET v_appd_value = 0;
    SET v_appd_trig_oper_type = 0;
    SET v_begin_moni_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_moni_value = 0;
    SET v_max_moni_value = 0;
    SET v_curr_moni_value = 0;
    SET v_curr_result_moni_value = 0;
    SET v_contrs_stock_code = " ";
    SET v_contrs_exch_no = 0;
    SET v_contrs_max_moni_value = 0;
    SET v_contrs_curr_moni_value = 0;
    SET v_contrs_result_moni_value = 0;
    SET v_moni_result_value = 0;
    SET v_moni_result_status = " ";
    SET v_moni_set_status = " ";
    SET v_cash_asset = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_stock_asset = 0;
    SET v_repo_asset = 0;
    SET v_nav_asset = 0;
    SET v_stock_asset_ratio = 0;
    SET v_close_posi_flag = 0;
    SET v_close_ratio_level_one = 0;
    SET v_close_ratio_level_two = 0;
    SET v_close_ratio_level_three = 0;
    SET v_remark_info = " ";
    SET v_time_stamp = unix_timestamp();
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

      /* 调用【原子_风控证券_接口_获取单条账户风险监控设置】*/
      call db_rksecu.pra_rkseif_GetSingleProductMonitor(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_moni_set_id,
          v_error_code,
          v_error_info,
          v_row_id,
          v_co_no,
          v_pd_no_str,
          v_exch_group_no_str,
          v_moni_role_type,
          v_moni_value_flag,
          v_moni_value_type,
          v_warn_posi_value,
          v_warn_trig_oper_type,
          v_close_posi_value,
          v_close_trig_oper_type,
          v_appd_value,
          v_appd_trig_oper_type,
          v_begin_moni_date,
          v_begin_moni_value,
          v_max_moni_value,
          v_curr_moni_value,
          v_curr_result_moni_value,
          v_contrs_stock_code,
          v_contrs_exch_no,
          v_contrs_max_moni_value,
          v_contrs_curr_moni_value,
          v_contrs_result_moni_value,
          v_moni_result_value,
          v_moni_result_status,
          v_moni_set_status,
          v_cash_asset,
          v_fund_asset,
          v_bond_asset,
          v_stock_asset,
          v_repo_asset,
          v_nav_asset,
          v_stock_asset_ratio,
          v_close_posi_flag,
          v_close_ratio_level_one,
          v_close_ratio_level_two,
          v_close_ratio_level_three,
          v_remark_info,
          v_time_stamp,
          v_update_times);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.19.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_获取单条账户风险监控设置出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no_str = v_pd_no_str;
    SET p_exch_group_no_str = v_exch_group_no_str;
    SET p_moni_role_type = v_moni_role_type;
    SET p_moni_value_flag = v_moni_value_flag;
    SET p_moni_value_type = v_moni_value_type;
    SET p_warn_posi_value = v_warn_posi_value;
    SET p_warn_trig_oper_type = v_warn_trig_oper_type;
    SET p_close_posi_value = v_close_posi_value;
    SET p_close_trig_oper_type = v_close_trig_oper_type;
    SET p_appd_value = v_appd_value;
    SET p_appd_trig_oper_type = v_appd_trig_oper_type;
    SET p_begin_moni_date = v_begin_moni_date;
    SET p_begin_moni_value = v_begin_moni_value;
    SET p_max_moni_value = v_max_moni_value;
    SET p_curr_moni_value = v_curr_moni_value;
    SET p_curr_result_moni_value = v_curr_result_moni_value;
    SET p_contrs_stock_code = v_contrs_stock_code;
    SET p_contrs_exch_no = v_contrs_exch_no;
    SET p_contrs_max_moni_value = v_contrs_max_moni_value;
    SET p_contrs_curr_moni_value = v_contrs_curr_moni_value;
    SET p_contrs_result_moni_value = v_contrs_result_moni_value;
    SET p_moni_result_value = v_moni_result_value;
    SET p_moni_result_status = v_moni_result_status;
    SET p_moni_set_status = v_moni_set_status;
    SET p_cash_asset = v_cash_asset;
    SET p_fund_asset = v_fund_asset;
    SET p_bond_asset = v_bond_asset;
    SET p_stock_asset = v_stock_asset;
    SET p_repo_asset = v_repo_asset;
    SET p_nav_asset = v_nav_asset;
    SET p_stock_asset_ratio = v_stock_asset_ratio;
    SET p_close_posi_flag = v_close_posi_flag;
    SET p_close_ratio_level_one = v_close_ratio_level_one;
    SET p_close_ratio_level_two = v_close_ratio_level_two;
    SET p_close_ratio_level_three = v_close_ratio_level_three;
    SET p_remark_info = v_remark_info;
    SET p_time_stamp = v_time_stamp;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_接口_获取单条T0操作员阈值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_GetSingleT0OporResult;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_GetSingleT0OporResult(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_busi_opor_no int,
    OUT p_detail_posi_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_no int,
    OUT p_stock_code varchar(6),
    OUT p_stock_acco_no int,
    OUT p_lngsht_type int,
    OUT p_curr_qty decimal(18,2),
    OUT p_open_posi_date int,
    OUT p_open_posi_time int,
    OUT p_open_posi_price decimal(16,9),
    OUT p_open_posi_value decimal(18,4),
    OUT p_open_posi_fee decimal(18,4),
    OUT p_close_posi_qty decimal(18,2),
    OUT p_close_posi_market_value decimal(18,4),
    OUT p_close_posi_fee decimal(18,4),
    OUT p_realize_pandl decimal(18,4),
    OUT p_pandl_ratio decimal(18,12),
    OUT p_un_close_posi_qty decimal(18,2),
    OUT p_un_close_marke_value decimal(18,4),
    OUT p_last_price decimal(16,9),
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_cost_price decimal(16,9),
    OUT p_last_tshold_value decimal(18,4),
    OUT p_float_pandl decimal(18,4),
    OUT p_posi_status varchar(2),
    OUT p_moni_result_status varchar(2),
    OUT p_posi_limit_status varchar(2),
    OUT p_opor_warn_tshold decimal(18,4),
    OUT p_opor_stop_tshold decimal(18,4),
    OUT p_stock_warn_ratio decimal(18,12),
    OUT p_stock_stop_ratio decimal(18,12),
    OUT p_stock_warn_amt decimal(18,4),
    OUT p_stock_stop_amt decimal(18,4),
    OUT p_open_close_permission int,
    OUT p_posi_limit_time int,
    OUT p_update_times int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_busi_opor_no int;
    declare v_detail_posi_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_acco_no int;
    declare v_lngsht_type int;
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_date int;
    declare v_open_posi_time int;
    declare v_open_posi_price decimal(16,9);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_close_posi_qty decimal(18,2);
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_pandl_ratio decimal(18,12);
    declare v_un_close_posi_qty decimal(18,2);
    declare v_un_close_marke_value decimal(18,4);
    declare v_last_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_cost_price decimal(16,9);
    declare v_last_tshold_value decimal(18,4);
    declare v_float_pandl decimal(18,4);
    declare v_posi_status varchar(2);
    declare v_moni_result_status varchar(2);
    declare v_posi_limit_status varchar(2);
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_stock_warn_ratio decimal(18,12);
    declare v_stock_stop_ratio decimal(18,12);
    declare v_stock_warn_amt decimal(18,4);
    declare v_stock_stop_amt decimal(18,4);
    declare v_open_close_permission int;
    declare v_posi_limit_time int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_busi_opor_no = 0;
    SET v_detail_posi_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_stock_acco_no = 0;
    SET v_lngsht_type = 0;
    SET v_curr_qty = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_open_posi_time = date_format(curtime(),'%H%i%s');
    SET v_open_posi_price = 0;
    SET v_open_posi_value = 0;
    SET v_open_posi_fee = 0;
    SET v_close_posi_qty = 0;
    SET v_close_posi_market_value = 0;
    SET v_close_posi_fee = 0;
    SET v_realize_pandl = 0;
    SET v_pandl_ratio = 0;
    SET v_un_close_posi_qty = 0;
    SET v_un_close_marke_value = 0;
    SET v_last_price = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_cost_price = 0;
    SET v_last_tshold_value = 0;
    SET v_float_pandl = 0;
    SET v_posi_status = "0";
    SET v_moni_result_status = " ";
    SET v_posi_limit_status = " ";
    SET v_opor_warn_tshold = 0;
    SET v_opor_stop_tshold = 0;
    SET v_stock_warn_ratio = 0;
    SET v_stock_stop_ratio = 0;
    SET v_stock_warn_amt = 0;
    SET v_stock_stop_amt = 0;
    SET v_open_close_permission = 0;
    SET v_posi_limit_time = 5;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_风控证券_接口_获取单条T0操作员阈值】*/
    call db_rksecu.pra_rkseif_GetSingleT0OporResult(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_asset_acco_no,
        v_stock_code_no,
        v_error_code,
        v_error_info,
        v_row_id,
        v_busi_opor_no,
        v_detail_posi_id,
        v_co_no,
        v_pd_no,
        v_exch_no,
        v_stock_code,
        v_stock_acco_no,
        v_lngsht_type,
        v_curr_qty,
        v_open_posi_date,
        v_open_posi_time,
        v_open_posi_price,
        v_open_posi_value,
        v_open_posi_fee,
        v_close_posi_qty,
        v_close_posi_market_value,
        v_close_posi_fee,
        v_realize_pandl,
        v_pandl_ratio,
        v_un_close_posi_qty,
        v_un_close_marke_value,
        v_last_price,
        v_up_limit_price,
        v_down_limit_price,
        v_cost_price,
        v_last_tshold_value,
        v_float_pandl,
        v_posi_status,
        v_moni_result_status,
        v_posi_limit_status,
        v_opor_warn_tshold,
        v_opor_stop_tshold,
        v_stock_warn_ratio,
        v_stock_stop_ratio,
        v_stock_warn_amt,
        v_stock_stop_amt,
        v_open_close_permission,
        v_posi_limit_time,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.5.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_获取单条T0操作员阈值出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_detail_posi_id = v_detail_posi_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_lngsht_type = v_lngsht_type;
    SET p_curr_qty = v_curr_qty;
    SET p_open_posi_date = v_open_posi_date;
    SET p_open_posi_time = v_open_posi_time;
    SET p_open_posi_price = v_open_posi_price;
    SET p_open_posi_value = v_open_posi_value;
    SET p_open_posi_fee = v_open_posi_fee;
    SET p_close_posi_qty = v_close_posi_qty;
    SET p_close_posi_market_value = v_close_posi_market_value;
    SET p_close_posi_fee = v_close_posi_fee;
    SET p_realize_pandl = v_realize_pandl;
    SET p_pandl_ratio = v_pandl_ratio;
    SET p_un_close_posi_qty = v_un_close_posi_qty;
    SET p_un_close_marke_value = v_un_close_marke_value;
    SET p_last_price = v_last_price;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_cost_price = v_cost_price;
    SET p_last_tshold_value = v_last_tshold_value;
    SET p_float_pandl = v_float_pandl;
    SET p_posi_status = v_posi_status;
    SET p_moni_result_status = v_moni_result_status;
    SET p_posi_limit_status = v_posi_limit_status;
    SET p_opor_warn_tshold = v_opor_warn_tshold;
    SET p_opor_stop_tshold = v_opor_stop_tshold;
    SET p_stock_warn_ratio = v_stock_warn_ratio;
    SET p_stock_stop_ratio = v_stock_stop_ratio;
    SET p_stock_warn_amt = v_stock_warn_amt;
    SET p_stock_stop_amt = v_stock_stop_amt;
    SET p_open_close_permission = v_open_close_permission;
    SET p_posi_limit_time = v_posi_limit_time;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_接口_获取单条T0操作员阈值汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_GetSingleT0OporSumResult;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_GetSingleT0OporSumResult(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_busi_opor_no int,
    OUT p_co_no int,
    OUT p_curr_qty decimal(18,2),
    OUT p_open_posi_value decimal(18,4),
    OUT p_open_posi_fee decimal(18,4),
    OUT p_close_posi_qty decimal(18,2),
    OUT p_close_posi_market_value decimal(18,4),
    OUT p_close_posi_fee decimal(18,4),
    OUT p_realize_pandl decimal(18,4),
    OUT p_float_pandl decimal(18,4),
    OUT p_pandl_ratio decimal(18,12),
    OUT p_un_close_posi_qty decimal(18,2),
    OUT p_un_close_marke_value decimal(18,4),
    OUT p_last_tshold_value decimal(18,4),
    OUT p_moni_result_status varchar(2),
    OUT p_opor_warn_tshold decimal(18,4),
    OUT p_opor_stop_tshold decimal(18,4),
    OUT p_open_close_permission int,
    OUT p_update_times int
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
    declare v_row_id bigint;
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_close_posi_qty decimal(18,2);
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_float_pandl decimal(18,4);
    declare v_pandl_ratio decimal(18,12);
    declare v_un_close_posi_qty decimal(18,2);
    declare v_un_close_marke_value decimal(18,4);
    declare v_last_tshold_value decimal(18,4);
    declare v_moni_result_status varchar(2);
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_open_close_permission int;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_busi_opor_no = 0;
    SET v_co_no = 0;
    SET v_curr_qty = 0;
    SET v_open_posi_value = 0;
    SET v_open_posi_fee = 0;
    SET v_close_posi_qty = 0;
    SET v_close_posi_market_value = 0;
    SET v_close_posi_fee = 0;
    SET v_realize_pandl = 0;
    SET v_float_pandl = 0;
    SET v_pandl_ratio = 0;
    SET v_un_close_posi_qty = 0;
    SET v_un_close_marke_value = 0;
    SET v_last_tshold_value = 0;
    SET v_moni_result_status = " ";
    SET v_opor_warn_tshold = 0;
    SET v_opor_stop_tshold = 0;
    SET v_open_close_permission = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_风控证券_接口_获取单条T0操作员阈值汇总】*/
    call db_rksecu.pra_rkseif_GetSingleT0OporSumResult(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_row_id,
        v_busi_opor_no,
        v_co_no,
        v_curr_qty,
        v_open_posi_value,
        v_open_posi_fee,
        v_close_posi_qty,
        v_close_posi_market_value,
        v_close_posi_fee,
        v_realize_pandl,
        v_float_pandl,
        v_pandl_ratio,
        v_un_close_posi_qty,
        v_un_close_marke_value,
        v_last_tshold_value,
        v_moni_result_status,
        v_opor_warn_tshold,
        v_opor_stop_tshold,
        v_open_close_permission,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.5.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_获取单条T0操作员阈值汇总出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_co_no = v_co_no;
    SET p_curr_qty = v_curr_qty;
    SET p_open_posi_value = v_open_posi_value;
    SET p_open_posi_fee = v_open_posi_fee;
    SET p_close_posi_qty = v_close_posi_qty;
    SET p_close_posi_market_value = v_close_posi_market_value;
    SET p_close_posi_fee = v_close_posi_fee;
    SET p_realize_pandl = v_realize_pandl;
    SET p_float_pandl = v_float_pandl;
    SET p_pandl_ratio = v_pandl_ratio;
    SET p_un_close_posi_qty = v_un_close_posi_qty;
    SET p_un_close_marke_value = v_un_close_marke_value;
    SET p_last_tshold_value = v_last_tshold_value;
    SET p_moni_result_status = v_moni_result_status;
    SET p_opor_warn_tshold = v_opor_warn_tshold;
    SET p_opor_stop_tshold = v_opor_stop_tshold;
    SET p_open_close_permission = v_open_close_permission;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_接口_检查客户风险1
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_CheckSecuClientRisk1;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_CheckSecuClientRisk1(
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
    IN p_exch_crncy_type varchar(3),
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_all_fee decimal(18,4),
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
    declare v_exch_crncy_type varchar(3);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_trig_stage_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_risk_param_value_str varchar(1024);
    declare v_compli_rules_remark varchar(255);
    declare v_risk_rule_action varchar(32);

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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_all_fee = p_all_fee;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_compli_trig_id = 0;
    SET v_risk_param_value_str = " ";
    SET v_compli_rules_remark = " ";
    SET v_risk_rule_action = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_风控_获取最大的合规触警流水序号】*/
      call db_rksecu.pra_rkserk_GetMaxComplianceTriggerId(
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
          SET v_error_code = "rksecuT.5.22.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取最大的合规触警流水序号出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


    /* [事务结束] */
    COMMIT;


    /* [事务开始] */
    START TRANSACTION;

    # 正回购特殊处理

      /* if @订单方向# = 3 or @订单方向# = 4 then */
      if v_order_dir = 3 or v_order_dir = 4 then

        /* if @市场编号# = 1 then */
        if v_exch_no = 1 then

          /* set @证券代码# = "888880"; */
          set v_stock_code = "888880";

        /* elseif @市场编号# = 2 then */
        elseif v_exch_no = 2 then

          /* set @证券代码# = "131990"; */
          set v_stock_code = "131990";
        end if;
      end if;

      /* 调用【原子_风控证券_风控_增加交易流水记录】*/
      call db_rksecu.pra_rkserk_AddTradeTrigRecord(
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
          v_exch_no,
          v_exch_crncy_type,
          v_stock_code,
          v_order_dir,
          v_order_price,
          v_order_qty,
          v_all_fee,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.22.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_增加交易流水记录出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


      /* set @风险要素值串# = concat(";","证券代码=", @证券代码#, ";"); */
      set v_risk_param_value_str = concat(";","证券代码=", v_stock_code, ";");

      /* 调用【原子_风控证券_风控_交易检查客户风险】*/
      call db_rksecu.pra_rkserk_CheckSecuClientRisk(
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
          v_exch_no,
          v_exch_crncy_type,
          v_stock_code_no,
          v_stock_code,
          v_order_dir,
          v_order_price,
          v_order_qty,
          v_all_fee,
          v_trig_stage_type,
          v_risk_param_value_str,
          v_compli_trig_id,
          v_error_code,
          v_error_info,
          v_compli_rules_remark,
          v_risk_rule_action);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.22.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_交易检查客户风险出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


      /* 调用【原子_风控证券_风控_清空交易流水记录】*/
      call db_rksecu.pra_rkserk_DeleteTradeTrigRecord(
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
          v_exch_no,
          v_exch_crncy_type,
          v_stock_code,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.22.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_清空交易流水记录出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


    /* [事务结束] */
    COMMIT;


    /* [检查报错返回][@风险采取行为# = 4][906][concat("订单触发风控:", @合规规则说明#)] */
    if v_risk_rule_action = 4 then
        
        SET v_error_code = "rksecuT.5.22.906";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单触发风控:", v_compli_rules_remark),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单触发风控:", v_compli_rules_remark);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_compli_trig_id = v_compli_trig_id;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_接口_同步大宗交易持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_SyncBlockTradePosition;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_SyncBlockTradePosition(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_posi_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_fair_price decimal(16,9),
    IN p_strike_date int,
    IN p_release_date int,
    IN p_deal_status varchar(2),
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
    declare v_posi_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_strike_date int;
    declare v_release_date int;
    declare v_deal_status varchar(2);
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
    SET v_posi_id = p_posi_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_price = p_strike_price;
    SET v_fair_price = p_fair_price;
    SET v_strike_date = p_strike_date;
    SET v_release_date = p_release_date;
    SET v_deal_status = p_deal_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_接口_同步大宗交易持仓】*/
      call db_rksecu.pra_rkseif_SyncBlockTradePosition(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_posi_id,
          v_co_no,
          v_pd_no,
          v_asset_acco_no,
          v_exch_group_no,
          v_exch_no,
          v_stock_acco_no,
          v_stock_code_no,
          v_strike_qty,
          v_strike_price,
          v_fair_price,
          v_strike_date,
          v_release_date,
          v_deal_status,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.23.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_同步大宗交易持仓出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_获取单条操作员风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_GetSingleOporMonitor;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_GetSingleOporMonitor(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_moni_set_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_busi_opor_no int,
    OUT p_moni_role_type int,
    OUT p_moni_value_flag int,
    OUT p_moni_value_type int,
    OUT p_warn_posi_value decimal(18,4),
    OUT p_warn_trig_oper_type int,
    OUT p_close_posi_value decimal(18,4),
    OUT p_close_trig_oper_type int,
    OUT p_appd_value decimal(18,4),
    OUT p_appd_trig_oper_type int,
    OUT p_begin_moni_date int,
    OUT p_begin_moni_value decimal(18,4),
    OUT p_max_moni_value decimal(18,4),
    OUT p_curr_moni_value decimal(18,4),
    OUT p_curr_result_moni_value decimal(18,4),
    OUT p_contrs_stock_code varchar(6),
    OUT p_contrs_exch_no int,
    OUT p_contrs_max_moni_value decimal(18,4),
    OUT p_contrs_curr_moni_value decimal(18,4),
    OUT p_contrs_result_moni_value decimal(18,4),
    OUT p_moni_result_value decimal(18,4),
    OUT p_moni_result_status varchar(2),
    OUT p_moni_set_status varchar(2),
    OUT p_cash_asset decimal(18,4),
    OUT p_fund_asset decimal(18,4),
    OUT p_bond_asset decimal(18,4),
    OUT p_stock_asset decimal(18,4),
    OUT p_repo_asset decimal(18,4),
    OUT p_nav_asset decimal(18,4),
    OUT p_stock_asset_ratio decimal(18,12),
    OUT p_close_posi_flag int,
    OUT p_close_ratio_level_one decimal(18,12),
    OUT p_close_ratio_level_two decimal(18,12),
    OUT p_close_ratio_level_three decimal(18,12),
    OUT p_remark_info varchar(255),
    OUT p_time_stamp int,
    OUT p_update_times int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_moni_set_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_busi_opor_no int;
    declare v_moni_role_type int;
    declare v_moni_value_flag int;
    declare v_moni_value_type int;
    declare v_warn_posi_value decimal(18,4);
    declare v_warn_trig_oper_type int;
    declare v_close_posi_value decimal(18,4);
    declare v_close_trig_oper_type int;
    declare v_appd_value decimal(18,4);
    declare v_appd_trig_oper_type int;
    declare v_begin_moni_date int;
    declare v_begin_moni_value decimal(18,4);
    declare v_max_moni_value decimal(18,4);
    declare v_curr_moni_value decimal(18,4);
    declare v_curr_result_moni_value decimal(18,4);
    declare v_contrs_stock_code varchar(6);
    declare v_contrs_exch_no int;
    declare v_contrs_max_moni_value decimal(18,4);
    declare v_contrs_curr_moni_value decimal(18,4);
    declare v_contrs_result_moni_value decimal(18,4);
    declare v_moni_result_value decimal(18,4);
    declare v_moni_result_status varchar(2);
    declare v_moni_set_status varchar(2);
    declare v_cash_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_stock_asset_ratio decimal(18,12);
    declare v_close_posi_flag int;
    declare v_close_ratio_level_one decimal(18,12);
    declare v_close_ratio_level_two decimal(18,12);
    declare v_close_ratio_level_three decimal(18,12);
    declare v_remark_info varchar(255);
    declare v_time_stamp int;
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_busi_opor_no = 0;
    SET v_moni_role_type = 0;
    SET v_moni_value_flag = 0;
    SET v_moni_value_type = 0;
    SET v_warn_posi_value = 0;
    SET v_warn_trig_oper_type = 0;
    SET v_close_posi_value = 0;
    SET v_close_trig_oper_type = 0;
    SET v_appd_value = 0;
    SET v_appd_trig_oper_type = 0;
    SET v_begin_moni_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_moni_value = 0;
    SET v_max_moni_value = 0;
    SET v_curr_moni_value = 0;
    SET v_curr_result_moni_value = 0;
    SET v_contrs_stock_code = " ";
    SET v_contrs_exch_no = 0;
    SET v_contrs_max_moni_value = 0;
    SET v_contrs_curr_moni_value = 0;
    SET v_contrs_result_moni_value = 0;
    SET v_moni_result_value = 0;
    SET v_moni_result_status = " ";
    SET v_moni_set_status = " ";
    SET v_cash_asset = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_stock_asset = 0;
    SET v_repo_asset = 0;
    SET v_nav_asset = 0;
    SET v_stock_asset_ratio = 0;
    SET v_close_posi_flag = 0;
    SET v_close_ratio_level_one = 0;
    SET v_close_ratio_level_two = 0;
    SET v_close_ratio_level_three = 0;
    SET v_remark_info = " ";
    SET v_time_stamp = unix_timestamp();
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

      /* 调用【原子_风控证券_接口_获取单条操作员风险监控设置】*/
      call db_rksecu.pra_rkseif_GetSingleOporMonitor(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_moni_set_id,
          v_error_code,
          v_error_info,
          v_row_id,
          v_co_no,
          v_busi_opor_no,
          v_moni_role_type,
          v_moni_value_flag,
          v_moni_value_type,
          v_warn_posi_value,
          v_warn_trig_oper_type,
          v_close_posi_value,
          v_close_trig_oper_type,
          v_appd_value,
          v_appd_trig_oper_type,
          v_begin_moni_date,
          v_begin_moni_value,
          v_max_moni_value,
          v_curr_moni_value,
          v_curr_result_moni_value,
          v_contrs_stock_code,
          v_contrs_exch_no,
          v_contrs_max_moni_value,
          v_contrs_curr_moni_value,
          v_contrs_result_moni_value,
          v_moni_result_value,
          v_moni_result_status,
          v_moni_set_status,
          v_cash_asset,
          v_fund_asset,
          v_bond_asset,
          v_stock_asset,
          v_repo_asset,
          v_nav_asset,
          v_stock_asset_ratio,
          v_close_posi_flag,
          v_close_ratio_level_one,
          v_close_ratio_level_two,
          v_close_ratio_level_three,
          v_remark_info,
          v_time_stamp,
          v_update_times);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.24.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_获取单条操作员风险监控设置出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_moni_role_type = v_moni_role_type;
    SET p_moni_value_flag = v_moni_value_flag;
    SET p_moni_value_type = v_moni_value_type;
    SET p_warn_posi_value = v_warn_posi_value;
    SET p_warn_trig_oper_type = v_warn_trig_oper_type;
    SET p_close_posi_value = v_close_posi_value;
    SET p_close_trig_oper_type = v_close_trig_oper_type;
    SET p_appd_value = v_appd_value;
    SET p_appd_trig_oper_type = v_appd_trig_oper_type;
    SET p_begin_moni_date = v_begin_moni_date;
    SET p_begin_moni_value = v_begin_moni_value;
    SET p_max_moni_value = v_max_moni_value;
    SET p_curr_moni_value = v_curr_moni_value;
    SET p_curr_result_moni_value = v_curr_result_moni_value;
    SET p_contrs_stock_code = v_contrs_stock_code;
    SET p_contrs_exch_no = v_contrs_exch_no;
    SET p_contrs_max_moni_value = v_contrs_max_moni_value;
    SET p_contrs_curr_moni_value = v_contrs_curr_moni_value;
    SET p_contrs_result_moni_value = v_contrs_result_moni_value;
    SET p_moni_result_value = v_moni_result_value;
    SET p_moni_result_status = v_moni_result_status;
    SET p_moni_set_status = v_moni_set_status;
    SET p_cash_asset = v_cash_asset;
    SET p_fund_asset = v_fund_asset;
    SET p_bond_asset = v_bond_asset;
    SET p_stock_asset = v_stock_asset;
    SET p_repo_asset = v_repo_asset;
    SET p_nav_asset = v_nav_asset;
    SET p_stock_asset_ratio = v_stock_asset_ratio;
    SET p_close_posi_flag = v_close_posi_flag;
    SET p_close_ratio_level_one = v_close_ratio_level_one;
    SET p_close_ratio_level_two = v_close_ratio_level_two;
    SET p_close_ratio_level_three = v_close_ratio_level_three;
    SET p_remark_info = v_remark_info;
    SET p_time_stamp = v_time_stamp;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_接口_获取操作员风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_GetOporMonitor;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_GetOporMonitor(
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
    

      /* 调用【原子_风控证券_接口_获取操作员风险监控设置】*/
      call db_rksecu.pra_rkseif_GetOporMonitor(
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
          SET v_error_code = "rksecuT.5.25.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_获取操作员风险监控设置出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_更新操作员风险监控设置计算值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_UpdateOporMonitorSetServiceValue;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_UpdateOporMonitorSetServiceValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_moni_set_id bigint,
    IN p_curr_moni_value decimal(18,4),
    IN p_cash_asset decimal(18,4),
    IN p_fund_asset decimal(18,4),
    IN p_bond_asset decimal(18,4),
    IN p_stock_asset decimal(18,4),
    IN p_repo_asset decimal(18,4),
    IN p_nav_asset decimal(18,4),
    IN p_contrs_curr_moni_value decimal(18,4),
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
    declare v_moni_set_id bigint;
    declare v_curr_moni_value decimal(18,4);
    declare v_cash_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_contrs_curr_moni_value decimal(18,4);
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_curr_moni_value = p_curr_moni_value;
    SET v_cash_asset = p_cash_asset;
    SET v_fund_asset = p_fund_asset;
    SET v_bond_asset = p_bond_asset;
    SET v_stock_asset = p_stock_asset;
    SET v_repo_asset = p_repo_asset;
    SET v_nav_asset = p_nav_asset;
    SET v_contrs_curr_moni_value = p_contrs_curr_moni_value;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_接口_更新操作员风险监控设置计算值】*/
      call db_rksecu.pra_rkseif_UpdateOporMonitorSetServiceValue(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_moni_set_id,
          v_curr_moni_value,
          v_cash_asset,
          v_fund_asset,
          v_bond_asset,
          v_stock_asset,
          v_repo_asset,
          v_nav_asset,
          v_contrs_curr_moni_value,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.26.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_更新操作员风险监控设置计算值出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_更新T0操作员触警流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_UpdateT0OporTrigInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_UpdateT0OporTrigInfo(
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
    IN p_stock_code_no int,
    IN p_stock_acco_no int,
    IN p_lngsht_type int,
    IN p_curr_qty decimal(18,2),
    IN p_open_posi_price decimal(16,9),
    IN p_open_posi_value decimal(18,4),
    IN p_open_posi_fee decimal(18,4),
    IN p_close_posi_qty decimal(18,2),
    IN p_close_posi_market_value decimal(18,4),
    IN p_close_posi_fee decimal(18,4),
    IN p_realize_pandl decimal(18,4),
    IN p_pandl_ratio decimal(18,12),
    IN p_un_close_posi_qty decimal(18,2),
    IN p_un_close_marke_value decimal(18,4),
    IN p_last_price decimal(16,9),
    IN p_cost_price decimal(16,9),
    IN p_last_tshold_value decimal(18,4),
    IN p_float_pandl decimal(18,4),
    IN p_moni_result_status varchar(2),
    IN p_opor_warn_tshold decimal(18,4),
    IN p_opor_stop_tshold decimal(18,4),
    IN p_stock_warn_ratio decimal(18,12),
    IN p_stock_stop_ratio decimal(18,12),
    IN p_stock_warn_amt decimal(18,4),
    IN p_stock_stop_amt decimal(18,4),
    IN p_open_close_permission int,
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
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_acco_no int;
    declare v_lngsht_type int;
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_price decimal(16,9);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_close_posi_qty decimal(18,2);
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_pandl_ratio decimal(18,12);
    declare v_un_close_posi_qty decimal(18,2);
    declare v_un_close_marke_value decimal(18,4);
    declare v_last_price decimal(16,9);
    declare v_cost_price decimal(16,9);
    declare v_last_tshold_value decimal(18,4);
    declare v_float_pandl decimal(18,4);
    declare v_moni_result_status varchar(2);
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_stock_warn_ratio decimal(18,12);
    declare v_stock_stop_ratio decimal(18,12);
    declare v_stock_warn_amt decimal(18,4);
    declare v_stock_stop_amt decimal(18,4);
    declare v_open_close_permission int;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_curr_qty = p_curr_qty;
    SET v_open_posi_price = p_open_posi_price;
    SET v_open_posi_value = p_open_posi_value;
    SET v_open_posi_fee = p_open_posi_fee;
    SET v_close_posi_qty = p_close_posi_qty;
    SET v_close_posi_market_value = p_close_posi_market_value;
    SET v_close_posi_fee = p_close_posi_fee;
    SET v_realize_pandl = p_realize_pandl;
    SET v_pandl_ratio = p_pandl_ratio;
    SET v_un_close_posi_qty = p_un_close_posi_qty;
    SET v_un_close_marke_value = p_un_close_marke_value;
    SET v_last_price = p_last_price;
    SET v_cost_price = p_cost_price;
    SET v_last_tshold_value = p_last_tshold_value;
    SET v_float_pandl = p_float_pandl;
    SET v_moni_result_status = p_moni_result_status;
    SET v_opor_warn_tshold = p_opor_warn_tshold;
    SET v_opor_stop_tshold = p_opor_stop_tshold;
    SET v_stock_warn_ratio = p_stock_warn_ratio;
    SET v_stock_stop_ratio = p_stock_stop_ratio;
    SET v_stock_warn_amt = p_stock_warn_amt;
    SET v_stock_stop_amt = p_stock_stop_amt;
    SET v_open_close_permission = p_open_close_permission;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_接口_更新T0操作员触警流水信息】*/
      call db_rksecu.pra_rkseif_UpdateT0OporTrigInfo(
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
          v_stock_code_no,
          v_stock_acco_no,
          v_lngsht_type,
          v_curr_qty,
          v_open_posi_price,
          v_open_posi_value,
          v_open_posi_fee,
          v_close_posi_qty,
          v_close_posi_market_value,
          v_close_posi_fee,
          v_realize_pandl,
          v_pandl_ratio,
          v_un_close_posi_qty,
          v_un_close_marke_value,
          v_last_price,
          v_cost_price,
          v_last_tshold_value,
          v_float_pandl,
          v_moni_result_status,
          v_opor_warn_tshold,
          v_opor_stop_tshold,
          v_stock_warn_ratio,
          v_stock_stop_ratio,
          v_stock_warn_amt,
          v_stock_stop_amt,
          v_open_close_permission,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.27.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_更新T0操作员触警流水信息出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_更新T0操作员汇总触警流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_UpdateT0OporSumTrigInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_UpdateT0OporSumTrigInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_curr_qty decimal(18,2),
    IN p_open_posi_value decimal(18,4),
    IN p_open_posi_fee decimal(18,4),
    IN p_close_posi_qty decimal(18,2),
    IN p_close_posi_market_value decimal(18,4),
    IN p_close_posi_fee decimal(18,4),
    IN p_realize_pandl decimal(18,4),
    IN p_float_pandl decimal(18,4),
    IN p_pandl_ratio decimal(18,12),
    IN p_un_close_posi_qty decimal(18,2),
    IN p_un_close_marke_value decimal(18,4),
    IN p_last_tshold_value decimal(18,4),
    IN p_moni_result_status varchar(2),
    IN p_opor_warn_tshold decimal(18,4),
    IN p_opor_stop_tshold decimal(18,4),
    IN p_open_close_permission int,
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
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_close_posi_qty decimal(18,2);
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_float_pandl decimal(18,4);
    declare v_pandl_ratio decimal(18,12);
    declare v_un_close_posi_qty decimal(18,2);
    declare v_un_close_marke_value decimal(18,4);
    declare v_last_tshold_value decimal(18,4);
    declare v_moni_result_status varchar(2);
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_open_close_permission int;
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
    SET v_curr_qty = p_curr_qty;
    SET v_open_posi_value = p_open_posi_value;
    SET v_open_posi_fee = p_open_posi_fee;
    SET v_close_posi_qty = p_close_posi_qty;
    SET v_close_posi_market_value = p_close_posi_market_value;
    SET v_close_posi_fee = p_close_posi_fee;
    SET v_realize_pandl = p_realize_pandl;
    SET v_float_pandl = p_float_pandl;
    SET v_pandl_ratio = p_pandl_ratio;
    SET v_un_close_posi_qty = p_un_close_posi_qty;
    SET v_un_close_marke_value = p_un_close_marke_value;
    SET v_last_tshold_value = p_last_tshold_value;
    SET v_moni_result_status = p_moni_result_status;
    SET v_opor_warn_tshold = p_opor_warn_tshold;
    SET v_opor_stop_tshold = p_opor_stop_tshold;
    SET v_open_close_permission = p_open_close_permission;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_接口_更新T0操作员汇总触警流水信息】*/
      call db_rksecu.pra_rkseif_UpdateT0OporSumTrigInfo(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_curr_qty,
          v_open_posi_value,
          v_open_posi_fee,
          v_close_posi_qty,
          v_close_posi_market_value,
          v_close_posi_fee,
          v_realize_pandl,
          v_float_pandl,
          v_pandl_ratio,
          v_un_close_posi_qty,
          v_un_close_marke_value,
          v_last_tshold_value,
          v_moni_result_status,
          v_opor_warn_tshold,
          v_opor_stop_tshold,
          v_open_close_permission,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.28.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_更新T0操作员汇总触警流水信息出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_获取合规触警序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_GetComplianceTriggerId;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_GetComplianceTriggerId(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

     /* 调用【原子_风控证券_接口_获取合规触警序号】*/
     call db_rksecu.pra_rkseif_GetComplianceTriggerId(
         v_opor_co_no,
         v_opor_no,
         v_oper_mac,
         v_oper_ip_addr,
         v_oper_info,
         v_oper_way,
         v_func_code,
         v_error_code,
         v_error_info);
     if v_error_code = "1" then
         SET v_error_code = "rksecuT.5.29.999";
         if v_mysql_message <> "" then
              SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_获取合规触警序号出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_更新合规触警流水序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_UpdateComplianceTriggerId;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_UpdateComplianceTriggerId(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_compli_trig_id bigint,
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
    declare v_compli_trig_id bigint;
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
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_接口_更新合规触警流水序号】*/
      call db_rksecu.pra_rkseif_UpdateComplianceTriggerId(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_compli_trig_id,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.30.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_更新合规触警流水序号出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_获取维度序号范围
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_GetRangeByDimeId;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_GetRangeByDimeId(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_dime_id bigint,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_trig_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_stock_code_no int,
    OUT p_cash_asset_flag int
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
    declare v_dime_id bigint;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_trig_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_stock_code_no int;
    declare v_cash_asset_flag int;

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
    SET v_dime_id = p_dime_id;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_trig_type = p_trig_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_stock_code_no = 0;
    SET v_cash_asset_flag = 0;

    
    label_pro:BEGIN
    

      /* 调用【原子_风控证券_维度_维度序号获取范围】*/
      call db_rksecu.pra_rksedm_GetRangeByDimeId(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_dime_id,
          v_exch_no,
          v_stock_code,
          v_order_dir,
          v_trig_type,
          v_error_code,
          v_error_info,
          v_record_count,
          v_stock_code_no,
          v_cash_asset_flag);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.31.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_维度_维度序号获取范围出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;
    SET p_stock_code_no = v_stock_code_no;
    SET p_cash_asset_flag = v_cash_asset_flag;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_接口_新增合规触警流水数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_AddComplianceTrigData;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_AddComplianceTrigData(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_client_risk_rule_id int,
    IN p_risk_item_id int,
    IN p_compli_trig_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_order_dir int,
    IN p_dime_id bigint,
    IN p_stock_code_no int,
    IN p_trig_stage_type int,
    IN p_compli_calc_level int,
    IN p_unit_nav_flag int,
    IN p_trig_type int,
    IN p_compli_rules_remark varchar(255),
    IN p_risk_rule_action varchar(32),
    IN p_risk_rule_type int,
    IN p_risk_rule_value_str varchar(255),
    IN p_risk_rule_calc_str varchar(255),
    IN p_remark_info varchar(255),
    IN p_pd_no_str varchar(2048),
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
    declare v_risk_item_id int;
    declare v_compli_trig_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_order_dir int;
    declare v_dime_id bigint;
    declare v_stock_code_no int;
    declare v_trig_stage_type int;
    declare v_compli_calc_level int;
    declare v_unit_nav_flag int;
    declare v_trig_type int;
    declare v_compli_rules_remark varchar(255);
    declare v_risk_rule_action varchar(32);
    declare v_risk_rule_type int;
    declare v_risk_rule_value_str varchar(255);
    declare v_risk_rule_calc_str varchar(255);
    declare v_remark_info varchar(255);
    declare v_pd_no_str varchar(2048);
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
    SET v_risk_item_id = p_risk_item_id;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_order_dir = p_order_dir;
    SET v_dime_id = p_dime_id;
    SET v_stock_code_no = p_stock_code_no;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_compli_calc_level = p_compli_calc_level;
    SET v_unit_nav_flag = p_unit_nav_flag;
    SET v_trig_type = p_trig_type;
    SET v_compli_rules_remark = p_compli_rules_remark;
    SET v_risk_rule_action = p_risk_rule_action;
    SET v_risk_rule_type = p_risk_rule_type;
    SET v_risk_rule_value_str = p_risk_rule_value_str;
    SET v_risk_rule_calc_str = p_risk_rule_calc_str;
    SET v_remark_info = p_remark_info;
    SET v_pd_no_str = p_pd_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_接口_新增合规触警流水数据】*/
      call db_rksecu.pra_rkseif_AddComplianceTrigData(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_client_risk_rule_id,
          v_risk_item_id,
          v_compli_trig_id,
          v_co_no,
          v_pd_no,
          v_exch_group_no,
          v_order_dir,
          v_dime_id,
          v_stock_code_no,
          v_trig_stage_type,
          v_compli_calc_level,
          v_unit_nav_flag,
          v_trig_type,
          v_compli_rules_remark,
          v_risk_rule_action,
          v_risk_rule_type,
          v_risk_rule_value_str,
          v_risk_rule_calc_str,
          v_remark_info,
          v_pd_no_str,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.32.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_新增合规触警流水数据出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_同步交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_SyncExchGroupInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_SyncExchGroupInfo(
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
    IN p_exch_group_code varchar(32),
    IN p_exch_group_status varchar(2),
    IN p_default_group_flag int,
    IN p_exch_group_pd_share decimal(18,2),
    IN p_begin_NAV decimal(18,4),
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
    declare v_exch_group_code varchar(32);
    declare v_exch_group_status varchar(2);
    declare v_default_group_flag int;
    declare v_exch_group_pd_share decimal(18,2);
    declare v_begin_NAV decimal(18,4);
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
    SET v_exch_group_code = p_exch_group_code;
    SET v_exch_group_status = p_exch_group_status;
    SET v_default_group_flag = p_default_group_flag;
    SET v_exch_group_pd_share = p_exch_group_pd_share;
    SET v_begin_NAV = p_begin_NAV;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_接口_同步交易组信息】*/
      call db_rksecu.pra_rkseif_SyncExchGroupInfo(
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
          v_exch_group_code,
          v_exch_group_status,
          v_default_group_flag,
          v_exch_group_pd_share,
          v_begin_NAV,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.5.33.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_接口_同步交易组信息出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_接口_获取结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkseif_GetResult;;
DELIMITER ;;
CREATE PROCEDURE prt_rkseif_GetResult(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
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
    declare v_asset_acco_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* select   1 as {机构编号},1 as {产品编号},1 as {资产账户编号},1 as {总现金资产},1 as {证券现金资产},1 as {期货现金资产},1 as {股票资产},1 as {基金资产},1 as {货币基金资产},1 as {非货币基金资产},1 as {债券资产},1 as {期货资产},1 as {回购资产},1 as {港股通资产},1 as {期货多头市值},1 as {期货空头市值} from ~风控证券_计算_大宗交易持仓表^ where {记录序号}=1; */
    select   1 as co_no,1 as pd_no,1 as asset_acco_no,1 as total_cash_asset,1 as stock_cash_asset,1 as futu_cash_asset,1 as stock_asset,1 as fund_asset,1 as money_fund_asset,1 as not_money_fund_asset,1 as bond_asset,1 as futu_asset,1 as repo_asset,1 as hk_thrgh_stock_asset,1 as futu_long_market_value,1 as futu_short_market_value from db_rksecu.tb_rksecc_block_trade_posi where row_id=1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


