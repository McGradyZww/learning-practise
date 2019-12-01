DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_交易_新增订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfutd_AddOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfutd_AddOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_opor int,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_exch_no int,
    IN p_out_acco varchar(32),
    IN p_futu_acco_no int,
    IN p_futu_acco varchar(16),
    IN p_contrc_code_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_busi_limit_str varchar(2048),
    IN p_exgp_busi_config_str varchar(64),
    IN p_asac_busi_config_str varchar(64),
    IN p_exgp_avail_amt decimal(18,4),
    IN p_asac_avail_amt decimal(18,4),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    IN p_comm_id bigint,
    IN p_external_no bigint,
    IN p_calc_dir int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_lngsht_type int,
    IN p_order_batch_no int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_report_fee decimal(18,4),
    IN p_wtdraw_fee decimal(18,4),
    IN p_trade_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_comb_code varchar(6),
    IN p_pre_settle_price decimal(16,9),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_rece_margin decimal(18,4),
    IN p_exgp_long_rece_margin decimal(18,4),
    IN p_exgp_short_rece_margin decimal(18,4),
    IN p_asac_long_rece_margin decimal(18,4),
    IN p_asac_short_rece_margin decimal(18,4),
    IN p_compli_trig_id bigint,
    IN p_order_oper_way varchar(2),
    IN p_margin_ratio decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_id bigint,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_status varchar(2),
    OUT p_comm_batch_no int,
    OUT p_report_date int,
    OUT p_report_time int,
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
    declare v_comm_opor int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_out_acco varchar(32);
    declare v_futu_acco_no int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_busi_limit_str varchar(2048);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_comm_id bigint;
    declare v_external_no bigint;
    declare v_calc_dir int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_lngsht_type int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_pre_settle_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_exgp_long_rece_margin decimal(18,4);
    declare v_exgp_short_rece_margin decimal(18,4);
    declare v_asac_long_rece_margin decimal(18,4);
    declare v_asac_short_rece_margin decimal(18,4);
    declare v_compli_trig_id bigint;
    declare v_order_oper_way varchar(2);
    declare v_margin_ratio decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_status varchar(2);
    declare v_comm_batch_no int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_update_times int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_asset_type int;
    declare v_strike_all_fee decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_order_margin decimal(18,4);
    declare v_strike_margin decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_exch_crncy_type varchar(3);
    declare v_posi_capt_amt decimal(18,4);
    declare v_comm_margin decimal(18,4);
    declare v_invest_type int;
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_tmp_trade_fee decimal(18,4);
    declare v_long_comm_margin decimal(18,4);
    declare v_short_comm_margin decimal(18,4);
    declare v_long_order_margin decimal(18,4);
    declare v_short_order_margin decimal(18,4);
    declare v_long_strike_margin decimal(18,4);
    declare v_short_strike_margin decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_row_id bigint;
    declare v_trade_occur_amt decimal(18,4);
    declare v_strike_occur_amt decimal(18,4);
    declare v_trade_capt_amt_after decimal(18,4);
    declare v_posi_capt_amt_after decimal(18,4);
    declare v_comm_capt_amt_after decimal(18,4);
    declare v_real_margin decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_strike_capt_amt decimal(18,4);
    declare v_tmp_trade_occur_amt decimal(18,4);
    declare v_limit_actual_price decimal(16,9);
    declare v_exter_comm_flag int;
    declare v_comm_date int;
    declare v_comm_executor int;
    declare v_comm_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_qty decimal(18,2);
    declare v_comm_dir int;
    declare v_comm_change_qty decimal(18,2);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_status varchar(2);
    declare v_strike_status varchar(2);
    declare v_pass_status varchar(2);
    declare v_report_no varchar(32);
    declare v_crncy_type varchar(3);
    declare v_wtdraw_qty decimal(18,2);
    declare v_waste_qty decimal(18,2);

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
    SET v_comm_opor = p_comm_opor;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_no = p_exch_no;
    SET v_out_acco = p_out_acco;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_exgp_busi_config_str = p_exgp_busi_config_str;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_exgp_avail_amt = p_exgp_avail_amt;
    SET v_asac_avail_amt = p_asac_avail_amt;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_comm_id = p_comm_id;
    SET v_external_no = p_external_no;
    SET v_calc_dir = p_calc_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_report_fee = p_report_fee;
    SET v_wtdraw_fee = p_wtdraw_fee;
    SET v_trade_fee = p_trade_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_comb_code = p_comb_code;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_rece_margin = p_rece_margin;
    SET v_exgp_long_rece_margin = p_exgp_long_rece_margin;
    SET v_exgp_short_rece_margin = p_exgp_short_rece_margin;
    SET v_asac_long_rece_margin = p_asac_long_rece_margin;
    SET v_asac_short_rece_margin = p_asac_short_rece_margin;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_order_oper_way = p_order_oper_way;
    SET v_margin_ratio = p_margin_ratio;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_status = "0";
    SET v_comm_batch_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_comm_occur_amt = 0;
    SET v_asset_type = 0;
    SET v_strike_all_fee = 0;
    SET v_strike_fee = 0;
    SET v_order_margin = 0;
    SET v_strike_margin = 0;
    SET v_comm_occur_qty = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_posi_capt_amt = 0;
    SET v_comm_margin = 0;
    SET v_invest_type = 0;
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_tmp_trade_fee = 0;
    SET v_long_comm_margin = 0;
    SET v_short_comm_margin = 0;
    SET v_long_order_margin = 0;
    SET v_short_order_margin = 0;
    SET v_long_strike_margin = 0;
    SET v_short_strike_margin = 0;
    SET v_trade_capt_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_row_id = 0;
    SET v_trade_occur_amt = 0;
    SET v_strike_occur_amt = 0;
    SET v_trade_capt_amt_after = 0;
    SET v_posi_capt_amt_after = 0;
    SET v_comm_capt_amt_after = 0;
    SET v_real_margin = 0;
    SET v_trade_occur_qty = 0;
    SET v_strike_capt_amt = 0;
    SET v_tmp_trade_occur_amt = 0;
    SET v_limit_actual_price = 0;
    SET v_exter_comm_flag = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_executor = 0;
    SET v_comm_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_qty = 0;
    SET v_comm_dir = 0;
    SET v_comm_change_qty = 0;
    SET v_comm_frozen_qty = 0;
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_status = "0";
    SET v_strike_status = "0";
    SET v_pass_status = "0";
    SET v_report_no = " ";
    SET v_crncy_type = "CNY";
    SET v_wtdraw_qty = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* set @指令变动金额#=0; */
    set v_comm_occur_amt=0;

    /* set @资产类型#=31; */
    set v_asset_type=31;

    /* set @成交全部费用#=0; */
    set v_strike_all_fee=0;

    /* set @成交费用#=0; */
    set v_strike_fee=0;

    /* set @订单保证金#=0; */
    set v_order_margin=0;

    /* set @成交保证金#=0; */
    set v_strike_margin=0;

    /* set @订单序号#=0; */
    set v_order_id=0;

    /* set @指令变动数量#=0; */
    set v_comm_occur_qty=0;

    /* set @交易币种#="CNY"; */
    set v_exch_crncy_type="CNY";

    /* set @持仓占用金额#=0; */
    set v_posi_capt_amt=0;

    /* set @指令保证金#=0; */
    set v_comm_margin=0;

    /* set @订单日期# = @初始化日期#; */
    set v_order_date = v_init_date;

    /* set @投资类型# = 1; */
    set v_invest_type = 1;

    /* set @多头持仓保证金#=@交易组多头应收保证金#; */
    set v_long_hold_margin=v_exgp_long_rece_margin;

    /* set @空头持仓保证金#=@交易组空头应收保证金#; */
    set v_short_hold_margin=v_exgp_short_rece_margin;

    /* set @临时_交易费用# = @交易费用#; */
    set v_tmp_trade_fee = v_trade_fee;
    #外部下单会走这条路进行判断,外部编号由外部传入

    /* if @外部编号# <> 0 then */
    if v_external_no <> 0 then

      /* 调用【原子_交易期货_交易_检查期货订单重复】*/
      call db_tdfutu.pra_tdfutd_CheckOrderDuplicate(
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
          v_external_no,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "tdfutuT.4.11.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_检查期货订单重复出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;

    end if;
    #计算实际保证金，资金变化

    /* set @指令保证金# = 0; */
    set v_comm_margin = 0;

    /* set @订单保证金# = @应收保证金#; */
    set v_order_margin = v_rece_margin;

    /* set @计算方向# = 《计算方向-加上》; */
    set v_calc_dir = 1;
    #对保证金优惠进行处理

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
          SET v_error_code = "tdfutuT.4.11.999";
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
          SET v_error_code = "tdfutuT.4.11.999";
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

      /* set @实收保证金# = @订单保证金#; */
      set v_real_margin = v_order_margin;

      /* set @交易变动金额# = @实收保证金#; */
      set v_trade_occur_amt = v_real_margin;
    end if;

    /* if @开平方向# = 《开平方向-开仓》 then */
    if v_contrc_dir = 1 then
      #set @交易费用# = @计算方向# * @交易费用#;

      /* set @交易变动数量#=@计算方向#*@订单数量#; */
      set v_trade_occur_qty=v_calc_dir*v_order_qty;
    else

       /* set @交易变动金额# = 0; */
       set v_trade_occur_amt = 0;

       /* set @交易变动数量# = @计算方向# * @订单数量#; */
       set v_trade_occur_qty = v_calc_dir * v_order_qty;
    end if;
    #检查交易可用资金、可用持仓，价格等

    /* 调用【原子_交易期货_交易_校验新增订单】*/
    call db_tdfutu.pra_tdfutd_CheckAddOrder(
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
        v_contrc_code_no,
        v_futu_acco_no,
        v_contrc_dir,
        v_hedge_type,
        v_calc_dir,
        v_lngsht_type,
        v_trade_occur_amt,
        v_exgp_avail_amt,
        v_asac_avail_amt,
        v_order_qty,
        v_exgp_avail_qty,
        v_asac_avail_qty,
        v_order_price,
        v_up_limit_price,
        v_down_limit_price,
        v_trade_fee,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.4.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_校验新增订单出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
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
        SET v_error_code = "tdfutuT.4.11.999";
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

        /* set @多头订单保证金# = @订单保证金#; */
        set v_long_order_margin = v_order_margin;
    else

        /* set @空头订单保证金# = @订单保证金#; */
        set v_short_order_margin = v_order_margin;
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
            SET v_error_code = "tdfutuT.4.11.999";
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
            SET v_error_code = "tdfutuT.4.11.999";
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
        SET v_error_code = "tdfutuT.4.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新资产账户交易资金出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* set @临时_交易变动金额# = @交易变动金额#; */
    set v_tmp_trade_occur_amt = v_trade_occur_amt;

    /* set @计算方向# = 《计算方向-减去》; */
    set v_calc_dir = -1;

    /* set @订单保证金# = 0; */
    set v_order_margin = 0;

    /* set @交易费用# = 0; */
    set v_trade_fee = 0;
    #如果是指令下单，校验指令信息，并更新指令相关数据

    /* if @指令序号# <> 0 then */
    if v_comm_id <> 0 then

        /* 调用【原子_交易期货_指令_校验订单指令】*/
        call db_tdfutu.pra_tdfuap_CheckOrderComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_comm_id,
            v_order_date,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_error_code,
            v_error_info,
            v_limit_actual_price,
            v_comm_batch_no,
            v_exter_comm_flag,
            v_comm_date,
            v_comm_executor,
            v_comm_opor,
            v_comm_margin,
            v_comm_order_qty,
            v_comm_cancel_qty,
            v_comm_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.4.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_校验订单指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @指令方向# = @订单方向#; */
        set v_comm_dir = v_order_dir;

        /* set @指令变化数量# = @订单数量#; */
        set v_comm_change_qty = v_order_qty;

        /* set @指令冻结数量#=@计算方向# * @指令变化数量#; */
        set v_comm_frozen_qty=v_calc_dir * v_comm_change_qty;
        #计算指令变动金额和数量

        /* 调用【原子_交易期货_指令_计算指令变动金额和数量】*/
        call db_tdfutu.pra_tdfuap_GetCommOccurAmtAndQty(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_contrc_dir,
            v_comm_qty,
            v_comm_order_qty,
            v_calc_dir,
            v_comm_margin,
            v_comm_cancel_qty,
            v_comm_change_qty,
            v_error_code,
            v_error_info,
            v_comm_occur_amt,
            v_comm_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.4.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令变动金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_交易期货_指令_下单更新指令】*/
        call db_tdfutu.pra_tdfuap_OrderUpdateComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_comm_id,
            v_comm_frozen_qty,
            v_order_qty,
            v_error_code,
            v_error_info,
            v_limit_actual_price,
            v_exter_comm_flag,
            v_comm_comple_date,
            v_comm_comple_time,
            v_comm_status,
            v_strike_status);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.4.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_下单更新指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @组合编码# <> " " then */
        if v_comb_code <> " " then

            /* set @指令保证金# = @指令变动金额#; */
            set v_comm_margin = v_comm_occur_amt;

            /* set @订单保证金# = 0; */
            set v_order_margin = 0;

            /* set @成交保证金# = 0; */
            set v_strike_margin = 0;

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
                SET v_error_code = "tdfutuT.4.11.999";
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
                SET v_error_code = "tdfutuT.4.11.999";
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

            /* set @指令变动金额# = @计算方向# * @指令保证金#; */
            set v_comm_occur_amt = v_calc_dir * v_comm_margin;
        end if;

        /* if @开平方向# = 《开平方向-开仓》 then */
        if v_contrc_dir = 1 then

            /* set @指令变动金额# = @指令变动金额#; */
            set v_comm_occur_amt = v_comm_occur_amt;
        else

            /* set @指令变动金额# = 0; */
            set v_comm_occur_amt = 0;
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
            SET v_error_code = "tdfutuT.4.11.999";
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
                SET v_error_code = "tdfutuT.4.11.999";
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
                SET v_error_code = "tdfutuT.4.11.999";
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
            SET v_error_code = "tdfutuT.4.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新资产账户交易资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

    end if;
    #交易资金持仓处理

    /* set @交易变动金额# = @临时_交易变动金额#; */
    set v_trade_occur_amt = v_tmp_trade_occur_amt;

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
        SET v_error_code = "tdfutuT.4.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新交易持仓出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;

    #新增订单记录

    /* set @订单状态# = 《订单状态-未报》; */
    set v_order_status = "1";

    /* 调用【原子_交易期货_公用_获取通道状态】*/
    call db_tdfutu.pra_tdfupb_GetChannelStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_error_code,
        v_error_info,
        v_pass_status);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.4.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_公用_获取通道状态出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* if @通道状态# = 《通道状态-正常》then */
    if v_pass_status = "1"then

      /* set @订单状态# = 《订单状态-待报》; */
      set v_order_status = "a";
    end if;

    /* set @申报日期# = 0; */
    set v_report_date = 0;

    /* set @申报时间# = 0; */
    set v_report_time = 0;

    /* set @申报编号#=0; */
    set v_report_no=0;

    /* set @交易变动金额#=0; */
    set v_trade_occur_amt=0;

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* set @交易费用# = @临时_交易费用#; */
    set v_trade_fee = v_tmp_trade_fee;

    /* 调用【原子_交易期货_交易_新增订单】*/
    call db_tdfutu.pra_tdfutd_AddOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_comm_opor,
        v_comm_id,
        v_comm_batch_no,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_futu_acco,
        v_futu_acco_no,
        v_out_acco,
        v_exch_no,
        v_pass_no,
        v_contrc_code,
        v_contrc_code_no,
        v_contrc_type,
        v_contrc_unit,
        v_external_no,
        v_report_date,
        v_report_time,
        v_report_no,
        v_order_date,
        v_order_batch_no,
        v_order_dir,
        v_order_price,
        v_order_qty,
        v_order_status,
        v_invest_type,
        v_asset_type,
        v_contrc_dir,
        v_hedge_type,
        v_trade_fee,
        v_report_fee,
        v_wtdraw_fee,
        v_trade_commis,
        v_other_commis,
        v_trade_occur_amt,
        v_rece_margin,
        v_comb_code,
        v_margin_ratio,
        v_compli_trig_id,
        v_crncy_type,
        v_order_oper_way,
        v_strike_all_fee,
        v_error_code,
        v_error_info,
        v_order_id,
        v_order_time,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.4.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_新增订单出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* set @撤单数量# = 0; */
    set v_wtdraw_qty = 0;

    /* set @废单数量# = 0; */
    set v_waste_qty = 0;

    /* 调用【原子_交易期货_交易_订单处理汇总订单】*/
    call db_tdfutu.pra_tdfutd_OrderDealSumOrder(
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
        v_pass_no,
        v_crncy_type,
        v_exch_no,
        v_contrc_code_no,
        v_contrc_code,
        v_contrc_type,
        v_asset_type,
        v_order_date,
        v_order_batch_no,
        v_order_dir,
        v_order_price,
        v_order_qty,
        v_order_status,
        v_wtdraw_qty,
        v_waste_qty,
        v_rece_margin,
        v_order_oper_way,
        v_contrc_unit,
        v_external_no,
        v_contrc_dir,
        v_hedge_type,
        v_trade_fee,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.4.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_订单处理汇总订单出现错误！',v_mysql_message);
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
    SET p_order_id = v_order_id;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_status = v_order_status;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_交易_撤销订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfutd_CancelOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfutd_CancelOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_lngsht_type int,
    IN p_pre_settle_price decimal(16,9),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    IN p_exgp_long_rece_margin decimal(18,4),
    IN p_exgp_short_rece_margin decimal(18,4),
    IN p_asac_long_rece_margin decimal(18,4),
    IN p_asac_short_rece_margin decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_pass_no int,
    OUT p_crncy_type varchar(3),
    OUT p_futu_acco varchar(16),
    OUT p_contrc_code varchar(6),
    OUT p_contrc_type int,
    OUT p_contrc_dir int,
    OUT p_hedge_type int,
    OUT p_external_no bigint,
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_limit_price decimal(16,9),
    OUT p_order_batch_no int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_order_time int,
    OUT p_order_dir int,
    OUT p_wtdraw_date int,
    OUT p_wtdraw_time int,
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_wtdraw_status varchar(2),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_price decimal(16,9),
    OUT p_calc_dir int,
    OUT p_occur_qty decimal(18,2),
    OUT p_occur_amt decimal(18,4),
    OUT p_trade_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_trade_capt_amt decimal(18,4),
    OUT p_posi_capt_amt decimal(18,4),
    OUT p_comb_code varchar(6),
    OUT p_rece_margin decimal(18,4),
    OUT p_margin_ratio decimal(18,12),
    OUT p_comm_margin decimal(18,4),
    OUT p_rsp_info varchar(255),
    OUT p_compli_trig_id bigint,
    OUT p_order_oper_way varchar(2),
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
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_lngsht_type int;
    declare v_pre_settle_price decimal(16,9);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_exgp_long_rece_margin decimal(18,4);
    declare v_exgp_short_rece_margin decimal(18,4);
    declare v_asac_long_rece_margin decimal(18,4);
    declare v_asac_short_rece_margin decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_pass_no int;
    declare v_crncy_type varchar(3);
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_limit_price decimal(16,9);
    declare v_order_batch_no int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_order_time int;
    declare v_order_dir int;
    declare v_wtdraw_date int;
    declare v_wtdraw_time int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_wtdraw_status varchar(2);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_price decimal(16,9);
    declare v_calc_dir int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_posi_capt_amt decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_rece_margin decimal(18,4);
    declare v_margin_ratio decimal(18,12);
    declare v_comm_margin decimal(18,4);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_order_oper_way varchar(2);
    declare v_update_times int;
    declare v_deal_flag int;
    declare v_curr_qty decimal(18,2);
    declare v_strike_fee decimal(18,4);
    declare v_strike_margin decimal(18,4);
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_remark varchar(255);
    declare v_comm_occur_qty decimal(18,2);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_co_no int;
    declare v_out_acco varchar(32);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_unit int;
    declare v_tmp_trade_fee decimal(18,4);
    declare v_tmp_rece_margin decimal(18,4);
    declare v_pass_status varchar(2);
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_wtdraw_id bigint;
    declare v_invest_type int;
    declare v_order_margin decimal(18,4);
    declare v_long_comm_margin decimal(18,4);
    declare v_short_comm_margin decimal(18,4);
    declare v_long_order_margin decimal(18,4);
    declare v_short_order_margin decimal(18,4);
    declare v_long_strike_margin decimal(18,4);
    declare v_short_strike_margin decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_row_id bigint;
    declare v_trade_occur_amt decimal(18,4);
    declare v_strike_occur_amt decimal(18,4);
    declare v_comm_occur_amt decimal(18,4);
    declare v_trade_capt_amt_after decimal(18,4);
    declare v_posi_capt_amt_after decimal(18,4);
    declare v_comm_capt_amt_after decimal(18,4);
    declare v_real_margin decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_strike_capt_amt decimal(18,4);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_status varchar(2);
    declare v_comm_date int;
    declare v_comm_executor int;
    declare v_waste_qty decimal(18,2);

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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_lngsht_type = p_lngsht_type;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_exgp_long_rece_margin = p_exgp_long_rece_margin;
    SET v_exgp_short_rece_margin = p_exgp_short_rece_margin;
    SET v_asac_long_rece_margin = p_asac_long_rece_margin;
    SET v_asac_short_rece_margin = p_asac_short_rece_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_pass_no = 0;
    SET v_crncy_type = "CNY";
    SET v_futu_acco = " ";
    SET v_contrc_code = " ";
    SET v_contrc_type = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_external_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_limit_price = 0;
    SET v_order_batch_no = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_status = "0";
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_wtdraw_date = date_format(curdate(),'%Y%m%d');
    SET v_wtdraw_time = date_format(curtime(),'%H%i%s');
    SET v_wtdraw_qty = 0;
    SET v_wtdraw_status = "0";
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_price = 0;
    SET v_calc_dir = 1;
    SET v_occur_qty = 0;
    SET v_occur_amt = 0;
    SET v_trade_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_trade_capt_amt = 0;
    SET v_posi_capt_amt = 0;
    SET v_comb_code = " ";
    SET v_rece_margin = 0;
    SET v_margin_ratio = 0;
    SET v_comm_margin = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_order_oper_way = " ";
    SET v_update_times = 1;
    SET v_deal_flag = 0;
    SET v_curr_qty = 0;
    SET v_strike_fee = 0;
    SET v_strike_margin = 0;
    SET v_wtdraw_batch_no = 0;
    SET v_wtdraw_remark = " ";
    SET v_comm_occur_qty = 0;
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_co_no = 0;
    SET v_out_acco = " ";
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_unit = 0;
    SET v_tmp_trade_fee = 0;
    SET v_tmp_rece_margin = 0;
    SET v_pass_status = "0";
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_wtdraw_id = 0;
    SET v_invest_type = 0;
    SET v_order_margin = 0;
    SET v_long_comm_margin = 0;
    SET v_short_comm_margin = 0;
    SET v_long_order_margin = 0;
    SET v_short_order_margin = 0;
    SET v_long_strike_margin = 0;
    SET v_short_strike_margin = 0;
    SET v_comm_capt_amt = 0;
    SET v_row_id = 0;
    SET v_trade_occur_amt = 0;
    SET v_strike_occur_amt = 0;
    SET v_comm_occur_amt = 0;
    SET v_trade_capt_amt_after = 0;
    SET v_posi_capt_amt_after = 0;
    SET v_comm_capt_amt_after = 0;
    SET v_real_margin = 0;
    SET v_trade_occur_qty = 0;
    SET v_strike_capt_amt = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_status = "0";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_executor = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @处理标志# = 0; */
    set v_deal_flag = 0;

    /* set @初始化日期# = @订单日期#; */
    set v_init_date = v_order_date;

    /* [获取机器日期][@撤单日期#] */
    select date_format(curdate(),'%Y%m%d') into v_wtdraw_date;


    /* [获取机器时间][@撤单时间#] */
    select date_format(curtime(),'%H%i%s') into v_wtdraw_time;


    /* set @当前数量#=0; */
    set v_curr_qty=0;

    /* set @成交费用#=0; */
    set v_strike_fee=0;

    /* set @成交保证金#=0; */
    set v_strike_margin=0;

    /* set @撤单批号#=0; */
    set v_wtdraw_batch_no=0;

    /* set @撤单说明#=" "; */
    set v_wtdraw_remark=" ";

    /* set @指令变动数量#=0; */
    set v_comm_occur_qty=0;

    /* set @交易占用金额#=0; */
    set v_trade_capt_amt=0;

    /* set @持仓占用金额#=0; */
    set v_posi_capt_amt=0;

    /* set @指令保证金#=0; */
    set v_comm_margin=0;

    /* set @多头持仓保证金#=@交易组多头应收保证金#; */
    set v_long_hold_margin=v_exgp_long_rece_margin;

    /* set @空头持仓保证金#=@交易组空头应收保证金#; */
    set v_short_hold_margin=v_exgp_short_rece_margin;

    /* [事务开始] */
    START TRANSACTION;

    #检查撤单重复，并获取原委托信息

    /* 调用【原子_交易期货_交易_检查锁定获取待撤订单信息】*/
    call db_tdfutu.pra_tdfutd_CheckLockGetPreCancelOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_date,
        v_order_id,
        v_error_code,
        v_error_info,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_crncy_type,
        v_pass_no,
        v_out_acco,
        v_futu_acco_no,
        v_futu_acco,
        v_contrc_code_no,
        v_contrc_code,
        v_contrc_type,
        v_contrc_unit,
        v_external_no,
        v_contrc_dir,
        v_hedge_type,
        v_report_date,
        v_report_time,
        v_report_no,
        v_order_dir,
        v_order_time,
        v_order_price,
        v_order_qty,
        v_order_status,
        v_strike_qty,
        v_strike_amt,
        v_strike_price,
        v_report_fee,
        v_wtdraw_fee,
        v_trade_fee,
        v_wtdraw_qty,
        v_wtdraw_time,
        v_trade_commis,
        v_other_commis,
        v_comm_id,
        v_comm_batch_no,
        v_comb_code,
        v_margin_ratio,
        v_rece_margin,
        v_rsp_info,
        v_compli_trig_id,
        v_order_batch_no,
        v_order_oper_way);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.4.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_检查锁定获取待撤订单信息出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* set  @临时_交易费用#=@交易费用#; */
    set  v_tmp_trade_fee=v_trade_fee;

    /* set @临时_应收保证金#=@应收保证金#; */
    set v_tmp_rece_margin=v_rece_margin;

    /* if @订单状态# <> 《订单状态-未报》 then */
    if v_order_status <> "1" then
      #非未报订单,只修改订单状态为待撤

      /* set @订单状态# = 《订单状态-待撤》; */
      set v_order_status = "3";

      /* set @撤单状态# = 《撤单状态-未报》; */
      set v_wtdraw_status = "1";

      /* 调用【原子_交易期货_公用_获取通道状态】*/
      call db_tdfutu.pra_tdfupb_GetChannelStatus(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_pass_no,
          v_error_code,
          v_error_info,
          v_pass_status);
      if v_error_code = "1" then
          SET v_error_code = "tdfutuT.4.12.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_公用_获取通道状态出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


      /* if @通道状态# = 《通道状态-正常》 then */
      if v_pass_status = "1" then

        /* set @撤单状态# = 《撤单状态-已报》; */
        set v_wtdraw_status = "2";
      end if;
        #事务内获取撤单批号，分机构存放

        /* set @编号类型# = 《编号类型-撤单批号》; */
        set v_record_no_type = 16;

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
            SET v_error_code = "tdfutuT.4.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_公用_获取业务记录编号出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @撤单批号# = @当前编号#; */
        set v_wtdraw_batch_no = v_curr_no;

      /* set @撤单数量#=0; */
      set v_wtdraw_qty=0;

      /* 调用【原子_交易期货_交易_撤销订单】*/
      call db_tdfutu.pra_tdfutd_CancelOrder(
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
          v_pass_no,
          v_out_acco,
          v_crncy_type,
          v_exch_no,
          v_futu_acco_no,
          v_futu_acco,
          v_contrc_code_no,
          v_contrc_code,
          v_external_no,
          v_order_date,
          v_order_id,
          v_trade_fee,
          v_order_status,
          v_report_date,
          v_report_time,
          v_report_no,
          v_wtdraw_batch_no,
          v_wtdraw_qty,
          v_wtdraw_remark,
          v_wtdraw_status,
          v_strike_qty,
          v_strike_amt,
          v_trade_commis,
          v_report_fee,
          v_wtdraw_fee,
          v_other_commis,
          v_error_code,
          v_error_info,
          v_wtdraw_id,
          v_update_times);
      if v_error_code = "1" then
          SET v_error_code = "tdfutuT.4.12.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_撤销订单出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;

    else
      #未报撤单处理逻辑，修改订单状态为已撤

      /* set @订单状态# = 《订单状态-已撤》; */
      set v_order_status = "4";

      /* set @撤单状态# = 《撤单状态-成功》; */
      set v_wtdraw_status = "3";

      /* set @撤单数量# = @订单数量#; */
      set v_wtdraw_qty = v_order_qty;

      /* set @变动数量# = @订单数量#; */
      set v_occur_qty = v_order_qty;
      #更新订单表

      /* set @交易佣金# = 0; */
      set v_trade_commis = 0;

      /* set @申报费用# = 0; */
      set v_report_fee = 0;

      /* set @撤单费用# = 0; */
      set v_wtdraw_fee = 0;

      /* set @交易费用# = 0; */
      set v_trade_fee = 0;

      /* set @应收保证金#=0; */
      set v_rece_margin=0;

      /* set @其他佣金#=0; */
      set v_other_commis=0;

      /* 调用【原子_交易期货_交易_撤销订单】*/
      call db_tdfutu.pra_tdfutd_CancelOrder(
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
          v_pass_no,
          v_out_acco,
          v_crncy_type,
          v_exch_no,
          v_futu_acco_no,
          v_futu_acco,
          v_contrc_code_no,
          v_contrc_code,
          v_external_no,
          v_order_date,
          v_order_id,
          v_trade_fee,
          v_order_status,
          v_report_date,
          v_report_time,
          v_report_no,
          v_wtdraw_batch_no,
          v_wtdraw_qty,
          v_wtdraw_remark,
          v_wtdraw_status,
          v_strike_qty,
          v_strike_amt,
          v_trade_commis,
          v_report_fee,
          v_wtdraw_fee,
          v_other_commis,
          v_error_code,
          v_error_info,
          v_wtdraw_id,
          v_update_times);
      if v_error_code = "1" then
          SET v_error_code = "tdfutuT.4.12.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_撤销订单出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


      /* set @应收保证金#=@临时_应收保证金#; */
      set v_rece_margin=v_tmp_rece_margin;
      #订单资金持仓反冲处理

      /* set @投资类型# = 1; */
      set v_invest_type = 1;

      /* set @计算方向# = 《计算方向-减去》; */
      set v_calc_dir = -1;

      /* set @交易费用#=-1*@临时_交易费用#; */
      set v_trade_fee=-1*v_tmp_trade_fee;

      /* set @应收保证金# = @计算方向# * @应收保证金#; */
      set v_rece_margin = v_calc_dir * v_rece_margin;

      /* set @订单保证金# = @应收保证金#; */
      set v_order_margin = v_rece_margin;

      /* set @多头持仓保证金#=@交易组多头应收保证金#; */
      set v_long_hold_margin=v_exgp_long_rece_margin;

      /* set @空头持仓保证金#=@交易组空头应收保证金#; */
      set v_short_hold_margin=v_exgp_short_rece_margin;
      #对保证金优惠进行处理

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
            SET v_error_code = "tdfutuT.4.12.999";
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
            SET v_error_code = "tdfutuT.4.12.999";
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

        /* set @实收保证金# = @应收保证金#; */
        set v_real_margin = v_rece_margin;

        /* set @交易变动金额# =@计算方向#* @实收保证金#; */
        set v_trade_occur_amt =v_calc_dir* v_real_margin;
      end if;

      /* set @交易变动数量# = @计算方向# * @订单数量#; */
      set v_trade_occur_qty = v_calc_dir * v_order_qty;

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
          SET v_error_code = "tdfutuT.4.12.999";
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

        /* set @多头订单保证金# = @应收保证金#; */
        set v_long_order_margin = v_rece_margin;
      else

        /* set @空头订单保证金# = @应收保证金#; */
        set v_short_order_margin = v_rece_margin;
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
            SET v_error_code = "tdfutuT.4.12.999";
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
            SET v_error_code = "tdfutuT.4.12.999";
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
      #平仓下单时,交易占用金额没有处理,因此撤单时也不进行处理

      /* if @开平方向# <> 《开平方向-开仓》 then */
      if v_contrc_dir <> 1 then

        /* set @交易变动金额#=0; */
        set v_trade_occur_amt=0;
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
          SET v_error_code = "tdfutuT.4.12.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新资产账户交易资金出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


      /* set @交易费用# = 0; */
      set v_trade_fee = 0;
      #更新交易系统数据
      #更新指令表

        /* if @指令序号# > 0 then */
        if v_comm_id > 0 then

            /* if @开平方向# = 《开平方向-开仓》 then */
            if v_contrc_dir = 1 then

                /* [获取表记录变量][交易期货_指令_指令表][{指令实际限价}][@指令实际限价#][{记录序号}=@指令序号#][1][@指令序号#] */
                select limit_actual_price into v_limit_actual_price from db_tdfutu.tb_tdfuap_command where row_id=v_comm_id limit 1;
                if FOUND_ROWS() = 0 then
                    ROLLBACK;        
                    SET v_error_code = "tdfutuT.4.12.1";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("指令序号=",v_comm_id);
                    end if;
                    leave label_pro;
                end if;


                /* set @指令保证金# = @指令实际限价#*@合约乘数# * @保证金比例#*@撤单数量#; */
                set v_comm_margin = v_limit_actual_price*v_contrc_unit * v_margin_ratio*v_wtdraw_qty;
            end if;

            /* if @组合编码# <> " " then */
            if v_comb_code <> " " then

                /* set @计算方向# = 《计算方向-加上》; */
                set v_calc_dir = 1;
                #指令保证金需要重新进行计算

                /* set @订单保证金# = 0; */
                set v_order_margin = 0;

                /* set @成交保证金# = 0; */
                set v_strike_margin = 0;

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
                    SET v_error_code = "tdfutuT.4.12.999";
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
                    SET v_error_code = "tdfutuT.4.12.999";
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
            else

                /* set @指令变动金额# = 0; */
                set v_comm_occur_amt = 0;
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
                SET v_error_code = "tdfutuT.4.12.999";
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
                    SET v_error_code = "tdfutuT.4.12.999";
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
                    SET v_error_code = "tdfutuT.4.12.999";
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
                SET v_error_code = "tdfutuT.4.12.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_撤销更新指令出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @指令变动数量# = @撤单数量#; */
            set v_comm_occur_qty = v_wtdraw_qty;

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
                SET v_error_code = "tdfutuT.4.12.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新资产账户交易资金出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;
      #交易资金持仓处理

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
          SET v_error_code = "tdfutuT.4.12.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新交易持仓出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


        /* if @撤单数量# > 0 then */
        if v_wtdraw_qty > 0 then

             /* set @废单数量# = 0; */
             set v_waste_qty = 0;

            /* 调用【原子_交易期货_交易_撤单处理汇总订单】*/
            call db_tdfutu.pra_tdfutd_CancelDealSumOrder(
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
                v_pass_no,
                v_order_date,
                v_order_batch_no,
                v_wtdraw_qty,
                v_waste_qty,
                v_order_oper_way,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdfutuT.4.12.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_撤单处理汇总订单出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;
    end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_pass_no = v_pass_no;
    SET p_crncy_type = v_crncy_type;
    SET p_futu_acco = v_futu_acco;
    SET p_contrc_code = v_contrc_code;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_dir = v_contrc_dir;
    SET p_hedge_type = v_hedge_type;
    SET p_external_no = v_external_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_limit_price = v_comm_limit_price;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_status = v_order_status;
    SET p_order_time = v_order_time;
    SET p_order_dir = v_order_dir;
    SET p_wtdraw_date = v_wtdraw_date;
    SET p_wtdraw_time = v_wtdraw_time;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_wtdraw_status = v_wtdraw_status;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_price = v_strike_price;
    SET p_calc_dir = v_calc_dir;
    SET p_occur_qty = v_occur_qty;
    SET p_occur_amt = v_occur_amt;
    SET p_trade_fee = v_trade_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_trade_capt_amt = v_trade_capt_amt;
    SET p_posi_capt_amt = v_posi_capt_amt;
    SET p_comb_code = v_comb_code;
    SET p_rece_margin = v_rece_margin;
    SET p_margin_ratio = v_margin_ratio;
    SET p_comm_margin = v_comm_margin;
    SET p_rsp_info = v_rsp_info;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_order_oper_way = v_order_oper_way;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_交易_查询报盘订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfutd_QueryRptOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfutd_QueryRptOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_row_count int,
    IN p_row_id bigint,
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
    declare v_pass_no int;
    declare v_row_count int;
    declare v_row_id bigint;
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
    SET v_pass_no = p_pass_no;
    SET v_row_count = p_row_count;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #if @指定行数# <=0 then
     # set @指定行数# = 1;
    #end if;
    #if @指定行数# > 50 then
      #set @指定行数# = 50;
    #end if;

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_交易期货_交易_查询报盘订单】*/
      call db_tdfutu.pra_tdfutd_QueryRptOrder(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_init_date,
          v_pass_no,
          v_row_count,
          v_row_id,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "tdfutuT.4.15.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_查询报盘订单出现错误！',v_mysql_message);
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

# 事务_交易期货_交易_查询报盘撤单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfutd_QueryRptCancelOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfutd_QueryRptCancelOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_row_count int,
    IN p_row_id bigint,
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
    declare v_pass_no int;
    declare v_row_count int;
    declare v_row_id bigint;
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
    SET v_pass_no = p_pass_no;
    SET v_row_count = p_row_count;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #if @指定行数# <=0 then
     # set @指定行数# = 1;
    #end if;
    #if @指定行数# > 50 then
     # set @指定行数# = 50;
    #end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易期货_交易_查询报盘撤单】*/
        call db_tdfutu.pra_tdfutd_QueryRptCancelOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pass_no,
            v_row_count,
            v_row_id,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.4.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_查询报盘撤单出现错误！',v_mysql_message);
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

# 事务_交易期货_交易_更新订单状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfutd_UpdateOrderStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfutd_UpdateOrderStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_order_status varchar(2),
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
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_order_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_rsp_info varchar(255);
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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_order_status = p_order_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_rsp_info = " ";
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @回报信息#=" "; */
        set v_rsp_info=" ";

        /* 调用【原子_交易期货_交易_更新订单状态】*/
        call db_tdfutu.pra_tdfutd_UpdateOrderStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_date,
            v_order_id,
            v_order_status,
            v_rsp_info,
            v_error_code,
            v_error_info,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.4.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_更新订单状态出现错误！',v_mysql_message);
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

# 事务_交易期货_交易_获取回报订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfutd_GetRspOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfutd_GetRspOrderInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_report_no varchar(32),
    IN p_report_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_crncy_type varchar(3),
    OUT p_futu_acco_no int,
    OUT p_futu_acco varchar(16),
    OUT p_contrc_code_no int,
    OUT p_contrc_code varchar(6),
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_contrc_dir int,
    OUT p_hedge_type int,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_qty decimal(18,2),
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_comb_code varchar(6),
    OUT p_rece_margin decimal(18,4),
    OUT p_order_oper_way varchar(2),
    OUT p_busi_opor_no int,
    OUT p_mac_addr varchar(32),
    OUT p_ip_addr varchar(32),
    OUT p_last_oper_info varchar(255),
    OUT p_order_batch_no int
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
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_report_no varchar(32);
    declare v_report_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_futu_acco_no int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_qty decimal(18,2);
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_rece_margin decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_mac_addr varchar(32);
    declare v_ip_addr varchar(32);
    declare v_last_oper_info varchar(255);
    declare v_order_batch_no int;

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
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_report_no = p_report_no;
    SET v_report_date = p_report_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_futu_acco_no = 0;
    SET v_futu_acco = " ";
    SET v_contrc_code_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_qty = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_qty = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_comb_code = " ";
    SET v_rece_margin = 0;
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_mac_addr = " ";
    SET v_ip_addr = " ";
    SET v_last_oper_info = " ";
    SET v_order_batch_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易期货_交易_获取回报订单信息】*/
    call db_tdfutu.pra_tdfutd_GetRspOrderInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_out_acco,
        v_exch_no,
        v_report_no,
        v_report_date,
        v_error_code,
        v_error_info,
        v_order_id,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_crncy_type,
        v_futu_acco_no,
        v_futu_acco,
        v_contrc_code_no,
        v_contrc_code,
        v_contrc_type,
        v_contrc_unit,
        v_contrc_dir,
        v_hedge_type,
        v_order_date,
        v_order_time,
        v_order_qty,
        v_order_dir,
        v_order_price,
        v_wtdraw_qty,
        v_strike_qty,
        v_trade_commis,
        v_other_commis,
        v_comb_code,
        v_rece_margin,
        v_order_oper_way,
        v_busi_opor_no,
        v_mac_addr,
        v_ip_addr,
        v_last_oper_info,
        v_order_batch_no);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.4.72.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_获取回报订单信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_id = v_order_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_crncy_type = v_crncy_type;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_futu_acco = v_futu_acco;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_code = v_contrc_code;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_contrc_dir = v_contrc_dir;
    SET p_hedge_type = v_hedge_type;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_qty = v_order_qty;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_comb_code = v_comb_code;
    SET p_rece_margin = v_rece_margin;
    SET p_order_oper_way = v_order_oper_way;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_mac_addr = v_mac_addr;
    SET p_ip_addr = v_ip_addr;
    SET p_last_oper_info = v_last_oper_info;
    SET p_order_batch_no = v_order_batch_no;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_交易_检查获取撤单订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfutd_CheckGetCancelOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfutd_CheckGetCancelOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_date int,
    IN p_order_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_busi_opor_no int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_exch_no int,
    OUT p_contrc_code_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code varchar(6),
    OUT p_contrc_type int,
    OUT p_contrc_dir int,
    OUT p_hedge_type int,
    OUT p_comb_code varchar(6),
    OUT p_comm_id bigint,
    OUT p_order_time int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_status varchar(2),
    OUT p_price_type int,
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_wtdraw_time int,
    OUT p_order_batch_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_contrc_code_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_comm_id bigint;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_status varchar(2);
    declare v_price_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_wtdraw_time int;
    declare v_order_batch_no int;

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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_opor_no = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_exch_no = 0;
    SET v_contrc_code_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_type = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_comb_code = " ";
    SET v_comm_id = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_status = "0";
    SET v_price_type = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_all_fee = 0;
    SET v_wtdraw_qty = 0;
    SET v_wtdraw_time = date_format(curtime(),'%H%i%s');
    SET v_order_batch_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易期货_交易_检查获取撤单订单信息】*/
    call db_tdfutu.pra_tdfutd_CheckGetCancelOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_date,
        v_order_id,
        v_error_code,
        v_error_info,
        v_busi_opor_no,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_pass_no,
        v_exch_no,
        v_futu_acco_no,
        v_contrc_code_no,
        v_contrc_code,
        v_contrc_type,
        v_contrc_dir,
        v_hedge_type,
        v_comb_code,
        v_comm_id,
        v_order_time,
        v_order_dir,
        v_order_price,
        v_order_qty,
        v_order_frozen_amt,
        v_order_status,
        v_price_type,
        v_strike_qty,
        v_strike_amt,
        v_all_fee,
        v_wtdraw_qty,
        v_wtdraw_time,
        v_order_batch_no);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.4.73.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_检查获取撤单订单信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_exch_no = v_exch_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code = v_contrc_code;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_dir = v_contrc_dir;
    SET p_hedge_type = v_hedge_type;
    SET p_comb_code = v_comb_code;
    SET p_comm_id = v_comm_id;
    SET p_order_time = v_order_time;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_status = v_order_status;
    SET p_price_type = v_price_type;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_all_fee = v_all_fee;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_wtdraw_time = v_wtdraw_time;
    SET p_order_batch_no = v_order_batch_no;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_交易_查询订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfutd_QueryOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfutd_QueryOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_pass_no int,
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code_no int,
    IN p_contrc_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_comm_opor int,
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_order_id bigint,
    IN p_order_dir_str varchar(1024),
    IN p_order_status_str varchar(64),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_pass_no int;
    declare v_exch_no_str varchar(2048);
    declare v_contrc_code_no int;
    declare v_contrc_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_dir_str varchar(1024);
    declare v_order_status_str varchar(64);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_opor = p_comm_opor;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_id = p_order_id;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_status_str = p_order_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数# > 500 or @指定行数# <1 then */
    if v_row_count > 500 or v_row_count <1 then

      /* set @指定行数# = 500; */
      set v_row_count = 500;
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串# = concat(";", @市场编号串#, ";"); */
        set v_exch_no_str = concat(";", v_exch_no_str, ";");
    end if;

    /* if @合约类型串# <> " " then */
    if v_contrc_type_str <> " " then

        /* set @合约类型串# = concat(";", @合约类型串#, ";"); */
        set v_contrc_type_str = concat(";", v_contrc_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串# = concat(";", @订单方向串#, ";"); */
        set v_order_dir_str = concat(";", v_order_dir_str, ";");
    end if;

    /* if @订单状态串# <> " " then */
    if v_order_status_str <> " " then

        /* set @订单状态串# = concat(";", @订单状态串#, ";"); */
        set v_order_status_str = concat(";", v_order_status_str, ";");
    end if;

    /* 调用【原子_交易期货_交易_查询订单】*/
    call db_tdfutu.pra_tdfutd_QueryOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_opor_no,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_pass_no,
        v_exch_no_str,
        v_contrc_code_no,
        v_contrc_type_str,
        v_comm_id,
        v_comm_batch_no,
        v_comm_opor,
        v_external_no,
        v_order_batch_no,
        v_order_id,
        v_order_dir_str,
        v_order_status_str,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.4.101.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_查询订单出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_交易_查询订单历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfutd_QueryRptOrder_His;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfutd_QueryRptOrder_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_busi_opor_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_pass_no int,
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code_no int,
    IN p_contrc_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_comm_opor int,
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_order_id bigint,
    IN p_order_dir_str varchar(1024),
    IN p_order_status_str varchar(64),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_pass_no int;
    declare v_exch_no_str varchar(2048);
    declare v_contrc_code_no int;
    declare v_contrc_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_dir_str varchar(1024);
    declare v_order_status_str varchar(64);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_opor = p_comm_opor;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_id = p_order_id;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_status_str = p_order_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数# > 500 or @指定行数# <1 then */
    if v_row_count > 500 or v_row_count <1 then

      /* set @指定行数# = 500; */
      set v_row_count = 500;
    end if;

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdfutuT.4.102.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdfutuT.4.102.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>93 then
        
        SET v_error_code = "tdfutuT.4.102.255";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串# = concat(";", @市场编号串#, ";"); */
        set v_exch_no_str = concat(";", v_exch_no_str, ";");
    end if;

    /* if @合约类型串# <> " " then */
    if v_contrc_type_str <> " " then

        /* set @合约类型串# = concat(";", @合约类型串#, ";"); */
        set v_contrc_type_str = concat(";", v_contrc_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串# = concat(";", @订单方向串#, ";"); */
        set v_order_dir_str = concat(";", v_order_dir_str, ";");
    end if;

    /* if @订单状态串# <> " " then */
    if v_order_status_str <> " " then

        /* set @订单状态串# = concat(";", @订单状态串#, ";"); */
        set v_order_status_str = concat(";", v_order_status_str, ";");
    end if;

    /* 调用【原子_交易期货_交易_查询订单历史】*/
    call db_tdfutu.pra_tdfutd_QueryOrder_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_busi_opor_no,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_pass_no,
        v_exch_no_str,
        v_contrc_code_no,
        v_contrc_type_str,
        v_comm_id,
        v_comm_batch_no,
        v_comm_opor,
        v_external_no,
        v_order_batch_no,
        v_order_id,
        v_order_dir_str,
        v_order_status_str,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.4.102.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_查询订单历史出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_交易_根据订单序号串查询订单结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfutd_QueryOrderListByOrderIdStr;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfutd_QueryOrderListByOrderIdStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_id_str varchar(2048),
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
    declare v_order_id_str varchar(2048);
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
    SET v_order_id_str = p_order_id_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易期货_交易_根据订单序号串查询订单结果集】*/
    call db_tdfutu.pra_tdfutd_QueryOrderListByOrderIdStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_id_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.4.17.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_根据订单序号串查询订单结果集出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_交易_根据订单序号串查询撤单结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfutd_QueryCancelOrderListByOrderIdStr;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfutd_QueryCancelOrderListByOrderIdStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_id_str varchar(2048),
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
    declare v_order_id_str varchar(2048);
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
    SET v_order_id_str = p_order_id_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易期货_交易_根据订单序号串查询撤单结果集】*/
    call db_tdfutu.pra_tdfutd_QueryCancelOrderListByOrderIdStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_id_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.4.18.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_根据订单序号串查询撤单结果集出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_交易_获取订单汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_GetSumOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_GetSumOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_date int,
    IN p_order_batch_no int,
    IN p_co_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_oper_func_code varchar(16),
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_code varchar(6),
    OUT p_asset_type int,
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_external_no bigint,
    OUT p_order_dir int,
    OUT p_contrc_dir int,
    OUT p_hedge_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_sum_status varchar(2),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_waste_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_aver_price decimal(16,9),
    OUT p_strike_amt decimal(18,4),
    OUT p_trade_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_strike_commis decimal(18,4),
    OUT p_strike_other_commis decimal(18,4),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_strike_all_fee decimal(18,4),
    OUT p_rece_margin decimal(18,4),
    OUT p_order_oper_way varchar(2),
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
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_co_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_asset_type int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_external_no bigint;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_sum_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_waste_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_aver_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_update_times int;
    declare v_all_fee decimal(18,4);

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
    SET v_order_date = p_order_date;
    SET v_order_batch_no = p_order_batch_no;
    SET v_co_no = p_co_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_code = " ";
    SET v_asset_type = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_external_no = 0;
    SET v_order_dir = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_sum_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_waste_qty = 0;
    SET v_strike_qty = 0;
    SET v_strike_aver_price = 0;
    SET v_strike_amt = 0;
    SET v_trade_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_strike_all_fee = 0;
    SET v_rece_margin = 0;
    SET v_order_oper_way = " ";
    SET v_update_times = 1;
    SET v_all_fee = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易期货_交易_获取订单汇总】*/
    call db_tdfutu.pra_tdfuap_GetSumOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_date,
        v_order_batch_no,
        v_co_no,
        v_error_code,
        v_error_info,
        v_row_id,
        v_oper_func_code,
        v_init_date,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_pass_no,
        v_crncy_type,
        v_exch_no,
        v_contrc_code_no,
        v_contrc_code,
        v_asset_type,
        v_contrc_type,
        v_contrc_unit,
        v_external_no,
        v_order_dir,
        v_contrc_dir,
        v_hedge_type,
        v_order_price,
        v_order_qty,
        v_order_sum_status,
        v_wtdraw_qty,
        v_waste_qty,
        v_strike_qty,
        v_strike_aver_price,
        v_strike_amt,
        v_all_fee,
        v_trade_commis,
        v_other_commis,
        v_strike_commis,
        v_strike_other_commis,
        v_report_fee,
        v_wtdraw_fee,
        v_strike_all_fee,
        v_rece_margin,
        v_order_oper_way,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.4.19.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_获取订单汇总出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_oper_func_code = v_oper_func_code;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_code = v_contrc_code;
    SET p_asset_type = v_asset_type;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_external_no = v_external_no;
    SET p_order_dir = v_order_dir;
    SET p_contrc_dir = v_contrc_dir;
    SET p_hedge_type = v_hedge_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_sum_status = v_order_sum_status;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_waste_qty = v_waste_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_aver_price = v_strike_aver_price;
    SET p_strike_amt = v_strike_amt;
    SET p_trade_fee = v_trade_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_strike_commis = v_strike_commis;
    SET p_strike_other_commis = v_strike_other_commis;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_strike_all_fee = v_strike_all_fee;
    SET p_rece_margin = v_rece_margin;
    SET p_order_oper_way = v_order_oper_way;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_交易_查询汇总订单结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_QuerySumOrderList;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_QuerySumOrderList(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_pass_no int,
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code_no int,
    IN p_contrc_type_str varchar(2048),
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_order_id bigint,
    IN p_order_dir_str varchar(1024),
    IN p_order_sum_status_str varchar(64),
    IN p_order_oper_way varchar(2),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_pass_no int;
    declare v_exch_no_str varchar(2048);
    declare v_contrc_code_no int;
    declare v_contrc_type_str varchar(2048);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_dir_str varchar(1024);
    declare v_order_sum_status_str varchar(64);
    declare v_order_oper_way varchar(2);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_status_str varchar(64);

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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_id = p_order_id;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_sum_status_str = p_order_sum_status_str;
    SET v_order_oper_way = p_order_oper_way;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_status_str = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @合约类型串# <> " " then */
    if v_contrc_type_str <> " " then

        /* set @合约类型串#=concat(";", @合约类型串#, ";"); */
        set v_contrc_type_str=concat(";", v_contrc_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* if @订单状态串# <> " " then */
    if v_order_status_str <> " " then

        /* set @订单状态串#=concat(";", @订单状态串#, ";"); */
        set v_order_status_str=concat(";", v_order_status_str, ";");
    end if;

    /* 调用【原子_交易期货_交易_查询汇总订单结果集】*/
    call db_tdfutu.pra_tdfuap_QuerySumOrderList(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_opor_no,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_pass_no,
        v_exch_no_str,
        v_contrc_code_no,
        v_contrc_type_str,
        v_external_no,
        v_order_batch_no,
        v_order_id,
        v_order_dir_str,
        v_order_status_str,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.4.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_查询汇总订单结果集出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_交易_查询历史汇总订单结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_QueryHisSumOrderList;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_QueryHisSumOrderList(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_busi_opor_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_pass_no int,
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code_no int,
    IN p_contrc_type_str varchar(2048),
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_order_id bigint,
    IN p_order_dir_str varchar(1024),
    IN p_order_sum_status_str varchar(64),
    IN p_order_oper_way varchar(2),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_pass_no int;
    declare v_exch_no_str varchar(2048);
    declare v_contrc_code_no int;
    declare v_contrc_type_str varchar(2048);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_dir_str varchar(1024);
    declare v_order_sum_status_str varchar(64);
    declare v_order_oper_way varchar(2);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_status_str varchar(64);

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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_id = p_order_id;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_sum_status_str = p_order_sum_status_str;
    SET v_order_oper_way = p_order_oper_way;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_status_str = " ";

    
    label_pro:BEGIN
    

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdfutuT.4.22.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdfutuT.4.22.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>93 then
        
        SET v_error_code = "tdfutuT.4.22.255";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @合约类型串# <> " " then */
    if v_contrc_type_str <> " " then

        /* set @合约类型串#=concat(";", @合约类型串#, ";"); */
        set v_contrc_type_str=concat(";", v_contrc_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* if @订单状态串# <> " " then */
    if v_order_status_str <> " " then

        /* set @订单状态串#=concat(";", @订单状态串#, ";"); */
        set v_order_status_str=concat(";", v_order_status_str, ";");
    end if;

    /* 调用【原子_交易期货_交易_查询历史汇总订单结果集】*/
    call db_tdfutu.pra_tdfuap_QueryHisSumOrderList(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_busi_opor_no,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_pass_no,
        v_exch_no_str,
        v_contrc_code_no,
        v_contrc_type_str,
        v_external_no,
        v_order_batch_no,
        v_order_id,
        v_order_dir_str,
        v_order_sum_status_str,
        v_order_oper_way,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.4.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_查询历史汇总订单结果集出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_交易_新增改单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_AddModiOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_AddModiOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_modi_batch_no int,
    IN p_modi_order_price decimal(16,9),
    IN p_modi_order_qty decimal(18,2),
    IN p_modi_price_type int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_exgp_long_rece_margin decimal(18,4),
    IN p_exgp_short_rece_margin decimal(18,4),
    IN p_asac_long_rece_margin decimal(18,4),
    IN p_asac_short_rece_margin decimal(18,4),
    IN p_pre_settle_price decimal(16,9),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_asset_acco varchar(16),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_trade_code_no int,
    OUT p_trade_code varchar(6),
    OUT p_contrc_code varchar(6),
    OUT p_report_no varchar(32),
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_comm_id bigint,
    OUT p_modi_order_id bigint,
    OUT p_new_order_id bigint,
    OUT p_order_dir int,
    OUT p_contrc_dir int,
    OUT p_hedge_type int,
    OUT p_order_qty decimal(18,2),
    OUT p_order_price decimal(16,9),
    OUT p_order_batch_no int,
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_comm_date int,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_wtdraw_id bigint,
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_wtdraw_status varchar(2),
    OUT p_wtdraw_date int,
    OUT p_wtdraw_time int,
    OUT p_rsp_info varchar(255),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_compli_trig_id bigint,
    OUT p_old_order_status varchar(2),
    OUT p_new_order_status varchar(2),
    OUT p_order_status varchar(2),
    OUT p_contrc_name varchar(64),
    OUT p_order_oper_way varchar(2),
    OUT p_rece_margin decimal(18,4),
    OUT p_strike_price decimal(16,9),
    OUT p_trade_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_margin_ratio decimal(18,12),
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
    declare v_init_date int;
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_modi_batch_no int;
    declare v_modi_order_price decimal(16,9);
    declare v_modi_order_qty decimal(18,2);
    declare v_modi_price_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exgp_long_rece_margin decimal(18,4);
    declare v_exgp_short_rece_margin decimal(18,4);
    declare v_asac_long_rece_margin decimal(18,4);
    declare v_asac_short_rece_margin decimal(18,4);
    declare v_pre_settle_price decimal(16,9);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_asset_acco varchar(16);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_trade_code_no int;
    declare v_trade_code varchar(6);
    declare v_contrc_code varchar(6);
    declare v_report_no varchar(32);
    declare v_report_date int;
    declare v_report_time int;
    declare v_comm_id bigint;
    declare v_modi_order_id bigint;
    declare v_new_order_id bigint;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_order_batch_no int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_wtdraw_id bigint;
    declare v_wtdraw_qty decimal(18,2);
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_date int;
    declare v_wtdraw_time int;
    declare v_rsp_info varchar(255);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_compli_trig_id bigint;
    declare v_old_order_status varchar(2);
    declare v_new_order_status varchar(2);
    declare v_order_status varchar(2);
    declare v_contrc_name varchar(64);
    declare v_order_oper_way varchar(2);
    declare v_rece_margin decimal(18,4);
    declare v_strike_price decimal(16,9);
    declare v_trade_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_margin_ratio decimal(18,12);
    declare v_update_times int;
    declare v_deal_flag int;
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_price_type int;
    declare v_strike_fee decimal(18,4);
    declare v_is_record_jour int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_external_no bigint;
    declare v_asset_type int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_order_time int;
    declare v_comb_code varchar(6);
    declare v_futu_acco varchar(16);
    declare v_busi_opor_no int;
    declare v_lngsht_type int;
    declare v_tmp_trade_fee decimal(18,4);
    declare v_tmp_rece_margin decimal(18,4);
    declare v_tmp_order_qty decimal(18,2);
    declare v_pass_status varchar(2);
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_remark varchar(255);
    declare v_occur_qty decimal(18,2);
    declare v_invest_type int;
    declare v_calc_dir int;
    declare v_order_margin decimal(18,4);
    declare v_long_comm_margin decimal(18,4);
    declare v_short_comm_margin decimal(18,4);
    declare v_long_order_margin decimal(18,4);
    declare v_short_order_margin decimal(18,4);
    declare v_long_strike_margin decimal(18,4);
    declare v_short_strike_margin decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_posi_capt_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_row_id bigint;
    declare v_comm_margin decimal(18,4);
    declare v_strike_margin decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_strike_occur_amt decimal(18,4);
    declare v_comm_occur_amt decimal(18,4);
    declare v_trade_capt_amt_after decimal(18,4);
    declare v_posi_capt_amt_after decimal(18,4);
    declare v_comm_capt_amt_after decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_strike_capt_amt decimal(18,4);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_comm_occur_qty decimal(18,2);
    declare v_modi_order_date int;
    declare v_modi_order_status varchar(2);
    declare v_waste_qty decimal(18,2);

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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_modi_batch_no = p_modi_batch_no;
    SET v_modi_order_price = p_modi_order_price;
    SET v_modi_order_qty = p_modi_order_qty;
    SET v_modi_price_type = p_modi_price_type;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exgp_long_rece_margin = p_exgp_long_rece_margin;
    SET v_exgp_short_rece_margin = p_exgp_short_rece_margin;
    SET v_asac_long_rece_margin = p_asac_long_rece_margin;
    SET v_asac_short_rece_margin = p_asac_short_rece_margin;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_asset_acco = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_trade_code_no = 0;
    SET v_trade_code = " ";
    SET v_contrc_code = " ";
    SET v_report_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_comm_id = 0;
    SET v_modi_order_id = 0;
    SET v_new_order_id = 0;
    SET v_order_dir = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_order_qty = 0;
    SET v_order_price = 0;
    SET v_order_batch_no = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_wtdraw_id = 0;
    SET v_wtdraw_qty = 0;
    SET v_wtdraw_status = "0";
    SET v_wtdraw_date = date_format(curdate(),'%Y%m%d');
    SET v_wtdraw_time = date_format(curtime(),'%H%i%s');
    SET v_rsp_info = " ";
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_compli_trig_id = 0;
    SET v_old_order_status = "0";
    SET v_new_order_status = "0";
    SET v_order_status = "0";
    SET v_contrc_name = " ";
    SET v_order_oper_way = " ";
    SET v_rece_margin = 0;
    SET v_strike_price = 0;
    SET v_trade_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_margin_ratio = 0;
    SET v_update_times = 1;
    SET v_deal_flag = 0;
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_price_type = 0;
    SET v_strike_fee = 0;
    SET v_is_record_jour = 1;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_external_no = 0;
    SET v_asset_type = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_comb_code = " ";
    SET v_futu_acco = " ";
    SET v_busi_opor_no = 0;
    SET v_lngsht_type = 0;
    SET v_tmp_trade_fee = 0;
    SET v_tmp_rece_margin = 0;
    SET v_tmp_order_qty = 0;
    SET v_pass_status = "0";
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_wtdraw_batch_no = 0;
    SET v_wtdraw_remark = " ";
    SET v_occur_qty = 0;
    SET v_invest_type = 0;
    SET v_calc_dir = 1;
    SET v_order_margin = 0;
    SET v_long_comm_margin = 0;
    SET v_short_comm_margin = 0;
    SET v_long_order_margin = 0;
    SET v_short_order_margin = 0;
    SET v_long_strike_margin = 0;
    SET v_short_strike_margin = 0;
    SET v_trade_capt_amt = 0;
    SET v_posi_capt_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_row_id = 0;
    SET v_comm_margin = 0;
    SET v_strike_margin = 0;
    SET v_trade_occur_amt = 0;
    SET v_strike_occur_amt = 0;
    SET v_comm_occur_amt = 0;
    SET v_trade_capt_amt_after = 0;
    SET v_posi_capt_amt_after = 0;
    SET v_comm_capt_amt_after = 0;
    SET v_trade_occur_qty = 0;
    SET v_strike_capt_amt = 0;
    SET v_comm_cancel_qty = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_status = "0";
    SET v_comm_occur_qty = 0;
    SET v_modi_order_date = date_format(curdate(),'%Y%m%d');
    SET v_modi_order_status = " ";
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @处理标志# = 0; */
    set v_deal_flag = 0;

    /* SET @撤单日期# = @初始化日期#; */
    SET v_wtdraw_date = v_init_date;

    /* SET @申报日期# = @订单日期#; */
    SET v_report_date = v_order_date;

    /* set @多头持仓保证金#=@交易组多头应收保证金#; */
    set v_long_hold_margin=v_exgp_long_rece_margin;

    /* set @空头持仓保证金#=@交易组空头应收保证金#; */
    set v_short_hold_margin=v_exgp_short_rece_margin;

    /* set @价格类型# = @改单价格类型#; */
    set v_price_type = v_modi_price_type;

    /* set @成交费用#=0; */
    set v_strike_fee=0;

    /* if @改单价格类型# = 0 then */
    if v_modi_price_type = 0 then

      /* set @改单价格类型# = 《价格类型-限价》; */
      set v_modi_price_type = 1;
    end if;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;
    #检查是否有重复的有效记录

    /* 调用【原子_交易期货_交易_检查重复改单】*/
    call db_tdfutu.pra_tdfuap_CheckDupliModiOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_date,
        v_order_id,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.4.23.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_检查重复改单出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #修改后是否符合指令要求，不符合直接报错提示

    /* if @指令序号# <> 0 then */
    if v_comm_id <> 0 then

      /* 调用【原子_交易期货_指令_检查改单指令业务】*/
      call db_tdfutu.pra_tdfuap_CheckModiOrderComm(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_init_date,
          v_comm_id,
          v_order_date,
          v_order_id,
          v_modi_batch_no,
          v_modi_order_price,
          v_modi_order_qty,
          v_modi_price_type,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "tdfutuT.4.23.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_检查改单指令业务出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

    end if;

    /* [事务开始] */
    START TRANSACTION;

        #取原委托信息

        /* 调用【原子_交易期货_交易_锁定获取订单回报订单信息】*/
        call db_tdfutu.pra_tdfutd_LockGetRspOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_id,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_external_no,
            v_asset_type,
            v_contrc_type,
            v_contrc_unit,
            v_contrc_dir,
            v_hedge_type,
            v_report_fee,
            v_order_dir,
            v_order_time,
            v_order_price,
            v_order_qty,
            v_order_status,
            v_strike_qty,
            v_strike_amt,
            v_wtdraw_fee,
            v_wtdraw_qty,
            v_strike_price,
            v_trade_fee,
            v_trade_commis,
            v_other_commis,
            v_comm_id,
            v_comm_batch_no,
            v_comb_code,
            v_rece_margin,
            v_margin_ratio,
            v_compli_trig_id,
            v_order_batch_no,
            v_order_oper_way,
            v_pass_no,
            v_out_acco,
            v_exch_no,
            v_futu_acco,
            v_contrc_code,
            v_report_time,
            v_report_no,
            v_busi_opor_no);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.4.23.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_锁定获取订单回报订单信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


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
            SET v_error_code = "tdfutuT.4.23.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_获取多空类型出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set  @临时_交易费用#=@交易费用#; */
        set  v_tmp_trade_fee=v_trade_fee;

        /* set @临时_应收保证金#=@应收保证金#; */
        set v_tmp_rece_margin=v_rece_margin;

        /* [检查报错返回][@改单数量# <= @成交数量# ][757][@改单数量#,@成交数量#] */
        if v_modi_order_qty <= v_strike_qty  then
            ROLLBACK;
            SET v_error_code = "tdfutuT.4.23.757";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("改单数量=",v_modi_order_qty,",","成交数量=",v_strike_qty),"#",v_mysql_message);
            else
                SET v_error_info = concat("改单数量=",v_modi_order_qty,",","成交数量=",v_strike_qty);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@改单价格类型# = 《价格类型-限价》 and (@改单价格# <=(0))][756][@改单价格类型#,@改单价格#] */
        if v_modi_price_type = 1 and (v_modi_order_price <=(0)) then
            ROLLBACK;
            SET v_error_code = "tdfutuT.4.23.756";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("改单价格类型=",v_modi_price_type,",","改单价格=",v_modi_order_price),"#",v_mysql_message);
            else
                SET v_error_info = concat("改单价格类型=",v_modi_price_type,",","改单价格=",v_modi_order_price);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@订单状态# <> 《订单状态-未报》 and @订单状态# <> 《订单状态-已报》  and @订单状态# <> 《订单状态-部成》 ][717]["请检查订单状态，订单状态只能为未报、已报、部成"] */
        if v_order_status <> "1" and v_order_status <> "2"  and v_order_status <> "5"  then
            ROLLBACK;
            SET v_error_code = "tdfutuT.4.23.717";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("请检查订单状态，订单状态只能为未报、已报、部成","#",v_mysql_message);
            else
                SET v_error_info = "请检查订单状态，订单状态只能为未报、已报、部成";
            end if;
            leave label_pro;
        end if;


        /* set @临时_订单数量# = @订单数量#; */
        set v_tmp_order_qty = v_order_qty;
        #判断原委托状态,非允许撤单状态及不可改单则报错返回, 1-未报 2-已报 5-部成

        /* if @订单状态# <> 《订单状态-未报》 then */
        if v_order_status <> "1" then
            #非未报订单,只修改订单状态， 3-待撤

            /* set @订单状态# = 《订单状态-待撤》; */
            set v_order_status = "3";

            /* set @撤单状态# = 《撤单状态-未报》; */
            set v_wtdraw_status = "1";

            /* 调用【原子_交易期货_公用_获取通道状态】*/
            call db_tdfutu.pra_tdfupb_GetChannelStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_pass_no,
                v_error_code,
                v_error_info,
                v_pass_status);
            if v_error_code = "1" then
                SET v_error_code = "tdfutuT.4.23.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_公用_获取通道状态出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* if @通道状态# = 《通道状态-正常》 then */
            if v_pass_status = "1" then

                /* set @撤单状态# = 《撤单状态-已报》; */
                set v_wtdraw_status = "2";
            end if;
            #事务内获取撤单批号，分机构存放

            /* set @编号类型# = 《编号类型-撤单批号》; */
            set v_record_no_type = 16;

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
                SET v_error_code = "tdfutuT.4.23.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_公用_获取业务记录编号出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @撤单批号# = @当前编号#; */
            set v_wtdraw_batch_no = v_curr_no;

            /* set @撤单说明# = "新增改单自动撤消！"; */
            set v_wtdraw_remark = "新增改单自动撤消！";

            /* set @撤单数量# = 0; */
            set v_wtdraw_qty = 0;

            /* set @订单冻结金额# = 0; */
            set v_order_frozen_amt = 0;

            /* 调用【原子_交易期货_交易_撤销订单】*/
            call db_tdfutu.pra_tdfutd_CancelOrder(
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
                v_pass_no,
                v_out_acco,
                v_crncy_type,
                v_exch_no,
                v_futu_acco_no,
                v_futu_acco,
                v_contrc_code_no,
                v_contrc_code,
                v_external_no,
                v_order_date,
                v_order_id,
                v_trade_fee,
                v_order_status,
                v_report_date,
                v_report_time,
                v_report_no,
                v_wtdraw_batch_no,
                v_wtdraw_qty,
                v_wtdraw_remark,
                v_wtdraw_status,
                v_strike_qty,
                v_strike_amt,
                v_trade_commis,
                v_report_fee,
                v_wtdraw_fee,
                v_other_commis,
                v_error_code,
                v_error_info,
                v_wtdraw_id,
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "tdfutuT.4.23.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_撤销订单出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        else
          #未报撤单处理逻辑，修改订单状态为已撤

          /* set @订单状态# = 《订单状态-已撤》; */
          set v_order_status = "4";

          /* set @撤单状态# = 《撤单状态-成功》; */
          set v_wtdraw_status = "3";

          /* set @撤单数量# = @订单数量#; */
          set v_wtdraw_qty = v_order_qty;

          /* set @变动数量# = @订单数量#; */
          set v_occur_qty = v_order_qty;
          #更新交易系统数据
          #更新订单表

          /* set @交易佣金# = 0; */
          set v_trade_commis = 0;

          /* set @申报费用# = 0; */
          set v_report_fee = 0;

          /* set @撤单费用# = 0; */
          set v_wtdraw_fee = 0;

          /* set @交易费用# = 0; */
          set v_trade_fee = 0;

          /* set @应收保证金#=0; */
          set v_rece_margin=0;

          /* 调用【原子_交易期货_交易_撤销订单】*/
          call db_tdfutu.pra_tdfutd_CancelOrder(
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
              v_pass_no,
              v_out_acco,
              v_crncy_type,
              v_exch_no,
              v_futu_acco_no,
              v_futu_acco,
              v_contrc_code_no,
              v_contrc_code,
              v_external_no,
              v_order_date,
              v_order_id,
              v_trade_fee,
              v_order_status,
              v_report_date,
              v_report_time,
              v_report_no,
              v_wtdraw_batch_no,
              v_wtdraw_qty,
              v_wtdraw_remark,
              v_wtdraw_status,
              v_strike_qty,
              v_strike_amt,
              v_trade_commis,
              v_report_fee,
              v_wtdraw_fee,
              v_other_commis,
              v_error_code,
              v_error_info,
              v_wtdraw_id,
              v_update_times);
          if v_error_code = "1" then
              SET v_error_code = "tdfutuT.4.23.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_撤销订单出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;


          /* set @应收保证金#=@临时_应收保证金#; */
          set v_rece_margin=v_tmp_rece_margin;
          #订单资金持仓反冲处理

          /* set @投资类型# = 1; */
          set v_invest_type = 1;

          /* set @计算方向# = 《计算方向-减去》; */
          set v_calc_dir = -1;

          /* set @交易费用#=-1*@临时_交易费用#; */
          set v_trade_fee=-1*v_tmp_trade_fee;

          /* set @订单保证金# = @计算方向# * @应收保证金#; */
          set v_order_margin = v_calc_dir * v_rece_margin;

          /* set @多头持仓保证金#=@交易组多头应收保证金#; */
          set v_long_hold_margin=v_exgp_long_rece_margin;

          /* set @空头持仓保证金#=@交易组空头应收保证金#; */
          set v_short_hold_margin=v_exgp_short_rece_margin;
          #对保证金优惠进行处理

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
                SET v_error_code = "tdfutuT.4.23.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_锁定获取保证金优惠信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @指令保证金# = 0; */
            set v_comm_margin = 0;

            /* set @成交保证金# = 0; */
            set v_strike_margin = 0;

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
                SET v_error_code = "tdfutuT.4.23.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_计算实收保证金出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @交易占用金额# = @交易占用后金额#; */
            set v_trade_capt_amt = v_trade_capt_amt_after;

            /* set @持仓占用金额# = @持仓占用后金额#; */
            set v_posi_capt_amt = v_posi_capt_amt_after;
          else

            /* set @交易变动金额# =@订单保证金#; */
            set v_trade_occur_amt =v_order_margin;
          end if;

          /* set @交易费用#=@计算方向#*@临时_交易费用#; */
          set v_trade_fee=v_calc_dir*v_tmp_trade_fee;

          /* set @交易变动数量# = @计算方向# * @订单数量#; */
          set v_trade_occur_qty = v_calc_dir * v_order_qty;

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
              SET v_error_code = "tdfutuT.4.23.999";
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

            /* set @多头订单保证金# = @订单保证金#; */
            set v_long_order_margin = v_order_margin;
          else

            /* set @空头订单保证金# = @订单保证金#; */
            set v_short_order_margin = v_order_margin;
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
                SET v_error_code = "tdfutuT.4.23.999";
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
                SET v_error_code = "tdfutuT.4.23.999";
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
          #平仓下单时,交易占用金额没有处理,因此撤单时也不进行处理

          /* if @开平方向# <> 《开平方向-开仓》 then */
          if v_contrc_dir <> 1 then

            /* set @交易变动金额#=0; */
            set v_trade_occur_amt=0;
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
              SET v_error_code = "tdfutuT.4.23.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新资产账户交易资金出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;

          #更新指令表

            /* if @指令序号# > 0 then */
            if v_comm_id > 0 then

                /* if @组合编码# <> " " then */
                if v_comb_code <> " " then

                    /* set @计算方向# = 《计算方向-加上》; */
                    set v_calc_dir = 1;

                    /* set @指令保证金# =  @计算方向#* @应收保证金#; */
                    set v_comm_margin =  v_calc_dir* v_rece_margin;

                    /* set @订单保证金# = 0; */
                    set v_order_margin = 0;

                    /* set @成交保证金# = 0; */
                    set v_strike_margin = 0;

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
                        SET v_error_code = "tdfutuT.4.23.999";
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
                        SET v_error_code = "tdfutuT.4.23.999";
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
                else

                    /* set @指令变动金额# = 0; */
                    set v_comm_occur_amt = 0;
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
                    SET v_error_code = "tdfutuT.4.23.999";
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
                        SET v_error_code = "tdfutuT.4.23.999";
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
                        SET v_error_code = "tdfutuT.4.23.999";
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
                    SET v_error_code = "tdfutuT.4.23.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新资产账户交易资金出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


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
                    SET v_error_code = "tdfutuT.4.23.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_撤销更新指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @指令变动金额# =@应收保证金#; */
                set v_comm_occur_amt =v_rece_margin;

                /* set @指令变动数量# = @撤单数量#; */
                set v_comm_occur_qty = v_wtdraw_qty;
            end if;
          #交易资金持仓处理

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
              SET v_error_code = "tdfutuT.4.23.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新交易持仓出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;

        end if;
        #改单处理

        /* set @改单日期# = @订单日期#; */
        set v_modi_order_date = v_order_date;

        /* set @改单状态# = 《改单状态-新建》; */
        set v_modi_order_status = "1";

        /* 调用【原子_交易期货_交易_新增改单】*/
        call db_tdfutu.pra_tdfuap_AddModiOrder(
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
            v_pass_no,
            v_exch_no,
            v_contrc_code_no,
            v_contrc_code,
            v_contrc_type,
            v_asset_type,
            v_contrc_dir,
            v_hedge_type,
            v_modi_order_date,
            v_modi_batch_no,
            v_order_id,
            v_comm_id,
            v_order_price,
            v_order_qty,
            v_order_dir,
            v_order_date,
            v_order_time,
            v_price_type,
            v_modi_order_status,
            v_modi_order_price,
            v_modi_order_qty,
            v_modi_price_type,
            v_crncy_type,
            v_exch_crncy_type,
            v_order_oper_way,
            v_error_code,
            v_error_info,
            v_modi_order_id);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.4.23.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_新增改单出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* if @订单状态# = 《订单状态-已撤》 then */
    if v_order_status = "4" then

            /* set @订单数量# = 0; */
            set v_order_qty = 0;

            /* set @废单数量# = 0; */
            set v_waste_qty = 0;

            /* 调用【原子_交易期货_交易_订单处理汇总订单】*/
            call db_tdfutu.pra_tdfutd_OrderDealSumOrder(
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
                v_pass_no,
                v_crncy_type,
                v_exch_no,
                v_contrc_code_no,
                v_contrc_code,
                v_contrc_type,
                v_asset_type,
                v_order_date,
                v_order_batch_no,
                v_order_dir,
                v_order_price,
                v_order_qty,
                v_order_status,
                v_wtdraw_qty,
                v_waste_qty,
                v_rece_margin,
                v_order_oper_way,
                v_contrc_unit,
                v_external_no,
                v_contrc_dir,
                v_hedge_type,
                v_trade_fee,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdfutuT.4.23.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_订单处理汇总订单出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

    end if;

    /* [事务结束] */
    COMMIT;

    #输出主推数据

    /* set @订单数量# = @临时_订单数量#; */
    set v_order_qty = v_tmp_order_qty;

    /* set @更新次数# = @更新次数# + 1; */
    set v_update_times = v_update_times + 1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_asset_acco = v_asset_acco;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_no = v_exch_no;
    SET p_trade_code_no = v_trade_code_no;
    SET p_trade_code = v_trade_code;
    SET p_contrc_code = v_contrc_code;
    SET p_report_no = v_report_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_comm_id = v_comm_id;
    SET p_modi_order_id = v_modi_order_id;
    SET p_new_order_id = v_new_order_id;
    SET p_order_dir = v_order_dir;
    SET p_contrc_dir = v_contrc_dir;
    SET p_hedge_type = v_hedge_type;
    SET p_order_qty = v_order_qty;
    SET p_order_price = v_order_price;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_comm_date = v_comm_date;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_wtdraw_id = v_wtdraw_id;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_wtdraw_status = v_wtdraw_status;
    SET p_wtdraw_date = v_wtdraw_date;
    SET p_wtdraw_time = v_wtdraw_time;
    SET p_rsp_info = v_rsp_info;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_old_order_status = v_old_order_status;
    SET p_new_order_status = v_new_order_status;
    SET p_order_status = v_order_status;
    SET p_contrc_name = v_contrc_name;
    SET p_order_oper_way = v_order_oper_way;
    SET p_rece_margin = v_rece_margin;
    SET p_strike_price = v_strike_price;
    SET p_trade_fee = v_trade_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_margin_ratio = v_margin_ratio;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_交易_更新获取改单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_UpdateGetModiOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_UpdateGetModiOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_date int,
    IN p_order_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_modi_order_id bigint,
    OUT p_modi_order_date int,
    OUT p_modi_order_time int,
    OUT p_modi_batch_no int,
    OUT p_modi_order_price decimal(16,9),
    OUT p_modi_order_qty decimal(18,2),
    OUT p_modi_price_type int,
    OUT p_exch_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_code varchar(6),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_order_oper_way varchar(2),
    OUT p_busi_opor_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_modi_order_id bigint;
    declare v_modi_order_date int;
    declare v_modi_order_time int;
    declare v_modi_batch_no int;
    declare v_modi_order_price decimal(16,9);
    declare v_modi_order_qty decimal(18,2);
    declare v_modi_price_type int;
    declare v_exch_no int;
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_asset_type int;

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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_modi_order_id = 0;
    SET v_modi_order_date = date_format(curdate(),'%Y%m%d');
    SET v_modi_order_time = date_format(curtime(),'%H%i%s');
    SET v_modi_batch_no = 0;
    SET v_modi_order_price = 0;
    SET v_modi_order_qty = 0;
    SET v_modi_price_type = 0;
    SET v_exch_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_code = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_asset_type = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易期货_交易_更新获取改单信息】*/
        call db_tdfutu.pra_tdfuap_UpdateGetModiOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_date,
            v_order_id,
            v_error_code,
            v_error_info,
            v_init_date,
            v_modi_order_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_crncy_type,
            v_exch_crncy_type,
            v_exch_no,
            v_contrc_code_no,
            v_contrc_code,
            v_asset_type,
            v_modi_order_date,
            v_modi_order_time,
            v_modi_batch_no,
            v_modi_order_price,
            v_modi_order_qty,
            v_modi_price_type,
            v_order_oper_way,
            v_busi_opor_no);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.4.24.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_更新获取改单信息出现错误！',v_mysql_message);
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
    SET p_modi_order_id = v_modi_order_id;
    SET p_modi_order_date = v_modi_order_date;
    SET p_modi_order_time = v_modi_order_time;
    SET p_modi_batch_no = v_modi_batch_no;
    SET p_modi_order_price = v_modi_order_price;
    SET p_modi_order_qty = v_modi_order_qty;
    SET p_modi_price_type = v_modi_price_type;
    SET p_exch_no = v_exch_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_code = v_contrc_code;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_order_oper_way = v_order_oper_way;
    SET p_busi_opor_no = v_busi_opor_no;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_交易_更新改单状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_UpdateModiOrderStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_UpdateModiOrderStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_modi_order_date int,
    IN p_modi_order_id bigint,
    IN p_modi_order_status varchar(2),
    IN p_remark_info varchar(255),
    IN p_new_order_id bigint,
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
    declare v_modi_order_date int;
    declare v_modi_order_id bigint;
    declare v_modi_order_status varchar(2);
    declare v_remark_info varchar(255);
    declare v_new_order_id bigint;
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
    SET v_modi_order_date = p_modi_order_date;
    SET v_modi_order_id = p_modi_order_id;
    SET v_modi_order_status = p_modi_order_status;
    SET v_remark_info = p_remark_info;
    SET v_new_order_id = p_new_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易期货_交易_更新改单状态】*/
        call db_tdfutu.pra_tdfuap_UpdateModiOrderStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_modi_order_date,
            v_modi_order_id,
            v_modi_order_status,
            v_remark_info,
            v_new_order_id,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.4.25.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_更新改单状态出现错误！',v_mysql_message);
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

# 事务_交易期货_交易_获取多空类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_GetLngshtType;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_GetLngshtType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_dir int,
    IN p_contrc_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_lngsht_type int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_lngsht_type int;

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
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_lngsht_type = 0;

    
    label_pro:BEGIN
    

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
        SET v_error_code = "tdfutuT.4.26.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_获取多空类型出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_lngsht_type = v_lngsht_type;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_交易_获取订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfutd_GetOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfutd_GetOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_external_no bigint,
    OUT p_asset_type int,
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_contrc_dir int,
    OUT p_hedge_type int,
    OUT p_report_fee decimal(18,4),
    OUT p_order_dir int,
    OUT p_order_time int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_price decimal(16,9),
    OUT p_trade_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comb_code varchar(6),
    OUT p_rece_margin decimal(18,4),
    OUT p_margin_ratio decimal(18,12),
    OUT p_compli_trig_id bigint,
    OUT p_order_batch_no int,
    OUT p_order_oper_way varchar(2),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_futu_acco varchar(16),
    OUT p_contrc_code varchar(6),
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_lngsht_type int,
    OUT p_report_date int,
    OUT p_rsp_info varchar(255),
    OUT p_busi_opor_no int,
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
    declare v_order_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_external_no bigint;
    declare v_asset_type int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_report_fee decimal(18,4);
    declare v_order_dir int;
    declare v_order_time int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_trade_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comb_code varchar(6);
    declare v_rece_margin decimal(18,4);
    declare v_margin_ratio decimal(18,12);
    declare v_compli_trig_id bigint;
    declare v_order_batch_no int;
    declare v_order_oper_way varchar(2);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_lngsht_type int;
    declare v_report_date int;
    declare v_rsp_info varchar(255);
    declare v_busi_opor_no int;
    declare v_update_times int;
    declare v_all_fee decimal(18,4);

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
    SET v_order_id = p_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_external_no = 0;
    SET v_asset_type = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_report_fee = 0;
    SET v_order_dir = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_status = "0";
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_wtdraw_fee = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_price = 0;
    SET v_trade_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comb_code = " ";
    SET v_rece_margin = 0;
    SET v_margin_ratio = 0;
    SET v_compli_trig_id = 0;
    SET v_order_batch_no = 0;
    SET v_order_oper_way = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_futu_acco = " ";
    SET v_contrc_code = " ";
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_lngsht_type = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_rsp_info = " ";
    SET v_busi_opor_no = 0;
    SET v_update_times = 1;
    SET v_all_fee = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易期货_交易_获取订单】*/
    call db_tdfutu.pra_tdfutd_GetOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_id,
        v_error_code,
        v_error_info,
        v_row_id,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_futu_acco_no,
        v_contrc_code_no,
        v_external_no,
        v_asset_type,
        v_contrc_type,
        v_contrc_unit,
        v_contrc_dir,
        v_hedge_type,
        v_report_fee,
        v_order_dir,
        v_order_time,
        v_order_price,
        v_order_qty,
        v_order_status,
        v_strike_qty,
        v_strike_amt,
        v_wtdraw_fee,
        v_wtdraw_qty,
        v_strike_price,
        v_all_fee,
        v_trade_commis,
        v_other_commis,
        v_comm_id,
        v_comm_batch_no,
        v_comb_code,
        v_rece_margin,
        v_margin_ratio,
        v_compli_trig_id,
        v_order_batch_no,
        v_order_oper_way,
        v_pass_no,
        v_out_acco,
        v_exch_no,
        v_futu_acco,
        v_contrc_code,
        v_report_time,
        v_report_no,
        v_lngsht_type,
        v_report_date,
        v_rsp_info,
        v_busi_opor_no,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.4.27.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_获取订单出现错误！',v_mysql_message);
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
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_external_no = v_external_no;
    SET p_asset_type = v_asset_type;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_contrc_dir = v_contrc_dir;
    SET p_hedge_type = v_hedge_type;
    SET p_report_fee = v_report_fee;
    SET p_order_dir = v_order_dir;
    SET p_order_time = v_order_time;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_status = v_order_status;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_price = v_strike_price;
    SET p_trade_fee = v_trade_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comb_code = v_comb_code;
    SET p_rece_margin = v_rece_margin;
    SET p_margin_ratio = v_margin_ratio;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_oper_way = v_order_oper_way;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco = v_futu_acco;
    SET p_contrc_code = v_contrc_code;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_lngsht_type = v_lngsht_type;
    SET p_report_date = v_report_date;
    SET p_rsp_info = v_rsp_info;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_交易_测试
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfutd_Test;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfutd_Test(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_qty decimal(18,2),
    IN p_wtdraw_qty decimal(18,2),
    IN p_modi_order_qty decimal(18,2),
    IN p_strike_qty decimal(18,2),
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
    declare v_order_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_modi_order_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
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
    SET v_order_qty = p_order_qty;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_modi_order_qty = p_modi_order_qty;
    SET v_strike_qty = p_strike_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* insert into debug values(concat("订单数量",@订单数量#)); */
    insert into debug values(concat("订单数量",v_order_qty));

    /* insert into debug values(concat("撤单数量",@撤单数量#)); */
    insert into debug values(concat("撤单数量",v_wtdraw_qty));

    /* insert into debug values(concat("改单数量",@改单数量#)); */
    insert into debug values(concat("改单数量",v_modi_order_qty));

    /* insert into debug values(concat("成交数量",@成交数量#)); */
    insert into debug values(concat("成交数量",v_strike_qty));
    commit;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


