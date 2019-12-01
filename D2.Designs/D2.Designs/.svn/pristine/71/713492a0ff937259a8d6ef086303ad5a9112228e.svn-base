DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_新增指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_AddCommand;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_AddCommand(
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
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_margin_ratio decimal(18,12),
    IN p_asset_type int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_comm_date int,
    IN p_comm_batch_no int,
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_dir int,
    IN p_comm_limit_price decimal(16,9),
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_qty decimal(18,2),
    IN p_comm_amt decimal(18,4),
    IN p_comm_frozen_qty decimal(18,2),
    IN p_rece_margin decimal(18,4),
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_comm_begin_date int,
    IN p_comm_end_date int,
    IN p_comm_begin_time int,
    IN p_comm_end_time int,
    IN p_comm_appr_status varchar(2),
    IN p_comm_oper_way varchar(2),
    IN p_external_no bigint,
    IN p_comb_code varchar(6),
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_id bigint,
    OUT p_comm_status varchar(2),
    OUT p_strike_status varchar(2),
    OUT p_comm_comple_flag int
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
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_margin_ratio decimal(18,12);
    declare v_asset_type int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_appr_status varchar(2);
    declare v_comm_oper_way varchar(2);
    declare v_external_no bigint;
    declare v_comb_code varchar(6);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_id bigint;
    declare v_comm_status varchar(2);
    declare v_strike_status varchar(2);
    declare v_comm_comple_flag int;
    declare v_comm_time int;
    declare v_oper_func_code varchar(16);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_appr_remark varchar(255);
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_appr_oper_no int;
    declare v_comm_appr_oper int;
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_comm_appr_qty decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_row_id bigint;

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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_margin_ratio = p_margin_ratio;
    SET v_asset_type = p_asset_type;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_comm_date = p_comm_date;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_dir = p_comm_dir;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_qty = p_comm_qty;
    SET v_comm_amt = p_comm_amt;
    SET v_comm_frozen_qty = p_comm_frozen_qty;
    SET v_rece_margin = p_rece_margin;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_comm_begin_date = p_comm_begin_date;
    SET v_comm_end_date = p_comm_end_date;
    SET v_comm_begin_time = p_comm_begin_time;
    SET v_comm_end_time = p_comm_end_time;
    SET v_comm_appr_status = p_comm_appr_status;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_external_no = p_external_no;
    SET v_comb_code = p_comb_code;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_id = 0;
    SET v_comm_status = "0";
    SET v_strike_status = "0";
    SET v_comm_comple_flag = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_remark = " ";
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_oper_no = 0;
    SET v_comm_appr_oper = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_comm_appr_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [获取机器时间][@指令时间#] */
    select date_format(curtime(),'%H%i%s') into v_comm_time;


    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* set @指令完成日期#=0; */
    set v_comm_comple_date=0;

    /* set @指令完成时间#=0; */
    set v_comm_comple_time=0;

    /* set @指令状态#=《指令状态-未执行》; */
    set v_comm_status="1";

    /* set @成交状态#=《成交状态-未成》; */
    set v_strike_status="1";

    /* set @指令审批说明#=" "; */
    set v_comm_appr_remark=" ";

    /* set @指令审批日期#=0; */
    set v_comm_appr_date=0;

    /* set @指令审批时间#=0; */
    set v_comm_appr_time=0;

    /* set @指令审批操作员序号#=0; */
    set v_comm_appr_oper_no=0;

    /* set @指令审批操作员#=0; */
    set v_comm_appr_oper=0;

    /* set @订单数量#=0; */
    set v_order_qty=0;

    /* set @指令撤销数量#=0; */
    set v_comm_cancel_qty=0;

    /* set @成交金额#=0; */
    set v_strike_amt=0;

    /* set @成交数量#=0; */
    set v_strike_qty=0;

    /* set @指令完成标志# = 《指令完成标志-未完成》; */
    set v_comm_comple_flag = 1;

    /* set @指令审批数量# = 0; */
    set v_comm_appr_qty = 0;

    /* [插入表记录][交易期货_指令_指令表][字段][字段变量][1][@初始化日期#,@指令批号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdfutu.tb_tdfuap_command(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, co_no, pd_no, 
        exch_group_no, asset_acco_no, pass_no, out_acco, 
        exch_crncy_type, exch_no, futu_acco_no, contrc_code_no, 
        contrc_code, contrc_type, asset_type, contrc_dir, 
        hedge_type, comm_date, comm_time, comm_batch_no, 
        comm_opor, comm_executor, comm_dir, comm_limit_price, 
        limit_actual_price, comm_qty, comm_amt, order_qty, 
        comm_cancel_qty, strike_amt, strike_qty, comm_frozen_qty, 
        rece_margin, capit_reback_days, posi_reback_days, strike_status, 
        comm_status, comm_begin_date, comm_end_date, comm_begin_time, 
        comm_end_time, comm_comple_date, comm_comple_time, comm_appr_date, 
        comm_appr_time, comm_appr_status, comm_appr_oper_no, comm_appr_oper, 
        comm_appr_remark, external_no, comb_code, comm_oper_way, 
        comm_comple_flag, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_exch_crncy_type, v_exch_no, v_futu_acco_no, v_contrc_code_no, 
        v_contrc_code, v_contrc_type, v_asset_type, v_contrc_dir, 
        v_hedge_type, v_comm_date, v_comm_time, v_comm_batch_no, 
        v_comm_opor, v_comm_executor, v_comm_dir, v_comm_limit_price, 
        v_limit_actual_price, v_comm_qty, v_comm_amt, v_order_qty, 
        v_comm_cancel_qty, v_strike_amt, v_strike_qty, v_comm_frozen_qty, 
        v_rece_margin, v_capit_reback_days, v_posi_reback_days, v_strike_status, 
        v_comm_status, v_comm_begin_date, v_comm_end_date, v_comm_begin_time, 
        v_comm_end_time, v_comm_comple_date, v_comm_comple_time, v_comm_appr_date, 
        v_comm_appr_time, v_comm_appr_status, v_comm_appr_oper_no, v_comm_appr_oper, 
        v_comm_appr_remark, v_external_no, v_comb_code, v_comm_oper_way, 
        v_comm_comple_flag, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.1.1";
        SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","指令批号=",v_comm_batch_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@记录序号#] */
    select LAST_INSERT_ID() into v_row_id;


    /* set @指令序号#=@记录序号#; */
    set v_comm_id=v_row_id;

    /* 调用【原子_交易期货_指令_指令更新汇总指令】*/
    call db_tdfutu.pra_tdfuap_CommUpdateSumComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_oper_func_code,
        v_init_date,
        v_comm_date,
        v_comm_time,
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
        v_contrc_dir,
        v_hedge_type,
        v_asset_type,
        v_comm_opor,
        v_comm_executor,
        v_comm_batch_no,
        v_comm_dir,
        v_comm_limit_price,
        v_limit_actual_price,
        v_comm_qty,
        v_comm_amt,
        v_order_qty,
        v_comm_cancel_qty,
        v_strike_amt,
        v_strike_qty,
        v_comm_appr_qty,
        v_comm_begin_date,
        v_comm_end_date,
        v_comm_begin_time,
        v_comm_end_time,
        v_strike_status,
        v_comm_status,
        v_comm_appr_status,
        v_comm_oper_way,
        v_rece_margin,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_指令更新汇总指令出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_id = v_comm_id;
    SET p_comm_status = v_comm_status;
    SET p_strike_status = v_strike_status;
    SET p_comm_comple_flag = v_comm_comple_flag;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_指令更新汇总指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_CommUpdateSumComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_CommUpdateSumComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_oper_func_code varchar(16),
    IN p_init_date int,
    IN p_comm_date int,
    IN p_comm_time int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_type int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_asset_type int,
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_batch_no int,
    IN p_comm_dir int,
    IN p_comm_limit_price decimal(16,9),
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_qty decimal(18,2),
    IN p_comm_amt decimal(18,4),
    IN p_order_qty decimal(18,2),
    IN p_comm_cancel_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_qty decimal(18,2),
    IN p_comm_appr_qty decimal(18,2),
    IN p_comm_begin_date int,
    IN p_comm_end_date int,
    IN p_comm_begin_time int,
    IN p_comm_end_time int,
    IN p_strike_status varchar(2),
    IN p_comm_status varchar(2),
    IN p_comm_appr_status varchar(2),
    IN p_comm_oper_way varchar(2),
    IN p_rece_margin decimal(18,4),
    IN p_remark_info varchar(255),
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
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_comm_date int;
    declare v_comm_time int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_asset_type int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_batch_no int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_comm_appr_qty decimal(18,2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_strike_status varchar(2);
    declare v_comm_status varchar(2);
    declare v_comm_appr_status varchar(2);
    declare v_comm_oper_way varchar(2);
    declare v_rece_margin decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_max_comm_comple_date int;
    declare v_max_comm_comple_time int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_sum_status varchar(2);
    declare v_comm_sum_approve_status varchar(2);
    declare v_comm_await_cancel_qty decimal(18,2);
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_tmp_comm_qty decimal(18,2);
    declare v_tmp_exch_crncy_type varchar(3);
    declare v_tmp_exch_no int;
    declare v_tmp_futu_acco_no int;
    declare v_tmp_contrc_code_no int;
    declare v_tmp_contrc_code varchar(6);
    declare v_tmp_contrc_type int;
    declare v_tmp_contrc_dir int;
    declare v_tmp_hedge_type int;
    declare v_tmp_asset_type int;
    declare v_tmp_comm_opor int;
    declare v_tmp_comm_executor int;
    declare v_tmp_comm_batch_no int;
    declare v_tmp_comm_dir int;
    declare v_tmp_comm_limit_price decimal(16,9);
    declare v_tmp_limit_actual_price decimal(16,9);
    declare v_tmp_comm_begin_date int;
    declare v_tmp_comm_end_date int;
    declare v_tmp_comm_begin_time int;
    declare v_tmp_comm_end_time int;
    declare v_tmp_pd_no int;
    declare v_tmp_exch_group_no int;
    declare v_tmp_asset_acco_no int;
    declare v_tmp_pass_no int;
    declare v_tmp_out_acco varchar(32);
    declare v_tmp_comm_oper_way varchar(2);
    declare v_tmp_comm_appr_status varchar(2);
    declare v_row_id bigint;

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
    SET v_oper_func_code = p_oper_func_code;
    SET v_init_date = p_init_date;
    SET v_comm_date = p_comm_date;
    SET v_comm_time = p_comm_time;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_asset_type = p_asset_type;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_dir = p_comm_dir;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_qty = p_comm_qty;
    SET v_comm_amt = p_comm_amt;
    SET v_order_qty = p_order_qty;
    SET v_comm_cancel_qty = p_comm_cancel_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_qty = p_strike_qty;
    SET v_comm_appr_qty = p_comm_appr_qty;
    SET v_comm_begin_date = p_comm_begin_date;
    SET v_comm_end_date = p_comm_end_date;
    SET v_comm_begin_time = p_comm_begin_time;
    SET v_comm_end_time = p_comm_end_time;
    SET v_strike_status = p_strike_status;
    SET v_comm_status = p_comm_status;
    SET v_comm_appr_status = p_comm_appr_status;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_rece_margin = p_rece_margin;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_max_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_max_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_sum_status = "0";
    SET v_comm_sum_approve_status = "0";
    SET v_comm_await_cancel_qty = 0;
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_tmp_comm_qty = 0;
    SET v_tmp_exch_crncy_type = "CNY";
    SET v_tmp_exch_no = 0;
    SET v_tmp_futu_acco_no = 0;
    SET v_tmp_contrc_code_no = 0;
    SET v_tmp_contrc_code = " ";
    SET v_tmp_contrc_type = 0;
    SET v_tmp_contrc_dir = 0;
    SET v_tmp_hedge_type = 0;
    SET v_tmp_asset_type = 0;
    SET v_tmp_comm_opor = 0;
    SET v_tmp_comm_executor = 0;
    SET v_tmp_comm_batch_no = 0;
    SET v_tmp_comm_dir = 0;
    SET v_tmp_comm_limit_price = 0;
    SET v_tmp_limit_actual_price = 0;
    SET v_tmp_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_pd_no = 0;
    SET v_tmp_exch_group_no = 0;
    SET v_tmp_asset_acco_no = 0;
    SET v_tmp_pass_no = 0;
    SET v_tmp_out_acco = " ";
    SET v_tmp_comm_oper_way = " ";
    SET v_tmp_comm_appr_status = " ";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [检查正常返回][@指令批号# = 0] */
    if v_comm_batch_no = 0 then
        leave label_pro;
    end if;


    /* set @指令完成日期# = 0; */
    set v_comm_comple_date = 0;

    /* set @指令完成时间# = 0; */
    set v_comm_comple_time = 0;

    /* set @指令最大完成日期# = 0; */
    set v_max_comm_comple_date = 0;

    /* set @指令最大完成时间# = 0; */
    set v_max_comm_comple_time = 0;

    /* set @指令审批日期# = 0; */
    set v_comm_appr_date = 0;

    /* set @指令审批时间# = 0; */
    set v_comm_appr_time = 0;

    /* set @指令汇总状态# = 《指令汇总状态-未执行》; */
    set v_comm_sum_status = "1";

    /* set @指令汇总审批状态# = 《指令汇总审批状态-未审批》; */
    set v_comm_sum_approve_status = "1";

    /* set @成交状态# = 《成交状态-未成》; */
    set v_strike_status = "1";

    /* if @指令状态# = 《指令状态-待撤销》 or @指令状态# = 《指令状态-部分撤销》 then */
    if v_comm_status = "4" or v_comm_status = "5" then

        /* set @指令待撤销数量# = @指令数量# - @指令撤销数量# - @成交数量#; */
        set v_comm_await_cancel_qty = v_comm_qty - v_comm_cancel_qty - v_strike_qty;
    end if;

    /* set @买入订单数量# = 0; */
    set v_buy_order_qty = 0;

    /* set @卖出订单数量# = 0; */
    set v_sell_order_qty = 0;

    /* set @买入指令数量# = 0; */
    set v_buy_comm_qty = 0;

    /* set @卖出指令数量# = 0; */
    set v_sell_comm_qty = 0;

    /* set @买入成交数量# = 0; */
    set v_buy_strike_qty = 0;

    /* set @卖出成交数量# = 0; */
    set v_sell_strike_qty = 0;

    /* set @买入成交金额# = 0; */
    set v_buy_strike_amt = 0;

    /* set @卖出成交金额# = 0; */
    set v_sell_strike_amt = 0;

    /* set @买入指令金额# = 0; */
    set v_buy_comm_amt = 0;

    /* set @卖出指令金额# = 0; */
    set v_sell_comm_amt = 0;

    /* if @指令方向# = 《指令方向-买入》  then */
    if v_comm_dir = 1  then

        /* set @买入订单数量# = @订单数量#; */
        set v_buy_order_qty = v_order_qty;

        /* set @买入指令数量# = @指令数量#; */
        set v_buy_comm_qty = v_comm_qty;

        /* set @买入成交数量# = @成交数量#; */
        set v_buy_strike_qty = v_strike_qty;

        /* set @买入成交金额# = @成交金额#; */
        set v_buy_strike_amt = v_strike_amt;

        /* set @买入指令金额# = @指令金额#; */
        set v_buy_comm_amt = v_comm_amt;

    /* elseif @指令方向# = 《指令方向-卖出》  then */
    elseif v_comm_dir = 2  then

        /* set @卖出订单数量# = @订单数量#; */
        set v_sell_order_qty = v_order_qty;

        /* set @卖出指令数量# = @指令数量#; */
        set v_sell_comm_qty = v_comm_qty;

        /* set @卖出成交数量# = @成交数量#; */
        set v_sell_strike_qty = v_strike_qty;

        /* set @卖出成交金额# = @成交金额#; */
        set v_sell_strike_amt = v_strike_amt;

        /* set @卖出指令金额# = @指令金额#; */
        set v_sell_comm_amt = v_comm_amt;
    end if;

    /* [插入重复更新][交易期货_指令_指令汇总表][字段][字段变量][{指令数量} = {指令数量} + @指令数量#, {指令金额} = {指令金额} + @指令金额#,{指令审批数量}={指令审批数量}+@指令审批数量#,{指令撤销数量}={指令撤销数量}+@指令撤销数量#,{订单数量}={订单数量}+@订单数量#,{成交数量}={成交数量}+@成交数量#,{成交金额}={成交金额}+@成交金额#,{买入订单数量} = {买入订单数量} + @买入订单数量#,{卖出订单数量} = {卖出订单数量} + @卖出订单数量#,{买入指令数量} = {买入指令数量} + @买入指令数量#,{卖出指令数量} = {卖出指令数量} + @卖出指令数量#,{买入成交数量} = {买入成交数量} + @买入成交数量#,{卖出成交数量} = {卖出成交数量} + @卖出成交数量#,{买入成交金额} = {买入成交金额} + @买入成交金额#,{卖出成交金额} = {卖出成交金额} + @卖出成交金额#,{买入指令金额} = {买入指令金额} + @买入指令金额#,{卖出指令金额} = {卖出指令金额} + @卖出指令金额#,{应收保证金} = {应收保证金} + @应收保证金#][1][@指令日期#, @机构编号#,@指令批号#,@指令执行人#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdfutu.tb_tdfuap_sumcommand (
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, co_no, pd_no, 
        exch_group_no, asset_acco_no, pass_no, out_acco, 
        exch_crncy_type, exch_no, futu_acco_no, contrc_code_no, 
        contrc_code, contrc_type, asset_type, contrc_dir, 
        hedge_type, comm_date, comm_time, comm_batch_no, 
        comm_opor, comm_executor, comm_dir, comm_limit_price, 
        limit_actual_price, comm_qty, comm_amt, order_qty, 
        comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
        strike_status, rece_margin, comm_sum_status, comm_begin_date, 
        comm_end_date, comm_begin_time, comm_end_time, comm_comple_date, 
        comm_comple_time, max_comm_comple_date, max_comm_comple_time, comm_appr_date, 
        comm_appr_time, comm_appr_qty, comm_sum_approve_status, buy_order_qty, 
        sell_order_qty, buy_comm_qty, sell_comm_qty, buy_strike_qty, 
        sell_strike_qty, buy_strike_amt, sell_strike_amt, buy_comm_amt, 
        sell_comm_amt, comm_oper_way) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_exch_crncy_type, v_exch_no, v_futu_acco_no, v_contrc_code_no, 
        v_contrc_code, v_contrc_type, v_asset_type, v_contrc_dir, 
        v_hedge_type, v_comm_date, v_comm_time, v_comm_batch_no, 
        v_comm_opor, v_comm_executor, v_comm_dir, v_comm_limit_price, 
        v_limit_actual_price, v_comm_qty, v_comm_amt, v_order_qty, 
        v_comm_cancel_qty, v_comm_await_cancel_qty, v_strike_amt, v_strike_qty, 
        v_strike_status, v_rece_margin, v_comm_sum_status, v_comm_begin_date, 
        v_comm_end_date, v_comm_begin_time, v_comm_end_time, v_comm_comple_date, 
        v_comm_comple_time, v_max_comm_comple_date, v_max_comm_comple_time, v_comm_appr_date, 
        v_comm_appr_time, v_comm_appr_qty, v_comm_sum_approve_status, v_buy_order_qty, 
        v_sell_order_qty, v_buy_comm_qty, v_sell_comm_qty, v_buy_strike_qty, 
        v_sell_strike_qty, v_buy_strike_amt, v_sell_strike_amt, v_buy_comm_amt, 
        v_sell_comm_amt, v_comm_oper_way) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, comm_qty = comm_qty + v_comm_qty, comm_amt = comm_amt + v_comm_amt,comm_appr_qty=comm_appr_qty+v_comm_appr_qty,comm_cancel_qty=comm_cancel_qty+v_comm_cancel_qty,order_qty=order_qty+v_order_qty,strike_qty=strike_qty+v_strike_qty,strike_amt=strike_amt+v_strike_amt,buy_order_qty = buy_order_qty + v_buy_order_qty,sell_order_qty = sell_order_qty + v_sell_order_qty,buy_comm_qty = buy_comm_qty + v_buy_comm_qty,sell_comm_qty = sell_comm_qty + v_sell_comm_qty,buy_strike_qty = buy_strike_qty + v_buy_strike_qty,sell_strike_qty = sell_strike_qty + v_sell_strike_qty,buy_strike_amt = buy_strike_amt + v_buy_strike_amt,sell_strike_amt = sell_strike_amt + v_sell_strike_amt,buy_comm_amt = buy_comm_amt + v_buy_comm_amt,sell_comm_amt = sell_comm_amt + v_sell_comm_amt,rece_margin = rece_margin + v_rece_margin;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.2.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,",","指令批号=",v_comm_batch_no,",","指令执行人=",v_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,",","指令批号=",v_comm_batch_no,",","指令执行人=",v_comm_executor);
        end if;
        leave label_pro;
    end if;


    /* set @临时_指令数量# = @指令数量#; */
    set v_tmp_comm_qty = v_comm_qty;

    /* set @临时_交易币种# = @交易币种#; */
    set v_tmp_exch_crncy_type = v_exch_crncy_type;

    /* set @临时_市场编号# = @市场编号#; */
    set v_tmp_exch_no = v_exch_no;

    /* set @临时_交易编码编号# = @交易编码编号#; */
    set v_tmp_futu_acco_no = v_futu_acco_no;

    /* set @临时_合约代码编号# = @合约代码编号#; */
    set v_tmp_contrc_code_no = v_contrc_code_no;

    /* set @临时_合约代码# = @合约代码#; */
    set v_tmp_contrc_code = v_contrc_code;

    /* set @临时_合约类型# = @合约类型#; */
    set v_tmp_contrc_type = v_contrc_type;

    /* set @临时_开平方向# = @开平方向#; */
    set v_tmp_contrc_dir = v_contrc_dir;

    /* set @临时_套保标志# = @套保标志#; */
    set v_tmp_hedge_type = v_hedge_type;

    /* set @临时_资产类型# = @资产类型#; */
    set v_tmp_asset_type = v_asset_type;

    /* set @临时_指令下达人# = @指令下达人#; */
    set v_tmp_comm_opor = v_comm_opor;

    /* set @临时_指令执行人# = @指令执行人#; */
    set v_tmp_comm_executor = v_comm_executor;

    /* set @临时_指令批号# = @指令批号#; */
    set v_tmp_comm_batch_no = v_comm_batch_no;

    /* set @临时_指令方向# = @指令方向#; */
    set v_tmp_comm_dir = v_comm_dir;

    /* set @临时_指令限价# = @指令限价#; */
    set v_tmp_comm_limit_price = v_comm_limit_price;

    /* set @临时_指令实际限价# = @指令实际限价#; */
    set v_tmp_limit_actual_price = v_limit_actual_price;

    /* set @临时_指令开始日期# = @指令开始日期#; */
    set v_tmp_comm_begin_date = v_comm_begin_date;

    /* set @临时_指令结束日期# = @指令结束日期#; */
    set v_tmp_comm_end_date = v_comm_end_date;

    /* set @临时_指令开始时间# = @指令开始时间#; */
    set v_tmp_comm_begin_time = v_comm_begin_time;

    /* set @临时_指令结束时间# = @指令结束时间#; */
    set v_tmp_comm_end_time = v_comm_end_time;

    /* set @临时_产品编号# = @产品编号#; */
    set v_tmp_pd_no = v_pd_no;

    /* set @临时_交易组编号# = @交易组编号#; */
    set v_tmp_exch_group_no = v_exch_group_no;

    /* set @临时_资产账户编号# = @资产账户编号#; */
    set v_tmp_asset_acco_no = v_asset_acco_no;

    /* set @临时_通道编号# = @通道编号#; */
    set v_tmp_pass_no = v_pass_no;

    /* set @临时_外部账号# = @外部账号#; */
    set v_tmp_out_acco = v_out_acco;

    /* set @临时_指令操作方式# = @指令操作方式#; */
    set v_tmp_comm_oper_way = v_comm_oper_way;

    /* set @临时_指令审批状态# = @指令审批状态#; */
    set v_tmp_comm_appr_status = v_comm_appr_status;

    /* [锁定获取表记录变量][交易期货_指令_指令汇总表][字段][字段变量][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号# and {指令执行人} = @指令执行人#][1][@指令日期#, @机构编号#, @指令批号#, @指令执行人#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, comm_await_cancel_qty, strike_amt, 
        strike_qty, strike_status, rece_margin, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        buy_order_qty, sell_order_qty, buy_comm_qty, sell_comm_qty, 
        buy_strike_qty, sell_strike_qty, buy_strike_amt, sell_strike_amt, 
        buy_comm_amt, sell_comm_amt, comm_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_code, v_contrc_type, v_asset_type, 
        v_contrc_dir, v_hedge_type, v_comm_date, v_comm_time, 
        v_comm_batch_no, v_comm_opor, v_comm_executor, v_comm_dir, 
        v_comm_limit_price, v_limit_actual_price, v_comm_qty, v_comm_amt, 
        v_order_qty, v_comm_cancel_qty, v_comm_await_cancel_qty, v_strike_amt, 
        v_strike_qty, v_strike_status, v_rece_margin, v_comm_sum_status, 
        v_comm_begin_date, v_comm_end_date, v_comm_begin_time, v_comm_end_time, 
        v_comm_comple_date, v_comm_comple_time, v_max_comm_comple_date, v_max_comm_comple_time, 
        v_comm_appr_date, v_comm_appr_time, v_comm_appr_qty, v_comm_sum_approve_status, 
        v_buy_order_qty, v_sell_order_qty, v_buy_comm_qty, v_sell_comm_qty, 
        v_buy_strike_qty, v_sell_strike_qty, v_buy_strike_amt, v_sell_strike_amt, 
        v_buy_comm_amt, v_sell_comm_amt, v_comm_oper_way from db_tdfutu.tb_tdfuap_sumcommand where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no and comm_executor = v_comm_executor limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.2.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 指令执行人=", v_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 指令执行人=", v_comm_executor);
        end if;
        leave label_pro;
    end if;


    /* set @交易币种# = 'CNY '; */
    set v_exch_crncy_type = 'CNY ';

    /* if @指令数量# = @临时_指令数量# then */
    if v_comm_qty = v_tmp_comm_qty then

        /* set @市场编号# = @临时_市场编号#; */
        set v_exch_no = v_tmp_exch_no;

    /* elseif @临时_市场编号# <> @市场编号# then */
    elseif v_tmp_exch_no <> v_exch_no then

        /* set @市场编号# = 0; */
        set v_exch_no = 0;
    end if;

    /* if @指令数量# = @临时_指令数量# then */
    if v_comm_qty = v_tmp_comm_qty then

        /* set @交易编码编号# = @临时_交易编码编号#; */
        set v_futu_acco_no = v_tmp_futu_acco_no;

    /* elseif @临时_交易编码编号# <> @交易编码编号# then */
    elseif v_tmp_futu_acco_no <> v_futu_acco_no then

        /* set @交易编码编号# = 0; */
        set v_futu_acco_no = 0;
    end if;

    /* if @指令数量# = @临时_指令数量# then */
    if v_comm_qty = v_tmp_comm_qty then

        /* set @合约代码编号# = @临时_合约代码编号#; */
        set v_contrc_code_no = v_tmp_contrc_code_no;

    /* elseif @临时_合约代码编号# <> @合约代码编号# then */
    elseif v_tmp_contrc_code_no <> v_contrc_code_no then

        /* set @合约代码编号# = ' '; */
        set v_contrc_code_no = ' ';
    end if;

    /* if @指令数量# = @临时_指令数量# then */
    if v_comm_qty = v_tmp_comm_qty then

        /* set @合约代码# = @临时_合约代码#; */
        set v_contrc_code = v_tmp_contrc_code;

    /* elseif @临时_合约代码# <> @合约代码# then */
    elseif v_tmp_contrc_code <> v_contrc_code then

        /* set @合约代码# = 0; */
        set v_contrc_code = 0;
    end if;

    /* if @指令数量# = @临时_指令数量# then */
    if v_comm_qty = v_tmp_comm_qty then

        /* set @合约类型# = @临时_合约类型#; */
        set v_contrc_type = v_tmp_contrc_type;

    /* elseif @临时_合约类型# <> @合约类型# then */
    elseif v_tmp_contrc_type <> v_contrc_type then

        /* set @合约类型# = 0; */
        set v_contrc_type = 0;
    end if;

    /* if @指令数量# = @临时_指令数量# then */
    if v_comm_qty = v_tmp_comm_qty then

        /* set @开平方向# = @临时_开平方向#; */
        set v_contrc_dir = v_tmp_contrc_dir;

    /* elseif @临时_开平方向# <> @开平方向# then */
    elseif v_tmp_contrc_dir <> v_contrc_dir then

        /* set @开平方向# = 0; */
        set v_contrc_dir = 0;
    end if;

    /* if @指令数量# = @临时_指令数量# then */
    if v_comm_qty = v_tmp_comm_qty then

        /* set @套保标志# = @临时_套保标志#; */
        set v_hedge_type = v_tmp_hedge_type;

    /* elseif @临时_套保标志# <> @套保标志# then */
    elseif v_tmp_hedge_type <> v_hedge_type then

        /* set @套保标志# = 0; */
        set v_hedge_type = 0;
    end if;

    /* if @指令数量# = @临时_指令数量# then */
    if v_comm_qty = v_tmp_comm_qty then

        /* set @资产类型# = @临时_资产类型#; */
        set v_asset_type = v_tmp_asset_type;

    /* elseif @临时_资产类型# <> @资产类型# then */
    elseif v_tmp_asset_type <> v_asset_type then

        /* set @资产类型# = 0; */
        set v_asset_type = 0;
    end if;

    /* if @指令数量# = @临时_指令数量# then */
    if v_comm_qty = v_tmp_comm_qty then

        /* set @指令下达人# = @临时_指令下达人#; */
        set v_comm_opor = v_tmp_comm_opor;

    /* elseif @临时_指令下达人# <> @指令下达人# then */
    elseif v_tmp_comm_opor <> v_comm_opor then

        /* set @指令下达人# = 0; */
        set v_comm_opor = 0;
    end if;

    /* if @指令数量# = @临时_指令数量# then */
    if v_comm_qty = v_tmp_comm_qty then

        /* set @指令方向# = @临时_指令方向#; */
        set v_comm_dir = v_tmp_comm_dir;

    /* elseif @临时_指令方向# <> @指令方向# then */
    elseif v_tmp_comm_dir <> v_comm_dir then

        /* set @指令方向# = 0; */
        set v_comm_dir = 0;
    end if;

    /* if @指令数量# = @临时_指令数量# then */
    if v_comm_qty = v_tmp_comm_qty then

        /* set @指令限价# = @临时_指令限价#; */
        set v_comm_limit_price = v_tmp_comm_limit_price;

    /* elseif @临时_指令限价# <> @指令限价# then */
    elseif v_tmp_comm_limit_price <> v_comm_limit_price then

        /* set @指令限价# = 0; */
        set v_comm_limit_price = 0;
    end if;

    /* if @指令数量# = @临时_指令数量# then */
    if v_comm_qty = v_tmp_comm_qty then

        /* set @指令实际限价# = @临时_指令实际限价#; */
        set v_limit_actual_price = v_tmp_limit_actual_price;

    /* elseif @临时_指令实际限价# <> @指令实际限价# then */
    elseif v_tmp_limit_actual_price <> v_limit_actual_price then

        /* set @指令实际限价# = 0; */
        set v_limit_actual_price = 0;
    end if;

    /* if @临时_指令开始日期# < @指令开始日期# or @指令数量# = @临时_指令数量# then */
    if v_tmp_comm_begin_date < v_comm_begin_date or v_comm_qty = v_tmp_comm_qty then

        /* set @指令开始日期# = @临时_指令开始日期#; */
        set v_comm_begin_date = v_tmp_comm_begin_date;
    end if;

    /* if @临时_指令结束日期# > @指令结束日期# or @指令数量# = @临时_指令数量# then */
    if v_tmp_comm_end_date > v_comm_end_date or v_comm_qty = v_tmp_comm_qty then

        /* set @指令结束日期# = @临时_指令结束日期#; */
        set v_comm_end_date = v_tmp_comm_end_date;
    end if;

    /* if @临时_指令开始时间# < @指令开始时间# or @指令数量# = @临时_指令数量# then */
    if v_tmp_comm_begin_time < v_comm_begin_time or v_comm_qty = v_tmp_comm_qty then

        /* set @指令开始时间# = @临时_指令开始时间#; */
        set v_comm_begin_time = v_tmp_comm_begin_time;
    end if;

    /* if @临时_指令结束时间# > @指令结束时间# or @指令数量# = @临时_指令数量# then */
    if v_tmp_comm_end_time > v_comm_end_time or v_comm_qty = v_tmp_comm_qty then

        /* set @指令结束时间# = @临时_指令结束时间#; */
        set v_comm_end_time = v_tmp_comm_end_time;
    end if;

    /* if @指令数量# = @临时_指令数量# then */
    if v_comm_qty = v_tmp_comm_qty then

      /* set @产品编号# = @临时_产品编号#; */
      set v_pd_no = v_tmp_pd_no;

    /* elseif @临时_产品编号# <> @产品编号# then */
    elseif v_tmp_pd_no <> v_pd_no then

      /* set @产品编号# = 0; */
      set v_pd_no = 0;
    end if;

    /* if @指令数量# = @临时_指令数量# then */
    if v_comm_qty = v_tmp_comm_qty then

        /* set @交易组编号# = @临时_交易组编号#; */
        set v_exch_group_no = v_tmp_exch_group_no;

    /* elseif @临时_交易组编号# <> @交易组编号# then */
    elseif v_tmp_exch_group_no <> v_exch_group_no then

        /* set @交易组编号# = 0; */
        set v_exch_group_no = 0;
    end if;

    /* if @指令数量# = @临时_指令数量# then */
    if v_comm_qty = v_tmp_comm_qty then

        /* set @资产账户编号# = @临时_资产账户编号#; */
        set v_asset_acco_no = v_tmp_asset_acco_no;

    /* elseif @临时_资产账户编号# <> @资产账户编号# then */
    elseif v_tmp_asset_acco_no <> v_asset_acco_no then

        /* set @资产账户编号# = 0; */
        set v_asset_acco_no = 0;
    end if;

    /* if @指令数量# = @临时_指令数量# then */
    if v_comm_qty = v_tmp_comm_qty then

        /* set @通道编号# = @临时_通道编号#; */
        set v_pass_no = v_tmp_pass_no;

    /* elseif @临时_通道编号# <> @通道编号# then */
    elseif v_tmp_pass_no <> v_pass_no then

        /* set @通道编号# = 0; */
        set v_pass_no = 0;
    end if;

    /* if @指令数量# = @临时_指令数量# then */
    if v_comm_qty = v_tmp_comm_qty then

        /* set @外部账号# = @临时_外部账号#; */
        set v_out_acco = v_tmp_out_acco;

    /* elseif @临时_外部账号# <> @外部账号# then */
    elseif v_tmp_out_acco <> v_out_acco then

        /* set @外部账号# = 0; */
        set v_out_acco = 0;
    end if;

    /* if @指令数量# = @临时_指令数量# then */
    if v_comm_qty = v_tmp_comm_qty then

        /* set @指令操作方式# = @临时_指令操作方式#; */
        set v_comm_oper_way = v_tmp_comm_oper_way;

    /* elseif @临时_指令操作方式# <> @指令操作方式# then */
    elseif v_tmp_comm_oper_way <> v_comm_oper_way then

        /* set @指令操作方式# = ' '; */
        set v_comm_oper_way = ' ';
    end if;

    /* 调用【原子_交易期货_指令_计算指令汇总状态】*/
    call db_tdfutu.pra_tdfuap_CaclCommSumStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_qty,
        v_order_qty,
        v_comm_cancel_qty,
        v_comm_await_cancel_qty,
        v_strike_qty,
        v_error_code,
        v_error_info,
        v_comm_sum_status);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令汇总状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_交易期货_指令_计算指令成交状态】*/
    call db_tdfutu.pra_tdfuap_CaclCommStrikeStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_qty,
        v_strike_qty,
        v_comm_cancel_qty,
        v_error_code,
        v_error_info,
        v_strike_status,
        v_comm_comple_date,
        v_comm_comple_time);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令成交状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_交易期货_指令_计算指令汇总审批状态】*/
    call db_tdfutu.pra_tdfuap_CaclCommSumApprStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_qty,
        v_comm_appr_qty,
        v_error_code,
        v_error_info,
        v_comm_sum_approve_status);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令汇总审批状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @指令完成日期# > @指令最大完成日期# then */
    if v_comm_comple_date > v_max_comm_comple_date then

        /* set @指令最大完成日期#  = @指令完成日期#; */
        set v_max_comm_comple_date  = v_comm_comple_date;
    end if;

    /* if @指令完成时间# > @指令最大完成时间# then */
    if v_comm_comple_time > v_max_comm_comple_time then

        /* set @指令最大完成时间# = @指令完成时间#; */
        set v_max_comm_comple_time = v_comm_comple_time;
    end if;

    /* [更新表记录][交易期货_指令_指令汇总表][{指令汇总状态}=@指令汇总状态#, {成交状态}=@成交状态#,{指令完成日期}=@指令完成日期#,{指令完成时间}=@指令完成时间#,{指令最大完成日期}=@指令最大完成日期#,{指令最大完成时间}=@指令最大完成时间#,{交易币种} = @交易币种#,{市场编号} = @市场编号#,{交易编码编号} = @交易编码编号#,{合约代码编号} = @合约代码编号#,{合约代码} = @合约代码#,{合约类型} = @合约类型#,{开平方向} = @开平方向#,{套保标志} = @套保标志#,{资产类型} = @资产类型#,{指令下达人} = @指令下达人#,{指令执行人} = @指令执行人#,{指令批号} = @指令批号#,{指令方向} = @指令方向#,{指令限价} = @指令限价#,{指令实际限价} = @指令实际限价#,{指令开始日期} = @指令开始日期#,{指令结束日期} = @指令结束日期#,{指令开始时间} = @指令开始时间#,{指令结束时间} = @指令结束时间#,{产品编号} = @产品编号#,{交易组编号} = @交易组编号#, {资产账户编号}=@资产账户编号#,{通道编号}=@通道编号#,{外部账号}=@外部账号#,{指令操作方式}=@指令操作方式#,{指令汇总审批状态}=@指令汇总审批状态#][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号# and {指令执行人} = @指令执行人#][2][@指令日期#, @机构编号#, @指令批号#,@指令执行人#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfuap_sumcommand set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, comm_sum_status=v_comm_sum_status, strike_status=v_strike_status,comm_comple_date=v_comm_comple_date,comm_comple_time=v_comm_comple_time,max_comm_comple_date=v_max_comm_comple_date,max_comm_comple_time=v_max_comm_comple_time,exch_crncy_type = v_exch_crncy_type,exch_no = v_exch_no,futu_acco_no = v_futu_acco_no,contrc_code_no = v_contrc_code_no,contrc_code = v_contrc_code,contrc_type = v_contrc_type,contrc_dir = v_contrc_dir,hedge_type = v_hedge_type,asset_type = v_asset_type,comm_opor = v_comm_opor,comm_executor = v_comm_executor,comm_batch_no = v_comm_batch_no,comm_dir = v_comm_dir,comm_limit_price = v_comm_limit_price,limit_actual_price = v_limit_actual_price,comm_begin_date = v_comm_begin_date,comm_end_date = v_comm_end_date,comm_begin_time = v_comm_begin_time,comm_end_time = v_comm_end_time,pd_no = v_pd_no,exch_group_no = v_exch_group_no, asset_acco_no=v_asset_acco_no,pass_no=v_pass_no,out_acco=v_out_acco,comm_oper_way=v_comm_oper_way,comm_sum_approve_status=v_comm_sum_approve_status where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no and comm_executor = v_comm_executor;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.2.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,",","指令执行人=",v_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,",","指令执行人=",v_comm_executor);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_计算指令汇总状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_CaclCommSumStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_CaclCommSumStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_qty decimal(18,2),
    IN p_order_qty decimal(18,2),
    IN p_comm_cancel_qty decimal(18,2),
    IN p_comm_await_cancel_qty decimal(18,2),
    IN p_strike_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_sum_status varchar(2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_comm_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_await_cancel_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_sum_status varchar(2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;

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
    SET v_comm_qty = p_comm_qty;
    SET v_order_qty = p_order_qty;
    SET v_comm_cancel_qty = p_comm_cancel_qty;
    SET v_comm_await_cancel_qty = p_comm_await_cancel_qty;
    SET v_strike_qty = p_strike_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_sum_status = "0";
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器日期][@指令完成日期#] */
    select date_format(curdate(),'%Y%m%d') into v_comm_comple_date;


    /* [获取机器时间][@指令完成时间#] */
    select date_format(curtime(),'%H%i%s') into v_comm_comple_time;

    #判断指令完成日期和指令完成时间

    /* if @指令数量# - @指令撤销数量# - @成交数量# <> 0 then */
    if v_comm_qty - v_comm_cancel_qty - v_strike_qty <> 0 then

        /* set @指令完成日期#=0; */
        set v_comm_comple_date=0;

        /* set @指令完成时间#=0; */
        set v_comm_comple_time=0;
    end if;
    #订单状态与指令状态都遵守固定的规律，中途有任何跳跃时均以后者为准
    #指令状态顺序：未执行-部分执行-全部执行-待撤销-部分撤销-全部撤销
    #以下判断顺序中，按顺序判断状态

    /* set @指令汇总状态#=《指令汇总状态-未执行》; */
    set v_comm_sum_status="1";

    /* if @订单数量#=0 and @指令撤销数量# = 0 and @指令待撤销数量# = 0 then */
    if v_order_qty=0 and v_comm_cancel_qty = 0 and v_comm_await_cancel_qty = 0 then

        /* set @指令汇总状态#=《指令状态-未执行》; */
        set v_comm_sum_status="1";

    /* elseif @订单数量# > 0 and @指令数量# > @订单数量# and @指令撤销数量# = 0 and @指令待撤销数量# = 0  then */
    elseif v_order_qty > 0 and v_comm_qty > v_order_qty and v_comm_cancel_qty = 0 and v_comm_await_cancel_qty = 0  then

        /* set @指令汇总状态#=《指令汇总状态-部分执行》; */
        set v_comm_sum_status="2";

    /* elseif @指令数量#=@订单数量# and @指令撤销数量# = 0 and @指令待撤销数量# = 0 then */
    elseif v_comm_qty=v_order_qty and v_comm_cancel_qty = 0 and v_comm_await_cancel_qty = 0 then

        /* set @指令汇总状态#=《指令汇总状态-全部执行》; */
        set v_comm_sum_status="3";

    /* elseif @指令撤销数量# = 0 and @指令待撤销数量# > 0 then */
    elseif v_comm_cancel_qty = 0 and v_comm_await_cancel_qty > 0 then

        /* set @指令汇总状态#=《指令汇总状态-待撤销》; */
        set v_comm_sum_status="4";

    /* elseif @指令撤销数量# > 0 and @指令数量# > @指令撤销数量# then */
    elseif v_comm_cancel_qty > 0 and v_comm_qty > v_comm_cancel_qty then

        /* set @指令汇总状态#=《指令汇总状态-部分撤销》; */
        set v_comm_sum_status="5";

    /* elseif @指令数量# = @指令撤销数量# then */
    elseif v_comm_qty = v_comm_cancel_qty then

        /* set @指令汇总状态#=《指令汇总状态-全部撤销》; */
        set v_comm_sum_status="6";
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_sum_status = v_comm_sum_status;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_计算指令成交状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_CaclCommStrikeStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_CaclCommStrikeStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_qty decimal(18,2),
    IN p_strike_qty decimal(18,2),
    IN p_comm_cancel_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_status varchar(2),
    OUT p_comm_comple_date int,
    OUT p_comm_comple_time int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_comm_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_status varchar(2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;

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
    SET v_comm_qty = p_comm_qty;
    SET v_strike_qty = p_strike_qty;
    SET v_comm_cancel_qty = p_comm_cancel_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_status = "0";
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器日期][@指令完成日期#] */
    select date_format(curdate(),'%Y%m%d') into v_comm_comple_date;


    /* [获取机器时间][@指令完成时间#] */
    select date_format(curtime(),'%H%i%s') into v_comm_comple_time;

    #判断指令完成日期和指令完成时间

    /* if @指令数量# - @指令撤销数量# - @成交数量# <> 0 then */
    if v_comm_qty - v_comm_cancel_qty - v_strike_qty <> 0 then

        /* set @指令完成日期#=0; */
        set v_comm_comple_date=0;

        /* set @指令完成时间#=0; */
        set v_comm_comple_time=0;
    end if;
    #成交状态处理

    /* set @成交状态#=《成交状态-未成》; */
    set v_strike_status="1";

    /* if @指令数量#>@成交数量# and @成交数量# > 0 then */
    if v_comm_qty>v_strike_qty and v_strike_qty > 0 then

        /* set @成交状态#=《成交状态-部成》; */
        set v_strike_status="2";

    /* elseif @指令数量#=@成交数量#  and @成交数量# > 0 then */
    elseif v_comm_qty=v_strike_qty  and v_strike_qty > 0 then

        /* set @成交状态#=《成交状态-已成》; */
        set v_strike_status="3";
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_status = v_strike_status;
    SET p_comm_comple_date = v_comm_comple_date;
    SET p_comm_comple_time = v_comm_comple_time;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_计算指令汇总审批状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_CaclCommSumApprStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_CaclCommSumApprStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_qty decimal(18,2),
    IN p_comm_appr_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_sum_approve_status varchar(2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_comm_qty decimal(18,2);
    declare v_comm_appr_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_sum_approve_status varchar(2);

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
    SET v_comm_qty = p_comm_qty;
    SET v_comm_appr_qty = p_comm_appr_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_sum_approve_status = "0";

    
    label_pro:BEGIN
    

    /* set @指令汇总审批状态# = 《指令汇总审批状态-未审批》; */
    set v_comm_sum_approve_status = "1";

    /* if  @指令审批数量# > 0 and @指令数量# > @指令审批数量# then */
    if  v_comm_appr_qty > 0 and v_comm_qty > v_comm_appr_qty then

        /* set @指令汇总审批状态# = 《指令汇总审批状态-部分审批》; */
        set v_comm_sum_approve_status = "2";

    /* elseif  @指令审批数量# > 0 and @指令数量# = @指令审批数量# then */
    elseif  v_comm_appr_qty > 0 and v_comm_qty = v_comm_appr_qty then

        /* set @指令汇总审批状态# = 《指令汇总审批状态-全部审批》; */
        set v_comm_sum_approve_status = "3";
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_sum_approve_status = v_comm_sum_approve_status;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_计算指令金额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_GetCommAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_GetCommAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_dir int,
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_amt decimal(18,4)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_comm_dir int;
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_amt decimal(18,4);

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
    SET v_comm_dir = p_comm_dir;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_qty = p_comm_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_amt = 0;

    
    label_pro:BEGIN
    
    #指令冻结金额获取

    /* set @指令金额#=0; */
    set v_comm_amt=0;

    /* if @指令方向#=《指令方向-买入》 or @指令方向#=《指令方向-卖出》  then */
    if v_comm_dir=1 or v_comm_dir=2  then

        /* set @指令金额#=@指令实际限价# * @指令数量#; */
        set v_comm_amt=v_limit_actual_price * v_comm_qty;
    end if;

    /* set @指令金额#=Round(@指令金额#,2); */
    set v_comm_amt=Round(v_comm_amt,2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_amt = v_comm_amt;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_校验新增指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_CheckAddComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_CheckAddComm(
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
    IN p_contrc_code_no int,
    IN p_futu_acco_no int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_lngsht_type int,
    IN p_comm_occur_amt decimal(18,4),
    IN p_exgp_avail_amt decimal(18,4),
    IN p_asac_avail_amt decimal(18,4),
    IN p_comm_qty decimal(18,2),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    IN p_limit_actual_price decimal(16,9),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_asac_busi_config_str varchar(64),
    IN p_exgp_busi_config_str varchar(64),
    IN p_trade_fee decimal(18,4),
    IN p_exch_crncy_type varchar(3),
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
    declare v_contrc_code_no int;
    declare v_futu_acco_no int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_lngsht_type int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);
    declare v_comm_qty decimal(18,2);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_limit_actual_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_asac_busi_config_str varchar(64);
    declare v_exgp_busi_config_str varchar(64);
    declare v_trade_fee decimal(18,4);
    declare v_exch_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_avail_amt decimal(18,4);
    declare v_trade_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);
    declare v_avail_amt decimal(18,4);
    declare v_comm_avail_qty decimal(18,2);
    declare v_trade_avail_qty decimal(18,2);
    declare v_static_avail_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);

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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_comm_occur_amt = p_comm_occur_amt;
    SET v_exgp_avail_amt = p_exgp_avail_amt;
    SET v_asac_avail_amt = p_asac_avail_amt;
    SET v_comm_qty = p_comm_qty;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_exgp_busi_config_str = p_exgp_busi_config_str;
    SET v_trade_fee = p_trade_fee;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_avail_amt = 0;
    SET v_trade_avail_amt = 0;
    SET v_static_avail_amt = 0;
    SET v_avail_amt = 0;
    SET v_comm_avail_qty = 0;
    SET v_trade_avail_qty = 0;
    SET v_static_avail_qty = 0;
    SET v_avail_qty = 0;

    
    label_pro:BEGIN
    

    /* [检查报错返回][@指令实际限价# > @涨停价#][17][@涨停价#] */
    if v_limit_actual_price > v_up_limit_price then
        
        SET v_error_code = "tdfutuA.3.7.17";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("涨停价=",v_up_limit_price),"#",v_mysql_message);
        else
            SET v_error_info = concat("涨停价=",v_up_limit_price);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@指令实际限价# < @跌停价#][18][@跌停价#] */
    if v_limit_actual_price < v_down_limit_price then
        
        SET v_error_code = "tdfutuA.3.7.18";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("跌停价=",v_down_limit_price),"#",v_mysql_message);
        else
            SET v_error_info = concat("跌停价=",v_down_limit_price);
        end if;
        leave label_pro;
    end if;


    /* if @开平方向# = 《开平方向-开仓》 then */
    if v_contrc_dir = 1 then
        #交易组可用判断

        /* 调用【原子_交易期货_账户_计算交易组资金可用】*/
        call db_tdfutu.pra_tdfuac_CalcExgpCashAvail(
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
            v_error_code,
            v_error_info,
            v_comm_avail_amt,
            v_trade_avail_amt,
            v_static_avail_amt);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuA.3.7.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_计算交易组资金可用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* if substring(@交易组业务控制配置串#,1,1) <> 《指令资金校验-否》 then */
        if substring(v_exgp_busi_config_str,1,1) <> 2 then

            /* set @可用金额#=@交易组可用金额#+@指令端可用金额#; */
            set v_avail_amt=v_exgp_avail_amt+v_comm_avail_amt;

            /* [检查报错返回][@指令变动金额# + @交易费用# > @可用金额#][609][@指令变动金额#,@交易费用#,@可用金额#] */
            if v_comm_occur_amt + v_trade_fee > v_avail_amt then
                
                SET v_error_code = "tdfutuA.3.7.609";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("指令变动金额=",v_comm_occur_amt,",","交易费用=",v_trade_fee,",","可用金额=",v_avail_amt),"#",v_mysql_message);
                else
                    SET v_error_info = concat("指令变动金额=",v_comm_occur_amt,",","交易费用=",v_trade_fee,",","可用金额=",v_avail_amt);
                end if;
                leave label_pro;
            end if;

        end if;
        #如果设置了自动审批，并且需要交易资金校验，则需要一并检查交易相关数据

        /* if substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-自动审批》 and substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》=《指令审批设置-自动审批》 and substring(@交易组业务控制配置串#,3,1) <> 《交易资金校验-否》 then */
        if substring(v_asac_busi_config_str,5,1)=1 and substring(v_asac_busi_config_str,6,1)=1=1 and substring(v_exgp_busi_config_str,3,1) <> 2 then

            /* set @可用金额# = @交易组可用金额# + @交易端可用金额#; */
            set v_avail_amt = v_exgp_avail_amt + v_trade_avail_amt;

            /* [检查报错返回][@指令变动金额# + @交易费用# > @可用金额#][609][@指令变动金额#,@交易费用#,@可用金额#] */
            if v_comm_occur_amt + v_trade_fee > v_avail_amt then
                
                SET v_error_code = "tdfutuA.3.7.609";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("指令变动金额=",v_comm_occur_amt,",","交易费用=",v_trade_fee,",","可用金额=",v_avail_amt),"#",v_mysql_message);
                else
                    SET v_error_info = concat("指令变动金额=",v_comm_occur_amt,",","交易费用=",v_trade_fee,",","可用金额=",v_avail_amt);
                end if;
                leave label_pro;
            end if;

        end if;
        #资产账户可用判断

        /* 调用【原子_交易期货_账户_计算资产账户资金可用】*/
        call db_tdfutu.pra_tdfuac_CalcAsacCashAvail(
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
            v_exch_crncy_type,
            v_error_code,
            v_error_info,
            v_comm_avail_amt,
            v_trade_avail_amt,
            v_static_avail_amt);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuA.3.7.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_计算资产账户资金可用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* if substring(@资产账户业务控制配置串#,1,1) <> 《指令资金校验-否》 then */
        if substring(v_asac_busi_config_str,1,1) <> 2 then

            /* set @可用金额#=@资产账户可用金额#+@指令端可用金额#; */
            set v_avail_amt=v_asac_avail_amt+v_comm_avail_amt;

            /* [检查报错返回][@指令变动金额# + @交易费用# > @可用金额#][610][@指令变动金额#,@交易费用#,@可用金额#] */
            if v_comm_occur_amt + v_trade_fee > v_avail_amt then
                
                SET v_error_code = "tdfutuA.3.7.610";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("指令变动金额=",v_comm_occur_amt,",","交易费用=",v_trade_fee,",","可用金额=",v_avail_amt),"#",v_mysql_message);
                else
                    SET v_error_info = concat("指令变动金额=",v_comm_occur_amt,",","交易费用=",v_trade_fee,",","可用金额=",v_avail_amt);
                end if;
                leave label_pro;
            end if;

        end if;
        #如果设置了自动审批，并且需要交易资金校验，则需要一并检查交易相关数据

        /* if substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-自动审批》 and substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》=《指令审批设置-自动审批》 and substring(@资产账户业务控制配置串#,1,1) <> 《交易资金校验-否》 then */
        if substring(v_asac_busi_config_str,5,1)=1 and substring(v_asac_busi_config_str,6,1)=1=1 and substring(v_asac_busi_config_str,1,1) <> 2 then

            /* set @可用金额#=@资产账户可用金额#+@交易端可用金额#; */
            set v_avail_amt=v_asac_avail_amt+v_trade_avail_amt;

            /* [检查报错返回][@指令变动金额# + @交易费用# > @可用金额#][610][@指令变动金额#,@交易费用#,@可用金额#] */
            if v_comm_occur_amt + v_trade_fee > v_avail_amt then
                
                SET v_error_code = "tdfutuA.3.7.610";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("指令变动金额=",v_comm_occur_amt,",","交易费用=",v_trade_fee,",","可用金额=",v_avail_amt),"#",v_mysql_message);
                else
                    SET v_error_info = concat("指令变动金额=",v_comm_occur_amt,",","交易费用=",v_trade_fee,",","可用金额=",v_avail_amt);
                end if;
                leave label_pro;
            end if;

        end if;
    else
        #交易组可用判断

        /* 调用【原子_交易期货_账户_计算交易组持仓可用】*/
        call db_tdfutu.pra_tdfuac_CalcExgpPosiAvail(
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
            v_lngsht_type,
            v_contrc_dir,
            v_hedge_type,
            v_futu_acco_no,
            v_contrc_code_no,
            v_exgp_avail_qty,
            v_error_code,
            v_error_info,
            v_comm_avail_qty,
            v_trade_avail_qty,
            v_static_avail_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuA.3.7.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_计算交易组持仓可用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* if substring(@交易组业务控制配置串#,2,1) <> 《指令持仓校验-否》 then */
        if substring(v_exgp_busi_config_str,2,1) <> 2 then

            /* set @可用数量#=@交易组可用数量# +@指令端可用数量#; */
            set v_avail_qty=v_exgp_avail_qty +v_comm_avail_qty;

            /* [检查报错返回][@指令数量#>@可用数量#][611][@可用数量#,@指令数量#] */
            if v_comm_qty>v_avail_qty then
                
                SET v_error_code = "tdfutuA.3.7.611";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","指令数量=",v_comm_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用数量=",v_avail_qty,",","指令数量=",v_comm_qty);
                end if;
                leave label_pro;
            end if;

        end if;
        #如果设置了自动审批，并且需要交易持仓校验，则需要一并检查交易相关数据

        /* if substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-自动审批》 and substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》=《指令审批设置-自动审批》 and substring(@交易组业务控制配置串#,4,1) <> 《交易持仓校验-否》 then */
        if substring(v_asac_busi_config_str,5,1)=1 and substring(v_asac_busi_config_str,6,1)=1=1 and substring(v_exgp_busi_config_str,4,1) <> 2 then

            /* set @可用数量#=@交易组可用数量# + @交易端可用数量#; */
            set v_avail_qty=v_exgp_avail_qty + v_trade_avail_qty;

            /* [检查报错返回][@指令数量#>@可用数量#][611][@可用数量#,@指令数量#] */
            if v_comm_qty>v_avail_qty then
                
                SET v_error_code = "tdfutuA.3.7.611";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","指令数量=",v_comm_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用数量=",v_avail_qty,",","指令数量=",v_comm_qty);
                end if;
                leave label_pro;
            end if;

        end if;
        #资产账户可用判断

        /* 调用【原子_交易期货_账户_计算资产账户持仓可用】*/
        call db_tdfutu.pra_tdfuac_CalcAsacPosiAvail(
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
            v_exch_no,
            v_lngsht_type,
            v_contrc_dir,
            v_hedge_type,
            v_futu_acco_no,
            v_contrc_code_no,
            v_asac_avail_qty,
            v_error_code,
            v_error_info,
            v_comm_avail_qty,
            v_trade_avail_qty,
            v_static_avail_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuA.3.7.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_计算资产账户持仓可用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* if substring(@资产账户业务控制配置串#,2,1) <> 《指令持仓校验-否》 then */
        if substring(v_asac_busi_config_str,2,1) <> 2 then

            /* set @可用数量#=@资产账户可用数量#+@指令端可用数量#; */
            set v_avail_qty=v_asac_avail_qty+v_comm_avail_qty;

            /* [检查报错返回][@指令数量# > @可用数量#][612][@可用数量#,@指令数量#] */
            if v_comm_qty > v_avail_qty then
                
                SET v_error_code = "tdfutuA.3.7.612";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","指令数量=",v_comm_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用数量=",v_avail_qty,",","指令数量=",v_comm_qty);
                end if;
                leave label_pro;
            end if;

        end if;
        #如果设置了自动审批，并且需要交易持仓校验，则需要一并检查交易相关数据

        /* if substring(@资产账户业务控制配置串#,5,1)=《指令审批设置-自动审批》 and substring(@资产账户业务控制配置串#,6,1)=《审批通过自动下单-是》=《指令审批设置-自动审批》 and substring(@资产账户业务控制配置串#,4,1) <> 《交易持仓校验-否》 then */
        if substring(v_asac_busi_config_str,5,1)=1 and substring(v_asac_busi_config_str,6,1)=1=1 and substring(v_asac_busi_config_str,4,1) <> 2 then

            /* set @可用数量#=@资产账户可用数量# + @交易端可用数量#; */
            set v_avail_qty=v_asac_avail_qty + v_trade_avail_qty;

            /* [检查报错返回][@指令数量#>@可用数量#][612][@可用数量#,@指令数量#] */
            if v_comm_qty>v_avail_qty then
                
                SET v_error_code = "tdfutuA.3.7.612";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","指令数量=",v_comm_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用数量=",v_avail_qty,",","指令数量=",v_comm_qty);
                end if;
                leave label_pro;
            end if;

        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_计算指令变动金额和数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_GetCommOccurAmtAndQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_GetCommOccurAmtAndQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_contrc_dir int,
    IN p_comm_qty decimal(18,2),
    IN p_comm_order_qty decimal(18,2),
    IN p_calc_dir int,
    IN p_comm_margin decimal(18,4),
    IN p_comm_cancel_qty decimal(18,2),
    IN p_comm_change_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_occur_amt decimal(18,4),
    OUT p_comm_occur_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_contrc_dir int;
    declare v_comm_qty decimal(18,2);
    declare v_comm_order_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_comm_margin decimal(18,4);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_change_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);

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
    SET v_contrc_dir = p_contrc_dir;
    SET v_comm_qty = p_comm_qty;
    SET v_comm_order_qty = p_comm_order_qty;
    SET v_calc_dir = p_calc_dir;
    SET v_comm_margin = p_comm_margin;
    SET v_comm_cancel_qty = p_comm_cancel_qty;
    SET v_comm_change_qty = p_comm_change_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;

    
    label_pro:BEGIN
    

    /* set @指令变动金额#=0; */
    set v_comm_occur_amt=0;

    /* set @指令变动数量#=0; */
    set v_comm_occur_qty=0;

    /* set @指令变动金额#=@指令保证金#*@指令变化数量#/@指令数量#; */
    set v_comm_occur_amt=v_comm_margin*v_comm_change_qty/v_comm_qty;

    /* set @指令变动金额#=Round(@计算方向# * @指令变动金额#,2); */
    set v_comm_occur_amt=Round(v_calc_dir * v_comm_occur_amt,2);

    /* set @指令变动数量#=@计算方向# * @指令变化数量#; */
    set v_comm_occur_qty=v_calc_dir * v_comm_change_qty;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_occur_amt = v_comm_occur_amt;
    SET p_comm_occur_qty = v_comm_occur_qty;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_审批指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_ApprComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_ApprComm(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_asset_type int,
    IN p_contrc_dir int,
    IN p_comm_date int,
    IN p_comm_id bigint,
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_batch_no int,
    IN p_comm_appr_oper_no int,
    IN p_comm_appr_oper int,
    IN p_comm_appr_status varchar(2),
    IN p_comm_appr_remark varchar(255),
    IN p_comm_qty decimal(18,2),
    IN p_comm_dir int,
    IN p_comm_limit_price decimal(16,9),
    IN p_limit_actual_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_comm_cancel_qty decimal(18,2),
    IN p_comm_status varchar(2),
    IN p_comm_begin_date int,
    IN p_comm_end_date int,
    IN p_comm_begin_time int,
    IN p_comm_end_time int,
    IN p_comm_oper_way varchar(2),
    IN p_rece_margin decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_occur_amt decimal(18,4),
    OUT p_comm_occur_qty decimal(18,2),
    OUT p_comm_appr_date int,
    OUT p_comm_appr_time int
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_contrc_dir int;
    declare v_comm_date int;
    declare v_comm_id bigint;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_batch_no int;
    declare v_comm_appr_oper_no int;
    declare v_comm_appr_oper int;
    declare v_comm_appr_status varchar(2);
    declare v_comm_appr_remark varchar(255);
    declare v_comm_qty decimal(18,2);
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_oper_way varchar(2);
    declare v_rece_margin decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_oper_func_code varchar(16);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_tmp_comm_frozen_qty decimal(18,2);
    declare v_tmp_comm_cancel_qty decimal(18,2);
    declare v_comm_margin decimal(18,4);
    declare v_tmp_comm_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_comm_order_qty decimal(18,2);
    declare v_comm_change_qty decimal(18,2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_comm_frozen_qty decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_comm_appr_qty decimal(18,2);

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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_asset_type = p_asset_type;
    SET v_contrc_dir = p_contrc_dir;
    SET v_comm_date = p_comm_date;
    SET v_comm_id = p_comm_id;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_appr_oper_no = p_comm_appr_oper_no;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_comm_appr_status = p_comm_appr_status;
    SET v_comm_appr_remark = p_comm_appr_remark;
    SET v_comm_qty = p_comm_qty;
    SET v_comm_dir = p_comm_dir;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_order_qty = p_order_qty;
    SET v_comm_cancel_qty = p_comm_cancel_qty;
    SET v_comm_status = p_comm_status;
    SET v_comm_begin_date = p_comm_begin_date;
    SET v_comm_end_date = p_comm_end_date;
    SET v_comm_begin_time = p_comm_begin_time;
    SET v_comm_end_time = p_comm_end_time;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_rece_margin = p_rece_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_comm_frozen_qty = 0;
    SET v_tmp_comm_cancel_qty = 0;
    SET v_comm_margin = 0;
    SET v_tmp_comm_qty = 0;
    SET v_calc_dir = 1;
    SET v_comm_order_qty = 0;
    SET v_comm_change_qty = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_comm_frozen_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_comm_appr_qty = 0;

    
    label_pro:BEGIN
    

    /* [获取机器日期][@指令审批日期#] */
    select date_format(curdate(),'%Y%m%d') into v_comm_appr_date;


    /* [获取机器时间][@指令审批时间#] */
    select date_format(curtime(),'%H%i%s') into v_comm_appr_time;


    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @指令完成日期# = 0; */
    set v_comm_comple_date = 0;

    /* set @指令完成时间# = 0; */
    set v_comm_comple_time = 0;

    /* set @指令变动金额#=0; */
    set v_comm_occur_amt=0;

    /* set @指令变动数量#=0; */
    set v_comm_occur_qty=0;

    /* set @临时_指令冻结数量# = 0; */
    set v_tmp_comm_frozen_qty = 0;

    /* set @临时_指令撤销数量# = 0; */
    set v_tmp_comm_cancel_qty = 0;

    /* set @指令保证金# = @应收保证金#; */
    set v_comm_margin = v_rece_margin;

    /* if @指令审批状态# <> 《指令审批状态-不审批》 then */
    if v_comm_appr_status <> "4" then

        /* [检查报错返回][@指令下达人#=@指令审批操作员#][726][@指令下达人#,@指令审批操作员#] */
        if v_comm_opor=v_comm_appr_oper then
            
            SET v_error_code = "tdfutuA.3.21.726";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令下达人=",v_comm_opor,",","指令审批操作员=",v_comm_appr_oper),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令下达人=",v_comm_opor,",","指令审批操作员=",v_comm_appr_oper);
            end if;
            leave label_pro;
        end if;


        /* if @指令审批状态# = 《指令审批状态-审批拒绝》 then */
        if v_comm_appr_status = "3" then

            /* set @临时_指令撤销数量# = @指令数量# - @订单数量# - @指令撤销数量#; */
            set v_tmp_comm_cancel_qty = v_comm_qty - v_order_qty - v_comm_cancel_qty;

            /* set @临时_指令数量# = @指令数量#; */
            set v_tmp_comm_qty = v_comm_qty;

            /* set @计算方向# = 《计算方向-减去》; */
            set v_calc_dir = -1;

            /* set @指令订单数量# = @订单数量#; */
            set v_comm_order_qty = v_order_qty;

            /* set @指令变化数量# = @临时_指令撤销数量#; */
            set v_comm_change_qty = v_tmp_comm_cancel_qty;

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
                SET v_error_code = "tdfutuA.3.21.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令变动金额和数量出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* [获取机器日期][@指令完成日期#] */
            select date_format(curdate(),'%Y%m%d') into v_comm_comple_date;


            /* [获取机器时间][@指令完成时间#] */
            select date_format(curtime(),'%H%i%s') into v_comm_comple_time;


            /* set @指令状态# = 《指令状态-全部撤销》; */
            set v_comm_status = "6";
        end if;

        /* [更新表记录][交易期货_指令_指令表][{指令撤销数量}= {指令撤销数量} + @临时_指令撤销数量#, {指令冻结数量} = {指令冻结数量} + @指令冻结数量#, {指令完成日期} = @指令完成日期#, {指令完成时间} = @指令完成时间#, {指令审批日期}=@指令审批日期#,{指令审批时间}=@指令审批时间#,{指令审批操作员序号}=@指令审批操作员序号#,{指令审批操作员}=@指令审批操作员#,{指令审批说明}=@指令审批说明#,{指令审批状态}=@指令审批状态#,{指令状态}=@指令状态#][{记录序号}=@指令序号#][2][@指令序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdfutu.tb_tdfuap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, comm_cancel_qty= comm_cancel_qty + v_tmp_comm_cancel_qty, comm_frozen_qty = comm_frozen_qty + v_comm_frozen_qty, comm_comple_date = v_comm_comple_date, comm_comple_time = v_comm_comple_time, comm_appr_date=v_comm_appr_date,comm_appr_time=v_comm_appr_time,comm_appr_oper_no=v_comm_appr_oper_no,comm_appr_oper=v_comm_appr_oper,comm_appr_remark=v_comm_appr_remark,comm_appr_status=v_comm_appr_status,comm_status=v_comm_status where row_id=v_comm_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdfutuA.3.21.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令序号=",v_comm_id);
            end if;
            leave label_pro;
        end if;


        /* [插入表记录][交易期货_指令_指令审批表][字段][字段变量][1][@指令序号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdfutu.tb_tdfuap_command_approve(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_func_code, init_date, comm_appr_date, comm_appr_time, 
            comm_appr_oper_no, comm_appr_oper, co_no, pd_no, 
            exch_group_no, asset_acco_no, exch_no, futu_acco_no, 
            contrc_code_no, contrc_type, comm_date, comm_id, 
            comm_opor, comm_dir, comm_qty, comm_limit_price, 
            limit_actual_price, comm_begin_date, comm_end_date, comm_begin_time, 
            comm_end_time, comm_appr_status, comm_appr_remark) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_func_code, v_init_date, v_comm_appr_date, v_comm_appr_time, 
            v_comm_appr_oper_no, v_comm_appr_oper, v_co_no, v_pd_no, 
            v_exch_group_no, v_asset_acco_no, v_exch_no, v_futu_acco_no, 
            v_contrc_code_no, v_contrc_type, v_comm_date, v_comm_id, 
            v_comm_opor, v_comm_dir, v_comm_qty, v_comm_limit_price, 
            v_limit_actual_price, v_comm_begin_date, v_comm_end_date, v_comm_begin_time, 
            v_comm_end_time, v_comm_appr_status, v_comm_appr_remark);
        if v_error_code = "1" then
                    
            SET v_error_code = "tdfutuA.3.21.1";
            SET v_error_info =  CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;

    /* set @指令审批数量#=@指令数量#; */
    set v_comm_appr_qty=v_comm_qty;

    /* set @指令撤销数量# = @临时_指令撤销数量#; */
    set v_comm_cancel_qty = v_tmp_comm_cancel_qty;

    /* 调用【原子_交易期货_指令_审批指令更新汇总指令】*/
    call db_tdfutu.pra_tdfuap_ApprCommUpdateSumComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_comm_date,
        v_comm_batch_no,
        v_comm_executor,
        v_comm_appr_status,
        v_comm_qty,
        v_comm_appr_qty,
        v_comm_cancel_qty,
        v_comm_appr_date,
        v_comm_appr_time,
        v_comm_comple_date,
        v_comm_comple_time,
        v_comm_oper_way,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_审批指令更新汇总指令出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_occur_amt = v_comm_occur_amt;
    SET p_comm_occur_qty = v_comm_occur_qty;
    SET p_comm_appr_date = v_comm_appr_date;
    SET p_comm_appr_time = v_comm_appr_time;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_审批指令更新汇总指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_ApprCommUpdateSumComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_ApprCommUpdateSumComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_comm_date int,
    IN p_comm_batch_no int,
    IN p_comm_executor int,
    IN p_comm_appr_status varchar(2),
    IN p_comm_qty decimal(18,2),
    IN p_comm_appr_qty decimal(18,2),
    IN p_comm_cancel_qty decimal(18,2),
    IN p_comm_appr_date int,
    IN p_comm_appr_time int,
    IN p_comm_comple_date int,
    IN p_comm_comple_time int,
    IN p_comm_oper_way varchar(2),
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
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_comm_appr_status varchar(2);
    declare v_comm_qty decimal(18,2);
    declare v_comm_appr_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_oper_way varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_comm_appr_qty decimal(18,2);
    declare v_tmp_comm_qty decimal(18,2);
    declare v_tmp_comm_cancel_qty decimal(18,2);
    declare v_tmp_comm_appr_date int;
    declare v_tmp_comm_appr_time int;
    declare v_tmp_comm_comple_date int;
    declare v_tmp_comm_comple_time int;
    declare v_tmp_comm_executor int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_await_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_status varchar(2);
    declare v_rece_margin decimal(18,4);
    declare v_comm_sum_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_max_comm_comple_date int;
    declare v_max_comm_comple_time int;
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
    SET v_comm_date = p_comm_date;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_appr_status = p_comm_appr_status;
    SET v_comm_qty = p_comm_qty;
    SET v_comm_appr_qty = p_comm_appr_qty;
    SET v_comm_cancel_qty = p_comm_cancel_qty;
    SET v_comm_appr_date = p_comm_appr_date;
    SET v_comm_appr_time = p_comm_appr_time;
    SET v_comm_comple_date = p_comm_comple_date;
    SET v_comm_comple_time = p_comm_comple_time;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_comm_appr_qty = 0;
    SET v_tmp_comm_qty = 0;
    SET v_tmp_comm_cancel_qty = 0;
    SET v_tmp_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_comm_executor = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
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
    SET v_comm_amt = 0;
    SET v_order_qty = 0;
    SET v_comm_await_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_status = "0";
    SET v_rece_margin = 0;
    SET v_comm_sum_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_max_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_max_comm_comple_time = date_format(curtime(),'%H%i%s');
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

    
    label_pro:BEGIN
    

    /* [检查正常返回][@指令批号# = 0] */
    if v_comm_batch_no = 0 then
        leave label_pro;
    end if;


    /* set @临时_指令审批数量# = @指令审批数量#; */
    set v_tmp_comm_appr_qty = v_comm_appr_qty;

    /* set @临时_指令数量# = @指令数量#; */
    set v_tmp_comm_qty = v_comm_qty;

    /* set @临时_指令撤销数量# = @指令撤销数量#; */
    set v_tmp_comm_cancel_qty = v_comm_cancel_qty;

    /* set @临时_指令审批日期# = @指令审批日期#; */
    set v_tmp_comm_appr_date = v_comm_appr_date;

    /* set @临时_指令审批时间# = @指令审批时间#; */
    set v_tmp_comm_appr_time = v_comm_appr_time;

    /* set @临时_指令完成日期# = @指令完成日期#; */
    set v_tmp_comm_comple_date = v_comm_comple_date;

    /* set @临时_指令完成时间# = @指令完成时间#; */
    set v_tmp_comm_comple_time = v_comm_comple_time;

    /* set @临时_指令执行人# = @指令执行人#; */
    set v_tmp_comm_executor = v_comm_executor;

    /* [锁定获取表记录变量][交易期货_指令_指令汇总表][字段][字段变量][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号#][1][@指令日期#, @机构编号#, @指令批号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, comm_await_cancel_qty, strike_amt, 
        strike_qty, strike_status, rece_margin, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        buy_order_qty, sell_order_qty, buy_comm_qty, sell_comm_qty, 
        buy_strike_qty, sell_strike_qty, buy_strike_amt, sell_strike_amt, 
        buy_comm_amt, sell_comm_amt, comm_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_code, v_contrc_type, v_asset_type, 
        v_contrc_dir, v_hedge_type, v_comm_date, v_comm_time, 
        v_comm_batch_no, v_comm_opor, v_comm_executor, v_comm_dir, 
        v_comm_limit_price, v_limit_actual_price, v_comm_qty, v_comm_amt, 
        v_order_qty, v_comm_cancel_qty, v_comm_await_cancel_qty, v_strike_amt, 
        v_strike_qty, v_strike_status, v_rece_margin, v_comm_sum_status, 
        v_comm_begin_date, v_comm_end_date, v_comm_begin_time, v_comm_end_time, 
        v_comm_comple_date, v_comm_comple_time, v_max_comm_comple_date, v_max_comm_comple_time, 
        v_comm_appr_date, v_comm_appr_time, v_comm_appr_qty, v_comm_sum_approve_status, 
        v_buy_order_qty, v_sell_order_qty, v_buy_comm_qty, v_sell_comm_qty, 
        v_buy_strike_qty, v_sell_strike_qty, v_buy_strike_amt, v_sell_strike_amt, 
        v_buy_comm_amt, v_sell_comm_amt, v_comm_oper_way from db_tdfutu.tb_tdfuap_sumcommand where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.10.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no);
        end if;
        leave label_pro;
    end if;


    /* if @指令执行人# = 0 then */
    if v_comm_executor = 0 then

       /* set  @指令执行人# = @临时_指令执行人#; */
       set  v_comm_executor = v_tmp_comm_executor;
    end if;

    /* set @指令撤销数量#= @指令撤销数量# + @临时_指令撤销数量#; */
    set v_comm_cancel_qty= v_comm_cancel_qty + v_tmp_comm_cancel_qty;

    /* set @指令审批数量#= @指令审批数量# + @临时_指令审批数量#; */
    set v_comm_appr_qty= v_comm_appr_qty + v_tmp_comm_appr_qty;

    /* 调用【原子_交易期货_指令_计算指令汇总审批状态】*/
    call db_tdfutu.pra_tdfuap_CaclCommSumApprStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_qty,
        v_comm_appr_qty,
        v_error_code,
        v_error_info,
        v_comm_sum_approve_status);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.10.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令汇总审批状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @临时_指令审批日期# > @指令审批日期# then */
    if v_tmp_comm_appr_date > v_comm_appr_date then

        /* set @指令审批日期# = @临时_指令审批日期#; */
        set v_comm_appr_date = v_tmp_comm_appr_date;
    end if;

    /* if @临时_指令审批时间# > @指令审批时间# then */
    if v_tmp_comm_appr_time > v_comm_appr_time then

        /* set @指令审批时间# = @临时_指令审批时间#; */
        set v_comm_appr_time = v_tmp_comm_appr_time;
    end if;

    /* if @临时_指令完成日期# > 0 and (@临时_指令完成日期# < @指令完成日期# or @指令完成日期# = 0) then */
    if v_tmp_comm_comple_date > 0 and (v_tmp_comm_comple_date < v_comm_comple_date or v_comm_comple_date = 0) then

        /* set @指令完成日期#  = @临时_指令完成日期#; */
        set v_comm_comple_date  = v_tmp_comm_comple_date;
    end if;

    /* if @临时_指令完成日期# > @指令最大完成日期# then */
    if v_tmp_comm_comple_date > v_max_comm_comple_date then

        /* set @指令最大完成日期#  = @临时_指令完成日期#; */
        set v_max_comm_comple_date  = v_tmp_comm_comple_date;
    end if;

    /* if @临时_指令完成时间# > 0 and (@临时_指令完成时间# < @指令完成时间# or @指令完成时间# = 0) then */
    if v_tmp_comm_comple_time > 0 and (v_tmp_comm_comple_time < v_comm_comple_time or v_comm_comple_time = 0) then

        /* set @指令完成时间# = @临时_指令完成时间#; */
        set v_comm_comple_time = v_tmp_comm_comple_time;
    end if;

    /* if @临时_指令完成时间# > @指令最大完成时间# then */
    if v_tmp_comm_comple_time > v_max_comm_comple_time then

        /* set @指令最大完成时间# = @临时_指令完成时间#; */
        set v_max_comm_comple_time = v_tmp_comm_comple_time;
    end if;

    /* 调用【原子_交易期货_指令_计算指令汇总状态】*/
    call db_tdfutu.pra_tdfuap_CaclCommSumStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_qty,
        v_order_qty,
        v_comm_cancel_qty,
        v_comm_await_cancel_qty,
        v_strike_qty,
        v_error_code,
        v_error_info,
        v_comm_sum_status);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.10.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令汇总状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [更新表记录][交易期货_指令_指令汇总表][{指令撤销数量}= @指令撤销数量#,{指令审批数量}= @指令审批数量#, {指令完成日期} = @指令完成日期#, {指令完成时间} = @指令完成时间#, {指令最大完成日期} = @指令最大完成日期#, {指令最大完成时间} = @指令最大完成时间#, {指令审批日期}=@指令审批日期#,{指令审批时间}=@指令审批时间#,{指令汇总审批状态}=@指令汇总审批状态#,{指令汇总状态}=@指令汇总状态#][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号# and {指令执行人} = @指令执行人#][1][@指令日期#, @机构编号#, @指令批号#, @指令执行人#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfuap_sumcommand set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, comm_cancel_qty= v_comm_cancel_qty,comm_appr_qty= v_comm_appr_qty, comm_comple_date = v_comm_comple_date, comm_comple_time = v_comm_comple_time, max_comm_comple_date = v_max_comm_comple_date, max_comm_comple_time = v_max_comm_comple_time, comm_appr_date=v_comm_appr_date,comm_appr_time=v_comm_appr_time,comm_sum_approve_status=v_comm_sum_approve_status,comm_sum_status=v_comm_sum_status where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no and comm_executor = v_comm_executor;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.10.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 指令执行人=", v_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 指令执行人=", v_comm_executor);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_下单更新指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_OrderUpdateComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_OrderUpdateComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_id bigint,
    IN p_comm_frozen_qty decimal(18,2),
    IN p_order_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_limit_actual_price decimal(16,9),
    OUT p_exter_comm_flag int,
    OUT p_comm_comple_date int,
    OUT p_comm_comple_time int,
    OUT p_comm_status varchar(2),
    OUT p_strike_status varchar(2)
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
    declare v_comm_frozen_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_limit_actual_price decimal(16,9);
    declare v_exter_comm_flag int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_status varchar(2);
    declare v_strike_status varchar(2);
    declare v_tmp_order_qty decimal(18,2);
    declare v_co_no int;
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_comm_oper_way varchar(2);
    declare v_comm_executor int;
    declare v_comm_dir int;
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
    SET v_comm_id = p_comm_id;
    SET v_comm_frozen_qty = p_comm_frozen_qty;
    SET v_order_qty = p_order_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_limit_actual_price = 0;
    SET v_exter_comm_flag = 0;
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_status = "0";
    SET v_strike_status = "0";
    SET v_tmp_order_qty = 0;
    SET v_co_no = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_batch_no = 0;
    SET v_comm_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_qty = 0;
    SET v_comm_oper_way = " ";
    SET v_comm_executor = 0;
    SET v_comm_dir = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #保存输入参数

    /* set @临时_订单数量#=@订单数量#; */
    set v_tmp_order_qty=v_order_qty;
    #防止并发，加锁获取

    /* [锁定获取表记录变量][交易期货_指令_指令表][{机构编号},{指令日期},{记录序号},{指令批号},{指令数量},{订单数量},{指令撤销数量},{成交数量},{指令实际限价},{指令操作方式},{指令执行人},{指令方向}][@机构编号#,@指令日期#,@指令序号#,@指令批号#,@指令数量#,@订单数量#,@指令撤销数量#,@成交数量#,@指令实际限价#,@指令操作方式#,@指令执行人#,@指令方向#][{记录序号}=@指令序号#][1][@指令序号#] */
    select co_no,comm_date,row_id,comm_batch_no,comm_qty,order_qty,comm_cancel_qty,strike_qty,limit_actual_price,comm_oper_way,comm_executor,comm_dir into v_co_no,v_comm_date,v_comm_id,v_comm_batch_no,v_comm_qty,v_order_qty,v_comm_cancel_qty,v_strike_qty,v_limit_actual_price,v_comm_oper_way,v_comm_executor,v_comm_dir from db_tdfutu.tb_tdfuap_command where row_id=v_comm_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.11.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
        leave label_pro;
    end if;

    #判断是否超过指令数量

    /* [检查报错返回][@临时_订单数量# >@指令数量# - @订单数量# - @指令撤销数量#][630][@临时_订单数量#,@指令数量#,@订单数量#,@指令撤销数量#] */
    if v_tmp_order_qty >v_comm_qty - v_order_qty - v_comm_cancel_qty then
        
        SET v_error_code = "tdfutuA.3.11.630";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("临时_订单数量=",v_tmp_order_qty,",","指令数量=",v_comm_qty,",","订单数量=",v_order_qty,",","指令撤销数量=",v_comm_cancel_qty),"#",v_mysql_message);
        else
            SET v_error_info = concat("临时_订单数量=",v_tmp_order_qty,",","指令数量=",v_comm_qty,",","订单数量=",v_order_qty,",","指令撤销数量=",v_comm_cancel_qty);
        end if;
        leave label_pro;
    end if;


    /* set @订单数量#=@临时_订单数量#+@订单数量#; */
    set v_order_qty=v_tmp_order_qty+v_order_qty;
    #获取指令状态

    /* 调用【原子_交易期货_指令_计算指令状态】*/
    call db_tdfutu.pra_tdfuap_CaclCommStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_qty,
        v_order_qty,
        v_comm_cancel_qty,
        v_strike_qty,
        v_error_code,
        v_error_info,
        v_comm_status,
        v_comm_comple_date,
        v_comm_comple_time);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #重置订单数量为变动值

    /* set @订单数量#=@临时_订单数量#; */
    set v_order_qty=v_tmp_order_qty;

    /* [更新表记录][交易期货_指令_指令表][{订单数量}={订单数量} + @订单数量#, {指令冻结数量} ={指令冻结数量} + @指令冻结数量#,{指令状态}=@指令状态#,{指令完成日期}=@指令完成日期#,{指令完成时间}=@指令完成时间#][{记录序号}=@指令序号#][2][@指令序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfuap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_qty=order_qty + v_order_qty, comm_frozen_qty =comm_frozen_qty + v_comm_frozen_qty,comm_status=v_comm_status,comm_comple_date=v_comm_comple_date,comm_comple_time=v_comm_comple_time where row_id=v_comm_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.11.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_交易期货_指令_下单更新汇总指令】*/
    call db_tdfutu.pra_tdfuap_OrderUpdateSumComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_comm_date,
        v_comm_batch_no,
        v_comm_executor,
        v_comm_status,
        v_comm_dir,
        v_comm_comple_date,
        v_comm_comple_time,
        v_order_qty,
        v_comm_oper_way,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_下单更新汇总指令出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_limit_actual_price = v_limit_actual_price;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_comm_comple_date = v_comm_comple_date;
    SET p_comm_comple_time = v_comm_comple_time;
    SET p_comm_status = v_comm_status;
    SET p_strike_status = v_strike_status;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_计算指令状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_CaclCommStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_CaclCommStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_qty decimal(18,2),
    IN p_order_qty decimal(18,2),
    IN p_comm_cancel_qty decimal(18,2),
    IN p_strike_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_status varchar(2),
    OUT p_comm_comple_date int,
    OUT p_comm_comple_time int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_comm_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_status varchar(2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;

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
    SET v_comm_qty = p_comm_qty;
    SET v_order_qty = p_order_qty;
    SET v_comm_cancel_qty = p_comm_cancel_qty;
    SET v_strike_qty = p_strike_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_status = "0";
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器日期][@指令完成日期#] */
    select date_format(curdate(),'%Y%m%d') into v_comm_comple_date;


    /* [获取机器时间][@指令完成时间#] */
    select date_format(curtime(),'%H%i%s') into v_comm_comple_time;

    #判断指令完成日期和指令完成时间

    /* if @指令数量# - @指令撤销数量# - @成交数量# <> 0 then */
    if v_comm_qty - v_comm_cancel_qty - v_strike_qty <> 0 then

        /* set @指令完成日期#=0; */
        set v_comm_comple_date=0;

        /* set @指令完成时间#=0; */
        set v_comm_comple_time=0;
    end if;
    #订单状态与指令状态都遵守固定的规律，中途有任何跳跃时均以后者为准
    #指令状态顺序：未执行-部分执行-全部执行-待撤销-部分撤销-全部撤销
    #以下判断顺序中，按顺序判断状态

    /* set @指令状态#=《指令状态-未执行》; */
    set v_comm_status="1";

    /* if @订单数量#=0 then */
    if v_order_qty=0 then

        /* set @指令状态#=《指令状态-未执行》; */
        set v_comm_status="1";

    /* elseif @指令数量#>@指令撤销数量# + @订单数量# then */
    elseif v_comm_qty>v_comm_cancel_qty + v_order_qty then

        /* set @指令状态#=《指令状态-部分执行》; */
        set v_comm_status="2";
    end if;

    /* if @指令数量#=@订单数量# then */
    if v_comm_qty=v_order_qty then

        /* set @指令状态#=《指令状态-全部执行》; */
        set v_comm_status="3";
    end if;

    /* if @指令数量#>@指令撤销数量# and @指令撤销数量#>0 then */
    if v_comm_qty>v_comm_cancel_qty and v_comm_cancel_qty>0 then

        /* set @指令状态#=《指令状态-部分撤销》; */
        set v_comm_status="5";
    end if;

    /* if @指令数量#=@指令撤销数量# then */
    if v_comm_qty=v_comm_cancel_qty then

        /* set @指令状态#=《指令状态-全部撤销》; */
        set v_comm_status="6";
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_status = v_comm_status;
    SET p_comm_comple_date = v_comm_comple_date;
    SET p_comm_comple_time = v_comm_comple_time;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_下单更新汇总指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_OrderUpdateSumComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_OrderUpdateSumComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_comm_date int,
    IN p_comm_batch_no int,
    IN p_comm_executor int,
    IN p_comm_status varchar(2),
    IN p_comm_dir int,
    IN p_comm_comple_date int,
    IN p_comm_comple_time int,
    IN p_order_qty decimal(18,2),
    IN p_comm_oper_way varchar(2),
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
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_comm_status varchar(2);
    declare v_comm_dir int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_order_qty decimal(18,2);
    declare v_comm_oper_way varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_comm_status varchar(2);
    declare v_tmp_order_qty decimal(18,2);
    declare v_tmp_comm_comple_date int;
    declare v_tmp_comm_comple_time int;
    declare v_tmp_buy_order_qty decimal(18,2);
    declare v_tmp_sell_order_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_await_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_status varchar(2);
    declare v_rece_margin decimal(18,4);
    declare v_comm_sum_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
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
    SET v_comm_date = p_comm_date;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_status = p_comm_status;
    SET v_comm_dir = p_comm_dir;
    SET v_comm_comple_date = p_comm_comple_date;
    SET v_comm_comple_time = p_comm_comple_time;
    SET v_order_qty = p_order_qty;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_comm_status = "0";
    SET v_tmp_order_qty = 0;
    SET v_tmp_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_buy_order_qty = 0;
    SET v_tmp_sell_order_qty = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
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
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_await_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_status = "0";
    SET v_rece_margin = 0;
    SET v_comm_sum_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
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

    
    label_pro:BEGIN
    

    /* [检查正常返回][@指令批号# = 0] */
    if v_comm_batch_no = 0 then
        leave label_pro;
    end if;


    /* set @临时_指令状态# = @指令状态#; */
    set v_tmp_comm_status = v_comm_status;

    /* set @临时_订单数量# = @订单数量#; */
    set v_tmp_order_qty = v_order_qty;

    /* set @临时_指令完成日期# = @指令完成日期#; */
    set v_tmp_comm_comple_date = v_comm_comple_date;

    /* set @临时_指令完成时间# = @指令完成时间#; */
    set v_tmp_comm_comple_time = v_comm_comple_time;

    /* set @临时_买入订单数量# = 0; */
    set v_tmp_buy_order_qty = 0;

    /* set @临时_卖出订单数量# = 0; */
    set v_tmp_sell_order_qty = 0;

    /* if @指令方向# = 《指令方向-买入》  then */
    if v_comm_dir = 1  then

        /* set @临时_买入订单数量# = @订单数量#; */
        set v_tmp_buy_order_qty = v_order_qty;

    /* elseif @指令方向# = 《指令方向-卖出》  then */
    elseif v_comm_dir = 2  then

        /* set @临时_卖出订单数量# = @订单数量#; */
        set v_tmp_sell_order_qty = v_order_qty;
    end if;

    /* [锁定获取表记录变量][交易期货_指令_指令汇总表][字段][字段变量][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号# and {指令执行人} = @指令执行人#][1][@指令日期#, @机构编号#, @指令批号#,@指令执行人#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, comm_await_cancel_qty, strike_amt, 
        strike_qty, strike_status, rece_margin, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        buy_order_qty, sell_order_qty, buy_comm_qty, sell_comm_qty, 
        buy_strike_qty, sell_strike_qty, buy_strike_amt, sell_strike_amt, 
        buy_comm_amt, sell_comm_amt, comm_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_code, v_contrc_type, v_asset_type, 
        v_contrc_dir, v_hedge_type, v_comm_date, v_comm_time, 
        v_comm_batch_no, v_comm_opor, v_comm_executor, v_comm_dir, 
        v_comm_limit_price, v_limit_actual_price, v_comm_qty, v_comm_amt, 
        v_order_qty, v_comm_cancel_qty, v_comm_await_cancel_qty, v_strike_amt, 
        v_strike_qty, v_strike_status, v_rece_margin, v_comm_sum_status, 
        v_comm_begin_date, v_comm_end_date, v_comm_begin_time, v_comm_end_time, 
        v_comm_comple_date, v_comm_comple_time, v_max_comm_comple_date, v_max_comm_comple_time, 
        v_comm_appr_date, v_comm_appr_time, v_comm_appr_qty, v_comm_sum_approve_status, 
        v_buy_order_qty, v_sell_order_qty, v_buy_comm_qty, v_sell_comm_qty, 
        v_buy_strike_qty, v_sell_strike_qty, v_buy_strike_amt, v_sell_strike_amt, 
        v_buy_comm_amt, v_sell_comm_amt, v_comm_oper_way from db_tdfutu.tb_tdfuap_sumcommand where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no and comm_executor = v_comm_executor limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.13.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,",","指令执行人=",v_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,",","指令执行人=",v_comm_executor);
        end if;
        leave label_pro;
    end if;


    /* if @临时_指令完成日期# > 0 and (@临时_指令完成日期# < @指令完成日期# or @指令完成日期# = 0) then */
    if v_tmp_comm_comple_date > 0 and (v_tmp_comm_comple_date < v_comm_comple_date or v_comm_comple_date = 0) then

        /* set @指令完成日期#  = @临时_指令完成日期#; */
        set v_comm_comple_date  = v_tmp_comm_comple_date;
    end if;

    /* if @临时_指令完成日期#  > @指令最大完成日期# then */
    if v_tmp_comm_comple_date  > v_max_comm_comple_date then

        /* set @指令最大完成日期#  = @临时_指令完成日期#; */
        set v_max_comm_comple_date  = v_tmp_comm_comple_date;
    end if;

    /* if @临时_指令完成时间# > 0 and (@临时_指令完成时间# < @指令完成时间# or @指令完成时间# = 0) then */
    if v_tmp_comm_comple_time > 0 and (v_tmp_comm_comple_time < v_comm_comple_time or v_comm_comple_time = 0) then

        /* set @指令完成时间# = @临时_指令完成时间#; */
        set v_comm_comple_time = v_tmp_comm_comple_time;
    end if;

    /* if @临时_指令完成时间# > @指令最大完成时间# then */
    if v_tmp_comm_comple_time > v_max_comm_comple_time then

        /* set @指令最大完成时间# = @临时_指令完成时间#; */
        set v_max_comm_comple_time = v_tmp_comm_comple_time;
    end if;

    /* set @订单数量# = @订单数量# + @临时_订单数量#; */
    set v_order_qty = v_order_qty + v_tmp_order_qty;

    /* set @买入订单数量# = @买入订单数量# + @临时_买入订单数量#; */
    set v_buy_order_qty = v_buy_order_qty + v_tmp_buy_order_qty;

    /* set @卖出订单数量# = @卖出订单数量# + @临时_卖出订单数量#; */
    set v_sell_order_qty = v_sell_order_qty + v_tmp_sell_order_qty;

    /* set @临时_指令完成日期#  = @指令完成日期#; */
    set v_tmp_comm_comple_date  = v_comm_comple_date;

    /* set @临时_指令完成时间# = @指令完成时间#; */
    set v_tmp_comm_comple_time = v_comm_comple_time;
    #获取指令状态

    /* 调用【原子_交易期货_指令_计算指令汇总状态】*/
    call db_tdfutu.pra_tdfuap_CaclCommSumStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_qty,
        v_order_qty,
        v_comm_cancel_qty,
        v_comm_await_cancel_qty,
        v_strike_qty,
        v_error_code,
        v_error_info,
        v_comm_sum_status);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令汇总状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @指令完成日期#  = @临时_指令完成日期#; */
    set v_comm_comple_date  = v_tmp_comm_comple_date;

    /* set @指令完成时间# = @临时_指令完成时间#; */
    set v_comm_comple_time = v_tmp_comm_comple_time;

    /* [更新表记录][交易期货_指令_指令汇总表][{订单数量}=@订单数量#,{买入订单数量}=@买入订单数量#,{卖出订单数量}=@卖出订单数量#,{指令汇总状态}=@指令汇总状态#,{指令完成日期} = @指令完成日期#, {指令完成时间} = @指令完成时间#, {指令最大完成日期} = @指令最大完成日期#, {指令最大完成时间} = @指令最大完成时间# ][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号# and {指令执行人} = @指令执行人#][2][@指令日期#, @机构编号#, @指令批号#, @指令执行人#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfuap_sumcommand set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_qty=v_order_qty,buy_order_qty=v_buy_order_qty,sell_order_qty=v_sell_order_qty,comm_sum_status=v_comm_sum_status,comm_comple_date = v_comm_comple_date, comm_comple_time = v_comm_comple_time, max_comm_comple_date = v_max_comm_comple_date, max_comm_comple_time = v_max_comm_comple_time  where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no and comm_executor = v_comm_executor;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.13.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 指令执行人=", v_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 指令执行人=", v_comm_executor);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_撤销指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_CancelComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_CancelComm(
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_trade_code_no int,
    OUT p_contrc_code varchar(6),
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_asset_type int,
    OUT p_invest_type int,
    OUT p_comm_limit_price decimal(16,9),
    OUT p_comm_status varchar(2),
    OUT p_limit_actual_price decimal(16,9),
    OUT p_contrc_dir int,
    OUT p_hedge_type int,
    OUT p_comm_dir int,
    OUT p_comm_cancel_qty decimal(18,2),
    OUT p_comm_date int,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int,
    OUT p_comb_code varchar(6),
    OUT p_rece_margin decimal(18,4),
    OUT p_order_qty decimal(18,2),
    OUT p_comm_qty decimal(18,2)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
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
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_comb_code varchar(6);
    declare v_rece_margin decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_comm_time int;
    declare v_comm_opor int;
    declare v_comm_amt decimal(18,4);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_strike_status varchar(2);
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
    declare v_comm_oper_way varchar(2);
    declare v_comm_comple_flag int;
    declare v_remark_info varchar(255);
    declare v_comm_margin decimal(18,4);
    declare v_comm_await_cancel_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
    declare v_wtdraw_qty decimal(18,2);

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
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
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_comb_code = " ";
    SET v_rece_margin = 0;
    SET v_order_qty = 0;
    SET v_comm_qty = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_opor = 0;
    SET v_comm_amt = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_comm_frozen_qty = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_strike_status = "0";
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
    SET v_comm_oper_way = " ";
    SET v_comm_comple_flag = 0;
    SET v_remark_info = " ";
    SET v_comm_margin = 0;
    SET v_comm_await_cancel_qty = 0;
    SET v_calc_dir = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_jour_after_occur_info = " ";
    SET v_wtdraw_qty = 0;

    
    label_pro:BEGIN
    

    /* set @指令状态#=《指令状态-全部撤销》; */
    set v_comm_status="6";
    #获取当前指令数量，以计算指令撤销数量和变动金额

    /* [锁定获取表记录变量][交易期货_指令_指令表][字段][字段变量][{记录序号}=@指令序号#][4][@指令序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, strike_amt, strike_qty, 
        comm_frozen_qty, rece_margin, capit_reback_days, posi_reback_days, 
        strike_status, comm_status, comm_begin_date, comm_end_date, 
        comm_begin_time, comm_end_time, comm_comple_date, comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_status, comm_appr_oper_no, 
        comm_appr_oper, comm_appr_remark, external_no, comb_code, 
        comm_oper_way, comm_comple_flag, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_code, v_contrc_type, v_asset_type, 
        v_contrc_dir, v_hedge_type, v_comm_date, v_comm_time, 
        v_comm_batch_no, v_comm_opor, v_comm_executor, v_comm_dir, 
        v_comm_limit_price, v_limit_actual_price, v_comm_qty, v_comm_amt, 
        v_order_qty, v_comm_cancel_qty, v_strike_amt, v_strike_qty, 
        v_comm_frozen_qty, v_rece_margin, v_capit_reback_days, v_posi_reback_days, 
        v_strike_status, v_comm_status, v_comm_begin_date, v_comm_end_date, 
        v_comm_begin_time, v_comm_end_time, v_comm_comple_date, v_comm_comple_time, 
        v_comm_appr_date, v_comm_appr_time, v_comm_appr_status, v_comm_appr_oper_no, 
        v_comm_appr_oper, v_comm_appr_remark, v_external_no, v_comb_code, 
        v_comm_oper_way, v_comm_comple_flag, v_remark_info from db_tdfutu.tb_tdfuap_command where row_id=v_comm_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.14.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
        leave label_pro;
    end if;


    /* set @指令保证金# = @应收保证金#; */
    set v_comm_margin = v_rece_margin;
    #检查指令状态

    /* [检查报错返回][@成交状态#=《成交状态-已成》][613]["请检查成交状态，成交状态不能为已成"] */
    if v_strike_status="3" then
        
        SET v_error_code = "tdfutuA.3.14.613";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("请检查成交状态，成交状态不能为已成","#",v_mysql_message);
        else
            SET v_error_info = "请检查成交状态，成交状态不能为已成";
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@指令状态# =《指令状态-待撤销》 or @指令状态# =《指令状态-部分撤销》 or @指令状态# =《指令状态-全部撤销》 ][614]["请检查指令状态，指令状态不能为待撤销、部分撤销、全部撤销"] */
    if v_comm_status ="4" or v_comm_status ="5" or v_comm_status ="6"  then
        
        SET v_error_code = "tdfutuA.3.14.614";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("请检查指令状态，指令状态不能为待撤销、部分撤销、全部撤销","#",v_mysql_message);
        else
            SET v_error_info = "请检查指令状态，指令状态不能为待撤销、部分撤销、全部撤销";
        end if;
        leave label_pro;
    end if;


    /* [获取机器日期][@指令完成日期#] */
    select date_format(curdate(),'%Y%m%d') into v_comm_comple_date;


    /* [获取机器时间][@指令完成时间#] */
    select date_format(curtime(),'%H%i%s') into v_comm_comple_time;


    /* set @指令撤销数量#=@指令数量# - @订单数量# - @指令撤销数量#; */
    set v_comm_cancel_qty=v_comm_qty - v_order_qty - v_comm_cancel_qty;

    /* set @指令待撤销数量#=@指令数量# - @指令撤销数量# - @成交数量#; */
    set v_comm_await_cancel_qty=v_comm_qty - v_comm_cancel_qty - v_strike_qty;
    #根据指令撤销数量置指令状态

    /* if @指令撤销数量#=0 and @指令数量#=@订单数量# then */
    if v_comm_cancel_qty=0 and v_comm_qty=v_order_qty then

        /* set @指令状态#=《指令状态-待撤销》; */
        set v_comm_status="4";

        /* set @指令完成日期#=0; */
        set v_comm_comple_date=0;

        /* set @指令完成时间#=0; */
        set v_comm_comple_time=0;

    /* elseif @指令数量#=@指令撤销数量# then */
    elseif v_comm_qty=v_comm_cancel_qty then

        /* set @指令状态#=《指令状态-全部撤销》; */
        set v_comm_status="6";

    /* elseif @指令撤销数量#>0 and @指令数量#>@订单数量# then */
    elseif v_comm_cancel_qty>0 and v_comm_qty>v_order_qty then

        /* set @指令状态#=《指令状态-部分撤销》; */
        set v_comm_status="5";

        /* set @指令完成日期#=0; */
        set v_comm_comple_date=0;

        /* set @指令完成时间#=0; */
        set v_comm_comple_time=0;
    end if;

    /* set @指令冻结数量# = 0; */
    set v_comm_frozen_qty = 0;

    /* set @计算方向# = 《计算方向-减去》; */
    set v_calc_dir = -1;

    /* set @指令冻结数量#=@计算方向# * @指令撤销数量#; */
    set v_comm_frozen_qty=v_calc_dir * v_comm_cancel_qty;

    /* [获取流水变动][{指令撤销数量},{指令状态}][@指令撤销数量#,@指令状态#]; */
    set v_jour_occur_field = concat("指令撤销数量","|","指令状态","|");
    set v_jour_occur_info = concat(v_comm_cancel_qty,"|",v_comm_status,"|");


    /* [更新表记录][交易期货_指令_指令表][{指令撤销数量}={指令撤销数量} + @指令撤销数量#, {指令冻结数量} = {指令冻结数量} + @指令冻结数量#, {指令状态}=@指令状态#,{指令完成日期}= @指令完成日期#,{指令完成时间}=@指令完成时间#][{记录序号}=@指令序号#][2][@指令序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfuap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, comm_cancel_qty=comm_cancel_qty + v_comm_cancel_qty, comm_frozen_qty = comm_frozen_qty + v_comm_frozen_qty, comm_status=v_comm_status,comm_comple_date= v_comm_comple_date,comm_comple_time=v_comm_comple_time where row_id=v_comm_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.14.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][交易期货_指令_指令表][{指令状态}][@指令状态#][{记录序号}=@指令序号#][4][@指令序号#] */
    select comm_status into v_comm_status from db_tdfutu.tb_tdfuap_command where row_id=v_comm_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.14.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@指令撤销数量#,@指令状态#]; */
    set v_jour_after_occur_info = concat(v_comm_cancel_qty,"|",v_comm_status,"|");


    /* set @备注信息#=@撤销说明#; */
    set v_remark_info=v_cancel_info;

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* [插入表记录][交易期货_指令_指令流水表][字段][字段变量][1][@初始化日期#,@指令序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdfutu.tb_tdfuap_command_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, futu_acco_no, 
        contrc_code_no, comm_date, comm_id, jour_occur_field, 
        jour_occur_info, jour_after_occur_info, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_comm_date, v_comm_id, v_jour_occur_field, 
        v_jour_occur_info, v_jour_after_occur_info, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.14.1";
        SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","指令序号=",v_comm_id),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @撤单数量# = 0; */
    set v_wtdraw_qty = 0;

    /* 调用【原子_交易期货_指令_撤销更新汇总指令】*/
    call db_tdfutu.pra_tdfuap_CancelUpdateSumComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_comm_date,
        v_comm_batch_no,
        v_comm_executor,
        v_comm_status,
        v_comm_dir,
        v_contrc_dir,
        v_comm_cancel_qty,
        v_comm_await_cancel_qty,
        v_wtdraw_qty,
        v_comm_comple_date,
        v_comm_comple_time,
        v_comm_oper_way,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_撤销更新汇总指令出现错误！',v_mysql_message);
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
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_trade_code_no = v_trade_code_no;
    SET p_contrc_code = v_contrc_code;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_asset_type = v_asset_type;
    SET p_invest_type = v_invest_type;
    SET p_comm_limit_price = v_comm_limit_price;
    SET p_comm_status = v_comm_status;
    SET p_limit_actual_price = v_limit_actual_price;
    SET p_contrc_dir = v_contrc_dir;
    SET p_hedge_type = v_hedge_type;
    SET p_comm_dir = v_comm_dir;
    SET p_comm_cancel_qty = v_comm_cancel_qty;
    SET p_comm_date = v_comm_date;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;
    SET p_comb_code = v_comb_code;
    SET p_rece_margin = v_rece_margin;
    SET p_order_qty = v_order_qty;
    SET p_comm_qty = v_comm_qty;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_撤销更新汇总指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_CancelUpdateSumComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_CancelUpdateSumComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_comm_date int,
    IN p_comm_batch_no int,
    IN p_comm_executor int,
    IN p_comm_status varchar(2),
    IN p_comm_dir int,
    IN p_contrc_dir int,
    IN p_comm_cancel_qty decimal(18,2),
    IN p_comm_await_cancel_qty decimal(18,2),
    IN p_wtdraw_qty decimal(18,2),
    IN p_comm_comple_date int,
    IN p_comm_comple_time int,
    IN p_comm_oper_way varchar(2),
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
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_comm_status varchar(2);
    declare v_comm_dir int;
    declare v_contrc_dir int;
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_await_cancel_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_oper_way varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_comm_cancel_qty decimal(18,2);
    declare v_tmp_comm_status varchar(2);
    declare v_tmp_comm_comple_date int;
    declare v_tmp_comm_comple_time int;
    declare v_tmp_comm_await_cancel_qty decimal(18,2);
    declare v_tmp_comm_dir int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_hedge_type int;
    declare v_comm_time int;
    declare v_comm_opor int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_status varchar(2);
    declare v_rece_margin decimal(18,4);
    declare v_comm_sum_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
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
    SET v_comm_date = p_comm_date;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_status = p_comm_status;
    SET v_comm_dir = p_comm_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_comm_cancel_qty = p_comm_cancel_qty;
    SET v_comm_await_cancel_qty = p_comm_await_cancel_qty;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_comm_comple_date = p_comm_comple_date;
    SET v_comm_comple_time = p_comm_comple_time;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_comm_cancel_qty = 0;
    SET v_tmp_comm_status = "0";
    SET v_tmp_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_comm_await_cancel_qty = 0;
    SET v_tmp_comm_dir = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_type = 0;
    SET v_asset_type = 0;
    SET v_hedge_type = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_opor = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_order_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_status = "0";
    SET v_rece_margin = 0;
    SET v_comm_sum_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
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

    
    label_pro:BEGIN
    

    /* [检查正常返回][@指令批号# = 0] */
    if v_comm_batch_no = 0 then
        leave label_pro;
    end if;


    /* set @临时_指令撤销数量#=@指令撤销数量#; */
    set v_tmp_comm_cancel_qty=v_comm_cancel_qty;

    /* set @临时_指令状态# = @指令状态#; */
    set v_tmp_comm_status = v_comm_status;

    /* set @临时_指令完成日期# = @指令完成日期#; */
    set v_tmp_comm_comple_date = v_comm_comple_date;

    /* set @临时_指令完成时间# = @指令完成时间#; */
    set v_tmp_comm_comple_time = v_comm_comple_time;

    /* set @临时_指令待撤销数量#=@指令待撤销数量#; */
    set v_tmp_comm_await_cancel_qty=v_comm_await_cancel_qty;

    /* set @临时_指令方向#=@指令方向#; */
    set v_tmp_comm_dir=v_comm_dir;

    /* [锁定获取表记录变量][交易期货_指令_指令汇总表][字段][字段变量][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号# and {指令执行人} = @指令执行人#][1][@指令日期#, @机构编号#, @指令批号#,@指令执行人#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, comm_await_cancel_qty, strike_amt, 
        strike_qty, strike_status, rece_margin, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        buy_order_qty, sell_order_qty, buy_comm_qty, sell_comm_qty, 
        buy_strike_qty, sell_strike_qty, buy_strike_amt, sell_strike_amt, 
        buy_comm_amt, sell_comm_amt, comm_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_code, v_contrc_type, v_asset_type, 
        v_contrc_dir, v_hedge_type, v_comm_date, v_comm_time, 
        v_comm_batch_no, v_comm_opor, v_comm_executor, v_comm_dir, 
        v_comm_limit_price, v_limit_actual_price, v_comm_qty, v_comm_amt, 
        v_order_qty, v_comm_cancel_qty, v_comm_await_cancel_qty, v_strike_amt, 
        v_strike_qty, v_strike_status, v_rece_margin, v_comm_sum_status, 
        v_comm_begin_date, v_comm_end_date, v_comm_begin_time, v_comm_end_time, 
        v_comm_comple_date, v_comm_comple_time, v_max_comm_comple_date, v_max_comm_comple_time, 
        v_comm_appr_date, v_comm_appr_time, v_comm_appr_qty, v_comm_sum_approve_status, 
        v_buy_order_qty, v_sell_order_qty, v_buy_comm_qty, v_sell_comm_qty, 
        v_buy_strike_qty, v_sell_strike_qty, v_buy_strike_amt, v_sell_strike_amt, 
        v_buy_comm_amt, v_sell_comm_amt, v_comm_oper_way from db_tdfutu.tb_tdfuap_sumcommand where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no and comm_executor = v_comm_executor limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.15.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,",","指令执行人=",v_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,",","指令执行人=",v_comm_executor);
        end if;
        leave label_pro;
    end if;


    /* if @临时_指令完成日期# > 0 and (@临时_指令完成日期# < @指令完成日期# or @指令完成日期# = 0) then */
    if v_tmp_comm_comple_date > 0 and (v_tmp_comm_comple_date < v_comm_comple_date or v_comm_comple_date = 0) then

        /* set @指令完成日期#  = @临时_指令完成日期#; */
        set v_comm_comple_date  = v_tmp_comm_comple_date;
    end if;

    /* if @临时_指令完成日期# > @指令最大完成日期# then */
    if v_tmp_comm_comple_date > v_max_comm_comple_date then

        /* set @指令最大完成日期#  = @临时_指令完成日期#; */
        set v_max_comm_comple_date  = v_tmp_comm_comple_date;
    end if;

    /* if @临时_指令完成时间# > 0 and (@临时_指令完成时间# < @指令完成时间# or @指令完成时间# = 0) then */
    if v_tmp_comm_comple_time > 0 and (v_tmp_comm_comple_time < v_comm_comple_time or v_comm_comple_time = 0) then

        /* set @指令完成时间# = @临时_指令完成时间#; */
        set v_comm_comple_time = v_tmp_comm_comple_time;
    end if;

    /* if @临时_指令完成时间# > @指令最大完成时间# then */
    if v_tmp_comm_comple_time > v_max_comm_comple_time then

        /* set @指令最大完成时间# = @临时_指令完成时间#; */
        set v_max_comm_comple_time = v_tmp_comm_comple_time;
    end if;

    /* set @指令撤销数量# = @指令撤销数量# + @临时_指令撤销数量#; */
    set v_comm_cancel_qty = v_comm_cancel_qty + v_tmp_comm_cancel_qty;

    /* set @订单数量# = @订单数量# - @撤单数量#; */
    set v_order_qty = v_order_qty - v_wtdraw_qty;

    /* set @指令待撤销数量# = @指令待撤销数量# + @临时_指令待撤销数量#; */
    set v_comm_await_cancel_qty = v_comm_await_cancel_qty + v_tmp_comm_await_cancel_qty;

    /* set @指令方向#=@临时_指令方向#; */
    set v_comm_dir=v_tmp_comm_dir;

    /* if @指令方向# = 《指令方向-买入》  then */
    if v_comm_dir = 1  then

        /* set @买入订单数量# = @买入订单数量# - @撤单数量#; */
        set v_buy_order_qty = v_buy_order_qty - v_wtdraw_qty;
    else

        /* set @卖出订单数量# = @卖出订单数量# - @撤单数量#; */
        set v_sell_order_qty = v_sell_order_qty - v_wtdraw_qty;
    end if;

    /* 调用【原子_交易期货_指令_计算指令汇总状态】*/
    call db_tdfutu.pra_tdfuap_CaclCommSumStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_qty,
        v_order_qty,
        v_comm_cancel_qty,
        v_comm_await_cancel_qty,
        v_strike_qty,
        v_error_code,
        v_error_info,
        v_comm_sum_status);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.15.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令汇总状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [更新表记录][交易期货_指令_指令汇总表][{订单数量}=@订单数量#,{买入订单数量}=@买入订单数量#,{卖出订单数量}=@卖出订单数量#,{指令撤销数量}=@指令撤销数量#,{指令待撤销数量}=@指令待撤销数量#,{指令汇总状态}=@指令汇总状态#,{指令完成日期} = @指令完成日期#, {指令完成时间} = @指令完成时间#, {指令最大完成日期} = @指令最大完成日期#, {指令最大完成时间} = @指令最大完成时间#][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号# and {指令执行人} = @指令执行人#][2][@指令日期#, @机构编号#, @指令批号#, @指令执行人#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfuap_sumcommand set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_qty=v_order_qty,buy_order_qty=v_buy_order_qty,sell_order_qty=v_sell_order_qty,comm_cancel_qty=v_comm_cancel_qty,comm_await_cancel_qty=v_comm_await_cancel_qty,comm_sum_status=v_comm_sum_status,comm_comple_date = v_comm_comple_date, comm_comple_time = v_comm_comple_time, max_comm_comple_date = v_max_comm_comple_date, max_comm_comple_time = v_max_comm_comple_time where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no and comm_executor = v_comm_executor;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.15.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 指令执行人=", v_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 指令执行人=", v_comm_executor);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_撤销指令订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_CancelCommOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_CancelCommOrder(
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
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_futu_acco varchar(16),
    IN p_contrc_code_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_hedge_type int,
    IN p_external_no bigint,
    IN p_pre_settle_price decimal(16,9),
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_order_qty decimal(18,2),
    IN p_order_dir int,
    IN p_trade_fee decimal(18,4),
    IN p_order_status varchar(2),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_wtdraw_batch_no int,
    IN p_wtdraw_remark varchar(255),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_report_fee decimal(18,4),
    IN p_wtdraw_fee decimal(18,4),
    IN p_rece_margin decimal(18,4),
    IN p_comm_id bigint,
    IN p_comm_cancel_qty decimal(18,2),
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_status varchar(2),
    IN p_contrc_dir int,
    IN p_exgp_long_rece_margin decimal(18,4),
    IN p_exgp_short_rece_margin decimal(18,4),
    IN p_asac_long_rece_margin decimal(18,4),
    IN p_asac_short_rece_margin decimal(18,4),
    IN p_lngsht_type int,
    IN p_comb_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_frozen_amt decimal(18,4),
    OUT p_wtdraw_status varchar(2),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_wtdraw_id bigint
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_hedge_type int;
    declare v_external_no bigint;
    declare v_pre_settle_price decimal(16,9);
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_order_qty decimal(18,2);
    declare v_order_dir int;
    declare v_trade_fee decimal(18,4);
    declare v_order_status varchar(2);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_remark varchar(255);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comm_id bigint;
    declare v_comm_cancel_qty decimal(18,2);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_contrc_dir int;
    declare v_exgp_long_rece_margin decimal(18,4);
    declare v_exgp_short_rece_margin decimal(18,4);
    declare v_asac_long_rece_margin decimal(18,4);
    declare v_asac_short_rece_margin decimal(18,4);
    declare v_lngsht_type int;
    declare v_comb_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_frozen_amt decimal(18,4);
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_wtdraw_id bigint;
    declare v_tmp_trade_fee decimal(18,4);
    declare v_tmp_rece_margin decimal(18,4);
    declare v_strike_margin decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_comm_margin decimal(18,4);
    declare v_pass_status varchar(2);
    declare v_rsp_info varchar(255);
    declare v_update_times int;
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
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
    declare v_trade_occur_amt decimal(18,4);
    declare v_strike_occur_amt decimal(18,4);
    declare v_trade_capt_amt_after decimal(18,4);
    declare v_posi_capt_amt_after decimal(18,4);
    declare v_comm_capt_amt_after decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_strike_capt_amt decimal(18,4);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_hedge_type = p_hedge_type;
    SET v_external_no = p_external_no;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_order_qty = p_order_qty;
    SET v_order_dir = p_order_dir;
    SET v_trade_fee = p_trade_fee;
    SET v_order_status = p_order_status;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_wtdraw_batch_no = p_wtdraw_batch_no;
    SET v_wtdraw_remark = p_wtdraw_remark;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_report_fee = p_report_fee;
    SET v_wtdraw_fee = p_wtdraw_fee;
    SET v_rece_margin = p_rece_margin;
    SET v_comm_id = p_comm_id;
    SET v_comm_cancel_qty = p_comm_cancel_qty;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_status = p_comm_status;
    SET v_contrc_dir = p_contrc_dir;
    SET v_exgp_long_rece_margin = p_exgp_long_rece_margin;
    SET v_exgp_short_rece_margin = p_exgp_short_rece_margin;
    SET v_asac_long_rece_margin = p_asac_long_rece_margin;
    SET v_asac_short_rece_margin = p_asac_short_rece_margin;
    SET v_lngsht_type = p_lngsht_type;
    SET v_comb_code = p_comb_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_frozen_amt = 0;
    SET v_wtdraw_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_wtdraw_id = 0;
    SET v_tmp_trade_fee = 0;
    SET v_tmp_rece_margin = 0;
    SET v_strike_margin = 0;
    SET v_strike_fee = 0;
    SET v_comm_margin = 0;
    SET v_pass_status = "0";
    SET v_rsp_info = " ";
    SET v_update_times = 1;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_comm_dir = 0;
    SET v_comm_qty = 0;
    SET v_calc_dir = 1;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
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
    SET v_trade_occur_amt = 0;
    SET v_strike_occur_amt = 0;
    SET v_trade_capt_amt_after = 0;
    SET v_posi_capt_amt_after = 0;
    SET v_comm_capt_amt_after = 0;
    SET v_trade_occur_qty = 0;
    SET v_strike_capt_amt = 0;
    SET v_exgp_avail_qty = 0;
    SET v_asac_avail_qty = 0;

    
    label_pro:BEGIN
    

    /* set @临时_交易费用#=@交易费用#; */
    set v_tmp_trade_fee=v_trade_fee;

    /* set @临时_应收保证金#=@应收保证金#; */
    set v_tmp_rece_margin=v_rece_margin;

    /* set @成交保证金#=0; */
    set v_strike_margin=0;

    /* set @成交费用#=0; */
    set v_strike_fee=0;

    /* set @指令保证金# = 0; */
    set v_comm_margin = 0;

    /* if @订单状态# <> 《订单状态-未报》  then */
    if v_order_status <> "1"  then
        #非未报订单,只修改订单状态

        /* set @订单状态#=《订单状态-待撤》; */
        set v_order_status="3";

        /* set @撤单状态#=《撤单状态-未报》; */
        set v_wtdraw_status="1";
        #需主推，直接更新状态为已报

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
            SET v_error_code = "tdfutuA.3.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_公用_获取通道状态出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* if @通道状态#=《通道状态-正常》 then */
        if v_pass_status="1" then

            /* set @撤单状态#=《撤单状态-已报》; */
            set v_wtdraw_status="2";
        end if;

        /* set @回报信息# = ' '; */
        set v_rsp_info = ' ';

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
            SET v_error_code = "tdfutuA.3.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_更新订单状态出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


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
            SET v_error_code = "tdfutuA.3.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_撤销订单出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    else
        #未报撤单处理逻辑

        /* set @订单状态#=《订单状态-已撤》; */
        set v_order_status="4";

        /* set @撤单状态#=《撤单状态-成功》; */
        set v_wtdraw_status="3";

        /* set @撤单数量# = @订单数量#; */
        set v_wtdraw_qty = v_order_qty;
        #更新指令表

        /* if @指令序号#>0 then */
        if v_comm_id>0 then

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
                SET v_error_code = "tdfutuA.3.16.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_撤销更新指令出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

            #计算指令变动金额

            /* set @指令方向# = @订单方向#; */
            set v_comm_dir = v_order_dir;

            /* set @指令数量# = @撤单数量#; */
            set v_comm_qty = v_wtdraw_qty;

            /* set @计算方向# = 《计算方向-加上》; */
            set v_calc_dir = 1;

            /* 调用【原子_交易期货_指令_计算撤单指令变动金额和数量】*/
            call db_tdfutu.pra_tdfuap_GetCancelCommOccurAmtAndQty(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_limit_actual_price,
                v_wtdraw_qty,
                v_comm_status,
                v_contrc_dir,
                v_calc_dir,
                v_error_code,
                v_error_info,
                v_comm_occur_amt,
                v_comm_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdfutuA.3.16.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算撤单指令变动金额和数量出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        end if;

        /* set @交易佣金# = 0; */
        set v_trade_commis = 0;

        /* set @申报费用# = 0; */
        set v_report_fee = 0;

        /* set @撤单费用# = 0; */
        set v_wtdraw_fee = 0;

        /* set @交易费用# = 0; */
        set v_trade_fee = 0;

        /* set @其他佣金# = 0; */
        set v_other_commis = 0;

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
            SET v_error_code = "tdfutuA.3.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_撤销订单出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
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
              SET v_error_code = "tdfutuA.3.16.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_锁定获取保证金优惠信息出现错误！',v_mysql_message);
              end if;
              leave label_pro;
          elseif v_error_code <> "0" then
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
              SET v_error_code = "tdfutuA.3.16.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_计算实收保证金出现错误！',v_mysql_message);
              end if;
              leave label_pro;
          elseif v_error_code <> "0" then
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

        /* set @交易变动数量# = @计算方向# * @订单数量#; */
        set v_trade_occur_qty = v_calc_dir * v_order_qty;
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
              SET v_error_code = "tdfutuA.3.16.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新保证金优惠信息出现错误！',v_mysql_message);
              end if;
              leave label_pro;
          elseif v_error_code <> "0" then
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
              SET v_error_code = "tdfutuA.3.16.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_获取更新产品保证金优惠信息出现错误！',v_mysql_message);
              end if;
              leave label_pro;
          elseif v_error_code <> "0" then
              leave label_pro;
          end if;

        end if;
        #平仓下单时,交易占用金额没有处理,因此撤单时也不进行处理

        /* if @开平方向# <> 《开平方向-开仓》 then */
        if v_contrc_dir <> 1 then

          /* set @交易变动金额#=0; */
          set v_trade_occur_amt=0;
        end if;
        #交易资金持仓处理

        /* 调用【原子_交易期货_账户_更新交易资金】*/
        call db_tdfutu.pra_tdfuac_UpdateTradeCapit(
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
            SET v_error_code = "tdfutuA.3.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新交易资金出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


         /* set  @交易组可用数量# =0; */
         set  v_exgp_avail_qty =0;

         /* set  @资产账户可用数量# =0; */
         set  v_asac_avail_qty =0;

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
            SET v_error_code = "tdfutuA.3.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_更新交易持仓出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_frozen_amt = v_frozen_amt;
    SET p_wtdraw_status = v_wtdraw_status;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_wtdraw_id = v_wtdraw_id;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_计算撤单指令变动金额和数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_GetCancelCommOccurAmtAndQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_GetCancelCommOccurAmtAndQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_limit_actual_price decimal(16,9),
    IN p_wtdraw_qty decimal(18,2),
    IN p_comm_status varchar(2),
    IN p_contrc_dir int,
    IN p_calc_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_occur_amt decimal(18,4),
    OUT p_comm_occur_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_limit_actual_price decimal(16,9);
    declare v_wtdraw_qty decimal(18,2);
    declare v_comm_status varchar(2);
    declare v_contrc_dir int;
    declare v_calc_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);

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
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_comm_status = p_comm_status;
    SET v_contrc_dir = p_contrc_dir;
    SET v_calc_dir = p_calc_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;

    
    label_pro:BEGIN
    
    #指令冻结金额获取

    /* set @指令变动金额#=0; */
    set v_comm_occur_amt=0;

    /* set @指令变动数量#=0; */
    set v_comm_occur_qty=0;
    #指令是待撤销、部分撤销、全部撤销 订单撤销时，不需要再将指令相关金额与数量回退到资金持仓表

    /* [检查正常返回][@指令状态# = 《指令状态-待撤销》 or @指令状态# = 《指令状态-部分撤销》 or @指令状态# = 《指令状态-全部撤销》 ] */
    if v_comm_status = "4" or v_comm_status = "5" or v_comm_status = "6"  then
        leave label_pro;
    end if;


    /* set @指令变动数量# = @撤单数量#; */
    set v_comm_occur_qty = v_wtdraw_qty;

    /* set @指令变动金额#=@指令实际限价# * @指令变动数量#; */
    set v_comm_occur_amt=v_limit_actual_price * v_comm_occur_qty;

    /* set @指令变动金额#=Round(@计算方向# * @指令变动金额#,2); */
    set v_comm_occur_amt=Round(v_calc_dir * v_comm_occur_amt,2);

    /* set @指令变动数量#=@计算方向# * @指令变动数量#; */
    set v_comm_occur_qty=v_calc_dir * v_comm_occur_qty;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_occur_amt = v_comm_occur_amt;
    SET p_comm_occur_qty = v_comm_occur_qty;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_获取指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_GetComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_GetComm(
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_func_code varchar(16);
    declare v_pass_no int;
    declare v_out_acco varchar(32);

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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易期货_指令_指令表][字段][字段变量][{记录序号}=@指令序号#][4][@指令序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, strike_amt, strike_qty, 
        comm_frozen_qty, rece_margin, capit_reback_days, posi_reback_days, 
        strike_status, comm_status, comm_begin_date, comm_end_date, 
        comm_begin_time, comm_end_time, comm_comple_date, comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_status, comm_appr_oper_no, 
        comm_appr_oper, comm_appr_remark, external_no, comb_code, 
        comm_oper_way, comm_comple_flag, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_code, v_contrc_type, v_asset_type, 
        v_contrc_dir, v_hedge_type, v_comm_date, v_comm_time, 
        v_comm_batch_no, v_comm_opor, v_comm_executor, v_comm_dir, 
        v_comm_limit_price, v_limit_actual_price, v_comm_qty, v_comm_amt, 
        v_order_qty, v_comm_cancel_qty, v_strike_amt, v_strike_qty, 
        v_comm_frozen_qty, v_rece_margin, v_capit_reback_days, v_posi_reback_days, 
        v_strike_status, v_comm_status, v_comm_begin_date, v_comm_end_date, 
        v_comm_begin_time, v_comm_end_time, v_comm_comple_date, v_comm_comple_time, 
        v_comm_appr_date, v_comm_appr_time, v_comm_appr_status, v_comm_appr_oper_no, 
        v_comm_appr_oper, v_comm_appr_remark, v_external_no, v_comb_code, 
        v_comm_oper_way, v_comm_comple_flag, v_remark_info from db_tdfutu.tb_tdfuap_command where row_id=v_comm_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.18.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
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

# 原子_交易期货_指令_获取指令汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_GetSumComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_GetSumComm(
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_func_code varchar(16);
    declare v_pass_no int;
    declare v_out_acco varchar(32);

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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易期货_指令_指令汇总表][字段][字段变量][{指令日期}=@指令日期# and {机构编号} = @机构编号# and {指令批号} = @指令批号# and {指令执行人} = @指令执行人#][4][@指令日期#,@机构编号#,@指令批号#,@指令执行人#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, comm_await_cancel_qty, strike_amt, 
        strike_qty, strike_status, rece_margin, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        buy_order_qty, sell_order_qty, buy_comm_qty, sell_comm_qty, 
        buy_strike_qty, sell_strike_qty, buy_strike_amt, sell_strike_amt, 
        buy_comm_amt, sell_comm_amt, comm_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_code, v_contrc_type, v_asset_type, 
        v_contrc_dir, v_hedge_type, v_comm_date, v_comm_time, 
        v_comm_batch_no, v_comm_opor, v_comm_executor, v_comm_dir, 
        v_comm_limit_price, v_limit_actual_price, v_comm_qty, v_comm_amt, 
        v_order_qty, v_comm_cancel_qty, v_comm_await_cancel_qty, v_strike_amt, 
        v_strike_qty, v_strike_status, v_rece_margin, v_comm_sum_status, 
        v_comm_begin_date, v_comm_end_date, v_comm_begin_time, v_comm_end_time, 
        v_comm_comple_date, v_comm_comple_time, v_max_comm_comple_date, v_max_comm_comple_time, 
        v_comm_appr_date, v_comm_appr_time, v_comm_appr_qty, v_comm_sum_approve_status, 
        v_buy_order_qty, v_sell_order_qty, v_buy_comm_qty, v_sell_comm_qty, 
        v_buy_strike_qty, v_sell_strike_qty, v_buy_strike_amt, v_sell_strike_amt, 
        v_buy_comm_amt, v_sell_comm_amt, v_comm_oper_way from db_tdfutu.tb_tdfuap_sumcommand where comm_date=v_comm_date and co_no = v_co_no and comm_batch_no = v_comm_batch_no and comm_executor = v_comm_executor limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.19.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,",","机构编号=",v_co_no,",","指令批号=",v_comm_batch_no,",","指令执行人=",v_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令日期=",v_comm_date,",","机构编号=",v_co_no,",","指令批号=",v_comm_batch_no,",","指令执行人=",v_comm_executor);
        end if;
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

# 原子_交易期货_指令_锁定获取指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_LockGetComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_LockGetComm(
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
    declare v_rece_margin decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_func_code varchar(16);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_comm_comple_flag int;

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
    SET v_rece_margin = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_comm_comple_flag = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][交易期货_指令_指令表][字段][字段变量][{记录序号}=@指令序号#][4][@指令序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, strike_amt, strike_qty, 
        comm_frozen_qty, rece_margin, capit_reback_days, posi_reback_days, 
        strike_status, comm_status, comm_begin_date, comm_end_date, 
        comm_begin_time, comm_end_time, comm_comple_date, comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_status, comm_appr_oper_no, 
        comm_appr_oper, comm_appr_remark, external_no, comb_code, 
        comm_oper_way, comm_comple_flag, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_code, v_contrc_type, v_asset_type, 
        v_contrc_dir, v_hedge_type, v_comm_date, v_comm_time, 
        v_comm_batch_no, v_comm_opor, v_comm_executor, v_comm_dir, 
        v_comm_limit_price, v_limit_actual_price, v_comm_qty, v_comm_amt, 
        v_order_qty, v_comm_cancel_qty, v_strike_amt, v_strike_qty, 
        v_comm_frozen_qty, v_rece_margin, v_capit_reback_days, v_posi_reback_days, 
        v_strike_status, v_comm_status, v_comm_begin_date, v_comm_end_date, 
        v_comm_begin_time, v_comm_end_time, v_comm_comple_date, v_comm_comple_time, 
        v_comm_appr_date, v_comm_appr_time, v_comm_appr_status, v_comm_appr_oper_no, 
        v_comm_appr_oper, v_comm_appr_remark, v_external_no, v_comb_code, 
        v_comm_oper_way, v_comm_comple_flag, v_remark_info from db_tdfutu.tb_tdfuap_command where row_id=v_comm_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.20.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
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
    SET p_rece_margin = v_rece_margin;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_分发指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_DispComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_DispComm(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_asset_type int,
    IN p_comm_date int,
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_comm_dir int,
    IN p_comm_status varchar(2),
    IN p_comm_executor int,
    IN p_disp_flag int,
    IN p_disp_remark varchar(255),
    IN p_before_comm_executor int,
    IN p_is_withdraw int,
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_comm_date int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_dir int;
    declare v_comm_status varchar(2);
    declare v_comm_executor int;
    declare v_disp_flag int;
    declare v_disp_remark varchar(255);
    declare v_before_comm_executor int;
    declare v_is_withdraw int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_disp_time int;
    declare v_disp_date int;
    declare v_oper_func_code varchar(16);
    declare v_remark_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_contrc_code varchar(6);
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_comm_time int;
    declare v_comm_opor int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_strike_status varchar(2);
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
    declare v_comm_comple_flag int;
    declare v_comm_appr_qty decimal(18,2);

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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_asset_type = p_asset_type;
    SET v_comm_date = p_comm_date;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_dir = p_comm_dir;
    SET v_comm_status = p_comm_status;
    SET v_comm_executor = p_comm_executor;
    SET v_disp_flag = p_disp_flag;
    SET v_disp_remark = p_disp_remark;
    SET v_before_comm_executor = p_before_comm_executor;
    SET v_is_withdraw = p_is_withdraw;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_disp_time = date_format(curtime(),'%H%i%s');
    SET v_disp_date = date_format(curdate(),'%Y%m%d');
    SET v_oper_func_code = " ";
    SET v_remark_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_contrc_code = " ";
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_opor = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_comm_frozen_qty = 0;
    SET v_rece_margin = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_strike_status = "0";
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
    SET v_comm_comple_flag = 0;
    SET v_comm_appr_qty = 0;

    
    label_pro:BEGIN
    

    /* [获取机器时间][@分发时间#] */
    select date_format(curtime(),'%H%i%s') into v_disp_time;


    /* set @分发日期# = @初始化日期#; */
    set v_disp_date = v_init_date;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @备注信息#=" "; */
    set v_remark_info=" ";

    /* [更新表记录][交易期货_指令_指令表][{指令执行人}=@指令执行人#][{记录序号}=@指令序号#][2][@指令序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfuap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, comm_executor=v_comm_executor where row_id=v_comm_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.21.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
        leave label_pro;
    end if;

    #获取指令信息，检查指令状态

    /* [获取表记录变量][交易期货_指令_指令表][字段][字段变量][{记录序号}=@指令序号#][1][@指令序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, strike_amt, strike_qty, 
        comm_frozen_qty, rece_margin, capit_reback_days, posi_reback_days, 
        strike_status, comm_status, comm_begin_date, comm_end_date, 
        comm_begin_time, comm_end_time, comm_comple_date, comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_status, comm_appr_oper_no, 
        comm_appr_oper, comm_appr_remark, external_no, comb_code, 
        comm_oper_way, comm_comple_flag, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_code, v_contrc_type, v_asset_type, 
        v_contrc_dir, v_hedge_type, v_comm_date, v_comm_time, 
        v_comm_batch_no, v_comm_opor, v_comm_executor, v_comm_dir, 
        v_comm_limit_price, v_limit_actual_price, v_comm_qty, v_comm_amt, 
        v_order_qty, v_comm_cancel_qty, v_strike_amt, v_strike_qty, 
        v_comm_frozen_qty, v_rece_margin, v_capit_reback_days, v_posi_reback_days, 
        v_strike_status, v_comm_status, v_comm_begin_date, v_comm_end_date, 
        v_comm_begin_time, v_comm_end_time, v_comm_comple_date, v_comm_comple_time, 
        v_comm_appr_date, v_comm_appr_time, v_comm_appr_status, v_comm_appr_oper_no, 
        v_comm_appr_oper, v_comm_appr_remark, v_external_no, v_comb_code, 
        v_comm_oper_way, v_comm_comple_flag, v_remark_info from db_tdfutu.tb_tdfuap_command where row_id=v_comm_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
        leave label_pro;
    end if;


    /* set @分发日期# = @初始化日期#; */
    set v_disp_date = v_init_date;

    /* [插入表记录][交易期货_指令_指令分发表][字段][字段变量][1][@指令序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdfutu.tb_tdfuap_dispense(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, futu_acco_no, 
        contrc_code_no, contrc_type, comm_date, comm_id, 
        comm_batch_no, comm_dir, comm_status, disp_date, 
        disp_time, comm_opor, before_comm_executor, comm_executor, 
        is_withdraw, disp_flag, disp_remark) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_type, v_comm_date, v_comm_id, 
        v_comm_batch_no, v_comm_dir, v_comm_status, v_disp_date, 
        v_disp_time, v_comm_opor, v_before_comm_executor, v_comm_executor, 
        v_is_withdraw, v_disp_flag, v_disp_remark);
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.21.1";
        SET v_error_info =  CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* if @指令审批状态# <> 《指令审批状态-未审批》 then */
    if v_comm_appr_status <> "1" then

        /* set @指令审批数量# = @指令数量#; */
        set v_comm_appr_qty = v_comm_qty;
    end if;

    /* 调用【原子_交易期货_指令_分发更新原汇总指令】*/
    call db_tdfutu.pra_tdfuap_DispUpdateOrgBatchComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_date,
        v_co_no,
        v_comm_batch_no,
        v_comm_executor,
        v_comm_qty,
        v_comm_amt,
        v_order_qty,
        v_comm_cancel_qty,
        v_strike_amt,
        v_strike_qty,
        v_comm_status,
        v_strike_status,
        v_comm_appr_status,
        v_before_comm_executor,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_分发更新原汇总指令出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #这里需要更新一下转发后的指令

    /* 调用【原子_交易期货_指令_指令更新汇总指令】*/
    call db_tdfutu.pra_tdfuap_CommUpdateSumComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_oper_func_code,
        v_init_date,
        v_comm_date,
        v_comm_time,
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
        v_contrc_dir,
        v_hedge_type,
        v_asset_type,
        v_comm_opor,
        v_comm_executor,
        v_comm_batch_no,
        v_comm_dir,
        v_comm_limit_price,
        v_limit_actual_price,
        v_comm_qty,
        v_comm_amt,
        v_order_qty,
        v_comm_cancel_qty,
        v_strike_amt,
        v_strike_qty,
        v_comm_appr_qty,
        v_comm_begin_date,
        v_comm_end_date,
        v_comm_begin_time,
        v_comm_end_time,
        v_strike_status,
        v_comm_status,
        v_comm_appr_status,
        v_comm_oper_way,
        v_rece_margin,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_指令更新汇总指令出现错误！',v_mysql_message);
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

# 原子_交易期货_指令_分发更新原汇总指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_DispUpdateOrgBatchComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_DispUpdateOrgBatchComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_date int,
    IN p_co_no int,
    IN p_comm_batch_no int,
    IN p_comm_executor int,
    IN p_comm_qty decimal(18,2),
    IN p_comm_amt decimal(18,4),
    IN p_order_qty decimal(18,2),
    IN p_comm_cancel_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_qty decimal(18,2),
    IN p_comm_status varchar(2),
    IN p_strike_status varchar(2),
    IN p_comm_appr_status varchar(2),
    IN p_before_comm_executor int,
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
    declare v_co_no int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_comm_status varchar(2);
    declare v_strike_status varchar(2);
    declare v_comm_appr_status varchar(2);
    declare v_before_comm_executor int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_comm_executor int;
    declare v_tmp_comm_date int;
    declare v_tmp_co_no int;
    declare v_tmp_comm_batch_no int;
    declare v_tmp_comm_qty decimal(18,2);
    declare v_tmp_comm_amt decimal(18,4);
    declare v_tmp_order_qty decimal(18,2);
    declare v_tmp_comm_cancel_qty decimal(18,2);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_comm_status varchar(2);
    declare v_tmp_strike_status varchar(2);
    declare v_tmp_comm_appr_status varchar(2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    declare v_comm_await_cancel_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
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
    declare v_comm_oper_way varchar(2);
    declare v_tmp_pd_no int;
    declare v_tmp_exch_group_no int;
    declare v_tmp_asset_acco_no int;
    declare v_tmp_pass_no int;
    declare v_tmp_contrc_code_no int;
    declare v_stock_code varchar(6);
    declare v_tmp_target_code_no int;
    declare v_target_code_no int;
    declare v_tmp_trade_code_no int;
    declare v_trade_code_no int;
    declare v_tmp_stock_type int;
    declare v_stock_type int;
    declare v_tmp_asset_type int;
    declare v_tmp_comm_time int;
    declare v_tmp_comm_opor int;
    declare v_tmp_comm_limit_price decimal(16,9);
    declare v_tmp_limit_actual_price decimal(16,9);
    declare v_tmp_net_price_flag int;
    declare v_net_price_flag int;
    declare v_tmp_par_value decimal(16,9);
    declare v_par_value decimal(16,9);
    declare v_tmp_impawn_ratio decimal(18,12);
    declare v_impawn_ratio decimal(18,12);
    declare v_tmp_intrst_days int;
    declare v_intrst_days int;
    declare v_tmp_bond_accr_intrst decimal(18,12);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_tmp_bond_rate_type int;
    declare v_bond_rate_type int;
    declare v_tmp_exter_comm_flag int;
    declare v_exter_comm_flag int;
    declare v_record_count int;
    declare v_tmp_comm_comple_date int;
    declare v_tmp_comm_comple_time int;

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
    SET v_co_no = p_co_no;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_qty = p_comm_qty;
    SET v_comm_amt = p_comm_amt;
    SET v_order_qty = p_order_qty;
    SET v_comm_cancel_qty = p_comm_cancel_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_qty = p_strike_qty;
    SET v_comm_status = p_comm_status;
    SET v_strike_status = p_strike_status;
    SET v_comm_appr_status = p_comm_appr_status;
    SET v_before_comm_executor = p_before_comm_executor;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_comm_executor = 0;
    SET v_tmp_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_co_no = 0;
    SET v_tmp_comm_batch_no = 0;
    SET v_tmp_comm_qty = 0;
    SET v_tmp_comm_amt = 0;
    SET v_tmp_order_qty = 0;
    SET v_tmp_comm_cancel_qty = 0;
    SET v_tmp_strike_amt = 0;
    SET v_tmp_strike_qty = 0;
    SET v_tmp_comm_status = "0";
    SET v_tmp_strike_status = "0";
    SET v_tmp_comm_appr_status = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
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
    SET v_comm_await_cancel_qty = 0;
    SET v_rece_margin = 0;
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
    SET v_comm_oper_way = " ";
    SET v_tmp_pd_no = 0;
    SET v_tmp_exch_group_no = 0;
    SET v_tmp_asset_acco_no = 0;
    SET v_tmp_pass_no = 0;
    SET v_tmp_contrc_code_no = 0;
    SET v_stock_code = " ";
    SET v_tmp_target_code_no = 0;
    SET v_target_code_no = 0;
    SET v_tmp_trade_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_tmp_stock_type = 0;
    SET v_stock_type = 0;
    SET v_tmp_asset_type = 0;
    SET v_tmp_comm_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_comm_opor = 0;
    SET v_tmp_comm_limit_price = 0;
    SET v_tmp_limit_actual_price = 0;
    SET v_tmp_net_price_flag = 0;
    SET v_net_price_flag = 0;
    SET v_tmp_par_value = 0;
    SET v_par_value = 0;
    SET v_tmp_impawn_ratio = 0;
    SET v_impawn_ratio = 0;
    SET v_tmp_intrst_days = 0;
    SET v_intrst_days = 0;
    SET v_tmp_bond_accr_intrst = 0;
    SET v_bond_accr_intrst = 0;
    SET v_tmp_bond_rate_type = 0;
    SET v_bond_rate_type = 0;
    SET v_tmp_exter_comm_flag = 0;
    SET v_exter_comm_flag = 0;
    SET v_record_count = 0;
    SET v_tmp_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_comm_comple_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [检查正常返回][@指令批号# <= 0] */
    if v_comm_batch_no <= 0 then
        leave label_pro;
    end if;


    /* set @临时_指令执行人#= @指令执行人#; */
    set v_tmp_comm_executor= v_comm_executor;

    /* set @临时_指令日期#= @指令日期#; */
    set v_tmp_comm_date= v_comm_date;

    /* set @临时_机构编号#= @机构编号#; */
    set v_tmp_co_no= v_co_no;

    /* set @临时_指令批号#= @指令批号#; */
    set v_tmp_comm_batch_no= v_comm_batch_no;

    /* set @临时_指令数量# = @指令数量#; */
    set v_tmp_comm_qty = v_comm_qty;

    /* set @临时_指令金额# = @指令金额#; */
    set v_tmp_comm_amt = v_comm_amt;

    /* set @临时_订单数量# = @订单数量#; */
    set v_tmp_order_qty = v_order_qty;

    /* set @临时_指令撤销数量# = @指令撤销数量#; */
    set v_tmp_comm_cancel_qty = v_comm_cancel_qty;

    /* set @临时_成交金额# = @成交金额#; */
    set v_tmp_strike_amt = v_strike_amt;

    /* set @临时_成交数量# = @成交数量#; */
    set v_tmp_strike_qty = v_strike_qty;

    /* set @临时_指令状态# = @指令状态#; */
    set v_tmp_comm_status = v_comm_status;

    /* set @临时_成交状态# = @成交状态#; */
    set v_tmp_strike_status = v_strike_status;

    /* set @临时_指令审批状态# = @指令审批状态#; */
    set v_tmp_comm_appr_status = v_comm_appr_status;

    /* [锁定获取表记录变量][交易期货_指令_指令汇总表][字段][字段变量][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号# and {指令执行人} = @前指令执行人#][1][@指令日期#, @机构编号#, @指令批号#, @前指令执行人#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, comm_await_cancel_qty, strike_amt, 
        strike_qty, strike_status, rece_margin, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        buy_order_qty, sell_order_qty, buy_comm_qty, sell_comm_qty, 
        buy_strike_qty, sell_strike_qty, buy_strike_amt, sell_strike_amt, 
        buy_comm_amt, sell_comm_amt, comm_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_code, v_contrc_type, v_asset_type, 
        v_contrc_dir, v_hedge_type, v_comm_date, v_comm_time, 
        v_comm_batch_no, v_comm_opor, v_comm_executor, v_comm_dir, 
        v_comm_limit_price, v_limit_actual_price, v_comm_qty, v_comm_amt, 
        v_order_qty, v_comm_cancel_qty, v_comm_await_cancel_qty, v_strike_amt, 
        v_strike_qty, v_strike_status, v_rece_margin, v_comm_sum_status, 
        v_comm_begin_date, v_comm_end_date, v_comm_begin_time, v_comm_end_time, 
        v_comm_comple_date, v_comm_comple_time, v_max_comm_comple_date, v_max_comm_comple_time, 
        v_comm_appr_date, v_comm_appr_time, v_comm_appr_qty, v_comm_sum_approve_status, 
        v_buy_order_qty, v_sell_order_qty, v_buy_comm_qty, v_sell_comm_qty, 
        v_buy_strike_qty, v_sell_strike_qty, v_buy_strike_amt, v_sell_strike_amt, 
        v_buy_comm_amt, v_sell_comm_amt, v_comm_oper_way from db_tdfutu.tb_tdfuap_sumcommand where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no and comm_executor = v_before_comm_executor limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.22.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 前指令执行人=", v_before_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 前指令执行人=", v_before_comm_executor);
        end if;
        leave label_pro;
    end if;


    /* set @指令数量# = @指令数量# - @临时_指令数量#; */
    set v_comm_qty = v_comm_qty - v_tmp_comm_qty;

    /* set @指令金额# = @指令金额# - @临时_指令金额#; */
    set v_comm_amt = v_comm_amt - v_tmp_comm_amt;

    /* set @订单数量# = @订单数量# - @临时_订单数量#; */
    set v_order_qty = v_order_qty - v_tmp_order_qty;

    /* set @指令撤销数量# = @指令撤销数量# - @临时_指令撤销数量#; */
    set v_comm_cancel_qty = v_comm_cancel_qty - v_tmp_comm_cancel_qty;

    /* set @成交金额# = @成交金额# - @临时_成交金额#; */
    set v_strike_amt = v_strike_amt - v_tmp_strike_amt;

    /* set @成交数量# = @成交数量# - @临时_成交数量#; */
    set v_strike_qty = v_strike_qty - v_tmp_strike_qty;

    /* if @临时_指令状态# = 《指令状态-待撤销》 or @临时_指令状态# = 《指令状态-部分撤销》 or @临时_指令状态# = 《指令状态-全部撤销》 then */
    if v_tmp_comm_status = "4" or v_tmp_comm_status = "5" or v_tmp_comm_status = "6" then

        /* set @指令待撤销数量# = @指令待撤销数量# - (@临时_指令数量#-@临时_指令撤销数量#-@临时_成交数量#); */
        set v_comm_await_cancel_qty = v_comm_await_cancel_qty - (v_tmp_comm_qty-v_tmp_comm_cancel_qty-v_tmp_strike_qty);
    end if;

    /* if @临时_指令审批状态# <> 《指令审批状态-未审批》 then */
    if v_tmp_comm_appr_status <> "1" then

        /* set @指令审批数量# = @指令审批数量# - @临时_指令数量#; */
        set v_comm_appr_qty = v_comm_appr_qty - v_tmp_comm_qty;
    end if;
    #计算分类项数据

    /* if @开平方向# = 《开平方向-开仓》  then */
    if v_contrc_dir = 1  then

        /* set @买入指令数量# = @买入指令数量# - @临时_指令数量#; */
        set v_buy_comm_qty = v_buy_comm_qty - v_tmp_comm_qty;

        /* set @买入指令金额# = @买入指令金额# - @临时_指令金额#; */
        set v_buy_comm_amt = v_buy_comm_amt - v_tmp_comm_amt;

        /* set @买入订单数量# = @买入订单数量# - @临时_订单数量#; */
        set v_buy_order_qty = v_buy_order_qty - v_tmp_order_qty;

        /* set @买入成交金额# = @买入成交金额# - @临时_成交金额#; */
        set v_buy_strike_amt = v_buy_strike_amt - v_tmp_strike_amt;

        /* set @买入成交数量# = @买入成交数量# - @临时_成交数量#; */
        set v_buy_strike_qty = v_buy_strike_qty - v_tmp_strike_qty;
    else

        /* set @卖出指令数量# = @卖出指令数量# - @临时_指令数量#; */
        set v_sell_comm_qty = v_sell_comm_qty - v_tmp_comm_qty;

        /* set @卖出指令金额# = @卖出指令金额# - @临时_指令金额#; */
        set v_sell_comm_amt = v_sell_comm_amt - v_tmp_comm_amt;

        /* set @卖出订单数量# = @卖出订单数量# - @临时_订单数量#; */
        set v_sell_order_qty = v_sell_order_qty - v_tmp_order_qty;

        /* set @卖出成交金额# = @卖出成交金额# - @临时_成交金额#; */
        set v_sell_strike_amt = v_sell_strike_amt - v_tmp_strike_amt;

        /* set @卖出成交数量# = @卖出成交数量# - @临时_成交数量#; */
        set v_sell_strike_qty = v_sell_strike_qty - v_tmp_strike_qty;
    end if;

    /* [获取表记录变量][交易期货_指令_指令表][ifnull(min({指令开始日期}),0),ifnull(max({指令结束日期}),0),ifnull(min({指令开始时间}),0),ifnull(max({指令结束时间}),0),ifnull(min({指令完成日期}),0),ifnull(min({指令完成时间}),0),ifnull(max({指令完成日期}),0),ifnull(max({指令完成时间}),0),ifnull(max({指令审批日期}),0),ifnull(max({指令审批时间}),0),ifnull(sum({产品编号}),0),ifnull({产品编号},0),ifnull(sum({交易组编号}),0),ifnull({交易组编号},0),ifnull(sum({资产账户编号}),0),ifnull({资产账户编号},0),ifnull(sum({通道编号}),0),ifnull({通道编号},0),ifnull({外部账号}," "),ifnull({交易币种},"CNY"),ifnull({市场编号},0),ifnull(sum({合约代码编号}),0),ifnull({合约代码编号},0),ifnull({证券代码}," "),ifnull(sum({标的代码编号}),0), ifnull({标的代码编号},0),ifnull(sum({交易代码编号}),0),ifnull({交易代码编号},0),ifnull(sum({证券类型}),0),ifnull({证券类型},0),ifnull(sum({资产类型}),0),ifnull({资产类型},0),ifnull(sum({指令时间}),0),ifnull({指令时间},0),ifnull(sum({指令下达人}),0),ifnull({指令下达人},0),ifnull(sum({指令限价}),0),ifnull({指令限价},0),ifnull(sum({指令实际限价}),0),ifnull({指令实际限价},0),ifnull(sum({净价标志}),0),ifnull({净价标志},0),ifnull(sum({票面面值}),0),ifnull({票面面值},0),ifnull(sum({质押比例}),0),ifnull({质押比例},0),ifnull(sum({计息天数}),0),ifnull({计息天数},0),ifnull(sum({债券计提利息}),0),ifnull({债券计提利息},0),ifnull(sum({债券利率类型}),0),ifnull({债券利率类型},0),ifnull(sum({体外指令标志}),0),ifnull({体外指令标志},0),count(*)][@指令开始日期#, @指令结束日期#, @指令开始时间#,@指令结束时间#,@指令完成日期#,@指令完成时间#,@指令最大完成日期#,@指令最大完成时间#,@指令审批日期#,@指令审批时间#,@临时_产品编号#,@产品编号#,@临时_交易组编号#,@交易组编号#,@临时_资产账户编号#,@资产账户编号#,@临时_通道编号#,@通道编号#,@外部账号#,@交易币种#,@市场编号#,@临时_合约代码编号#,@合约代码编号#,@证券代码#,@临时_标的代码编号#, @标的代码编号#,@临时_交易代码编号#,@交易代码编号#,@临时_证券类型#,@证券类型#,@临时_资产类型#,@资产类型#,@临时_指令时间#,@指令时间#,@临时_指令下达人#,@指令下达人#,@临时_指令限价#,@指令限价#,@临时_指令实际限价#,@指令实际限价#,@临时_净价标志#,@净价标志#,@临时_票面面值#,@票面面值#,@临时_质押比例#,@质押比例#,@临时_计息天数#,@计息天数#,@临时_债券计提利息#,@债券计提利息#,@临时_债券利率类型#,@债券利率类型#,@临时_体外指令标志#,@体外指令标志#,@记录个数#][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号# and {指令执行人} = @前指令执行人#][1][@指令日期#, @机构编号#, @指令批号#, @前指令执行人#] */
    select ifnull(min(comm_begin_date),0),ifnull(max(comm_end_date),0),ifnull(min(comm_begin_time),0),ifnull(max(comm_end_time),0),ifnull(min(comm_comple_date),0),ifnull(min(comm_comple_time),0),ifnull(max(comm_comple_date),0),ifnull(max(comm_comple_time),0),ifnull(max(comm_appr_date),0),ifnull(max(comm_appr_time),0),ifnull(sum(pd_no),0),ifnull(pd_no,0),ifnull(sum(exch_group_no),0),ifnull(exch_group_no,0),ifnull(sum(asset_acco_no),0),ifnull(asset_acco_no,0),ifnull(sum(pass_no),0),ifnull(pass_no,0),ifnull(out_acco," "),ifnull(exch_crncy_type,"CNY"),ifnull(exch_no,0),ifnull(sum(contrc_code_no),0),ifnull(contrc_code_no,0),ifnull(stock_code," "),ifnull(sum(target_code_no),0), ifnull(target_code_no,0),ifnull(sum(trade_code_no),0),ifnull(trade_code_no,0),ifnull(sum(stock_type),0),ifnull(stock_type,0),ifnull(sum(asset_type),0),ifnull(asset_type,0),ifnull(sum(comm_time),0),ifnull(comm_time,0),ifnull(sum(comm_opor),0),ifnull(comm_opor,0),ifnull(sum(comm_limit_price),0),ifnull(comm_limit_price,0),ifnull(sum(limit_actual_price),0),ifnull(limit_actual_price,0),ifnull(sum(net_price_flag),0),ifnull(net_price_flag,0),ifnull(sum(par_value),0),ifnull(par_value,0),ifnull(sum(impawn_ratio),0),ifnull(impawn_ratio,0),ifnull(sum(intrst_days),0),ifnull(intrst_days,0),ifnull(sum(bond_accr_intrst),0),ifnull(bond_accr_intrst,0),ifnull(sum(bond_rate_type),0),ifnull(bond_rate_type,0),ifnull(sum(exter_comm_flag),0),ifnull(exter_comm_flag,0),count(*) into v_comm_begin_date, v_comm_end_date, v_comm_begin_time,v_comm_end_time,v_comm_comple_date,v_comm_comple_time,v_max_comm_comple_date,v_max_comm_comple_time,v_comm_appr_date,v_comm_appr_time,v_tmp_pd_no,v_pd_no,v_tmp_exch_group_no,v_exch_group_no,v_tmp_asset_acco_no,v_asset_acco_no,v_tmp_pass_no,v_pass_no,v_out_acco,v_exch_crncy_type,v_exch_no,v_tmp_contrc_code_no,v_contrc_code_no,v_stock_code,v_tmp_target_code_no, v_target_code_no,v_tmp_trade_code_no,v_trade_code_no,v_tmp_stock_type,v_stock_type,v_tmp_asset_type,v_asset_type,v_tmp_comm_time,v_comm_time,v_tmp_comm_opor,v_comm_opor,v_tmp_comm_limit_price,v_comm_limit_price,v_tmp_limit_actual_price,v_limit_actual_price,v_tmp_net_price_flag,v_net_price_flag,v_tmp_par_value,v_par_value,v_tmp_impawn_ratio,v_impawn_ratio,v_tmp_intrst_days,v_intrst_days,v_tmp_bond_accr_intrst,v_bond_accr_intrst,v_tmp_bond_rate_type,v_bond_rate_type,v_tmp_exter_comm_flag,v_exter_comm_flag,v_record_count from db_tdfutu.tb_tdfuap_command where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no and comm_executor = v_before_comm_executor limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.22.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 前指令执行人=", v_before_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 前指令执行人=", v_before_comm_executor);
        end if;
        leave label_pro;
    end if;


    /* if @记录个数# > 0 then */
    if v_record_count > 0 then

        /* if @临时_产品编号# / @记录个数# <> @产品编号# then */
        if v_tmp_pd_no / v_record_count <> v_pd_no then

            /* set @产品编号# = 0; */
            set v_pd_no = 0;
        end if;

        /* if @临时_交易组编号# / @记录个数# <> @交易组编号# then */
        if v_tmp_exch_group_no / v_record_count <> v_exch_group_no then

            /* set @交易组编号# = 0; */
            set v_exch_group_no = 0;
        end if;

        /* if @临时_资产账户编号# / @记录个数# <> @资产账户编号# then */
        if v_tmp_asset_acco_no / v_record_count <> v_asset_acco_no then

            /* set @资产账户编号# = 0; */
            set v_asset_acco_no = 0;

            /* set @外部账号# = 0; */
            set v_out_acco = 0;
        end if;

        /* if @临时_通道编号# / @记录个数# <> @通道编号# then */
        if v_tmp_pass_no / v_record_count <> v_pass_no then

            /* set @通道编号# = 0; */
            set v_pass_no = 0;
        end if;

        /* if @临时_合约代码编号# / @记录个数# <> @合约代码编号# then */
        if v_tmp_contrc_code_no / v_record_count <> v_contrc_code_no then

            /* set @合约代码编号# = 0; */
            set v_contrc_code_no = 0;

            /* set @合约代码# = ' '; */
            set v_contrc_code = ' ';

            /* set @市场编号# = 0; */
            set v_exch_no = 0;

            /* set @交易币种# = " "; */
            set v_exch_crncy_type = " ";

            /* set @资产类型# = 0; */
            set v_asset_type = 0;
        end if;

        /* if @临时_指令下达人# / @记录个数# <> @指令下达人# then */
        if v_tmp_comm_opor / v_record_count <> v_comm_opor then

            /* set @指令下达人# = 0; */
            set v_comm_opor = 0;
        end if;

        /* if @临时_指令限价# / @记录个数# <> @指令限价# then */
        if v_tmp_comm_limit_price / v_record_count <> v_comm_limit_price then

            /* set @指令限价# = 0; */
            set v_comm_limit_price = 0;
        end if;

        /* if @临时_指令实际限价# / @记录个数# <> @指令实际限价# then */
        if v_tmp_limit_actual_price / v_record_count <> v_limit_actual_price then

            /* set @指令实际限价# = 0; */
            set v_limit_actual_price = 0;
        end if;
    end if;

    /* set @临时_指令完成日期#  = @指令完成日期#; */
    set v_tmp_comm_comple_date  = v_comm_comple_date;

    /* set @临时_指令完成时间# = @指令完成时间#; */
    set v_tmp_comm_comple_time = v_comm_comple_time;
    #获取指令状态

    /* 调用【原子_交易期货_指令_计算指令汇总状态】*/
    call db_tdfutu.pra_tdfuap_CaclCommSumStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_qty,
        v_order_qty,
        v_comm_cancel_qty,
        v_comm_await_cancel_qty,
        v_strike_qty,
        v_error_code,
        v_error_info,
        v_comm_sum_status);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令汇总状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_交易期货_指令_计算指令汇总审批状态】*/
    call db_tdfutu.pra_tdfuap_CaclCommSumApprStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_qty,
        v_comm_appr_qty,
        v_error_code,
        v_error_info,
        v_comm_sum_approve_status);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令汇总审批状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_交易期货_指令_计算指令成交状态】*/
    call db_tdfutu.pra_tdfuap_CaclCommStrikeStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_qty,
        v_strike_qty,
        v_comm_cancel_qty,
        v_error_code,
        v_error_info,
        v_strike_status,
        v_comm_comple_date,
        v_comm_comple_time);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令成交状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @指令完成日期#  = @临时_指令完成日期#; */
    set v_comm_comple_date  = v_tmp_comm_comple_date;

    /* set @指令完成时间# = @临时_指令完成时间#; */
    set v_comm_comple_time = v_tmp_comm_comple_time;

    /* [更新表记录][交易期货_指令_指令汇总表][{买入订单数量} = @买入订单数量#,{卖出订单数量} = @卖出订单数量#,{买入指令数量} = @买入指令数量#,{卖出指令数量} = @卖出指令数量#,{买入成交数量} = @买入成交数量#,{卖出指令数量} = @卖出成交数量#,{买入成交金额} = @买入成交金额#,{卖出成交金额} = @卖出成交金额#,{买入指令金额} = @买入指令金额#,{卖出指令金额} = @卖出指令金额#,{指令汇总审批状态}=@指令汇总审批状态#,{指令汇总状态}=@指令汇总状态#, {成交状态}=@成交状态#,{指令完成日期}=@指令完成日期#,{指令完成时间}=@指令完成时间#,{指令最大完成日期}=@指令最大完成日期#,{指令最大完成时间}=@指令最大完成时间#,{指令开始日期} = @指令开始日期#,{指令结束日期} = @指令结束日期#,{指令开始时间} = @指令开始时间#,{指令结束时间} = @指令结束时间#,{指令撤销数量}= @指令撤销数量#,{指令审批数量}= @指令审批数量#,{指令数量} = @指令数量#, {指令金额} = @指令金额#,{成交数量} = @成交数量#, {成交金额} = @成交金额#,{订单数量}=@订单数量#,{指令待撤销数量}=@指令待撤销数量#,{产品编号}=@产品编号#,{交易组编号}=@交易组编号#,{资产账户编号}=@资产账户编号#,{外部账号}=@外部账号#,{通道编号}=@通道编号#,{合约代码编号}=@合约代码编号#,{市场编号}=@市场编号#,{交易币种}=@交易币种#,{合约代码}=@合约代码#,{合约类型}=@合约类型#,{资产类型}=@资产类型#,{指令限价}=@指令限价#,{指令实际限价}=@指令实际限价#][{指令日期}=@临时_指令日期# and {机构编号}=@临时_机构编号# and {指令批号}=@临时_指令批号# and {指令执行人}=@前指令执行人#][2][@临时_指令日期#, @临时_机构编号#, @临时_指令批号#,@前指令执行人#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfuap_sumcommand set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, buy_order_qty = v_buy_order_qty,sell_order_qty = v_sell_order_qty,buy_comm_qty = v_buy_comm_qty,sell_comm_qty = v_sell_comm_qty,buy_strike_qty = v_buy_strike_qty,sell_comm_qty = v_sell_strike_qty,buy_strike_amt = v_buy_strike_amt,sell_strike_amt = v_sell_strike_amt,buy_comm_amt = v_buy_comm_amt,sell_comm_amt = v_sell_comm_amt,comm_sum_approve_status=v_comm_sum_approve_status,comm_sum_status=v_comm_sum_status, strike_status=v_strike_status,comm_comple_date=v_comm_comple_date,comm_comple_time=v_comm_comple_time,max_comm_comple_date=v_max_comm_comple_date,max_comm_comple_time=v_max_comm_comple_time,comm_begin_date = v_comm_begin_date,comm_end_date = v_comm_end_date,comm_begin_time = v_comm_begin_time,comm_end_time = v_comm_end_time,comm_cancel_qty= v_comm_cancel_qty,comm_appr_qty= v_comm_appr_qty,comm_qty = v_comm_qty, comm_amt = v_comm_amt,strike_qty = v_strike_qty, strike_amt = v_strike_amt,order_qty=v_order_qty,comm_await_cancel_qty=v_comm_await_cancel_qty,pd_no=v_pd_no,exch_group_no=v_exch_group_no,asset_acco_no=v_asset_acco_no,out_acco=v_out_acco,pass_no=v_pass_no,contrc_code_no=v_contrc_code_no,exch_no=v_exch_no,exch_crncy_type=v_exch_crncy_type,contrc_code=v_contrc_code,contrc_type=v_contrc_type,asset_type=v_asset_type,comm_limit_price=v_comm_limit_price,limit_actual_price=v_limit_actual_price where comm_date=v_tmp_comm_date and co_no=v_tmp_co_no and comm_batch_no=v_tmp_comm_batch_no and comm_executor=v_before_comm_executor;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.22.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("临时_指令日期=",v_tmp_comm_date,","," 临时_机构编号=", v_tmp_co_no,","," 临时_指令批号=", v_tmp_comm_batch_no,",","前指令执行人=",v_before_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("临时_指令日期=",v_tmp_comm_date,","," 临时_机构编号=", v_tmp_co_no,","," 临时_指令批号=", v_tmp_comm_batch_no,",","前指令执行人=",v_before_comm_executor);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_查询指令结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_QueryCommList;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_QueryCommList(
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
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易期货_指令_指令表][字段][(@指令序号#=0 or {记录序号}=@指令序号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#)  and (@指令完成标志# = 0 or {指令完成标志}=@指令完成标志#)  and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@指令执行人#=0 or {指令执行人}=@指令执行人#) and (@指令审批操作员#=0 or {指令审批操作员}=@指令审批操作员#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@指令审批状态串#=" " or instr(@指令审批状态串#, concat(";",{指令审批状态},";"))>0) and (@资产类型串#=" " or instr(@资产类型串#, concat(";",{资产类型},";"))>0) and (@指令方向串#=" " or instr(@指令方向串#, concat(";",{指令方向},";"))>0) and (@指令状态串#=" " or instr(@指令状态串#, concat(";",{指令状态},";"))>0) and (@成交状态串#=" " or instr(@成交状态串#, concat(";",{成交状态},";"))>0) and (@开平方向串#=" " or instr(@开平方向串#, concat(";",{开平方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and (@指令操作方式# = " " or {指令操作方式} = @指令操作方式#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_crncy_type, exch_no, futu_acco_no, 
            contrc_code_no, contrc_code, contrc_type, asset_type, 
            contrc_dir, hedge_type, comm_date, comm_time, 
            comm_batch_no, comm_opor, comm_executor, comm_dir, 
            comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
            order_qty, comm_cancel_qty, strike_amt, strike_qty, 
            comm_frozen_qty, rece_margin, capit_reback_days, posi_reback_days, 
            strike_status, comm_status, comm_begin_date, comm_end_date, 
            comm_begin_time, comm_end_time, comm_comple_date, comm_comple_time, 
            comm_appr_date, comm_appr_time, comm_appr_status, comm_appr_oper_no, 
            comm_appr_oper, comm_appr_remark, external_no, comb_code, 
            comm_oper_way, comm_comple_flag, remark_info from db_tdfutu.tb_tdfuap_command where (v_comm_id=0 or row_id=v_comm_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no)  and (v_comm_comple_flag = 0 or comm_comple_flag=v_comm_comple_flag)  and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_comm_appr_oper=0 or comm_appr_oper=v_comm_appr_oper) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_comm_appr_status_str=" " or instr(v_comm_appr_status_str, concat(";",comm_appr_status,";"))>0) and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_status_str=" " or instr(v_comm_status_str, concat(";",comm_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_contrc_dir_str=" " or instr(v_contrc_dir_str, concat(";",contrc_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_crncy_type, exch_no, futu_acco_no, 
            contrc_code_no, contrc_code, contrc_type, asset_type, 
            contrc_dir, hedge_type, comm_date, comm_time, 
            comm_batch_no, comm_opor, comm_executor, comm_dir, 
            comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
            order_qty, comm_cancel_qty, strike_amt, strike_qty, 
            comm_frozen_qty, rece_margin, capit_reback_days, posi_reback_days, 
            strike_status, comm_status, comm_begin_date, comm_end_date, 
            comm_begin_time, comm_end_time, comm_comple_date, comm_comple_time, 
            comm_appr_date, comm_appr_time, comm_appr_status, comm_appr_oper_no, 
            comm_appr_oper, comm_appr_remark, external_no, comb_code, 
            comm_oper_way, comm_comple_flag, remark_info from db_tdfutu.tb_tdfuap_command where (v_comm_id=0 or row_id=v_comm_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no)  and (v_comm_comple_flag = 0 or comm_comple_flag=v_comm_comple_flag)  and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_comm_appr_oper=0 or comm_appr_oper=v_comm_appr_oper) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_comm_appr_status_str=" " or instr(v_comm_appr_status_str, concat(";",comm_appr_status,";"))>0) and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_status_str=" " or instr(v_comm_status_str, concat(";",comm_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_contrc_dir_str=" " or instr(v_contrc_dir_str, concat(";",contrc_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易期货_指令_指令表][字段][(@指令序号#=0 or {记录序号}=@指令序号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#)  and (@指令完成标志# = 0 or {指令完成标志}=@指令完成标志#)  and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@指令执行人#=0 or {指令执行人}=@指令执行人#) and (@指令审批操作员#=0 or {指令审批操作员}=@指令审批操作员#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@指令审批状态串#=" " or instr(@指令审批状态串#, concat(";",{指令审批状态},";"))>0)  and (@资产类型串#=" " or instr(@资产类型串#, concat(";",{资产类型},";"))>0) and (@指令方向串#=" " or instr(@指令方向串#, concat(";",{指令方向},";"))>0) and (@指令状态串#=" " or instr(@指令状态串#, concat(";",{指令状态},";"))>0) and (@成交状态串#=" " or instr(@成交状态串#, concat(";",{成交状态},";"))>0) and (@开平方向串#=" " or instr(@开平方向串#, concat(";",{开平方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and (@指令操作方式# = " " or {指令操作方式} = @指令操作方式#) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_crncy_type, exch_no, futu_acco_no, 
            contrc_code_no, contrc_code, contrc_type, asset_type, 
            contrc_dir, hedge_type, comm_date, comm_time, 
            comm_batch_no, comm_opor, comm_executor, comm_dir, 
            comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
            order_qty, comm_cancel_qty, strike_amt, strike_qty, 
            comm_frozen_qty, rece_margin, capit_reback_days, posi_reback_days, 
            strike_status, comm_status, comm_begin_date, comm_end_date, 
            comm_begin_time, comm_end_time, comm_comple_date, comm_comple_time, 
            comm_appr_date, comm_appr_time, comm_appr_status, comm_appr_oper_no, 
            comm_appr_oper, comm_appr_remark, external_no, comb_code, 
            comm_oper_way, comm_comple_flag, remark_info from db_tdfutu.tb_tdfuap_command where (v_comm_id=0 or row_id=v_comm_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no)  and (v_comm_comple_flag = 0 or comm_comple_flag=v_comm_comple_flag)  and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_comm_appr_oper=0 or comm_appr_oper=v_comm_appr_oper) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_comm_appr_status_str=" " or instr(v_comm_appr_status_str, concat(";",comm_appr_status,";"))>0)  and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_status_str=" " or instr(v_comm_status_str, concat(";",comm_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_contrc_dir_str=" " or instr(v_contrc_dir_str, concat(";",contrc_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way) and row_id<v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_crncy_type, exch_no, futu_acco_no, 
            contrc_code_no, contrc_code, contrc_type, asset_type, 
            contrc_dir, hedge_type, comm_date, comm_time, 
            comm_batch_no, comm_opor, comm_executor, comm_dir, 
            comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
            order_qty, comm_cancel_qty, strike_amt, strike_qty, 
            comm_frozen_qty, rece_margin, capit_reback_days, posi_reback_days, 
            strike_status, comm_status, comm_begin_date, comm_end_date, 
            comm_begin_time, comm_end_time, comm_comple_date, comm_comple_time, 
            comm_appr_date, comm_appr_time, comm_appr_status, comm_appr_oper_no, 
            comm_appr_oper, comm_appr_remark, external_no, comb_code, 
            comm_oper_way, comm_comple_flag, remark_info from db_tdfutu.tb_tdfuap_command where (v_comm_id=0 or row_id=v_comm_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no)  and (v_comm_comple_flag = 0 or comm_comple_flag=v_comm_comple_flag)  and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_comm_appr_oper=0 or comm_appr_oper=v_comm_appr_oper) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_comm_appr_status_str=" " or instr(v_comm_appr_status_str, concat(";",comm_appr_status,";"))>0)  and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_status_str=" " or instr(v_comm_status_str, concat(";",comm_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_contrc_dir_str=" " or instr(v_contrc_dir_str, concat(";",contrc_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_查询历史指令结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_QueryHisCommList;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_QueryHisCommList(
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
    

        /* [获取表记录][历史_交易期货_指令_指令表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@指令序号#=0 or {记录序号}=@指令序号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#)  and (@指令完成标志# = 0 or {指令完成标志}=@指令完成标志#)  and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@指令执行人#=0 or {指令执行人}=@指令执行人#) and (@指令审批操作员#=0 or {指令审批操作员}=@指令审批操作员#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@指令审批状态串#=" " or instr(@指令审批状态串#, concat(";",{指令审批状态},";"))>0) and (@资产类型串#=" " or instr(@资产类型串#, concat(";",{资产类型},";"))>0) and (@指令方向串#=" " or instr(@指令方向串#, concat(";",{指令方向},";"))>0) and (@指令状态串#=" " or instr(@指令状态串#, concat(";",{指令状态},";"))>0) and (@成交状态串#=" " or instr(@成交状态串#, concat(";",{成交状态},";"))>0) and (@开平方向串#=" " or instr(@开平方向串#, concat(";",{开平方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and (@指令操作方式# = " " or {指令操作方式} = @指令操作方式#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_crncy_type, exch_no, futu_acco_no, 
            contrc_code_no, contrc_code, contrc_type, asset_type, 
            contrc_dir, hedge_type, comm_date, comm_time, 
            comm_batch_no, comm_opor, comm_executor, comm_dir, 
            comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
            order_qty, comm_cancel_qty, strike_amt, strike_qty, 
            comm_frozen_qty, rece_margin, capit_reback_days, posi_reback_days, 
            strike_status, comm_status, comm_begin_date, comm_end_date, 
            comm_begin_time, comm_end_time, comm_comple_date, comm_comple_time, 
            comm_appr_date, comm_appr_time, comm_appr_status, comm_appr_oper_no, 
            comm_appr_oper, comm_appr_remark, external_no, comb_code, 
            comm_oper_way, comm_comple_flag, remark_info from db_tdfutu_his.tb_tdfuap_command_his where (init_date between v_begin_date and v_end_date) and (v_comm_id=0 or row_id=v_comm_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no)  and (v_comm_comple_flag = 0 or comm_comple_flag=v_comm_comple_flag)  and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_comm_appr_oper=0 or comm_appr_oper=v_comm_appr_oper) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_comm_appr_status_str=" " or instr(v_comm_appr_status_str, concat(";",comm_appr_status,";"))>0) and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_status_str=" " or instr(v_comm_status_str, concat(";",comm_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_contrc_dir_str=" " or instr(v_contrc_dir_str, concat(";",contrc_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_crncy_type, exch_no, futu_acco_no, 
            contrc_code_no, contrc_code, contrc_type, asset_type, 
            contrc_dir, hedge_type, comm_date, comm_time, 
            comm_batch_no, comm_opor, comm_executor, comm_dir, 
            comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
            order_qty, comm_cancel_qty, strike_amt, strike_qty, 
            comm_frozen_qty, rece_margin, capit_reback_days, posi_reback_days, 
            strike_status, comm_status, comm_begin_date, comm_end_date, 
            comm_begin_time, comm_end_time, comm_comple_date, comm_comple_time, 
            comm_appr_date, comm_appr_time, comm_appr_status, comm_appr_oper_no, 
            comm_appr_oper, comm_appr_remark, external_no, comb_code, 
            comm_oper_way, comm_comple_flag, remark_info from db_tdfutu_his.tb_tdfuap_command_his where (init_date between v_begin_date and v_end_date) and (v_comm_id=0 or row_id=v_comm_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no)  and (v_comm_comple_flag = 0 or comm_comple_flag=v_comm_comple_flag)  and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_comm_appr_oper=0 or comm_appr_oper=v_comm_appr_oper) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_comm_appr_status_str=" " or instr(v_comm_appr_status_str, concat(";",comm_appr_status,";"))>0) and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_status_str=" " or instr(v_comm_status_str, concat(";",comm_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_contrc_dir_str=" " or instr(v_contrc_dir_str, concat(";",contrc_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_查询指令分发结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_QueryCommDispJourList;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_QueryCommDispJourList(
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
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易期货_指令_指令分发表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#)  and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#)  and (@分发操作员#=0 or {操作员编号}=@分发操作员#) and (@前指令执行人#=0 or {前指令执行人}=@前指令执行人#) and (@指令执行人#=0 or {指令执行人}=@指令执行人#) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令方向串#=" " or instr(@指令方向串#, concat(";",{指令方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, exch_no, 
            futu_acco_no, contrc_code_no, contrc_type, comm_date, 
            comm_id, comm_batch_no, comm_dir, comm_status, 
            disp_date, disp_time, comm_opor, before_comm_executor, 
            comm_executor, is_withdraw, disp_flag, disp_remark from db_tdfutu.tb_tdfuap_dispense where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_disp_opor=0 or opor_no=v_disp_opor) and (v_before_comm_executor=0 or before_comm_executor=v_before_comm_executor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, exch_no, 
            futu_acco_no, contrc_code_no, contrc_type, comm_date, 
            comm_id, comm_batch_no, comm_dir, comm_status, 
            disp_date, disp_time, comm_opor, before_comm_executor, 
            comm_executor, is_withdraw, disp_flag, disp_remark from db_tdfutu.tb_tdfuap_dispense where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_disp_opor=0 or opor_no=v_disp_opor) and (v_before_comm_executor=0 or before_comm_executor=v_before_comm_executor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易期货_指令_指令分发表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#)  and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#)   and (@分发操作员#=0 or {操作员编号}=@分发操作员#) and (@前指令执行人#=0 or {前指令执行人}=@前指令执行人#) and (@指令执行人#=0 or {指令执行人}=@指令执行人#) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令方向串#=" " or instr(@指令方向串#, concat(";",{指令方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, exch_no, 
            futu_acco_no, contrc_code_no, contrc_type, comm_date, 
            comm_id, comm_batch_no, comm_dir, comm_status, 
            disp_date, disp_time, comm_opor, before_comm_executor, 
            comm_executor, is_withdraw, disp_flag, disp_remark from db_tdfutu.tb_tdfuap_dispense where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)   and (v_disp_opor=0 or opor_no=v_disp_opor) and (v_before_comm_executor=0 or before_comm_executor=v_before_comm_executor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id<v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, exch_no, 
            futu_acco_no, contrc_code_no, contrc_type, comm_date, 
            comm_id, comm_batch_no, comm_dir, comm_status, 
            disp_date, disp_time, comm_opor, before_comm_executor, 
            comm_executor, is_withdraw, disp_flag, disp_remark from db_tdfutu.tb_tdfuap_dispense where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)   and (v_disp_opor=0 or opor_no=v_disp_opor) and (v_before_comm_executor=0 or before_comm_executor=v_before_comm_executor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_查询历史指令分发结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_QueryHisCommDispJourList;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_QueryHisCommDispJourList(
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
    

    /* [获取表记录][历史_交易期货_指令_指令分发表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#)  and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#)  and (@分发操作员#=0 or {操作员编号}=@分发操作员#) and (@前指令执行人#=0 or {前指令执行人}=@前指令执行人#) and (@指令执行人#=0 or {指令执行人}=@指令执行人#) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令方向串#=" " or instr(@指令方向串#, concat(";",{指令方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, comm_date, 
        comm_id, comm_batch_no, comm_dir, comm_status, 
        disp_date, disp_time, comm_opor, before_comm_executor, 
        comm_executor, is_withdraw, disp_flag, disp_remark from db_tdfutu_his.tb_tdfuap_dispense_his where (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_disp_opor=0 or opor_no=v_disp_opor) and (v_before_comm_executor=0 or before_comm_executor=v_before_comm_executor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, comm_date, 
        comm_id, comm_batch_no, comm_dir, comm_status, 
        disp_date, disp_time, comm_opor, before_comm_executor, 
        comm_executor, is_withdraw, disp_flag, disp_remark from db_tdfutu_his.tb_tdfuap_dispense_his where (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_disp_opor=0 or opor_no=v_disp_opor) and (v_before_comm_executor=0 or before_comm_executor=v_before_comm_executor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_查询指令审批结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_QueryCommApprJourList;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_QueryCommApprJourList(
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
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易期货_指令_指令审批表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#)  and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#)  and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@指令方向串#=" " or instr(@指令方向串#, concat(";",{指令方向},";"))>0) and (@指令审批操作员#=0 or {指令审批操作员}=@指令审批操作员#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, comm_appr_date, 
            comm_appr_time, comm_appr_oper_no, comm_appr_oper, co_no, 
            pd_no, exch_group_no, asset_acco_no, exch_no, 
            futu_acco_no, contrc_code_no, contrc_type, comm_date, 
            comm_id, comm_opor, comm_dir, comm_qty, 
            comm_limit_price, limit_actual_price, comm_begin_date, comm_end_date, 
            comm_begin_time, comm_end_time, comm_appr_status, comm_appr_remark from db_tdfutu.tb_tdfuap_command_approve where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_appr_oper=0 or comm_appr_oper=v_comm_appr_oper) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, comm_appr_date, 
            comm_appr_time, comm_appr_oper_no, comm_appr_oper, co_no, 
            pd_no, exch_group_no, asset_acco_no, exch_no, 
            futu_acco_no, contrc_code_no, contrc_type, comm_date, 
            comm_id, comm_opor, comm_dir, comm_qty, 
            comm_limit_price, limit_actual_price, comm_begin_date, comm_end_date, 
            comm_begin_time, comm_end_time, comm_appr_status, comm_appr_remark from db_tdfutu.tb_tdfuap_command_approve where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_appr_oper=0 or comm_appr_oper=v_comm_appr_oper) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易期货_指令_指令审批表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#)  and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@指令方向串#=" " or instr(@指令方向串#, concat(";",{指令方向},";"))>0) and (@指令审批操作员#=0 or {指令审批操作员}=@指令审批操作员#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, comm_appr_date, 
            comm_appr_time, comm_appr_oper_no, comm_appr_oper, co_no, 
            pd_no, exch_group_no, asset_acco_no, exch_no, 
            futu_acco_no, contrc_code_no, contrc_type, comm_date, 
            comm_id, comm_opor, comm_dir, comm_qty, 
            comm_limit_price, limit_actual_price, comm_begin_date, comm_end_date, 
            comm_begin_time, comm_end_time, comm_appr_status, comm_appr_remark from db_tdfutu.tb_tdfuap_command_approve where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_appr_oper=0 or comm_appr_oper=v_comm_appr_oper) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id<v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, comm_appr_date, 
            comm_appr_time, comm_appr_oper_no, comm_appr_oper, co_no, 
            pd_no, exch_group_no, asset_acco_no, exch_no, 
            futu_acco_no, contrc_code_no, contrc_type, comm_date, 
            comm_id, comm_opor, comm_dir, comm_qty, 
            comm_limit_price, limit_actual_price, comm_begin_date, comm_end_date, 
            comm_begin_time, comm_end_time, comm_appr_status, comm_appr_remark from db_tdfutu.tb_tdfuap_command_approve where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_appr_oper=0 or comm_appr_oper=v_comm_appr_oper) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_查询历史指令审批结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_QueryHisCommApprJourList;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_QueryHisCommApprJourList(
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
    

    /* [获取表记录][历史_交易期货_指令_指令审批表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#)  and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#)  and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@指令方向串#=" " or instr(@指令方向串#, concat(";",{指令方向},";"))>0) and (@指令审批操作员#=0 or {指令审批操作员}=@指令审批操作员#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, comm_appr_date, 
        comm_appr_time, comm_appr_oper_no, comm_appr_oper, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, comm_date, 
        comm_id, comm_opor, comm_dir, comm_qty, 
        comm_limit_price, limit_actual_price, comm_begin_date, comm_end_date, 
        comm_begin_time, comm_end_time, comm_appr_status, comm_appr_remark from db_tdfutu_his.tb_tdfuap_command_approve_his where (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_appr_oper=0 or comm_appr_oper=v_comm_appr_oper) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, comm_appr_date, 
        comm_appr_time, comm_appr_oper_no, comm_appr_oper, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, comm_date, 
        comm_id, comm_opor, comm_dir, comm_qty, 
        comm_limit_price, limit_actual_price, comm_begin_date, comm_end_date, 
        comm_begin_time, comm_end_time, comm_appr_status, comm_appr_remark from db_tdfutu_his.tb_tdfuap_command_approve_his where (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_appr_oper=0 or comm_appr_oper=v_comm_appr_oper) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_查询汇总指令结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_QuerySumCommList;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_QuerySumCommList(
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
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易期货_指令_指令汇总表][字段][(@指令日期#=0 or {指令日期}=@指令日期#) and (@指令批号#=0 or {指令批号}=@指令批号#)  and {机构编号}=@操作员机构编号#  and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@指令执行人#=0 or {指令执行人}=@指令执行人#)  and {指令数量} > 0 and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@指令汇总审批状态串#=" " or instr(@指令汇总审批状态串#, concat(";",{指令汇总审批状态},";"))>0)  and (@资产类型串#=" " or instr(@资产类型串#, concat(";",{资产类型},";"))>0) and (@指令方向串#=" " or instr(@指令方向串#, concat(";",{指令方向},";"))>0) and (@指令汇总状态串#=" " or instr(@指令汇总状态串#, concat(";",{指令汇总状态},";"))>0) and (@成交状态串#=" " or instr(@成交状态串#, concat(";",{成交状态},";"))>0)  and (@指令操作方式# = " " or {指令操作方式} = @指令操作方式#)   and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_crncy_type, exch_no, futu_acco_no, 
            contrc_code_no, contrc_code, contrc_type, asset_type, 
            contrc_dir, hedge_type, comm_date, comm_time, 
            comm_batch_no, comm_opor, comm_executor, comm_dir, 
            comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
            order_qty, comm_cancel_qty, comm_await_cancel_qty, strike_amt, 
            strike_qty, strike_status, rece_margin, comm_sum_status, 
            comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
            comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
            comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
            buy_order_qty, sell_order_qty, buy_comm_qty, sell_comm_qty, 
            buy_strike_qty, sell_strike_qty, buy_strike_amt, sell_strike_amt, 
            buy_comm_amt, sell_comm_amt, comm_oper_way from db_tdfutu.tb_tdfuap_sumcommand where (v_comm_date=0 or comm_date=v_comm_date) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no)  and co_no=v_opor_co_no  and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor)  and comm_qty > 0 and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_comm_sum_appr_status_str=" " or instr(v_comm_sum_appr_status_str, concat(";",comm_sum_approve_status,";"))>0)  and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_sum_status_str=" " or instr(v_comm_sum_status_str, concat(";",comm_sum_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0)  and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way)   and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_crncy_type, exch_no, futu_acco_no, 
            contrc_code_no, contrc_code, contrc_type, asset_type, 
            contrc_dir, hedge_type, comm_date, comm_time, 
            comm_batch_no, comm_opor, comm_executor, comm_dir, 
            comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
            order_qty, comm_cancel_qty, comm_await_cancel_qty, strike_amt, 
            strike_qty, strike_status, rece_margin, comm_sum_status, 
            comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
            comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
            comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
            buy_order_qty, sell_order_qty, buy_comm_qty, sell_comm_qty, 
            buy_strike_qty, sell_strike_qty, buy_strike_amt, sell_strike_amt, 
            buy_comm_amt, sell_comm_amt, comm_oper_way from db_tdfutu.tb_tdfuap_sumcommand where (v_comm_date=0 or comm_date=v_comm_date) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no)  and co_no=v_opor_co_no  and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor)  and comm_qty > 0 and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_comm_sum_appr_status_str=" " or instr(v_comm_sum_appr_status_str, concat(";",comm_sum_approve_status,";"))>0)  and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_sum_status_str=" " or instr(v_comm_sum_status_str, concat(";",comm_sum_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0)  and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way)   and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易期货_指令_指令汇总表][字段][(@指令日期#=0 or {指令日期}=@指令日期#) and (@指令批号#=0 or {指令批号}=@指令批号#)  and  {机构编号}=@操作员机构编号#  and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@指令执行人#=0 or {指令执行人}=@指令执行人#) and {指令数量} > 0 and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@指令汇总审批状态串#=" " or instr(@指令汇总审批状态串#, concat(";",{指令汇总审批状态},";"))>0)  and (@资产类型串#=" " or instr(@资产类型串#, concat(";",{资产类型},";"))>0) and (@指令方向串#=" " or instr(@指令方向串#, concat(";",{指令方向},";"))>0) and (@指令汇总状态串#=" " or instr(@指令汇总状态串#, concat(";",{指令汇总状态},";"))>0) and (@成交状态串#=" " or instr(@成交状态串#, concat(";",{成交状态},";"))>0)  and (@指令操作方式# = " " or {指令操作方式} = @指令操作方式#)   and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_crncy_type, exch_no, futu_acco_no, 
            contrc_code_no, contrc_code, contrc_type, asset_type, 
            contrc_dir, hedge_type, comm_date, comm_time, 
            comm_batch_no, comm_opor, comm_executor, comm_dir, 
            comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
            order_qty, comm_cancel_qty, comm_await_cancel_qty, strike_amt, 
            strike_qty, strike_status, rece_margin, comm_sum_status, 
            comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
            comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
            comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
            buy_order_qty, sell_order_qty, buy_comm_qty, sell_comm_qty, 
            buy_strike_qty, sell_strike_qty, buy_strike_amt, sell_strike_amt, 
            buy_comm_amt, sell_comm_amt, comm_oper_way from db_tdfutu.tb_tdfuap_sumcommand where (v_comm_date=0 or comm_date=v_comm_date) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no)  and  co_no=v_opor_co_no  and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and comm_qty > 0 and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_comm_sum_appr_status_str=" " or instr(v_comm_sum_appr_status_str, concat(";",comm_sum_approve_status,";"))>0)  and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_sum_status_str=" " or instr(v_comm_sum_status_str, concat(";",comm_sum_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0)  and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way)   and row_id<v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_crncy_type, exch_no, futu_acco_no, 
            contrc_code_no, contrc_code, contrc_type, asset_type, 
            contrc_dir, hedge_type, comm_date, comm_time, 
            comm_batch_no, comm_opor, comm_executor, comm_dir, 
            comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
            order_qty, comm_cancel_qty, comm_await_cancel_qty, strike_amt, 
            strike_qty, strike_status, rece_margin, comm_sum_status, 
            comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
            comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
            comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
            buy_order_qty, sell_order_qty, buy_comm_qty, sell_comm_qty, 
            buy_strike_qty, sell_strike_qty, buy_strike_amt, sell_strike_amt, 
            buy_comm_amt, sell_comm_amt, comm_oper_way from db_tdfutu.tb_tdfuap_sumcommand where (v_comm_date=0 or comm_date=v_comm_date) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no)  and  co_no=v_opor_co_no  and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and comm_qty > 0 and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_comm_sum_appr_status_str=" " or instr(v_comm_sum_appr_status_str, concat(";",comm_sum_approve_status,";"))>0)  and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_sum_status_str=" " or instr(v_comm_sum_status_str, concat(";",comm_sum_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0)  and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way)   and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_查询历史汇总指令结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_QueryHisSumCommList;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_QueryHisSumCommList(
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
    

    /* [获取表记录][历史_交易期货_指令_指令汇总表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@指令日期#=0 or {指令日期}=@指令日期#) and (@指令批号#=0 or {指令批号}=@指令批号#) and {机构编号}=@操作员机构编号#  and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@指令执行人#=0 or {指令执行人}=@指令执行人#)  and {指令数量} > 0 and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@指令汇总审批状态串#=" " or instr(@指令汇总审批状态串#, concat(";",{指令汇总审批状态},";"))>0)  and (@资产类型串#=" " or instr(@资产类型串#, concat(";",{资产类型},";"))>0) and (@指令方向串#=" " or instr(@指令方向串#, concat(";",{指令方向},";"))>0) and (@指令汇总状态串#=" " or instr(@指令汇总状态串#, concat(";",{指令汇总状态},";"))>0) and (@成交状态串#=" " or instr(@成交状态串#, concat(";",{成交状态},";"))>0) and (@指令操作方式# = " " or {指令操作方式} = @指令操作方式#)   and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, comm_await_cancel_qty, strike_amt, 
        strike_qty, strike_status, rece_margin, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        buy_order_qty, sell_order_qty, buy_comm_qty, sell_comm_qty, 
        buy_strike_qty, sell_strike_qty, buy_strike_amt, sell_strike_amt, 
        buy_comm_amt, sell_comm_amt, comm_oper_way from db_tdfutu_his.tb_tdfuap_sumcommand_his where (init_date between v_begin_date and v_end_date) and (v_comm_date=0 or comm_date=v_comm_date) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and co_no=v_opor_co_no  and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor)  and comm_qty > 0 and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_comm_sum_appr_status_str=" " or instr(v_comm_sum_appr_status_str, concat(";",comm_sum_approve_status,";"))>0)  and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_sum_status_str=" " or instr(v_comm_sum_status_str, concat(";",comm_sum_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way)   and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, comm_await_cancel_qty, strike_amt, 
        strike_qty, strike_status, rece_margin, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        buy_order_qty, sell_order_qty, buy_comm_qty, sell_comm_qty, 
        buy_strike_qty, sell_strike_qty, buy_strike_amt, sell_strike_amt, 
        buy_comm_amt, sell_comm_amt, comm_oper_way from db_tdfutu_his.tb_tdfuap_sumcommand_his where (init_date between v_begin_date and v_end_date) and (v_comm_date=0 or comm_date=v_comm_date) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and co_no=v_opor_co_no  and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor)  and comm_qty > 0 and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_comm_sum_appr_status_str=" " or instr(v_comm_sum_appr_status_str, concat(";",comm_sum_approve_status,";"))>0)  and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_sum_status_str=" " or instr(v_comm_sum_status_str, concat(";",comm_sum_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way)   and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_撤销更新指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_CancelUpdateComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_CancelUpdateComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_id bigint,
    IN p_comm_cancel_qty decimal(18,2),
    IN p_wtdraw_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_limit_actual_price decimal(16,9),
    OUT p_comm_status varchar(2),
    OUT p_comm_date int,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int
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
    declare v_comm_cancel_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_tmp_comm_cancel_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_strike_status varchar(2);
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
    declare v_comm_comple_flag int;
    declare v_remark_info varchar(255);
    declare v_comm_await_cancel_qty decimal(18,2);
    declare v_tmp_wtdraw_qty decimal(18,2);
    declare v_occur_qty decimal(18,2);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_change_qty decimal(18,2);
    declare v_comm_order_qty decimal(18,2);
    declare v_comm_margin decimal(18,4);
    declare v_calc_dir int;

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
    SET v_comm_cancel_qty = p_comm_cancel_qty;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_limit_actual_price = 0;
    SET v_comm_status = "0";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_tmp_comm_cancel_qty = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
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
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_order_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_comm_frozen_qty = 0;
    SET v_rece_margin = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_strike_status = "0";
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
    SET v_comm_comple_flag = 0;
    SET v_remark_info = " ";
    SET v_comm_await_cancel_qty = 0;
    SET v_tmp_wtdraw_qty = 0;
    SET v_occur_qty = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_change_qty = 0;
    SET v_comm_order_qty = 0;
    SET v_comm_margin = 0;
    SET v_calc_dir = 1;

    
    label_pro:BEGIN
    
    #保存输入参数

    /* set @临时_指令撤销数量#=@指令撤销数量#; */
    set v_tmp_comm_cancel_qty=v_comm_cancel_qty;
    #防止并发，加锁获取

    /* [锁定获取表记录变量][交易期货_指令_指令表][字段][字段变量][{记录序号}=@指令序号#][1][@指令序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, strike_amt, strike_qty, 
        comm_frozen_qty, rece_margin, capit_reback_days, posi_reback_days, 
        strike_status, comm_status, comm_begin_date, comm_end_date, 
        comm_begin_time, comm_end_time, comm_comple_date, comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_status, comm_appr_oper_no, 
        comm_appr_oper, comm_appr_remark, external_no, comb_code, 
        comm_oper_way, comm_comple_flag, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_code, v_contrc_type, v_asset_type, 
        v_contrc_dir, v_hedge_type, v_comm_date, v_comm_time, 
        v_comm_batch_no, v_comm_opor, v_comm_executor, v_comm_dir, 
        v_comm_limit_price, v_limit_actual_price, v_comm_qty, v_comm_amt, 
        v_order_qty, v_comm_cancel_qty, v_strike_amt, v_strike_qty, 
        v_comm_frozen_qty, v_rece_margin, v_capit_reback_days, v_posi_reback_days, 
        v_strike_status, v_comm_status, v_comm_begin_date, v_comm_end_date, 
        v_comm_begin_time, v_comm_end_time, v_comm_comple_date, v_comm_comple_time, 
        v_comm_appr_date, v_comm_appr_time, v_comm_appr_status, v_comm_appr_oper_no, 
        v_comm_appr_oper, v_comm_appr_remark, v_external_no, v_comb_code, 
        v_comm_oper_way, v_comm_comple_flag, v_remark_info from db_tdfutu.tb_tdfuap_command where row_id=v_comm_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.31.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
        leave label_pro;
    end if;

    #为便于下述判断，指令撤销数量加总为合计指令撤销数量，更新前重置回来

    /* set @指令待撤销数量# = 0; */
    set v_comm_await_cancel_qty = 0;

    /* set @临时_撤单数量# = 0; */
    set v_tmp_wtdraw_qty = 0;

    /* set @指令撤销数量#=@指令撤销数量# + @临时_指令撤销数量#; */
    set v_comm_cancel_qty=v_comm_cancel_qty + v_tmp_comm_cancel_qty;

    /* if @指令状态# = 《指令状态-待撤销》 or @指令状态# = 《指令状态-部分撤销》 or @指令状态# = 《指令状态-全部撤销》 then */
    if v_comm_status = "4" or v_comm_status = "5" or v_comm_status = "6" then

        /* set @指令撤销数量# = @指令撤销数量# + @临时_指令撤销数量# + @撤单数量#; */
        set v_comm_cancel_qty = v_comm_cancel_qty + v_tmp_comm_cancel_qty + v_wtdraw_qty;

        /* set @临时_撤单数量# = @撤单数量#; */
        set v_tmp_wtdraw_qty = v_wtdraw_qty;

        /* set @指令待撤销数量# = 0 - @撤单数量#; */
        set v_comm_await_cancel_qty = 0 - v_wtdraw_qty;
    end if;

    /* set @订单数量#=@订单数量#-@撤单数量#; */
    set v_order_qty=v_order_qty-v_wtdraw_qty;

    /* 调用【原子_交易期货_指令_计算指令状态】*/
    call db_tdfutu.pra_tdfuap_CaclCommStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_qty,
        v_order_qty,
        v_comm_cancel_qty,
        v_strike_qty,
        v_error_code,
        v_error_info,
        v_comm_status,
        v_comm_comple_date,
        v_comm_comple_time);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.31.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @变动数量# = -1 * @撤单数量#; */
    set v_occur_qty = -1 * v_wtdraw_qty;

    /* set @指令冻结数量# = 0; */
    set v_comm_frozen_qty = 0;

    /* set @指令冻结金额# = 0; */
    set v_comm_frozen_amt = 0;

    /* if @指令状态# <> 《指令状态-待撤销》 and @指令状态# <> 《指令状态-部分撤销》 and @指令状态# <> 《指令状态-全部撤销》 then */
    if v_comm_status <> "4" and v_comm_status <> "5" and v_comm_status <> "6" then

        /* set @指令变化数量# = @撤单数量#; */
        set v_comm_change_qty = v_wtdraw_qty;

        /* set @指令订单数量# = @订单数量#; */
        set v_comm_order_qty = v_order_qty;

        /* set @指令保证金# = @应收保证金#; */
        set v_comm_margin = v_rece_margin;

        /* set @计算方向# = 《计算方向-加上》; */
        set v_calc_dir = 1;

        /* set @指令冻结数量#=@计算方向# * @指令变化数量#; */
        set v_comm_frozen_qty=v_calc_dir * v_comm_change_qty;
    end if;

    /* [更新表记录][交易期货_指令_指令表][{订单数量}={订单数量} + @变动数量# , {指令冻结数量} = {指令冻结数量} + @指令冻结数量#,{指令撤销数量}=@指令撤销数量#,{指令状态}=@指令状态#,{指令完成日期}=@指令完成日期#,{指令完成时间}=@指令完成时间#][{记录序号}=@指令序号#][2][@指令序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfuap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_qty=order_qty + v_occur_qty , comm_frozen_qty = comm_frozen_qty + v_comm_frozen_qty,comm_cancel_qty=v_comm_cancel_qty,comm_status=v_comm_status,comm_comple_date=v_comm_comple_date,comm_comple_time=v_comm_comple_time where row_id=v_comm_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.31.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
        leave label_pro;
    end if;


    /* set @指令撤销数量# = @临时_指令撤销数量# + @临时_撤单数量#; */
    set v_comm_cancel_qty = v_tmp_comm_cancel_qty + v_tmp_wtdraw_qty;

    /* 调用【原子_交易期货_指令_撤销更新汇总指令】*/
    call db_tdfutu.pra_tdfuap_CancelUpdateSumComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_comm_date,
        v_comm_batch_no,
        v_comm_executor,
        v_comm_status,
        v_comm_dir,
        v_contrc_dir,
        v_comm_cancel_qty,
        v_comm_await_cancel_qty,
        v_wtdraw_qty,
        v_comm_comple_date,
        v_comm_comple_time,
        v_comm_oper_way,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.31.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_撤销更新汇总指令出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_limit_actual_price = v_limit_actual_price;
    SET p_comm_status = v_comm_status;
    SET p_comm_date = v_comm_date;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_修改指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_ModiComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_ModiComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_comm_id bigint,
    IN p_comm_limit_price decimal(16,9),
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_qty decimal(18,2),
    IN p_comm_amt decimal(18,4),
    IN p_comm_begin_date int,
    IN p_comm_end_date int,
    IN p_comm_begin_time int,
    IN p_comm_end_time int,
    IN p_comm_occur_qty decimal(18,2),
    IN p_comm_occur_amt decimal(18,4),
    IN p_comm_frozen_amt decimal(18,4),
    IN p_rece_margin decimal(18,4),
    IN p_comm_margin decimal(18,4),
    IN p_modi_info varchar(255),
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
    declare v_comm_id bigint;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_occur_qty decimal(18,2);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comm_margin decimal(18,4);
    declare v_modi_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_tmp_comm_limit_price decimal(16,9);
    declare v_tmp_limit_actual_price decimal(16,9);
    declare v_tmp_comm_qty decimal(18,2);
    declare v_tmp_comm_amt decimal(18,4);
    declare v_tmp_comm_begin_date int;
    declare v_tmp_comm_end_date int;
    declare v_tmp_comm_begin_time int;
    declare v_tmp_comm_end_time int;
    declare v_tmp_rece_margin decimal(18,4);
    declare v_comm_status varchar(2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_strike_status varchar(2);
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_appr_status varchar(2);
    declare v_comm_appr_oper_no int;
    declare v_comm_appr_oper int;
    declare v_comm_appr_remark varchar(255);
    declare v_external_no bigint;
    declare v_comb_code varchar(6);
    declare v_comm_oper_way varchar(2);
    declare v_comm_comple_flag int;
    declare v_remark_info varchar(255);
    declare v_comm_capt_qty decimal(18,2);
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_calc_dir int;
    declare v_comm_order_qty decimal(18,2);
    declare v_comm_change_qty decimal(18,2);
    declare v_jour_after_occur_info varchar(2048);
    declare v_tmp_comm_occur_amt decimal(18,4);

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
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_qty = p_comm_qty;
    SET v_comm_amt = p_comm_amt;
    SET v_comm_begin_date = p_comm_begin_date;
    SET v_comm_end_date = p_comm_end_date;
    SET v_comm_begin_time = p_comm_begin_time;
    SET v_comm_end_time = p_comm_end_time;
    SET v_comm_occur_qty = p_comm_occur_qty;
    SET v_comm_occur_amt = p_comm_occur_amt;
    SET v_comm_frozen_amt = p_comm_frozen_amt;
    SET v_rece_margin = p_rece_margin;
    SET v_comm_margin = p_comm_margin;
    SET v_modi_info = p_modi_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_comm_limit_price = 0;
    SET v_tmp_limit_actual_price = 0;
    SET v_tmp_comm_qty = 0;
    SET v_tmp_comm_amt = 0;
    SET v_tmp_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_rece_margin = 0;
    SET v_comm_status = "0";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
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
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_comm_frozen_qty = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_strike_status = "0";
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_status = " ";
    SET v_comm_appr_oper_no = 0;
    SET v_comm_appr_oper = 0;
    SET v_comm_appr_remark = " ";
    SET v_external_no = 0;
    SET v_comb_code = " ";
    SET v_comm_oper_way = " ";
    SET v_comm_comple_flag = 0;
    SET v_remark_info = " ";
    SET v_comm_capt_qty = 0;
    SET v_occur_qty = 0;
    SET v_occur_amt = 0;
    SET v_calc_dir = 1;
    SET v_comm_order_qty = 0;
    SET v_comm_change_qty = 0;
    SET v_jour_after_occur_info = " ";
    SET v_tmp_comm_occur_amt = 0;

    
    label_pro:BEGIN
    

    /* [获取机器日期][@指令完成日期#] */
    select date_format(curdate(),'%Y%m%d') into v_comm_comple_date;


    /* [获取机器时间][@指令完成时间#] */
    select date_format(curtime(),'%H%i%s') into v_comm_comple_time;


    /* set @临时_指令限价#=@指令限价#; */
    set v_tmp_comm_limit_price=v_comm_limit_price;

    /* set @临时_指令实际限价#=@指令实际限价#; */
    set v_tmp_limit_actual_price=v_limit_actual_price;

    /* set @临时_指令数量#=@指令数量#; */
    set v_tmp_comm_qty=v_comm_qty;

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

    /* set @临时_应收保证金# = @应收保证金#; */
    set v_tmp_rece_margin = v_rece_margin;

    /* set @指令状态#=《指令状态-全部撤销》; */
    set v_comm_status="6";
    #获取当前指令数量，以计算指令撤销数量和变动金额

    /* [锁定获取表记录变量][交易期货_指令_指令表][字段][字段变量][{记录序号}=@指令序号#][4][@指令序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, strike_amt, strike_qty, 
        comm_frozen_qty, rece_margin, capit_reback_days, posi_reback_days, 
        strike_status, comm_status, comm_begin_date, comm_end_date, 
        comm_begin_time, comm_end_time, comm_comple_date, comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_status, comm_appr_oper_no, 
        comm_appr_oper, comm_appr_remark, external_no, comb_code, 
        comm_oper_way, comm_comple_flag, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_code, v_contrc_type, v_asset_type, 
        v_contrc_dir, v_hedge_type, v_comm_date, v_comm_time, 
        v_comm_batch_no, v_comm_opor, v_comm_executor, v_comm_dir, 
        v_comm_limit_price, v_limit_actual_price, v_comm_qty, v_comm_amt, 
        v_order_qty, v_comm_cancel_qty, v_strike_amt, v_strike_qty, 
        v_comm_frozen_qty, v_rece_margin, v_capit_reback_days, v_posi_reback_days, 
        v_strike_status, v_comm_status, v_comm_begin_date, v_comm_end_date, 
        v_comm_begin_time, v_comm_end_time, v_comm_comple_date, v_comm_comple_time, 
        v_comm_appr_date, v_comm_appr_time, v_comm_appr_status, v_comm_appr_oper_no, 
        v_comm_appr_oper, v_comm_appr_remark, v_external_no, v_comb_code, 
        v_comm_oper_way, v_comm_comple_flag, v_remark_info from db_tdfutu.tb_tdfuap_command where row_id=v_comm_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.32.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
        leave label_pro;
    end if;

    #[获取流水变动][{指令限价},{指令实际限价},{指令数量},{指令金额},{指令撤销数量},{指令冻结金额},{指令冻结数量},{成交状态},{指令状态},{指令开始日期},{指令结束日期},{指令开始时间},{指令结束时间}][@指令限价#,@指令实际限价#,@指令数量#,@指令金额#,@指令撤销数量#,@指令冻结金额#,@指令冻结数量#,@成交状态#,@指令状态#,@指令开始日期#,@指令结束日期#,@指令开始时间#,@指令结束时间#];
    #用于修改汇总表时判断，是否只有一笔

    /* set @指令占用数量# = @指令数量#; */
    set v_comm_capt_qty = v_comm_qty;

    /* [检查报错返回][@指令状态#=《指令状态-待撤销》 or @指令状态#=《指令状态-部分撤销》 or @指令状态#=《指令状态-全部撤销》 or @成交状态#=《成交状态-已成》 ][624][@指令状态#,@成交状态#] */
    if v_comm_status="4" or v_comm_status="5" or v_comm_status="6" or v_strike_status="3"  then
        
        SET v_error_code = "tdfutuA.3.32.624";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令状态=",v_comm_status,",","成交状态=",v_strike_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令状态=",v_comm_status,",","成交状态=",v_strike_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@临时_指令数量# < @订单数量# ][625][@临时_指令数量#,@订单数量#] */
    if v_tmp_comm_qty < v_order_qty  then
        
        SET v_error_code = "tdfutuA.3.32.625";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("临时_指令数量=",v_tmp_comm_qty,",","订单数量=",v_order_qty),"#",v_mysql_message);
        else
            SET v_error_info = concat("临时_指令数量=",v_tmp_comm_qty,",","订单数量=",v_order_qty);
        end if;
        leave label_pro;
    end if;

    #计算变动数量和金额，用于指令汇总表处理

    /* set @变动数量#=@指令变动数量#; */
    set v_occur_qty=v_comm_occur_qty;

    /* set @变动金额#=@指令变动金额#; */
    set v_occur_amt=v_comm_occur_amt;
    #重置回来输入参数值

    /* set @指令限价#=@临时_指令限价#; */
    set v_comm_limit_price=v_tmp_comm_limit_price;

    /* set @指令实际限价#=@临时_指令实际限价#; */
    set v_limit_actual_price=v_tmp_limit_actual_price;

    /* set @指令数量#=@临时_指令数量#; */
    set v_comm_qty=v_tmp_comm_qty;

    /* set @指令金额#=@临时_指令金额#; */
    set v_comm_amt=v_tmp_comm_amt;

    /* set @指令开始日期# = @临时_指令开始日期#; */
    set v_comm_begin_date = v_tmp_comm_begin_date;

    /* set @指令结束日期# = @临时_指令结束日期#; */
    set v_comm_end_date = v_tmp_comm_end_date;

    /* set @指令开始时间# = @临时_指令开始时间#; */
    set v_comm_begin_time = v_tmp_comm_begin_time;

    /* set @指令结束时间# = @临时_指令结束时间#; */
    set v_comm_end_time = v_tmp_comm_end_time;
    #计算新的冻结金额数量

    /* set @指令冻结金额# = 0; */
    set v_comm_frozen_amt = 0;

    /* set @指令冻结数量# = 0; */
    set v_comm_frozen_qty = 0;

    /* set @计算方向# = 《计算方向-加上》; */
    set v_calc_dir = 1;
    #计算占用的指令有效数量

    /* set @指令订单数量# = @订单数量#; */
    set v_comm_order_qty = v_order_qty;

    /* set @指令变化数量# = @指令数量#-@订单数量#-@指令撤销数量#; */
    set v_comm_change_qty = v_comm_qty-v_order_qty-v_comm_cancel_qty;

    /* set @指令冻结数量#=@计算方向# * @指令变化数量#; */
    set v_comm_frozen_qty=v_calc_dir * v_comm_change_qty;

    /* set @指令数量#=@临时_指令数量#; */
    set v_comm_qty=v_tmp_comm_qty;
    #获取指令状态,不为暂停再重算

    /* if @指令状态# <> 《指令状态-暂停执行》 then */
    if v_comm_status <> "7" then

        /* 调用【原子_交易期货_指令_计算指令状态】*/
        call db_tdfutu.pra_tdfuap_CaclCommStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_comm_qty,
            v_order_qty,
            v_comm_cancel_qty,
            v_strike_qty,
            v_error_code,
            v_error_info,
            v_comm_status,
            v_comm_comple_date,
            v_comm_comple_time);
        if v_error_code = "1" then
            SET v_error_code = "tdfutuA.3.32.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令状态出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_交易期货_指令_计算指令成交状态】*/
    call db_tdfutu.pra_tdfuap_CaclCommStrikeStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_qty,
        v_strike_qty,
        v_comm_cancel_qty,
        v_error_code,
        v_error_info,
        v_strike_status,
        v_comm_comple_date,
        v_comm_comple_time);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.32.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令成交状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @应收保证金# = @临时_应收保证金#; */
    set v_rece_margin = v_tmp_rece_margin;

    /* [更新表记录][交易期货_指令_指令表][{指令数量}=@指令数量#,{指令金额}=@指令金额#, {指令限价}=@指令限价#, {指令实际限价}=@指令实际限价#, {指令开始日期}=@指令开始日期#, {指令开始时间}=@指令开始时间#, {指令结束日期}=@指令结束日期#, {指令结束时间}=@指令结束时间#,{指令冻结数量}=@指令冻结数量#, {应收保证金} = @应收保证金#,{指令状态}=@指令状态#,{指令完成日期}= @指令完成日期#,{指令完成时间}=@指令完成时间#,{成交状态} = @成交状态#][{记录序号}=@指令序号#][2][@指令序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfuap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, comm_qty=v_comm_qty,comm_amt=v_comm_amt, comm_limit_price=v_comm_limit_price, limit_actual_price=v_limit_actual_price, comm_begin_date=v_comm_begin_date, comm_begin_time=v_comm_begin_time, comm_end_date=v_comm_end_date, comm_end_time=v_comm_end_time,comm_frozen_qty=v_comm_frozen_qty, rece_margin = v_rece_margin,comm_status=v_comm_status,comm_comple_date= v_comm_comple_date,comm_comple_time=v_comm_comple_time,strike_status = v_strike_status where row_id=v_comm_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.32.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@指令限价#,@指令实际限价#,@指令数量#,@指令金额#,@指令撤销数量#,@指令冻结数量#,@成交状态#,@指令状态#,@指令开始日期#,@指令结束日期#,@指令开始时间#,@指令结束时间#]; */
    set v_jour_after_occur_info = concat(v_comm_limit_price,"|",v_limit_actual_price,"|",v_comm_qty,"|",v_comm_amt,"|",v_comm_cancel_qty,"|",v_comm_frozen_qty,"|",v_strike_status,"|",v_comm_status,"|",v_comm_begin_date,"|",v_comm_end_date,"|",v_comm_begin_time,"|",v_comm_end_time,"|");


    /* set @备注信息#=@修改说明#; */
    set v_remark_info=v_modi_info;

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;
    #[插入表记录][交易期货_指令_指令流水表][字段][字段变量][1][@初始化日期#,@指令序号#]

    /* set @临时_指令变动金额# = @指令变动金额#; */
    set v_tmp_comm_occur_amt = v_comm_occur_amt;

    /* set @指令变动金额# = @变动金额#; */
    set v_comm_occur_amt = v_occur_amt;
    #记录应收保证金的变化值，更新汇总表

    /* set @应收保证金# = @指令保证金#; */
    set v_rece_margin = v_comm_margin;
    #更新汇总指令表记录

    /* 调用【原子_交易期货_指令_修改指令更新汇总指令】*/
    call db_tdfutu.pra_tdfuap_ModiCommUpdateSumComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_comm_date,
        v_comm_batch_no,
        v_comm_executor,
        v_comm_dir,
        v_comm_limit_price,
        v_limit_actual_price,
        v_comm_comple_date,
        v_comm_comple_time,
        v_comm_begin_date,
        v_comm_end_date,
        v_comm_begin_time,
        v_comm_end_time,
        v_comm_appr_status,
        v_comm_capt_qty,
        v_comm_occur_qty,
        v_comm_occur_amt,
        v_rece_margin,
        v_comm_oper_way,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.32.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_修改指令更新汇总指令出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @指令变动金额# = @临时_指令变动金额#; */
    set v_comm_occur_amt = v_tmp_comm_occur_amt;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_修改指令更新汇总指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_ModiCommUpdateSumComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_ModiCommUpdateSumComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_comm_date int,
    IN p_comm_batch_no int,
    IN p_comm_executor int,
    IN p_comm_dir int,
    IN p_comm_limit_price decimal(16,9),
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_comple_date int,
    IN p_comm_comple_time int,
    IN p_comm_begin_date int,
    IN p_comm_end_date int,
    IN p_comm_begin_time int,
    IN p_comm_end_time int,
    IN p_comm_appr_status varchar(2),
    IN p_comm_capt_qty decimal(18,2),
    IN p_comm_occur_qty decimal(18,2),
    IN p_comm_occur_amt decimal(18,4),
    IN p_rece_margin decimal(18,4),
    IN p_comm_oper_way varchar(2),
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
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_appr_status varchar(2);
    declare v_comm_capt_qty decimal(18,2);
    declare v_comm_occur_qty decimal(18,2);
    declare v_comm_occur_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comm_oper_way varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_comm_limit_price decimal(16,9);
    declare v_tmp_limit_actual_price decimal(16,9);
    declare v_tmp_comm_begin_date int;
    declare v_tmp_comm_end_date int;
    declare v_tmp_comm_begin_time int;
    declare v_tmp_comm_end_time int;
    declare v_tmp_comm_comple_date int;
    declare v_tmp_comm_comple_time int;
    declare v_tmp_comm_dir int;
    declare v_tmp_rece_margin decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_await_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_status varchar(2);
    declare v_comm_sum_status varchar(2);
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
    SET v_comm_date = p_comm_date;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_dir = p_comm_dir;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_comple_date = p_comm_comple_date;
    SET v_comm_comple_time = p_comm_comple_time;
    SET v_comm_begin_date = p_comm_begin_date;
    SET v_comm_end_date = p_comm_end_date;
    SET v_comm_begin_time = p_comm_begin_time;
    SET v_comm_end_time = p_comm_end_time;
    SET v_comm_appr_status = p_comm_appr_status;
    SET v_comm_capt_qty = p_comm_capt_qty;
    SET v_comm_occur_qty = p_comm_occur_qty;
    SET v_comm_occur_amt = p_comm_occur_amt;
    SET v_rece_margin = p_rece_margin;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_comm_limit_price = 0;
    SET v_tmp_limit_actual_price = 0;
    SET v_tmp_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_comm_dir = 0;
    SET v_tmp_rece_margin = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
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
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_await_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_status = "0";
    SET v_comm_sum_status = "0";
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
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [检查正常返回][@指令批号# = 0] */
    if v_comm_batch_no = 0 then
        leave label_pro;
    end if;


    /* set @临时_指令限价# = @指令限价#; */
    set v_tmp_comm_limit_price = v_comm_limit_price;

    /* set @临时_指令实际限价# = @指令实际限价#; */
    set v_tmp_limit_actual_price = v_limit_actual_price;

    /* set @临时_指令开始日期# = @指令开始日期#; */
    set v_tmp_comm_begin_date = v_comm_begin_date;

    /* set @临时_指令结束日期# = @指令结束日期#; */
    set v_tmp_comm_end_date = v_comm_end_date;

    /* set @临时_指令开始时间# = @指令开始时间#; */
    set v_tmp_comm_begin_time = v_comm_begin_time;

    /* set @临时_指令结束时间# = @指令结束时间#; */
    set v_tmp_comm_end_time = v_comm_end_time;

    /* set @临时_指令完成日期# = @指令完成日期#; */
    set v_tmp_comm_comple_date = v_comm_comple_date;

    /* set @临时_指令完成时间# = @指令完成时间#; */
    set v_tmp_comm_comple_time = v_comm_comple_time;

    /* set @临时_指令方向#=@指令方向#; */
    set v_tmp_comm_dir=v_comm_dir;

    /* set @临时_应收保证金# = @应收保证金#; */
    set v_tmp_rece_margin = v_rece_margin;

    /* [锁定获取表记录变量][交易期货_指令_指令汇总表][字段][字段变量][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号# and {指令执行人} = @指令执行人#][1][@指令日期#, @机构编号#, @指令批号#, @指令执行人#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, comm_await_cancel_qty, strike_amt, 
        strike_qty, strike_status, rece_margin, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        buy_order_qty, sell_order_qty, buy_comm_qty, sell_comm_qty, 
        buy_strike_qty, sell_strike_qty, buy_strike_amt, sell_strike_amt, 
        buy_comm_amt, sell_comm_amt, comm_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_code, v_contrc_type, v_asset_type, 
        v_contrc_dir, v_hedge_type, v_comm_date, v_comm_time, 
        v_comm_batch_no, v_comm_opor, v_comm_executor, v_comm_dir, 
        v_comm_limit_price, v_limit_actual_price, v_comm_qty, v_comm_amt, 
        v_order_qty, v_comm_cancel_qty, v_comm_await_cancel_qty, v_strike_amt, 
        v_strike_qty, v_strike_status, v_rece_margin, v_comm_sum_status, 
        v_comm_begin_date, v_comm_end_date, v_comm_begin_time, v_comm_end_time, 
        v_comm_comple_date, v_comm_comple_time, v_max_comm_comple_date, v_max_comm_comple_time, 
        v_comm_appr_date, v_comm_appr_time, v_comm_appr_qty, v_comm_sum_approve_status, 
        v_buy_order_qty, v_sell_order_qty, v_buy_comm_qty, v_sell_comm_qty, 
        v_buy_strike_qty, v_sell_strike_qty, v_buy_strike_amt, v_sell_strike_amt, 
        v_buy_comm_amt, v_sell_comm_amt, v_comm_oper_way from db_tdfutu.tb_tdfuap_sumcommand where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no and comm_executor = v_comm_executor limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.33.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 指令执行人=", v_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 指令执行人=", v_comm_executor);
        end if;
        leave label_pro;
    end if;


    /* if  @指令占用数量# = @指令数量# then */
    if  v_comm_capt_qty = v_comm_qty then

        /* set @指令限价# = @临时_指令限价#; */
        set v_comm_limit_price = v_tmp_comm_limit_price;

        /* set @指令实际限价# = @临时_指令实际限价#; */
        set v_limit_actual_price = v_tmp_limit_actual_price;
    else

        /* [获取表记录变量][交易期货_指令_指令表][ifnull(sum({指令限价}),0),ifnull({指令限价},0),ifnull(sum({指令实际限价}),0),ifnull({指令实际限价},0),count(*)][@临时_指令限价#,@指令限价#,@临时_指令实际限价#,@指令实际限价#,@记录个数#][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号# and {指令执行人} = @指令执行人#][1][@指令日期#, @机构编号#, @指令批号#, @指令执行人#] */
        select ifnull(sum(comm_limit_price),0),ifnull(comm_limit_price,0),ifnull(sum(limit_actual_price),0),ifnull(limit_actual_price,0),count(*) into v_tmp_comm_limit_price,v_comm_limit_price,v_tmp_limit_actual_price,v_limit_actual_price,v_record_count from db_tdfutu.tb_tdfuap_command where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no and comm_executor = v_comm_executor limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "tdfutuA.3.33.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 指令执行人=", v_comm_executor),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 指令执行人=", v_comm_executor);
            end if;
            leave label_pro;
        end if;


        /* if @临时_指令限价# / @记录个数# <> @指令限价# then */
        if v_tmp_comm_limit_price / v_record_count <> v_comm_limit_price then

            /* set @指令限价# = 0; */
            set v_comm_limit_price = 0;
        end if;

        /* if @临时_指令实际限价# / @记录个数# <> @指令实际限价# then */
        if v_tmp_limit_actual_price / v_record_count <> v_limit_actual_price then

            /* set @指令实际限价# = 0; */
            set v_limit_actual_price = 0;
        end if;
    end if;

    /* if @临时_指令开始日期# < @指令开始日期# then */
    if v_tmp_comm_begin_date < v_comm_begin_date then

        /* set @指令开始日期# = @临时_指令开始日期#; */
        set v_comm_begin_date = v_tmp_comm_begin_date;
    end if;

    /* if @临时_指令结束日期# > @指令结束日期# then */
    if v_tmp_comm_end_date > v_comm_end_date then

        /* set @指令结束日期# = @临时_指令结束日期#; */
        set v_comm_end_date = v_tmp_comm_end_date;
    end if;

    /* if @临时_指令开始时间# < @指令开始时间# then */
    if v_tmp_comm_begin_time < v_comm_begin_time then

        /* set @指令开始时间# = @临时_指令开始时间#; */
        set v_comm_begin_time = v_tmp_comm_begin_time;
    end if;

    /* if @临时_指令结束时间# > @指令结束时间# then */
    if v_tmp_comm_end_time > v_comm_end_time then

        /* set @指令结束时间# = @临时_指令结束时间#; */
        set v_comm_end_time = v_tmp_comm_end_time;
    end if;

    /* if @临时_指令完成日期# > 0 and (@临时_指令完成日期# < @指令完成日期# or @指令完成日期# = 0) then */
    if v_tmp_comm_comple_date > 0 and (v_tmp_comm_comple_date < v_comm_comple_date or v_comm_comple_date = 0) then

        /* set @指令完成日期#  = @临时_指令完成日期#; */
        set v_comm_comple_date  = v_tmp_comm_comple_date;
    end if;

    /* if @临时_指令完成日期# > @指令最大完成日期# then */
    if v_tmp_comm_comple_date > v_max_comm_comple_date then

        /* set @指令最大完成日期#  = @临时_指令完成日期#; */
        set v_max_comm_comple_date  = v_tmp_comm_comple_date;
    end if;

    /* if @临时_指令完成时间# > 0 and (@临时_指令完成时间# < @指令完成时间# or @指令完成时间# = 0) then */
    if v_tmp_comm_comple_time > 0 and (v_tmp_comm_comple_time < v_comm_comple_time or v_comm_comple_time = 0) then

        /* set @指令完成时间# = @临时_指令完成时间#; */
        set v_comm_comple_time = v_tmp_comm_comple_time;
    end if;

    /* if @临时_指令完成时间# > @指令最大完成时间# then */
    if v_tmp_comm_comple_time > v_max_comm_comple_time then

        /* set @指令最大完成时间# = @临时_指令完成时间#; */
        set v_max_comm_comple_time = v_tmp_comm_comple_time;
    end if;

    /* set @指令数量# = @指令数量# + @指令变动数量#; */
    set v_comm_qty = v_comm_qty + v_comm_occur_qty;

    /* set @指令金额# = @指令金额# + @指令变动金额#; */
    set v_comm_amt = v_comm_amt + v_comm_occur_amt;

    /* set @指令方向#=@临时_指令方向#; */
    set v_comm_dir=v_tmp_comm_dir;

    /* if @指令方向# = 《指令方向-买入》  then */
    if v_comm_dir = 1  then

        /* set @买入指令数量# = @买入指令数量# + @指令变动数量#; */
        set v_buy_comm_qty = v_buy_comm_qty + v_comm_occur_qty;

        /* set @买入指令金额# = @买入指令金额# + @指令变动金额#; */
        set v_buy_comm_amt = v_buy_comm_amt + v_comm_occur_amt;

    /* elseif @指令方向# = 《指令方向-卖出》  then */
    elseif v_comm_dir = 2  then

        /* set @卖出指令数量# = @卖出指令数量# + @指令变动数量#; */
        set v_sell_comm_qty = v_sell_comm_qty + v_comm_occur_qty;

        /* set @卖出指令金额# = @卖出指令金额# + @指令变动金额#; */
        set v_sell_comm_amt = v_sell_comm_amt + v_comm_occur_amt;
    end if;

    /* if @指令审批状态# = 《指令审批状态-不审批》 or @指令审批状态# = 《指令审批状态-审批通过》 then */
    if v_comm_appr_status = "4" or v_comm_appr_status = "2" then

        /* set @指令审批数量# = @指令审批数量# + @指令变动数量#; */
        set v_comm_appr_qty = v_comm_appr_qty + v_comm_occur_qty;
    end if;

    /* set @临时_指令完成日期#  = @指令完成日期#; */
    set v_tmp_comm_comple_date  = v_comm_comple_date;

    /* set @临时_指令完成时间# = @指令完成时间#; */
    set v_tmp_comm_comple_time = v_comm_comple_time;
    #获取指令状态

    /* 调用【原子_交易期货_指令_计算指令汇总状态】*/
    call db_tdfutu.pra_tdfuap_CaclCommSumStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_qty,
        v_order_qty,
        v_comm_cancel_qty,
        v_comm_await_cancel_qty,
        v_strike_qty,
        v_error_code,
        v_error_info,
        v_comm_sum_status);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.33.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令汇总状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_交易期货_指令_计算指令成交状态】*/
    call db_tdfutu.pra_tdfuap_CaclCommStrikeStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_qty,
        v_strike_qty,
        v_comm_cancel_qty,
        v_error_code,
        v_error_info,
        v_strike_status,
        v_comm_comple_date,
        v_comm_comple_time);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.33.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令成交状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_交易期货_指令_计算指令汇总审批状态】*/
    call db_tdfutu.pra_tdfuap_CaclCommSumApprStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_qty,
        v_comm_appr_qty,
        v_error_code,
        v_error_info,
        v_comm_sum_approve_status);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.33.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令汇总审批状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @指令完成日期#  = @临时_指令完成日期#; */
    set v_comm_comple_date  = v_tmp_comm_comple_date;

    /* set @指令完成时间# = @临时_指令完成时间#; */
    set v_comm_comple_time = v_tmp_comm_comple_time;

    /* set @应收保证金# = @临时_应收保证金#; */
    set v_rece_margin = v_tmp_rece_margin;

    /* [更新表记录][交易期货_指令_指令汇总表][{指令数量}=@指令数量#,{指令金额}=@指令金额#,{买入指令数量}=@买入指令数量#,{买入指令金额}=@买入指令金额#,{卖出指令数量}=@卖出指令数量#,{卖出指令金额}=@卖出指令金额#,{指令审批数量}=@指令审批数量#,{指令汇总状态}=@指令汇总状态#,{指令汇总审批状态}=@指令汇总审批状态#,{成交状态}=@成交状态# ,{指令限价} = @指令限价#,{指令实际限价} = @指令实际限价#,{指令开始日期} = @指令开始日期#,{指令结束日期} = @指令结束日期#,{指令开始时间} = @指令开始时间#,{指令结束时间} = @指令结束时间#,{指令完成日期} = @指令完成日期#, {指令完成时间} = @指令完成时间#, {指令最大完成日期} = @指令最大完成日期#, {指令最大完成时间} = @指令最大完成时间#,{应收保证金} ={应收保证金} + @应收保证金# ][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号# and {指令执行人} = @指令执行人#][2][@指令日期#, @机构编号#, @指令批号#, @指令执行人#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfuap_sumcommand set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, comm_qty=v_comm_qty,comm_amt=v_comm_amt,buy_comm_qty=v_buy_comm_qty,buy_comm_amt=v_buy_comm_amt,sell_comm_qty=v_sell_comm_qty,sell_comm_amt=v_sell_comm_amt,comm_appr_qty=v_comm_appr_qty,comm_sum_status=v_comm_sum_status,comm_sum_approve_status=v_comm_sum_approve_status,strike_status=v_strike_status ,comm_limit_price = v_comm_limit_price,limit_actual_price = v_limit_actual_price,comm_begin_date = v_comm_begin_date,comm_end_date = v_comm_end_date,comm_begin_time = v_comm_begin_time,comm_end_time = v_comm_end_time,comm_comple_date = v_comm_comple_date, comm_comple_time = v_comm_comple_time, max_comm_comple_date = v_max_comm_comple_date, max_comm_comple_time = v_max_comm_comple_time,rece_margin =rece_margin + v_rece_margin  where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no and comm_executor = v_comm_executor;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.33.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 指令执行人=", v_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 指令执行人=", v_comm_executor);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_校验订单指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_CheckOrderComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_CheckOrderComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_id bigint,
    IN p_order_date int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_limit_actual_price decimal(16,9),
    OUT p_comm_batch_no int,
    OUT p_exter_comm_flag int,
    OUT p_comm_date int,
    OUT p_comm_executor int,
    OUT p_comm_opor int,
    OUT p_comm_margin decimal(18,4),
    OUT p_comm_order_qty decimal(18,2),
    OUT p_comm_cancel_qty decimal(18,2),
    OUT p_comm_qty decimal(18,2)
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
    declare v_order_date int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_batch_no int;
    declare v_exter_comm_flag int;
    declare v_comm_date int;
    declare v_comm_executor int;
    declare v_comm_opor int;
    declare v_comm_margin decimal(18,4);
    declare v_comm_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_qty decimal(18,2);
    declare v_mach_time int;
    declare v_tmp_order_qty decimal(18,2);
    declare v_comm_status varchar(2);
    declare v_comm_appr_status varchar(2);
    declare v_comm_end_date int;
    declare v_comm_begin_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);

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
    SET v_order_date = p_order_date;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_limit_actual_price = 0;
    SET v_comm_batch_no = 0;
    SET v_exter_comm_flag = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_executor = 0;
    SET v_comm_opor = 0;
    SET v_comm_margin = 0;
    SET v_comm_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_qty = 0;
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_order_qty = 0;
    SET v_comm_status = "0";
    SET v_comm_appr_status = " ";
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* set @临时_订单数量#=@订单数量#; */
    set v_tmp_order_qty=v_order_qty;
    #获取指令信息，检查指令状态

    /* [获取表记录变量][交易期货_指令_指令表][{指令状态},{指令审批状态},{指令执行人},{指令结束日期},{指令开始日期},{指令开始时间},{指令结束时间},{指令数量},{订单数量},{指令撤销数量},{指令方向},{指令限价},{指令实际限价},{指令批号},{指令下达人},{应收保证金},{订单数量}][@指令状态#,@指令审批状态#,@指令执行人#,@指令结束日期#,@指令开始日期#,@指令开始时间#,@指令结束时间#,@指令数量#,@订单数量#,@指令撤销数量#,@指令方向#,@指令限价#,@指令实际限价#,@指令批号#,@指令下达人#,@指令保证金#,@指令订单数量#][{记录序号}=@指令序号#][1][@指令序号#] */
    select comm_status,comm_appr_status,comm_executor,comm_end_date,comm_begin_date,comm_begin_time,comm_end_time,comm_qty,order_qty,comm_cancel_qty,comm_dir,comm_limit_price,limit_actual_price,comm_batch_no,comm_opor,rece_margin,order_qty into v_comm_status,v_comm_appr_status,v_comm_executor,v_comm_end_date,v_comm_begin_date,v_comm_begin_time,v_comm_end_time,v_comm_qty,v_order_qty,v_comm_cancel_qty,v_comm_dir,v_comm_limit_price,v_limit_actual_price,v_comm_batch_no,v_comm_opor,v_comm_margin,v_comm_order_qty from db_tdfutu.tb_tdfuap_command where row_id=v_comm_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.34.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
        leave label_pro;
    end if;

    #数量是否满足指令要求

    /* [检查报错返回][@指令审批状态# <> 《指令审批状态-审批通过》 and @指令审批状态# <> 《指令审批状态-不审批》][626][@指令审批状态#] */
    if v_comm_appr_status <> "2" and v_comm_appr_status <> "4" then
        
        SET v_error_code = "tdfutuA.3.34.626";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令审批状态=",v_comm_appr_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令审批状态=",v_comm_appr_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@指令执行人#=0][627][@指令执行人#] */
    if v_comm_executor=0 then
        
        SET v_error_code = "tdfutuA.3.34.627";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令执行人=",v_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令执行人=",v_comm_executor);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@操作员编号# <> @指令执行人# ][628][@操作员编号#,@指令执行人#] */
    if v_opor_no <> v_comm_executor  then
        
        SET v_error_code = "tdfutuA.3.34.628";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","指令执行人=",v_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,",","指令执行人=",v_comm_executor);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@指令状态#=《指令状态-暂停执行》][804][@指令状态#] */
    if v_comm_status="7" then
        
        SET v_error_code = "tdfutuA.3.34.804";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令状态=",v_comm_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令状态=",v_comm_status);
        end if;
        leave label_pro;
    end if;


    /* if @指令结束日期# <> 0 or @指令开始日期# <> 0 or @指令开始时间# <> 0 or @指令开始时间# <> 0 then */
    if v_comm_end_date <> 0 or v_comm_begin_date <> 0 or v_comm_begin_time <> 0 or v_comm_begin_time <> 0 then

        /* [检查报错返回][@订单日期#>@指令结束日期# or @订单日期# < @指令开始日期# or (@订单日期#=@指令开始日期# and @机器时间# < @指令开始时间#) or (@订单日期#=@指令结束日期# and @机器时间#>@指令结束时间#)][629][@指令开始日期#,@指令开始时间# ,@指令结束日期#,@指令结束时间#] */
        if v_order_date>v_comm_end_date or v_order_date < v_comm_begin_date or (v_order_date=v_comm_begin_date and v_mach_time < v_comm_begin_time) or (v_order_date=v_comm_end_date and v_mach_time>v_comm_end_time) then
            
            SET v_error_code = "tdfutuA.3.34.629";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令开始日期=",v_comm_begin_date,",","指令开始时间 =",v_comm_begin_time ,",","指令结束日期=",v_comm_end_date,",","指令结束时间=",v_comm_end_time),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令开始日期=",v_comm_begin_date,",","指令开始时间 =",v_comm_begin_time ,",","指令结束日期=",v_comm_end_date,",","指令结束时间=",v_comm_end_time);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [检查报错返回][@临时_订单数量#>@指令数量# - @订单数量# - @指令撤销数量#][630][@临时_订单数量#,@指令数量#,@订单数量#,@指令撤销数量#] */
    if v_tmp_order_qty>v_comm_qty - v_order_qty - v_comm_cancel_qty then
        
        SET v_error_code = "tdfutuA.3.34.630";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("临时_订单数量=",v_tmp_order_qty,",","指令数量=",v_comm_qty,",","订单数量=",v_order_qty,",","指令撤销数量=",v_comm_cancel_qty),"#",v_mysql_message);
        else
            SET v_error_info = concat("临时_订单数量=",v_tmp_order_qty,",","指令数量=",v_comm_qty,",","订单数量=",v_order_qty,",","指令撤销数量=",v_comm_cancel_qty);
        end if;
        leave label_pro;
    end if;

    #校验方向是否一致

    /* [检查报错返回][@订单方向# <> @指令方向#][631]["订单下达失败：订单方向与指令方向不一致"] */
    if v_order_dir <> v_comm_dir then
        
        SET v_error_code = "tdfutuA.3.34.631";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("订单下达失败：订单方向与指令方向不一致","#",v_mysql_message);
        else
            SET v_error_info = "订单下达失败：订单方向与指令方向不一致";
        end if;
        leave label_pro;
    end if;

    #价格是否满足指令要求

    /* if @订单方向#=《订单方向-买入》 then */
    if v_order_dir=1 then

        /* [检查报错返回][@指令限价# <> 0 and @订单价格#>@指令限价#][632][@订单价格#,@指令限价#] */
        if v_comm_limit_price <> 0 and v_order_price>v_comm_limit_price then
            
            SET v_error_code = "tdfutuA.3.34.632";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单价格=",v_order_price,",","指令限价=",v_comm_limit_price),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单价格=",v_order_price,",","指令限价=",v_comm_limit_price);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @订单方向#=《订单方向-卖出》 then */
    if v_order_dir=2 then

        /* [检查报错返回][@指令限价# <> 0 and @订单价格# < @指令限价#][632][@订单价格#,@指令限价#] */
        if v_comm_limit_price <> 0 and v_order_price < v_comm_limit_price then
            
            SET v_error_code = "tdfutuA.3.34.632";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单价格=",v_order_price,",","指令限价=",v_comm_limit_price),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单价格=",v_order_price,",","指令限价=",v_comm_limit_price);
            end if;
            leave label_pro;
        end if;

    end if;
    #[检查报错返回][@指令限价# <> 0 and @价格类型# <> 《价格类型-限价》 ][633][@指令限价#,@价格类型#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_limit_actual_price = v_limit_actual_price;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_comm_date = v_comm_date;
    SET p_comm_executor = v_comm_executor;
    SET p_comm_opor = v_comm_opor;
    SET p_comm_margin = v_comm_margin;
    SET p_comm_order_qty = v_comm_order_qty;
    SET p_comm_cancel_qty = v_comm_cancel_qty;
    SET p_comm_qty = v_comm_qty;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_成交更新指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_StrikeUpdateComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_StrikeUpdateComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_id bigint,
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_date int,
    OUT p_comm_batch_no int,
    OUT p_comm_executor int
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
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
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
    declare v_comm_comple_flag int;
    declare v_remark_info varchar(255);

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
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_batch_no = 0;
    SET v_comm_executor = 0;
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_amt = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
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
    SET v_comm_comple_flag = 0;
    SET v_remark_info = " ";

    
    label_pro:BEGIN
    
    #保存输入参数

    /* set @临时_成交数量#=@成交数量#; */
    set v_tmp_strike_qty=v_strike_qty;

    /* set @临时_成交金额#=@成交金额#; */
    set v_tmp_strike_amt=v_strike_amt;
    #防止并发，加锁获取

    /* [不报错锁定获取表记录变量][交易期货_指令_指令表][字段][字段变量][{记录序号}=@指令序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, strike_amt, strike_qty, 
        comm_frozen_qty, rece_margin, capit_reback_days, posi_reback_days, 
        strike_status, comm_status, comm_begin_date, comm_end_date, 
        comm_begin_time, comm_end_time, comm_comple_date, comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_status, comm_appr_oper_no, 
        comm_appr_oper, comm_appr_remark, external_no, comb_code, 
        comm_oper_way, comm_comple_flag, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_code, v_contrc_type, v_asset_type, 
        v_contrc_dir, v_hedge_type, v_comm_date, v_comm_time, 
        v_comm_batch_no, v_comm_opor, v_comm_executor, v_comm_dir, 
        v_comm_limit_price, v_limit_actual_price, v_comm_qty, v_comm_amt, 
        v_order_qty, v_comm_cancel_qty, v_strike_amt, v_strike_qty, 
        v_comm_frozen_qty, v_rece_margin, v_capit_reback_days, v_posi_reback_days, 
        v_strike_status, v_comm_status, v_comm_begin_date, v_comm_end_date, 
        v_comm_begin_time, v_comm_end_time, v_comm_comple_date, v_comm_comple_time, 
        v_comm_appr_date, v_comm_appr_time, v_comm_appr_status, v_comm_appr_oper_no, 
        v_comm_appr_oper, v_comm_appr_remark, v_external_no, v_comb_code, 
        v_comm_oper_way, v_comm_comple_flag, v_remark_info from db_tdfutu.tb_tdfuap_command where row_id=v_comm_id limit 1 for update;


    /* set @成交数量# = @成交数量# + @临时_成交数量#; */
    set v_strike_qty = v_strike_qty + v_tmp_strike_qty;

    /* set @成交金额# = @成交金额# + @临时_成交金额#; */
    set v_strike_amt = v_strike_amt + v_tmp_strike_amt;
    #获取指令成交状态

    /* 调用【原子_交易期货_指令_计算指令成交状态】*/
    call db_tdfutu.pra_tdfuap_CaclCommStrikeStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_qty,
        v_strike_qty,
        v_comm_cancel_qty,
        v_error_code,
        v_error_info,
        v_strike_status,
        v_comm_comple_date,
        v_comm_comple_time);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.35.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令成交状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @指令状态# = 《指令状态-待撤销》  and @指令数量# = @成交数量# then */
    if v_comm_status = "4"  and v_comm_qty = v_strike_qty then

        /* set @指令状态# = 《指令状态-全部执行》; */
        set v_comm_status = "3";
    end if;

    /* if @指令数量# = @成交数量# then */
    if v_comm_qty = v_strike_qty then

        /* set @指令完成标志# = 《指令完成标志-已完成》; */
        set v_comm_comple_flag = 2;
    else

        /* set @指令完成标志# = 《指令完成标志-未完成》; */
        set v_comm_comple_flag = 1;
    end if;
    #测试情况中会出现成交数量大于指令数量的情况，做此保护，看下效果如何

    /* if @指令数量# < @成交数量# then */
    if v_comm_qty < v_strike_qty then

        /* set @成交数量# = @指令数量#; */
        set v_strike_qty = v_comm_qty;
    end if;

    /* [更新表记录][交易期货_指令_指令表][{成交数量}=@成交数量#, {成交金额}=@成交金额#,{成交状态}=@成交状态#,{指令状态}=@指令状态#,{指令完成日期}=@指令完成日期#,{指令完成时间}=@指令完成时间#,{指令完成标志} = @指令完成标志# ][{记录序号}=@指令序号#][2][@指令序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfuap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_qty=v_strike_qty, strike_amt=v_strike_amt,strike_status=v_strike_status,comm_status=v_comm_status,comm_comple_date=v_comm_comple_date,comm_comple_time=v_comm_comple_time,comm_comple_flag = v_comm_comple_flag  where row_id=v_comm_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.35.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
        leave label_pro;
    end if;


    /* set @成交数量#=@临时_成交数量#; */
    set v_strike_qty=v_tmp_strike_qty;

    /* set @成交金额#=@临时_成交金额#; */
    set v_strike_amt=v_tmp_strike_amt;

    /* 调用【原子_交易期货_指令_成交更新汇总指令】*/
    call db_tdfutu.pra_tdfuap_StrikeUpdateSumComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_comm_date,
        v_comm_batch_no,
        v_comm_executor,
        v_comm_status,
        v_comm_dir,
        v_strike_qty,
        v_strike_amt,
        v_comm_comple_date,
        v_comm_comple_time,
        v_comm_oper_way,
        v_exch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.35.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_成交更新汇总指令出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_date = v_comm_date;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_executor = v_comm_executor;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_成交更新汇总指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_StrikeUpdateSumComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_StrikeUpdateSumComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_comm_date int,
    IN p_comm_batch_no int,
    IN p_comm_executor int,
    IN p_comm_status varchar(2),
    IN p_comm_dir int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_comm_comple_date int,
    IN p_comm_comple_time int,
    IN p_comm_oper_way varchar(2),
    IN p_exch_no int,
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
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_comm_status varchar(2);
    declare v_comm_dir int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_oper_way varchar(2);
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_comm_status varchar(2);
    declare v_tmp_comm_comple_date int;
    declare v_tmp_comm_comple_time int;
    declare v_tmp_comm_dir int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
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
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_await_cancel_qty decimal(18,2);
    declare v_strike_status varchar(2);
    declare v_rece_margin decimal(18,4);
    declare v_comm_sum_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
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
    SET v_comm_date = p_comm_date;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_status = p_comm_status;
    SET v_comm_dir = p_comm_dir;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_comm_comple_date = p_comm_comple_date;
    SET v_comm_comple_time = p_comm_comple_time;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_amt = 0;
    SET v_tmp_comm_status = "0";
    SET v_tmp_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_comm_dir = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
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
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_await_cancel_qty = 0;
    SET v_strike_status = "0";
    SET v_rece_margin = 0;
    SET v_comm_sum_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
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

    
    label_pro:BEGIN
    

    /* [检查正常返回][@指令批号# = 0] */
    if v_comm_batch_no = 0 then
        leave label_pro;
    end if;

    #保存输入参数

    /* set @临时_成交数量#=@成交数量#; */
    set v_tmp_strike_qty=v_strike_qty;

    /* set @临时_成交金额#=@成交金额#; */
    set v_tmp_strike_amt=v_strike_amt;

    /* set @临时_指令状态# = @指令状态#; */
    set v_tmp_comm_status = v_comm_status;

    /* set @临时_指令完成日期# = @指令完成日期#; */
    set v_tmp_comm_comple_date = v_comm_comple_date;

    /* set @临时_指令完成时间# = @指令完成时间#; */
    set v_tmp_comm_comple_time = v_comm_comple_time;

    /* set @临时_指令方向#=@指令方向#; */
    set v_tmp_comm_dir=v_comm_dir;

    /* [不报错锁定获取表记录变量][交易期货_指令_指令汇总表][字段][字段变量][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号# and {指令执行人} = @指令执行人#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, comm_await_cancel_qty, strike_amt, 
        strike_qty, strike_status, rece_margin, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        buy_order_qty, sell_order_qty, buy_comm_qty, sell_comm_qty, 
        buy_strike_qty, sell_strike_qty, buy_strike_amt, sell_strike_amt, 
        buy_comm_amt, sell_comm_amt, comm_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_code, v_contrc_type, v_asset_type, 
        v_contrc_dir, v_hedge_type, v_comm_date, v_comm_time, 
        v_comm_batch_no, v_comm_opor, v_comm_executor, v_comm_dir, 
        v_comm_limit_price, v_limit_actual_price, v_comm_qty, v_comm_amt, 
        v_order_qty, v_comm_cancel_qty, v_comm_await_cancel_qty, v_strike_amt, 
        v_strike_qty, v_strike_status, v_rece_margin, v_comm_sum_status, 
        v_comm_begin_date, v_comm_end_date, v_comm_begin_time, v_comm_end_time, 
        v_comm_comple_date, v_comm_comple_time, v_max_comm_comple_date, v_max_comm_comple_time, 
        v_comm_appr_date, v_comm_appr_time, v_comm_appr_qty, v_comm_sum_approve_status, 
        v_buy_order_qty, v_sell_order_qty, v_buy_comm_qty, v_sell_comm_qty, 
        v_buy_strike_qty, v_sell_strike_qty, v_buy_strike_amt, v_sell_strike_amt, 
        v_buy_comm_amt, v_sell_comm_amt, v_comm_oper_way from db_tdfutu.tb_tdfuap_sumcommand where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no and comm_executor = v_comm_executor limit 1 for update;


    /* if @临时_指令完成日期# > 0 and (@临时_指令完成日期# < @指令完成日期# or @指令完成日期# = 0) then */
    if v_tmp_comm_comple_date > 0 and (v_tmp_comm_comple_date < v_comm_comple_date or v_comm_comple_date = 0) then

        /* set @指令完成日期#  = @临时_指令完成日期#; */
        set v_comm_comple_date  = v_tmp_comm_comple_date;
    end if;

    /* if @临时_指令完成日期# > @指令最大完成日期# then */
    if v_tmp_comm_comple_date > v_max_comm_comple_date then

        /* set @指令最大完成日期#  = @临时_指令完成日期#; */
        set v_max_comm_comple_date  = v_tmp_comm_comple_date;
    end if;

    /* if @临时_指令完成时间# > 0 and (@临时_指令完成时间# < @指令完成时间# or @指令完成时间# = 0) then */
    if v_tmp_comm_comple_time > 0 and (v_tmp_comm_comple_time < v_comm_comple_time or v_comm_comple_time = 0) then

        /* set @指令完成时间# = @临时_指令完成时间#; */
        set v_comm_comple_time = v_tmp_comm_comple_time;
    end if;

    /* if @临时_指令完成时间# > @指令最大完成时间# then */
    if v_tmp_comm_comple_time > v_max_comm_comple_time then

        /* set @指令最大完成时间# = @临时_指令完成时间#; */
        set v_max_comm_comple_time = v_tmp_comm_comple_time;
    end if;

    /* set @成交数量# = @成交数量# + @临时_成交数量#; */
    set v_strike_qty = v_strike_qty + v_tmp_strike_qty;

    /* set @成交金额# = @成交金额# + @临时_成交金额#; */
    set v_strike_amt = v_strike_amt + v_tmp_strike_amt;

    /* if @临时_指令状态# = 《指令状态-待撤销》 or @临时_指令状态# = 《指令状态-部分撤销》 then */
    if v_tmp_comm_status = "4" or v_tmp_comm_status = "5" then

        /* set @指令待撤销数量# = @指令待撤销数量# - @临时_成交数量#; */
        set v_comm_await_cancel_qty = v_comm_await_cancel_qty - v_tmp_strike_qty;
    end if;

    /* set @临时_指令完成日期#  = @指令完成日期#; */
    set v_tmp_comm_comple_date  = v_comm_comple_date;

    /* set @临时_指令完成时间# = @指令完成时间#; */
    set v_tmp_comm_comple_time = v_comm_comple_time;

    /* 调用【原子_交易期货_指令_计算指令汇总状态】*/
    call db_tdfutu.pra_tdfuap_CaclCommSumStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_qty,
        v_order_qty,
        v_comm_cancel_qty,
        v_comm_await_cancel_qty,
        v_strike_qty,
        v_error_code,
        v_error_info,
        v_comm_sum_status);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.36.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令汇总状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_交易期货_指令_计算指令成交状态】*/
    call db_tdfutu.pra_tdfuap_CaclCommStrikeStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_qty,
        v_strike_qty,
        v_comm_cancel_qty,
        v_error_code,
        v_error_info,
        v_strike_status,
        v_comm_comple_date,
        v_comm_comple_time);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.36.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_计算指令成交状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @指令完成日期#  = @临时_指令完成日期#; */
    set v_comm_comple_date  = v_tmp_comm_comple_date;

    /* set @指令完成时间# = @临时_指令完成时间#; */
    set v_comm_comple_time = v_tmp_comm_comple_time;

    /* set @指令方向#=@临时_指令方向#; */
    set v_comm_dir=v_tmp_comm_dir;

    /* if @指令方向# = 《指令方向-买入》  then */
    if v_comm_dir = 1  then

        /* set @买入成交数量# = @买入成交数量# + @临时_成交数量#; */
        set v_buy_strike_qty = v_buy_strike_qty + v_tmp_strike_qty;

        /* set @买入成交金额# = @买入成交金额# + @临时_成交金额#; */
        set v_buy_strike_amt = v_buy_strike_amt + v_tmp_strike_amt;

    /* elseif @指令方向# = 《指令方向-卖出》   then */
    elseif v_comm_dir = 2   then

        /* set @卖出成交数量# = @卖出成交数量# + @临时_成交数量#; */
        set v_sell_strike_qty = v_sell_strike_qty + v_tmp_strike_qty;

        /* set @卖出成交金额# = @卖出成交金额# + @临时_成交金额#; */
        set v_sell_strike_amt = v_sell_strike_amt + v_tmp_strike_amt;
    end if;

    /* [更新表记录][交易期货_指令_指令汇总表][{成交数量}=@成交数量#, {成交金额}=@成交金额#,{买入成交数量}=@买入成交数量#, {买入成交金额}=@买入成交金额#,{卖出成交数量}=@卖出成交数量#, {卖出成交金额}=@卖出成交金额#,{指令汇总状态}=@指令汇总状态#,{成交状态}=@成交状态#,{指令待撤销数量}=@指令待撤销数量#,{指令完成日期}=@指令完成日期#,{指令完成时间}=@指令完成时间#,{指令最大完成日期}=@指令最大完成日期#,{指令最大完成时间}=@指令最大完成时间# ][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号# and {指令执行人} = @指令执行人#][2][@指令日期#, @机构编号#, @指令批号#, @指令执行人#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfuap_sumcommand set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_qty=v_strike_qty, strike_amt=v_strike_amt,buy_strike_qty=v_buy_strike_qty, buy_strike_amt=v_buy_strike_amt,sell_strike_qty=v_sell_strike_qty, sell_strike_amt=v_sell_strike_amt,comm_sum_status=v_comm_sum_status,strike_status=v_strike_status,comm_await_cancel_qty=v_comm_await_cancel_qty,comm_comple_date=v_comm_comple_date,comm_comple_time=v_comm_comple_time,max_comm_comple_date=v_max_comm_comple_date,max_comm_comple_time=v_max_comm_comple_time  where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no and comm_executor = v_comm_executor;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.36.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 指令执行人=", v_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,","," 指令执行人=", v_comm_executor);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_检查改单指令业务
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_CheckModiOrderComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_CheckModiOrderComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_comm_id bigint,
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_modi_batch_no int,
    IN p_modi_order_price decimal(16,9),
    IN p_modi_order_qty decimal(18,2),
    IN p_modi_price_type int,
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
    declare v_comm_id bigint;
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_modi_batch_no int;
    declare v_modi_order_price decimal(16,9);
    declare v_modi_order_qty decimal(18,2);
    declare v_modi_price_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    declare v_comm_comple_flag int;
    declare v_remark_info varchar(255);

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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_modi_batch_no = p_modi_batch_no;
    SET v_modi_order_price = p_modi_order_price;
    SET v_modi_order_qty = p_modi_order_qty;
    SET v_modi_price_type = p_modi_price_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
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
    SET v_comm_comple_flag = 0;
    SET v_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易期货_指令_指令表][字段][字段变量][{记录序号}=@指令序号#][1][@指令序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, strike_amt, strike_qty, 
        comm_frozen_qty, rece_margin, capit_reback_days, posi_reback_days, 
        strike_status, comm_status, comm_begin_date, comm_end_date, 
        comm_begin_time, comm_end_time, comm_comple_date, comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_status, comm_appr_oper_no, 
        comm_appr_oper, comm_appr_remark, external_no, comb_code, 
        comm_oper_way, comm_comple_flag, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_code, v_contrc_type, v_asset_type, 
        v_contrc_dir, v_hedge_type, v_comm_date, v_comm_time, 
        v_comm_batch_no, v_comm_opor, v_comm_executor, v_comm_dir, 
        v_comm_limit_price, v_limit_actual_price, v_comm_qty, v_comm_amt, 
        v_order_qty, v_comm_cancel_qty, v_strike_amt, v_strike_qty, 
        v_comm_frozen_qty, v_rece_margin, v_capit_reback_days, v_posi_reback_days, 
        v_strike_status, v_comm_status, v_comm_begin_date, v_comm_end_date, 
        v_comm_begin_time, v_comm_end_time, v_comm_comple_date, v_comm_comple_time, 
        v_comm_appr_date, v_comm_appr_time, v_comm_appr_status, v_comm_appr_oper_no, 
        v_comm_appr_oper, v_comm_appr_remark, v_external_no, v_comb_code, 
        v_comm_oper_way, v_comm_comple_flag, v_remark_info from db_tdfutu.tb_tdfuap_command where row_id=v_comm_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.37.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@改单数量# > @指令数量#][2][concat("改单下达失败：订单数量超出指令数量， 改单数量 = ", @改单数量#, " 指令数量 = ", @指令数量#)] */
    if v_modi_order_qty > v_comm_qty then
        
        SET v_error_code = "tdfutuA.3.37.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("改单下达失败：订单数量超出指令数量， 改单数量 = ", v_modi_order_qty, " 指令数量 = ", v_comm_qty),"#",v_mysql_message);
        else
            SET v_error_info = concat("改单下达失败：订单数量超出指令数量， 改单数量 = ", v_modi_order_qty, " 指令数量 = ", v_comm_qty);
        end if;
        leave label_pro;
    end if;

    #价格是否满足指令要求

    /* if @指令方向# = 《指令方向-买入》 then */
    if v_comm_dir = 1 then

      /* [检查报错返回][@指令限价# <> 0 and @改单价格# > @指令限价#][632][@指令限价#, @改单价格#] */
      if v_comm_limit_price <> 0 and v_modi_order_price > v_comm_limit_price then
          
          SET v_error_code = "tdfutuA.3.37.632";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("指令限价=",v_comm_limit_price,","," 改单价格=", v_modi_order_price),"#",v_mysql_message);
          else
              SET v_error_info = concat("指令限价=",v_comm_limit_price,","," 改单价格=", v_modi_order_price);
          end if;
          leave label_pro;
      end if;

    end if;

    /* if @指令方向# = 《指令方向-卖出》 then */
    if v_comm_dir = 2 then

      /* [检查报错返回][@指令限价# <> 0 and @改单价格# < @指令限价#][632][@指令限价#, @改单价格#] */
      if v_comm_limit_price <> 0 and v_modi_order_price < v_comm_limit_price then
          
          SET v_error_code = "tdfutuA.3.37.632";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("指令限价=",v_comm_limit_price,","," 改单价格=", v_modi_order_price),"#",v_mysql_message);
          else
              SET v_error_info = concat("指令限价=",v_comm_limit_price,","," 改单价格=", v_modi_order_price);
          end if;
          leave label_pro;
      end if;

    end if;

    /* [检查报错返回][@指令限价# <> 0 and @改单价格类型# <> 1][633][@指令限价#,@改单价格类型#] */
    if v_comm_limit_price <> 0 and v_modi_price_type <> 1 then
        
        SET v_error_code = "tdfutuA.3.37.633";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令限价=",v_comm_limit_price,",","改单价格类型=",v_modi_price_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令限价=",v_comm_limit_price,",","改单价格类型=",v_modi_price_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_指令_循环锁定获取指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_LoopLockGetComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_LoopLockGetComm(
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_comm_comple_flag int;

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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_flag = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易期货_指令_指令表][字段][字段变量][{记录序号} > @记录序号# order by {记录序号} asc][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, strike_amt, strike_qty, 
        comm_frozen_qty, rece_margin, capit_reback_days, posi_reback_days, 
        strike_status, comm_status, comm_begin_date, comm_end_date, 
        comm_begin_time, comm_end_time, comm_comple_date, comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_status, comm_appr_oper_no, 
        comm_appr_oper, comm_appr_remark, external_no, comb_code, 
        comm_oper_way, comm_comple_flag, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_code, v_contrc_type, v_asset_type, 
        v_contrc_dir, v_hedge_type, v_comm_date, v_comm_time, 
        v_comm_batch_no, v_comm_opor, v_comm_executor, v_comm_dir, 
        v_comm_limit_price, v_limit_actual_price, v_comm_qty, v_comm_amt, 
        v_order_qty, v_comm_cancel_qty, v_strike_amt, v_strike_qty, 
        v_comm_frozen_qty, v_rece_margin, v_capit_reback_days, v_posi_reback_days, 
        v_strike_status, v_comm_status, v_comm_begin_date, v_comm_end_date, 
        v_comm_begin_time, v_comm_end_time, v_comm_comple_date, v_comm_comple_time, 
        v_comm_appr_date, v_comm_appr_time, v_comm_appr_status, v_comm_appr_oper_no, 
        v_comm_appr_oper, v_comm_appr_remark, v_external_no, v_comb_code, 
        v_comm_oper_way, v_comm_comple_flag, v_remark_info from db_tdfutu.tb_tdfuap_command where row_id > v_row_id order by row_id asc limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.38.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @指令序号# = @记录序号#; */
    set v_comm_id = v_row_id;
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


