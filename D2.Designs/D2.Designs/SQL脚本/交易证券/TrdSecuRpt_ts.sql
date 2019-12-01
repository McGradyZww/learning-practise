DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_处理订单回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_DealOrderRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_DealOrderRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_rsp_info varchar(255),
    IN p_order_rsp_status varchar(2),
    IN p_price_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_busi_opor_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_acco_no int,
    OUT p_external_no bigint,
    OUT p_exch_crncy_type varchar(3),
    OUT p_comm_date int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_order_time int,
    OUT p_stock_type int,
    OUT p_net_price_flag int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_order_batch_no int,
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_order_oper_way varchar(2),
    OUT p_old_order_status varchar(2),
    OUT p_row_id bigint,
    OUT p_combo_code varchar(32),
    OUT p_combo_posi_id bigint,
    OUT p_strategy_id bigint,
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_rsp_info varchar(255);
    declare v_order_rsp_status varchar(2);
    declare v_price_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_busi_opor_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_acco_no int;
    declare v_external_no bigint;
    declare v_exch_crncy_type varchar(3);
    declare v_comm_date int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_order_time int;
    declare v_stock_type int;
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_order_batch_no int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_old_order_status varchar(2);
    declare v_row_id bigint;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_strategy_id bigint;
    declare v_update_times int;
    declare v_rsp_id bigint;
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_asset_type int;
    declare v_comm_opor int;
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_intrst_days int;
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_exter_comm_flag int;
    declare v_target_stock_code_no int;
    declare v_comm_cancel_qty decimal(18,2);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_comm_oper_way varchar(2);
    declare v_comm_dir int;
    declare v_comm_amt decimal(18,4);
    declare v_combo_status varchar(2);
    declare v_comm_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_total_strike_qty decimal(18,2);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_avail_cal_flag int;
    declare v_open_posi_date int;
    declare v_tmp_wtdraw_qty decimal(18,2);
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_rsp_info = p_rsp_info;
    SET v_order_rsp_status = p_order_rsp_status;
    SET v_price_type = p_price_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_busi_opor_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_acco_no = 0;
    SET v_external_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_stock_type = 0;
    SET v_net_price_flag = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_order_status = "0";
    SET v_order_batch_no = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_order_oper_way = " ";
    SET v_old_order_status = "0";
    SET v_row_id = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_strategy_id = 0;
    SET v_update_times = 1;
    SET v_rsp_id = 0;
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_asset_type = 0;
    SET v_comm_opor = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_intrst_days = 0;
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_exter_comm_flag = 0;
    SET v_target_stock_code_no = 0;
    SET v_comm_cancel_qty = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_status = "0";
    SET v_comm_oper_way = " ";
    SET v_comm_dir = 0;
    SET v_comm_amt = 0;
    SET v_combo_status = "0";
    SET v_comm_qty = 0;
    SET v_calc_dir = 1;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_total_strike_qty = 0;
    SET v_all_wtdraw_qty = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_avail_cal_flag = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_wtdraw_qty = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    
    #检查重复回报，如不重复，则插入表记录

    /* if @申报日期# = 0 then */
    if v_report_date = 0 then

        /* set @申报日期# = @初始化日期#; */
        set v_report_date = v_init_date;
    end if;

    /* if @申报时间# = 0 then */
    if v_report_time = 0 then

        /* [获取机器时间][@申报时间#] */
        select date_format(curtime(),'%H%i%s') into v_report_time;

    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_报盘_检查订单重复回报】*/
        call db_tdsecu.pra_tdserp_CheckOrderRspDup(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pass_no,
            v_out_acco,
            v_exch_no,
            v_stock_acco,
            v_stock_code,
            v_report_date,
            v_report_time,
            v_report_no,
            v_rsp_info,
            v_order_rsp_status,
            v_price_type,
            v_order_id,
            v_error_code,
            v_error_info,
            v_rsp_id,
            v_row_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_检查订单重复回报出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;

    /* [事务开始] */
    START TRANSACTION;


        /* if @订单回报状态# = 《订单回报状态-已报废单》 then */
        if v_order_rsp_status = "3" then

            /* set @订单序号# = @记录序号#; */
            set v_order_id = v_row_id;
        end if;
        #获取原订单信息

        /* 调用【原子_交易证券_交易_锁定获取订单回报订单信息】*/
        call db_tdsecu.pra_tdsetd_LockGetRspOrder(
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
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_crncy_type,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_external_no,
            v_comm_id,
            v_comm_batch_no,
            v_comm_opor,
            v_order_date,
            v_order_time,
            v_order_batch_no,
            v_order_dir,
            v_price_type,
            v_order_price,
            v_order_qty,
            v_order_status,
            v_wtdraw_qty,
            v_strike_amt,
            v_strike_qty,
            v_strike_bond_accr_intrst,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_net_price_flag,
            v_intrst_days,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_compli_trig_id,
            v_remark_info,
            v_order_oper_way,
            v_exter_comm_flag,
            v_busi_opor_no,
            v_combo_code,
            v_combo_posi_id,
            v_strategy_id,
            v_target_stock_code_no,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_锁定获取订单回报订单信息出现错误！',v_mysql_message);
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
            SET v_error_code = "tdsecuT.5.1.769";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单状态=",v_order_status,",","成交数量=",v_strike_qty),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单状态=",v_order_status,",","成交数量=",v_strike_qty);
            end if;
            leave label_pro;
        end if;

        #已撤、部撤、已成 不允许处理订单回报  modify by wjp 20190329

         /* [检查报错返回][@订单状态# =《订单状态-已撤》  or @订单状态#=《订单状态-部撤》 or @订单状态#=《订单状态-已成》][751][concat(" 该订单不允许再处理订单回报,订单序号:",@订单序号#,"|订单状态:",@订单状态#)] */
         if v_order_status ="4"  or v_order_status="7" or v_order_status="6" then
             ROLLBACK;
             SET v_error_code = "tdsecuT.5.1.751";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat(" 该订单不允许再处理订单回报,订单序号:",v_order_id,"|订单状态:",v_order_status),"#",v_mysql_message);
             else
                 SET v_error_info = concat(" 该订单不允许再处理订单回报,订单序号:",v_order_id,"|订单状态:",v_order_status);
             end if;
             leave label_pro;
         end if;


        /* set @原订单状态# = @订单状态#; */
        set v_old_order_status = v_order_status;

        /* if @订单回报状态# = 《订单回报状态-已报》 then */
        if v_order_rsp_status = "1" then
            #正常回报处理逻辑

            /* set @订单状态# = 《订单状态-已报》; */
            set v_order_status = "2";

            /* set @撤单数量# = 0; */
            set v_wtdraw_qty = 0;

            /* 调用【原子_交易证券_报盘_更新订单回报记录】*/
            call db_tdsecu.pra_tdserp_UpdateOrderRsp(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_order_id,
                v_rsp_id,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_report_date,
                v_report_time,
                v_report_no,
                v_all_fee,
                v_wtdraw_qty,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_order_status,
                v_rsp_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_更新订单回报记录出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        else
            #废单回报处理逻辑

            /* [检查报错返回][(@订单状态# = 《订单状态-废单》and @订单操作方式# <> 《订单操作方式-报盘机补单》) or (@订单状态# = 《订单状态-废单》and @订单操作方式# = 《订单操作方式-报盘机补单》and @订单数量# = @撤单数量#) or @订单状态#=《订单状态-已撤》][752][@订单序号#] */
            if (v_order_status = "8"and v_order_oper_way <> "33") or (v_order_status = "8"and v_order_oper_way = "33"and v_order_qty = v_wtdraw_qty) or v_order_status="4" then
                ROLLBACK;
                SET v_error_code = "tdsecuT.5.1.752";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单序号=",v_order_id);
                end if;
                leave label_pro;
            end if;


            /* set @撤单数量# = @订单数量#; */
            set v_wtdraw_qty = v_order_qty;
            #如果是指令订单，更新指令表

            /* if @指令序号# > 0 then */
            if v_comm_id > 0 then

                /* set @指令撤销数量# = 0; */
                set v_comm_cancel_qty = 0;

                /* 调用【原子_交易证券_指令_撤销更新指令】*/
                call db_tdsecu.pra_tdseap_CancelUpdateComm(
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
                    v_comm_executor,
                    v_comm_oper_way,
                    v_comm_dir,
                    v_comm_amt);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.1.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销更新指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* if @组合代码# <> ' ' then */
                if v_combo_code <> ' ' then

                    /* 调用【原子_交易证券_账户_获取组合异常状态】*/
                    call db_tdsecu.pra_tdseac_GetComboUnusualStatus(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_comm_oper_way,
                        v_comm_dir,
                        v_error_code,
                        v_error_info,
                        v_combo_status);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.5.1.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_获取组合异常状态出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;


                    /* 调用【原子_交易证券_账户_处理组合状态】*/
                    call db_tdsecu.pra_tdseac_DealComboStatus(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_co_no,
                        v_comm_batch_no,
                        v_combo_status,
                        v_error_code,
                        v_error_info);
                    if v_error_code = "1" then
                        SET v_error_code = "tdsecuT.5.1.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_处理组合状态出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;

                end if;
                #计算指令变动金额

                /* set @指令方向# = @订单方向#; */
                set v_comm_dir = v_order_dir;

                /* set @指令数量# = @撤单数量#; */
                set v_comm_qty = v_wtdraw_qty;

                /* set @计算方向# = 《计算方向-加上》; */
                set v_calc_dir = 1;

                /* 调用【原子_交易证券_公用_计算撤单指令变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetCancelCommOccurAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_comm_dir,
                    v_limit_actual_price,
                    v_wtdraw_qty,
                    v_comm_status,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_calc_dir,
                    v_error_code,
                    v_error_info,
                    v_comm_occur_amt,
                    v_comm_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.1.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算撤单指令变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            end if;

            /* set @总成交数量# = 0; */
            set v_total_strike_qty = 0;

            /* set @总撤单数量# = @撤单数量#; */
            set v_all_wtdraw_qty = v_wtdraw_qty;

            /* 调用【原子_交易证券_公用_计算撤单交易变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetCancelExchChangeAmtAndQty(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_stock_type,
                v_order_dir,
                v_order_qty,
                v_order_price,
                v_order_frozen_amt,
                v_wtdraw_qty,
                v_total_strike_qty,
                v_all_wtdraw_qty,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_error_code,
                v_error_info,
                v_trade_occur_amt,
                v_trade_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算撤单交易变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #更新订单数据

            /* set @订单状态# = 《订单状态-废单》 ; */
            set v_order_status = "8" ;

            /* set @全部费用#= 0; */
            set v_all_fee= 0;

            /* set @订单冻结金额# = 0; */
            set v_order_frozen_amt = 0;

            /* set @订单冻结数量# = 0; */
            set v_order_frozen_qty = 0;

            /* 调用【原子_交易证券_报盘_更新订单回报记录】*/
            call db_tdsecu.pra_tdserp_UpdateOrderRsp(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_order_id,
                v_rsp_id,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_report_date,
                v_report_time,
                v_report_no,
                v_all_fee,
                v_wtdraw_qty,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_order_status,
                v_rsp_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_更新订单回报记录出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #处理订单资金持仓数据，保护指令变动和交易的变动

            /* set @可用计算标志# = 0; */
            set v_avail_cal_flag = 0;

            /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
            call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
                v_exch_crncy_type,
                v_comm_id,
                v_order_id,
                v_exch_no,
                v_stock_code,
                v_stock_type,
                v_asset_type,
                v_order_dir,
                v_impawn_ratio,
                v_stock_acco_no,
                v_stock_code_no,
                v_trade_code_no,
                v_target_code_no,
                v_comm_occur_amt,
                v_comm_occur_qty,
                v_trade_occur_amt,
                v_trade_occur_qty,
                v_is_record_jour,
                v_order_oper_way,
                v_busi_opor_no,
                v_open_close_permission,
                v_avail_cal_flag,
                v_combo_code,
                v_combo_posi_id,
                v_target_stock_code_no,
                v_error_code,
                v_error_info,
                v_open_posi_date);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
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


    /* set @更新次数# = @更新次数# + 1; */
    set v_update_times = v_update_times + 1;

    /* set @临时_撤单数量# = @撤单数量#; */
    set v_tmp_wtdraw_qty = v_wtdraw_qty;

    /* [事务开始] */
    START TRANSACTION;


        /* if @订单状态# = 《订单状态-废单》 then */
        if v_order_status = "8" then

            /* set @废单数量# = @撤单数量#; */
            set v_waste_qty = v_wtdraw_qty;
        end if;

        /* set @撤单数量# = 0; */
        set v_wtdraw_qty = 0;

        /* 调用【原子_交易证券_交易_撤单处理汇总订单】*/
        call db_tdsecu.pra_tdsetd_CancelDealSumOrder(
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
            SET v_error_code = "tdsecuT.5.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤单处理汇总订单出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @撤单数量# = @临时_撤单数量#; */
    set v_wtdraw_qty = v_tmp_wtdraw_qty;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_external_no = v_external_no;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_comm_date = v_comm_date;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_order_time = v_order_time;
    SET p_stock_type = v_stock_type;
    SET p_net_price_flag = v_net_price_flag;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_order_status = v_order_status;
    SET p_order_batch_no = v_order_batch_no;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_order_oper_way = v_order_oper_way;
    SET p_old_order_status = v_old_order_status;
    SET p_row_id = v_row_id;
    SET p_combo_code = v_combo_code;
    SET p_combo_posi_id = v_combo_posi_id;
    SET p_strategy_id = v_strategy_id;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_处理撤单回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_DealWithdrawRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_DealWithdrawRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_wtdraw_qty decimal(18,2),
    IN p_order_id bigint,
    IN p_rsp_status varchar(2),
    IN p_rsp_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_busi_opor_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_stock_type int,
    OUT p_external_no bigint,
    OUT p_exch_crncy_type varchar(3),
    OUT p_comm_date int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_comm_opor int,
    OUT p_order_date int,
    OUT p_order_batch_no int,
    OUT p_order_dir int,
    OUT p_price_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_wtdraw_status varchar(2),
    OUT p_old_order_status varchar(2),
    OUT p_combo_code varchar(32),
    OUT p_combo_posi_id bigint,
    OUT p_open_posi_date int,
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
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_order_id bigint;
    declare v_rsp_status varchar(2);
    declare v_rsp_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_busi_opor_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_external_no bigint;
    declare v_exch_crncy_type varchar(3);
    declare v_comm_date int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_comm_opor int;
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_wtdraw_status varchar(2);
    declare v_old_order_status varchar(2);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_open_posi_date int;
    declare v_update_times int;
    declare v_tmp_wtdraw_qty decimal(18,2);
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_asset_type int;
    declare v_order_time int;
    declare v_bond_rate_type int;
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_strategy_id bigint;
    declare v_target_stock_code_no int;
    declare v_trade_acco varchar(32);
    declare v_total_strike_qty decimal(18,2);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_wtdraw_remark varchar(255);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_deal_status varchar(2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_comm_oper_way varchar(2);
    declare v_comm_dir int;
    declare v_comm_amt decimal(18,4);
    declare v_calc_dir int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_avail_cal_flag int;
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
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_order_id = p_order_id;
    SET v_rsp_status = p_rsp_status;
    SET v_rsp_info = p_rsp_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_busi_opor_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_external_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_comm_opor = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_batch_no = 0;
    SET v_order_dir = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_status = "0";
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_impawn_ratio = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_wtdraw_status = "0";
    SET v_old_order_status = "0";
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_update_times = 1;
    SET v_tmp_wtdraw_qty = 0;
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_asset_type = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_bond_rate_type = 0;
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_order_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_strategy_id = 0;
    SET v_target_stock_code_no = 0;
    SET v_trade_acco = " ";
    SET v_total_strike_qty = 0;
    SET v_all_wtdraw_qty = 0;
    SET v_wtdraw_remark = " ";
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_deal_status = "0";
    SET v_comm_cancel_qty = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_status = "0";
    SET v_comm_oper_way = " ";
    SET v_comm_dir = 0;
    SET v_comm_amt = 0;
    SET v_calc_dir = 1;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_avail_cal_flag = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @临时_撤单数量# = @撤单数量#; */
    set v_tmp_wtdraw_qty = v_wtdraw_qty;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;
    #默认失败，成功会改掉

    /* set @撤单状态# = 《撤单状态-失败》; */
    set v_wtdraw_status = "4";

    /* [事务开始] */
    START TRANSACTION;

        #取原委托信息

        /* 调用【原子_交易证券_交易_锁定获取撤单回报订单信息】*/
        call db_tdsecu.pra_tdsetd_LockGetWithdrawOrder(
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
            v_report_date,
            v_report_no,
            v_order_id,
            v_error_code,
            v_error_info,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_crncy_type,
            v_stock_acco,
            v_stock_acco_no,
            v_stock_code,
            v_stock_code_no,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_external_no,
            v_comm_id,
            v_comm_batch_no,
            v_comm_opor,
            v_order_date,
            v_order_time,
            v_order_batch_no,
            v_order_dir,
            v_price_type,
            v_order_price,
            v_order_qty,
            v_order_status,
            v_wtdraw_qty,
            v_strike_amt,
            v_strike_qty,
            v_strike_bond_accr_intrst,
            v_net_price_flag,
            v_intrst_days,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_rsp_info,
            v_compli_trig_id,
            v_remark_info,
            v_order_oper_way,
            v_exter_comm_flag,
            v_busi_opor_no,
            v_combo_code,
            v_combo_posi_id,
            v_strategy_id,
            v_target_stock_code_no,
            v_trade_acco,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_锁定获取撤单回报订单信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @订单方向# = 《订单方向-基金申购》 or @订单方向# = 《订单方向-基金赎回》 or @订单方向# = 《订单方向-基金转换》 then */
        if v_order_dir = 9 or v_order_dir = 10 or v_order_dir = 12 then

            /* set @撤单数量# = @订单数量#; */
            set v_wtdraw_qty = v_order_qty;
        end if;

        /* set @总成交数量# = @成交数量#; */
        set v_total_strike_qty = v_strike_qty;

        /* set @总撤单数量# = @撤单数量#; */
        set v_all_wtdraw_qty = v_wtdraw_qty;

        /* set @原订单状态# = @订单状态#; */
        set v_old_order_status = v_order_status;
        #如果是撤废反馈,直接更新委托状态

        /* if @回报状态# = 《回报状态-失败》 then */
        if v_rsp_status = "2" then

            /* 调用【原子_交易证券_公用_计算订单状态】*/
            call db_tdsecu.pra_tdsepb_CaclOrderStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_order_qty,
                v_wtdraw_qty,
                v_strike_qty,
                v_old_order_status,
                v_error_code,
                v_error_info,
                v_order_status);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.11.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单状态出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* if @订单操作方式# <> 《订单操作方式-报盘机补单》then */
            if v_order_oper_way <> "33"then

              /* 调用【原子_交易证券_交易_更新订单状态】*/
              call db_tdsecu.pra_tdsetd_UpdateOrderStatus(
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
                  v_error_code,
                  v_error_info);
              if v_error_code = "1" then
                  SET v_error_code = "tdsecuT.5.11.999";
                  if v_mysql_message <> "" then
                       SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_更新订单状态出现错误！',v_mysql_message);
                  end if;
                  ROLLBACK;
                  leave label_pro;
              elseif v_error_code <> "0" then
                  ROLLBACK;
                  leave label_pro;
              end if;

            end if;

            /* set @撤单状态# = 《撤单状态-失败》; */
            set v_wtdraw_status = "4";
            #更新撤单表

            /* set @撤单数量# = 0; */
            set v_wtdraw_qty = 0;

            /* set @撤单说明# = @回报信息#; */
            set v_wtdraw_remark = v_rsp_info;

            /* 调用【原子_交易证券_交易_更新撤单状态】*/
            call db_tdsecu.pra_tdsetd_UpdateCancelOrderStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_order_date,
                v_order_id,
                v_wtdraw_status,
                v_wtdraw_qty,
                v_wtdraw_remark,
                v_report_date,
                v_report_time,
                v_init_date,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_pass_no,
                v_out_acco,
                v_exch_crncy_type,
                v_exch_no,
                v_stock_acco_no,
                v_stock_acco,
                v_stock_code_no,
                v_stock_code,
                v_external_no,
                v_report_no,
                v_order_price,
                v_trade_acco,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.11.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_更新撤单状态出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        else
            #委托状态为最终状态的订单不允许再处理, 4-已撤 6-已成 7-部撤 8-废单

            /* [检查报错返回][(@订单状态# = 《订单状态-已撤》 or @订单状态# = 《订单状态-已成》 or @订单状态# = 《订单状态-部撤》 or @订单状态# = 《订单状态-废单》) and @订单操作方式# <> 《订单操作方式-报盘机补单》][717][@订单状态#,@申报编号#] */
            if (v_order_status = "4" or v_order_status = "6" or v_order_status = "7" or v_order_status = "8") and v_order_oper_way <> "33" then
                ROLLBACK;
                SET v_error_code = "tdsecuT.5.11.717";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单状态=",v_order_status,",","申报编号=",v_report_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单状态=",v_order_status,",","申报编号=",v_report_no);
                end if;
                leave label_pro;
            end if;


            /* [检查报错返回][@临时_撤单数量# > @订单数量# - @成交数量# - @撤单数量# ][722][@订单序号#, @订单数量#, @成交数量#, @临时_撤单数量#, @撤单数量#] */
            if v_tmp_wtdraw_qty > v_order_qty - v_strike_qty - v_wtdraw_qty  then
                ROLLBACK;
                SET v_error_code = "tdsecuT.5.11.722";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单序号=",v_order_id,","," 订单数量=", v_order_qty,","," 成交数量=", v_strike_qty,","," 临时_撤单数量=", v_tmp_wtdraw_qty,","," 撤单数量=", v_wtdraw_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单序号=",v_order_id,","," 订单数量=", v_order_qty,","," 成交数量=", v_strike_qty,","," 临时_撤单数量=", v_tmp_wtdraw_qty,","," 撤单数量=", v_wtdraw_qty);
                end if;
                leave label_pro;
            end if;


            /* set @撤单数量# = @临时_撤单数量# + @撤单数量#; */
            set v_wtdraw_qty = v_tmp_wtdraw_qty + v_wtdraw_qty;

            /* 调用【原子_交易证券_公用_计算订单状态】*/
            call db_tdsecu.pra_tdsepb_CaclOrderStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_order_qty,
                v_wtdraw_qty,
                v_strike_qty,
                v_old_order_status,
                v_error_code,
                v_error_info,
                v_order_status);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.11.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单状态出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @总撤单数量# = @撤单数量#; */
            set v_all_wtdraw_qty = v_wtdraw_qty;

            /* set @撤单数量# = @临时_撤单数量#; */
            set v_wtdraw_qty = v_tmp_wtdraw_qty;

            /* 调用【原子_交易证券_公用_计算撤单交易变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetCancelExchChangeAmtAndQty(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_stock_type,
                v_order_dir,
                v_order_qty,
                v_order_price,
                v_order_frozen_amt,
                v_wtdraw_qty,
                v_total_strike_qty,
                v_all_wtdraw_qty,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_error_code,
                v_error_info,
                v_trade_occur_amt,
                v_trade_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.11.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算撤单交易变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @处理状态# = 《处理状态-成功》; */
            set v_deal_status = "1";
            #更新指令表

            /* if @指令序号# > 0 then */
            if v_comm_id > 0 then

                /* set @指令撤销数量# = 0; */
                set v_comm_cancel_qty = 0;

                /* 调用【原子_交易证券_指令_撤销更新指令】*/
                call db_tdsecu.pra_tdseap_CancelUpdateComm(
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
                    v_comm_executor,
                    v_comm_oper_way,
                    v_comm_dir,
                    v_comm_amt);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.11.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销更新指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #计算指令变动金额

                /* set @指令方向# = @订单方向#; */
                set v_comm_dir = v_order_dir;

                /* set @计算方向# = 《计算方向-加上》; */
                set v_calc_dir = 1;

                /* 调用【原子_交易证券_公用_计算撤单指令变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetCancelCommOccurAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_comm_dir,
                    v_limit_actual_price,
                    v_wtdraw_qty,
                    v_comm_status,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_calc_dir,
                    v_error_code,
                    v_error_info,
                    v_comm_occur_amt,
                    v_comm_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.11.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算撤单指令变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            end if;

            /* 调用【原子_交易证券_公用_计算撤单交易变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetCancelExchChangeAmtAndQty(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_stock_type,
                v_order_dir,
                v_order_qty,
                v_order_price,
                v_order_frozen_amt,
                v_wtdraw_qty,
                v_total_strike_qty,
                v_all_wtdraw_qty,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_error_code,
                v_error_info,
                v_trade_occur_amt,
                v_trade_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.11.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算撤单交易变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #更新订单表

            /* if @订单方向# = 《订单方向-卖出》 or @订单方向# = 《订单方向-融资回购》 or @订单方向# = 《订单方向-质押提交》 or @订单方向# = 《订单方向-质押转回》  then */
            if v_order_dir = 2 or v_order_dir = 3 or v_order_dir = 21 or v_order_dir = 22  then

                /* set @订单冻结金额# = 0; */
                set v_order_frozen_amt = 0;
            else

                /* set @订单冻结金额# = @订单冻结金额# + @交易变动金额#; */
                set v_order_frozen_amt = v_order_frozen_amt + v_trade_occur_amt;
            end if;

            /* if @订单方向# = 《订单方向-卖出》 or  @订单方向# = 《订单方向-卖券还款》  then */
            if v_order_dir = 2 or  v_order_dir = 7  then

                /* set @订单冻结数量# = @订单冻结数量# - @临时_撤单数量#; */
                set v_order_frozen_qty = v_order_frozen_qty - v_tmp_wtdraw_qty;
            end if;

            /* 调用【原子_交易证券_交易_更新撤单回报订单记录】*/
            call db_tdsecu.pra_tdsetd_UpdateCancelRspOrder(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_order_date,
                v_order_id,
                v_wtdraw_qty,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_order_status,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.11.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_更新撤单回报订单记录出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #更新撤单表

            /* set @撤单状态# = 《撤单状态-成功》; */
            set v_wtdraw_status = "3";

            /* set @撤单数量# = @临时_撤单数量#; */
            set v_wtdraw_qty = v_tmp_wtdraw_qty;

            /* set @撤单说明# = @回报信息#; */
            set v_wtdraw_remark = v_rsp_info;

            /* 调用【原子_交易证券_交易_更新撤单状态】*/
            call db_tdsecu.pra_tdsetd_UpdateCancelOrderStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_order_date,
                v_order_id,
                v_wtdraw_status,
                v_wtdraw_qty,
                v_wtdraw_remark,
                v_report_date,
                v_report_time,
                v_init_date,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_pass_no,
                v_out_acco,
                v_exch_crncy_type,
                v_exch_no,
                v_stock_acco_no,
                v_stock_acco,
                v_stock_code_no,
                v_stock_code,
                v_external_no,
                v_report_no,
                v_order_price,
                v_trade_acco,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.11.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_更新撤单状态出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #处理订单资金持仓数据，保护指令变动和交易的变动

            /* set @可用计算标志# = 0; */
            set v_avail_cal_flag = 0;

            /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
            call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
                v_exch_crncy_type,
                v_comm_id,
                v_order_id,
                v_exch_no,
                v_stock_code,
                v_stock_type,
                v_asset_type,
                v_order_dir,
                v_impawn_ratio,
                v_stock_acco_no,
                v_stock_code_no,
                v_trade_code_no,
                v_target_code_no,
                v_comm_occur_amt,
                v_comm_occur_qty,
                v_trade_occur_amt,
                v_trade_occur_qty,
                v_is_record_jour,
                v_order_oper_way,
                v_busi_opor_no,
                v_open_close_permission,
                v_avail_cal_flag,
                v_combo_code,
                v_combo_posi_id,
                v_target_stock_code_no,
                v_error_code,
                v_error_info,
                v_open_posi_date);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.11.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

    /* if @撤单数量# > 0 then */
    if v_wtdraw_qty > 0 then

            /* set @废单数量# = 0; */
            set v_waste_qty = 0;

            /* 调用【原子_交易证券_交易_撤单处理汇总订单】*/
            call db_tdsecu.pra_tdsetd_CancelDealSumOrder(
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
                SET v_error_code = "tdsecuT.5.11.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤单处理汇总订单出现错误！',v_mysql_message);
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


    /* set @更新次数# = @更新次数# + 1; */
    set v_update_times = v_update_times + 1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_stock_type = v_stock_type;
    SET p_external_no = v_external_no;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_comm_date = v_comm_date;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_comm_opor = v_comm_opor;
    SET p_order_date = v_order_date;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_dir = v_order_dir;
    SET p_price_type = v_price_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_status = v_order_status;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_wtdraw_status = v_wtdraw_status;
    SET p_old_order_status = v_old_order_status;
    SET p_combo_code = v_combo_code;
    SET p_combo_posi_id = v_combo_posi_id;
    SET p_open_posi_date = v_open_posi_date;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_检查成交回报获取订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_CheckStrikeRspGetOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_CheckStrikeRspGetOrderInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_report_date int,
    IN p_report_no varchar(32),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_deal_type int,
    IN p_rsp_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_original_stock_acco varchar(16),
    OUT p_stock_acco_no int,
    OUT p_original_stock_code varchar(6),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_comm_id bigint,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_id bigint,
    OUT p_order_batch_no int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_original_order_dir int,
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_status varchar(2),
    OUT p_price_type int,
    OUT p_busi_opor_no int,
    OUT p_order_oper_way varchar(2),
    OUT p_rsp_id bigint,
    OUT p_exter_comm_flag int,
    OUT p_external_no bigint,
    OUT p_combo_code varchar(32),
    OUT p_combo_posi_id bigint,
    OUT p_strategy_id bigint,
    OUT p_contra_no varchar(32),
    OUT p_asset_acco_type int,
    OUT p_exist_debt_flag int,
    OUT p_old_strike_qty decimal(18,2)
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
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_deal_type int;
    declare v_rsp_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_original_stock_acco varchar(16);
    declare v_stock_acco_no int;
    declare v_original_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_id bigint;
    declare v_order_batch_no int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_original_order_dir int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_status varchar(2);
    declare v_price_type int;
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_rsp_id bigint;
    declare v_exter_comm_flag int;
    declare v_external_no bigint;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_strategy_id bigint;
    declare v_contra_no varchar(32);
    declare v_asset_acco_type int;
    declare v_exist_debt_flag int;
    declare v_old_strike_qty decimal(18,2);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_mac_addr varchar(32);
    declare v_ip_addr varchar(32);

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
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_deal_type = p_strike_deal_type;
    SET v_rsp_info = p_rsp_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_original_stock_acco = " ";
    SET v_stock_acco_no = 0;
    SET v_original_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_id = 0;
    SET v_order_batch_no = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_original_order_dir = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_status = "0";
    SET v_price_type = 0;
    SET v_busi_opor_no = 0;
    SET v_order_oper_way = " ";
    SET v_rsp_id = 0;
    SET v_exter_comm_flag = 0;
    SET v_external_no = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_strategy_id = 0;
    SET v_contra_no = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;
    SET v_old_strike_qty = 0;
    SET v_tmp_strike_qty = 0;
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_order_dir = 0;
    SET v_mac_addr = " ";
    SET v_ip_addr = " ";

    
    label_pro:BEGIN
    

    /* set @临时_成交数量# = @成交数量#; */
    set v_tmp_strike_qty = v_strike_qty;

    /* 调用【原子_交易证券_交易_获取回报订单信息】*/
    call db_tdsecu.pra_tdsetd_GetRspOrderInfo(
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
        v_report_date,
        v_report_no,
        v_error_code,
        v_error_info,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_stock_acco_no,
        v_stock_acco,
        v_stock_code_no,
        v_stock_code,
        v_stock_type,
        v_asset_type,
        v_comm_id,
        v_order_date,
        v_order_time,
        v_order_id,
        v_order_batch_no,
        v_order_dir,
        v_order_price,
        v_order_qty,
        v_order_frozen_amt,
        v_order_status,
        v_price_type,
        v_busi_opor_no,
        v_order_oper_way,
        v_exter_comm_flag,
        v_external_no,
        v_combo_code,
        v_combo_posi_id,
        v_mac_addr,
        v_ip_addr,
        v_strategy_id,
        v_asset_acco_type,
        v_contra_no,
        v_exist_debt_flag,
        v_strike_qty);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.5.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_获取回报订单信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @原证券代码# = @证券代码#; */
    set v_original_stock_code = v_stock_code;

    /* set @原订单方向# = @订单方向#; */
    set v_original_order_dir = v_order_dir;

    /* set @原股东代码# = @股东代码#; */
    set v_original_stock_acco = v_stock_acco;

    /* set @原成交数量# = @成交数量#; */
    set v_old_strike_qty = v_strike_qty;

    /* set @成交数量# = @临时_成交数量#; */
    set v_strike_qty = v_tmp_strike_qty;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_报盘_检查成交重复回报】*/
        call db_tdsecu.pra_tdserp_CheckStrikeRspDup(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pass_no,
            v_out_acco,
            v_exch_no,
            v_stock_acco,
            v_stock_code,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_no,
            v_order_dir,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_strike_deal_type,
            v_rsp_info,
            v_asset_acco_type,
            v_error_code,
            v_error_info,
            v_rsp_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.20.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_检查成交重复回报出现错误！',v_mysql_message);
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
    SET p_original_stock_acco = v_original_stock_acco;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_original_stock_code = v_original_stock_code;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_comm_id = v_comm_id;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_id = v_order_id;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_original_order_dir = v_original_order_dir;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_status = v_order_status;
    SET p_price_type = v_price_type;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_order_oper_way = v_order_oper_way;
    SET p_rsp_id = v_rsp_id;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_external_no = v_external_no;
    SET p_combo_code = v_combo_code;
    SET p_combo_posi_id = v_combo_posi_id;
    SET p_strategy_id = v_strategy_id;
    SET p_contra_no = v_contra_no;
    SET p_asset_acco_type = v_asset_acco_type;
    SET p_exist_debt_flag = v_exist_debt_flag;
    SET p_old_strike_qty = v_old_strike_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_处理成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_DealStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_DealStrikeRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
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
    IN p_repo_days int,
    IN p_strike_deal_type int,
    IN p_repo_cale_days int,
    IN p_repo_back_date int,
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_exgp_cost_amt decimal(18,4),
    IN p_exgp_intrst_cost_amt decimal(18,4),
    IN p_exgp_curr_qty decimal(18,2),
    IN p_asac_cost_amt decimal(18,4),
    IN p_asac_intrst_cost_amt decimal(18,4),
    IN p_asac_curr_qty decimal(18,2),
    IN p_rsp_id bigint,
    IN p_order_id bigint,
    IN p_sys_config_str varchar(64),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_combo_code varchar(32),
    IN p_combo_posi_id bigint,
    IN p_asset_acco_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_target_code varchar(6),
    OUT p_order_date int,
    OUT p_order_batch_no int,
    OUT p_report_time int,
    OUT p_comm_date int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_external_no bigint,
    OUT p_busi_opor_no int,
    OUT p_order_oper_way varchar(2),
    OUT p_total_strike_amt decimal(18,4),
    OUT p_total_strike_qty decimal(18,2),
    OUT p_cost_calc_type int,
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_update_times int,
    OUT p_trade_occur_amt decimal(18,4),
    OUT p_open_posi_date int,
    OUT p_original_order_dir int
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
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
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
    declare v_repo_days int;
    declare v_strike_deal_type int;
    declare v_repo_cale_days int;
    declare v_repo_back_date int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_curr_qty decimal(18,2);
    declare v_rsp_id bigint;
    declare v_order_id bigint;
    declare v_sys_config_str varchar(64);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_asset_acco_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code varchar(6);
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_report_time int;
    declare v_comm_date int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_external_no bigint;
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_total_strike_amt decimal(18,4);
    declare v_total_strike_qty decimal(18,2);
    declare v_cost_calc_type int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_update_times int;
    declare v_trade_occur_amt decimal(18,4);
    declare v_open_posi_date int;
    declare v_original_order_dir int;
    declare v_tmp_strike_date int;
    declare v_tmp_strike_time int;
    declare v_tmp_strike_no varchar(64);
    declare v_tmp_strike_price decimal(16,9);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_is_record_jour int;
    declare v_strike_fee decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_deal_capital_release_type int;
    declare v_comb_invalid_judge varchar(2);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_opor int;
    declare v_order_time int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_exter_comm_flag int;
    declare v_target_stock_code_no int;
    declare v_old_order_status varchar(2);
    declare v_tmp_strike_bond_accr_intrst decimal(18,4);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_tmp_total_strike_qty decimal(18,2);
    declare v_trade_occur_qty decimal(18,2);
    declare v_repo_order_id bigint;
    declare v_comm_qty decimal(18,2);
    declare v_comm_oper_way varchar(2);
    declare v_comm_strike_qty decimal(18,2);
    declare v_strike_occur_amt decimal(18,4);
    declare v_strike_occur_qty decimal(18,2);
    declare v_repo_strike_id bigint;

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
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
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
    SET v_repo_days = p_repo_days;
    SET v_strike_deal_type = p_strike_deal_type;
    SET v_repo_cale_days = p_repo_cale_days;
    SET v_repo_back_date = p_repo_back_date;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_exgp_cost_amt = p_exgp_cost_amt;
    SET v_exgp_intrst_cost_amt = p_exgp_intrst_cost_amt;
    SET v_exgp_curr_qty = p_exgp_curr_qty;
    SET v_asac_cost_amt = p_asac_cost_amt;
    SET v_asac_intrst_cost_amt = p_asac_intrst_cost_amt;
    SET v_asac_curr_qty = p_asac_curr_qty;
    SET v_rsp_id = p_rsp_id;
    SET v_order_id = p_order_id;
    SET v_sys_config_str = p_sys_config_str;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_combo_code = p_combo_code;
    SET v_combo_posi_id = p_combo_posi_id;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_target_code = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_batch_no = 0;
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_external_no = 0;
    SET v_busi_opor_no = 0;
    SET v_order_oper_way = " ";
    SET v_total_strike_amt = 0;
    SET v_total_strike_qty = 0;
    SET v_cost_calc_type = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_wtdraw_qty = 0;
    SET v_order_status = "0";
    SET v_update_times = 1;
    SET v_trade_occur_amt = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_original_order_dir = 0;
    SET v_tmp_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_strike_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_strike_no = " ";
    SET v_tmp_strike_price = 0;
    SET v_tmp_strike_amt = 0;
    SET v_tmp_strike_qty = 0;
    SET v_is_record_jour = 1;
    SET v_strike_fee = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_deal_capital_release_type = 0;
    SET v_comb_invalid_judge = "0";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_opor = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_exter_comm_flag = 0;
    SET v_target_stock_code_no = 0;
    SET v_old_order_status = "0";
    SET v_tmp_strike_bond_accr_intrst = 0;
    SET v_all_wtdraw_qty = 0;
    SET v_tmp_total_strike_qty = 0;
    SET v_trade_occur_qty = 0;
    SET v_repo_order_id = 0;
    SET v_comm_qty = 0;
    SET v_comm_oper_way = " ";
    SET v_comm_strike_qty = 0;
    SET v_strike_occur_amt = 0;
    SET v_strike_occur_qty = 0;
    SET v_repo_strike_id = 0;

    
    label_pro:BEGIN
    
    #检查重复回报，如不重复，则插入表记录

    /* [事务开始] */
    START TRANSACTION;


        /* if @回报序号# = 0 then */
        if v_rsp_id = 0 then

            /* 调用【原子_交易证券_报盘_检查成交重复回报】*/
            call db_tdsecu.pra_tdserp_CheckStrikeRspDup(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_pass_no,
                v_out_acco,
                v_exch_no,
                v_stock_acco,
                v_stock_code,
                v_strike_date,
                v_strike_time,
                v_strike_no,
                v_report_date,
                v_report_no,
                v_order_dir,
                v_strike_price,
                v_strike_qty,
                v_strike_amt,
                v_strike_deal_type,
                v_rsp_info,
                v_asset_acco_type,
                v_error_code,
                v_error_info,
                v_rsp_id);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.21.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_检查成交重复回报出现错误！',v_mysql_message);
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


    /* set @临时_成交日期# = @成交日期#; */
    set v_tmp_strike_date = v_strike_date;

    /* set @临时_成交时间# = @成交时间#; */
    set v_tmp_strike_time = v_strike_time;

    /* set @临时_成交编号# = @成交编号#; */
    set v_tmp_strike_no = v_strike_no;

    /* set @临时_成交价格# = @成交价格#; */
    set v_tmp_strike_price = v_strike_price;

    /* set @临时_成交金额# = @成交金额#; */
    set v_tmp_strike_amt = v_strike_amt;

    /* set @临时_成交数量# = @成交数量#; */
    set v_tmp_strike_qty = v_strike_qty;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @成交费用# = 0; */
    set v_strike_fee = 0;

    /* set @全部费用# = 0; */
    set v_all_fee = 0;

    /* set @印花税# = 0; */
    set v_stamp_tax = 0;

    /* set @过户费# = 0; */
    set v_trans_fee = 0;

    /* set @经手费# = 0; */
    set v_brkage_fee = 0;

    /* set @证管费# = 0; */
    set v_SEC_charges = 0;

    /* set @其他费用# = 0; */
    set v_other_fee = 0;

    /* set @交易佣金# = 0; */
    set v_trade_commis = 0;

    /* set @其他佣金# = 0; */
    set v_other_commis = 0;

    /* set @交易征费# = 0; */
    set v_trade_tax = 0;

    /* set @交易费# = 0; */
    set v_trade_cost_fee = 0;

    /* set @交易系统使用费# = 0; */
    set v_trade_system_use_fee = 0;

    /* set @股份交收费# = 0; */
    set v_stock_settle_fee = 0;

    /* [事务开始] */
    START TRANSACTION;

        #获取部成资金占用释放方式，支持PB的特殊处理，与券商处理保持一致，影响可用

        /* set @部成资金占用释放方式# = substring(@系统控制配置串#, 3, 1); */
        set v_deal_capital_release_type = substring(v_sys_config_str, 3, 1);

        /* set @组合失效判断# = substring(@系统控制配置串#, 6, 1); */
        set v_comb_invalid_judge = substring(v_sys_config_str, 6, 1);
        #获取原订单信息

        /* 调用【原子_交易证券_交易_锁定获取成交回报订单信息】*/
        call db_tdsecu.pra_tdsetd_LockGetStrikeRspOrder(
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
            v_report_date,
            v_report_no,
            v_order_id,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_crncy_type,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_id,
            v_comm_batch_no,
            v_comm_opor,
            v_external_no,
            v_report_time,
            v_order_batch_no,
            v_order_date,
            v_order_time,
            v_order_dir,
            v_price_type,
            v_order_price,
            v_order_qty,
            v_order_status,
            v_wtdraw_qty,
            v_strike_amt,
            v_strike_qty,
            v_net_price_flag,
            v_intrst_days,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_strike_bond_accr_intrst,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_rsp_info,
            v_compli_trig_id,
            v_remark_info,
            v_busi_opor_no,
            v_exter_comm_flag,
            v_order_oper_way,
            v_cost_calc_type,
            v_target_stock_code_no,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_锁定获取成交回报订单信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @原订单状态# = @订单状态#; */
        set v_old_order_status = v_order_status;

        /* set @原订单方向# = @订单方向#; */
        set v_original_order_dir = v_order_dir;

        /* set @临时_成交债券计提利息# = @成交债券计提利息#; */
        set v_tmp_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
        #先记录总成交数量和总成交金额

        /* set @总成交金额# = @成交金额# + @临时_成交金额#; */
        set v_total_strike_amt = v_strike_amt + v_tmp_strike_amt;

        /* set @总成交数量# = @成交数量# + @临时_成交数量#; */
        set v_total_strike_qty = v_strike_qty + v_tmp_strike_qty;

        /* set @总撤单数量# = @撤单数量#; */
        set v_all_wtdraw_qty = v_wtdraw_qty;

        /* set @临时_总成交数量# = @成交数量# + @临时_成交数量#; */
        set v_tmp_total_strike_qty = v_strike_qty + v_tmp_strike_qty;

        /* [检查报错返回][@总成交数量# + @总撤单数量# > @订单数量#][755][@订单数量#, @总成交数量#, @总撤单数量#, @临时_成交数量#] */
        if v_total_strike_qty + v_all_wtdraw_qty > v_order_qty then
            ROLLBACK;
            SET v_error_code = "tdsecuT.5.21.755";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单数量=",v_order_qty,","," 总成交数量=", v_total_strike_qty,","," 总撤单数量=", v_all_wtdraw_qty,","," 临时_成交数量=", v_tmp_strike_qty),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单数量=",v_order_qty,","," 总成交数量=", v_total_strike_qty,","," 总撤单数量=", v_all_wtdraw_qty,","," 临时_成交数量=", v_tmp_strike_qty);
            end if;
            leave label_pro;
        end if;


        /* set @成交数量# = @临时_成交数量#; */
        set v_strike_qty = v_tmp_strike_qty;

        /* set @成交金额# = @临时_成交金额#; */
        set v_strike_amt = v_tmp_strike_amt;

        /* set @成交价格# = @临时_成交价格#; */
        set v_strike_price = v_tmp_strike_price;

        /* 调用【原子_交易证券_公用_计算成交交易变动金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetStrikeExchChangeAmtAndQty(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_stock_type,
            v_order_dir,
            v_order_qty,
            v_order_price,
            v_order_frozen_amt,
            v_strike_qty,
            v_total_strike_qty,
            v_all_wtdraw_qty,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_deal_capital_release_type,
            v_strike_amt,
            v_error_code,
            v_error_info,
            v_trade_occur_amt,
            v_trade_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算成交交易变动金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @回购委托序号# = @订单序号#; */
        set v_repo_order_id = v_order_id;
        #更新交易系统数据

        /* if @指令序号# > 0 then */
        if v_comm_id > 0 then

            /* 调用【原子_交易证券_指令_成交更新指令】*/
            call db_tdsecu.pra_tdseap_StrikeUpdateComm(
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
                v_sell_ref_rate,
                v_buy_ref_rate,
                v_exch_no,
                v_error_code,
                v_error_info,
                v_comm_date,
                v_comm_batch_no,
                v_comm_executor,
                v_comm_qty,
                v_comm_oper_way,
                v_comm_strike_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.21.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_成交更新指令出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;
        #插入成交表

        /* if @订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-融券回购》  or @订单方向# = 《订单方向-融资买入》  or @订单方向# = 《订单方向-基金申购》 then */
        if v_order_dir = 1 or v_order_dir = 4  or v_order_dir = 5  or v_order_dir = 9 then

            /* set @订单冻结金额# = @订单冻结金额# + @交易变动金额#; */
            set v_order_frozen_amt = v_order_frozen_amt + v_trade_occur_amt;
        else

            /* set @订单冻结金额# = 0; */
            set v_order_frozen_amt = 0;
        end if;

        /* if @订单方向# = 《订单方向-卖出》  or @订单方向# = 《订单方向-基金赎回》 then */
        if v_order_dir = 2  or v_order_dir = 10 then

            /* set @订单冻结数量# = @订单冻结数量# - @成交数量#; */
            set v_order_frozen_qty = v_order_frozen_qty - v_strike_qty;
        else

            /* set @订单冻结数量# = 0; */
            set v_order_frozen_qty = 0;
        end if;

        /* 调用【原子_交易证券_公用_计算成交变动金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetStrikeOccurAmtAndQty(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_stock_type,
            v_order_dir,
            v_strike_qty,
            v_strike_price,
            v_strike_amt,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_all_fee,
            v_error_code,
            v_error_info,
            v_strike_occur_amt,
            v_strike_bond_accr_intrst,
            v_strike_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算成交变动金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #本次成交债券计提利息，成交债券计提利息为合计值
        #set @债券计提利息# = @成交债券计提利息#;

        /* 调用【原子_交易证券_报盘_新增成交】*/
        call db_tdsecu.pra_tdserp_AddStrike(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_busi_opor_no,
            v_init_date,
            v_rsp_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_id,
            v_comm_batch_no,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_id,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_strike_qty,
            v_strike_price,
            v_strike_amt,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_trade_tax,
            v_trade_cost_fee,
            v_trade_system_use_fee,
            v_stock_settle_fee,
            v_net_price_flag,
            v_intrst_days,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_strike_bond_accr_intrst,
            v_order_oper_way,
            v_exter_comm_flag,
            v_order_batch_no,
            v_external_no,
            v_combo_code,
            v_asset_acco_type,
            v_error_code,
            v_error_info,
            v_strike_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_新增成交出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @回购成交序号# = @成交序号#; */
        set v_repo_strike_id = v_strike_id;
        #更新订单表

        /* set @成交数量# = @总成交数量#; */
        set v_strike_qty = v_total_strike_qty;

        /* 调用【原子_交易证券_公用_计算订单状态】*/
        call db_tdsecu.pra_tdsepb_CaclOrderStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_qty,
            v_wtdraw_qty,
            v_strike_qty,
            v_old_order_status,
            v_error_code,
            v_error_info,
            v_order_status);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单状态出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @成交金额# = @总成交金额# ; */
        set v_strike_amt = v_total_strike_amt ;

        /* set @成交债券计提利息# = @成交债券计提利息# + @临时_成交债券计提利息#; */
        set v_strike_bond_accr_intrst = v_strike_bond_accr_intrst + v_tmp_strike_bond_accr_intrst;

        /* 调用【原子_交易证券_交易_更新成交回报订单记录】*/
        call db_tdsecu.pra_tdsetd_UpdateStrikeRspOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_id,
            v_strike_qty,
            v_strike_amt,
            v_wtdraw_qty,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_order_status,
            v_strike_bond_accr_intrst,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_更新成交回报订单记录出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_交易证券_账户_更新成交资金持仓】*/
        call db_tdsecu.pra_tdseac_UpdateStrikeCashPosi(
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
            v_crncy_type,
            v_exch_crncy_type,
            v_order_dir,
            v_comm_id,
            v_strike_id,
            v_exch_no,
            v_stock_code,
            v_stock_acco_no,
            v_stock_code_no,
            v_trade_code_no,
            v_target_code_no,
            v_asset_type,
            v_stock_type,
            v_strike_occur_amt,
            v_strike_occur_qty,
            v_trade_occur_amt,
            v_trade_occur_qty,
            v_impawn_ratio,
            v_repo_order_id,
            v_repo_strike_id,
            v_strike_no,
            v_strike_date,
            v_strike_time,
            v_strike_qty,
            v_strike_price,
            v_strike_amt,
            v_strike_fee,
            v_par_value,
            v_net_price_flag,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_repo_days,
            v_repo_cale_days,
            v_repo_back_date,
            v_capit_reback_days,
            v_posi_reback_days,
            v_is_record_jour,
            v_order_oper_way,
            v_cost_calc_type,
            v_exgp_cost_amt,
            v_exgp_intrst_cost_amt,
            v_exgp_curr_qty,
            v_asac_cost_amt,
            v_asac_intrst_cost_amt,
            v_asac_curr_qty,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_combo_code,
            v_combo_posi_id,
            v_order_date,
            v_target_stock_code_no,
            v_error_code,
            v_error_info,
            v_open_posi_date);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新成交资金持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #更新交易系统数据
        #if @指令序号# > 0 and @组合代码# <>  ' ' and @组合失效判断# <> 《组合失效判断-不判断》 then
        #    #如果参数为通过同批次指令判断，在成交处理和初始化时需要判断同批次指令执行情况
        #    #[原子_交易证券_账户_处理组合失效]
        #    if @指令成交数量# = @指令数量# then
        #        set @组合状态# = 《组合状态-正常》;
        #        if @指令方向# = 《指令方向-基金赎回》 and @指令操作方式# = 《指令操作方式-中泰组合再平衡》 then
        #            set @组合状态# = 《组合状态-再平衡赎回成功》;
        #        elseif @指令方向# = 《指令方向-基金赎回》 and @指令操作方式# = 《指令操作方式-中泰组合补指令》 then
        #            set @组合状态# = 《组合状态-补单赎回成功》;
        #        end if;
        #        [原子_交易证券_账户_处理组合状态]
        #    else
        #        #是否超出有效期
        #        [原子_交易证券_账户_超出期限处理组合状态]
        #    end if;
        #end if;

    /* [事务结束] */
    COMMIT;

    #更新汇总记录

    /* [事务开始] */
    START TRANSACTION;


        /* set @成交数量# = @临时_成交数量#; */
        set v_strike_qty = v_tmp_strike_qty;

        /* set @成交金额# = @临时_成交金额# ; */
        set v_strike_amt = v_tmp_strike_amt ;

        /* set @成交债券计提利息# = @成交债券计提利息# - @临时_成交债券计提利息#; */
        set v_strike_bond_accr_intrst = v_strike_bond_accr_intrst - v_tmp_strike_bond_accr_intrst;

        /* 调用【原子_交易证券_交易_成交处理汇总订单】*/
        call db_tdsecu.pra_tdsetd_StrikeDealSumOrder(
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
            v_stock_code_no,
            v_stock_code,
            v_trade_code_no,
            v_target_code_no,
            v_stock_type,
            v_order_date,
            v_order_batch_no,
            v_order_dir,
            v_order_status,
            v_strike_amt,
            v_strike_qty,
            v_strike_bond_accr_intrst,
            v_order_oper_way,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_成交处理汇总订单出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @更新次数# = @更新次数# + 1; */
    set v_update_times = v_update_times + 1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_id = v_strike_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_target_code = v_target_code;
    SET p_order_date = v_order_date;
    SET p_order_batch_no = v_order_batch_no;
    SET p_report_time = v_report_time;
    SET p_comm_date = v_comm_date;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_external_no = v_external_no;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_order_oper_way = v_order_oper_way;
    SET p_total_strike_amt = v_total_strike_amt;
    SET p_total_strike_qty = v_total_strike_qty;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_order_status = v_order_status;
    SET p_update_times = v_update_times;
    SET p_trade_occur_amt = v_trade_occur_amt;
    SET p_open_posi_date = v_open_posi_date;
    SET p_original_order_dir = v_original_order_dir;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_处理汇总成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_DealSumStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_DealSumStrikeRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_report_date int,
    IN p_report_no varchar(32),
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_order_dir int,
    IN p_strike_price decimal(16,9),
    IN p_total_strike_qty decimal(18,2),
    IN p_total_strike_amt decimal(18,4),
    IN p_rsp_info varchar(255),
    IN p_repo_days int,
    IN p_strike_deal_type int,
    IN p_repo_cale_days int,
    IN p_repo_back_date int,
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_exgp_cost_amt decimal(18,4),
    IN p_exgp_intrst_cost_amt decimal(18,4),
    IN p_exgp_curr_qty decimal(18,2),
    IN p_asac_cost_amt decimal(18,4),
    IN p_asac_intrst_cost_amt decimal(18,4),
    IN p_asac_curr_qty decimal(18,2),
    IN p_rsp_id bigint,
    IN p_order_id bigint,
    IN p_sys_config_str varchar(64),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_combo_code varchar(32),
    IN p_combo_posi_id bigint,
    IN p_asset_acco_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_order_date int,
    OUT p_order_batch_no int,
    OUT p_report_time int,
    OUT p_comm_date int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_busi_opor_no int,
    OUT p_order_oper_way varchar(2),
    OUT p_target_code varchar(6),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_cost_calc_type int,
    OUT p_order_status varchar(2),
    OUT p_update_times int,
    OUT p_trade_occur_amt decimal(18,4),
    OUT p_open_posi_date int,
    OUT p_original_order_dir int
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
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_total_strike_qty decimal(18,2);
    declare v_total_strike_amt decimal(18,4);
    declare v_rsp_info varchar(255);
    declare v_repo_days int;
    declare v_strike_deal_type int;
    declare v_repo_cale_days int;
    declare v_repo_back_date int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_curr_qty decimal(18,2);
    declare v_rsp_id bigint;
    declare v_order_id bigint;
    declare v_sys_config_str varchar(64);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_asset_acco_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_report_time int;
    declare v_comm_date int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_target_code varchar(6);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_cost_calc_type int;
    declare v_order_status varchar(2);
    declare v_update_times int;
    declare v_trade_occur_amt decimal(18,4);
    declare v_open_posi_date int;
    declare v_original_order_dir int;
    declare v_tmp_strike_date int;
    declare v_tmp_strike_time int;
    declare v_tmp_strike_no varchar(64);
    declare v_tmp_strike_price decimal(16,9);
    declare v_is_record_jour int;
    declare v_strike_fee decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_deal_capital_release_type int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_opor int;
    declare v_external_no bigint;
    declare v_order_time int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_exter_comm_flag int;
    declare v_target_stock_code_no int;
    declare v_old_order_status varchar(2);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_strike_bond_accr_intrst decimal(18,4);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_trade_occur_qty decimal(18,2);
    declare v_repo_order_id bigint;
    declare v_comm_qty decimal(18,2);
    declare v_comm_oper_way varchar(2);
    declare v_comm_strike_qty decimal(18,2);
    declare v_strike_occur_amt decimal(18,4);
    declare v_strike_occur_qty decimal(18,2);
    declare v_repo_strike_id bigint;

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
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_order_dir = p_order_dir;
    SET v_strike_price = p_strike_price;
    SET v_total_strike_qty = p_total_strike_qty;
    SET v_total_strike_amt = p_total_strike_amt;
    SET v_rsp_info = p_rsp_info;
    SET v_repo_days = p_repo_days;
    SET v_strike_deal_type = p_strike_deal_type;
    SET v_repo_cale_days = p_repo_cale_days;
    SET v_repo_back_date = p_repo_back_date;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_exgp_cost_amt = p_exgp_cost_amt;
    SET v_exgp_intrst_cost_amt = p_exgp_intrst_cost_amt;
    SET v_exgp_curr_qty = p_exgp_curr_qty;
    SET v_asac_cost_amt = p_asac_cost_amt;
    SET v_asac_intrst_cost_amt = p_asac_intrst_cost_amt;
    SET v_asac_curr_qty = p_asac_curr_qty;
    SET v_rsp_id = p_rsp_id;
    SET v_order_id = p_order_id;
    SET v_sys_config_str = p_sys_config_str;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_combo_code = p_combo_code;
    SET v_combo_posi_id = p_combo_posi_id;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_batch_no = 0;
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_busi_opor_no = 0;
    SET v_order_oper_way = " ";
    SET v_target_code = " ";
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_wtdraw_qty = 0;
    SET v_cost_calc_type = 0;
    SET v_order_status = "0";
    SET v_update_times = 1;
    SET v_trade_occur_amt = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_original_order_dir = 0;
    SET v_tmp_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_strike_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_strike_no = " ";
    SET v_tmp_strike_price = 0;
    SET v_is_record_jour = 1;
    SET v_strike_fee = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_deal_capital_release_type = 0;
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_opor = 0;
    SET v_external_no = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_exter_comm_flag = 0;
    SET v_target_stock_code_no = 0;
    SET v_old_order_status = "0";
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_amt = 0;
    SET v_tmp_strike_bond_accr_intrst = 0;
    SET v_all_wtdraw_qty = 0;
    SET v_trade_occur_qty = 0;
    SET v_repo_order_id = 0;
    SET v_comm_qty = 0;
    SET v_comm_oper_way = " ";
    SET v_comm_strike_qty = 0;
    SET v_strike_occur_amt = 0;
    SET v_strike_occur_qty = 0;
    SET v_repo_strike_id = 0;

    
    label_pro:BEGIN
    
    #检查重复回报，如不重复，则插入表记录

    /* [事务开始] */
    START TRANSACTION;


        /* if @回报序号# = 0 then */
        if v_rsp_id = 0 then

           /* set @成交数量# = @总成交数量#; */
           set v_strike_qty = v_total_strike_qty;

           /* set @成交金额# = @总成交金额#; */
           set v_strike_amt = v_total_strike_amt;

           /* 调用【原子_交易证券_报盘_检查成交重复回报】*/
           call db_tdsecu.pra_tdserp_CheckStrikeRspDup(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_init_date,
               v_pass_no,
               v_out_acco,
               v_exch_no,
               v_stock_acco,
               v_stock_code,
               v_strike_date,
               v_strike_time,
               v_strike_no,
               v_report_date,
               v_report_no,
               v_order_dir,
               v_strike_price,
               v_strike_qty,
               v_strike_amt,
               v_strike_deal_type,
               v_rsp_info,
               v_asset_acco_type,
               v_error_code,
               v_error_info,
               v_rsp_id);
           if v_error_code = "1" then
               SET v_error_code = "tdsecuT.5.22.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_检查成交重复回报出现错误！',v_mysql_message);
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


    /* set @临时_成交日期# = @成交日期#; */
    set v_tmp_strike_date = v_strike_date;

    /* set @临时_成交时间# = @成交时间#; */
    set v_tmp_strike_time = v_strike_time;

    /* set @临时_成交编号# = @成交编号#; */
    set v_tmp_strike_no = v_strike_no;

    /* set @临时_成交价格# = @成交价格#; */
    set v_tmp_strike_price = v_strike_price;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @成交费用# = 0; */
    set v_strike_fee = 0;

    /* set @全部费用# = 0; */
    set v_all_fee = 0;

    /* set @印花税# = 0; */
    set v_stamp_tax = 0;

    /* set @过户费# = 0; */
    set v_trans_fee = 0;

    /* set @经手费# = 0; */
    set v_brkage_fee = 0;

    /* set @证管费# = 0; */
    set v_SEC_charges = 0;

    /* set @其他费用# = 0; */
    set v_other_fee = 0;

    /* set @交易佣金# = 0; */
    set v_trade_commis = 0;

    /* set @其他佣金# = 0; */
    set v_other_commis = 0;

    /* set @交易征费# = 0; */
    set v_trade_tax = 0;

    /* set @交易费# = 0; */
    set v_trade_cost_fee = 0;

    /* set @交易系统使用费# = 0; */
    set v_trade_system_use_fee = 0;

    /* set @股份交收费# = 0; */
    set v_stock_settle_fee = 0;

    /* [事务开始] */
    START TRANSACTION;

        #获取部成资金占用释放方式，支持PB的特殊处理，与券商处理保持一致，影响可用

        /* set @部成资金占用释放方式# = substring(@系统控制配置串#, 3, 1); */
        set v_deal_capital_release_type = substring(v_sys_config_str, 3, 1);
        #获取原订单信息

        /* 调用【原子_交易证券_交易_锁定获取成交回报订单信息】*/
        call db_tdsecu.pra_tdsetd_LockGetStrikeRspOrder(
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
            v_report_date,
            v_report_no,
            v_order_id,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_crncy_type,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_id,
            v_comm_batch_no,
            v_comm_opor,
            v_external_no,
            v_report_time,
            v_order_batch_no,
            v_order_date,
            v_order_time,
            v_order_dir,
            v_price_type,
            v_order_price,
            v_order_qty,
            v_order_status,
            v_wtdraw_qty,
            v_strike_amt,
            v_strike_qty,
            v_net_price_flag,
            v_intrst_days,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_strike_bond_accr_intrst,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_rsp_info,
            v_compli_trig_id,
            v_remark_info,
            v_busi_opor_no,
            v_exter_comm_flag,
            v_order_oper_way,
            v_cost_calc_type,
            v_target_stock_code_no,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_锁定获取成交回报订单信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @原订单状态# = @订单状态#; */
        set v_old_order_status = v_order_status;

        /* set @原订单方向# = @订单方向#; */
        set v_original_order_dir = v_order_dir;

        /* set @临时_成交数量# = @成交数量#; */
        set v_tmp_strike_qty = v_strike_qty;

        /* set @临时_成交金额# = @成交金额#; */
        set v_tmp_strike_amt = v_strike_amt;

        /* set @临时_成交债券计提利息# = @成交债券计提利息#; */
        set v_tmp_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
        #计算本次应该计算的成交数量、成交价格

        /* set @成交数量# = @总成交数量# - @成交数量#; */
        set v_strike_qty = v_total_strike_qty - v_strike_qty;

        /* set @成交金额# = @总成交金额# - @成交金额#; */
        set v_strike_amt = v_total_strike_amt - v_strike_amt;

        /* set @成交价格# = round(@成交金额# / @成交数量#,3); */
        set v_strike_price = round(v_strike_amt / v_strike_qty,3);

        /* set @总撤单数量# = @撤单数量#; */
        set v_all_wtdraw_qty = v_wtdraw_qty;

        /* [检查报错返回][(@总成交数量# + @总撤单数量# > @订单数量#) or (@成交数量# <= 0)][755][@订单数量#,@撤单数量#,@成交数量#,@临时_成交数量#] */
        if (v_total_strike_qty + v_all_wtdraw_qty > v_order_qty) or (v_strike_qty <= 0) then
            ROLLBACK;
            SET v_error_code = "tdsecuT.5.22.755";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单数量=",v_order_qty,",","撤单数量=",v_wtdraw_qty,",","成交数量=",v_strike_qty,",","临时_成交数量=",v_tmp_strike_qty),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单数量=",v_order_qty,",","撤单数量=",v_wtdraw_qty,",","成交数量=",v_strike_qty,",","临时_成交数量=",v_tmp_strike_qty);
            end if;
            leave label_pro;
        end if;


        /* 调用【原子_交易证券_公用_计算成交交易变动金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetStrikeExchChangeAmtAndQty(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_stock_type,
            v_order_dir,
            v_order_qty,
            v_order_price,
            v_order_frozen_amt,
            v_strike_qty,
            v_total_strike_qty,
            v_all_wtdraw_qty,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_deal_capital_release_type,
            v_strike_amt,
            v_error_code,
            v_error_info,
            v_trade_occur_amt,
            v_trade_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算成交交易变动金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @回购委托序号# = @订单序号#; */
        set v_repo_order_id = v_order_id;
        #更新指令

        /* if @指令序号# > 0 then */
        if v_comm_id > 0 then

            /* 调用【原子_交易证券_指令_成交更新指令】*/
            call db_tdsecu.pra_tdseap_StrikeUpdateComm(
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
                v_sell_ref_rate,
                v_buy_ref_rate,
                v_exch_no,
                v_error_code,
                v_error_info,
                v_comm_date,
                v_comm_batch_no,
                v_comm_executor,
                v_comm_qty,
                v_comm_oper_way,
                v_comm_strike_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.22.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_成交更新指令出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;
        #插入成交表

        /* if @订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-融券回购》 or @订单方向# = 《订单方向-融资买入》 then */
        if v_order_dir = 1 or v_order_dir = 4 or v_order_dir = 5 then

            /* set @订单冻结金额# = @订单冻结金额# + @交易变动金额#; */
            set v_order_frozen_amt = v_order_frozen_amt + v_trade_occur_amt;
        else

            /* set @订单冻结金额# = 0; */
            set v_order_frozen_amt = 0;
        end if;

        /* if @订单方向# = 《订单方向-卖出》 then */
        if v_order_dir = 2 then

            /* set @订单冻结数量# = @订单冻结数量# - @成交数量#; */
            set v_order_frozen_qty = v_order_frozen_qty - v_strike_qty;
        else

            /* set @订单冻结数量# = 0; */
            set v_order_frozen_qty = 0;
        end if;

        /* 调用【原子_交易证券_公用_计算成交变动金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetStrikeOccurAmtAndQty(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_stock_type,
            v_order_dir,
            v_strike_qty,
            v_strike_price,
            v_strike_amt,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_all_fee,
            v_error_code,
            v_error_info,
            v_strike_occur_amt,
            v_strike_bond_accr_intrst,
            v_strike_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算成交变动金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #本次成交债券计提利息，成交债券计提利息为合计值
        #set @债券计提利息# = @成交债券计提利息# - @临时_成交债券计提利息#;

        /* 调用【原子_交易证券_报盘_新增成交】*/
        call db_tdsecu.pra_tdserp_AddStrike(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_busi_opor_no,
            v_init_date,
            v_rsp_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_id,
            v_comm_batch_no,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_id,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_strike_qty,
            v_strike_price,
            v_strike_amt,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_trade_tax,
            v_trade_cost_fee,
            v_trade_system_use_fee,
            v_stock_settle_fee,
            v_net_price_flag,
            v_intrst_days,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_strike_bond_accr_intrst,
            v_order_oper_way,
            v_exter_comm_flag,
            v_order_batch_no,
            v_external_no,
            v_combo_code,
            v_asset_acco_type,
            v_error_code,
            v_error_info,
            v_strike_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_新增成交出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @回购成交序号# = @成交序号#; */
        set v_repo_strike_id = v_strike_id;
        #更新订单表

        /* set @成交数量# = @总成交数量#; */
        set v_strike_qty = v_total_strike_qty;

        /* 调用【原子_交易证券_公用_计算订单状态】*/
        call db_tdsecu.pra_tdsepb_CaclOrderStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_qty,
            v_wtdraw_qty,
            v_strike_qty,
            v_old_order_status,
            v_error_code,
            v_error_info,
            v_order_status);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单状态出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @成交金额# = @总成交金额# ; */
        set v_strike_amt = v_total_strike_amt ;

        /* set @成交债券计提利息# = @成交债券计提利息# + @临时_成交债券计提利息#; */
        set v_strike_bond_accr_intrst = v_strike_bond_accr_intrst + v_tmp_strike_bond_accr_intrst;

        /* 调用【原子_交易证券_交易_更新成交回报订单记录】*/
        call db_tdsecu.pra_tdsetd_UpdateStrikeRspOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_id,
            v_strike_qty,
            v_strike_amt,
            v_wtdraw_qty,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_order_status,
            v_strike_bond_accr_intrst,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_更新成交回报订单记录出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #这里还需要特殊处理回购的记录

        /* 调用【原子_交易证券_账户_更新成交资金持仓】*/
        call db_tdsecu.pra_tdseac_UpdateStrikeCashPosi(
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
            v_crncy_type,
            v_exch_crncy_type,
            v_order_dir,
            v_comm_id,
            v_strike_id,
            v_exch_no,
            v_stock_code,
            v_stock_acco_no,
            v_stock_code_no,
            v_trade_code_no,
            v_target_code_no,
            v_asset_type,
            v_stock_type,
            v_strike_occur_amt,
            v_strike_occur_qty,
            v_trade_occur_amt,
            v_trade_occur_qty,
            v_impawn_ratio,
            v_repo_order_id,
            v_repo_strike_id,
            v_strike_no,
            v_strike_date,
            v_strike_time,
            v_strike_qty,
            v_strike_price,
            v_strike_amt,
            v_strike_fee,
            v_par_value,
            v_net_price_flag,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_repo_days,
            v_repo_cale_days,
            v_repo_back_date,
            v_capit_reback_days,
            v_posi_reback_days,
            v_is_record_jour,
            v_order_oper_way,
            v_cost_calc_type,
            v_exgp_cost_amt,
            v_exgp_intrst_cost_amt,
            v_exgp_curr_qty,
            v_asac_cost_amt,
            v_asac_intrst_cost_amt,
            v_asac_curr_qty,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_combo_code,
            v_combo_posi_id,
            v_order_date,
            v_target_stock_code_no,
            v_error_code,
            v_error_info,
            v_open_posi_date);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新成交资金持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    #更新汇总记录

    /* [事务开始] */
    START TRANSACTION;


        /* set @成交数量# = @总成交数量# - @临时_成交数量#; */
        set v_strike_qty = v_total_strike_qty - v_tmp_strike_qty;

        /* set @成交金额# = @总成交金额# - @临时_成交金额#; */
        set v_strike_amt = v_total_strike_amt - v_tmp_strike_amt;

        /* set @成交债券计提利息# = @成交债券计提利息# - @临时_成交债券计提利息#; */
        set v_strike_bond_accr_intrst = v_strike_bond_accr_intrst - v_tmp_strike_bond_accr_intrst;

        /* 调用【原子_交易证券_交易_成交处理汇总订单】*/
        call db_tdsecu.pra_tdsetd_StrikeDealSumOrder(
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
            v_stock_code_no,
            v_stock_code,
            v_trade_code_no,
            v_target_code_no,
            v_stock_type,
            v_order_date,
            v_order_batch_no,
            v_order_dir,
            v_order_status,
            v_strike_amt,
            v_strike_qty,
            v_strike_bond_accr_intrst,
            v_order_oper_way,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_成交处理汇总订单出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    #输出的成交金额与成交数量都为本次交易前的值（不算本次发生额），用于成交回报费用差处理

    /* set @成交数量# = @临时_成交数量#; */
    set v_strike_qty = v_tmp_strike_qty;

    /* set @成交金额# = @临时_成交金额#; */
    set v_strike_amt = v_tmp_strike_amt;

    /* set @更新次数# = @更新次数# + 1; */
    set v_update_times = v_update_times + 1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_id = v_strike_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_order_date = v_order_date;
    SET p_order_batch_no = v_order_batch_no;
    SET p_report_time = v_report_time;
    SET p_comm_date = v_comm_date;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_order_oper_way = v_order_oper_way;
    SET p_target_code = v_target_code;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_order_status = v_order_status;
    SET p_update_times = v_update_times;
    SET p_trade_occur_amt = v_trade_occur_amt;
    SET p_open_posi_date = v_open_posi_date;
    SET p_original_order_dir = v_original_order_dir;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_处理成交回报费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_DealStrikeRspFee;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_DealStrikeRspFee(
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
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_stock_acco_no int,
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_target_code_no int,
    IN p_trade_code_no int,
    IN p_order_id bigint,
    IN p_order_date int,
    IN p_order_batch_no int,
    IN p_order_dir int,
    IN p_comm_id bigint,
    IN p_strike_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_strike_amt decimal(18,4),
    IN p_strike_no varchar(64),
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_id bigint,
    IN p_all_fee decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_trade_cost_fee decimal(18,4),
    IN p_trade_system_use_fee decimal(18,4),
    IN p_trade_tax decimal(18,4),
    IN p_stock_settle_fee decimal(18,4),
    IN p_target_code varchar(6),
    IN p_impawn_ratio decimal(18,12),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_intrst_days int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_repo_days int,
    IN p_repo_cale_days int,
    IN p_repo_back_date int,
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_busi_opor_no int,
    IN p_order_oper_way varchar(2),
    IN p_cost_calc_type int,
    IN p_exgp_cost_amt decimal(18,4),
    IN p_exgp_intrst_cost_amt decimal(18,4),
    IN p_exgp_curr_qty decimal(18,2),
    IN p_asac_cost_amt decimal(18,4),
    IN p_asac_intrst_cost_amt decimal(18,4),
    IN p_asac_curr_qty decimal(18,2),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_trade_occur_amt decimal(18,4),
    IN p_combo_code varchar(32),
    IN p_combo_posi_id bigint,
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
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_comm_id bigint;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_strike_no varchar(64);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_id bigint;
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_target_code varchar(6);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_repo_days int;
    declare v_repo_cale_days int;
    declare v_repo_back_date int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_cost_calc_type int;
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_curr_qty decimal(18,2);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_trade_occur_amt decimal(18,4);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_is_record_jour int;
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_price decimal(16,9);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_trade_occur_amt decimal(18,4);
    declare v_target_stock_code_no int;
    declare v_trade_occur_qty decimal(18,2);
    declare v_repo_order_id bigint;
    declare v_repo_strike_id bigint;
    declare v_strike_fee decimal(18,4);
    declare v_strike_occur_amt decimal(18,4);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_strike_occur_qty decimal(18,2);
    declare v_open_posi_date int;

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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_order_id = p_order_id;
    SET v_order_date = p_order_date;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir = p_order_dir;
    SET v_comm_id = p_comm_id;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_price = p_strike_price;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_no = p_strike_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_id = p_strike_id;
    SET v_all_fee = p_all_fee;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_trade_cost_fee = p_trade_cost_fee;
    SET v_trade_system_use_fee = p_trade_system_use_fee;
    SET v_trade_tax = p_trade_tax;
    SET v_stock_settle_fee = p_stock_settle_fee;
    SET v_target_code = p_target_code;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_intrst_days = p_intrst_days;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_repo_days = p_repo_days;
    SET v_repo_cale_days = p_repo_cale_days;
    SET v_repo_back_date = p_repo_back_date;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_order_oper_way = p_order_oper_way;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_exgp_cost_amt = p_exgp_cost_amt;
    SET v_exgp_intrst_cost_amt = p_exgp_intrst_cost_amt;
    SET v_exgp_curr_qty = p_exgp_curr_qty;
    SET v_asac_cost_amt = p_asac_cost_amt;
    SET v_asac_intrst_cost_amt = p_asac_intrst_cost_amt;
    SET v_asac_curr_qty = p_asac_curr_qty;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_trade_occur_amt = p_trade_occur_amt;
    SET v_combo_code = p_combo_code;
    SET v_combo_posi_id = p_combo_posi_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_is_record_jour = 1;
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_price = 0;
    SET v_tmp_strike_amt = 0;
    SET v_tmp_trade_occur_amt = 0;
    SET v_target_stock_code_no = 0;
    SET v_trade_occur_qty = 0;
    SET v_repo_order_id = 0;
    SET v_repo_strike_id = 0;
    SET v_strike_fee = 0;
    SET v_strike_occur_amt = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_strike_occur_qty = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;
    #[检查正常返回][@全部费用# = 0 ]

    /* set @临时_成交数量#=@成交数量#; */
    set v_tmp_strike_qty=v_strike_qty;

    /* set @临时_成交价格#=@成交价格#; */
    set v_tmp_strike_price=v_strike_price;

    /* set @临时_成交金额#=@成交金额#; */
    set v_tmp_strike_amt=v_strike_amt;

    /* set @操作员编号# = @业务操作员编号#; */
    set v_opor_no = v_busi_opor_no;

    /* set @临时_交易变动金额# = @交易变动金额#; */
    set v_tmp_trade_occur_amt = v_trade_occur_amt;

    /* set @目标证券代码编号# = 0; */
    set v_target_stock_code_no = 0;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_报盘_更新成交回报费用】*/
        call db_tdsecu.pra_tdserp_UpdateStrikeRspFee(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_strike_id,
            v_order_id,
            v_order_date,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_trade_cost_fee,
            v_trade_system_use_fee,
            v_trade_tax,
            v_stock_settle_fee,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.23.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_更新成交回报费用出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


        /* set @成交数量#= 0; */
        set v_strike_qty= 0;

        /* set @成交价格#=0; */
        set v_strike_price=0;

        /* set @成交金额# = 0; */
        set v_strike_amt = 0;

        /* set @债券计提利息#=0; */
        set v_bond_accr_intrst=0;

        /* set @交易变动金额# = 0; */
        set v_trade_occur_amt = 0;

        /* set @交易变动数量# = 0; */
        set v_trade_occur_qty = 0;

        /* set @回购委托序号# = 0; */
        set v_repo_order_id = 0;

        /* set @回购成交序号# = 0; */
        set v_repo_strike_id = 0;

        /* set @成交费用# = @全部费用#; */
        set v_strike_fee = v_all_fee;

        /* if @全部费用# > 0 then */
        if v_all_fee > 0 then

    /* [事务开始] */
    START TRANSACTION;


            /* 调用【原子_交易证券_公用_计算成交变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetStrikeOccurAmtAndQty(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_stock_type,
                v_order_dir,
                v_strike_qty,
                v_strike_price,
                v_strike_amt,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_all_fee,
                v_error_code,
                v_error_info,
                v_strike_occur_amt,
                v_strike_bond_accr_intrst,
                v_strike_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.23.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算成交变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* 调用【原子_交易证券_账户_更新成交资金持仓】*/
            call db_tdsecu.pra_tdseac_UpdateStrikeCashPosi(
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
                v_crncy_type,
                v_exch_crncy_type,
                v_order_dir,
                v_comm_id,
                v_strike_id,
                v_exch_no,
                v_stock_code,
                v_stock_acco_no,
                v_stock_code_no,
                v_trade_code_no,
                v_target_code_no,
                v_asset_type,
                v_stock_type,
                v_strike_occur_amt,
                v_strike_occur_qty,
                v_trade_occur_amt,
                v_trade_occur_qty,
                v_impawn_ratio,
                v_repo_order_id,
                v_repo_strike_id,
                v_strike_no,
                v_strike_date,
                v_strike_time,
                v_strike_qty,
                v_strike_price,
                v_strike_amt,
                v_strike_fee,
                v_par_value,
                v_net_price_flag,
                v_intrst_days,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_repo_days,
                v_repo_cale_days,
                v_repo_back_date,
                v_capit_reback_days,
                v_posi_reback_days,
                v_is_record_jour,
                v_order_oper_way,
                v_cost_calc_type,
                v_exgp_cost_amt,
                v_exgp_intrst_cost_amt,
                v_exgp_curr_qty,
                v_asac_cost_amt,
                v_asac_intrst_cost_amt,
                v_asac_curr_qty,
                v_buy_ref_rate,
                v_sell_ref_rate,
                v_combo_code,
                v_combo_posi_id,
                v_order_date,
                v_target_stock_code_no,
                v_error_code,
                v_error_info,
                v_open_posi_date);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.23.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新成交资金持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


    /* [事务结束] */
    COMMIT;

        end if;

        /* set @成交数量#=@临时_成交数量#; */
        set v_strike_qty=v_tmp_strike_qty;

        /* set @成交价格#=@临时_成交价格#; */
        set v_strike_price=v_tmp_strike_price;

        /* set @成交金额#=@临时_成交金额#; */
        set v_strike_amt=v_tmp_strike_amt;

        /* set @成交变动数量# = @临时_成交数量#; */
        set v_strike_occur_qty = v_tmp_strike_qty;

        /* set @交易变动数量# = -1 * @成交变动数量#; */
        set v_trade_occur_qty = -1 * v_strike_occur_qty;

        /* if @订单操作方式# = 《订单操作方式-增强交易》 or @订单操作方式# = 《订单操作方式-增强交易平仓》 then */
        if v_order_oper_way = "14" or v_order_oper_way = "51" then

            /* set @交易变动金额# = @临时_交易变动金额#; */
            set v_trade_occur_amt = v_tmp_trade_occur_amt;

            /* 调用【原子_交易证券_T0_成交证券持仓明细变化】*/
            call db_tdsecu.pra_tdset0_StikePosiDetailChange(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_busi_opor_no,
                v_order_oper_way,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_stock_acco_no,
                v_asset_acco_no,
                v_stock_code,
                v_exch_no,
                v_stock_type,
                v_order_dir,
                v_stock_code_no,
                v_crncy_type,
                v_exch_crncy_type,
                v_strike_no,
                v_strike_date,
                v_strike_time,
                v_strike_price,
                v_strike_qty,
                v_strike_amt,
                v_strike_fee,
                v_trade_occur_qty,
                v_strike_occur_qty,
                v_trade_occur_amt,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.23.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_成交证券持仓明细变化出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


        /* elseif @订单操作方式# = 《订单操作方式-手工补单》 or @订单操作方式# = 《订单操作方式-报盘机补单》 then */
        elseif v_order_oper_way = "31" or v_order_oper_way = "33" then

         /* [事务开始] */
         START TRANSACTION;


            /* 调用【原子_交易证券_T0_体外交易操作员券源限额设置持仓变化】*/
            call db_tdsecu.pra_tdset0_OutOporStockLimitPosiChange(
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
                v_stock_acco_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_type,
                v_order_dir,
                v_stock_code,
                v_stock_code_no,
                v_trade_occur_qty,
                v_strike_occur_qty,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.23.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_体外交易操作员券源限额设置持仓变化出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


         /* [事务结束] */
         COMMIT;

        end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_交易_成交费用处理汇总订单】*/
        call db_tdsecu.pra_tdsetd_StrikeFeeDealSumOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_order_date,
            v_order_batch_no,
            v_order_dir,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_trade_cost_fee,
            v_trade_system_use_fee,
            v_trade_tax,
            v_stock_settle_fee,
            v_order_oper_way,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.23.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_成交费用处理汇总订单出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_报盘_处理体外指令成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_DealExterCommStrike;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_DealExterCommStrike(
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
    IN p_out_acco varchar(32),
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_comm_id bigint,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_asset_type int,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_all_fee decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_trade_tax decimal(18,4),
    IN p_trade_cost_fee decimal(18,4),
    IN p_trade_system_use_fee decimal(18,4),
    IN p_stock_settle_fee decimal(18,4),
    IN p_remark_info varchar(255),
    IN p_par_value decimal(16,9),
    IN p_intrst_days int,
    IN p_impawn_ratio decimal(18,12),
    IN p_net_price_flag int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_comm_comple_flag int,
    IN p_repo_days int,
    IN p_repo_cale_days int,
    IN p_repo_back_date int,
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_cost_calc_type int,
    IN p_exgp_cost_amt decimal(18,4),
    IN p_exgp_intrst_cost_amt decimal(18,4),
    IN p_exgp_curr_qty decimal(18,2),
    IN p_asac_cost_amt decimal(18,4),
    IN p_asac_intrst_cost_amt decimal(18,4),
    IN p_asac_curr_qty decimal(18,2),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_asset_acco_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_id bigint,
    OUT p_comm_strike_qty decimal(18,2),
    OUT p_comm_strike_amt decimal(18,4),
    OUT p_comm_batch_no int,
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_id bigint,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_oper_way varchar(2),
    OUT p_strike_date int,
    OUT p_strike_time int,
    OUT p_strike_no varchar(64),
    OUT p_external_no bigint
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
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_comm_id bigint;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_par_value decimal(16,9);
    declare v_intrst_days int;
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_comple_flag int;
    declare v_repo_days int;
    declare v_repo_cale_days int;
    declare v_repo_back_date int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_cost_calc_type int;
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_curr_qty decimal(18,2);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_asset_acco_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_id bigint;
    declare v_comm_strike_qty decimal(18,2);
    declare v_comm_strike_amt decimal(18,4);
    declare v_comm_batch_no int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_oper_way varchar(2);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_external_no bigint;
    declare v_exter_comm_flag int;
    declare v_price_type int;
    declare v_comm_opor int;
    declare v_tmp_strike_price decimal(16,9);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_order_qty decimal(18,2);
    declare v_is_record_jour int;
    declare v_tmp_init_date int;
    declare v_tmp_all_fee decimal(18,4);
    declare v_open_close_permission int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_trade_acco varchar(32);
    declare v_registration_agency varchar(32);
    declare v_contra_no varchar(32);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_comm_date int;
    declare v_comm_time int;
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_strike_status varchar(2);
    declare v_comm_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_appr_status varchar(2);
    declare v_comm_oper_way varchar(2);
    declare v_combo_posi_id bigint;
    declare v_combo_code varchar(32);
    declare v_exist_debt_flag int;
    declare v_mach_time int;
    declare v_strike_fee decimal(18,4);
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_order_batch_no int;
    declare v_calc_dir int;
    declare v_tmp_comm_qty decimal(18,2);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_order_time int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_compli_trig_id bigint;
    declare v_update_times int;
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_order_rsp_status varchar(2);
    declare v_rsp_info varchar(255);
    declare v_rsp_id bigint;
    declare v_row_id bigint;
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_deal_type int;
    declare v_repo_order_id bigint;
    declare v_strike_occur_amt decimal(18,4);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_strike_occur_qty decimal(18,2);
    declare v_busi_opor_no int;
    declare v_repo_strike_id bigint;
    declare v_tmp_strike_bond_accr_intrst decimal(18,4);
    declare v_avail_cal_flag int;
    declare v_open_posi_date int;

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
    SET v_out_acco = p_out_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_comm_id = p_comm_id;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_asset_type = p_asset_type;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_all_fee = p_all_fee;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_trade_tax = p_trade_tax;
    SET v_trade_cost_fee = p_trade_cost_fee;
    SET v_trade_system_use_fee = p_trade_system_use_fee;
    SET v_stock_settle_fee = p_stock_settle_fee;
    SET v_remark_info = p_remark_info;
    SET v_par_value = p_par_value;
    SET v_intrst_days = p_intrst_days;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_comm_comple_flag = p_comm_comple_flag;
    SET v_repo_days = p_repo_days;
    SET v_repo_cale_days = p_repo_cale_days;
    SET v_repo_back_date = p_repo_back_date;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_exgp_cost_amt = p_exgp_cost_amt;
    SET v_exgp_intrst_cost_amt = p_exgp_intrst_cost_amt;
    SET v_exgp_curr_qty = p_exgp_curr_qty;
    SET v_asac_cost_amt = p_asac_cost_amt;
    SET v_asac_intrst_cost_amt = p_asac_intrst_cost_amt;
    SET v_asac_curr_qty = p_asac_curr_qty;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_id = 0;
    SET v_comm_strike_qty = 0;
    SET v_comm_strike_amt = 0;
    SET v_comm_batch_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_id = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_oper_way = " ";
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_external_no = 0;
    SET v_exter_comm_flag = 0;
    SET v_price_type = 0;
    SET v_comm_opor = 0;
    SET v_tmp_strike_price = 0;
    SET v_tmp_strike_qty = 0;
    SET v_tmp_order_qty = 0;
    SET v_is_record_jour = 1;
    SET v_tmp_init_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_all_fee = 0;
    SET v_open_close_permission = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_trade_acco = " ";
    SET v_registration_agency = " ";
    SET v_contra_no = " ";
    SET v_tmp_strike_amt = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_executor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_strike_status = "0";
    SET v_comm_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_status = " ";
    SET v_comm_oper_way = " ";
    SET v_combo_posi_id = 0;
    SET v_combo_code = " ";
    SET v_exist_debt_flag = 0;
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_strike_fee = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_order_batch_no = 0;
    SET v_calc_dir = 1;
    SET v_tmp_comm_qty = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_order_status = "0";
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_compli_trig_id = 0;
    SET v_update_times = 1;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_order_rsp_status = "0";
    SET v_rsp_info = " ";
    SET v_rsp_id = 0;
    SET v_row_id = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_deal_type = 0;
    SET v_repo_order_id = 0;
    SET v_strike_occur_amt = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_strike_occur_qty = 0;
    SET v_busi_opor_no = 0;
    SET v_repo_strike_id = 0;
    SET v_tmp_strike_bond_accr_intrst = 0;
    SET v_avail_cal_flag = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @体外指令标志# = 《体外指令标志-体外》; */
    set v_exter_comm_flag = 2;

    /* set @价格类型# = 《价格类型-限价》; */
    set v_price_type = 1;

    /* set @指令下达人# = @操作员编号#; */
    set v_comm_opor = v_opor_no;

    /* set @临时_成交价格# = @成交价格#; */
    set v_tmp_strike_price = v_strike_price;

    /* set @临时_成交数量# = @成交数量#; */
    set v_tmp_strike_qty = v_strike_qty;

    /* set @临时_订单数量# = @成交数量#; */
    set v_tmp_order_qty = v_strike_qty;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @临时_初始化日期# = @初始化日期#; */
    set v_tmp_init_date = v_init_date;

    /* set @临时_全部费用# = @全部费用#; */
    set v_tmp_all_fee = v_all_fee;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;

    /* set @目标证券代码# = ""; */
    set v_target_stock_code = "";

    /* set @目标证券代码编号# = 0; */
    set v_target_stock_code_no = 0;

    /* set @交易账户# = " "; */
    set v_trade_acco = " ";

    /* set @登记机构# = ""; */
    set v_registration_agency = "";

    /* set @合同编号# = ""; */
    set v_contra_no = "";
    #回购类操作自己计算成交金额

    /* if @订单方向# = 《订单方向-融券回购》 or @订单方向# = 《订单方向-融资回购》 then */
    if v_order_dir = 4 or v_order_dir = 3 then

        /* set @成交金额# = @票面面值# * @成交数量#; */
        set v_strike_amt = v_par_value * v_strike_qty;
    else

        /* set @成交金额# = @成交价格# * @成交数量#; */
        set v_strike_amt = v_strike_price * v_strike_qty;
    end if;

    /* set @临时_成交金额# = @成交金额#; */
    set v_tmp_strike_amt = v_strike_amt;

    /* 调用【原子_交易证券_指令_获取指令信息】*/
    call db_tdsecu.pra_tdseap_CheckCommInfo(
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
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_crncy_type,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_stock_code,
        v_target_code_no,
        v_trade_code_no,
        v_stock_type,
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
        v_all_fee,
        v_net_price_flag,
        v_par_value,
        v_bond_accr_intrst,
        v_bond_rate_type,
        v_strike_status,
        v_comm_status,
        v_comm_begin_date,
        v_comm_end_date,
        v_comm_begin_time,
        v_comm_end_time,
        v_comm_comple_date,
        v_comm_comple_time,
        v_comm_appr_status,
        v_exter_comm_flag,
        v_comm_oper_way,
        v_combo_posi_id,
        v_combo_code,
        v_asset_acco_type,
        v_exist_debt_flag);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.5.24.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_获取指令信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@指令审批状态# <> 《指令审批状态-审批通过》 and @指令审批状态# <> 《指令审批状态-不审批》][626][@指令审批状态#] */
    if v_comm_appr_status <> "2" and v_comm_appr_status <> "4" then
        
        SET v_error_code = "tdsecuT.5.24.626";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令审批状态=",v_comm_appr_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令审批状态=",v_comm_appr_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@指令执行人#=0][627][@指令执行人#] */
    if v_comm_executor=0 then
        
        SET v_error_code = "tdsecuT.5.24.627";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令执行人=",v_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令执行人=",v_comm_executor);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@操作员编号# <> @指令执行人# ][628][@操作员编号#,@指令执行人#] */
    if v_opor_no <> v_comm_executor  then
        
        SET v_error_code = "tdsecuT.5.24.628";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","指令执行人=",v_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,",","指令执行人=",v_comm_executor);
        end if;
        leave label_pro;
    end if;


    /* if @指令结束日期# <> 0 or @指令开始日期# <> 0 or @指令开始时间# <> 0  then */
    if v_comm_end_date <> 0 or v_comm_begin_date <> 0 or v_comm_begin_time <> 0  then
        #[检查报错返回][@订单日期#>@指令结束日期# or @订单日期# < @指令开始日期# or (@订单日期#=@指令开始日期# and @机器时间# < @指令开始时间#) or (@订单日期#=@指令结束日期# and @机器时间#>@指令结束时间#)][629][@指令开始日期#,@指令开始时间# ,@指令结束日期#,@指令结束时间#]

        /* [检查报错返回][@订单日期#>@指令结束日期# or @订单日期# < @指令开始日期# or (@订单日期#=@指令开始日期# and @机器时间# < @指令开始时间#) ][629][@指令开始日期#,@指令开始时间# ,@指令结束日期#] */
        if v_order_date>v_comm_end_date or v_order_date < v_comm_begin_date or (v_order_date=v_comm_begin_date and v_mach_time < v_comm_begin_time)  then
            
            SET v_error_code = "tdsecuT.5.24.629";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令开始日期=",v_comm_begin_date,",","指令开始时间 =",v_comm_begin_time ,",","指令结束日期=",v_comm_end_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令开始日期=",v_comm_begin_date,",","指令开始时间 =",v_comm_begin_time ,",","指令结束日期=",v_comm_end_date);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [检查报错返回][@临时_订单数量#>@指令数量# - @订单数量# - @指令撤销数量#][630][@临时_订单数量#,@指令数量#,@订单数量#,@指令撤销数量#] */
    if v_tmp_order_qty>v_comm_qty - v_order_qty - v_comm_cancel_qty then
        
        SET v_error_code = "tdsecuT.5.24.630";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("临时_订单数量=",v_tmp_order_qty,",","指令数量=",v_comm_qty,",","订单数量=",v_order_qty,",","指令撤销数量=",v_comm_cancel_qty),"#",v_mysql_message);
        else
            SET v_error_info = concat("临时_订单数量=",v_tmp_order_qty,",","指令数量=",v_comm_qty,",","订单数量=",v_order_qty,",","指令撤销数量=",v_comm_cancel_qty);
        end if;
        leave label_pro;
    end if;


    /* set @外部编号# = 0; */
    set v_external_no = 0;

    /* set @订单价格# = @临时_成交价格#; */
    set v_order_price = v_tmp_strike_price;

    /* set @订单数量# = @临时_成交数量#; */
    set v_order_qty = v_tmp_strike_qty;

    /* set @订单日期# = @临时_初始化日期#; */
    set v_order_date = v_tmp_init_date;

    /* set @全部费用# = @临时_全部费用#; */
    set v_all_fee = v_tmp_all_fee;

    /* set @成交费用# = @临时_全部费用#; */
    set v_strike_fee = v_tmp_all_fee;

    /* set @成交价格# = @临时_成交价格#; */
    set v_strike_price = v_tmp_strike_price;

    /* set @成交数量# = @临时_成交数量#; */
    set v_strike_qty = v_tmp_strike_qty;

    /* set @成交金额# = @临时_成交金额#; */
    set v_strike_amt = v_tmp_strike_amt;

    /* set @编号类型#=《编号类型-订单批号》; */
    set v_record_no_type=18;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_公用_获取业务记录编号】*/
        call db_tdsecu.pra_tdsepb_GetCoBusiRecordNo(
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
            SET v_error_code = "tdsecuT.5.24.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_获取业务记录编号出现错误！',v_mysql_message);
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

    /* [事务开始] */
    START TRANSACTION;


        /* if @成交数量# > 0 then */
        if v_strike_qty > 0 then
            #第一步，下订单

            /* if @指令序号# > 0 then */
            if v_comm_id > 0 then

                /* set @指令方向# = @订单方向#; */
                set v_comm_dir = v_order_dir;

                /* set @指令数量# = @成交数量#; */
                set v_comm_qty = v_strike_qty;

                /* set @计算方向# = 《计算方向-减去》; */
                set v_calc_dir = -1;

                /* 调用【原子_交易证券_公用_计算指令冻结金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetCommFrozenAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_comm_dir,
                    v_limit_actual_price,
                    v_comm_qty,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_calc_dir,
                    v_error_code,
                    v_error_info,
                    v_comm_frozen_amt,
                    v_comm_frozen_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.24.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令冻结金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* 调用【原子_交易证券_指令_下单更新体外指令】*/
                call db_tdsecu.pra_tdseap_OrderUpdateExterComm(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_comm_id,
                    v_comm_frozen_amt,
                    v_comm_frozen_qty,
                    v_order_qty,
                    v_error_code,
                    v_error_info,
                    v_limit_actual_price,
                    v_exter_comm_flag,
                    v_comm_cancel_qty,
                    v_comm_strike_qty,
                    v_comm_strike_amt,
                    v_comm_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.24.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_下单更新体外指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @临时_指令数量# = @指令数量#; */
                set v_tmp_comm_qty = v_comm_qty;
                #计算指令变动金额和数量

                /* set @计算方向# = 《计算方向-减去》; */
                set v_calc_dir = -1;

                /* set @指令数量# = @成交数量#; */
                set v_comm_qty = v_strike_qty;

                /* 调用【原子_交易证券_公用_计算指令变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetCommOccurAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_comm_dir,
                    v_limit_actual_price,
                    v_comm_qty,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_calc_dir,
                    v_error_code,
                    v_error_info,
                    v_comm_occur_amt,
                    v_comm_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.24.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            end if;

            /* set @订单状态# = 《订单状态-已报》; */
            set v_order_status = "2";

            /* set @订单日期# = @初始化日期#; */
            set v_order_date = v_init_date;

            /* set @订单时间# = date_format(curtime(),'%H%i%s'); */
            set v_order_time = date_format(curtime(),'%H%i%s');

            /* set @申报日期# = 0; */
            set v_report_date = 0;

            /* set @申报时间# = 0; */
            set v_report_time = 0;

            /* set @申报编号# = " "; */
            set v_report_no = " ";

            /* set @备注信息# = concat('体外指令成交自动下单订单，备注：',@备注信息#); */
            set v_remark_info = concat('体外指令成交自动下单订单，备注：',v_remark_info);

            /* set @订单冻结金额# = 0; */
            set v_order_frozen_amt = 0;

            /* set @订单冻结数量# = 0; */
            set v_order_frozen_qty = 0;

            /* set @订单操作方式# = 《订单操作方式-体外指令》; */
            set v_order_oper_way = "41";

            /* set @合规触警序号# = 0; */
            set v_compli_trig_id = 0;

            /* set @组合代码# = " "; */
            set v_combo_code = " ";

            /* set @组合持仓序号#=0; */
            set v_combo_posi_id=0;

            /* 调用【原子_交易证券_交易_新增订单】*/
            call db_tdsecu.pra_tdsetd_AddOrder(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_co_no,
                v_comm_opor,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_pass_no,
                v_out_acco,
                v_exch_crncy_type,
                v_exch_no,
                v_stock_acco_no,
                v_stock_acco,
                v_stock_code_no,
                v_stock_code,
                v_target_code_no,
                v_trade_code_no,
                v_stock_type,
                v_asset_type,
                v_external_no,
                v_comm_id,
                v_comm_batch_no,
                v_order_batch_no,
                v_order_date,
                v_order_dir,
                v_price_type,
                v_order_price,
                v_order_qty,
                v_order_status,
                v_report_date,
                v_report_time,
                v_report_no,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_net_price_flag,
                v_intrst_days,
                v_par_value,
                v_impawn_ratio,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_compli_trig_id,
                v_remark_info,
                v_order_oper_way,
                v_exter_comm_flag,
                v_cost_calc_type,
                v_combo_code,
                v_combo_posi_id,
                v_target_stock_code,
                v_target_stock_code_no,
                v_registration_agency,
                v_trade_acco,
                v_contra_no,
                v_asset_acco_type,
                v_exist_debt_flag,
                v_error_code,
                v_error_info,
                v_order_id,
                v_order_time,
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.24.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增订单出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @交易变动金额# = 0; */
            set v_trade_occur_amt = 0;

            /* set @交易变动数量# = 0; */
            set v_trade_occur_qty = 0;
            #第二步，构造订单回报

            /* set @申报编号# = " "; */
            set v_report_no = " ";

            /* set @申报日期# = @订单日期#; */
            set v_report_date = v_order_date;

            /* [获取机器时间][@申报时间#] */
            select date_format(curtime(),'%H%i%s') into v_report_time;


            /* set @申报编号# = concat("P_", @订单序号#); */
            set v_report_no = concat("P_", v_order_id);

            /* set @订单回报状态# = 《订单回报状态-已报》; */
            set v_order_rsp_status = "1";

            /* set @回报信息# = '体外指令自动下单产生的回报。'; */
            set v_rsp_info = '体外指令自动下单产生的回报。';

            /* 调用【原子_交易证券_报盘_检查订单重复回报】*/
            call db_tdsecu.pra_tdserp_CheckOrderRspDup(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_pass_no,
                v_out_acco,
                v_exch_no,
                v_stock_acco,
                v_stock_code,
                v_report_date,
                v_report_time,
                v_report_no,
                v_rsp_info,
                v_order_rsp_status,
                v_price_type,
                v_order_id,
                v_error_code,
                v_error_info,
                v_rsp_id,
                v_row_id);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.24.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_检查订单重复回报出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @订单状态# = 《订单状态-已报》; */
            set v_order_status = "2";

            /* set @撤单数量# = 0; */
            set v_wtdraw_qty = 0;

            /* 调用【原子_交易证券_报盘_更新订单回报记录】*/
            call db_tdsecu.pra_tdserp_UpdateOrderRsp(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_order_id,
                v_rsp_id,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_report_date,
                v_report_time,
                v_report_no,
                v_all_fee,
                v_wtdraw_qty,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_order_status,
                v_rsp_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.24.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_更新订单回报记录出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #第三步，构造成交回报

            /* set @成交编号# = @申报编号#; */
            set v_strike_no = v_report_no;

            /* set @成交处理方式# = 《成交处理方式-分笔》; */
            set v_strike_deal_type = 1;

            /* set @成交日期# = @初始化日期#; */
            set v_strike_date = v_init_date;

            /* if @成交时间# = 0 then */
            if v_strike_time = 0 then

              /* set @成交时间# = date_format(curtime(),'%H%i%s'); */
              set v_strike_time = date_format(curtime(),'%H%i%s');
            end if;

            /* 调用【原子_交易证券_报盘_检查成交重复回报】*/
            call db_tdsecu.pra_tdserp_CheckStrikeRspDup(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_pass_no,
                v_out_acco,
                v_exch_no,
                v_stock_acco,
                v_stock_code,
                v_strike_date,
                v_strike_time,
                v_strike_no,
                v_report_date,
                v_report_no,
                v_order_dir,
                v_strike_price,
                v_strike_qty,
                v_strike_amt,
                v_strike_deal_type,
                v_rsp_info,
                v_asset_acco_type,
                v_error_code,
                v_error_info,
                v_rsp_id);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.24.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_检查成交重复回报出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #第四部，构造成交

            /* set @回购委托序号# = @订单序号#; */
            set v_repo_order_id = v_order_id;
            #更新交易系统数据

            /* if @指令序号# > 0 then */
            if v_comm_id > 0 then

                /* set @指令数量# = @临时_指令数量#; */
                set v_comm_qty = v_tmp_comm_qty;

                /* 调用【原子_交易证券_指令_成交更新体外指令】*/
                call db_tdsecu.pra_tdseap_StrikeUpdateExterComm(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_co_no,
                    v_comm_id,
                    v_comm_date,
                    v_comm_batch_no,
                    v_comm_executor,
                    v_comm_dir,
                    v_comm_qty,
                    v_comm_cancel_qty,
                    v_comm_strike_qty,
                    v_comm_strike_amt,
                    v_comm_status,
                    v_strike_qty,
                    v_strike_amt,
                    v_comm_comple_flag,
                    v_comm_oper_way,
                    v_sell_ref_rate,
                    v_buy_ref_rate,
                    v_exch_no,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.24.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_成交更新体外指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            end if;

            /* 调用【原子_交易证券_公用_计算成交变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetStrikeOccurAmtAndQty(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_stock_type,
                v_order_dir,
                v_strike_qty,
                v_strike_price,
                v_strike_amt,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_all_fee,
                v_error_code,
                v_error_info,
                v_strike_occur_amt,
                v_strike_bond_accr_intrst,
                v_strike_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.24.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算成交变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #本次成交债券计提利息，成交债券计提利息为合计值

            /* set @债券计提利息# = @成交债券计提利息#; */
            set v_bond_accr_intrst = v_strike_bond_accr_intrst;

            /* set @业务操作员编号# = @操作员编号#; */
            set v_busi_opor_no = v_opor_no;

            /* 调用【原子_交易证券_报盘_新增成交】*/
            call db_tdsecu.pra_tdserp_AddStrike(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_busi_opor_no,
                v_init_date,
                v_rsp_id,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_pass_no,
                v_out_acco,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_stock_code,
                v_target_code_no,
                v_trade_code_no,
                v_stock_type,
                v_asset_type,
                v_comm_id,
                v_comm_batch_no,
                v_strike_date,
                v_strike_time,
                v_strike_no,
                v_report_date,
                v_report_no,
                v_order_date,
                v_order_time,
                v_order_id,
                v_order_dir,
                v_order_price,
                v_order_qty,
                v_strike_qty,
                v_strike_price,
                v_strike_amt,
                v_all_fee,
                v_stamp_tax,
                v_trans_fee,
                v_brkage_fee,
                v_SEC_charges,
                v_other_fee,
                v_trade_commis,
                v_other_commis,
                v_trade_tax,
                v_trade_cost_fee,
                v_trade_system_use_fee,
                v_stock_settle_fee,
                v_net_price_flag,
                v_intrst_days,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_impawn_ratio,
                v_strike_bond_accr_intrst,
                v_order_oper_way,
                v_exter_comm_flag,
                v_order_batch_no,
                v_external_no,
                v_combo_code,
                v_asset_acco_type,
                v_error_code,
                v_error_info,
                v_strike_id);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.24.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_新增成交出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @回购成交序号# = @成交序号#; */
            set v_repo_strike_id = v_strike_id;
            #更新订单表

            /* set @订单状态# = 《订单状态-已成》; */
            set v_order_status = "6";

            /* set @成交债券计提利息# = @成交债券计提利息# + @临时_成交债券计提利息#; */
            set v_strike_bond_accr_intrst = v_strike_bond_accr_intrst + v_tmp_strike_bond_accr_intrst;

            /* 调用【原子_交易证券_交易_更新成交回报订单记录】*/
            call db_tdsecu.pra_tdsetd_UpdateStrikeRspOrder(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_order_id,
                v_strike_qty,
                v_strike_amt,
                v_wtdraw_qty,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_order_status,
                v_strike_bond_accr_intrst,
                v_all_fee,
                v_stamp_tax,
                v_trans_fee,
                v_brkage_fee,
                v_SEC_charges,
                v_other_fee,
                v_trade_commis,
                v_other_commis,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.24.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_更新成交回报订单记录出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #更新指令变动

            /* set @可用计算标志# = 0; */
            set v_avail_cal_flag = 0;

            /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
            call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
                v_exch_crncy_type,
                v_comm_id,
                v_order_id,
                v_exch_no,
                v_stock_code,
                v_stock_type,
                v_asset_type,
                v_order_dir,
                v_impawn_ratio,
                v_stock_acco_no,
                v_stock_code_no,
                v_trade_code_no,
                v_target_code_no,
                v_comm_occur_amt,
                v_comm_occur_qty,
                v_trade_occur_amt,
                v_trade_occur_qty,
                v_is_record_jour,
                v_order_oper_way,
                v_busi_opor_no,
                v_open_close_permission,
                v_avail_cal_flag,
                v_combo_code,
                v_combo_posi_id,
                v_target_stock_code_no,
                v_error_code,
                v_error_info,
                v_open_posi_date);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.24.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* 调用【原子_交易证券_账户_更新成交资金持仓】*/
            call db_tdsecu.pra_tdseac_UpdateStrikeCashPosi(
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
                v_crncy_type,
                v_exch_crncy_type,
                v_order_dir,
                v_comm_id,
                v_strike_id,
                v_exch_no,
                v_stock_code,
                v_stock_acco_no,
                v_stock_code_no,
                v_trade_code_no,
                v_target_code_no,
                v_asset_type,
                v_stock_type,
                v_strike_occur_amt,
                v_strike_occur_qty,
                v_trade_occur_amt,
                v_trade_occur_qty,
                v_impawn_ratio,
                v_repo_order_id,
                v_repo_strike_id,
                v_strike_no,
                v_strike_date,
                v_strike_time,
                v_strike_qty,
                v_strike_price,
                v_strike_amt,
                v_strike_fee,
                v_par_value,
                v_net_price_flag,
                v_intrst_days,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_repo_days,
                v_repo_cale_days,
                v_repo_back_date,
                v_capit_reback_days,
                v_posi_reback_days,
                v_is_record_jour,
                v_order_oper_way,
                v_cost_calc_type,
                v_exgp_cost_amt,
                v_exgp_intrst_cost_amt,
                v_exgp_curr_qty,
                v_asac_cost_amt,
                v_asac_intrst_cost_amt,
                v_asac_curr_qty,
                v_buy_ref_rate,
                v_sell_ref_rate,
                v_combo_code,
                v_combo_posi_id,
                v_order_date,
                v_target_stock_code_no,
                v_error_code,
                v_error_info,
                v_open_posi_date);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.24.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新成交资金持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        else

            /* [检查报错返回][@指令完成标志# <> 《指令完成标志-已完成》][755][@成交数量#, @成交价格#] */
            if v_comm_comple_flag <> 2 then
                ROLLBACK;
                SET v_error_code = "tdsecuT.5.24.755";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("成交数量=",v_strike_qty,","," 成交价格=", v_strike_price),"#",v_mysql_message);
                else
                    SET v_error_info = concat("成交数量=",v_strike_qty,","," 成交价格=", v_strike_price);
                end if;
                leave label_pro;
            end if;


            /* if @指令序号# > 0 then */
            if v_comm_id > 0 then

                /* 调用【原子_交易证券_指令_更新体外指令完成标志】*/
                call db_tdsecu.pra_tdseap_UpdateExterCommCompleFlag(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_comm_id,
                    v_comm_comple_flag,
                    v_error_code,
                    v_error_info,
                    v_comm_strike_qty,
                    v_comm_strike_amt);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.24.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_更新体外指令完成标志出现错误！',v_mysql_message);
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

    #修改输出的指令成交数量和指令成交金额

    /* set @指令成交数量# =  @指令成交数量# + @临时_成交数量#; */
    set v_comm_strike_qty =  v_comm_strike_qty + v_tmp_strike_qty;

    /* set @指令成交金额# =  @指令成交金额# + @临时_成交金额#; */
    set v_comm_strike_amt =  v_comm_strike_amt + v_tmp_strike_amt;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_id = v_strike_id;
    SET p_comm_strike_qty = v_comm_strike_qty;
    SET p_comm_strike_amt = v_comm_strike_amt;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_id = v_order_id;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_oper_way = v_order_oper_way;
    SET p_strike_date = v_strike_date;
    SET p_strike_time = v_strike_time;
    SET p_strike_no = v_strike_no;
    SET p_external_no = v_external_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_回溯取体外指令成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_BackGetExterCommStrike;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_BackGetExterCommStrike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_id bigint,
    IN p_strike_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code varchar(6),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_comm_batch_no int,
    OUT p_strike_date int,
    OUT p_strike_time int,
    OUT p_strike_no varchar(64),
    OUT p_report_date int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_id bigint,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_amt decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_stamp_tax decimal(18,4),
    OUT p_trans_fee decimal(18,4),
    OUT p_brkage_fee decimal(18,4),
    OUT p_SEC_charges decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_trade_tax decimal(18,4),
    OUT p_trade_cost_fee decimal(18,4),
    OUT p_trade_system_use_fee decimal(18,4),
    OUT p_stock_settle_fee decimal(18,4),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_impawn_ratio decimal(18,12),
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_order_oper_way varchar(2),
    OUT p_exter_comm_flag int,
    OUT p_record_valid_flag int,
    OUT p_busi_opor_no int,
    OUT p_external_no bigint
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
    declare v_strike_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_comm_batch_no int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
    declare v_busi_opor_no int;
    declare v_external_no bigint;
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
    SET v_comm_id = p_comm_id;
    SET v_strike_id = p_strike_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_comm_batch_no = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_id = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_strike_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_amt = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_order_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_record_valid_flag = 0;
    SET v_busi_opor_no = 0;
    SET v_external_no = 0;
    SET v_order_batch_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_报盘_回溯取体外指令成交】*/
    call db_tdsecu.pra_tdserp_BackGetExterCommStrike(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_id,
        v_strike_id,
        v_error_code,
        v_error_info,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_pass_no,
        v_out_acco,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code,
        v_stock_code_no,
        v_stock_type,
        v_comm_batch_no,
        v_strike_date,
        v_strike_time,
        v_strike_no,
        v_report_date,
        v_report_no,
        v_order_date,
        v_order_batch_no,
        v_order_id,
        v_order_dir,
        v_order_price,
        v_order_qty,
        v_strike_qty,
        v_strike_price,
        v_strike_amt,
        v_all_fee,
        v_stamp_tax,
        v_trans_fee,
        v_brkage_fee,
        v_SEC_charges,
        v_other_fee,
        v_trade_commis,
        v_other_commis,
        v_trade_tax,
        v_trade_cost_fee,
        v_trade_system_use_fee,
        v_stock_settle_fee,
        v_net_price_flag,
        v_intrst_days,
        v_par_value,
        v_bond_accr_intrst,
        v_bond_rate_type,
        v_impawn_ratio,
        v_trade_code_no,
        v_target_code_no,
        v_order_oper_way,
        v_exter_comm_flag,
        v_record_valid_flag,
        v_busi_opor_no,
        v_external_no);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.5.25.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_回溯取体外指令成交出现错误！',v_mysql_message);
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
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_strike_date = v_strike_date;
    SET p_strike_time = v_strike_time;
    SET p_strike_no = v_strike_no;
    SET p_report_date = v_report_date;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_id = v_order_id;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_price = v_strike_price;
    SET p_strike_amt = v_strike_amt;
    SET p_all_fee = v_all_fee;
    SET p_stamp_tax = v_stamp_tax;
    SET p_trans_fee = v_trans_fee;
    SET p_brkage_fee = v_brkage_fee;
    SET p_SEC_charges = v_SEC_charges;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_trade_tax = v_trade_tax;
    SET p_trade_cost_fee = v_trade_cost_fee;
    SET p_trade_system_use_fee = v_trade_system_use_fee;
    SET p_stock_settle_fee = v_stock_settle_fee;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_order_oper_way = v_order_oper_way;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_record_valid_flag = v_record_valid_flag;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_external_no = v_external_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_体外指令成交回溯
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_BackExterCommStrike;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_BackExterCommStrike(
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
    IN p_out_acco varchar(32),
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_asset_type int,
    IN p_stock_type int,
    IN p_report_date int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_strike_id bigint,
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_all_fee decimal(18,4),
    IN p_par_value decimal(16,9),
    IN p_intrst_days int,
    IN p_impawn_ratio decimal(18,12),
    IN p_net_price_flag int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_remark_info varchar(255),
    IN p_repo_strike_id bigint,
    IN p_repo_days int,
    IN p_repo_cale_days int,
    IN p_repo_back_date int,
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_order_oper_way varchar(2),
    IN p_cost_calc_type int,
    IN p_exgp_cost_amt decimal(18,4),
    IN p_exgp_intrst_cost_amt decimal(18,4),
    IN p_exgp_curr_qty decimal(18,2),
    IN p_asac_cost_amt decimal(18,4),
    IN p_asac_intrst_cost_amt decimal(18,4),
    IN p_asac_curr_qty decimal(18,2),
    IN p_busi_opor_no int,
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_strike_qty decimal(18,2),
    OUT p_comm_strike_amt decimal(18,4)
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
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_id bigint;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_par_value decimal(16,9);
    declare v_intrst_days int;
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_remark_info varchar(255);
    declare v_repo_strike_id bigint;
    declare v_repo_days int;
    declare v_repo_cale_days int;
    declare v_repo_back_date int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_order_oper_way varchar(2);
    declare v_cost_calc_type int;
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_curr_qty decimal(18,2);
    declare v_busi_opor_no int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_strike_qty decimal(18,2);
    declare v_comm_strike_amt decimal(18,4);
    declare v_is_record_jour int;
    declare v_strike_fee decimal(18,4);
    declare v_open_close_permission int;
    declare v_target_stock_code_no int;
    declare v_comm_cancel_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_comm_dir int;
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_calc_dir int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_rsp_info varchar(255);
    declare v_strike_occur_amt decimal(18,4);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_strike_occur_qty decimal(18,2);
    declare v_repo_order_id bigint;
    declare v_combo_code varchar(32);
    declare v_avail_cal_flag int;
    declare v_combo_posi_id bigint;
    declare v_open_posi_date int;

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
    SET v_out_acco = p_out_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_asset_type = p_asset_type;
    SET v_stock_type = p_stock_type;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_strike_id = p_strike_id;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_all_fee = p_all_fee;
    SET v_par_value = p_par_value;
    SET v_intrst_days = p_intrst_days;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_remark_info = p_remark_info;
    SET v_repo_strike_id = p_repo_strike_id;
    SET v_repo_days = p_repo_days;
    SET v_repo_cale_days = p_repo_cale_days;
    SET v_repo_back_date = p_repo_back_date;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_order_oper_way = p_order_oper_way;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_exgp_cost_amt = p_exgp_cost_amt;
    SET v_exgp_intrst_cost_amt = p_exgp_intrst_cost_amt;
    SET v_exgp_curr_qty = p_exgp_curr_qty;
    SET v_asac_cost_amt = p_asac_cost_amt;
    SET v_asac_intrst_cost_amt = p_asac_intrst_cost_amt;
    SET v_asac_curr_qty = p_asac_curr_qty;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_strike_qty = 0;
    SET v_comm_strike_amt = 0;
    SET v_is_record_jour = 1;
    SET v_strike_fee = 0;
    SET v_open_close_permission = 0;
    SET v_target_stock_code_no = 0;
    SET v_comm_cancel_qty = 0;
    SET v_wtdraw_qty = 0;
    SET v_comm_dir = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_status = "0";
    SET v_calc_dir = 1;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_rsp_info = " ";
    SET v_strike_occur_amt = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_strike_occur_qty = 0;
    SET v_repo_order_id = 0;
    SET v_combo_code = " ";
    SET v_avail_cal_flag = 0;
    SET v_combo_posi_id = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @成交费用# = @全部费用#; */
    set v_strike_fee = v_all_fee;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;

    /* set @目标证券代码编号# =0; */
    set v_target_stock_code_no =0;

    /* [事务开始] */
    START TRANSACTION;

        #第一步，锁定指令，回溯订单

        /* if @指令序号# > 0 then */
        if v_comm_id > 0 then

            /* set @指令撤销数量# = 0; */
            set v_comm_cancel_qty = 0;

            /* set @撤单数量# = @成交数量#; */
            set v_wtdraw_qty = v_strike_qty;

            /* 调用【原子_交易证券_指令_成交回溯更新体外指令】*/
            call db_tdsecu.pra_tdseap_BackStrikeUpdateExterComm(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_comm_id,
                v_wtdraw_qty,
                v_strike_qty,
                v_strike_amt,
                v_error_code,
                v_error_info,
                v_comm_dir,
                v_comm_cancel_qty,
                v_comm_strike_qty,
                v_comm_strike_amt,
                v_limit_actual_price,
                v_comm_status);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.26.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_成交回溯更新体外指令出现错误！',v_mysql_message);
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

            /* 调用【原子_交易证券_公用_计算撤单指令变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetCancelCommOccurAmtAndQty(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_stock_type,
                v_comm_dir,
                v_limit_actual_price,
                v_wtdraw_qty,
                v_comm_status,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_calc_dir,
                v_error_code,
                v_error_info,
                v_comm_occur_amt,
                v_comm_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.26.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算撤单指令变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

        /* set @备注信息# = concat('体外指令成交回溯，备注信息：',@备注信息#); */
        set v_remark_info = concat('体外指令成交回溯，备注信息：',v_remark_info);

        /* 调用【原子_交易证券_交易_回溯体外指令订单】*/
        call db_tdsecu.pra_tdsetd_BackExterCommOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_date,
            v_order_id,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.26.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_回溯体外指令订单出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @交易变动金额# = 0; */
        set v_trade_occur_amt = 0;

        /* set @交易变动数量# = 0; */
        set v_trade_occur_qty = 0;
        #第二步，回溯订单回报与成交回报

        /* set @回报信息# = '体外指令回溯成交。'; */
        set v_rsp_info = '体外指令回溯成交。';

        /* 调用【原子_交易证券_报盘_成交回溯更新回报】*/
        call db_tdsecu.pra_tdserp_BackStrikeUpdateRspStatus(
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
            v_report_date,
            v_report_no,
            v_strike_date,
            v_strike_no,
            v_order_dir,
            v_rsp_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.26.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_成交回溯更新回报出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #第三步，回溯成交

        /* 调用【原子_交易证券_报盘_成交回溯更新成交记录】*/
        call db_tdsecu.pra_tdserp_BackStrikeUpdateStrikeFlag(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_date,
            v_order_id,
            v_strike_id,
            v_comm_id,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.26.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_成交回溯更新成交记录出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_交易证券_公用_计算成交变动金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetStrikeOccurAmtAndQty(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_stock_type,
            v_order_dir,
            v_strike_qty,
            v_strike_price,
            v_strike_amt,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_all_fee,
            v_error_code,
            v_error_info,
            v_strike_occur_amt,
            v_strike_bond_accr_intrst,
            v_strike_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.26.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算成交变动金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @回购成交序号# = @成交序号#; */
        set v_repo_strike_id = v_strike_id;

        /* set @回购委托序号# = @订单序号#; */
        set v_repo_order_id = v_order_id;

        /* set @成交变动数量# = -1 * @成交变动数量#; */
        set v_strike_occur_qty = -1 * v_strike_occur_qty;

        /* set @成交变动金额# = -1 * @成交变动金额#; */
        set v_strike_occur_amt = -1 * v_strike_occur_amt;

        /* set @成交数量# = -1 * @成交数量#; */
        set v_strike_qty = -1 * v_strike_qty;

        /* set @组合代码# = " "; */
        set v_combo_code = " ";
        #更新资金持仓变动

        /* set @可用计算标志# = 0; */
        set v_avail_cal_flag = 0;

        /* set @组合持仓序号# = 0; */
        set v_combo_posi_id = 0;

        /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
        call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
            v_exch_crncy_type,
            v_comm_id,
            v_order_id,
            v_exch_no,
            v_stock_code,
            v_stock_type,
            v_asset_type,
            v_order_dir,
            v_impawn_ratio,
            v_stock_acco_no,
            v_stock_code_no,
            v_trade_code_no,
            v_target_code_no,
            v_comm_occur_amt,
            v_comm_occur_qty,
            v_trade_occur_amt,
            v_trade_occur_qty,
            v_is_record_jour,
            v_order_oper_way,
            v_busi_opor_no,
            v_open_close_permission,
            v_avail_cal_flag,
            v_combo_code,
            v_combo_posi_id,
            v_target_stock_code_no,
            v_error_code,
            v_error_info,
            v_open_posi_date);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.26.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_交易证券_账户_更新成交资金持仓】*/
        call db_tdsecu.pra_tdseac_UpdateStrikeCashPosi(
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
            v_crncy_type,
            v_exch_crncy_type,
            v_order_dir,
            v_comm_id,
            v_strike_id,
            v_exch_no,
            v_stock_code,
            v_stock_acco_no,
            v_stock_code_no,
            v_trade_code_no,
            v_target_code_no,
            v_asset_type,
            v_stock_type,
            v_strike_occur_amt,
            v_strike_occur_qty,
            v_trade_occur_amt,
            v_trade_occur_qty,
            v_impawn_ratio,
            v_repo_order_id,
            v_repo_strike_id,
            v_strike_no,
            v_strike_date,
            v_strike_time,
            v_strike_qty,
            v_strike_price,
            v_strike_amt,
            v_strike_fee,
            v_par_value,
            v_net_price_flag,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_repo_days,
            v_repo_cale_days,
            v_repo_back_date,
            v_capit_reback_days,
            v_posi_reback_days,
            v_is_record_jour,
            v_order_oper_way,
            v_cost_calc_type,
            v_exgp_cost_amt,
            v_exgp_intrst_cost_amt,
            v_exgp_curr_qty,
            v_asac_cost_amt,
            v_asac_intrst_cost_amt,
            v_asac_curr_qty,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_combo_code,
            v_combo_posi_id,
            v_order_date,
            v_target_stock_code_no,
            v_error_code,
            v_error_info,
            v_open_posi_date);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.26.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新成交资金持仓出现错误！',v_mysql_message);
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
    SET p_comm_strike_qty = v_comm_strike_qty;
    SET p_comm_strike_amt = v_comm_strike_amt;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_新增补单订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_AddMissOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_AddMissOrder(
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
    IN p_trade_acco varchar(32),
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_order_dir int,
    IN p_price_type int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_order_status varchar(2),
    IN p_all_fee decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_compli_trig_id bigint,
    IN p_par_value decimal(16,9),
    IN p_impawn_ratio decimal(18,12),
    IN p_net_price_flag int,
    IN p_intrst_days int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_rsp_info varchar(255),
    IN p_exgp_busi_config_str varchar(64),
    IN p_exgp_avail_amt decimal(18,4),
    IN p_asac_busi_config_str varchar(64),
    IN p_asac_avail_amt decimal(18,4),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    IN p_nav_asset decimal(18,4),
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_busi_limit_str varchar(2048),
    IN p_cost_calc_type int,
    IN p_asset_acco_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_id bigint,
    OUT p_record_count int,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_order_oper_way varchar(2),
    OUT p_debt_type int,
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
    declare v_trade_acco varchar(32);
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_compli_trig_id bigint;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_rsp_info varchar(255);
    declare v_exgp_busi_config_str varchar(64);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_busi_config_str varchar(64);
    declare v_asac_avail_amt decimal(18,4);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_nav_asset decimal(18,4);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_busi_limit_str varchar(2048);
    declare v_cost_calc_type int;
    declare v_asset_acco_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_id bigint;
    declare v_record_count int;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_debt_type int;
    declare v_update_times int;
    declare v_order_rsp_status varchar(2);
    declare v_rsp_id bigint;
    declare v_invest_type int;
    declare v_default_exch_group_no int;
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_registration_agency varchar(32);
    declare v_contra_no varchar(32);
    declare v_order_amt decimal(18,4);
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);
    declare v_comm_id bigint;
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_batch_no int;
    declare v_exter_comm_flag int;
    declare v_comm_date int;
    declare v_comm_executor int;
    declare v_comm_oper_way varchar(2);
    declare v_comm_amt decimal(18,4);
    declare v_exgp_target_code_avail_qty decimal(18,2);
    declare v_exgp_trade_code_avail_qty decimal(18,2);
    declare v_asac_target_code_avail_qty decimal(18,2);
    declare v_asac_trade_code_avail_qty decimal(18,2);
    declare v_min_unit int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_exist_debt_flag int;
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_busi_opor_no int;
    declare v_avail_cal_flag int;
    declare v_debt_qty decimal(18,2);
    declare v_open_posi_date int;

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
    SET v_trade_acco = p_trade_acco;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir = p_order_dir;
    SET v_price_type = p_price_type;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_order_status = p_order_status;
    SET v_all_fee = p_all_fee;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_par_value = p_par_value;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_net_price_flag = p_net_price_flag;
    SET v_intrst_days = p_intrst_days;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_rsp_info = p_rsp_info;
    SET v_exgp_busi_config_str = p_exgp_busi_config_str;
    SET v_exgp_avail_amt = p_exgp_avail_amt;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_asac_avail_amt = p_asac_avail_amt;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_nav_asset = p_nav_asset;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_id = 0;
    SET v_record_count = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_order_oper_way = " ";
    SET v_debt_type = 0;
    SET v_update_times = 1;
    SET v_order_rsp_status = "0";
    SET v_rsp_id = 0;
    SET v_invest_type = 0;
    SET v_default_exch_group_no = 0;
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_registration_agency = " ";
    SET v_contra_no = " ";
    SET v_order_amt = 0;
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;
    SET v_comm_id = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_batch_no = 0;
    SET v_exter_comm_flag = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_executor = 0;
    SET v_comm_oper_way = " ";
    SET v_comm_amt = 0;
    SET v_exgp_target_code_avail_qty = 0;
    SET v_exgp_trade_code_avail_qty = 0;
    SET v_asac_target_code_avail_qty = 0;
    SET v_asac_trade_code_avail_qty = 0;
    SET v_min_unit = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_remark_info = " ";
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_exist_debt_flag = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_busi_opor_no = 0;
    SET v_avail_cal_flag = 0;
    SET v_debt_qty = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @订单回报状态# = 《订单回报状态-已报》; */
        set v_order_rsp_status = "1";

        /* 调用【原子_交易证券_报盘_检查补单订单重复回报】*/
        call db_tdsecu.pra_tdserp_CheckMissOrderRspDup(
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
            v_stock_acco,
            v_stock_code,
            v_order_price,
            v_order_qty,
            v_order_dir,
            v_report_date,
            v_report_time,
            v_report_no,
            v_rsp_info,
            v_order_rsp_status,
            v_price_type,
            v_error_code,
            v_error_info,
            v_rsp_id,
            v_order_date,
            v_order_id,
            v_strike_amt,
            v_strike_qty,
            v_strike_bond_accr_intrst,
            v_order_oper_way,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.31.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_检查补单订单重复回报出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @投资类型#=《投资类型-二级市场交易性金融资产》 ; */
        set v_invest_type=1 ;
        #只有基金赎回,如果除默认交易组之外，只有一个交易组有补体外单的这笔持仓，修改组合状态为破坏。

        /* if @订单方向# = 《订单方向-基金赎回》 then */
        if v_order_dir = 10 then

            /* set @默认交易组编号# = @交易组编号#; */
            set v_default_exch_group_no = v_exch_group_no;

            /* 调用【原子_交易证券_账户_非默认交易组唯一存在持仓破坏组合】*/
            call db_tdsecu.pra_tdseac_DealNotDefaultExgpBroke(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_co_no,
                v_pd_no,
                v_default_exch_group_no,
                v_init_date,
                v_stock_code_no,
                v_asset_acco_no,
                v_stock_acco_no,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.31.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_非默认交易组唯一存在持仓破坏组合出现错误！',v_mysql_message);
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


    /* [检查正常返回][substring(@资产账户业务控制配置串#,11,1) <> 《补单回报处理方式-补委托处理》] */
    if substring(v_asac_busi_config_str,11,1) <> 2 then
        leave label_pro;
    end if;


    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;

    /* set @目标证券代码# =""; */
    set v_target_stock_code ="";

    /* set @目标证券代码编号# =0; */
    set v_target_stock_code_no =0;

    /* set @登记机构# = ""; */
    set v_registration_agency = "";

    /* set @交易账户# = ""; */
    set v_trade_acco = "";

    /* set @合同编号# = ""; */
    set v_contra_no = "";
    #这里原本有一个系统参数3005 是否进行补单操作

    /* if @订单序号# = 0 then */
    if v_order_id = 0 then
        #计算交易冻结金额

        /* if @资产账户类型# = 《资产账户类型-融资融券》 then */
        if v_asset_acco_type = 5 then

            /* set @订单金额# = 0; */
            set v_order_amt = 0;

            /* 调用【原子_交易证券_公用_计算融资融券交易冻结金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetFinaLoanExchFrozenAmtAndQty(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_stock_type,
                v_order_dir,
                v_order_price,
                v_order_qty,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_all_fee,
                v_order_amt,
                v_error_code,
                v_error_info,
                v_trade_frozen_amt,
                v_trade_frozen_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.31.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券交易冻结金额和数量出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        else

            /* 调用【原子_交易证券_公用_计算交易冻结金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetExchFrozenAmtAndQty(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_stock_type,
                v_order_dir,
                v_order_price,
                v_order_qty,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_all_fee,
                v_error_code,
                v_error_info,
                v_trade_frozen_amt,
                v_trade_frozen_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.31.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算交易冻结金额和数量出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        end if;

        /* set @订单冻结金额# = @交易冻结金额#; */
        set v_order_frozen_amt = v_trade_frozen_amt;

        /* set @订单冻结数量# = @交易冻结数量#; */
        set v_order_frozen_qty = v_trade_frozen_qty;
        #检查业务合法性。应放在事务层第一个处理
        #[原子_交易证券_交易_检查交易业务合法性]

        /* set @订单日期# = @申报日期#; */
        set v_order_date = v_report_date;
        #补单肯定与指令无关，不需要指令相关处理代码

        /* if @指令序号# <> 0 then */
        if v_comm_id <> 0 then

            /* 调用【原子_交易证券_指令_校验订单指令】*/
            call db_tdsecu.pra_tdseap_CheckOrderComm(
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
                v_price_type,
                v_error_code,
                v_error_info,
                v_limit_actual_price,
                v_comm_batch_no,
                v_exter_comm_flag,
                v_comm_date,
                v_comm_executor,
                v_comm_opor,
                v_comm_oper_way,
                v_comm_amt);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.31.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_校验订单指令出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        end if;
        #交易证券子系统检查，不需要检查交易可用资金、可用持仓等

        /* set @交易组业务控制配置串# = "00000"; */
        set v_exgp_busi_config_str = "00000";

        /* set @资产账户业务控制配置串# = "00000"; */
        set v_asac_busi_config_str = "00000";

        /* set @交易组标的代码可用数量# = 0; */
        set v_exgp_target_code_avail_qty = 0;

        /* set @交易组交易代码可用数量# = 0; */
        set v_exgp_trade_code_avail_qty = 0;

        /* set @资产账户标的代码可用数量# = 0; */
        set v_asac_target_code_avail_qty = 0;

        /* set @资产账户交易代码可用数量# = 0; */
        set v_asac_trade_code_avail_qty = 0;

        /* set @最小单位# = 0; */
        set v_min_unit = 0;
        #[原子_交易证券_交易_校验新增订单]

        /* [事务开始] */
        START TRANSACTION;


            /* set @指令变动金额#=0; */
            set v_comm_occur_amt=0;

            /* set @指令变动数量#=0; */
            set v_comm_occur_qty=0;

            /* set @订单状态# = 《订单状态-已报》; */
            set v_order_status = "2";

            /* set @全部费用# = 0; */
            set v_all_fee = 0;

            /* set @印花税# = 0; */
            set v_stamp_tax = 0;

            /* set @过户费# = 0; */
            set v_trans_fee = 0;

            /* set @经手费# = 0; */
            set v_brkage_fee = 0;

            /* set @证管费# = 0; */
            set v_SEC_charges = 0;

            /* set @其他费用# = 0; */
            set v_other_fee = 0;

            /* set @交易佣金# = 0; */
            set v_trade_commis = 0;

            /* set @其他佣金# = 0; */
            set v_other_commis = 0;

            /* set @备注信息# = "报盘补单新增补单订单！"; */
            set v_remark_info = "报盘补单新增补单订单！";

            /* set @订单操作方式# = 《订单操作方式-报盘机补单》; */
            set v_order_oper_way = "33";

            /* set @组合代码# = " "; */
            set v_combo_code = " ";

            /* set @组合持仓序号#=0; */
            set v_combo_posi_id=0;

            /* set @存在负债标志# = 《存在负债标志-不存在》; */
            set v_exist_debt_flag = 1;
            #新增订单

            /* 调用【原子_交易证券_交易_新增订单】*/
            call db_tdsecu.pra_tdsetd_AddOrder(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_co_no,
                v_comm_opor,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_pass_no,
                v_out_acco,
                v_exch_crncy_type,
                v_exch_no,
                v_stock_acco_no,
                v_stock_acco,
                v_stock_code_no,
                v_stock_code,
                v_target_code_no,
                v_trade_code_no,
                v_stock_type,
                v_asset_type,
                v_external_no,
                v_comm_id,
                v_comm_batch_no,
                v_order_batch_no,
                v_order_date,
                v_order_dir,
                v_price_type,
                v_order_price,
                v_order_qty,
                v_order_status,
                v_report_date,
                v_report_time,
                v_report_no,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_net_price_flag,
                v_intrst_days,
                v_par_value,
                v_impawn_ratio,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_compli_trig_id,
                v_remark_info,
                v_order_oper_way,
                v_exter_comm_flag,
                v_cost_calc_type,
                v_combo_code,
                v_combo_posi_id,
                v_target_stock_code,
                v_target_stock_code_no,
                v_registration_agency,
                v_trade_acco,
                v_contra_no,
                v_asset_acco_type,
                v_exist_debt_flag,
                v_error_code,
                v_error_info,
                v_order_id,
                v_order_time,
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.31.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_新增订单出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @记录个数# = 1; */
            set v_record_count = 1;
            #计算下单交易变动金额和数量

            /* if @资产账户类型# = 《资产账户类型-融资融券》 then */
            if v_asset_acco_type = 5 then

                /* 调用【原子_交易证券_公用_计算融资融券交易变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetFinaLoanTradeOccurAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_order_dir,
                    v_order_qty,
                    v_order_price,
                    v_order_frozen_amt,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_error_code,
                    v_error_info,
                    v_trade_occur_amt,
                    v_trade_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.31.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券交易变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #处理订单资金持仓数据，保护指令变动和交易的变动

                /* set @业务操作员编号# = @操作员编号#; */
                set v_busi_opor_no = v_opor_no;

                /* set @可用计算标志# = 0; */
                set v_avail_cal_flag = 0;

                /* set @负债数量# = 0; */
                set v_debt_qty = 0;

                /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
                call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
                    v_exch_crncy_type,
                    v_comm_id,
                    v_order_id,
                    v_exch_no,
                    v_stock_code,
                    v_stock_type,
                    v_asset_type,
                    v_order_dir,
                    v_impawn_ratio,
                    v_stock_acco_no,
                    v_stock_code_no,
                    v_trade_code_no,
                    v_target_code_no,
                    v_comm_occur_amt,
                    v_comm_occur_qty,
                    v_trade_occur_amt,
                    v_trade_occur_qty,
                    v_is_record_jour,
                    v_order_oper_way,
                    v_busi_opor_no,
                    v_open_close_permission,
                    v_avail_cal_flag,
                    v_combo_code,
                    v_combo_posi_id,
                    v_target_stock_code_no,
                    v_error_code,
                    v_error_info,
                    v_open_posi_date);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.31.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* 调用【原子_交易证券_账户_更新融资融券指令交易资金持仓负债】*/
                call db_tdsecu.pra_tdseac_UpdateFinaLoanApprDebt(
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
                    v_exch_crncy_type,
                    v_comm_id,
                    v_exch_no,
                    v_stock_code,
                    v_stock_type,
                    v_asset_type,
                    v_invest_type,
                    v_order_dir,
                    v_stock_acco_no,
                    v_stock_code_no,
                    v_trade_code_no,
                    v_comm_occur_amt,
                    v_comm_occur_qty,
                    v_trade_occur_amt,
                    v_trade_occur_qty,
                    v_is_record_jour,
                    v_debt_qty,
                    v_error_code,
                    v_error_info,
                    v_debt_type);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.31.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新融资融券指令交易资金持仓负债出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            else

                /* 调用【原子_交易证券_公用_计算下单交易变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetOrderTradeOccurAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_order_dir,
                    v_order_qty,
                    v_order_price,
                    v_order_frozen_amt,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_error_code,
                    v_error_info,
                    v_trade_occur_amt,
                    v_trade_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.31.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算下单交易变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #处理订单资金持仓数据，保护指令变动和交易的变动

                /* set @业务操作员编号# = @操作员编号#; */
                set v_busi_opor_no = v_opor_no;

                /* set @可用计算标志# = 0; */
                set v_avail_cal_flag = 0;

                /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
                call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
                    v_exch_crncy_type,
                    v_comm_id,
                    v_order_id,
                    v_exch_no,
                    v_stock_code,
                    v_stock_type,
                    v_asset_type,
                    v_order_dir,
                    v_impawn_ratio,
                    v_stock_acco_no,
                    v_stock_code_no,
                    v_trade_code_no,
                    v_target_code_no,
                    v_comm_occur_amt,
                    v_comm_occur_qty,
                    v_trade_occur_amt,
                    v_trade_occur_qty,
                    v_is_record_jour,
                    v_order_oper_way,
                    v_busi_opor_no,
                    v_open_close_permission,
                    v_avail_cal_flag,
                    v_combo_code,
                    v_combo_posi_id,
                    v_target_stock_code_no,
                    v_error_code,
                    v_error_info,
                    v_open_posi_date);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.31.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            end if;
            #更新订单回报表状态

            /* 调用【原子_交易证券_报盘_更新订单回报状态】*/
            call db_tdsecu.pra_tdserp_UpdateOrderRspStatus(
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
                SET v_error_code = "tdsecuT.5.31.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_更新订单回报状态出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


        /* [事务结束] */
        COMMIT;

    #elseif @订单操作方式# = 《订单操作方式-报盘机补单》 then
    #    #更新状态
    #    [事务开始]
    #        [原子_交易证券_交易_更新订单状态]
    #    [事务结束]
    #    set @更新次数# = @更新次数# + 1;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_id = v_order_id;
    SET p_record_count = v_record_count;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_order_oper_way = v_order_oper_way;
    SET p_debt_type = v_debt_type;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_组合可用不足处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_ComboNotEnoughDeal;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_ComboNotEnoughDeal(
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
    IN p_exch_group_no int,
    IN p_out_acco varchar(32),
    IN p_stock_acco varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_strike_date int,
    IN p_strike_id bigint,
    IN p_order_dir int,
    IN p_curr_strike_amt decimal(18,4),
    IN p_curr_strike_qty decimal(18,2),
    IN p_exgp_avail_amt decimal(18,4),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_capit_reback_days int,
    IN p_stock_acco_no int,
    IN p_posi_reback_days int,
    IN p_all_fee decimal(18,4),
    IN p_order_oper_way varchar(2),
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
    declare v_exch_group_no int;
    declare v_out_acco varchar(32);
    declare v_stock_acco varchar(16);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_strike_date int;
    declare v_strike_id bigint;
    declare v_order_dir int;
    declare v_curr_strike_amt decimal(18,4);
    declare v_curr_strike_qty decimal(18,2);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_capit_reback_days int;
    declare v_stock_acco_no int;
    declare v_posi_reback_days int;
    declare v_all_fee decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_shsz_comm_avail_amt decimal(18,4);
    declare v_hk_comm_avail_amt decimal(18,4);
    declare v_shsz_trade_avail_amt decimal(18,4);
    declare v_hk_trade_avail_amt decimal(18,4);
    declare v_comm_avail_amt decimal(18,4);
    declare v_trade_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);
    declare v_amt_diff decimal(18,4);
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_diff_qty decimal(18,2);
    declare v_comm_avail_qty decimal(18,2);
    declare v_trade_avail_qty decimal(18,2);
    declare v_static_avail_qty decimal(18,2);

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
    SET v_exch_group_no = p_exch_group_no;
    SET v_out_acco = p_out_acco;
    SET v_stock_acco = p_stock_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_strike_date = p_strike_date;
    SET v_strike_id = p_strike_id;
    SET v_order_dir = p_order_dir;
    SET v_curr_strike_amt = p_curr_strike_amt;
    SET v_curr_strike_qty = p_curr_strike_qty;
    SET v_exgp_avail_amt = p_exgp_avail_amt;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_all_fee = p_all_fee;
    SET v_order_oper_way = p_order_oper_way;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_shsz_comm_avail_amt = 0;
    SET v_hk_comm_avail_amt = 0;
    SET v_shsz_trade_avail_amt = 0;
    SET v_hk_trade_avail_amt = 0;
    SET v_comm_avail_amt = 0;
    SET v_trade_avail_amt = 0;
    SET v_static_avail_amt = 0;
    SET v_amt_diff = 0;
    SET v_occur_amt = 0;
    SET v_occur_qty = 0;
    SET v_diff_qty = 0;
    SET v_comm_avail_qty = 0;
    SET v_trade_avail_qty = 0;
    SET v_static_avail_qty = 0;

    
    label_pro:BEGIN
    
    #判断可用是否为负

    /* if @订单操作方式# = 《订单操作方式-报盘机补单》  then */
    if v_order_oper_way = "33"  then

        /* if  @订单方向# = 《订单方向-基金申购》 then */
        if  v_order_dir = 9 then

            /* 调用【原子_交易证券_账户_计算交易组资金可用】*/
            call db_tdsecu.pra_tdseac_CalcExgpCashAvail(
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
                v_crncy_type,
                v_exch_crncy_type,
                v_buy_ref_rate,
                v_sell_ref_rate,
                v_capit_reback_days,
                v_error_code,
                v_error_info,
                v_shsz_comm_avail_amt,
                v_hk_comm_avail_amt,
                v_shsz_trade_avail_amt,
                v_hk_trade_avail_amt,
                v_comm_avail_amt,
                v_trade_avail_amt,
                v_static_avail_amt);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.32.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组资金可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @金额差额# = @交易组可用金额# + @交易端可用金额#; */
            set v_amt_diff = v_exgp_avail_amt + v_trade_avail_amt;

            /* if @金额差额# < 0 then */
            if v_amt_diff < 0 then

                /* set @变动金额# = @当笔成交金额#+@全部费用#; */
                set v_occur_amt = v_curr_strike_amt+v_all_fee;

                /* set @变动数量# = 0; */
                set v_occur_qty = 0;

                /* set @数量差额# = 0; */
                set v_diff_qty = 0;

                /* 调用【原子_交易证券_报盘_组合可用不足处理】*/
                call db_tdsecu.pra_tdserp_ComboNotEnoughDeal(
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
                    v_exch_group_no,
                    v_out_acco,
                    v_stock_acco,
                    v_exch_no,
                    v_stock_code,
                    v_stock_code_no,
                    v_order_date,
                    v_order_id,
                    v_strike_date,
                    v_strike_id,
                    v_order_dir,
                    v_occur_amt,
                    v_occur_qty,
                    v_amt_diff,
                    v_diff_qty,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.32.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_组合可用不足处理出现错误！',v_mysql_message);
                    end if;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    leave label_pro;
                end if;

            end if;

        /* elseif @订单方向# = 《订单方向-基金赎回》 then */
        elseif v_order_dir = 10 then

            /* 调用【原子_交易证券_账户_计算交易组持仓可用】*/
            call db_tdsecu.pra_tdseac_CalcExgpPosiAvail(
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
                v_stock_acco_no,
                v_stock_code_no,
                v_posi_reback_days,
                v_error_code,
                v_error_info,
                v_comm_avail_qty,
                v_trade_avail_qty,
                v_static_avail_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.32.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组持仓可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @数量差额# = @交易组可用数量# + @交易端可用数量#; */
            set v_diff_qty = v_exgp_avail_qty + v_trade_avail_qty;

            /* if @数量差额# < 0 then */
            if v_diff_qty < 0 then

                /* set @变动数量# = @当笔成交数量#; */
                set v_occur_qty = v_curr_strike_qty;

                /* set @变动金额# = 0; */
                set v_occur_amt = 0;

                /* set @金额差额# = 0; */
                set v_amt_diff = 0;

                /* 调用【原子_交易证券_报盘_组合可用不足处理】*/
                call db_tdsecu.pra_tdserp_ComboNotEnoughDeal(
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
                    v_exch_group_no,
                    v_out_acco,
                    v_stock_acco,
                    v_exch_no,
                    v_stock_code,
                    v_stock_code_no,
                    v_order_date,
                    v_order_id,
                    v_strike_date,
                    v_strike_id,
                    v_order_dir,
                    v_occur_amt,
                    v_occur_qty,
                    v_amt_diff,
                    v_diff_qty,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.32.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_组合可用不足处理出现错误！',v_mysql_message);
                    end if;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    leave label_pro;
                end if;

            end if;
        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_查询订单回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_QueryOrderRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_QueryOrderRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_order_dir_str varchar(1024),
    IN p_order_rsp_status_str varchar(64),
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
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_order_dir_str varchar(1024);
    declare v_order_rsp_status_str varchar(64);
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
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_rsp_status_str = p_order_rsp_status_str;
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

    /* if @订单回报状态串# <> " " then */
    if v_order_rsp_status_str <> " " then

        /* set @订单回报状态串#=concat(";", @订单回报状态串#, ";"); */
        set v_order_rsp_status_str=concat(";", v_order_rsp_status_str, ";");
    end if;

    /* if @处理状态串# <> " " then */
    if v_deal_status_str <> " " then

        /* set @处理状态串#=concat(";", @处理状态串#, ";"); */
        set v_deal_status_str=concat(";", v_deal_status_str, ";");
    end if;

    /* 调用【原子_交易证券_报盘_查询订单回报】*/
    call db_tdsecu.pra_tdserp_QueryOrderRsp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no_str,
        v_stock_acco,
        v_stock_code,
        v_order_dir_str,
        v_order_rsp_status_str,
        v_deal_status_str,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.5.101.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_查询订单回报出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_报盘_查询成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_QueryStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_QueryStrikeRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
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
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
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
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
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

    /* 调用【原子_交易证券_报盘_查询成交回报】*/
    call db_tdsecu.pra_tdserp_QueryStrikeRsp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no_str,
        v_stock_acco,
        v_stock_code,
        v_order_dir_str,
        v_deal_status_str,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.5.121.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_查询成交回报出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_报盘_查询成交明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_QueryStrikeDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_QueryStrikeDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_order_oper_way varchar(2),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_batch_no int,
    IN p_order_dir_str varchar(1024),
    IN p_exter_comm_flag int,
    IN p_record_valid_flag int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_combo_code varchar(32),
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
    declare v_order_oper_way varchar(2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_combo_code varchar(32);
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
    SET v_order_oper_way = p_order_oper_way;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_record_valid_flag = p_record_valid_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_combo_code = p_combo_code;
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

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串#=concat(";", @证券类型串#, ";"); */
        set v_stock_type_str=concat(";", v_stock_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* if @操作员机构编号# = 9999 then */
    if v_opor_co_no = 9999 then

        /* set @机构编号权限串# = " "; */
        set v_co_no_rights_str = " ";

        /* set @产品编号权限串# = " "; */
        set v_pd_no_rights_str = " ";

        /* set @交易组编号权限串# = " "; */
        set v_exch_group_no_rights_str = " ";
    end if;

    /* 调用【原子_交易证券_报盘_查询成交明细】*/
    call db_tdsecu.pra_tdserp_QueryStrikeDetail(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_opor_no,
        v_order_oper_way,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_comm_id,
        v_comm_batch_no,
        v_order_dir_str,
        v_exter_comm_flag,
        v_record_valid_flag,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_order_batch_no,
        v_combo_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.5.122.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_查询成交明细出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_报盘_查询成交明细历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_QueryStrikeDetail_His;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_QueryStrikeDetail_His(
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
    IN p_order_oper_way varchar(2),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_batch_no int,
    IN p_order_dir_str varchar(1024),
    IN p_exter_comm_flag int,
    IN p_record_valid_flag int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_combo_code varchar(32),
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
    declare v_order_oper_way varchar(2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_combo_code varchar(32);
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
    SET v_order_oper_way = p_order_oper_way;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_record_valid_flag = p_record_valid_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_combo_code = p_combo_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdsecuT.5.123.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;

    #[检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#]
    #[检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][@开始日期#,@结束日期#]
    #if @指定行数#>500 or @指定行数# <1 then

    /* if @指定行数# <1 then */
    if v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串#=concat(";", @证券类型串#, ";"); */
        set v_stock_type_str=concat(";", v_stock_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* if @操作员机构编号# = 9999 then */
    if v_opor_co_no = 9999 then

        /* set @机构编号权限串# = " "; */
        set v_co_no_rights_str = " ";

        /* set @产品编号权限串# = " "; */
        set v_pd_no_rights_str = " ";

        /* set @交易组编号权限串# = " "; */
        set v_exch_group_no_rights_str = " ";
    end if;

    /* 调用【原子_交易证券_报盘_查询成交明细历史】*/
    call db_tdsecu.pra_tdserp_QueryStrikeDetail_His(
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
        v_order_oper_way,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_comm_id,
        v_comm_batch_no,
        v_order_batch_no,
        v_order_dir_str,
        v_exter_comm_flag,
        v_record_valid_flag,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_combo_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.5.123.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_查询成交明细历史出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_报盘_查询成交汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_QueryStrikeSummary;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_QueryStrikeSummary(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_order_oper_way varchar(2),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_order_batch_no int,
    IN p_order_dir_str varchar(1024),
    IN p_exter_comm_flag int,
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
    declare v_order_oper_way varchar(2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_order_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_exter_comm_flag int;
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
    SET v_order_oper_way = p_order_oper_way;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_comm_id = p_comm_id;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
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

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串#=concat(";", @证券类型串#, ";"); */
        set v_stock_type_str=concat(";", v_stock_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* 调用【原子_交易证券_报盘_查询成交汇总】*/
    call db_tdsecu.pra_tdserp_QueryStrikeSummary(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_opor_no,
        v_order_oper_way,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_comm_id,
        v_order_batch_no,
        v_order_dir_str,
        v_exter_comm_flag,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.5.124.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_查询成交汇总出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_报盘_查询成交汇总历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_QueryStrikeSummary_His;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_QueryStrikeSummary_His(
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
    IN p_order_oper_way varchar(2),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_order_batch_no int,
    IN p_order_dir_str varchar(1024),
    IN p_exter_comm_flag int,
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
    declare v_order_oper_way varchar(2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_order_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_exter_comm_flag int;
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
    SET v_order_oper_way = p_order_oper_way;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_comm_id = p_comm_id;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
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
        
        SET v_error_code = "tdsecuT.5.125.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdsecuT.5.125.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;

    #[检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][@开始日期#,@结束日期#]
    #if @指定行数#>500 or @指定行数# <1 then

    /* if  @指定行数# <1 then */
    if  v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串#=concat(";", @证券类型串#, ";"); */
        set v_stock_type_str=concat(";", v_stock_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* 调用【原子_交易证券_报盘_查询成交汇总历史】*/
    call db_tdsecu.pra_tdserp_QueryStrikeSummary_His(
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
        v_order_oper_way,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_comm_id,
        v_order_batch_no,
        v_order_dir_str,
        v_exter_comm_flag,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.5.125.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_查询成交汇总历史出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_报盘_查询体外交易差额记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_QueryOutTradeDiffRecord;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_QueryOutTradeDiffRecord(
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
    IN p_stock_code_no int,
    IN p_order_dir_str varchar(1024),
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
    declare v_stock_code_no int;
    declare v_order_dir_str varchar(1024);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_order_dir_str = p_order_dir_str;
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

    /* 调用【原子_交易证券_报盘_查询体外交易差额记录】*/
    call db_tdsecu.pra_tdserp_QueryOutTradeDiffRecord(
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
        v_stock_code_no,
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
        SET v_error_code = "tdsecuT.5.126.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_查询体外交易差额记录出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_报盘_查询历史体外交易差额记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_QueryOutTradeDiffRecord_His;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_QueryOutTradeDiffRecord_His(
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
    IN p_stock_code_no int,
    IN p_order_dir_str varchar(1024),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_order_dir_str varchar(1024);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdsecuT.5.127.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdsecuT.5.127.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>93 then
        
        SET v_error_code = "tdsecuT.5.127.255";
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

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* 调用【原子_交易证券_报盘_查询历史体外交易差额记录】*/
    call db_tdsecu.pra_tdserp_QueryOutTradeDiffRecord_His(
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
        v_stock_code_no,
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
        SET v_error_code = "tdsecuT.5.127.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_查询历史体外交易差额记录出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_报盘_导入成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_ImportStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_ImportStrikeRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
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
    IN p_repo_days int,
    IN p_strike_deal_type int,
    IN p_repo_cale_days int,
    IN p_repo_back_date int,
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_exgp_cost_amt decimal(18,4),
    IN p_exgp_intrst_cost_amt decimal(18,4),
    IN p_exgp_curr_qty decimal(18,2),
    IN p_asac_cost_amt decimal(18,4),
    IN p_asac_intrst_cost_amt decimal(18,4),
    IN p_asac_curr_qty decimal(18,2),
    IN p_rsp_id bigint,
    IN p_order_id bigint,
    IN p_sys_config_str varchar(64),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_combo_code varchar(32),
    IN p_combo_posi_id bigint,
    IN p_asset_acco_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_target_code varchar(6),
    OUT p_order_date int,
    OUT p_order_batch_no int,
    OUT p_report_time int,
    OUT p_comm_date int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_external_no bigint,
    OUT p_busi_opor_no int,
    OUT p_order_oper_way varchar(2),
    OUT p_total_strike_amt decimal(18,4),
    OUT p_total_strike_qty decimal(18,2),
    OUT p_cost_calc_type int,
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_update_times int,
    OUT p_trade_occur_amt decimal(18,4),
    OUT p_open_posi_date int,
    OUT p_original_order_dir int
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
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
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
    declare v_repo_days int;
    declare v_strike_deal_type int;
    declare v_repo_cale_days int;
    declare v_repo_back_date int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_curr_qty decimal(18,2);
    declare v_rsp_id bigint;
    declare v_order_id bigint;
    declare v_sys_config_str varchar(64);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_asset_acco_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code varchar(6);
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_report_time int;
    declare v_comm_date int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_external_no bigint;
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_total_strike_amt decimal(18,4);
    declare v_total_strike_qty decimal(18,2);
    declare v_cost_calc_type int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_update_times int;
    declare v_trade_occur_amt decimal(18,4);
    declare v_open_posi_date int;
    declare v_original_order_dir int;
    declare v_tmp_strike_date int;
    declare v_tmp_strike_time int;
    declare v_tmp_strike_no varchar(64);
    declare v_tmp_strike_price decimal(16,9);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_is_record_jour int;
    declare v_strike_fee decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_deal_capital_release_type int;
    declare v_comb_invalid_judge varchar(2);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_opor int;
    declare v_order_time int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_exter_comm_flag int;
    declare v_target_stock_code_no int;
    declare v_old_order_status varchar(2);
    declare v_tmp_strike_bond_accr_intrst decimal(18,4);
    declare v_record_count int;
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_trade_occur_qty decimal(18,2);
    declare v_repo_order_id bigint;
    declare v_strike_occur_amt decimal(18,4);
    declare v_strike_occur_qty decimal(18,2);
    declare v_repo_strike_id bigint;

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
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
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
    SET v_repo_days = p_repo_days;
    SET v_strike_deal_type = p_strike_deal_type;
    SET v_repo_cale_days = p_repo_cale_days;
    SET v_repo_back_date = p_repo_back_date;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_exgp_cost_amt = p_exgp_cost_amt;
    SET v_exgp_intrst_cost_amt = p_exgp_intrst_cost_amt;
    SET v_exgp_curr_qty = p_exgp_curr_qty;
    SET v_asac_cost_amt = p_asac_cost_amt;
    SET v_asac_intrst_cost_amt = p_asac_intrst_cost_amt;
    SET v_asac_curr_qty = p_asac_curr_qty;
    SET v_rsp_id = p_rsp_id;
    SET v_order_id = p_order_id;
    SET v_sys_config_str = p_sys_config_str;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_combo_code = p_combo_code;
    SET v_combo_posi_id = p_combo_posi_id;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_target_code = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_batch_no = 0;
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_external_no = 0;
    SET v_busi_opor_no = 0;
    SET v_order_oper_way = " ";
    SET v_total_strike_amt = 0;
    SET v_total_strike_qty = 0;
    SET v_cost_calc_type = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_wtdraw_qty = 0;
    SET v_order_status = "0";
    SET v_update_times = 1;
    SET v_trade_occur_amt = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_original_order_dir = 0;
    SET v_tmp_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_strike_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_strike_no = " ";
    SET v_tmp_strike_price = 0;
    SET v_tmp_strike_amt = 0;
    SET v_tmp_strike_qty = 0;
    SET v_is_record_jour = 1;
    SET v_strike_fee = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_deal_capital_release_type = 0;
    SET v_comb_invalid_judge = "0";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_opor = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_exter_comm_flag = 0;
    SET v_target_stock_code_no = 0;
    SET v_old_order_status = "0";
    SET v_tmp_strike_bond_accr_intrst = 0;
    SET v_record_count = 0;
    SET v_all_wtdraw_qty = 0;
    SET v_trade_occur_qty = 0;
    SET v_repo_order_id = 0;
    SET v_strike_occur_amt = 0;
    SET v_strike_occur_qty = 0;
    SET v_repo_strike_id = 0;

    
    label_pro:BEGIN
    

    /* set @临时_成交日期# = @成交日期#; */
    set v_tmp_strike_date = v_strike_date;

    /* set @临时_成交时间# = @成交时间#; */
    set v_tmp_strike_time = v_strike_time;

    /* set @临时_成交编号# = @成交编号#; */
    set v_tmp_strike_no = v_strike_no;

    /* set @临时_成交价格# = @成交价格#; */
    set v_tmp_strike_price = v_strike_price;

    /* set @临时_成交金额# = @成交金额#; */
    set v_tmp_strike_amt = v_strike_amt;

    /* set @临时_成交数量# = @成交数量#; */
    set v_tmp_strike_qty = v_strike_qty;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @成交费用# = 0; */
    set v_strike_fee = 0;

    /* set @全部费用# = 0; */
    set v_all_fee = 0;

    /* set @印花税# = 0; */
    set v_stamp_tax = 0;

    /* set @过户费# = 0; */
    set v_trans_fee = 0;

    /* set @经手费# = 0; */
    set v_brkage_fee = 0;

    /* set @证管费# = 0; */
    set v_SEC_charges = 0;

    /* set @其他费用# = 0; */
    set v_other_fee = 0;

    /* set @交易佣金# = 0; */
    set v_trade_commis = 0;

    /* set @其他佣金# = 0; */
    set v_other_commis = 0;

    /* set @交易征费# = 0; */
    set v_trade_tax = 0;

    /* set @交易费# = 0; */
    set v_trade_cost_fee = 0;

    /* set @交易系统使用费# = 0; */
    set v_trade_system_use_fee = 0;

    /* set @股份交收费# = 0; */
    set v_stock_settle_fee = 0;

    /* [事务开始] */
    START TRANSACTION;

        #获取部成资金占用释放方式，支持PB的特殊处理，与券商处理保持一致，影响可用

        /* set @部成资金占用释放方式# = substring(@系统控制配置串#, 3, 1); */
        set v_deal_capital_release_type = substring(v_sys_config_str, 3, 1);

        /* set @组合失效判断# = substring(@系统控制配置串#, 6, 1); */
        set v_comb_invalid_judge = substring(v_sys_config_str, 6, 1);
        #获取原订单信息

        /* 调用【原子_交易证券_交易_锁定获取成交回报订单信息】*/
        call db_tdsecu.pra_tdsetd_LockGetStrikeRspOrder(
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
            v_report_date,
            v_report_no,
            v_order_id,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_crncy_type,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_id,
            v_comm_batch_no,
            v_comm_opor,
            v_external_no,
            v_report_time,
            v_order_batch_no,
            v_order_date,
            v_order_time,
            v_order_dir,
            v_price_type,
            v_order_price,
            v_order_qty,
            v_order_status,
            v_wtdraw_qty,
            v_strike_amt,
            v_strike_qty,
            v_net_price_flag,
            v_intrst_days,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_strike_bond_accr_intrst,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_rsp_info,
            v_compli_trig_id,
            v_remark_info,
            v_busi_opor_no,
            v_exter_comm_flag,
            v_order_oper_way,
            v_cost_calc_type,
            v_target_stock_code_no,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.128.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_锁定获取成交回报订单信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @原订单状态# = @订单状态#; */
        set v_old_order_status = v_order_status;

        /* set @原订单方向# = @订单方向#; */
        set v_original_order_dir = v_order_dir;

        /* set @临时_成交债券计提利息# = @成交债券计提利息#; */
        set v_tmp_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    #先检查成交表是否重复

       /* [获取表记录数量][交易证券_报盘_成交表][@记录个数#][{通道编号}=@通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {成交日期}=@成交日期# and {成交编号}=@成交编号# and {订单方向}=@订单方向#] */
       select count(1) into v_record_count from db_tdsecu.tb_tdserp_strike where pass_no=v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no and strike_date=v_strike_date and strike_no=v_strike_no and order_dir=v_order_dir;


       /* [检查报错返回][@记录个数# <> 0][1][concat(@通道编号#,@外部账号#,@市场编号#,@成交日期#,@成交编号#,@订单方向#,"导入成交数据不能重复！")] */
       if v_record_count <> 0 then
           ROLLBACK;
           SET v_error_code = "tdsecuT.5.128.1";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat(v_pass_no,v_out_acco,v_exch_no,v_strike_date,v_strike_no,v_order_dir,"导入成交数据不能重复！"),"#",v_mysql_message);
           else
               SET v_error_info = concat(v_pass_no,v_out_acco,v_exch_no,v_strike_date,v_strike_no,v_order_dir,"导入成交数据不能重复！");
           end if;
           leave label_pro;
       end if;

        #先记录总成交数量和总成交金额

        /* set @总成交金额# = @成交金额# + @临时_成交金额#; */
        set v_total_strike_amt = v_strike_amt + v_tmp_strike_amt;

        /* set @总成交数量# = @成交数量# + @临时_成交数量#; */
        set v_total_strike_qty = v_strike_qty + v_tmp_strike_qty;

        /* set @总撤单数量# = @撤单数量#; */
        set v_all_wtdraw_qty = v_wtdraw_qty;

        /* [检查报错返回][@总成交数量# + @总撤单数量# > @订单数量#][755][@订单数量#, @总成交数量#, @总撤单数量#, @临时_成交数量#] */
        if v_total_strike_qty + v_all_wtdraw_qty > v_order_qty then
            ROLLBACK;
            SET v_error_code = "tdsecuT.5.128.755";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单数量=",v_order_qty,","," 总成交数量=", v_total_strike_qty,","," 总撤单数量=", v_all_wtdraw_qty,","," 临时_成交数量=", v_tmp_strike_qty),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单数量=",v_order_qty,","," 总成交数量=", v_total_strike_qty,","," 总撤单数量=", v_all_wtdraw_qty,","," 临时_成交数量=", v_tmp_strike_qty);
            end if;
            leave label_pro;
        end if;


        /* set @成交数量# = @临时_成交数量#; */
        set v_strike_qty = v_tmp_strike_qty;

        /* set @成交金额# = @临时_成交金额#; */
        set v_strike_amt = v_tmp_strike_amt;

        /* set @成交价格# = @临时_成交价格#; */
        set v_strike_price = v_tmp_strike_price;

        /* 调用【原子_交易证券_公用_计算成交交易变动金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetStrikeExchChangeAmtAndQty(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_stock_type,
            v_order_dir,
            v_order_qty,
            v_order_price,
            v_order_frozen_amt,
            v_strike_qty,
            v_total_strike_qty,
            v_all_wtdraw_qty,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_deal_capital_release_type,
            v_strike_amt,
            v_error_code,
            v_error_info,
            v_trade_occur_amt,
            v_trade_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.128.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算成交交易变动金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @回购委托序号# = @订单序号#; */
        set v_repo_order_id = v_order_id;
        #插入成交表

        /* if @订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-融券回购》  or @订单方向# = 《订单方向-融资买入》  or @订单方向# = 《订单方向-基金申购》 then */
        if v_order_dir = 1 or v_order_dir = 4  or v_order_dir = 5  or v_order_dir = 9 then

            /* set @订单冻结金额# = @订单冻结金额# + @交易变动金额#; */
            set v_order_frozen_amt = v_order_frozen_amt + v_trade_occur_amt;
        else

            /* set @订单冻结金额# = 0; */
            set v_order_frozen_amt = 0;
        end if;

        /* if @订单方向# = 《订单方向-卖出》  or @订单方向# = 《订单方向-基金赎回》 then */
        if v_order_dir = 2  or v_order_dir = 10 then

            /* set @订单冻结数量# = @订单冻结数量# - @成交数量#; */
            set v_order_frozen_qty = v_order_frozen_qty - v_strike_qty;
        else

            /* set @订单冻结数量# = 0; */
            set v_order_frozen_qty = 0;
        end if;

        /* 调用【原子_交易证券_公用_计算成交变动金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetStrikeOccurAmtAndQty(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_stock_type,
            v_order_dir,
            v_strike_qty,
            v_strike_price,
            v_strike_amt,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_all_fee,
            v_error_code,
            v_error_info,
            v_strike_occur_amt,
            v_strike_bond_accr_intrst,
            v_strike_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.128.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算成交变动金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @体外指令标志#=0; */
        set v_exter_comm_flag=0;

        /* 调用【原子_交易证券_报盘_导入成交】*/
        call db_tdsecu.pra_tdserp_ImportStrike(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_busi_opor_no,
            v_init_date,
            v_rsp_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_id,
            v_comm_batch_no,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_id,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_strike_qty,
            v_strike_price,
            v_strike_amt,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_trade_tax,
            v_trade_cost_fee,
            v_trade_system_use_fee,
            v_stock_settle_fee,
            v_net_price_flag,
            v_intrst_days,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_strike_bond_accr_intrst,
            v_order_oper_way,
            v_exter_comm_flag,
            v_order_batch_no,
            v_external_no,
            v_combo_code,
            v_asset_acco_type,
            v_error_code,
            v_error_info,
            v_strike_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.128.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_导入成交出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @回购成交序号# = @成交序号#; */
        set v_repo_strike_id = v_strike_id;
        #更新订单表

        /* set @成交数量# = @总成交数量#; */
        set v_strike_qty = v_total_strike_qty;

        /* 调用【原子_交易证券_公用_计算订单状态】*/
        call db_tdsecu.pra_tdsepb_CaclOrderStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_qty,
            v_wtdraw_qty,
            v_strike_qty,
            v_old_order_status,
            v_error_code,
            v_error_info,
            v_order_status);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.128.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单状态出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @成交金额# = @总成交金额# ; */
        set v_strike_amt = v_total_strike_amt ;

        /* set @成交债券计提利息# = @成交债券计提利息# + @临时_成交债券计提利息#; */
        set v_strike_bond_accr_intrst = v_strike_bond_accr_intrst + v_tmp_strike_bond_accr_intrst;

        /* 调用【原子_交易证券_交易_更新成交回报订单记录】*/
        call db_tdsecu.pra_tdsetd_UpdateStrikeRspOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_id,
            v_strike_qty,
            v_strike_amt,
            v_wtdraw_qty,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_order_status,
            v_strike_bond_accr_intrst,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.128.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_更新成交回报订单记录出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @更新次数#=@更新次数#+1; */
    set v_update_times=v_update_times+1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_id = v_strike_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_target_code = v_target_code;
    SET p_order_date = v_order_date;
    SET p_order_batch_no = v_order_batch_no;
    SET p_report_time = v_report_time;
    SET p_comm_date = v_comm_date;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_external_no = v_external_no;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_order_oper_way = v_order_oper_way;
    SET p_total_strike_amt = v_total_strike_amt;
    SET p_total_strike_qty = v_total_strike_qty;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_order_status = v_order_status;
    SET p_update_times = v_update_times;
    SET p_trade_occur_amt = v_trade_occur_amt;
    SET p_open_posi_date = v_open_posi_date;
    SET p_original_order_dir = v_original_order_dir;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_导入成交回报费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_ImportStrikeRspFee;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_ImportStrikeRspFee(
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
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_stock_acco_no int,
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_target_code_no int,
    IN p_trade_code_no int,
    IN p_order_id bigint,
    IN p_order_date int,
    IN p_order_batch_no int,
    IN p_order_dir int,
    IN p_comm_id bigint,
    IN p_strike_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_strike_amt decimal(18,4),
    IN p_strike_no varchar(64),
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_id bigint,
    IN p_all_fee decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_trade_cost_fee decimal(18,4),
    IN p_trade_system_use_fee decimal(18,4),
    IN p_trade_tax decimal(18,4),
    IN p_stock_settle_fee decimal(18,4),
    IN p_target_code varchar(6),
    IN p_impawn_ratio decimal(18,12),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_intrst_days int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_repo_days int,
    IN p_repo_cale_days int,
    IN p_repo_back_date int,
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_busi_opor_no int,
    IN p_order_oper_way varchar(2),
    IN p_cost_calc_type int,
    IN p_exgp_cost_amt decimal(18,4),
    IN p_exgp_intrst_cost_amt decimal(18,4),
    IN p_exgp_curr_qty decimal(18,2),
    IN p_asac_cost_amt decimal(18,4),
    IN p_asac_intrst_cost_amt decimal(18,4),
    IN p_asac_curr_qty decimal(18,2),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_trade_occur_amt decimal(18,4),
    IN p_combo_code varchar(32),
    IN p_combo_posi_id bigint,
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
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_comm_id bigint;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_strike_no varchar(64);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_id bigint;
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_target_code varchar(6);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_repo_days int;
    declare v_repo_cale_days int;
    declare v_repo_back_date int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_cost_calc_type int;
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_curr_qty decimal(18,2);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_trade_occur_amt decimal(18,4);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_is_record_jour int;
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_price decimal(16,9);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_trade_occur_amt decimal(18,4);
    declare v_target_stock_code_no int;
    declare v_trade_occur_qty decimal(18,2);
    declare v_repo_order_id bigint;
    declare v_repo_strike_id bigint;
    declare v_strike_fee decimal(18,4);
    declare v_strike_occur_amt decimal(18,4);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_strike_occur_qty decimal(18,2);

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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_order_id = p_order_id;
    SET v_order_date = p_order_date;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir = p_order_dir;
    SET v_comm_id = p_comm_id;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_price = p_strike_price;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_no = p_strike_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_id = p_strike_id;
    SET v_all_fee = p_all_fee;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_trade_cost_fee = p_trade_cost_fee;
    SET v_trade_system_use_fee = p_trade_system_use_fee;
    SET v_trade_tax = p_trade_tax;
    SET v_stock_settle_fee = p_stock_settle_fee;
    SET v_target_code = p_target_code;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_intrst_days = p_intrst_days;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_repo_days = p_repo_days;
    SET v_repo_cale_days = p_repo_cale_days;
    SET v_repo_back_date = p_repo_back_date;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_order_oper_way = p_order_oper_way;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_exgp_cost_amt = p_exgp_cost_amt;
    SET v_exgp_intrst_cost_amt = p_exgp_intrst_cost_amt;
    SET v_exgp_curr_qty = p_exgp_curr_qty;
    SET v_asac_cost_amt = p_asac_cost_amt;
    SET v_asac_intrst_cost_amt = p_asac_intrst_cost_amt;
    SET v_asac_curr_qty = p_asac_curr_qty;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_trade_occur_amt = p_trade_occur_amt;
    SET v_combo_code = p_combo_code;
    SET v_combo_posi_id = p_combo_posi_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_is_record_jour = 1;
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_price = 0;
    SET v_tmp_strike_amt = 0;
    SET v_tmp_trade_occur_amt = 0;
    SET v_target_stock_code_no = 0;
    SET v_trade_occur_qty = 0;
    SET v_repo_order_id = 0;
    SET v_repo_strike_id = 0;
    SET v_strike_fee = 0;
    SET v_strike_occur_amt = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_strike_occur_qty = 0;

    
    label_pro:BEGIN
    

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;
    #[检查正常返回][@全部费用# = 0 ]

    /* set @临时_成交数量#=@成交数量#; */
    set v_tmp_strike_qty=v_strike_qty;

    /* set @临时_成交价格#=@成交价格#; */
    set v_tmp_strike_price=v_strike_price;

    /* set @临时_成交金额#=@成交金额#; */
    set v_tmp_strike_amt=v_strike_amt;

    /* set @操作员编号# = @业务操作员编号#; */
    set v_opor_no = v_busi_opor_no;

    /* set @临时_交易变动金额# = @交易变动金额#; */
    set v_tmp_trade_occur_amt = v_trade_occur_amt;

    /* set @目标证券代码编号# = 0; */
    set v_target_stock_code_no = 0;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_报盘_导入更新成交回报费用】*/
        call db_tdsecu.pra_tdserp_ImportUpdateStrikeRspFee(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_strike_id,
            v_order_id,
            v_order_date,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_trade_cost_fee,
            v_trade_system_use_fee,
            v_trade_tax,
            v_stock_settle_fee,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.129.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_导入更新成交回报费用出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @成交数量#= 0; */
        set v_strike_qty= 0;

        /* set @成交价格#=0; */
        set v_strike_price=0;

        /* set @成交金额# = 0; */
        set v_strike_amt = 0;

        /* set @债券计提利息#=0; */
        set v_bond_accr_intrst=0;

        /* set @交易变动金额# = 0; */
        set v_trade_occur_amt = 0;

        /* set @交易变动数量# = 0; */
        set v_trade_occur_qty = 0;

        /* set @回购委托序号# = 0; */
        set v_repo_order_id = 0;

        /* set @回购成交序号# = 0; */
        set v_repo_strike_id = 0;

        /* set @成交费用# = @全部费用#; */
        set v_strike_fee = v_all_fee;

        /* if @全部费用# > 0 then */
        if v_all_fee > 0 then

            /* 调用【原子_交易证券_公用_计算成交变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetStrikeOccurAmtAndQty(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_stock_type,
                v_order_dir,
                v_strike_qty,
                v_strike_price,
                v_strike_amt,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_all_fee,
                v_error_code,
                v_error_info,
                v_strike_occur_amt,
                v_strike_bond_accr_intrst,
                v_strike_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.129.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算成交变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

        /* set @成交数量#=@临时_成交数量#; */
        set v_strike_qty=v_tmp_strike_qty;

        /* set @成交价格#=@临时_成交价格#; */
        set v_strike_price=v_tmp_strike_price;

        /* set @成交金额#=@临时_成交金额#; */
        set v_strike_amt=v_tmp_strike_amt;

        /* set @成交变动数量# = @临时_成交数量#; */
        set v_strike_occur_qty = v_tmp_strike_qty;

        /* set @交易变动数量# = -1 * @成交变动数量#; */
        set v_trade_occur_qty = -1 * v_strike_occur_qty;

        /* if @订单操作方式# = 《订单操作方式-增强交易》 or @订单操作方式# = 《订单操作方式-增强交易平仓》 then */
        if v_order_oper_way = "14" or v_order_oper_way = "51" then

            /* set @交易变动金额# = @临时_交易变动金额#; */
            set v_trade_occur_amt = v_tmp_trade_occur_amt;

            /* 调用【原子_交易证券_T0_成交证券持仓明细变化】*/
            call db_tdsecu.pra_tdset0_StikePosiDetailChange(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_busi_opor_no,
                v_order_oper_way,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_stock_acco_no,
                v_asset_acco_no,
                v_stock_code,
                v_exch_no,
                v_stock_type,
                v_order_dir,
                v_stock_code_no,
                v_crncy_type,
                v_exch_crncy_type,
                v_strike_no,
                v_strike_date,
                v_strike_time,
                v_strike_price,
                v_strike_qty,
                v_strike_amt,
                v_strike_fee,
                v_trade_occur_qty,
                v_strike_occur_qty,
                v_trade_occur_amt,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.129.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_成交证券持仓明细变化出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


        /* elseif @订单操作方式# = 《订单操作方式-手工补单》 or @订单操作方式# = 《订单操作方式-报盘机补单》 then */
        elseif v_order_oper_way = "31" or v_order_oper_way = "33" then

            /* 调用【原子_交易证券_T0_体外交易操作员券源限额设置持仓变化】*/
            call db_tdsecu.pra_tdset0_OutOporStockLimitPosiChange(
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
                v_stock_acco_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_type,
                v_order_dir,
                v_stock_code,
                v_stock_code_no,
                v_trade_occur_qty,
                v_strike_occur_qty,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.129.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_体外交易操作员券源限额设置持仓变化出现错误！',v_mysql_message);
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

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_导入成交获取订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_ImportStrikeGetOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_ImportStrikeGetOrderInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_report_date int,
    IN p_report_no varchar(32),
    IN p_order_dir int,
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_deal_type int,
    IN p_rsp_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_comm_id bigint,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_id bigint,
    OUT p_order_batch_no int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_status varchar(2),
    OUT p_price_type int,
    OUT p_busi_opor_no int,
    OUT p_order_oper_way varchar(2),
    OUT p_rsp_id bigint,
    OUT p_exter_comm_flag int,
    OUT p_external_no bigint,
    OUT p_combo_code varchar(32),
    OUT p_combo_posi_id bigint,
    OUT p_strategy_id bigint,
    OUT p_contra_no varchar(32),
    OUT p_asset_acco_type int
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
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_deal_type int;
    declare v_rsp_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_id bigint;
    declare v_order_batch_no int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_status varchar(2);
    declare v_price_type int;
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_rsp_id bigint;
    declare v_exter_comm_flag int;
    declare v_external_no bigint;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_strategy_id bigint;
    declare v_contra_no varchar(32);
    declare v_asset_acco_type int;
    declare v_mac_addr varchar(32);
    declare v_ip_addr varchar(32);
    declare v_exist_debt_flag int;

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
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_order_dir = p_order_dir;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_deal_type = p_strike_deal_type;
    SET v_rsp_info = p_rsp_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_id = 0;
    SET v_order_batch_no = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_status = "0";
    SET v_price_type = 0;
    SET v_busi_opor_no = 0;
    SET v_order_oper_way = " ";
    SET v_rsp_id = 0;
    SET v_exter_comm_flag = 0;
    SET v_external_no = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_strategy_id = 0;
    SET v_contra_no = " ";
    SET v_asset_acco_type = 0;
    SET v_mac_addr = " ";
    SET v_ip_addr = " ";
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易_获取回报订单信息】*/
    call db_tdsecu.pra_tdsetd_GetRspOrderInfo(
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
        v_report_date,
        v_report_no,
        v_error_code,
        v_error_info,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_stock_acco_no,
        v_stock_acco,
        v_stock_code_no,
        v_stock_code,
        v_stock_type,
        v_asset_type,
        v_comm_id,
        v_order_date,
        v_order_time,
        v_order_id,
        v_order_batch_no,
        v_order_dir,
        v_order_price,
        v_order_qty,
        v_order_frozen_amt,
        v_order_status,
        v_price_type,
        v_busi_opor_no,
        v_order_oper_way,
        v_exter_comm_flag,
        v_external_no,
        v_combo_code,
        v_combo_posi_id,
        v_mac_addr,
        v_ip_addr,
        v_strategy_id,
        v_asset_acco_type,
        v_contra_no,
        v_exist_debt_flag,
        v_strike_qty);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.5.130.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_获取回报订单信息出现错误！',v_mysql_message);
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
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_comm_id = v_comm_id;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_id = v_order_id;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_status = v_order_status;
    SET p_price_type = v_price_type;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_order_oper_way = v_order_oper_way;
    SET p_rsp_id = v_rsp_id;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_external_no = v_external_no;
    SET p_combo_code = v_combo_code;
    SET p_combo_posi_id = v_combo_posi_id;
    SET p_strategy_id = v_strategy_id;
    SET p_contra_no = v_contra_no;
    SET p_asset_acco_type = v_asset_acco_type;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_获取机器时间
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_GetMachTime;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_GetMachTime(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_mach_time int
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
    declare v_mach_time int;

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
    SET v_mach_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* [检查报错返回][@机器时间# < 92500 ][705][concat("早上 9:25 前不处理成交！ ")] */
    if v_mach_time < 92500  then
        
        SET v_error_code = "tdsecuT.5.131.705";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("早上 9:25 前不处理成交！ "),"#",v_mysql_message);
        else
            SET v_error_info = concat("早上 9:25 前不处理成交！ ");
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_mach_time = v_mach_time;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_处理融资融券成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_DealFinaLoanStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_DealFinaLoanStrikeRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
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
    IN p_repo_days int,
    IN p_strike_deal_type int,
    IN p_repo_cale_days int,
    IN p_repo_back_date int,
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_exgp_cost_amt decimal(18,4),
    IN p_exgp_intrst_cost_amt decimal(18,4),
    IN p_exgp_curr_qty decimal(18,2),
    IN p_asac_cost_amt decimal(18,4),
    IN p_asac_intrst_cost_amt decimal(18,4),
    IN p_asac_curr_qty decimal(18,2),
    IN p_rsp_id bigint,
    IN p_order_id bigint,
    IN p_sys_config_str varchar(64),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_combo_code varchar(32),
    IN p_combo_posi_id bigint,
    IN p_asset_acco_type int,
    IN p_fina_return_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_target_code varchar(6),
    OUT p_order_date int,
    OUT p_order_batch_no int,
    OUT p_report_time int,
    OUT p_comm_date int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_external_no bigint,
    OUT p_busi_opor_no int,
    OUT p_order_oper_way varchar(2),
    OUT p_total_strike_amt decimal(18,4),
    OUT p_total_strike_qty decimal(18,2),
    OUT p_cost_calc_type int,
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_update_times int,
    OUT p_strike_occur_amt decimal(18,4),
    OUT p_strike_occur_qty decimal(18,2),
    OUT p_trade_occur_amt decimal(18,4),
    OUT p_trade_occur_qty decimal(18,2),
    OUT p_open_posi_date int,
    OUT p_original_order_dir int
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
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
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
    declare v_repo_days int;
    declare v_strike_deal_type int;
    declare v_repo_cale_days int;
    declare v_repo_back_date int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_curr_qty decimal(18,2);
    declare v_rsp_id bigint;
    declare v_order_id bigint;
    declare v_sys_config_str varchar(64);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_asset_acco_type int;
    declare v_fina_return_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code varchar(6);
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_report_time int;
    declare v_comm_date int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_external_no bigint;
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_total_strike_amt decimal(18,4);
    declare v_total_strike_qty decimal(18,2);
    declare v_cost_calc_type int;
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_update_times int;
    declare v_strike_occur_amt decimal(18,4);
    declare v_strike_occur_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_open_posi_date int;
    declare v_original_order_dir int;
    declare v_tmp_strike_date int;
    declare v_tmp_strike_time int;
    declare v_tmp_strike_no varchar(64);
    declare v_tmp_strike_price decimal(16,9);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_is_record_jour int;
    declare v_strike_fee decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_invest_type int;
    declare v_deal_capital_release_type int;
    declare v_comb_invalid_judge varchar(2);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_opor int;
    declare v_order_time int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_exter_comm_flag int;
    declare v_target_stock_code_no int;
    declare v_old_order_status varchar(2);
    declare v_tmp_strike_bond_accr_intrst decimal(18,4);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_repo_order_id bigint;
    declare v_comm_qty decimal(18,2);
    declare v_comm_oper_way varchar(2);
    declare v_comm_strike_qty decimal(18,2);
    declare v_repo_strike_id bigint;

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
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
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
    SET v_repo_days = p_repo_days;
    SET v_strike_deal_type = p_strike_deal_type;
    SET v_repo_cale_days = p_repo_cale_days;
    SET v_repo_back_date = p_repo_back_date;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_exgp_cost_amt = p_exgp_cost_amt;
    SET v_exgp_intrst_cost_amt = p_exgp_intrst_cost_amt;
    SET v_exgp_curr_qty = p_exgp_curr_qty;
    SET v_asac_cost_amt = p_asac_cost_amt;
    SET v_asac_intrst_cost_amt = p_asac_intrst_cost_amt;
    SET v_asac_curr_qty = p_asac_curr_qty;
    SET v_rsp_id = p_rsp_id;
    SET v_order_id = p_order_id;
    SET v_sys_config_str = p_sys_config_str;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_combo_code = p_combo_code;
    SET v_combo_posi_id = p_combo_posi_id;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_fina_return_type = p_fina_return_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_target_code = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_batch_no = 0;
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_external_no = 0;
    SET v_busi_opor_no = 0;
    SET v_order_oper_way = " ";
    SET v_total_strike_amt = 0;
    SET v_total_strike_qty = 0;
    SET v_cost_calc_type = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_wtdraw_qty = 0;
    SET v_order_status = "0";
    SET v_update_times = 1;
    SET v_strike_occur_amt = 0;
    SET v_strike_occur_qty = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_original_order_dir = 0;
    SET v_tmp_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_strike_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_strike_no = " ";
    SET v_tmp_strike_price = 0;
    SET v_tmp_strike_amt = 0;
    SET v_tmp_strike_qty = 0;
    SET v_is_record_jour = 1;
    SET v_strike_fee = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_invest_type = 0;
    SET v_deal_capital_release_type = 0;
    SET v_comb_invalid_judge = "0";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_opor = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_exter_comm_flag = 0;
    SET v_target_stock_code_no = 0;
    SET v_old_order_status = "0";
    SET v_tmp_strike_bond_accr_intrst = 0;
    SET v_all_wtdraw_qty = 0;
    SET v_repo_order_id = 0;
    SET v_comm_qty = 0;
    SET v_comm_oper_way = " ";
    SET v_comm_strike_qty = 0;
    SET v_repo_strike_id = 0;

    
    label_pro:BEGIN
    
    #检查重复回报，如不重复，则插入表记录

    /* [事务开始] */
    START TRANSACTION;


        /* if @回报序号# = 0 then */
        if v_rsp_id = 0 then

            /* 调用【原子_交易证券_报盘_检查成交重复回报】*/
            call db_tdsecu.pra_tdserp_CheckStrikeRspDup(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_pass_no,
                v_out_acco,
                v_exch_no,
                v_stock_acco,
                v_stock_code,
                v_strike_date,
                v_strike_time,
                v_strike_no,
                v_report_date,
                v_report_no,
                v_order_dir,
                v_strike_price,
                v_strike_qty,
                v_strike_amt,
                v_strike_deal_type,
                v_rsp_info,
                v_asset_acco_type,
                v_error_code,
                v_error_info,
                v_rsp_id);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.132.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_检查成交重复回报出现错误！',v_mysql_message);
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


    /* set @临时_成交日期# = @成交日期#; */
    set v_tmp_strike_date = v_strike_date;

    /* set @临时_成交时间# = @成交时间#; */
    set v_tmp_strike_time = v_strike_time;

    /* set @临时_成交编号# = @成交编号#; */
    set v_tmp_strike_no = v_strike_no;

    /* set @临时_成交价格# = @成交价格#; */
    set v_tmp_strike_price = v_strike_price;

    /* set @临时_成交金额# = @成交金额#; */
    set v_tmp_strike_amt = v_strike_amt;

    /* set @临时_成交数量# = @成交数量#; */
    set v_tmp_strike_qty = v_strike_qty;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @成交费用# = 0; */
    set v_strike_fee = 0;

    /* set @全部费用# = 0; */
    set v_all_fee = 0;

    /* set @印花税# = 0; */
    set v_stamp_tax = 0;

    /* set @过户费# = 0; */
    set v_trans_fee = 0;

    /* set @经手费# = 0; */
    set v_brkage_fee = 0;

    /* set @证管费# = 0; */
    set v_SEC_charges = 0;

    /* set @其他费用# = 0; */
    set v_other_fee = 0;

    /* set @交易佣金# = 0; */
    set v_trade_commis = 0;

    /* set @其他佣金# = 0; */
    set v_other_commis = 0;

    /* set @交易征费# = 0; */
    set v_trade_tax = 0;

    /* set @交易费# = 0; */
    set v_trade_cost_fee = 0;

    /* set @交易系统使用费# = 0; */
    set v_trade_system_use_fee = 0;

    /* set @股份交收费# = 0; */
    set v_stock_settle_fee = 0;

    /* set @投资类型# = 《投资类型-二级市场交易性金融资产》; */
    set v_invest_type = 1;

    /* [事务开始] */
    START TRANSACTION;

        #获取部成资金占用释放方式，支持PB的特殊处理，与券商处理保持一致，影响可用

        /* set @部成资金占用释放方式# = substring(@系统控制配置串#, 3, 1); */
        set v_deal_capital_release_type = substring(v_sys_config_str, 3, 1);

        /* set @组合失效判断# = substring(@系统控制配置串#, 6, 1); */
        set v_comb_invalid_judge = substring(v_sys_config_str, 6, 1);
        #获取原订单信息

        /* 调用【原子_交易证券_交易_锁定获取成交回报订单信息】*/
        call db_tdsecu.pra_tdsetd_LockGetStrikeRspOrder(
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
            v_report_date,
            v_report_no,
            v_order_id,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_crncy_type,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_id,
            v_comm_batch_no,
            v_comm_opor,
            v_external_no,
            v_report_time,
            v_order_batch_no,
            v_order_date,
            v_order_time,
            v_order_dir,
            v_price_type,
            v_order_price,
            v_order_qty,
            v_order_status,
            v_wtdraw_qty,
            v_strike_amt,
            v_strike_qty,
            v_net_price_flag,
            v_intrst_days,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_strike_bond_accr_intrst,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_rsp_info,
            v_compli_trig_id,
            v_remark_info,
            v_busi_opor_no,
            v_exter_comm_flag,
            v_order_oper_way,
            v_cost_calc_type,
            v_target_stock_code_no,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.132.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_锁定获取成交回报订单信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @原订单状态# = @订单状态#; */
        set v_old_order_status = v_order_status;

        /* set @原订单方向# = @订单方向#; */
        set v_original_order_dir = v_order_dir;

        /* set @临时_成交债券计提利息# = @成交债券计提利息#; */
        set v_tmp_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
        #先记录总成交数量和总成交金额

        /* set @总成交金额# = @成交金额# + @临时_成交金额#; */
        set v_total_strike_amt = v_strike_amt + v_tmp_strike_amt;

        /* set @总成交数量# = @成交数量# + @临时_成交数量#; */
        set v_total_strike_qty = v_strike_qty + v_tmp_strike_qty;

        /* set @总撤单数量# = @撤单数量#; */
        set v_all_wtdraw_qty = v_wtdraw_qty;

        /* [检查报错返回][@总成交数量# + @总撤单数量# > @订单数量#][755][@订单数量#, @总成交数量#, @总撤单数量#, @临时_成交数量#] */
        if v_total_strike_qty + v_all_wtdraw_qty > v_order_qty then
            ROLLBACK;
            SET v_error_code = "tdsecuT.5.132.755";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单数量=",v_order_qty,","," 总成交数量=", v_total_strike_qty,","," 总撤单数量=", v_all_wtdraw_qty,","," 临时_成交数量=", v_tmp_strike_qty),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单数量=",v_order_qty,","," 总成交数量=", v_total_strike_qty,","," 总撤单数量=", v_all_wtdraw_qty,","," 临时_成交数量=", v_tmp_strike_qty);
            end if;
            leave label_pro;
        end if;


        /* set @成交数量# = @临时_成交数量#; */
        set v_strike_qty = v_tmp_strike_qty;

        /* set @成交金额# = @临时_成交金额#; */
        set v_strike_amt = v_tmp_strike_amt;

        /* set @成交价格# = @临时_成交价格#; */
        set v_strike_price = v_tmp_strike_price;

        /* 调用【原子_交易证券_公用_计算融资融券成交交易变动金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetFinaLoanStrikeExchChangeAmtAndQty(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_stock_type,
            v_order_dir,
            v_order_qty,
            v_order_price,
            v_order_frozen_amt,
            v_strike_qty,
            v_total_strike_qty,
            v_all_wtdraw_qty,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_deal_capital_release_type,
            v_strike_amt,
            v_error_code,
            v_error_info,
            v_trade_occur_amt,
            v_trade_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.132.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券成交交易变动金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @回购委托序号# = @订单序号#; */
        set v_repo_order_id = v_order_id;
        #更新交易系统数据

        /* if @指令序号# > 0 then */
        if v_comm_id > 0 then

            /* 调用【原子_交易证券_指令_成交更新指令】*/
            call db_tdsecu.pra_tdseap_StrikeUpdateComm(
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
                v_sell_ref_rate,
                v_buy_ref_rate,
                v_exch_no,
                v_error_code,
                v_error_info,
                v_comm_date,
                v_comm_batch_no,
                v_comm_executor,
                v_comm_qty,
                v_comm_oper_way,
                v_comm_strike_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.132.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_成交更新指令出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;
        #插入成交表

        /* if @订单方向# = 《订单方向-买入》  then */
        if v_order_dir = 1  then

            /* set @订单冻结金额# = @订单冻结金额# + @交易变动金额#; */
            set v_order_frozen_amt = v_order_frozen_amt + v_trade_occur_amt;
        else

            /* set @订单冻结金额# = 0; */
            set v_order_frozen_amt = 0;
        end if;

        /* if @订单方向# = 《订单方向-卖出》   then */
        if v_order_dir = 2   then

            /* set @订单冻结数量# = @订单冻结数量# - @成交数量#; */
            set v_order_frozen_qty = v_order_frozen_qty - v_strike_qty;
        else

            /* set @订单冻结数量# = 0; */
            set v_order_frozen_qty = 0;
        end if;

        /* 调用【原子_交易证券_公用_计算融资融券成交变动金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetFinaLoanStrikeOccurAmtAndQty(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_stock_type,
            v_order_dir,
            v_strike_qty,
            v_strike_price,
            v_strike_amt,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_all_fee,
            v_error_code,
            v_error_info,
            v_strike_occur_amt,
            v_strike_bond_accr_intrst,
            v_strike_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.132.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券成交变动金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #本次成交债券计提利息，成交债券计提利息为合计值
        #set @债券计提利息# = @成交债券计提利息#;

        /* 调用【原子_交易证券_报盘_新增成交】*/
        call db_tdsecu.pra_tdserp_AddStrike(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_busi_opor_no,
            v_init_date,
            v_rsp_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_id,
            v_comm_batch_no,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_id,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_strike_qty,
            v_strike_price,
            v_strike_amt,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_trade_tax,
            v_trade_cost_fee,
            v_trade_system_use_fee,
            v_stock_settle_fee,
            v_net_price_flag,
            v_intrst_days,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_strike_bond_accr_intrst,
            v_order_oper_way,
            v_exter_comm_flag,
            v_order_batch_no,
            v_external_no,
            v_combo_code,
            v_asset_acco_type,
            v_error_code,
            v_error_info,
            v_strike_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.132.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_新增成交出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @回购成交序号# = @成交序号#; */
        set v_repo_strike_id = v_strike_id;
        #更新订单表

        /* set @成交数量# = @总成交数量#; */
        set v_strike_qty = v_total_strike_qty;

        /* 调用【原子_交易证券_公用_计算订单状态】*/
        call db_tdsecu.pra_tdsepb_CaclOrderStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_qty,
            v_wtdraw_qty,
            v_strike_qty,
            v_old_order_status,
            v_error_code,
            v_error_info,
            v_order_status);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.132.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单状态出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @成交金额# = @总成交金额# ; */
        set v_strike_amt = v_total_strike_amt ;

        /* set @成交债券计提利息# = @成交债券计提利息# + @临时_成交债券计提利息#; */
        set v_strike_bond_accr_intrst = v_strike_bond_accr_intrst + v_tmp_strike_bond_accr_intrst;

        /* 调用【原子_交易证券_交易_更新成交回报订单记录】*/
        call db_tdsecu.pra_tdsetd_UpdateStrikeRspOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_id,
            v_strike_qty,
            v_strike_amt,
            v_wtdraw_qty,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_order_status,
            v_strike_bond_accr_intrst,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.132.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_更新成交回报订单记录出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_交易证券_账户_更新成交资金持仓】*/
        call db_tdsecu.pra_tdseac_UpdateStrikeCashPosi(
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
            v_crncy_type,
            v_exch_crncy_type,
            v_order_dir,
            v_comm_id,
            v_strike_id,
            v_exch_no,
            v_stock_code,
            v_stock_acco_no,
            v_stock_code_no,
            v_trade_code_no,
            v_target_code_no,
            v_asset_type,
            v_stock_type,
            v_strike_occur_amt,
            v_strike_occur_qty,
            v_trade_occur_amt,
            v_trade_occur_qty,
            v_impawn_ratio,
            v_repo_order_id,
            v_repo_strike_id,
            v_strike_no,
            v_strike_date,
            v_strike_time,
            v_strike_qty,
            v_strike_price,
            v_strike_amt,
            v_strike_fee,
            v_par_value,
            v_net_price_flag,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_repo_days,
            v_repo_cale_days,
            v_repo_back_date,
            v_capit_reback_days,
            v_posi_reback_days,
            v_is_record_jour,
            v_order_oper_way,
            v_cost_calc_type,
            v_exgp_cost_amt,
            v_exgp_intrst_cost_amt,
            v_exgp_curr_qty,
            v_asac_cost_amt,
            v_asac_intrst_cost_amt,
            v_asac_curr_qty,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_combo_code,
            v_combo_posi_id,
            v_order_date,
            v_target_stock_code_no,
            v_error_code,
            v_error_info,
            v_open_posi_date);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.132.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新成交资金持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @成交数量# = @临时_成交数量#; */
        set v_strike_qty = v_tmp_strike_qty;

        /* set @成交金额# = @临时_成交金额# ; */
        set v_strike_amt = v_tmp_strike_amt ;

    /* [事务结束] */
    COMMIT;

    #更新汇总记录

    /* [事务开始] */
    START TRANSACTION;


        /* set @成交债券计提利息# = @成交债券计提利息# - @临时_成交债券计提利息#; */
        set v_strike_bond_accr_intrst = v_strike_bond_accr_intrst - v_tmp_strike_bond_accr_intrst;

        /* 调用【原子_交易证券_交易_成交处理汇总订单】*/
        call db_tdsecu.pra_tdsetd_StrikeDealSumOrder(
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
            v_stock_code_no,
            v_stock_code,
            v_trade_code_no,
            v_target_code_no,
            v_stock_type,
            v_order_date,
            v_order_batch_no,
            v_order_dir,
            v_order_status,
            v_strike_amt,
            v_strike_qty,
            v_strike_bond_accr_intrst,
            v_order_oper_way,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.132.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_成交处理汇总订单出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @更新次数# = @更新次数# + 1; */
    set v_update_times = v_update_times + 1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_id = v_strike_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_target_code = v_target_code;
    SET p_order_date = v_order_date;
    SET p_order_batch_no = v_order_batch_no;
    SET p_report_time = v_report_time;
    SET p_comm_date = v_comm_date;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_external_no = v_external_no;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_order_oper_way = v_order_oper_way;
    SET p_total_strike_amt = v_total_strike_amt;
    SET p_total_strike_qty = v_total_strike_qty;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_order_status = v_order_status;
    SET p_update_times = v_update_times;
    SET p_strike_occur_amt = v_strike_occur_amt;
    SET p_strike_occur_qty = v_strike_occur_qty;
    SET p_trade_occur_amt = v_trade_occur_amt;
    SET p_trade_occur_qty = v_trade_occur_qty;
    SET p_open_posi_date = v_open_posi_date;
    SET p_original_order_dir = v_original_order_dir;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_融资融券处理撤单回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_FinaLoanDealWithdrawRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_FinaLoanDealWithdrawRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_wtdraw_qty decimal(18,2),
    IN p_order_id bigint,
    IN p_rsp_status varchar(2),
    IN p_rsp_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_busi_opor_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_stock_type int,
    OUT p_external_no bigint,
    OUT p_exch_crncy_type varchar(3),
    OUT p_comm_date int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_comm_opor int,
    OUT p_order_date int,
    OUT p_order_batch_no int,
    OUT p_order_dir int,
    OUT p_price_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_wtdraw_status varchar(2),
    OUT p_old_order_status varchar(2),
    OUT p_combo_code varchar(32),
    OUT p_combo_posi_id bigint,
    OUT p_open_posi_date int,
    OUT p_update_times int,
    OUT p_debt_type int
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
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_order_id bigint;
    declare v_rsp_status varchar(2);
    declare v_rsp_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_busi_opor_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_external_no bigint;
    declare v_exch_crncy_type varchar(3);
    declare v_comm_date int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_comm_opor int;
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_wtdraw_status varchar(2);
    declare v_old_order_status varchar(2);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_open_posi_date int;
    declare v_update_times int;
    declare v_debt_type int;
    declare v_tmp_wtdraw_qty decimal(18,2);
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_invest_type int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_asset_type int;
    declare v_order_time int;
    declare v_bond_rate_type int;
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_strategy_id bigint;
    declare v_target_stock_code_no int;
    declare v_trade_acco varchar(32);
    declare v_total_strike_qty decimal(18,2);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_wtdraw_remark varchar(255);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_deal_status varchar(2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_comm_oper_way varchar(2);
    declare v_comm_dir int;
    declare v_comm_amt decimal(18,4);
    declare v_calc_dir int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_avail_cal_flag int;
    declare v_debt_qty decimal(18,2);
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
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_order_id = p_order_id;
    SET v_rsp_status = p_rsp_status;
    SET v_rsp_info = p_rsp_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_busi_opor_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_external_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_comm_opor = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_batch_no = 0;
    SET v_order_dir = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_status = "0";
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_impawn_ratio = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_wtdraw_status = "0";
    SET v_old_order_status = "0";
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_update_times = 1;
    SET v_debt_type = 0;
    SET v_tmp_wtdraw_qty = 0;
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_invest_type = 0;
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_asset_type = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_bond_rate_type = 0;
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_order_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_strategy_id = 0;
    SET v_target_stock_code_no = 0;
    SET v_trade_acco = " ";
    SET v_total_strike_qty = 0;
    SET v_all_wtdraw_qty = 0;
    SET v_wtdraw_remark = " ";
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_deal_status = "0";
    SET v_comm_cancel_qty = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_status = "0";
    SET v_comm_oper_way = " ";
    SET v_comm_dir = 0;
    SET v_comm_amt = 0;
    SET v_calc_dir = 1;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_avail_cal_flag = 0;
    SET v_debt_qty = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @临时_撤单数量# = @撤单数量#; */
    set v_tmp_wtdraw_qty = v_wtdraw_qty;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;

    /* set @投资类型# = 《投资类型-二级市场交易性金融资产》; */
    set v_invest_type = 1;
    #默认失败，成功会改掉

    /* set @撤单状态# = 《撤单状态-失败》; */
    set v_wtdraw_status = "4";

    /* [事务开始] */
    START TRANSACTION;

        #取原委托信息

        /* 调用【原子_交易证券_交易_锁定获取撤单回报订单信息】*/
        call db_tdsecu.pra_tdsetd_LockGetWithdrawOrder(
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
            v_report_date,
            v_report_no,
            v_order_id,
            v_error_code,
            v_error_info,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_crncy_type,
            v_stock_acco,
            v_stock_acco_no,
            v_stock_code,
            v_stock_code_no,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_external_no,
            v_comm_id,
            v_comm_batch_no,
            v_comm_opor,
            v_order_date,
            v_order_time,
            v_order_batch_no,
            v_order_dir,
            v_price_type,
            v_order_price,
            v_order_qty,
            v_order_status,
            v_wtdraw_qty,
            v_strike_amt,
            v_strike_qty,
            v_strike_bond_accr_intrst,
            v_net_price_flag,
            v_intrst_days,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_rsp_info,
            v_compli_trig_id,
            v_remark_info,
            v_order_oper_way,
            v_exter_comm_flag,
            v_busi_opor_no,
            v_combo_code,
            v_combo_posi_id,
            v_strategy_id,
            v_target_stock_code_no,
            v_trade_acco,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.133.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_锁定获取撤单回报订单信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @总成交数量# = @成交数量#; */
        set v_total_strike_qty = v_strike_qty;

        /* set @总撤单数量# = @撤单数量#; */
        set v_all_wtdraw_qty = v_wtdraw_qty;

        /* set @原订单状态# = @订单状态#; */
        set v_old_order_status = v_order_status;
        #如果是撤废反馈,直接更新委托状态

        /* if @回报状态# = 《回报状态-失败》 then */
        if v_rsp_status = "2" then

            /* 调用【原子_交易证券_公用_计算订单状态】*/
            call db_tdsecu.pra_tdsepb_CaclOrderStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_order_qty,
                v_wtdraw_qty,
                v_strike_qty,
                v_old_order_status,
                v_error_code,
                v_error_info,
                v_order_status);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单状态出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* if @订单操作方式# <> 《订单操作方式-报盘机补单》then */
            if v_order_oper_way <> "33"then

              /* 调用【原子_交易证券_交易_更新订单状态】*/
              call db_tdsecu.pra_tdsetd_UpdateOrderStatus(
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
                  v_error_code,
                  v_error_info);
              if v_error_code = "1" then
                  SET v_error_code = "tdsecuT.5.133.999";
                  if v_mysql_message <> "" then
                       SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_更新订单状态出现错误！',v_mysql_message);
                  end if;
                  ROLLBACK;
                  leave label_pro;
              elseif v_error_code <> "0" then
                  ROLLBACK;
                  leave label_pro;
              end if;

            end if;

            /* set @撤单状态# = 《撤单状态-失败》; */
            set v_wtdraw_status = "4";
            #更新撤单表

            /* set @撤单数量# = 0; */
            set v_wtdraw_qty = 0;

            /* set @撤单说明# = @回报信息#; */
            set v_wtdraw_remark = v_rsp_info;

            /* 调用【原子_交易证券_交易_更新撤单状态】*/
            call db_tdsecu.pra_tdsetd_UpdateCancelOrderStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_order_date,
                v_order_id,
                v_wtdraw_status,
                v_wtdraw_qty,
                v_wtdraw_remark,
                v_report_date,
                v_report_time,
                v_init_date,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_pass_no,
                v_out_acco,
                v_exch_crncy_type,
                v_exch_no,
                v_stock_acco_no,
                v_stock_acco,
                v_stock_code_no,
                v_stock_code,
                v_external_no,
                v_report_no,
                v_order_price,
                v_trade_acco,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_更新撤单状态出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        else
            #委托状态为最终状态的订单不允许再处理, 4-已撤 6-已成 7-部撤 8-废单

            /* [检查报错返回][(@订单状态# = 《订单状态-已撤》 or @订单状态# = 《订单状态-已成》 or @订单状态# = 《订单状态-部撤》 or @订单状态# = 《订单状态-废单》) and @订单操作方式# <> 《订单操作方式-报盘机补单》][717][@订单状态#,@申报编号#] */
            if (v_order_status = "4" or v_order_status = "6" or v_order_status = "7" or v_order_status = "8") and v_order_oper_way <> "33" then
                ROLLBACK;
                SET v_error_code = "tdsecuT.5.133.717";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单状态=",v_order_status,",","申报编号=",v_report_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单状态=",v_order_status,",","申报编号=",v_report_no);
                end if;
                leave label_pro;
            end if;


            /* [检查报错返回][@临时_撤单数量# > @订单数量# - @成交数量# - @撤单数量# ][722][@订单序号#, @订单数量#, @成交数量#, @临时_撤单数量#, @撤单数量#] */
            if v_tmp_wtdraw_qty > v_order_qty - v_strike_qty - v_wtdraw_qty  then
                ROLLBACK;
                SET v_error_code = "tdsecuT.5.133.722";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单序号=",v_order_id,","," 订单数量=", v_order_qty,","," 成交数量=", v_strike_qty,","," 临时_撤单数量=", v_tmp_wtdraw_qty,","," 撤单数量=", v_wtdraw_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单序号=",v_order_id,","," 订单数量=", v_order_qty,","," 成交数量=", v_strike_qty,","," 临时_撤单数量=", v_tmp_wtdraw_qty,","," 撤单数量=", v_wtdraw_qty);
                end if;
                leave label_pro;
            end if;


            /* set @撤单数量# = @临时_撤单数量# + @撤单数量#; */
            set v_wtdraw_qty = v_tmp_wtdraw_qty + v_wtdraw_qty;

            /* 调用【原子_交易证券_公用_计算订单状态】*/
            call db_tdsecu.pra_tdsepb_CaclOrderStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_order_qty,
                v_wtdraw_qty,
                v_strike_qty,
                v_old_order_status,
                v_error_code,
                v_error_info,
                v_order_status);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单状态出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @总撤单数量# = @撤单数量#; */
            set v_all_wtdraw_qty = v_wtdraw_qty;

            /* set @撤单数量# = @临时_撤单数量#; */
            set v_wtdraw_qty = v_tmp_wtdraw_qty;

            /* 调用【原子_交易证券_公用_计算融资融券撤单交易变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetFinaLoanCancelExchChangeAmtAndQty(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_stock_type,
                v_order_dir,
                v_order_qty,
                v_order_price,
                v_order_frozen_amt,
                v_wtdraw_qty,
                v_total_strike_qty,
                v_all_wtdraw_qty,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_error_code,
                v_error_info,
                v_trade_occur_amt,
                v_trade_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券撤单交易变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @处理状态# = 《处理状态-成功》; */
            set v_deal_status = "1";
            #更新指令表

            /* if @指令序号# > 0 then */
            if v_comm_id > 0 then

                /* set @指令撤销数量# = 0; */
                set v_comm_cancel_qty = 0;

                /* 调用【原子_交易证券_指令_撤销更新指令】*/
                call db_tdsecu.pra_tdseap_CancelUpdateComm(
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
                    v_comm_executor,
                    v_comm_oper_way,
                    v_comm_dir,
                    v_comm_amt);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.133.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销更新指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #计算指令变动金额

                /* set @指令方向# = @订单方向#; */
                set v_comm_dir = v_order_dir;

                /* set @计算方向# = 《计算方向-加上》; */
                set v_calc_dir = 1;

                /* 调用【原子_交易证券_公用_计算融资融券撤单指令变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetFinaLoanCancelCommOccurAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_comm_dir,
                    v_limit_actual_price,
                    v_wtdraw_qty,
                    v_comm_status,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_comm_amt,
                    v_error_code,
                    v_error_info,
                    v_comm_occur_amt,
                    v_comm_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.133.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券撤单指令变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            end if;

            /* 调用【原子_交易证券_公用_计算融资融券撤单交易变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetFinaLoanCancelExchChangeAmtAndQty(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_stock_type,
                v_order_dir,
                v_order_qty,
                v_order_price,
                v_order_frozen_amt,
                v_wtdraw_qty,
                v_total_strike_qty,
                v_all_wtdraw_qty,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_error_code,
                v_error_info,
                v_trade_occur_amt,
                v_trade_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券撤单交易变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #更新订单表

            /* if @订单方向# = 《订单方向-卖出》 or @订单方向# = 《订单方向-融资回购》 or @订单方向# = 《订单方向-质押提交》 or @订单方向# = 《订单方向-质押转回》   or @订单方向# = 《订单方向-融资买入》  or @订单方向# = 《订单方向-融券卖出》   or @订单方向# = 《订单方向-直接还券》  or @订单方向# = 《订单方向-卖券还款》 then */
            if v_order_dir = 2 or v_order_dir = 3 or v_order_dir = 21 or v_order_dir = 22   or v_order_dir = 5  or v_order_dir = 6   or v_order_dir = 15  or v_order_dir = 7 then

                /* set @订单冻结金额# = 0; */
                set v_order_frozen_amt = 0;
            else

                /* set @订单冻结金额# = @订单冻结金额# + @交易变动金额#; */
                set v_order_frozen_amt = v_order_frozen_amt + v_trade_occur_amt;
            end if;

            /* if @订单方向# = 《订单方向-卖出》 then */
            if v_order_dir = 2 then

                /* set @订单冻结数量# = @订单冻结数量# - @临时_撤单数量#; */
                set v_order_frozen_qty = v_order_frozen_qty - v_tmp_wtdraw_qty;
            end if;

            /* 调用【原子_交易证券_交易_更新撤单回报订单记录】*/
            call db_tdsecu.pra_tdsetd_UpdateCancelRspOrder(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_order_date,
                v_order_id,
                v_wtdraw_qty,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_order_status,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_更新撤单回报订单记录出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #更新撤单表

            /* set @撤单状态# = 《撤单状态-成功》; */
            set v_wtdraw_status = "3";

            /* set @撤单数量# = @临时_撤单数量#; */
            set v_wtdraw_qty = v_tmp_wtdraw_qty;

            /* set @撤单说明# = @回报信息#; */
            set v_wtdraw_remark = v_rsp_info;

            /* 调用【原子_交易证券_交易_更新撤单状态】*/
            call db_tdsecu.pra_tdsetd_UpdateCancelOrderStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_order_date,
                v_order_id,
                v_wtdraw_status,
                v_wtdraw_qty,
                v_wtdraw_remark,
                v_report_date,
                v_report_time,
                v_init_date,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_pass_no,
                v_out_acco,
                v_exch_crncy_type,
                v_exch_no,
                v_stock_acco_no,
                v_stock_acco,
                v_stock_code_no,
                v_stock_code,
                v_external_no,
                v_report_no,
                v_order_price,
                v_trade_acco,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_更新撤单状态出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #处理订单资金持仓数据，保护指令变动和交易的变动

            /* set @可用计算标志# = 0; */
            set v_avail_cal_flag = 0;

            /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
            call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
                v_exch_crncy_type,
                v_comm_id,
                v_order_id,
                v_exch_no,
                v_stock_code,
                v_stock_type,
                v_asset_type,
                v_order_dir,
                v_impawn_ratio,
                v_stock_acco_no,
                v_stock_code_no,
                v_trade_code_no,
                v_target_code_no,
                v_comm_occur_amt,
                v_comm_occur_qty,
                v_trade_occur_amt,
                v_trade_occur_qty,
                v_is_record_jour,
                v_order_oper_way,
                v_busi_opor_no,
                v_open_close_permission,
                v_avail_cal_flag,
                v_combo_code,
                v_combo_posi_id,
                v_target_stock_code_no,
                v_error_code,
                v_error_info,
                v_open_posi_date);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @操作员编号# =@业务操作员编号# ; */
            set v_opor_no =v_busi_opor_no ;

            /* set @负债数量# =0 ; */
            set v_debt_qty =0 ;

            /* 调用【原子_交易证券_账户_更新融资融券指令交易资金持仓负债】*/
            call db_tdsecu.pra_tdseac_UpdateFinaLoanApprDebt(
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
                v_exch_crncy_type,
                v_comm_id,
                v_exch_no,
                v_stock_code,
                v_stock_type,
                v_asset_type,
                v_invest_type,
                v_order_dir,
                v_stock_acco_no,
                v_stock_code_no,
                v_trade_code_no,
                v_comm_occur_amt,
                v_comm_occur_qty,
                v_trade_occur_amt,
                v_trade_occur_qty,
                v_is_record_jour,
                v_debt_qty,
                v_error_code,
                v_error_info,
                v_debt_type);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新融资融券指令交易资金持仓负债出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

    /* if @撤单数量# > 0 then */
    if v_wtdraw_qty > 0 then

            /* set @废单数量# = 0; */
            set v_waste_qty = 0;

            /* 调用【原子_交易证券_交易_撤单处理汇总订单】*/
            call db_tdsecu.pra_tdsetd_CancelDealSumOrder(
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
                SET v_error_code = "tdsecuT.5.133.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤单处理汇总订单出现错误！',v_mysql_message);
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


    /* set @更新次数# = @更新次数# + 1; */
    set v_update_times = v_update_times + 1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_stock_type = v_stock_type;
    SET p_external_no = v_external_no;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_comm_date = v_comm_date;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_comm_opor = v_comm_opor;
    SET p_order_date = v_order_date;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_dir = v_order_dir;
    SET p_price_type = v_price_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_status = v_order_status;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_wtdraw_status = v_wtdraw_status;
    SET p_old_order_status = v_old_order_status;
    SET p_combo_code = v_combo_code;
    SET p_combo_posi_id = v_combo_posi_id;
    SET p_open_posi_date = v_open_posi_date;
    SET p_update_times = v_update_times;
    SET p_debt_type = v_debt_type;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_融资融券处理订单回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_FinaLoanDealOrderRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_FinaLoanDealOrderRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_rsp_info varchar(255),
    IN p_order_rsp_status varchar(2),
    IN p_price_type int,
    IN p_contra_no varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_busi_opor_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_acco_no int,
    OUT p_external_no bigint,
    OUT p_exch_crncy_type varchar(3),
    OUT p_comm_date int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_order_time int,
    OUT p_stock_type int,
    OUT p_net_price_flag int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_order_batch_no int,
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_order_oper_way varchar(2),
    OUT p_old_order_status varchar(2),
    OUT p_row_id bigint,
    OUT p_combo_code varchar(32),
    OUT p_combo_posi_id bigint,
    OUT p_strategy_id bigint,
    OUT p_update_times int,
    OUT p_debt_type int
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
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_rsp_info varchar(255);
    declare v_order_rsp_status varchar(2);
    declare v_price_type int;
    declare v_contra_no varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_busi_opor_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_acco_no int;
    declare v_external_no bigint;
    declare v_exch_crncy_type varchar(3);
    declare v_comm_date int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_order_time int;
    declare v_stock_type int;
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_order_batch_no int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_old_order_status varchar(2);
    declare v_row_id bigint;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_strategy_id bigint;
    declare v_update_times int;
    declare v_debt_type int;
    declare v_rsp_id bigint;
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_asset_type int;
    declare v_comm_opor int;
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_intrst_days int;
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_exter_comm_flag int;
    declare v_target_stock_code_no int;
    declare v_comm_cancel_qty decimal(18,2);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_comm_oper_way varchar(2);
    declare v_comm_dir int;
    declare v_comm_amt decimal(18,4);
    declare v_comm_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_total_strike_qty decimal(18,2);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_avail_cal_flag int;
    declare v_open_posi_date int;
    declare v_invest_type int;
    declare v_debt_qty decimal(18,2);
    declare v_tmp_wtdraw_qty decimal(18,2);
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_rsp_info = p_rsp_info;
    SET v_order_rsp_status = p_order_rsp_status;
    SET v_price_type = p_price_type;
    SET v_contra_no = p_contra_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_busi_opor_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_acco_no = 0;
    SET v_external_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_stock_type = 0;
    SET v_net_price_flag = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_order_status = "0";
    SET v_order_batch_no = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_order_oper_way = " ";
    SET v_old_order_status = "0";
    SET v_row_id = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_strategy_id = 0;
    SET v_update_times = 1;
    SET v_debt_type = 0;
    SET v_rsp_id = 0;
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_asset_type = 0;
    SET v_comm_opor = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_intrst_days = 0;
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_exter_comm_flag = 0;
    SET v_target_stock_code_no = 0;
    SET v_comm_cancel_qty = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_status = "0";
    SET v_comm_oper_way = " ";
    SET v_comm_dir = 0;
    SET v_comm_amt = 0;
    SET v_comm_qty = 0;
    SET v_calc_dir = 1;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_total_strike_qty = 0;
    SET v_all_wtdraw_qty = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_avail_cal_flag = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_invest_type = 0;
    SET v_debt_qty = 0;
    SET v_tmp_wtdraw_qty = 0;
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    
    #检查重复回报，如不重复，则插入表记录

    /* if @申报日期# = 0 then */
    if v_report_date = 0 then

        /* set @申报日期# = @初始化日期#; */
        set v_report_date = v_init_date;
    end if;

    /* if @申报时间# = 0 then */
    if v_report_time = 0 then

        /* [获取机器时间][@申报时间#] */
        select date_format(curtime(),'%H%i%s') into v_report_time;

    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_报盘_检查订单重复回报】*/
        call db_tdsecu.pra_tdserp_CheckOrderRspDup(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pass_no,
            v_out_acco,
            v_exch_no,
            v_stock_acco,
            v_stock_code,
            v_report_date,
            v_report_time,
            v_report_no,
            v_rsp_info,
            v_order_rsp_status,
            v_price_type,
            v_order_id,
            v_error_code,
            v_error_info,
            v_rsp_id,
            v_row_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.134.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_检查订单重复回报出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;

    /* [事务开始] */
    START TRANSACTION;


        /* if @订单回报状态# = 《订单回报状态-已报废单》 then */
        if v_order_rsp_status = "3" then

            /* set @订单序号# = @记录序号#; */
            set v_order_id = v_row_id;
        end if;
        #获取原订单信息

        /* 调用【原子_交易证券_交易_锁定获取订单回报订单信息】*/
        call db_tdsecu.pra_tdsetd_LockGetRspOrder(
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
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_crncy_type,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_external_no,
            v_comm_id,
            v_comm_batch_no,
            v_comm_opor,
            v_order_date,
            v_order_time,
            v_order_batch_no,
            v_order_dir,
            v_price_type,
            v_order_price,
            v_order_qty,
            v_order_status,
            v_wtdraw_qty,
            v_strike_amt,
            v_strike_qty,
            v_strike_bond_accr_intrst,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_net_price_flag,
            v_intrst_days,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_compli_trig_id,
            v_remark_info,
            v_order_oper_way,
            v_exter_comm_flag,
            v_busi_opor_no,
            v_combo_code,
            v_combo_posi_id,
            v_strategy_id,
            v_target_stock_code_no,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.134.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_锁定获取订单回报订单信息出现错误！',v_mysql_message);
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
            SET v_error_code = "tdsecuT.5.134.769";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单状态=",v_order_status,",","成交数量=",v_strike_qty),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单状态=",v_order_status,",","成交数量=",v_strike_qty);
            end if;
            leave label_pro;
        end if;


        /* set @原订单状态# = @订单状态#; */
        set v_old_order_status = v_order_status;

        /* if @订单回报状态# = 《订单回报状态-已报》 then */
        if v_order_rsp_status = "1" then
            #正常回报处理逻辑

            /* set @订单状态# = 《订单状态-已报》; */
            set v_order_status = "2";

            /* set @撤单数量# = 0; */
            set v_wtdraw_qty = 0;

            /* 调用【原子_交易证券_报盘_更新订单回报记录】*/
            call db_tdsecu.pra_tdserp_UpdateOrderRsp(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_order_id,
                v_rsp_id,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_report_date,
                v_report_time,
                v_report_no,
                v_all_fee,
                v_wtdraw_qty,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_order_status,
                v_rsp_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.134.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_更新订单回报记录出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        else
            #废单回报处理逻辑

            /* [检查报错返回][(@订单状态# = 《订单状态-废单》and @订单操作方式# <> 《订单操作方式-报盘机补单》) or (@订单状态# = 《订单状态-废单》and @订单操作方式# = 《订单操作方式-报盘机补单》and @订单数量# = @撤单数量#)][752][@订单序号#] */
            if (v_order_status = "8"and v_order_oper_way <> "33") or (v_order_status = "8"and v_order_oper_way = "33"and v_order_qty = v_wtdraw_qty) then
                ROLLBACK;
                SET v_error_code = "tdsecuT.5.134.752";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单序号=",v_order_id);
                end if;
                leave label_pro;
            end if;


            /* set @撤单数量# = @订单数量#; */
            set v_wtdraw_qty = v_order_qty;
            #如果是指令订单，更新指令表

            /* if @指令序号# > 0 then */
            if v_comm_id > 0 then

                /* set @指令撤销数量# = 0; */
                set v_comm_cancel_qty = 0;

                /* 调用【原子_交易证券_指令_撤销更新指令】*/
                call db_tdsecu.pra_tdseap_CancelUpdateComm(
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
                    v_comm_executor,
                    v_comm_oper_way,
                    v_comm_dir,
                    v_comm_amt);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.134.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_撤销更新指令出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #计算指令变动金额

                /* set @指令方向# = @订单方向#; */
                set v_comm_dir = v_order_dir;

                /* set @指令数量# = @撤单数量#; */
                set v_comm_qty = v_wtdraw_qty;

                /* set @计算方向# = 《计算方向-加上》; */
                set v_calc_dir = 1;

                /* 调用【原子_交易证券_公用_计算融资融券撤单指令变动金额和数量】*/
                call db_tdsecu.pra_tdsepb_GetFinaLoanCancelCommOccurAmtAndQty(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_stock_type,
                    v_comm_dir,
                    v_limit_actual_price,
                    v_wtdraw_qty,
                    v_comm_status,
                    v_net_price_flag,
                    v_par_value,
                    v_bond_accr_intrst,
                    v_bond_rate_type,
                    v_comm_amt,
                    v_error_code,
                    v_error_info,
                    v_comm_occur_amt,
                    v_comm_occur_qty);
                if v_error_code = "1" then
                    SET v_error_code = "tdsecuT.5.134.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券撤单指令变动金额和数量出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            end if;

            /* set @总成交数量# = 0; */
            set v_total_strike_qty = 0;

            /* set @总撤单数量# = @撤单数量#; */
            set v_all_wtdraw_qty = v_wtdraw_qty;

            /* 调用【原子_交易证券_公用_计算融资融券撤单交易变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetFinaLoanCancelExchChangeAmtAndQty(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_stock_type,
                v_order_dir,
                v_order_qty,
                v_order_price,
                v_order_frozen_amt,
                v_wtdraw_qty,
                v_total_strike_qty,
                v_all_wtdraw_qty,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_error_code,
                v_error_info,
                v_trade_occur_amt,
                v_trade_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.134.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券撤单交易变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #更新订单数据

            /* set @订单状态# = 《订单状态-废单》 ; */
            set v_order_status = "8" ;

            /* set @全部费用#= 0; */
            set v_all_fee= 0;

            /* set @订单冻结金额# = 0; */
            set v_order_frozen_amt = 0;

            /* set @订单冻结数量# = 0; */
            set v_order_frozen_qty = 0;

            /* 调用【原子_交易证券_报盘_融资融券更新订单回报记录】*/
            call db_tdsecu.pra_tdserp_FinaLoanUpdateOrderRsp(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_order_id,
                v_rsp_id,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_report_date,
                v_report_time,
                v_report_no,
                v_all_fee,
                v_wtdraw_qty,
                v_order_frozen_amt,
                v_order_frozen_qty,
                v_order_status,
                v_rsp_info,
                v_contra_no,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.134.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_融资融券更新订单回报记录出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #处理订单资金持仓数据，保护指令变动和交易的变动

            /* set @可用计算标志# = 0; */
            set v_avail_cal_flag = 0;

            /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
            call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
                v_exch_crncy_type,
                v_comm_id,
                v_order_id,
                v_exch_no,
                v_stock_code,
                v_stock_type,
                v_asset_type,
                v_order_dir,
                v_impawn_ratio,
                v_stock_acco_no,
                v_stock_code_no,
                v_trade_code_no,
                v_target_code_no,
                v_comm_occur_amt,
                v_comm_occur_qty,
                v_trade_occur_amt,
                v_trade_occur_qty,
                v_is_record_jour,
                v_order_oper_way,
                v_busi_opor_no,
                v_open_close_permission,
                v_avail_cal_flag,
                v_combo_code,
                v_combo_posi_id,
                v_target_stock_code_no,
                v_error_code,
                v_error_info,
                v_open_posi_date);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.134.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @操作员编号# =@业务操作员编号# ; */
            set v_opor_no =v_busi_opor_no ;

            /* set @投资类型# = 《投资类型-二级市场交易性金融资产》; */
            set v_invest_type = 1;

            /* set @负债数量# = 0; */
            set v_debt_qty = 0;

            /* 调用【原子_交易证券_账户_更新融资融券指令交易资金持仓负债】*/
            call db_tdsecu.pra_tdseac_UpdateFinaLoanApprDebt(
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
                v_exch_crncy_type,
                v_comm_id,
                v_exch_no,
                v_stock_code,
                v_stock_type,
                v_asset_type,
                v_invest_type,
                v_order_dir,
                v_stock_acco_no,
                v_stock_code_no,
                v_trade_code_no,
                v_comm_occur_amt,
                v_comm_occur_qty,
                v_trade_occur_amt,
                v_trade_occur_qty,
                v_is_record_jour,
                v_debt_qty,
                v_error_code,
                v_error_info,
                v_debt_type);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.134.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新融资融券指令交易资金持仓负债出现错误！',v_mysql_message);
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


    /* set @更新次数# = @更新次数# + 1; */
    set v_update_times = v_update_times + 1;

    /* set @临时_撤单数量# = @撤单数量#; */
    set v_tmp_wtdraw_qty = v_wtdraw_qty;

    /* [事务开始] */
    START TRANSACTION;


        /* if @订单状态# = 《订单状态-废单》 then */
        if v_order_status = "8" then

            /* set @废单数量# = @撤单数量#; */
            set v_waste_qty = v_wtdraw_qty;
        end if;

        /* set @撤单数量# = 0; */
        set v_wtdraw_qty = 0;

        /* 调用【原子_交易证券_交易_撤单处理汇总订单】*/
        call db_tdsecu.pra_tdsetd_CancelDealSumOrder(
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
            SET v_error_code = "tdsecuT.5.134.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_撤单处理汇总订单出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @撤单数量# = @临时_撤单数量#; */
    set v_wtdraw_qty = v_tmp_wtdraw_qty;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_external_no = v_external_no;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_comm_date = v_comm_date;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_order_time = v_order_time;
    SET p_stock_type = v_stock_type;
    SET p_net_price_flag = v_net_price_flag;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_order_status = v_order_status;
    SET p_order_batch_no = v_order_batch_no;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_order_oper_way = v_order_oper_way;
    SET p_old_order_status = v_old_order_status;
    SET p_row_id = v_row_id;
    SET p_combo_code = v_combo_code;
    SET p_combo_posi_id = v_combo_posi_id;
    SET p_strategy_id = v_strategy_id;
    SET p_update_times = v_update_times;
    SET p_debt_type = v_debt_type;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_处理融资融券成交回报费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_DealFinaLoanStrikeRspFee;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_DealFinaLoanStrikeRspFee(
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
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_stock_acco_no int,
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_target_code_no int,
    IN p_trade_code_no int,
    IN p_order_id bigint,
    IN p_order_date int,
    IN p_order_batch_no int,
    IN p_order_dir int,
    IN p_comm_id bigint,
    IN p_strike_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_strike_amt decimal(18,4),
    IN p_strike_no varchar(64),
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_id bigint,
    IN p_all_fee decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_trade_cost_fee decimal(18,4),
    IN p_trade_system_use_fee decimal(18,4),
    IN p_trade_tax decimal(18,4),
    IN p_stock_settle_fee decimal(18,4),
    IN p_target_code varchar(6),
    IN p_impawn_ratio decimal(18,12),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_intrst_days int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_repo_days int,
    IN p_repo_cale_days int,
    IN p_repo_back_date int,
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_busi_opor_no int,
    IN p_order_oper_way varchar(2),
    IN p_cost_calc_type int,
    IN p_exgp_cost_amt decimal(18,4),
    IN p_exgp_intrst_cost_amt decimal(18,4),
    IN p_exgp_curr_qty decimal(18,2),
    IN p_asac_cost_amt decimal(18,4),
    IN p_asac_intrst_cost_amt decimal(18,4),
    IN p_asac_curr_qty decimal(18,2),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_strike_occur_amt decimal(18,4),
    IN p_strike_occur_qty decimal(18,2),
    IN p_trade_occur_amt decimal(18,4),
    IN p_trade_occur_qty decimal(18,2),
    IN p_combo_code varchar(32),
    IN p_combo_posi_id bigint,
    IN p_detail_posi_id_str varchar(1024),
    IN p_pass_no int,
    IN p_order_time int,
    IN p_order_price decimal(16,9),
    IN p_report_no varchar(32),
    IN p_order_qty decimal(18,2),
    IN p_fina_return_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_debt_type int,
    OUT p_stock_code_no_str varchar(4096),
    OUT p_exgp_detail_posi_id_str varchar(1024),
    OUT p_asac_detail_posi_id_str varchar(1024),
    OUT p_asac_stock_code_no_str varchar(4096)
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
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_comm_id bigint;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_strike_no varchar(64);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_id bigint;
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_target_code varchar(6);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_repo_days int;
    declare v_repo_cale_days int;
    declare v_repo_back_date int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_cost_calc_type int;
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_curr_qty decimal(18,2);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_strike_occur_amt decimal(18,4);
    declare v_strike_occur_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_detail_posi_id_str varchar(1024);
    declare v_pass_no int;
    declare v_order_time int;
    declare v_order_price decimal(16,9);
    declare v_report_no varchar(32);
    declare v_order_qty decimal(18,2);
    declare v_fina_return_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_debt_type int;
    declare v_stock_code_no_str varchar(4096);
    declare v_exgp_detail_posi_id_str varchar(1024);
    declare v_asac_detail_posi_id_str varchar(1024);
    declare v_asac_stock_code_no_str varchar(4096);
    declare v_is_record_jour int;
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_price decimal(16,9);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_strike_occur_amt decimal(18,4);
    declare v_tmp_trade_occur_amt decimal(18,4);
    declare v_target_stock_code_no int;
    declare v_invest_type int;
    declare v_repo_order_id bigint;
    declare v_repo_strike_id bigint;
    declare v_strike_fee decimal(18,4);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_open_posi_date int;

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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_order_id = p_order_id;
    SET v_order_date = p_order_date;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir = p_order_dir;
    SET v_comm_id = p_comm_id;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_price = p_strike_price;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_no = p_strike_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_id = p_strike_id;
    SET v_all_fee = p_all_fee;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_trade_cost_fee = p_trade_cost_fee;
    SET v_trade_system_use_fee = p_trade_system_use_fee;
    SET v_trade_tax = p_trade_tax;
    SET v_stock_settle_fee = p_stock_settle_fee;
    SET v_target_code = p_target_code;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_intrst_days = p_intrst_days;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_repo_days = p_repo_days;
    SET v_repo_cale_days = p_repo_cale_days;
    SET v_repo_back_date = p_repo_back_date;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_order_oper_way = p_order_oper_way;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_exgp_cost_amt = p_exgp_cost_amt;
    SET v_exgp_intrst_cost_amt = p_exgp_intrst_cost_amt;
    SET v_exgp_curr_qty = p_exgp_curr_qty;
    SET v_asac_cost_amt = p_asac_cost_amt;
    SET v_asac_intrst_cost_amt = p_asac_intrst_cost_amt;
    SET v_asac_curr_qty = p_asac_curr_qty;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_strike_occur_amt = p_strike_occur_amt;
    SET v_strike_occur_qty = p_strike_occur_qty;
    SET v_trade_occur_amt = p_trade_occur_amt;
    SET v_trade_occur_qty = p_trade_occur_qty;
    SET v_combo_code = p_combo_code;
    SET v_combo_posi_id = p_combo_posi_id;
    SET v_detail_posi_id_str = p_detail_posi_id_str;
    SET v_pass_no = p_pass_no;
    SET v_order_time = p_order_time;
    SET v_order_price = p_order_price;
    SET v_report_no = p_report_no;
    SET v_order_qty = p_order_qty;
    SET v_fina_return_type = p_fina_return_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_debt_type = 0;
    SET v_stock_code_no_str = " ";
    SET v_exgp_detail_posi_id_str = " ";
    SET v_asac_detail_posi_id_str = " ";
    SET v_asac_stock_code_no_str = " ";
    SET v_is_record_jour = 1;
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_price = 0;
    SET v_tmp_strike_amt = 0;
    SET v_tmp_strike_occur_amt = 0;
    SET v_tmp_trade_occur_amt = 0;
    SET v_target_stock_code_no = 0;
    SET v_invest_type = 0;
    SET v_repo_order_id = 0;
    SET v_repo_strike_id = 0;
    SET v_strike_fee = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;
    #[检查正常返回][@全部费用# = 0 ]

    /* set @临时_成交数量#=@成交数量#; */
    set v_tmp_strike_qty=v_strike_qty;

    /* set @临时_成交价格#=@成交价格#; */
    set v_tmp_strike_price=v_strike_price;

    /* set @临时_成交金额#=@成交金额#; */
    set v_tmp_strike_amt=v_strike_amt;

    /* set @临时_成交变动金额#=@成交变动金额#; */
    set v_tmp_strike_occur_amt=v_strike_occur_amt;

    /* set @操作员编号# = @业务操作员编号#; */
    set v_opor_no = v_busi_opor_no;

    /* set @临时_交易变动金额# = @交易变动金额#; */
    set v_tmp_trade_occur_amt = v_trade_occur_amt;

    /* set @目标证券代码编号# = 0; */
    set v_target_stock_code_no = 0;

    /* set @投资类型# = 《投资类型-二级市场交易性金融资产》; */
    set v_invest_type = 1;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_报盘_更新成交回报费用】*/
        call db_tdsecu.pra_tdserp_UpdateStrikeRspFee(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_strike_id,
            v_order_id,
            v_order_date,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_trade_cost_fee,
            v_trade_system_use_fee,
            v_trade_tax,
            v_stock_settle_fee,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.135.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_更新成交回报费用出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @成交数量#= 0; */
        set v_strike_qty= 0;

        /* set @成交价格#=0; */
        set v_strike_price=0;

        /* set @成交金额# = 0; */
        set v_strike_amt = 0;

        /* set @债券计提利息#=0; */
        set v_bond_accr_intrst=0;

        /* set @交易变动金额# = 0; */
        set v_trade_occur_amt = 0;

        /* set @交易变动数量# = 0; */
        set v_trade_occur_qty = 0;

        /* set @回购委托序号# = 0; */
        set v_repo_order_id = 0;

        /* set @回购成交序号# = 0; */
        set v_repo_strike_id = 0;

        /* set @成交费用# = @全部费用#; */
        set v_strike_fee = v_all_fee;

        /* if @全部费用# > 0 then */
        if v_all_fee > 0 then

            /* 调用【原子_交易证券_公用_计算融资融券成交变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetFinaLoanStrikeOccurAmtAndQty(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_stock_type,
                v_order_dir,
                v_strike_qty,
                v_strike_price,
                v_strike_amt,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_all_fee,
                v_error_code,
                v_error_info,
                v_strike_occur_amt,
                v_strike_bond_accr_intrst,
                v_strike_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.135.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券成交变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* 调用【原子_交易证券_账户_更新成交资金持仓】*/
            call db_tdsecu.pra_tdseac_UpdateStrikeCashPosi(
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
                v_crncy_type,
                v_exch_crncy_type,
                v_order_dir,
                v_comm_id,
                v_strike_id,
                v_exch_no,
                v_stock_code,
                v_stock_acco_no,
                v_stock_code_no,
                v_trade_code_no,
                v_target_code_no,
                v_asset_type,
                v_stock_type,
                v_strike_occur_amt,
                v_strike_occur_qty,
                v_trade_occur_amt,
                v_trade_occur_qty,
                v_impawn_ratio,
                v_repo_order_id,
                v_repo_strike_id,
                v_strike_no,
                v_strike_date,
                v_strike_time,
                v_strike_qty,
                v_strike_price,
                v_strike_amt,
                v_strike_fee,
                v_par_value,
                v_net_price_flag,
                v_intrst_days,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_repo_days,
                v_repo_cale_days,
                v_repo_back_date,
                v_capit_reback_days,
                v_posi_reback_days,
                v_is_record_jour,
                v_order_oper_way,
                v_cost_calc_type,
                v_exgp_cost_amt,
                v_exgp_intrst_cost_amt,
                v_exgp_curr_qty,
                v_asac_cost_amt,
                v_asac_intrst_cost_amt,
                v_asac_curr_qty,
                v_buy_ref_rate,
                v_sell_ref_rate,
                v_combo_code,
                v_combo_posi_id,
                v_order_date,
                v_target_stock_code_no,
                v_error_code,
                v_error_info,
                v_open_posi_date);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.135.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新成交资金持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

        /* set @成交数量#=@临时_成交数量#; */
        set v_strike_qty=v_tmp_strike_qty;

        /* set @成交价格#=@临时_成交价格#; */
        set v_strike_price=v_tmp_strike_price;

        /* set @成交金额#=@临时_成交金额#; */
        set v_strike_amt=v_tmp_strike_amt;

        /* set @成交变动数量# = @临时_成交数量#; */
        set v_strike_occur_qty = v_tmp_strike_qty;

        /* set @成交变动金额# = @临时_成交变动金额#; */
        set v_strike_occur_amt = v_tmp_strike_occur_amt;

        /* set @交易变动数量# = -1 * @成交变动数量#; */
        set v_trade_occur_qty = -1 * v_strike_occur_qty;

        /* set @交易变动金额# = @临时_交易变动金额#; */
        set v_trade_occur_amt = v_tmp_trade_occur_amt;

        /* set @操作员编号# =@业务操作员编号# ; */
        set v_opor_no =v_busi_opor_no ;

        /* 调用【原子_交易证券_账户_更新融资融券成交资金持仓负债】*/
        call db_tdsecu.pra_tdseac_UpdateFinaLoanStrikeDebt(
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
            v_exch_crncy_type,
            v_order_id,
            v_order_date,
            v_order_time,
            v_order_dir,
            v_order_price,
            v_strike_id,
            v_report_no,
            v_exch_no,
            v_stock_code,
            v_stock_acco_no,
            v_stock_code_no,
            v_asset_type,
            v_stock_type,
            v_invest_type,
            v_strike_occur_amt,
            v_strike_occur_qty,
            v_trade_occur_amt,
            v_trade_occur_qty,
            v_strike_no,
            v_strike_date,
            v_strike_time,
            v_strike_qty,
            v_strike_price,
            v_strike_amt,
            v_strike_fee,
            v_order_qty,
            v_fina_return_type,
            v_order_oper_way,
            v_error_code,
            v_error_info,
            v_detail_posi_id_str,
            v_debt_type,
            v_stock_code_no_str,
            v_asac_detail_posi_id_str,
            v_asac_stock_code_no_str);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.135.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新融资融券成交资金持仓负债出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @订单操作方式# = 《订单操作方式-增强交易》 or @订单操作方式# = 《订单操作方式-增强交易平仓》 then */
        if v_order_oper_way = "14" or v_order_oper_way = "51" then

            /* set @交易变动金额# = @临时_交易变动金额#; */
            set v_trade_occur_amt = v_tmp_trade_occur_amt;

            /* 调用【原子_交易证券_T0_成交证券持仓明细变化】*/
            call db_tdsecu.pra_tdset0_StikePosiDetailChange(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_busi_opor_no,
                v_order_oper_way,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_stock_acco_no,
                v_asset_acco_no,
                v_stock_code,
                v_exch_no,
                v_stock_type,
                v_order_dir,
                v_stock_code_no,
                v_crncy_type,
                v_exch_crncy_type,
                v_strike_no,
                v_strike_date,
                v_strike_time,
                v_strike_price,
                v_strike_qty,
                v_strike_amt,
                v_strike_fee,
                v_trade_occur_qty,
                v_strike_occur_qty,
                v_trade_occur_amt,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.135.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_成交证券持仓明细变化出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


        /* elseif @订单操作方式# = 《订单操作方式-手工补单》 or @订单操作方式# = 《订单操作方式-报盘机补单》 then */
        elseif v_order_oper_way = "31" or v_order_oper_way = "33" then

            /* 调用【原子_交易证券_T0_体外交易操作员券源限额设置持仓变化】*/
            call db_tdsecu.pra_tdset0_OutOporStockLimitPosiChange(
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
                v_stock_acco_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_type,
                v_order_dir,
                v_stock_code,
                v_stock_code_no,
                v_trade_occur_qty,
                v_strike_occur_qty,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.135.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_体外交易操作员券源限额设置持仓变化出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

        /* 调用【原子_交易证券_交易_成交费用处理汇总订单】*/
        call db_tdsecu.pra_tdsetd_StrikeFeeDealSumOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_order_date,
            v_order_batch_no,
            v_order_dir,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_trade_cost_fee,
            v_trade_system_use_fee,
            v_trade_tax,
            v_stock_settle_fee,
            v_order_oper_way,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.135.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_成交费用处理汇总订单出现错误！',v_mysql_message);
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
    SET p_debt_type = v_debt_type;
    SET p_stock_code_no_str = v_stock_code_no_str;
    SET p_exgp_detail_posi_id_str = v_exgp_detail_posi_id_str;
    SET p_asac_detail_posi_id_str = v_asac_detail_posi_id_str;
    SET p_asac_stock_code_no_str = v_asac_stock_code_no_str;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_处理融资融券汇总成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_DealFinaLoanSumStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_DealFinaLoanSumStrikeRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_report_date int,
    IN p_report_no varchar(32),
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_order_dir int,
    IN p_strike_price decimal(16,9),
    IN p_total_strike_qty decimal(18,2),
    IN p_total_strike_amt decimal(18,4),
    IN p_rsp_info varchar(255),
    IN p_repo_days int,
    IN p_strike_deal_type int,
    IN p_repo_cale_days int,
    IN p_repo_back_date int,
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_exgp_cost_amt decimal(18,4),
    IN p_exgp_intrst_cost_amt decimal(18,4),
    IN p_exgp_curr_qty decimal(18,2),
    IN p_asac_cost_amt decimal(18,4),
    IN p_asac_intrst_cost_amt decimal(18,4),
    IN p_asac_curr_qty decimal(18,2),
    IN p_rsp_id bigint,
    IN p_order_id bigint,
    IN p_sys_config_str varchar(64),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_combo_code varchar(32),
    IN p_combo_posi_id bigint,
    IN p_asset_acco_type int,
    IN p_fina_return_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_order_date int,
    OUT p_order_batch_no int,
    OUT p_report_time int,
    OUT p_comm_date int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_busi_opor_no int,
    OUT p_order_oper_way varchar(2),
    OUT p_target_code varchar(6),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_order_frozen_amt decimal(18,4),
    OUT p_order_frozen_qty decimal(18,2),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_cost_calc_type int,
    OUT p_order_status varchar(2),
    OUT p_update_times int,
    OUT p_strike_occur_amt decimal(18,4),
    OUT p_strike_occur_qty decimal(18,2),
    OUT p_trade_occur_amt decimal(18,4),
    OUT p_trade_occur_qty decimal(18,2),
    OUT p_open_posi_date int,
    OUT p_original_order_dir int,
    OUT p_detail_posi_id_str varchar(1024),
    OUT p_stock_code_no_str varchar(4096)
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
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_total_strike_qty decimal(18,2);
    declare v_total_strike_amt decimal(18,4);
    declare v_rsp_info varchar(255);
    declare v_repo_days int;
    declare v_strike_deal_type int;
    declare v_repo_cale_days int;
    declare v_repo_back_date int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_curr_qty decimal(18,2);
    declare v_rsp_id bigint;
    declare v_order_id bigint;
    declare v_sys_config_str varchar(64);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_asset_acco_type int;
    declare v_fina_return_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_report_time int;
    declare v_comm_date int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_target_code varchar(6);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_cost_calc_type int;
    declare v_order_status varchar(2);
    declare v_update_times int;
    declare v_strike_occur_amt decimal(18,4);
    declare v_strike_occur_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_open_posi_date int;
    declare v_original_order_dir int;
    declare v_detail_posi_id_str varchar(1024);
    declare v_stock_code_no_str varchar(4096);
    declare v_tmp_strike_date int;
    declare v_tmp_strike_time int;
    declare v_tmp_strike_no varchar(64);
    declare v_tmp_strike_price decimal(16,9);
    declare v_is_record_jour int;
    declare v_strike_fee decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_invest_type int;
    declare v_deal_capital_release_type int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_opor int;
    declare v_external_no bigint;
    declare v_order_time int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_exter_comm_flag int;
    declare v_target_stock_code_no int;
    declare v_old_order_status varchar(2);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_strike_bond_accr_intrst decimal(18,4);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_repo_order_id bigint;
    declare v_comm_qty decimal(18,2);
    declare v_comm_oper_way varchar(2);
    declare v_comm_strike_qty decimal(18,2);
    declare v_repo_strike_id bigint;

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
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_order_dir = p_order_dir;
    SET v_strike_price = p_strike_price;
    SET v_total_strike_qty = p_total_strike_qty;
    SET v_total_strike_amt = p_total_strike_amt;
    SET v_rsp_info = p_rsp_info;
    SET v_repo_days = p_repo_days;
    SET v_strike_deal_type = p_strike_deal_type;
    SET v_repo_cale_days = p_repo_cale_days;
    SET v_repo_back_date = p_repo_back_date;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_exgp_cost_amt = p_exgp_cost_amt;
    SET v_exgp_intrst_cost_amt = p_exgp_intrst_cost_amt;
    SET v_exgp_curr_qty = p_exgp_curr_qty;
    SET v_asac_cost_amt = p_asac_cost_amt;
    SET v_asac_intrst_cost_amt = p_asac_intrst_cost_amt;
    SET v_asac_curr_qty = p_asac_curr_qty;
    SET v_rsp_id = p_rsp_id;
    SET v_order_id = p_order_id;
    SET v_sys_config_str = p_sys_config_str;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_combo_code = p_combo_code;
    SET v_combo_posi_id = p_combo_posi_id;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_fina_return_type = p_fina_return_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_batch_no = 0;
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_busi_opor_no = 0;
    SET v_order_oper_way = " ";
    SET v_target_code = " ";
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_wtdraw_qty = 0;
    SET v_cost_calc_type = 0;
    SET v_order_status = "0";
    SET v_update_times = 1;
    SET v_strike_occur_amt = 0;
    SET v_strike_occur_qty = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_original_order_dir = 0;
    SET v_detail_posi_id_str = " ";
    SET v_stock_code_no_str = " ";
    SET v_tmp_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_strike_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_strike_no = " ";
    SET v_tmp_strike_price = 0;
    SET v_is_record_jour = 1;
    SET v_strike_fee = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_invest_type = 0;
    SET v_deal_capital_release_type = 0;
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_opor = 0;
    SET v_external_no = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_exter_comm_flag = 0;
    SET v_target_stock_code_no = 0;
    SET v_old_order_status = "0";
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_amt = 0;
    SET v_tmp_strike_bond_accr_intrst = 0;
    SET v_all_wtdraw_qty = 0;
    SET v_repo_order_id = 0;
    SET v_comm_qty = 0;
    SET v_comm_oper_way = " ";
    SET v_comm_strike_qty = 0;
    SET v_repo_strike_id = 0;

    
    label_pro:BEGIN
    
    #检查重复回报，如不重复，则插入表记录

    /* [事务开始] */
    START TRANSACTION;


        /* if @回报序号# = 0 then */
        if v_rsp_id = 0 then

           /* set @成交数量# = @总成交数量#; */
           set v_strike_qty = v_total_strike_qty;

           /* set @成交金额# = @总成交金额#; */
           set v_strike_amt = v_total_strike_amt;

           /* 调用【原子_交易证券_报盘_检查成交重复回报】*/
           call db_tdsecu.pra_tdserp_CheckStrikeRspDup(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_init_date,
               v_pass_no,
               v_out_acco,
               v_exch_no,
               v_stock_acco,
               v_stock_code,
               v_strike_date,
               v_strike_time,
               v_strike_no,
               v_report_date,
               v_report_no,
               v_order_dir,
               v_strike_price,
               v_strike_qty,
               v_strike_amt,
               v_strike_deal_type,
               v_rsp_info,
               v_asset_acco_type,
               v_error_code,
               v_error_info,
               v_rsp_id);
           if v_error_code = "1" then
               SET v_error_code = "tdsecuT.5.136.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_检查成交重复回报出现错误！',v_mysql_message);
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


    /* set @临时_成交日期# = @成交日期#; */
    set v_tmp_strike_date = v_strike_date;

    /* set @临时_成交时间# = @成交时间#; */
    set v_tmp_strike_time = v_strike_time;

    /* set @临时_成交编号# = @成交编号#; */
    set v_tmp_strike_no = v_strike_no;

    /* set @临时_成交价格# = @成交价格#; */
    set v_tmp_strike_price = v_strike_price;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @成交费用# = 0; */
    set v_strike_fee = 0;

    /* set @全部费用# = 0; */
    set v_all_fee = 0;

    /* set @印花税# = 0; */
    set v_stamp_tax = 0;

    /* set @过户费# = 0; */
    set v_trans_fee = 0;

    /* set @经手费# = 0; */
    set v_brkage_fee = 0;

    /* set @证管费# = 0; */
    set v_SEC_charges = 0;

    /* set @其他费用# = 0; */
    set v_other_fee = 0;

    /* set @交易佣金# = 0; */
    set v_trade_commis = 0;

    /* set @其他佣金# = 0; */
    set v_other_commis = 0;

    /* set @交易征费# = 0; */
    set v_trade_tax = 0;

    /* set @交易费# = 0; */
    set v_trade_cost_fee = 0;

    /* set @交易系统使用费# = 0; */
    set v_trade_system_use_fee = 0;

    /* set @股份交收费# = 0; */
    set v_stock_settle_fee = 0;

    /* set @投资类型# = 《投资类型-二级市场交易性金融资产》; */
    set v_invest_type = 1;

    /* [事务开始] */
    START TRANSACTION;

        #获取部成资金占用释放方式，支持PB的特殊处理，与券商处理保持一致，影响可用

        /* set @部成资金占用释放方式# = substring(@系统控制配置串#, 3, 1); */
        set v_deal_capital_release_type = substring(v_sys_config_str, 3, 1);
        #获取原订单信息

        /* 调用【原子_交易证券_交易_锁定获取成交回报订单信息】*/
        call db_tdsecu.pra_tdsetd_LockGetStrikeRspOrder(
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
            v_report_date,
            v_report_no,
            v_order_id,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_crncy_type,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_id,
            v_comm_batch_no,
            v_comm_opor,
            v_external_no,
            v_report_time,
            v_order_batch_no,
            v_order_date,
            v_order_time,
            v_order_dir,
            v_price_type,
            v_order_price,
            v_order_qty,
            v_order_status,
            v_wtdraw_qty,
            v_strike_amt,
            v_strike_qty,
            v_net_price_flag,
            v_intrst_days,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_strike_bond_accr_intrst,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_rsp_info,
            v_compli_trig_id,
            v_remark_info,
            v_busi_opor_no,
            v_exter_comm_flag,
            v_order_oper_way,
            v_cost_calc_type,
            v_target_stock_code_no,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.136.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_锁定获取成交回报订单信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @原订单状态# = @订单状态#; */
        set v_old_order_status = v_order_status;

        /* set @原订单方向# = @订单方向#; */
        set v_original_order_dir = v_order_dir;

        /* set @临时_成交数量# = @成交数量#; */
        set v_tmp_strike_qty = v_strike_qty;

        /* set @临时_成交金额# = @成交金额#; */
        set v_tmp_strike_amt = v_strike_amt;

        /* set @临时_成交债券计提利息# = @成交债券计提利息#; */
        set v_tmp_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
        #计算本次应该计算的成交数量、成交价格

        /* set @成交数量# = @总成交数量# - @成交数量#; */
        set v_strike_qty = v_total_strike_qty - v_strike_qty;

        /* set @成交金额# = @总成交金额# - @成交金额#; */
        set v_strike_amt = v_total_strike_amt - v_strike_amt;

        /* set @成交价格# = round(@成交金额# / @成交数量#,3); */
        set v_strike_price = round(v_strike_amt / v_strike_qty,3);

        /* set @总撤单数量# = @撤单数量#; */
        set v_all_wtdraw_qty = v_wtdraw_qty;

        /* [检查报错返回][(@总成交数量# + @总撤单数量# > @订单数量#) or (@成交数量# <= 0)][755][@订单数量#,@撤单数量#,@成交数量#,@临时_成交数量#] */
        if (v_total_strike_qty + v_all_wtdraw_qty > v_order_qty) or (v_strike_qty <= 0) then
            ROLLBACK;
            SET v_error_code = "tdsecuT.5.136.755";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单数量=",v_order_qty,",","撤单数量=",v_wtdraw_qty,",","成交数量=",v_strike_qty,",","临时_成交数量=",v_tmp_strike_qty),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单数量=",v_order_qty,",","撤单数量=",v_wtdraw_qty,",","成交数量=",v_strike_qty,",","临时_成交数量=",v_tmp_strike_qty);
            end if;
            leave label_pro;
        end if;


        /* 调用【原子_交易证券_公用_计算融资融券成交交易变动金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetFinaLoanStrikeExchChangeAmtAndQty(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_stock_type,
            v_order_dir,
            v_order_qty,
            v_order_price,
            v_order_frozen_amt,
            v_strike_qty,
            v_total_strike_qty,
            v_all_wtdraw_qty,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_deal_capital_release_type,
            v_strike_amt,
            v_error_code,
            v_error_info,
            v_trade_occur_amt,
            v_trade_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.136.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券成交交易变动金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @回购委托序号# = @订单序号#; */
        set v_repo_order_id = v_order_id;
        #更新指令

        /* if @指令序号# > 0 then */
        if v_comm_id > 0 then

            /* 调用【原子_交易证券_指令_成交更新指令】*/
            call db_tdsecu.pra_tdseap_StrikeUpdateComm(
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
                v_sell_ref_rate,
                v_buy_ref_rate,
                v_exch_no,
                v_error_code,
                v_error_info,
                v_comm_date,
                v_comm_batch_no,
                v_comm_executor,
                v_comm_qty,
                v_comm_oper_way,
                v_comm_strike_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.5.136.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_成交更新指令出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;
        #插入成交表

        /* if @订单方向# = 《订单方向-买入》   then */
        if v_order_dir = 1   then

            /* set @订单冻结金额# = @订单冻结金额# + @交易变动金额#; */
            set v_order_frozen_amt = v_order_frozen_amt + v_trade_occur_amt;
        else

            /* set @订单冻结金额# = 0; */
            set v_order_frozen_amt = 0;
        end if;

        /* if @订单方向# = 《订单方向-卖出》 then */
        if v_order_dir = 2 then

            /* set @订单冻结数量# = @订单冻结数量# - @成交数量#; */
            set v_order_frozen_qty = v_order_frozen_qty - v_strike_qty;
        else

            /* set @订单冻结数量# = 0; */
            set v_order_frozen_qty = 0;
        end if;

        /* 调用【原子_交易证券_公用_计算融资融券成交变动金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetFinaLoanStrikeOccurAmtAndQty(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_stock_type,
            v_order_dir,
            v_strike_qty,
            v_strike_price,
            v_strike_amt,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_all_fee,
            v_error_code,
            v_error_info,
            v_strike_occur_amt,
            v_strike_bond_accr_intrst,
            v_strike_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.136.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算融资融券成交变动金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #本次成交债券计提利息，成交债券计提利息为合计值
        #set @债券计提利息# = @成交债券计提利息# - @临时_成交债券计提利息#;

        /* 调用【原子_交易证券_报盘_新增成交】*/
        call db_tdsecu.pra_tdserp_AddStrike(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_busi_opor_no,
            v_init_date,
            v_rsp_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_id,
            v_comm_batch_no,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_id,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_strike_qty,
            v_strike_price,
            v_strike_amt,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_trade_tax,
            v_trade_cost_fee,
            v_trade_system_use_fee,
            v_stock_settle_fee,
            v_net_price_flag,
            v_intrst_days,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_impawn_ratio,
            v_strike_bond_accr_intrst,
            v_order_oper_way,
            v_exter_comm_flag,
            v_order_batch_no,
            v_external_no,
            v_combo_code,
            v_asset_acco_type,
            v_error_code,
            v_error_info,
            v_strike_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.136.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_新增成交出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @回购成交序号# = @成交序号#; */
        set v_repo_strike_id = v_strike_id;
        #更新订单表

        /* set @成交数量# = @总成交数量#; */
        set v_strike_qty = v_total_strike_qty;

        /* 调用【原子_交易证券_公用_计算订单状态】*/
        call db_tdsecu.pra_tdsepb_CaclOrderStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_qty,
            v_wtdraw_qty,
            v_strike_qty,
            v_old_order_status,
            v_error_code,
            v_error_info,
            v_order_status);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.136.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单状态出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @成交金额# = @总成交金额# ; */
        set v_strike_amt = v_total_strike_amt ;

        /* set @成交债券计提利息# = @成交债券计提利息# + @临时_成交债券计提利息#; */
        set v_strike_bond_accr_intrst = v_strike_bond_accr_intrst + v_tmp_strike_bond_accr_intrst;

        /* 调用【原子_交易证券_交易_更新成交回报订单记录】*/
        call db_tdsecu.pra_tdsetd_UpdateStrikeRspOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_id,
            v_strike_qty,
            v_strike_amt,
            v_wtdraw_qty,
            v_order_frozen_amt,
            v_order_frozen_qty,
            v_order_status,
            v_strike_bond_accr_intrst,
            v_all_fee,
            v_stamp_tax,
            v_trans_fee,
            v_brkage_fee,
            v_SEC_charges,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.136.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_更新成交回报订单记录出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #这里还需要特殊处理回购的记录

        /* 调用【原子_交易证券_账户_更新成交资金持仓】*/
        call db_tdsecu.pra_tdseac_UpdateStrikeCashPosi(
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
            v_crncy_type,
            v_exch_crncy_type,
            v_order_dir,
            v_comm_id,
            v_strike_id,
            v_exch_no,
            v_stock_code,
            v_stock_acco_no,
            v_stock_code_no,
            v_trade_code_no,
            v_target_code_no,
            v_asset_type,
            v_stock_type,
            v_strike_occur_amt,
            v_strike_occur_qty,
            v_trade_occur_amt,
            v_trade_occur_qty,
            v_impawn_ratio,
            v_repo_order_id,
            v_repo_strike_id,
            v_strike_no,
            v_strike_date,
            v_strike_time,
            v_strike_qty,
            v_strike_price,
            v_strike_amt,
            v_strike_fee,
            v_par_value,
            v_net_price_flag,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_repo_days,
            v_repo_cale_days,
            v_repo_back_date,
            v_capit_reback_days,
            v_posi_reback_days,
            v_is_record_jour,
            v_order_oper_way,
            v_cost_calc_type,
            v_exgp_cost_amt,
            v_exgp_intrst_cost_amt,
            v_exgp_curr_qty,
            v_asac_cost_amt,
            v_asac_intrst_cost_amt,
            v_asac_curr_qty,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_combo_code,
            v_combo_posi_id,
            v_order_date,
            v_target_stock_code_no,
            v_error_code,
            v_error_info,
            v_open_posi_date);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.136.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新成交资金持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @成交数量# = @总成交数量# - @临时_成交数量#; */
        set v_strike_qty = v_total_strike_qty - v_tmp_strike_qty;

        /* set @成交金额# = @总成交金额# - @临时_成交金额#; */
        set v_strike_amt = v_total_strike_amt - v_tmp_strike_amt;

    /* [事务结束] */
    COMMIT;

    #更新汇总记录

    /* [事务开始] */
    START TRANSACTION;


        /* set @成交债券计提利息# = @成交债券计提利息# - @临时_成交债券计提利息#; */
        set v_strike_bond_accr_intrst = v_strike_bond_accr_intrst - v_tmp_strike_bond_accr_intrst;

        /* 调用【原子_交易证券_交易_成交处理汇总订单】*/
        call db_tdsecu.pra_tdsetd_StrikeDealSumOrder(
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
            v_stock_code_no,
            v_stock_code,
            v_trade_code_no,
            v_target_code_no,
            v_stock_type,
            v_order_date,
            v_order_batch_no,
            v_order_dir,
            v_order_status,
            v_strike_amt,
            v_strike_qty,
            v_strike_bond_accr_intrst,
            v_order_oper_way,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.136.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_成交处理汇总订单出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    #输出的成交金额与成交数量都为本次交易前的值（不算本次发生额），用于成交回报费用差处理

    /* set @成交数量# = @临时_成交数量#; */
    set v_strike_qty = v_tmp_strike_qty;

    /* set @成交金额# = @临时_成交金额#; */
    set v_strike_amt = v_tmp_strike_amt;

    /* set @更新次数# = @更新次数# + 1; */
    set v_update_times = v_update_times + 1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_id = v_strike_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_order_date = v_order_date;
    SET p_order_batch_no = v_order_batch_no;
    SET p_report_time = v_report_time;
    SET p_comm_date = v_comm_date;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_order_oper_way = v_order_oper_way;
    SET p_target_code = v_target_code;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_order_frozen_amt = v_order_frozen_amt;
    SET p_order_frozen_qty = v_order_frozen_qty;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_order_status = v_order_status;
    SET p_update_times = v_update_times;
    SET p_strike_occur_amt = v_strike_occur_amt;
    SET p_strike_occur_qty = v_strike_occur_qty;
    SET p_trade_occur_amt = v_trade_occur_amt;
    SET p_trade_occur_qty = v_trade_occur_qty;
    SET p_open_posi_date = v_open_posi_date;
    SET p_original_order_dir = v_original_order_dir;
    SET p_detail_posi_id_str = v_detail_posi_id_str;
    SET p_stock_code_no_str = v_stock_code_no_str;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_报盘_检查撤单回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdserp_CheckCancelRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdserp_CheckCancelRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_wtdraw_qty decimal(18,2),
    IN p_rsp_status varchar(2),
    IN p_rsp_info varchar(255),
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
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_wtdraw_qty decimal(18,2);
    declare v_rsp_status varchar(2);
    declare v_rsp_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_rsp_id bigint;

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
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_rsp_status = p_rsp_status;
    SET v_rsp_info = p_rsp_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_rsp_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_报盘_检查撤单回报】*/
        call db_tdsecu.pra_tdserp_CheckCancelRsp(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pass_no,
            v_out_acco,
            v_exch_no,
            v_stock_code,
            v_report_date,
            v_report_time,
            v_report_no,
            v_wtdraw_qty,
            v_rsp_status,
            v_rsp_info,
            v_error_code,
            v_error_info,
            v_rsp_id);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.5.137.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_检查撤单回报出现错误！',v_mysql_message);
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


