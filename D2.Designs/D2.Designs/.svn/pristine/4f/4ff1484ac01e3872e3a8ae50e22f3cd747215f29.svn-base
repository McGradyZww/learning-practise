DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_报盘_处理订单回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfurp_DealOrderRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfurp_DealOrderRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_out_acco varchar(32),
    IN p_pass_no int,
    IN p_exch_no int,
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_contrc_dir int,
    IN p_lngsht_type int,
    IN p_order_id bigint,
    IN p_order_dir int,
    IN p_report_no varchar(32),
    IN p_report_date int,
    IN p_report_time int,
    IN p_pre_settle_price decimal(16,9),
    IN p_rsp_info varchar(255),
    IN p_order_rsp_status varchar(2),
    IN p_rsp_status varchar(2),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    IN p_exgp_long_rece_margin decimal(18,4),
    IN p_exgp_short_rece_margin decimal(18,4),
    IN p_asac_long_rece_margin decimal(18,4),
    IN p_asac_short_rece_margin decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    OUT p_calc_dir int,
    OUT p_occur_qty decimal(18,2),
    OUT p_occur_amt decimal(18,4),
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_limit_price decimal(16,9),
    OUT p_crncy_type varchar(3),
    OUT p_hedge_type int,
    OUT p_order_batch_no int,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_status varchar(2),
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_amt decimal(18,4),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_trade_fee decimal(18,4),
    OUT p_strike_fee decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_trade_capt_amt decimal(18,4),
    OUT p_posi_capt_amt decimal(18,4),
    OUT p_comb_code varchar(6),
    OUT p_rece_margin decimal(18,4),
    OUT p_margin_ratio decimal(18,12),
    OUT p_comm_margin decimal(18,4),
    OUT p_compli_trig_id bigint,
    OUT p_order_oper_way varchar(2),
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
    declare v_init_date int;
    declare v_out_acco varchar(32);
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_contrc_dir int;
    declare v_lngsht_type int;
    declare v_order_id bigint;
    declare v_order_dir int;
    declare v_report_no varchar(32);
    declare v_report_date int;
    declare v_report_time int;
    declare v_pre_settle_price decimal(16,9);
    declare v_rsp_info varchar(255);
    declare v_order_rsp_status varchar(2);
    declare v_rsp_status varchar(2);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_exgp_long_rece_margin decimal(18,4);
    declare v_exgp_short_rece_margin decimal(18,4);
    declare v_asac_long_rece_margin decimal(18,4);
    declare v_asac_short_rece_margin decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_calc_dir int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_limit_price decimal(16,9);
    declare v_crncy_type varchar(3);
    declare v_hedge_type int;
    declare v_order_batch_no int;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_status varchar(2);
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_posi_capt_amt decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_rece_margin decimal(18,4);
    declare v_margin_ratio decimal(18,12);
    declare v_comm_margin decimal(18,4);
    declare v_compli_trig_id bigint;
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_update_times int;
    declare v_rsp_no int;
    declare v_strike_margin decimal(18,4);
    declare v_real_margin decimal(18,4);
    declare v_exch_crncy_type varchar(3);
    declare v_strike_occur_amt decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_invest_type int;
    declare v_tmp_report_no varchar(32);
    declare v_tmp_report_time int;
    declare v_strike_all_fee decimal(18,4);
    declare v_update_date int;
    declare v_update_time int;
    declare v_tmp_trade_fee decimal(18,4);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_order_margin decimal(18,4);
    declare v_long_comm_margin decimal(18,4);
    declare v_short_comm_margin decimal(18,4);
    declare v_long_order_margin decimal(18,4);
    declare v_short_order_margin decimal(18,4);
    declare v_long_strike_margin decimal(18,4);
    declare v_short_strike_margin decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_row_id bigint;
    declare v_comm_occur_amt decimal(18,4);
    declare v_trade_capt_amt_after decimal(18,4);
    declare v_posi_capt_amt_after decimal(18,4);
    declare v_comm_capt_amt_after decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_strike_capt_amt decimal(18,4);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_qty decimal(18,2);
    declare v_comm_status varchar(2);
    declare v_comm_date int;
    declare v_comm_executor int;
    declare v_waste_qty decimal(18,2);
    declare v_close_pandl decimal(18,4);

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
    SET v_out_acco = p_out_acco;
    SET v_pass_no = p_pass_no;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_dir = p_contrc_dir;
    SET v_lngsht_type = p_lngsht_type;
    SET v_order_id = p_order_id;
    SET v_order_dir = p_order_dir;
    SET v_report_no = p_report_no;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_rsp_info = p_rsp_info;
    SET v_order_rsp_status = p_order_rsp_status;
    SET v_rsp_status = p_rsp_status;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_exgp_long_rece_margin = p_exgp_long_rece_margin;
    SET v_exgp_short_rece_margin = p_exgp_short_rece_margin;
    SET v_asac_long_rece_margin = p_asac_long_rece_margin;
    SET v_asac_short_rece_margin = p_asac_short_rece_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_calc_dir = 1;
    SET v_occur_qty = 0;
    SET v_occur_amt = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_limit_price = 0;
    SET v_crncy_type = "CNY";
    SET v_hedge_type = 0;
    SET v_order_batch_no = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_status = "0";
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_amt = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_trade_fee = 0;
    SET v_strike_fee = 0;
    SET v_all_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_trade_capt_amt = 0;
    SET v_posi_capt_amt = 0;
    SET v_comb_code = " ";
    SET v_rece_margin = 0;
    SET v_margin_ratio = 0;
    SET v_comm_margin = 0;
    SET v_compli_trig_id = 0;
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_update_times = 1;
    SET v_rsp_no = 0;
    SET v_strike_margin = 0;
    SET v_real_margin = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_strike_occur_amt = 0;
    SET v_trade_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_invest_type = 0;
    SET v_tmp_report_no = " ";
    SET v_tmp_report_time = date_format(curtime(),'%H%i%s');
    SET v_strike_all_fee = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_trade_fee = 0;
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_order_margin = 0;
    SET v_long_comm_margin = 0;
    SET v_short_comm_margin = 0;
    SET v_long_order_margin = 0;
    SET v_short_order_margin = 0;
    SET v_long_strike_margin = 0;
    SET v_short_strike_margin = 0;
    SET v_comm_capt_amt = 0;
    SET v_row_id = 0;
    SET v_comm_occur_amt = 0;
    SET v_trade_capt_amt_after = 0;
    SET v_posi_capt_amt_after = 0;
    SET v_comm_capt_amt_after = 0;
    SET v_trade_occur_qty = 0;
    SET v_strike_capt_amt = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_qty = 0;
    SET v_comm_status = "0";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_executor = 0;
    SET v_waste_qty = 0;
    SET v_close_pandl = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* set @订单日期#=@申报日期#; */
    set v_order_date=v_report_date;

    /* set @回报编号#=0; */
    set v_rsp_no=0;

    /* set @指令保证金# = 0; */
    set v_comm_margin = 0;

    /* set @成交保证金# = 0; */
    set v_strike_margin = 0;

    /* set @实收保证金# = 0; */
    set v_real_margin = 0;

    /* set @交易币种# = "CNY"; */
    set v_exch_crncy_type = "CNY";

    /* set @成交变动金额#=0; */
    set v_strike_occur_amt=0;

    /* set @交易变动金额#=0; */
    set v_trade_occur_amt=0;

    /* set @交易占用金额#=0; */
    set v_trade_capt_amt=0;

    /* set @持仓占用金额#=0; */
    set v_posi_capt_amt=0;

    /* set @指令变动数量#=0; */
    set v_comm_occur_qty=0;

    /* set @投资类型# = 1; */
    set v_invest_type = 1;

    /* set @临时_申报编号# = @申报编号#; */
    set v_tmp_report_no = v_report_no;

    /* set @临时_申报时间# = @申报时间#; */
    set v_tmp_report_time = v_report_time;
    #获取原订单信息

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
        SET v_error_code = "tdfutuT.5.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_锁定获取订单回报订单信息出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* set @申报编号# = @临时_申报编号#; */
    set v_report_no = v_tmp_report_no;

    /* set @申报时间# = @临时_申报时间#; */
    set v_report_time = v_tmp_report_time;
    #判断原委托状态,非未报或待报或正报状态的订单不允许再进行订单回报
    #[检查报错返回][@订单状态# <> 《订单状态-未报》 and @订单状态# <>《订单状态-待报》 and @订单状态# <> 《订单状态-正报》][624][@订单状态#]

    /* 调用【原子_交易期货_报盘_检查订单重复回报】*/
    call db_tdfutu.pra_tdfurp_CheckOrderRspDup(
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
        v_pass_no,
        v_futu_acco,
        v_contrc_type,
        v_contrc_code,
        v_report_date,
        v_report_time,
        v_report_no,
        v_order_date,
        v_order_id,
        v_order_dir,
        v_order_price,
        v_order_qty,
        v_contrc_dir,
        v_hedge_type,
        v_rsp_info,
        v_order_rsp_status,
        v_rsp_status,
        v_out_acco,
        v_error_code,
        v_error_info,
        v_rsp_no);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.5.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_报盘_检查订单重复回报出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;

    #部成待撤不可以修改成废单

    /* [检查报错返回][@订单状态# = 《订单状态-待撤》and @成交数量# > 0 ][769][@订单状态#,@成交数量#] */
    if v_order_status = "3"and v_strike_qty > 0  then
        ROLLBACK;
        SET v_error_code = "tdfutuT.5.1.769";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单状态=",v_order_status,",","成交数量=",v_strike_qty),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单状态=",v_order_status,",","成交数量=",v_strike_qty);
        end if;
        leave label_pro;
    end if;

    #正常回报处理逻辑

    /* if @回报状态# = 《回报状态-成功》 then */
    if v_rsp_status = "1" then

      /* set @订单状态# = 《订单状态-已报》; */
      set v_order_status = "2";

      /* set @撤单数量# = 0; */
      set v_wtdraw_qty = 0;

      /* set @交易费用# = -1 * @申报费用#; */
      set v_trade_fee = -1 * v_report_fee;

      /* set @成交费用# = @申报费用#; */
      set v_strike_fee = v_report_fee;

      /* set @成交全部费用#=@申报费用#; */
      set v_strike_all_fee=v_report_fee;

      /* 调用【原子_交易期货_报盘_更新订单回报记录】*/
      call db_tdfutu.pra_tdfurp_UpdateOrderRsp(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_rsp_no,
          v_out_acco,
          v_pass_no,
          v_exch_no,
          v_report_date,
          v_report_time,
          v_report_no,
          v_order_id,
          v_trade_fee,
          v_trade_commis,
          v_other_commis,
          v_report_fee,
          v_wtdraw_fee,
          v_wtdraw_qty,
          v_order_status,
          v_rece_margin,
          v_rsp_info,
          v_strike_all_fee,
          v_error_code,
          v_error_info,
          v_update_times);
      if v_error_code = "1" then
          SET v_error_code = "tdfutuT.5.1.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_报盘_更新订单回报记录出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


      /* if @订单批号# > 0 then */
      if v_order_batch_no > 0 then
          #更新订单汇总表的费用字段

          /* [更新表记录][交易期货_交易_订单汇总表][{申报费用}={申报费用}+@申报费用#,{交易费用}={交易费用}+@交易费用#,{成交全部费用} = {成交全部费用} +@成交全部费用#][{机构编号} = @机构编号# and {订单批号}=@订单批号# and {订单日期} = @订单日期#][2][@机构编号#,@订单批号#,@订单日期#] */
          set v_update_date = date_format(curdate(),'%Y%m%d');
          set v_update_time = date_format(curtime(),'%H%i%s');
          update db_tdfutu.tb_tdfutd_sumorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, report_fee=report_fee+v_report_fee,trade_fee=trade_fee+v_trade_fee,strike_all_fee = strike_all_fee +v_strike_all_fee where co_no = v_co_no and order_batch_no=v_order_batch_no and order_date = v_order_date;
          if v_error_code = "1" then
              ROLLBACK;        
              SET v_error_code = "tdfutuT.5.1.2";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","订单批号=",v_order_batch_no,",","订单日期=",v_order_date),"#",v_mysql_message);
              else
                  SET v_error_info = concat("机构编号=",v_co_no,",","订单批号=",v_order_batch_no,",","订单日期=",v_order_date);
              end if;
              leave label_pro;
          end if;

      end if;
    #回报状态为失败，作为废单回报处理，废单逻辑
    else

      /* set @变动数量# = @订单数量#; */
      set v_occur_qty = v_order_qty;

      /* set @订单状态# = 《订单状态-废单》; */
      set v_order_status = "8";

      /* set @计算方向# = 《计算方向-减去》; */
      set v_calc_dir = -1;

      /* set @交易费用# = -1*@交易费用#; */
      set v_trade_fee = -1*v_trade_fee;

      /* set @临时_交易费用# = @交易费用#; */
      set v_tmp_trade_fee = v_trade_fee;

      /* set @撤单数量# = @订单数量#; */
      set v_wtdraw_qty = v_order_qty;

      /* set @多头持仓保证金#=@交易组多头应收保证金#; */
      set v_long_hold_margin=v_exgp_long_rece_margin;

      /* set @空头持仓保证金#=@交易组空头应收保证金#; */
      set v_short_hold_margin=v_exgp_short_rece_margin;

      /* set @订单保证金# =  @计算方向# * @应收保证金#; */
      set v_order_margin =  v_calc_dir * v_rece_margin;
      #订单资金持仓反冲处理
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
            SET v_error_code = "tdfutuT.5.1.999";
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
            SET v_error_code = "tdfutuT.5.1.999";
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

        /* set @交易变动金额# = @订单保证金#; */
        set v_trade_occur_amt = v_order_margin;
      end if;

      /* if @开平方向# = 《开平方向-开仓》 then */
      if v_contrc_dir = 1 then

        /* set @交易变动数量# = @计算方向# * @订单数量#; */
        set v_trade_occur_qty = v_calc_dir * v_order_qty;
      else

        /* set @交易变动金额#=@应收保证金#; */
        set v_trade_occur_amt=v_rece_margin;

        /* set @交易变动数量# = @计算方向# * @订单数量#; */
        set v_trade_occur_qty = v_calc_dir * v_order_qty;
      end if;
      #交易资金持仓处理

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
          SET v_error_code = "tdfutuT.5.1.999";
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
            SET v_error_code = "tdfutuT.5.1.999";
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
            SET v_error_code = "tdfutuT.5.1.999";
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
          SET v_error_code = "tdfutuT.5.1.999";
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
      #更新指令表

      /* if @指令序号# > 0 then */
      if v_comm_id > 0 then

            /* if @开平方向# = 《开平方向-开仓》 then */
            if v_contrc_dir = 1 then

                /* [获取表记录变量][交易期货_指令_指令表][{指令实际限价},{订单数量},{指令撤销数量},{指令数量}][@指令实际限价#,@指令订单数量#,@指令撤销数量#,@指令数量#][{记录序号}=@指令序号#][1][@指令序号#] */
                select limit_actual_price,order_qty,comm_cancel_qty,comm_qty into v_limit_actual_price,v_comm_order_qty,v_comm_cancel_qty,v_comm_qty from db_tdfutu.tb_tdfuap_command where row_id=v_comm_id limit 1;
                if FOUND_ROWS() = 0 then
                    ROLLBACK;        
                    SET v_error_code = "tdfutuT.5.1.1";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("指令序号=",v_comm_id);
                    end if;
                    leave label_pro;
                end if;


                /* set @指令保证金# = @指令实际限价#*@合约乘数# * @保证金比例#*(@指令数量# - @指令订单数量# - @指令撤销数量#+@订单数量#); */
                set v_comm_margin = v_limit_actual_price*v_contrc_unit * v_margin_ratio*(v_comm_qty - v_comm_order_qty - v_comm_cancel_qty+v_order_qty);
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
                    SET v_error_code = "tdfutuT.5.1.999";
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
                    SET v_error_code = "tdfutuT.5.1.999";
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
                SET v_error_code = "tdfutuT.5.1.999";
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
                    SET v_error_code = "tdfutuT.5.1.999";
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
                    SET v_error_code = "tdfutuT.5.1.999";
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
                SET v_error_code = "tdfutuT.5.1.999";
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
                SET v_error_code = "tdfutuT.5.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_撤销更新指令出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @指令变动金额# =@指令保证金#; */
            set v_comm_occur_amt =v_comm_margin;

            /* set @指令变动数量# = @撤单数量#; */
            set v_comm_occur_qty = v_wtdraw_qty;
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
          SET v_error_code = "tdfutuT.5.1.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新交易持仓出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


      /* set @交易佣金#=0; */
      set v_trade_commis=0;

      /* set @其他佣金#=0; */
      set v_other_commis=0;

      /* set @申报费用#=0; */
      set v_report_fee=0;

      /* set @撤单费用#=0; */
      set v_wtdraw_fee=0;

      /* set @应收保证金# = 0; */
      set v_rece_margin = 0;

      /* set @成交全部费用#=0; */
      set v_strike_all_fee=0;

      /* set @交易费用# = @临时_交易费用#; */
      set v_trade_fee = v_tmp_trade_fee;

      /* 调用【原子_交易期货_报盘_更新订单回报记录】*/
      call db_tdfutu.pra_tdfurp_UpdateOrderRsp(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_rsp_no,
          v_out_acco,
          v_pass_no,
          v_exch_no,
          v_report_date,
          v_report_time,
          v_report_no,
          v_order_id,
          v_trade_fee,
          v_trade_commis,
          v_other_commis,
          v_report_fee,
          v_wtdraw_fee,
          v_wtdraw_qty,
          v_order_status,
          v_rece_margin,
          v_rsp_info,
          v_strike_all_fee,
          v_error_code,
          v_error_info,
          v_update_times);
      if v_error_code = "1" then
          SET v_error_code = "tdfutuT.5.1.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_报盘_更新订单回报记录出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


      /* set @废单数量# = @撤单数量#; */
      set v_waste_qty = v_wtdraw_qty;

      /* set @撤单数量# = 0; */
      set v_wtdraw_qty = 0;

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
          SET v_error_code = "tdfutuT.5.1.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_撤单处理汇总订单出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


    /* set @撤单数量# = @废单数量#; */
    set v_wtdraw_qty = v_waste_qty;
    end if;

    /* if @订单状态# = 《订单状态-已报》 then */
    if v_order_status = "2" then

      /* set @交易变动金额#=0; */
      set v_trade_occur_amt=0;

      /* set @平仓盈亏#=0; */
      set v_close_pandl=0;

      /* 调用【原子_交易期货_账户_更新成交资金】*/
      call db_tdfutu.pra_tdfuac_UpdateStrikeCapit(
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
          v_exch_crncy_type,
          v_futu_acco_no,
          v_contrc_code_no,
          v_contrc_type,
          v_invest_type,
          v_lngsht_type,
          v_contrc_dir,
          v_order_dir,
          v_strike_occur_amt,
          v_strike_fee,
          v_trade_occur_amt,
          v_trade_fee,
          v_close_pandl,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "tdfutuT.5.1.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新成交资金出现错误！',v_mysql_message);
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

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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
    SET p_calc_dir = v_calc_dir;
    SET p_occur_qty = v_occur_qty;
    SET p_occur_amt = v_occur_amt;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_limit_price = v_comm_limit_price;
    SET p_crncy_type = v_crncy_type;
    SET p_hedge_type = v_hedge_type;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_status = v_order_status;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_price = v_strike_price;
    SET p_strike_amt = v_strike_amt;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_trade_fee = v_trade_fee;
    SET p_strike_fee = v_strike_fee;
    SET p_all_fee = v_all_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_trade_capt_amt = v_trade_capt_amt;
    SET p_posi_capt_amt = v_posi_capt_amt;
    SET p_comb_code = v_comb_code;
    SET p_rece_margin = v_rece_margin;
    SET p_margin_ratio = v_margin_ratio;
    SET p_comm_margin = v_comm_margin;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_order_oper_way = v_order_oper_way;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_报盘_处理撤单回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfurp_DealCancelRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfurp_DealCancelRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_out_acco varchar(32),
    IN p_pass_no int,
    IN p_exch_no int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_lngsht_type int,
    IN p_report_no varchar(32),
    IN p_report_date int,
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_order_dir int,
    IN p_wtdraw_qty decimal(18,2),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    IN p_pre_settle_price decimal(16,9),
    IN p_rsp_status varchar(2),
    IN p_rsp_info varchar(255),
    IN p_exgp_long_rece_margin decimal(18,4),
    IN p_exgp_short_rece_margin decimal(18,4),
    IN p_asac_long_rece_margin decimal(18,4),
    IN p_asac_short_rece_margin decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_external_no bigint,
    OUT p_asset_type int,
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_crncy_type varchar(3),
    OUT p_report_time int,
    OUT p_order_status varchar(2),
    OUT p_order_batch_no int,
    OUT p_order_qty decimal(18,2),
    OUT p_order_price decimal(16,9),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_wtdraw_status varchar(2),
    OUT p_wtdraw_date int,
    OUT p_wtdraw_time int,
    OUT p_wtdraw_remark varchar(255),
    OUT p_calc_dir int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_limit_price decimal(16,9),
    OUT p_occur_qty decimal(18,2),
    OUT p_occur_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_fee decimal(18,4),
    OUT p_trade_fee decimal(18,4),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_comb_code varchar(6),
    OUT p_trade_capt_amt decimal(18,4),
    OUT p_posi_capt_amt decimal(18,4),
    OUT p_rece_margin decimal(18,4),
    OUT p_margin_ratio decimal(18,12),
    OUT p_comm_margin decimal(18,4),
    OUT p_compli_trig_id bigint,
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
    declare v_asset_acco_no int;
    declare v_out_acco varchar(32);
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_lngsht_type int;
    declare v_report_no varchar(32);
    declare v_report_date int;
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_order_dir int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_pre_settle_price decimal(16,9);
    declare v_rsp_status varchar(2);
    declare v_rsp_info varchar(255);
    declare v_exgp_long_rece_margin decimal(18,4);
    declare v_exgp_short_rece_margin decimal(18,4);
    declare v_asac_long_rece_margin decimal(18,4);
    declare v_asac_short_rece_margin decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_external_no bigint;
    declare v_asset_type int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_crncy_type varchar(3);
    declare v_report_time int;
    declare v_order_status varchar(2);
    declare v_order_batch_no int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_order_frozen_amt decimal(18,4);
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_date int;
    declare v_wtdraw_time int;
    declare v_wtdraw_remark varchar(255);
    declare v_calc_dir int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_limit_price decimal(16,9);
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_trade_capt_amt decimal(18,4);
    declare v_posi_capt_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_margin_ratio decimal(18,12);
    declare v_comm_margin decimal(18,4);
    declare v_compli_trig_id bigint;
    declare v_update_times int;
    declare v_strike_margin decimal(18,4);
    declare v_real_margin decimal(18,4);
    declare v_tmp_wtdraw_qty decimal(18,2);
    declare v_comm_occur_qty decimal(18,2);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_init_date int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_order_time int;
    declare v_order_oper_way varchar(2);
    declare v_posi_qty decimal(18,2);
    declare v_tmp_trade_fee decimal(18,4);
    declare v_strike_commis decimal(18,4);
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
    declare v_trade_occur_qty decimal(18,2);
    declare v_strike_capt_amt decimal(18,4);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_qty decimal(18,2);
    declare v_comm_status varchar(2);
    declare v_comm_date int;
    declare v_comm_executor int;
    declare v_strike_other_commis decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_out_acco = p_out_acco;
    SET v_pass_no = p_pass_no;
    SET v_exch_no = p_exch_no;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_report_no = p_report_no;
    SET v_report_date = p_report_date;
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_order_dir = p_order_dir;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_rsp_status = p_rsp_status;
    SET v_rsp_info = p_rsp_info;
    SET v_exgp_long_rece_margin = p_exgp_long_rece_margin;
    SET v_exgp_short_rece_margin = p_exgp_short_rece_margin;
    SET v_asac_long_rece_margin = p_asac_long_rece_margin;
    SET v_asac_short_rece_margin = p_asac_short_rece_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_external_no = 0;
    SET v_asset_type = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_crncy_type = "CNY";
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_order_status = "0";
    SET v_order_batch_no = 0;
    SET v_order_qty = 0;
    SET v_order_price = 0;
    SET v_order_frozen_amt = 0;
    SET v_wtdraw_status = "0";
    SET v_wtdraw_date = date_format(curdate(),'%Y%m%d');
    SET v_wtdraw_time = date_format(curtime(),'%H%i%s');
    SET v_wtdraw_remark = " ";
    SET v_calc_dir = 1;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_limit_price = 0;
    SET v_occur_qty = 0;
    SET v_occur_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_amt = 0;
    SET v_strike_fee = 0;
    SET v_trade_fee = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_comb_code = " ";
    SET v_trade_capt_amt = 0;
    SET v_posi_capt_amt = 0;
    SET v_rece_margin = 0;
    SET v_margin_ratio = 0;
    SET v_comm_margin = 0;
    SET v_compli_trig_id = 0;
    SET v_update_times = 1;
    SET v_strike_margin = 0;
    SET v_real_margin = 0;
    SET v_tmp_wtdraw_qty = 0;
    SET v_comm_occur_qty = 0;
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_futu_acco = " ";
    SET v_contrc_code = " ";
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_oper_way = " ";
    SET v_posi_qty = 0;
    SET v_tmp_trade_fee = 0;
    SET v_strike_commis = 0;
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
    SET v_trade_occur_qty = 0;
    SET v_strike_capt_amt = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_qty = 0;
    SET v_comm_status = "0";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_executor = 0;
    SET v_strike_other_commis = 0;
    SET v_strike_all_fee = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @成交保证金# = 0; */
    set v_strike_margin = 0;

    /* set @指令保证金# = 0; */
    set v_comm_margin = 0;

    /* set @实收保证金# = 0; */
    set v_real_margin = 0;

    /* set @交易占用金额#=0; */
    set v_trade_capt_amt=0;

    /* set @持仓占用金额#=0; */
    set v_posi_capt_amt=0;

    /* set @临时_撤单数量#=@撤单数量#; */
    set v_tmp_wtdraw_qty=v_wtdraw_qty;

    /* set @撤单说明# = @回报信息#; */
    set v_wtdraw_remark = v_rsp_info;

    /* set @指令变动数量#=0; */
    set v_comm_occur_qty=0;

    /* set @多头持仓保证金#=@交易组多头应收保证金#; */
    set v_long_hold_margin=v_exgp_long_rece_margin;

    /* set @空头持仓保证金#=@交易组空头应收保证金#; */
    set v_short_hold_margin=v_exgp_short_rece_margin;

    /* [事务开始] */
    START TRANSACTION;


    /* set @初始化日期# = @订单日期#; */
    set v_init_date = v_order_date;
    #取原委托信息

    /* 调用【原子_交易期货_交易_锁定获取撤单回报订单信息】*/
    call db_tdfutu.pra_tdfutd_LockGetCancelOrder(
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
        v_crncy_type,
        v_futu_acco_no,
        v_futu_acco,
        v_contrc_code_no,
        v_contrc_code,
        v_contrc_type,
        v_contrc_unit,
        v_external_no,
        v_comm_id,
        v_comm_batch_no,
        v_report_fee,
        v_order_batch_no,
        v_order_dir,
        v_contrc_dir,
        v_hedge_type,
        v_order_date,
        v_order_time,
        v_order_price,
        v_order_qty,
        v_order_status,
        v_strike_qty,
        v_strike_amt,
        v_strike_price,
        v_trade_commis,
        v_other_commis,
        v_trade_fee,
        v_wtdraw_fee,
        v_wtdraw_qty,
        v_comb_code,
        v_rece_margin,
        v_margin_ratio,
        v_compli_trig_id,
        v_order_oper_way);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.5.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_锁定获取撤单回报订单信息出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;

    #判断原委托状态,最终状态的订单不允许再处理

    /* [检查报错返回][@订单状态# = 《订单状态-已撤》 or @订单状态# = 《订单状态-已成》 or @订单状态# = 《订单状态-部撤》 or @订单状态# = 《订单状态-废单》][624][@订单状态#] */
    if v_order_status = "4" or v_order_status = "6" or v_order_status = "7" or v_order_status = "8" then
        ROLLBACK;
        SET v_error_code = "tdfutuT.5.11.624";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单状态=",v_order_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单状态=",v_order_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@临时_撤单数量# > @订单数量#][715][@订单序号#, @订单数量#, @临时_撤单数量#] */
    if v_tmp_wtdraw_qty > v_order_qty then
        ROLLBACK;
        SET v_error_code = "tdfutuT.5.11.715";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id,","," 订单数量=", v_order_qty,","," 临时_撤单数量=", v_tmp_wtdraw_qty),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id,","," 订单数量=", v_order_qty,","," 临时_撤单数量=", v_tmp_wtdraw_qty);
        end if;
        leave label_pro;
    end if;

    #如果是撤废反馈,直接更新委托状态

    /* if @回报状态# = 《回报状态-失败》 then */
    if v_rsp_status = "2" then

      /* if @成交数量# = 0 then */
      if v_strike_qty = 0 then

        /* set @订单状态# = 《订单状态-已报》; */
        set v_order_status = "2";
      else

        /* set @订单状态# = 《订单状态-部成》; */
        set v_order_status = "5";
      end if;

      /* set @撤单状态# = 《撤单状态-失败》; */
      set v_wtdraw_status = "4";

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
          SET v_error_code = "tdfutuT.5.11.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_更新订单状态出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


      /* 调用【原子_交易期货_交易_更新撤单状态】*/
      call db_tdfutu.pra_tdfutd_UpdateCancelOrderStatus(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_report_date,
          v_report_no,
          v_order_id,
          v_wtdraw_status,
          v_wtdraw_qty,
          v_wtdraw_remark,
          v_error_code,
          v_error_info,
          v_update_times);
      if v_error_code = "1" then
          SET v_error_code = "tdfutuT.5.11.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_更新撤单状态出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;

    else
      #持仓数量用来记录订单表中除去成交数量和撤单数量后还可用的数量

      /* set @持仓数量#=@订单数量#-@成交数量#-@撤单数量#; */
      set v_posi_qty=v_order_qty-v_strike_qty-v_wtdraw_qty;

      /* set @应收保证金# = (@临时_撤单数量# * @应收保证金#) /@订单数量# ; */
      set v_rece_margin = (v_tmp_wtdraw_qty * v_rece_margin) /v_order_qty ;
      #部撤情况下，交易费用先扣除掉撤单费用

      /* if @临时_撤单数量# < @订单数量# and @临时_撤单数量# >0 then */
      if v_tmp_wtdraw_qty < v_order_qty and v_tmp_wtdraw_qty >0 then

          /* set @交易费用# = @临时_撤单数量# * (@交易费用#-@撤单费用#) / @持仓数量# + @撤单费用#; */
          set v_trade_fee = v_tmp_wtdraw_qty * (v_trade_fee-v_wtdraw_fee) / v_posi_qty + v_wtdraw_fee;
      else

          /* set @交易费用# = @临时_撤单数量# * @交易费用# / @持仓数量#; */
          set v_trade_fee = v_tmp_wtdraw_qty * v_trade_fee / v_posi_qty;
      end if;

      /* set @交易费用# = -1 * @交易费用#; */
      set v_trade_fee = -1 * v_trade_fee;

      /* set @临时_交易费用# = @交易费用#; */
      set v_tmp_trade_fee = v_trade_fee;
      #已报撤单时只有中金所的IF IC IH需要收取申报费用和撤单费用  其他的合约不需要收费

      /* if (locate("IF",@合约代码#)=1 or locate("IC",@合约代码#)=1 or locate("IH",@合约代码#)=1)  then */
      if (locate("IF",v_contrc_code)=1 or locate("IC",v_contrc_code)=1 or locate("IH",v_contrc_code)=1)  then

        /* set @成交佣金#=0; */
        set v_strike_commis=0;
      else

        /* set @成交佣金#=0; */
        set v_strike_commis=0;

        /* set @撤单费用#=0; */
        set v_wtdraw_fee=0;
      end if;

      /* set @成交费用# = @撤单费用#; */
      set v_strike_fee = v_wtdraw_fee;
      #未报撤单处理逻辑，修改订单状态

      /* if @订单数量# = @临时_撤单数量# then */
      if v_order_qty = v_tmp_wtdraw_qty then

        /* set @订单状态# = 《订单状态-已撤》; */
        set v_order_status = "4";
      else

        /* set @订单状态# = 《订单状态-部撤》; */
        set v_order_status = "7";
      end if;

      /* set @撤单状态# = 《撤单状态-成功》; */
      set v_wtdraw_status = "3";

      /* set @撤单数量#=@临时_撤单数量#; */
      set v_wtdraw_qty=v_tmp_wtdraw_qty;

      /* 调用【原子_交易期货_交易_更新撤单状态】*/
      call db_tdfutu.pra_tdfutd_UpdateCancelOrderStatus(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_report_date,
          v_report_no,
          v_order_id,
          v_wtdraw_status,
          v_wtdraw_qty,
          v_wtdraw_remark,
          v_error_code,
          v_error_info,
          v_update_times);
      if v_error_code = "1" then
          SET v_error_code = "tdfutuT.5.11.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_更新撤单状态出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


      /* set @计算方向# = 《计算方向-减去》; */
      set v_calc_dir = -1;

      /* set @订单数量# = @临时_撤单数量#; */
      set v_order_qty = v_tmp_wtdraw_qty;

      /* set @投资类型# = 1; */
      set v_invest_type = 1;

      /* set @指令保证金# = 0; */
      set v_comm_margin = 0;

      /* set @订单保证金# = @计算方向# * @应收保证金#; */
      set v_order_margin = v_calc_dir * v_rece_margin;
      #订单资金持仓反冲处理
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
            SET v_error_code = "tdfutuT.5.11.999";
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
            SET v_error_code = "tdfutuT.5.11.999";
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

        /* set @交易变动金额# = @订单保证金#; */
        set v_trade_occur_amt = v_order_margin;
      end if;
      #计算实际保证金，资金变化

      /* if @开平方向# = 《开平方向-开仓》 then */
      if v_contrc_dir = 1 then

        /* set @交易变动数量# = @计算方向# * @订单数量#; */
        set v_trade_occur_qty = v_calc_dir * v_order_qty;
      else

        /* set @交易变动金额# = 0; */
        set v_trade_occur_amt = 0;

        /* set @交易变动数量# = @计算方向# * @订单数量#; */
        set v_trade_occur_qty = v_calc_dir * v_order_qty;
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
          SET v_error_code = "tdfutuT.5.11.999";
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
            SET v_error_code = "tdfutuT.5.11.999";
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
            SET v_error_code = "tdfutuT.5.11.999";
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
      #平仓下单时没有对交易占用金额进行赋值,因此不对交易占用金额进行处理

      /* if @开平方向# = 《开平方向-平仓》 then */
      if v_contrc_dir = 2 then

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
          SET v_error_code = "tdfutuT.5.11.999";
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

      /* set @成交费用# = 0; */
      set v_strike_fee = 0;
      #更新指令表

      /* if @指令序号# > 0 then */
      if v_comm_id > 0 then

            /* [获取表记录变量][交易期货_指令_指令表][{指令实际限价},{订单数量},{指令撤销数量},{指令数量},{指令状态}][@指令实际限价#,@指令订单数量#,@指令撤销数量#,@指令数量#,@指令状态#][{记录序号}=@指令序号#][1][@指令序号#] */
            select limit_actual_price,order_qty,comm_cancel_qty,comm_qty,comm_status into v_limit_actual_price,v_comm_order_qty,v_comm_cancel_qty,v_comm_qty,v_comm_status from db_tdfutu.tb_tdfuap_command where row_id=v_comm_id limit 1;
            if FOUND_ROWS() = 0 then
                ROLLBACK;        
                SET v_error_code = "tdfutuT.5.11.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("指令序号=",v_comm_id);
                end if;
                leave label_pro;
            end if;


            /* if @指令状态# <> 《指令状态-待撤销》 and @指令状态# <> 《指令状态-部分撤销》 and @指令状态# <> 《指令状态-全部撤销》 then */
            if v_comm_status <> "4" and v_comm_status <> "5" and v_comm_status <> "6" then

                /* if @开平方向# = 《开平方向-开仓》 then */
                if v_contrc_dir = 1 then
                    #只是回退订单的那部分

                    /* set @指令保证金# = @指令实际限价#*@合约乘数# * @保证金比例#*@撤单数量#; */
                    set v_comm_margin = v_limit_actual_price*v_contrc_unit * v_margin_ratio*v_wtdraw_qty;
                end if;

                /* if @组合编码# <> " " then */
                if v_comb_code <> " " then

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
                        SET v_error_code = "tdfutuT.5.11.999";
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
                        SET v_error_code = "tdfutuT.5.11.999";
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
                    SET v_error_code = "tdfutuT.5.11.999";
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
                        SET v_error_code = "tdfutuT.5.11.999";
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
                        SET v_error_code = "tdfutuT.5.11.999";
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
                    SET v_error_code = "tdfutuT.5.11.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新资产账户交易资金出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @指令变动数量# = @撤单数量#; */
                set v_comm_occur_qty = v_wtdraw_qty;
            end if;

            /* set @指令撤销数量# = 0; */
            set v_comm_cancel_qty = 0;

            /* set @撤单数量# = @临时_撤单数量#; */
            set v_wtdraw_qty = v_tmp_wtdraw_qty;

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
                SET v_error_code = "tdfutuT.5.11.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_撤销更新指令出现错误！',v_mysql_message);
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
          SET v_error_code = "tdfutuT.5.11.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新交易持仓出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


      /* set @变动数量# = @订单数量#; */
      set v_occur_qty = v_order_qty;
      #更新订单表

      /* set @交易变动金额#=0; */
      set v_trade_occur_amt=0;

      /* set @交易佣金#=@交易佣金#*(@持仓数量#-@临时_撤单数量#)/@持仓数量#; */
      set v_trade_commis=v_trade_commis*(v_posi_qty-v_tmp_wtdraw_qty)/v_posi_qty;

      /* set @其他佣金#=@其他佣金#*(@持仓数量#-@临时_撤单数量#)/@持仓数量#; */
      set v_other_commis=v_other_commis*(v_posi_qty-v_tmp_wtdraw_qty)/v_posi_qty;

      /* set @应收保证金# = 0; */
      set v_rece_margin = 0;

      /* set @成交其他佣金#=0; */
      set v_strike_other_commis=0;

      /* set @成交全部费用#=@撤单费用#; */
      set v_strike_all_fee=v_wtdraw_fee;

      /* set @成交数量#=0; */
      set v_strike_qty=0;

      /* set @成交金额#=0; */
      set v_strike_amt=0;

      /* set @交易变动金额#=0; */
      set v_trade_occur_amt=0;

      /* set @交易费用# = @临时_交易费用#; */
      set v_trade_fee = v_tmp_trade_fee;

      /* 调用【原子_交易期货_交易_更新期货订单表记录】*/
      call db_tdfutu.pra_tdfutd_UpdateOrderRecord(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_exch_no,
          v_pass_no,
          v_out_acco,
          v_order_id,
          v_order_date,
          v_order_status,
          v_report_no,
          v_report_date,
          v_report_fee,
          v_strike_qty,
          v_strike_amt,
          v_strike_price,
          v_wtdraw_qty,
          v_wtdraw_fee,
          v_trade_commis,
          v_other_commis,
          v_strike_commis,
          v_strike_other_commis,
          v_strike_all_fee,
          v_trade_occur_amt,
          v_trade_fee,
          v_rsp_info,
          v_error_code,
          v_error_info,
          v_update_times);
      if v_error_code = "1" then
          SET v_error_code = "tdfutuT.5.11.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_更新期货订单表记录出现错误！',v_mysql_message);
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
                SET v_error_code = "tdfutuT.5.11.999";
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
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_external_no = v_external_no;
    SET p_asset_type = v_asset_type;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_crncy_type = v_crncy_type;
    SET p_report_time = v_report_time;
    SET p_order_status = v_order_status;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_qty = v_order_qty;
    SET p_order_price = v_order_price;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_wtdraw_status = v_wtdraw_status;
    SET p_wtdraw_date = v_wtdraw_date;
    SET p_wtdraw_time = v_wtdraw_time;
    SET p_wtdraw_remark = v_wtdraw_remark;
    SET p_calc_dir = v_calc_dir;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_limit_price = v_comm_limit_price;
    SET p_occur_qty = v_occur_qty;
    SET p_occur_amt = v_occur_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_price = v_strike_price;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_fee = v_strike_fee;
    SET p_trade_fee = v_trade_fee;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_comb_code = v_comb_code;
    SET p_trade_capt_amt = v_trade_capt_amt;
    SET p_posi_capt_amt = v_posi_capt_amt;
    SET p_rece_margin = v_rece_margin;
    SET p_margin_ratio = v_margin_ratio;
    SET p_comm_margin = v_comm_margin;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_报盘_处理成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfurp_DealStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfurp_DealStrikeRsp(
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
    IN p_out_acco varchar(32),
    IN p_pass_no int,
    IN p_exch_no int,
    IN p_exch_crncy_type varchar(3),
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_contrc_unit int,
    IN p_contrc_type int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_report_date int,
    IN p_report_no varchar(32),
    IN p_order_id bigint,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_strike_price decimal(16,9),
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_rsp_info varchar(255),
    IN p_rsp_no int,
    IN p_pre_settle_price decimal(16,9),
    IN p_strike_margin decimal(18,4),
    IN p_exgp_long_rece_margin decimal(18,4),
    IN p_exgp_short_rece_margin decimal(18,4),
    IN p_asac_long_rece_margin decimal(18,4),
    IN p_asac_short_rece_margin decimal(18,4),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    IN p_comb_code varchar(6),
    IN p_exch_group_no int,
    IN p_exgp_long_stock_rece_margin decimal(18,4),
    IN p_exgp_short_stock_rece_margin decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_mach_date int,
    OUT p_mach_time int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_external_no bigint,
    OUT p_calc_dir int,
    OUT p_asset_type int,
    OUT p_invest_type int,
    OUT p_report_time int,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_qty decimal(18,2),
    OUT p_order_price decimal(16,9),
    OUT p_order_status varchar(2),
    OUT p_order_batch_no int,
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_record_count int,
    OUT p_strike_id bigint,
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_trade_fee decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_posi_qty decimal(18,2),
    OUT p_rece_margin decimal(18,4),
    OUT p_margin_ratio decimal(18,12),
    OUT p_trade_capt_amt decimal(18,4),
    OUT p_posi_capt_amt decimal(18,4),
    OUT p_strike_occur_amt decimal(18,4),
    OUT p_realize_pandl decimal(18,4),
    OUT p_close_pandl decimal(18,4),
    OUT p_order_margin decimal(18,4),
    OUT p_detail_posi_id bigint,
    OUT p_compli_trig_id bigint,
    OUT p_order_update_times int,
    OUT p_order_oper_way varchar(2),
    OUT p_update_times int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_out_acco varchar(32);
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_contrc_unit int;
    declare v_contrc_type int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_order_id bigint;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_rsp_info varchar(255);
    declare v_rsp_no int;
    declare v_pre_settle_price decimal(16,9);
    declare v_strike_margin decimal(18,4);
    declare v_exgp_long_rece_margin decimal(18,4);
    declare v_exgp_short_rece_margin decimal(18,4);
    declare v_asac_long_rece_margin decimal(18,4);
    declare v_asac_short_rece_margin decimal(18,4);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_comb_code varchar(6);
    declare v_exch_group_no int;
    declare v_exgp_long_stock_rece_margin decimal(18,4);
    declare v_exgp_short_stock_rece_margin decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_mach_date int;
    declare v_mach_time int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_external_no bigint;
    declare v_calc_dir int;
    declare v_asset_type int;
    declare v_invest_type int;
    declare v_report_time int;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_order_status varchar(2);
    declare v_order_batch_no int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_record_count int;
    declare v_strike_id bigint;
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_posi_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_margin_ratio decimal(18,12);
    declare v_trade_capt_amt decimal(18,4);
    declare v_posi_capt_amt decimal(18,4);
    declare v_strike_occur_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_order_margin decimal(18,4);
    declare v_detail_posi_id bigint;
    declare v_compli_trig_id bigint;
    declare v_order_update_times int;
    declare v_order_oper_way varchar(2);
    declare v_update_times int;
    declare v_busi_opor_no int;
    declare v_tmp_strike_margin decimal(18,4);
    declare v_comm_margin decimal(18,4);
    declare v_real_margin decimal(18,4);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_trade_commis decimal(18,4);
    declare v_tmp_other_commis decimal(18,4);
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_long_comm_margin decimal(18,4);
    declare v_short_comm_margin decimal(18,4);
    declare v_long_order_margin decimal(18,4);
    declare v_short_order_margin decimal(18,4);
    declare v_long_strike_margin decimal(18,4);
    declare v_short_strike_margin decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_row_id bigint;
    declare v_crncy_type varchar(3);
    declare v_comm_id bigint;
    declare v_tmp_trade_fee decimal(18,4);
    declare v_tmp_strike_commis decimal(18,4);
    declare v_tmp_strike_other_commis decimal(18,4);
    declare v_tmp_rece_margin decimal(18,4);
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_tmp_order_margin decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_strike_occur_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_comm_occur_amt decimal(18,4);
    declare v_trade_capt_amt_after decimal(18,4);
    declare v_posi_capt_amt_after decimal(18,4);
    declare v_comm_capt_amt_after decimal(18,4);
    declare v_update_date int;
    declare v_update_time int;
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_tmp_report_fee decimal(18,4);

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
    SET v_out_acco = p_out_acco;
    SET v_pass_no = p_pass_no;
    SET v_exch_no = p_exch_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_unit = p_contrc_unit;
    SET v_contrc_type = p_contrc_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_order_id = p_order_id;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_strike_price = p_strike_price;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_fee = p_strike_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_rsp_info = p_rsp_info;
    SET v_rsp_no = p_rsp_no;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_strike_margin = p_strike_margin;
    SET v_exgp_long_rece_margin = p_exgp_long_rece_margin;
    SET v_exgp_short_rece_margin = p_exgp_short_rece_margin;
    SET v_asac_long_rece_margin = p_asac_long_rece_margin;
    SET v_asac_short_rece_margin = p_asac_short_rece_margin;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_comb_code = p_comb_code;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exgp_long_stock_rece_margin = p_exgp_long_stock_rece_margin;
    SET v_exgp_short_stock_rece_margin = p_exgp_short_stock_rece_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_external_no = 0;
    SET v_calc_dir = 1;
    SET v_asset_type = 0;
    SET v_invest_type = 0;
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_qty = 0;
    SET v_order_price = 0;
    SET v_order_status = "0";
    SET v_order_batch_no = 0;
    SET v_wtdraw_qty = 0;
    SET v_record_count = 0;
    SET v_strike_id = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_trade_fee = 0;
    SET v_all_fee = 0;
    SET v_posi_qty = 0;
    SET v_rece_margin = 0;
    SET v_margin_ratio = 0;
    SET v_trade_capt_amt = 0;
    SET v_posi_capt_amt = 0;
    SET v_strike_occur_amt = 0;
    SET v_realize_pandl = 0;
    SET v_close_pandl = 0;
    SET v_order_margin = 0;
    SET v_detail_posi_id = 0;
    SET v_compli_trig_id = 0;
    SET v_order_update_times = 0;
    SET v_order_oper_way = " ";
    SET v_update_times = 1;
    SET v_busi_opor_no = 0;
    SET v_tmp_strike_margin = 0;
    SET v_comm_margin = 0;
    SET v_real_margin = 0;
    SET v_tmp_strike_amt = 0;
    SET v_tmp_strike_qty = 0;
    SET v_tmp_trade_commis = 0;
    SET v_tmp_other_commis = 0;
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_long_comm_margin = 0;
    SET v_short_comm_margin = 0;
    SET v_long_order_margin = 0;
    SET v_short_order_margin = 0;
    SET v_long_strike_margin = 0;
    SET v_short_strike_margin = 0;
    SET v_comm_capt_amt = 0;
    SET v_row_id = 0;
    SET v_crncy_type = "CNY";
    SET v_comm_id = 0;
    SET v_tmp_trade_fee = 0;
    SET v_tmp_strike_commis = 0;
    SET v_tmp_strike_other_commis = 0;
    SET v_tmp_rece_margin = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_tmp_order_margin = 0;
    SET v_trade_occur_qty = 0;
    SET v_strike_occur_qty = 0;
    SET v_trade_occur_amt = 0;
    SET v_comm_occur_amt = 0;
    SET v_trade_capt_amt_after = 0;
    SET v_posi_capt_amt_after = 0;
    SET v_comm_capt_amt_after = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_strike_capt_amt = 0;
    SET v_strike_all_fee = 0;
    SET v_tmp_report_fee = 0;

    
    label_pro:BEGIN
    

    /* set @临时_成交保证金#=@成交保证金#; */
    set v_tmp_strike_margin=v_strike_margin;

    /* set @指令保证金# = 0; */
    set v_comm_margin = 0;

    /* set @实收保证金# = 0; */
    set v_real_margin = 0;

    /* set @资产类型# = 31; */
    set v_asset_type = 31;

    /* set @投资类型# = 1; */
    set v_invest_type = 1;

    /* set @成交变动金额#=0; */
    set v_strike_occur_amt=0;

    /* set @交易占用金额#=0; */
    set v_trade_capt_amt=0;

    /* set @持仓占用金额#=0; */
    set v_posi_capt_amt=0;

    /* set @临时_成交金额# = @成交金额#; */
    set v_tmp_strike_amt = v_strike_amt;

    /* set @临时_成交数量# = @成交数量#; */
    set v_tmp_strike_qty = v_strike_qty;

    /* set @临时_交易佣金# = @交易佣金#; */
    set v_tmp_trade_commis = v_trade_commis;

    /* set @临时_其他佣金# = @其他佣金#; */
    set v_tmp_other_commis = v_other_commis;

    /* set @成交佣金#=@交易佣金#; */
    set v_strike_commis=v_trade_commis;

    /* set @成交其他佣金#=@其他佣金#; */
    set v_strike_other_commis=v_other_commis;

    /* set @多头持仓保证金#=@交易组多头应收保证金#; */
    set v_long_hold_margin=v_exgp_long_rece_margin;

    /* set @空头持仓保证金#=@交易组空头应收保证金#; */
    set v_short_hold_margin=v_exgp_short_rece_margin;

    /* [事务开始] */
    START TRANSACTION;

    #先锁保证金优惠，解决死锁问题

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
        SET v_error_code = "tdfutuT.5.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_锁定获取保证金优惠信息出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;

    #获取原订单信息

    /* 调用【原子_交易期货_交易_锁定获取成交回报订单信息】*/
    call db_tdfutu.pra_tdfutd_LockGetStrikeRspOrder(
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
        v_busi_opor_no,
        v_exch_group_no,
        v_crncy_type,
        v_futu_acco_no,
        v_contrc_code_no,
        v_asset_type,
        v_comb_code,
        v_report_fee,
        v_order_date,
        v_order_time,
        v_order_price,
        v_order_qty,
        v_order_status,
        v_strike_qty,
        v_wtdraw_fee,
        v_wtdraw_qty,
        v_trade_fee,
        v_trade_commis,
        v_other_commis,
        v_all_fee,
        v_strike_amt,
        v_comm_id,
        v_rece_margin,
        v_margin_ratio,
        v_order_oper_way,
        v_compli_trig_id,
        v_order_batch_no,
        v_hedge_type);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.5.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_锁定获取成交回报订单信息出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* set @临时_交易费用# = @交易费用#; */
    set v_tmp_trade_fee = v_trade_fee;
    #持仓数量变量用来记录订单中已成交和已撤单的数量,存在撤单先于成交的情况

    /* set @持仓数量#=@成交数量#+@撤单数量#; */
    set v_posi_qty=v_strike_qty+v_wtdraw_qty;
    #临时_成交佣金 和 临时_成交其他佣金 这两个字段  仅仅是为了记录交易佣金和其他佣金的变量

    /* set @临时_成交佣金#=@交易佣金#; */
    set v_tmp_strike_commis=v_trade_commis;

    /* set @临时_成交其他佣金#=@其他佣金#; */
    set v_tmp_strike_other_commis=v_other_commis;

    /* set @临时_应收保证金#=@应收保证金#; */
    set v_tmp_rece_margin=v_rece_margin;

    /* [检查报错返回][@订单数量# < @撤单数量# + @成交数量# + @临时_成交数量#][14][@初始化日期#,@申报编号#] */
    if v_order_qty < v_wtdraw_qty + v_strike_qty + v_tmp_strike_qty then
        ROLLBACK;
        SET v_error_code = "tdfutuT.5.21.14";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","申报编号=",v_report_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","申报编号=",v_report_no);
        end if;
        leave label_pro;
    end if;

    #更新指令表

    /* if @指令序号# > 0 then */
    if v_comm_id > 0 then

        /* set @成交金额# = @临时_成交金额#; */
        set v_strike_amt = v_tmp_strike_amt;

        /* set @成交数量# = @临时_成交数量#; */
        set v_strike_qty = v_tmp_strike_qty;

        /* 调用【原子_交易期货_指令_成交更新指令】*/
        call db_tdfutu.pra_tdfuap_StrikeUpdateComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_comm_id,
            v_strike_qty,
            v_strike_amt,
            v_exch_no,
            v_error_code,
            v_error_info,
            v_comm_date,
            v_comm_batch_no,
            v_comm_executor);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.5.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_成交更新指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

    end if;

    /* set @成交费用# = @成交佣金# + @成交其他佣金#; */
    set v_strike_fee = v_strike_commis + v_strike_other_commis;

    /* set @临时_订单保证金# = @临时_成交数量# * @应收保证金# / @订单数量#; */
    set v_tmp_order_margin = v_tmp_strike_qty * v_rece_margin / v_order_qty;

    /* if @订单状态# = 《订单状态-部撤》 then */
    if v_order_status = "7" then

        /* set @交易费用# = round(@临时_成交数量# *@临时_交易费用# / (@订单数量#-@持仓数量#),2); */
        set v_trade_fee = round(v_tmp_strike_qty *v_tmp_trade_fee / (v_order_qty-v_posi_qty),2);
    else
        #撤单费用预先收好了，所以要扣除撤单费用

        /* set @交易费用# = round(@临时_成交数量# *(@临时_交易费用#-@撤单费用#) / (@订单数量#-@持仓数量#),2); */
        set v_trade_fee = round(v_tmp_strike_qty *(v_tmp_trade_fee-v_wtdraw_fee) / (v_order_qty-v_posi_qty),2);
    end if;
    #已成状态的挂单 撤单费用反冲到资金表的交易费用  部成状态的挂单  撤单费用保留 不反冲

    /* if @撤单数量# = 0 and @订单数量# = @临时_成交数量# + @持仓数量# then */
    if v_wtdraw_qty = 0 and v_order_qty = v_tmp_strike_qty + v_posi_qty then

      /* set @交易费用# = @交易费用# + @撤单费用#; */
      set v_trade_fee = v_trade_fee + v_wtdraw_fee;
    end if;
    #更新资金持仓   期货成交业务资金持仓处理

    /* set @交易变动数量# = -1 * @临时_成交数量#; */
    set v_trade_occur_qty = -1 * v_tmp_strike_qty;

    /* set @成交变动数量# = @临时_成交数量#; */
    set v_strike_occur_qty = v_tmp_strike_qty;

    /* 调用【原子_交易期货_账户_更新成交持仓】*/
    call db_tdfutu.pra_tdfuac_UpdateStrikePosi(
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
        v_exch_crncy_type,
        v_futu_acco_no,
        v_contrc_code_no,
        v_contrc_type,
        v_contrc_unit,
        v_contrc_dir,
        v_hedge_type,
        v_lngsht_type,
        v_invest_type,
        v_comb_code,
        v_strike_no,
        v_strike_price,
        v_strike_fee,
        v_strike_margin,
        v_pre_settle_price,
        v_strike_amt,
        v_exgp_avail_qty,
        v_asac_avail_qty,
        v_strike_occur_qty,
        v_trade_occur_qty,
        v_exgp_long_rece_margin,
        v_exgp_short_rece_margin,
        v_exgp_long_stock_rece_margin,
        v_exgp_short_stock_rece_margin,
        v_error_code,
        v_error_info,
        v_rece_margin,
        v_close_pandl,
        v_detail_posi_id);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.5.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新成交持仓出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* set @交易费用# = -1 * @交易费用#; */
    set v_trade_fee = -1 * v_trade_fee;

    /* if @开平方向# = 《开平方向-开仓》 then */
    if v_contrc_dir = 1 then

      /* if @组合编码# <> " " then */
      if v_comb_code <> " " then
        #[原子_交易期货_账户_锁定获取保证金优惠信息]

        /* set @订单保证金# = -1 * @临时_订单保证金#; */
        set v_order_margin = -1 * v_tmp_order_margin;

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
            SET v_error_code = "tdfutuT.5.21.999";
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

        /* set @交易变动金额# = -1 * @订单保证金#; */
        set v_trade_occur_amt = -1 * v_order_margin;

        /* set @成交变动金额# = @成交保证金#; */
        set v_strike_occur_amt = v_strike_margin;
      end if;
    else

      /* if @组合编码# <> " " then */
      if v_comb_code <> " " then

        /* set @成交保证金#=-1*@应收保证金#; */
        set v_strike_margin=-1*v_rece_margin;

        /* set @订单保证金# = -1*@临时_订单保证金#; */
        set v_order_margin = -1*v_tmp_order_margin;
        #[原子_交易期货_账户_锁定获取保证金优惠信息]

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
            SET v_error_code = "tdfutuT.5.21.999";
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

        /* set @成交变动金额#=-1*@成交变动金额#; */
        set v_strike_occur_amt=-1*v_strike_occur_amt;
      else

        /* set @成交变动金额# = @成交保证金#; */
        set v_strike_occur_amt = v_strike_margin;
      end if;
    end if;

    /* 调用【原子_交易期货_账户_更新交易组成交资金】*/
    call db_tdfutu.pra_tdfuac_UpdateExgpStrikeCapit(
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
        v_exch_crncy_type,
        v_futu_acco_no,
        v_contrc_code_no,
        v_contrc_type,
        v_invest_type,
        v_lngsht_type,
        v_contrc_dir,
        v_order_dir,
        v_strike_occur_amt,
        v_strike_fee,
        v_trade_occur_amt,
        v_trade_fee,
        v_close_pandl,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.5.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新交易组成交资金出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* if @指令变动金额# > 0 then */
    if v_comm_occur_amt > 0 then

        /* [更新表记录][交易期货_账户_交易组业务资金表][{指令占用金额}={指令占用金额}+@指令变动金额#][{交易组编号} = @交易组编号# and {资产账户编号}=@资产账户编号# and {交易币种} = @交易币种#][2][@交易组编号#,@资产账户编号#,@交易币种#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdfutu.tb_tdfuac_exgp_busi_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, comm_capt_amt=comm_capt_amt+v_comm_occur_amt where exch_group_no = v_exch_group_no and asset_acco_no=v_asset_acco_no and exch_crncy_type = v_exch_crncy_type;
        if v_error_code = "1" then
            ROLLBACK;        
            SET v_error_code = "tdfutuT.5.21.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @组合编码# <> " " then */
    if v_comb_code <> " " then

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

        /* if @开平方向# = 《开平方向-开仓》 then */
        if v_contrc_dir = 1 then

          /* set @多头订单保证金# = @订单保证金#; */
          set v_long_order_margin = v_order_margin;

          /* set @多头成交保证金# = @成交保证金#; */
          set v_long_strike_margin = v_strike_margin;
        else

          /* set @多头订单保证金# =-1* @临时_订单保证金#; */
          set v_long_order_margin =-1* v_tmp_order_margin;

          /* set @多头成交保证金# =-1*@应收保证金#; */
          set v_long_strike_margin =-1*v_rece_margin;

          /* set @成交保证金#=-1*@应收保证金#; */
          set v_strike_margin=-1*v_rece_margin;
        end if;
      else

        /* if @开平方向# = 《开平方向-开仓》 then */
        if v_contrc_dir = 1 then

          /* set @空头订单保证金# = @订单保证金#; */
          set v_short_order_margin = v_order_margin;

          /* set @空头成交保证金# = @成交保证金#; */
          set v_short_strike_margin = v_strike_margin;
        else

          /* set @空头订单保证金# =-1* @临时_订单保证金#; */
          set v_short_order_margin =-1* v_tmp_order_margin;

          /* set @空头成交保证金# = -1*@应收保证金#; */
          set v_short_strike_margin = -1*v_rece_margin;

          /* set @成交保证金#=-1*@应收保证金#; */
          set v_strike_margin=-1*v_rece_margin;
        end if;
      end if;

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
          SET v_error_code = "tdfutuT.5.21.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新保证金优惠信息出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


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
          SET v_error_code = "tdfutuT.5.21.999";
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

    /* if @开平方向# = 《开平方向-平仓》 or @开平方向# = 《开平方向-平今仓》 then */
    if v_contrc_dir = 2 or v_contrc_dir = 3 then

        /* set @成交变动金额#=-1*@成交变动金额#; */
        set v_strike_occur_amt=-1*v_strike_occur_amt;
    end if;

    /* 调用【原子_交易期货_账户_更新资产账户成交资金】*/
    call db_tdfutu.pra_tdfuac_UpdateAsacStrikeCapit(
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
        v_exch_crncy_type,
        v_futu_acco_no,
        v_contrc_code_no,
        v_contrc_type,
        v_invest_type,
        v_lngsht_type,
        v_contrc_dir,
        v_order_dir,
        v_strike_occur_amt,
        v_strike_fee,
        v_trade_occur_amt,
        v_trade_fee,
        v_close_pandl,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.5.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新资产账户成交资金出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* if @指令变动金额# > 0 then */
    if v_comm_occur_amt > 0 then

        /* [更新表记录][交易期货_账户_资产账户业务资金表][{指令占用金额}={指令占用金额}+@指令变动金额#][{资产账户编号}=@资产账户编号# and {交易币种} = @交易币种#][2][@资产账户编号#,@交易币种#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdfutu.tb_tdfuac_asac_busi_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, comm_capt_amt=comm_capt_amt+v_comm_occur_amt where asset_acco_no=v_asset_acco_no and exch_crncy_type = v_exch_crncy_type;
        if v_error_code = "1" then
            ROLLBACK;        
            SET v_error_code = "tdfutuT.5.21.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易币种=",v_exch_crncy_type);
            end if;
            leave label_pro;
        end if;

    end if;
    #插入成交表

    /* set @成交金额# = @成交价格# * @临时_成交数量# * @合约乘数#; */
    set v_strike_amt = v_strike_price * v_tmp_strike_qty * v_contrc_unit;

    /* set @全部费用# = @成交费用#; */
    set v_all_fee = v_strike_fee;

    /* set @交易佣金#=@临时_交易佣金#; */
    set v_trade_commis=v_tmp_trade_commis;

    /* set @其他佣金#=@临时_其他佣金#; */
    set v_other_commis=v_tmp_other_commis;

    /* set @成交数量#=@临时_成交数量#; */
    set v_strike_qty=v_tmp_strike_qty;

    /* set @回报信息#="已成交"; */
    set v_rsp_info="已成交";

    /* if @开平方向# <> 《开平方向-开仓》 then */
    if v_contrc_dir <> 1 then

      /* set @成交保证金#=-1*@成交保证金#; */
      set v_strike_margin=-1*v_strike_margin;

      /* set @成交变动金额#=-1*@成交变动金额#; */
      set v_strike_occur_amt=-1*v_strike_occur_amt;
    end if;

    /* 调用【原子_交易期货_报盘_新增成交记录】*/
    call db_tdfutu.pra_tdfurp_AddStrikeRecord(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_opor_no,
        v_rsp_no,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_futu_acco,
        v_contrc_code,
        v_exch_no,
        v_crncy_type,
        v_pass_no,
        v_out_acco,
        v_futu_acco_no,
        v_contrc_code_no,
        v_contrc_type,
        v_contrc_unit,
        v_comm_id,
        v_strike_date,
        v_strike_time,
        v_strike_no,
        v_report_date,
        v_report_no,
        v_order_id,
        v_order_date,
        v_order_time,
        v_order_dir,
        v_contrc_dir,
        v_hedge_type,
        v_order_price,
        v_order_qty,
        v_strike_qty,
        v_strike_price,
        v_strike_amt,
        v_strike_fee,
        v_strike_margin,
        v_close_pandl,
        v_strike_occur_amt,
        v_order_oper_way,
        v_rsp_info,
        v_error_code,
        v_error_info,
        v_strike_id,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.5.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_报盘_新增成交记录出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;

    #更新订单表

    /* if @订单数量# = (@持仓数量#+@成交数量#) and @撤单数量# = 0 then */
    if v_order_qty = (v_posi_qty+v_strike_qty) and v_wtdraw_qty = 0 then

      /* set @订单状态# = 《订单状态-已成》; */
      set v_order_status = "6";

      /* set @交易佣金#=0; */
      set v_trade_commis=0;

      /* set @其他佣金#=0; */
      set v_other_commis=0;

      /* set @撤单费用#=0; */
      set v_wtdraw_fee=0;

      /* set @应收保证金#=0; */
      set v_rece_margin=0;

    /* elseif @撤单数量# > 0 then */
    elseif v_wtdraw_qty > 0 then

      /* set @订单状态# = 《订单状态-部撤》; */
      set v_order_status = "7";

      /* set @交易佣金#=0; */
      set v_trade_commis=0;

      /* set @其他佣金#=0; */
      set v_other_commis=0;

      /* set @应收保证金#=round((@订单数量#-@持仓数量#-@临时_成交数量#)*@临时_应收保证金#/(@订单数量#-@持仓数量#),2); */
      set v_rece_margin=round((v_order_qty-v_posi_qty-v_tmp_strike_qty)*v_tmp_rece_margin/(v_order_qty-v_posi_qty),2);

    /* elseif @订单数量# > @持仓数量#+@成交数量#-@撤单数量# then */
    elseif v_order_qty > v_posi_qty+v_strike_qty-v_wtdraw_qty then

      /* set @订单状态# = 《订单状态-部成》; */
      set v_order_status = "5";

      /* set @交易佣金#=round((@订单数量#-@持仓数量#-@临时_成交数量#)*@临时_成交佣金#/(@订单数量#-@持仓数量#),2); */
      set v_trade_commis=round((v_order_qty-v_posi_qty-v_tmp_strike_qty)*v_tmp_strike_commis/(v_order_qty-v_posi_qty),2);

      /* set @其他佣金#=round((@订单数量#-@持仓数量#-@临时_成交数量#)*@临时_成交其他佣金#/(@订单数量#-@持仓数量#),2); */
      set v_other_commis=round((v_order_qty-v_posi_qty-v_tmp_strike_qty)*v_tmp_strike_other_commis/(v_order_qty-v_posi_qty),2);

      /* set @应收保证金#=round((@订单数量#-@持仓数量#-@临时_成交数量#)*@临时_应收保证金#/(@订单数量#-@持仓数量#),2); */
      set v_rece_margin=round((v_order_qty-v_posi_qty-v_tmp_strike_qty)*v_tmp_rece_margin/(v_order_qty-v_posi_qty),2);
    end if;
    #set @成交数量#=@成交数量#+@持仓数量#;

    /* set @交易变动金额#=@成交变动金额#; */
    set v_trade_occur_amt=v_strike_occur_amt;

    /* set @成交全部费用#=@成交佣金#+@成交其他佣金#; */
    set v_strike_all_fee=v_strike_commis+v_strike_other_commis;

    /* 调用【原子_交易期货_交易_更新期货订单表记录】*/
    call db_tdfutu.pra_tdfutd_UpdateOrderRecord(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_pass_no,
        v_out_acco,
        v_order_id,
        v_order_date,
        v_order_status,
        v_report_no,
        v_report_date,
        v_report_fee,
        v_strike_qty,
        v_strike_amt,
        v_strike_price,
        v_wtdraw_qty,
        v_wtdraw_fee,
        v_trade_commis,
        v_other_commis,
        v_strike_commis,
        v_strike_other_commis,
        v_strike_all_fee,
        v_trade_occur_amt,
        v_trade_fee,
        v_rsp_info,
        v_error_code,
        v_error_info,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.5.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_更新期货订单表记录出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* set @持仓数量#=@成交数量#; */
    set v_posi_qty=v_strike_qty;

    /* set @成交数量# = @临时_成交数量#; */
    set v_strike_qty = v_tmp_strike_qty;

    /* set @成交金额# = @临时_成交金额# ; */
    set v_strike_amt = v_tmp_strike_amt ;

    /* set @临时_申报费用# = @申报费用#; */
    set v_tmp_report_fee = v_report_fee;

    /* set @申报费用# = 0; */
    set v_report_fee = 0;

    /* 调用【原子_交易期货_交易_成交处理汇总订单】*/
    call db_tdfutu.pra_tdfuap_StrikeDealSumOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_exch_crncy_type,
        v_exch_no,
        v_contrc_code_no,
        v_contrc_code,
        v_asset_type,
        v_order_date,
        v_order_batch_no,
        v_order_dir,
        v_order_status,
        v_strike_amt,
        v_strike_qty,
        v_trade_commis,
        v_other_commis,
        v_strike_other_commis,
        v_strike_all_fee,
        v_report_fee,
        v_wtdraw_fee,
        v_trade_fee,
        v_strike_commis,
        v_order_oper_way,
        v_contrc_unit,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.5.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_成交处理汇总订单出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* set @申报费用# = @临时_申报费用#; */
    set v_report_fee = v_tmp_report_fee;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_mach_date = v_mach_date;
    SET p_mach_time = v_mach_time;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_external_no = v_external_no;
    SET p_calc_dir = v_calc_dir;
    SET p_asset_type = v_asset_type;
    SET p_invest_type = v_invest_type;
    SET p_report_time = v_report_time;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_qty = v_order_qty;
    SET p_order_price = v_order_price;
    SET p_order_status = v_order_status;
    SET p_order_batch_no = v_order_batch_no;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_record_count = v_record_count;
    SET p_strike_id = v_strike_id;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_trade_fee = v_trade_fee;
    SET p_all_fee = v_all_fee;
    SET p_posi_qty = v_posi_qty;
    SET p_rece_margin = v_rece_margin;
    SET p_margin_ratio = v_margin_ratio;
    SET p_trade_capt_amt = v_trade_capt_amt;
    SET p_posi_capt_amt = v_posi_capt_amt;
    SET p_strike_occur_amt = v_strike_occur_amt;
    SET p_realize_pandl = v_realize_pandl;
    SET p_close_pandl = v_close_pandl;
    SET p_order_margin = v_order_margin;
    SET p_detail_posi_id = v_detail_posi_id;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_order_update_times = v_order_update_times;
    SET p_order_oper_way = v_order_oper_way;
    SET p_update_times = v_update_times;
    SET p_busi_opor_no = v_busi_opor_no;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_报盘_新增补单订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfurp_AddMissOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfurp_AddMissOrder(
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
    IN p_pass_no int,
    IN p_exch_no int,
    IN p_out_acco varchar(32),
    IN p_futu_acco_no int,
    IN p_futu_acco varchar(16),
    IN p_contrc_code_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_asset_type int,
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_external_no bigint,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_lngsht_type int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_report_fee decimal(18,4),
    IN p_wtdraw_fee decimal(18,4),
    IN p_trade_fee decimal(18,4),
    IN p_all_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_comb_code varchar(6),
    IN p_asac_busi_config_str varchar(64),
    IN p_pre_settle_price decimal(16,9),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_rece_margin decimal(18,4),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    IN p_exgp_long_rece_margin decimal(18,4),
    IN p_exgp_short_rece_margin decimal(18,4),
    IN p_asac_long_rece_margin decimal(18,4),
    IN p_asac_short_rece_margin decimal(18,4),
    IN p_order_status varchar(2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_id bigint,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
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
    declare v_asset_type int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_external_no bigint;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_lngsht_type int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_asac_busi_config_str varchar(64);
    declare v_pre_settle_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_exgp_long_rece_margin decimal(18,4);
    declare v_exgp_short_rece_margin decimal(18,4);
    declare v_asac_long_rece_margin decimal(18,4);
    declare v_asac_short_rece_margin decimal(18,4);
    declare v_order_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_order_oper_way varchar(2);
    declare v_update_times int;
    declare v_comm_opor int;
    declare v_comm_batch_no int;
    declare v_comm_id bigint;
    declare v_comm_margin decimal(18,4);
    declare v_compli_trig_id bigint;
    declare v_rsp_status varchar(2);
    declare v_rsp_info varchar(255);
    declare v_calc_dir int;
    declare v_crncy_type varchar(3);
    declare v_rsp_id bigint;
    declare v_order_batch_no int;
    declare v_strike_fee decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_margin_ratio decimal(18,12);
    declare v_strike_margin decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_exch_crncy_type varchar(3);
    declare v_invest_type int;
    declare v_order_margin decimal(18,4);
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
    declare v_row_id bigint;
    declare v_strike_occur_amt decimal(18,4);
    declare v_comm_occur_amt decimal(18,4);
    declare v_trade_capt_amt_after decimal(18,4);
    declare v_posi_capt_amt_after decimal(18,4);
    declare v_comm_capt_amt_after decimal(18,4);
    declare v_real_margin decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
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
    SET v_pass_no = p_pass_no;
    SET v_exch_no = p_exch_no;
    SET v_out_acco = p_out_acco;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_asset_type = p_asset_type;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_external_no = p_external_no;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_report_fee = p_report_fee;
    SET v_wtdraw_fee = p_wtdraw_fee;
    SET v_trade_fee = p_trade_fee;
    SET v_all_fee = p_all_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_comb_code = p_comb_code;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_rece_margin = p_rece_margin;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_exgp_long_rece_margin = p_exgp_long_rece_margin;
    SET v_exgp_short_rece_margin = p_exgp_short_rece_margin;
    SET v_asac_long_rece_margin = p_asac_long_rece_margin;
    SET v_asac_short_rece_margin = p_asac_short_rece_margin;
    SET v_order_status = p_order_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_order_oper_way = " ";
    SET v_update_times = 1;
    SET v_comm_opor = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_id = 0;
    SET v_comm_margin = 0;
    SET v_compli_trig_id = 0;
    SET v_rsp_status = "0";
    SET v_rsp_info = " ";
    SET v_calc_dir = 1;
    SET v_crncy_type = "CNY";
    SET v_rsp_id = 0;
    SET v_order_batch_no = 0;
    SET v_strike_fee = 0;
    SET v_strike_all_fee = 0;
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_margin_ratio = 0;
    SET v_strike_margin = 0;
    SET v_trade_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_invest_type = 0;
    SET v_order_margin = 0;
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
    SET v_row_id = 0;
    SET v_strike_occur_amt = 0;
    SET v_comm_occur_amt = 0;
    SET v_trade_capt_amt_after = 0;
    SET v_posi_capt_amt_after = 0;
    SET v_comm_capt_amt_after = 0;
    SET v_real_margin = 0;
    SET v_trade_occur_qty = 0;
    SET v_strike_capt_amt = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* set @指令下达人#=0; */
    set v_comm_opor=0;

    /* set @指令批号#=0; */
    set v_comm_batch_no=0;

    /* set @指令序号#=0; */
    set v_comm_id=0;

    /* set @指令保证金#=0; */
    set v_comm_margin=0;

    /* set @合规触警序号#=0; */
    set v_compli_trig_id=0;

    /* set @回报状态# = 《回报状态-成功》; */
    set v_rsp_status = "1";

    /* set @回报信息# ="报盘换机补单"; */
    set v_rsp_info ="报盘换机补单";

    /* set @计算方向#=《计算方向-加上》; */
    set v_calc_dir=1;

    /* set @本币币种# = "CNY"; */
    set v_crncy_type = "CNY";

    /* 调用【原子_交易期货_报盘_检查补单订单重复回报】*/
    call db_tdfutu.pra_tdfurp_CheckMissOrderRspDup(
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
        v_exch_no,
        v_futu_acco,
        v_contrc_code,
        v_order_price,
        v_order_qty,
        v_order_dir,
        v_report_date,
        v_report_time,
        v_report_no,
        v_contrc_dir,
        v_hedge_type,
        v_rsp_info,
        v_rsp_status,
        v_error_code,
        v_error_info,
        v_rsp_id,
        v_order_date,
        v_order_id,
        v_strike_amt,
        v_strike_qty,
        v_order_oper_way,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.5.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_报盘_检查补单订单重复回报出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* [检查正常返回][substring(@资产账户业务控制配置串#,11,1) <> 《补单回报处理方式-补委托处理》] */
    if substring(v_asac_busi_config_str,11,1) <> 2 then
        ROLLBACK;
        leave label_pro;
    end if;


    /* if @订单序号# = 0 then */
    if v_order_id = 0 then

      /* set @订单批号#=0; */
      set v_order_batch_no=0;

      /* if @订单状态# <>《订单状态-已撤》   then */
      if v_order_status <>"4"   then

          /* set @成交费用#=@申报费用#; */
          set v_strike_fee=v_report_fee;

          /* set @成交全部费用#=@申报费用#; */
          set v_strike_all_fee=v_report_fee;

          /* set @订单状态# = 《订单状态-已报》; */
          set v_order_status = "2";
      else

          /* set @成交费用#=@申报费用#+@撤单费用#; */
          set v_strike_fee=v_report_fee+v_wtdraw_fee;

          /* set @成交全部费用#=@申报费用#+@撤单费用#; */
          set v_strike_all_fee=v_report_fee+v_wtdraw_fee;
      end if;

      /* set @成交佣金#=0; */
      set v_strike_commis=0;

      /* set @成交其他佣金#=0; */
      set v_strike_other_commis=0;

      /* set @保证金比例#=0; */
      set v_margin_ratio=0;

      /* set @成交保证金#=0; */
      set v_strike_margin=0;

      /* set @交易变动金额#=0; */
      set v_trade_occur_amt=0;

      /* set @指令变动数量#=0; */
      set v_comm_occur_qty=0;

      /* set @交易币种#="CNY"; */
      set v_exch_crncy_type="CNY";

      /* set @订单日期# = @申报日期#; */
      set v_order_date = v_report_date;

      /* set @投资类型# = 1; */
      set v_invest_type = 1;
      #计算实际保证金，资金变化

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
            SET v_error_code = "tdfutuT.5.22.999";
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
            SET v_error_code = "tdfutuT.5.22.999";
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

        /* set @交易变动金额# = @实收保证金#; */
        set v_trade_occur_amt = v_real_margin;
      end if;

      /* if @开平方向# = 《开平方向-开仓》 then */
      if v_contrc_dir = 1 then

        /* set @交易费用# = @计算方向# * @交易费用# - @申报费用#; */
        set v_trade_fee = v_calc_dir * v_trade_fee - v_report_fee;

        /* set @交易变动数量#=@计算方向#*@订单数量#; */
        set v_trade_occur_qty=v_calc_dir*v_order_qty;
      else

        /* set @交易变动金额# = 0; */
        set v_trade_occur_amt = 0;

        /* set @交易变动数量# = @计算方向# * @订单数量#; */
        set v_trade_occur_qty = v_calc_dir * v_order_qty;
      end if;

      /* if @订单状态# =《订单状态-已撤》   then */
      if v_order_status ="4"   then

          /* set @交易费用#=0; */
          set v_trade_fee=0;

          /* set @交易佣金#=0; */
          set v_trade_commis=0;
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
          SET v_error_code = "tdfutuT.5.22.999";
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
            SET v_error_code = "tdfutuT.5.22.999";
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
            SET v_error_code = "tdfutuT.5.22.999";
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
          SET v_error_code = "tdfutuT.5.22.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新资产账户交易资金出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
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
          SET v_error_code = "tdfutuT.5.22.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新交易持仓出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


      /* set @订单操作方式# = 《订单操作方式-报盘机补单》; */
      set v_order_oper_way = "33";

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
          SET v_error_code = "tdfutuT.5.22.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_新增订单出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;

      #更新订单回报表

      /* 调用【原子_交易期货_报盘_更新订单回报状态】*/
      call db_tdfutu.pra_tdfurp_UpdateOrderRspStatus(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_rsp_id,
          v_order_id,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "tdfutuT.5.22.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_报盘_更新订单回报状态出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;

    #elseif @订单操作方式# = 《订单操作方式-报盘机补单》 then
      #更新状态
      #[原子_交易期货_交易_更新订单状态]
      #set @更新次数#=@更新次数#+1;
    end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_id = v_order_id;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_order_oper_way = v_order_oper_way;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_报盘_检查成交回报获取订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfurp_CheckStrikeRspGetOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfurp_CheckStrikeRspGetOrderInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_exch_no int,
    IN p_out_acco varchar(32),
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_contrc_dir int,
    IN p_report_date int,
    IN p_report_no varchar(32),
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_order_dir int,
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_rsp_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_order_date int,
    OUT p_order_id bigint,
    OUT p_rsp_time int,
    OUT p_rsp_no int,
    OUT p_comb_code varchar(6),
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_order_qty decimal(18,2),
    OUT p_hedge_type int
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
    declare v_exch_no int;
    declare v_out_acco varchar(32);
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_contrc_dir int;
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_rsp_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_rsp_time int;
    declare v_rsp_no int;
    declare v_comb_code varchar(6);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_qty decimal(18,2);
    declare v_hedge_type int;

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
    SET v_exch_no = p_exch_no;
    SET v_out_acco = p_out_acco;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_dir = p_contrc_dir;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_order_dir = p_order_dir;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_rsp_info = p_rsp_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_id = 0;
    SET v_rsp_time = date_format(curtime(),'%H%i%s');
    SET v_rsp_no = 0;
    SET v_comb_code = " ";
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_order_qty = 0;
    SET v_hedge_type = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易期货_报盘_检查成交回报获取订单信息】*/
    call db_tdfutu.pra_tdfurp_CheckStrikeRspGetOrderInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_pass_no,
        v_exch_no,
        v_out_acco,
        v_futu_acco,
        v_contrc_code,
        v_contrc_dir,
        v_report_date,
        v_report_no,
        v_strike_date,
        v_strike_time,
        v_strike_no,
        v_order_dir,
        v_strike_price,
        v_strike_qty,
        v_strike_amt,
        v_rsp_info,
        v_error_code,
        v_error_info,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_futu_acco_no,
        v_contrc_code_no,
        v_contrc_type,
        v_contrc_unit,
        v_order_date,
        v_order_id,
        v_rsp_time,
        v_rsp_no,
        v_comb_code,
        v_comm_id,
        v_comm_batch_no,
        v_order_qty,
        v_hedge_type);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.5.31.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_报盘_检查成交回报获取订单信息出现错误！',v_mysql_message);
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
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_order_date = v_order_date;
    SET p_order_id = v_order_id;
    SET p_rsp_time = v_rsp_time;
    SET p_rsp_no = v_rsp_no;
    SET p_comb_code = v_comb_code;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_order_qty = v_order_qty;
    SET p_hedge_type = v_hedge_type;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_报盘_查询订单回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfurp_QueryOrderRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfurp_QueryOrderRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_order_dir_str varchar(1024),
    IN p_rsp_status_str varchar(64),
    IN p_deal_status_str varchar(64),
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
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_order_dir_str varchar(1024);
    declare v_rsp_status_str varchar(64);
    declare v_deal_status_str varchar(64);
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_order_dir_str = p_order_dir_str;
    SET v_rsp_status_str = p_rsp_status_str;
    SET v_deal_status_str = p_deal_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
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

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

      /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
      set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* if @回报状态串# <> " " then */
    if v_rsp_status_str <> " " then

      /* set @回报状态串#=concat(";", @回报状态串#, ";"); */
      set v_rsp_status_str=concat(";", v_rsp_status_str, ";");
    end if;

    /* if @处理状态串# <> " " then */
    if v_deal_status_str <> " " then

      /* set @处理状态串#=concat(";", @处理状态串#, ";"); */
      set v_deal_status_str=concat(";", v_deal_status_str, ";");
    end if;

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易期货_报盘_查询订单回报】*/
    call db_tdfutu.pra_tdfurp_QueryOrderRsp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_exch_no_str,
        v_futu_acco,
        v_contrc_code,
        v_order_dir_str,
        v_rsp_status_str,
        v_deal_status_str,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.5.101.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_报盘_查询订单回报出现错误！',v_mysql_message);
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

# 事务_交易期货_报盘_查询成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfurp_QueryStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfurp_QueryStrikeRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_order_dir_str varchar(1024),
    IN p_deal_status_str varchar(64),
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
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_order_dir_str varchar(1024);
    declare v_deal_status_str varchar(64);
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_order_dir_str = p_order_dir_str;
    SET v_deal_status_str = p_deal_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
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

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

      /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
      set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* if @处理状态串# <> " " then */
    if v_deal_status_str <> " " then

      /* set @处理状态串#=concat(";", @处理状态串#, ";"); */
      set v_deal_status_str=concat(";", v_deal_status_str, ";");
    end if;

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易期货_报盘_查询成交回报】*/
    call db_tdfutu.pra_tdfurp_QueryStrikeRsp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_exch_no_str,
        v_futu_acco,
        v_contrc_code,
        v_order_dir_str,
        v_deal_status_str,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.5.121.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_报盘_查询成交回报出现错误！',v_mysql_message);
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

# 事务_交易期货_报盘_查询成交明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfurp_QueryStrikeDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfurp_QueryStrikeDetail(
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
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code_no int,
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_dir_str varchar(1024),
    IN p_query_type int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_contrc_code_no int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_query_type int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_query_type = p_query_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
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

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易期货_报盘_查询成交明细】*/
    call db_tdfutu.pra_tdfurp_QueryStrikeDetail(
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
        v_exch_no_str,
        v_contrc_code_no,
        v_comm_id,
        v_comm_batch_no,
        v_order_dir_str,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.5.122.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_报盘_查询成交明细出现错误！',v_mysql_message);
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

# 事务_交易期货_报盘_查询成交明细历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfurp_QueryStrikeDetailHis;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfurp_QueryStrikeDetailHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code_no int,
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_dir_str varchar(1024),
    IN p_query_type int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_contrc_code_no int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_query_type int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_query_type = p_query_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdfutuT.5.123.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdfutuT.5.123.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>93 then
        
        SET v_error_code = "tdfutuT.5.123.255";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易期货_报盘_查询成交明细历史】*/
    call db_tdfutu.pra_tdfurp_QueryStrikeDetailHis(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_exch_no_str,
        v_contrc_code_no,
        v_comm_id,
        v_comm_batch_no,
        v_order_dir_str,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.5.123.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_报盘_查询成交明细历史出现错误！',v_mysql_message);
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

# 事务_交易期货_报盘_获取订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfurp_GetOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfurp_GetOrderInfo(
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
    OUT p_rece_margin decimal(18,4)
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

    
    label_pro:BEGIN
    

    /* 调用【原子_交易期货_报盘_获取订单信息】*/
    call db_tdfutu.pra_tdfurp_GetOrderInfo(
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
        v_rece_margin);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.5.130.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_报盘_获取订单信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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

END;;


