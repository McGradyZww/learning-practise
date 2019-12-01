DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_指令_新增指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_AddCommand;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_AddCommand(
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
    IN p_exch_crncy_type varchar(3),
    IN p_contrc_code_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_name varchar(64),
    IN p_contrc_type int,
    IN p_asset_type int,
    IN p_contrc_unit int,
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_busi_limit_str varchar(2048),
    IN p_exgp_busi_config_str varchar(64),
    IN p_asac_busi_config_str varchar(64),
    IN p_exgp_avail_amt decimal(18,4),
    IN p_asac_avail_amt decimal(18,4),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    IN p_external_no bigint,
    IN p_calc_dir int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_lngsht_type int,
    IN p_comm_batch_no int,
    IN p_comm_dir int,
    IN p_comm_limit_price decimal(16,9),
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_qty decimal(18,2),
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
    IN p_comm_begin_date int,
    IN p_comm_end_date int,
    IN p_comm_begin_time int,
    IN p_comm_end_time int,
    IN p_comm_oper_way varchar(2),
    IN p_comm_executor int,
    IN p_comm_appr_oper int,
    IN p_margin_ratio decimal(18,12),
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_id bigint,
    OUT p_comm_date int,
    OUT p_comm_time int,
    OUT p_comm_status varchar(2),
    OUT p_comm_appr_status varchar(2),
    OUT p_comm_comple_date int,
    OUT p_comm_comple_time int,
    OUT p_comm_appr_date int,
    OUT p_comm_appr_time int,
    OUT p_comm_appr_remark varchar(255),
    OUT p_comm_comple_flag int,
    OUT p_comm_frozen_qty decimal(18,2),
    OUT p_strike_status varchar(2),
    OUT p_order_id bigint,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_batch_no int,
    OUT p_order_dir int,
    OUT p_order_qty decimal(18,2),
    OUT p_order_price decimal(16,9),
    OUT p_price_type int,
    OUT p_order_status varchar(2),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_order_oper_way varchar(2),
    OUT p_update_times int,
    OUT p_comm_amt decimal(18,4),
    OUT p_appr_allow_order_flag int
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
    declare v_exch_crncy_type varchar(3);
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_name varchar(64);
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_contrc_unit int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_busi_limit_str varchar(2048);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_external_no bigint;
    declare v_calc_dir int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_lngsht_type int;
    declare v_comm_batch_no int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
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
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_oper_way varchar(2);
    declare v_comm_executor int;
    declare v_comm_appr_oper int;
    declare v_margin_ratio decimal(18,12);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_id bigint;
    declare v_comm_date int;
    declare v_comm_time int;
    declare v_comm_status varchar(2);
    declare v_comm_appr_status varchar(2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_appr_remark varchar(255);
    declare v_comm_comple_flag int;
    declare v_comm_frozen_qty decimal(18,2);
    declare v_strike_status varchar(2);
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_price_type int;
    declare v_order_status varchar(2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_order_oper_way varchar(2);
    declare v_update_times int;
    declare v_comm_amt decimal(18,4);
    declare v_appr_allow_order_flag int;
    declare v_is_record_jour int;
    declare v_invest_type int;
    declare v_order_margin decimal(18,4);
    declare v_comm_margin decimal(18,4);
    declare v_strike_margin decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_tmp_trade_fee decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_comm_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_change_qty decimal(18,2);
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
    declare v_trade_occur_amt decimal(18,4);
    declare v_strike_occur_amt decimal(18,4);
    declare v_comm_occur_amt decimal(18,4);
    declare v_trade_capt_amt_after decimal(18,4);
    declare v_posi_capt_amt_after decimal(18,4);
    declare v_comm_capt_amt_after decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_strike_capt_amt decimal(18,4);
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_tmp_comm_occur_amt decimal(18,4);
    declare v_tmp_comm_occur_qty decimal(18,2);
    declare v_tmp_comm_frozen_qty decimal(18,2);
    declare v_comm_appr_oper_no int;
    declare v_mach_time int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_trade_occur_qty decimal(18,2);
    declare v_exter_comm_flag int;
    declare v_pass_status varchar(2);
    declare v_tmp_comm_margin decimal(18,4);
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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_name = p_contrc_name;
    SET v_contrc_type = p_contrc_type;
    SET v_asset_type = p_asset_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_exgp_busi_config_str = p_exgp_busi_config_str;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_exgp_avail_amt = p_exgp_avail_amt;
    SET v_asac_avail_amt = p_asac_avail_amt;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_external_no = p_external_no;
    SET v_calc_dir = p_calc_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_dir = p_comm_dir;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_qty = p_comm_qty;
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
    SET v_comm_begin_date = p_comm_begin_date;
    SET v_comm_end_date = p_comm_end_date;
    SET v_comm_begin_time = p_comm_begin_time;
    SET v_comm_end_time = p_comm_end_time;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_margin_ratio = p_margin_ratio;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_id = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_status = "0";
    SET v_comm_appr_status = " ";
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_remark = " ";
    SET v_comm_comple_flag = 0;
    SET v_comm_frozen_qty = 0;
    SET v_strike_status = "0";
    SET v_order_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_batch_no = 0;
    SET v_order_dir = 0;
    SET v_order_qty = 0;
    SET v_order_price = 0;
    SET v_price_type = 0;
    SET v_order_status = "0";
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_order_oper_way = " ";
    SET v_update_times = 1;
    SET v_comm_amt = 0;
    SET v_appr_allow_order_flag = 0;
    SET v_is_record_jour = 1;
    SET v_invest_type = 0;
    SET v_order_margin = 0;
    SET v_comm_margin = 0;
    SET v_strike_margin = 0;
    SET v_strike_fee = 0;
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_crncy_type = "CNY";
    SET v_tmp_trade_fee = 0;
    SET v_strike_all_fee = 0;
    SET v_comm_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_change_qty = 0;
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
    SET v_trade_occur_amt = 0;
    SET v_strike_occur_amt = 0;
    SET v_comm_occur_amt = 0;
    SET v_trade_capt_amt_after = 0;
    SET v_posi_capt_amt_after = 0;
    SET v_comm_capt_amt_after = 0;
    SET v_comm_occur_qty = 0;
    SET v_strike_capt_amt = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_tmp_comm_occur_amt = 0;
    SET v_tmp_comm_occur_qty = 0;
    SET v_tmp_comm_frozen_qty = 0;
    SET v_comm_appr_oper_no = 0;
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_trade_occur_qty = 0;
    SET v_exter_comm_flag = 0;
    SET v_pass_status = "0";
    SET v_tmp_comm_margin = 0;
    SET v_wtdraw_qty = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* set @指令日期# = @初始化日期#; */
    set v_comm_date = v_init_date;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @投资类型# = 《投资类型-二级市场交易性金融资产》; */
    set v_invest_type = 1;

    /* set @保证金比例#=0; */
    set v_margin_ratio=0;

    /* set @订单保证金# = 0; */
    set v_order_margin = 0;

    /* set @指令保证金# = @应收保证金#; */
    set v_comm_margin = v_rece_margin;

    /* set @指令金额# =  @指令数量#*@指令实际限价# *@合约乘数#; */
    set v_comm_amt =  v_comm_qty*v_limit_actual_price *v_contrc_unit;

    /* set @成交保证金# = 0; */
    set v_strike_margin = 0;

    /* set @成交费用# =0; */
    set v_strike_fee =0;

    /* set @订单序号# = 0; */
    set v_order_id = 0;

    /* set @多头持仓保证金#=@交易组多头应收保证金#; */
    set v_long_hold_margin=v_exgp_long_rece_margin;

    /* set @空头持仓保证金#=@交易组空头应收保证金#; */
    set v_short_hold_margin=v_exgp_short_rece_margin;

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* set @临时_交易费用# = @交易费用#; */
    set v_tmp_trade_fee = v_trade_fee;

    /* set @交易费用# = 0; */
    set v_trade_fee = 0;

    /* set @成交全部费用# = 0; */
    set v_strike_all_fee = 0;
    #计算指令冻结金额

    /* set @计算方向# = 《计算方向-加上》; */
    set v_calc_dir = 1;

    /* set @指令订单数量# = 0; */
    set v_comm_order_qty = 0;

    /* set @指令撤销数量# = 0; */
    set v_comm_cancel_qty = 0;

    /* set @指令变化数量# = 0; */
    set v_comm_change_qty = 0;

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
            SET v_error_code = "tdfutuT.3.1.999";
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
            SET v_error_code = "tdfutuT.3.1.999";
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
    #交易期货子系统检查，检查指令可用资金、可用持仓等

    /* 调用【原子_交易期货_指令_校验新增指令】*/
    call db_tdfutu.pra_tdfuap_CheckAddComm(
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
        v_lngsht_type,
        v_comm_occur_amt,
        v_exgp_avail_amt,
        v_asac_avail_amt,
        v_comm_qty,
        v_exgp_avail_qty,
        v_asac_avail_qty,
        v_limit_actual_price,
        v_up_limit_price,
        v_down_limit_price,
        v_asac_busi_config_str,
        v_exgp_busi_config_str,
        v_trade_fee,
        v_exch_crncy_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.3.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_校验新增指令出现错误！',v_mysql_message);
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
        SET v_error_code = "tdfutuT.3.1.999";
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
            SET v_error_code = "tdfutuT.3.1.999";
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
            SET v_error_code = "tdfutuT.3.1.999";
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
        SET v_error_code = "tdfutuT.3.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新资产账户交易资金出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;

    #如果自动审批，需做相应检查处理，并获取指令批号

    /* set @订单方向# = @指令方向#; */
    set v_order_dir = v_comm_dir;

    /* if (substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-自动审批》 or   substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-不设置》) and substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》  then */
    if (substring(v_asac_busi_config_str,5,1)=1 or   substring(v_asac_busi_config_str,5,1)=3) and substring(v_asac_busi_config_str,6,1)=1  then
        #获取订单批号

        /* set @编号类型#=《编号类型-订单批号》; */
        set v_record_no_type=18;

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
            SET v_error_code = "tdfutuT.3.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_公用_获取业务记录编号出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @订单批号#=@当前编号#; */
        set v_order_batch_no=v_curr_no;
    end if;

    /* set @指令审批状态#=《指令审批状态-未审批》; */
    set v_comm_appr_status="1";

    /* if substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-不设置》 then */
    if substring(v_asac_busi_config_str,5,1)=3 then

        /* set @指令审批状态#=《指令审批状态-不审批》; */
        set v_comm_appr_status="4";
    end if;

    /* set @指令变化数量# = @指令数量#; */
    set v_comm_change_qty = v_comm_qty;

    /* set @指令保证金# = @指令变动金额#; */
    set v_comm_margin = v_comm_occur_amt;

    /* set @指令冻结数量#=@计算方向# * @指令变化数量#; */
    set v_comm_frozen_qty=v_calc_dir * v_comm_change_qty;
    #新增指令记录

    /* 调用【原子_交易期货_指令_新增指令】*/
    call db_tdfutu.pra_tdfuap_AddCommand(
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
        v_exch_crncy_type,
        v_exch_no,
        v_futu_acco_no,
        v_contrc_code_no,
        v_contrc_code,
        v_contrc_type,
        v_contrc_unit,
        v_margin_ratio,
        v_asset_type,
        v_contrc_dir,
        v_hedge_type,
        v_comm_date,
        v_comm_batch_no,
        v_comm_opor,
        v_comm_executor,
        v_comm_dir,
        v_comm_limit_price,
        v_limit_actual_price,
        v_comm_qty,
        v_comm_amt,
        v_comm_frozen_qty,
        v_rece_margin,
        v_capit_reback_days,
        v_posi_reback_days,
        v_comm_begin_date,
        v_comm_end_date,
        v_comm_begin_time,
        v_comm_end_time,
        v_comm_appr_status,
        v_comm_oper_way,
        v_external_no,
        v_comb_code,
        v_remark_info,
        v_error_code,
        v_error_info,
        v_comm_id,
        v_comm_status,
        v_strike_status,
        v_comm_comple_flag);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.3.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_新增指令出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;

    #计算指令变动金额和数量

    /* set @临时_指令变动金额# = @指令变动金额#; */
    set v_tmp_comm_occur_amt = v_comm_occur_amt;

    /* set @临时_指令变动数量# = @指令变动数量#; */
    set v_tmp_comm_occur_qty = v_comm_occur_qty;

    /* set @临时_指令冻结数量# = @指令冻结数量#; */
    set v_tmp_comm_frozen_qty = v_comm_frozen_qty;

    /* if substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-自动审批》 or @指令审批状态#=《指令审批状态-不审批》 then */
    if substring(v_asac_busi_config_str,5,1)=1 or v_comm_appr_status="4" then

        /* if substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-自动审批》 then */
        if substring(v_asac_busi_config_str,5,1)=1 then
            #审批指令

            /* set @指令审批状态#=《指令审批状态-审批通过》; */
            set v_comm_appr_status="2";

            /* set @指令审批说明#="指令自动审批通过！"; */
            set v_comm_appr_remark="指令自动审批通过！";

            /* set @指令审批操作员序号#=@操作员编号#; */
            set v_comm_appr_oper_no=v_opor_no;
        end if;

         /* set @订单数量#=0; */
         set v_order_qty=0;

         /* set @指令撤销数量#=0; */
         set v_comm_cancel_qty=0;

         /* 调用【原子_交易期货_指令_审批指令】*/
         call db_tdfutu.pra_tdfuap_ApprComm(
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
             v_asset_type,
             v_contrc_dir,
             v_comm_date,
             v_comm_id,
             v_comm_opor,
             v_comm_executor,
             v_comm_batch_no,
             v_comm_appr_oper_no,
             v_comm_appr_oper,
             v_comm_appr_status,
             v_comm_appr_remark,
             v_comm_qty,
             v_comm_dir,
             v_comm_limit_price,
             v_limit_actual_price,
             v_order_qty,
             v_comm_cancel_qty,
             v_comm_status,
             v_comm_begin_date,
             v_comm_end_date,
             v_comm_begin_time,
             v_comm_end_time,
             v_comm_oper_way,
             v_rece_margin,
             v_error_code,
             v_error_info,
             v_comm_occur_amt,
             v_comm_occur_qty,
             v_comm_appr_date,
             v_comm_appr_time);
         if v_error_code = "1" then
             SET v_error_code = "tdfutuT.3.1.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_审批指令出现错误！',v_mysql_message);
             end if;
             ROLLBACK;
             leave label_pro;
         elseif v_error_code <> "0" then
             ROLLBACK;
             leave label_pro;
         end if;


        /* set @临时_指令变动金额# = @临时_指令变动金额#+@指令变动金额#; */
        set v_tmp_comm_occur_amt = v_tmp_comm_occur_amt+v_comm_occur_amt;

        /* set @临时_指令变动数量# = @临时_指令变动数量#+@指令变动数量#; */
        set v_tmp_comm_occur_qty = v_tmp_comm_occur_qty+v_comm_occur_qty;

        /* [获取机器时间][@机器时间#] */
        select date_format(curtime(),'%H%i%s') into v_mach_time;


        /* if substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 and ((@指令结束日期# = @初始化日期# and @指令结束时间# >= @机器时间#) or (@指令结束日期# < @初始化日期#)) then */
        if substring(v_asac_busi_config_str,6,1)=1 and ((v_comm_end_date = v_init_date and v_comm_end_time >= v_mach_time) or (v_comm_end_date < v_init_date)) then
            #设置订单相关字段值

            /* set @外部编号#=0; */
            set v_external_no=0;

            /* set @申报日期# = 0; */
            set v_report_date = 0;

            /* set @申报时间# = 0; */
            set v_report_time = 0;

            /* set @申报编号# = " "; */
            set v_report_no = " ";

            /* set @操作员编号# = @指令执行人#; */
            set v_opor_no = v_comm_executor;

            /* set @订单日期#=@初始化日期#; */
            set v_order_date=v_init_date;

            /* set @价格类型#=《价格类型-限价》; */
            set v_price_type=1;

            /* set @订单方向#=@指令方向#; */
            set v_order_dir=v_comm_dir;

            /* set @订单数量#=@指令数量#; */
            set v_order_qty=v_comm_qty;

            /* set @订单价格#=@指令实际限价#; */
            set v_order_price=v_limit_actual_price;

            /* set @交易变动数量#=@指令数量#; */
            set v_trade_occur_qty=v_comm_qty;

            /* set @指令变化数量# = @指令数量#; */
            set v_comm_change_qty = v_comm_qty;

            /* set @临时_指令变动数量#=0; */
            set v_tmp_comm_occur_qty=0;

            /* set @交易费用# = @临时_交易费用#; */
            set v_trade_fee = v_tmp_trade_fee;

            /* set @审批通过自动下单# = 《审批通过自动下单-是》; */
            set v_appr_allow_order_flag = 1;
            #先反向更新指令

            /* set @计算方向# = 《计算方向-减去》; */
            set v_calc_dir = -1;

            /* set @指令冻结数量#=@计算方向# * @指令变化数量#; */
            set v_comm_frozen_qty=v_calc_dir * v_comm_change_qty;

            /* set @临时_指令冻结数量# = @临时_指令冻结数量# + @指令冻结数量#; */
            set v_tmp_comm_frozen_qty = v_tmp_comm_frozen_qty + v_comm_frozen_qty;

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
                SET v_error_code = "tdfutuT.3.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_下单更新指令出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @备注信息#="指令自动审批后自动执行！"; */
            set v_remark_info="指令自动审批后自动执行！";
            #根据报盘机状态,设置订单状态 如果通道是允许报送状态,则直接将订单状态设为"待报"

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
                SET v_error_code = "tdfutuT.3.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_公用_获取通道状态出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* if @通道状态# = "1" then */
            if v_pass_status = "1" then

                /* set @订单状态# = 《订单状态-待报》; */
                set v_order_status = "a";
            end if;

            /* set @订单操作方式# = 《订单操作方式-审批后自动下单》; */
            set v_order_oper_way = "40";

            /* if @开平方向# = 《开平方向-平仓》 then */
            if v_contrc_dir = 2 then

                /* if @多空类型# = 《多空类型-多头》 then */
                if v_lngsht_type = 1 then

                    /* set @应收保证金#=round(ifnull(@指令变动数量#*@交易组多头应收保证金#/@交易组可用数量#,0),2); */
                    set v_rece_margin=round(ifnull(v_comm_occur_qty*v_exgp_long_rece_margin/v_exgp_avail_qty,0),2);
                else

                    /* set @应收保证金#=round(ifnull(@指令变动数量#*@交易组空头应收保证金#/@交易组可用数量#,0),2); */
                    set v_rece_margin=round(ifnull(v_comm_occur_qty*v_exgp_short_rece_margin/v_exgp_avail_qty,0),2);
                end if;
            end if;

            /* set @临时_指令保证金# = @指令保证金#; */
            set v_tmp_comm_margin = v_comm_margin;

            /* if @开平方向# = 《开平方向-开仓》 then */
            if v_contrc_dir = 1 then

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
                    SET v_error_code = "tdfutuT.3.1.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_锁定获取保证金优惠信息出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @指令保证金# = -1 * @临时_指令保证金#; */
                set v_comm_margin = -1 * v_tmp_comm_margin;

                /* set @订单保证金# = @临时_指令保证金#; */
                set v_order_margin = v_tmp_comm_margin;

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
                    SET v_error_code = "tdfutuT.3.1.999";
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

                /* set @指令变动金额# = -1 * @临时_指令保证金#; */
                set v_comm_occur_amt = -1 * v_tmp_comm_margin;

                /* set @交易变动金额# = @临时_指令保证金#; */
                set v_trade_occur_amt = v_tmp_comm_margin;
              end if;
            else

              /* if @组合编码# <> " " then */
              if v_comb_code <> " " then

                /* set @订单保证金#=-1*@临时_指令保证金#; */
                set v_order_margin=-1*v_tmp_comm_margin;

                /* set @指令保证金# = -1*@临时_指令保证金#; */
                set v_comm_margin = -1*v_tmp_comm_margin;

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
                    SET v_error_code = "tdfutuT.3.1.999";
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
                    SET v_error_code = "tdfutuT.3.1.999";
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

                /* set @交易变动金额#=-1*@交易变动金额#; */
                set v_trade_occur_amt=-1*v_trade_occur_amt;
              else

                /* set @交易变动金额# = @临时_指令保证金#; */
                set v_trade_occur_amt = v_tmp_comm_margin;
              end if;
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
                SET v_error_code = "tdfutuT.3.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新交易组交易资金出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
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

                  /* set @多头订单保证金# = @临时_指令保证金#; */
                  set v_long_order_margin = v_tmp_comm_margin;

                  /* set @多头指令保证金# = -1*@临时_指令保证金#; */
                  set v_long_comm_margin = -1*v_tmp_comm_margin;
                else

                  /* set @多头订单保证金# =-1* @临时_指令保证金#; */
                  set v_long_order_margin =-1* v_tmp_comm_margin;

                  /* set @多头指令保证金# =-1*@临时_指令保证金#; */
                  set v_long_comm_margin =-1*v_tmp_comm_margin;

                  /* set @订单保证金#=-1*@临时_指令保证金#; */
                  set v_order_margin=-1*v_tmp_comm_margin;
                end if;
              else

                /* if @开平方向# = 《开平方向-开仓》 then */
                if v_contrc_dir = 1 then

                  /* set @空头订单保证金# = @临时_指令保证金#; */
                  set v_short_order_margin = v_tmp_comm_margin;

                  /* set @空头指令保证金# = -1*@临时_指令保证金#; */
                  set v_short_comm_margin = -1*v_tmp_comm_margin;
                else

                  /* set @空头订单保证金# =-1* @临时_指令保证金#; */
                  set v_short_order_margin =-1* v_tmp_comm_margin;

                  /* set @空头指令保证金# = -1*@临时_指令保证金#; */
                  set v_short_comm_margin = -1*v_tmp_comm_margin;

                  /* set @订单保证金#=-1*@临时_指令保证金#; */
                  set v_order_margin=-1*v_tmp_comm_margin;
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
                  SET v_error_code = "tdfutuT.3.1.999";
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
                  SET v_error_code = "tdfutuT.3.1.999";
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
                SET v_error_code = "tdfutuT.3.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新资产账户交易资金出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


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
                SET v_error_code = "tdfutuT.3.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_新增订单出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* if @订单批号# > 0  then */
            if v_order_batch_no > 0  then

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
                   SET v_error_code = "tdfutuT.3.1.999";
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
        end if;
    end if;

    /* set @指令变动数量# = @临时_指令变动数量#; */
    set v_comm_occur_qty = v_tmp_comm_occur_qty;

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
        SET v_error_code = "tdfutuT.3.1.999";
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


    /* set @指令冻结数量# = @临时_指令冻结数量#; */
    set v_comm_frozen_qty = v_tmp_comm_frozen_qty;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_id = v_comm_id;
    SET p_comm_date = v_comm_date;
    SET p_comm_time = v_comm_time;
    SET p_comm_status = v_comm_status;
    SET p_comm_appr_status = v_comm_appr_status;
    SET p_comm_comple_date = v_comm_comple_date;
    SET p_comm_comple_time = v_comm_comple_time;
    SET p_comm_appr_date = v_comm_appr_date;
    SET p_comm_appr_time = v_comm_appr_time;
    SET p_comm_appr_remark = v_comm_appr_remark;
    SET p_comm_comple_flag = v_comm_comple_flag;
    SET p_comm_frozen_qty = v_comm_frozen_qty;
    SET p_strike_status = v_strike_status;
    SET p_order_id = v_order_id;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_dir = v_order_dir;
    SET p_order_qty = v_order_qty;
    SET p_order_price = v_order_price;
    SET p_price_type = v_price_type;
    SET p_order_status = v_order_status;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_order_oper_way = v_order_oper_way;
    SET p_update_times = v_update_times;
    SET p_comm_amt = v_comm_amt;
    SET p_appr_allow_order_flag = v_appr_allow_order_flag;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_指令_撤销指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_CancelComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_CancelComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_comm_id bigint,
    IN p_cancel_info varchar(255),
    IN p_is_withdraw int,
    IN p_exgp_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    IN p_exgp_long_rece_margin decimal(18,4),
    IN p_exgp_short_rece_margin decimal(18,4),
    IN p_asac_long_rece_margin decimal(18,4),
    IN p_asac_short_rece_margin decimal(18,4),
    IN p_lngsht_type int,
    IN p_pre_settle_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_comm_date int,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_order_id_str varchar(2048),
    OUT p_wtdraw_id_str varchar(2048)
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
    declare v_comm_id bigint;
    declare v_cancel_info varchar(255);
    declare v_is_withdraw int;
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_exgp_long_rece_margin decimal(18,4);
    declare v_exgp_short_rece_margin decimal(18,4);
    declare v_asac_long_rece_margin decimal(18,4);
    declare v_asac_short_rece_margin decimal(18,4);
    declare v_lngsht_type int;
    declare v_pre_settle_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_order_id_str varchar(2048);
    declare v_wtdraw_id_str varchar(2048);
    declare v_is_record_jour int;
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_trade_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_asset_type int;
    declare v_invest_type int;
    declare v_comm_limit_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_limit_actual_price decimal(16,9);
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_comm_dir int;
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comb_code varchar(6);
    declare v_rece_margin decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_qty decimal(18,2);
    declare v_order_dir int;
    declare v_calc_dir int;
    declare v_comm_margin decimal(18,4);
    declare v_order_margin decimal(18,4);
    declare v_strike_margin decimal(18,4);
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
    declare v_trade_occur_amt decimal(18,4);
    declare v_strike_occur_amt decimal(18,4);
    declare v_comm_occur_amt decimal(18,4);
    declare v_trade_capt_amt_after decimal(18,4);
    declare v_posi_capt_amt_after decimal(18,4);
    declare v_comm_capt_amt_after decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_trade_occur_qty decimal(18,2);
    declare v_out_acco varchar(32);
    declare v_pass_no int;
    declare v_futu_acco varchar(16);
    declare v_crncy_type varchar(3);
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_batch_no int;
    declare v_order_price decimal(16,9);
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_margin_ratio decimal(18,12);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_order_oper_way varchar(2);
    declare v_update_times int;
    declare v_order_id bigint;
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_remark varchar(255);
    declare v_frozen_amt decimal(18,4);
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_id bigint;
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
    SET v_comm_id = p_comm_id;
    SET v_cancel_info = p_cancel_info;
    SET v_is_withdraw = p_is_withdraw;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_exgp_long_rece_margin = p_exgp_long_rece_margin;
    SET v_exgp_short_rece_margin = p_exgp_short_rece_margin;
    SET v_asac_long_rece_margin = p_asac_long_rece_margin;
    SET v_asac_short_rece_margin = p_asac_short_rece_margin;
    SET v_lngsht_type = p_lngsht_type;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_order_id_str = " ";
    SET v_wtdraw_id_str = " ";
    SET v_is_record_jour = 1;
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_strike_fee = 0;
    SET v_trade_fee = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_asset_type = 0;
    SET v_invest_type = 0;
    SET v_comm_limit_price = 0;
    SET v_comm_status = "0";
    SET v_limit_actual_price = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_comm_dir = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comb_code = " ";
    SET v_rece_margin = 0;
    SET v_order_qty = 0;
    SET v_comm_qty = 0;
    SET v_order_dir = 0;
    SET v_calc_dir = 1;
    SET v_comm_margin = 0;
    SET v_order_margin = 0;
    SET v_strike_margin = 0;
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
    SET v_trade_occur_amt = 0;
    SET v_strike_occur_amt = 0;
    SET v_comm_occur_amt = 0;
    SET v_trade_capt_amt_after = 0;
    SET v_posi_capt_amt_after = 0;
    SET v_comm_capt_amt_after = 0;
    SET v_strike_capt_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_trade_occur_qty = 0;
    SET v_out_acco = " ";
    SET v_pass_no = 0;
    SET v_futu_acco = " ";
    SET v_crncy_type = "CNY";
    SET v_external_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_batch_no = 0;
    SET v_order_price = 0;
    SET v_order_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_strike_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_amt = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_strike_all_fee = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_margin_ratio = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_order_oper_way = " ";
    SET v_update_times = 1;
    SET v_order_id = 0;
    SET v_wtdraw_batch_no = 0;
    SET v_wtdraw_remark = " ";
    SET v_frozen_amt = 0;
    SET v_wtdraw_status = "0";
    SET v_wtdraw_id = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @多头持仓保证金#=@交易组多头应收保证金#; */
    set v_long_hold_margin=v_exgp_long_rece_margin;

    /* set @空头持仓保证金#=@交易组空头应收保证金#; */
    set v_short_hold_margin=v_exgp_short_rece_margin;

    /* set @成交费用# = 0; */
    set v_strike_fee = 0;

    /* set @交易费用# = 0; */
    set v_trade_fee = 0;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易期货_指令_撤销指令】*/
        call db_tdfutu.pra_tdfuap_CancelComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_comm_id,
            v_cancel_info,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_crncy_type,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_trade_code_no,
            v_contrc_code,
            v_contrc_type,
            v_contrc_unit,
            v_asset_type,
            v_invest_type,
            v_comm_limit_price,
            v_comm_status,
            v_limit_actual_price,
            v_contrc_dir,
            v_hedge_type,
            v_comm_dir,
            v_comm_cancel_qty,
            v_comm_date,
            v_comm_batch_no,
            v_comm_executor,
            v_comb_code,
            v_rece_margin,
            v_order_qty,
            v_comm_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.3.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_撤销指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @订单方向#=@指令方向#; */
        set v_order_dir=v_comm_dir;

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
            SET v_error_code = "tdfutuT.3.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_获取多空类型出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @计算方向# = 《计算方向-减去》; */
        set v_calc_dir = -1;

        /* set @指令保证金# = @计算方向# *@指令撤销数量#/@指令数量# *@应收保证金#; */
        set v_comm_margin = v_calc_dir *v_comm_cancel_qty/v_comm_qty *v_rece_margin;

        /* if @指令撤销数量#>0 then */
        if v_comm_cancel_qty>0 then

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
                    SET v_error_code = "tdfutuT.3.2.999";
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
                    SET v_error_code = "tdfutuT.3.2.999";
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
                SET v_error_code = "tdfutuT.3.2.999";
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
                    SET v_error_code = "tdfutuT.3.2.999";
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
                    SET v_error_code = "tdfutuT.3.2.999";
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
                SET v_error_code = "tdfutuT.3.2.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新资产账户交易资金出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #计算指令变动金额和数量

            /* set @指令变动数量# = @指令撤销数量#* @计算方向#; */
            set v_comm_occur_qty = v_comm_cancel_qty* v_calc_dir;

            /* set @交易变动数量# = 0; */
            set v_trade_occur_qty = 0;

            /* set @成交费用# = 0; */
            set v_strike_fee = 0;

            /* set @交易费用# = 0; */
            set v_trade_fee = 0;

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
                SET v_error_code = "tdfutuT.3.2.999";
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

    /* [事务结束] */
    COMMIT;


    /* set @订单序号串# = ""; */
    set v_order_id_str = "";

    /* set @撤单序号串# = ""; */
    set v_wtdraw_id_str = "";

    /* if @是否撤单#=《是否撤单-是》 then */
    if v_is_withdraw=1 then
        #采用循环更新获取订单的方式，避免加锁时间长和并发问题

        /* set @记录序号# = 0; */
        set v_row_id = 0;
        loop_label:loop

        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_交易期货_交易_锁定获取指令订单】*/
            call db_tdfutu.pra_tdfutd_LockGetCommOrder(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_comm_id,
                v_error_code,
                v_error_info,
                v_row_id,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_out_acco,
                v_exch_no,
                v_pass_no,
                v_futu_acco,
                v_futu_acco_no,
                v_contrc_code_no,
                v_crncy_type,
                v_asset_type,
                v_contrc_type,
                v_contrc_unit,
                v_external_no,
                v_report_date,
                v_report_time,
                v_report_no,
                v_order_date,
                v_order_time,
                v_order_dir,
                v_order_batch_no,
                v_contrc_dir,
                v_hedge_type,
                v_order_price,
                v_order_qty,
                v_order_status,
                v_wtdraw_qty,
                v_strike_qty,
                v_strike_price,
                v_strike_amt,
                v_trade_fee,
                v_trade_commis,
                v_other_commis,
                v_strike_commis,
                v_strike_other_commis,
                v_strike_all_fee,
                v_report_fee,
                v_wtdraw_fee,
                v_rece_margin,
                v_trade_occur_amt,
                v_comb_code,
                v_margin_ratio,
                v_rsp_info,
                v_compli_trig_id,
                v_order_oper_way,
                v_update_times);

            /* if @错误编码#="0" then */
            if v_error_code="0" then

                /* set @订单序号# = @记录序号#; */
                set v_order_id = v_row_id;

                /* set @撤单批号# = 0; */
                set v_wtdraw_batch_no = 0;

                /* set @撤单说明# = "指令撤销撤销指令订单！"; */
                set v_wtdraw_remark = "指令撤销撤销指令订单！";

                /* 调用【原子_交易期货_指令_撤销指令订单】*/
                call db_tdfutu.pra_tdfuap_CancelCommOrder(
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
                    v_contrc_type,
                    v_contrc_unit,
                    v_hedge_type,
                    v_external_no,
                    v_pre_settle_price,
                    v_order_date,
                    v_order_id,
                    v_order_qty,
                    v_order_dir,
                    v_trade_fee,
                    v_order_status,
                    v_report_date,
                    v_report_time,
                    v_report_no,
                    v_wtdraw_batch_no,
                    v_wtdraw_remark,
                    v_strike_qty,
                    v_strike_amt,
                    v_trade_commis,
                    v_other_commis,
                    v_report_fee,
                    v_wtdraw_fee,
                    v_rece_margin,
                    v_comm_id,
                    v_comm_cancel_qty,
                    v_limit_actual_price,
                    v_comm_status,
                    v_contrc_dir,
                    v_exgp_long_rece_margin,
                    v_exgp_short_rece_margin,
                    v_asac_long_rece_margin,
                    v_asac_short_rece_margin,
                    v_lngsht_type,
                    v_comb_code,
                    v_error_code,
                    v_error_info,
                    v_frozen_amt,
                    v_wtdraw_status,
                    v_wtdraw_qty,
                    v_wtdraw_id);
                if v_error_code = "1" then
                    SET v_error_code = "tdfutuT.3.2.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_撤销指令订单出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @订单序号串# = concat(@订单序号串#,@订单序号#,";"); */
                set v_order_id_str = concat(v_order_id_str,v_order_id,";");

                /* if @撤单序号# > 0 and @撤单状态# <> 《撤单状态-成功》 then */
                if v_wtdraw_id > 0 and v_wtdraw_status <> "3" then

                  /* set @撤单序号串# = concat(@撤单序号串#,@撤单序号#,";"); */
                  set v_wtdraw_id_str = concat(v_wtdraw_id_str,v_wtdraw_id,";");
               end if;
            else

                /* set @错误编码#="0"; */
                set v_error_code="0";

                /* set @错误信息#=' '; */
                set v_error_info=' ';
                ROLLBACK;
                leave loop_label;
            end if;
            #处理汇总订单

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
                        SET v_error_code = "tdfutuT.3.2.999";
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

        /* [事务结束] */
        COMMIT;

        end loop;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_comm_date = v_comm_date;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_order_id_str = v_order_id_str;
    SET p_wtdraw_id_str = v_wtdraw_id_str;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_指令_获取指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_GetComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_GetComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_code varchar(6),
    OUT p_contrc_type int,
    OUT p_asset_type int,
    OUT p_contrc_dir int,
    OUT p_hedge_type int,
    OUT p_comm_date int,
    OUT p_comm_time int,
    OUT p_comm_batch_no int,
    OUT p_comm_opor int,
    OUT p_comm_executor int,
    OUT p_comm_dir int,
    OUT p_comm_limit_price decimal(16,9),
    OUT p_limit_actual_price decimal(16,9),
    OUT p_comm_qty decimal(18,2),
    OUT p_comm_amt decimal(18,4),
    OUT p_order_qty decimal(18,2),
    OUT p_comm_cancel_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_comm_frozen_amt decimal(18,4),
    OUT p_comm_frozen_qty decimal(18,2),
    OUT p_rece_margin decimal(18,4),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_strike_status varchar(2),
    OUT p_comm_status varchar(2),
    OUT p_comm_begin_date int,
    OUT p_comm_end_date int,
    OUT p_comm_begin_time int,
    OUT p_comm_end_time int,
    OUT p_comm_comple_date int,
    OUT p_comm_comple_time int,
    OUT p_comm_appr_date int,
    OUT p_comm_appr_time int,
    OUT p_comm_appr_status varchar(2),
    OUT p_comm_appr_oper_no int,
    OUT p_comm_appr_oper int,
    OUT p_comm_appr_remark varchar(255),
    OUT p_external_no bigint,
    OUT p_comb_code varchar(6),
    OUT p_comm_oper_way varchar(2),
    OUT p_remark_info varchar(255),
    OUT p_comm_comple_flag int,
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
    declare v_comm_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
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
    declare v_rece_margin decimal(18,4);
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
    declare v_comm_comple_flag int;
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
    SET v_comm_id = p_comm_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_type = 0;
    SET v_asset_type = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_comm_executor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_rece_margin = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_strike_status = "0";
    SET v_comm_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_status = " ";
    SET v_comm_appr_oper_no = 0;
    SET v_comm_appr_oper = 0;
    SET v_comm_appr_remark = " ";
    SET v_external_no = 0;
    SET v_comb_code = " ";
    SET v_comm_oper_way = " ";
    SET v_remark_info = " ";
    SET v_comm_comple_flag = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易期货_指令_获取指令】*/
    call db_tdfutu.pra_tdfuap_GetComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_id,
        v_error_code,
        v_error_info,
        v_row_id,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_crncy_type,
        v_exch_no,
        v_futu_acco_no,
        v_contrc_code_no,
        v_contrc_code,
        v_contrc_type,
        v_asset_type,
        v_contrc_dir,
        v_hedge_type,
        v_comm_date,
        v_comm_time,
        v_comm_batch_no,
        v_comm_opor,
        v_comm_executor,
        v_comm_dir,
        v_comm_limit_price,
        v_limit_actual_price,
        v_comm_qty,
        v_comm_amt,
        v_order_qty,
        v_comm_cancel_qty,
        v_strike_amt,
        v_strike_qty,
        v_comm_frozen_amt,
        v_comm_frozen_qty,
        v_rece_margin,
        v_capit_reback_days,
        v_posi_reback_days,
        v_strike_status,
        v_comm_status,
        v_comm_begin_date,
        v_comm_end_date,
        v_comm_begin_time,
        v_comm_end_time,
        v_comm_comple_date,
        v_comm_comple_time,
        v_comm_appr_date,
        v_comm_appr_time,
        v_comm_appr_status,
        v_comm_appr_oper_no,
        v_comm_appr_oper,
        v_comm_appr_remark,
        v_external_no,
        v_comb_code,
        v_comm_oper_way,
        v_remark_info,
        v_comm_comple_flag,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.3.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_获取指令出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_code = v_contrc_code;
    SET p_contrc_type = v_contrc_type;
    SET p_asset_type = v_asset_type;
    SET p_contrc_dir = v_contrc_dir;
    SET p_hedge_type = v_hedge_type;
    SET p_comm_date = v_comm_date;
    SET p_comm_time = v_comm_time;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_opor = v_comm_opor;
    SET p_comm_executor = v_comm_executor;
    SET p_comm_dir = v_comm_dir;
    SET p_comm_limit_price = v_comm_limit_price;
    SET p_limit_actual_price = v_limit_actual_price;
    SET p_comm_qty = v_comm_qty;
    SET p_comm_amt = v_comm_amt;
    SET p_order_qty = v_order_qty;
    SET p_comm_cancel_qty = v_comm_cancel_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_comm_frozen_amt = v_comm_frozen_amt;
    SET p_comm_frozen_qty = v_comm_frozen_qty;
    SET p_rece_margin = v_rece_margin;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_strike_status = v_strike_status;
    SET p_comm_status = v_comm_status;
    SET p_comm_begin_date = v_comm_begin_date;
    SET p_comm_end_date = v_comm_end_date;
    SET p_comm_begin_time = v_comm_begin_time;
    SET p_comm_end_time = v_comm_end_time;
    SET p_comm_comple_date = v_comm_comple_date;
    SET p_comm_comple_time = v_comm_comple_time;
    SET p_comm_appr_date = v_comm_appr_date;
    SET p_comm_appr_time = v_comm_appr_time;
    SET p_comm_appr_status = v_comm_appr_status;
    SET p_comm_appr_oper_no = v_comm_appr_oper_no;
    SET p_comm_appr_oper = v_comm_appr_oper;
    SET p_comm_appr_remark = v_comm_appr_remark;
    SET p_external_no = v_external_no;
    SET p_comb_code = v_comb_code;
    SET p_comm_oper_way = v_comm_oper_way;
    SET p_remark_info = v_remark_info;
    SET p_comm_comple_flag = v_comm_comple_flag;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_指令_获取指令汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_GetSumComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_GetSumComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_date int,
    IN p_comm_batch_no int,
    IN p_co_no int,
    IN p_comm_executor int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_code varchar(6),
    OUT p_contrc_type int,
    OUT p_asset_type int,
    OUT p_contrc_dir int,
    OUT p_hedge_type int,
    OUT p_comm_time int,
    OUT p_comm_opor int,
    OUT p_comm_dir int,
    OUT p_comm_limit_price decimal(16,9),
    OUT p_limit_actual_price decimal(16,9),
    OUT p_comm_qty decimal(18,2),
    OUT p_comm_amt decimal(18,4),
    OUT p_order_qty decimal(18,2),
    OUT p_comm_cancel_qty decimal(18,2),
    OUT p_comm_await_cancel_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_status varchar(2),
    OUT p_comm_sum_status varchar(2),
    OUT p_comm_begin_date int,
    OUT p_comm_end_date int,
    OUT p_comm_begin_time int,
    OUT p_comm_end_time int,
    OUT p_comm_comple_date int,
    OUT p_comm_comple_time int,
    OUT p_max_comm_comple_date int,
    OUT p_max_comm_comple_time int,
    OUT p_comm_appr_date int,
    OUT p_comm_appr_time int,
    OUT p_comm_appr_qty decimal(18,2),
    OUT p_comm_sum_approve_status varchar(2),
    OUT p_buy_order_qty decimal(18,2),
    OUT p_sell_order_qty decimal(18,2),
    OUT p_buy_comm_qty decimal(18,2),
    OUT p_sell_comm_qty decimal(18,2),
    OUT p_buy_strike_qty decimal(18,2),
    OUT p_sell_strike_qty decimal(18,2),
    OUT p_buy_strike_amt decimal(18,4),
    OUT p_sell_strike_amt decimal(18,4),
    OUT p_buy_comm_amt decimal(18,4),
    OUT p_sell_comm_amt decimal(18,4),
    OUT p_rece_margin decimal(18,4),
    OUT p_comm_oper_way varchar(2),
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
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_co_no int;
    declare v_comm_executor int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_init_date int;
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
    declare v_comm_time int;
    declare v_comm_opor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_await_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_status varchar(2);
    declare v_comm_sum_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_max_comm_comple_date int;
    declare v_max_comm_comple_time int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_appr_qty decimal(18,2);
    declare v_comm_sum_approve_status varchar(2);
    declare v_buy_order_qty decimal(18,2);
    declare v_sell_order_qty decimal(18,2);
    declare v_buy_comm_qty decimal(18,2);
    declare v_sell_comm_qty decimal(18,2);
    declare v_buy_strike_qty decimal(18,2);
    declare v_sell_strike_qty decimal(18,2);
    declare v_buy_strike_amt decimal(18,4);
    declare v_sell_strike_amt decimal(18,4);
    declare v_buy_comm_amt decimal(18,4);
    declare v_sell_comm_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comm_oper_way varchar(2);
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
    SET v_comm_date = p_comm_date;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_co_no = p_co_no;
    SET v_comm_executor = p_comm_executor;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_type = 0;
    SET v_asset_type = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_opor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_await_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_status = "0";
    SET v_comm_sum_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_max_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_max_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_qty = 0;
    SET v_comm_sum_approve_status = "0";
    SET v_buy_order_qty = 0;
    SET v_sell_order_qty = 0;
    SET v_buy_comm_qty = 0;
    SET v_sell_comm_qty = 0;
    SET v_buy_strike_qty = 0;
    SET v_sell_strike_qty = 0;
    SET v_buy_strike_amt = 0;
    SET v_sell_strike_amt = 0;
    SET v_buy_comm_amt = 0;
    SET v_sell_comm_amt = 0;
    SET v_rece_margin = 0;
    SET v_comm_oper_way = " ";
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易期货_指令_获取指令汇总】*/
    call db_tdfutu.pra_tdfuap_GetSumComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_date,
        v_comm_batch_no,
        v_co_no,
        v_comm_executor,
        v_error_code,
        v_error_info,
        v_row_id,
        v_init_date,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_crncy_type,
        v_exch_no,
        v_futu_acco_no,
        v_contrc_code_no,
        v_contrc_code,
        v_contrc_type,
        v_asset_type,
        v_contrc_dir,
        v_hedge_type,
        v_comm_time,
        v_comm_opor,
        v_comm_dir,
        v_comm_limit_price,
        v_limit_actual_price,
        v_comm_qty,
        v_comm_amt,
        v_order_qty,
        v_comm_cancel_qty,
        v_comm_await_cancel_qty,
        v_strike_amt,
        v_strike_qty,
        v_strike_status,
        v_comm_sum_status,
        v_comm_begin_date,
        v_comm_end_date,
        v_comm_begin_time,
        v_comm_end_time,
        v_comm_comple_date,
        v_comm_comple_time,
        v_max_comm_comple_date,
        v_max_comm_comple_time,
        v_comm_appr_date,
        v_comm_appr_time,
        v_comm_appr_qty,
        v_comm_sum_approve_status,
        v_buy_order_qty,
        v_sell_order_qty,
        v_buy_comm_qty,
        v_sell_comm_qty,
        v_buy_strike_qty,
        v_sell_strike_qty,
        v_buy_strike_amt,
        v_sell_strike_amt,
        v_buy_comm_amt,
        v_sell_comm_amt,
        v_rece_margin,
        v_comm_oper_way,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.3.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_获取指令汇总出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_code = v_contrc_code;
    SET p_contrc_type = v_contrc_type;
    SET p_asset_type = v_asset_type;
    SET p_contrc_dir = v_contrc_dir;
    SET p_hedge_type = v_hedge_type;
    SET p_comm_time = v_comm_time;
    SET p_comm_opor = v_comm_opor;
    SET p_comm_dir = v_comm_dir;
    SET p_comm_limit_price = v_comm_limit_price;
    SET p_limit_actual_price = v_limit_actual_price;
    SET p_comm_qty = v_comm_qty;
    SET p_comm_amt = v_comm_amt;
    SET p_order_qty = v_order_qty;
    SET p_comm_cancel_qty = v_comm_cancel_qty;
    SET p_comm_await_cancel_qty = v_comm_await_cancel_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_status = v_strike_status;
    SET p_comm_sum_status = v_comm_sum_status;
    SET p_comm_begin_date = v_comm_begin_date;
    SET p_comm_end_date = v_comm_end_date;
    SET p_comm_begin_time = v_comm_begin_time;
    SET p_comm_end_time = v_comm_end_time;
    SET p_comm_comple_date = v_comm_comple_date;
    SET p_comm_comple_time = v_comm_comple_time;
    SET p_max_comm_comple_date = v_max_comm_comple_date;
    SET p_max_comm_comple_time = v_max_comm_comple_time;
    SET p_comm_appr_date = v_comm_appr_date;
    SET p_comm_appr_time = v_comm_appr_time;
    SET p_comm_appr_qty = v_comm_appr_qty;
    SET p_comm_sum_approve_status = v_comm_sum_approve_status;
    SET p_buy_order_qty = v_buy_order_qty;
    SET p_sell_order_qty = v_sell_order_qty;
    SET p_buy_comm_qty = v_buy_comm_qty;
    SET p_sell_comm_qty = v_sell_comm_qty;
    SET p_buy_strike_qty = v_buy_strike_qty;
    SET p_sell_strike_qty = v_sell_strike_qty;
    SET p_buy_strike_amt = v_buy_strike_amt;
    SET p_sell_strike_amt = v_sell_strike_amt;
    SET p_buy_comm_amt = v_buy_comm_amt;
    SET p_sell_comm_amt = v_sell_comm_amt;
    SET p_rece_margin = v_rece_margin;
    SET p_comm_oper_way = v_comm_oper_way;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_指令_审批指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_ApprComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_ApprComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_contrc_unit int,
    IN p_lngsht_type int,
    IN p_pre_settle_price decimal(16,9),
    IN p_futu_acco varchar(16),
    IN p_rece_margin decimal(18,4),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    IN p_exgp_long_rece_margin decimal(18,4),
    IN p_exgp_short_rece_margin decimal(18,4),
    IN p_asac_long_rece_margin decimal(18,4),
    IN p_asac_short_rece_margin decimal(18,4),
    IN p_asset_type int,
    IN p_comm_id bigint,
    IN p_comm_date int,
    IN p_comm_appr_oper int,
    IN p_comm_appr_status varchar(2),
    IN p_comm_appr_remark varchar(255),
    IN p_asac_busi_config_str varchar(64),
    IN p_report_fee decimal(18,4),
    IN p_wtdraw_fee decimal(18,4),
    IN p_trade_fee decimal(18,4),
    IN p_all_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_comb_code varchar(6),
    IN p_compli_trig_id bigint,
    IN p_margin_ratio decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_order_id bigint,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_type int,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_batch_no int,
    OUT p_order_dir int,
    OUT p_external_no bigint,
    OUT p_price_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_order_oper_way varchar(2),
    OUT p_update_times int,
    OUT p_appr_allow_order_flag int
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_contrc_unit int;
    declare v_lngsht_type int;
    declare v_pre_settle_price decimal(16,9);
    declare v_futu_acco varchar(16);
    declare v_rece_margin decimal(18,4);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_exgp_long_rece_margin decimal(18,4);
    declare v_exgp_short_rece_margin decimal(18,4);
    declare v_asac_long_rece_margin decimal(18,4);
    declare v_asac_short_rece_margin decimal(18,4);
    declare v_asset_type int;
    declare v_comm_id bigint;
    declare v_comm_date int;
    declare v_comm_appr_oper int;
    declare v_comm_appr_status varchar(2);
    declare v_comm_appr_remark varchar(255);
    declare v_asac_busi_config_str varchar(64);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_compli_trig_id bigint;
    declare v_margin_ratio decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_order_id bigint;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_external_no bigint;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_order_oper_way varchar(2);
    declare v_update_times int;
    declare v_appr_allow_order_flag int;
    declare v_tmp_comm_appr_status varchar(2);
    declare v_tmp_comm_appr_oper int;
    declare v_tmp_comm_appr_remark varchar(255);
    declare v_is_record_jour int;
    declare v_invest_type int;
    declare v_comm_margin decimal(18,4);
    declare v_order_margin decimal(18,4);
    declare v_strike_margin decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_strike_all_fee decimal(18,4);
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_row_id bigint;
    declare v_exch_crncy_type varchar(3);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_comm_time int;
    declare v_comm_opor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
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
    declare v_comm_appr_oper_no int;
    declare v_comm_oper_way varchar(2);
    declare v_remark_info varchar(255);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
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
    declare v_trade_capt_amt_after decimal(18,4);
    declare v_posi_capt_amt_after decimal(18,4);
    declare v_comm_capt_amt_after decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_calc_dir int;
    declare v_comm_change_qty decimal(18,2);
    declare v_exter_comm_flag int;
    declare v_pass_status varchar(2);
    declare v_tmp_comm_margin decimal(18,4);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_contrc_unit = p_contrc_unit;
    SET v_lngsht_type = p_lngsht_type;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_futu_acco = p_futu_acco;
    SET v_rece_margin = p_rece_margin;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_exgp_long_rece_margin = p_exgp_long_rece_margin;
    SET v_exgp_short_rece_margin = p_exgp_short_rece_margin;
    SET v_asac_long_rece_margin = p_asac_long_rece_margin;
    SET v_asac_short_rece_margin = p_asac_short_rece_margin;
    SET v_asset_type = p_asset_type;
    SET v_comm_id = p_comm_id;
    SET v_comm_date = p_comm_date;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_comm_appr_status = p_comm_appr_status;
    SET v_comm_appr_remark = p_comm_appr_remark;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_report_fee = p_report_fee;
    SET v_wtdraw_fee = p_wtdraw_fee;
    SET v_trade_fee = p_trade_fee;
    SET v_all_fee = p_all_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_comb_code = p_comb_code;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_margin_ratio = p_margin_ratio;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_order_id = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_type = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_batch_no = 0;
    SET v_order_dir = 0;
    SET v_external_no = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_status = "0";
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_order_oper_way = " ";
    SET v_update_times = 1;
    SET v_appr_allow_order_flag = 0;
    SET v_tmp_comm_appr_status = " ";
    SET v_tmp_comm_appr_oper = 0;
    SET v_tmp_comm_appr_remark = " ";
    SET v_is_record_jour = 1;
    SET v_invest_type = 0;
    SET v_comm_margin = 0;
    SET v_order_margin = 0;
    SET v_strike_margin = 0;
    SET v_strike_fee = 0;
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_crncy_type = "CNY";
    SET v_strike_all_fee = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_row_id = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_type = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_opor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_strike_status = "0";
    SET v_comm_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_oper_no = 0;
    SET v_comm_oper_way = " ";
    SET v_remark_info = " ";
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
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
    SET v_trade_capt_amt_after = 0;
    SET v_posi_capt_amt_after = 0;
    SET v_comm_capt_amt_after = 0;
    SET v_strike_capt_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_calc_dir = 1;
    SET v_comm_change_qty = 0;
    SET v_exter_comm_flag = 0;
    SET v_pass_status = "0";
    SET v_tmp_comm_margin = 0;
    SET v_wtdraw_qty = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @临时_指令审批状态#=@指令审批状态#; */
    set v_tmp_comm_appr_status=v_comm_appr_status;

    /* set @临时_指令审批操作员#=@操作员编号#; */
    set v_tmp_comm_appr_oper=v_opor_no;

    /* set @临时_指令审批说明#=@指令审批说明#; */
    set v_tmp_comm_appr_remark=v_comm_appr_remark;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @投资类型# = 《投资类型-二级市场交易性金融资产》; */
    set v_invest_type = 1;

    /* set @指令保证金# = @应收保证金#; */
    set v_comm_margin = v_rece_margin;

    /* set @订单保证金# = 0; */
    set v_order_margin = 0;

    /* set @成交保证金# = 0; */
    set v_strike_margin = 0;

    /* set @成交费用# =0; */
    set v_strike_fee =0;

    /* set @订单序号# = 0; */
    set v_order_id = 0;

    /* set @多头持仓保证金#=@交易组多头应收保证金#; */
    set v_long_hold_margin=v_exgp_long_rece_margin;

    /* set @空头持仓保证金#=@交易组空头应收保证金#; */
    set v_short_hold_margin=v_exgp_short_rece_margin;

    /* set @本币币种# = "CNY"; */
    set v_crncy_type = "CNY";

    /* set @成交全部费用# = 0; */
    set v_strike_all_fee = 0;

    /* if substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 then */
    if substring(v_asac_busi_config_str,6,1)=1 then
        #获取订单批号

        /* set @编号类型#=《编号类型-订单批号》; */
        set v_record_no_type=18;

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
                SET v_error_code = "tdfutuT.3.5.999";
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


        /* set @订单批号#=@当前编号#; */
        set v_order_batch_no=v_curr_no;
    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易期货_指令_锁定获取指令】*/
        call db_tdfutu.pra_tdfuap_LockGetComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_comm_id,
            v_error_code,
            v_error_info,
            v_row_id,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_crncy_type,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_code,
            v_contrc_type,
            v_asset_type,
            v_contrc_dir,
            v_hedge_type,
            v_comm_date,
            v_comm_time,
            v_comm_batch_no,
            v_comm_opor,
            v_comm_executor,
            v_comm_dir,
            v_comm_limit_price,
            v_limit_actual_price,
            v_comm_qty,
            v_comm_amt,
            v_order_qty,
            v_comm_cancel_qty,
            v_strike_amt,
            v_strike_qty,
            v_comm_frozen_amt,
            v_comm_frozen_qty,
            v_capit_reback_days,
            v_posi_reback_days,
            v_strike_status,
            v_comm_status,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_comple_date,
            v_comm_comple_time,
            v_comm_appr_date,
            v_comm_appr_time,
            v_comm_appr_status,
            v_comm_appr_oper_no,
            v_comm_appr_oper,
            v_comm_appr_remark,
            v_external_no,
            v_comb_code,
            v_comm_oper_way,
            v_remark_info,
            v_update_times,
            v_rece_margin);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.3.5.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_锁定获取指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* [检查报错返回][@指令下达人#=@操作员编号#][726][@指令下达人#,@操作员编号#] */
        if v_comm_opor=v_opor_no then
            ROLLBACK;
            SET v_error_code = "tdfutuT.3.5.726";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令下达人=",v_comm_opor,",","操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令下达人=",v_comm_opor,",","操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@指令审批状态#=《指令审批状态-不审批》 ][727][@指令审批状态#] */
        if v_comm_appr_status="4"  then
            ROLLBACK;
            SET v_error_code = "tdfutuT.3.5.727";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令审批状态=",v_comm_appr_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令审批状态=",v_comm_appr_status);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@指令审批状态#=《指令审批状态-审批通过》 or @指令审批状态#=《指令审批状态-审批拒绝》 ][728][@指令审批状态#] */
        if v_comm_appr_status="2" or v_comm_appr_status="3"  then
            ROLLBACK;
            SET v_error_code = "tdfutuT.3.5.728";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令审批状态=",v_comm_appr_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令审批状态=",v_comm_appr_status);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@指令状态# <>《指令状态-未执行》 ][763][@指令状态#] */
        if v_comm_status <>"1"  then
            ROLLBACK;
            SET v_error_code = "tdfutuT.3.5.763";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令状态=",v_comm_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令状态=",v_comm_status);
            end if;
            leave label_pro;
        end if;


        /* set @指令审批状态#=@临时_指令审批状态#; */
        set v_comm_appr_status=v_tmp_comm_appr_status;
        #获取指令审批操作员序号

        /* set @指令审批操作员序号# = 0; */
        set v_comm_appr_oper_no = 0;
        #如果审批通过，需做相应检查处理，并获取指令批号

        /* if @指令审批状态#=《指令审批状态-审批通过》 then */
        if v_comm_appr_status="2" then

           /* if @指令执行人# = 0 then */
           if v_comm_executor = 0 then

                /* set @指令执行人# = @临时_指令审批操作员#; */
                set v_comm_executor = v_tmp_comm_appr_oper;
            end if;
        end if;

        /* set @指令审批操作员#=@临时_指令审批操作员#; */
        set v_comm_appr_oper=v_tmp_comm_appr_oper;

        /* set @指令审批说明#=@临时_指令审批说明#; */
        set v_comm_appr_remark=v_tmp_comm_appr_remark;

        /* 调用【原子_交易期货_指令_审批指令】*/
        call db_tdfutu.pra_tdfuap_ApprComm(
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
            v_asset_type,
            v_contrc_dir,
            v_comm_date,
            v_comm_id,
            v_comm_opor,
            v_comm_executor,
            v_comm_batch_no,
            v_comm_appr_oper_no,
            v_comm_appr_oper,
            v_comm_appr_status,
            v_comm_appr_remark,
            v_comm_qty,
            v_comm_dir,
            v_comm_limit_price,
            v_limit_actual_price,
            v_order_qty,
            v_comm_cancel_qty,
            v_comm_status,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_oper_way,
            v_rece_margin,
            v_error_code,
            v_error_info,
            v_comm_occur_amt,
            v_comm_occur_qty,
            v_comm_appr_date,
            v_comm_appr_time);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.3.5.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_审批指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @指令审批状态#=《指令审批状态-审批拒绝》 and (@指令变动金额# <> 0 or @指令变动数量# <> 0) then */
        if v_comm_appr_status="3" and (v_comm_occur_amt <> 0 or v_comm_occur_qty <> 0) then

            /* set @订单批号#=0; */
            set v_order_batch_no=0;

            /* set @交易费用#=0; */
            set v_trade_fee=0;

            /* if @开平方向# = 《开平方向-开仓》 then */
            if v_contrc_dir = 1 then

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
                        SET v_error_code = "tdfutuT.3.5.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_锁定获取保证金优惠信息出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;


                    /* set @指令保证金# = -1 * @应收保证金#; */
                    set v_comm_margin = -1 * v_rece_margin;

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
                        SET v_error_code = "tdfutuT.3.5.999";
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
                        SET v_error_code = "tdfutuT.3.5.999";
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
                            SET v_error_code = "tdfutuT.3.5.999";
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
                            SET v_error_code = "tdfutuT.3.5.999";
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
                        SET v_error_code = "tdfutuT.3.5.999";
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
            end if;
            #处理资金持仓数据

            /* set @交易变动数量# = 0; */
            set v_trade_occur_qty = 0;

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
                SET v_error_code = "tdfutuT.3.5.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新交易持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        else

            /* if substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》 then */
            if substring(v_asac_busi_config_str,6,1)=1 then
                #设置订单值

                /* set @外部编号#=0; */
                set v_external_no=0;

                /* set @申报日期# = 0; */
                set v_report_date = 0;

                /* set @申报时间# = 0; */
                set v_report_time = 0;

                /* set @申报编号# = " "; */
                set v_report_no = " ";

                /* set @操作员编号#=@指令执行人#; */
                set v_opor_no=v_comm_executor;

                /* set @订单日期#=@初始化日期#; */
                set v_order_date=v_init_date;

                /* set @价格类型#=《价格类型-限价》; */
                set v_price_type=1;

                /* set @订单方向#=@指令方向#; */
                set v_order_dir=v_comm_dir;

                /* set @订单数量#=@指令数量#; */
                set v_order_qty=v_comm_qty;

                /* set @订单价格#=@指令实际限价#; */
                set v_order_price=v_limit_actual_price;

                /* set @指令变动数量#=-@指令数量#; */
                set v_comm_occur_qty=-v_comm_qty;

                /* set @交易变动数量#=@指令数量#; */
                set v_trade_occur_qty=v_comm_qty;

                /* set @审批通过自动下单# = 《审批通过自动下单-是》; */
                set v_appr_allow_order_flag = 1;
                #先反向更新指令

                /* set @计算方向# = 《计算方向-减去》; */
                set v_calc_dir = -1;

                /* set @指令冻结数量#=@计算方向# * @指令变化数量#; */
                set v_comm_frozen_qty=v_calc_dir * v_comm_change_qty;

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
                    SET v_error_code = "tdfutuT.3.5.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_下单更新指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #根据报盘机状态,设置订单状态 如果通道是允许报送状态,则直接将订单状态设为"待报"

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
                    SET v_error_code = "tdfutuT.3.5.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_公用_获取通道状态出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* if @通道状态# = "1" then */
                if v_pass_status = "1" then

                    /* set @订单状态# = 《订单状态-待报》; */
                    set v_order_status = "a";
                end if;

                /* set @订单操作方式# = 《订单操作方式-审批后自动下单》; */
                set v_order_oper_way = "40";
                #对保证金优惠进行处理

                /* set @临时_指令保证金# = @应收保证金#; */
                set v_tmp_comm_margin = v_rece_margin;

                /* if @开平方向# = 《开平方向-开仓》 then */
                if v_contrc_dir = 1 then

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
                        SET v_error_code = "tdfutuT.3.5.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_锁定获取保证金优惠信息出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;


                    /* set @指令保证金# = -1 * @临时_指令保证金#; */
                    set v_comm_margin = -1 * v_tmp_comm_margin;

                    /* set @订单保证金# = @临时_指令保证金#; */
                    set v_order_margin = v_tmp_comm_margin;

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
                        SET v_error_code = "tdfutuT.3.5.999";
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

                    /* set @指令变动金额# = -1 * @临时_指令保证金#; */
                    set v_comm_occur_amt = -1 * v_tmp_comm_margin;

                    /* set @交易变动金额# = @临时_指令保证金#; */
                    set v_trade_occur_amt = v_tmp_comm_margin;
                  end if;
                else

                  /* if @组合编码# <> " " then */
                  if v_comb_code <> " " then

                    /* set @订单保证金#=-1*@临时_指令保证金#; */
                    set v_order_margin=-1*v_tmp_comm_margin;

                    /* set @指令保证金# = -1*@临时_指令保证金#; */
                    set v_comm_margin = -1*v_tmp_comm_margin;

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
                        SET v_error_code = "tdfutuT.3.5.999";
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
                        SET v_error_code = "tdfutuT.3.5.999";
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

                    /* set @交易变动金额#=-1*@交易变动金额#; */
                    set v_trade_occur_amt=-1*v_trade_occur_amt;
                  else

                    /* set @交易变动金额# = @临时_指令保证金#; */
                    set v_trade_occur_amt = v_tmp_comm_margin;
                  end if;
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
                    SET v_error_code = "tdfutuT.3.5.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新交易组交易资金出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
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

                      /* set @多头订单保证金# = @临时_指令保证金#; */
                      set v_long_order_margin = v_tmp_comm_margin;

                      /* set @多头指令保证金# = -1 * @临时_指令保证金#; */
                      set v_long_comm_margin = -1 * v_tmp_comm_margin;
                    else

                      /* set @多头订单保证金# =-1* @临时_指令保证金#; */
                      set v_long_order_margin =-1* v_tmp_comm_margin;

                      /* set @多头指令保证金# =-1*@临时_指令保证金#; */
                      set v_long_comm_margin =-1*v_tmp_comm_margin;

                      /* set @订单保证金#=-1*@临时_指令保证金#; */
                      set v_order_margin=-1*v_tmp_comm_margin;
                    end if;
                  else

                    /* if @开平方向# = 《开平方向-开仓》 then */
                    if v_contrc_dir = 1 then

                      /* set @空头订单保证金# = @临时_指令保证金#; */
                      set v_short_order_margin = v_tmp_comm_margin;

                      /* set @空头指令保证金# = -1 * @临时_指令保证金#; */
                      set v_short_comm_margin = -1 * v_tmp_comm_margin;
                    else

                      /* set @空头订单保证金# =-1* @临时_指令保证金#; */
                      set v_short_order_margin =-1* v_tmp_comm_margin;

                      /* set @空头指令保证金# = -1*@临时_指令保证金#; */
                      set v_short_comm_margin = -1*v_tmp_comm_margin;

                      /* set @订单保证金#=-1*@临时_指令保证金#; */
                      set v_order_margin=-1*v_tmp_comm_margin;
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
                      SET v_error_code = "tdfutuT.3.5.999";
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
                      SET v_error_code = "tdfutuT.3.5.999";
                      if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_获取更新产品保证金优惠信息出现错误！',v_mysql_message);
                      end if;
                      ROLLBACK;
                      leave label_pro;
                  elseif v_error_code <> "0" then
                      ROLLBACK;
                      leave label_pro;
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
                      SET v_error_code = "tdfutuT.3.5.999";
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
                    SET v_error_code = "tdfutuT.3.5.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新交易持仓出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


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
                    SET v_error_code = "tdfutuT.3.5.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_新增订单出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* if @订单批号# > 0  then */
                if v_order_batch_no > 0  then

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
                       SET v_error_code = "tdfutuT.3.5.999";
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
            end if;
        end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_order_id = v_order_id;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_type = v_stock_type;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_dir = v_order_dir;
    SET p_external_no = v_external_no;
    SET p_price_type = v_price_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_status = v_order_status;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_order_oper_way = v_order_oper_way;
    SET p_update_times = v_update_times;
    SET p_appr_allow_order_flag = v_appr_allow_order_flag;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_指令_分发指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_DispComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_DispComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_comm_id bigint,
    IN p_comm_executor int,
    IN p_disp_remark varchar(255),
    IN p_is_withdraw int,
    IN p_exgp_long_rece_margin decimal(18,4),
    IN p_exgp_short_rece_margin decimal(18,4),
    IN p_asac_long_rece_margin decimal(18,4),
    IN p_asac_short_rece_margin decimal(18,4),
    IN p_lngsht_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_comm_date int,
    OUT p_comm_batch_no int,
    OUT p_comm_dir int,
    OUT p_comm_status varchar(2),
    OUT p_strike_status varchar(2),
    OUT p_comm_qty decimal(18,2),
    OUT p_order_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_comm_cancel_qty decimal(18,2),
    OUT p_before_comm_executor int,
    OUT p_order_id_str varchar(2048),
    OUT p_wtdraw_id_str varchar(2048)
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
    declare v_comm_id bigint;
    declare v_comm_executor int;
    declare v_disp_remark varchar(255);
    declare v_is_withdraw int;
    declare v_exgp_long_rece_margin decimal(18,4);
    declare v_exgp_short_rece_margin decimal(18,4);
    declare v_asac_long_rece_margin decimal(18,4);
    declare v_asac_short_rece_margin decimal(18,4);
    declare v_lngsht_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_dir int;
    declare v_comm_status varchar(2);
    declare v_strike_status varchar(2);
    declare v_comm_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_before_comm_executor int;
    declare v_order_id_str varchar(2048);
    declare v_wtdraw_id_str varchar(2048);
    declare v_tmp_comm_executor int;
    declare v_is_record_jour int;
    declare v_order_id bigint;
    declare v_pre_settle_price decimal(16,9);
    declare v_row_id bigint;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_comm_time int;
    declare v_comm_opor int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_amt decimal(18,4);
    declare v_strike_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
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
    declare v_rece_margin decimal(18,4);
    declare v_disp_flag int;
    declare v_out_acco varchar(32);
    declare v_pass_no int;
    declare v_futu_acco varchar(16);
    declare v_crncy_type varchar(3);
    declare v_contrc_unit int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_order_batch_no int;
    declare v_order_price decimal(16,9);
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_trade_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_margin_ratio decimal(18,12);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_order_oper_way varchar(2);
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_remark varchar(255);
    declare v_frozen_amt decimal(18,4);
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_id bigint;
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
    SET v_comm_id = p_comm_id;
    SET v_comm_executor = p_comm_executor;
    SET v_disp_remark = p_disp_remark;
    SET v_is_withdraw = p_is_withdraw;
    SET v_exgp_long_rece_margin = p_exgp_long_rece_margin;
    SET v_exgp_short_rece_margin = p_exgp_short_rece_margin;
    SET v_asac_long_rece_margin = p_asac_long_rece_margin;
    SET v_asac_short_rece_margin = p_asac_short_rece_margin;
    SET v_lngsht_type = p_lngsht_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_batch_no = 0;
    SET v_comm_dir = 0;
    SET v_comm_status = "0";
    SET v_strike_status = "0";
    SET v_comm_qty = 0;
    SET v_order_qty = 0;
    SET v_strike_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_before_comm_executor = 0;
    SET v_order_id_str = " ";
    SET v_wtdraw_id_str = " ";
    SET v_tmp_comm_executor = 0;
    SET v_is_record_jour = 1;
    SET v_order_id = 0;
    SET v_pre_settle_price = 0;
    SET v_row_id = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_type = 0;
    SET v_asset_type = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_opor = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_amt = 0;
    SET v_strike_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_status = " ";
    SET v_comm_appr_oper_no = 0;
    SET v_comm_appr_oper = 0;
    SET v_comm_appr_remark = " ";
    SET v_external_no = 0;
    SET v_comb_code = " ";
    SET v_comm_oper_way = " ";
    SET v_remark_info = " ";
    SET v_update_times = 1;
    SET v_rece_margin = 0;
    SET v_disp_flag = 0;
    SET v_out_acco = " ";
    SET v_pass_no = 0;
    SET v_futu_acco = " ";
    SET v_crncy_type = "CNY";
    SET v_contrc_unit = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_order_batch_no = 0;
    SET v_order_price = 0;
    SET v_order_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_strike_price = 0;
    SET v_trade_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_strike_all_fee = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_trade_occur_amt = 0;
    SET v_margin_ratio = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_order_oper_way = " ";
    SET v_wtdraw_batch_no = 0;
    SET v_wtdraw_remark = " ";
    SET v_frozen_amt = 0;
    SET v_wtdraw_status = "0";
    SET v_wtdraw_id = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @临时_指令执行人#=@指令执行人#; */
    set v_tmp_comm_executor=v_comm_executor;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @订单序号# = 0; */
    set v_order_id = 0;

    /* set @昨结算价# = 0; */
    set v_pre_settle_price = 0;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易期货_指令_锁定获取指令】*/
        call db_tdfutu.pra_tdfuap_LockGetComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_comm_id,
            v_error_code,
            v_error_info,
            v_row_id,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_crncy_type,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_code,
            v_contrc_type,
            v_asset_type,
            v_contrc_dir,
            v_hedge_type,
            v_comm_date,
            v_comm_time,
            v_comm_batch_no,
            v_comm_opor,
            v_comm_executor,
            v_comm_dir,
            v_comm_limit_price,
            v_limit_actual_price,
            v_comm_qty,
            v_comm_amt,
            v_order_qty,
            v_comm_cancel_qty,
            v_strike_amt,
            v_strike_qty,
            v_comm_frozen_amt,
            v_comm_frozen_qty,
            v_capit_reback_days,
            v_posi_reback_days,
            v_strike_status,
            v_comm_status,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_comple_date,
            v_comm_comple_time,
            v_comm_appr_date,
            v_comm_appr_time,
            v_comm_appr_status,
            v_comm_appr_oper_no,
            v_comm_appr_oper,
            v_comm_appr_remark,
            v_external_no,
            v_comb_code,
            v_comm_oper_way,
            v_remark_info,
            v_update_times,
            v_rece_margin);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.3.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_锁定获取指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* [检查报错返回][@临时_指令执行人#=@指令执行人#][721][@临时_指令执行人#, @指令执行人#] */
        if v_tmp_comm_executor=v_comm_executor then
            ROLLBACK;
            SET v_error_code = "tdfutuT.3.6.721";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("临时_指令执行人=",v_tmp_comm_executor,","," 指令执行人=", v_comm_executor),"#",v_mysql_message);
            else
                SET v_error_info = concat("临时_指令执行人=",v_tmp_comm_executor,","," 指令执行人=", v_comm_executor);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@指令状态#=《指令状态-全部撤销》][724][@指令状态#] */
        if v_comm_status="6" then
            ROLLBACK;
            SET v_error_code = "tdfutuT.3.6.724";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令状态=",v_comm_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令状态=",v_comm_status);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@成交状态#=《成交状态-已成》][725][@成交状态#] */
        if v_strike_status="3" then
            ROLLBACK;
            SET v_error_code = "tdfutuT.3.6.725";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("成交状态=",v_strike_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("成交状态=",v_strike_status);
            end if;
            leave label_pro;
        end if;


        /* set @前指令执行人#=@指令执行人#; */
        set v_before_comm_executor=v_comm_executor;

        /* set @指令执行人#=@临时_指令执行人#; */
        set v_comm_executor=v_tmp_comm_executor;

        /* set @分发方式# =《分发方式-手动分发》; */
        set v_disp_flag =2;

        /* 调用【原子_交易期货_指令_分发指令】*/
        call db_tdfutu.pra_tdfuap_DispComm(
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
            v_asset_type,
            v_comm_date,
            v_comm_id,
            v_comm_batch_no,
            v_comm_dir,
            v_comm_status,
            v_comm_executor,
            v_disp_flag,
            v_disp_remark,
            v_before_comm_executor,
            v_is_withdraw,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.3.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_分发指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @订单序号串# = ""; */
    set v_order_id_str = "";

    /* set @撤单序号串# = ""; */
    set v_wtdraw_id_str = "";

    /* if @是否撤单#=《是否撤单-是》 then */
    if v_is_withdraw=1 then
        #采用循环更新获取订单的方式，避免加锁时间长和并发问题

        /* set @记录序号# = 0; */
        set v_row_id = 0;
        loop_label:loop

        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_交易期货_交易_锁定获取指令订单】*/
            call db_tdfutu.pra_tdfutd_LockGetCommOrder(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_comm_id,
                v_error_code,
                v_error_info,
                v_row_id,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_out_acco,
                v_exch_no,
                v_pass_no,
                v_futu_acco,
                v_futu_acco_no,
                v_contrc_code_no,
                v_crncy_type,
                v_asset_type,
                v_contrc_type,
                v_contrc_unit,
                v_external_no,
                v_report_date,
                v_report_time,
                v_report_no,
                v_order_date,
                v_order_time,
                v_order_dir,
                v_order_batch_no,
                v_contrc_dir,
                v_hedge_type,
                v_order_price,
                v_order_qty,
                v_order_status,
                v_wtdraw_qty,
                v_strike_qty,
                v_strike_price,
                v_strike_amt,
                v_trade_fee,
                v_trade_commis,
                v_other_commis,
                v_strike_commis,
                v_strike_other_commis,
                v_strike_all_fee,
                v_report_fee,
                v_wtdraw_fee,
                v_rece_margin,
                v_trade_occur_amt,
                v_comb_code,
                v_margin_ratio,
                v_rsp_info,
                v_compli_trig_id,
                v_order_oper_way,
                v_update_times);

            /* if @错误编码#="0" then */
            if v_error_code="0" then

                /* set @记录序号# = @订单序号#; */
                set v_row_id = v_order_id;

                /* set @撤单批号# = 0; */
                set v_wtdraw_batch_no = 0;

                /* set @撤单说明# = "指令分发撤销指令订单！"; */
                set v_wtdraw_remark = "指令分发撤销指令订单！";

                /* 调用【原子_交易期货_指令_撤销指令订单】*/
                call db_tdfutu.pra_tdfuap_CancelCommOrder(
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
                    v_contrc_type,
                    v_contrc_unit,
                    v_hedge_type,
                    v_external_no,
                    v_pre_settle_price,
                    v_order_date,
                    v_order_id,
                    v_order_qty,
                    v_order_dir,
                    v_trade_fee,
                    v_order_status,
                    v_report_date,
                    v_report_time,
                    v_report_no,
                    v_wtdraw_batch_no,
                    v_wtdraw_remark,
                    v_strike_qty,
                    v_strike_amt,
                    v_trade_commis,
                    v_other_commis,
                    v_report_fee,
                    v_wtdraw_fee,
                    v_rece_margin,
                    v_comm_id,
                    v_comm_cancel_qty,
                    v_limit_actual_price,
                    v_comm_status,
                    v_contrc_dir,
                    v_exgp_long_rece_margin,
                    v_exgp_short_rece_margin,
                    v_asac_long_rece_margin,
                    v_asac_short_rece_margin,
                    v_lngsht_type,
                    v_comb_code,
                    v_error_code,
                    v_error_info,
                    v_frozen_amt,
                    v_wtdraw_status,
                    v_wtdraw_qty,
                    v_wtdraw_id);
                if v_error_code = "1" then
                    SET v_error_code = "tdfutuT.3.6.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_撤销指令订单出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @订单序号串# = concat(@订单序号串#,@订单序号#,";"); */
                set v_order_id_str = concat(v_order_id_str,v_order_id,";");

                /* if @撤单序号# > 0 and @撤单状态# <> 《撤单状态-成功》 then */
                if v_wtdraw_id > 0 and v_wtdraw_status <> "3" then

                    /* set @撤单序号串# = concat(@撤单序号串#,@撤单序号#,";"); */
                    set v_wtdraw_id_str = concat(v_wtdraw_id_str,v_wtdraw_id,";");
                end if;
            else

                /* set @错误编码#="0"; */
                set v_error_code="0";

                /* set @错误信息#=' '; */
                set v_error_info=' ';
                ROLLBACK;
                leave loop_label;
            end if;
            #处理汇总订单

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
                        SET v_error_code = "tdfutuT.3.6.999";
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

        /* [事务结束] */
        COMMIT;

        end loop;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_comm_date = v_comm_date;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_dir = v_comm_dir;
    SET p_comm_status = v_comm_status;
    SET p_strike_status = v_strike_status;
    SET p_comm_qty = v_comm_qty;
    SET p_order_qty = v_order_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_comm_cancel_qty = v_comm_cancel_qty;
    SET p_before_comm_executor = v_before_comm_executor;
    SET p_order_id_str = v_order_id_str;
    SET p_wtdraw_id_str = v_wtdraw_id_str;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_指令_查询指令结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_QueryCommList;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_QueryCommList(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_appr_oper int,
    IN p_comm_appr_status_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code_no int,
    IN p_asset_type_str varchar(2048),
    IN p_comm_dir_str varchar(2048),
    IN p_comm_status_str varchar(64),
    IN p_strike_status_str varchar(64),
    IN p_comm_oper_way varchar(2),
    IN p_comm_comple_flag int,
    IN p_contrc_dir_str varchar(64),
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
    declare v_comm_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_appr_oper int;
    declare v_comm_appr_status_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_contrc_code_no int;
    declare v_asset_type_str varchar(2048);
    declare v_comm_dir_str varchar(2048);
    declare v_comm_status_str varchar(64);
    declare v_strike_status_str varchar(64);
    declare v_comm_oper_way varchar(2);
    declare v_comm_comple_flag int;
    declare v_contrc_dir_str varchar(64);
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
    SET v_comm_id = p_comm_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_comm_appr_status_str = p_comm_appr_status_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_asset_type_str = p_asset_type_str;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_comm_status_str = p_comm_status_str;
    SET v_strike_status_str = p_strike_status_str;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_comm_comple_flag = p_comm_comple_flag;
    SET v_contrc_dir_str = p_contrc_dir_str;
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

    /* if @指令审批状态串# <> " " then */
    if v_comm_appr_status_str <> " " then

        /* set @指令审批状态串#=concat(";", @指令审批状态串#, ";"); */
        set v_comm_appr_status_str=concat(";", v_comm_appr_status_str, ";");
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @资产类型串# <> " " then */
    if v_asset_type_str <> " " then

        /* set @资产类型串#=concat(";", @资产类型串#, ";"); */
        set v_asset_type_str=concat(";", v_asset_type_str, ";");
    end if;

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* if @指令状态串# <> " " then */
    if v_comm_status_str <> " " then

        /* set @指令状态串#=concat(";", @指令状态串#, ";"); */
        set v_comm_status_str=concat(";", v_comm_status_str, ";");
    end if;

    /* if @成交状态串# <> " " then */
    if v_strike_status_str <> " " then

        /* set @成交状态串#=concat(";", @成交状态串#, ";"); */
        set v_strike_status_str=concat(";", v_strike_status_str, ";");
    end if;

    /* if @开平方向串# <> " " then */
    if v_contrc_dir_str <> " " then

        /* set @开平方向串#=concat(";", @开平方向串#, ";"); */
        set v_contrc_dir_str=concat(";", v_contrc_dir_str, ";");
    end if;

    /* 调用【原子_交易期货_指令_查询指令结果集】*/
    call db_tdfutu.pra_tdfuap_QueryCommList(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_id,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_comm_opor,
        v_comm_executor,
        v_comm_appr_oper,
        v_comm_appr_status_str,
        v_exch_no_str,
        v_contrc_code_no,
        v_asset_type_str,
        v_comm_dir_str,
        v_comm_status_str,
        v_strike_status_str,
        v_comm_oper_way,
        v_comm_comple_flag,
        v_contrc_dir_str,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.3.7.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_查询指令结果集出现错误！',v_mysql_message);
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

# 事务_交易期货_指令_查询历史指令结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_QueryHisCommList;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_QueryHisCommList(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_comm_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_appr_oper int,
    IN p_comm_appr_status_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code_no int,
    IN p_asset_type_str varchar(2048),
    IN p_comm_dir_str varchar(2048),
    IN p_comm_status_str varchar(64),
    IN p_strike_status_str varchar(64),
    IN p_comm_oper_way varchar(2),
    IN p_comm_comple_flag int,
    IN p_contrc_dir_str varchar(64),
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
    declare v_comm_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_appr_oper int;
    declare v_comm_appr_status_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_contrc_code_no int;
    declare v_asset_type_str varchar(2048);
    declare v_comm_dir_str varchar(2048);
    declare v_comm_status_str varchar(64);
    declare v_strike_status_str varchar(64);
    declare v_comm_oper_way varchar(2);
    declare v_comm_comple_flag int;
    declare v_contrc_dir_str varchar(64);
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
    SET v_comm_id = p_comm_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_comm_appr_status_str = p_comm_appr_status_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_asset_type_str = p_asset_type_str;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_comm_status_str = p_comm_status_str;
    SET v_strike_status_str = p_strike_status_str;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_comm_comple_flag = p_comm_comple_flag;
    SET v_contrc_dir_str = p_contrc_dir_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdfutuT.3.8.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdfutuT.3.8.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>93 then
        
        SET v_error_code = "tdfutuT.3.8.255";
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

    /* if @指令审批状态串# <> " " then */
    if v_comm_appr_status_str <> " " then

        /* set @指令审批状态串#=concat(";", @指令审批状态串#, ";"); */
        set v_comm_appr_status_str=concat(";", v_comm_appr_status_str, ";");
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @资产类型串# <> " " then */
    if v_asset_type_str <> " " then

        /* set @资产类型串#=concat(";", @资产类型串#, ";"); */
        set v_asset_type_str=concat(";", v_asset_type_str, ";");
    end if;

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* if @指令状态串# <> " " then */
    if v_comm_status_str <> " " then

        /* set @指令状态串#=concat(";", @指令状态串#, ";"); */
        set v_comm_status_str=concat(";", v_comm_status_str, ";");
    end if;

    /* if @成交状态串# <> " " then */
    if v_strike_status_str <> " " then

        /* set @成交状态串#=concat(";", @成交状态串#, ";"); */
        set v_strike_status_str=concat(";", v_strike_status_str, ";");
    end if;

    /* if @开平方向串# <> " " then */
    if v_contrc_dir_str <> " " then

        /* set @开平方向串#=concat(";", @开平方向串#, ";"); */
        set v_contrc_dir_str=concat(";", v_contrc_dir_str, ";");
    end if;

    /* 调用【原子_交易期货_指令_查询历史指令结果集】*/
    call db_tdfutu.pra_tdfuap_QueryHisCommList(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_comm_id,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_comm_opor,
        v_comm_executor,
        v_comm_appr_oper,
        v_comm_appr_status_str,
        v_exch_no_str,
        v_contrc_code_no,
        v_asset_type_str,
        v_comm_dir_str,
        v_comm_status_str,
        v_strike_status_str,
        v_comm_oper_way,
        v_comm_comple_flag,
        v_contrc_dir_str,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.3.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_查询历史指令结果集出现错误！',v_mysql_message);
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

# 事务_交易期货_指令_查询指令分发结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_QueryCommDispJourList;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_QueryCommDispJourList(
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
    IN p_disp_opor int,
    IN p_before_comm_executor int,
    IN p_comm_executor int,
    IN p_comm_id bigint,
    IN p_comm_dir_str varchar(2048),
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
    declare v_disp_opor int;
    declare v_before_comm_executor int;
    declare v_comm_executor int;
    declare v_comm_id bigint;
    declare v_comm_dir_str varchar(2048);
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
    SET v_disp_opor = p_disp_opor;
    SET v_before_comm_executor = p_before_comm_executor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_id = p_comm_id;
    SET v_comm_dir_str = p_comm_dir_str;
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

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* 调用【原子_交易期货_指令_查询指令分发结果集】*/
    call db_tdfutu.pra_tdfuap_QueryCommDispJourList(
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
        v_disp_opor,
        v_before_comm_executor,
        v_comm_executor,
        v_comm_id,
        v_comm_dir_str,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.3.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_查询指令分发结果集出现错误！',v_mysql_message);
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

# 事务_交易期货_指令_查询历史指令分发结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_QueryHisCommDispJourList;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_QueryHisCommDispJourList(
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
    IN p_disp_opor int,
    IN p_before_comm_executor int,
    IN p_comm_executor int,
    IN p_comm_id bigint,
    IN p_comm_dir_str varchar(2048),
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
    declare v_disp_opor int;
    declare v_before_comm_executor int;
    declare v_comm_executor int;
    declare v_comm_id bigint;
    declare v_comm_dir_str varchar(2048);
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
    SET v_disp_opor = p_disp_opor;
    SET v_before_comm_executor = p_before_comm_executor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_id = p_comm_id;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdfutuT.3.10.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdfutuT.3.10.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>93 then
        
        SET v_error_code = "tdfutuT.3.10.255";
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

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* 调用【原子_交易期货_指令_查询历史指令分发结果集】*/
    call db_tdfutu.pra_tdfuap_QueryHisCommDispJourList(
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
        v_disp_opor,
        v_before_comm_executor,
        v_comm_executor,
        v_comm_id,
        v_comm_dir_str,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.3.10.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_查询历史指令分发结果集出现错误！',v_mysql_message);
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

# 事务_交易期货_指令_查询指令审批结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_QueryCommApprJourList;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_QueryCommApprJourList(
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
    IN p_comm_opor int,
    IN p_comm_dir_str varchar(2048),
    IN p_comm_appr_oper int,
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
    declare v_comm_opor int;
    declare v_comm_dir_str varchar(2048);
    declare v_comm_appr_oper int;
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
    SET v_comm_opor = p_comm_opor;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_comm_appr_oper = p_comm_appr_oper;
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

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* 调用【原子_交易期货_指令_查询指令审批结果集】*/
    call db_tdfutu.pra_tdfuap_QueryCommApprJourList(
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
        v_comm_opor,
        v_comm_dir_str,
        v_comm_appr_oper,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.3.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_查询指令审批结果集出现错误！',v_mysql_message);
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

# 事务_交易期货_指令_查询历史指令审批结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_QueryHisCommApprJourList;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_QueryHisCommApprJourList(
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
    IN p_comm_opor int,
    IN p_comm_dir_str varchar(2048),
    IN p_comm_appr_oper int,
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
    declare v_comm_opor int;
    declare v_comm_dir_str varchar(2048);
    declare v_comm_appr_oper int;
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
    SET v_comm_opor = p_comm_opor;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdfutuT.3.12.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdfutuT.3.12.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>93 then
        
        SET v_error_code = "tdfutuT.3.12.255";
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

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* 调用【原子_交易期货_指令_查询历史指令审批结果集】*/
    call db_tdfutu.pra_tdfuap_QueryHisCommApprJourList(
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
        v_comm_opor,
        v_comm_dir_str,
        v_comm_appr_oper,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.3.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_查询历史指令审批结果集出现错误！',v_mysql_message);
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

# 事务_交易期货_指令_查询汇总指令结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_QuerySumCommList;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_QuerySumCommList(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_date int,
    IN p_comm_batch_no int,
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_sum_appr_status_str varchar(64),
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code_no int,
    IN p_asset_type_str varchar(2048),
    IN p_comm_dir_str varchar(2048),
    IN p_comm_sum_status_str varchar(64),
    IN p_strike_status_str varchar(64),
    IN p_comm_oper_way varchar(2),
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
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_sum_appr_status_str varchar(64);
    declare v_exch_no_str varchar(2048);
    declare v_contrc_code_no int;
    declare v_asset_type_str varchar(2048);
    declare v_comm_dir_str varchar(2048);
    declare v_comm_sum_status_str varchar(64);
    declare v_strike_status_str varchar(64);
    declare v_comm_oper_way varchar(2);
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
    SET v_comm_date = p_comm_date;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_sum_appr_status_str = p_comm_sum_appr_status_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_asset_type_str = p_asset_type_str;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_comm_sum_status_str = p_comm_sum_status_str;
    SET v_strike_status_str = p_strike_status_str;
    SET v_comm_oper_way = p_comm_oper_way;
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

    /* if @指令汇总审批状态串# <> " " then */
    if v_comm_sum_appr_status_str <> " " then

        /* set @指令汇总审批状态串#=concat(";", @指令汇总审批状态串#, ";"); */
        set v_comm_sum_appr_status_str=concat(";", v_comm_sum_appr_status_str, ";");
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @资产类型串# <> " " then */
    if v_asset_type_str <> " " then

        /* set @资产类型串#=concat(";", @资产类型串#, ";"); */
        set v_asset_type_str=concat(";", v_asset_type_str, ";");
    end if;

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* if @指令汇总状态串# <> " " then */
    if v_comm_sum_status_str <> " " then

        /* set @指令汇总状态串#=concat(";", @指令汇总状态串#, ";"); */
        set v_comm_sum_status_str=concat(";", v_comm_sum_status_str, ";");
    end if;

    /* if @成交状态串# <> " " then */
    if v_strike_status_str <> " " then

        /* set @成交状态串#=concat(";", @成交状态串#, ";"); */
        set v_strike_status_str=concat(";", v_strike_status_str, ";");
    end if;

    /* 调用【原子_交易期货_指令_查询汇总指令结果集】*/
    call db_tdfutu.pra_tdfuap_QuerySumCommList(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_date,
        v_comm_batch_no,
        v_comm_opor,
        v_comm_executor,
        v_comm_sum_appr_status_str,
        v_exch_no_str,
        v_contrc_code_no,
        v_asset_type_str,
        v_comm_dir_str,
        v_comm_sum_status_str,
        v_strike_status_str,
        v_comm_oper_way,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.3.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_查询汇总指令结果集出现错误！',v_mysql_message);
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

# 事务_交易期货_指令_查询历史汇总指令结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_QueryHisSumCommList;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_QueryHisSumCommList(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_comm_date int,
    IN p_comm_batch_no int,
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_sum_appr_status_str varchar(64),
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code_no int,
    IN p_asset_type_str varchar(2048),
    IN p_comm_dir_str varchar(2048),
    IN p_comm_sum_status_str varchar(64),
    IN p_strike_status_str varchar(64),
    IN p_comm_oper_way varchar(2),
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
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_sum_appr_status_str varchar(64);
    declare v_exch_no_str varchar(2048);
    declare v_contrc_code_no int;
    declare v_asset_type_str varchar(2048);
    declare v_comm_dir_str varchar(2048);
    declare v_comm_sum_status_str varchar(64);
    declare v_strike_status_str varchar(64);
    declare v_comm_oper_way varchar(2);
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
    SET v_comm_date = p_comm_date;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_sum_appr_status_str = p_comm_sum_appr_status_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_asset_type_str = p_asset_type_str;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_comm_sum_status_str = p_comm_sum_status_str;
    SET v_strike_status_str = p_strike_status_str;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdfutuT.3.14.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdfutuT.3.14.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>93 then
        
        SET v_error_code = "tdfutuT.3.14.255";
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

    /* if @指令汇总审批状态串# <> " " then */
    if v_comm_sum_appr_status_str <> " " then

        /* set @指令汇总审批状态串#=concat(";", @指令汇总审批状态串#, ";"); */
        set v_comm_sum_appr_status_str=concat(";", v_comm_sum_appr_status_str, ";");
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @资产类型串# <> " " then */
    if v_asset_type_str <> " " then

        /* set @资产类型串#=concat(";", @资产类型串#, ";"); */
        set v_asset_type_str=concat(";", v_asset_type_str, ";");
    end if;

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* if @指令汇总状态串# <> " " then */
    if v_comm_sum_status_str <> " " then

        /* set @指令汇总状态串#=concat(";", @指令汇总状态串#, ";"); */
        set v_comm_sum_status_str=concat(";", v_comm_sum_status_str, ";");
    end if;

    /* if @成交状态串# <> " " then */
    if v_strike_status_str <> " " then

        /* set @成交状态串#=concat(";", @成交状态串#, ";"); */
        set v_strike_status_str=concat(";", v_strike_status_str, ";");
    end if;

    /* 调用【原子_交易期货_指令_查询历史汇总指令结果集】*/
    call db_tdfutu.pra_tdfuap_QueryHisSumCommList(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_comm_date,
        v_comm_batch_no,
        v_comm_opor,
        v_comm_executor,
        v_comm_sum_appr_status_str,
        v_exch_no_str,
        v_contrc_code_no,
        v_asset_type_str,
        v_comm_dir_str,
        v_comm_sum_status_str,
        v_strike_status_str,
        v_comm_oper_way,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.3.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_查询历史汇总指令结果集出现错误！',v_mysql_message);
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

# 事务_交易期货_指令_获取指令实际限价
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_GetCommLimitActualPrice;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_GetCommLimitActualPrice(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_limit_price decimal(16,9),
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_dir int,
    IN p_last_price decimal(16,9),
    IN p_pre_settle_price decimal(16,9),
    IN p_comm_no_limit_price_ratio decimal(18,12),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pre_limit_actual_price decimal(16,9)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_dir int;
    declare v_last_price decimal(16,9);
    declare v_pre_settle_price decimal(16,9);
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pre_limit_actual_price decimal(16,9);

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
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_dir = p_comm_dir;
    SET v_last_price = p_last_price;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_comm_no_limit_price_ratio = p_comm_no_limit_price_ratio;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pre_limit_actual_price = 0;

    
    label_pro:BEGIN
    

    /* if @指令限价#=0 and @指令实际限价# = 0 then */
    if v_comm_limit_price=0 and v_limit_actual_price = 0 then

        /* if @指令方向# = 《指令方向-买入》 then */
        if v_comm_dir = 1 then

            /* if @最新价# = 0 then */
            if v_last_price = 0 then

                /* set @指令实际限价#=@昨结算价# * (1+@指令不限价浮动比例#); */
                set v_limit_actual_price=v_pre_settle_price * (1+v_comm_no_limit_price_ratio);
            else

                /* set @指令实际限价#=@最新价# * (1+@指令不限价浮动比例#); */
                set v_limit_actual_price=v_last_price * (1+v_comm_no_limit_price_ratio);
            end if;

            /* if @指令实际限价# > @涨停价# and @涨停价# > 0 then */
            if v_limit_actual_price > v_up_limit_price and v_up_limit_price > 0 then

                 /* set @指令实际限价#=@涨停价#; */
                 set v_limit_actual_price=v_up_limit_price;
            end if;

        /* elseif @指令方向# = 《指令方向-卖出》 then */
        elseif v_comm_dir = 2 then

            /* if @最新价# = 0 then */
            if v_last_price = 0 then

                /* set @指令实际限价#=@昨结算价# * (1-@指令不限价浮动比例#); */
                set v_limit_actual_price=v_pre_settle_price * (1-v_comm_no_limit_price_ratio);
            else

                /* set @指令实际限价#=@最新价# * (1-@指令不限价浮动比例#); */
                set v_limit_actual_price=v_last_price * (1-v_comm_no_limit_price_ratio);
            end if;

            /* if @指令实际限价# < @跌停价# and @跌停价# > 0 then */
            if v_limit_actual_price < v_down_limit_price and v_down_limit_price > 0 then

                 /* set @指令实际限价#=@跌停价#; */
                 set v_limit_actual_price=v_down_limit_price;
            end if;
        end if;

    /* elseif @指令实际限价# = 0 then */
    elseif v_limit_actual_price = 0 then

      /* set @指令实际限价#=@指令限价#; */
      set v_limit_actual_price=v_comm_limit_price;
    end if;

    /* set @前指令实际限价# = @指令实际限价#; */
    set v_pre_limit_actual_price = v_limit_actual_price;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pre_limit_actual_price = v_pre_limit_actual_price;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_指令_修改指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_ModiComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_ModiComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_id bigint,
    IN p_comm_limit_price decimal(16,9),
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_qty decimal(18,2),
    IN p_comm_amt decimal(18,4),
    IN p_comm_begin_date int,
    IN p_comm_end_date int,
    IN p_comm_begin_time int,
    IN p_comm_end_time int,
    IN p_modi_info varchar(255),
    IN p_busi_limit_str varchar(2048),
    IN p_exgp_busi_config_str varchar(64),
    IN p_asac_busi_config_str varchar(64),
    IN p_exgp_avail_amt decimal(18,4),
    IN p_asac_avail_amt decimal(18,4),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    IN p_exgp_long_rece_margin decimal(18,4),
    IN p_exgp_short_rece_margin decimal(18,4),
    IN p_asac_long_rece_margin decimal(18,4),
    IN p_asac_short_rece_margin decimal(18,4),
    IN p_lngsht_type int,
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_trade_fee decimal(18,4),
    IN p_contrc_unit int,
    IN p_pre_settle_price decimal(16,9),
    IN p_margin_ratio decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_date int,
    OUT p_comm_batch_no int,
    OUT p_comm_status varchar(2),
    OUT p_comm_opor int,
    OUT p_comm_occur_amt decimal(18,4),
    OUT p_comm_occur_qty decimal(18,2),
    OUT p_order_id_str varchar(2048),
    OUT p_wtdraw_id_str varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_comm_id bigint;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_modi_info varchar(255);
    declare v_busi_limit_str varchar(2048);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_exgp_long_rece_margin decimal(18,4);
    declare v_exgp_short_rece_margin decimal(18,4);
    declare v_asac_long_rece_margin decimal(18,4);
    declare v_asac_short_rece_margin decimal(18,4);
    declare v_lngsht_type int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_trade_fee decimal(18,4);
    declare v_contrc_unit int;
    declare v_pre_settle_price decimal(16,9);
    declare v_margin_ratio decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_status varchar(2);
    declare v_comm_opor int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_order_id_str varchar(2048);
    declare v_wtdraw_id_str varchar(2048);
    declare v_tmp_comm_limit_price decimal(16,9);
    declare v_tmp_limit_actual_price decimal(16,9);
    declare v_tmp_comm_qty decimal(18,2);
    declare v_tmp_comm_amt decimal(18,4);
    declare v_tmp_comm_begin_date int;
    declare v_tmp_comm_end_date int;
    declare v_tmp_comm_begin_time int;
    declare v_tmp_comm_end_time int;
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_order_margin decimal(18,4);
    declare v_strike_margin decimal(18,4);
    declare v_invest_type int;
    declare v_strike_fee decimal(18,4);
    declare v_is_record_jour int;
    declare v_row_id bigint;
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
    declare v_comm_time int;
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_strike_status varchar(2);
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
    declare v_rece_margin decimal(18,4);
    declare v_tmp_rece_margin decimal(18,4);
    declare v_comm_margin decimal(18,4);
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
    declare v_trade_capt_amt_after decimal(18,4);
    declare v_posi_capt_amt_after decimal(18,4);
    declare v_comm_capt_amt_after decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_out_acco varchar(32);
    declare v_pass_no int;
    declare v_futu_acco varchar(16);
    declare v_crncy_type varchar(3);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_order_batch_no int;
    declare v_order_price decimal(16,9);
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_order_oper_way varchar(2);
    declare v_order_id bigint;
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_remark varchar(255);
    declare v_frozen_amt decimal(18,4);
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_id bigint;
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
    SET v_comm_id = p_comm_id;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_qty = p_comm_qty;
    SET v_comm_amt = p_comm_amt;
    SET v_comm_begin_date = p_comm_begin_date;
    SET v_comm_end_date = p_comm_end_date;
    SET v_comm_begin_time = p_comm_begin_time;
    SET v_comm_end_time = p_comm_end_time;
    SET v_modi_info = p_modi_info;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_exgp_busi_config_str = p_exgp_busi_config_str;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_exgp_avail_amt = p_exgp_avail_amt;
    SET v_asac_avail_amt = p_asac_avail_amt;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_exgp_long_rece_margin = p_exgp_long_rece_margin;
    SET v_exgp_short_rece_margin = p_exgp_short_rece_margin;
    SET v_asac_long_rece_margin = p_asac_long_rece_margin;
    SET v_asac_short_rece_margin = p_asac_short_rece_margin;
    SET v_lngsht_type = p_lngsht_type;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_trade_fee = p_trade_fee;
    SET v_contrc_unit = p_contrc_unit;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_margin_ratio = p_margin_ratio;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_batch_no = 0;
    SET v_comm_status = "0";
    SET v_comm_opor = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_order_id_str = " ";
    SET v_wtdraw_id_str = " ";
    SET v_tmp_comm_limit_price = 0;
    SET v_tmp_limit_actual_price = 0;
    SET v_tmp_comm_qty = 0;
    SET v_tmp_comm_amt = 0;
    SET v_tmp_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_order_margin = 0;
    SET v_strike_margin = 0;
    SET v_invest_type = 0;
    SET v_strike_fee = 0;
    SET v_is_record_jour = 1;
    SET v_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_type = 0;
    SET v_asset_type = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_executor = 0;
    SET v_comm_dir = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_strike_status = "0";
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_status = " ";
    SET v_comm_appr_oper_no = 0;
    SET v_comm_appr_oper = 0;
    SET v_comm_appr_remark = " ";
    SET v_external_no = 0;
    SET v_comb_code = " ";
    SET v_comm_oper_way = " ";
    SET v_remark_info = " ";
    SET v_update_times = 1;
    SET v_rece_margin = 0;
    SET v_tmp_rece_margin = 0;
    SET v_comm_margin = 0;
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
    SET v_trade_capt_amt_after = 0;
    SET v_posi_capt_amt_after = 0;
    SET v_comm_capt_amt_after = 0;
    SET v_strike_capt_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_out_acco = " ";
    SET v_pass_no = 0;
    SET v_futu_acco = " ";
    SET v_crncy_type = "CNY";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_order_batch_no = 0;
    SET v_order_price = 0;
    SET v_order_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_strike_price = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_strike_all_fee = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_order_oper_way = " ";
    SET v_order_id = 0;
    SET v_wtdraw_batch_no = 0;
    SET v_wtdraw_remark = " ";
    SET v_frozen_amt = 0;
    SET v_wtdraw_status = "0";
    SET v_wtdraw_id = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @临时_指令限价#=@指令限价#; */
    set v_tmp_comm_limit_price=v_comm_limit_price;

    /* set @临时_指令实际限价#=@指令实际限价#; */
    set v_tmp_limit_actual_price=v_limit_actual_price;

    /* set @临时_指令数量#=@指令数量#; */
    set v_tmp_comm_qty=v_comm_qty;
    #指令金额后台自己计算，不采用前台传入

    /* set @指令金额# = @指令数量# *@指令实际限价# * @合约乘数#; */
    set v_comm_amt = v_comm_qty *v_limit_actual_price * v_contrc_unit;

    /* set @临时_指令金额#=@指令金额#; */
    set v_tmp_comm_amt=v_comm_amt;

    /* set @临时_指令开始日期# = @指令开始日期#; */
    set v_tmp_comm_begin_date = v_comm_begin_date;

    /* set @临时_指令结束日期# = @指令结束日期#; */
    set v_tmp_comm_end_date = v_comm_end_date;

    /* set @临时_指令开始时间# = @指令开始时间#; */
    set v_tmp_comm_begin_time = v_comm_begin_time;

    /* set @临时_指令结束时间# = @指令结束时间#; */
    set v_tmp_comm_end_time = v_comm_end_time;

    /* set @多头持仓保证金# = @交易组多头应收保证金#; */
    set v_long_hold_margin = v_exgp_long_rece_margin;

    /* set @空头持仓保证金# = @交易组空头应收保证金#; */
    set v_short_hold_margin = v_exgp_short_rece_margin;

    /* set @订单保证金# = 0; */
    set v_order_margin = 0;

    /* set @成交保证金# = 0; */
    set v_strike_margin = 0;

    /* set @投资类型# = 1; */
    set v_invest_type = 1;

    /* set @成交费用# = 0; */
    set v_strike_fee = 0;

    /* set @交易费用# = 0; */
    set v_trade_fee = 0;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易期货_指令_锁定获取指令】*/
        call db_tdfutu.pra_tdfuap_LockGetComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_comm_id,
            v_error_code,
            v_error_info,
            v_row_id,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_crncy_type,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_code,
            v_contrc_type,
            v_asset_type,
            v_contrc_dir,
            v_hedge_type,
            v_comm_date,
            v_comm_time,
            v_comm_batch_no,
            v_comm_opor,
            v_comm_executor,
            v_comm_dir,
            v_comm_limit_price,
            v_limit_actual_price,
            v_comm_qty,
            v_comm_amt,
            v_order_qty,
            v_comm_cancel_qty,
            v_strike_amt,
            v_strike_qty,
            v_comm_frozen_amt,
            v_comm_frozen_qty,
            v_capit_reback_days,
            v_posi_reback_days,
            v_strike_status,
            v_comm_status,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_comple_date,
            v_comm_comple_time,
            v_comm_appr_date,
            v_comm_appr_time,
            v_comm_appr_status,
            v_comm_appr_oper_no,
            v_comm_appr_oper,
            v_comm_appr_remark,
            v_external_no,
            v_comb_code,
            v_comm_oper_way,
            v_remark_info,
            v_update_times,
            v_rece_margin);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.3.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_锁定获取指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @指令实际限价#=@临时_指令实际限价#; */
        set v_limit_actual_price=v_tmp_limit_actual_price;

        /* set @临时_应收保证金# = @应收保证金#; */
        set v_tmp_rece_margin = v_rece_margin;
        #检查原指令状态

        /* [检查报错返回][@指令状态#=《指令状态-待撤销》 or @指令状态#=《指令状态-部分撤销》 or @指令状态#=《指令状态-全部撤销》 or @成交状态#=《成交状态-已成》 ][624][@指令状态#,@成交状态#] */
        if v_comm_status="4" or v_comm_status="5" or v_comm_status="6" or v_strike_status="3"  then
            ROLLBACK;
            SET v_error_code = "tdfutuT.3.16.624";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令状态=",v_comm_status,",","成交状态=",v_strike_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令状态=",v_comm_status,",","成交状态=",v_strike_status);
            end if;
            leave label_pro;
        end if;


        /* set @应收保证金#= @临时_指令实际限价#*@保证金比例#*@临时_指令数量# *@合约乘数#; */
        set v_rece_margin= v_tmp_limit_actual_price*v_margin_ratio*v_tmp_comm_qty *v_contrc_unit;

        /* set @指令保证金# = @应收保证金# - @临时_应收保证金#; */
        set v_comm_margin = v_rece_margin - v_tmp_rece_margin;
        #计算本次修改变动的指令数量和冻结金额

        /* set @指令数量#=@临时_指令数量# - @指令数量#; */
        set v_comm_qty=v_tmp_comm_qty - v_comm_qty;

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
                SET v_error_code = "tdfutuT.3.16.999";
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
                SET v_error_code = "tdfutuT.3.16.999";
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
        #交易期货子系统检查，检查指令可用资金、可用持仓等

        /* 调用【原子_交易期货_指令_校验新增指令】*/
        call db_tdfutu.pra_tdfuap_CheckAddComm(
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
            v_lngsht_type,
            v_comm_occur_amt,
            v_exgp_avail_amt,
            v_asac_avail_amt,
            v_comm_qty,
            v_exgp_avail_qty,
            v_asac_avail_qty,
            v_limit_actual_price,
            v_up_limit_price,
            v_down_limit_price,
            v_asac_busi_config_str,
            v_exgp_busi_config_str,
            v_trade_fee,
            v_exch_crncy_type,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.3.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_校验新增指令出现错误！',v_mysql_message);
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
            SET v_error_code = "tdfutuT.3.16.999";
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
                SET v_error_code = "tdfutuT.3.16.999";
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
                SET v_error_code = "tdfutuT.3.16.999";
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
            SET v_error_code = "tdfutuT.3.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新资产账户交易资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #指令修改

        /* set @指令数量#=@临时_指令数量#; */
        set v_comm_qty=v_tmp_comm_qty;

        /* set @指令限价#=@临时_指令限价#; */
        set v_comm_limit_price=v_tmp_comm_limit_price;

        /* set @指令金额#=@临时_指令金额#; */
        set v_comm_amt=v_tmp_comm_amt;

        /* set @指令实际限价#=@临时_指令实际限价#; */
        set v_limit_actual_price=v_tmp_limit_actual_price;

        /* set @指令开始日期# = @临时_指令开始日期#; */
        set v_comm_begin_date = v_tmp_comm_begin_date;

        /* set @指令结束日期# = @临时_指令结束日期#; */
        set v_comm_end_date = v_tmp_comm_end_date;

        /* set @指令开始时间# = @临时_指令开始时间#; */
        set v_comm_begin_time = v_tmp_comm_begin_time;

        /* set @指令结束时间# = @临时_指令结束时间#; */
        set v_comm_end_time = v_tmp_comm_end_time;

        /* 调用【原子_交易期货_指令_修改指令】*/
        call db_tdfutu.pra_tdfuap_ModiComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_comm_id,
            v_comm_limit_price,
            v_limit_actual_price,
            v_comm_qty,
            v_comm_amt,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_occur_qty,
            v_comm_occur_amt,
            v_comm_frozen_amt,
            v_rece_margin,
            v_comm_margin,
            v_modi_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuT.3.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_修改指令出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if  @指令变动数量# <> 0 then */
        if  v_comm_occur_qty <> 0 then
            #处理资金持仓数据

            /* set @交易变动数量# = 0; */
            set v_trade_occur_qty = 0;

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
                SET v_error_code = "tdfutuT.3.16.999";
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

    /* [事务结束] */
    COMMIT;

        #指令价格为0时不限价不应该撤订单

        /* [检查正常返回][@指令限价# = 0] */
        if v_comm_limit_price = 0 then
            leave label_pro;
        end if;

        #采用循环更新获取订单的方式，避免加锁时间长和并发问题

        /* set @订单序号串# = ""; */
        set v_order_id_str = "";

        /* set @撤单序号串# = ""; */
        set v_wtdraw_id_str = "";

        /* set @记录序号# = 0; */
        set v_row_id = 0;
        loop_label:loop

        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_交易期货_交易_锁定获取指令订单】*/
            call db_tdfutu.pra_tdfutd_LockGetCommOrder(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_comm_id,
                v_error_code,
                v_error_info,
                v_row_id,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_out_acco,
                v_exch_no,
                v_pass_no,
                v_futu_acco,
                v_futu_acco_no,
                v_contrc_code_no,
                v_crncy_type,
                v_asset_type,
                v_contrc_type,
                v_contrc_unit,
                v_external_no,
                v_report_date,
                v_report_time,
                v_report_no,
                v_order_date,
                v_order_time,
                v_order_dir,
                v_order_batch_no,
                v_contrc_dir,
                v_hedge_type,
                v_order_price,
                v_order_qty,
                v_order_status,
                v_wtdraw_qty,
                v_strike_qty,
                v_strike_price,
                v_strike_amt,
                v_trade_fee,
                v_trade_commis,
                v_other_commis,
                v_strike_commis,
                v_strike_other_commis,
                v_strike_all_fee,
                v_report_fee,
                v_wtdraw_fee,
                v_rece_margin,
                v_trade_occur_amt,
                v_comb_code,
                v_margin_ratio,
                v_rsp_info,
                v_compli_trig_id,
                v_order_oper_way,
                v_update_times);

            /* if @错误编码#="0" then */
            if v_error_code="0" then

                /* set @订单序号# = @指令序号#; */
                set v_order_id = v_comm_id;

                /* set @撤单批号# = 0; */
                set v_wtdraw_batch_no = 0;

                /* set @撤单说明# = "指令修改撤销指令订单！"; */
                set v_wtdraw_remark = "指令修改撤销指令订单！";

                /* 调用【原子_交易期货_指令_撤销指令订单】*/
                call db_tdfutu.pra_tdfuap_CancelCommOrder(
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
                    v_contrc_type,
                    v_contrc_unit,
                    v_hedge_type,
                    v_external_no,
                    v_pre_settle_price,
                    v_order_date,
                    v_order_id,
                    v_order_qty,
                    v_order_dir,
                    v_trade_fee,
                    v_order_status,
                    v_report_date,
                    v_report_time,
                    v_report_no,
                    v_wtdraw_batch_no,
                    v_wtdraw_remark,
                    v_strike_qty,
                    v_strike_amt,
                    v_trade_commis,
                    v_other_commis,
                    v_report_fee,
                    v_wtdraw_fee,
                    v_rece_margin,
                    v_comm_id,
                    v_comm_cancel_qty,
                    v_limit_actual_price,
                    v_comm_status,
                    v_contrc_dir,
                    v_exgp_long_rece_margin,
                    v_exgp_short_rece_margin,
                    v_asac_long_rece_margin,
                    v_asac_short_rece_margin,
                    v_lngsht_type,
                    v_comb_code,
                    v_error_code,
                    v_error_info,
                    v_frozen_amt,
                    v_wtdraw_status,
                    v_wtdraw_qty,
                    v_wtdraw_id);
                if v_error_code = "1" then
                    SET v_error_code = "tdfutuT.3.16.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_撤销指令订单出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @订单序号串# = concat(@订单序号串#,@订单序号#,";"); */
                set v_order_id_str = concat(v_order_id_str,v_order_id,";");

                /* if @撤单序号# > 0 and @撤单状态# <> 《撤单状态-成功》 then */
                if v_wtdraw_id > 0 and v_wtdraw_status <> "3" then

                    /* set @撤单序号串# = concat(@撤单序号串#,@撤单序号#,";"); */
                    set v_wtdraw_id_str = concat(v_wtdraw_id_str,v_wtdraw_id,";");
                end if;
            else

                /* set @错误编码#="0"; */
                set v_error_code="0";

                /* set @错误信息#=' '; */
                set v_error_info=' ';
                ROLLBACK;
                leave loop_label;
            end if;
             #处理汇总订单

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
                     SET v_error_code = "tdfutuT.3.16.999";
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

        /* [事务结束] */
        COMMIT;

        end loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_date = v_comm_date;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_status = v_comm_status;
    SET p_comm_opor = v_comm_opor;
    SET p_comm_occur_amt = v_comm_occur_amt;
    SET p_comm_occur_qty = v_comm_occur_qty;
    SET p_order_id_str = v_order_id_str;
    SET p_wtdraw_id_str = v_wtdraw_id_str;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_指令_循环锁定获取指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfuap_LoopLockGetComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfuap_LoopLockGetComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_code varchar(6),
    OUT p_contrc_type int,
    OUT p_asset_type int,
    OUT p_contrc_dir int,
    OUT p_hedge_type int,
    OUT p_comm_date int,
    OUT p_comm_time int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_opor int,
    OUT p_comm_executor int,
    OUT p_comm_dir int,
    OUT p_comm_limit_price decimal(16,9),
    OUT p_limit_actual_price decimal(16,9),
    OUT p_comm_qty decimal(18,2),
    OUT p_comm_amt decimal(18,4),
    OUT p_order_qty decimal(18,2),
    OUT p_comm_cancel_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_comm_frozen_amt decimal(18,4),
    OUT p_comm_frozen_qty decimal(18,2),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_strike_status varchar(2),
    OUT p_comm_status varchar(2),
    OUT p_comm_begin_date int,
    OUT p_comm_end_date int,
    OUT p_comm_begin_time int,
    OUT p_comm_end_time int,
    OUT p_comm_comple_date int,
    OUT p_comm_comple_time int,
    OUT p_comm_appr_date int,
    OUT p_comm_appr_time int,
    OUT p_comm_appr_status varchar(2),
    OUT p_comm_appr_oper_no int,
    OUT p_comm_appr_oper int,
    OUT p_comm_appr_remark varchar(255),
    OUT p_external_no bigint,
    OUT p_comb_code varchar(6),
    OUT p_comm_oper_way varchar(2),
    OUT p_remark_info varchar(255),
    OUT p_update_times int,
    OUT p_oper_func_code varchar(16),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
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
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_type = 0;
    SET v_asset_type = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_comm_executor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_strike_status = "0";
    SET v_comm_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_status = " ";
    SET v_comm_appr_oper_no = 0;
    SET v_comm_appr_oper = 0;
    SET v_comm_appr_remark = " ";
    SET v_external_no = 0;
    SET v_comb_code = " ";
    SET v_comm_oper_way = " ";
    SET v_remark_info = " ";
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_rece_margin = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易期货_指令_循环锁定获取指令】*/
    call db_tdfutu.pra_tdfuap_LoopLockGetComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_error_code,
        v_error_info,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_crncy_type,
        v_exch_no,
        v_futu_acco_no,
        v_contrc_code_no,
        v_contrc_code,
        v_contrc_type,
        v_asset_type,
        v_contrc_dir,
        v_hedge_type,
        v_comm_date,
        v_comm_time,
        v_comm_id,
        v_comm_batch_no,
        v_comm_opor,
        v_comm_executor,
        v_comm_dir,
        v_comm_limit_price,
        v_limit_actual_price,
        v_comm_qty,
        v_comm_amt,
        v_order_qty,
        v_comm_cancel_qty,
        v_strike_amt,
        v_strike_qty,
        v_comm_frozen_amt,
        v_comm_frozen_qty,
        v_capit_reback_days,
        v_posi_reback_days,
        v_strike_status,
        v_comm_status,
        v_comm_begin_date,
        v_comm_end_date,
        v_comm_begin_time,
        v_comm_end_time,
        v_comm_comple_date,
        v_comm_comple_time,
        v_comm_appr_date,
        v_comm_appr_time,
        v_comm_appr_status,
        v_comm_appr_oper_no,
        v_comm_appr_oper,
        v_comm_appr_remark,
        v_external_no,
        v_comb_code,
        v_comm_oper_way,
        v_remark_info,
        v_update_times,
        v_oper_func_code,
        v_pass_no,
        v_out_acco,
        v_rece_margin);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.3.17.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_循环锁定获取指令出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_code = v_contrc_code;
    SET p_contrc_type = v_contrc_type;
    SET p_asset_type = v_asset_type;
    SET p_contrc_dir = v_contrc_dir;
    SET p_hedge_type = v_hedge_type;
    SET p_comm_date = v_comm_date;
    SET p_comm_time = v_comm_time;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_opor = v_comm_opor;
    SET p_comm_executor = v_comm_executor;
    SET p_comm_dir = v_comm_dir;
    SET p_comm_limit_price = v_comm_limit_price;
    SET p_limit_actual_price = v_limit_actual_price;
    SET p_comm_qty = v_comm_qty;
    SET p_comm_amt = v_comm_amt;
    SET p_order_qty = v_order_qty;
    SET p_comm_cancel_qty = v_comm_cancel_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_comm_frozen_amt = v_comm_frozen_amt;
    SET p_comm_frozen_qty = v_comm_frozen_qty;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_strike_status = v_strike_status;
    SET p_comm_status = v_comm_status;
    SET p_comm_begin_date = v_comm_begin_date;
    SET p_comm_end_date = v_comm_end_date;
    SET p_comm_begin_time = v_comm_begin_time;
    SET p_comm_end_time = v_comm_end_time;
    SET p_comm_comple_date = v_comm_comple_date;
    SET p_comm_comple_time = v_comm_comple_time;
    SET p_comm_appr_date = v_comm_appr_date;
    SET p_comm_appr_time = v_comm_appr_time;
    SET p_comm_appr_status = v_comm_appr_status;
    SET p_comm_appr_oper_no = v_comm_appr_oper_no;
    SET p_comm_appr_oper = v_comm_appr_oper;
    SET p_comm_appr_remark = v_comm_appr_remark;
    SET p_external_no = v_external_no;
    SET p_comb_code = v_comb_code;
    SET p_comm_oper_way = v_comm_oper_way;
    SET p_remark_info = v_remark_info;
    SET p_update_times = v_update_times;
    SET p_oper_func_code = v_oper_func_code;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_rece_margin = v_rece_margin;

END;;


