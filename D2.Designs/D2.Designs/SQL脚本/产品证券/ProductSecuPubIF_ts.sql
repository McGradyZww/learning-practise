DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_公共接口_获取股东代码编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_GetStockAccoNo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_GetStockAccoNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_acco_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_no int;

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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_公共接口_获取股东代码编号】*/
    call db_pdsecu.pra_pdsepubif_GetStockAccoNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_asset_acco_no,
        v_exch_no,
        v_stock_acco,
        v_error_code,
        v_error_info,
        v_stock_acco_no);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.4.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_获取股东代码编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_acco_no = v_stock_acco_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_公共接口_获取股东代码
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_GetStockAcco;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_GetStockAcco(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_no int,
    OUT p_stock_acco varchar(16)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);

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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_no = 0;
    SET v_stock_acco = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_公共接口_获取股东代码】*/
    call db_pdsecu.pra_pdsepubif_GetStockAcco(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_asset_acco_no,
        v_stock_acco_no,
        v_error_code,
        v_error_info,
        v_exch_no,
        v_stock_acco);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.4.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_获取股东代码出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco = v_stock_acco;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_公共接口_判断交易组能否注销
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_CheckExchGroupCancel;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_CheckExchGroupCancel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;

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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_产品证券_公共接口_判断交易组能否注销】*/
      call db_pdsecu.pra_pdsepubif_CheckIFExchGroupCancel(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_pd_no,
          v_exch_group_no,
          v_error_code,
          v_error_info,
          v_record_count);
      if v_error_code = "1" then
          SET v_error_code = "pdsecuT.4.3.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_判断交易组能否注销出现错误！',v_mysql_message);
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
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_公共接口_注销交易组转移资金持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_CancelExchGroupTransferCapitalPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_CancelExchGroupTransferCapitalPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_default_exch_group_no int,
    IN p_exch_group_no int,
    IN p_menu_no int,
    IN p_asset_acco_no_str varchar(2048),
    IN p_default_exch_group_no_str varchar(2048),
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
    declare v_pd_no int;
    declare v_default_exch_group_no int;
    declare v_exch_group_no int;
    declare v_menu_no int;
    declare v_asset_acco_no_str varchar(2048);
    declare v_default_exch_group_no_str varchar(2048);
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
    SET v_pd_no = p_pd_no;
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_menu_no = p_menu_no;
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_default_exch_group_no_str = p_default_exch_group_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_产品证券_公共接口_注销交易组转移资金】*/
      call db_pdsecu.pra_pdsepubif_TransferCapital(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_init_date,
          v_pd_no,
          v_default_exch_group_no,
          v_exch_group_no,
          v_menu_no,
          v_asset_acco_no_str,
          v_default_exch_group_no_str,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "pdsecuT.4.4.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_注销交易组转移资金出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


      /* 调用【原子_产品证券_公共接口_注销交易组转移持仓】*/
      call db_pdsecu.pra_pdsepubif_TransferPosi(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_init_date,
          v_pd_no,
          v_default_exch_group_no,
          v_exch_group_no,
          v_menu_no,
          v_asset_acco_no_str,
          v_default_exch_group_no_str,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "pdsecuT.4.4.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_注销交易组转移持仓出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_公共接口_估值更新累计应收应付
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_UpEvaluUpdateTotalRece;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_UpEvaluUpdateTotalRece(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_crncy_type varchar(3),
    IN p_total_rece_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_cash_id bigint,
    OUT p_exgp_begin_amt decimal(18,4),
    OUT p_exgp_curr_amt decimal(18,4),
    OUT p_exgp_frozen_amt decimal(18,4),
    OUT p_exgp_unfroz_amt decimal(18,4),
    OUT p_exgp_pre_settle_amt decimal(18,4),
    OUT p_exgp_shsz_avail_change_amt decimal(18,4),
    OUT p_exgp_hk_avail_change_amt decimal(18,4),
    OUT p_exgp_amt_check_diff decimal(18,4),
    OUT p_exgp_T_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_sell_total_amt decimal(18,4),
    OUT p_exch_group_total_rece_amt decimal(18,4),
    OUT p_exch_group_total_payab_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exch_group_intrst_rate decimal(18,4),
    OUT p_exch_group_intrst_base_amt decimal(18,4),
    OUT p_exch_group_pre_entry_intrst_amt decimal(18,4),
    OUT p_exch_group_update_times int,
    OUT p_asset_acco_no int,
    OUT p_asac_cash_id bigint,
    OUT p_asac_begin_amt decimal(18,4),
    OUT p_asac_curr_amt decimal(18,4),
    OUT p_asac_frozen_amt decimal(18,4),
    OUT p_asac_unfroz_amt decimal(18,4),
    OUT p_asac_pre_settle_amt decimal(18,4),
    OUT p_asac_shsz_avail_change_amt decimal(18,4),
    OUT p_asac_hk_avail_change_amt decimal(18,4),
    OUT p_asac_amt_check_diff decimal(18,4),
    OUT p_asac_T_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T_hk_sell_total_amt decimal(18,4),
    OUT p_asac_T1_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T1_hk_sell_total_amt decimal(18,4),
    OUT p_asac_total_rece_amt decimal(18,4),
    OUT p_asac_total_payab_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_rate decimal(18,4),
    OUT p_asac_intrst_base_amt decimal(18,4),
    OUT p_asac_pre_entry_intrst_amt decimal(18,4),
    OUT p_asac_update_times int
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_cash_id bigint;
    declare v_exgp_begin_amt decimal(18,4);
    declare v_exgp_curr_amt decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exgp_pre_settle_amt decimal(18,4);
    declare v_exgp_shsz_avail_change_amt decimal(18,4);
    declare v_exgp_hk_avail_change_amt decimal(18,4);
    declare v_exgp_amt_check_diff decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_exch_group_total_rece_amt decimal(18,4);
    declare v_exch_group_total_payab_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exch_group_intrst_rate decimal(18,4);
    declare v_exch_group_intrst_base_amt decimal(18,4);
    declare v_exch_group_pre_entry_intrst_amt decimal(18,4);
    declare v_exch_group_update_times int;
    declare v_asset_acco_no int;
    declare v_asac_cash_id bigint;
    declare v_asac_begin_amt decimal(18,4);
    declare v_asac_curr_amt decimal(18,4);
    declare v_asac_frozen_amt decimal(18,4);
    declare v_asac_unfroz_amt decimal(18,4);
    declare v_asac_pre_settle_amt decimal(18,4);
    declare v_asac_shsz_avail_change_amt decimal(18,4);
    declare v_asac_hk_avail_change_amt decimal(18,4);
    declare v_asac_amt_check_diff decimal(18,4);
    declare v_asac_T_hk_buy_total_amt decimal(18,4);
    declare v_asac_T_hk_sell_total_amt decimal(18,4);
    declare v_asac_T1_hk_buy_total_amt decimal(18,4);
    declare v_asac_T1_hk_sell_total_amt decimal(18,4);
    declare v_asac_total_rece_amt decimal(18,4);
    declare v_asac_total_payab_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_rate decimal(18,4);
    declare v_asac_intrst_base_amt decimal(18,4);
    declare v_asac_pre_entry_intrst_amt decimal(18,4);
    declare v_asac_update_times int;

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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_total_payab_amt = p_total_payab_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_cash_id = 0;
    SET v_exgp_begin_amt = 0;
    SET v_exgp_curr_amt = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exgp_pre_settle_amt = 0;
    SET v_exgp_shsz_avail_change_amt = 0;
    SET v_exgp_hk_avail_change_amt = 0;
    SET v_exgp_amt_check_diff = 0;
    SET v_exgp_T_hk_buy_total_amt = 0;
    SET v_exgp_T_hk_sell_total_amt = 0;
    SET v_exgp_T1_hk_buy_total_amt = 0;
    SET v_exgp_T1_hk_sell_total_amt = 0;
    SET v_exch_group_total_rece_amt = 0;
    SET v_exch_group_total_payab_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exch_group_intrst_rate = 0;
    SET v_exch_group_intrst_base_amt = 0;
    SET v_exch_group_pre_entry_intrst_amt = 0;
    SET v_exch_group_update_times = 0;
    SET v_asset_acco_no = 0;
    SET v_asac_cash_id = 0;
    SET v_asac_begin_amt = 0;
    SET v_asac_curr_amt = 0;
    SET v_asac_frozen_amt = 0;
    SET v_asac_unfroz_amt = 0;
    SET v_asac_pre_settle_amt = 0;
    SET v_asac_shsz_avail_change_amt = 0;
    SET v_asac_hk_avail_change_amt = 0;
    SET v_asac_amt_check_diff = 0;
    SET v_asac_T_hk_buy_total_amt = 0;
    SET v_asac_T_hk_sell_total_amt = 0;
    SET v_asac_T1_hk_buy_total_amt = 0;
    SET v_asac_T1_hk_sell_total_amt = 0;
    SET v_asac_total_rece_amt = 0;
    SET v_asac_total_payab_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_rate = 0;
    SET v_asac_intrst_base_amt = 0;
    SET v_asac_pre_entry_intrst_amt = 0;
    SET v_asac_update_times = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_估值更新累计应收应付】*/
        call db_pdsecu.pra_pdseca_EvaluUpdateTotalRece(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pd_no,
            v_exch_group_no,
            v_crncy_type,
            v_total_rece_amt,
            v_total_payab_amt,
            v_error_code,
            v_error_info,
            v_exgp_cash_id,
            v_exgp_begin_amt,
            v_exgp_curr_amt,
            v_exgp_frozen_amt,
            v_exgp_unfroz_amt,
            v_exgp_pre_settle_amt,
            v_exgp_shsz_avail_change_amt,
            v_exgp_hk_avail_change_amt,
            v_exgp_amt_check_diff,
            v_exgp_T_hk_buy_total_amt,
            v_exgp_T_hk_sell_total_amt,
            v_exgp_T1_hk_buy_total_amt,
            v_exgp_T1_hk_sell_total_amt,
            v_exch_group_total_rece_amt,
            v_exch_group_total_payab_amt,
            v_exgp_realize_pandl,
            v_exch_group_intrst_rate,
            v_exch_group_intrst_base_amt,
            v_exch_group_pre_entry_intrst_amt,
            v_exch_group_update_times,
            v_asset_acco_no,
            v_asac_cash_id,
            v_asac_begin_amt,
            v_asac_curr_amt,
            v_asac_frozen_amt,
            v_asac_unfroz_amt,
            v_asac_pre_settle_amt,
            v_asac_shsz_avail_change_amt,
            v_asac_hk_avail_change_amt,
            v_asac_amt_check_diff,
            v_asac_T_hk_buy_total_amt,
            v_asac_T_hk_sell_total_amt,
            v_asac_T1_hk_buy_total_amt,
            v_asac_T1_hk_sell_total_amt,
            v_asac_total_rece_amt,
            v_asac_total_payab_amt,
            v_asac_realize_pandl,
            v_asac_intrst_rate,
            v_asac_intrst_base_amt,
            v_asac_pre_entry_intrst_amt,
            v_asac_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.4.5.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_估值更新累计应收应付出现错误！',v_mysql_message);
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
    SET p_exgp_cash_id = v_exgp_cash_id;
    SET p_exgp_begin_amt = v_exgp_begin_amt;
    SET p_exgp_curr_amt = v_exgp_curr_amt;
    SET p_exgp_frozen_amt = v_exgp_frozen_amt;
    SET p_exgp_unfroz_amt = v_exgp_unfroz_amt;
    SET p_exgp_pre_settle_amt = v_exgp_pre_settle_amt;
    SET p_exgp_shsz_avail_change_amt = v_exgp_shsz_avail_change_amt;
    SET p_exgp_hk_avail_change_amt = v_exgp_hk_avail_change_amt;
    SET p_exgp_amt_check_diff = v_exgp_amt_check_diff;
    SET p_exgp_T_hk_buy_total_amt = v_exgp_T_hk_buy_total_amt;
    SET p_exgp_T_hk_sell_total_amt = v_exgp_T_hk_sell_total_amt;
    SET p_exgp_T1_hk_buy_total_amt = v_exgp_T1_hk_buy_total_amt;
    SET p_exgp_T1_hk_sell_total_amt = v_exgp_T1_hk_sell_total_amt;
    SET p_exch_group_total_rece_amt = v_exch_group_total_rece_amt;
    SET p_exch_group_total_payab_amt = v_exch_group_total_payab_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exch_group_intrst_rate = v_exch_group_intrst_rate;
    SET p_exch_group_intrst_base_amt = v_exch_group_intrst_base_amt;
    SET p_exch_group_pre_entry_intrst_amt = v_exch_group_pre_entry_intrst_amt;
    SET p_exch_group_update_times = v_exch_group_update_times;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_asac_cash_id = v_asac_cash_id;
    SET p_asac_begin_amt = v_asac_begin_amt;
    SET p_asac_curr_amt = v_asac_curr_amt;
    SET p_asac_frozen_amt = v_asac_frozen_amt;
    SET p_asac_unfroz_amt = v_asac_unfroz_amt;
    SET p_asac_pre_settle_amt = v_asac_pre_settle_amt;
    SET p_asac_shsz_avail_change_amt = v_asac_shsz_avail_change_amt;
    SET p_asac_hk_avail_change_amt = v_asac_hk_avail_change_amt;
    SET p_asac_amt_check_diff = v_asac_amt_check_diff;
    SET p_asac_T_hk_buy_total_amt = v_asac_T_hk_buy_total_amt;
    SET p_asac_T_hk_sell_total_amt = v_asac_T_hk_sell_total_amt;
    SET p_asac_T1_hk_buy_total_amt = v_asac_T1_hk_buy_total_amt;
    SET p_asac_T1_hk_sell_total_amt = v_asac_T1_hk_sell_total_amt;
    SET p_asac_total_rece_amt = v_asac_total_rece_amt;
    SET p_asac_total_payab_amt = v_asac_total_payab_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_rate = v_asac_intrst_rate;
    SET p_asac_intrst_base_amt = v_asac_intrst_base_amt;
    SET p_asac_pre_entry_intrst_amt = v_asac_pre_entry_intrst_amt;
    SET p_asac_update_times = v_asac_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_公共接口_查询获取交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_GetExgpCapit;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_GetExgpCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_cash_id bigint,
    OUT p_exch_group_no int,
    OUT p_exgp_begin_amt decimal(18,4),
    OUT p_exgp_curr_amt decimal(18,4),
    OUT p_exgp_frozen_amt decimal(18,4),
    OUT p_exgp_unfroz_amt decimal(18,4),
    OUT p_exgp_pre_settle_amt decimal(18,4),
    OUT p_exgp_shsz_avail_change_amt decimal(18,4),
    OUT p_exgp_hk_avail_change_amt decimal(18,4),
    OUT p_exgp_amt_check_diff decimal(18,4),
    OUT p_exgp_T_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_sell_total_amt decimal(18,4),
    OUT p_exch_group_total_rece_amt decimal(18,4),
    OUT p_exch_group_total_payab_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exch_group_intrst_rate decimal(18,4),
    OUT p_exch_group_intrst_base_amt decimal(18,4),
    OUT p_exch_group_pre_entry_intrst_amt decimal(18,4),
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
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_cash_id bigint;
    declare v_exch_group_no int;
    declare v_exgp_begin_amt decimal(18,4);
    declare v_exgp_curr_amt decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exgp_pre_settle_amt decimal(18,4);
    declare v_exgp_shsz_avail_change_amt decimal(18,4);
    declare v_exgp_hk_avail_change_amt decimal(18,4);
    declare v_exgp_amt_check_diff decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_exch_group_total_rece_amt decimal(18,4);
    declare v_exch_group_total_payab_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exch_group_intrst_rate decimal(18,4);
    declare v_exch_group_intrst_base_amt decimal(18,4);
    declare v_exch_group_pre_entry_intrst_amt decimal(18,4);
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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_cash_id = 0;
    SET v_exch_group_no = 0;
    SET v_exgp_begin_amt = 0;
    SET v_exgp_curr_amt = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exgp_pre_settle_amt = 0;
    SET v_exgp_shsz_avail_change_amt = 0;
    SET v_exgp_hk_avail_change_amt = 0;
    SET v_exgp_amt_check_diff = 0;
    SET v_exgp_T_hk_buy_total_amt = 0;
    SET v_exgp_T_hk_sell_total_amt = 0;
    SET v_exgp_T1_hk_buy_total_amt = 0;
    SET v_exgp_T1_hk_sell_total_amt = 0;
    SET v_exch_group_total_rece_amt = 0;
    SET v_exch_group_total_payab_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exch_group_intrst_rate = 0;
    SET v_exch_group_intrst_base_amt = 0;
    SET v_exch_group_pre_entry_intrst_amt = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_公共接口_查询获取交易组资金】*/
    call db_pdsecu.pra_pdsepubif_GetExgpCapit(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco_no,
        v_query_row_id,
        v_error_code,
        v_error_info,
        v_exgp_cash_id,
        v_exch_group_no,
        v_exgp_begin_amt,
        v_exgp_curr_amt,
        v_exgp_frozen_amt,
        v_exgp_unfroz_amt,
        v_exgp_pre_settle_amt,
        v_exgp_shsz_avail_change_amt,
        v_exgp_hk_avail_change_amt,
        v_exgp_amt_check_diff,
        v_exgp_T_hk_buy_total_amt,
        v_exgp_T_hk_sell_total_amt,
        v_exgp_T1_hk_buy_total_amt,
        v_exgp_T1_hk_sell_total_amt,
        v_exch_group_total_rece_amt,
        v_exch_group_total_payab_amt,
        v_exgp_realize_pandl,
        v_exch_group_intrst_rate,
        v_exch_group_intrst_base_amt,
        v_exch_group_pre_entry_intrst_amt,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.4.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_查询获取交易组资金出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_cash_id = v_exgp_cash_id;
    SET p_exch_group_no = v_exch_group_no;
    SET p_exgp_begin_amt = v_exgp_begin_amt;
    SET p_exgp_curr_amt = v_exgp_curr_amt;
    SET p_exgp_frozen_amt = v_exgp_frozen_amt;
    SET p_exgp_unfroz_amt = v_exgp_unfroz_amt;
    SET p_exgp_pre_settle_amt = v_exgp_pre_settle_amt;
    SET p_exgp_shsz_avail_change_amt = v_exgp_shsz_avail_change_amt;
    SET p_exgp_hk_avail_change_amt = v_exgp_hk_avail_change_amt;
    SET p_exgp_amt_check_diff = v_exgp_amt_check_diff;
    SET p_exgp_T_hk_buy_total_amt = v_exgp_T_hk_buy_total_amt;
    SET p_exgp_T_hk_sell_total_amt = v_exgp_T_hk_sell_total_amt;
    SET p_exgp_T1_hk_buy_total_amt = v_exgp_T1_hk_buy_total_amt;
    SET p_exgp_T1_hk_sell_total_amt = v_exgp_T1_hk_sell_total_amt;
    SET p_exch_group_total_rece_amt = v_exch_group_total_rece_amt;
    SET p_exch_group_total_payab_amt = v_exch_group_total_payab_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exch_group_intrst_rate = v_exch_group_intrst_rate;
    SET p_exch_group_intrst_base_amt = v_exch_group_intrst_base_amt;
    SET p_exch_group_pre_entry_intrst_amt = v_exch_group_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_公共接口_检查股东账户状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_CheckStockAccoStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_CheckStockAccoStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16)
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
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);

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
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_公共接口_检查股东账户状态】*/
    call db_pdsecu.pra_pdsepubif_CheckStockAccoStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_type,
        v_order_dir,
        v_error_code,
        v_error_info,
        v_stock_acco_no,
        v_stock_acco);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.4.101.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_检查股东账户状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_公共接口_检查账户状态持仓可用数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_CheckStockAccoStatusAvailAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_CheckStockAccoStatusAvailAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_avail_qty decimal(18,2),
    OUT p_asac_avail_qty decimal(18,2)
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);

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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_avail_qty = 0;
    SET v_asac_avail_qty = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_公共接口_检查账户状态持仓可用数量】*/
    call db_pdsecu.pra_pdsepubif_CheckStockAccoStatusAvailAmt(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_stock_type,
        v_order_dir,
        v_error_code,
        v_error_info,
        v_exgp_avail_qty,
        v_asac_avail_qty);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.4.102.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_检查账户状态持仓可用数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_avail_qty = v_exgp_avail_qty;
    SET p_asac_avail_qty = v_asac_avail_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_公共接口_事务提交
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_TransactionCommit;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_TransactionCommit(
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
    
    commit;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_公共接口_新增银证转账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_AddBankTransferRecord;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_AddBankTransferRecord(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_trans_date int,
    IN p_trans_time int,
    IN p_bank_name varchar(64),
    IN p_bank_code varchar(32),
    IN p_busi_flag int,
    IN p_occur_amt decimal(18,4),
    IN p_crncy_type varchar(3),
    IN p_trans_status varchar(2),
    IN p_bank_jour_no varchar(64),
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_group_no int,
    OUT p_exch_group_no_str varchar(2048),
    OUT p_record_count int
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_trans_date int;
    declare v_trans_time int;
    declare v_bank_name varchar(64);
    declare v_bank_code varchar(32);
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_trans_status varchar(2);
    declare v_bank_jour_no varchar(64);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no int;
    declare v_exch_group_no_str varchar(2048);
    declare v_record_count int;

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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_trans_date = p_trans_date;
    SET v_trans_time = p_trans_time;
    SET v_bank_name = p_bank_name;
    SET v_bank_code = p_bank_code;
    SET v_busi_flag = p_busi_flag;
    SET v_occur_amt = p_occur_amt;
    SET v_crncy_type = p_crncy_type;
    SET v_trans_status = p_trans_status;
    SET v_bank_jour_no = p_bank_jour_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;
    SET v_exch_group_no_str = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_新增银证转账记录】*/
        call db_pdsecu.pra_pdseca_AddBankTransferRecord(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_trans_date,
            v_trans_time,
            v_bank_name,
            v_bank_code,
            v_busi_flag,
            v_occur_amt,
            v_crncy_type,
            v_trans_status,
            v_bank_jour_no,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.4.104.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_新增银证转账记录出现错误！',v_mysql_message);
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
    SET p_exch_group_no = v_exch_group_no;
    SET p_exch_group_no_str = v_exch_group_no_str;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_公共接口_处理银证转账资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_DealBankTransferCapit;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_DealBankTransferCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_default_exch_group_no int,
    IN p_occur_amt decimal(18,4),
    IN p_busi_flag int,
    IN p_crncy_type varchar(3),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asac_cash_id bigint,
    OUT p_asac_begin_amt decimal(18,4),
    OUT p_asac_curr_amt decimal(18,4),
    OUT p_asac_frozen_amt decimal(18,4),
    OUT p_asac_unfroz_amt decimal(18,4),
    OUT p_asac_pre_settle_amt decimal(18,4),
    OUT p_asac_shsz_avail_change_amt decimal(18,4),
    OUT p_asac_hk_avail_change_amt decimal(18,4),
    OUT p_asac_amt_check_diff decimal(18,4),
    OUT p_asac_T_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T_hk_sell_total_amt decimal(18,4),
    OUT p_asac_T1_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T1_hk_sell_total_amt decimal(18,4),
    OUT p_asac_total_rece_amt decimal(18,4),
    OUT p_asac_total_payab_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_rate decimal(18,4),
    OUT p_asac_intrst_base_amt decimal(18,4),
    OUT p_asac_pre_entry_intrst_amt decimal(18,4),
    OUT p_update_times int,
    OUT p_exgp_cash_id bigint,
    OUT p_exgp_begin_amt decimal(18,4),
    OUT p_exgp_curr_amt decimal(18,4),
    OUT p_exgp_frozen_amt decimal(18,4),
    OUT p_exgp_unfroz_amt decimal(18,4),
    OUT p_exgp_pre_settle_amt decimal(18,4),
    OUT p_exgp_shsz_avail_change_amt decimal(18,4),
    OUT p_exgp_hk_avail_change_amt decimal(18,4),
    OUT p_exgp_amt_check_diff decimal(18,4),
    OUT p_exgp_T_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_sell_total_amt decimal(18,4),
    OUT p_exch_group_total_rece_amt decimal(18,4),
    OUT p_exch_group_total_payab_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exch_group_intrst_rate decimal(18,4),
    OUT p_exch_group_intrst_base_amt decimal(18,4),
    OUT p_exch_group_pre_entry_intrst_amt decimal(18,4),
    OUT p_exch_group_update_times int
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_default_exch_group_no int;
    declare v_occur_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_crncy_type varchar(3);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asac_cash_id bigint;
    declare v_asac_begin_amt decimal(18,4);
    declare v_asac_curr_amt decimal(18,4);
    declare v_asac_frozen_amt decimal(18,4);
    declare v_asac_unfroz_amt decimal(18,4);
    declare v_asac_pre_settle_amt decimal(18,4);
    declare v_asac_shsz_avail_change_amt decimal(18,4);
    declare v_asac_hk_avail_change_amt decimal(18,4);
    declare v_asac_amt_check_diff decimal(18,4);
    declare v_asac_T_hk_buy_total_amt decimal(18,4);
    declare v_asac_T_hk_sell_total_amt decimal(18,4);
    declare v_asac_T1_hk_buy_total_amt decimal(18,4);
    declare v_asac_T1_hk_sell_total_amt decimal(18,4);
    declare v_asac_total_rece_amt decimal(18,4);
    declare v_asac_total_payab_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_rate decimal(18,4);
    declare v_asac_intrst_base_amt decimal(18,4);
    declare v_asac_pre_entry_intrst_amt decimal(18,4);
    declare v_update_times int;
    declare v_exgp_cash_id bigint;
    declare v_exgp_begin_amt decimal(18,4);
    declare v_exgp_curr_amt decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exgp_pre_settle_amt decimal(18,4);
    declare v_exgp_shsz_avail_change_amt decimal(18,4);
    declare v_exgp_hk_avail_change_amt decimal(18,4);
    declare v_exgp_amt_check_diff decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_exch_group_total_rece_amt decimal(18,4);
    declare v_exch_group_total_payab_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exch_group_intrst_rate decimal(18,4);
    declare v_exch_group_intrst_base_amt decimal(18,4);
    declare v_exch_group_pre_entry_intrst_amt decimal(18,4);
    declare v_exch_group_update_times int;

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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_occur_amt = p_occur_amt;
    SET v_busi_flag = p_busi_flag;
    SET v_crncy_type = p_crncy_type;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asac_cash_id = 0;
    SET v_asac_begin_amt = 0;
    SET v_asac_curr_amt = 0;
    SET v_asac_frozen_amt = 0;
    SET v_asac_unfroz_amt = 0;
    SET v_asac_pre_settle_amt = 0;
    SET v_asac_shsz_avail_change_amt = 0;
    SET v_asac_hk_avail_change_amt = 0;
    SET v_asac_amt_check_diff = 0;
    SET v_asac_T_hk_buy_total_amt = 0;
    SET v_asac_T_hk_sell_total_amt = 0;
    SET v_asac_T1_hk_buy_total_amt = 0;
    SET v_asac_T1_hk_sell_total_amt = 0;
    SET v_asac_total_rece_amt = 0;
    SET v_asac_total_payab_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_rate = 0;
    SET v_asac_intrst_base_amt = 0;
    SET v_asac_pre_entry_intrst_amt = 0;
    SET v_update_times = 1;
    SET v_exgp_cash_id = 0;
    SET v_exgp_begin_amt = 0;
    SET v_exgp_curr_amt = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exgp_pre_settle_amt = 0;
    SET v_exgp_shsz_avail_change_amt = 0;
    SET v_exgp_hk_avail_change_amt = 0;
    SET v_exgp_amt_check_diff = 0;
    SET v_exgp_T_hk_buy_total_amt = 0;
    SET v_exgp_T_hk_sell_total_amt = 0;
    SET v_exgp_T1_hk_buy_total_amt = 0;
    SET v_exgp_T1_hk_sell_total_amt = 0;
    SET v_exch_group_total_rece_amt = 0;
    SET v_exch_group_total_payab_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exch_group_intrst_rate = 0;
    SET v_exch_group_intrst_base_amt = 0;
    SET v_exch_group_pre_entry_intrst_amt = 0;
    SET v_exch_group_update_times = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_公共接口_处理银证转账资金】*/
        call db_pdsecu.pra_pdsepubif_DealBankTransferCapit(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_asset_acco_no,
            v_default_exch_group_no,
            v_occur_amt,
            v_busi_flag,
            v_crncy_type,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_asac_cash_id,
            v_asac_begin_amt,
            v_asac_curr_amt,
            v_asac_frozen_amt,
            v_asac_unfroz_amt,
            v_asac_pre_settle_amt,
            v_asac_shsz_avail_change_amt,
            v_asac_hk_avail_change_amt,
            v_asac_amt_check_diff,
            v_asac_T_hk_buy_total_amt,
            v_asac_T_hk_sell_total_amt,
            v_asac_T1_hk_buy_total_amt,
            v_asac_T1_hk_sell_total_amt,
            v_asac_total_rece_amt,
            v_asac_total_payab_amt,
            v_asac_realize_pandl,
            v_asac_intrst_rate,
            v_asac_intrst_base_amt,
            v_asac_pre_entry_intrst_amt,
            v_update_times,
            v_exgp_cash_id,
            v_exgp_begin_amt,
            v_exgp_curr_amt,
            v_exgp_frozen_amt,
            v_exgp_unfroz_amt,
            v_exgp_pre_settle_amt,
            v_exgp_shsz_avail_change_amt,
            v_exgp_hk_avail_change_amt,
            v_exgp_amt_check_diff,
            v_exgp_T_hk_buy_total_amt,
            v_exgp_T_hk_sell_total_amt,
            v_exgp_T1_hk_buy_total_amt,
            v_exgp_T1_hk_sell_total_amt,
            v_exch_group_total_rece_amt,
            v_exch_group_total_payab_amt,
            v_exgp_realize_pandl,
            v_exch_group_intrst_rate,
            v_exch_group_intrst_base_amt,
            v_exch_group_pre_entry_intrst_amt,
            v_exch_group_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.4.105.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_处理银证转账资金出现错误！',v_mysql_message);
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
    SET p_asac_cash_id = v_asac_cash_id;
    SET p_asac_begin_amt = v_asac_begin_amt;
    SET p_asac_curr_amt = v_asac_curr_amt;
    SET p_asac_frozen_amt = v_asac_frozen_amt;
    SET p_asac_unfroz_amt = v_asac_unfroz_amt;
    SET p_asac_pre_settle_amt = v_asac_pre_settle_amt;
    SET p_asac_shsz_avail_change_amt = v_asac_shsz_avail_change_amt;
    SET p_asac_hk_avail_change_amt = v_asac_hk_avail_change_amt;
    SET p_asac_amt_check_diff = v_asac_amt_check_diff;
    SET p_asac_T_hk_buy_total_amt = v_asac_T_hk_buy_total_amt;
    SET p_asac_T_hk_sell_total_amt = v_asac_T_hk_sell_total_amt;
    SET p_asac_T1_hk_buy_total_amt = v_asac_T1_hk_buy_total_amt;
    SET p_asac_T1_hk_sell_total_amt = v_asac_T1_hk_sell_total_amt;
    SET p_asac_total_rece_amt = v_asac_total_rece_amt;
    SET p_asac_total_payab_amt = v_asac_total_payab_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_rate = v_asac_intrst_rate;
    SET p_asac_intrst_base_amt = v_asac_intrst_base_amt;
    SET p_asac_pre_entry_intrst_amt = v_asac_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;
    SET p_exgp_cash_id = v_exgp_cash_id;
    SET p_exgp_begin_amt = v_exgp_begin_amt;
    SET p_exgp_curr_amt = v_exgp_curr_amt;
    SET p_exgp_frozen_amt = v_exgp_frozen_amt;
    SET p_exgp_unfroz_amt = v_exgp_unfroz_amt;
    SET p_exgp_pre_settle_amt = v_exgp_pre_settle_amt;
    SET p_exgp_shsz_avail_change_amt = v_exgp_shsz_avail_change_amt;
    SET p_exgp_hk_avail_change_amt = v_exgp_hk_avail_change_amt;
    SET p_exgp_amt_check_diff = v_exgp_amt_check_diff;
    SET p_exgp_T_hk_buy_total_amt = v_exgp_T_hk_buy_total_amt;
    SET p_exgp_T_hk_sell_total_amt = v_exgp_T_hk_sell_total_amt;
    SET p_exgp_T1_hk_buy_total_amt = v_exgp_T1_hk_buy_total_amt;
    SET p_exgp_T1_hk_sell_total_amt = v_exgp_T1_hk_sell_total_amt;
    SET p_exch_group_total_rece_amt = v_exch_group_total_rece_amt;
    SET p_exch_group_total_payab_amt = v_exch_group_total_payab_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exch_group_intrst_rate = v_exch_group_intrst_rate;
    SET p_exch_group_intrst_base_amt = v_exch_group_intrst_base_amt;
    SET p_exch_group_pre_entry_intrst_amt = v_exch_group_pre_entry_intrst_amt;
    SET p_exch_group_update_times = v_exch_group_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_公共接口_获取大宗交易持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_GetBlockTradeposi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_GetBlockTradeposi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_posi_id bigint,
    OUT p_asset_acco_no int,
    OUT p_exch_group_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_price decimal(16,9),
    OUT p_fair_price decimal(16,9),
    OUT p_strike_date int,
    OUT p_release_date int,
    OUT p_deal_status varchar(2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_query_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_posi_id bigint;
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
    SET v_query_row_id = p_query_row_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_posi_id = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_group_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_strike_qty = 0;
    SET v_strike_price = 0;
    SET v_fair_price = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_release_date = 0;
    SET v_deal_status = "0";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_公共接口_获取大宗交易持仓】*/
    call db_pdsecu.pra_pdsepubif_GetBlockTradeposi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_row_id,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_row_id,
        v_posi_id,
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
        v_deal_status);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.4.106.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_获取大宗交易持仓出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_posi_id = v_posi_id;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_price = v_strike_price;
    SET p_fair_price = v_fair_price;
    SET p_strike_date = v_strike_date;
    SET p_release_date = v_release_date;
    SET p_deal_status = v_deal_status;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_公共接口_更新大宗交易持仓公允价格
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_GetBlockTradeposiFairPrice;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_GetBlockTradeposiFairPrice(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_posi_id bigint,
    IN p_fair_price decimal(16,9),
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
    declare v_fair_price decimal(16,9);
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
    SET v_fair_price = p_fair_price;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_公共接口_更新大宗交易持仓公允价格】*/
    call db_pdsecu.pra_pdsepubif_GetBlockTradeposiFairPrice(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_posi_id,
        v_fair_price,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.4.107.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_更新大宗交易持仓公允价格出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_公共接口_注销交易组回退资产账户资金持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_CancelExchGroupRollBackAsacCapitalPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_CancelExchGroupRollBackAsacCapitalPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asset_acco_str varchar(2048),
    OUT p_curr_amt decimal(18,4),
    OUT p_amt_check_diff decimal(18,4),
    OUT p_total_rece_amt decimal(18,4),
    OUT p_total_payab_amt decimal(18,4),
    OUT p_total_change_amt decimal(18,4)
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco_str varchar(2048);
    declare v_curr_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);

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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco_str = " ";
    SET v_curr_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_change_amt = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_产品证券_公共接口_注销交易组回退资产账户资金】*/
      call db_pdsecu.pra_pdsepubif_CancelExchGroupRollBackAsacCapital(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_init_date,
          v_co_no,
          v_pd_no,
          v_exch_group_no,
          v_menu_no,
          v_error_code,
          v_error_info,
          v_asset_acco_str,
          v_curr_amt,
          v_amt_check_diff,
          v_total_rece_amt,
          v_total_payab_amt,
          v_total_change_amt);
      if v_error_code = "1" then
          SET v_error_code = "pdsecuT.4.108.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_注销交易组回退资产账户资金出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


      /* 调用【原子_产品证券_公共接口_注销交易组回退资产账户持仓】*/
      call db_pdsecu.pra_pdsepubif_CancelExchGroupRollBackAsacPosi(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_init_date,
          v_co_no,
          v_pd_no,
          v_exch_group_no,
          v_menu_no,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "pdsecuT.4.108.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_注销交易组回退资产账户持仓出现错误！',v_mysql_message);
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
    SET p_asset_acco_str = v_asset_acco_str;
    SET p_curr_amt = v_curr_amt;
    SET p_amt_check_diff = v_amt_check_diff;
    SET p_total_rece_amt = v_total_rece_amt;
    SET p_total_payab_amt = v_total_payab_amt;
    SET p_total_change_amt = v_total_change_amt;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_公共接口_查询交易组资金信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_QueryExgpCapitInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_QueryExgpCapitInfo(
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_公共接口_查询交易组资金信息】*/
    call db_pdsecu.pra_pdsepubif_QueryExgpCapitInfo(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.4.109.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_查询交易组资金信息出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_公共接口_查询交易组持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_QueryExgpPosiInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_QueryExgpPosiInfo(
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_公共接口_查询交易组持仓信息】*/
    call db_pdsecu.pra_pdsepubif_QueryExgpPosiInfo(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.4.110.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_查询交易组持仓信息出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_公共接口_查询资产账户资金信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_QueryAsacCapitInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_QueryAsacCapitInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_crncy_type varchar(3),
    IN p_asset_acco_str varchar(2048),
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
    declare v_crncy_type varchar(3);
    declare v_asset_acco_str varchar(2048);
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
    SET v_crncy_type = p_crncy_type;
    SET v_asset_acco_str = p_asset_acco_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_公共接口_查询资产账户资金信息】*/
    call db_pdsecu.pra_pdsepubif_QueryAsacCapitInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_crncy_type,
        v_asset_acco_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.4.111.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_查询资产账户资金信息出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_公共接口_查询资产账户持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_QueryAsacPosiInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_QueryAsacPosiInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_str varchar(2048),
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
    declare v_asset_acco_str varchar(2048);
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
    SET v_asset_acco_str = p_asset_acco_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_公共接口_查询资产账户持仓信息】*/
    call db_pdsecu.pra_pdsepubif_QueryAsacPosiInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_asset_acco_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.4.112.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_查询资产账户持仓信息出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_公共接口_查询交易组大宗持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_QueryExgpBlockTradePosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_QueryExgpBlockTradePosi(
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_公共接口_查询交易组大宗持仓】*/
    call db_pdsecu.pra_pdsepubif_QueryExgpBlockTradePosi(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.4.113.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_查询交易组大宗持仓出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_公共接口_资产账户获取股东代码编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_AsacGetStockAccoNo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_AsacGetStockAccoNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_acco_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_no int;

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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_账户_资产账户获取股东代码编号】*/
    call db_pdsecu.pra_pdseac_AsacGetStockAccoNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_asset_acco_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_stock_acco_no);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.4.114.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_账户_资产账户获取股东代码编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_acco_no = v_stock_acco_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_公共接口_批量调整交易组持仓成本
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_BatchUpdateExgpPosiCost;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_BatchUpdateExgpPosiCost(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_invest_type int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_cost_amt decimal(18,4),
    IN p_intrst_cost_amt decimal(18,4),
    IN p_trd_cost_amt decimal(18,4),
    IN p_trd_intrst_cost_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_posi_id bigint,
    OUT p_exch_group_stock_type int,
    OUT p_exch_group_asset_type int,
    OUT p_exgp_invest_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_pre_settle_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_posi_qty_check_diff decimal(18,2),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_intrst_pandl decimal(18,4),
    OUT p_exch_group_update_times int,
    OUT p_asac_posi_id bigint,
    OUT p_asac_stock_type int,
    OUT p_asac_asset_type int,
    OUT p_asac_invest_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_pre_settle_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_posi_qty_check_diff decimal(18,2),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_intrst_pandl decimal(18,4),
    OUT p_asac_update_times int
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_invest_type int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_trd_cost_amt decimal(18,4);
    declare v_trd_intrst_cost_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exch_group_stock_type int;
    declare v_exch_group_asset_type int;
    declare v_exgp_invest_type int;
    declare v_exch_group_begin_qty decimal(18,2);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_exgp_pre_settle_qty decimal(18,2);
    declare v_exgp_frozen_qty decimal(18,2);
    declare v_exgp_unfroz_qty decimal(18,2);
    declare v_exgp_posi_qty_check_diff decimal(18,2);
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_intrst_pandl decimal(18,4);
    declare v_exch_group_update_times int;
    declare v_asac_posi_id bigint;
    declare v_asac_stock_type int;
    declare v_asac_asset_type int;
    declare v_asac_invest_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_pre_settle_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_posi_qty_check_diff decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_asac_update_times int;

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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_invest_type = p_invest_type;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_cost_amt = p_cost_amt;
    SET v_intrst_cost_amt = p_intrst_cost_amt;
    SET v_trd_cost_amt = p_trd_cost_amt;
    SET v_trd_intrst_cost_amt = p_trd_intrst_cost_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exch_group_stock_type = 0;
    SET v_exch_group_asset_type = 0;
    SET v_exgp_invest_type = 0;
    SET v_exch_group_begin_qty = 0;
    SET v_exgp_curr_qty = 0;
    SET v_exgp_pre_settle_qty = 0;
    SET v_exgp_frozen_qty = 0;
    SET v_exgp_unfroz_qty = 0;
    SET v_exgp_posi_qty_check_diff = 0;
    SET v_exgp_cost_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exgp_intrst_cost_amt = 0;
    SET v_exgp_intrst_pandl = 0;
    SET v_exch_group_update_times = 0;
    SET v_asac_posi_id = 0;
    SET v_asac_stock_type = 0;
    SET v_asac_asset_type = 0;
    SET v_asac_invest_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_pre_settle_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_posi_qty_check_diff = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_asac_update_times = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_持仓_批量调整交易组持仓成本】*/
        call db_pdsecu.pra_pdsepo_BatchUpdateExgpPosiCost(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_stock_acco_no,
            v_stock_type,
            v_asset_type,
            v_invest_type,
            v_exch_no,
            v_stock_code_no,
            v_cost_amt,
            v_intrst_cost_amt,
            v_trd_cost_amt,
            v_trd_intrst_cost_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_exgp_posi_id,
            v_exch_group_stock_type,
            v_exch_group_asset_type,
            v_exgp_invest_type,
            v_exch_group_begin_qty,
            v_exgp_curr_qty,
            v_exgp_pre_settle_qty,
            v_exgp_frozen_qty,
            v_exgp_unfroz_qty,
            v_exgp_posi_qty_check_diff,
            v_exgp_cost_amt,
            v_exgp_realize_pandl,
            v_exgp_intrst_cost_amt,
            v_exgp_intrst_pandl,
            v_exch_group_update_times,
            v_asac_posi_id,
            v_asac_stock_type,
            v_asac_asset_type,
            v_asac_invest_type,
            v_asac_begin_qty,
            v_asac_curr_qty,
            v_asac_pre_settle_qty,
            v_asac_frozen_qty,
            v_asac_unfroz_qty,
            v_asac_posi_qty_check_diff,
            v_asac_cost_amt,
            v_asac_realize_pandl,
            v_asac_intrst_cost_amt,
            v_asac_intrst_pandl,
            v_asac_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.4.115.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_持仓_批量调整交易组持仓成本出现错误！',v_mysql_message);
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
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exch_group_stock_type = v_exch_group_stock_type;
    SET p_exch_group_asset_type = v_exch_group_asset_type;
    SET p_exgp_invest_type = v_exgp_invest_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_pre_settle_qty = v_exgp_pre_settle_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_posi_qty_check_diff = v_exgp_posi_qty_check_diff;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_intrst_pandl = v_exgp_intrst_pandl;
    SET p_exch_group_update_times = v_exch_group_update_times;
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_stock_type = v_asac_stock_type;
    SET p_asac_asset_type = v_asac_asset_type;
    SET p_asac_invest_type = v_asac_invest_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_pre_settle_qty = v_asac_pre_settle_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_posi_qty_check_diff = v_asac_posi_qty_check_diff;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_intrst_pandl = v_asac_intrst_pandl;
    SET p_asac_update_times = v_asac_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_公共接口_获取注销股东代码串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_GetCancelStockAccoStr;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_GetCancelStockAccoStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_acco_str varchar(2048)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_str varchar(2048);

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_公共接口_获取注销股东代码串】*/
    call db_pdsecu.pra_pdsepubif_GetCancelStockAccoStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_stock_acco_str);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.4.116.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_获取注销股东代码串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_acco_str = v_stock_acco_str;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_公共接口_查询默认交易组大宗持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_QueryDefaultExgpBlockTradePosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_QueryDefaultExgpBlockTradePosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_default_exch_group_no_str varchar(2048),
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
    declare v_default_exch_group_no_str varchar(2048);
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
    SET v_default_exch_group_no_str = p_default_exch_group_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_公共接口_查询默认交易组大宗持仓】*/
    call db_pdsecu.pra_pdsepubif_QueryDefaultExgpBlockTradePosi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_default_exch_group_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.4.117.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_查询默认交易组大宗持仓出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_公共接口_估值更新大宗交易持仓公允价格
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_EvaUpdateBlockTradeposiFairPrice;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_EvaUpdateBlockTradeposiFairPrice(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_fair_price decimal(16,9),
    IN p_init_date int,
    IN p_menu_no int,
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
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_fair_price decimal(16,9);
    declare v_init_date int;
    declare v_menu_no int;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_fair_price = p_fair_price;
    SET v_init_date = p_init_date;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_公共接口_估值更新大宗交易持仓公允价格】*/
        call db_pdsecu.pra_pdsepubif_EvaUpdateBlockTradeposiFairPrice(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_exch_no,
            v_stock_code_no,
            v_fair_price,
            v_init_date,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.4.118.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_估值更新大宗交易持仓公允价格出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_公共接口_查询产品大宗持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_QueryProdBlockTradePosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_QueryProdBlockTradePosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_公共接口_查询产品大宗持仓】*/
    call db_pdsecu.pra_pdsepubif_QueryProdBlockTradePosi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.4.119.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_查询产品大宗持仓出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_公共接口_判断交易组在途业务
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_CheckExgpOnWayBusiness;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_CheckExgpOnWayBusiness(
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
    IN p_exch_group_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int
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
    declare v_exch_group_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;

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
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_产品证券_公共接口_判断交易组在途业务】*/
      call db_pdsecu.pra_pdsepubif_CheckExgpOnWayBusiness(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_pd_no,
          v_asset_acco_no,
          v_exch_group_no,
          v_error_code,
          v_error_info,
          v_record_count);
      if v_error_code = "1" then
          SET v_error_code = "pdsecuT.4.120.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_判断交易组在途业务出现错误！',v_mysql_message);
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
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_公共接口_转移交易组资金持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_TransferExchGroupCapitalPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_TransferExchGroupCapitalPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_default_exch_group_no int,
    IN p_exch_group_no int,
    IN p_menu_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_default_exch_group_no int;
    declare v_exch_group_no int;
    declare v_menu_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_产品证券_公共接口_转移交易组资金】*/
      call db_pdsecu.pra_pdsepubif_TransferExgpCapital(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_init_date,
          v_co_no,
          v_pd_no,
          v_asset_acco_no,
          v_default_exch_group_no,
          v_exch_group_no,
          v_menu_no,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "pdsecuT.4.121.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_转移交易组资金出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


      /* 调用【原子_产品证券_公共接口_转移交易组持仓】*/
      call db_pdsecu.pra_pdsepubif_TransferExgpPosi(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_init_date,
          v_co_no,
          v_pd_no,
          v_asset_acco_no,
          v_default_exch_group_no,
          v_exch_group_no,
          v_menu_no,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "pdsecuT.4.121.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_公共接口_转移交易组持仓出现错误！',v_mysql_message);
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


