DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_公用_更新报盘机状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfupb_offer_update;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfupb_offer_update(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_pass_status varchar(2),
    IN p_offer_name varchar(32),
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
    declare v_pass_no int;
    declare v_pass_status varchar(2);
    declare v_offer_name varchar(32);
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
    SET v_pass_no = p_pass_no;
    SET v_pass_status = p_pass_status;
    SET v_offer_name = p_offer_name;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易期货_公用_更新报盘机状态】*/
        call db_tdfutu.pra_tdfupb_UpdateOfferStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pass_no,
            v_pass_status,
            v_offer_name,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.1.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_公用_更新报盘机状态出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_公用_获取业务记录编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfupb_GetCoBusiRecordNo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfupb_GetCoBusiRecordNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_record_no_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_curr_no bigint
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
    declare v_record_no_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_no bigint;

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
    SET v_record_no_type = p_record_no_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易期货_公用_获取业务记录编号】*/
        call db_tdfutu.pra_tdfupb_GetCoBusiRecordNo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_record_no_type,
            v_error_code,
            v_error_info,
            v_curr_no);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.1.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_公用_获取业务记录编号出现错误！',v_mysql_message);
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
    SET p_curr_no = v_curr_no;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_公用_数据归历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfupb_DataToHis;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfupb_DataToHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_next_init_date int,
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
    declare v_next_init_date int;
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
    SET v_next_init_date = p_next_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易期货_公用_数据归历史】*/
        call db_tdfutu.pra_tdfupb_DataToHis(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_next_init_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.1.3.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_公用_数据归历史出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_公用_指令保证金重算
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfupb_CommMarginCalc;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfupb_CommMarginCalc(
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
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_type int,
    IN p_asset_type int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_comm_date int,
    IN p_comm_time int,
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_dir int,
    IN p_comm_limit_price decimal(16,9),
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_qty decimal(18,2),
    IN p_comm_amt decimal(18,4),
    IN p_order_qty decimal(18,2),
    IN p_comm_cancel_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_qty decimal(18,2),
    IN p_comm_frozen_amt decimal(18,4),
    IN p_comm_frozen_qty decimal(18,2),
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_strike_status varchar(2),
    IN p_comm_status varchar(2),
    IN p_comm_begin_date int,
    IN p_comm_end_date int,
    IN p_comm_begin_time int,
    IN p_comm_end_time int,
    IN p_comm_comple_date int,
    IN p_comm_comple_time int,
    IN p_comm_appr_date int,
    IN p_comm_appr_time int,
    IN p_comm_appr_status varchar(2),
    IN p_comm_appr_oper_no int,
    IN p_comm_appr_oper int,
    IN p_comm_appr_remark varchar(255),
    IN p_external_no bigint,
    IN p_comb_code varchar(6),
    IN p_comm_oper_way varchar(2),
    IN p_remark_info varchar(255),
    IN p_update_times int,
    IN p_oper_func_code varchar(16),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_rece_margin decimal(18,4),
    IN p_exgp_avail_amt decimal(18,4),
    IN p_asac_avail_amt decimal(18,4),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    IN p_exgp_long_rece_margin decimal(18,4),
    IN p_exgp_short_rece_margin decimal(18,4),
    IN p_asac_long_rece_margin decimal(18,4),
    IN p_asac_short_rece_margin decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_comm_date int;
    declare v_comm_time int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_strike_status varchar(2);
    declare v_comm_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_appr_status varchar(2);
    declare v_comm_appr_oper_no int;
    declare v_comm_appr_oper int;
    declare v_comm_appr_remark varchar(255);
    declare v_external_no bigint;
    declare v_comb_code varchar(6);
    declare v_comm_oper_way varchar(2);
    declare v_remark_info varchar(255);
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_rece_margin decimal(18,4);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_exgp_long_rece_margin decimal(18,4);
    declare v_exgp_short_rece_margin decimal(18,4);
    declare v_asac_long_rece_margin decimal(18,4);
    declare v_asac_short_rece_margin decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_order_dir int;
    declare v_contrc_unit int;
    declare v_lngsht_type int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_comm_margin decimal(18,4);
    declare v_order_margin decimal(18,4);
    declare v_strike_margin decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_invest_type int;
    declare v_pre_settle_price decimal(16,9);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_long_comm_margin decimal(18,4);
    declare v_short_comm_margin decimal(18,4);
    declare v_long_order_margin decimal(18,4);
    declare v_short_order_margin decimal(18,4);
    declare v_long_strike_margin decimal(18,4);
    declare v_short_strike_margin decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_posi_capt_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_strike_occur_amt decimal(18,4);
    declare v_comm_occur_amt decimal(18,4);
    declare v_trade_capt_amt_after decimal(18,4);
    declare v_posi_capt_amt_after decimal(18,4);
    declare v_comm_capt_amt_after decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_strike_capt_amt decimal(18,4);

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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_type = p_contrc_type;
    SET v_asset_type = p_asset_type;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_comm_date = p_comm_date;
    SET v_comm_time = p_comm_time;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_dir = p_comm_dir;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_qty = p_comm_qty;
    SET v_comm_amt = p_comm_amt;
    SET v_order_qty = p_order_qty;
    SET v_comm_cancel_qty = p_comm_cancel_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_qty = p_strike_qty;
    SET v_comm_frozen_amt = p_comm_frozen_amt;
    SET v_comm_frozen_qty = p_comm_frozen_qty;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_strike_status = p_strike_status;
    SET v_comm_status = p_comm_status;
    SET v_comm_begin_date = p_comm_begin_date;
    SET v_comm_end_date = p_comm_end_date;
    SET v_comm_begin_time = p_comm_begin_time;
    SET v_comm_end_time = p_comm_end_time;
    SET v_comm_comple_date = p_comm_comple_date;
    SET v_comm_comple_time = p_comm_comple_time;
    SET v_comm_appr_date = p_comm_appr_date;
    SET v_comm_appr_time = p_comm_appr_time;
    SET v_comm_appr_status = p_comm_appr_status;
    SET v_comm_appr_oper_no = p_comm_appr_oper_no;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_comm_appr_remark = p_comm_appr_remark;
    SET v_external_no = p_external_no;
    SET v_comb_code = p_comb_code;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_remark_info = p_remark_info;
    SET v_update_times = p_update_times;
    SET v_oper_func_code = p_oper_func_code;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_rece_margin = p_rece_margin;
    SET v_exgp_avail_amt = p_exgp_avail_amt;
    SET v_asac_avail_amt = p_asac_avail_amt;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_exgp_long_rece_margin = p_exgp_long_rece_margin;
    SET v_exgp_short_rece_margin = p_exgp_short_rece_margin;
    SET v_asac_long_rece_margin = p_asac_long_rece_margin;
    SET v_asac_short_rece_margin = p_asac_short_rece_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_order_dir = 0;
    SET v_contrc_unit = 0;
    SET v_lngsht_type = 0;
    SET v_wtdraw_qty = 0;
    SET v_calc_dir = 1;
    SET v_comm_margin = 0;
    SET v_order_margin = 0;
    SET v_strike_margin = 0;
    SET v_trade_fee = 0;
    SET v_strike_fee = 0;
    SET v_trade_occur_qty = 0;
    SET v_invest_type = 0;
    SET v_pre_settle_price = 0;
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_long_comm_margin = 0;
    SET v_short_comm_margin = 0;
    SET v_long_order_margin = 0;
    SET v_short_order_margin = 0;
    SET v_long_strike_margin = 0;
    SET v_short_strike_margin = 0;
    SET v_trade_capt_amt = 0;
    SET v_posi_capt_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_trade_occur_amt = 0;
    SET v_strike_occur_amt = 0;
    SET v_comm_occur_amt = 0;
    SET v_trade_capt_amt_after = 0;
    SET v_posi_capt_amt_after = 0;
    SET v_comm_capt_amt_after = 0;
    SET v_comm_occur_qty = 0;
    SET v_strike_capt_amt = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @记录序号# = @指令序号#; */
        set v_row_id = v_comm_id;

        /* set @订单方向# = @指令方向#; */
        set v_order_dir = v_comm_dir;

        /* set @合约乘数# = 0; */
        set v_contrc_unit = 0;

        /* 调用【原子_交易期货_交易_获取多空类型】*/
        call db_tdfutu.pra_tdfuap_GetLngshtType(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_dir,
            v_contrc_dir,
            v_error_code,
            v_error_info,
            v_lngsht_type);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.1.4.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_获取多空类型出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #未成交的订单直接回滚，那订单数量=成交数量，差额返回

        /* set @撤单数量# = @订单数量# - @成交数量#; */
        set v_wtdraw_qty = v_order_qty - v_strike_qty;

        /* set @指令撤销数量# = 0; */
        set v_comm_cancel_qty = 0;

        /* 调用【原子_交易期货_指令_撤销更新指令】*/
        call db_tdfutu.pra_tdfuap_CancelUpdateComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_comm_id,
            v_comm_cancel_qty,
            v_wtdraw_qty,
            v_error_code,
            v_error_info,
            v_limit_actual_price,
            v_comm_status,
            v_comm_date,
            v_comm_batch_no,
            v_comm_executor);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.1.4.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_撤销更新指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #计算指令变动金额和数量

        /* set @计算方向# = 《计算方向-加上》; */
        set v_calc_dir = 1;

        /* set @应收保证金# = @应收保证金#/@指令数量#; */
        set v_rece_margin = v_rece_margin/v_comm_qty;

        /* set @指令数量# = @指令数量# - @成交数量# - @指令撤销数量#; */
        set v_comm_qty = v_comm_qty - v_strike_qty - v_comm_cancel_qty;

        /* set @指令保证金# = @应收保证金#*@指令数量#; */
        set v_comm_margin = v_rece_margin*v_comm_qty;

        /* set @订单保证金# = 0; */
        set v_order_margin = 0;

        /* set @成交保证金# = 0; */
        set v_strike_margin = 0;

        /* set @交易费用# = 0; */
        set v_trade_fee = 0;

        /* set @成交费用# = 0; */
        set v_strike_fee = 0;

        /* set @交易变动数量# = 0; */
        set v_trade_occur_qty = 0;

        /* set @投资类型# = 《投资类型-二级市场交易性金融资产》; */
        set v_invest_type = 1;

        /* set @昨结算价# = 0; */
        set v_pre_settle_price = 0;

        /* set @多头持仓保证金#=@交易组多头应收保证金#; */
        set v_long_hold_margin=v_exgp_long_rece_margin;

        /* set @空头持仓保证金#=@交易组空头应收保证金#; */
        set v_short_hold_margin=v_exgp_short_rece_margin;

        /* if @组合编码# <> " " then */
        if v_comb_code <> " " then

            /* 调用【原子_交易期货_账户_锁定获取保证金优惠信息】*/
            call db_tdfutu.pra_tdfuac_GetMarginLocked(
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
                v_exch_no,
                v_comb_code,
                v_hedge_type,
                v_long_hold_margin,
                v_short_hold_margin,
                v_error_code,
                v_error_info,
                v_long_comm_margin,
                v_short_comm_margin,
                v_long_order_margin,
                v_short_order_margin,
                v_long_strike_margin,
                v_short_strike_margin,
                v_trade_capt_amt,
                v_posi_capt_amt,
                v_comm_capt_amt,
                v_row_id);
            if v_error_code = "1" then
                SET v_error_code = "tdfutuT.1.4.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_锁定获取保证金优惠信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* 调用【原子_交易期货_账户_计算实收保证金】*/
            call db_tdfutu.pra_tdfuac_CalcRealMarginByExection(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_lngsht_type,
                v_comm_margin,
                v_order_margin,
                v_strike_margin,
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
                v_comm_capt_amt,
                v_error_code,
                v_error_info,
                v_trade_occur_amt,
                v_strike_occur_amt,
                v_comm_occur_amt,
                v_trade_capt_amt_after,
                v_posi_capt_amt_after,
                v_comm_capt_amt_after);
            if v_error_code = "1" then
                SET v_error_code = "tdfutuT.1.4.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_计算实收保证金出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @指令占用金额# = @指令占用后金额#; */
            set v_comm_capt_amt = v_comm_capt_amt_after;

            /* set @交易占用金额# = @交易占用后金额#; */
            set v_trade_capt_amt = v_trade_capt_amt_after;

            /* set @持仓占用金额# = @持仓占用后金额#; */
            set v_posi_capt_amt = v_posi_capt_amt_after;
        else

            /* set @指令变动金额# = @指令保证金#; */
            set v_comm_occur_amt = v_comm_margin;
        end if;

        /* if @开平方向# = 《开平方向-开仓》 then */
        if v_contrc_dir = 1 then

            /* set @指令变动金额# = @指令变动金额#; */
            set v_comm_occur_amt = v_comm_occur_amt;

            /* set @指令变动数量#=@指令数量#; */
            set v_comm_occur_qty=v_comm_qty;
        else

            /* set @指令变动金额# = 0; */
            set v_comm_occur_amt = 0;

            /* set @指令变动数量# =@指令数量#; */
            set v_comm_occur_qty =v_comm_qty;
        end if;

        /* 调用【原子_交易期货_账户_更新交易组交易资金】*/
        call db_tdfutu.pra_tdfuac_UpdateExgpTradeCapit(
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
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_type,
            v_contrc_dir,
            v_invest_type,
            v_lngsht_type,
            v_strike_occur_amt,
            v_strike_fee,
            v_trade_occur_amt,
            v_trade_fee,
            v_comm_occur_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.1.4.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新交易组交易资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #更新保证金优惠信息

        /* set @多头指令保证金# = 0; */
        set v_long_comm_margin = 0;

        /* set @空头指令保证金# = 0; */
        set v_short_comm_margin = 0;

        /* set @多头订单保证金# = 0; */
        set v_long_order_margin = 0;

        /* set @空头订单保证金# = 0; */
        set v_short_order_margin = 0;

        /* set @多头成交保证金# = 0; */
        set v_long_strike_margin = 0;

        /* set @空头成交保证金# = 0; */
        set v_short_strike_margin = 0;

        /* if @多空类型# = 《多空类型-多头》 then */
        if v_lngsht_type = 1 then

          /* set @多头指令保证金# = @指令保证金#; */
          set v_long_comm_margin = v_comm_margin;
        else

          /* set @空头指令保证金# = @指令保证金#; */
          set v_short_comm_margin = v_comm_margin;
        end if;

        /* if @组合编码# <> " " then */
        if v_comb_code <> " " then

            /* 调用【原子_交易期货_账户_更新保证金优惠信息】*/
            call db_tdfutu.pra_tdfuac_UpdateMargin(
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
                v_exch_no,
                v_comb_code,
                v_hedge_type,
                v_long_comm_margin,
                v_short_comm_margin,
                v_long_order_margin,
                v_short_order_margin,
                v_long_strike_margin,
                v_short_strike_margin,
                v_trade_capt_amt,
                v_posi_capt_amt,
                v_comm_capt_amt,
                v_row_id,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdfutuT.1.4.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新保证金优惠信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set  @成交占用金额# =0; */
            set  v_strike_capt_amt =0;

            /* 调用【原子_交易期货_账户_获取更新产品保证金优惠信息】*/
            call db_tdfutu.pra_tdfuac_GetUpdateProductMargin(
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
                v_exch_no,
                v_hedge_type,
                v_comb_code,
                v_lngsht_type,
                v_comm_margin,
                v_order_margin,
                v_strike_margin,
                v_asac_long_rece_margin,
                v_asac_short_rece_margin,
                v_error_code,
                v_error_info,
                v_strike_capt_amt,
                v_trade_capt_amt,
                v_comm_capt_amt,
                v_long_comm_margin,
                v_short_comm_margin,
                v_long_order_margin,
                v_short_order_margin,
                v_long_strike_margin,
                v_short_strike_margin,
                v_trade_occur_amt,
                v_strike_occur_amt,
                v_comm_occur_amt);
            if v_error_code = "1" then
                SET v_error_code = "tdfutuT.1.4.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_获取更新产品保证金优惠信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

        /* 调用【原子_交易期货_账户_更新资产账户交易资金】*/
        call db_tdfutu.pra_tdfuac_UpdateAsacTradeCapit(
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
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_type,
            v_contrc_dir,
            v_invest_type,
            v_lngsht_type,
            v_strike_occur_amt,
            v_strike_fee,
            v_trade_occur_amt,
            v_trade_fee,
            v_comm_occur_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.1.4.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新资产账户交易资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_交易期货_账户_更新交易持仓】*/
        call db_tdfutu.pra_tdfuac_UpdateTradePosi(
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
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_type,
            v_contrc_unit,
            v_contrc_dir,
            v_hedge_type,
            v_invest_type,
            v_lngsht_type,
            v_comb_code,
            v_pre_settle_price,
            v_exgp_avail_qty,
            v_asac_avail_qty,
            v_comm_occur_qty,
            v_trade_occur_qty,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.1.4.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新交易持仓出现错误！',v_mysql_message);
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


