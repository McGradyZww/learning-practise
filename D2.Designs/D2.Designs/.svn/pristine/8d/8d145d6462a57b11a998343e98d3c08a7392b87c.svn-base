DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_锁定获取订单回报订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_LockGetRspOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_LockGetRspOrder(
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
    declare v_order_id bigint;
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
    declare v_busi_opor_no int;
    declare v_mach_date int;
    declare v_order_date int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_crncy_type varchar(3);
    declare v_comm_opor int;
    declare v_report_date int;
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_rsp_info varchar(255);
    declare v_sett_flag int;

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
    SET v_busi_opor_no = 0;
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_crncy_type = "CNY";
    SET v_comm_opor = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_strike_all_fee = 0;
    SET v_trade_occur_amt = 0;
    SET v_rsp_info = " ";
    SET v_sett_flag = 0;

    
    label_pro:BEGIN
    

    /* [获取机器日期][@机器日期#] */
    select date_format(curdate(),'%Y%m%d') into v_mach_date;


    /* if @订单日期# = 0 then */
    if v_order_date = 0 then

      /* set @订单日期# = @机器日期#; */
      set v_order_date = v_mach_date;
    end if;

    /* [锁定获取表记录变量][交易期货_交易_订单表][字段][字段变量][{记录序号}=@订单序号#][4][@订单序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, asset_type, 
        contrc_type, contrc_unit, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_batch_no, order_date, order_time, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_qty, 
        strike_price, strike_amt, trade_fee, trade_commis, 
        other_commis, strike_commis, strike_other_commis, report_fee, 
        wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
        comb_code, margin_ratio, rsp_info, compli_trig_id, 
        sett_flag, order_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_no, v_futu_acco_no, 
        v_futu_acco, v_contrc_code_no, v_contrc_code, v_asset_type, 
        v_contrc_type, v_contrc_unit, v_external_no, v_comm_id, 
        v_comm_batch_no, v_comm_opor, v_report_date, v_report_time, 
        v_report_no, v_order_batch_no, v_order_date, v_order_time, 
        v_order_dir, v_contrc_dir, v_hedge_type, v_order_price, 
        v_order_qty, v_order_status, v_wtdraw_qty, v_strike_qty, 
        v_strike_price, v_strike_amt, v_trade_fee, v_trade_commis, 
        v_other_commis, v_strike_commis, v_strike_other_commis, v_report_fee, 
        v_wtdraw_fee, v_strike_all_fee, v_rece_margin, v_trade_occur_amt, 
        v_comb_code, v_margin_ratio, v_rsp_info, v_compli_trig_id, 
        v_sett_flag, v_order_oper_way from db_tdfutu.tb_tdfutd_order where row_id=v_order_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.4.1.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
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
    SET p_busi_opor_no = v_busi_opor_no;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_锁定获取撤单回报订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_LockGetCancelOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_LockGetCancelOrder(
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
    OUT p_external_no bigint,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_report_fee decimal(18,4),
    OUT p_order_batch_no int,
    OUT p_order_dir int,
    OUT p_contrc_dir int,
    OUT p_hedge_type int,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_price decimal(16,9),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_trade_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_comb_code varchar(6),
    OUT p_rece_margin decimal(18,4),
    OUT p_margin_ratio decimal(18,12),
    OUT p_compli_trig_id bigint,
    OUT p_order_oper_way varchar(2)
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
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_report_fee decimal(18,4);
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_price decimal(16,9);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_comb_code varchar(6);
    declare v_rece_margin decimal(18,4);
    declare v_margin_ratio decimal(18,12);
    declare v_compli_trig_id bigint;
    declare v_order_oper_way varchar(2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_asset_type int;
    declare v_comm_opor int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_rsp_info varchar(255);
    declare v_sett_flag int;

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
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_report_fee = 0;
    SET v_order_batch_no = 0;
    SET v_order_dir = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_status = "0";
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_price = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_trade_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_wtdraw_qty = 0;
    SET v_comb_code = " ";
    SET v_rece_margin = 0;
    SET v_margin_ratio = 0;
    SET v_compli_trig_id = 0;
    SET v_order_oper_way = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_asset_type = 0;
    SET v_comm_opor = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_strike_all_fee = 0;
    SET v_trade_occur_amt = 0;
    SET v_rsp_info = " ";
    SET v_sett_flag = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][交易期货_交易_订单表][字段][字段变量][{记录序号} = @订单序号#][4][@订单序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, asset_type, 
        contrc_type, contrc_unit, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_batch_no, order_date, order_time, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_qty, 
        strike_price, strike_amt, trade_fee, trade_commis, 
        other_commis, strike_commis, strike_other_commis, report_fee, 
        wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
        comb_code, margin_ratio, rsp_info, compli_trig_id, 
        sett_flag, order_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_no, v_futu_acco_no, 
        v_futu_acco, v_contrc_code_no, v_contrc_code, v_asset_type, 
        v_contrc_type, v_contrc_unit, v_external_no, v_comm_id, 
        v_comm_batch_no, v_comm_opor, v_report_date, v_report_time, 
        v_report_no, v_order_batch_no, v_order_date, v_order_time, 
        v_order_dir, v_contrc_dir, v_hedge_type, v_order_price, 
        v_order_qty, v_order_status, v_wtdraw_qty, v_strike_qty, 
        v_strike_price, v_strike_amt, v_trade_fee, v_trade_commis, 
        v_other_commis, v_strike_commis, v_strike_other_commis, v_report_fee, 
        v_wtdraw_fee, v_strike_all_fee, v_rece_margin, v_trade_occur_amt, 
        v_comb_code, v_margin_ratio, v_rsp_info, v_compli_trig_id, 
        v_sett_flag, v_order_oper_way from db_tdfutu.tb_tdfutd_order where row_id = v_order_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.4.2.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
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
    SET p_external_no = v_external_no;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_report_fee = v_report_fee;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_dir = v_order_dir;
    SET p_contrc_dir = v_contrc_dir;
    SET p_hedge_type = v_hedge_type;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_status = v_order_status;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_price = v_strike_price;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_trade_fee = v_trade_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_comb_code = v_comb_code;
    SET p_rece_margin = v_rece_margin;
    SET p_margin_ratio = v_margin_ratio;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_order_oper_way = v_order_oper_way;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_锁定获取成交回报订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_LockGetStrikeRspOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_LockGetStrikeRspOrder(
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
    OUT p_busi_opor_no int,
    OUT p_exch_group_no int,
    OUT p_crncy_type varchar(3),
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_asset_type int,
    OUT p_comb_code varchar(6),
    OUT p_report_fee decimal(18,4),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_strike_qty decimal(18,2),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_trade_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_strike_amt decimal(18,4),
    OUT p_comm_id bigint,
    OUT p_rece_margin decimal(18,4),
    OUT p_margin_ratio decimal(18,12),
    OUT p_order_oper_way varchar(2),
    OUT p_compli_trig_id bigint,
    OUT p_order_batch_no int,
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
    declare v_order_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_opor_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_asset_type int;
    declare v_comb_code varchar(6);
    declare v_report_fee decimal(18,4);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_strike_qty decimal(18,2);
    declare v_wtdraw_fee decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_trade_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_strike_amt decimal(18,4);
    declare v_comm_id bigint;
    declare v_rece_margin decimal(18,4);
    declare v_margin_ratio decimal(18,12);
    declare v_order_oper_way varchar(2);
    declare v_compli_trig_id bigint;
    declare v_order_batch_no int;
    declare v_hedge_type int;
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
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_external_no bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_rsp_info varchar(255);
    declare v_sett_flag int;

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
    SET v_busi_opor_no = 0;
    SET v_exch_group_no = 0;
    SET v_crncy_type = "CNY";
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_asset_type = 0;
    SET v_comb_code = " ";
    SET v_report_fee = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_status = "0";
    SET v_strike_qty = 0;
    SET v_wtdraw_fee = 0;
    SET v_wtdraw_qty = 0;
    SET v_trade_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_all_fee = 0;
    SET v_strike_amt = 0;
    SET v_comm_id = 0;
    SET v_rece_margin = 0;
    SET v_margin_ratio = 0;
    SET v_order_oper_way = " ";
    SET v_compli_trig_id = 0;
    SET v_order_batch_no = 0;
    SET v_hedge_type = 0;
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
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_futu_acco = " ";
    SET v_contrc_code = " ";
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_external_no = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_dir = 0;
    SET v_contrc_dir = 0;
    SET v_strike_price = 0;
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_strike_all_fee = 0;
    SET v_trade_occur_amt = 0;
    SET v_rsp_info = " ";
    SET v_sett_flag = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][交易期货_交易_订单表][字段][字段变量][{记录序号} = @订单序号#][4][@订单序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, asset_type, 
        contrc_type, contrc_unit, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_batch_no, order_date, order_time, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_qty, 
        strike_price, strike_amt, trade_fee, trade_commis, 
        other_commis, strike_commis, strike_other_commis, report_fee, 
        wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
        comb_code, margin_ratio, rsp_info, compli_trig_id, 
        sett_flag, order_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_no, v_futu_acco_no, 
        v_futu_acco, v_contrc_code_no, v_contrc_code, v_asset_type, 
        v_contrc_type, v_contrc_unit, v_external_no, v_comm_id, 
        v_comm_batch_no, v_comm_opor, v_report_date, v_report_time, 
        v_report_no, v_order_batch_no, v_order_date, v_order_time, 
        v_order_dir, v_contrc_dir, v_hedge_type, v_order_price, 
        v_order_qty, v_order_status, v_wtdraw_qty, v_strike_qty, 
        v_strike_price, v_strike_amt, v_trade_fee, v_trade_commis, 
        v_other_commis, v_strike_commis, v_strike_other_commis, v_report_fee, 
        v_wtdraw_fee, v_strike_all_fee, v_rece_margin, v_trade_occur_amt, 
        v_comb_code, v_margin_ratio, v_rsp_info, v_compli_trig_id, 
        v_sett_flag, v_order_oper_way from db_tdfutu.tb_tdfutd_order where row_id = v_order_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.4.3.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号#=@操作员编号#; */
    set v_busi_opor_no=v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_crncy_type = v_crncy_type;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_asset_type = v_asset_type;
    SET p_comb_code = v_comb_code;
    SET p_report_fee = v_report_fee;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_status = v_order_status;
    SET p_strike_qty = v_strike_qty;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_trade_fee = v_trade_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_all_fee = v_all_fee;
    SET p_strike_amt = v_strike_amt;
    SET p_comm_id = v_comm_id;
    SET p_rece_margin = v_rece_margin;
    SET p_margin_ratio = v_margin_ratio;
    SET p_order_oper_way = v_order_oper_way;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_order_batch_no = v_order_batch_no;
    SET p_hedge_type = v_hedge_type;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_获取回报订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_GetRspOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_GetRspOrderInfo(
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
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_asset_type int;
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_report_time int;
    declare v_order_status varchar(2);
    declare v_strike_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_margin_ratio decimal(18,12);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_sett_flag int;

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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_asset_type = 0;
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_order_status = "0";
    SET v_strike_price = 0;
    SET v_strike_amt = 0;
    SET v_trade_fee = 0;
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_strike_all_fee = 0;
    SET v_trade_occur_amt = 0;
    SET v_margin_ratio = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_sett_flag = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易期货_交易_订单表][字段][字段变量][{通道编号} = @通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {申报编号}=@申报编号# and {申报日期}=@申报日期#][4][@通道编号#,@外部账号#,@市场编号#,@申报编号#,@申报日期#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, asset_type, 
        contrc_type, contrc_unit, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_batch_no, order_date, order_time, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_qty, 
        strike_price, strike_amt, trade_fee, trade_commis, 
        other_commis, strike_commis, strike_other_commis, report_fee, 
        wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
        comb_code, margin_ratio, rsp_info, compli_trig_id, 
        sett_flag, order_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_no, v_futu_acco_no, 
        v_futu_acco, v_contrc_code_no, v_contrc_code, v_asset_type, 
        v_contrc_type, v_contrc_unit, v_external_no, v_comm_id, 
        v_comm_batch_no, v_comm_opor, v_report_date, v_report_time, 
        v_report_no, v_order_batch_no, v_order_date, v_order_time, 
        v_order_dir, v_contrc_dir, v_hedge_type, v_order_price, 
        v_order_qty, v_order_status, v_wtdraw_qty, v_strike_qty, 
        v_strike_price, v_strike_amt, v_trade_fee, v_trade_commis, 
        v_other_commis, v_strike_commis, v_strike_other_commis, v_report_fee, 
        v_wtdraw_fee, v_strike_all_fee, v_rece_margin, v_trade_occur_amt, 
        v_comb_code, v_margin_ratio, v_rsp_info, v_compli_trig_id, 
        v_sett_flag, v_order_oper_way from db_tdfutu.tb_tdfutd_order where pass_no = v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no and report_no=v_report_no and report_date=v_report_date limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.4.4.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报编号=",v_report_no,",","申报日期=",v_report_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报编号=",v_report_no,",","申报日期=",v_report_date);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号#=@操作员编号#; */
    set v_busi_opor_no=v_opor_no;

    /* set @订单序号#=@记录序号#; */
    set v_order_id=v_row_id;

    /* set @MAC地址#=@操作MAC#; */
    set v_mac_addr=v_oper_mac;

    /* set @IP地址#=@操作IP#; */
    set v_ip_addr=v_oper_ip_addr;

    /* set @上次操作信息#=@操作信息#; */
    set v_last_oper_info=v_oper_info;
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

# 原子_交易期货_交易_检查期货订单重复
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_CheckOrderDuplicate;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_CheckOrderDuplicate(
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
    IN p_external_no bigint,
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
    declare v_external_no bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_id bigint;

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
    SET v_external_no = p_external_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_id = 0;

    
    label_pro:BEGIN
    

    /* set @订单序号# = 0; */
    set v_order_id = 0;

    /* select {记录序号} into @订单序号# from ~交易期货_交易_订单表^ where {初始化日期} = @初始化日期# and {机构编号} = @机构编号# and {产品编号} = @产品编号# and {交易组编号} = @交易组编号# and {外部编号}=@外部编号#; */
    select row_id into v_order_id from db_tdfutu.tb_tdfutd_order where init_date = v_init_date and co_no = v_co_no and pd_no = v_pd_no and exch_group_no = v_exch_group_no and external_no=v_external_no;

    /* [检查报错返回][FOUND_ROWS() = 1][1][@初始化日期#,@机构编号#,@产品编号#,@交易组编号#] */
    if FOUND_ROWS() = 1 then
        
        SET v_error_code = "tdfutuA.4.10.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_校验新增订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_CheckAddOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_CheckAddOrder(
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
    IN p_calc_dir int,
    IN p_lngsht_type int,
    IN p_trade_occur_amt decimal(18,4),
    IN p_exgp_avail_amt decimal(18,4),
    IN p_asac_avail_amt decimal(18,4),
    IN p_order_qty decimal(18,2),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    IN p_order_price decimal(16,9),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_trade_fee decimal(18,4),
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
    declare v_calc_dir int;
    declare v_lngsht_type int;
    declare v_trade_occur_amt decimal(18,4);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_trade_fee decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_crncy_type varchar(3);
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
    SET v_calc_dir = p_calc_dir;
    SET v_lngsht_type = p_lngsht_type;
    SET v_trade_occur_amt = p_trade_occur_amt;
    SET v_exgp_avail_amt = p_exgp_avail_amt;
    SET v_asac_avail_amt = p_asac_avail_amt;
    SET v_order_qty = p_order_qty;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_order_price = p_order_price;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_trade_fee = p_trade_fee;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_comm_avail_amt = 0;
    SET v_trade_avail_amt = 0;
    SET v_static_avail_amt = 0;
    SET v_avail_amt = 0;
    SET v_comm_avail_qty = 0;
    SET v_trade_avail_qty = 0;
    SET v_static_avail_qty = 0;
    SET v_avail_qty = 0;

    
    label_pro:BEGIN
    

    /* set @交易币种# = "CNY"; */
    set v_exch_crncy_type = "CNY";

    /* [检查报错返回][@订单价格# > @涨停价#][17][@涨停价#] */
    if v_order_price > v_up_limit_price then
        
        SET v_error_code = "tdfutuA.4.11.17";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("涨停价=",v_up_limit_price),"#",v_mysql_message);
        else
            SET v_error_info = concat("涨停价=",v_up_limit_price);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@订单价格# < @跌停价#][18][@跌停价#] */
    if v_order_price < v_down_limit_price then
        
        SET v_error_code = "tdfutuA.4.11.18";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("跌停价=",v_down_limit_price),"#",v_mysql_message);
        else
            SET v_error_info = concat("跌停价=",v_down_limit_price);
        end if;
        leave label_pro;
    end if;


    /* if @开平方向# = 《开平方向-开仓》 then */
    if v_contrc_dir = 1 then

      /* if @计算方向# = 《计算方向-加上》 then */
      if v_calc_dir = 1 then

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
            SET v_error_code = "tdfutuA.4.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_计算交易组资金可用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @可用金额#=@交易组可用金额#+@交易端可用金额#; */
        set v_avail_amt=v_exgp_avail_amt+v_trade_avail_amt;

        /* [检查报错返回][@交易变动金额# + @交易费用# > @可用金额#][609][@可用金额#] */
        if v_trade_occur_amt + v_trade_fee > v_avail_amt then
            
            SET v_error_code = "tdfutuA.4.11.609";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("可用金额=",v_avail_amt),"#",v_mysql_message);
            else
                SET v_error_info = concat("可用金额=",v_avail_amt);
            end if;
            leave label_pro;
        end if;

        #[原子_交易期货_账户_计算资产账户资金可用]
        #set @可用金额#=@资产账户可用金额#+@交易端可用金额#;
        #[检查报错返回][@交易变动金额# + @交易费用# > @可用金额#][610][@可用金额#]
      end if;
    else

       /* if @计算方向# = 《计算方向-加上》 then */
       if v_calc_dir = 1 then

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
            SET v_error_code = "tdfutuA.4.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_账户_计算交易组持仓可用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @可用数量#=@交易组可用数量#+@交易端可用数量#; */
        set v_avail_qty=v_exgp_avail_qty+v_trade_avail_qty;

        /* [检查报错返回][@订单数量# > @可用数量#][611][@可用数量#] */
        if v_order_qty > v_avail_qty then
            
            SET v_error_code = "tdfutuA.4.11.611";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty),"#",v_mysql_message);
            else
                SET v_error_info = concat("可用数量=",v_avail_qty);
            end if;
            leave label_pro;
        end if;

        #[原子_交易期货_账户_计算资产账户持仓可用]
        #set @可用数量#=@资产账户可用数量#+@交易端可用数量#;
        #[检查报错返回][@订单数量# > @可用数量#][612][@可用数量#]
       end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_新增订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_AddOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_AddOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_comm_opor int,
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_futu_acco varchar(16),
    IN p_futu_acco_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_pass_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_external_no bigint,
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_batch_no int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_order_status varchar(2),
    IN p_invest_type int,
    IN p_asset_type int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_trade_fee decimal(18,4),
    IN p_report_fee decimal(18,4),
    IN p_wtdraw_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_trade_occur_amt decimal(18,4),
    IN p_rece_margin decimal(18,4),
    IN p_comb_code varchar(6),
    IN p_margin_ratio decimal(18,12),
    IN p_compli_trig_id bigint,
    IN p_crncy_type varchar(3),
    IN p_order_oper_way varchar(2),
    IN p_strike_all_fee decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_id bigint,
    OUT p_order_time int,
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
    declare v_comm_opor int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_futu_acco varchar(16);
    declare v_futu_acco_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_pass_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_invest_type int;
    declare v_asset_type int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_trade_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_margin_ratio decimal(18,12);
    declare v_compli_trig_id bigint;
    declare v_crncy_type varchar(3);
    declare v_order_oper_way varchar(2);
    declare v_strike_all_fee decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_id bigint;
    declare v_order_time int;
    declare v_update_times int;
    declare v_mach_time int;
    declare v_oper_func_code varchar(16);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_rsp_info varchar(255);
    declare v_sett_flag int;
    declare v_strike_other_commis decimal(18,4);
    declare v_strike_commis decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_init_date = p_init_date;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_futu_acco = p_futu_acco;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_pass_no = p_pass_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_external_no = p_external_no;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_order_status = p_order_status;
    SET v_invest_type = p_invest_type;
    SET v_asset_type = p_asset_type;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_trade_fee = p_trade_fee;
    SET v_report_fee = p_report_fee;
    SET v_wtdraw_fee = p_wtdraw_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_trade_occur_amt = p_trade_occur_amt;
    SET v_rece_margin = p_rece_margin;
    SET v_comb_code = p_comb_code;
    SET v_margin_ratio = p_margin_ratio;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_crncy_type = p_crncy_type;
    SET v_order_oper_way = p_order_oper_way;
    SET v_strike_all_fee = p_strike_all_fee;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_id = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_wtdraw_qty = 0;
    SET v_strike_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_amt = 0;
    SET v_rsp_info = " ";
    SET v_sett_flag = 0;
    SET v_strike_other_commis = 0;
    SET v_strike_commis = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* set @操作功能#=" "; */
    set v_oper_func_code=" ";

    /* set @订单时间#=@机器时间#; */
    set v_order_time=v_mach_time;

    /* set @撤单数量#=0; */
    set v_wtdraw_qty=0;

    /* set @成交数量#=0; */
    set v_strike_qty=0;

    /* set @成交价格#=0; */
    set v_strike_price=0;

    /* set @成交金额#=0; */
    set v_strike_amt=0;

    /* set @回报信息#=" "; */
    set v_rsp_info=" ";

    /* set @清算结算标志#=0; */
    set v_sett_flag=0;

    /* set @成交其他佣金#=0; */
    set v_strike_other_commis=0;

    /* set @成交佣金#=0; */
    set v_strike_commis=0;

    /* [插入表记录][交易期货_交易_订单表][字段][字段变量][1][@订单批号#,@订单日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdfutu.tb_tdfutd_order(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, co_no, pd_no, 
        exch_group_no, asset_acco_no, pass_no, out_acco, 
        crncy_type, exch_no, futu_acco_no, futu_acco, 
        contrc_code_no, contrc_code, asset_type, contrc_type, 
        contrc_unit, external_no, comm_id, comm_batch_no, 
        comm_opor, report_date, report_time, report_no, 
        order_batch_no, order_date, order_time, order_dir, 
        contrc_dir, hedge_type, order_price, order_qty, 
        order_status, wtdraw_qty, strike_qty, strike_price, 
        strike_amt, trade_fee, trade_commis, other_commis, 
        strike_commis, strike_other_commis, report_fee, wtdraw_fee, 
        strike_all_fee, rece_margin, trade_occur_amt, comb_code, 
        margin_ratio, rsp_info, compli_trig_id, sett_flag, 
        order_oper_way) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_crncy_type, v_exch_no, v_futu_acco_no, v_futu_acco, 
        v_contrc_code_no, v_contrc_code, v_asset_type, v_contrc_type, 
        v_contrc_unit, v_external_no, v_comm_id, v_comm_batch_no, 
        v_comm_opor, v_report_date, v_report_time, v_report_no, 
        v_order_batch_no, v_order_date, v_order_time, v_order_dir, 
        v_contrc_dir, v_hedge_type, v_order_price, v_order_qty, 
        v_order_status, v_wtdraw_qty, v_strike_qty, v_strike_price, 
        v_strike_amt, v_trade_fee, v_trade_commis, v_other_commis, 
        v_strike_commis, v_strike_other_commis, v_report_fee, v_wtdraw_fee, 
        v_strike_all_fee, v_rece_margin, v_trade_occur_amt, v_comb_code, 
        v_margin_ratio, v_rsp_info, v_compli_trig_id, v_sett_flag, 
        v_order_oper_way);
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.4.12.1";
        SET v_error_info =  CONCAT(concat("订单批号=",v_order_batch_no,",","订单日期=",v_order_date),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@订单序号#] */
    select LAST_INSERT_ID() into v_order_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_id = v_order_id;
    SET p_order_time = v_order_time;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_撤销订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_CancelOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_CancelOrder(
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
    IN p_external_no bigint,
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_trade_fee decimal(18,4),
    IN p_order_status varchar(2),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_wtdraw_batch_no int,
    IN p_wtdraw_qty decimal(18,2),
    IN p_wtdraw_remark varchar(255),
    IN p_wtdraw_status varchar(2),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_report_fee decimal(18,4),
    IN p_wtdraw_fee decimal(18,4),
    IN p_other_commis decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_wtdraw_id bigint,
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
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_external_no bigint;
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_trade_fee decimal(18,4);
    declare v_order_status varchar(2);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_wtdraw_batch_no int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_wtdraw_remark varchar(255);
    declare v_wtdraw_status varchar(2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_wtdraw_id bigint;
    declare v_update_times int;
    declare v_wtdraw_date int;
    declare v_wtdraw_time int;
    declare v_oper_func_code varchar(16);
    declare v_update_date int;
    declare v_update_time int;
    declare v_tmp_update_times int;
    declare v_create_date int;
    declare v_create_time int;

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
    SET v_external_no = p_external_no;
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_trade_fee = p_trade_fee;
    SET v_order_status = p_order_status;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_wtdraw_batch_no = p_wtdraw_batch_no;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_wtdraw_remark = p_wtdraw_remark;
    SET v_wtdraw_status = p_wtdraw_status;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_trade_commis = p_trade_commis;
    SET v_report_fee = p_report_fee;
    SET v_wtdraw_fee = p_wtdraw_fee;
    SET v_other_commis = p_other_commis;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_wtdraw_id = 0;
    SET v_update_times = 1;
    SET v_wtdraw_date = date_format(curdate(),'%Y%m%d');
    SET v_wtdraw_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器日期][@撤单日期#] */
    select date_format(curdate(),'%Y%m%d') into v_wtdraw_date;


    /* [获取机器时间][@撤单时间#] */
    select date_format(curtime(),'%H%i%s') into v_wtdraw_time;


    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;
    #先更新订单表

    /* if @订单状态#<>"0" then */
    if v_order_status<>"0" then

      /* [更新表记录][交易期货_交易_订单表][{撤单数量}=@撤单数量#, {交易佣金} = @交易佣金#, {申报费用} =@申报费用#, {撤单费用} =@撤单费用#, {交易费用} =@交易费用#, {其他佣金} =@其他佣金#,{订单状态} = @订单状态#, {成交数量} = @成交数量#, {成交金额} = @成交金额#][{记录序号}=@订单序号#][2][@订单序号#] */
      set v_update_date = date_format(curdate(),'%Y%m%d');
      set v_update_time = date_format(curtime(),'%H%i%s');
      update db_tdfutu.tb_tdfutd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, wtdraw_qty=v_wtdraw_qty, trade_commis = v_trade_commis, report_fee =v_report_fee, wtdraw_fee =v_wtdraw_fee, trade_fee =v_trade_fee, other_commis =v_other_commis,order_status = v_order_status, strike_qty = v_strike_qty, strike_amt = v_strike_amt where row_id=v_order_id;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.4.13.2";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
          else
              SET v_error_info = concat("订单序号=",v_order_id);
          end if;
          leave label_pro;
      end if;


      /* [获取表记录变量语句][交易期货_交易_订单表][{更新次数}][@更新次数#][{记录序号}=@订单序号#] */
      select update_times into v_update_times from db_tdfutu.tb_tdfutd_order where row_id=v_order_id limit 1;

    end if;

    /* set @临时_更新次数# = @更新次数#; */
    set v_tmp_update_times = v_update_times;
    #再处理撤单表

    /* [插入表记录][交易期货_交易_撤单表][字段][字段变量][1][@订单序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdfutu.tb_tdfutd_wtdraw(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, co_no, pd_no, 
        exch_group_no, asset_acco_no, pass_no, out_acco, 
        crncy_type, exch_no, futu_acco_no, futu_acco, 
        contrc_code_no, contrc_code, external_no, wtdraw_batch_no, 
        wtdraw_date, wtdraw_time, order_date, order_id, 
        report_date, report_time, report_no, wtdraw_status, 
        wtdraw_qty, wtdraw_remark) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_crncy_type, v_exch_no, v_futu_acco_no, v_futu_acco, 
        v_contrc_code_no, v_contrc_code, v_external_no, v_wtdraw_batch_no, 
        v_wtdraw_date, v_wtdraw_time, v_order_date, v_order_id, 
        v_report_date, v_report_time, v_report_no, v_wtdraw_status, 
        v_wtdraw_qty, v_wtdraw_remark);
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.4.13.1";
        SET v_error_info =  CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@撤单序号#] */
    select LAST_INSERT_ID() into v_wtdraw_id;


    /* set @更新次数# = @临时_更新次数#; */
    set v_update_times = v_tmp_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_wtdraw_id = v_wtdraw_id;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_查询报盘订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_QueryRptOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_QueryRptOrder(
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
    

    /* [获取表记录][交易期货_交易_订单表][{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{市场编号},{交易编码},{合约代码},{合约类型},{合约乘数},{外部账号},{外部编号},{开平方向},{套保标志},{记录序号} as {订单序号},{订单日期},{订单方向},{订单数量},{订单价格},{订单状态},{订单操作方式},{更新次数}][{订单日期} = @初始化日期# and {订单状态} in (《订单状态-未报》, 《订单状态-待报》) and (@通道编号# = 0 or {通道编号}=@通道编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select co_no,pd_no,exch_group_no,asset_acco_no,pass_no,exch_no,futu_acco,contrc_code,contrc_type,contrc_unit,out_acco,external_no,contrc_dir,hedge_type,row_id as order_id,order_date,order_dir,order_qty,order_price,order_status,order_oper_way,update_times from db_tdfutu.tb_tdfutd_order where order_date = v_init_date and order_status in ("1", "a") and (v_pass_no = 0 or pass_no=v_pass_no) and row_id > v_row_id order by row_id;
    else
        select co_no,pd_no,exch_group_no,asset_acco_no,pass_no,exch_no,futu_acco,contrc_code,contrc_type,contrc_unit,out_acco,external_no,contrc_dir,hedge_type,row_id as order_id,order_date,order_dir,order_qty,order_price,order_status,order_oper_way,update_times from db_tdfutu.tb_tdfutd_order where order_date = v_init_date and order_status in ("1", "a") and (v_pass_no = 0 or pass_no=v_pass_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_查询报盘撤单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_QueryRptCancelOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_QueryRptCancelOrder(
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
    

    /* [获取表记录][交易期货_交易_撤单表][字段][{初始化日期} = @初始化日期# and {撤单状态} in( 《撤单状态-未报》,《撤单状态-已报》)  and (@通道编号# = 0 or {通道编号}=@通道编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, external_no, 
        wtdraw_batch_no, wtdraw_date, wtdraw_time, order_date, 
        order_id, report_date, report_time, report_no, 
        wtdraw_status, wtdraw_qty, wtdraw_remark from db_tdfutu.tb_tdfutd_wtdraw where init_date = v_init_date and wtdraw_status in( "1","2")  and (v_pass_no = 0 or pass_no=v_pass_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, external_no, 
        wtdraw_batch_no, wtdraw_date, wtdraw_time, order_date, 
        order_id, report_date, report_time, report_no, 
        wtdraw_status, wtdraw_qty, wtdraw_remark from db_tdfutu.tb_tdfutd_wtdraw where init_date = v_init_date and wtdraw_status in( "1","2")  and (v_pass_no = 0 or pass_no=v_pass_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_检查获取撤单订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_CheckGetCancelOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_CheckGetCancelOrder(
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
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
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
    declare v_record_count int;
    declare v_init_date int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_futu_acco varchar(16);
    declare v_asset_type int;
    declare v_contrc_unit int;
    declare v_external_no bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_strike_price decimal(16,9);
    declare v_trade_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_margin_ratio decimal(18,12);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_sett_flag int;
    declare v_order_oper_way varchar(2);

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
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
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
    SET v_record_count = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_out_acco = " ";
    SET v_crncy_type = "CNY";
    SET v_futu_acco = " ";
    SET v_asset_type = 0;
    SET v_contrc_unit = 0;
    SET v_external_no = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_strike_price = 0;
    SET v_trade_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_strike_all_fee = 0;
    SET v_rece_margin = 0;
    SET v_trade_occur_amt = 0;
    SET v_margin_ratio = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_sett_flag = 0;
    SET v_order_oper_way = " ";

    
    label_pro:BEGIN
    
    #检查是否存在已成功的撤单流水

    /* [记录已存在][交易期货_交易_撤单表][@记录个数#][{撤单日期}=@初始化日期# and {订单序号}=@订单序号# and {撤单状态}=《撤单状态-成功》][716][@订单序号#] */
    select count(1) into v_record_count from db_tdfutu.tb_tdfutd_wtdraw where wtdraw_date=v_init_date and order_id=v_order_id and wtdraw_status="3" limit 1;
    if v_record_count > 0 then
                
        SET v_error_code = "tdfutuA.4.19.716";
        SET v_error_info = concat("订单序号=",v_order_id);
        leave label_pro;
    end if;


    /* [获取表记录变量][交易期货_交易_订单表][字段][字段变量][{记录序号}=@订单序号#][4][@订单序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, asset_type, 
        contrc_type, contrc_unit, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_batch_no, order_date, order_time, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_qty, 
        strike_price, strike_amt, trade_fee, trade_commis, 
        other_commis, strike_commis, strike_other_commis, report_fee, 
        wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
        comb_code, margin_ratio, rsp_info, compli_trig_id, 
        sett_flag, order_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_no, v_futu_acco_no, 
        v_futu_acco, v_contrc_code_no, v_contrc_code, v_asset_type, 
        v_contrc_type, v_contrc_unit, v_external_no, v_comm_id, 
        v_comm_batch_no, v_comm_opor, v_report_date, v_report_time, 
        v_report_no, v_order_batch_no, v_order_date, v_order_time, 
        v_order_dir, v_contrc_dir, v_hedge_type, v_order_price, 
        v_order_qty, v_order_status, v_wtdraw_qty, v_strike_qty, 
        v_strike_price, v_strike_amt, v_trade_fee, v_trade_commis, 
        v_other_commis, v_strike_commis, v_strike_other_commis, v_report_fee, 
        v_wtdraw_fee, v_strike_all_fee, v_rece_margin, v_trade_occur_amt, 
        v_comb_code, v_margin_ratio, v_rsp_info, v_compli_trig_id, 
        v_sett_flag, v_order_oper_way from db_tdfutu.tb_tdfutd_order where row_id=v_order_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.4.19.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
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
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
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

# 原子_交易期货_交易_检查锁定获取待撤订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_CheckLockGetPreCancelOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_CheckLockGetPreCancelOrder(
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
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_crncy_type varchar(3),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_futu_acco_no int,
    OUT p_futu_acco varchar(16),
    OUT p_contrc_code_no int,
    OUT p_contrc_code varchar(6),
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_external_no bigint,
    OUT p_contrc_dir int,
    OUT p_hedge_type int,
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_dir int,
    OUT p_order_time int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_price decimal(16,9),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_trade_fee decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_wtdraw_time int,
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_comb_code varchar(6),
    OUT p_margin_ratio decimal(18,12),
    OUT p_rece_margin decimal(18,4),
    OUT p_rsp_info varchar(255),
    OUT p_compli_trig_id bigint,
    OUT p_order_batch_no int,
    OUT p_order_oper_way varchar(2)
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_crncy_type varchar(3);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_futu_acco_no int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_external_no bigint;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_dir int;
    declare v_order_time int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_price decimal(16,9);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_wtdraw_time int;
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comb_code varchar(6);
    declare v_margin_ratio decimal(18,12);
    declare v_rece_margin decimal(18,4);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_order_batch_no int;
    declare v_order_oper_way varchar(2);
    declare v_record_count int;
    declare v_init_date int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_asset_type int;
    declare v_comm_opor int;
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_sett_flag int;

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
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_crncy_type = "CNY";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_futu_acco_no = 0;
    SET v_futu_acco = " ";
    SET v_contrc_code_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_external_no = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_dir = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_status = "0";
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_price = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_trade_fee = 0;
    SET v_wtdraw_qty = 0;
    SET v_wtdraw_time = date_format(curtime(),'%H%i%s');
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comb_code = " ";
    SET v_margin_ratio = 0;
    SET v_rece_margin = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_order_batch_no = 0;
    SET v_order_oper_way = " ";
    SET v_record_count = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_asset_type = 0;
    SET v_comm_opor = 0;
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_strike_all_fee = 0;
    SET v_trade_occur_amt = 0;
    SET v_sett_flag = 0;

    
    label_pro:BEGIN
    
    #检查是否存在已成功的撤单流水

    /* [记录已存在][交易期货_交易_撤单表][@记录个数#][{撤单日期}=@初始化日期# and {订单序号}=@订单序号# and {撤单状态}=《撤单状态-成功》][716][@订单序号#] */
    select count(1) into v_record_count from db_tdfutu.tb_tdfutd_wtdraw where wtdraw_date=v_init_date and order_id=v_order_id and wtdraw_status="3" limit 1;
    if v_record_count > 0 then
                
        SET v_error_code = "tdfutuA.4.20.716";
        SET v_error_info = concat("订单序号=",v_order_id);
        leave label_pro;
    end if;


    /* [锁定获取表记录变量][交易期货_交易_订单表][字段][字段变量][{记录序号}=@订单序号#][4][@订单序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, asset_type, 
        contrc_type, contrc_unit, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_batch_no, order_date, order_time, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_qty, 
        strike_price, strike_amt, trade_fee, trade_commis, 
        other_commis, strike_commis, strike_other_commis, report_fee, 
        wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
        comb_code, margin_ratio, rsp_info, compli_trig_id, 
        sett_flag, order_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_no, v_futu_acco_no, 
        v_futu_acco, v_contrc_code_no, v_contrc_code, v_asset_type, 
        v_contrc_type, v_contrc_unit, v_external_no, v_comm_id, 
        v_comm_batch_no, v_comm_opor, v_report_date, v_report_time, 
        v_report_no, v_order_batch_no, v_order_date, v_order_time, 
        v_order_dir, v_contrc_dir, v_hedge_type, v_order_price, 
        v_order_qty, v_order_status, v_wtdraw_qty, v_strike_qty, 
        v_strike_price, v_strike_amt, v_trade_fee, v_trade_commis, 
        v_other_commis, v_strike_commis, v_strike_other_commis, v_report_fee, 
        v_wtdraw_fee, v_strike_all_fee, v_rece_margin, v_trade_occur_amt, 
        v_comb_code, v_margin_ratio, v_rsp_info, v_compli_trig_id, 
        v_sett_flag, v_order_oper_way from db_tdfutu.tb_tdfutd_order where row_id=v_order_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.4.20.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@订单状态# <> 《订单状态-未报》 and @订单状态# <> 《订单状态-已报》  and @订单状态# <> 《订单状态-部成》 ][717]["请检查订单状态，只有未报、已报、部成订单允许撤单"] */
    if v_order_status <> "1" and v_order_status <> "2"  and v_order_status <> "5"  then
        
        SET v_error_code = "tdfutuA.4.20.717";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("请检查订单状态，只有未报、已报、部成订单允许撤单","#",v_mysql_message);
        else
            SET v_error_info = "请检查订单状态，只有未报、已报、部成订单允许撤单";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_crncy_type = v_crncy_type;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_futu_acco = v_futu_acco;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_code = v_contrc_code;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_external_no = v_external_no;
    SET p_contrc_dir = v_contrc_dir;
    SET p_hedge_type = v_hedge_type;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_dir = v_order_dir;
    SET p_order_time = v_order_time;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_status = v_order_status;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_price = v_strike_price;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_trade_fee = v_trade_fee;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_wtdraw_time = v_wtdraw_time;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comb_code = v_comb_code;
    SET p_margin_ratio = v_margin_ratio;
    SET p_rece_margin = v_rece_margin;
    SET p_rsp_info = v_rsp_info;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_oper_way = v_order_oper_way;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_更新订单状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_UpdateOrderStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_UpdateOrderStatus(
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
    IN p_rsp_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_order_status varchar(2);
    declare v_rsp_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_times int;
    declare v_mach_date int;
    declare v_tmp_order_status varchar(2);
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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_order_status = p_order_status;
    SET v_rsp_info = p_rsp_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_times = 1;
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_order_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器日期][@机器日期#] */
    select date_format(curdate(),'%Y%m%d') into v_mach_date;


    /* if @订单日期# = 0 then */
    if v_order_date = 0 then

        /* set @订单日期# = @机器日期#; */
        set v_order_date = v_mach_date;
    end if;

    /* set @临时_订单状态# = @订单状态#; */
    set v_tmp_order_status = v_order_status;

    /* [锁定获取表记录变量][交易期货_交易_订单表][{订单状态},{更新次数}][@订单状态#,@更新次数#][{记录序号} = @订单序号#][4][@订单序号#] */
    select order_status,update_times into v_order_status,v_update_times from db_tdfutu.tb_tdfutd_order where row_id = v_order_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.4.21.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* if @临时_订单状态# = 《订单状态-正报》 then */
    if v_tmp_order_status = "b" then

        /* [检查报错返回][@订单状态# <> 《订单状态-未报》 and @订单状态# <> 《订单状态-待报》 ][773][@订单序号#,@订单状态#] */
        if v_order_status <> "1" and v_order_status <> "a"  then
            
            SET v_error_code = "tdfutuA.4.21.773";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单序号=",v_order_id,",","订单状态=",v_order_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单序号=",v_order_id,",","订单状态=",v_order_status);
            end if;
            leave label_pro;
        end if;


        /* [更新表记录][交易期货_交易_订单表][{订单状态} = @临时_订单状态#][{记录序号} = @订单序号#][2][@订单序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdfutu.tb_tdfutd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_status = v_tmp_order_status where row_id = v_order_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdfutuA.4.21.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单序号=",v_order_id);
            end if;
            leave label_pro;
        end if;

    else

        /* [更新表记录][交易期货_交易_订单表][{订单状态} = @临时_订单状态#][{记录序号} = @订单序号#][2][@订单序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdfutu.tb_tdfutd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_status = v_tmp_order_status where row_id = v_order_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdfutuA.4.21.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单序号=",v_order_id);
            end if;
            leave label_pro;
        end if;

    end if;
    #if @订单状态#<>"0" then
      #[更新表记录][交易期货_交易_订单表][{回报信息} = @回报信息#,{订单状态} = case when @订单状态# = 《订单状态-正报》 and {订单状态} <> 《订单状态-待报》 then {订单状态} else @订单状态# end][{记录序号} = @订单序号#][2][@订单序号#]
    #end if;

    /* set @更新次数#=@更新次数#+1; */
    set v_update_times=v_update_times+1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_更新撤单状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_UpdateCancelOrderStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_UpdateCancelOrderStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_report_date int,
    IN p_report_no varchar(32),
    IN p_order_id bigint,
    IN p_wtdraw_status varchar(2),
    IN p_wtdraw_qty decimal(18,2),
    IN p_wtdraw_remark varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_order_id bigint;
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_wtdraw_remark varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_times int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_rsp_info varchar(255);

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
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_order_id = p_order_id;
    SET v_wtdraw_status = p_wtdraw_status;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_wtdraw_remark = p_wtdraw_remark;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_times = 1;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_rsp_info = " ";

    
    label_pro:BEGIN
    

    /* if @撤单数量# = 0 then */
    if v_wtdraw_qty = 0 then

      /* [更新表记录][交易期货_交易_撤单表][{撤单状态} = @撤单状态#, {撤单说明} = @回报信息#][{订单序号} = @订单序号#][2][@订单序号#] */
      set v_update_date = date_format(curdate(),'%Y%m%d');
      set v_update_time = date_format(curtime(),'%H%i%s');
      update db_tdfutu.tb_tdfutd_wtdraw set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, wtdraw_status = v_wtdraw_status, wtdraw_remark = v_rsp_info where order_id = v_order_id;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.4.22.2";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
          else
              SET v_error_info = concat("订单序号=",v_order_id);
          end if;
          leave label_pro;
      end if;

    else

      /* [更新表记录][交易期货_交易_撤单表][{撤单数量} = @撤单数量# ,{撤单状态} = @撤单状态#, {撤单说明} = @回报信息#][{订单序号} = @订单序号#][2][@订单序号#] */
      set v_update_date = date_format(curdate(),'%Y%m%d');
      set v_update_time = date_format(curtime(),'%H%i%s');
      update db_tdfutu.tb_tdfutd_wtdraw set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, wtdraw_qty = v_wtdraw_qty ,wtdraw_status = v_wtdraw_status, wtdraw_remark = v_rsp_info where order_id = v_order_id;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.4.22.2";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
          else
              SET v_error_info = concat("订单序号=",v_order_id);
          end if;
          leave label_pro;
      end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_更新期货订单表记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_UpdateOrderRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_UpdateOrderRecord(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_order_id bigint,
    IN p_order_date int,
    IN p_order_status varchar(2),
    IN p_report_no varchar(32),
    IN p_report_date int,
    IN p_report_fee decimal(18,4),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_price decimal(16,9),
    IN p_wtdraw_qty decimal(18,2),
    IN p_wtdraw_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_strike_commis decimal(18,4),
    IN p_strike_other_commis decimal(18,4),
    IN p_strike_all_fee decimal(18,4),
    IN p_trade_occur_amt decimal(18,4),
    IN p_trade_fee decimal(18,4),
    IN p_rsp_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_exch_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_status varchar(2);
    declare v_report_no varchar(32);
    declare v_report_date int;
    declare v_report_fee decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_price decimal(16,9);
    declare v_wtdraw_qty decimal(18,2);
    declare v_wtdraw_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_rsp_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_times int;
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
    SET v_exch_no = p_exch_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_order_id = p_order_id;
    SET v_order_date = p_order_date;
    SET v_order_status = p_order_status;
    SET v_report_no = p_report_no;
    SET v_report_date = p_report_date;
    SET v_report_fee = p_report_fee;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_price = p_strike_price;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_wtdraw_fee = p_wtdraw_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_strike_commis = p_strike_commis;
    SET v_strike_other_commis = p_strike_other_commis;
    SET v_strike_all_fee = p_strike_all_fee;
    SET v_trade_occur_amt = p_trade_occur_amt;
    SET v_trade_fee = p_trade_fee;
    SET v_rsp_info = p_rsp_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_times = 1;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* if @订单状态#<>"0" then */
    if v_order_status<>"0" then

      /* [更新表记录][交易期货_交易_订单表][{撤单数量} = @撤单数量#, {交易佣金} = @交易佣金#,{其他佣金} = @其他佣金#,{成交佣金}={成交佣金}+@成交佣金#, {成交其他佣金}={成交其他佣金}+@成交其他佣金#,{成交全部费用}={成交全部费用}+@成交全部费用#,{申报费用} = @申报费用#, {撤单费用} = @撤单费用#, {订单状态} = @订单状态#, {成交数量} ={成交数量} + @成交数量#, {成交金额} = {成交金额}+@成交金额#, {成交价格} = @成交价格#,{回报信息}=@回报信息#,{交易变动金额}={交易变动金额}+@交易变动金额#,{交易费用} = {交易费用} + @交易费用#][{记录序号} = @订单序号#][2][@订单序号#] */
      set v_update_date = date_format(curdate(),'%Y%m%d');
      set v_update_time = date_format(curtime(),'%H%i%s');
      update db_tdfutu.tb_tdfutd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, wtdraw_qty = v_wtdraw_qty, trade_commis = v_trade_commis,other_commis = v_other_commis,strike_commis=strike_commis+v_strike_commis, strike_other_commis=strike_other_commis+v_strike_other_commis,strike_all_fee=strike_all_fee+v_strike_all_fee,report_fee = v_report_fee, wtdraw_fee = v_wtdraw_fee, order_status = v_order_status, strike_qty =strike_qty + v_strike_qty, strike_amt = strike_amt+v_strike_amt, strike_price = v_strike_price,rsp_info=v_rsp_info,trade_occur_amt=trade_occur_amt+v_trade_occur_amt,trade_fee = trade_fee + v_trade_fee where row_id = v_order_id;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.4.23.2";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
          else
              SET v_error_info = concat("订单序号=",v_order_id);
          end if;
          leave label_pro;
      end if;

      #[插入重复更新][交易期货_交易_订单表][{撤单数量} = @撤单数量#, {交易佣金} = @交易佣金#,{其他佣金} = @其他佣金#,{成交佣金}={成交佣金}+@成交佣金#, {成交其他佣金}={成交其他佣金}+@成交其他佣金#,{成交全部费用}={成交全部费用}+@成交全部费用#,{申报费用} = @申报费用#, {撤单费用} = @撤单费用#, {订单状态} = @订单状态#, {成交数量} = @成交数量#, {成交金额} = {成交金额}+@成交金额#, {成交价格} = @成交价格#,{回报信息}=@回报信息#,{交易变动金额}={交易变动金额}+@交易变动金额#,{交易费用} = {交易费用} + @交易费用#][1][@订单序号#]
    end if;

    /* [获取表记录变量语句][交易期货_交易_订单表][{更新次数}][@更新次数#][{记录序号}=@订单序号#] */
    select update_times into v_update_times from db_tdfutu.tb_tdfutd_order where row_id=v_order_id limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_锁定获取指令订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_LockGetCommOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_LockGetCommOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_comm_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_pass_no int,
    OUT p_futu_acco varchar(16),
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_crncy_type varchar(3),
    OUT p_asset_type int,
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_external_no bigint,
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_dir int,
    OUT p_order_batch_no int,
    OUT p_contrc_dir int,
    OUT p_hedge_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_order_status varchar(2),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_amt decimal(18,4),
    OUT p_trade_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_strike_commis decimal(18,4),
    OUT p_strike_other_commis decimal(18,4),
    OUT p_strike_all_fee decimal(18,4),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_rece_margin decimal(18,4),
    OUT p_trade_occur_amt decimal(18,4),
    OUT p_comb_code varchar(6),
    OUT p_margin_ratio decimal(18,12),
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
    declare v_init_date int;
    declare v_comm_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_pass_no int;
    declare v_futu_acco varchar(16);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_crncy_type varchar(3);
    declare v_asset_type int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_external_no bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_order_batch_no int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_margin_ratio decimal(18,12);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_order_oper_way varchar(2);
    declare v_update_times int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_func_code varchar(16);
    declare v_contrc_code varchar(6);
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_sett_flag int;

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_pass_no = 0;
    SET v_futu_acco = " ";
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_crncy_type = "CNY";
    SET v_asset_type = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_external_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_order_batch_no = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_strike_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_amt = 0;
    SET v_trade_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_strike_all_fee = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_rece_margin = 0;
    SET v_trade_occur_amt = 0;
    SET v_comb_code = " ";
    SET v_margin_ratio = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_order_oper_way = " ";
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_contrc_code = " ";
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_sett_flag = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][交易期货_交易_订单表][字段][字段变量][{指令序号} = @指令序号# and {订单状态} in (《订单状态-未报》,《订单状态-已报》,《订单状态-部成》)  order by {记录序号} asc][4][@指令序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, asset_type, 
        contrc_type, contrc_unit, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_batch_no, order_date, order_time, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_qty, 
        strike_price, strike_amt, trade_fee, trade_commis, 
        other_commis, strike_commis, strike_other_commis, report_fee, 
        wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
        comb_code, margin_ratio, rsp_info, compli_trig_id, 
        sett_flag, order_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_no, v_futu_acco_no, 
        v_futu_acco, v_contrc_code_no, v_contrc_code, v_asset_type, 
        v_contrc_type, v_contrc_unit, v_external_no, v_comm_id, 
        v_comm_batch_no, v_comm_opor, v_report_date, v_report_time, 
        v_report_no, v_order_batch_no, v_order_date, v_order_time, 
        v_order_dir, v_contrc_dir, v_hedge_type, v_order_price, 
        v_order_qty, v_order_status, v_wtdraw_qty, v_strike_qty, 
        v_strike_price, v_strike_amt, v_trade_fee, v_trade_commis, 
        v_other_commis, v_strike_commis, v_strike_other_commis, v_report_fee, 
        v_wtdraw_fee, v_strike_all_fee, v_rece_margin, v_trade_occur_amt, 
        v_comb_code, v_margin_ratio, v_rsp_info, v_compli_trig_id, 
        v_sett_flag, v_order_oper_way from db_tdfutu.tb_tdfutd_order where comm_id = v_comm_id and order_status in ("1","2","5")  order by row_id asc limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.4.24.4";
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
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_no = v_exch_no;
    SET p_pass_no = v_pass_no;
    SET p_futu_acco = v_futu_acco;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_crncy_type = v_crncy_type;
    SET p_asset_type = v_asset_type;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_external_no = v_external_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_dir = v_order_dir;
    SET p_order_batch_no = v_order_batch_no;
    SET p_contrc_dir = v_contrc_dir;
    SET p_hedge_type = v_hedge_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_order_status = v_order_status;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_price = v_strike_price;
    SET p_strike_amt = v_strike_amt;
    SET p_trade_fee = v_trade_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_strike_commis = v_strike_commis;
    SET p_strike_other_commis = v_strike_other_commis;
    SET p_strike_all_fee = v_strike_all_fee;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_rece_margin = v_rece_margin;
    SET p_trade_occur_amt = v_trade_occur_amt;
    SET p_comb_code = v_comb_code;
    SET p_margin_ratio = v_margin_ratio;
    SET p_rsp_info = v_rsp_info;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_order_oper_way = v_order_oper_way;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_查询订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_QueryOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_QueryOrder(
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
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易期货_交易_订单表][字段][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单序号#=0 or {记录序号}=@订单序号#) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@订单状态串#=" " or instr(@订单状态串#, concat(";",{订单状态},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, crncy_type, exch_no, futu_acco_no, 
            futu_acco, contrc_code_no, contrc_code, asset_type, 
            contrc_type, contrc_unit, external_no, comm_id, 
            comm_batch_no, comm_opor, report_date, report_time, 
            report_no, order_batch_no, order_date, order_time, 
            order_dir, contrc_dir, hedge_type, order_price, 
            order_qty, order_status, wtdraw_qty, strike_qty, 
            strike_price, strike_amt, trade_fee, trade_commis, 
            other_commis, strike_commis, strike_other_commis, report_fee, 
            wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
            comb_code, margin_ratio, rsp_info, compli_trig_id, 
            sett_flag, order_oper_way from db_tdfutu.tb_tdfutd_order where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_comm_id=0 or comm_id=v_comm_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, crncy_type, exch_no, futu_acco_no, 
            futu_acco, contrc_code_no, contrc_code, asset_type, 
            contrc_type, contrc_unit, external_no, comm_id, 
            comm_batch_no, comm_opor, report_date, report_time, 
            report_no, order_batch_no, order_date, order_time, 
            order_dir, contrc_dir, hedge_type, order_price, 
            order_qty, order_status, wtdraw_qty, strike_qty, 
            strike_price, strike_amt, trade_fee, trade_commis, 
            other_commis, strike_commis, strike_other_commis, report_fee, 
            wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
            comb_code, margin_ratio, rsp_info, compli_trig_id, 
            sett_flag, order_oper_way from db_tdfutu.tb_tdfutd_order where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_comm_id=0 or comm_id=v_comm_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易期货_交易_订单表][字段][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单序号#=0 or {记录序号}=@订单序号#) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@订单状态串#=" " or instr(@订单状态串#, concat(";",{订单状态},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, crncy_type, exch_no, futu_acco_no, 
            futu_acco, contrc_code_no, contrc_code, asset_type, 
            contrc_type, contrc_unit, external_no, comm_id, 
            comm_batch_no, comm_opor, report_date, report_time, 
            report_no, order_batch_no, order_date, order_time, 
            order_dir, contrc_dir, hedge_type, order_price, 
            order_qty, order_status, wtdraw_qty, strike_qty, 
            strike_price, strike_amt, trade_fee, trade_commis, 
            other_commis, strike_commis, strike_other_commis, report_fee, 
            wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
            comb_code, margin_ratio, rsp_info, compli_trig_id, 
            sett_flag, order_oper_way from db_tdfutu.tb_tdfutd_order where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_comm_id=0 or comm_id=v_comm_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, crncy_type, exch_no, futu_acco_no, 
            futu_acco, contrc_code_no, contrc_code, asset_type, 
            contrc_type, contrc_unit, external_no, comm_id, 
            comm_batch_no, comm_opor, report_date, report_time, 
            report_no, order_batch_no, order_date, order_time, 
            order_dir, contrc_dir, hedge_type, order_price, 
            order_qty, order_status, wtdraw_qty, strike_qty, 
            strike_price, strike_amt, trade_fee, trade_commis, 
            other_commis, strike_commis, strike_other_commis, report_fee, 
            wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
            comb_code, margin_ratio, rsp_info, compli_trig_id, 
            sett_flag, order_oper_way from db_tdfutu.tb_tdfutd_order where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_comm_id=0 or comm_id=v_comm_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_查询订单历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_QueryOrder_His;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_QueryOrder_His(
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
    

    /* [获取表记录][历史_交易期货_交易_订单表][字段][({订单日期} between @开始日期# and @结束日期#) and (@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单序号#=0 or {记录序号}=@订单序号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@订单状态串#=" " or instr(@订单状态串#, concat(";",{订单状态},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, asset_type, 
        contrc_type, contrc_unit, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_batch_no, order_date, order_time, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_qty, 
        strike_price, strike_amt, trade_fee, trade_commis, 
        other_commis, strike_commis, strike_other_commis, report_fee, 
        wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
        comb_code, margin_ratio, rsp_info, compli_trig_id, 
        sett_flag, order_oper_way from db_tdfutu_his.tb_tdfutd_order_his where (order_date between v_begin_date and v_end_date) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, asset_type, 
        contrc_type, contrc_unit, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_batch_no, order_date, order_time, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_qty, 
        strike_price, strike_amt, trade_fee, trade_commis, 
        other_commis, strike_commis, strike_other_commis, report_fee, 
        wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
        comb_code, margin_ratio, rsp_info, compli_trig_id, 
        sett_flag, order_oper_way from db_tdfutu_his.tb_tdfutd_order_his where (order_date between v_begin_date and v_end_date) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_根据订单序号串查询订单结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_QueryOrderListByOrderIdStr;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_QueryOrderListByOrderIdStr(
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
    declare v_row_count int;

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
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @订单序号串# = concat(";",@订单序号串#); */
    set v_order_id_str = concat(";",v_order_id_str);

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][交易期货_交易_订单表][字段][instr(@订单序号串#, concat(";",{记录序号},";"))>0][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, asset_type, 
        contrc_type, contrc_unit, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_batch_no, order_date, order_time, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_qty, 
        strike_price, strike_amt, trade_fee, trade_commis, 
        other_commis, strike_commis, strike_other_commis, report_fee, 
        wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
        comb_code, margin_ratio, rsp_info, compli_trig_id, 
        sett_flag, order_oper_way from db_tdfutu.tb_tdfutd_order where instr(v_order_id_str, concat(";",row_id,";"))>0;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, asset_type, 
        contrc_type, contrc_unit, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_batch_no, order_date, order_time, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_qty, 
        strike_price, strike_amt, trade_fee, trade_commis, 
        other_commis, strike_commis, strike_other_commis, report_fee, 
        wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
        comb_code, margin_ratio, rsp_info, compli_trig_id, 
        sett_flag, order_oper_way from db_tdfutu.tb_tdfutd_order where instr(v_order_id_str, concat(";",row_id,";"))>0 limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_根据订单序号串查询撤单结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_QueryCancelOrderListByOrderIdStr;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_QueryCancelOrderListByOrderIdStr(
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
    declare v_row_count int;

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
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @订单序号串# = concat(";",@订单序号串#); */
    set v_order_id_str = concat(";",v_order_id_str);

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][交易期货_交易_撤单表][字段][instr(@订单序号串#, concat(";",{记录序号},";"))>0][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, external_no, 
        wtdraw_batch_no, wtdraw_date, wtdraw_time, order_date, 
        order_id, report_date, report_time, report_no, 
        wtdraw_status, wtdraw_qty, wtdraw_remark from db_tdfutu.tb_tdfutd_wtdraw where instr(v_order_id_str, concat(";",row_id,";"))>0;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, external_no, 
        wtdraw_batch_no, wtdraw_date, wtdraw_time, order_date, 
        order_id, report_date, report_time, report_no, 
        wtdraw_status, wtdraw_qty, wtdraw_remark from db_tdfutu.tb_tdfutd_wtdraw where instr(v_order_id_str, concat(";",row_id,";"))>0 limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_订单处理汇总订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_OrderDealSumOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_OrderDealSumOrder(
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
    IN p_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_contrc_code_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_type int,
    IN p_asset_type int,
    IN p_order_date int,
    IN p_order_batch_no int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_order_status varchar(2),
    IN p_wtdraw_qty decimal(18,2),
    IN p_waste_qty decimal(18,2),
    IN p_rece_margin decimal(18,4),
    IN p_order_oper_way varchar(2),
    IN p_contrc_unit int,
    IN p_external_no bigint,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_trade_fee decimal(18,4),
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
    declare v_pass_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_waste_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_contrc_unit int;
    declare v_external_no bigint;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_trade_fee decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_order_status varchar(2);
    declare v_order_sum_status varchar(2);
    declare v_tmp_pd_no int;
    declare v_tmp_exch_group_no int;
    declare v_tmp_asset_acco_no int;
    declare v_tmp_pass_no int;
    declare v_tmp_external_no bigint;
    declare v_tmp_contrc_code varchar(6);
    declare v_tmp_contrc_code_no int;
    declare v_tmp_order_dir int;
    declare v_tmp_order_price decimal(16,9);
    declare v_tmp_contrc_type int;
    declare v_tmp_asset_type int;
    declare v_tmp_crncy_type varchar(3);
    declare v_tmp_exch_no int;
    declare v_tmp_contrc_dir int;
    declare v_tmp_hedge_type int;
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_aver_price decimal(16,9);
    declare v_oper_func_code varchar(16);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_row_id bigint;
    declare v_tmp_contrc_unit int;

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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_type = p_contrc_type;
    SET v_asset_type = p_asset_type;
    SET v_order_date = p_order_date;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_order_status = p_order_status;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_waste_qty = p_waste_qty;
    SET v_rece_margin = p_rece_margin;
    SET v_order_oper_way = p_order_oper_way;
    SET v_contrc_unit = p_contrc_unit;
    SET v_external_no = p_external_no;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_trade_fee = p_trade_fee;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_order_status = "0";
    SET v_order_sum_status = "0";
    SET v_tmp_pd_no = 0;
    SET v_tmp_exch_group_no = 0;
    SET v_tmp_asset_acco_no = 0;
    SET v_tmp_pass_no = 0;
    SET v_tmp_external_no = 0;
    SET v_tmp_contrc_code = " ";
    SET v_tmp_contrc_code_no = 0;
    SET v_tmp_order_dir = 0;
    SET v_tmp_order_price = 0;
    SET v_tmp_contrc_type = 0;
    SET v_tmp_asset_type = 0;
    SET v_tmp_crncy_type = "CNY";
    SET v_tmp_exch_no = 0;
    SET v_tmp_contrc_dir = 0;
    SET v_tmp_hedge_type = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_aver_price = 0;
    SET v_oper_func_code = " ";
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_strike_all_fee = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_tmp_contrc_unit = 0;

    
    label_pro:BEGIN
    

    /* [检查正常返回][@订单批号# <=0 ] */
    if v_order_batch_no <=0  then
        leave label_pro;
    end if;


    /* set @临时_订单状态# = @订单状态#; */
    set v_tmp_order_status = v_order_status;

    /* set @订单汇总状态# = 《订单汇总状态-未成》; */
    set v_order_sum_status = "1";

    /* set @临时_产品编号# = @产品编号#; */
    set v_tmp_pd_no = v_pd_no;

    /* set @临时_交易组编号# = @交易组编号#; */
    set v_tmp_exch_group_no = v_exch_group_no;

    /* set @临时_资产账户编号# = @资产账户编号#; */
    set v_tmp_asset_acco_no = v_asset_acco_no;

    /* set @临时_通道编号# = @通道编号#; */
    set v_tmp_pass_no = v_pass_no;

    /* set @临时_外部编号# = @外部编号#; */
    set v_tmp_external_no = v_external_no;

    /* set @临时_合约代码# = @合约代码#; */
    set v_tmp_contrc_code = v_contrc_code;

    /* set @临时_合约代码编号# = @合约代码编号#; */
    set v_tmp_contrc_code_no = v_contrc_code_no;

    /* set @临时_订单方向# = @订单方向#; */
    set v_tmp_order_dir = v_order_dir;

    /* set @临时_订单价格# = @订单价格#; */
    set v_tmp_order_price = v_order_price;

    /* set @临时_合约类型# = @合约类型#; */
    set v_tmp_contrc_type = v_contrc_type;

    /* set @临时_资产类型# = @资产类型#; */
    set v_tmp_asset_type = v_asset_type;

    /* set @临时_本币币种# = @本币币种#; */
    set v_tmp_crncy_type = v_crncy_type;

    /* set @临时_市场编号# = @市场编号#; */
    set v_tmp_exch_no = v_exch_no;

    /* set @临时_开平方向# = @开平方向#; */
    set v_tmp_contrc_dir = v_contrc_dir;

    /* set @临时_套保标志# = @套保标志#; */
    set v_tmp_hedge_type = v_hedge_type;

    /* set @成交金额# = 0; */
    set v_strike_amt = 0;

    /* set @成交数量# = 0; */
    set v_strike_qty = 0;

    /* set @成交均价# = 0; */
    set v_strike_aver_price = 0;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @交易佣金# = 0; */
    set v_trade_commis = 0;

    /* set @其他佣金# = 0; */
    set v_other_commis = 0;

    /* set @成交佣金# = 0; */
    set v_strike_commis = 0;

    /* set @成交其他佣金# = 0; */
    set v_strike_other_commis = 0;

    /* set @申报费用# = 0; */
    set v_report_fee = 0;

    /* set @撤单费用# = 0; */
    set v_wtdraw_fee = 0;

    /* set @成交全部费用# = 0; */
    set v_strike_all_fee = 0;

    /* [插入重复更新][交易期货_交易_订单汇总表][字段][字段变量][{订单价格}=Round(({订单价格}*{订单数量} + @订单价格# * @订单数量#)/({订单数量}+@订单数量#),3),{订单数量}={订单数量}+@订单数量#, {撤单数量}={撤单数量}+@撤单数量#,{废单数量}={废单数量}+@废单数量#,{应收保证金} = {应收保证金} +@应收保证金#,{交易费用} = {交易费用} + @交易费用#][1][@订单日期#, @机构编号#, @订单批号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdfutu.tb_tdfutd_sumorder (
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, co_no, pd_no, 
        exch_group_no, asset_acco_no, pass_no, crncy_type, 
        exch_no, contrc_code_no, contrc_code, asset_type, 
        contrc_type, contrc_unit, external_no, order_batch_no, 
        order_date, order_dir, contrc_dir, hedge_type, 
        order_price, order_qty, order_sum_status, wtdraw_qty, 
        waste_qty, strike_qty, strike_aver_price, strike_amt, 
        trade_fee, trade_commis, other_commis, strike_commis, 
        strike_other_commis, report_fee, wtdraw_fee, strike_all_fee, 
        rece_margin, order_oper_way) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_pass_no, v_crncy_type, 
        v_exch_no, v_contrc_code_no, v_contrc_code, v_asset_type, 
        v_contrc_type, v_contrc_unit, v_external_no, v_order_batch_no, 
        v_order_date, v_order_dir, v_contrc_dir, v_hedge_type, 
        v_order_price, v_order_qty, v_order_sum_status, v_wtdraw_qty, 
        v_waste_qty, v_strike_qty, v_strike_aver_price, v_strike_amt, 
        v_trade_fee, v_trade_commis, v_other_commis, v_strike_commis, 
        v_strike_other_commis, v_report_fee, v_wtdraw_fee, v_strike_all_fee, 
        v_rece_margin, v_order_oper_way) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, order_price=Round((order_price*order_qty + v_order_price * v_order_qty)/(order_qty+v_order_qty),3),order_qty=order_qty+v_order_qty, wtdraw_qty=wtdraw_qty+v_wtdraw_qty,waste_qty=waste_qty+v_waste_qty,rece_margin = rece_margin +v_rece_margin,trade_fee = trade_fee + v_trade_fee;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.4.27.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no);
        end if;
        leave label_pro;
    end if;


    /* [锁定获取表记录变量][交易期货_交易_订单汇总表][字段][字段变量][{订单日期}=@订单日期# and {机构编号} = @机构编号# and {订单批号}= @订单批号#][4][@订单日期#, @机构编号#, @订单批号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        crncy_type, exch_no, contrc_code_no, contrc_code, 
        asset_type, contrc_type, contrc_unit, external_no, 
        order_batch_no, order_date, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, order_sum_status, 
        wtdraw_qty, waste_qty, strike_qty, strike_aver_price, 
        strike_amt, trade_fee, trade_commis, other_commis, 
        strike_commis, strike_other_commis, report_fee, wtdraw_fee, 
        strike_all_fee, rece_margin, order_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_crncy_type, v_exch_no, v_contrc_code_no, v_contrc_code, 
        v_asset_type, v_contrc_type, v_contrc_unit, v_external_no, 
        v_order_batch_no, v_order_date, v_order_dir, v_contrc_dir, 
        v_hedge_type, v_order_price, v_order_qty, v_order_sum_status, 
        v_wtdraw_qty, v_waste_qty, v_strike_qty, v_strike_aver_price, 
        v_strike_amt, v_trade_fee, v_trade_commis, v_other_commis, 
        v_strike_commis, v_strike_other_commis, v_report_fee, v_wtdraw_fee, 
        v_strike_all_fee, v_rece_margin, v_order_oper_way from db_tdfutu.tb_tdfutd_sumorder where order_date=v_order_date and co_no = v_co_no and order_batch_no= v_order_batch_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.4.27.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no);
        end if;
        leave label_pro;
    end if;


    /* if @临时_产品编号# <> @产品编号# then */
    if v_tmp_pd_no <> v_pd_no then

      /* set @产品编号# = 0; */
      set v_pd_no = 0;
    end if;

    /* if @临时_交易组编号# <> @交易组编号# then */
    if v_tmp_exch_group_no <> v_exch_group_no then

        /* set @交易组编号# = 0; */
        set v_exch_group_no = 0;
    end if;

    /* if @临时_资产账户编号# <> @资产账户编号# then */
    if v_tmp_asset_acco_no <> v_asset_acco_no then

        /* set @资产账户编号# = 0; */
        set v_asset_acco_no = 0;
    end if;

    /* if @临时_通道编号# <> @通道编号# then */
    if v_tmp_pass_no <> v_pass_no then

        /* set @通道编号# = 0; */
        set v_pass_no = 0;
    end if;

    /* if @临时_外部编号# <> @外部编号# then */
    if v_tmp_external_no <> v_external_no then

        /* set @外部编号# = 0; */
        set v_external_no = 0;
    end if;

    /* if @临时_合约代码# <> @合约代码# then */
    if v_tmp_contrc_code <> v_contrc_code then

        /* set @合约代码# = " "; */
        set v_contrc_code = " ";
    end if;

    /* if @临时_合约代码编号# <> @合约代码编号# then */
    if v_tmp_contrc_code_no <> v_contrc_code_no then

        /* set @合约代码编号#= 0; */
        set v_contrc_code_no= 0;
    end if;

    /* if @临时_订单方向# <> @订单方向# then */
    if v_tmp_order_dir <> v_order_dir then

        /* set @订单方向# = 0; */
        set v_order_dir = 0;
    end if;

    /* if @临时_合约类型# <> @合约类型# then */
    if v_tmp_contrc_type <> v_contrc_type then

        /* set @合约类型# = 0; */
        set v_contrc_type = 0;
    end if;

    /* if @临时_合约乘数# <> @合约乘数# then */
    if v_tmp_contrc_unit <> v_contrc_unit then

        /* set @合约乘数# = 0; */
        set v_contrc_unit = 0;
    end if;

    /* if @临时_资产类型# <> @资产类型# then */
    if v_tmp_asset_type <> v_asset_type then

        /* set @资产类型# = 0; */
        set v_asset_type = 0;
    end if;

    /* if @临时_订单方向# <> @订单方向# then */
    if v_tmp_order_dir <> v_order_dir then

        /* set @订单方向# = 0; */
        set v_order_dir = 0;
    end if;

    /* if @临时_开平方向# <> @开平方向# then */
    if v_tmp_contrc_dir <> v_contrc_dir then

        /* set @开平方向# = 0; */
        set v_contrc_dir = 0;
    end if;

    /* if @临时_本币币种# <> @本币币种# then */
    if v_tmp_crncy_type <> v_crncy_type then

        /* set @本币币种#= " "; */
        set v_crncy_type= " ";
    end if;

    /* if @临时_套保标志# <> @套保标志# then */
    if v_tmp_hedge_type <> v_hedge_type then

        /* set @套保标志#= 0; */
        set v_hedge_type= 0;
    end if;

    /* if @临时_市场编号# <> @市场编号# then */
    if v_tmp_exch_no <> v_exch_no then

        /* set @市场编号# = 0; */
        set v_exch_no = 0;
    end if;

    /* 调用【原子_交易期货_交易_计算订单汇总状态】*/
    call db_tdfutu.pra_tdfutd_CaclOrderSumStatus(
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
        v_waste_qty,
        v_error_code,
        v_error_info,
        v_order_sum_status);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.4.27.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_计算订单汇总状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [更新表记录][交易期货_交易_订单汇总表][{订单汇总状态}=@订单汇总状态#,{产品编号} = @产品编号#,{交易组编号} = @交易组编号#, {资产账户编号}=@资产账户编号#,{通道编号}=@通道编号#,{外部编号}=@外部编号#,{合约代码} = @合约代码#,{合约代码编号} =@合约代码编号#,{订单方向} = @订单方向#,{开平方向}=@开平方向#,{合约类型} = @合约类型#,{资产类型} = @资产类型#,{本币币种} = @本币币种#,{套保标志} = @套保标志#,{市场编号} = @市场编号#][{订单日期}=@订单日期# and {机构编号} = @机构编号# and {订单批号}= @订单批号#][2][@订单日期#, @机构编号#,@订单批号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfutd_sumorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_sum_status=v_order_sum_status,pd_no = v_pd_no,exch_group_no = v_exch_group_no, asset_acco_no=v_asset_acco_no,pass_no=v_pass_no,external_no=v_external_no,contrc_code = v_contrc_code,contrc_code_no =v_contrc_code_no,order_dir = v_order_dir,contrc_dir=v_contrc_dir,contrc_type = v_contrc_type,asset_type = v_asset_type,crncy_type = v_crncy_type,hedge_type = v_hedge_type,exch_no = v_exch_no where order_date=v_order_date and co_no = v_co_no and order_batch_no= v_order_batch_no;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.4.27.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,",","订单批号=",v_order_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,",","订单批号=",v_order_batch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_计算订单汇总状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_CaclOrderSumStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_CaclOrderSumStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_qty decimal(18,2),
    IN p_wtdraw_qty decimal(18,2),
    IN p_strike_qty decimal(18,2),
    IN p_waste_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_sum_status varchar(2)
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
    declare v_strike_qty decimal(18,2);
    declare v_waste_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_sum_status varchar(2);

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
    SET v_strike_qty = p_strike_qty;
    SET v_waste_qty = p_waste_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_sum_status = "0";

    
    label_pro:BEGIN
    

    /* set @订单汇总状态# = 《订单汇总状态-未成》; */
    set v_order_sum_status = "1";

    /* if @订单数量# = @废单数量# then */
    if v_order_qty = v_waste_qty then

        /* set @订单汇总状态# = 《订单汇总状态-全废》; */
        set v_order_sum_status = "7";

    /* elseif @订单数量# > @废单数量# and @废单数量# > 0  then */
    elseif v_order_qty > v_waste_qty and v_waste_qty > 0  then

        /* set @订单汇总状态# = 《订单汇总状态-部废》; */
        set v_order_sum_status = "6";

    /* elseif @订单数量# = @撤单数量# then */
    elseif v_order_qty = v_wtdraw_qty then

        /* set @订单汇总状态# = 《订单汇总状态-全撤》; */
        set v_order_sum_status = "5";

    /* elseif @订单数量# > @撤单数量# and @撤单数量# > 0  then */
    elseif v_order_qty > v_wtdraw_qty and v_wtdraw_qty > 0  then

        /* set @订单汇总状态# = 《订单汇总状态-部撤》; */
        set v_order_sum_status = "4";

    /* elseif @订单数量# = @成交数量# then */
    elseif v_order_qty = v_strike_qty then

        /* set @订单汇总状态# = 《订单汇总状态-全成》; */
        set v_order_sum_status = "3";

    /* elseif @订单数量# > @成交数量# and @成交数量# > 0  then */
    elseif v_order_qty > v_strike_qty and v_strike_qty > 0  then

        /* set @订单汇总状态# = 《订单汇总状态-部成》; */
        set v_order_sum_status = "2";
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_sum_status = v_order_sum_status;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_撤单处理汇总订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_CancelDealSumOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_CancelDealSumOrder(
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
    IN p_order_date int,
    IN p_order_batch_no int,
    IN p_wtdraw_qty decimal(18,2),
    IN p_waste_qty decimal(18,2),
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_waste_qty decimal(18,2);
    declare v_order_oper_way varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_pd_no int;
    declare v_tmp_exch_group_no int;
    declare v_tmp_asset_acco_no int;
    declare v_tmp_pass_no int;
    declare v_tmp_wtdraw_qty decimal(18,2);
    declare v_tmp_waste_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
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
    SET v_order_date = p_order_date;
    SET v_order_batch_no = p_order_batch_no;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_waste_qty = p_waste_qty;
    SET v_order_oper_way = p_order_oper_way;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_pd_no = 0;
    SET v_tmp_exch_group_no = 0;
    SET v_tmp_asset_acco_no = 0;
    SET v_tmp_pass_no = 0;
    SET v_tmp_wtdraw_qty = 0;
    SET v_tmp_waste_qty = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
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

    
    label_pro:BEGIN
    

    /* [检查正常返回][@订单批号# = 0] */
    if v_order_batch_no = 0 then
        leave label_pro;
    end if;


    /* set @临时_产品编号# = @产品编号#; */
    set v_tmp_pd_no = v_pd_no;

    /* set @临时_交易组编号# = @交易组编号#; */
    set v_tmp_exch_group_no = v_exch_group_no;

    /* set @临时_资产账户编号# = @资产账户编号#; */
    set v_tmp_asset_acco_no = v_asset_acco_no;

    /* set @临时_通道编号# = @通道编号#; */
    set v_tmp_pass_no = v_pass_no;

    /* set @临时_撤单数量# = @撤单数量#; */
    set v_tmp_wtdraw_qty = v_wtdraw_qty;

    /* set @临时_废单数量# = @废单数量#; */
    set v_tmp_waste_qty = v_waste_qty;

    /* [锁定获取表记录变量][交易期货_交易_订单汇总表][字段][字段变量][{订单日期}=@订单日期# and {机构编号} = @机构编号# and {订单批号}= @订单批号#][4][@订单日期#, @机构编号#, @订单批号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        crncy_type, exch_no, contrc_code_no, contrc_code, 
        asset_type, contrc_type, contrc_unit, external_no, 
        order_batch_no, order_date, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, order_sum_status, 
        wtdraw_qty, waste_qty, strike_qty, strike_aver_price, 
        strike_amt, trade_fee, trade_commis, other_commis, 
        strike_commis, strike_other_commis, report_fee, wtdraw_fee, 
        strike_all_fee, rece_margin, order_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_crncy_type, v_exch_no, v_contrc_code_no, v_contrc_code, 
        v_asset_type, v_contrc_type, v_contrc_unit, v_external_no, 
        v_order_batch_no, v_order_date, v_order_dir, v_contrc_dir, 
        v_hedge_type, v_order_price, v_order_qty, v_order_sum_status, 
        v_wtdraw_qty, v_waste_qty, v_strike_qty, v_strike_aver_price, 
        v_strike_amt, v_trade_fee, v_trade_commis, v_other_commis, 
        v_strike_commis, v_strike_other_commis, v_report_fee, v_wtdraw_fee, 
        v_strike_all_fee, v_rece_margin, v_order_oper_way from db_tdfutu.tb_tdfutd_sumorder where order_date=v_order_date and co_no = v_co_no and order_batch_no= v_order_batch_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.4.29.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no);
        end if;
        leave label_pro;
    end if;


    /* set @撤单数量# = @临时_撤单数量# + @撤单数量#; */
    set v_wtdraw_qty = v_tmp_wtdraw_qty + v_wtdraw_qty;

    /* set @废单数量# = @临时_废单数量# + @废单数量#; */
    set v_waste_qty = v_tmp_waste_qty + v_waste_qty;

    /* 调用【原子_交易期货_交易_计算订单汇总状态】*/
    call db_tdfutu.pra_tdfutd_CaclOrderSumStatus(
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
        v_waste_qty,
        v_error_code,
        v_error_info,
        v_order_sum_status);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.4.29.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_计算订单汇总状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [更新表记录][交易期货_交易_订单汇总表][{订单汇总状态}=@订单汇总状态#,{撤单数量}=@撤单数量#, {废单数量}=@废单数量#][{订单日期}=@订单日期# and {机构编号} = @机构编号# and {订单批号}= @订单批号#][2][@订单日期#, @机构编号#,@订单批号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfutd_sumorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_sum_status=v_order_sum_status,wtdraw_qty=v_wtdraw_qty, waste_qty=v_waste_qty where order_date=v_order_date and co_no = v_co_no and order_batch_no= v_order_batch_no;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.4.29.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,",","订单批号=",v_order_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,",","订单批号=",v_order_batch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_获取订单汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_GetSumOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_GetSumOrder(
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
    OUT p_all_fee decimal(18,4),
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
    declare v_all_fee decimal(18,4);
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_trade_fee decimal(18,4);

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
    SET v_all_fee = 0;
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_trade_fee = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易期货_交易_订单汇总表][字段][字段变量][{订单日期}=@订单日期# and {机构编号} = @机构编号# and {订单批号} = @订单批号#][4][@订单日期#,@机构编号#,@订单批号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        crncy_type, exch_no, contrc_code_no, contrc_code, 
        asset_type, contrc_type, contrc_unit, external_no, 
        order_batch_no, order_date, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, order_sum_status, 
        wtdraw_qty, waste_qty, strike_qty, strike_aver_price, 
        strike_amt, trade_fee, trade_commis, other_commis, 
        strike_commis, strike_other_commis, report_fee, wtdraw_fee, 
        strike_all_fee, rece_margin, order_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_crncy_type, v_exch_no, v_contrc_code_no, v_contrc_code, 
        v_asset_type, v_contrc_type, v_contrc_unit, v_external_no, 
        v_order_batch_no, v_order_date, v_order_dir, v_contrc_dir, 
        v_hedge_type, v_order_price, v_order_qty, v_order_sum_status, 
        v_wtdraw_qty, v_waste_qty, v_strike_qty, v_strike_aver_price, 
        v_strike_amt, v_trade_fee, v_trade_commis, v_other_commis, 
        v_strike_commis, v_strike_other_commis, v_report_fee, v_wtdraw_fee, 
        v_strike_all_fee, v_rece_margin, v_order_oper_way from db_tdfutu.tb_tdfutd_sumorder where order_date=v_order_date and co_no = v_co_no and order_batch_no = v_order_batch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.4.30.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,",","机构编号=",v_co_no,",","订单批号=",v_order_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,",","机构编号=",v_co_no,",","订单批号=",v_order_batch_no);
        end if;
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
    SET p_all_fee = v_all_fee;
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

# 原子_交易期货_交易_查询汇总订单结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_QuerySumOrderList;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_QuerySumOrderList(
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
    declare v_order_sum_status_str varchar(64);
    declare v_order_oper_way varchar(2);

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
    SET v_order_status_str = p_order_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_sum_status_str = " ";
    SET v_order_oper_way = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易期货_交易_订单汇总表][字段][{机构编号}=@操作员机构编号#  and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#)  and (@合约类型串#=" " or instr(@合约类型串#, concat(";",{合约类型},";"))>0) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@订单汇总状态串#=" " or instr(@订单汇总状态串#, concat(";",{订单汇总状态},";"))>0) and (@订单序号#=0 or {记录序号} = @订单序号#) and (@订单批号#=0 or {订单批号} = @订单批号#) and (@订单操作方式# = " " or {订单操作方式} = @订单操作方式#)   and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            crncy_type, exch_no, contrc_code_no, contrc_code, 
            asset_type, contrc_type, contrc_unit, external_no, 
            order_batch_no, order_date, order_dir, contrc_dir, 
            hedge_type, order_price, order_qty, order_sum_status, 
            wtdraw_qty, waste_qty, strike_qty, strike_aver_price, 
            strike_amt, trade_fee, trade_commis, other_commis, 
            strike_commis, strike_other_commis, report_fee, wtdraw_fee, 
            strike_all_fee, rece_margin, order_oper_way from db_tdfutu.tb_tdfutd_sumorder where co_no=v_opor_co_no  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_contrc_type_str=" " or instr(v_contrc_type_str, concat(";",contrc_type,";"))>0) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_sum_status_str=" " or instr(v_order_sum_status_str, concat(";",order_sum_status,";"))>0) and (v_order_id=0 or row_id = v_order_id) and (v_order_batch_no=0 or order_batch_no = v_order_batch_no) and (v_order_oper_way = " " or order_oper_way = v_order_oper_way)   and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            crncy_type, exch_no, contrc_code_no, contrc_code, 
            asset_type, contrc_type, contrc_unit, external_no, 
            order_batch_no, order_date, order_dir, contrc_dir, 
            hedge_type, order_price, order_qty, order_sum_status, 
            wtdraw_qty, waste_qty, strike_qty, strike_aver_price, 
            strike_amt, trade_fee, trade_commis, other_commis, 
            strike_commis, strike_other_commis, report_fee, wtdraw_fee, 
            strike_all_fee, rece_margin, order_oper_way from db_tdfutu.tb_tdfutd_sumorder where co_no=v_opor_co_no  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_contrc_type_str=" " or instr(v_contrc_type_str, concat(";",contrc_type,";"))>0) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_sum_status_str=" " or instr(v_order_sum_status_str, concat(";",order_sum_status,";"))>0) and (v_order_id=0 or row_id = v_order_id) and (v_order_batch_no=0 or order_batch_no = v_order_batch_no) and (v_order_oper_way = " " or order_oper_way = v_order_oper_way)   and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易期货_交易_订单汇总表][字段][{机构编号}=@操作员机构编号#  and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#)  and (@合约类型串#=" " or instr(@合约类型串#, concat(";",{合约类型},";"))>0) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@订单汇总状态串#=" " or instr(@订单汇总状态串#, concat(";",{订单汇总状态},";"))>0) and (@订单序号#=0 or {记录序号} = @订单序号#) and (@订单批号#=0 or {订单批号} = @订单批号#) and (@订单操作方式# = " " or {订单操作方式} = @订单操作方式#)   and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            crncy_type, exch_no, contrc_code_no, contrc_code, 
            asset_type, contrc_type, contrc_unit, external_no, 
            order_batch_no, order_date, order_dir, contrc_dir, 
            hedge_type, order_price, order_qty, order_sum_status, 
            wtdraw_qty, waste_qty, strike_qty, strike_aver_price, 
            strike_amt, trade_fee, trade_commis, other_commis, 
            strike_commis, strike_other_commis, report_fee, wtdraw_fee, 
            strike_all_fee, rece_margin, order_oper_way from db_tdfutu.tb_tdfutd_sumorder where co_no=v_opor_co_no  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_contrc_type_str=" " or instr(v_contrc_type_str, concat(";",contrc_type,";"))>0) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_sum_status_str=" " or instr(v_order_sum_status_str, concat(";",order_sum_status,";"))>0) and (v_order_id=0 or row_id = v_order_id) and (v_order_batch_no=0 or order_batch_no = v_order_batch_no) and (v_order_oper_way = " " or order_oper_way = v_order_oper_way)   and row_id<v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            crncy_type, exch_no, contrc_code_no, contrc_code, 
            asset_type, contrc_type, contrc_unit, external_no, 
            order_batch_no, order_date, order_dir, contrc_dir, 
            hedge_type, order_price, order_qty, order_sum_status, 
            wtdraw_qty, waste_qty, strike_qty, strike_aver_price, 
            strike_amt, trade_fee, trade_commis, other_commis, 
            strike_commis, strike_other_commis, report_fee, wtdraw_fee, 
            strike_all_fee, rece_margin, order_oper_way from db_tdfutu.tb_tdfutd_sumorder where co_no=v_opor_co_no  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_contrc_type_str=" " or instr(v_contrc_type_str, concat(";",contrc_type,";"))>0) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_sum_status_str=" " or instr(v_order_sum_status_str, concat(";",order_sum_status,";"))>0) and (v_order_id=0 or row_id = v_order_id) and (v_order_batch_no=0 or order_batch_no = v_order_batch_no) and (v_order_oper_way = " " or order_oper_way = v_order_oper_way)   and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_查询历史汇总订单结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_QueryHisSumOrderList;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_QueryHisSumOrderList(
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

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_交易期货_交易_订单汇总表][字段][({初始化日期} between @开始日期# and @结束日期#) and  {机构编号}=@操作员机构编号#  and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#)  and (@合约类型串#=" " or instr(@合约类型串#, concat(";",{合约类型},";"))>0) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@订单汇总状态串#=" " or instr(@订单汇总状态串#, concat(";",{订单汇总状态},";"))>0) and (@订单序号#=0 or {记录序号} = @订单序号#) and (@订单批号#=0 or {订单批号} = @订单批号#) and (@订单操作方式# = " " or {订单操作方式} = @订单操作方式#)  and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        crncy_type, exch_no, contrc_code_no, contrc_code, 
        asset_type, contrc_type, contrc_unit, external_no, 
        order_batch_no, order_date, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, order_sum_status, 
        wtdraw_qty, waste_qty, strike_qty, strike_aver_price, 
        strike_amt, trade_fee, trade_commis, other_commis, 
        strike_commis, strike_other_commis, report_fee, wtdraw_fee, 
        strike_all_fee, rece_margin, order_oper_way from db_tdfutu_his.tb_tdfutd_sumorder_his where (init_date between v_begin_date and v_end_date) and  co_no=v_opor_co_no  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_contrc_type_str=" " or instr(v_contrc_type_str, concat(";",contrc_type,";"))>0) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_sum_status_str=" " or instr(v_order_sum_status_str, concat(";",order_sum_status,";"))>0) and (v_order_id=0 or row_id = v_order_id) and (v_order_batch_no=0 or order_batch_no = v_order_batch_no) and (v_order_oper_way = " " or order_oper_way = v_order_oper_way)  and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        crncy_type, exch_no, contrc_code_no, contrc_code, 
        asset_type, contrc_type, contrc_unit, external_no, 
        order_batch_no, order_date, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, order_sum_status, 
        wtdraw_qty, waste_qty, strike_qty, strike_aver_price, 
        strike_amt, trade_fee, trade_commis, other_commis, 
        strike_commis, strike_other_commis, report_fee, wtdraw_fee, 
        strike_all_fee, rece_margin, order_oper_way from db_tdfutu_his.tb_tdfutd_sumorder_his where (init_date between v_begin_date and v_end_date) and  co_no=v_opor_co_no  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_contrc_type_str=" " or instr(v_contrc_type_str, concat(";",contrc_type,";"))>0) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_sum_status_str=" " or instr(v_order_sum_status_str, concat(";",order_sum_status,";"))>0) and (v_order_id=0 or row_id = v_order_id) and (v_order_batch_no=0 or order_batch_no = v_order_batch_no) and (v_order_oper_way = " " or order_oper_way = v_order_oper_way)  and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_成交处理汇总订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_StrikeDealSumOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_StrikeDealSumOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_contrc_code_no int,
    IN p_contrc_code varchar(6),
    IN p_asset_type int,
    IN p_order_date int,
    IN p_order_batch_no int,
    IN p_order_dir int,
    IN p_order_status varchar(2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_qty decimal(18,2),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_strike_other_commis decimal(18,4),
    IN p_strike_all_fee decimal(18,4),
    IN p_report_fee decimal(18,4),
    IN p_wtdraw_fee decimal(18,4),
    IN p_trade_fee decimal(18,4),
    IN p_strike_commis decimal(18,4),
    IN p_order_oper_way varchar(2),
    IN p_contrc_unit int,
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
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_asset_type int;
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_order_status varchar(2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_strike_commis decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_contrc_unit int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_trade_commis decimal(18,4);
    declare v_tmp_other_commis decimal(18,4);
    declare v_tmp_strike_other_commis decimal(18,4);
    declare v_tmp_strike_all_fee decimal(18,4);
    declare v_tmp_report_fee decimal(18,4);
    declare v_tmp_wtdraw_fee decimal(18,4);
    declare v_tmp_trade_fee decimal(18,4);
    declare v_tmp_strike_commis decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_crncy_type varchar(3);
    declare v_contrc_type int;
    declare v_external_no bigint;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_sum_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_waste_qty decimal(18,2);
    declare v_strike_aver_price decimal(16,9);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_code = p_contrc_code;
    SET v_asset_type = p_asset_type;
    SET v_order_date = p_order_date;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir = p_order_dir;
    SET v_order_status = p_order_status;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_qty = p_strike_qty;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_strike_other_commis = p_strike_other_commis;
    SET v_strike_all_fee = p_strike_all_fee;
    SET v_report_fee = p_report_fee;
    SET v_wtdraw_fee = p_wtdraw_fee;
    SET v_trade_fee = p_trade_fee;
    SET v_strike_commis = p_strike_commis;
    SET v_order_oper_way = p_order_oper_way;
    SET v_contrc_unit = p_contrc_unit;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_strike_amt = 0;
    SET v_tmp_strike_qty = 0;
    SET v_tmp_trade_commis = 0;
    SET v_tmp_other_commis = 0;
    SET v_tmp_strike_other_commis = 0;
    SET v_tmp_strike_all_fee = 0;
    SET v_tmp_report_fee = 0;
    SET v_tmp_wtdraw_fee = 0;
    SET v_tmp_trade_fee = 0;
    SET v_tmp_strike_commis = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_crncy_type = "CNY";
    SET v_contrc_type = 0;
    SET v_external_no = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_sum_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_waste_qty = 0;
    SET v_strike_aver_price = 0;
    SET v_rece_margin = 0;

    
    label_pro:BEGIN
    

    /* [检查正常返回][@订单批号# =0] */
    if v_order_batch_no =0 then
        leave label_pro;
    end if;


    /* set @临时_成交金额# = @成交金额#; */
    set v_tmp_strike_amt = v_strike_amt;

    /* set @临时_成交数量# = @成交数量#; */
    set v_tmp_strike_qty = v_strike_qty;

    /* set @临时_交易佣金# = @交易佣金#; */
    set v_tmp_trade_commis = v_trade_commis;

    /* set @临时_其他佣金# = @其他佣金#; */
    set v_tmp_other_commis = v_other_commis;

    /* set @临时_成交其他佣金# = @成交其他佣金#; */
    set v_tmp_strike_other_commis = v_strike_other_commis;

    /* set @临时_成交全部费用# = @成交全部费用#; */
    set v_tmp_strike_all_fee = v_strike_all_fee;

    /* set @临时_申报费用# = @申报费用#; */
    set v_tmp_report_fee = v_report_fee;

    /* set @临时_撤单费用# = @撤单费用#; */
    set v_tmp_wtdraw_fee = v_wtdraw_fee;

    /* set @临时_交易费用# = @交易费用#; */
    set v_tmp_trade_fee = v_trade_fee;

    /* set @临时_成交佣金# = @成交佣金#; */
    set v_tmp_strike_commis = v_strike_commis;

    /* [锁定获取表记录变量][交易期货_交易_订单汇总表][字段][字段变量][{订单日期}=@订单日期# and {机构编号} = @机构编号# and {订单批号}= @订单批号#][4][@订单日期#, @机构编号#, @订单批号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        crncy_type, exch_no, contrc_code_no, contrc_code, 
        asset_type, contrc_type, contrc_unit, external_no, 
        order_batch_no, order_date, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, order_sum_status, 
        wtdraw_qty, waste_qty, strike_qty, strike_aver_price, 
        strike_amt, trade_fee, trade_commis, other_commis, 
        strike_commis, strike_other_commis, report_fee, wtdraw_fee, 
        strike_all_fee, rece_margin, order_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_crncy_type, v_exch_no, v_contrc_code_no, v_contrc_code, 
        v_asset_type, v_contrc_type, v_contrc_unit, v_external_no, 
        v_order_batch_no, v_order_date, v_order_dir, v_contrc_dir, 
        v_hedge_type, v_order_price, v_order_qty, v_order_sum_status, 
        v_wtdraw_qty, v_waste_qty, v_strike_qty, v_strike_aver_price, 
        v_strike_amt, v_trade_fee, v_trade_commis, v_other_commis, 
        v_strike_commis, v_strike_other_commis, v_report_fee, v_wtdraw_fee, 
        v_strike_all_fee, v_rece_margin, v_order_oper_way from db_tdfutu.tb_tdfutd_sumorder where order_date=v_order_date and co_no = v_co_no and order_batch_no= v_order_batch_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.31.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no);
        end if;
        leave label_pro;
    end if;


    /* set @成交金额# = @成交金额# + @临时_成交金额#; */
    set v_strike_amt = v_strike_amt + v_tmp_strike_amt;

    /* set @成交数量#=@成交数量#+@临时_成交数量#; */
    set v_strike_qty=v_strike_qty+v_tmp_strike_qty;

    /* set @成交均价# = 0; */
    set v_strike_aver_price = 0;

    /* if @成交数量# > 0 then */
    if v_strike_qty > 0 then

        /* set @成交均价# = Round(@成交金额#/(@成交数量#*@合约乘数#),4); */
        set v_strike_aver_price = Round(v_strike_amt/(v_strike_qty*v_contrc_unit),4);
    end if;

    /* 调用【原子_交易期货_交易_计算订单汇总状态】*/
    call db_tdfutu.pra_tdfutd_CaclOrderSumStatus(
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
        v_waste_qty,
        v_error_code,
        v_error_info,
        v_order_sum_status);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuA.3.31.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易_计算订单汇总状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @交易佣金# = @临时_交易佣金#; */
    set v_trade_commis = v_tmp_trade_commis;

    /* set @其他佣金# = @临时_其他佣金#; */
    set v_other_commis = v_tmp_other_commis;

    /* set @成交其他佣金# = @临时_成交其他佣金#; */
    set v_strike_other_commis = v_tmp_strike_other_commis;

    /* set @成交全部费用# = @临时_成交全部费用#; */
    set v_strike_all_fee = v_tmp_strike_all_fee;

    /* set @申报费用# = @临时_申报费用#; */
    set v_report_fee = v_tmp_report_fee;

    /* set @撤单费用# = @临时_撤单费用#; */
    set v_wtdraw_fee = v_tmp_wtdraw_fee;

    /* set @交易费用# = @临时_交易费用#; */
    set v_trade_fee = v_tmp_trade_fee;

    /* set @成交佣金# = @临时_成交佣金#; */
    set v_strike_commis = v_tmp_strike_commis;

    /* [更新表记录][交易期货_交易_订单汇总表][{成交数量}=@成交数量#, {成交金额}=@成交金额#,{订单汇总状态}=@订单汇总状态#,{成交均价}=@成交均价#,{交易佣金} = {交易佣金}+@交易佣金#,{其他佣金} = {其他佣金}+@其他佣金#,{成交佣金}={成交佣金}+@成交佣金#, {成交其他佣金}={成交其他佣金}+@成交其他佣金#,{成交全部费用}={成交全部费用}+@成交全部费用#,{申报费用} = {申报费用} +@申报费用#, {撤单费用} = {撤单费用}+@撤单费用#, {交易费用} = {交易费用}+@交易费用#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfutd_sumorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_qty=v_strike_qty, strike_amt=v_strike_amt,order_sum_status=v_order_sum_status,strike_aver_price=v_strike_aver_price,trade_commis = trade_commis+v_trade_commis,other_commis = other_commis+v_other_commis,strike_commis=strike_commis+v_strike_commis, strike_other_commis=strike_other_commis+v_strike_other_commis,strike_all_fee=strike_all_fee+v_strike_all_fee,report_fee = report_fee +v_report_fee, wtdraw_fee = wtdraw_fee+v_wtdraw_fee, trade_fee = trade_fee+v_trade_fee where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.31.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_新增改单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_AddModiOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_AddModiOrder(
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
    IN p_contrc_code_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_type int,
    IN p_asset_type int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_modi_order_date int,
    IN p_modi_batch_no int,
    IN p_order_id bigint,
    IN p_comm_id bigint,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_order_dir int,
    IN p_order_date int,
    IN p_order_time int,
    IN p_price_type int,
    IN p_modi_order_status varchar(2),
    IN p_modi_order_price decimal(16,9),
    IN p_modi_order_qty decimal(18,2),
    IN p_modi_price_type int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_order_oper_way varchar(2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_modi_order_id bigint
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
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_modi_order_date int;
    declare v_modi_batch_no int;
    declare v_order_id bigint;
    declare v_comm_id bigint;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_dir int;
    declare v_order_date int;
    declare v_order_time int;
    declare v_price_type int;
    declare v_modi_order_status varchar(2);
    declare v_modi_order_price decimal(16,9);
    declare v_modi_order_qty decimal(18,2);
    declare v_modi_price_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_order_oper_way varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_modi_order_id bigint;
    declare v_modi_order_time int;
    declare v_oper_func_code varchar(16);
    declare v_new_order_id bigint;
    declare v_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_no = p_exch_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_type = p_contrc_type;
    SET v_asset_type = p_asset_type;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_modi_order_date = p_modi_order_date;
    SET v_modi_batch_no = p_modi_batch_no;
    SET v_order_id = p_order_id;
    SET v_comm_id = p_comm_id;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_order_dir = p_order_dir;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_price_type = p_price_type;
    SET v_modi_order_status = p_modi_order_status;
    SET v_modi_order_price = p_modi_order_price;
    SET v_modi_order_qty = p_modi_order_qty;
    SET v_modi_price_type = p_modi_price_type;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_order_oper_way = p_order_oper_way;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_modi_order_id = 0;
    SET v_modi_order_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_new_order_id = 0;
    SET v_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取机器时间][@改单时间#] */
    select date_format(curtime(),'%H%i%s') into v_modi_order_time;


    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @新订单序号# = 0; */
    set v_new_order_id = 0;

    /* set @备注信息# = "新增改单！"; */
    set v_remark_info = "新增改单！";

    /* [插入表记录][交易期货_交易_改单表][字段][字段变量][1]["新增证券改单记录失败"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdfutu.tb_tdfutd_modifyorder(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, co_no, pd_no, 
        exch_group_no, asset_acco_no, pass_no, exch_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        modi_order_date, modi_order_time, modi_batch_no, order_id, 
        comm_id, order_price, order_qty, order_dir, 
        contrc_dir, hedge_type, order_date, order_time, 
        price_type, modi_order_price, modi_order_qty, modi_order_status, 
        modi_price_type, crncy_type, exch_crncy_type, new_order_id, 
        remark_info, order_oper_way) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_pass_no, v_exch_no, 
        v_contrc_code_no, v_contrc_code, v_contrc_type, v_asset_type, 
        v_modi_order_date, v_modi_order_time, v_modi_batch_no, v_order_id, 
        v_comm_id, v_order_price, v_order_qty, v_order_dir, 
        v_contrc_dir, v_hedge_type, v_order_date, v_order_time, 
        v_price_type, v_modi_order_price, v_modi_order_qty, v_modi_order_status, 
        v_modi_price_type, v_crncy_type, v_exch_crncy_type, v_new_order_id, 
        v_remark_info, v_order_oper_way);
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.32.1";
        SET v_error_info =  CONCAT("新增证券改单记录失败","#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@改单序号#] */
    select LAST_INSERT_ID() into v_modi_order_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_modi_order_id = v_modi_order_id;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_检查重复改单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_CheckDupliModiOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_CheckDupliModiOrder(
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_modi_order_date int;

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
    SET v_record_count = 0;
    SET v_modi_order_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [记录已存在][交易期货_交易_改单表][@记录个数#][{改单日期} = @改单日期# and {订单序号} = @订单序号# and {改单状态} =《改单状态-新建》][723][@改单日期#,@订单序号#] */
    select count(1) into v_record_count from db_tdfutu.tb_tdfutd_modifyorder where modi_order_date = v_modi_order_date and order_id = v_order_id and modi_order_status ="1" limit 1;
    if v_record_count > 0 then
                
        SET v_error_code = "tdfutuA.3.33.723";
        SET v_error_info = concat("改单日期=",v_modi_order_date,",","订单序号=",v_order_id);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_更新获取改单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_UpdateGetModiOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_UpdateGetModiOrder(
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
    OUT p_init_date int,
    OUT p_modi_order_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_code varchar(6),
    OUT p_asset_type int,
    OUT p_modi_order_date int,
    OUT p_modi_order_time int,
    OUT p_modi_batch_no int,
    OUT p_modi_order_price decimal(16,9),
    OUT p_modi_order_qty decimal(18,2),
    OUT p_modi_price_type int,
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
    declare v_init_date int;
    declare v_modi_order_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_asset_type int;
    declare v_modi_order_date int;
    declare v_modi_order_time int;
    declare v_modi_batch_no int;
    declare v_modi_order_price decimal(16,9);
    declare v_modi_order_qty decimal(18,2);
    declare v_modi_price_type int;
    declare v_order_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_record_count int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_pass_no int;
    declare v_contrc_type int;
    declare v_comm_id bigint;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_order_time int;
    declare v_price_type int;
    declare v_modi_order_status varchar(2);
    declare v_new_order_id bigint;
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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_modi_order_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_code = " ";
    SET v_asset_type = 0;
    SET v_modi_order_date = date_format(curdate(),'%Y%m%d');
    SET v_modi_order_time = date_format(curtime(),'%H%i%s');
    SET v_modi_batch_no = 0;
    SET v_modi_order_price = 0;
    SET v_modi_order_qty = 0;
    SET v_modi_price_type = 0;
    SET v_order_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_pass_no = 0;
    SET v_contrc_type = 0;
    SET v_comm_id = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_order_dir = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_price_type = 0;
    SET v_modi_order_status = " ";
    SET v_new_order_id = 0;
    SET v_remark_info = " ";

    
    label_pro:BEGIN
    

    /* set @改单日期# = @订单日期#; */
    set v_modi_order_date = v_order_date;

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* set @改单序号# = 0; */
    set v_modi_order_id = 0;

    /* [获取表记录数量][交易期货_交易_改单表][@记录个数#][{改单日期} = @改单日期# and {订单序号} = @订单序号# and {改单状态} =《改单状态-新建》] */
    select count(1) into v_record_count from db_tdfutu.tb_tdfutd_modifyorder where modi_order_date = v_modi_order_date and order_id = v_order_id and modi_order_status ="1";


    /* [检查正常返回][@记录个数# = 0]; */
    if v_record_count = 0 then
        leave label_pro;
    end if;

    #不获取正报的，正报是中间状态，用于防止并发问题

    /* [锁定获取表记录变量][交易期货_交易_改单表][字段][字段变量][{改单日期} = @改单日期# and {订单序号} = @订单序号# and {改单状态} =《改单状态-新建》 order by {记录序号} desc][4][@改单日期#,@订单序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_no, contrc_code_no, contrc_code, contrc_type, 
        asset_type, modi_order_date, modi_order_time, modi_batch_no, 
        order_id, comm_id, order_price, order_qty, 
        order_dir, contrc_dir, hedge_type, order_date, 
        order_time, price_type, modi_order_price, modi_order_qty, 
        modi_order_status, modi_price_type, crncy_type, exch_crncy_type, 
        new_order_id, remark_info, order_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_exch_no, v_contrc_code_no, v_contrc_code, v_contrc_type, 
        v_asset_type, v_modi_order_date, v_modi_order_time, v_modi_batch_no, 
        v_order_id, v_comm_id, v_order_price, v_order_qty, 
        v_order_dir, v_contrc_dir, v_hedge_type, v_order_date, 
        v_order_time, v_price_type, v_modi_order_price, v_modi_order_qty, 
        v_modi_order_status, v_modi_price_type, v_crncy_type, v_exch_crncy_type, 
        v_new_order_id, v_remark_info, v_order_oper_way from db_tdfutu.tb_tdfutd_modifyorder where modi_order_date = v_modi_order_date and order_id = v_order_id and modi_order_status ="1" order by row_id desc limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.34.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("改单日期=",v_modi_order_date,",","订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("改单日期=",v_modi_order_date,",","订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @改单序号# = @记录序号#; */
    set v_modi_order_id = v_row_id;

    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    #防止并发问题，先更新状态，避免被重复获取

    /* [更新表记录][交易期货_交易_改单表][{改单状态}=《改单状态-正改》][{记录序号}=@记录序号#][4][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfutd_modifyorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, modi_order_status="2" where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.34.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_modi_order_id = v_modi_order_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_code = v_contrc_code;
    SET p_asset_type = v_asset_type;
    SET p_modi_order_date = v_modi_order_date;
    SET p_modi_order_time = v_modi_order_time;
    SET p_modi_batch_no = v_modi_batch_no;
    SET p_modi_order_price = v_modi_order_price;
    SET p_modi_order_qty = v_modi_order_qty;
    SET p_modi_price_type = v_modi_price_type;
    SET p_order_oper_way = v_order_oper_way;
    SET p_busi_opor_no = v_busi_opor_no;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_更新改单状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_UpdateModiOrderStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_UpdateModiOrderStatus(
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
    SET v_modi_order_date = p_modi_order_date;
    SET v_modi_order_id = p_modi_order_id;
    SET v_modi_order_status = p_modi_order_status;
    SET v_remark_info = p_remark_info;
    SET v_new_order_id = p_new_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易期货_交易_改单表][{改单状态} = @改单状态#, {备注信息} = @备注信息#, {新订单序号} =@新订单序号#][{记录序号} = @改单序号#][2][@改单序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfutd_modifyorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, modi_order_status = v_modi_order_status, remark_info = v_remark_info, new_order_id =v_new_order_id where row_id = v_modi_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.3.35.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("改单序号=",v_modi_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("改单序号=",v_modi_order_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_获取多空类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfuap_GetLngshtType;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfuap_GetLngshtType(
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
    
    #根据订单方向和开平方向确定多空类型

    /* if @开平方向# = 《开平方向-开仓》 then */
    if v_contrc_dir = 1 then

      /* set @多空类型# = @订单方向#; */
      set v_lngsht_type = v_order_dir;
    else
      #订单方向为1，多空为2；订单方向为2，多空为1

      /* set @多空类型# = 2/@订单方向#; */
      set v_lngsht_type = 2/v_order_dir;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_lngsht_type = v_lngsht_type;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易_获取订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfutd_GetOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfutd_GetOrder(
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
    OUT p_all_fee decimal(18,4),
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
    declare v_all_fee decimal(18,4);
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_crncy_type varchar(3);
    declare v_comm_opor int;
    declare v_order_date int;
    declare v_trade_fee decimal(18,4);
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_sett_flag int;

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
    SET v_all_fee = 0;
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_crncy_type = "CNY";
    SET v_comm_opor = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_trade_fee = 0;
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_strike_all_fee = 0;
    SET v_trade_occur_amt = 0;
    SET v_sett_flag = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易期货_交易_订单表][字段][字段变量][{记录序号}=@订单序号#][4][@订单序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, asset_type, 
        contrc_type, contrc_unit, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_batch_no, order_date, order_time, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_qty, 
        strike_price, strike_amt, trade_fee, trade_commis, 
        other_commis, strike_commis, strike_other_commis, report_fee, 
        wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
        comb_code, margin_ratio, rsp_info, compli_trig_id, 
        sett_flag, order_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_no, v_futu_acco_no, 
        v_futu_acco, v_contrc_code_no, v_contrc_code, v_asset_type, 
        v_contrc_type, v_contrc_unit, v_external_no, v_comm_id, 
        v_comm_batch_no, v_comm_opor, v_report_date, v_report_time, 
        v_report_no, v_order_batch_no, v_order_date, v_order_time, 
        v_order_dir, v_contrc_dir, v_hedge_type, v_order_price, 
        v_order_qty, v_order_status, v_wtdraw_qty, v_strike_qty, 
        v_strike_price, v_strike_amt, v_trade_fee, v_trade_commis, 
        v_other_commis, v_strike_commis, v_strike_other_commis, v_report_fee, 
        v_wtdraw_fee, v_strike_all_fee, v_rece_margin, v_trade_occur_amt, 
        v_comb_code, v_margin_ratio, v_rsp_info, v_compli_trig_id, 
        v_sett_flag, v_order_oper_way from db_tdfutu.tb_tdfutd_order where row_id=v_order_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.3.37.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;

    #根据订单方向和开平方向确定多空类型

    /* if @开平方向# = 《开平方向-开仓》 then */
    if v_contrc_dir = 1 then

         /* set @多空类型# = @订单方向#; */
         set v_lngsht_type = v_order_dir;
     else

         /* if @订单方向# = 《订单方向-买入》 then */
         if v_order_dir = 1 then

           /* set @多空类型# = 《多空类型-空头》; */
           set v_lngsht_type = 2;
         else

           /* set @多空类型# = 《多空类型-多头》; */
           set v_lngsht_type = 1;
         end if;
    end if;

    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
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
    SET p_all_fee = v_all_fee;
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


