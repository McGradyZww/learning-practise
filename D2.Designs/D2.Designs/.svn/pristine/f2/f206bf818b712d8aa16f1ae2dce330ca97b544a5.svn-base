DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_公用_数据归历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfupb_DataToHis;;
DELIMITER ;;
CREATE PROCEDURE pra_clfupb_DataToHis(
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
    

    /* [数据归历史][清算期货_公用_处理错误信息表][字段][{初始化日期}<=@初始化日期#][11][@初始化日期#] */
    insert into db_clfutu_his.tb_clfupb_deal_error_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        busi_func_code, log_error_code, log_error_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        busi_func_code, log_error_code, log_error_info 
        from db_clfutu.tb_clfupb_deal_error 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.1.21.11";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算期货_公用_处理错误信息表][{初始化日期}<=@初始化日期#][12][@初始化日期#] */
    delete from db_clfutu.tb_clfupb_deal_error 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clfutuA.1.21.12";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算期货_公用_处理流程统计表][字段][{初始化日期}<=@初始化日期#][13][@初始化日期#] */
    insert into db_clfutu_his.tb_clfupb_flow_total_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        exch_no, sett_flow_step, total_count, total_amt, 
        total_succ_count, total_succ_amt, total_fail_count, total_fail_amt) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        exch_no, sett_flow_step, total_count, total_amt, 
        total_succ_count, total_succ_amt, total_fail_count, total_fail_amt 
        from db_clfutu.tb_clfupb_flow_total 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.1.21.13";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算期货_公用_处理流程统计表][{初始化日期}<=@初始化日期#][14][@初始化日期#] */
    delete from db_clfutu.tb_clfupb_flow_total 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clfutuA.1.21.14";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算期货_清算_平仓明细表][字段][{成交日期} <= @初始化日期#][21][@初始化日期#] */
    insert into db_clfutu_his.tb_clfucl_close_detail_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, strike_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco_no, 
        contrc_code_no, contrc_type, order_dir, contrc_dir, 
        hedge_type, strike_price, strike_qty, avail_closed_posi_qty, 
        today_posi_flag, link_row_id) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, strike_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco_no, 
        contrc_code_no, contrc_type, order_dir, contrc_dir, 
        hedge_type, strike_price, strike_qty, avail_closed_posi_qty, 
        today_posi_flag, link_row_id 
        from db_clfutu.tb_clfucl_close_detail 
        where strike_date <= v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.1.21.21";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算期货_清算_平仓明细表][{成交日期}<=@初始化日期#][22][@初始化日期#] */
    delete from db_clfutu.tb_clfucl_close_detail 
        where strike_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clfutuA.1.21.22";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算期货_清算_订单表][字段][{初始化日期} <= @初始化日期#][23][@初始化日期#] */
    insert into db_clfutu_his.tb_clfucl_order_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, comm_id, order_date, 
        order_time, order_no, order_batch_no, report_date, 
        report_time, report_no, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, wtdraw_qty, 
        strike_amt, strike_qty, report_fee, wtdraw_fee, 
        order_status, deal_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, comm_id, order_date, 
        order_time, order_no, order_batch_no, report_date, 
        report_time, report_no, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, wtdraw_qty, 
        strike_amt, strike_qty, report_fee, wtdraw_fee, 
        order_status, deal_flag 
        from db_clfutu.tb_clfucl_order 
        where init_date <= v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.1.21.23";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算期货_清算_订单表][{初始化日期} <= @初始化日期#][24][@初始化日期#] */
    delete from db_clfutu.tb_clfucl_order 
        where init_date <= v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clfutuA.1.21.24";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算期货_清算_成交表][字段][{初始化日期}<=@初始化日期# and {成交日期}<=@初始化日期#][25][@初始化日期#] */
    insert into db_clfutu_his.tb_clfucl_out_busi_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_code, contrc_type, contrc_unit, strike_date, 
        strike_time, strike_no, report_date, report_time, 
        report_no, order_date, order_time, order_no, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, strike_price, strike_qty, strike_amt, 
        rece_margin, report_fee, wtdraw_fee, deli_fee, 
        service_fee, other_fee, trade_commis, other_commis, 
        out_report_fee, out_cancel_fee, out_deli_fee, out_service_fee, 
        out_other_fee, out_brkage_commis, out_other_commis, capit_reback_days, 
        posi_reback_days, clear_entry_type, comb_code, deal_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_code, contrc_type, contrc_unit, strike_date, 
        strike_time, strike_no, report_date, report_time, 
        report_no, order_date, order_time, order_no, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, strike_price, strike_qty, strike_amt, 
        rece_margin, report_fee, wtdraw_fee, deli_fee, 
        service_fee, other_fee, trade_commis, other_commis, 
        out_report_fee, out_cancel_fee, out_deli_fee, out_service_fee, 
        out_other_fee, out_brkage_commis, out_other_commis, capit_reback_days, 
        posi_reback_days, clear_entry_type, comb_code, deal_flag 
        from db_clfutu.tb_clfucl_out_busi 
        where init_date<=v_init_date and strike_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.1.21.25";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算期货_清算_成交表][{初始化日期}<=@初始化日期# and {成交日期}<=@初始化日期#][26][@初始化日期#] */
    delete from db_clfutu.tb_clfucl_out_busi 
        where init_date<=v_init_date and strike_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clfutuA.1.21.26";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算期货_清算_待入账记录表][字段][{初始化日期}<=@初始化日期#][27][@初始化日期#] */
    insert into db_clfutu_his.tb_clfucl_pre_entry_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, strike_date, strike_time, 
        strike_no, report_date, report_time, report_no, 
        order_date, order_time, order_no, order_dir, 
        contrc_dir, lngsht_type, hedge_type, order_price, 
        order_qty, pre_settle_price, sett_price, strike_price, 
        strike_qty, strike_amt, strike_num, pre_entry_qty, 
        pre_entry_amt, rece_margin, comb_code, sett_close_pandl, 
        all_fee, report_fee, wtdraw_fee, deli_fee, 
        service_fee, other_fee, trade_commis, other_commis, 
        out_all_fee, out_report_fee, out_cancel_fee, out_deli_fee, 
        out_service_fee, out_other_fee, out_brkage_commis, out_other_commis, 
        busi_flag, entry_status, undo_status, entry_money_jour_no, 
        entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no, open_amount) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, strike_date, strike_time, 
        strike_no, report_date, report_time, report_no, 
        order_date, order_time, order_no, order_dir, 
        contrc_dir, lngsht_type, hedge_type, order_price, 
        order_qty, pre_settle_price, sett_price, strike_price, 
        strike_qty, strike_amt, strike_num, pre_entry_qty, 
        pre_entry_amt, rece_margin, comb_code, sett_close_pandl, 
        all_fee, report_fee, wtdraw_fee, deli_fee, 
        service_fee, other_fee, trade_commis, other_commis, 
        out_all_fee, out_report_fee, out_cancel_fee, out_deli_fee, 
        out_service_fee, out_other_fee, out_brkage_commis, out_other_commis, 
        busi_flag, entry_status, undo_status, entry_money_jour_no, 
        entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no, open_amount 
        from db_clfutu.tb_clfucl_pre_entry 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.1.21.27";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算期货_清算_待入账记录表][{初始化日期}<=@初始化日期#][28][@初始化日期#] */
    delete from db_clfutu.tb_clfucl_pre_entry 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clfutuA.1.21.28";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算期货_清算_入账异常表][字段][{初始化日期}<=@初始化日期#][29][@初始化日期#] */
    insert into db_clfutu_his.tb_clfucl_entry_error_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, strike_date, strike_time, 
        strike_no, report_date, report_time, report_no, 
        order_date, order_time, order_no, order_dir, 
        contrc_dir, lngsht_type, hedge_type, order_price, 
        order_qty, pre_settle_price, sett_price, strike_price, 
        strike_qty, strike_amt, strike_num, pre_entry_qty, 
        pre_entry_amt, rece_margin, comb_code, comb_type, 
        comb_name, long_hold_margin, short_hold_margin, sett_capt_margin, 
        sett_close_pandl, sett_marked_pandl, sett_close_pandl_today, all_fee, 
        report_fee, wtdraw_fee, deli_fee, service_fee, 
        other_fee, trade_commis, other_commis, out_all_fee, 
        out_report_fee, out_cancel_fee, out_deli_fee, out_service_fee, 
        out_other_fee, out_brkage_commis, out_other_commis, busi_flag, 
        undo_error_no, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, strike_date, strike_time, 
        strike_no, report_date, report_time, report_no, 
        order_date, order_time, order_no, order_dir, 
        contrc_dir, lngsht_type, hedge_type, order_price, 
        order_qty, pre_settle_price, sett_price, strike_price, 
        strike_qty, strike_amt, strike_num, pre_entry_qty, 
        pre_entry_amt, rece_margin, comb_code, comb_type, 
        comb_name, long_hold_margin, short_hold_margin, sett_capt_margin, 
        sett_close_pandl, sett_marked_pandl, sett_close_pandl_today, all_fee, 
        report_fee, wtdraw_fee, deli_fee, service_fee, 
        other_fee, trade_commis, other_commis, out_all_fee, 
        out_report_fee, out_cancel_fee, out_deli_fee, out_service_fee, 
        out_other_fee, out_brkage_commis, out_other_commis, busi_flag, 
        undo_error_no, remark_info 
        from db_clfutu.tb_clfucl_entry_error 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.1.21.29";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算期货_清算_入账异常表][{初始化日期}<=@初始化日期#][30][@初始化日期#] */
    delete from db_clfutu.tb_clfucl_entry_error 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clfutuA.1.21.30";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算期货_清算_持仓表][字段][{初始化日期}<=@初始化日期#][33][@初始化日期#] */
    insert into db_clfutu_his.tb_clfucl_posi_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, margin_pref, comb_code, lngsht_type, 
        hedge_type, curr_qty, contrc_unit, posi_amt, 
        pre_settle_price, sett_price, rece_margin, sett_flag, 
        deliv_flag, open_amount) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, margin_pref, comb_code, lngsht_type, 
        hedge_type, curr_qty, contrc_unit, posi_amt, 
        pre_settle_price, sett_price, rece_margin, sett_flag, 
        deliv_flag, open_amount 
        from db_clfutu.tb_clfucl_posi 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.1.21.33";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算期货_清算_持仓表][{初始化日期}<=@初始化日期#][34][@初始化日期#] */
    delete from db_clfutu.tb_clfucl_posi 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clfutuA.1.21.34";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算期货_清算_持仓明细表][字段][{初始化日期}<=@初始化日期#][35][@初始化日期#] */
    insert into db_clfutu_his.tb_clfucl_posi_detail_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        strike_date, strike_time, strike_no, co_no, 
        pd_no, exch_group_no, asset_acco_no, crncy_type, 
        exch_no, futu_acco_no, contrc_code_no, lngsht_type, 
        hedge_type, contrc_unit, open_posi_price, open_posi_qty, 
        close_posi_qty, open_amount) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        strike_date, strike_time, strike_no, co_no, 
        pd_no, exch_group_no, asset_acco_no, crncy_type, 
        exch_no, futu_acco_no, contrc_code_no, lngsht_type, 
        hedge_type, contrc_unit, open_posi_price, open_posi_qty, 
        close_posi_qty, open_amount 
        from db_clfutu.tb_clfucl_posi_detail 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.1.21.35";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算期货_清算_持仓明细表][{初始化日期}<=@初始化日期#][36][@初始化日期#] */
    delete from db_clfutu.tb_clfucl_posi_detail 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clfutuA.1.21.36";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算期货_结算_待入账记录表][字段][{初始化日期}<=@初始化日期#][41][@初始化日期#] */
    insert into db_clfutu_his.tb_clfust_pre_entry_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, lngsht_type, curr_qty, 
        hedge_type, pre_settle_price, sett_price, pre_entry_qty, 
        pre_entry_amt, busi_flag, entry_status, undo_status, 
        entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, lngsht_type, curr_qty, 
        hedge_type, pre_settle_price, sett_price, pre_entry_qty, 
        pre_entry_amt, busi_flag, entry_status, undo_status, 
        entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no 
        from db_clfutu.tb_clfust_pre_entry 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.1.21.41";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算期货_结算_待入账记录表][{初始化日期}<=@初始化日期#][42][@初始化日期#] */
    delete from db_clfutu.tb_clfust_pre_entry 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clfutuA.1.21.42";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算期货_清算_处理异常记录表][字段][{初始化日期}<=@初始化日期#][31][@初始化日期#] */
    insert into db_clfutu_his.tb_clfucl_exception_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        deal_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        deal_info 
        from db_clfutu.tb_clfucl_exception 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.1.21.31";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算期货_清算_处理异常记录表][{初始化日期}<=@初始化日期#][32][@初始化日期#] */
    delete from db_clfutu.tb_clfucl_exception 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clfutuA.1.21.32";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


